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

package lang.service

// Thin language-service facade for editor features.

import std.string as s
import std.fs as fs
import "lang/index.ml" as lang_index
import "lang/syntax.ml" as syntax

struct ReferenceItem
  file,
  line,
  col,
  text,
end struct

struct RenamePreviewItem
  old_name,
  new_name,
  file,
  line,
  col,
  text,
end struct

struct RenameApplyResult
  ok,
  replacements,
  files,
  errors,
end struct

struct CallHierarchyItem
  name,
  kind,
  file,
  line,
  col,
  text,
end struct

struct DiagnosticItem
  kind,
  message,
  file,
  line,
  col,
end struct

struct InspectionItem
  severity,
  message,
  file,
  line,
  col,
end struct

struct CompletionItem
  label,
  insert_text,
  kind,
  file,
  line,
end struct

struct SymbolItem
  name,
  kind,
  file,
  line,
end struct

struct SymbolInfoItem
  name,
  kind,
  file,
  line,
  reference_count,
end struct

struct FileItem
  path,
  relative_path,
  line_count,
end struct

struct ImportItem
  source_file,
  line,
  target,
  alias,
  resolved_path,
  resolved,
end struct

struct TodoItem
  kind,
  file,
  line,
  text,
end struct

struct TestItem
  name,
  kind,
  file,
  line,
  status,
end struct

struct LanguageSnapshot
  project,
  project_index,
end struct

// Return true when a character belongs to an identifier-like word.
function _is_word_char(ch)
  if typeof(ch) != "string" or ch == "" then return false end if
  if ch == "_" or ch == "." then return true end if
  b = bytes(ch)
  if len(b) <= 0 then return false end if
  c = b[0]
  return (c >= 65 and c <= 90) or (c >= 97 and c <= 122) or (c >= 48 and c <= 57)
end function

// Return true when a character can start a simple identifier.
function _is_identifier_start(ch)
  if typeof(ch) != "string" or ch == "" then return false end if
  if ch == "_" then return true end if
  b = bytes(ch)
  if len(b) <= 0 then return false end if
  c = b[0]
  return (c >= 65 and c <= 90) or (c >= 97 and c <= 122)
end function

// Return true when a character can continue a simple identifier.
function _is_identifier_char(ch)
  if _is_identifier_start(ch) then return true end if
  b = bytes(ch)
  if len(b) <= 0 then return false end if
  c = b[0]
  return c >= 48 and c <= 57
end function

// Return true when the requested rename target is a simple MiniLang identifier.
function _is_simple_identifier(name)
  if typeof(name) != "string" or name == "" then return false end if
  if _is_identifier_start(name[0]) == false then return false end if
  for i = 1 to len(name) - 1
    if _is_identifier_char(name[i]) == false then return false end if
  end for
  return true
end function

// Strip a simple line comment before lexical searches.
function _strip_line_comment(line)
  if typeof(line) != "string" then return "" end if
  pos = s.indexOf(line, "//", 0)
  if pos < 0 then return line end if
  return s.substr(line, 0, pos)
end function

// Find the next whole-word occurrence in a line.
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

// Analyze a project and return the reusable language snapshot.
function analyze_project(project)
  return LanguageSnapshot(project, lang_index.build_project_index(project))
end function

// Return true when the completion item already exists.
function _has_completion(items, label)
  if typeof(items) != "array" then return false end if
  if len(items) <= 0 then return false end if
  for i = 0 to len(items) - 1
    item = items[i]
    if typeof(item) == "struct" and item.label == label then return true end if
  end for
  return false
end function

// Return true when a label matches the requested prefix.
function _matches_prefix(label, prefix)
  if typeof(label) != "string" or label == "" then return false end if
  if typeof(prefix) != "string" or prefix == "" then return true end if
  return s.startsWith(s.toLowerAscii(label), s.toLowerAscii(prefix))
end function

// Return compact lower-case text for fuzzy matching.
function _compact_query_text(value)
  if typeof(value) != "string" then return "" end if
  value = s.toLowerAscii(value)
  compacted = ""
  for i = 0 to len(value) - 1
    if _is_identifier_char(value[i]) then compacted = compacted + value[i] end if
  end for
  return compacted
