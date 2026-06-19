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

package project.project

// Project model and .mlproj handling for MiniIDE.

import std.fs as fs
import std.string as s

// Bind the native GetFullPathNameW API used by MiniIDE.
extern function GetFullPathNameW(path as wstr, bufferLen as u32, buffer as buffer, filePart as ptr) from "kernel32.dll" symbol "GetFullPathNameW" returns u32

struct ProjectFile
  path,
  name,
  is_dir,
  depth,
end struct

struct MiniProject
  root,
  name,
  kind,
  entry,
  output,
  test_entry,
  run_args,
  working_dir,
  import_paths,
  files,
end struct

// Join two path fragments using the project path separator.
function path_join(a, b)
  if typeof(a) != "string" or a == "" then return b end if
  if typeof(b) != "string" or b == "" then return a end if
  last = a[len(a) - 1]
  if last == "\\" or last == "/" then return a + b end if
  return a + "\\" + b
end function

// Return the directory portion of a path.
function dirname(path)
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

// Return the file name portion of a path.
function basename(path)
  if typeof(path) != "string" then return "" end if
  i = len(path) - 1
  while i >= 0
    ch = path[i]
    if ch == "\\" or ch == "/" then
      if i + 1 >= len(path) then return "" end if
      return s.substr(path, i + 1, len(path) - i - 1)
    end if
    i = i - 1
  end while
  return path
end function

// Return the normalized absolute form of a path.
function abspath(path)
  if typeof(path) != "string" or path == "" then return "." end if
  buf = bytes(8192, 0)
  n = GetFullPathNameW(path, 4096, buf, 0)
  if typeof(n) != "int" or n <= 0 then return path end if
  result = decode16Z(buf)
  if typeof(result) != "string" or result == "" then return path end if
  return result
end function

// Return true when a path has the requested file extension.
function has_ext(path, ext)
  return s.endsWith(s.toLowerAscii(path), s.toLowerAscii(ext))
end function

// Sort strings.
function _sort_strings(items)
  if typeof(items) != "array" then return [] end if
  return items
end function

// Return the contains string.
function _contains_string(items, value)
  // Walk collections defensively because project data can be partially populated.
  if typeof(items) != "array" then return false end if
  if len(items) <= 0 then return false end if
  for i = 0 to len(items) - 1
    if items[i] == value then return true end if
  end for
  return false
end function

// Remove duplicate entries from strings.
function _dedupe_strings(items)
  // Walk collections defensively because project data can be partially populated.
  if typeof(items) != "array" then return [] end if
  result = []
  if len(items) <= 0 then return result end if
  for i = 0 to len(items) - 1
    value = items[i]
    if typeof(value) == "string" and value != "" and _contains_string(result, value) == false then
      result = result + [value]
    end if
  end for
  return result
end function

// Append file.
function _append_file(files, path, name, is_dir, depth)
  if typeof(files) != "array" then files = [] end if
  return files + [ProjectFile(path, name, is_dir, depth)]
end function

// Scan directory.
function _scan_dir(path, depth, out_files)
  // Walk collections defensively because project data can be partially populated.
  entries = fs.listDir(path)
  if typeof(entries) == "error" then return out_files end if
  entries = _sort_strings(entries)

  dirs = []
  files = []
  if len(entries) > 0 then
    for i = 0 to len(entries) - 1
      nm = entries[i]
      if nm == ".git" or nm == "build" or nm == "__pycache__" or nm == "MiniLangCompilerML" then
        continue
      end if
      full = path_join(path, nm)
      if fs.isDir(full) then
        dirs = dirs + [nm]
      else
        if has_ext(nm, ".ml") or has_ext(nm, ".mlproj") then
          files = files + [nm]
        end if
      end if
    end for
  end if

  if len(dirs) > 0 then
    for di = 0 to len(dirs) - 1
      dn = dirs[di]
      dp = path_join(path, dn)
      out_files = _append_file(out_files, dp, dn, true, depth)
      if depth < 6 then
        out_files = _scan_dir(dp, depth + 1, out_files)
      end if
    end for
  end if

  if len(files) > 0 then
    for fi = 0 to len(files) - 1
      fn = files[fi]
      out_files = _append_file(out_files, path_join(path, fn), fn, false, depth)
    end for
  end if

  return out_files
end function

// Scan files.
function scan_files(root)
  return _scan_dir(root, 0, [])
end function

