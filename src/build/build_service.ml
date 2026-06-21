// Copyright 2026 Nils Kopal
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

package build.build_service

// Compiler adapter for MiniIDE.

import std.fs as fs
import std.string as s

// Bind the native CreateDirectoryW API used by MiniIDE.
extern function CreateDirectoryW(path as wstr, securityAttributes as ptr) from "kernel32.dll" symbol "CreateDirectoryW" returns bool
// Bind the native CreateFileW API used by MiniIDE.
extern function CreateFileWInherit(path as wstr, access as int, share as int, security as bytes, creation as int, flags as int, template as ptr) from "kernel32.dll" symbol "CreateFileW" returns ptr
// Bind the native CreateProcessW API used by MiniIDE.
extern function CreateProcessW(applicationName as ptr, commandLine as wstr, processAttributes as ptr, threadAttributes as ptr, inheritHandles as bool, creationFlags as u32, environment as ptr, currentDirectory as wstr, startupInfo as bytes, processInformation as bytes) from "kernel32.dll" symbol "CreateProcessW" returns bool
// Bind the native GetFileAttributesExW API used by MiniIDE.
extern function GetFileAttributesExW(path as wstr, infoLevelId as int, data as bytes) from "kernel32.dll" symbol "GetFileAttributesExW" returns bool
// Bind the native GetExitCodeProcess API used by MiniIDE.
extern function GetExitCodeProcess(process as ptr, exitCode as bytes) from "kernel32.dll" symbol "GetExitCodeProcess" returns bool
// Bind the native TerminateProcess API used by MiniIDE.
extern function TerminateProcess(process as ptr, exitCode as u32) from "kernel32.dll" symbol "TerminateProcess" returns bool
// Bind the native CloseHandle API used by MiniIDE.
extern function CloseHandle(handle as ptr) from "kernel32.dll" symbol "CloseHandle" returns bool
// Bind the native Sleep API used by MiniIDE.
extern function Sleep(ms as int) from "kernel32.dll" symbol "Sleep" returns void

const INVALID_HANDLE_VALUE = -1
const GENERIC_WRITE = 0x40000000
const FILE_SHARE_READ = 0x00000001
const FILE_SHARE_WRITE = 0x00000002
const CREATE_ALWAYS = 2
const FILE_ATTRIBUTE_NORMAL = 0x00000080
const CREATE_NO_WINDOW = 0x08000000
const STARTF_USESHOWWINDOW = 0x00000001
const STARTF_USESTDHANDLES = 0x00000100
const SW_HIDE = 0
const STILL_ACTIVE = 259

struct BuildDiagnostic
  kind,
  message,
  file,
  line,
  col,
end struct

struct BuildResult
  exit_code,
  log_path,
  log_text,
  diagnostics,
end struct

struct BuildJob
  process,
  thread,
  exit_code,
  log_path,
  log_text,
  command_line,
  compiler,
  started,
end struct

// Write an unsigned 16-bit value into a byte buffer at an offset.
function _write_u16(buf, off, value)
  v = value & 0xFFFF
  buf[off] = v & 255
  buf[off + 1] = (v >> 8) & 255
end function

// Write an unsigned 32-bit value into a byte buffer at an offset.
function _write_u32(buf, off, value)
  v = value & 0xFFFFFFFF
  buf[off] = v & 255
  buf[off + 1] = (v >> 8) & 255
  buf[off + 2] = (v >> 16) & 255
  buf[off + 3] = (v >> 24) & 255
end function

// Write a pointer-sized value into a byte buffer at an offset.
function _write_ptr(buf, off, value)
  low = value & 0xFFFFFFFF
  high = 0
  if value < 0 then
    high = 0xFFFFFFFF
  else
    high = (value >> 32) & 0xFFFFFFFF
  end if
  _write_u32(buf, off, low)
  _write_u32(buf, off + 4, high)
end function

// Read an unsigned 32-bit value from a byte buffer at an offset.
function _read_u32(buf, off)
  return buf[off] | (buf[off + 1] << 8) | (buf[off + 2] << 16) | (buf[off + 3] << 24)
end function

// Read a pointer-sized value from a byte buffer at an offset.
function _read_ptr(buf, off)
  low = _read_u32(buf, off)
  high = _read_u32(buf, off + 4)
  return low + high * 4294967296
end function

// Return a value clamped to the unsigned 32-bit range.
function _u32_value(value)
  if value < 0 then return value + 4294967296 end if
  return value
end function

