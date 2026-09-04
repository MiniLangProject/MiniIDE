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

//! Provides lang service facilities for this project.

package lang.service

// Thin language-service facade for editor features.

import std.string as s
import std.fs as fs
import "lang/index.ml" as lang_index
import "lang/syntax.ml" as syntax

/// Represents the reference item data used by the lang service module.
struct ReferenceItem
  /// Stores the file value associated with reference item.
  file,
  /// Stores the line value associated with reference item.
  line,
  /// Stores the col value associated with reference item.
  col,
  /// Stores the text value associated with reference item.
  text,
end struct

/// Represents the rename preview item data used by the lang service module.
struct RenamePreviewItem
  /// Stores the old name value associated with rename preview item.
  old_name,
  /// Stores the new name value associated with rename preview item.
  new_name,
  /// Stores the file value associated with rename preview item.
  file,
  /// Stores the line value associated with rename preview item.
  line,
  /// Stores the col value associated with rename preview item.
  col,
  /// Stores the text value associated with rename preview item.
  text,
end struct

/// Represents the rename apply result data used by the lang service module.
struct RenameApplyResult
  /// Stores the ok value associated with rename apply result.
  ok,
  /// Stores the replacements value associated with rename apply result.
  replacements,
  /// Stores the files value associated with rename apply result.
  files,
  /// Stores the errors value associated with rename apply result.
  errors,
end struct

/// Represents the call hierarchy item data used by the lang service module.
struct CallHierarchyItem
  /// Stores the name value associated with call hierarchy item.
  name,
  /// Stores the kind value associated with call hierarchy item.
  kind,
  /// Stores the file value associated with call hierarchy item.
  file,
  /// Stores the line value associated with call hierarchy item.
  line,
  /// Stores the col value associated with call hierarchy item.
  col,
  /// Stores the text value associated with call hierarchy item.
  text,
end struct

/// Represents the diagnostic item data used by the lang service module.
struct DiagnosticItem
  /// Stores the kind value associated with diagnostic item.
  kind,
  /// Stores the message value associated with diagnostic item.
  message,
  /// Stores the file value associated with diagnostic item.
  file,
  /// Stores the line value associated with diagnostic item.
  line,
  /// Stores the col value associated with diagnostic item.
  col,
end struct

/// Represents the inspection item data used by the lang service module.
struct InspectionItem
  /// Stores the severity value associated with inspection item.
  severity,
  /// Stores the message value associated with inspection item.
  message,
  /// Stores the file value associated with inspection item.
  file,
  /// Stores the line value associated with inspection item.
  line,
  /// Stores the col value associated with inspection item.
  col,
end struct

/// Represents the declaration item data used by the lang service module.
struct DeclarationItem
  /// Stores the name value associated with declaration item.
  name,
  /// Stores the kind value associated with declaration item.
  kind,
  /// Stores the file value associated with declaration item.
  file,
  /// Stores the line value associated with declaration item.
  line,
  /// Stores the col value associated with declaration item.
  col,
end struct

/// Represents the completion item data used by the lang service module.
struct CompletionItem
  /// Stores the label value associated with completion item.
  label,
  /// Stores the insert text value associated with completion item.
  insert_text,
  /// Stores the kind value associated with completion item.
  kind,
  /// Stores the file value associated with completion item.
  file,
  /// Stores the line value associated with completion item.
  line,
end struct

/// Represents the symbol item data used by the lang service module.
struct SymbolItem
  /// Stores the name value associated with symbol item.
  name,
  /// Stores the kind value associated with symbol item.
  kind,
  /// Stores the file value associated with symbol item.
  file,
  /// Stores the line value associated with symbol item.
  line,
end struct

/// Represents the symbol info item data used by the lang service module.
struct SymbolInfoItem
  /// Stores the name value associated with symbol info item.
  name,
  /// Stores the kind value associated with symbol info item.
  kind,
  /// Stores the file value associated with symbol info item.
  file,
  /// Stores the line value associated with symbol info item.
  line,
  /// Stores the reference count value associated with symbol info item.
  reference_count,
end struct

/// Represents the file item data used by the lang service module.
struct FileItem
  /// Stores the path value associated with file item.
  path,
  /// Stores the relative path value associated with file item.
  relative_path,
  /// Stores the line count value associated with file item.
  line_count,
end struct

/// Represents the import item data used by the lang service module.
struct ImportItem
  /// Stores the source file value associated with import item.
  source_file,
  /// Stores the line value associated with import item.
  line,
  /// Stores the target value associated with import item.
  target,
  /// Stores the alias value associated with import item.
  alias,
  /// Stores the resolved path value associated with import item.
  resolved_path,
  /// Stores the resolved value associated with import item.
  resolved,
end struct

/// Represents the todo item data used by the lang service module.
struct TodoItem
  /// Stores the kind value associated with todo item.
  kind,
  /// Stores the file value associated with todo item.
  file,
  /// Stores the line value associated with todo item.
  line,
  /// Stores the text value associated with todo item.
  text,
end struct

/// Represents the test item data used by the lang service module.
struct TestItem
  /// Stores the name value associated with test item.
  name,
  /// Stores the kind value associated with test item.
  kind,
  /// Stores the file value associated with test item.
  file,
  /// Stores the line value associated with test item.
  line,
  /// Stores the status value associated with test item.
  status,
end struct

/// Represents the language snapshot data used by the lang service module.
struct LanguageSnapshot
  /// Stores the project value associated with language snapshot.
  project,
  /// Stores the project index value associated with language snapshot.
  project_index,
end struct

/// Return true when a character belongs to an identifier-like word.
/// @param ch ch value consumed by this operation.
function _is_word_char(ch)
  if typeof(ch) != "string" or ch == "" then return false end if
  if ch == "_" or ch == "." then return true end if
  b = bytes(ch)
  if len(b) <= 0 then return false end if
  c = b[0]
  return (c >= 65 and c <= 90) or (c >= 97 and c <= 122) or (c >= 48 and c <= 57)
end function

