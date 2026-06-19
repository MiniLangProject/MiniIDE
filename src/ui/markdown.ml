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

package ui.markdown

// Rendered Markdown tabs: parser, cache, styles, links, and anchor navigation.

import std.string as s
import "platform/win32.ml" as win
import "lang/syntax.ml" as syntax
import "ui/theme.ml" as theme

struct MarkdownSpan
  start_pos,
  end_pos,
  kind,
end struct

struct MarkdownLineStyle
  start_pos,
  end_pos,
  kind,
end struct

struct MarkdownLink
  start_pos,
  end_pos,
  link_target,
end struct

struct MarkdownAnchor
  name,
  start_pos,
end struct

struct MarkdownDocument
  text,
  spans,
  line_styles,
  links,
  anchors,
end struct

// Return an empty Markdown document used as a non-void cache sentinel.
function _empty_markdown_doc()
  return MarkdownDocument("", [], [], [], [])
end function

// Normalize editor text so RichEdit and MiniLang use the same line endings.
function _normalize_editor_text(text)
  if typeof(text) != "string" then return "" end if
  text = s.replaceAll(text, "\r\n", "\n")
  text = s.replaceAll(text, "\r", "\n")
  return text
end function

// Convert internal editor text to the display form expected by RichEdit.
function _editor_display_text(text)
  text = _normalize_editor_text(text)
  return s.replaceAll(text, "\n", "\r\n")
end function

// Return true when a path names a Markdown document.
function _is_markdown_path(path)
  if typeof(path) != "string" then return false end if
  lower = s.toLowerAscii(path)
  return s.endsWith(lower, ".md") or s.endsWith(lower, ".markdown")
end function

// Return true when the active tab displays Markdown content.
function _active_is_markdown(st)
  if st.active_tab < 0 or st.active_tab >= len(st.open_files) then return false end if
  return _is_markdown_path(st.open_files[st.active_tab])
end function

// Replace the result log text and refresh the log control.
function _set_log(st, text)
  if typeof(text) != "string" then text = "" end if
  win.set_window_text(st.log, _editor_display_text(text))
  win.edit_scroll_caret(st.log)
  return st
end function

// Remove carriage returns from editor or log text.
function _strip_cr(line)
  if typeof(line) != "string" then return "" end if
  if len(line) > 0 and line[len(line) - 1] == "\r" then
    return s.substr(line, 0, len(line) - 1)
  end if
  return line
end function

// Return true when a Markdown line starts or ends a fenced code block.
function _markdown_fence_line(line)
  t = s.trim(line)
  return s.startsWith(t, "```") or s.startsWith(t, "~~~")
end function

// Extract the language name from a Markdown fenced code block.
function _markdown_fence_language(line)
  t = s.trim(line)
  if len(t) <= 3 then return "" end if
  if s.startsWith(t, "```") or s.startsWith(t, "~~~") then
    return s.trim(s.substr(t, 3, len(t) - 3))
  end if
  return ""
end function

// Add a styled character span to a rendered Markdown document.
function _md_add_span(spans, start_pos, end_pos, kind)
  if typeof(spans) != "array" then spans = [] end if
  if end_pos <= start_pos then return spans end if
  return spans + [MarkdownSpan(start_pos, end_pos, kind)]
end function

// Add a style override for a rendered Markdown line.
function _md_add_line_style(styles, start_pos, end_pos, kind)
  if typeof(styles) != "array" then styles = [] end if
  if start_pos < 0 or end_pos <= start_pos then return styles end if
  return styles + [MarkdownLineStyle(start_pos, end_pos, kind)]
end function

// Record a clickable link range in rendered Markdown output.
function _md_add_link(links, start_pos, end_pos, link_target)
  if typeof(links) != "array" then links = [] end if
  if end_pos <= start_pos then return links end if
  if typeof(link_target) != "string" or link_target == "" then return links end if
  return links + [MarkdownLink(start_pos, end_pos, link_target)]
end function

// Record a heading anchor and its rendered line location.
function _md_add_anchor(anchors, name, start_pos)
  if typeof(anchors) != "array" then anchors = [] end if
  if typeof(name) != "string" or name == "" then return anchors end if
  if start_pos < 0 then return anchors end if
  return anchors + [MarkdownAnchor(name, start_pos)]
end function