// Return the last write timestamp stored in Win32 file attributes.
function _file_write_time(path)
  if typeof(path) != "string" or path == "" then return -1 end if
  if fs.exists(path) == false then return -1 end if
  data = bytes(40, 0)
  ok = GetFileAttributesExW(path, 0, data)
  if ok == false then return -1 end if
  low = _u32_value(_read_u32(data, 20))
  high = _u32_value(_read_u32(data, 24))
  return low + high * 4294967296
end function

// Return true when a path points at a MiniLang source file.
function _is_source_file(path)
  if typeof(path) != "string" then return false end if
  lower = s.toLowerAscii(path)
  if s.endsWith(lower, ".ml") then return true end if
  if s.endsWith(lower, ".mlproj") then return true end if
  return false
end function

// Quote a command-line argument for CreateProcess.
function _q(x)
  if typeof(x) != "string" then return "\"\"" end if
  return "\"" + x + "\""
end function

// Join two path fragments using the project path separator.
function _path_join(a, b)
  if typeof(a) != "string" or a == "" then return b end if
  if typeof(b) != "string" or b == "" then return a end if
  last = a[len(a) - 1]
  if last == "\\" or last == "/" then return a + b end if
  return a + "\\" + b
end function

// Return the directory portion of a path.
function _dirname(path)
  if typeof(path) != "string" then return "." end if
  i = len(path) - 1
  while i >= 0
    ch = path[i]
    if ch == "\\" or ch == "/" then
      if i <= 0 then return "." end if
      return s.substr(path, 0, i)
    end if
    i = i - 1
  end while
  return "."
end function

// Return true when a path is already absolute.
function _is_abs(path)
  if typeof(path) != "string" then return false end if
  if len(path) > 2 and path[1] == ":" then return true end if
  if s.startsWith(path, "\\") or s.startsWith(path, "/") then return true end if
  return false
end function

// Resolve a possibly relative path against the project root.
function _resolve(root, path)
  if _is_abs(path) then return path end if
  return _path_join(root, path)
end function

// Ensure directory.
function _ensure_dir(path)
  if typeof(path) != "string" or path == "" or path == "." then return true end if
  if fs.exists(path) then return true end if
  CreateDirectoryW(path, void)
  return fs.exists(path)
end function

// Read a build log file, returning an empty string on failure.
function _read_log(log_path)
  text = try(fs.readAllText(log_path))
  if typeof(text) == "string" then return text end if
  return ""
end function

// Return the last index of a character in a string.
function _last_index_of(text, ch, before)
  if typeof(text) != "string" then return -1 end if
  i = before
  if i >= len(text) then i = len(text) - 1 end if
  while i >= 0
    if text[i] == ch then return i end if
    i = i - 1
  end while
  return -1
end function

// Return true when digit char.
function _is_digit_char(ch)
  if typeof(ch) != "string" or ch == "" then return false end if
  b = bytes(ch)
  if len(b) <= 0 then return false end if
  c = b[0]
  return c >= 48 and c <= 57
end function

// Parse an integer prefix from a string.
function _leading_int(text)
  if typeof(text) != "string" then return -1 end if
  digits = ""
  i = 0
  while i < len(text) and _is_digit_char(text[i])
    digits = digits + text[i]
    i = i + 1
  end while
  if digits == "" then return -1 end if
  n = toNumber(digits)
  if typeof(n) != "int" then return -1 end if
  return n
end function

// Convert a character position into one-based line and column numbers.
function _line_col_from_pos(file, pos)
  if typeof(pos) != "int" or pos < 0 then return [1, 1] end if
  text = try(fs.readAllText(file))
  if typeof(text) != "string" then return [1, 1] end if
  line_no = 1
  col_no = 1
  i = 0
  while i < len(text) and i < pos
    ch = text[i]
    if ch == "\n" then
      line_no = line_no + 1
      col_no = 1
    else if ch != "\r" then
      col_no = col_no + 1
    end if
    i = i + 1
  end while
  return [line_no, col_no]
end function

// Classify a compiler output line as an error, warning, or note.
function _diag_kind(prev)
  kind = "CompileError"
  if typeof(prev) != "string" then return kind end if
  sep = s.indexOf(prev, ":", 0)
  if sep >= 0 then kind = s.substr(prev, 0, sep) end if
  return kind
end function

// Extract the human-readable diagnostic message from compiler output.
function _diag_message(prev)
  if typeof(prev) != "string" then return "" end if
  msg = prev
  sep = s.indexOf(prev, ":", 0)
  if sep >= 0 then msg = s.trim(s.substr(prev, sep + 1, len(prev) - sep - 1)) end if
  at_pos = s.indexOf(msg, " at ", 0)
  if at_pos >= 0 then msg = s.trim(s.substr(msg, 0, at_pos)) end if
  return msg