/// Return true when a character can start a simple identifier.
/// @param ch ch value consumed by this operation.
function _is_identifier_start(ch)
  if typeof(ch) != "string" or ch == "" then return false end if
  if ch == "_" then return true end if
  b = bytes(ch)
  if len(b) <= 0 then return false end if
  c = b[0]
  return (c >= 65 and c <= 90) or (c >= 97 and c <= 122)
end function

/// Return true when a character can continue a simple identifier.
/// @param ch ch value consumed by this operation.
function _is_identifier_char(ch)
  if _is_identifier_start(ch) then return true end if
  b = bytes(ch)
  if len(b) <= 0 then return false end if
  c = b[0]
  return c >= 48 and c <= 57
end function

/// Return true when the requested rename target is a simple MiniLang identifier.
/// @param name Name of the affected item.
function _is_simple_identifier(name)
  if typeof(name) != "string" or name == "" then return false end if
  if _is_identifier_start(name[0]) == false then return false end if
  for i = 1 to len(name) - 1
    if _is_identifier_char(name[i]) == false then return false end if
  end for
  return true
end function

/// Strip a simple line comment before lexical searches.
/// @param line line value consumed by this operation.
function _strip_line_comment(line)
  if typeof(line) != "string" then return "" end if
  pos = s.indexOf(line, "//", 0)
  if pos < 0 then return line end if
  return s.substr(line, 0, pos)
end function

/// Read an identifier-like word at the requested position.
/// @param text Text consumed by the operation.
/// @param start start value consumed by this operation.
function _take_word(text, start)
  if typeof(text) != "string" then return "" end if
  if typeof(start) != "int" or start < 0 then start = 0 end if
  i = start
  while i < len(text) and (text[i] == " " or text[i] == "\t")
    i = i + 1
  end while
  begin = i
  while i < len(text) and _is_word_char(text[i])
    i = i + 1
  end while
  if i <= begin then return "" end if
  return s.substr(text, begin, i - begin)
end function

/// Return a 1-based column for a declaration name.
/// @param raw raw value consumed by this operation.
/// @param name Name of the affected item.
function _declaration_col(raw, name)
  if typeof(raw) != "string" or typeof(name) != "string" or name == "" then return 1 end if
  pos = s.indexOf(raw, name, 0)
  if pos < 0 then return 1 end if
  return pos + 1
end function

/// Find the next whole-word occurrence in a line.
/// @param line line value consumed by this operation.
/// @param word word value consumed by this operation.
/// @param start start value consumed by this operation.
function _find_word(line, word, start)
  if typeof(line) != "string" or typeof(word) != "string" or word == "" then return -1 end if
  if typeof(start) != "int" or start < 0 then start = 0 end if
  pos = s.indexOf(line, word, start)
  while pos >= 0
    before_ok = true
    after_ok = true
    if pos > 0 and _is_word_char(line[pos - 1]) then before_ok = false end if
    after = pos + len(word)
    if after < len(line) and _is_word_char(line[after]) then after_ok = false end if
    if before_ok and after_ok then return pos end if
    pos = s.indexOf(line, word, pos + 1)
  end while
  return -1
end function

/// Analyze a project and return the reusable language snapshot.
/// @param project project value consumed by this operation.
function analyze_project(project)
  return LanguageSnapshot(project, lang_index.build_project_index(project))
end function

/// Return true when the completion item already exists.
/// @param items Items consumed or updated by the operation.
/// @param label label value consumed by this operation.
function _has_completion(items, label)
  if typeof(items) != "array" then return false end if
  if len(items) <= 0 then return false end if
  for i = 0 to len(items) - 1
    item = items[i]
    if typeof(item) == "struct" and item.label == label then return true end if
  end for
  return false
end function

/// Return true when a label matches the requested prefix.
/// @param label label value consumed by this operation.
/// @param prefix prefix value consumed by this operation.
function _matches_prefix(label, prefix)
  if typeof(label) != "string" or label == "" then return false end if
  if typeof(prefix) != "string" or prefix == "" then return true end if
  return s.startsWith(s.toLowerAscii(label), s.toLowerAscii(prefix))
end function

/// Return compact lower-case text for fuzzy matching.
/// @param value Value consumed or transformed by the operation.
function _compact_query_text(value)
  if typeof(value) != "string" then return "" end if
  value = s.toLowerAscii(value)
  compacted = ""
  for i = 0 to len(value) - 1
    if _is_identifier_char(value[i]) then compacted = compacted + value[i] end if
  end for
  return compacted
end function

/// Return true when needle appears as an ordered compact subsequence.
/// @param haystack haystack value consumed by this operation.
/// @param needle needle value consumed by this operation.
function _is_query_subsequence(haystack, needle)
  if typeof(haystack) != "string" or typeof(needle) != "string" then return false end if
  if needle == "" then return true end if
  pos = 0
  for i = 0 to len(haystack) - 1
    if haystack[i] == needle[pos] then
      pos = pos + 1
      if pos >= len(needle) then return true end if
    end if
  end for
  return false
end function

/// Return a match score for ranked project navigation.
/// @param label label value consumed by this operation.
/// @param query query value consumed by this operation.
function _query_score(label, query)
  if typeof(label) != "string" or label == "" then return 0 end if
  if typeof(query) != "string" then query = "" end if
  query = s.toLowerAscii(s.trim(query))
  if query == "" then return 3 end if
  hay = s.toLowerAscii(label)
  if s.startsWith(hay, query) then return 3 end if
  if s.indexOf(hay, query, 0) >= 0 then return 2 end if
  if _is_query_subsequence(_compact_query_text(hay), _compact_query_text(query)) then return 1 end if
  return 0
end function

/// Add a completion item.
/// @param items Items consumed or updated by the operation.
/// @param label label value consumed by this operation.
/// @param insert_text insert_text value consumed by this operation.
/// @param kind kind value consumed by this operation.
/// @param file file value consumed by this operation.
/// @param line line value consumed by this operation.
/// @param prefix prefix value consumed by this operation.
/// @param limit limit value consumed by this operation.
function _add_completion(items, label, insert_text, kind, file, line, prefix, limit)
  if len(items) >= limit then return items end if
  if _query_score(label, prefix) <= 0 then return items end if
  if _has_completion(items, label) then return items end if
  return items + [CompletionItem(label, insert_text, kind, file, line)]
