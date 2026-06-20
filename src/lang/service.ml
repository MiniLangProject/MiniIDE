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

struct DiagnosticItem
  kind,
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

struct LanguageSnapshot
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
  return LanguageSnapshot(lang_index.build_project_index(project))
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

// Add a completion item.
function _add_completion(items, label, insert_text, kind, file, line, prefix, limit)
  if len(items) >= limit then return items end if
  if _matches_prefix(label, prefix) == false then return items end if
  if _has_completion(items, label) then return items end if
  return items + [CompletionItem(label, insert_text, kind, file, line)]
end function

// Return rich completion items from a snapshot.
function completion_items(snapshot, prefix, limit)
  if typeof(limit) != "int" or limit <= 0 then limit = 24 end if
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
  items = []

  idx = void
  if typeof(snapshot) == "struct" then idx = snapshot.project_index end if
  if typeof(idx) != "struct" or typeof(idx.symbols) != "array" then return items end if

  for si = 0 to len(idx.symbols) - 1
    sym = idx.symbols[si]
    if typeof(sym) != "struct" then continue end if
    if _matches_prefix(sym.name, prefix) == false then continue end if
    items = items + [SymbolItem(sym.name, sym.kind, sym.file, sym.line)]
    if len(items) >= limit then return items end if
  end for

  return items
end function

// Return project-analysis diagnostics.
function diagnostics(snapshot)
  items = []
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
