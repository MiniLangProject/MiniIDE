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

package editor.buffer

// Text buffer for MiniIDE. This intentionally keeps editing mechanics small
// and predictable; richer features can sit on top of the same API.

import std.fs as fs
import std.string as s

struct TextBuffer
  path,
  text,
  lines,
  cursor_line,
  cursor_col,
  scroll_line,
  scroll_col,
  dirty,
end struct

// Normalize line endings to MiniIDE internal newline format.
function _normalize_text(text)
  if typeof(text) != "string" then return "" end if
  return s.replaceAll(s.replaceAll(text, "\r\n", "\n"), "\r", "\n")
end function

// Split normalized text into editable buffer lines.
function _lines_from_text(text)
  t = _normalize_text(text)
  if t == "" then return [""] end if
  lines = s.split(t, "\n")
  if typeof(lines) != "array" or len(lines) <= 0 then return [""] end if
  return lines
end function

// Join buffer lines back into normalized text.
function _text_from_lines(lines)
  if typeof(lines) != "array" then return "" end if
  return s.join(lines, "\n")
end function

// Create a normalized text buffer for a path and initial contents.
function new_buffer(path, text)
  lines = _lines_from_text(text)
  return TextBuffer(path, _text_from_lines(lines), lines, 0, 0, 0, 0, false)
end function

// Load a file into a normalized text buffer.
function load_file(path)
  if typeof(path) != "string" or path == "" then
    return new_buffer("", "")
  end if
  if fs.exists(path) == false then
    return new_buffer(path, "")
  end if
  text = fs.readAllText(path)
  if typeof(text) == "error" then
    return new_buffer(path, "")
  end if
  return new_buffer(path, text)
end function

// Persist a text buffer to disk and clear its dirty flag on success.
function save(buf)
  if typeof(buf) != "struct" then return buf end if
  buf.text = _text_from_lines(buf.lines)
  wr = fs.writeAllText(buf.path, buf.text)
  if typeof(wr) != "error" then
    buf.dirty = false
  end if
  return buf
end function

// Return the number of lines in a text buffer.
function line_count(buf)
  if typeof(buf) != "struct" or typeof(buf.lines) != "array" then return 0 end if
  return len(buf.lines)
end function

// Return the current cursor line from a text buffer.
function current_line(buf)
  if line_count(buf) <= 0 then return "" end if
  idx = buf.cursor_line
  if idx < 0 then idx = 0 end if
  if idx >= len(buf.lines) then idx = len(buf.lines) - 1 end if
  return buf.lines[idx]
end function

// Clamp cursor and scroll fields so they stay within the buffer.
function clamp_cursor(buf)
  if typeof(buf) != "struct" then return buf end if
  if typeof(buf.lines) != "array" or len(buf.lines) <= 0 then
    buf.lines = [""]
  end if
  if typeof(buf.cursor_line) != "int" then buf.cursor_line = 0 end if
  if typeof(buf.cursor_col) != "int" then buf.cursor_col = 0 end if
  if typeof(buf.scroll_line) != "int" then buf.scroll_line = 0 end if
  if typeof(buf.scroll_col) != "int" then buf.scroll_col = 0 end if
  if buf.cursor_line < 0 then buf.cursor_line = 0 end if
  if buf.cursor_line >= len(buf.lines) then buf.cursor_line = len(buf.lines) - 1 end if
  line = buf.lines[buf.cursor_line]
  if typeof(line) != "string" then line = "" end if
  if buf.cursor_col < 0 then buf.cursor_col = 0 end if
  if buf.cursor_col > len(line) then buf.cursor_col = len(line) end if
  if buf.scroll_line < 0 then buf.scroll_line = 0 end if
  if buf.scroll_line > buf.cursor_line then buf.scroll_line = buf.cursor_line end if
  return buf
end function