end function

/// Return rich completion items from a snapshot.
/// @param snapshot snapshot value consumed by this operation.
/// @param prefix prefix value consumed by this operation.
/// @param limit limit value consumed by this operation.
function completion_items(snapshot, prefix, limit)
  if typeof(limit) != "int" or limit <= 0 then limit = 24 end if
  if typeof(prefix) != "string" then prefix = "" end if
  prefix = s.trim(prefix)
  items = []

  kws = syntax.keywords()
  if len(kws) > 0 then
    for i = 0 to len(kws) - 1
      items = _add_completion(items, kws[i], kws[i], "keyword", "", 0, prefix, limit)
    end for
  end if

  idx = void
  if typeof(snapshot) == "struct" then idx = snapshot.project_index end if
  if typeof(idx) == "struct" and typeof(idx.symbols) == "array" and len(idx.symbols) > 0 then
    for si = 0 to len(idx.symbols) - 1
      sym = idx.symbols[si]
      if typeof(sym) != "struct" then continue end if
      items = _add_completion(items, sym.name, sym.name, sym.kind, sym.file, sym.line, prefix, limit)
    end for
  end if

  return items
end function

/// Return labels for the existing MiniIDE completion popup.
/// @param snapshot snapshot value consumed by this operation.
/// @param prefix prefix value consumed by this operation.
/// @param limit limit value consumed by this operation.
function completion_labels(snapshot, prefix, limit)
  labels = []
  items = completion_items(snapshot, prefix, limit)
  if typeof(items) != "array" or len(items) <= 0 then return labels end if
  for i = 0 to len(items) - 1
    item = items[i]
    if typeof(item) == "struct" then labels = labels + [item.label] end if
  end for
  return labels
end function

/// Return project symbols from a snapshot.
/// @param snapshot snapshot value consumed by this operation.
/// @param prefix prefix value consumed by this operation.
/// @param limit limit value consumed by this operation.
function symbol_items(snapshot, prefix, limit)
  if typeof(limit) != "int" or limit <= 0 then limit = 200 end if
  if typeof(prefix) != "string" then prefix = "" end if
  prefix = s.trim(prefix)
  items = []

  idx = void
  if typeof(snapshot) == "struct" then idx = snapshot.project_index end if
  if typeof(idx) != "struct" or typeof(idx.symbols) != "array" then return items end if

  for si = 0 to len(idx.symbols) - 1
    sym = idx.symbols[si]
    if typeof(sym) != "struct" then continue end if
    if _query_score(sym.name, prefix) != 3 then continue end if
    items = items + [SymbolItem(sym.name, sym.kind, sym.file, sym.line)]
    if len(items) >= limit then return items end if
  end for
  for si = 0 to len(idx.symbols) - 1
    sym = idx.symbols[si]
    if typeof(sym) != "struct" then continue end if
    if _query_score(sym.name, prefix) != 2 then continue end if
    items = items + [SymbolItem(sym.name, sym.kind, sym.file, sym.line)]
    if len(items) >= limit then return items end if
  end for
  for si = 0 to len(idx.symbols) - 1
    sym = idx.symbols[si]
    if typeof(sym) != "struct" then continue end if
    if _query_score(sym.name, prefix) != 1 then continue end if
    items = items + [SymbolItem(sym.name, sym.kind, sym.file, sym.line)]
    if len(items) >= limit then return items end if
  end for

  return items
end function

/// Return symbol details for an exact symbol name.
/// @param snapshot snapshot value consumed by this operation.
/// @param name Name of the affected item.
function symbol_info(snapshot, name)
  if typeof(name) != "string" or name == "" then return [] end if
  idx = void
  if typeof(snapshot) == "struct" then idx = snapshot.project_index end if
  if typeof(idx) != "struct" or typeof(idx.symbols) != "array" then return [] end if

  result = []
  for si = 0 to len(idx.symbols) - 1
    sym = idx.symbols[si]
    if typeof(sym) != "struct" then continue end if
    if sym.name != name then continue end if
    refs = references(snapshot, name, 1000)
    ref_count = 0
    if typeof(refs) == "array" then ref_count = len(refs) end if
    result = result + [SymbolInfoItem(sym.name, sym.kind, sym.file, sym.line + 1, ref_count)]
    return result
  end for
  return result
end function

/// Return project files from a snapshot.
/// @param snapshot snapshot value consumed by this operation.
/// @param query query value consumed by this operation.
/// @param limit limit value consumed by this operation.
function file_items(snapshot, query, limit)
  if typeof(limit) != "int" or limit <= 0 then limit = 200 end if
  if typeof(query) != "string" then query = "" end if
  query = s.trim(query)
  items = []

  idx = void
  if typeof(snapshot) == "struct" then idx = snapshot.project_index end if
  if typeof(idx) != "struct" or typeof(idx.files) != "array" then return items end if

  for fi = 0 to len(idx.files) - 1
    file_info = idx.files[fi]
    if typeof(file_info) != "struct" then continue end if
    rel = file_info.relative_path
    if _query_score(rel, query) != 3 then continue end if
    items = items + [FileItem(file_info.path, rel, file_info.line_count)]
    if len(items) >= limit then return items end if
  end for
  for fi = 0 to len(idx.files) - 1
    file_info = idx.files[fi]
    if typeof(file_info) != "struct" then continue end if
    rel = file_info.relative_path
    if _query_score(rel, query) != 2 then continue end if
    items = items + [FileItem(file_info.path, rel, file_info.line_count)]
    if len(items) >= limit then return items end if
  end for
  for fi = 0 to len(idx.files) - 1
    file_info = idx.files[fi]
    if typeof(file_info) != "struct" then continue end if
    rel = file_info.relative_path
    if _query_score(rel, query) != 1 then continue end if
    items = items + [FileItem(file_info.path, rel, file_info.line_count)]
    if len(items) >= limit then return items end if
  end for

  return items
end function