// Convert heading text into a GitHub-style Markdown anchor slug.
function _md_anchor_slug(text)
  // Walk collections defensively because project data can be partially populated.
  if typeof(text) != "string" then return "" end if
  text = s.toLowerAscii(s.trim(text))
  slug = ""
  for i = 0 to len(text) - 1
    ch = text[i]
    b = bytes(ch)
    c = 0
    if len(b) > 0 then c = b[0] end if
    ok = false
    if c >= 48 and c <= 57 then ok = true end if
    if c >= 97 and c <= 122 then ok = true end if
    if ok then
      slug = slug + ch
    else if c == 32 or c == 9 or ch == "-" then
      if slug != "" then
        slug = slug + "-"
      end if
    end if
  end for
  while s.endsWith(slug, "-")
    slug = s.substr(slug, 0, len(slug) - 1)
  end while
  return slug
end function

// Return the next rendered line number for Markdown output.
function _md_next_line_no(text)
  // Walk collections defensively because project data can be partially populated.
  if typeof(text) != "string" or text == "" then return 0 end if
  line_no = 0
  for i = 0 to len(text) - 1
    if text[i] == "\n" then line_no = line_no + 1 end if
  end for
  if s.endsWith(text, "\n") == false then line_no = line_no + 1 end if
  return line_no
end function

// Remove a UTF-8 byte order mark from the start of text.
function _strip_utf8_bom(text)
  if typeof(text) != "string" then return "" end if
  b = bytes(text)
  if len(b) >= 3 and b[0] == 239 and b[1] == 187 and b[2] == 191 then
    return s.substr(text, 3, len(text) - 3)
  end if
  return text
end function

// Build a UTF-8 string from hex bytes while keeping this source file ASCII.
function _md_hex_string(hex_text)
  raw = fromHex(hex_text)
  if typeof(raw) != "bytes" then return "" end if
  text = decode(raw, "utf-8")
  if typeof(text) != "string" then return "" end if
  return text
end function

// Replace mojibake and typographic Unicode with ASCII-safe text.
function _md_normalize_display_chars(text)
  if typeof(text) != "string" then return "" end if

  // The bundled language reference currently contains common UTF-8 mojibake.
  // Keeping rendered Markdown ASCII avoids byte-offset drift when RichEdit
  // applies character-based formatting ranges.
  text = s.replaceAll(text, _md_hex_string("C3 A2 E2 82 AC C5 93"), "\"")
  text = s.replaceAll(text, _md_hex_string("C3 A2 E2 82 AC C2 9D"), "\"")
  text = s.replaceAll(text, _md_hex_string("C3 A2 E2 82 AC E2 84 A2"), "'")
  text = s.replaceAll(text, _md_hex_string("C3 A2 E2 82 AC C2 A6"), "...")
  text = s.replaceAll(text, _md_hex_string("C3 A2 E2 80 A0 E2 80 99"), "->")

  text = s.replaceAll(text, _md_hex_string("E2 80 98"), "'")
  text = s.replaceAll(text, _md_hex_string("E2 80 99"), "'")
  text = s.replaceAll(text, _md_hex_string("E2 80 9C"), "\"")
  text = s.replaceAll(text, _md_hex_string("E2 80 9D"), "\"")
  text = s.replaceAll(text, _md_hex_string("E2 80 A6"), "...")
  text = s.replaceAll(text, _md_hex_string("E2 80 93"), "-")
  text = s.replaceAll(text, _md_hex_string("E2 80 94"), "-")
  text = s.replaceAll(text, _md_hex_string("E2 86 92"), "->")
  text = s.replaceAll(text, _md_hex_string("C2 A0"), " ")

  result = ""
  for i = 0 to len(text) - 1
    ch = text[i]
    b = bytes(ch)
    if len(b) > 0 and b[0] < 128 then
      result = result + ch
    else
      result = result + "?"
    end if
  end for
  return result
end function

// Append a blank rendered line to a Markdown document.
function _md_blank(text)
  if text == "" then return text end if
  if s.endsWith(text, "\n\n") then return text end if
  if s.endsWith(text, "\n") then return text + "\n" end if
  return text + "\n\n"
end function

// Return the current output offset at the start of a rendered line.
function _md_line_start(text)
  if text != "" and s.endsWith(text, "\n") == false then text = text + "\n" end if
  return [text, len(text)]
end function

// Append plain text to the rendered Markdown output.
function _md_append_plain(text, line)
  start_info = _md_line_start(text)
  text = start_info[0]
  start_pos = start_info[1]
  text = text + line
  return [text, start_pos]