// Parse project file.
function _parse_project_file(path, root)
  // Walk collections defensively because project data can be partially populated.
  name = basename(root)
  kind = "console"
  entry = "src\\main.ml"
  output = "build\\" + name + ".exe"
  test_entry = "tests\\main_test.ml"
  run_args = ""
  working_dir = "."
  default_import_paths = ["src", "MiniLangCompilerML"]
  import_paths = []

  text = ""
  if fs.exists(path) then
    if fs.isDir(path) == false then
      read_result = try(fs.readAllText(path))
      if typeof(read_result) == "string" then text = read_result end if
    end if
  end if
  if typeof(text) == "string" and text != "" then
    lines = s.split(s.replaceAll(text, "\r\n", "\n"), "\n")
    if len(lines) > 0 then
      for i = 0 to len(lines) - 1
        line = s.trim(lines[i])
        if line == "" or s.startsWith(line, "#") or s.startsWith(line, "//") then
          continue
        end if
        eq = s.indexOf(line, "=", 0)
        if eq < 0 then continue end if
        key = s.trim(s.substr(line, 0, eq))
        value = s.trim(s.substr(line, eq + 1, len(line) - eq - 1))
        if key == "name" then name = value end if
        if key == "type" then kind = value end if
        if key == "entry" then entry = value end if
        if key == "output" then output = value end if
        if key == "testEntry" then test_entry = value end if
        if key == "runArgs" then run_args = value end if
        if key == "workingDir" then working_dir = value end if
        if key == "importPath" then import_paths = import_paths + [value] end if
      end for
    end if
  end if
  if len(import_paths) <= 0 then import_paths = default_import_paths end if
  import_paths = _dedupe_strings(import_paths)

  return MiniProject(root, name, kind, entry, output, test_entry, run_args, working_dir, import_paths, scan_files(root))
end function

// Return the project file path.
function project_file_path(project)
  // Walk collections defensively because project data can be partially populated.
  if typeof(project) != "struct" then return "" end if
  root = project.root
  candidate = path_join(root, "MiniIDE.mlproj")
  if fs.exists(candidate) then return candidate end if
  entries = fs.listDir(root)
  if typeof(entries) == "array" and len(entries) > 0 then
    for i = 0 to len(entries) - 1
      if has_ext(entries[i], ".mlproj") then return path_join(root, entries[i]) end if
    end for
  end if
  name = project.name
  if typeof(name) != "string" or name == "" then name = basename(root) end if
  return path_join(root, name + ".mlproj")
end function

// Save project.
function save_project(project)
  // Walk collections defensively because project data can be partially populated.
  if typeof(project) != "struct" then return "invalid project" end if
  path = project_file_path(project)
  if path == "" then return "invalid project path" end if
  imports = _dedupe_strings(project.import_paths)
  text = "name=" + project.name + "\n"
  text = text + "type=" + project.kind + "\n"
  text = text + "entry=" + project.entry + "\n"
  text = text + "output=" + project.output + "\n"
  text = text + "testEntry=" + project.test_entry + "\n"
  text = text + "runArgs=" + project.run_args + "\n"
  text = text + "workingDir=" + project.working_dir + "\n"
  if len(imports) > 0 then
    for i = 0 to len(imports) - 1
      text = text + "importPath=" + imports[i] + "\n"
    end for
  end if
  wr = fs.writeAllText(path, text)
  if typeof(wr) == "error" then return wr end if
  return path
end function

// Return a copy with updated compile settings.
function with_compile_settings(project, entry, output)
  if typeof(project) != "struct" then return project end if
  return MiniProject(project.root, project.name, project.kind, entry, output, project.test_entry, project.run_args, project.working_dir, project.import_paths, project.files)
end function

// Return a copy with updated run settings.
function with_run_settings(project, test_entry, run_args, working_dir)
  if typeof(project) != "struct" then return project end if
  return MiniProject(project.root, project.name, project.kind, project.entry, project.output, test_entry, run_args, working_dir, project.import_paths, project.files)
end function

// Load project.
function load_project(root)
  // Walk collections defensively because project data can be partially populated.
  if typeof(root) != "string" or root == "" then root = "." end if
  if has_ext(root, ".mlproj") then return load_project_file(root) end if
  root = abspath(root)

  proj_file = path_join(root, "MiniIDE.mlproj")
  if fs.exists(proj_file) == false then
    entries = fs.listDir(root)
    if typeof(entries) == "array" then
      if len(entries) > 0 then
        for i = 0 to len(entries) - 1
          if has_ext(entries[i], ".mlproj") then
            proj_file = path_join(root, entries[i])
            break
          end if
        end for
      end if
    end if
  end if

  return _parse_project_file(proj_file, root)
end function

// Load project file.
function load_project_file(path)
  if typeof(path) != "string" or path == "" then return load_project(".") end if
  path = abspath(path)
  if fs.isDir(path) then return load_project(path) end if
  root = dirname(path)
  return _parse_project_file(path, root)
end function

// Return the project entry path.
function project_entry_path(project)
  if typeof(project) != "struct" then return "" end if
  return path_join(project.root, project.entry)
end function

// Return the project output path.
function project_output_path(project)
  if typeof(project) != "struct" then return "" end if
  return path_join(project.root, project.output)
end function

// Return the project test entry path.
function project_test_entry_path(project)
  if typeof(project) != "struct" then return "" end if
  return path_join(project.root, project.test_entry)
end function

// Return the project working directory path.
function project_working_dir_path(project)
  if typeof(project) != "struct" then return "." end if
  return resolve_project_path(project, project.working_dir)
end function

// Resolve project path.
function resolve_project_path(project, path)
  if typeof(path) != "string" then return "" end if
  if len(path) > 2 and path[1] == ":" then return path end if
  if s.startsWith(path, "\\") or s.startsWith(path, "/") then return path end if
  return path_join(project.root, path)
end function