/// Return project import edges from a snapshot.
/// @param snapshot snapshot value consumed by this operation.
/// @param query query value consumed by this operation.
/// @param limit limit value consumed by this operation.
function import_items(snapshot, query, limit)
  if typeof(limit) != "int" or limit <= 0 then limit = 300 end if
  if typeof(query) != "string" then query = "" end if
  query = s.toLowerAscii(s.trim(query))
  items = []

  idx = void
  if typeof(snapshot) == "struct" then idx = snapshot.project_index end if
  if typeof(idx) != "struct" or typeof(idx.imports) != "array" then return items end if

  for ii = 0 to len(idx.imports) - 1
    imp = idx.imports[ii]
    if typeof(imp) != "struct" then continue end if
    hay = s.toLowerAscii(imp.file + " " + imp.target + " " + imp.alias + " " + imp.resolved_path)
    if query != "" and s.indexOf(hay, query, 0) < 0 then continue end if
    items = items + [ImportItem(imp.file, imp.line + 1, imp.target, imp.alias, imp.resolved_path, imp.resolved)]
    if len(items) >= limit then return items end if
  end for

  return items
end function

/// Return true when a string array contains a value.
/// @param items Items consumed or updated by the operation.
/// @param value Value consumed or transformed by the operation.
function _has_text(items, value)
  if typeof(items) != "array" then return false end if
  if typeof(value) != "string" or value == "" then return false end if
  if len(items) <= 0 then return false end if
  for i = 0 to len(items) - 1
    if items[i] == value then return true end if
  end for
  return false
end function

/// Return project-analysis diagnostics.
/// @param snapshot snapshot value consumed by this operation.
function diagnostics(snapshot)
  items = []
  project = void
  if typeof(snapshot) == "struct" then project = snapshot.project end if
  if typeof(project) == "struct" then
    entry_path = _join_path(project.root, project.entry)
    if typeof(project.entry) == "string" and project.entry != "" and fs.exists(entry_path) == false then
      items = items + [DiagnosticItem("error", "Project entry not found: " + project.entry, entry_path, 1, 1)]
    end if
    test_entry_path = _join_path(project.root, project.test_entry)
    if typeof(project.test_entry) == "string" and project.test_entry != "" and fs.exists(test_entry_path) == false then
      items = items + [DiagnosticItem("warning", "Project test entry not found: " + project.test_entry, test_entry_path, 1, 1)]
    end if
    working_dir_path = _join_path(project.root, project.working_dir)
    if typeof(project.working_dir) == "string" and project.working_dir != "" and fs.exists(working_dir_path) == false then
      items = items + [DiagnosticItem("warning", "Working directory not found: " + project.working_dir, working_dir_path, 1, 1)]
    end if
    if typeof(project.import_paths) == "array" and len(project.import_paths) > 0 then
      for ip = 0 to len(project.import_paths) - 1
        import_path = project.import_paths[ip]
        if typeof(import_path) != "string" or import_path == "" then continue end if
        resolved_import_path = _join_path(project.root, import_path)
        if fs.exists(resolved_import_path) == false then
          items = items + [DiagnosticItem("warning", "Import path not found: " + import_path, resolved_import_path, 1, 1)]
        end if
      end for
    end if
  end if

  idx = void
  if typeof(snapshot) == "struct" then idx = snapshot.project_index end if
  if typeof(idx) != "struct" or typeof(idx.unresolved_imports) != "array" then return items end if

  if len(idx.unresolved_imports) > 0 then
    for i = 0 to len(idx.unresolved_imports) - 1
      imp = idx.unresolved_imports[i]
      if typeof(imp) != "struct" then continue end if
      msg = "Unresolved import: " + imp.target
      items = items + [DiagnosticItem("warning", msg, imp.file, imp.line + 1, 1)]
    end for
  end if

  if typeof(idx.imports) == "array" and len(idx.imports) > 0 then
    seen_aliases = []
    for i = 0 to len(idx.imports) - 1
      imp = idx.imports[i]
      if typeof(imp) != "struct" then continue end if
      if typeof(imp.alias) != "string" or imp.alias == "" then continue end if
      alias_key = s.toLowerAscii(imp.file + "|" + imp.alias)
      if _has_text(seen_aliases, alias_key) then
        msg_alias = "Duplicate import alias: " + imp.alias
        items = items + [DiagnosticItem("warning", msg_alias, imp.file, imp.line + 1, 1)]
      else
        seen_aliases = seen_aliases + [alias_key]
      end if
    end for
  end if

  return items
end function

/// Return compact workspace-health lines for dashboards and status panels.
/// @param snapshot snapshot value consumed by this operation.
function workspace_health_lines(snapshot)
  if typeof(snapshot) != "struct" or typeof(snapshot.project_index) != "struct" then return ["Project index unavailable."] end if
  idx = snapshot.project_index
  file_count = 0
  symbol_count = 0
  import_count = 0
  unresolved_count = 0
  if typeof(idx.files) == "array" then file_count = len(idx.files) end if
  if typeof(idx.symbols) == "array" then symbol_count = len(idx.symbols) end if
  if typeof(idx.imports) == "array" then import_count = len(idx.imports) end if
  if typeof(idx.unresolved_imports) == "array" then unresolved_count = len(idx.unresolved_imports) end if
  test_count = len(test_items(snapshot, 1000))
  inspections = code_inspection_items(snapshot, 1000)
  diagnostics_items = diagnostics(snapshot)
  inspection_count = len(inspections)
  diagnostic_count = len(diagnostics_items)
  error_count = 0
  warning_count = 0
  info_count = 0
  if typeof(diagnostics_items) == "array" and len(diagnostics_items) > 0 then
    for di = 0 to len(diagnostics_items) - 1
      item = diagnostics_items[di]
      if typeof(item) != "struct" then continue end if
      if item.kind == "error" then error_count = error_count + 1 end if
      if item.kind == "warning" then warning_count = warning_count + 1 end if
      if item.kind == "info" then info_count = info_count + 1 end if
    end for
  end if
  if typeof(inspections) == "array" and len(inspections) > 0 then
    for ii = 0 to len(inspections) - 1
      item = inspections[ii]
      if typeof(item) != "struct" then continue end if
      if item.severity == "error" then error_count = error_count + 1 end if
      if item.severity == "warning" then warning_count = warning_count + 1 end if
      if item.severity == "info" then info_count = info_count + 1 end if
    end for
  end if
  health_status = "Clean"
  if info_count > 0 then health_status = "Info" end if
  if warning_count > 0 then health_status = "Warnings" end if
  if error_count > 0 then health_status = "Errors" end if
  return [
    "Status: " + health_status,
    "Files: " + file_count,
    "Symbols: " + symbol_count,
    "Imports: " + import_count,
    "Unresolved imports: " + unresolved_count,
    "Tests: " + test_count,
    "Inspections: " + inspection_count,
    "Diagnostics: " + diagnostic_count,
    "Errors: " + error_count,
    "Warnings: " + warning_count,
    "Info: " + info_count,
  ]