end function

// Parse a source location prefix from a compiler diagnostic line.
function _parse_diag_loc(prev, loc)
  loc = s.trim(loc)
  if loc == "" then return end if
  pos_idx = s.indexOf(loc, " pos=", 0)
  if pos_idx >= 0 then
    file = s.trim(s.substr(loc, 0, pos_idx))
    pos_s = s.trim(s.substr(loc, pos_idx + 5, len(loc) - pos_idx - 5))
    pos = _leading_int(pos_s)
    lc = _line_col_from_pos(file, pos)
    return BuildDiagnostic(_diag_kind(prev), _diag_message(prev), file, lc[0], lc[1])
  end if
  c2 = _last_index_of(loc, ":", len(loc) - 1)
  if c2 < 0 then return end if
  c1 = _last_index_of(loc, ":", c2 - 1)
  if c1 < 0 then return end if
  file = s.substr(loc, 0, c1)
  line_s = s.substr(loc, c1 + 1, c2 - c1 - 1)
  col_s = s.substr(loc, c2 + 1, len(loc) - c2 - 1)
  line_no = toNumber(line_s)
  col_no = toNumber(col_s)
  if typeof(line_no) != "int" then line_no = 0 end if
  if typeof(col_no) != "int" then col_no = 0 end if
  return BuildDiagnostic(_diag_kind(prev), _diag_message(prev), file, line_no, col_no)
end function

// Parse one compiler diagnostic at a specific output line.
function _parse_diag_at(prev, at_line)
  p = s.indexOf(at_line, " at ", 0)
  offset = 4
  if p < 0 then
    p = s.indexOf(at_line, "at ", 0)
    offset = 3
  end if
  if p < 0 then return end if
  loc = s.trim(s.substr(at_line, p + offset, len(at_line) - p - offset))
  return _parse_diag_loc(prev, loc)
end function

// Parse compiler output into structured diagnostics.
function parse_diagnostics(log_text)
  // Walk collections defensively because project data can be partially populated.
  items = []
  if typeof(log_text) != "string" then return items end if
  lines = s.split(s.replaceAll(log_text, "\r\n", "\n"), "\n")
  if typeof(lines) != "array" or len(lines) <= 0 then return items end if
  prev = ""
  for i = 0 to len(lines) - 1
    trimmed = s.trim(lines[i])
    if s.startsWith(trimmed, "CompileError:") or s.startsWith(trimmed, "ParseError:") then
      prev = trimmed
      d_inline = _parse_diag_at(trimmed, trimmed)
      if typeof(d_inline) == "struct" then
        items = items + [d_inline]
        prev = ""
      end if
    else if s.startsWith(trimmed, "at ") then
      d = _parse_diag_at(prev, trimmed)
      if typeof(d) == "struct" then items = items + [d] end if
    end if
  end for
  return items
end function

// Return the default self-hosted compiler path for a project.
function default_compiler(project)
  root = "."
  if typeof(project) == "struct" then root = project.root end if
  rel = "MiniLangCompilerML\\build\\mlc_win64.exe"
  direct = _resolve(root, rel)
  if fs.exists(direct) then return direct end if
  parent = _resolve(root, "..\\" + rel)
  if fs.exists(parent) then return parent end if
  grandparent = _resolve(root, "..\\..\\" + rel)
  if fs.exists(grandparent) then return grandparent end if
  return direct
end function

// Read a boolean option with a default fallback.
function _bool_value(value, default_value)
  if typeof(value) == "bool" then return value end if
  return default_value
end function

// Read an integer option with a default fallback.
function _int_value(value, default_value)
  if typeof(value) == "int" then return value end if
  return default_value
end function

// Read a string option with a default fallback.
function _string_value(value, default_value)
  if typeof(value) == "string" and value != "" then return value end if
  return default_value
end function