end function

// Return true when a Markdown parser character is an ASCII digit.
function _md_is_digit(ch)
  if typeof(ch) != "string" or ch == "" then return false end if
  b = bytes(ch)
  if len(b) <= 0 then return false end if
  c = b[0]
  return c >= 48 and c <= 57
end function

// Return the ATX heading level for a Markdown line.
function _md_heading_level(line)
  t = s.trim(line)
  if s.startsWith(t, "#") == false then return 0 end if
  level = 0
  while level < len(t) and t[level] == "#"
    level = level + 1
  end while
  if level <= 0 or level > 6 then return 0 end if
  if level >= len(t) then return 0 end if
  if t[level] != " " then return 0 end if
  return level
end function

// Extract the visible text from a Markdown heading line.
function _md_heading_text(line)
  level = _md_heading_level(line)
  if level <= 0 then return "" end if
  t = s.trim(line)
  return s.trim(s.substr(t, level, len(t) - level))
end function

// Return the length of a Markdown ordered-list prefix.
function _md_ordered_prefix(line)
  t = s.trim(line)
  i = 0
  while i < len(t) and _md_is_digit(t[i])
    i = i + 1
  end while
  if i <= 0 or i + 1 >= len(t) then return "" end if
  if t[i] == "." and t[i + 1] == " " then return s.substr(t, 0, i + 2) end if
  return ""
end function

// Return true when a Markdown line is a table separator row.
function _md_table_separator(line)
  // Walk collections defensively because project data can be partially populated.
  t = s.trim(line)
  if s.indexOf(t, "|", 0) < 0 then return false end if
  has_dash = false
  for i = 0 to len(t) - 1
    ch = t[i]
    if ch == "-" then has_dash = true end if
    if ch != "|" and ch != "-" and ch != ":" and ch != " " then return false end if
  end for
  return has_dash
end function

// Return true when a Markdown line looks like a table row.
function _md_table_row(line)
  // Walk collections defensively because project data can be partially populated.
  parts = s.split(line, "|")
  row_text = ""
  for i = 0 to len(parts) - 1
    cell = s.trim(parts[i])
    if cell == "" and (i == 0 or i == len(parts) - 1) then continue end if
    if row_text != "" then row_text = row_text + "    " end if
    row_text = row_text + cell
  end for
  return row_text
end function

// Find the closing delimiter for a strong emphasis span.
function _md_find_strong_close(src, open_pos)
  close = s.indexOf(src, "**", open_pos + 2)
  if close < 0 then return -1 end if

  // In Markdown such as **bold and *em*** the first two stars of the final
  // triple belong to the inner emphasis close; the outer strong close starts
  // one character later.
  if close + 2 < len(src) and src[close + 2] == "*" then
    inner = s.substr(src, open_pos + 2, close - open_pos - 2)
    if s.indexOf(inner, "*", 0) >= 0 then close = close + 1 end if
  end if
  return close
end function

