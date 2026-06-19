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

package lang.syntax

// Lightweight MiniLang line highlighter.

import std.string as s

struct Segment
  text,
  kind,
end struct

_keywords = [
"print", "if", "then", "else", "end", "while", "loop", "true", "false", "and", "or", "not",
"function", "return", "global", "const", "for", "to", "each", "in", "break", "continue",
"switch", "case", "default", "struct", "enum", "are", "namespace", "import", "as", "package",
"extern", "from", "returns", "symbol", "out", "static", "inline", "void", "is"
]

// Return the MiniLang keywords known by the syntax highlighter.
function keywords()
  return _keywords
end function

// Return the byte value for a one-character string.
function _char_code(ch)
  b = bytes(ch)
  if len(b) <= 0 then return -1 end if
  return b[0]
end function

// Return true when a character is an ASCII letter.
function _is_alpha(ch)
  c = _char_code(ch)
  return (c >= 65 and c <= 90) or (c >= 97 and c <= 122)
end function

// Return true when a character is an ASCII digit.
function _is_digit(ch)
  c = _char_code(ch)
  return c >= 48 and c <= 57
end function

// Return true when a character can start a MiniLang identifier.
function _is_ident_start(ch)
  return _is_alpha(ch) or ch == "_"
end function

// Return true when a character can continue a MiniLang identifier.
function _is_ident_part(ch)
  return _is_ident_start(ch) or _is_digit(ch)
end function

// Return true when a word is a MiniLang keyword.
function _is_keyword(word)
  // Walk collections defensively because project data can be partially populated.
  for i = 0 to len(_keywords) - 1
    if _keywords[i] == word then return true end if
  end for
  return false
end function

// Append a non-empty syntax segment to the segment list.
function _push_seg(segments, text, kind)
  if text == "" then return segments end if
  return segments + [Segment(text, kind)]
end function

// Tokenize one MiniLang source line into syntax-highlight segments.
function line_segments(line)
  // Keep validation near the top so callers can treat invalid input as a no-op.
  if typeof(line) != "string" then return [] end if
  segments = []
  i = 0
  n = len(line)
  while i < n
    ch = line[i]

    if ch == "/" and i + 1 < n and line[i + 1] == "/" then
      segments = _push_seg(segments, s.substr(line, i, n - i), "comment")
      break
    end if

    if ch == "/" and i + 1 < n and line[i + 1] == "*" then
      start = i
      i = i + 2
      while i + 1 < n
        if line[i] == "*" and line[i + 1] == "/" then
          i = i + 2
          break
        end if
        i = i + 1
      end while
      if i > n then i = n end if
      segments = _push_seg(segments, s.substr(line, start, i - start), "comment")
      continue
    end if

    if ch == "\"" then
      start_s = i
      i = i + 1
      escaped = false
      while i < n
        cc = line[i]
        if escaped then
          escaped = false
        else
          if cc == "\\" then
            escaped = true
          else
            if cc == "\"" then
              i = i + 1
              break
            end if
          end if
        end if
        i = i + 1
      end while
      segments = _push_seg(segments, s.substr(line, start_s, i - start_s), "string")
      continue
    end if

    if _is_ident_start(ch) then
      start_i = i
      i = i + 1
      while i < n and _is_ident_part(line[i])
        i = i + 1
      end while
      word = s.substr(line, start_i, i - start_i)
      kind = "ident"
      if _is_keyword(word) then kind = "keyword" end if
      segments = _push_seg(segments, word, kind)
      continue
    end if

    if _is_digit(ch) then
      start_n = i
      i = i + 1
      while i < n
        cc2 = line[i]
        if _is_ident_part(cc2) or cc2 == "." then
          i = i + 1
        else
          break
        end if
      end while
      segments = _push_seg(segments, s.substr(line, start_n, i - start_n), "number")
      continue
    end if

    if ch == " " or ch == "\t" then
      start_w = i
      i = i + 1
      while i < n and (line[i] == " " or line[i] == "\t")
        i = i + 1
      end while
      segments = _push_seg(segments, s.substr(line, start_w, i - start_w), "text")
      continue
    end if

    segments = _push_seg(segments, ch, "operator")
    i = i + 1
  end while
  return segments
end function