// Build the compiler input, output, and log paths for a project.
function _compile_paths(project, compiler_override, keep_going, max_errors, subsystem, extra_args)
  // Walk collections defensively because project data can be partially populated.
  root = "."
  entry = "src\\main.ml"
  output = "build\\MiniIDE.exe"
  imports = ["src", "MiniLangCompilerML"]
  if typeof(project) == "struct" then
    root = project.root
    entry = project.entry
    output = project.output
    if typeof(project.import_paths) == "array" then imports = project.import_paths end if
  end if

  input_path = _resolve(root, entry)
  output_path = _resolve(root, output)
  out_dir = _dirname(output_path)
  _ensure_dir(out_dir)

  log_path = _path_join(out_dir, "last_build.log")
  compiler = default_compiler(project)
  if typeof(compiler_override) == "string" and compiler_override != "" then
    compiler = _resolve(root, compiler_override)
  end if
  keep_going = _bool_value(keep_going, true)
  max_errors = _int_value(max_errors, 20)
  if max_errors < 1 then max_errors = 1 end if
  subsystem = _string_value(subsystem, "windows")
  extra_args = _string_value(extra_args, "")

  cmd = _q(compiler) + " " + _q(input_path) + " " + _q(output_path)
  if keep_going then
    cmd = cmd + " --keep-going --max-errors " + max_errors
  end if
  cmd = cmd + " --subsystem " + subsystem
  if len(imports) > 0 then
    for i = 0 to len(imports) - 1
      inc = imports[i]
      inc_path = _resolve(root, inc)
      cmd = cmd + " -I " + _q(inc_path)
    end for
  end if
  if extra_args != "" then cmd = cmd + " " + extra_args end if
  return [root, compiler, input_path, output_path, log_path, cmd]
end function

// Create a completed build result for a job that could not be started.
function _failed_job(log_path, command_line, compiler, message)
  log_text = message
  fs.writeAllText(log_path, log_text)
  return BuildJob(void, void, -1, log_path, log_text, command_line, compiler, false)
end function

// Start compile with options.
function start_compile_with_options(project, compiler_override, keep_going, max_errors, subsystem, extra_args)
  // Keep process setup and state capture together for reliable polling.
  parts = _compile_paths(project, compiler_override, keep_going, max_errors, subsystem, extra_args)
  root = parts[0]
  compiler = parts[1]
  log_path = parts[4]
  cmd = parts[5]

  wr = fs.writeAllText(log_path, "")
  if typeof(wr) == "error" then
    return _failed_job(log_path, cmd, compiler, "Build start failed: cannot write log file " + log_path)
  end if

  sa = bytes(24, 0)
  _write_u32(sa, 0, 24)
  _write_ptr(sa, 8, 0)
  _write_u32(sa, 16, 1)

  log_handle = CreateFileWInherit(log_path, GENERIC_WRITE, FILE_SHARE_READ | FILE_SHARE_WRITE, sa, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, void)
  if log_handle == INVALID_HANDLE_VALUE then
    return _failed_job(log_path, cmd, compiler, "Build start failed: cannot open log file " + log_path)
  end if

  si = bytes(104, 0)
  _write_u32(si, 0, 104)
  _write_u32(si, 60, STARTF_USESHOWWINDOW | STARTF_USESTDHANDLES)
  _write_u16(si, 64, SW_HIDE)
  _write_ptr(si, 88, log_handle)
  _write_ptr(si, 96, log_handle)

  pi = bytes(24, 0)
  ok = CreateProcessW(void, cmd, void, void, true, CREATE_NO_WINDOW, void, root, si, pi)
  CloseHandle(log_handle)
  if ok == false then
    return _failed_job(log_path, cmd, compiler, "Build start failed: CreateProcessW failed.\r\nCommand: " + cmd)
  end if

  process = _read_ptr(pi, 0)
  thread = _read_ptr(pi, 8)
  return BuildJob(process, thread, STILL_ACTIVE, log_path, "", cmd, compiler, true)
end function

// Start a compile job using an explicit compiler path.
function start_compile_with_compiler(project, compiler_override)
  return start_compile_with_options(project, compiler_override, true, 20, "windows", "")
end function

// Start an arbitrary hidden process with stdout/stderr redirected to a log file.
function start_hidden_command(root, command_line, log_path, label)
  if typeof(root) != "string" or root == "" then root = "." end if
  if typeof(command_line) != "string" or command_line == "" then
    return _failed_job(log_path, "", label, "Process start failed: command line is empty.")
  end if
  if typeof(log_path) != "string" or log_path == "" then log_path = _path_join(root, "build\\last_process.log") end if
  if typeof(label) != "string" then label = "" end if
  out_dir = _dirname(log_path)
  _ensure_dir(out_dir)

  wr = fs.writeAllText(log_path, "")
  if typeof(wr) == "error" then
    return _failed_job(log_path, command_line, label, "Process start failed: cannot write log file " + log_path)
  end if

  sa = bytes(24, 0)
  _write_u32(sa, 0, 24)
  _write_ptr(sa, 8, 0)
  _write_u32(sa, 16, 1)

  log_handle = CreateFileWInherit(log_path, GENERIC_WRITE, FILE_SHARE_READ | FILE_SHARE_WRITE, sa, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, void)
  if log_handle == INVALID_HANDLE_VALUE then
    return _failed_job(log_path, command_line, label, "Process start failed: cannot open log file " + log_path)
  end if

  si = bytes(104, 0)
  _write_u32(si, 0, 104)
  _write_u32(si, 60, STARTF_USESHOWWINDOW | STARTF_USESTDHANDLES)
  _write_u16(si, 64, SW_HIDE)
  _write_ptr(si, 88, log_handle)
  _write_ptr(si, 96, log_handle)

  pi = bytes(24, 0)
  ok = CreateProcessW(void, command_line, void, void, true, CREATE_NO_WINDOW, void, root, si, pi)
  CloseHandle(log_handle)
  if ok == false then
    return _failed_job(log_path, command_line, label, "Process start failed: CreateProcessW failed.\r\nCommand: " + command_line)
  end if

  process = _read_ptr(pi, 0)
  thread = _read_ptr(pi, 8)
  return BuildJob(process, thread, STILL_ACTIVE, log_path, "", command_line, label, true)