// Parse inline Markdown formatting into styled output spans.
function _md_inline(src, base_pos, spans, links)
  // Keep validation near the top so callers can treat invalid input as a no-op.
  if typeof(src) != "string" then src = "" end if
  inline_text = ""
  i = 0
  while i < len(src)
    if i + 1 < len(src) and src[i] == "!" and src[i + 1] == "[" then
      close = s.indexOf(src, "](", i + 2)
      end_link = -1
      if close >= 0 then end_link = s.indexOf(src, ")", close + 2) end if
      if close >= 0 and end_link >= 0 then
        alt = s.substr(src, i + 2, close - i - 2)
        image_target = s.substr(src, close + 2, end_link - close - 2)
        start_pos = base_pos + len(inline_text)
        inline_text = inline_text + "[Image: " + alt + "]"
        image_end = base_pos + len(inline_text)
        spans = _md_add_span(spans, start_pos, image_end, "image")
        links = _md_add_link(links, start_pos, image_end, image_target)
        i = end_link + 1
        continue
      end if
    end if

    if src[i] == "[" then
      close = s.indexOf(src, "](", i + 1)
      end_link = -1
      if close >= 0 then end_link = s.indexOf(src, ")", close + 2) end if
      if close >= 0 and end_link >= 0 then
        label_src = s.substr(src, i + 1, close - i - 1)
        link_target = s.substr(src, close + 2, end_link - close - 2)
        start_pos = base_pos + len(inline_text)
        inner_result = _md_inline(label_src, start_pos, spans, links)
        inline_text = inline_text + inner_result[0]
        spans = inner_result[1]
        links = inner_result[2]
        link_end = base_pos + len(inline_text)
        spans = _md_add_span(spans, start_pos, link_end, "link")
        links = _md_add_link(links, start_pos, link_end, link_target)
        i = end_link + 1
        continue
      end if
    end if

    if i + 1 < len(src) and s.substr(src, i, 2) == "**" then
      close = _md_find_strong_close(src, i)
      if close >= 0 then
        inner_src = s.substr(src, i + 2, close - i - 2)
        start_pos = base_pos + len(inline_text)
        inner_result = _md_inline(inner_src, start_pos, spans, links)
        inline_text = inline_text + inner_result[0]
        spans = inner_result[1]
        links = inner_result[2]
        spans = _md_add_span(spans, start_pos, base_pos + len(inline_text), "strong")
        i = close + 2
        continue
      end if
    end if

    if i + 1 < len(src) and s.substr(src, i, 2) == "__" then
      close = s.indexOf(src, "__", i + 2)
      if close >= 0 then
        inner_src = s.substr(src, i + 2, close - i - 2)
        start_pos = base_pos + len(inline_text)
        inner_result = _md_inline(inner_src, start_pos, spans, links)
        inline_text = inline_text + inner_result[0]
        spans = inner_result[1]
        links = inner_result[2]
        spans = _md_add_span(spans, start_pos, base_pos + len(inline_text), "strong")
        i = close + 2
        continue
      end if
    end if

    if src[i] == "`" then
      close = s.indexOf(src, "`", i + 1)
      if close >= 0 then
        inner = s.substr(src, i + 1, close - i - 1)
        start_pos = base_pos + len(inline_text)
        inline_text = inline_text + inner
        spans = _md_add_span(spans, start_pos, base_pos + len(inline_text), "inline_code")
        i = close + 1
        continue
      end if
    end if

    if src[i] == "*" then
      close = s.indexOf(src, "*", i + 1)
      if close >= 0 then
        inner_src = s.substr(src, i + 1, close - i - 1)
        if inner_src != "" then
          start_pos = base_pos + len(inline_text)
          inner_result = _md_inline(inner_src, start_pos, spans, links)
          inline_text = inline_text + inner_result[0]
          spans = inner_result[1]
          links = inner_result[2]
          spans = _md_add_span(spans, start_pos, base_pos + len(inline_text), "em")
          i = close + 1
          continue
        end if
      end if
    end if

    inline_text = inline_text + src[i]
    i = i + 1
  end while
  return [inline_text, spans, links]
end function

// Append text after applying inline Markdown formatting.
function _md_append_inline(text, spans, links, prefix, src, kind)
  start_info = _md_line_start(text)
  text = start_info[0]
  line_start = start_info[1]
  text = text + prefix
  inline_result = _md_inline(src, line_start + len(prefix), spans, links)
  rendered = inline_result[0]
  spans = inline_result[1]
  links = inline_result[2]
  text = text + rendered
  if kind != "" and kind != "paragraph" and kind != "list" and kind != "quote" and s.startsWith(kind, "h") == false then
    spans = _md_add_span(spans, line_start, len(text), kind)
  end if
  return [text, spans, links, line_start, len(text)]
end function

// Append a full logical Markdown line after parsing all inline markup.
function _md_append_block_inline(text, spans, links, prefix, src, kind)
  return _md_append_inline(text, spans, links, prefix, s.trim(src), kind)
end function

// Style code block lines in rendered Markdown output.
function _md_add_code_spans(spans, base_pos, raw, lang)
  // Walk collections defensively because project data can be partially populated.
  if typeof(spans) != "array" then spans = [] end if
  lower = s.toLowerAscii(s.trim(lang))
  if lower != "ml" and lower != "minilang" then return spans end if
  segments = syntax.line_segments(raw)
  if typeof(segments) != "array" then return spans end if
  if len(segments) <= 0 then return spans end if
  offset = 0
  for i = 0 to len(segments) - 1
    seg = segments[i]
    if typeof(seg) != "struct" then continue end if
    seg_len = len(seg.text)
    if seg_len > 0 and seg.kind != "text" then
      spans = _md_add_span(spans, base_pos + offset, base_pos + offset + seg_len, seg.kind)
    end if
    offset = offset + seg_len
  end for
  return spans