end function

/// Return TODO and FIXME comments across indexed source files.
/// @param snapshot snapshot value consumed by this operation.
/// @param limit limit value consumed by this operation.
function todo_items(snapshot, limit)
  items = []
  if typeof(limit) != "int" or limit <= 0 then limit = 200 end if

  idx = void
  if typeof(snapshot) == "struct" then idx = snapshot.project_index end if
  if typeof(idx) != "struct" or typeof(idx.files) != "array" then return items end if

  for fi = 0 to len(idx.files) - 1
    file_info = idx.files[fi]
    if typeof(file_info) != "struct" then continue end if
    text = fs.readAllText(file_info.path)
    if typeof(text) != "string" then continue end if
    lines = s.split(s.replaceAll(text, "\r\n", "\n"), "\n")
    if typeof(lines) != "array" then continue end if
    for li = 0 to len(lines) - 1
      raw = lines[li]
      lower = s.toLowerAscii(raw)
      kind = ""
      if s.indexOf(lower, "todo", 0) >= 0 then kind = "TODO" end if
      if kind == "" and s.indexOf(lower, "fixme", 0) >= 0 then kind = "FIXME" end if
      if kind == "" then continue end if
      items = items + [TodoItem(kind, file_info.path, li + 1, s.trim(raw))]
      if len(items) >= limit then return items end if
    end for
  end for

  return items
end function

/// Return true when the path is absolute on Windows.
/// @param path Path of the file or directory used by the operation.
function _is_abs_path(path)
  if typeof(path) != "string" then return false end if
  if len(path) > 2 and path[1] == ":" then return true end if
  if s.startsWith(path, "\\") or s.startsWith(path, "/") then return true end if
  return false
end function

/// Join a project root and relative path.
/// @param root root value consumed by this operation.
/// @param path Path of the file or directory used by the operation.
function _join_path(root, path)
  if typeof(root) != "string" or root == "" then return path end if
  if typeof(path) != "string" or path == "" then return root end if
  if _is_abs_path(path) then return path end if
  last = root[len(root) - 1]
  if last == "\\" or last == "/" then return root + path end if
  return root + "\\" + path
end function

/// Return a lower-case file stem without extension.
/// @param path Path of the file or directory used by the operation.
function _file_stem(path)
  if typeof(path) != "string" or path == "" then return "" end if
  start = 0
  i = len(path) - 1
  while i >= 0
    ch = path[i]
    if ch == "\\" or ch == "/" then
      start = i + 1
      break
    end if
    i = i - 1
  end while
  name = s.substr(path, start, len(path) - start)
  dot = len(name) - 1
  while dot >= 0
    if name[dot] == "." then return s.toLowerAscii(s.substr(name, 0, dot)) end if
    dot = dot - 1
  end while
  return s.toLowerAscii(name)
end function

/// Return true when a test item is already present.
/// @param items Items consumed or updated by the operation.
/// @param name Name of the affected item.
/// @param file file value consumed by this operation.
/// @param line line value consumed by this operation.
function _has_test_item(items, name, file, line)
  if typeof(items) != "array" then return false end if
  if len(items) <= 0 then return false end if
  for i = 0 to len(items) - 1
    item = items[i]
    if typeof(item) == "struct" and item.name == name and item.file == file and item.line == line then return true end if
  end for
  return false
end function

/// Add a test item once.
/// @param items Items consumed or updated by the operation.
/// @param name Name of the affected item.
/// @param kind kind value consumed by this operation.
/// @param file file value consumed by this operation.
/// @param line line value consumed by this operation.
/// @param status status value consumed by this operation.
function _add_test_item(items, name, kind, file, line, status)
  if typeof(name) != "string" or name == "" then return items end if
  if typeof(file) != "string" then file = "" end if
  if typeof(line) != "int" or line <= 0 then line = 1 end if
  if _has_test_item(items, name, file, line) then return items end if
  return items + [TestItem(name, kind, file, line, status)]
end function

/// Return true when a file path should be treated as test-related.
/// @param path Path of the file or directory used by the operation.
function _is_test_path(path)
  if typeof(path) != "string" then return false end if
  lower = s.toLowerAscii(path)
  return s.indexOf(lower, "\\tests\\", 0) >= 0 or s.indexOf(lower, "/tests/", 0) >= 0 or s.endsWith(lower, "_test.ml") or s.endsWith(lower, "\\test.ml")
end function

/// Return true when a symbol name looks like a test.
/// @param name Name of the affected item.
function _is_test_symbol(name)
  if typeof(name) != "string" then return false end if
  lower = s.toLowerAscii(name)
  return s.startsWith(lower, "test") or s.indexOf(lower, "_test", 0) >= 0
end function

/// Return test entry and test-like functions for a project snapshot.
/// @param snapshot snapshot value consumed by this operation.
/// @param limit limit value consumed by this operation.
function test_items(snapshot, limit)
  items = []
  if typeof(limit) != "int" or limit <= 0 then limit = 200 end if
  project = void
  idx = void
  if typeof(snapshot) == "struct" then
    project = snapshot.project
    idx = snapshot.project_index
  end if

  if typeof(project) == "struct" then
    test_entry = project.test_entry
    test_file = _join_path(project.root, test_entry)
    status = "configured"
    if fs.exists(test_file) == false then status = "missing" end if
    items = _add_test_item(items, "Test Entry", "entry", test_file, 1, status)
  end if

  if typeof(idx) != "struct" or typeof(idx.symbols) != "array" then return items end if
  for si = 0 to len(idx.symbols) - 1
    sym = idx.symbols[si]
    if typeof(sym) != "struct" then continue end if
    if sym.kind != "function" and sym.kind != "method" then continue end if
    if _is_test_path(sym.file) == false and _is_test_symbol(sym.name) == false then continue end if
    items = _add_test_item(items, sym.name, sym.kind, sym.file, sym.line + 1, "discovered")
    if len(items) >= limit then return items end if
  end for

  return items