end function

// Build the executable and log paths used by a run job.
function _run_paths(project)
  root = "."
  output = "build\\MiniIDE.exe"
  run_args = ""
  working_dir = "."
  if typeof(project) == "struct" then
    root = project.root
    output = project.output
    run_args = project.run_args
    working_dir = project.working_dir
  end if
  output_path = _resolve(root, output)
  out_dir = _dirname(output_path)
  _ensure_dir(out_dir)
  log_path = _path_join(out_dir, "last_run.log")
  cmd = _q(output_path)
  if typeof(run_args) == "string" and run_args != "" then cmd = cmd + " " + run_args end if
  cwd = _resolve(root, working_dir)
  if fs.exists(cwd) == false then cwd = root end if
  return [cwd, output_path, log_path, cmd]
end function

// Return the test output path.
function _test_output_path(root, name)
  safe = name
  if typeof(safe) != "string" or safe == "" then safe = "tests" end if
  safe = s.replaceAll(safe, " ", "_")
  return _path_join(root, "build\\" + safe + "_tests.exe")
end function

// Build the input, output, and log paths for compiling tests.
function _test_compile_paths_for_entry(project, test_entry_override, compiler_override, keep_going, max_errors, subsystem, extra_args)
  // Walk collections defensively because project data can be partially populated.
  root = "."
  name = "MiniIDE"
  test_entry = "tests\\main_test.ml"
  imports = ["src", "MiniLangCompilerML"]
  if typeof(project) == "struct" then
    root = project.root
    name = project.name
    test_entry = project.test_entry
    if typeof(project.import_paths) == "array" then imports = project.import_paths end if
  end if
  if typeof(test_entry_override) == "string" and test_entry_override != "" then test_entry = test_entry_override end if

  input_path = _resolve(root, test_entry)
  output_path = _test_output_path(root, name)
  out_dir = _dirname(output_path)
  _ensure_dir(out_dir)

  log_path = _path_join(out_dir, "last_test_build.log")
  compiler = default_compiler(project)
  if typeof(compiler_override) == "string" and compiler_override != "" then
    compiler = _resolve(root, compiler_override)
  end if
  keep_going = _bool_value(keep_going, true)
  max_errors = _int_value(max_errors, 20)
  if max_errors < 1 then max_errors = 1 end if
  subsystem = _string_value(subsystem, "console")
  extra_args = _string_value(extra_args, "")

  cmd = _q(compiler) + " " + _q(input_path) + " " + _q(output_path)
  if keep_going then
    cmd = cmd + " --keep-going --max-errors " + max_errors
  end if
  cmd = cmd + " --subsystem " + subsystem
  if len(imports) > 0 then
    for i = 0 to len(imports) - 1
      inc = imports[i]
      inc_path = _resolve(root, inc)
      cmd = cmd + " -I " + _q(inc_path)
    end for
  end if
  if extra_args != "" then cmd = cmd + " " + extra_args end if
  return [root, compiler, input_path, output_path, log_path, cmd]
end function

// Build the input, output, and log paths for compiling the configured tests.
function _test_compile_paths(project, compiler_override, keep_going, max_errors, subsystem, extra_args)
  return _test_compile_paths_for_entry(project, "", compiler_override, keep_going, max_errors, subsystem, extra_args)
end function

// Clean file.
function _clean_file(path)
  if typeof(path) != "string" or path == "" then return [0, ""] end if
  if fs.exists(path) == false then return [0, ""] end if
  if fs.delete(path) then return [1, ""] end if
  return [0, "Could not delete: " + path + "\r\n"]
end function

