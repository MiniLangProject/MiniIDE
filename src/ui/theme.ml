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

package ui.theme

// Shared MiniIDE theme colors.

import "platform/win32.ml" as win

// Return true when the active theme is dark.
function is_dark(st)
  return typeof(st.theme_mode) == "string" and st.theme_mode == "dark"
end function

// Return the editor background color for the active theme.
function editor_bg(st)
  if is_dark(st) then return win.rgb(30, 31, 34) end if
  return win.rgb(255, 255, 255)
end function

// Return the line-number gutter background color for the active theme.
function gutter_bg(st)
  if is_dark(st) then return win.rgb(43, 45, 48) end if
  return win.rgb(246, 248, 250)
end function

// Return the side and result panel background color for the active theme.
function panel_bg(st)
  if is_dark(st) then return win.rgb(30, 31, 34) end if
  return win.rgb(248, 249, 251)
end function

// Return the toolbar and status chrome background color for the active theme.
function chrome_bg(st)
  if is_dark(st) then return win.rgb(43, 45, 48) end if
  return win.rgb(242, 244, 247)
end function

// Return the border color for the active theme.
function border_color(st)
  if is_dark(st) then return win.rgb(60, 63, 65) end if
  return win.rgb(214, 219, 225)
end function

// Return the editor foreground color for the active theme.
function editor_fg(st)
  if is_dark(st) then return win.rgb(188, 190, 196) end if
  return win.rgb(31, 35, 40)
end function

// Return the muted foreground color for secondary UI text.
function muted_fg(st)
  if is_dark(st) then return win.rgb(122, 126, 133) end if
  return win.rgb(96, 103, 112)
end function

// Return the syntax-highlight color for a token kind.
function syntax_color(st, kind)
  if is_dark(st) then
    if kind == "keyword" then return win.rgb(207, 142, 109) end if
    if kind == "string" then return win.rgb(106, 171, 115) end if
    if kind == "comment" then return win.rgb(128, 128, 128) end if
    if kind == "number" then return win.rgb(42, 172, 184) end if
    if kind == "operator" then return win.rgb(169, 183, 198) end if
    return editor_fg(st)
  end if
  if kind == "keyword" then return win.rgb(25, 88, 180) end if
  if kind == "string" then return win.rgb(163, 58, 38) end if
  if kind == "comment" then return win.rgb(72, 128, 72) end if
  if kind == "number" then return win.rgb(112, 64, 170) end if
  if kind == "operator" then return win.rgb(92, 92, 92) end if
  return win.rgb(31, 35, 40)
end function