// Replace one buffer line and mark the buffer dirty.
function _set_line(buf, idx, text)
  if typeof(buf) != "struct" or typeof(buf.lines) != "array" then return buf end if
  if idx < 0 or idx >= len(buf.lines) then return buf end if
  buf.lines[idx] = text
  buf.dirty = true
  return buf
end function

// Insert a line into the buffer at a clamped index.
function _insert_line(buf, idx, text)
  if typeof(buf) != "struct" then return buf end if
  if typeof(buf.lines) != "array" then buf.lines = [""] end if
  if idx < 0 then idx = 0 end if
  if idx > len(buf.lines) then idx = len(buf.lines) end if
  result_lines = []
  i = 0
  while i < idx
    result_lines = result_lines + [buf.lines[i]]
    i = i + 1
  end while
  result_lines = result_lines + [text]
  while i < len(buf.lines)
    result_lines = result_lines + [buf.lines[i]]
    i = i + 1
  end while
  buf.lines = result_lines
  buf.dirty = true
  return buf
end function

// Remove one line while keeping the buffer non-empty.
function _remove_line(buf, idx)
  if typeof(buf) != "struct" or typeof(buf.lines) != "array" then return buf end if
  if len(buf.lines) <= 1 then
    buf.lines = [""]
    buf.dirty = true
    return buf
  end if
  result_lines = []
  i = 0
  while i < len(buf.lines)
    if i != idx then result_lines = result_lines + [buf.lines[i]] end if
    i = i + 1
  end while
  buf.lines = result_lines
  buf.dirty = true
  return buf
end function

// Insert text at the current cursor position.
function insert_text(buf, text)
  if typeof(buf) != "struct" or typeof(text) != "string" then return buf end if
  buf = clamp_cursor(buf)
  line = buf.lines[buf.cursor_line]
  left = s.substr(line, 0, buf.cursor_col)
  right = s.substr(line, buf.cursor_col, len(line) - buf.cursor_col)
  buf.lines[buf.cursor_line] = left + text + right
  buf.cursor_col = buf.cursor_col + len(text)
  buf.dirty = true
  return buf
end function

// Split the current line at the cursor and move to the new line.
function newline(buf)
  if typeof(buf) != "struct" then return buf end if
  buf = clamp_cursor(buf)
  line = buf.lines[buf.cursor_line]
  left = s.substr(line, 0, buf.cursor_col)
  right = s.substr(line, buf.cursor_col, len(line) - buf.cursor_col)
  buf.lines[buf.cursor_line] = left
  buf = _insert_line(buf, buf.cursor_line + 1, right)
  buf.cursor_line = buf.cursor_line + 1
  buf.cursor_col = 0
  return buf
end function

// Delete the character before the cursor or merge with the previous line.
function backspace(buf)
  if typeof(buf) != "struct" then return buf end if
  buf = clamp_cursor(buf)
  if buf.cursor_col > 0 then
    line = buf.lines[buf.cursor_line]
    left = s.substr(line, 0, buf.cursor_col - 1)
    right = s.substr(line, buf.cursor_col, len(line) - buf.cursor_col)
    buf.lines[buf.cursor_line] = left + right
    buf.cursor_col = buf.cursor_col - 1
    buf.dirty = true
    return buf
  end if

  if buf.cursor_line > 0 then
    prev = buf.lines[buf.cursor_line - 1]
    cur = buf.lines[buf.cursor_line]
    new_col = len(prev)
    buf.lines[buf.cursor_line - 1] = prev + cur
    buf = _remove_line(buf, buf.cursor_line)
    buf.cursor_line = buf.cursor_line - 1
    buf.cursor_col = new_col
  end if
  return buf
end function