// Clean project.
function clean_project(project)
  // Walk collections defensively because project data can be partially populated.
  root = "."
  name = "MiniIDE"
  output = "build\\MiniIDE.exe"
  if typeof(project) == "struct" then
    root = project.root
    name = project.name
    output = project.output
  end if

  output_path = _resolve(root, output)
  output_dir = _dirname(output_path)
  test_output = _test_output_path(root, name)
  test_dir = _dirname(test_output)
  targets = [
    output_path,
    _path_join(output_dir, "last_build.log"),
    _path_join(output_dir, "last_run.log"),
    test_output,
    _path_join(test_dir, "last_test_build.log"),
    _path_join(test_dir, "last_test_run.log")
  ]

  deleted = 0
  errors = ""
  for i = 0 to len(targets) - 1
    result = _clean_file(targets[i])
    deleted = deleted + result[0]
    errors = errors + result[1]
  end for

  text = "Clean: removed " + deleted + " file(s)."
  if errors != "" then text = text + "\r\n" + errors end if
  return text
end function

// Start test compile with options.
function start_test_compile_with_options(project, compiler_override, keep_going, max_errors, subsystem, extra_args)
  // Keep process setup and state capture together for reliable polling.
  parts = _test_compile_paths(project, compiler_override, keep_going, max_errors, subsystem, extra_args)
  root = parts[0]
  compiler = parts[1]
  input_path = parts[2]
  log_path = parts[4]
  cmd = parts[5]

  if fs.exists(input_path) == false then
    return _failed_job(log_path, cmd, compiler, "Test build start failed: test entry not found.\r\nExpected: " + input_path)
  end if

  wr = fs.writeAllText(log_path, "")
  if typeof(wr) == "error" then
    return _failed_job(log_path, cmd, compiler, "Test build start failed: cannot write log file " + log_path)
  end if

  sa = bytes(24, 0)
  _write_u32(sa, 0, 24)
  _write_ptr(sa, 8, 0)
  _write_u32(sa, 16, 1)

  log_handle = CreateFileWInherit(log_path, GENERIC_WRITE, FILE_SHARE_READ | FILE_SHARE_WRITE, sa, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, void)
  if log_handle == INVALID_HANDLE_VALUE then
    return _failed_job(log_path, cmd, compiler, "Test build start failed: cannot open log file " + log_path)
  end if

  si = bytes(104, 0)
  _write_u32(si, 0, 104)
  _write_u32(si, 60, STARTF_USESHOWWINDOW | STARTF_USESTDHANDLES)
  _write_u16(si, 64, SW_HIDE)
  _write_ptr(si, 88, log_handle)
  _write_ptr(si, 96, log_handle)

  pi = bytes(24, 0)
  ok = CreateProcessW(void, cmd, void, void, true, CREATE_NO_WINDOW, void, root, si, pi)
  CloseHandle(log_handle)
  if ok == false then
    return _failed_job(log_path, cmd, compiler, "Test build start failed: CreateProcessW failed.\r\nCommand: " + cmd)
  end if

  process = _read_ptr(pi, 0)
  thread = _read_ptr(pi, 8)
  return BuildJob(process, thread, STILL_ACTIVE, log_path, "", cmd, compiler, true)
end function

// Start compiling a specific test file as the test entry.
function start_test_file_compile_with_options(project, test_file, compiler_override, keep_going, max_errors, subsystem, extra_args)
  // Keep process setup and state capture together for reliable polling.
  parts = _test_compile_paths_for_entry(project, test_file, compiler_override, keep_going, max_errors, subsystem, extra_args)
  root = parts[0]
  compiler = parts[1]
  input_path = parts[2]
  log_path = parts[4]
  cmd = parts[5]

  if fs.exists(input_path) == false then
    return _failed_job(log_path, cmd, compiler, "Test build start failed: test file not found.\r\nExpected: " + input_path)
  end if

  wr = fs.writeAllText(log_path, "")
  if typeof(wr) == "error" then
    return _failed_job(log_path, cmd, compiler, "Test build start failed: cannot write log file " + log_path)
  end if

  sa = bytes(24, 0)
  _write_u32(sa, 0, 24)
  _write_ptr(sa, 8, 0)
  _write_u32(sa, 16, 1)

  log_handle = CreateFileWInherit(log_path, GENERIC_WRITE, FILE_SHARE_READ | FILE_SHARE_WRITE, sa, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, void)
  if log_handle == INVALID_HANDLE_VALUE then
    return _failed_job(log_path, cmd, compiler, "Test build start failed: cannot open log file " + log_path)
  end if

  si = bytes(104, 0)
  _write_u32(si, 0, 104)
  _write_u32(si, 60, STARTF_USESHOWWINDOW | STARTF_USESTDHANDLES)
  _write_u16(si, 64, SW_HIDE)
  _write_ptr(si, 88, log_handle)
  _write_ptr(si, 96, log_handle)

  pi = bytes(24, 0)
  ok = CreateProcessW(void, cmd, void, void, true, CREATE_NO_WINDOW, void, root, si, pi)
  CloseHandle(log_handle)
  if ok == false then
    return _failed_job(log_path, cmd, compiler, "Test build start failed: CreateProcessW failed.\r\nCommand: " + cmd)
  end if

  process = _read_ptr(pi, 0)
  thread = _read_ptr(pi, 8)
  return BuildJob(process, thread, STILL_ACTIVE, log_path, "", cmd, compiler, true)