end function

// Render a Markdown document into text, styles, links, and anchors.
function _render_markdown_document(markdown)
  // Walk collections defensively because project data can be partially populated.
  markdown = _md_normalize_display_chars(_strip_utf8_bom(_normalize_editor_text(markdown)))
  lines = s.split(markdown, "\n")
  text = ""
  spans = []
  line_styles = []
  links = []
  anchors = []
  in_code = false
  code_lang = ""
  for i = 0 to len(lines) - 1
    raw = _strip_cr(lines[i])
    trimmed = s.trim(raw)

    if _markdown_fence_line(trimmed) then
      if in_code then
        text = _md_blank(text)
        in_code = false
        code_lang = ""
      else
        text = _md_blank(text)
        in_code = true
        code_lang = _markdown_fence_language(trimmed)
      end if
      continue
    end if

    if in_code then
      added = _md_append_plain(text, "  " + raw)
      text = added[0]
      line_styles = _md_add_line_style(line_styles, added[1], len(text), "code_block")
      spans = _md_add_code_spans(spans, added[1] + 2, raw, code_lang)
      continue
    end if

    if trimmed == "" then
      text = _md_blank(text)
      continue
    end if

    level = _md_heading_level(raw)
    if level > 0 then
      text = _md_blank(text)
      title = _md_heading_text(raw)
      kind = "h" + level
      added_inline = _md_append_inline(text, spans, links, "", title, kind)
      text = added_inline[0]
      spans = added_inline[1]
      links = added_inline[2]
      anchors = _md_add_anchor(anchors, _md_anchor_slug(title), added_inline[3])
      line_styles = _md_add_line_style(line_styles, added_inline[3], added_inline[4], kind)
      text = _md_blank(text)
      continue
    end if

    if trimmed == "---" or trimmed == "***" or trimmed == "___" then
      text = _md_blank(text)
      added = _md_append_plain(text, s.repeat("-", 72))
      text = added[0]
      spans = _md_add_span(spans, added[1], len(text), "hr")
      line_styles = _md_add_line_style(line_styles, added[1], len(text), "hr")
      text = _md_blank(text)
      continue
    end if

    if s.startsWith(trimmed, ">") then
      quote = s.trim(s.substr(trimmed, 1, len(trimmed) - 1))
      added_inline = _md_append_block_inline(text, spans, links, "| ", quote, "quote")
      text = added_inline[0]
      spans = added_inline[1]
      links = added_inline[2]
      line_styles = _md_add_line_style(line_styles, added_inline[3], added_inline[4], "quote")
      continue
    end if

    if s.startsWith(trimmed, "- ") or s.startsWith(trimmed, "* ") or s.startsWith(trimmed, "+ ") then
      body = s.trim(s.substr(trimmed, 2, len(trimmed) - 2))
      added_inline = _md_append_block_inline(text, spans, links, "- ", body, "list")
      text = added_inline[0]
      spans = added_inline[1]
      links = added_inline[2]
      line_styles = _md_add_line_style(line_styles, added_inline[3], added_inline[4], "list")
      continue
    end if

    ordered = _md_ordered_prefix(raw)
    if ordered != "" then
      body = s.trim(s.substr(s.trim(raw), len(ordered), len(s.trim(raw)) - len(ordered)))
      added_inline = _md_append_block_inline(text, spans, links, ordered, body, "list")
      text = added_inline[0]
      spans = added_inline[1]
      links = added_inline[2]
      line_styles = _md_add_line_style(line_styles, added_inline[3], added_inline[4], "list")
      continue
    end if

    if s.indexOf(trimmed, "|", 0) >= 0 and (s.startsWith(trimmed, "|") or s.endsWith(trimmed, "|")) then
      if _md_table_separator(trimmed) then continue end if
      rendered_row = _md_table_row(trimmed)
      added = _md_append_plain(text, rendered_row)
      text = added[0]
      spans = _md_add_span(spans, added[1], len(text), "table")
      line_styles = _md_add_line_style(line_styles, added[1], len(text), "table")
      continue
    end if

    added_inline = _md_append_block_inline(text, spans, links, "", trimmed, "paragraph")
    text = added_inline[0]
    spans = added_inline[1]
    links = added_inline[2]
  end for
  return MarkdownDocument(text, spans, line_styles, links, anchors)