// Delete forward.
function delete_forward(buf)
  if typeof(buf) != "struct" then return buf end if
  buf = clamp_cursor(buf)
  line = buf.lines[buf.cursor_line]
  if buf.cursor_col < len(line) then
    left = s.substr(line, 0, buf.cursor_col)
    right = s.substr(line, buf.cursor_col + 1, len(line) - buf.cursor_col - 1)
    buf.lines[buf.cursor_line] = left + right
    buf.dirty = true
    return buf
  end if
  if buf.cursor_line + 1 < len(buf.lines) then
    buf.lines[buf.cursor_line] = line + buf.lines[buf.cursor_line + 1]
    buf = _remove_line(buf, buf.cursor_line + 1)
  end if
  return buf
end function

// Move left.
function move_left(buf)
  buf = clamp_cursor(buf)
  if buf.cursor_col > 0 then
    buf.cursor_col = buf.cursor_col - 1
  else
    if buf.cursor_line > 0 then
      buf.cursor_line = buf.cursor_line - 1
      buf.cursor_col = len(buf.lines[buf.cursor_line])
    end if
  end if
  return clamp_cursor(buf)
end function

// Move right.
function move_right(buf)
  buf = clamp_cursor(buf)
  line = buf.lines[buf.cursor_line]
  if buf.cursor_col < len(line) then
    buf.cursor_col = buf.cursor_col + 1
  else
    if buf.cursor_line + 1 < len(buf.lines) then
      buf.cursor_line = buf.cursor_line + 1
      buf.cursor_col = 0
    end if
  end if
  return clamp_cursor(buf)
end function

// Move up.
function move_up(buf)
  buf = clamp_cursor(buf)
  if buf.cursor_line > 0 then buf.cursor_line = buf.cursor_line - 1 end if
  return clamp_cursor(buf)
end function

// Move down.
function move_down(buf)
  buf = clamp_cursor(buf)
  if buf.cursor_line + 1 < len(buf.lines) then buf.cursor_line = buf.cursor_line + 1 end if
  return clamp_cursor(buf)
end function

// Move home.
function move_home(buf)
  buf.cursor_col = 0
  return clamp_cursor(buf)
end function

// Move end.
function move_end(buf)
  buf = clamp_cursor(buf)
  buf.cursor_col = len(buf.lines[buf.cursor_line])
  return buf
end function

// Return the scroll.
function scroll(buf, delta)
  if typeof(buf) != "struct" then return buf end if
  buf.scroll_line = buf.scroll_line + delta
  if buf.scroll_line < 0 then buf.scroll_line = 0 end if
  max_scroll = line_count(buf) - 1
  if max_scroll < 0 then max_scroll = 0 end if
  if buf.scroll_line > max_scroll then buf.scroll_line = max_scroll end if
  return buf
end function

// Ensure cursor visible.
function ensure_cursor_visible(buf, visible_lines)
  if typeof(buf) != "struct" then return buf end if
  if typeof(visible_lines) != "int" or visible_lines <= 0 then visible_lines = 1 end if
  if buf.cursor_line < buf.scroll_line then
    buf.scroll_line = buf.cursor_line
  end if
  if buf.cursor_line >= buf.scroll_line + visible_lines then
    buf.scroll_line = buf.cursor_line - visible_lines + 1
  end if
  if buf.scroll_line < 0 then buf.scroll_line = 0 end if
  return buf
end function

// Set cursor.
function set_cursor(buf, line, col)
  if typeof(buf) != "struct" then return buf end if
  buf.cursor_line = line
  buf.cursor_col = col
  return clamp_cursor(buf)
end function

// Return the word prefix.
function word_prefix(buf)
  buf = clamp_cursor(buf)
  line = current_line(buf)
  i = buf.cursor_col - 1
  while i >= 0
    ch = line[i]
    b = bytes(ch)
    c = 0
    if len(b) > 0 then c = b[0] end if
    ok = (c >= 65 and c <= 90) or (c >= 97 and c <= 122) or (c >= 48 and c <= 57) or ch == "_"
    if ok == false then break end if
    i = i - 1
  end while
  start = i + 1
  if start >= buf.cursor_col then return "" end if
  return s.substr(line, start, buf.cursor_col - start)
end function