end function

// Build the executable and log paths used by a test run job.
function _test_run_paths(project)
  root = "."
  name = "MiniIDE"
  if typeof(project) == "struct" then
    root = project.root
    name = project.name
  end if
  output_path = _test_output_path(root, name)
  out_dir = _dirname(output_path)
  _ensure_dir(out_dir)
  log_path = _path_join(out_dir, "last_test_run.log")
  cmd = _q(output_path)
  return [root, output_path, log_path, cmd]
end function

// Start test output.
function start_test_output(project)
  // Keep process setup and state capture together for reliable polling.
  parts = _test_run_paths(project)
  root = parts[0]
  output_path = parts[1]
  log_path = parts[2]
  cmd = parts[3]

  if fs.exists(output_path) == false then
    return _failed_job(log_path, cmd, output_path, "Test run start failed: executable not found.\r\nExpected: " + output_path + "\r\nPlease run tests again after a successful test build.")
  end if

  wr = fs.writeAllText(log_path, "")
  if typeof(wr) == "error" then
    return _failed_job(log_path, cmd, output_path, "Test run start failed: cannot write log file " + log_path)
  end if

  sa = bytes(24, 0)
  _write_u32(sa, 0, 24)
  _write_ptr(sa, 8, 0)
  _write_u32(sa, 16, 1)

  log_handle = CreateFileWInherit(log_path, GENERIC_WRITE, FILE_SHARE_READ | FILE_SHARE_WRITE, sa, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, void)
  if log_handle == INVALID_HANDLE_VALUE then
    return _failed_job(log_path, cmd, output_path, "Test run start failed: cannot open log file " + log_path)
  end if

  si = bytes(104, 0)
  _write_u32(si, 0, 104)
  _write_u32(si, 60, STARTF_USESHOWWINDOW | STARTF_USESTDHANDLES)
  _write_u16(si, 64, SW_HIDE)
  _write_ptr(si, 88, log_handle)
  _write_ptr(si, 96, log_handle)

  pi = bytes(24, 0)
  ok = CreateProcessW(void, cmd, void, void, true, CREATE_NO_WINDOW, void, root, si, pi)
  CloseHandle(log_handle)
  if ok == false then
    return _failed_job(log_path, cmd, output_path, "Test run start failed: CreateProcessW failed.\r\nCommand: " + cmd)
  end if

  process = _read_ptr(pi, 0)
  thread = _read_ptr(pi, 8)
  return BuildJob(process, thread, STILL_ACTIVE, log_path, "", cmd, output_path, true)
end function

// Return true when source files are newer than the built output.
function needs_recompile(project)
  // Walk collections defensively because project data can be partially populated.
  parts = _run_paths(project)
  root = parts[0]
  output_path = parts[1]
  output_time = _file_write_time(output_path)
  if output_time < 0 then return true end if

  checked = false
  if typeof(project) == "struct" and typeof(project.files) == "array" then
    if len(project.files) > 0 then
      for i = 0 to len(project.files) - 1
        f = project.files[i]
        if typeof(f) == "struct" and f.is_dir == false and _is_source_file(f.path) then
          checked = true
          t = _file_write_time(f.path)
          if t > output_time then return true end if
        end if
      end for
    end if
  end if

  if typeof(project) == "struct" then
    cfg = _path_join(root, ".miniide.cfg")
    tcfg = _file_write_time(cfg)
    if tcfg > output_time then return true end if
    if checked == false then
      entry_path = _resolve(root, project.entry)
      tentry = _file_write_time(entry_path)
      if tentry > output_time then return true end if
    end if
  end if

  return false
end function