end function

// Return true when needle appears as an ordered compact subsequence.
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

// Return a match score for ranked project navigation.
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

// Add a completion item.
function _add_completion(items, label, insert_text, kind, file, line, prefix, limit)
  if len(items) >= limit then return items end if
  if _query_score(label, prefix) <= 0 then return items end if
  if _has_completion(items, label) then return items end if
  return items + [CompletionItem(label, insert_text, kind, file, line)]
end function

// Return rich completion items from a snapshot.
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

// Return labels for the existing MiniIDE completion popup.
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

// Return project symbols from a snapshot.
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

// Return symbol details for an exact symbol name.
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

// Return project files from a snapshot.
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

// Return project import edges from a snapshot.
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

// Return project-analysis diagnostics.
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

  return items
end function

// Return compact workspace-health lines for dashboards and status panels.
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
  diagnostic_count = len(diagnostics(snapshot))
  return [
    "Files: " + file_count,
    "Symbols: " + symbol_count,
    "Imports: " + import_count,
    "Unresolved imports: " + unresolved_count,
    "Diagnostics: " + diagnostic_count,
  ]
end function

// Return TODO and FIXME comments across indexed source files.
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

// Return true when the path is absolute on Windows.
function _is_abs_path(path)
  if typeof(path) != "string" then return false end if
  if len(path) > 2 and path[1] == ":" then return true end if
  if s.startsWith(path, "\\") or s.startsWith(path, "/") then return true end if
  return false
end function

// Join a project root and relative path.
function _join_path(root, path)
  if typeof(root) != "string" or root == "" then return path end if
  if typeof(path) != "string" or path == "" then return root end if
  if _is_abs_path(path) then return path end if
  last = root[len(root) - 1]
  if last == "\\" or last == "/" then return root + path end if
  return root + "\\" + path
end function

// Return a lower-case file stem without extension.
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

// Return true when a test item is already present.
function _has_test_item(items, name, file, line)
  if typeof(items) != "array" then return false end if
  if len(items) <= 0 then return false end if
  for i = 0 to len(items) - 1
    item = items[i]
    if typeof(item) == "struct" and item.name == name and item.file == file and item.line == line then return true end if
  end for
  return false
end function

// Add a test item once.
function _add_test_item(items, name, kind, file, line, status)
  if typeof(name) != "string" or name == "" then return items end if
  if typeof(file) != "string" then file = "" end if
  if typeof(line) != "int" or line <= 0 then line = 1 end if
  if _has_test_item(items, name, file, line) then return items end if
  return items + [TestItem(name, kind, file, line, status)]
end function

// Return true when a file path should be treated as test-related.
function _is_test_path(path)
  if typeof(path) != "string" then return false end if
  lower = s.toLowerAscii(path)
  return s.indexOf(lower, "\\tests\\", 0) >= 0 or s.indexOf(lower, "/tests/", 0) >= 0 or s.endsWith(lower, "_test.ml") or s.endsWith(lower, "\\test.ml")
end function

// Return true when a symbol name looks like a test.
function _is_test_symbol(name)
  if typeof(name) != "string" then return false end if
  lower = s.toLowerAscii(name)
  return s.startsWith(lower, "test") or s.indexOf(lower, "_test", 0) >= 0
end function

// Return test entry and test-like functions for a project snapshot.
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

// Return tests related to the requested source file through imports.
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

// Return the first related test file for the requested source file.
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

// Return lexical references for a symbol-like word.
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

// Return the references that would be affected by a symbol rename.
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

// Return a line with whole-word replacements outside line comments.
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

// Return a source text with whole-word replacements outside line comments.
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

// Apply a project-wide symbol rename to source files.
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

// Return a simple call hierarchy for a symbol-like word.
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

// Return true when an import alias is used in a source line.
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

// Return true when an import alias is used outside import declarations.
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

// Return lightweight code-inspection findings.
function code_inspection_items(snapshot, limit)
  items = []
  if typeof(limit) != "int" or limit <= 0 then limit = 200 end if
  idx = void
  if typeof(snapshot) == "struct" then idx = snapshot.project_index end if
  if typeof(idx) != "struct" then return items end if

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