end function

// Ensure the Markdown render cache matches the open tab list.
function _ensure_markdown_cache_slots(st)
  if typeof(st.open_markdown_sources) != "array" then st.open_markdown_sources = [] end if
  if typeof(st.open_markdown_docs) != "array" then st.open_markdown_docs = [] end if
  count = 0
  if typeof(st.open_files) == "array" then count = len(st.open_files) end if
  while len(st.open_markdown_sources) < count
    st.open_markdown_sources = st.open_markdown_sources + [""]
  end while
  while len(st.open_markdown_docs) < count
    st.open_markdown_docs = st.open_markdown_docs + [_empty_markdown_doc()]
  end while
  return st
end function

// Clear the cached Markdown render for a tab.
function _clear_markdown_cache(st, idx)
  if idx < 0 then return st end if
  st = _ensure_markdown_cache_slots(st)
  if idx < len(st.open_markdown_sources) then st.open_markdown_sources[idx] = "" end if
  if idx < len(st.open_markdown_docs) then st.open_markdown_docs[idx] = _empty_markdown_doc() end if
  return st
end function

// Return the rendered Markdown document for the active tab.
function _markdown_doc_for_active_tab(st, markdown)
  source = _normalize_editor_text(markdown)
  idx = st.active_tab
  if idx < 0 or idx >= len(st.open_files) then
    return [st, _render_markdown_document(source)]
  end if
  st = _ensure_markdown_cache_slots(st)
  cached_doc = st.open_markdown_docs[idx]
  if idx < len(st.open_markdown_sources) and st.open_markdown_sources[idx] == source and typeof(cached_doc) == "struct" then
    return [st, cached_doc]
  end if
  doc = _render_markdown_document(source)
  st.open_markdown_sources[idx] = source
  st.open_markdown_docs[idx] = doc
  return [st, doc]
end function

// Return the cached Markdown document for the active tab when valid.
function _active_cached_markdown_doc(st)
  idx = st.active_tab
  if idx < 0 then return void end if
  if typeof(st.open_markdown_docs) != "array" or idx >= len(st.open_markdown_docs) then return void end if
  doc = st.open_markdown_docs[idx]
  if typeof(doc) != "struct" then return void end if
  return doc
end function

// Convert a document offset to a RichEdit display offset.
function _md_display_pos(doc_text, doc_pos)
  if typeof(doc_text) != "string" then return doc_pos end if
  if doc_pos <= 0 then return 0 end if
  if doc_pos > len(doc_text) then doc_pos = len(doc_text) end if
  display_pos = 0
  i = 0
  while i < doc_pos
    if doc_text[i] == "\n" then
      display_pos = display_pos + 2
    else
      display_pos = display_pos + 1
    end if
    i = i + 1
  end while
  return display_pos
end function

// Convert a RichEdit display offset back to a document offset.
function _md_doc_pos_from_display(doc_text, display_pos)
  if typeof(doc_text) != "string" then return display_pos end if
  if display_pos <= 0 then return 0 end if
  doc_pos = 0
  seen = 0
  result = len(doc_text)
  done = false
  while doc_pos < len(doc_text) and done == false
    ch = doc_text[doc_pos]
    step = 1
    if ch == "\n" then step = 2 end if
    next_seen = seen + step
    if next_seen > display_pos then
      result = doc_pos
      done = true
    else
      seen = next_seen
      doc_pos = doc_pos + 1
      if seen >= display_pos then
        result = doc_pos
        done = true
      end if
    end if
  end while
  return result
end function

// Return the RichEdit color for a rendered Markdown span kind.
function _markdown_span_color(st, kind)
  if kind == "link" then return win.rgb(79, 156, 245) end if
  if kind == "inline_code" or kind == "code_label" then return theme.syntax_color(st, "string") end if
  if kind == "code_block" then return theme.editor_fg(st) end if
  if kind == "quote" or kind == "hr" then return theme.muted_fg(st) end if
  if kind == "table" then return theme.syntax_color(st, "operator") end if
  if kind == "list" then return theme.editor_fg(st) end if
  if kind == "h1" then
    if theme.is_dark(st) then return win.rgb(225, 229, 235) end if
    return win.rgb(20, 28, 38)
  end if
  if s.startsWith(kind, "h") then
    if theme.is_dark(st) then return win.rgb(238, 171, 121) end if
    return win.rgb(25, 88, 180)
  end if
  return theme.editor_fg(st)