end function

/// Return tests related to the requested source file through imports.
/// @param snapshot snapshot value consumed by this operation.
/// @param current_file current_file value consumed by this operation.
/// @param limit limit value consumed by this operation.
function related_test_items(snapshot, current_file, limit)
  items = []
  if typeof(limit) != "int" or limit <= 0 then limit = 200 end if
  if typeof(current_file) != "string" or current_file == "" then return items end if

  idx = void
  if typeof(snapshot) == "struct" then idx = snapshot.project_index end if
  if typeof(idx) != "struct" then return items end if

  current_key = s.toLowerAscii(current_file)
  current_stem = _file_stem(current_file)
  if typeof(idx.imports) == "array" then
    for ii = 0 to len(idx.imports) - 1
      imp = idx.imports[ii]
      if typeof(imp) != "struct" then continue end if
      if imp.resolved == false then continue end if
      if s.toLowerAscii(imp.resolved_path) != current_key then continue end if
      if _is_test_path(imp.file) == false then continue end if
      items = _add_test_item(items, imp.file, "file", imp.file, 1, "related")
    end for
  end if

  if current_stem != "" and typeof(idx.files) == "array" then
    for fi = 0 to len(idx.files) - 1
      file_info = idx.files[fi]
      if typeof(file_info) != "struct" then continue end if
      if _is_test_path(file_info.path) == false then continue end if
      test_stem = _file_stem(file_info.path)
      if test_stem != current_stem + "_test" and test_stem != "test_" + current_stem then continue end if
      items = _add_test_item(items, file_info.path, "file", file_info.path, 1, "related")
      if len(items) >= limit then return items end if
    end for
  end if

  if typeof(idx.symbols) == "array" and len(items) > 0 then
    for si = 0 to len(idx.symbols) - 1
      sym = idx.symbols[si]
      if typeof(sym) != "struct" then continue end if
      if sym.kind != "function" and sym.kind != "method" then continue end if
      if _is_test_symbol(sym.name) == false then continue end if
      for ti = 0 to len(items) - 1
        test_file = items[ti].file
        if s.toLowerAscii(sym.file) == s.toLowerAscii(test_file) then
          items = _add_test_item(items, sym.name, sym.kind, sym.file, sym.line + 1, "related")
          if len(items) >= limit then return items end if
        end if
      end for
    end for
  end if

  return items
end function

/// Return the first related test file for the requested source file.
/// @param snapshot snapshot value consumed by this operation.
/// @param current_file current_file value consumed by this operation.
function related_test_file(snapshot, current_file)
  items = related_test_items(snapshot, current_file, 50)
  if typeof(items) != "array" or len(items) <= 0 then return "" end if
  for i = 0 to len(items) - 1
    item = items[i]
    if typeof(item) != "struct" then continue end if
    if item.kind == "file" and typeof(item.file) == "string" and item.file != "" then return item.file end if
  end for
  for i = 0 to len(items) - 1
    item = items[i]
    if typeof(item) != "struct" then continue end if
    if typeof(item.file) == "string" and item.file != "" then return item.file end if
  end for
  return ""
end function

/// Return lexical references for a symbol-like word.
/// @param snapshot snapshot value consumed by this operation.
/// @param word word value consumed by this operation.
/// @param limit limit value consumed by this operation.
function references(snapshot, word, limit)
  refs = []
  if typeof(word) != "string" or word == "" then return refs end if
  if typeof(limit) != "int" or limit <= 0 then limit = 100 end if

  idx = void
  if typeof(snapshot) == "struct" then idx = snapshot.project_index end if
  if typeof(idx) != "struct" or typeof(idx.files) != "array" then return refs end if

  for fi = 0 to len(idx.files) - 1
    file_info = idx.files[fi]
    if typeof(file_info) != "struct" then continue end if
    text = fs.readAllText(file_info.path)
    if typeof(text) != "string" then continue end if
    lines = s.split(s.replaceAll(text, "\r\n", "\n"), "\n")
    if typeof(lines) != "array" then continue end if
    for li = 0 to len(lines) - 1
      raw = lines[li]
      searchable = _strip_line_comment(raw)
      pos = _find_word(searchable, word, 0)
      while pos >= 0
        refs = refs + [ReferenceItem(file_info.path, li + 1, pos + 1, s.trim(raw))]
        if len(refs) >= limit then return refs end if
        pos = _find_word(searchable, word, pos + len(word))
      end while
    end for
  end for

  return refs
end function

/// Return the references that would be affected by a symbol rename.
/// @param snapshot snapshot value consumed by this operation.
/// @param word word value consumed by this operation.
/// @param new_name new_name value consumed by this operation.
/// @param limit limit value consumed by this operation.
function rename_preview_items(snapshot, word, new_name, limit)
  items = []
  if typeof(word) != "string" or word == "" then return items end if
  if typeof(new_name) != "string" then return items end if
  new_name = s.trim(new_name)
  if _is_simple_identifier(new_name) == false then return items end if
  if word == new_name then return items end if
  refs = references(snapshot, word, limit)
  if typeof(refs) != "array" or len(refs) <= 0 then return items end if
  for i = 0 to len(refs) - 1
    ref = refs[i]
    if typeof(ref) != "struct" then continue end if
    items = items + [RenamePreviewItem(word, new_name, ref.file, ref.line, ref.col, ref.text)]
    if typeof(limit) == "int" and limit > 0 and len(items) >= limit then return items end if
  end for
  return items
end function

