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

//! Provides lang index facilities for this project.

package lang.index

// Project-wide MiniLang index used by IDE features.

import std.fs as fs
import std.string as s
import "project/project.ml" as project_model
import "lang/symbols.ml" as symbols

/// Represents the source file info data used by the lang index module.
struct SourceFileInfo
  /// Stores the path value associated with source file info.
  path,
  /// Stores the relative path value associated with source file info.
  relative_path,
  /// Stores the line count value associated with source file info.
  line_count,
end struct

/// Represents the import ref data used by the lang index module.
struct ImportRef
  /// Stores the file value associated with import ref.
  file,
  /// Stores the line value associated with import ref.
  line,
  /// Stores the target value associated with import ref.
  target,
  /// Stores the alias value associated with import ref.
  alias,
  /// Stores the resolved path value associated with import ref.
  resolved_path,
  /// Stores the resolved value associated with import ref.
  resolved,
end struct

/// Represents the project index data used by the lang index module.
struct ProjectIndex
  /// Stores the root value associated with project index.
  root,
  /// Stores the files value associated with project index.
  files,
  /// Stores the symbols value associated with project index.
  symbols,
  /// Stores the imports value associated with project index.
  imports,
  /// Stores the unresolved imports value associated with project index.
  unresolved_imports,
end struct

/// Return true when the path is absolute on Windows.
/// @param path Path of the file or directory used by the operation.
function _is_abs(path)
  if typeof(path) != "string" then return false end if
  if len(path) > 2 and path[1] == ":" then return true end if
  if s.startsWith(path, "\\") or s.startsWith(path, "/") then return true end if
  return false
end function

/// Return path relative to the project root when possible.
/// @param root root value consumed by this operation.
/// @param path Path of the file or directory used by the operation.
function _relative(root, path)
  if typeof(root) != "string" or typeof(path) != "string" then return path end if
  prefix = root
  if s.endsWith(prefix, "\\") == false and s.endsWith(prefix, "/") == false then prefix = prefix + "\\" end if
  if s.startsWith(s.toLowerAscii(path), s.toLowerAscii(prefix)) then
    return s.substr(path, len(prefix), len(path) - len(prefix))
  end if
  return path
end function

/// Return the number of display lines in a source string.
/// @param text Text consumed by the operation.
function _line_count(text)
  if typeof(text) != "string" or text == "" then return 0 end if
  lines = s.split(s.replaceAll(text, "\r\n", "\n"), "\n")
  return len(lines)
end function

/// Add a source file entry.
/// @param files files value consumed by this operation.
/// @param root root value consumed by this operation.
/// @param path Path of the file or directory used by the operation.
/// @param text Text consumed by the operation.
function _add_source_file(files, root, path, text)
  return files + [SourceFileInfo(path, _relative(root, path), _line_count(text))]
end function

/// Return text before a line comment.
/// @param line line value consumed by this operation.
function _strip_line_comment(line)
  if typeof(line) != "string" then return "" end if
  pos = s.indexOf(line, "//", 0)
  if pos < 0 then return line end if
  return s.substr(line, 0, pos)
end function

/// Return the quoted import path from an import line.
/// @param line line value consumed by this operation.
function _quoted_target(line)
  if typeof(line) != "string" then return "" end if
  first = s.indexOf(line, "\"", 0)
  if first < 0 then return "" end if
  second = s.indexOf(line, "\"", first + 1)
  if second <= first then return "" end if
  return s.substr(line, first + 1, second - first - 1)
end function

/// Return the unquoted import target from an import line.
/// @param line line value consumed by this operation.
function _bare_target(line)
  if typeof(line) != "string" then return "" end if
  prefix = "import "
  if s.startsWith(line, prefix) == false then return "" end if
  rest = s.trim(s.substr(line, len(prefix), len(line) - len(prefix)))
  if rest == "" then return "" end if
  as_pos = s.indexOf(rest, " as ", 0)
  if as_pos >= 0 then rest = s.trim(s.substr(rest, 0, as_pos)) end if
  return rest
end function

/// Return an import alias if present.
/// @param line line value consumed by this operation.
function _import_alias(line)
  if typeof(line) != "string" then return "" end if
  as_pos = s.indexOf(line, " as ", 0)
  if as_pos < 0 then return "" end if
  return s.trim(s.substr(line, as_pos + len(" as "), len(line) - as_pos - len(" as ")))
end function

/// Return a module target converted to a likely source path.
/// @param target target value consumed by this operation.
function _module_to_path(target)
  if typeof(target) != "string" or target == "" then return "" end if
  if s.endsWith(s.toLowerAscii(target), ".ml") then return target end if
  return s.replaceAll(target, ".", "\\") + ".ml"
