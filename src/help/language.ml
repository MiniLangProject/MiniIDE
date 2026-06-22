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

package help.language

// MiniLang language-reference loading and search document generation.

import std.fs as fs
import std.string as s
import "project/project.ml" as project_model

// Return the reference path.
function reference_path(root, compiler_path)
  if typeof(root) != "string" or root == "" then root = "." end if
  p = project_model.path_join(root, "MiniLangCompilerML\\README.md")
  if fs.exists(p) == false then p = project_model.path_join(".", "MiniLangCompilerML\\README.md") end if
  if fs.exists(p) == false then p = project_model.path_join(root, "..\\MiniLangCompilerML\\README.md") end if
  if fs.exists(p) == false then p = project_model.path_join(root, "..\\..\\MiniLangCompilerML\\README.md") end if
  if fs.exists(p) == false and typeof(compiler_path) == "string" and compiler_path != "" then
    compiler_dir = project_model.dirname(compiler_path)
    p = project_model.path_join(compiler_dir, "..\\README.md")
  end if
  if fs.exists(p) then return p end if
  return ""
end function

// Read reference.
function read_reference(root, compiler_path)
  p = reference_path(root, compiler_path)
  if p == "" then return ["", "", "MiniLang language reference was not found."] end if
  content = fs.readAllText(p)
  if typeof(content) != "string" then return [p, "", "MiniLang language reference could not be read."] end if
  return [p, content, ""]
end function

// Extract the visible title from a Markdown heading line.
function _markdown_heading_title(line)
  if typeof(line) != "string" then return "" end if
  t = s.trim(line)
  if s.startsWith(t, "#") == false then return "" end if
  i = 0
  while i < len(t) and t[i] == "#"
    i = i + 1
  end while
  if i >= len(t) then return "" end if
  return s.trim(s.substr(t, i, len(t) - i))
end function

// Build a compact search-result snippet from one matched line.
function _snippet(line)
  text = s.trim(line)
  if len(text) > 140 then text = s.substr(text, 0, 140) + "..." end if
  return text
end function

// Search a Markdown document and return matching snippets.
function search_document(content, query)
  // Walk collections defensively because project data can be partially populated.
  if typeof(content) != "string" then content = "" end if
  query = s.trim(query)
  lines = s.split(s.replaceAll(content, "\r\n", "\n"), "\n")
  q = s.toLowerAscii(query)
  doc = "# MiniLang Help Search\n\n"
  doc = doc + "**Query:** `" + query + "`\n\n"
  section = "MiniLang"
  count = 0
  if typeof(lines) == "array" and len(lines) > 0 then
    for i = 0 to len(lines) - 1
      title = _markdown_heading_title(lines[i])
      if title != "" then section = title end if
      line_l = s.toLowerAscii(lines[i])
      if s.indexOf(line_l, q, 0) >= 0 then
        doc = doc + "## " + section + "\n\n"
        doc = doc + "- Line `" + (i + 1) + "`: " + _snippet(lines[i]) + "\n\n"
        count = count + 1
        if count >= 120 then break end if
      end if
    end for
  end if
  if count <= 0 then
    doc = doc + "No matches found.\n"
  else if count >= 120 then
    doc = doc + "_Showing the first 120 matches._\n"
  end if
  return doc
end function
