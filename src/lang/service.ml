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
import "lang/index.ml" as lang_index
import "lang/syntax.ml" as syntax

struct CompletionItem
  label,
  insert_text,
  kind,
  file,
  line,
end struct

struct LanguageSnapshot
  project_index,
end struct

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