end function

/// Try to resolve an import candidate against the current file, root, and import paths.
/// @param root root value consumed by this operation.
/// @param current_file current_file value consumed by this operation.
/// @param import_paths import_paths value consumed by this operation.
/// @param candidate candidate value consumed by this operation.
function _resolve_candidate(root, current_file, import_paths, candidate)
  if typeof(candidate) != "string" or candidate == "" then return "" end if
  if _is_abs(candidate) and fs.exists(candidate) then return project_model.abspath(candidate) end if

  local_path = project_model.path_join(project_model.dirname(current_file), candidate)
  if fs.exists(local_path) then return project_model.abspath(local_path) end if

  root_path = project_model.path_join(root, candidate)
  if fs.exists(root_path) then return project_model.abspath(root_path) end if

  if typeof(import_paths) == "array" and len(import_paths) > 0 then
    for i = 0 to len(import_paths) - 1
      base = import_paths[i]
      if typeof(base) != "string" or base == "" then continue end if
      if _is_abs(base) == false then base = project_model.path_join(root, base) end if
      full = project_model.path_join(base, candidate)
      if fs.exists(full) then return project_model.abspath(full) end if
    end for
  end if

  return ""
end function

/// Parse imports from a source file.
/// @param root root value consumed by this operation.
/// @param current_file current_file value consumed by this operation.
/// @param import_paths import_paths value consumed by this operation.
/// @param text Text consumed by the operation.
function _scan_imports(root, current_file, import_paths, text)
  result = []
  if typeof(text) != "string" then return result end if
  lines = s.split(s.replaceAll(text, "\r\n", "\n"), "\n")
  if len(lines) <= 0 then return result end if

  for i = 0 to len(lines) - 1
    line = s.trim(_strip_line_comment(lines[i]))
    if s.startsWith(line, "import ") == false then continue end if
    target = _quoted_target(line)
    if target == "" then target = _bare_target(line) end if
    if target == "" then continue end if
    alias = _import_alias(line)
    candidate = target
    if s.indexOf(line, "\"", 0) < 0 then candidate = _module_to_path(target) end if
    resolved_path = _resolve_candidate(root, current_file, import_paths, candidate)
    resolved = resolved_path != ""
    result = result + [ImportRef(current_file, i, target, alias, resolved_path, resolved)]
  end for

  return result
end function

/// Build a project-wide index.
/// @param p p value consumed by this operation.
function build_project_index(p)
  root = "."
  files = []
  imports = []
  unresolved = []
  symbol_index = symbols.SymbolIndex([])
  if typeof(p) != "struct" then return ProjectIndex(root, files, symbol_index.symbols, imports, unresolved) end if

  root = p.root
  symbol_index = symbols.build_index(p)
  project_files = []
  if typeof(p.files) == "array" then project_files = p.files end if

  if len(project_files) > 0 then
    for i = 0 to len(project_files) - 1
      f = project_files[i]
      if typeof(f) != "struct" or f.is_dir then continue end if
      if s.endsWith(s.toLowerAscii(f.path), ".ml") == false then continue end if
      text = fs.readAllText(f.path)
      if typeof(text) != "string" then continue end if
      files = _add_source_file(files, root, f.path, text)
      refs = _scan_imports(root, f.path, p.import_paths, text)
      if len(refs) > 0 then
        for ri = 0 to len(refs) - 1
          imports = imports + [refs[ri]]
          if refs[ri].resolved == false then unresolved = unresolved + [refs[ri]] end if
        end for
      end if
    end for
  end if

  return ProjectIndex(root, files, symbol_index.symbols, imports, unresolved)
end function

/// Return a compact summary for logs and status panels.
/// @param idx idx value consumed by this operation.
function summary(idx)
  if typeof(idx) != "struct" then return "Project index unavailable." end if
  file_count = 0
  symbol_count = 0
  import_count = 0
  unresolved_count = 0
  if typeof(idx.files) == "array" then file_count = len(idx.files) end if
  if typeof(idx.symbols) == "array" then symbol_count = len(idx.symbols) end if
  if typeof(idx.imports) == "array" then import_count = len(idx.imports) end if
  if typeof(idx.unresolved_imports) == "array" then unresolved_count = len(idx.unresolved_imports) end if
  text = "Indexed " + file_count + " MiniLang files, " + symbol_count + " symbols, " + import_count + " imports"
  if unresolved_count > 0 then text = text + " (" + unresolved_count + " unresolved)" end if
  return text + "."
end function
