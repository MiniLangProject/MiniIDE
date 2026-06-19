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

import std.string as s
import std.fs as fs
import "ui/markdown.ml" as markdown

struct DummyMarkdownState
  open_files,
  open_markdown_sources,
  open_markdown_docs,
  active_tab,
end struct

// Return true when text contains a substring.
function _contains(text, needle)
  return s.indexOf(text, needle, 0) >= 0
end function

// Print a failed assertion and return false.
function _assert_true(name, condition)
  if condition then return true end if
  print "FAIL: " + name
  return false
end function

// Build a UTF-8 string from hex bytes while keeping this source file ASCII.
function _hex_string(hex_text)
  raw = fromHex(hex_text)
  if typeof(raw) != "bytes" then return "" end if
  text = decode(raw, "utf-8")
  if typeof(text) != "string" then return "" end if
  return text
end function

// Return true when a rendered Markdown document has a span kind.
function _has_span(doc, kind)
  if typeof(doc) != "struct" or typeof(doc.spans) != "array" then return false end if
  for i = 0 to len(doc.spans) - 1
    span = doc.spans[i]
    if typeof(span) == "struct" and span.kind == kind then return true end if
  end for
  return false
end function

// Return the number of links in a rendered Markdown document.
function _link_count(doc)
  if typeof(doc) != "struct" or typeof(doc.links) != "array" then return 0 end if
  return len(doc.links)
end function

// Return the first link target from a rendered Markdown document.
function _first_link_target(doc)
  if typeof(doc) != "struct" or typeof(doc.links) != "array" or len(doc.links) <= 0 then return "" end if
  link = doc.links[0]
  if typeof(link) != "struct" then return "" end if
  return link.link_target
end function

// Return true when clearing the cache keeps a non-void document sentinel.
function _cache_clear_keeps_struct_doc()
  st = DummyMarkdownState(["miniide://MiniLang Language Reference.md"], ["cached"], [markdown.render("# Cached")], 0)
  st = markdown.clear_cache(st, 0)
  if typeof(st.open_markdown_docs) != "array" or len(st.open_markdown_docs) <= 0 then return false end if
  return typeof(st.open_markdown_docs[0]) == "struct"
end function

// Run focused Markdown renderer regression checks.
function main(args)
  source = s.repeat("word ", 23) + "**bold and *em*** plus [**link**](#target) and `code`."
  doc = markdown.render(source)

  ok = true
  if _assert_true("raw strong marker removed", _contains(doc.text, "**") == false) == false then ok = false end if
  if _assert_true("raw emphasis marker removed", _contains(doc.text, "*em*") == false) == false then ok = false end if
  if _assert_true("raw link marker removed", _contains(doc.text, "[**link**]") == false) == false then ok = false end if
  if _assert_true("rendered text preserved", _contains(doc.text, "bold and em plus link and code") == true) == false then ok = false end if
  if _assert_true("strong span exists", _has_span(doc, "strong")) == false then ok = false end if
  if _assert_true("emphasis span exists", _has_span(doc, "em")) == false then ok = false end if
  if _assert_true("link span exists", _has_span(doc, "link")) == false then ok = false end if
  if _assert_true("inline code span exists", _has_span(doc, "inline_code")) == false then ok = false end if
  if _assert_true("link target preserved", _link_count(doc) == 1 and _first_link_target(doc) == "#target") == false then ok = false end if
  if _assert_true("markdown cache clear avoids void index assignment", _cache_clear_keeps_struct_doc()) == false then ok = false end if

  mojibake = _hex_string("C3 A2 E2 82 AC E2 84 A2")
  unicode_source = "Before " + mojibake + " **strong** after."
  unicode_doc = markdown.render(unicode_source)
  if _assert_true("mojibake apostrophe normalized", _contains(unicode_doc.text, "Before ' strong after.") == true) == false then ok = false end if
  if _assert_true("mojibake removed from rendered text", _contains(unicode_doc.text, mojibake) == false) == false then ok = false end if
  if _assert_true("strong span survives mojibake normalization", _has_span(unicode_doc, "strong")) == false then ok = false end if

  readme = fs.readAllText("MiniLangCompilerML\\README.md")
  if _assert_true("language reference readable", typeof(readme) == "string") == false then ok = false end if
  if typeof(readme) == "string" then
    readme_doc = markdown.render(readme)
    if _assert_true("language reference apostrophe fixed", _contains(readme_doc.text, "can't grow further") == true) == false then ok = false end if
    if _assert_true("language reference mojibake hidden", _contains(readme_doc.text, "â") == false) == false then ok = false end if
    if _assert_true("language reference heap section rendered", _contains(readme_doc.text, "heap_count()") == true) == false then ok = false end if
  end if

  if ok then
    print "Markdown renderer tests OK"
    return 0
  end if
  return 1
end function
