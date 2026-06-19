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

package lang.symbols

// Simple project symbol index and completion provider.

import std.fs as fs
import std.string as s
import lang.syntax as syntax

struct Symbol
  name,
  kind,
  file,
  line,
end struct

struct SymbolIndex
  symbols,
end struct

// Return true when a character belongs to an editor word.
function _is_word_char(ch)
  b = bytes(ch)
  if len(b) <= 0 then return false end if
  c = b[0]
  return (c >= 65 and c <= 90) or (c >= 97 and c <= 122) or (c >= 48 and c <= 57) or ch == "_" or ch == "."
end function

// Read word.
function _take_word(text, start)
  if typeof(text) != "string" then return "" end if
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

// Return true when symbol.
function _has_symbol(symbols, name)
  // Walk collections defensively because project data can be partially populated.
  if typeof(symbols) != "array" then return false end if
  if len(symbols) <= 0 then return false end if
  for i = 0 to len(symbols) - 1
    if typeof(symbols[i]) == "struct" and symbols[i].name == name then return true end if
  end for
  return false
end function

// Add symbol.
function _add_symbol(symbols, name, kind, file, line)
  if typeof(name) != "string" or name == "" then return symbols end if
  if _has_symbol(symbols, name) then return symbols end if
  return symbols + [Symbol(name, kind, file, line)]
end function

// Scan source.
function _scan_source(path, text, symbols)
  // Walk collections defensively because project data can be partially populated.
  if typeof(text) != "string" then return symbols end if
  lines = s.split(s.replaceAll(text, "\r\n", "\n"), "\n")
  if typeof(lines) != "array" then return symbols end if
  if len(lines) <= 0 then return symbols end if

  current_struct = ""
  for i = 0 to len(lines) - 1
    raw = lines[i]
    line = s.trim(raw)
    if line == "" or s.startsWith(line, "//") then continue end if

    if s.startsWith(line, "end struct") then
      current_struct = ""
      continue
    end if

    if s.startsWith(line, "package ") then
      nm_pkg = _take_word(line, len("package "))
      symbols = _add_symbol(symbols, nm_pkg, "package", path, i)
      continue
    end if

    if s.startsWith(line, "namespace ") then
      nm_ns = _take_word(line, len("namespace "))
      symbols = _add_symbol(symbols, nm_ns, "namespace", path, i)
      continue
    end if

    if s.startsWith(line, "struct ") then
      nm_struct = _take_word(line, len("struct "))
      current_struct = nm_struct
      symbols = _add_symbol(symbols, nm_struct, "struct", path, i)
      continue
    end if

    if s.startsWith(line, "enum ") then
      nm_enum = _take_word(line, len("enum "))
      symbols = _add_symbol(symbols, nm_enum, "enum", path, i)
      continue
    end if

    fn_pos = s.indexOf(line, "function ", 0)
    if fn_pos >= 0 then
      nm_fn = _take_word(line, fn_pos + len("function "))
      if current_struct != "" and s.indexOf(nm_fn, ".", 0) < 0 then
        symbols = _add_symbol(symbols, current_struct + "." + nm_fn, "method", path, i)
      end if
      symbols = _add_symbol(symbols, nm_fn, "function", path, i)
      continue
    end if

    if s.startsWith(line, "const ") then
      nm_const = _take_word(line, len("const "))
      symbols = _add_symbol(symbols, nm_const, "const", path, i)
      continue
    end if
  end for
  return symbols
end function

// Build index.
function build_index(project)
  // Walk collections defensively because project data can be partially populated.
  symbols = []
  files = []
  if typeof(project) == "struct" and typeof(project.files) == "array" then files = project.files end if

  if len(files) > 0 then
    for i = 0 to len(files) - 1
      f = files[i]
      if typeof(f) != "struct" or f.is_dir then continue end if
      if s.endsWith(s.toLowerAscii(f.path), ".ml") == false then continue end if
      text = fs.readAllText(f.path)
      if typeof(text) == "string" then
        symbols = _scan_source(f.path, text, symbols)
      end if
    end for
  end if
  return SymbolIndex(symbols)
end function

// Return true when a completion item is already present.
function _completion_has(items, name)
  // Walk collections defensively because project data can be partially populated.
  if typeof(items) != "array" then return false end if
  if len(items) <= 0 then return false end if
  for i = 0 to len(items) - 1
    if items[i] == name then return true end if
  end for
  return false
end function

// Add a completion item when it is not already present.
function _completion_add(items, name, prefix, limit)
  if typeof(name) != "string" or name == "" then return items end if
  if prefix != "" and s.startsWith(s.toLowerAscii(name), s.toLowerAscii(prefix)) == false then return items end if
  if _completion_has(items, name) then return items end if
  if len(items) >= limit then return items end if
  return items + [name]
end function

// Return completion items matching a word prefix.
function completions(index, prefix)
  // Walk collections defensively because project data can be partially populated.
  items = []
  kws = syntax.keywords()
  for i = 0 to len(kws) - 1
    items = _completion_add(items, kws[i], prefix, 12)
  end for

  if typeof(index) == "struct" and typeof(index.symbols) == "array" then
    if len(index.symbols) > 0 then
      for si = 0 to len(index.symbols) - 1
        sym = index.symbols[si]
        if typeof(sym) == "struct" then
          items = _completion_add(items, sym.name, prefix, 12)
        end if
      end for
    end if
  end if
  return items
end function