/// Return a line with whole-word replacements outside line comments.
/// @param line line value consumed by this operation.
/// @param word word value consumed by this operation.
/// @param new_name new_name value consumed by this operation.
function _replace_word_in_line(line, word, new_name)
  if typeof(line) != "string" then return ["", 0] end if
  if typeof(word) != "string" or word == "" then return [line, 0] end if
  if typeof(new_name) != "string" then return [line, 0] end if
  searchable = _strip_line_comment(line)
  result = ""
  cursor = 0
  count = 0
  pos = _find_word(searchable, word, 0)
  while pos >= 0
    if pos > cursor then result = result + s.substr(line, cursor, pos - cursor) end if
    result = result + new_name
    cursor = pos + len(word)
    count = count + 1
    pos = _find_word(searchable, word, cursor)
  end while
  if count <= 0 then return [line, 0] end if
  if cursor < len(line) then result = result + s.substr(line, cursor, len(line) - cursor) end if
  return [result, count]
end function

/// Return a source text with whole-word replacements outside line comments.
/// @param text Text consumed by the operation.
/// @param word word value consumed by this operation.
/// @param new_name new_name value consumed by this operation.
function _replace_word_in_text(text, word, new_name)
  if typeof(text) != "string" then return ["", 0] end if
  lines = s.split(s.replaceAll(text, "\r\n", "\n"), "\n")
  if typeof(lines) != "array" then return [text, 0] end if
  output = ""
  count = 0
  for li = 0 to len(lines) - 1
    replaced = _replace_word_in_line(lines[li], word, new_name)
    line = replaced[0]
    count = count + replaced[1]
    if li > 0 then output = output + "\n" end if
    output = output + line
  end for
  return [output, count]
end function

/// Apply a project-wide symbol rename to source files.
/// @param snapshot snapshot value consumed by this operation.
/// @param word word value consumed by this operation.
/// @param new_name new_name value consumed by this operation.
/// @param limit limit value consumed by this operation.
function apply_rename(snapshot, word, new_name, limit)
  if typeof(limit) != "int" or limit <= 0 then limit = 1000 end if
  if typeof(word) != "string" or word == "" then return RenameApplyResult(false, 0, [], ["Missing symbol name"]) end if
  if typeof(new_name) != "string" then return RenameApplyResult(false, 0, [], ["Missing new name"]) end if
  new_name = s.trim(new_name)
  if _is_simple_identifier(new_name) == false then return RenameApplyResult(false, 0, [], ["Invalid new name: " + new_name]) end if
  if word == new_name then return RenameApplyResult(false, 0, [], ["Name is unchanged"]) end if

  refs = references(snapshot, word, limit + 1)
  if typeof(refs) != "array" or len(refs) <= 0 then return RenameApplyResult(false, 0, [], ["No rename targets found"]) end if
  if len(refs) > limit then return RenameApplyResult(false, 0, [], ["Too many rename targets"]) end if

  idx = void
  if typeof(snapshot) == "struct" then idx = snapshot.project_index end if
  if typeof(idx) != "struct" or typeof(idx.files) != "array" then return RenameApplyResult(false, 0, [], ["Project index unavailable"]) end if

  files = []
  texts = []
  replacements = 0
  errors = []
  for fi = 0 to len(idx.files) - 1
    file_info = idx.files[fi]
    if typeof(file_info) != "struct" then continue end if
    text = fs.readAllText(file_info.path)
    if typeof(text) != "string" then continue end if
    changed = _replace_word_in_text(text, word, new_name)
    if changed[1] <= 0 then continue end if
    files = files + [file_info.path]
    texts = texts + [changed[0]]
    replacements = replacements + changed[1]
  end for

  if replacements <= 0 then return RenameApplyResult(false, 0, [], ["No rename targets found"]) end if
  for wi = 0 to len(files) - 1
    wr = fs.writeAllText(files[wi], texts[wi])
    if typeof(wr) == "error" then errors = errors + [files[wi] + ": " + wr.message] end if
  end for
  if len(errors) > 0 then return RenameApplyResult(false, replacements, files, errors) end if
  return RenameApplyResult(true, replacements, files, [])
end function

/// Return a simple call hierarchy for a symbol-like word.
/// @param snapshot snapshot value consumed by this operation.
/// @param word word value consumed by this operation.
/// @param limit limit value consumed by this operation.
function call_hierarchy_items(snapshot, word, limit)
  items = []
  if typeof(word) != "string" or word == "" then return items end if
  refs = references(snapshot, word, limit)
  if typeof(refs) != "array" or len(refs) <= 0 then return items end if
  for i = 0 to len(refs) - 1
    ref = refs[i]
    if typeof(ref) != "struct" then continue end if
    kind = "reference"
    trimmed = s.trim(ref.text)
    if s.startsWith(trimmed, "function " + word) then kind = "definition" end if
    items = items + [CallHierarchyItem(word, kind, ref.file, ref.line, ref.col, ref.text)]
    if typeof(limit) == "int" and limit > 0 and len(items) >= limit then return items end if
  end for
  return items
end function

/// Return true when an import alias is used in a source line.
/// @param line line value consumed by this operation.
/// @param alias alias value consumed by this operation.
function _line_uses_import_alias(line, alias)
  if typeof(line) != "string" or typeof(alias) != "string" or alias == "" then return false end if
  pos = s.indexOf(line, alias, 0)
  while pos >= 0
    before_ok = true
    after_ok = true
    if pos > 0 and _is_word_char(line[pos - 1]) then before_ok = false end if
    after = pos + len(alias)
    if after < len(line) then
      ch = line[after]
      if ch != "." and _is_word_char(ch) then after_ok = false end if
    end if
    if before_ok and after_ok then return true end if
    pos = s.indexOf(line, alias, pos + 1)
  end while
  return false
end function

/// Return true when an import alias is used outside import declarations.
/// @param file file value consumed by this operation.
/// @param alias alias value consumed by this operation.
/// @param import_line import_line value consumed by this operation.
function _import_alias_used(file, alias, import_line)
  if typeof(file) != "string" or typeof(alias) != "string" or alias == "" then return false end if
  text = fs.readAllText(file)
  if typeof(text) != "string" then return false end if
  lines = s.split(s.replaceAll(text, "\r\n", "\n"), "\n")
  if typeof(lines) != "array" then return false end if

  for li = 0 to len(lines) - 1
    if typeof(import_line) == "int" and li == import_line then continue end if
    line = s.trim(_strip_line_comment(lines[li]))
    if line == "" then continue end if
    if s.startsWith(line, "import ") then continue end if
    if _line_uses_import_alias(line, alias) then return true end if
  end for
  return false