end function

// Return the font size for a rendered Markdown span kind.
function _markdown_span_size(kind)
  if kind == "h1" then return 440 end if
  if kind == "h2" then return 360 end if
  if kind == "h3" then return 300 end if
  if kind == "h4" then return 260 end if
  if kind == "h5" then return 230 end if
  if kind == "h6" then return 220 end if
  return 0
end function

// Apply paragraph-level styles to rendered Markdown lines.
function _apply_rendered_markdown_line_styles(st, doc)
  // Walk collections defensively because project data can be partially populated.
  if typeof(doc.line_styles) != "array" then return st end if
  if len(doc.line_styles) <= 0 then return st end if
  for i = 0 to len(doc.line_styles) - 1
    style = doc.line_styles[i]
    if typeof(style) != "struct" then continue end if
    kind = style.kind
    bold = false
    italic = false
    underline = false
    if s.startsWith(kind, "h") or kind == "code_label" then bold = true end if
    if kind == "quote" then italic = true end if
    win.rich_set_format(st.editor, style.start_pos, style.end_pos, _markdown_span_color(st, kind), _markdown_span_size(kind), bold, italic, underline)
  end for
  return st
end function

// Apply all rendered Markdown styles to the RichEdit control.
function _apply_rendered_markdown_styles(st, doc)
  // Walk collections defensively because project data can be partially populated.
  if typeof(doc.spans) != "array" then return st end if
  if len(doc.spans) <= 0 then return st end if
  for i = 0 to len(doc.spans) - 1
    span = doc.spans[i]
    if typeof(span) != "struct" then continue end if
    kind = span.kind
    bold = false
    italic = false
    underline = false
    if kind == "strong" or s.startsWith(kind, "h") or kind == "code_label" then bold = true end if
    if kind == "em" or kind == "quote" then italic = true end if
    if kind == "link" then underline = true end if
    color = _markdown_span_color(st, kind)
    if kind == "strong" or kind == "em" then color = -1 end if
    win.rich_set_format(st.editor, span.start_pos, span.end_pos, color, _markdown_span_size(kind), bold, italic, underline)
  end for
  return st
end function

// Render and write Markdown content into the active editor control.
function _write_markdown_editor(st, markdown, preserve_view)
  // Keep validation near the top so callers can treat invalid input as a no-op.
  sel = [0, 0]
  scroll = [0, 0]
  if preserve_view then
    sel = win.edit_getsel(st.editor)
    scroll = win.edit_get_scroll_pos(st.editor)
  end if
  win.edit_set_redraw(st.editor, false)
  win.edit_set_readonly(st.editor, false)
  win.set_control_font(st.editor, st.font_ui)
  doc_info = _markdown_doc_for_active_tab(st, markdown)
  st = doc_info[0]
  doc = doc_info[1]
  win.set_window_text(st.editor, _editor_display_text(doc.text))
  win.edit_set_background(st.editor, theme.editor_bg(st))
  win.rich_set_all_color(st.editor, theme.editor_fg(st))
  st = _apply_rendered_markdown_line_styles(st, doc)
  st = _apply_rendered_markdown_styles(st, doc)
  if preserve_view then
    win.edit_setsel(st.editor, sel[0], sel[1])
    win.edit_set_scroll_pos(st.editor, scroll[0], scroll[1])
  else
    win.edit_setsel(st.editor, 0, 0)
    win.edit_set_scroll_pos(st.editor, 0, 0)
  end if
  win.edit_set_modified(st.editor, false)
  win.edit_set_readonly(st.editor, true)
  win.edit_set_redraw(st.editor, true)
  if preserve_view then
    win.edit_set_scroll_pos(st.editor, scroll[0], scroll[1])
  else
    win.edit_set_scroll_pos(st.editor, 0, 0)
  end if
  st.last_highlight_text = _normalize_editor_text(doc.text)
  st.last_highlight_first_line = win.edit_first_visible_line(st.editor)
  st.highlight_pending = false
  return st
end function

// Return the Markdown link covering a document offset.
function _markdown_link_at_doc(doc, char_pos)
  // Walk collections defensively because project data can be partially populated.
  if typeof(doc) != "struct" or typeof(doc.links) != "array" then return void end if
  if char_pos < 0 then return void end if
  if len(doc.links) <= 0 then return void end if
  for i = 0 to len(doc.links) - 1
    link = doc.links[i]
    if typeof(link) != "struct" then continue end if
    if char_pos >= link.start_pos and char_pos < link.end_pos then return link end if
  end for
  return void