// Start run output.
function start_run_output(project)
  // Keep process setup and state capture together for reliable polling.
  parts = _run_paths(project)
  root = parts[0]
  output_path = parts[1]
  log_path = parts[2]
  cmd = parts[3]

  if fs.exists(output_path) == false then
    return _failed_job(log_path, cmd, output_path, "Run start failed: executable not found.\r\nExpected: " + output_path + "\r\nPlease compile first.")
  end if

  wr = fs.writeAllText(log_path, "")
  if typeof(wr) == "error" then
    return _failed_job(log_path, cmd, output_path, "Run start failed: cannot write log file " + log_path)
  end if

  sa = bytes(24, 0)
  _write_u32(sa, 0, 24)
  _write_ptr(sa, 8, 0)
  _write_u32(sa, 16, 1)

  log_handle = CreateFileWInherit(log_path, GENERIC_WRITE, FILE_SHARE_READ | FILE_SHARE_WRITE, sa, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, void)
  if log_handle == INVALID_HANDLE_VALUE then
    return _failed_job(log_path, cmd, output_path, "Run start failed: cannot open log file " + log_path)
  end if

  si = bytes(104, 0)
  _write_u32(si, 0, 104)
  _write_u32(si, 60, STARTF_USESHOWWINDOW | STARTF_USESTDHANDLES)
  _write_u16(si, 64, SW_HIDE)
  _write_ptr(si, 88, log_handle)
  _write_ptr(si, 96, log_handle)

  pi = bytes(24, 0)
  ok = CreateProcessW(void, cmd, void, void, true, CREATE_NO_WINDOW, void, root, si, pi)
  CloseHandle(log_handle)
  if ok == false then
    return _failed_job(log_path, cmd, output_path, "Run start failed: CreateProcessW failed.\r\nCommand: " + cmd)
  end if

  process = _read_ptr(pi, 0)
  thread = _read_ptr(pi, 8)
  return BuildJob(process, thread, STILL_ACTIVE, log_path, "", cmd, output_path, true)
end function

// Return true when a build job was started successfully.
function job_started(job)
  return typeof(job) == "struct" and job.started
end function

// Return the current or completed build log text.
function job_log(job)
  if typeof(job) != "struct" then return "" end if
  text = _read_log(job.log_path)
  if text != "" then job.log_text = text end if
  if text == "" and typeof(job.log_text) == "string" then return job.log_text end if
  return text
end function

// Return the known exit code for a build job.
function job_exit_code(job)
  if typeof(job) != "struct" then return -1 end if
  if job.started == false then return job.exit_code end if
  code = bytes(4, 0)
  ok = GetExitCodeProcess(job.process, code)
  if ok == false then return -1 end if
  return _read_u32(code, 0)
end function

// Return true when a build job is still running.
function job_is_running(job)
  return job_exit_code(job) == STILL_ACTIVE
end function

// Close native process handles held by a build job.
function close_job(job)
  if typeof(job) != "struct" then return job end if
  if job.thread is void then
  else
    CloseHandle(job.thread)
  end if
  if job.process is void then
  else
    CloseHandle(job.process)
  end if
  job.thread = void
  job.process = void
  return job
end function

// Terminate a running build job and preserve its latest log text.
function stop_job(job)
  if typeof(job) != "struct" then return job end if
  text = job_log(job)
  if job.started then
    if job.process is void then
    else
      if job_is_running(job) then
        TerminateProcess(job.process, 1)
        Sleep(50)
        text = job_log(job)
        if text != "" then text = text + "\r\n" end if
        text = text + "Process stopped by MiniIDE."
        fs.writeAllText(job.log_path, text)
        job.log_text = text
        job.exit_code = 1
      end if
    end if
  end if
  job = close_job(job)
  job.started = false
  return job
end function

// Run a compile job synchronously with explicit build options.
function compile_with_options(project, compiler_override, keep_going, max_errors, subsystem, extra_args)
  job = start_compile_with_options(project, compiler_override, keep_going, max_errors, subsystem, extra_args)
  if job_started(job) == false then
    return BuildResult(job.exit_code, job.log_path, job.log_text, parse_diagnostics(job.log_text))
  end if
  while job_is_running(job)
    Sleep(30)
  end while
  rc = job_exit_code(job)
  log_text = job_log(job)
  job = close_job(job)
  return BuildResult(rc, job.log_path, log_text, parse_diagnostics(log_text))
end function

// Sleep for a short polling interval.
function sleep_ms(ms)
  if typeof(ms) != "int" or ms < 0 then ms = 0 end if
  Sleep(ms)
end function

// Run a compile job synchronously with an explicit compiler path.
function compile_with_compiler(project, compiler_override)
  return compile_with_options(project, compiler_override, true, 20, "windows", "")
end function

// Run a compile job synchronously using project defaults.
function compile(project)
  return compile_with_compiler(project, "")
end function