end function

/// Return declaration-like symbols from a source file for inspections.
/// @param file file value consumed by this operation.
function _declarations_for_file(file)
  items = []
  if typeof(file) != "string" or file == "" then return items end if
  text = fs.readAllText(file)
  if typeof(text) != "string" then return items end if
  lines = s.split(s.replaceAll(text, "\r\n", "\n"), "\n")
  if typeof(lines) != "array" then return items end if
  if len(lines) <= 0 then return items end if

  current_struct = ""
  for li = 0 to len(lines) - 1
    raw = lines[li]
    clean = s.trim(_strip_line_comment(raw))
    if clean == "" then continue end if

    if s.startsWith(clean, "end struct") then
      current_struct = ""
      continue
    end if

    if s.startsWith(clean, "struct ") then
      name_struct = _take_word(clean, len("struct "))
      if name_struct != "" then
        current_struct = name_struct
        items = items + [DeclarationItem(name_struct, "struct", file, li + 1, _declaration_col(raw, name_struct))]
      end if
      continue
    end if

    if s.startsWith(clean, "enum ") then
      name_enum = _take_word(clean, len("enum "))
      if name_enum != "" then items = items + [DeclarationItem(name_enum, "enum", file, li + 1, _declaration_col(raw, name_enum))] end if
      continue
    end if

    fn_pos = s.indexOf(clean, "function ", 0)
    if fn_pos >= 0 then
      name_fn = _take_word(clean, fn_pos + len("function "))
      if name_fn != "" then
        decl_name = name_fn
        decl_kind = "function"
        if current_struct != "" and s.indexOf(name_fn, ".", 0) < 0 then
          decl_name = current_struct + "." + name_fn
          decl_kind = "method"
        end if
        items = items + [DeclarationItem(decl_name, decl_kind, file, li + 1, _declaration_col(raw, name_fn))]
      end if
      continue
    end if

    if s.startsWith(clean, "const ") then
      name_const = _take_word(clean, len("const "))
      if name_const != "" then items = items + [DeclarationItem(name_const, "const", file, li + 1, _declaration_col(raw, name_const))] end if
      continue
    end if
  end for

  return items
end function

/// Return true when a declaration name has already been seen.
/// @param items Items consumed or updated by the operation.
/// @param name Name of the affected item.
function _has_declaration_name(items, name)
  if typeof(items) != "array" or typeof(name) != "string" or name == "" then return false end if
  if len(items) <= 0 then return false end if
  for i = 0 to len(items) - 1
    item = items[i]
    if typeof(item) == "struct" and item.name == name then return true end if
  end for
  return false
end function

/// Add duplicate-declaration inspection findings.
/// @param items Items consumed or updated by the operation.
/// @param idx idx value consumed by this operation.
/// @param limit limit value consumed by this operation.
function _add_duplicate_declaration_inspections(items, idx, limit)
  seen = []
  if typeof(idx) != "struct" or typeof(idx.files) != "array" then return items end if
  if len(idx.files) <= 0 then return items end if

  for fi = 0 to len(idx.files) - 1
    file_info = idx.files[fi]
    if typeof(file_info) != "struct" then continue end if
    declarations = _declarations_for_file(file_info.path)
    if typeof(declarations) != "array" then continue end if
    if len(declarations) <= 0 then continue end if
    for di = 0 to len(declarations) - 1
      decl = declarations[di]
      if typeof(decl) != "struct" then continue end if
      if _has_declaration_name(seen, decl.name) then
        msg_duplicate = "Duplicate " + decl.kind + ": " + decl.name
        items = items + [InspectionItem("warning", msg_duplicate, decl.file, decl.line, decl.col)]
        if len(items) >= limit then return items end if
      else
        seen = seen + [decl]
      end if
    end for
  end for

  return items
end function

/// Return lightweight code-inspection findings.
/// @param snapshot snapshot value consumed by this operation.
/// @param limit limit value consumed by this operation.
function code_inspection_items(snapshot, limit)
  items = []
  if typeof(limit) != "int" or limit <= 0 then limit = 200 end if
  idx = void
  if typeof(snapshot) == "struct" then idx = snapshot.project_index end if
  if typeof(idx) != "struct" then return items end if

  items = _add_duplicate_declaration_inspections(items, idx, limit)
  if len(items) >= limit then return items end if

  if typeof(idx.imports) == "array" then
    for ii = 0 to len(idx.imports) - 1
      imp = idx.imports[ii]
      if typeof(imp) != "struct" then continue end if
      if imp.resolved == false then continue end if
      if typeof(imp.alias) != "string" or imp.alias == "" then continue end if
      if _import_alias_used(imp.file, imp.alias, imp.line) then continue end if
      msg_import = "Unused import alias: " + imp.alias
      items = items + [InspectionItem("info", msg_import, imp.file, imp.line + 1, 1)]
      if len(items) >= limit then return items end if
    end for
  end if

  if typeof(idx.symbols) != "array" then return items end if

  for si = 0 to len(idx.symbols) - 1
    sym = idx.symbols[si]
    if typeof(sym) != "struct" then continue end if
    if sym.kind != "function" and sym.kind != "method" and sym.kind != "const" and sym.kind != "struct" and sym.kind != "enum" then continue end if
    if sym.name == "main" or _is_test_symbol(sym.name) then continue end if
    refs = references(snapshot, sym.name, 2)
    ref_count = 0
    if typeof(refs) == "array" then ref_count = len(refs) end if
    if ref_count <= 1 then
      msg = "Possibly unused " + sym.kind + ": " + sym.name
      items = items + [InspectionItem("info", msg, sym.file, sym.line + 1, 1)]
      if len(items) >= limit then return items end if
    end if
  end for

  return items
end function