end function

// Return the Markdown link under an editor mouse position.
function _markdown_link_at_editor(st, x, y)
  if _active_is_markdown(st) == false then return void end if
  doc = _active_cached_markdown_doc(st)
  if typeof(doc) != "struct" then return void end if
  char_pos = win.edit_char_from_pos(st.editor, x, y)
  return _markdown_link_at_doc(doc, char_pos)
end function

// Extract an anchor name from a Markdown link target.
function _markdown_anchor_from_target(link_target)
  if typeof(link_target) != "string" then return "" end if
  link_target = s.trim(link_target)
  hash_pos = s.indexOf(link_target, "#", 0)
  if hash_pos < 0 then return "" end if
  if hash_pos + 1 >= len(link_target) then return "" end if
  raw_anchor = s.substr(link_target, hash_pos + 1, len(link_target) - hash_pos - 1)
  return _md_anchor_slug(raw_anchor)
end function

// Scroll the editor so a Markdown anchor is aligned near the top.
function _jump_to_markdown_anchor(st, link_target)
  // Walk collections defensively because project data can be partially populated.
  anchor_name = _markdown_anchor_from_target(link_target)
  if anchor_name == "" then return _set_log(st, "Link: " + link_target) end if
  idx = st.active_tab
  raw = ""
  if idx >= 0 and idx < len(st.open_texts) then raw = st.open_texts[idx] end if
  doc_info = _markdown_doc_for_active_tab(st, raw)
  st = doc_info[0]
  doc = doc_info[1]
  if typeof(doc.anchors) != "array" then return _set_log(st, "Anchor not found: #" + anchor_name) end if
  if len(doc.anchors) <= 0 then return _set_log(st, "Anchor not found: #" + anchor_name) end if
  for i = 0 to len(doc.anchors) - 1
    item = doc.anchors[i]
    if typeof(item) != "struct" then continue end if
    if item.name == anchor_name then
      pos = item.start_pos
      if pos < 0 then pos = 0 end if
      win.SetFocus(st.editor)
      win.edit_setsel(st.editor, pos, pos)
      win.edit_scroll_caret(st.editor)
      first = win.edit_first_visible_line(st.editor)
      if first < 0 then first = 0 end if
      target_line = win.edit_line_from_char(st.editor, pos)
      if target_line < 0 then target_line = first end if
      delta = target_line - first
      if delta != 0 then win.edit_scroll_lines(st.editor, 0, delta) end if
      win.edit_setsel(st.editor, pos, pos)
      st.last_status_text = ""
      return _set_log(st, "Jumped to #" + anchor_name + ".")
    end if
  end for
  return _set_log(st, "Anchor not found: #" + anchor_name)
end function

// Open an external Markdown link or jump to an in-document anchor.
function _open_markdown_link_at(st, x, y)
  if _active_is_markdown(st) == false then return st end if
  idx = st.active_tab
  raw = ""
  if idx >= 0 and idx < len(st.open_texts) then raw = st.open_texts[idx] end if
  doc_info = _markdown_doc_for_active_tab(st, raw)
  st = doc_info[0]
  doc = doc_info[1]
  char_pos = win.edit_char_from_pos(st.editor, x, y)
  link = _markdown_link_at_doc(doc, char_pos)
  if typeof(link) != "struct" then return st end if
  return _jump_to_markdown_anchor(st, link.link_target)
end function

// Render Markdown source into a styled document model.
function render(markdown)
  return _render_markdown_document(markdown)
end function

// Return an empty rendered Markdown document for cache initialization.
function empty_doc()
  return _empty_markdown_doc()
end function

// Clear the cached rendered Markdown document for a tab.
function clear_cache(st, idx)
  return _clear_markdown_cache(st, idx)
end function

// Write rendered Markdown into the RichEdit control.
function write_editor(st, markdown, preserve_view)
  return _write_markdown_editor(st, markdown, preserve_view)
end function

// Return the rendered Markdown link under an editor coordinate.
function link_at_editor(st, x, y)
  return _markdown_link_at_editor(st, x, y)
end function

// Open or jump to the rendered Markdown link under an editor coordinate.
function open_link_at(st, x, y)
  return _open_markdown_link_at(st, x, y)
end function
