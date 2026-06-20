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

import std.fs as fs
import std.string as s
import "platform/win32.ml" as win
import "project/project.ml" as project
import "project/templates.ml" as templates
import "build/build_service.ml" as build
import "lang/syntax.ml" as syntax
import "help/language.ml" as help_lang
import "ui/theme.ml" as theme
import "ui/markdown.ml" as markdown
import "lang/symbols.ml" as symbols
import "lang/index.ml" as lang_index
import "lang/service.ml" as lang_service

struct AppState
  hwnd,
  main_menu,
  file_menu,
  edit_menu,
  nav_menu,
  config_menu,
  help_menu,
  toolbar_bg,
  tree_images,
  tree,
  tabbar,
  line_numbers,
  editor,
  code_editor,
  log,
  panel_title,
  result_list,
  autocomplete_list,
  status,
  btn_open,
  btn_save,
  btn_build,
  btn_run,
  btn_test,
  btn_reload,
  btn_cut,
  btn_copy,
  btn_paste,
  toolbar_icons,
  font_ui,
  font_code,
  project,
  compiler_path,
  build_keep_going,
  build_max_errors,
  build_subsystem,
  build_extra_args,
  build_profile,
  theme_mode,
  tree_handles,
  tree_paths,
  tree_is_dir,
  open_files,
  open_texts,
  open_saved_texts,
  open_dirty,
  open_undo,
  open_redo,
  open_folds,
  open_markdown_sources,
  open_markdown_docs,
  open_markdown_views,
  open_markdown_view_sources,
  open_markdown_view_themes,
  active_tab,
  current_file,
  current_sel,
  nav_back,
  nav_forward,
  bookmarks,
  last_tree_click_ms,
  last_tree_click_item,
  last_editor_text,
  last_highlight_text,
  last_highlight_first_line,
  last_edit_ms,
  last_undo_ms,
  highlight_pending,
  last_line_numbers_text,
  last_line_numbers_count,
  last_status_text,
  last_first_visible_line,
  last_scroll_ms,
  line_numbers_pending,
  last_w,
  last_h,
  prev_keys,
  prev_mouse,
  prev_right_mouse,
  context_tab,
  file_clipboard_path,
  last_context_ms,
  last_search_text,
  result_mode,
  result_files,
  result_lines,
  result_cols,
  autocomplete_items,
  autocomplete_prefix,
  build_job,
  build_mode,
  build_running,
  build_last_log,
  build_last_poll_ms,
  running,
end struct

struct FoldRange
  start_line,
  end_line,
end struct

struct CompileSettingsControls
  dlg,
  entry_edit,
  output_edit,
  test_entry_edit,
  run_args_edit,
  working_dir_edit,
  compiler_edit,
  max_edit,
  extra_edit,
end struct

struct CompileSettingsValues
  entry,
  output,
  test_entry,
  run_args,
  working_dir,
  compiler,
  max_text,
  extra_args,
end struct

struct NavLocation
  file,
  line,
  col,
end struct

const MENU_H = 26
const TOOL_H = 70
const TAB_H = 30
const LEFT_W = 300
const LINE_NO_W = 58
const LOG_H = 190
const STATUS_H = 24
const STATUS_PAD = 8
const MAX_TABS = 8
const MAX_UNDO = 80
const UNDO_GROUP_MS = 900
const EDIT_SYNC_IDLE_MS = 260
const HIGHLIGHT_IDLE_MS = 450
const HIGHLIGHT_VISIBLE_LINES = 90
const SCROLL_IDLE_MS = 180
const CONTEXT_SUPPRESS_MS = 650
const CONTEXT_FORCE_DUP_MS = 120

const ID_PROJECT_TREE = 1000
const ID_EDITOR_TABS = 1005
const ID_RESULT_LIST = 1090
const ID_AUTOCOMPLETE_LIST = 1091
const ID_FILE_OPEN_PROJECT = 1006
const ID_FILE_SAVE = 1001
const ID_FILE_BUILD = 1002
const ID_FILE_RELOAD = 1003
const ID_FILE_EXIT = 1004
const ID_FILE_RUN = 1007
const ID_FILE_NEW_PROJECT = 1008
const ID_FILE_TEST = 1009
const ID_FILE_CLEAN = 1040
const ID_FILE_REBUILD = 1041
const ID_FILE_STOP = 1042
const ID_FILE_QUICK_OPEN = 1056
const ID_EDIT_CUT = 1010
const ID_EDIT_COPY = 1011
const ID_EDIT_PASTE = 1012
const ID_EDIT_UNDO = 1013
const ID_EDIT_REDO = 1014
const ID_CONFIG_COMPILER_SELECT = 1015
const ID_CONFIG_COMPILER_RESET = 1016
const ID_CONFIG_SHOW = 1017
const ID_CONFIG_RELOAD = 1018
const ID_CONFIG_TOGGLE_KEEP_GOING = 1019
const ID_CONFIG_TOGGLE_SUBSYSTEM = 1021
const ID_CONFIG_TOGGLE_MAX_ERRORS = 1022
const ID_HELP_ABOUT = 1020
const ID_HELP_LANGUAGE = 1023
const ID_HELP_LANGUAGE_SEARCH = 1045
const ID_CONFIG_COMPILE_SETTINGS = 1024
const ID_CONFIG_PROFILE_DEBUG = 1043
const ID_CONFIG_PROFILE_RELEASE = 1044
const ID_CONFIG_THEME_LIGHT = 1046
const ID_CONFIG_THEME_DARK = 1047
const ID_NAV_OUTLINE = 1030
const ID_NAV_SEARCH_WORD = 1031
const ID_NAV_PROBLEMS = 1032
const ID_NAV_PROJECT_INDEX = 1048
const ID_NAV_FIND_REFERENCES = 1049
const ID_NAV_PROJECT_SYMBOLS = 1050
const ID_NAV_GOTO_SYMBOL = 1051
const ID_COMMAND_PALETTE = 1052
const ID_NAV_WORKSPACE_HEALTH = 1053
const ID_NAV_TODOS = 1054
const ID_NAV_TEST_EXPLORER = 1055
const ID_NAV_IMPORT_GRAPH = 1057
const ID_NAV_CALL_HIERARCHY = 1058
const ID_NAV_SYMBOL_INFO = 1059
const ID_NAV_CODE_INSPECTIONS = 1060
const ID_NAV_RELATED_TESTS = 1061
const ID_EDIT_RENAME_SYMBOL = 1062
const ID_FILE_TEST_CURRENT = 1063
const ID_FILE_TEST_RELATED = 1064
const ID_FILE_RECENT_FILES = 1065
const ID_NAV_BACK = 1066
const ID_NAV_FORWARD = 1067
const ID_NAV_TOGGLE_BOOKMARK = 1068
const ID_NAV_BOOKMARKS = 1069
const ID_NAV_NEXT_BOOKMARK = 1070
const ID_NAV_PREV_BOOKMARK = 1071
const ID_NAV_FILE_STRUCTURE = 1072
const ID_NAV_REVEAL_ACTIVE_FILE = 1073
const ID_FILE_SAVE_ALL = 1074
const ID_EDIT_SELECT_ALL = 1075
const ID_EDIT_COMPLETE = 1033
const ID_EDIT_FORMAT = 1034
const ID_HELP_WELCOME = 1035
const ID_NAV_GOTO_LINE = 1036
const ID_EDIT_FIND = 1037
const ID_EDIT_FIND_NEXT = 1038
const ID_NAV_GOTO_DEFINITION = 1039
const ID_WINDOW_MINIMIZE = 1101
const ID_WINDOW_MAXIMIZE = 1102
const ID_WINDOW_RESTORE = 1103

const ID_SETTINGS_ENTRY_BROWSE = 1401
const ID_SETTINGS_COMPILER_BROWSE = 1402
const ID_SETTINGS_KEEP_GOING = 1403
const ID_SETTINGS_SUBSYSTEM = 1404
const ID_SETTINGS_OK = 1405
const ID_SETTINGS_CANCEL = 1406
const ID_SETTINGS_ENTRY_EDIT = 1411
const ID_SETTINGS_OUTPUT_EDIT = 1412
const ID_SETTINGS_COMPILER_EDIT = 1413
const ID_SETTINGS_MAX_EDIT = 1414
const ID_SETTINGS_EXTRA_EDIT = 1415
const ID_SETTINGS_TEST_EDIT = 1416
const ID_SETTINGS_RUN_ARGS_EDIT = 1417
const ID_SETTINGS_WORKDIR_EDIT = 1418

const ID_NEW_PROJECT_NAME_EDIT = 1501
const ID_NEW_PROJECT_PARENT_EDIT = 1502
const ID_NEW_PROJECT_KIND = 1503
const ID_NEW_PROJECT_OK = 1504
const ID_NEW_PROJECT_CANCEL = 1505
const ID_GOTO_LINE_EDIT = 1511
const ID_GOTO_LINE_OK = 1512
const ID_GOTO_LINE_CANCEL = 1513
const ID_FIND_TEXT_EDIT = 1521
const ID_FIND_OK = 1522
const ID_FIND_CANCEL = 1523
const ID_RENAME_TEXT_EDIT = 1531
const ID_RENAME_OK = 1532
const ID_RENAME_CANCEL = 1533
const ID_HELP_SEARCH_TEXT_EDIT = 1541
const ID_HELP_SEARCH_OK = 1542
const ID_HELP_SEARCH_CANCEL = 1543
const ID_SYMBOL_SEARCH_TEXT_EDIT = 1551
const ID_SYMBOL_SEARCH_OK = 1552
const ID_SYMBOL_SEARCH_CANCEL = 1553
const ID_COMMAND_SEARCH_TEXT_EDIT = 1561
const ID_COMMAND_LIST = 1562
const ID_COMMAND_RUN = 1563
const ID_COMMAND_CANCEL = 1564
const ID_QUICK_OPEN_TEXT_EDIT = 1571
const ID_QUICK_OPEN_OK = 1572
const ID_QUICK_OPEN_CANCEL = 1573
const ID_RENAME_SYMBOL_TEXT_EDIT = 1581
const ID_RENAME_SYMBOL_OK = 1582
const ID_RENAME_SYMBOL_CANCEL = 1583
const ID_RENAME_SYMBOL_APPLY = 1584

const ID_CTX_TAB_CLOSE = 1201
const ID_CTX_TAB_CLOSE_OTHERS = 1202
const ID_CTX_TAB_CLOSE_ALL = 1203
const ID_CTX_TREE_OPEN = 1210
const ID_CTX_TREE_NEW_FILE = 1211
const ID_CTX_TREE_NEW_FOLDER = 1212
const ID_CTX_TREE_COPY = 1213
const ID_CTX_TREE_PASTE = 1214
const ID_CTX_TREE_RENAME = 1215
const ID_CTX_TREE_DELETE = 1216
const ID_CTX_TREE_NEW_TEST = 1217
const ID_CTX_EDITOR_SELECT_ALL = 1220
const ID_CTX_LOG_COPY = 1230
const ID_CTX_LOG_SELECT_ALL = 1231
const ID_CTX_LOG_CLEAR = 1232

// Return true when a path is already absolute.
function _is_abs(path)
  if typeof(path) != "string" then return false end if
  if len(path) > 2 and path[1] == ":" then return true end if
  if s.startsWith(path, "\\") or s.startsWith(path, "/") then return true end if
  return false
end function

// Resolve a possibly relative path against the project root.
function _resolve(root, path)
  if _is_abs(path) then return path end if
  return project.path_join(root, path)
end function

// Return the file name portion of a path.
function _basename(path)
  return project.basename(path)
end function

// Return the index of a path in an array, or -1 when absent.
function _path_index(paths, path)
  // Walk collections defensively because project data can be partially populated.
  if typeof(paths) != "array" then return -1 end if
  if typeof(path) != "string" then return -1 end if
  if len(paths) <= 0 then return -1 end if
  for i = 0 to len(paths) - 1
    if paths[i] == path then return i end if
  end for
  return -1
end function

// Return true when a path refers to a built-in virtual document.
function _is_virtual_doc_path(path)
  return typeof(path) == "string" and s.startsWith(path, "miniide://")
end function

// Return true when a path names a Markdown document.
function _is_markdown_path(path)
  if typeof(path) != "string" then return false end if
  lower = s.toLowerAscii(path)
  return s.endsWith(lower, ".md") or s.endsWith(lower, ".markdown")
end function

// Return true when a tab path is read-only.
function _is_readonly_tab_path(path)
  return _is_virtual_doc_path(path)
end function

// Return true when a tab shows generated editor text instead of editable source.
function _is_generated_editor_path(path)
  if _is_readonly_tab_path(path) then return true end if
  return _is_markdown_path(path)
end function

// Return true when the active tab has unsaved changes.
function _active_dirty(st)
  if typeof(st.open_dirty) != "array" then return false end if
  if st.active_tab < 0 or st.active_tab >= len(st.open_dirty) then return false end if
  if st.active_tab < len(st.open_files) then
    if _is_generated_editor_path(st.open_files[st.active_tab]) then return false end if
  end if
  return st.open_dirty[st.active_tab]
end function

// Return the saved text at the requested location.
function _saved_text_at(st, idx)
  if typeof(st.open_saved_texts) != "array" then return "" end if
  if idx < 0 or idx >= len(st.open_saved_texts) then return "" end if
  return st.open_saved_texts[idx]
end function

// Update a tab dirty flag by comparing it with the saved snapshot.
function _set_dirty_from_saved(st, idx)
  if idx < 0 or idx >= len(st.open_texts) or idx >= len(st.open_dirty) then return st end if
  if idx < len(st.open_files) then
    if _is_generated_editor_path(st.open_files[idx]) then
      st.open_dirty[idx] = false
      return st
    end if
  end if
  st.open_dirty[idx] = st.open_texts[idx] != _saved_text_at(st, idx)
  return st
end function

// Push a text snapshot onto an undo or redo stack.
function _push_snapshot(stack, text)
  // Walk collections defensively because project data can be partially populated.
  if typeof(stack) != "array" then stack = [] end if
  if typeof(text) != "string" then text = "" end if
  if len(stack) > 0 and stack[len(stack) - 1] == text then return stack end if
  stack = stack + [text]
  if len(stack) <= MAX_UNDO then return stack end if
  trimmed = []
  start = len(stack) - MAX_UNDO
  for i = start to len(stack) - 1
    trimmed = trimmed + [stack[i]]
  end for
  return trimmed
end function

// Remove the top snapshot from an undo or redo stack.
function _pop_snapshot(stack)
  // Walk collections defensively because project data can be partially populated.
  if typeof(stack) != "array" or len(stack) <= 0 then return [] end if
  result_stack = []
  for i = 0 to len(stack) - 2
    result_stack = result_stack + [stack[i]]
  end for
  return result_stack
end function

// Clear cached syntax highlighting so it will be recomputed.
function _invalidate_highlight(st)
  st.last_highlight_text = ""
  st.last_highlight_first_line = -1
  st.highlight_pending = true
  return st
end function

// Record editor activity used for undo and dirty tracking.
function _record_edit_activity(st)
  now = win.GetTickCount()
  st.last_edit_ms = now
  st.highlight_pending = true
  st.last_line_numbers_text = ""
  st.line_numbers_pending = true
  return st
end function

// Capture the current editor state on the undo stack when needed.
function _record_undo_snapshot(st, idx)
  if idx < 0 or idx >= len(st.open_texts) or idx >= len(st.open_undo) then return st end if
  now = win.GetTickCount()
  should_push = false
  if idx >= len(st.open_dirty) then
    should_push = true
  else if st.open_dirty[idx] == false then
    should_push = true
  else if st.last_undo_ms <= 0 then
    should_push = true
  else if now - st.last_undo_ms >= UNDO_GROUP_MS then
    should_push = true
  end if
  if should_push then
    st.open_undo[idx] = _push_snapshot(st.open_undo[idx], st.open_texts[idx])
    st.last_undo_ms = now
  end if
  return st
end function

// Return true when a cached Markdown view handle is still a live window.
function _markdown_view_is_live(view)
  if typeof(view) != "ptr" then return false end if
  return win.IsWindow(view)
end function

// Create a hidden RichEdit view used to cache one rendered Markdown tab.
function _create_markdown_view(st)
  view = _create_editor(st.hwnd, st.font_ui)
  if view is void then return view end if
  win.set_control_font(view, st.font_ui)
  win.edit_set_readonly(view, true)
  win.edit_allow_large_text(view)
  win.ShowWindow(view, win.SW_HIDE)
  return view
end function

// Destroy a cached Markdown view when its tab is removed.
function _destroy_markdown_view(view)
  if _markdown_view_is_live(view) then win.DestroyWindow(view) end if
end function

// Destroy all cached Markdown views.
function _destroy_all_markdown_views(st)
  if typeof(st.open_markdown_views) != "array" then return st end if
  for i = 0 to len(st.open_markdown_views) - 1
    _destroy_markdown_view(st.open_markdown_views[i])
  end for
  return st
end function

// Ensure the Markdown view cache arrays match the open tab list.
function _ensure_markdown_view_slots(st)
  if typeof(st.open_markdown_views) != "array" then st.open_markdown_views = [] end if
  if typeof(st.open_markdown_view_sources) != "array" then st.open_markdown_view_sources = [] end if
  if typeof(st.open_markdown_view_themes) != "array" then st.open_markdown_view_themes = [] end if
  count = 0
  if typeof(st.open_files) == "array" then count = len(st.open_files) end if
  while len(st.open_markdown_views) < count
    st.open_markdown_views = st.open_markdown_views + [0]
  end while
  while len(st.open_markdown_view_sources) < count
    st.open_markdown_view_sources = st.open_markdown_view_sources + [""]
  end while
  while len(st.open_markdown_view_themes) < count
    st.open_markdown_view_themes = st.open_markdown_view_themes + [""]
  end while
  return st
end function

// Hide every cached Markdown view except the requested tab.
function _hide_markdown_views_except(st, keep_idx)
  if typeof(st.open_markdown_views) != "array" then return st end if
  for i = 0 to len(st.open_markdown_views) - 1
    view = st.open_markdown_views[i]
    if i != keep_idx and _markdown_view_is_live(view) then win.ShowWindow(view, win.SW_HIDE) end if
  end for
  return st
end function

// Mark one cached Markdown view stale without destroying the rendered document cache.
function _invalidate_markdown_view(st, idx)
  if idx < 0 then return st end if
  st = _ensure_markdown_view_slots(st)
  if idx < len(st.open_markdown_view_sources) then st.open_markdown_view_sources[idx] = "" end if
  if idx < len(st.open_markdown_view_themes) then st.open_markdown_view_themes[idx] = "" end if
  return st
end function

// Mark the active tab dirty after a pending editor notification.
function _mark_active_dirty_pending(st)
  idx = st.active_tab
  if idx < 0 or idx >= len(st.open_files) or idx >= len(st.open_dirty) then return st end if
  if _is_generated_editor_path(st.open_files[idx]) then
    st.open_dirty[idx] = false
    win.edit_set_modified(st.editor, false)
    return st
  end if
  if st.open_dirty[idx] == false then
    st = _record_undo_snapshot(st, idx)
    st.open_redo[idx] = []
    st.open_dirty[idx] = true
    st.last_line_numbers_text = ""
    st.line_numbers_pending = true
    st = _refresh_tabs(st)
    _set_title(st)
  end if
  return st
end function

// Replace the result log text and refresh the log control.
function _set_log(st, text)
  if typeof(text) != "string" then text = "" end if
  st.result_mode = "log"
  win.ShowWindow(st.log, win.SW_SHOW)
  win.ShowWindow(st.panel_title, win.SW_HIDE)
  win.ShowWindow(st.result_list, win.SW_HIDE)
  win.ShowWindow(st.autocomplete_list, win.SW_HIDE)
  win.set_window_text(st.log, text)
  win.edit_set_background(st.log, theme.panel_bg(st))
  win.rich_set_all_color(st.log, theme.editor_fg(st))
  win.edit_setsel(st.log, len(text), len(text))
  win.edit_scroll_caret(st.log)
  return st
end function

// Show result panel.
function _show_result_panel(st, mode, title, rows, files, lines, cols)
  // Walk collections defensively because project data can be partially populated.
  if typeof(mode) != "string" then mode = "results" end if
  if typeof(title) != "string" then title = "Results" end if
  if typeof(rows) != "array" then rows = [] end if
  if typeof(files) != "array" then files = [] end if
  if typeof(lines) != "array" then lines = [] end if
  if typeof(cols) != "array" then cols = [] end if
  st.result_mode = mode
  st.result_files = files
  st.result_lines = lines
  st.result_cols = cols
  win.set_window_text(st.panel_title, title)
  win.edit_set_background(st.panel_title, theme.chrome_bg(st))
  win.rich_set_all_color(st.panel_title, theme.editor_fg(st))
  win.listbox_reset(st.result_list)
  if len(rows) > 0 then
    for i = 0 to len(rows) - 1
      win.listbox_add(st.result_list, rows[i])
    end for
    win.listbox_setsel(st.result_list, 0)
  end if
  win.ShowWindow(st.log, win.SW_HIDE)
  win.ShowWindow(st.panel_title, win.SW_SHOW)
  win.ShowWindow(st.result_list, win.SW_SHOW)
  return st
end function

// Resolve result file.
function _resolve_result_file(st, file)
  if typeof(file) != "string" or file == "" then return "" end if
  if _is_abs(file) == false and typeof(st.project) == "struct" then
    return project.resolve_project_path(st.project, file)
  end if
  return file
end function

// Return the current editor location for navigation history.
function _current_nav_location(st)
  if typeof(st.current_file) != "string" or st.current_file == "" then return end if
  if st.active_tab < 0 or st.active_tab >= len(st.open_files) then return end if
  sel = win.edit_getsel(st.editor)
  pos = sel[0]
  line = win.edit_line_from_char(st.editor, pos) + 1
  line_start = win.edit_line_index(st.editor, line - 1)
  col = 1
  if typeof(line_start) == "int" and line_start >= 0 then col = pos - line_start + 1 end if
  if line < 1 then line = 1 end if
  if col < 1 then col = 1 end if
  return NavLocation(st.current_file, line, col)
end function

// Return true when two navigation locations point to the same place.
function _same_nav_location(a, b)
  if typeof(a) != "struct" or typeof(b) != "struct" then return false end if
  return a.file == b.file and a.line == b.line and a.col == b.col
end function

// Push one location onto a bounded navigation stack.
function _push_nav_stack(stack, loc)
  if typeof(stack) != "array" then stack = [] end if
  if typeof(loc) != "struct" then return stack end if
  if len(stack) > 0 and _same_nav_location(stack[len(stack) - 1], loc) then return stack end if
  stack = stack + [loc]
  if len(stack) <= 80 then return stack end if
  trimmed = []
  for i = len(stack) - 80 to len(stack) - 1
    trimmed = trimmed + [stack[i]]
  end for
  return trimmed
end function

// Return a stack without the last navigation item.
function _pop_nav_stack(stack)
  if typeof(stack) != "array" or len(stack) <= 0 then return [] end if
  result = []
  for i = 0 to len(stack) - 2
    result = result + [stack[i]]
  end for
  return result
end function

// Record the current location before an explicit navigation jump.
function _record_navigation(st)
  loc = _current_nav_location(st)
  if typeof(loc) != "struct" then return st end if
  st.nav_back = _push_nav_stack(st.nav_back, loc)
  st.nav_forward = []
  return st
end function

// Open a navigation location without recording a new history entry.
function _open_nav_location(st, loc)
  if typeof(loc) != "struct" then return st end if
  st = _open_file(st, loc.file)
  return _jump_to_line_col(st, loc.line, loc.col)
end function

// Navigate backward through jump history.
function _navigate_back(st)
  if typeof(st.nav_back) != "array" or len(st.nav_back) <= 0 then return _set_log(st, "Navigation Back: no previous location.") end if
  current = _current_nav_location(st)
  loc = st.nav_back[len(st.nav_back) - 1]
  st.nav_back = _pop_nav_stack(st.nav_back)
  if typeof(current) == "struct" then st.nav_forward = _push_nav_stack(st.nav_forward, current) end if
  st = _open_nav_location(st, loc)
  return _set_log(st, "Navigation Back: " + _project_relative_path(st, loc.file) + ":" + loc.line + ":" + loc.col)
end function

// Navigate forward through jump history.
function _navigate_forward(st)
  if typeof(st.nav_forward) != "array" or len(st.nav_forward) <= 0 then return _set_log(st, "Navigation Forward: no next location.") end if
  current = _current_nav_location(st)
  loc = st.nav_forward[len(st.nav_forward) - 1]
  st.nav_forward = _pop_nav_stack(st.nav_forward)
  if typeof(current) == "struct" then st.nav_back = _push_nav_stack(st.nav_back, current) end if
  st = _open_nav_location(st, loc)
  return _set_log(st, "Navigation Forward: " + _project_relative_path(st, loc.file) + ":" + loc.line + ":" + loc.col)
end function

// Toggle a bookmark at the current editor line.
function _toggle_bookmark(st)
  loc = _current_nav_location(st)
  if typeof(loc) != "struct" then return _set_log(st, "Toggle Bookmark: no file is open.") end if
  if typeof(st.bookmarks) != "array" then st.bookmarks = [] end if
  label = _project_relative_path(st, loc.file) + ":" + loc.line
  updated = []
  removed = false
  for i = 0 to len(st.bookmarks) - 1
    item = st.bookmarks[i]
    if typeof(item) == "struct" and item.file == loc.file and item.line == loc.line then
      removed = true
    else
      updated = updated + [item]
    end if
  end for
  if removed then
    st.bookmarks = updated
    return _set_log(st, "Bookmark removed: " + label)
  end if
  st.bookmarks = st.bookmarks + [loc]
  return _set_log(st, "Bookmark added: " + label)
end function

// Show all session bookmarks in the result panel.
function _show_bookmarks(st)
  if typeof(st.bookmarks) != "array" or len(st.bookmarks) <= 0 then return _set_log(st, "Bookmarks: no bookmarks set.") end if

  rows = []
  files = []
  lines_out = []
  cols = []
  for i = 0 to len(st.bookmarks) - 1
    item = st.bookmarks[i]
    if typeof(item) != "struct" then continue end if
    rows = rows + [_project_relative_path(st, item.file) + ":" + item.line + ":" + item.col]
    files = files + [item.file]
    lines_out = lines_out + [item.line]
    cols = cols + [item.col]
  end for

  if len(rows) <= 0 then return _set_log(st, "Bookmarks: no bookmarks set.") end if
  return _show_result_panel(st, "bookmarks", "Bookmarks", rows, files, lines_out, cols)
end function

// Jump to the next or previous session bookmark.
function _goto_bookmark(st, step)
  if typeof(st.bookmarks) != "array" or len(st.bookmarks) <= 0 then return _set_log(st, "Bookmarks: no bookmarks set.") end if
  current = _current_nav_location(st)
  idx = -1
  if typeof(current) == "struct" then
    for i = 0 to len(st.bookmarks) - 1
      item = st.bookmarks[i]
      if typeof(item) == "struct" and item.file == current.file and item.line == current.line then idx = i end if
    end for
  end if

  target = 0
  label = "Next Bookmark"
  if step < 0 then
    label = "Previous Bookmark"
    target = len(st.bookmarks) - 1
    if idx >= 0 then target = idx - 1 end if
    if target < 0 then target = len(st.bookmarks) - 1 end if
  else
    if idx >= 0 then target = idx + 1 end if
    if target >= len(st.bookmarks) then target = 0 end if
  end if

  loc = st.bookmarks[target]
  if typeof(loc) != "struct" then return _set_log(st, label + ": invalid bookmark.") end if
  st = _record_navigation(st)
  st = _open_nav_location(st, loc)
  return _set_log(st, label + ": " + _project_relative_path(st, loc.file) + ":" + loc.line + ":" + loc.col)
end function

// Open problem location.
function _open_problem_location(st, file, line_no, col_no)
  file = _resolve_result_file(st, file)
  if typeof(file) != "string" or file == "" then return st end if
  if typeof(line_no) != "int" then line_no = 1 end if
  if typeof(col_no) != "int" then col_no = 1 end if
  if line_no < 1 then line_no = 1 end if
  if col_no < 1 then col_no = 1 end if
  st = _record_navigation(st)
  st = _open_file(st, file)
  return _jump_to_line_col(st, line_no, col_no)
end function

// Open result selection.
function _open_result_selection(st)
  idx = win.listbox_getsel(st.result_list)
  if typeof(idx) != "int" or idx < 0 then return st end if
  if typeof(st.result_files) != "array" or idx >= len(st.result_files) then return st end if
  file = st.result_files[idx]
  if typeof(file) != "string" or file == "" then return st end if
  line_no = 1
  if typeof(st.result_lines) == "array" and idx < len(st.result_lines) then line_no = st.result_lines[idx] end if
  col_no = 1
  if typeof(st.result_cols) == "array" and idx < len(st.result_cols) then col_no = st.result_cols[idx] end if
  return _open_problem_location(st, file, line_no, col_no)
end function

// Split the result log into individual display lines.
function _log_lines(text)
  if typeof(text) != "string" then text = "" end if
  text = s.replaceAll(text, "\r\n", "\n")
  text = s.replaceAll(text, "\r", "\n")
  return s.split(text, "\n")
end function

// Find the diagnostic associated with a result-log line.
function _diagnostic_near_log_line(lines, line_idx)
  // Walk collections defensively because project data can be partially populated.
  if typeof(lines) != "array" or len(lines) <= 0 then return end if
  if typeof(line_idx) != "int" then return end if
  first = line_idx - 3
  if first < 0 then first = 0 end if
  last = line_idx + 3
  if last >= len(lines) then last = len(lines) - 1 end if
  snippet = ""
  for i = first to last
    if i > first then snippet = snippet + "\n" end if
    snippet = snippet + lines[i]
  end for
  items = build.parse_diagnostics(snippet)
  if typeof(items) == "array" and len(items) > 0 then return items[0] end if
end function

// Open log diagnostic at.
function _open_log_diagnostic_at(st, x, y)
  d = _log_diagnostic_at(st, x, y)
  if typeof(d) != "struct" then return st end if
  return _open_problem_location(st, d.file, d.line, d.col)
end function

// Return the log diagnostic at the requested location.
function _log_diagnostic_at(st, x, y)
  line_idx = win.edit_line_from_pos(st.log, x, y)
  if typeof(line_idx) != "int" or line_idx < 0 then return end if
  lines = _log_lines(win.edit_get_text(st.log))
  return _diagnostic_near_log_line(lines, line_idx)
end function

// Return true when the mouse is over a clickable log diagnostic.
function _mouse_over_log_diagnostic(st, x, y)
  return typeof(_log_diagnostic_at(st, x, y)) == "struct"
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

// Return the active folds.
function _active_folds(st)
  return []
end function

// Return the fold index at the requested location.
function _fold_index_at(folds, source_line)
  // Walk collections defensively because project data can be partially populated.
  if typeof(folds) != "array" or len(folds) <= 0 then return -1 end if
  for i = 0 to len(folds) - 1
    f = folds[i]
    if typeof(f) == "struct" and f.start_line == source_line then return i end if
  end for
  return -1
end function

// Return the fold end at the requested location.
function _fold_end_at(folds, source_line)
  idx = _fold_index_at(folds, source_line)
  if idx < 0 then return -1 end if
  return folds[idx].end_line
end function

// Return the fold start kind.
function _fold_start_kind(line)
  line = s.trim(s.toLowerAscii(_strip_cr(line)))
  if s.startsWith(line, "function ") then return "function" end if
  if s.startsWith(line, "if ") and s.indexOf(line, " then", 0) >= 0 then return "if" end if
  if s.startsWith(line, "for ") then return "for" end if
  if s.startsWith(line, "while ") then return "while" end if
  if s.startsWith(line, "struct ") then return "struct" end if
  return ""
end function

// Return the fold end kind.
function _fold_end_kind(line)
  line = s.trim(s.toLowerAscii(_strip_cr(line)))
  if line == "end function" then return "function" end if
  if line == "end if" then return "if" end if
  if line == "end for" then return "for" end if
  if line == "end while" then return "while" end if
  if line == "end struct" then return "struct" end if
  return ""
end function

// Find fold end.
function _find_fold_end(lines, start_line)
  if typeof(lines) != "array" or start_line < 0 or start_line >= len(lines) then return -1 end if
  kind = _fold_start_kind(lines[start_line])
  if kind == "" then return -1 end if
  depth = 0
  i = start_line + 1
  while i < len(lines)
    k = _fold_start_kind(lines[i])
    e = _fold_end_kind(lines[i])
    if k == kind then depth = depth + 1 end if
    if e == kind then
      if depth == 0 then return i end if
      depth = depth - 1
    end if
    i = i + 1
  end while
  return -1
end function

// Return the visible text from source.
function _visible_text_from_source(text, folds)
  text = _normalize_editor_text(text)
  if typeof(folds) != "array" or len(folds) <= 0 then return text end if
  lines = s.split(text, "\n")
  visible_text = ""
  i = 0
  while i < len(lines)
    if i > 0 then visible_text = visible_text + "\n" end if
    end_line = _fold_end_at(folds, i)
    if end_line > i then
      visible_text = visible_text + lines[i] + "  ..."
      i = end_line + 1
    else
      visible_text = visible_text + lines[i]
      i = i + 1
    end if
  end while
  return visible_text
end function

// Return the display to source line.
function _display_to_source_line(text, folds, display_line)
  text = _normalize_editor_text(text)
  if display_line <= 0 then return 0 end if
  lines = s.split(text, "\n")
  visible = 0
  i = 0
  while i < len(lines)
    if visible == display_line then return i end if
    end_line = _fold_end_at(folds, i)
    if end_line > i then
      i = end_line + 1
    else
      i = i + 1
    end if
    visible = visible + 1
  end while
  if len(lines) <= 0 then return 0 end if
  return len(lines) - 1
end function

// Return the source line to display line.
function _source_line_to_display_line(text, folds, source_line)
  text = _normalize_editor_text(text)
  lines = s.split(text, "\n")
  visible = 0
  i = 0
  while i < len(lines)
    if i >= source_line then return visible end if
    end_line = _fold_end_at(folds, i)
    if end_line > i then
      if source_line <= end_line then return visible end if
      i = end_line + 1
    else
      i = i + 1
    end if
    visible = visible + 1
  end while
  return visible
end function

// Read editor.
function _read_editor(st)
  return _normalize_editor_text(win.edit_get_text(st.editor))
end function

// Write editor.
function _write_editor(st, text)
  win.edit_set_readonly(st.editor, false)
  win.set_window_text(st.editor, _editor_display_text(text))
  win.edit_set_background(st.editor, theme.editor_bg(st))
  win.rich_set_all_color(st.editor, theme.editor_fg(st))
  win.edit_setsel(st.editor, 0, 0)
  win.edit_scroll_caret(st.editor)
  win.edit_set_modified(st.editor, false)
  return st
end function

// Activate and populate the cached view for the current Markdown tab.
function _write_markdown_active_editor(st, text, preserve_view)
  idx = st.active_tab
  source = _normalize_editor_text(text)
  st = _ensure_markdown_view_slots(st)
  if idx < 0 or idx >= len(st.open_files) then
    return markdown.write_editor(st, text, preserve_view)
  end if

  view = st.open_markdown_views[idx]
  if _markdown_view_is_live(view) == false then
    view = _create_markdown_view(st)
    if view is void then return markdown.write_editor(st, text, preserve_view) end if
    st.open_markdown_views[idx] = view
    st.open_markdown_view_sources[idx] = ""
    st.open_markdown_view_themes[idx] = ""
  end if

  st = _hide_markdown_views_except(st, idx)
  win.ShowWindow(st.code_editor, win.SW_HIDE)
  st.editor = view

  if st.open_markdown_view_sources[idx] == source and st.open_markdown_view_themes[idx] == st.theme_mode then
    win.ShowWindow(view, win.SW_SHOW)
    win.edit_set_modified(view, false)
    st.highlight_pending = false
    return st
  end if

  st = markdown.write_editor(st, text, preserve_view)
  st.open_markdown_view_sources[idx] = source
  st.open_markdown_view_themes[idx] = st.theme_mode
  win.ShowWindow(view, win.SW_SHOW)
  return st
end function

// Write active editor.
function _write_active_editor(st, text)
  if _active_is_markdown(st) then return _write_markdown_active_editor(st, text, false) end if
  st = _hide_markdown_views_except(st, -1)
  st.editor = st.code_editor
  win.ShowWindow(st.code_editor, win.SW_SHOW)
  win.set_control_font(st.editor, st.font_code)
  folds = _active_folds(st)
  return _write_editor(st, _visible_text_from_source(text, folds))
end function

// Remove carriage returns from editor or log text.
function _strip_cr(line)
  if typeof(line) != "string" then return "" end if
  if len(line) > 0 and line[len(line) - 1] == "\r" then
    return s.substr(line, 0, len(line) - 1)
  end if
  return line
end function

// Return true when the active tab displays Markdown content.
function _active_is_markdown(st)
  if st.active_tab < 0 or st.active_tab >= len(st.open_files) then return false end if
  return _is_markdown_path(st.open_files[st.active_tab])
end function

// Re-render the active Markdown tab with the current theme.
function _refresh_active_markdown_view(st, preserve_view)
  raw = ""
  if st.active_tab >= 0 then
    if st.active_tab < len(st.open_texts) then raw = st.open_texts[st.active_tab] end if
  end if
  st = _write_markdown_active_editor(st, raw, preserve_view)
  if st.active_tab >= 0 then
    if st.active_tab < len(st.open_dirty) then
      was_dirty = st.open_dirty[st.active_tab]
      st.open_dirty[st.active_tab] = false
      if was_dirty then
        st = _refresh_tabs(st)
        _set_title(st)
      end if
    end if
  end if
  return st
end function

// Apply syntax highlight.
function _apply_syntax_highlight(st)
  // Walk collections defensively because project data can be partially populated.
  if _active_is_markdown(st) then
    return _refresh_active_markdown_view(st, true)
  end if
  text = _read_editor(st)
  first = win.edit_first_visible_line(st.editor)
  if first < 0 then first = 0 end if
  if text == st.last_highlight_text and first == st.last_highlight_first_line and st.highlight_pending == false then return st end if
  base_color = theme.editor_fg(st)
  was_modified = win.edit_is_modified(st.editor)
  sel = win.edit_getsel(st.editor)
  scroll = win.edit_get_scroll_pos(st.editor)
  win.edit_set_redraw(st.editor, false)

  lines = s.split(text, "\n")
  line_count = win.edit_line_count(st.editor)
  if typeof(lines) == "array" and len(lines) > 0 then
    if first < len(lines) then
      last = first + HIGHLIGHT_VISIBLE_LINES
      if last >= len(lines) then last = len(lines) - 1 end if
      for li = first to last
        if li >= line_count then break end if
        pos = win.edit_line_index(st.editor, li)
        if pos < 0 then continue end if
        line = _strip_cr(lines[li])
        win.rich_set_color(st.editor, pos, pos + len(line), base_color)
        segments = syntax.line_segments(line)
        off = 0
        if typeof(segments) == "array" and len(segments) > 0 then
          for si = 0 to len(segments) - 1
            seg = segments[si]
            if typeof(seg) != "struct" then continue end if
            seg_len = len(seg.text)
            color = theme.syntax_color(st, seg.kind)
            if color != base_color then
              win.rich_set_color(st.editor, pos + off, pos + off + seg_len, color)
            end if
            off = off + seg_len
          end for
        end if
      end for
    end if
  end if

  win.edit_setsel(st.editor, sel[0], sel[1])
  win.edit_set_scroll_pos(st.editor, scroll[0], scroll[1])
  win.edit_set_redraw(st.editor, true)
  win.edit_set_scroll_pos(st.editor, scroll[0], scroll[1])
  win.edit_set_modified(st.editor, was_modified)
  st.last_highlight_text = text
  st.last_highlight_first_line = first
  st.highlight_pending = false
  return st
end function

// Set title.
function _set_title(st)
  name = "MiniIDE"
  if typeof(st.project) == "struct" then name = st.project.name end if
  file = _basename(st.current_file)
  if file != "" and _active_dirty(st) then file = "*" + file end if
  if file != "" then
    win.set_window_text(st.hwnd, "MiniIDE - " + name + " - " + file)
  else
    win.set_window_text(st.hwnd, "MiniIDE - " + name)
  end if
end function

// Return the configuration path.
function _config_path(p)
  root = "."
  if typeof(p) == "struct" then root = p.root end if
  return project.path_join(root, ".miniide.cfg")
end function

// Load configuration value.
function _load_config_value(p, wanted_key, default_value)
  // Walk collections defensively because project data can be partially populated.
  cfg = _config_path(p)
  if fs.exists(cfg) == false then return default_value end if
  text = fs.readAllText(cfg)
  if typeof(text) != "string" then return default_value end if
  lines = s.split(s.replaceAll(text, "\r\n", "\n"), "\n")
  if typeof(lines) != "array" then return default_value end if
  if len(lines) <= 0 then return default_value end if
  for i = 0 to len(lines) - 1
    line = s.trim(lines[i])
    if line == "" or s.startsWith(line, "#") or s.startsWith(line, "//") then continue end if
    eq = s.indexOf(line, "=", 0)
    if eq < 0 then continue end if
    key = s.trim(s.substr(line, 0, eq))
    value = s.trim(s.substr(line, eq + 1, len(line) - eq - 1))
    if key == wanted_key then return value end if
  end for
  return default_value
end function

// Return the boolean from text.
function _bool_from_text(value, default_value)
  value = s.toLowerAscii(value)
  if value == "true" or value == "1" or value == "yes" or value == "on" then return true end if
  if value == "false" or value == "0" or value == "no" or value == "off" then return false end if
  return default_value
end function

// Return the integer from text.
function _int_from_text(value, default_value)
  n = toNumber(value)
  if typeof(n) == "int" then return n end if
  return default_value
end function

// Load configuration boolean.
function _load_config_bool(p, key, default_value)
  return _bool_from_text(_load_config_value(p, key, ""), default_value)
end function

// Load configuration integer.
function _load_config_int(p, key, default_value)
  return _int_from_text(_load_config_value(p, key, ""), default_value)
end function

// Load build profile.
function _load_build_profile(p)
  value = s.toLowerAscii(_load_config_value(p, "profile", "debug"))
  if value == "release" then return "release" end if
  return "debug"
end function

// Load theme mode.
function _load_theme_mode(p)
  value = s.toLowerAscii(_load_config_value(p, "theme", "dark"))
  if value == "light" then return "light" end if
  return "dark"
end function

// Return the profile config value.
function _profile_config_value(p, profile, key, default_value)
  if typeof(profile) != "string" or profile == "" then return default_value end if
  value = _load_config_value(p, profile + "." + key, "")
  if value != "" then return value end if
  return default_value
end function

// Load compiler path.
function _load_compiler_path(p)
  return _load_config_value(p, "compiler", "")
end function

// Load build keep going.
function _load_build_keep_going(p)
  return _load_config_bool(p, "keepGoing", true)
end function

// Load build max errors.
function _load_build_max_errors(p)
  n = _load_config_int(p, "maxErrors", 20)
  if n < 1 then n = 1 end if
  return n
end function

// Load build subsystem.
function _load_build_subsystem(p)
  value = s.toLowerAscii(_load_config_value(p, "subsystem", "windows"))
  if value == "console" or value == "cui" then return "console" end if
  return "windows"
end function

// Load build extra args.
function _load_build_extra_args(p)
  return _load_config_value(p, "extraArgs", "")
end function

// Load build configuration.
function _load_build_config(st)
  profile = _load_build_profile(st.project)
  st.build_profile = profile
  st.theme_mode = _load_theme_mode(st.project)
  st.compiler_path = _load_compiler_path(st.project)
  st.build_keep_going = _load_build_keep_going(st.project)
  st.build_max_errors = _load_build_max_errors(st.project)
  st.build_subsystem = _load_build_subsystem(st.project)
  st.build_extra_args = _load_build_extra_args(st.project)
  st.build_keep_going = _bool_from_text(_profile_config_value(st.project, profile, "keepGoing", ""), st.build_keep_going)
  st.build_max_errors = _int_from_text(_profile_config_value(st.project, profile, "maxErrors", ""), st.build_max_errors)
  if st.build_max_errors < 1 then st.build_max_errors = 1 end if
  prof_subsystem = s.toLowerAscii(_profile_config_value(st.project, profile, "subsystem", ""))
  if prof_subsystem == "console" or prof_subsystem == "cui" then
    st.build_subsystem = "console"
  else if prof_subsystem == "windows" or prof_subsystem == "gui" then
    st.build_subsystem = "windows"
  end if
  st.build_extra_args = _profile_config_value(st.project, profile, "extraArgs", st.build_extra_args)
  return st
end function

// Save configuration.
function _save_config(st)
  cfg = _config_path(st.project)
  text = "# MiniIDE project configuration\n"
  text = text + "# Build options are used by File > Build.\n"
  text = text + "profile=" + st.build_profile + "\n"
  text = text + "theme=" + st.theme_mode + "\n"
  text = text + "compiler=" + st.compiler_path + "\n"
  text = text + "keepGoing=" + st.build_keep_going + "\n"
  text = text + "maxErrors=" + st.build_max_errors + "\n"
  text = text + "subsystem=" + st.build_subsystem + "\n"
  text = text + "extraArgs=" + st.build_extra_args + "\n"
  text = text + "\n# Optional profile overrides, for example:\n"
  text = text + "# debug.maxErrors=80\n"
  text = text + "# release.keepGoing=false\n"
  text = text + "# release.extraArgs=\n"
  wr = fs.writeAllText(cfg, text)
  if typeof(wr) == "error" then
    return _set_log(st, "Config save failed: " + wr.message)
  end if
  return _set_log(st, "Saved configuration: " + cfg)
end function

// Save compiler path.
function _save_compiler_path(st)
  return _save_config(st)
end function

// Return the effective compiler.
function _effective_compiler(st)
  if typeof(st.compiler_path) == "string" and st.compiler_path != "" then return st.compiler_path end if
  return build.default_compiler(st.project)
end function

// Apply theme.
function _apply_theme(st)
  // Walk collections defensively because project data can be partially populated.
  dark = theme.is_dark(st)
  win.set_window_dark_mode(st.hwnd, dark)
  win.set_menu_bar(st.hwnd, void)
  win.set_control_dark_theme(st.tree, dark)
  win.set_control_dark_theme(st.tabbar, dark)
  win.set_control_dark_theme(st.result_list, dark)
  win.set_control_dark_theme(st.autocomplete_list, dark)
  win.tree_set_colors(st.tree, theme.panel_bg(st), theme.editor_fg(st), theme.border_color(st))
  win.edit_set_background(st.toolbar_bg, theme.chrome_bg(st))
  win.rich_set_all_color(st.toolbar_bg, theme.muted_fg(st))
  toolbar_buttons = [st.btn_open, st.btn_save, st.btn_build, st.btn_run, st.btn_test, st.btn_reload, st.btn_cut, st.btn_copy, st.btn_paste]
  for i = 0 to len(toolbar_buttons) - 1
    win.set_control_dark_theme(toolbar_buttons[i], dark)
    win.edit_set_background(toolbar_buttons[i], theme.chrome_bg(st))
    win.rich_set_all_color(toolbar_buttons[i], theme.editor_fg(st))
  end for
  if typeof(st.toolbar_icons) == "array" then
    for i = 0 to len(st.toolbar_icons) - 1
      win.edit_set_background(st.toolbar_icons[i], theme.chrome_bg(st))
      win.rich_set_all_color(st.toolbar_icons[i], theme.editor_fg(st))
    end for
  end if
  win.InvalidateRect(st.tabbar, void, true)
  win.edit_set_background(st.editor, theme.editor_bg(st))
  win.rich_set_all_color(st.editor, theme.editor_fg(st))
  win.edit_set_background(st.line_numbers, theme.gutter_bg(st))
  win.rich_set_all_color(st.line_numbers, theme.muted_fg(st))
  win.edit_set_background(st.log, theme.panel_bg(st))
  win.rich_set_all_color(st.log, theme.editor_fg(st))
  win.edit_set_background(st.panel_title, theme.chrome_bg(st))
  win.rich_set_all_color(st.panel_title, theme.editor_fg(st))
  win.edit_set_background(st.status, theme.chrome_bg(st))
  win.rich_set_all_color(st.status, theme.muted_fg(st))
  st.last_highlight_text = ""
  st.highlight_pending = true
  st.last_line_numbers_text = ""
  st.last_status_text = ""
  win.InvalidateRect(st.hwnd, void, true)
  return st
end function

// Select theme.
function _select_theme(st, mode)
  if mode != "light" then mode = "dark" end if
  st.theme_mode = mode
  st = _apply_theme(st)
  if _active_is_markdown(st) then st = _refresh_active_markdown_view(st, true) end if
  st = _save_config(st)
  return _set_log(st, "Theme active: " + mode)
end function

// Join imports.
function _join_imports(imports)
  // Walk collections defensively because project data can be partially populated.
  if typeof(imports) != "array" or len(imports) <= 0 then return "(none)" end if
  text = ""
  for i = 0 to len(imports) - 1
    if i > 0 then text = text + "; " end if
    text = text + imports[i]
  end for
  return text
end function

// Create menus.
function _create_menus()
  // Keep validation near the top so callers can treat invalid input as a no-op.
  main_menu = win.CreateMenu()
  file_menu = win.CreatePopupMenu()
  edit_menu = win.CreatePopupMenu()
  nav_menu = win.CreatePopupMenu()
  config_menu = win.CreatePopupMenu()
  help_menu = win.CreatePopupMenu()

  win.AppendMenuWId(config_menu, win.MF_STRING, ID_CONFIG_COMPILE_SETTINGS, "&Compile Settings...")
  win.AppendMenuWId(config_menu, win.MF_STRING, ID_CONFIG_PROFILE_DEBUG, "Build Profile: &Debug")
  win.AppendMenuWId(config_menu, win.MF_STRING, ID_CONFIG_PROFILE_RELEASE, "Build Profile: &Release")
  win.AppendMenuWId(config_menu, win.MF_SEPARATOR, 0, "")
  win.AppendMenuWId(config_menu, win.MF_STRING, ID_CONFIG_THEME_DARK, "Theme: &Dark")
  win.AppendMenuWId(config_menu, win.MF_STRING, ID_CONFIG_THEME_LIGHT, "Theme: &Light")
  win.AppendMenuWId(config_menu, win.MF_SEPARATOR, 0, "")
  win.AppendMenuWId(config_menu, win.MF_STRING, ID_CONFIG_COMPILER_SELECT, "Select &Compiler...")
  win.AppendMenuWId(config_menu, win.MF_STRING, ID_CONFIG_COMPILER_RESET, "Reset Compiler to &Default")
  win.AppendMenuWId(config_menu, win.MF_SEPARATOR, 0, "")
  win.AppendMenuWId(config_menu, win.MF_STRING, ID_CONFIG_TOGGLE_KEEP_GOING, "Toggle &Keep-going")
  win.AppendMenuWId(config_menu, win.MF_STRING, ID_CONFIG_TOGGLE_MAX_ERRORS, "Max &Errors 20/80")
  win.AppendMenuWId(config_menu, win.MF_STRING, ID_CONFIG_TOGGLE_SUBSYSTEM, "&Subsystem Windows/Console")
  win.AppendMenuWId(config_menu, win.MF_STRING, ID_CONFIG_RELOAD, "&Reload Configuration")
  win.AppendMenuWId(config_menu, win.MF_SEPARATOR, 0, "")
  win.AppendMenuWId(config_menu, win.MF_STRING, ID_CONFIG_SHOW, "&Show Configuration")

  win.AppendMenuWId(file_menu, win.MF_STRING, ID_FILE_OPEN_PROJECT, "&Open Project...\tCtrl+O")
  win.AppendMenuWId(file_menu, win.MF_STRING, ID_FILE_QUICK_OPEN, "Quick Open &File...\tCtrl+P")
  win.AppendMenuWId(file_menu, win.MF_STRING, ID_FILE_RECENT_FILES, "Recent Fil&es\tCtrl+E")
  win.AppendMenuWId(file_menu, win.MF_STRING, ID_FILE_NEW_PROJECT, "&New Project...")
  win.AppendMenuWId(file_menu, win.MF_STRING, ID_FILE_RELOAD, "&Reload Project")
  win.AppendMenuWId(file_menu, win.MF_SEPARATOR, 0, "")
  win.AppendMenuWId(file_menu, win.MF_STRING, ID_FILE_SAVE, "&Save\tCtrl+S")
  win.AppendMenuWId(file_menu, win.MF_STRING, ID_FILE_SAVE_ALL, "Save &All\tCtrl+Shift+S")
  win.AppendMenuWId(file_menu, win.MF_STRING, ID_FILE_CLEAN, "&Clean")
  win.AppendMenuWId(file_menu, win.MF_STRING, ID_FILE_BUILD, "&Build\tF5")
  win.AppendMenuWId(file_menu, win.MF_STRING, ID_FILE_REBUILD, "&Rebuild")
  win.AppendMenuWId(file_menu, win.MF_STRING, ID_FILE_RUN, "&Run\tF6")
  win.AppendMenuWId(file_menu, win.MF_STRING, ID_FILE_STOP, "St&op")
  win.AppendMenuWId(file_menu, win.MF_STRING, ID_FILE_TEST, "Run &Tests\tF7")
  win.AppendMenuWId(file_menu, win.MF_STRING, ID_FILE_TEST_CURRENT, "Run Current Test &File\tCtrl+F7")
  win.AppendMenuWId(file_menu, win.MF_STRING, ID_FILE_TEST_RELATED, "Run &Related Test File\tCtrl+Shift+F7")
  win.AppendMenuWId(file_menu, win.MF_SEPARATOR, 0, "")
  win.AppendMenuWId(file_menu, win.MF_STRING, ID_FILE_EXIT, "E&xit")

  win.AppendMenuWId(edit_menu, win.MF_STRING, ID_EDIT_UNDO, "&Undo\tCtrl+Z")
  win.AppendMenuWId(edit_menu, win.MF_STRING, ID_EDIT_REDO, "&Redo\tCtrl+Y")
  win.AppendMenuWId(edit_menu, win.MF_SEPARATOR, 0, "")
  win.AppendMenuWId(edit_menu, win.MF_STRING, ID_EDIT_CUT, "Cu&t\tCtrl+X")
  win.AppendMenuWId(edit_menu, win.MF_STRING, ID_EDIT_COPY, "&Copy\tCtrl+C")
  win.AppendMenuWId(edit_menu, win.MF_STRING, ID_EDIT_PASTE, "&Paste\tCtrl+V")
  win.AppendMenuWId(edit_menu, win.MF_STRING, ID_EDIT_SELECT_ALL, "Select &All\tCtrl+A")
  win.AppendMenuWId(edit_menu, win.MF_SEPARATOR, 0, "")
  win.AppendMenuWId(edit_menu, win.MF_STRING, ID_EDIT_FIND, "&Find...\tCtrl+F")
  win.AppendMenuWId(edit_menu, win.MF_STRING, ID_EDIT_FIND_NEXT, "Find &Next\tF3")
  win.AppendMenuWId(edit_menu, win.MF_SEPARATOR, 0, "")
  win.AppendMenuWId(edit_menu, win.MF_STRING, ID_COMMAND_PALETTE, "Command &Palette...\tCtrl+Shift+P")
  win.AppendMenuWId(edit_menu, win.MF_SEPARATOR, 0, "")
  win.AppendMenuWId(edit_menu, win.MF_STRING, ID_EDIT_RENAME_SYMBOL, "Rename &Symbol...\tF2")
  win.AppendMenuWId(edit_menu, win.MF_STRING, ID_EDIT_COMPLETE, "&Complete\tCtrl+Space")
  win.AppendMenuWId(edit_menu, win.MF_STRING, ID_EDIT_FORMAT, "Format &Document")

  win.AppendMenuWId(nav_menu, win.MF_STRING, ID_NAV_BACK, "Navigate &Back\tAlt+Left")
  win.AppendMenuWId(nav_menu, win.MF_STRING, ID_NAV_FORWARD, "Navigate &Forward\tAlt+Right")
  win.AppendMenuWId(nav_menu, win.MF_STRING, ID_NAV_TOGGLE_BOOKMARK, "Toggle &Bookmark\tCtrl+F2")
  win.AppendMenuWId(nav_menu, win.MF_STRING, ID_NAV_BOOKMARKS, "&Bookmarks\tShift+F2")
  win.AppendMenuWId(nav_menu, win.MF_STRING, ID_NAV_NEXT_BOOKMARK, "Next Bookmark\tAlt+Down")
  win.AppendMenuWId(nav_menu, win.MF_STRING, ID_NAV_PREV_BOOKMARK, "Previous Bookmark\tAlt+Up")
  win.AppendMenuWId(nav_menu, win.MF_SEPARATOR, 0, "")
  win.AppendMenuWId(nav_menu, win.MF_STRING, ID_NAV_REVEAL_ACTIVE_FILE, "Reveal Active &File\tAlt+F1")
  win.AppendMenuWId(nav_menu, win.MF_STRING, ID_NAV_OUTLINE, "&Outline")
  win.AppendMenuWId(nav_menu, win.MF_STRING, ID_NAV_FILE_STRUCTURE, "File &Structure\tCtrl+F12")
  win.AppendMenuWId(nav_menu, win.MF_STRING, ID_NAV_WORKSPACE_HEALTH, "Workspace &Health")
  win.AppendMenuWId(nav_menu, win.MF_STRING, ID_NAV_TODOS, "&TODOs")
  win.AppendMenuWId(nav_menu, win.MF_STRING, ID_NAV_TEST_EXPLORER, "Test &Explorer")
  win.AppendMenuWId(nav_menu, win.MF_STRING, ID_NAV_RELATED_TESTS, "Related Te&sts")
  win.AppendMenuWId(nav_menu, win.MF_STRING, ID_NAV_IMPORT_GRAPH, "Import &Graph")
  win.AppendMenuWId(nav_menu, win.MF_STRING, ID_NAV_CALL_HIERARCHY, "Call &Hierarchy")
  win.AppendMenuWId(nav_menu, win.MF_STRING, ID_NAV_SYMBOL_INFO, "Symbol &Info")
  win.AppendMenuWId(nav_menu, win.MF_STRING, ID_NAV_CODE_INSPECTIONS, "Code &Inspections")
  win.AppendMenuWId(nav_menu, win.MF_STRING, ID_NAV_PROJECT_INDEX, "Project &Index")
  win.AppendMenuWId(nav_menu, win.MF_STRING, ID_NAV_PROJECT_SYMBOLS, "Project &Symbols")
  win.AppendMenuWId(nav_menu, win.MF_STRING, ID_NAV_GOTO_SYMBOL, "Go to &Symbol...\tCtrl+T")
  win.AppendMenuWId(nav_menu, win.MF_STRING, ID_NAV_GOTO_LINE, "&Go to Line...\tCtrl+G")
  win.AppendMenuWId(nav_menu, win.MF_STRING, ID_NAV_GOTO_DEFINITION, "Go to &Definition\tF12")
  win.AppendMenuWId(nav_menu, win.MF_STRING, ID_NAV_FIND_REFERENCES, "Find &References\tShift+F12")
  win.AppendMenuWId(nav_menu, win.MF_STRING, ID_NAV_SEARCH_WORD, "Search &Word in Project")
  win.AppendMenuWId(nav_menu, win.MF_STRING, ID_NAV_PROBLEMS, "&Problems")

  win.AppendMenuWId(help_menu, win.MF_STRING, ID_HELP_WELCOME, "&Home")
  win.AppendMenuWId(help_menu, win.MF_SEPARATOR, 0, "")
  win.AppendMenuWId(help_menu, win.MF_STRING, ID_HELP_LANGUAGE, "MiniLang Language &Reference")
  win.AppendMenuWId(help_menu, win.MF_STRING, ID_HELP_LANGUAGE_SEARCH, "&Search MiniLang Help...")
  win.AppendMenuWId(help_menu, win.MF_SEPARATOR, 0, "")
  win.AppendMenuWId(help_menu, win.MF_STRING, ID_HELP_ABOUT, "&About MiniIDE")

  win.AppendMenuWPopup(main_menu, win.MF_POPUP, file_menu, "&File")
  win.AppendMenuWPopup(main_menu, win.MF_POPUP, edit_menu, "&Edit")
  win.AppendMenuWPopup(main_menu, win.MF_POPUP, nav_menu, "&Navigation")
  win.AppendMenuWPopup(main_menu, win.MF_POPUP, config_menu, "&Configuration")
  win.AppendMenuWPopup(main_menu, win.MF_POPUP, help_menu, "&Help")

  return [main_menu, file_menu, edit_menu, nav_menu, config_menu, help_menu]
end function

// Return the first project file.
function _first_project_file(p)
  // Walk collections defensively because project data can be partially populated.
  if typeof(p) != "struct" or typeof(p.files) != "array" then return "" end if
  if len(p.files) <= 0 then return "" end if
  for i = 0 to len(p.files) - 1
    f = p.files[i]
    if typeof(f) == "struct" and f.is_dir == false and s.endsWith(s.toLowerAscii(f.path), ".ml") then
      return f.path
    end if
  end for
  return ""
end function

// Return the entry file.
function _entry_file(p)
  path = project.project_entry_path(p)
  if fs.exists(path) then return path end if
  return _first_project_file(p)
end function

// Send the label operation to a tab control.
function _tab_label(st, idx)
  if typeof(st.open_files) != "array" or idx < 0 or idx >= len(st.open_files) then return "" end if
  label = _basename(st.open_files[idx])
  if label == "" then label = "untitled" end if
  dirty = false
  if typeof(st.open_dirty) == "array" and idx < len(st.open_dirty) then
    if _is_generated_editor_path(st.open_files[idx]) == false then dirty = st.open_dirty[idx] end if
  end if
  if dirty then
    label = "*" + label
  end if
  return label
end function

// Refresh tabs.
function _refresh_tabs(st)
  // Walk collections defensively because project data can be partially populated.
  win.tab_clear(st.tabbar)
  if typeof(st.open_files) == "array" and len(st.open_files) > 0 then
    for i = 0 to len(st.open_files) - 1
      win.tab_insert(st.tabbar, i, _tab_label(st, i), i)
    end for
  end if
  if st.active_tab >= 0 then win.tab_set_cur_sel(st.tabbar, st.active_tab) end if
  win.InvalidateRect(st.tabbar, void, true)
  return st
end function

// Synchronize active tab.
function _sync_active_tab(st)
  if typeof(st.open_files) != "array" then return st end if
  idx = st.active_tab
  if idx < 0 or idx >= len(st.open_files) then return st end if
  if _is_generated_editor_path(st.open_files[idx]) then
    if idx < len(st.open_dirty) then st.open_dirty[idx] = false end if
    win.edit_set_modified(st.editor, false)
    return st
  end if
  if win.edit_is_modified(st.editor) == false then return st end if
  text = _read_editor(st)
  if idx < len(st.open_texts) and text != st.open_texts[idx] then
    was_dirty = st.open_dirty[idx]
    st = _record_undo_snapshot(st, idx)
    st.open_redo[idx] = []
    st.open_texts[idx] = text
    st = markdown.clear_cache(st, idx)
    st = _invalidate_markdown_view(st, idx)
    st = _set_dirty_from_saved(st, idx)
    st.last_editor_text = text
    st.last_line_numbers_text = ""
    st = _record_edit_activity(st)
    if was_dirty != st.open_dirty[idx] then
      st = _refresh_tabs(st)
      _set_title(st)
    end if
  end if
  win.edit_set_modified(st.editor, false)
  return st
end function

// Switch to tab.
function _activate_tab(st, idx)
  if typeof(st.open_files) != "array" then return st end if
  if idx < 0 or idx >= len(st.open_files) then return st end if
  st.active_tab = idx
  st.current_file = st.open_files[idx]
  text = ""
  if idx < len(st.open_texts) then text = st.open_texts[idx] end if
  st = _write_active_editor(st, text)
  win.edit_set_readonly(st.editor, _is_readonly_tab_path(st.current_file) or _active_is_markdown(st))
  st.last_editor_text = text
  if _active_is_markdown(st) == false then st = _invalidate_highlight(st) end if
  st.last_line_numbers_text = ""
  st.last_status_text = ""
  st.last_first_visible_line = -1
  st = _refresh_tabs(st)
  _set_title(st)
  st.last_w = -1
  st = _layout(st)
  if _active_is_markdown(st) == false then st = _apply_syntax_highlight(st) end if
  win.SetFocus(st.editor)
  return st
end function

// Open file.
function _open_file(st, path)
  if typeof(path) != "string" or path == "" then return st end if
  if s.endsWith(s.toLowerAscii(path), ".mlproj") then return _open_project_file(st, path) end if
  st = _sync_active_tab(st)
  idx = _path_index(st.open_files, path)
  if idx >= 0 then return _activate_tab(st, idx) end if

  if len(st.open_files) >= MAX_TABS then
    return _set_log(st, "Tab limit reached. Save or close a file before opening another one.")
  end if

  text = ""
  if fs.exists(path) then
    r = fs.readAllText(path)
    if typeof(r) == "string" then text = r end if
  end if
  text = _normalize_editor_text(text)
  st.open_files = st.open_files + [path]
  st.open_texts = st.open_texts + [text]
  st.open_saved_texts = st.open_saved_texts + [text]
  st.open_dirty = st.open_dirty + [false]
  st.open_undo = st.open_undo + [[]]
  st.open_redo = st.open_redo + [[]]
  st.open_folds = st.open_folds + [[]]
  st.open_markdown_sources = st.open_markdown_sources + [""]
  st.open_markdown_docs = st.open_markdown_docs + [markdown.empty_doc()]
  st.open_markdown_views = st.open_markdown_views + [0]
  st.open_markdown_view_sources = st.open_markdown_view_sources + [""]
  st.open_markdown_view_themes = st.open_markdown_view_themes + [""]
  return _activate_tab(st, len(st.open_files) - 1)
end function

// Open virtual tab.
function _open_virtual_tab(st, path, text)
  if typeof(path) != "string" or path == "" then return st end if
  if typeof(text) != "string" then text = "" end if
  st = _sync_active_tab(st)
  text = _normalize_editor_text(text)
  idx = _path_index(st.open_files, path)
  if idx >= 0 then
    st.open_texts[idx] = text
    st.open_saved_texts[idx] = text
    st.open_dirty[idx] = false
    st.open_undo[idx] = []
    st.open_redo[idx] = []
    st.open_folds[idx] = []
    st = markdown.clear_cache(st, idx)
    st = _invalidate_markdown_view(st, idx)
    return _activate_tab(st, idx)
  end if

  if len(st.open_files) >= MAX_TABS then
    return _set_log(st, "Tab limit reached. Save or close a file before opening another one.")
  end if

  st.open_files = st.open_files + [path]
  st.open_texts = st.open_texts + [text]
  st.open_saved_texts = st.open_saved_texts + [text]
  st.open_dirty = st.open_dirty + [false]
  st.open_undo = st.open_undo + [[]]
  st.open_redo = st.open_redo + [[]]
  st.open_folds = st.open_folds + [[]]
  st.open_markdown_sources = st.open_markdown_sources + [""]
  st.open_markdown_docs = st.open_markdown_docs + [markdown.empty_doc()]
  st.open_markdown_views = st.open_markdown_views + [0]
  st.open_markdown_view_sources = st.open_markdown_view_sources + [""]
  st.open_markdown_view_themes = st.open_markdown_view_themes + [""]
  return _activate_tab(st, len(st.open_files) - 1)
end function

// Check editor dirty.
function _check_editor_dirty(st)
  if st.active_tab < 0 or st.active_tab >= len(st.open_files) then return st end if
  if _is_generated_editor_path(st.open_files[st.active_tab]) then
    if _active_is_markdown(st) then
      if st.highlight_pending then st = _refresh_active_markdown_view(st, true) end if
    end if
    if st.active_tab < len(st.open_dirty) and st.open_dirty[st.active_tab] then
      st.open_dirty[st.active_tab] = false
      st = _refresh_tabs(st)
      _set_title(st)
    end if
    win.edit_set_modified(st.editor, false)
    return st
  end if
  if win.edit_is_modified(st.editor) == false then return st end if
  now = win.GetTickCount()
  if st.last_edit_ms > 0 and now - st.last_edit_ms < EDIT_SYNC_IDLE_MS then
    st = _mark_active_dirty_pending(st)
    st.highlight_pending = true
    return st
  end if
  text = _read_editor(st)
  if text != st.last_editor_text then
    was_dirty = st.open_dirty[st.active_tab]
    st = _record_undo_snapshot(st, st.active_tab)
    st.open_redo[st.active_tab] = []
    st.open_texts[st.active_tab] = text
    st = markdown.clear_cache(st, st.active_tab)
    st = _invalidate_markdown_view(st, st.active_tab)
    st = _set_dirty_from_saved(st, st.active_tab)
    st.last_editor_text = text
    st.last_line_numbers_text = ""
    st = _record_edit_activity(st)
    if was_dirty != st.open_dirty[st.active_tab] then
      st = _refresh_tabs(st)
      _set_title(st)
    end if
  end if
  win.edit_set_modified(st.editor, false)
  return st
end function

// Send the handle index operation to a tree-view control.
function _tree_handle_index(st, handle)
  // Walk collections defensively because project data can be partially populated.
  if typeof(st.tree_handles) != "array" then return -1 end if
  if len(st.tree_handles) <= 0 then return -1 end if
  for i = 0 to len(st.tree_handles) - 1
    if st.tree_handles[i] == handle then return i end if
  end for
  return -1
end function

// Send the icon operation to a tree-view control.
function _tree_icon(path, is_dir)
  if is_dir then return 0 end if
  if s.endsWith(s.toLowerAscii(path), ".mlproj") then return 2 end if
  return 1
end function

// Populate project tree.
function _populate_project_tree(st)
  // Walk collections defensively because project data can be partially populated.
  win.tree_clear(st.tree)
  handles = []
  paths = []
  dirs = []

  root_name = "MiniIDE"
  root_path = "."
  if typeof(st.project) == "struct" then
    root_name = st.project.name
    root_path = st.project.root
  end if
  root_handle = win.tree_insert(st.tree, win.TVI_ROOT, root_name, -1, true, 2)
  handles = handles + [root_handle]
  paths = paths + [root_path]
  dirs = dirs + [true]

  parents = array(32, root_handle)
  if typeof(st.project) == "struct" and typeof(st.project.files) == "array" and len(st.project.files) > 0 then
    for i = 0 to len(st.project.files) - 1
      f = st.project.files[i]
      if typeof(f) != "struct" then continue end if
      parent = root_handle
      if f.depth >= 0 and f.depth < len(parents) then parent = parents[f.depth] end if
      item_handle = win.tree_insert(st.tree, parent, f.name, i, f.is_dir, _tree_icon(f.path, f.is_dir))
      handles = handles + [item_handle]
      paths = paths + [f.path]
      dirs = dirs + [f.is_dir]
      if f.is_dir and f.depth + 1 < len(parents) then
        parents[f.depth + 1] = item_handle
      end if
    end for
  end if
  win.tree_expand(st.tree, root_handle)
  if len(handles) > 1 then
    for hi = 1 to len(handles) - 1
      if hi < len(dirs) and dirs[hi] then
        win.tree_expand(st.tree, handles[hi])
      end if
    end for
  end if
  st.tree_handles = handles
  st.tree_paths = paths
  st.tree_is_dir = dirs
  st.current_sel = -1
  st.last_tree_click_ms = 0
  st.last_tree_click_item = 0
  return st
end function

// Save current.
function _save_current(st)
  if typeof(st.current_file) != "string" or st.current_file == "" then
    return _set_log(st, "No file is open.")
  end if
  if _is_readonly_tab_path(st.current_file) then
    return _set_log(st, "This tab is read-only.")
  end if
  idx = st.active_tab
  st = _sync_active_tab(st)
  text = ""
  if idx >= 0 and idx < len(st.open_texts) then
    text = st.open_texts[idx]
  else
    text = _read_editor(st)
  end if
  if idx >= 0 and idx < len(st.open_files) then
    st.open_texts[idx] = text
  end if
  wr = fs.writeAllText(st.current_file, text)
  if typeof(wr) == "error" then
    return _set_log(st, "Save failed: " + wr.message)
  end if
  if idx >= 0 and idx < len(st.open_saved_texts) then st.open_saved_texts[idx] = text end if
  if idx >= 0 and idx < len(st.open_dirty) then st.open_dirty[idx] = false end if
  st.last_editor_text = text
  st = _refresh_tabs(st)
  _set_title(st)
  return _set_log(st, "Saved " + st.current_file)
end function

// Return the dirty tab names.
function _dirty_tab_names(st)
  // Walk collections defensively because project data can be partially populated.
  if typeof(st.open_files) != "array" or typeof(st.open_dirty) != "array" then return "" end if
  names = ""
  for i = 0 to len(st.open_files) - 1
    if i < len(st.open_dirty) and st.open_dirty[i] then
      if _is_generated_editor_path(st.open_files[i]) then continue end if
      if names != "" then names = names + ", " end if
      names = names + _basename(st.open_files[i])
    end if
  end for
  return names
end function

// Return true when any open tab has unsaved changes.
function _has_dirty_tabs(st)
  return _dirty_tab_names(st) != ""
end function

// Guard no dirty.
function _guard_no_dirty(st, action_name)
  dirty = _dirty_tab_names(st)
  if dirty == "" then return [st, true] end if
  st = _set_log(st, "Unsaved changes: " + dirty + ". Please save before " + action_name + ".")
  return [st, false]
end function

// Confirm exit with dirty tabs.
function _confirm_exit_with_dirty_tabs(st)
  st = _sync_active_tab(st)
  dirty = _dirty_tab_names(st)
  if dirty == "" then return [st, true] end if

  msg = "Unsaved changes in:\n" + dirty + "\n\nIf you exit MiniIDE now, these changes will be lost.\n\nDo you really want to exit?"
  answer = win.MessageBoxW(st.hwnd, msg, "Unsaved Changes", win.MB_YESNO | win.MB_ICONWARNING | win.MB_DEFBUTTON2)
  if answer == win.IDYES then return [st, true] end if
  return [st, false]
end function

// Save all open.
function _save_all_open(st)
  // Walk collections defensively because project data can be partially populated.
  st = _sync_active_tab(st)
  if typeof(st.open_files) != "array" then return [st, true, ""] end if
  for i = 0 to len(st.open_files) - 1
    dirty = false
    if i < len(st.open_dirty) then dirty = st.open_dirty[i] end if
    if _is_generated_editor_path(st.open_files[i]) then dirty = false end if
    if dirty == false then continue end if
    text = ""
    if i < len(st.open_texts) then text = st.open_texts[i] end if
    wr = fs.writeAllText(st.open_files[i], text)
    if typeof(wr) == "error" then
      return [st, false, "Save failed: " + st.open_files[i] + ": " + wr.message]
    end if
    if i < len(st.open_saved_texts) then st.open_saved_texts[i] = text end if
    if i < len(st.open_dirty) then st.open_dirty[i] = false end if
  end for
  st = _refresh_tabs(st)
  _set_title(st)
  return [st, true, ""]
end function

// Save all dirty editable tabs.
function _save_all(st)
  dirty = _dirty_tab_names(st)
  result = _save_all_open(st)
  st = result[0]
  if result[1] == false then return _set_log(st, result[2]) end if
  if dirty == "" then return _set_log(st, "Save All: no unsaved files.") end if
  return _set_log(st, "Save All: saved " + dirty + ".")
end function

// Start compile job.
function _start_compile_job(st, mode)
  // Keep process setup and state capture together for reliable polling.
  job = build.start_compile_with_options(st.project, st.compiler_path, st.build_keep_going, st.build_max_errors, st.build_subsystem, st.build_extra_args)
  st.build_job = job
  st.build_mode = mode
  st.build_running = build.job_started(job)
  st.build_last_poll_ms = 0
  if st.build_running == false then
    log = _format_build_log(st, job.log_text, false, job.exit_code)
    st.build_last_log = log
    return _set_log(st, log)
  end if
  log = _format_build_log(st, "", true, build.STILL_ACTIVE)
  if mode == "compile-run" then
    log = "Run: the project is newer than the program, building first.\r\n\r\n" + log
  end if
  st.build_last_log = log
  st = _set_log(st, log)
  return st
end function

// Start run job.
function _start_run_job(st)
  // Keep process setup and state capture together for reliable polling.
  job = build.start_run_output(st.project)
  st.build_job = job
  st.build_mode = "run"
  st.build_running = build.job_started(job)
  st.build_last_poll_ms = 0
  if st.build_running == false then
    log = _format_build_log(st, job.log_text, false, job.exit_code)
    st.build_last_log = log
    return _set_log(st, log)
  end if
  log = _format_build_log(st, "", true, build.STILL_ACTIVE)
  st.build_last_log = log
  st = _set_log(st, log)
  return st
end function

// Start test compile job.
function _start_test_compile_job(st)
  // Keep process setup and state capture together for reliable polling.
  job = build.start_test_compile_with_options(st.project, st.compiler_path, st.build_keep_going, st.build_max_errors, "console", st.build_extra_args)
  st.build_job = job
  st.build_mode = "test-compile"
  st.build_running = build.job_started(job)
  st.build_last_poll_ms = 0
  if st.build_running == false then
    log = _format_build_log(st, job.log_text, false, job.exit_code)
    st.build_last_log = log
    return _set_log(st, log)
  end if
  log = _format_build_log(st, "", true, build.STILL_ACTIVE)
  st.build_last_log = log
  return _set_log(st, log)
end function

// Start compiling a specific test file.
function _start_test_file_compile_job(st, test_file, mode, label)
  // Keep process setup and state capture together for reliable polling.
  if typeof(mode) != "string" or mode == "" then mode = "test-current-compile" end if
  if typeof(label) != "string" or label == "" then label = "Run Current Test File" end if
  job = build.start_test_file_compile_with_options(st.project, test_file, st.compiler_path, st.build_keep_going, st.build_max_errors, "console", st.build_extra_args)
  st.build_job = job
  st.build_mode = mode
  st.build_running = build.job_started(job)
  st.build_last_poll_ms = 0
  if st.build_running == false then
    log = _format_build_log(st, job.log_text, false, job.exit_code)
    st.build_last_log = log
    return _set_log(st, log)
  end if
  log = label + ": " + _project_relative_path(st, test_file) + "\r\n\r\n" + _format_build_log(st, "", true, build.STILL_ACTIVE)
  st.build_last_log = log
  return _set_log(st, log)
end function

// Start compiling the current test file.
function _start_current_test_compile_job(st, test_file)
  return _start_test_file_compile_job(st, test_file, "test-current-compile", "Run Current Test File")
end function

// Start compiling a related test file.
function _start_related_test_compile_job(st, test_file)
  return _start_test_file_compile_job(st, test_file, "test-related-compile", "Run Related Test File")
end function

// Start test run job.
function _start_test_run_job(st)
  // Keep process setup and state capture together for reliable polling.
  job = build.start_test_output(st.project)
  st.build_job = job
  st.build_mode = "test-run"
  st.build_running = build.job_started(job)
  st.build_last_poll_ms = 0
  if st.build_running == false then
    log = _format_build_log(st, job.log_text, false, job.exit_code)
    st.build_last_log = log
    return _set_log(st, log)
  end if
  log = _format_build_log(st, "", true, build.STILL_ACTIVE)
  st.build_last_log = log
  return _set_log(st, log)
end function

// Build project.
function _build_project(st)
  if st.build_running then
    return _set_log(st, st.build_last_log + "\r\n\r\nA background process is already running.")
  end if
  save_result = _save_all_open(st)
  st = save_result[0]
  if save_result[1] == false then return _set_log(st, save_result[2]) end if
  return _start_compile_job(st, "compile")
end function

// Run project.
function _run_project(st)
  if st.build_running then
    return _set_log(st, st.build_last_log + "\r\n\r\nA background process is already running.")
  end if
  save_result = _save_all_open(st)
  st = save_result[0]
  if save_result[1] == false then return _set_log(st, save_result[2]) end if
  if build.needs_recompile(st.project) then
    return _start_compile_job(st, "compile-run")
  end if
  return _start_run_job(st)
end function

// Run tests.
function _run_tests(st)
  if st.build_running then
    return _set_log(st, st.build_last_log + "\r\n\r\nA background process is already running.")
  end if
  save_result = _save_all_open(st)
  st = save_result[0]
  if save_result[1] == false then return _set_log(st, save_result[2]) end if
  return _start_test_compile_job(st)
end function

// Return true when a path looks like a MiniLang test file.
function _is_test_file_path(path)
  if typeof(path) != "string" or path == "" then return false end if
  lower = s.toLowerAscii(path)
  return s.indexOf(lower, "\\tests\\", 0) >= 0 or s.indexOf(lower, "/tests/", 0) >= 0 or s.endsWith(lower, "_test.ml") or s.endsWith(lower, "\\test.ml") or s.endsWith(lower, "/test.ml")
end function

// Run the currently open test file.
function _run_current_test_file(st)
  if st.build_running then
    return _set_log(st, st.build_last_log + "\r\n\r\nA background process is already running.")
  end if
  if typeof(st.current_file) != "string" or st.current_file == "" then return _set_log(st, "Run Current Test File: no file is open.") end if
  if _is_test_file_path(st.current_file) == false then return _set_log(st, "Run Current Test File: current file is not a test file.") end if
  save_result = _save_all_open(st)
  st = save_result[0]
  if save_result[1] == false then return _set_log(st, save_result[2]) end if
  return _start_current_test_compile_job(st, st.current_file)
end function

// Run the first test file related to the currently open source file.
function _run_related_test_file(st)
  if st.build_running then
    return _set_log(st, st.build_last_log + "\r\n\r\nA background process is already running.")
  end if
  if typeof(st.current_file) != "string" or st.current_file == "" then return _set_log(st, "Run Related Test File: no file is open.") end if
  snapshot = lang_service.analyze_project(st.project)
  test_file = lang_service.related_test_file(snapshot, st.current_file)
  if typeof(test_file) != "string" or test_file == "" then return _set_log(st, "Run Related Test File: no related test file found for " + _project_relative_path(st, st.current_file)) end if
  save_result = _save_all_open(st)
  st = save_result[0]
  if save_result[1] == false then return _set_log(st, save_result[2]) end if
  return _start_related_test_compile_job(st, test_file)
end function

// Clean project.
function _clean_project(st)
  if st.build_running then
    return _set_log(st, st.build_last_log + "\r\n\r\nPlease stop the running process first.")
  end if
  text = build.clean_project(st.project)
  return _set_log(st, text)
end function

// Rebuild project.
function _rebuild_project(st)
  if st.build_running then
    return _set_log(st, st.build_last_log + "\r\n\r\nPlease stop the running process first.")
  end if
  save_result = _save_all_open(st)
  st = save_result[0]
  if save_result[1] == false then return _set_log(st, save_result[2]) end if
  clean_text = build.clean_project(st.project)
  st = _start_compile_job(st, "rebuild")
  st.build_last_log = clean_text + "\r\n\r\n" + st.build_last_log
  return _set_log(st, st.build_last_log)
end function

// Stop build job.
function _stop_build_job(st)
  if st.build_running == false then return _set_log(st, "No background process is running.") end if
  st.build_job = build.stop_job(st.build_job)
  st.build_running = false
  log_text = build.job_log(st.build_job)
  st.build_last_log = _format_build_log(st, log_text, false, 1) + "\r\nCanceled."
  st.build_mode = ""
  return _set_log(st, st.build_last_log)
end function

// Select build profile.
function _select_build_profile(st, profile)
  if profile != "release" then profile = "debug" end if
  st.build_profile = profile
  if profile == "release" then
    st.build_keep_going = false
    st.build_max_errors = 20
  else
    st.build_keep_going = true
    st.build_max_errors = 80
  end if
  st = _save_config(st)
  label = "Debug"
  if profile == "release" then label = "Release" end if
  return _set_log(st, "Build profile active: " + label)
end function

// Format build log.
function _format_build_log(st, log_text, running, exit_code)
  // Keep validation near the top so callers can treat invalid input as a no-op.
  compiler = _effective_compiler(st)
  label = "Compiler"
  running_text = "Build is running in the background..."
  ok_text = "Build finished: OK"
  fail_text = "Build failed: exit "
  if st.build_mode == "run" then
    label = "Program"
    compiler = project.project_output_path(st.project)
    running_text = "Program is running in the background..."
    ok_text = "Program finished: exit 0"
    fail_text = "Program finished: exit "
  else if st.build_mode == "test-compile" or st.build_mode == "test-current-compile" or st.build_mode == "test-related-compile" then
    label = "Test Compiler"
    compiler = project.project_test_entry_path(st.project)
    running_text = "Tests are being built..."
    if st.build_mode == "test-current-compile" then running_text = "Current test file is being built..." end if
    if st.build_mode == "test-related-compile" then running_text = "Related test file is being built..." end if
    ok_text = "Test-Build finished: OK"
    fail_text = "Test-Build failed: exit "
  else if st.build_mode == "test-run" then
    label = "Tests"
    compiler = project.project_test_entry_path(st.project)
    running_text = "Tests are running in the background..."
    ok_text = "Tests finished: exit 0"
    fail_text = "Tests finished: exit "
  end if
  if typeof(st.build_job) == "struct" and typeof(st.build_job.compiler) == "string" then
    compiler = st.build_job.compiler
  end if
  if typeof(log_text) != "string" then log_text = "" end if
  log = label + ": " + compiler + "\r\n"
  if st.build_mode == "compile" or st.build_mode == "compile-run" or st.build_mode == "rebuild" or st.build_mode == "test-compile" or st.build_mode == "test-current-compile" or st.build_mode == "test-related-compile" then
    log = log + "Profile: " + st.build_profile + "\r\n"
  end if
  if typeof(st.build_job) == "struct" and typeof(st.build_job.command_line) == "string" then
    log = log + "Command: " + st.build_job.command_line + "\r\n"
  end if
  if running then
    log = log + running_text + "\r\n\r\n"
  else
    log = log + "\r\n"
  end if
  log = log + log_text
  if running == false then
    if exit_code == 0 then
      log = log + "\r\n" + ok_text
    else
      log = log + "\r\n" + fail_text + exit_code
    end if
  end if
  return log
end function

// Poll build.
function _poll_build(st)
  if st.build_running == false then return st end if
  now = win.GetTickCount()
  if now - st.build_last_poll_ms < 250 then return st end if
  st.build_last_poll_ms = now
  running = build.job_is_running(st.build_job)
  log_text = build.job_log(st.build_job)
  exit_code = build.STILL_ACTIVE
  if running == false then exit_code = build.job_exit_code(st.build_job) end if
  log = _format_build_log(st, log_text, running, exit_code)
  if log != st.build_last_log then
    st.build_last_log = log
    st = _set_log(st, log)
  end if
  if running == false then
    finished_mode = st.build_mode
    st.build_job = build.close_job(st.build_job)
    st.build_running = false
    if finished_mode == "compile-run" and exit_code == 0 then
      return _start_run_job(st)
    end if
    if (finished_mode == "test-compile" or finished_mode == "test-current-compile" or finished_mode == "test-related-compile") and exit_code == 0 then
      return _start_test_run_job(st)
    end if
    if exit_code != 0 then
      if finished_mode == "compile" or finished_mode == "compile-run" or finished_mode == "rebuild" or finished_mode == "test-compile" or finished_mode == "test-current-compile" or finished_mode == "test-related-compile" then
        return _show_problems(st)
      end if
    end if
  end if
  return st
end function

// Reload project.
function _reload_project(st)
  guard = _guard_no_dirty(st, "reloading the project")
  st = guard[0]
  if guard[1] == false then return st end if
  st = _sync_active_tab(st)
  st = _destroy_all_markdown_views(st)
  st.editor = st.code_editor
  win.ShowWindow(st.code_editor, win.SW_SHOW)
  root = "."
  if typeof(st.project) == "struct" then root = st.project.root end if
  st.project = project.load_project(root)
  st = _load_build_config(st)
  st.open_files = []
  st.open_texts = []
  st.open_saved_texts = []
  st.open_dirty = []
  st.open_undo = []
  st.open_redo = []
  st.open_folds = []
  st.open_markdown_sources = []
  st.open_markdown_docs = []
  st.open_markdown_views = []
  st.open_markdown_view_sources = []
  st.open_markdown_view_themes = []
  st.active_tab = -1
  st.current_file = ""
  st.nav_back = []
  st.nav_forward = []
  st.bookmarks = []
  st.last_editor_text = ""
  st = _invalidate_highlight(st)
  st.last_line_numbers_text = ""
  st.last_status_text = ""
  st.last_first_visible_line = -1
  st = _populate_project_tree(st)
  entry = _entry_file(st.project)
  st = _open_file(st, entry)
  st = _refresh_tabs(st)
  st = _set_log(st, "Reloaded project " + st.project.name + "\r\n" + _project_index_summary(st))
  st = _apply_theme(st)
  return st
end function

// Open project file.
function _open_project_file(st, path)
  if typeof(path) != "string" or path == "" then return st end if
  guard = _guard_no_dirty(st, "opening a project")
  st = guard[0]
  if guard[1] == false then return st end if
  st = _sync_active_tab(st)
  st = _destroy_all_markdown_views(st)
  st.editor = st.code_editor
  win.ShowWindow(st.code_editor, win.SW_SHOW)
  loaded_project = try(project.load_project_file(path))
  if typeof(loaded_project) == "error" then
    return _set_log(st, "Open project failed: " + loaded_project.message)
  end if
  st.project = loaded_project
  loaded_config = try(_load_build_config(st))
  if typeof(loaded_config) == "error" then
    return _set_log(st, "Open project failed while reading configuration: " + loaded_config.message)
  end if
  st = loaded_config
  st.open_files = []
  st.open_texts = []
  st.open_saved_texts = []
  st.open_dirty = []
  st.open_undo = []
  st.open_redo = []
  st.open_folds = []
  st.open_markdown_sources = []
  st.open_markdown_docs = []
  st.open_markdown_views = []
  st.open_markdown_view_sources = []
  st.open_markdown_view_themes = []
  st.active_tab = -1
  st.current_file = ""
  st.current_sel = -1
  st.nav_back = []
  st.nav_forward = []
  st.bookmarks = []
  st.last_editor_text = ""
  st = _invalidate_highlight(st)
  st.last_line_numbers_text = ""
  st.last_status_text = ""
  st.last_first_visible_line = -1
  st = _write_editor(st, "")
  st = _populate_project_tree(st)
  entry_open = try(_open_file(st, _entry_file(st.project)))
  if typeof(entry_open) == "error" then
    st = _refresh_tabs(st)
    _set_title(st)
    return _set_log(st, "Opened project, but the entry file could not be opened: " + entry_open.message)
  end if
  st = entry_open
  st = _refresh_tabs(st)
  st = _set_log(st, "Opened project " + st.project.name + "\r\n" + _project_index_summary(st))
  st = _apply_theme(st)
  return st
end function

// Open project dialog.
function _open_project_dialog(st)
  path = win.open_project_dialog(st.hwnd)
  if typeof(path) != "string" or path == "" then return st end if
  return _open_project_file(st, path)
end function

// Normalize project kind.
function _normalize_project_kind(value)
  if typeof(value) != "string" then return "console" end if
  value = s.toLowerAscii(s.trim(value))
  if value == "library" then return "library" end if
  return "console"
end function

// Return the selected project kind.
function _selected_project_kind(kind_combo)
  idx = win.combo_getsel(kind_combo)
  if idx == 1 then return "library" end if
  return "console"
end function

// Try to create a project from the New Project dialog fields.
function _new_project_create_from_dialog(dlg, name_edit, parent_edit, kind_combo, default_parent)
  name = s.trim(win.get_control_text(name_edit))
  target_parent = s.trim(win.get_control_text(parent_edit))
  if target_parent == "" then target_parent = default_parent end if
  if name == "" then
    win.MessageBoxW(dlg, "Please enter a project name.", "New Project", 0)
    return ""
  end if
  if fs.exists(target_parent) == false then win.create_directory(target_parent) end if
  if fs.exists(target_parent) == false then
    win.MessageBoxW(dlg, "The target folder could not be created:\n" + target_parent, "New Project", 0)
    return ""
  end if
  created = try(templates.create_standard_project(target_parent, name, _selected_project_kind(kind_combo)))
  if typeof(created) == "error" then
    win.MessageBoxW(dlg, created.message + "\n\nPlease choose another project name.", "New Project", 0)
    win.SetFocus(name_edit)
    return ""
  end if
  return created
end function

// Return a compact project index summary.
function _project_index_summary(st)
  if typeof(st.project) != "struct" then return "Project index unavailable." end if
  idx = try(lang_index.build_project_index(st.project))
  if typeof(idx) == "error" then return "Project index failed: " + idx.message end if
  return lang_index.summary(idx)
end function

// Create standard project.
function _new_standard_project(st)
  // Run a local message loop so the modal UI stays responsive.
  guard = _guard_no_dirty(st, "creating a new project")
  st = guard[0]
  if guard[1] == false then return st end if
  parent = "projects"
  if typeof(st.project) == "struct" then parent = project.path_join(st.project.root, "projects") end if

  dlg = win.create_main_window("New Project", 620, 260)
  if dlg is void then return _set_log(st, "New Project could not be opened.") end if

  _settings_label(dlg, st.font_ui, "Project name", 20, 28, 120, 24)
  name_edit = _settings_edit_id(dlg, st.font_ui, "MiniLangProject", 150, 24, 420, 26, ID_NEW_PROJECT_NAME_EDIT)

  _settings_label(dlg, st.font_ui, "Target folder", 20, 72, 120, 24)
  parent_edit = _settings_edit_id(dlg, st.font_ui, parent, 150, 68, 420, 26, ID_NEW_PROJECT_PARENT_EDIT)

  _settings_label(dlg, st.font_ui, "Type", 20, 116, 120, 24)
  combo_style = win.WS_TABSTOP | win.WS_VSCROLL | win.CBS_DROPDOWNLIST | win.CBS_HASSTRINGS
  kind_combo = win.create_child_id(dlg, "COMBOBOX", "", 0, combo_style, 150, 112, 180, 160, ID_NEW_PROJECT_KIND)
  win.set_control_font(kind_combo, st.font_ui)
  win.combo_add(kind_combo, "console")
  win.combo_add(kind_combo, "library")
  win.combo_setsel(kind_combo, 0)

  ok_btn = _settings_button(dlg, st.font_ui, "OK", 370, 178, 88, 30, ID_NEW_PROJECT_OK)
  cancel_btn = _settings_button(dlg, st.font_ui, "Cancel", 470, 178, 100, 30, ID_NEW_PROJECT_CANCEL)

  created_root = ""
  done = false
  while done == false and win.IsWindow(dlg)
    msg = bytes(48, 0)
    while win.PeekMessageW(msg, void, 0, 0, win.PM_REMOVE)
      code = win.msg_message(msg)
      hwnd = win.msg_hwnd(msg)
      handled = false

      if code == win.WM_QUIT then
        st.running = false
        done = true
        handled = true
      else if code == win.WM_CLOSE and hwnd == dlg then
        done = true
        win.DestroyWindow(dlg)
        handled = true
      else if code == win.WM_CLOSE and hwnd == st.hwnd then
        st = _request_exit(st)
        done = true
        if win.IsWindow(dlg) then win.DestroyWindow(dlg) end if
        handled = true
      else if (code == win.WM_DESTROY or code == win.WM_NCDESTROY) and hwnd == dlg then
        done = true
        handled = true
      else if code == win.WM_KEYDOWN then
        key = win.msg_wparam_u32(msg)
        if key == win.VK_ESCAPE then
          done = true
          win.DestroyWindow(dlg)
          handled = true
        else if key == win.VK_RETURN then
          created = _new_project_create_from_dialog(dlg, name_edit, parent_edit, kind_combo, parent)
          if created != "" then
            created_root = created
            done = true
            win.DestroyWindow(dlg)
          end if
          handled = true
        end if
      else if code == win.WM_COMMAND and hwnd == dlg then
        cid = win.msg_command_id(msg)
        if cid == ID_NEW_PROJECT_CANCEL then
          done = true
          win.DestroyWindow(dlg)
          handled = true
        else if cid == ID_NEW_PROJECT_OK then
          created = _new_project_create_from_dialog(dlg, name_edit, parent_edit, kind_combo, parent)
          if created != "" then
            created_root = created
            done = true
            win.DestroyWindow(dlg)
          end if
          handled = true
        end if
      else if code == win.WM_LBUTTONUP then
        if hwnd == cancel_btn then
          done = true
          win.DestroyWindow(dlg)
          handled = true
        else if hwnd == ok_btn then
          created = _new_project_create_from_dialog(dlg, name_edit, parent_edit, kind_combo, parent)
          if created != "" then
            created_root = created
            done = true
            win.DestroyWindow(dlg)
          end if
          handled = true
        end if
      end if

      if handled == false then
        win.TranslateMessage(msg)
        win.DispatchMessageW(msg)
      end if
    end while
    if done == false then win.Sleep(15) end if
  end while

  if created_root != "" then
    st = _open_project_file(st, created_root)
    return _set_log(st, "Created standard project: " + created_root)
  end if
  if st.running and win.IsWindow(st.hwnd) then win.SetFocus(st.editor) end if
  return st
end function

// Show welcome.
function _show_welcome(st)
  root = "."
  name = "MiniIDE"
  if typeof(st.project) == "struct" then
    root = st.project.root
    name = st.project.name
  end if
  text = "# MiniIDE Home\n\n"
  text = text + "**Project:** " + name + "\n"
  text = text + "**Folder:** `" + root + "`\n\n"
  text = text + "## Typical Layout\n\n"
  text = text + "- `src\\main.ml` - main entry file\n"
  text = text + "- `src\\app\\` - application code\n"
  text = text + "- `src\\lib\\` - project modules\n"
  text = text + "- `lib\\` - local libraries\n"
  text = text + "- `tests\\main_test.ml` - test entry point\n"
  text = text + "- `assets\\` - data and icons\n"
  text = text + "- `build\\` - build output and logs\n\n"
  text = text + "## Useful Commands\n\n"
  text = text + "- `F5` Build\n"
  text = text + "- `F6` Run\n"
  text = text + "- `F7` Run tests\n"
  text = text + "- `Ctrl+F7` Run current test file\n"
  text = text + "- `Ctrl+Shift+F7` Run related test file\n"
  text = text + "- `Ctrl+E` Recent files\n"
  text = text + "- `F2` Rename symbol preview\n"
  text = text + "- `Ctrl+Space` Complete\n"
  text = text + "- `Navigation > Outline`, `Problems`, and `Search Word in Project`\n"
  return _open_virtual_tab(st, "miniide://MiniIDE Home.md", text)
end function

// Select compiler.
function _select_compiler(st)
  path = win.open_compiler_dialog(st.hwnd)
  if typeof(path) != "string" or path == "" then return st end if
  st.compiler_path = path
  st = _save_config(st)
  return _set_log(st, "Compiler set: " + path)
end function

// Reset compiler.
function _reset_compiler(st)
  st.compiler_path = ""
  st = _save_config(st)
  return _set_log(st, "Compiler reset to default: " + build.default_compiler(st.project))
end function

// Reload config.
function _reload_config(st)
  st = _load_build_config(st)
  st = _apply_theme(st)
  return _set_log(st, "Configuration reloaded: " + _config_path(st.project))
end function

// Toggle keep going.
function _toggle_keep_going(st)
  st.build_keep_going = st.build_keep_going == false
  st = _save_config(st)
  return _set_log(st, "Keep-going: " + st.build_keep_going)
end function

// Toggle subsystem.
function _toggle_subsystem(st)
  if st.build_subsystem == "windows" then
    st.build_subsystem = "console"
  else
    st.build_subsystem = "windows"
  end if
  st = _save_config(st)
  return _set_log(st, "Subsystem: " + st.build_subsystem)
end function

// Toggle max errors.
function _toggle_max_errors(st)
  if st.build_max_errors <= 20 then
    st.build_max_errors = 80
  else
    st.build_max_errors = 20
  end if
  st = _save_config(st)
  return _set_log(st, "Max errors: " + st.build_max_errors)
end function

// Show configuration.
function _show_config(st)
  msg = "Project: " + st.project.name + "\n"
  msg = msg + "Config: " + _config_path(st.project) + "\n"
  msg = msg + "Compiler: " + _effective_compiler(st) + "\n"
  msg = msg + "Entry: " + st.project.entry + "\n"
  msg = msg + "Output: " + st.project.output + "\n"
  msg = msg + "Test entry: " + st.project.test_entry + "\n"
  msg = msg + "Run args: " + st.project.run_args + "\n"
  msg = msg + "Working dir: " + st.project.working_dir + "\n"
  msg = msg + "Import paths: " + _join_imports(st.project.import_paths) + "\n"
  msg = msg + "Profile: " + st.build_profile + "\n"
  msg = msg + "Theme: " + st.theme_mode + "\n"
  msg = msg + "Keep-going: " + st.build_keep_going + "\n"
  msg = msg + "Max errors: " + st.build_max_errors + "\n"
  msg = msg + "Subsystem: " + st.build_subsystem + "\n"
  msg = msg + "Extra args: " + st.build_extra_args + "\n\n"
  msg = msg + "Edit .miniide.cfg for advanced options:\n"
  msg = msg + "compiler, profile, theme, keepGoing, maxErrors, subsystem, extraArgs"
  win.MessageBoxW(st.hwnd, msg, "MiniIDE configuration", 0)
  return st
end function

// Return the settings label.
function _settings_label(parent, font, text, x, y, w, h)
  hwnd = win.create_child(parent, "STATIC", text, 0, win.SS_NOPREFIX, x, y, w, h)
  win.set_control_font(hwnd, font)
  return hwnd
end function

// Return the settings edit.
function _settings_edit(parent, font, text, x, y, w, h)
  style = win.WS_TABSTOP | win.ES_AUTOHSCROLL
  hwnd = win.create_child(parent, "EDIT", text, win.WS_EX_CLIENTEDGE, style, x, y, w, h)
  win.set_control_font(hwnd, font)
  return hwnd
end function

// Return the settings edit identifier.
function _settings_edit_id(parent, font, text, x, y, w, h, control_id)
  style = win.WS_TABSTOP | win.ES_AUTOHSCROLL
  hwnd = win.create_child_id(parent, "EDIT", text, win.WS_EX_CLIENTEDGE, style, x, y, w, h, control_id)
  win.set_control_font(hwnd, font)
  return hwnd
end function

// Return the settings button.
function _settings_button(parent, font, text, x, y, w, h, control_id)
  style = win.WS_TABSTOP | win.BS_PUSHBUTTON
  hwnd = win.create_child_id(parent, "BUTTON", text, 0, style, x, y, w, h, control_id)
  win.set_control_font(hwnd, font)
  return hwnd
end function

// Return the on off.
function _on_off(value)
  if value then return "On" end if
  return "Off"
end function

// Refresh settings buttons.
function _refresh_settings_buttons(keep_btn, subsystem_btn, keep_going, subsystem)
  win.set_window_text(keep_btn, "Keep-going: " + _on_off(keep_going))
  win.set_window_text(subsystem_btn, "Subsystem: " + subsystem)
end function

// Return the project relative path.
function _project_relative_path(st, path)
  if typeof(path) != "string" or path == "" then return "" end if
  abs = project.abspath(path)
  root = project.abspath(st.project.root)
  abs_l = s.toLowerAscii(abs)
  root_l = s.toLowerAscii(root)
  if len(abs) > len(root) and s.startsWith(abs_l, root_l) then
    rel = s.substr(abs, len(root), len(abs) - len(root))
    if s.startsWith(rel, "\\") or s.startsWith(rel, "/") then
      rel = s.substr(rel, 1, len(rel) - 1)
    end if
    return rel
  end if
  return abs
end function

// Read compile settings values.
function _read_compile_settings_values(st, controls, entry_value, output_value, compiler_value)
  entry = entry_value
  output = output_value
  compiler = compiler_value
  read_entry = s.trim(win.get_control_text(controls.entry_edit))
  read_output = s.trim(win.get_control_text(controls.output_edit))
  test_entry = s.trim(win.get_control_text(controls.test_entry_edit))
  run_args = s.trim(win.get_control_text(controls.run_args_edit))
  working_dir = s.trim(win.get_control_text(controls.working_dir_edit))
  read_compiler = s.trim(win.get_control_text(controls.compiler_edit))
  if read_entry != "" and read_entry != st.project.entry then entry = read_entry end if
  if read_output != "" and read_output != st.project.output then output = read_output end if
  if test_entry == "" then test_entry = st.project.test_entry end if
  if working_dir == "" then working_dir = "." end if
  if compiler == st.compiler_path then
    compiler = read_compiler
  else if read_compiler != "" and read_compiler != st.compiler_path then
    compiler = read_compiler
  end if
  max_text = s.trim(win.get_control_text(controls.max_edit))
  extra_args = s.trim(win.get_control_text(controls.extra_edit))
  return CompileSettingsValues(entry, output, test_entry, run_args, working_dir, compiler, max_text, extra_args)
end function

// Apply compile settings.
function _apply_compile_settings(st, dlg, values, keep_going, subsystem)
  // Keep validation near the top so callers can treat invalid input as a no-op.
  entry = s.trim(values.entry)
  output = s.trim(values.output)
  test_entry = s.trim(values.test_entry)
  run_args = s.trim(values.run_args)
  working_dir = s.trim(values.working_dir)
  compiler = s.trim(values.compiler)
  max_text = s.trim(values.max_text)
  extra_args = s.trim(values.extra_args)

  if entry == "" then
    win.MessageBoxW(dlg, "Please select a main file.", "Compile Settings", 0)
    return [st, false]
  end if
  entry_path = project.resolve_project_path(st.project, entry)
  if fs.exists(entry_path) == false then
    win.MessageBoxW(dlg, "The main file was not found:\n" + entry_path, "Compile Settings", 0)
    return [st, false]
  end if
  if output == "" then output = "build\\" + st.project.name + ".exe" end if
  if test_entry == "" then test_entry = "tests\\main_test.ml" end if
  if working_dir == "" then working_dir = "." end if
  max_errors = toNumber(max_text)
  if typeof(max_errors) != "int" or max_errors < 1 then
    win.MessageBoxW(dlg, "Max errors must be a number greater than 0.", "Compile Settings", 0)
    return [st, false]
  end if
  if subsystem != "console" then subsystem = "windows" end if

  st.project = project.with_compile_settings(st.project, entry, output)
  st.project = project.with_run_settings(st.project, test_entry, run_args, working_dir)
  st.compiler_path = compiler
  st.build_keep_going = keep_going
  st.build_max_errors = max_errors
  st.build_subsystem = subsystem
  st.build_extra_args = extra_args

  wr = project.save_project(st.project)
  if typeof(wr) == "error" then
    win.MessageBoxW(dlg, "The project file could not be saved:\n" + wr.message, "Compile Settings", 0)
    return [st, false]
  end if
  st = _save_config(st)
  st.project = project.load_project(st.project.root)
  st = _populate_project_tree(st)
  st = _refresh_tabs(st)
  st = _set_log(st, "Compile settings saved. Main file: " + st.project.entry)
  return [st, true]
end function

// Open compile settings window.
function _open_compile_settings_window(st)
  // Run a local message loop so the modal UI stays responsive.
  st = _sync_active_tab(st)
  dlg = win.create_main_window("Compile Settings", 760, 460)
  if dlg is void then return _set_log(st, "Compile Settings could not be opened.") end if

  _settings_label(dlg, st.font_ui, "Main file", 20, 26, 120, 24)
  entry_edit = _settings_edit_id(dlg, st.font_ui, st.project.entry, 150, 22, 450, 26, ID_SETTINGS_ENTRY_EDIT)
  entry_browse = _settings_button(dlg, st.font_ui, "Browse", 612, 22, 92, 26, ID_SETTINGS_ENTRY_BROWSE)

  _settings_label(dlg, st.font_ui, "Output", 20, 66, 120, 24)
  output_edit = _settings_edit_id(dlg, st.font_ui, st.project.output, 150, 62, 554, 26, ID_SETTINGS_OUTPUT_EDIT)

  _settings_label(dlg, st.font_ui, "Test file", 20, 106, 120, 24)
  test_entry_edit = _settings_edit_id(dlg, st.font_ui, st.project.test_entry, 150, 102, 554, 26, ID_SETTINGS_TEST_EDIT)

  _settings_label(dlg, st.font_ui, "Run arguments", 20, 146, 120, 24)
  run_args_edit = _settings_edit_id(dlg, st.font_ui, st.project.run_args, 150, 142, 554, 26, ID_SETTINGS_RUN_ARGS_EDIT)

  _settings_label(dlg, st.font_ui, "Working folder", 20, 186, 120, 24)
  working_dir_edit = _settings_edit_id(dlg, st.font_ui, st.project.working_dir, 150, 182, 554, 26, ID_SETTINGS_WORKDIR_EDIT)

  _settings_label(dlg, st.font_ui, "Compiler", 20, 226, 120, 24)
  compiler_edit = _settings_edit_id(dlg, st.font_ui, st.compiler_path, 150, 222, 450, 26, ID_SETTINGS_COMPILER_EDIT)
  compiler_browse = _settings_button(dlg, st.font_ui, "Browse", 612, 222, 92, 26, ID_SETTINGS_COMPILER_BROWSE)
  _settings_label(dlg, st.font_ui, "Leave empty for default: " + build.default_compiler(st.project), 150, 250, 554, 22)

  _settings_label(dlg, st.font_ui, "Max errors", 20, 286, 120, 24)
  max_edit = _settings_edit_id(dlg, st.font_ui, "" + st.build_max_errors, 150, 282, 100, 26, ID_SETTINGS_MAX_EDIT)
  keep_btn = _settings_button(dlg, st.font_ui, "", 270, 282, 160, 26, ID_SETTINGS_KEEP_GOING)
  subsystem_btn = _settings_button(dlg, st.font_ui, "", 442, 282, 180, 26, ID_SETTINGS_SUBSYSTEM)

  _settings_label(dlg, st.font_ui, "Extra Args", 20, 326, 120, 24)
  extra_edit = _settings_edit_id(dlg, st.font_ui, st.build_extra_args, 150, 322, 554, 26, ID_SETTINGS_EXTRA_EDIT)
  controls = CompileSettingsControls(dlg, entry_edit, output_edit, test_entry_edit, run_args_edit, working_dir_edit, compiler_edit, max_edit, extra_edit)

  ok_btn = _settings_button(dlg, st.font_ui, "OK", 500, 388, 92, 30, ID_SETTINGS_OK)
  cancel_btn = _settings_button(dlg, st.font_ui, "Cancel", 604, 388, 100, 30, ID_SETTINGS_CANCEL)

  keep_going = st.build_keep_going
  subsystem = st.build_subsystem
  entry_value = st.project.entry
  output_value = st.project.output
  compiler_value = st.compiler_path
  _refresh_settings_buttons(keep_btn, subsystem_btn, keep_going, subsystem)

  done = false
  while done == false and win.IsWindow(dlg)
    msg = bytes(48, 0)
    while win.PeekMessageW(msg, void, 0, 0, win.PM_REMOVE)
      code = win.msg_message(msg)
      hwnd = win.msg_hwnd(msg)
      handled = false

      if code == win.WM_QUIT then
        st.running = false
        done = true
        handled = true
      else if code == win.WM_CLOSE and hwnd == dlg then
        done = true
        win.DestroyWindow(dlg)
        handled = true
      else if code == win.WM_CLOSE and hwnd == st.hwnd then
        st = _request_exit(st)
        done = true
        if win.IsWindow(dlg) then win.DestroyWindow(dlg) end if
        handled = true
      else if (code == win.WM_DESTROY or code == win.WM_NCDESTROY) and hwnd == dlg then
        done = true
        handled = true
      else if (code == win.WM_DESTROY or code == win.WM_NCDESTROY) and hwnd == st.hwnd then
        st.running = false
        done = true
        handled = true
      else if code == win.WM_KEYDOWN then
        key = win.msg_wparam_u32(msg)
        if key == win.VK_ESCAPE then
          done = true
          win.DestroyWindow(dlg)
          handled = true
        else if key == win.VK_RETURN then
          values = _read_compile_settings_values(st, controls, entry_value, output_value, compiler_value)
          applied = _apply_compile_settings(st, dlg, values, keep_going, subsystem)
          st = applied[0]
          if applied[1] then
            done = true
            win.DestroyWindow(dlg)
          end if
          handled = true
        end if
      else if code == win.WM_COMMAND and hwnd == dlg then
        cid = win.msg_command_id(msg)
        if cid == ID_SETTINGS_ENTRY_BROWSE then
          path = win.open_minilang_file_dialog(dlg)
          if typeof(path) == "string" and path != "" then
            entry_value = _project_relative_path(st, path)
            win.set_window_text(entry_edit, entry_value)
          end if
          handled = true
        else if cid == ID_SETTINGS_COMPILER_BROWSE then
          path = win.open_compiler_dialog(dlg)
          if typeof(path) == "string" and path != "" then
            compiler_value = path
            win.set_window_text(compiler_edit, compiler_value)
          end if
          handled = true
        else if cid == ID_SETTINGS_KEEP_GOING then
          keep_going = keep_going == false
          _refresh_settings_buttons(keep_btn, subsystem_btn, keep_going, subsystem)
          handled = true
        else if cid == ID_SETTINGS_SUBSYSTEM then
          if subsystem == "windows" then subsystem = "console" else subsystem = "windows" end if
          _refresh_settings_buttons(keep_btn, subsystem_btn, keep_going, subsystem)
          handled = true
        else if cid == ID_SETTINGS_CANCEL then
          done = true
          win.DestroyWindow(dlg)
          handled = true
        else if cid == ID_SETTINGS_OK then
          values = _read_compile_settings_values(st, controls, entry_value, output_value, compiler_value)
          applied = _apply_compile_settings(st, dlg, values, keep_going, subsystem)
          st = applied[0]
          if applied[1] then
            done = true
            win.DestroyWindow(dlg)
          end if
          handled = true
        end if
      else if code == win.WM_LBUTTONUP then
        if hwnd == entry_browse then
          path = win.open_minilang_file_dialog(dlg)
          if typeof(path) == "string" and path != "" then
            entry_value = _project_relative_path(st, path)
            win.set_window_text(entry_edit, entry_value)
          end if
          handled = true
        else if hwnd == compiler_browse then
          path = win.open_compiler_dialog(dlg)
          if typeof(path) == "string" and path != "" then
            compiler_value = path
            win.set_window_text(compiler_edit, compiler_value)
          end if
          handled = true
        else if hwnd == keep_btn then
          keep_going = keep_going == false
          _refresh_settings_buttons(keep_btn, subsystem_btn, keep_going, subsystem)
          handled = true
        else if hwnd == subsystem_btn then
          if subsystem == "windows" then subsystem = "console" else subsystem = "windows" end if
          _refresh_settings_buttons(keep_btn, subsystem_btn, keep_going, subsystem)
          handled = true
        else if hwnd == cancel_btn then
          done = true
          win.DestroyWindow(dlg)
          handled = true
        else if hwnd == ok_btn then
          values = _read_compile_settings_values(st, controls, entry_value, output_value, compiler_value)
          applied = _apply_compile_settings(st, dlg, values, keep_going, subsystem)
          st = applied[0]
          if applied[1] then
            done = true
            win.DestroyWindow(dlg)
          end if
          handled = true
        end if
      end if

      if handled == false then
        win.TranslateMessage(msg)
        win.DispatchMessageW(msg)
      end if
    end while
    if done == false then win.Sleep(15) end if
  end while

  if st.running and win.IsWindow(st.hwnd) then win.SetFocus(st.editor) end if
  return st
end function

// Return the language help path.
function _language_help_path(st)
  root = "."
  if typeof(st.project) == "struct" then root = st.project.root end if
  return help_lang.reference_path(root, _effective_compiler(st))
end function

// Open language help.
function _open_language_help(st)
  root = "."
  if typeof(st.project) == "struct" then root = st.project.root end if
  loaded = help_lang.read_reference(root, _effective_compiler(st))
  if loaded[2] != "" then return _set_log(st, loaded[2]) end if
  return _open_virtual_tab(st, "miniide://MiniLang Language Reference.md", loaded[1])
end function

// Search language help.
function _search_language_help(st, query)
  query = s.trim(query)
  if query == "" then return _set_log(st, "Help search: the search text is empty.") end if
  root = "."
  if typeof(st.project) == "struct" then root = st.project.root end if
  loaded = help_lang.read_reference(root, _effective_compiler(st))
  if loaded[2] != "" then return _set_log(st, loaded[2]) end if
  doc = help_lang.search_document(loaded[1], query)
  return _open_virtual_tab(st, "miniide://MiniLang Help Search.md", doc)
end function

// Open language help search.
function _open_language_help_search(st)
  // Run a local message loop so the modal UI stays responsive.
  initial = _initial_find_text(st)
  dlg = win.create_main_window("Search MiniLang Help", 500, 170)
  if dlg is void then return st end if
  _settings_label(dlg, st.font_ui, "Search text", 20, 28, 90, 24)
  help_edit = _settings_edit_id(dlg, st.font_ui, initial, 116, 24, 340, 26, ID_HELP_SEARCH_TEXT_EDIT)
  ok_btn = _settings_button(dlg, st.font_ui, "Search", 244, 92, 96, 30, ID_HELP_SEARCH_OK)
  cancel_btn = _settings_button(dlg, st.font_ui, "Cancel", 350, 92, 106, 30, ID_HELP_SEARCH_CANCEL)
  win.edit_select_all(help_edit)
  win.SetFocus(help_edit)

  query = ""
  done = false
  while done == false and win.IsWindow(dlg)
    msg = bytes(48, 0)
    while win.PeekMessageW(msg, void, 0, 0, win.PM_REMOVE)
      code = win.msg_message(msg)
      hwnd = win.msg_hwnd(msg)
      handled = false

      if code == win.WM_QUIT then
        st.running = false
        done = true
        handled = true
      else if code == win.WM_CLOSE and hwnd == dlg then
        done = true
        win.DestroyWindow(dlg)
        handled = true
      else if code == win.WM_CLOSE and hwnd == st.hwnd then
        st = _request_exit(st)
        done = true
        if win.IsWindow(dlg) then win.DestroyWindow(dlg) end if
        handled = true
      else if (code == win.WM_DESTROY or code == win.WM_NCDESTROY) and hwnd == dlg then
        done = true
        handled = true
      else if code == win.WM_KEYDOWN then
        key = win.msg_wparam_u32(msg)
        if key == win.VK_ESCAPE then
          done = true
          win.DestroyWindow(dlg)
          handled = true
        else if key == win.VK_RETURN then
          query = win.get_control_text(help_edit)
          done = true
          win.DestroyWindow(dlg)
          handled = true
        end if
      else if code == win.WM_COMMAND and hwnd == dlg then
        cid = win.msg_command_id(msg)
        if cid == ID_HELP_SEARCH_CANCEL then
          done = true
          win.DestroyWindow(dlg)
          handled = true
        else if cid == ID_HELP_SEARCH_OK then
          query = win.get_control_text(help_edit)
          done = true
          win.DestroyWindow(dlg)
          handled = true
        end if
      else if code == win.WM_LBUTTONUP then
        if hwnd == cancel_btn then
          done = true
          win.DestroyWindow(dlg)
          handled = true
        else if hwnd == ok_btn then
          query = win.get_control_text(help_edit)
          done = true
          win.DestroyWindow(dlg)
          handled = true
        end if
      end if

      if handled == false then
        win.TranslateMessage(msg)
        win.DispatchMessageW(msg)
      end if
    end while
    if done == false then win.Sleep(15) end if
  end while

  if query != "" then return _search_language_help(st, query) end if
  if st.running and win.IsWindow(st.hwnd) then win.SetFocus(st.editor) end if
  return st
end function

// Return true when a character belongs to an editor word.
function _is_word_char(ch)
  if typeof(ch) != "string" or ch == "" then return false end if
  if ch == "_" or ch == "." then return true end if
  b = bytes(ch)
  if len(b) <= 0 then return false end if
  c = b[0]
  return (c >= 65 and c <= 90) or (c >= 97 and c <= 122) or (c >= 48 and c <= 57)
end function

// Return the word prefix before.
function _word_prefix_before(text, pos)
  if typeof(text) != "string" then return "" end if
  if typeof(pos) != "int" then pos = len(text) end if
  if pos > len(text) then pos = len(text) end if
  if pos <= 0 then return "" end if
  i = pos - 1
  while i >= 0 and _is_word_char(text[i])
    i = i - 1
  end while
  start = i + 1
  if start >= pos then return "" end if
  return s.substr(text, start, pos - start)
end function

// Return the word at position.
function _word_at_pos(text, pos)
  if typeof(text) != "string" then return "" end if
  if typeof(pos) != "int" then pos = 0 end if
  if pos < 0 then pos = 0 end if
  if pos > len(text) then pos = len(text) end if
  left = pos - 1
  while left >= 0 and _is_word_char(text[left])
    left = left - 1
  end while
  right = pos
  while right < len(text) and _is_word_char(text[right])
    right = right + 1
  end while
  start = left + 1
  if right <= start then return "" end if
  return s.substr(text, start, right - start)
end function

// Return the trim trailing whitespace.
function _trim_trailing_ws(line)
  if typeof(line) != "string" then return "" end if
  end_pos = len(line)
  while end_pos > 0 and (line[end_pos - 1] == " " or line[end_pos - 1] == "\t")
    end_pos = end_pos - 1
  end while
  if end_pos <= 0 then return "" end if
  return s.substr(line, 0, end_pos)
end function

// Format text basic.
function _format_text_basic(text)
  // Walk collections defensively because project data can be partially populated.
  text = _normalize_editor_text(text)
  lines = s.split(text, "\n")
  if typeof(lines) != "array" then return text end if
  if len(lines) <= 0 then return "" end if
  result_text = ""
  blank_count = 0
  for i = 0 to len(lines) - 1
    line = _trim_trailing_ws(lines[i])
    if s.trim(line) == "" then
      blank_count = blank_count + 1
    else
      blank_count = 0
    end if
    if blank_count > 2 then continue end if
    if result_text != "" then result_text = result_text + "\n" end if
    result_text = result_text + line
  end for
  return result_text
end function

// Format current.
function _format_current(st)
  if st.active_tab < 0 or st.active_tab >= len(st.open_texts) then return _set_log(st, "No file is open.") end if
  st = _sync_active_tab(st)
  idx = st.active_tab
  current = st.open_texts[idx]
  formatted = _format_text_basic(current)
  if formatted == current then return _set_log(st, "Document is already formatted.") end if
  st.open_undo[idx] = _push_snapshot(st.open_undo[idx], current)
  st.open_redo[idx] = []
  st = _replace_active_text(st, formatted)
  return _set_log(st, "Document formatted: " + _basename(st.current_file))
end function

// Hide autocomplete.
function _hide_autocomplete(st)
  win.ShowWindow(st.autocomplete_list, win.SW_HIDE)
  st.autocomplete_items = []
  st.autocomplete_prefix = ""
  return st
end function

// Show autocomplete popup.
function _show_autocomplete_popup(st, items, prefix)
  // Walk collections defensively because project data can be partially populated.
  if typeof(items) != "array" or len(items) <= 0 then return st end if
  st.autocomplete_items = items
  st.autocomplete_prefix = prefix
  win.listbox_reset(st.autocomplete_list)
  for i = 0 to len(items) - 1
    win.listbox_add(st.autocomplete_list, items[i])
  end for
  win.listbox_setsel(st.autocomplete_list, 0)
  sel = win.edit_getsel(st.editor)
  line = win.edit_line_from_char(st.editor, sel[0])
  first = win.edit_first_visible_line(st.editor)
  rel_line = line - first
  if rel_line < 0 then rel_line = 0 end if
  x = LEFT_W + LINE_NO_W + 18
  y = TOOL_H + TAB_H + 24 + rel_line * 18
  if y > st.last_h - LOG_H - 170 then y = st.last_h - LOG_H - 170 end if
  if y < TOOL_H + TAB_H + 8 then y = TOOL_H + TAB_H + 8 end if
  win.MoveWindow(st.autocomplete_list, x, y, 260, 150, true)
  win.ShowWindow(st.autocomplete_list, win.SW_SHOW)
  win.SetFocus(st.autocomplete_list)
  return st
end function

// Accept autocomplete.
function _accept_autocomplete(st)
  idx = win.listbox_getsel(st.autocomplete_list)
  if typeof(idx) != "int" or idx < 0 then idx = 0 end if
  if typeof(st.autocomplete_items) != "array" or idx >= len(st.autocomplete_items) then return _hide_autocomplete(st) end if
  item = st.autocomplete_items[idx]
  prefix = st.autocomplete_prefix
  if typeof(prefix) != "string" then prefix = "" end if
  insert_text = item
  if prefix != "" and len(item) >= len(prefix) and s.startsWith(s.toLowerAscii(item), s.toLowerAscii(prefix)) then
    insert_text = s.substr(item, len(prefix), len(item) - len(prefix))
  end if
  win.SetFocus(st.editor)
  win.edit_replace_sel(st.editor, insert_text)
  st = _record_edit_activity(st)
  st = _sync_active_tab(st)
  st = _hide_autocomplete(st)
  return _set_log(st, "Completed: " + item)
end function

// Return the autocomplete.
function _autocomplete(st)
  if st.active_tab < 0 or st.active_tab >= len(st.open_texts) then return _set_log(st, "No file is open.") end if
  display_text = win.edit_get_text(st.editor)
  sel = win.edit_getsel(st.editor)
  prefix = _word_prefix_before(display_text, sel[0])
  snapshot = lang_service.analyze_project(st.project)
  items = lang_service.completion_labels(snapshot, prefix, 24)
  if typeof(items) != "array" or len(items) <= 0 then
    if prefix == "" then return _set_log(st, "No completions found.") end if
    return _set_log(st, "No completions for: " + prefix)
  end if

  if len(items) == 1 and prefix != "" and len(items[0]) > len(prefix) then
    suffix = s.substr(items[0], len(prefix), len(items[0]) - len(prefix))
    win.edit_replace_sel(st.editor, suffix)
    st = _record_edit_activity(st)
    st = _sync_active_tab(st)
    return _set_log(st, "Completed: " + items[0])
  end if

  return _show_autocomplete_popup(st, items, prefix)
end function

// Return the command IDs exposed by the command palette.
function _command_palette_ids()
  return [
    ID_FILE_OPEN_PROJECT, ID_FILE_QUICK_OPEN, ID_FILE_RECENT_FILES, ID_FILE_NEW_PROJECT, ID_FILE_RELOAD, ID_FILE_SAVE, ID_FILE_SAVE_ALL,
    ID_FILE_CLEAN, ID_FILE_BUILD, ID_FILE_REBUILD, ID_FILE_RUN, ID_FILE_STOP, ID_FILE_TEST, ID_FILE_TEST_CURRENT, ID_FILE_TEST_RELATED,
    ID_EDIT_FIND, ID_EDIT_FIND_NEXT, ID_EDIT_SELECT_ALL, ID_EDIT_RENAME_SYMBOL, ID_EDIT_COMPLETE, ID_EDIT_FORMAT,
    ID_NAV_BACK, ID_NAV_FORWARD, ID_NAV_TOGGLE_BOOKMARK, ID_NAV_BOOKMARKS, ID_NAV_NEXT_BOOKMARK, ID_NAV_PREV_BOOKMARK, ID_NAV_REVEAL_ACTIVE_FILE, ID_NAV_OUTLINE, ID_NAV_FILE_STRUCTURE, ID_NAV_WORKSPACE_HEALTH, ID_NAV_TODOS, ID_NAV_TEST_EXPLORER, ID_NAV_RELATED_TESTS, ID_NAV_IMPORT_GRAPH, ID_NAV_CALL_HIERARCHY, ID_NAV_SYMBOL_INFO, ID_NAV_CODE_INSPECTIONS, ID_NAV_PROJECT_INDEX, ID_NAV_PROJECT_SYMBOLS, ID_NAV_GOTO_SYMBOL,
    ID_NAV_GOTO_LINE, ID_NAV_GOTO_DEFINITION, ID_NAV_FIND_REFERENCES, ID_NAV_SEARCH_WORD, ID_NAV_PROBLEMS,
    ID_CONFIG_COMPILE_SETTINGS, ID_CONFIG_PROFILE_DEBUG, ID_CONFIG_PROFILE_RELEASE,
    ID_CONFIG_THEME_DARK, ID_CONFIG_THEME_LIGHT, ID_CONFIG_COMPILER_SELECT, ID_CONFIG_COMPILER_RESET,
    ID_CONFIG_RELOAD, ID_CONFIG_SHOW,
    ID_HELP_WELCOME, ID_HELP_LANGUAGE, ID_HELP_LANGUAGE_SEARCH, ID_HELP_ABOUT,
  ]
end function

// Return the display labels exposed by the command palette.
function _command_palette_labels()
  return [
    "File: Open Project", "File: Quick Open File", "File: Recent Files", "File: New Project", "File: Reload Project", "File: Save", "File: Save All",
    "Build: Clean", "Build: Build", "Build: Rebuild", "Build: Run", "Build: Stop", "Build: Run Tests", "Build: Run Current Test File", "Build: Run Related Test File",
    "Edit: Find", "Edit: Find Next", "Edit: Select All", "Edit: Rename Symbol Preview", "Edit: Complete", "Edit: Format Document",
    "Navigation: Back", "Navigation: Forward", "Navigation: Toggle Bookmark", "Navigation: Bookmarks", "Navigation: Next Bookmark", "Navigation: Previous Bookmark", "Navigation: Reveal Active File", "Navigation: Outline", "Navigation: File Structure", "Navigation: Workspace Health", "Navigation: TODOs", "Navigation: Test Explorer", "Navigation: Related Tests", "Navigation: Import Graph", "Navigation: Call Hierarchy", "Navigation: Symbol Info", "Navigation: Code Inspections", "Navigation: Project Index", "Navigation: Project Symbols", "Navigation: Go to Symbol",
    "Navigation: Go to Line", "Navigation: Go to Definition", "Navigation: Find References", "Navigation: Search Word in Project", "Navigation: Problems",
    "Configuration: Compile Settings", "Configuration: Build Profile Debug", "Configuration: Build Profile Release",
    "Configuration: Theme Dark", "Configuration: Theme Light", "Configuration: Select Compiler", "Configuration: Reset Compiler",
    "Configuration: Reload Configuration", "Configuration: Show Configuration",
    "Help: Home", "Help: MiniLang Language Reference", "Help: Search MiniLang Help", "Help: About MiniIDE",
  ]
end function

// Return additional search aliases for command palette labels.
function _command_palette_search_texts()
  return [
    "file open project workspace ctrl o", "file quick open find file ctrl p", "file recent files switch ctrl e", "file new project create", "file reload project refresh", "file save ctrl s", "file save all ctrl shift s",
    "build clean", "build compile f5", "build rebuild clean compile", "build run execute f6", "build stop cancel", "build test tests f7", "build test current file ctrl f7", "build test related file ctrl shift f7",
    "edit find search ctrl f", "edit find next f3", "edit select all ctrl a", "edit rename symbol refactor f2 preview", "edit complete autocomplete ctrl space", "edit format document",
    "navigation back alt left history previous", "navigation forward alt right history next", "navigation toggle bookmark ctrl f2 marker favorite", "navigation bookmarks shift f2 markers favorites", "navigation next bookmark alt down marker favorite", "navigation previous bookmark alt up marker favorite", "navigation reveal active file project tree select alt f1", "navigation outline symbols current file", "navigation file structure ctrl f12 current symbols", "navigation workspace health dashboard status diagnostics", "navigation todo todos fixme tasks", "navigation test explorer tests runner", "navigation related tests current file", "navigation import graph imports dependencies", "navigation call hierarchy callers references", "navigation symbol info quick documentation inspect", "navigation code inspections unused symbols lint analysis", "navigation project index imports files", "navigation project symbols", "navigation goto symbol ctrl t",
    "navigation goto line ctrl g", "navigation goto definition f12", "navigation find references shift f12", "navigation search word project", "navigation problems diagnostics errors warnings",
    "configuration compile settings compiler build", "configuration build profile debug", "configuration build profile release",
    "configuration theme dark", "configuration theme light", "configuration compiler select", "configuration compiler reset default",
    "configuration reload", "configuration show",
    "help home welcome", "help minilang language reference", "help search minilang language", "help about miniide",
  ]
end function

// Return true when a command palette entry matches the query.
function _command_palette_matches(labels, search_texts, idx, query)
  if typeof(labels) != "array" or idx < 0 or idx >= len(labels) then return false end if
  if typeof(query) != "string" or query == "" then return true end if
  extra = ""
  if typeof(search_texts) == "array" and idx < len(search_texts) then extra = search_texts[idx] end if
  q = s.toLowerAscii(query)
  hay = s.toLowerAscii(labels[idx] + " " + extra)
  return s.indexOf(hay, q, 0) >= 0
end function

// Return the command selected by query or list selection.
function _command_palette_pick(ids, labels, search_texts, query, selected)
  if typeof(ids) != "array" or typeof(labels) != "array" or len(ids) <= 0 then return 0 end if
  if typeof(query) != "string" then query = "" end if
  query = s.trim(query)
  if query == "" and selected >= 0 and selected < len(ids) then return ids[selected] end if
  count = len(ids)
  if len(labels) < count then count = len(labels) end if
  for i = 0 to count - 1
    if _command_palette_matches(labels, search_texts, i, query) then return ids[i] end if
  end for
  if selected >= 0 and selected < len(ids) then return ids[selected] end if
  return 0
end function

// Dispatch a command selected through the command palette without recursing into the palette command.
function _perform_palette_command(st, id)
  if id == ID_FILE_OPEN_PROJECT then return _open_project_dialog(st) end if
  if id == ID_FILE_QUICK_OPEN then return _open_quick_open_window(st) end if
  if id == ID_FILE_RECENT_FILES then return _show_recent_files(st) end if
  if id == ID_FILE_NEW_PROJECT then return _new_standard_project(st) end if
  if id == ID_FILE_SAVE then return _save_current(st) end if
  if id == ID_FILE_SAVE_ALL then return _save_all(st) end if
  if id == ID_FILE_CLEAN then return _clean_project(st) end if
  if id == ID_FILE_BUILD then return _build_project(st) end if
  if id == ID_FILE_REBUILD then return _rebuild_project(st) end if
  if id == ID_FILE_RUN then return _run_project(st) end if
  if id == ID_FILE_STOP then return _stop_build_job(st) end if
  if id == ID_FILE_TEST then return _run_tests(st) end if
  if id == ID_FILE_TEST_CURRENT then return _run_current_test_file(st) end if
  if id == ID_FILE_TEST_RELATED then return _run_related_test_file(st) end if
  if id == ID_FILE_RELOAD then return _reload_project(st) end if
  if id == ID_EDIT_FIND then return _open_find_window(st) end if
  if id == ID_EDIT_FIND_NEXT then return _find_next(st) end if
  if id == ID_EDIT_SELECT_ALL then return _edit_select_all(st) end if
  if id == ID_EDIT_RENAME_SYMBOL then return _open_rename_symbol_window(st) end if
  if id == ID_EDIT_COMPLETE then return _autocomplete(st) end if
  if id == ID_EDIT_FORMAT then return _format_current(st) end if
  if id == ID_NAV_BACK then return _navigate_back(st) end if
  if id == ID_NAV_FORWARD then return _navigate_forward(st) end if
  if id == ID_NAV_TOGGLE_BOOKMARK then return _toggle_bookmark(st) end if
  if id == ID_NAV_BOOKMARKS then return _show_bookmarks(st) end if
  if id == ID_NAV_NEXT_BOOKMARK then return _goto_bookmark(st, 1) end if
  if id == ID_NAV_PREV_BOOKMARK then return _goto_bookmark(st, -1) end if
  if id == ID_NAV_REVEAL_ACTIVE_FILE then return _reveal_active_file(st) end if
  if id == ID_NAV_OUTLINE then return _show_outline(st) end if
  if id == ID_NAV_FILE_STRUCTURE then return _open_file_structure_window(st) end if
  if id == ID_NAV_WORKSPACE_HEALTH then return _show_workspace_health(st) end if
  if id == ID_NAV_TODOS then return _show_todos(st) end if
  if id == ID_NAV_TEST_EXPLORER then return _show_test_explorer(st) end if
  if id == ID_NAV_RELATED_TESTS then return _show_related_tests(st) end if
  if id == ID_NAV_IMPORT_GRAPH then return _show_import_graph(st) end if
  if id == ID_NAV_CALL_HIERARCHY then return _show_call_hierarchy(st) end if
  if id == ID_NAV_SYMBOL_INFO then return _show_symbol_info(st) end if
  if id == ID_NAV_CODE_INSPECTIONS then return _show_code_inspections(st) end if
  if id == ID_NAV_PROJECT_INDEX then return _show_project_index(st) end if
  if id == ID_NAV_PROJECT_SYMBOLS then return _show_project_symbols(st) end if
  if id == ID_NAV_GOTO_SYMBOL then return _open_goto_symbol_window(st) end if
  if id == ID_NAV_GOTO_LINE then return _open_goto_line_window(st) end if
  if id == ID_NAV_GOTO_DEFINITION then return _goto_definition(st) end if
  if id == ID_NAV_FIND_REFERENCES then return _find_references(st) end if
  if id == ID_NAV_SEARCH_WORD then return _search_current_word(st) end if
  if id == ID_NAV_PROBLEMS then return _show_problems(st) end if
  if id == ID_CONFIG_COMPILE_SETTINGS then return _open_compile_settings_window(st) end if
  if id == ID_CONFIG_PROFILE_DEBUG then return _select_build_profile(st, "debug") end if
  if id == ID_CONFIG_PROFILE_RELEASE then return _select_build_profile(st, "release") end if
  if id == ID_CONFIG_THEME_DARK then return _select_theme(st, "dark") end if
  if id == ID_CONFIG_THEME_LIGHT then return _select_theme(st, "light") end if
  if id == ID_CONFIG_COMPILER_SELECT then return _select_compiler(st) end if
  if id == ID_CONFIG_COMPILER_RESET then return _reset_compiler(st) end if
  if id == ID_CONFIG_RELOAD then return _reload_config(st) end if
  if id == ID_CONFIG_SHOW then return _show_config(st) end if
  if id == ID_HELP_WELCOME then return _show_welcome(st) end if
  if id == ID_HELP_LANGUAGE then return _open_language_help(st) end if
  if id == ID_HELP_LANGUAGE_SEARCH then return _open_language_help_search(st) end if
  if id == ID_HELP_ABOUT then return _about(st) end if
  return st
end function

// Open command palette window.
function _open_command_palette(st)
  // Run a local message loop so the modal UI stays responsive.
  ids = _command_palette_ids()
  labels = _command_palette_labels()
  search_texts = _command_palette_search_texts()
  dlg = win.create_main_window("Command Palette", 620, 420)
  if dlg is void then return _set_log(st, "Command Palette could not be opened.") end if

  _settings_label(dlg, st.font_ui, "Command", 20, 26, 90, 24)
  command_edit = _settings_edit_id(dlg, st.font_ui, "", 116, 22, 460, 26, ID_COMMAND_SEARCH_TEXT_EDIT)
  list_style = win.WS_TABSTOP | win.WS_VSCROLL | win.LBS_NOTIFY | win.LBS_HASSTRINGS | win.LBS_NOINTEGRALHEIGHT
  command_list = win.create_child_id(dlg, "LISTBOX", "", 0, list_style, 20, 62, 556, 270, ID_COMMAND_LIST)
  win.set_control_font(command_list, st.font_ui)
  for i = 0 to len(labels) - 1
    win.listbox_add(command_list, labels[i])
  end for
  if len(labels) > 0 then win.listbox_setsel(command_list, 0) end if
  run_btn = _settings_button(dlg, st.font_ui, "Run", 382, 352, 86, 30, ID_COMMAND_RUN)
  cancel_btn = _settings_button(dlg, st.font_ui, "Cancel", 480, 352, 96, 30, ID_COMMAND_CANCEL)
  win.SetFocus(command_edit)

  selected_id = 0
  done = false
  while done == false and win.IsWindow(dlg)
    msg = bytes(48, 0)
    while win.PeekMessageW(msg, void, 0, 0, win.PM_REMOVE)
      code = win.msg_message(msg)
      hwnd = win.msg_hwnd(msg)
      handled = false

      if code == win.WM_QUIT then
        st.running = false
        done = true
        handled = true
      else if code == win.WM_CLOSE and hwnd == dlg then
        done = true
        win.DestroyWindow(dlg)
        handled = true
      else if code == win.WM_CLOSE and hwnd == st.hwnd then
        st = _request_exit(st)
        done = true
        if win.IsWindow(dlg) then win.DestroyWindow(dlg) end if
        handled = true
      else if (code == win.WM_DESTROY or code == win.WM_NCDESTROY) and hwnd == dlg then
        done = true
        handled = true
      else if code == win.WM_KEYDOWN then
        key = win.msg_wparam_u32(msg)
        if key == win.VK_ESCAPE then
          done = true
          win.DestroyWindow(dlg)
          handled = true
        else if key == win.VK_RETURN then
          query = win.get_control_text(command_edit)
          selected_id = _command_palette_pick(ids, labels, search_texts, query, win.listbox_getsel(command_list))
          done = true
          win.DestroyWindow(dlg)
          handled = true
        end if
      else if code == win.WM_COMMAND and hwnd == dlg then
        cid = win.msg_command_id(msg)
        notify = win.msg_command_notify(msg)
        if cid == ID_COMMAND_CANCEL then
          done = true
          win.DestroyWindow(dlg)
          handled = true
        else if cid == ID_COMMAND_RUN then
          query = win.get_control_text(command_edit)
          selected_id = _command_palette_pick(ids, labels, search_texts, query, win.listbox_getsel(command_list))
          done = true
          win.DestroyWindow(dlg)
          handled = true
        else if cid == ID_COMMAND_LIST and notify == win.LBN_DBLCLK then
          selected_id = _command_palette_pick(ids, labels, search_texts, "", win.listbox_getsel(command_list))
          done = true
          win.DestroyWindow(dlg)
          handled = true
        end if
      else if code == win.WM_LBUTTONUP then
        if hwnd == cancel_btn then
          done = true
          win.DestroyWindow(dlg)
          handled = true
        else if hwnd == run_btn then
          query = win.get_control_text(command_edit)
          selected_id = _command_palette_pick(ids, labels, search_texts, query, win.listbox_getsel(command_list))
          done = true
          win.DestroyWindow(dlg)
          handled = true
        end if
      end if

      if handled == false then
        win.TranslateMessage(msg)
        win.DispatchMessageW(msg)
      end if
    end while
    if done == false then win.Sleep(15) end if
  end while

  if selected_id != 0 then return _perform_palette_command(st, selected_id) end if
  if st.running and win.IsWindow(st.hwnd) then win.SetFocus(st.editor) end if
  return st
end function

// Show or open project files matching a query.
function _quick_open_query(st, query)
  if typeof(query) != "string" then query = "" end if
  query = s.trim(query)
  snapshot = lang_service.analyze_project(st.project)
  items = lang_service.file_items(snapshot, query, 300)
  if typeof(items) != "array" or len(items) <= 0 then
    if query == "" then return _set_log(st, "Quick Open: no project files found.") end if
    return _set_log(st, "Quick Open: no matches for " + query)
  end if

  if query != "" then return _open_file(st, items[0].path) end if

  rows = []
  files = []
  lines_out = []
  cols = []
  for i = 0 to len(items) - 1
    item = items[i]
    if typeof(item) != "struct" then continue end if
    rows = rows + [item.relative_path + "  " + item.line_count + " lines"]
    files = files + [item.path]
    lines_out = lines_out + [1]
    cols = cols + [1]
  end for

  title = "Quick Open Files"
  if len(items) >= 300 then title = title + " (first 300)" end if
  return _show_result_panel(st, "quick-open", title, rows, files, lines_out, cols)
end function

// Show the files currently open in this session.
function _show_recent_files(st)
  if typeof(st.open_files) != "array" or len(st.open_files) <= 0 then return _set_log(st, "Recent Files: no files are open.") end if

  rows = []
  files = []
  lines_out = []
  cols = []
  i = len(st.open_files) - 1
  while i >= 0
    file = st.open_files[i]
    if typeof(file) == "string" and file != "" then
      marker = "  "
      if i == st.active_tab then marker = "* " end if
      label = _project_relative_path(st, file)
      if _is_generated_editor_path(file) then label = _basename(file) end if
      rows = rows + [marker + label]
      files = files + [file]
      lines_out = lines_out + [1]
      cols = cols + [1]
    end if
    i = i - 1
  end while

  if len(rows) <= 0 then return _set_log(st, "Recent Files: no files are open.") end if
  return _show_result_panel(st, "recent-files", "Recent Files", rows, files, lines_out, cols)
end function

// Open quick file window.
function _open_quick_open_window(st)
  // Run a local message loop so the modal UI stays responsive.
  dlg = win.create_main_window("Quick Open File", 520, 180)
  if dlg is void then return _set_log(st, "Quick Open could not be opened.") end if
  _settings_label(dlg, st.font_ui, "File", 20, 28, 90, 24)
  file_edit = _settings_edit_id(dlg, st.font_ui, "", 116, 24, 360, 26, ID_QUICK_OPEN_TEXT_EDIT)
  _settings_label(dlg, st.font_ui, "Leave empty to list project files.", 116, 56, 360, 22)
  ok_btn = _settings_button(dlg, st.font_ui, "Open", 264, 104, 94, 30, ID_QUICK_OPEN_OK)
  cancel_btn = _settings_button(dlg, st.font_ui, "Cancel", 368, 104, 108, 30, ID_QUICK_OPEN_CANCEL)
  win.SetFocus(file_edit)

  query = ""
  accepted = false
  done = false
  while done == false and win.IsWindow(dlg)
    msg = bytes(48, 0)
    while win.PeekMessageW(msg, void, 0, 0, win.PM_REMOVE)
      code = win.msg_message(msg)
      hwnd = win.msg_hwnd(msg)
      handled = false

      if code == win.WM_QUIT then
        st.running = false
        done = true
        handled = true
      else if code == win.WM_CLOSE and hwnd == dlg then
        done = true
        win.DestroyWindow(dlg)
        handled = true
      else if code == win.WM_CLOSE and hwnd == st.hwnd then
        st = _request_exit(st)
        done = true
        if win.IsWindow(dlg) then win.DestroyWindow(dlg) end if
        handled = true
      else if (code == win.WM_DESTROY or code == win.WM_NCDESTROY) and hwnd == dlg then
        done = true
        handled = true
      else if code == win.WM_KEYDOWN then
        key = win.msg_wparam_u32(msg)
        if key == win.VK_ESCAPE then
          done = true
          win.DestroyWindow(dlg)
          handled = true
        else if key == win.VK_RETURN then
          query = s.trim(win.get_control_text(file_edit))
          accepted = true
          done = true
          win.DestroyWindow(dlg)
          handled = true
        end if
      else if code == win.WM_COMMAND and hwnd == dlg then
        cid = win.msg_command_id(msg)
        if cid == ID_QUICK_OPEN_CANCEL then
          done = true
          win.DestroyWindow(dlg)
          handled = true
        else if cid == ID_QUICK_OPEN_OK then
          query = s.trim(win.get_control_text(file_edit))
          accepted = true
          done = true
          win.DestroyWindow(dlg)
          handled = true
        end if
      else if code == win.WM_LBUTTONUP then
        if hwnd == cancel_btn then
          done = true
          win.DestroyWindow(dlg)
          handled = true
        else if hwnd == ok_btn then
          query = s.trim(win.get_control_text(file_edit))
          accepted = true
          done = true
          win.DestroyWindow(dlg)
          handled = true
        end if
      end if

      if handled == false then
        win.TranslateMessage(msg)
        win.DispatchMessageW(msg)
      end if
    end while
    if done == false then win.Sleep(15) end if
  end while

  if accepted then return _quick_open_query(st, query) end if
  if st.running and win.IsWindow(st.hwnd) then win.SetFocus(st.editor) end if
  return st
end function

// Show outline.
function _show_outline(st)
  // Walk collections defensively because project data can be partially populated.
  st = _sync_active_tab(st)
  current = st.current_file
  current_key = s.toLowerAscii(current)
  index = symbols.build_index(st.project)
  if typeof(index) != "struct" or typeof(index.symbols) != "array" or len(index.symbols) <= 0 then
    return _set_log(st, "Outline: no symbols found.")
  end if

  rows = []
  files = []
  lines_out = []
  cols = []
  for i = 0 to len(index.symbols) - 1
    sym = index.symbols[i]
    if typeof(sym) != "struct" then continue end if
    if current != "" and s.toLowerAscii(sym.file) != current_key then continue end if
    rows = rows + ["" + (sym.line + 1) + "  " + sym.kind + "  " + sym.name]
    files = files + [sym.file]
    lines_out = lines_out + [sym.line + 1]
    cols = cols + [1]
  end for
  if len(rows) <= 0 and current != "" then return _set_log(st, "Outline: no symbols found in " + _basename(current) + ".") end if
  title = "Outline"
  if current != "" then title = "Outline: " + _basename(current) end if
  return _show_result_panel(st, "outline", title, rows, files, lines_out, cols)
end function

// Show project symbols matching a query.
function _show_project_symbols_query(st, query)
  // Walk collections defensively because project data can be partially populated.
  if typeof(query) != "string" then query = "" end if
  snapshot = lang_service.analyze_project(st.project)
  items = lang_service.symbol_items(snapshot, query, 300)
  if typeof(items) != "array" or len(items) <= 0 then
    if query == "" then return _set_log(st, "Project symbols: no symbols found.") end if
    return _set_log(st, "Project symbols: no matches for " + query)
  end if

  rows = []
  files = []
  lines_out = []
  cols = []
  for i = 0 to len(items) - 1
    item = items[i]
    if typeof(item) != "struct" then continue end if
    rows = rows + [item.kind + "  " + item.name + "  " + _project_relative_path(st, item.file) + ":" + (item.line + 1)]
    files = files + [item.file]
    lines_out = lines_out + [item.line + 1]
    cols = cols + [1]
  end for

  title = "Project Symbols"
  if query != "" then title = "Project Symbols: " + query end if
  if len(items) >= 300 then title = title + " (first 300)" end if
  return _show_result_panel(st, "project-symbols", title, rows, files, lines_out, cols)
end function

// Show all project symbols.
function _show_project_symbols(st)
  return _show_project_symbols_query(st, "")
end function

// Return the initial symbol search text.
function _initial_symbol_search_text(st)
  if st.active_tab < 0 or st.active_tab >= len(st.open_texts) then return "" end if
  text = win.edit_get_text(st.editor)
  sel = win.edit_getsel(st.editor)
  word = _word_at_pos(text, sel[0])
  if word != "" then return word end if
  return ""
end function

// Open goto symbol window.
function _open_goto_symbol_window(st)
  // Run a local message loop so the modal UI stays responsive.
  initial = _initial_symbol_search_text(st)
  dlg = win.create_main_window("Go to Symbol", 500, 180)
  if dlg is void then return st end if
  _settings_label(dlg, st.font_ui, "Symbol", 20, 28, 90, 24)
  symbol_edit = _settings_edit_id(dlg, st.font_ui, initial, 116, 24, 340, 26, ID_SYMBOL_SEARCH_TEXT_EDIT)
  _settings_label(dlg, st.font_ui, "Leave empty to show all project symbols.", 116, 56, 340, 22)
  ok_btn = _settings_button(dlg, st.font_ui, "Search", 244, 104, 94, 30, ID_SYMBOL_SEARCH_OK)
  cancel_btn = _settings_button(dlg, st.font_ui, "Cancel", 348, 104, 108, 30, ID_SYMBOL_SEARCH_CANCEL)
  win.edit_select_all(symbol_edit)
  win.SetFocus(symbol_edit)

  query = ""
  accepted = false
  done = false
  while done == false and win.IsWindow(dlg)
    msg = bytes(48, 0)
    while win.PeekMessageW(msg, void, 0, 0, win.PM_REMOVE)
      code = win.msg_message(msg)
      hwnd = win.msg_hwnd(msg)
      handled = false

      if code == win.WM_QUIT then
        st.running = false
        done = true
        handled = true
      else if code == win.WM_CLOSE and hwnd == dlg then
        done = true
        win.DestroyWindow(dlg)
        handled = true
      else if code == win.WM_CLOSE and hwnd == st.hwnd then
        st = _request_exit(st)
        done = true
        if win.IsWindow(dlg) then win.DestroyWindow(dlg) end if
        handled = true
      else if (code == win.WM_DESTROY or code == win.WM_NCDESTROY) and hwnd == dlg then
        done = true
        handled = true
      else if code == win.WM_KEYDOWN then
        key = win.msg_wparam_u32(msg)
        if key == win.VK_ESCAPE then
          done = true
          win.DestroyWindow(dlg)
          handled = true
        else if key == win.VK_RETURN then
          query = s.trim(win.get_control_text(symbol_edit))
          accepted = true
          done = true
          win.DestroyWindow(dlg)
          handled = true
        end if
      else if code == win.WM_COMMAND and hwnd == dlg then
        cid = win.msg_command_id(msg)
        if cid == ID_SYMBOL_SEARCH_CANCEL then
          done = true
          win.DestroyWindow(dlg)
          handled = true
        else if cid == ID_SYMBOL_SEARCH_OK then
          query = s.trim(win.get_control_text(symbol_edit))
          accepted = true
          done = true
          win.DestroyWindow(dlg)
          handled = true
        end if
      else if code == win.WM_LBUTTONUP then
        if hwnd == cancel_btn then
          done = true
          win.DestroyWindow(dlg)
          handled = true
        else if hwnd == ok_btn then
          query = s.trim(win.get_control_text(symbol_edit))
          accepted = true
          done = true
          win.DestroyWindow(dlg)
          handled = true
        end if
      end if

      if handled == false then
        win.TranslateMessage(msg)
        win.DispatchMessageW(msg)
      end if
    end while
    if done == false then win.Sleep(15) end if
  end while

  if accepted then return _show_project_symbols_query(st, query) end if
  if st.running and win.IsWindow(st.hwnd) then win.SetFocus(st.editor) end if
  return st
end function

// Show current file structure.
function _open_file_structure_window(st)
  return _show_outline(st)
end function

// Show workspace health.
function _show_workspace_health(st)
  // Walk collections defensively because project data can be partially populated.
  snapshot = lang_service.analyze_project(st.project)
  health = lang_service.workspace_health_lines(snapshot)
  rows = []
  files = []
  lines_out = []
  cols = []

  if typeof(health) == "array" and len(health) > 0 then
    for i = 0 to len(health) - 1
      rows = rows + [health[i]]
      files = files + [""]
      lines_out = lines_out + [0]
      cols = cols + [0]
    end for
  end if

  rows = rows + ["Build profile: " + st.build_profile]
  files = files + [""]
  lines_out = lines_out + [0]
  cols = cols + [0]

  project_items = lang_service.diagnostics(snapshot)
  if typeof(project_items) == "array" and len(project_items) > 0 then
    rows = rows + ["Diagnostics"]
    files = files + [""]
    lines_out = lines_out + [0]
    cols = cols + [0]
    for pi = 0 to len(project_items) - 1
      d = project_items[pi]
      if typeof(d) != "struct" then continue end if
      rows = rows + [d.kind + "  " + _project_relative_path(st, d.file) + ":" + d.line + ":" + d.col + "  " + d.message]
      files = files + [d.file]
      lines_out = lines_out + [d.line]
      cols = cols + [d.col]
    end for
  else
    rows = rows + ["Diagnostics: none"]
    files = files + [""]
    lines_out = lines_out + [0]
    cols = cols + [0]
  end if

  return _show_result_panel(st, "workspace-health", "Workspace Health", rows, files, lines_out, cols)
end function

// Show TODO and FIXME items.
function _show_todos(st)
  // Walk collections defensively because project data can be partially populated.
  snapshot = lang_service.analyze_project(st.project)
  items = lang_service.todo_items(snapshot, 300)
  if typeof(items) != "array" or len(items) <= 0 then return _set_log(st, "TODOs: no TODO or FIXME entries found.") end if

  rows = []
  files = []
  lines_out = []
  cols = []
  for i = 0 to len(items) - 1
    item = items[i]
    if typeof(item) != "struct" then continue end if
    rows = rows + [item.kind + "  " + _project_relative_path(st, item.file) + ":" + item.line + "  " + item.text]
    files = files + [item.file]
    lines_out = lines_out + [item.line]
    cols = cols + [1]
  end for

  title = "TODOs"
  if len(items) >= 300 then title = title + " (first 300)" end if
  return _show_result_panel(st, "todos", title, rows, files, lines_out, cols)
end function

// Show test explorer.
function _show_test_explorer(st)
  // Walk collections defensively because project data can be partially populated.
  snapshot = lang_service.analyze_project(st.project)
  items = lang_service.test_items(snapshot, 300)
  if typeof(items) != "array" or len(items) <= 0 then return _set_log(st, "Test Explorer: no tests configured or discovered.") end if

  rows = []
  files = []
  lines_out = []
  cols = []
  for i = 0 to len(items) - 1
    item = items[i]
    if typeof(item) != "struct" then continue end if
    rows = rows + [item.kind + "  " + item.name + "  " + item.status + "  " + _project_relative_path(st, item.file) + ":" + item.line]
    files = files + [item.file]
    lines_out = lines_out + [item.line]
    cols = cols + [1]
  end for

  title = "Test Explorer"
  if len(items) >= 300 then title = title + " (first 300)" end if
  return _show_result_panel(st, "test-explorer", title, rows, files, lines_out, cols)
end function

// Show tests related to the current file.
function _show_related_tests(st)
  // Walk collections defensively because project data can be partially populated.
  if typeof(st.current_file) != "string" or st.current_file == "" then return _set_log(st, "Related Tests: no file is open.") end if
  snapshot = lang_service.analyze_project(st.project)
  items = lang_service.related_test_items(snapshot, st.current_file, 300)
  if typeof(items) != "array" or len(items) <= 0 then return _set_log(st, "Related Tests: no tests found for " + _project_relative_path(st, st.current_file)) end if

  rows = []
  files = []
  lines_out = []
  cols = []
  for i = 0 to len(items) - 1
    item = items[i]
    if typeof(item) != "struct" then continue end if
    rows = rows + [item.kind + "  " + item.name + "  " + item.status + "  " + _project_relative_path(st, item.file) + ":" + item.line]
    files = files + [item.file]
    lines_out = lines_out + [item.line]
    cols = cols + [1]
  end for

  title = "Related Tests: " + _basename(st.current_file)
  if len(items) >= 300 then title = title + " (first 300)" end if
  return _show_result_panel(st, "related-tests", title, rows, files, lines_out, cols)
end function

// Show import graph.
function _show_import_graph(st)
  // Walk collections defensively because project data can be partially populated.
  snapshot = lang_service.analyze_project(st.project)
  items = lang_service.import_items(snapshot, "", 500)
  if typeof(items) != "array" or len(items) <= 0 then return _set_log(st, "Import Graph: no imports found.") end if

  rows = []
  files = []
  lines_out = []
  cols = []
  for i = 0 to len(items) - 1
    item = items[i]
    if typeof(item) != "struct" then continue end if
    status = "unresolved"
    target = item.target
    if item.resolved then
      status = "resolved"
      target = _project_relative_path(st, item.resolved_path)
    end if
    alias = ""
    if item.alias != "" then alias = " as " + item.alias end if
    rows = rows + [_project_relative_path(st, item.source_file) + ":" + item.line + "  ->  " + target + alias + "  [" + status + "]"]
    files = files + [item.source_file]
    lines_out = lines_out + [item.line]
    cols = cols + [1]
  end for

  title = "Import Graph"
  if len(items) >= 500 then title = title + " (first 500)" end if
  return _show_result_panel(st, "import-graph", title, rows, files, lines_out, cols)
end function

// Show project index.
function _show_project_index(st)
  // Walk collections defensively because project data can be partially populated.
  idx = try(lang_index.build_project_index(st.project))
  if typeof(idx) == "error" then return _set_log(st, "Project index failed: " + idx.message) end if
  if typeof(idx) != "struct" then return _set_log(st, "Project index unavailable.") end if

  rows = [lang_index.summary(idx)]
  files = [""]
  lines_out = [0]
  cols = [0]

  if typeof(idx.unresolved_imports) == "array" and len(idx.unresolved_imports) > 0 then
    rows = rows + ["Unresolved imports"]
    files = files + [""]
    lines_out = lines_out + [0]
    cols = cols + [0]
    for ui = 0 to len(idx.unresolved_imports) - 1
      imp = idx.unresolved_imports[ui]
      if typeof(imp) != "struct" then continue end if
      rows = rows + ["  " + _project_relative_path(st, imp.file) + ":" + (imp.line + 1) + "  import " + imp.target]
      files = files + [imp.file]
      lines_out = lines_out + [imp.line + 1]
      cols = cols + [1]
    end for
  end if

  if typeof(idx.files) == "array" and len(idx.files) > 0 then
    rows = rows + ["Files"]
    files = files + [""]
    lines_out = lines_out + [0]
    cols = cols + [0]
    for fi = 0 to len(idx.files) - 1
      f = idx.files[fi]
      if typeof(f) != "struct" then continue end if
      rows = rows + ["  " + f.relative_path + "  " + f.line_count + " lines"]
      files = files + [f.path]
      lines_out = lines_out + [1]
      cols = cols + [1]
    end for
  end if

  if typeof(idx.symbols) == "array" and len(idx.symbols) > 0 then
    rows = rows + ["Symbols"]
    files = files + [""]
    lines_out = lines_out + [0]
    cols = cols + [0]
    for si = 0 to len(idx.symbols) - 1
      sym = idx.symbols[si]
      if typeof(sym) != "struct" then continue end if
      rows = rows + ["  " + sym.kind + "  " + sym.name + "  " + _project_relative_path(st, sym.file) + ":" + (sym.line + 1)]
      files = files + [sym.file]
      lines_out = lines_out + [sym.line + 1]
      cols = cols + [1]
    end for
  end if

  return _show_result_panel(st, "project-index", "Project Index", rows, files, lines_out, cols)
end function

// Show problems.
function _show_problems(st)
  // Walk collections defensively because project data can be partially populated.
  rows = []
  files = []
  lines_out = []
  cols = []

  snapshot = lang_service.analyze_project(st.project)
  project_items = lang_service.diagnostics(snapshot)
  if typeof(project_items) == "array" and len(project_items) > 0 then
    for pi = 0 to len(project_items) - 1
      d = project_items[pi]
      if typeof(d) != "struct" then continue end if
      rows = rows + [d.kind + "  " + _project_relative_path(st, d.file) + ":" + d.line + ":" + d.col + "  " + d.message]
      files = files + [d.file]
      lines_out = lines_out + [d.line]
      cols = cols + [d.col]
    end for
  end if

  items = build.parse_diagnostics(st.build_last_log)
  if typeof(items) == "array" and len(items) > 0 then
    for i = 0 to len(items) - 1
      d = items[i]
      if typeof(d) != "struct" then continue end if
      file = d.file
      if file != "" and _is_abs(file) == false and typeof(st.project) == "struct" then
        file = project.resolve_project_path(st.project, file)
      end if
      rows = rows + [d.kind + "  " + _project_relative_path(st, file) + ":" + d.line + ":" + d.col + "  " + d.message]
      files = files + [file]
      lines_out = lines_out + [d.line]
      cols = cols + [d.col]
    end for
  end if

  if len(rows) <= 0 then return _set_log(st, "Problems: no entries in project analysis or the last build log.") end if
  return _show_result_panel(st, "problems", "Problems", rows, files, lines_out, cols)
end function

// Show code inspections.
function _show_code_inspections(st)
  // Walk collections defensively because project data can be partially populated.
  snapshot = lang_service.analyze_project(st.project)
  items = lang_service.code_inspection_items(snapshot, 300)
  if typeof(items) != "array" or len(items) <= 0 then return _set_log(st, "Code Inspections: no findings.") end if

  rows = []
  files = []
  lines_out = []
  cols = []
  for i = 0 to len(items) - 1
    item = items[i]
    if typeof(item) != "struct" then continue end if
    rows = rows + [item.severity + "  " + _project_relative_path(st, item.file) + ":" + item.line + ":" + item.col + "  " + item.message]
    files = files + [item.file]
    lines_out = lines_out + [item.line]
    cols = cols + [item.col]
  end for

  title = "Code Inspections"
  if len(items) >= 300 then title = title + " (first 300)" end if
  return _show_result_panel(st, "code-inspections", title, rows, files, lines_out, cols)
end function

// Search current word.
function _search_current_word(st)
  // Walk collections defensively because project data can be partially populated.
  if st.active_tab < 0 or st.active_tab >= len(st.open_texts) then return _set_log(st, "No file is open.") end if
  display_text = win.edit_get_text(st.editor)
  sel = win.edit_getsel(st.editor)
  word = _word_at_pos(display_text, sel[0])
  if word == "" then return _set_log(st, "No word under the cursor.") end if

  rows = []
  files = []
  lines_out = []
  cols = []
  count = 0
  if typeof(st.project) == "struct" and typeof(st.project.files) == "array" and len(st.project.files) > 0 then
    for i = 0 to len(st.project.files) - 1
      f = st.project.files[i]
      if typeof(f) != "struct" or f.is_dir then continue end if
      if s.endsWith(s.toLowerAscii(f.path), ".ml") == false then continue end if
      content = fs.readAllText(f.path)
      if typeof(content) != "string" then continue end if
      lines = s.split(s.replaceAll(content, "\r\n", "\n"), "\n")
      if typeof(lines) != "array" then continue end if
      for li = 0 to len(lines) - 1
        if s.indexOf(lines[li], word, 0) >= 0 then
          rows = rows + [_project_relative_path(st, f.path) + ":" + (li + 1) + "  " + s.trim(lines[li])]
          files = files + [f.path]
          lines_out = lines_out + [li + 1]
          cols = cols + [1]
          count = count + 1
          if count >= 80 then break end if
        end if
      end for
      if count >= 80 then break end if
    end for
  end if
  if count <= 0 then return _set_log(st, "No matches for: " + word) end if
  title = "Search: " + word
  if count >= 80 then title = title + " (first 80 matches)" end if
  return _show_result_panel(st, "search", title, rows, files, lines_out, cols)
end function

// Show a preview of the references that would be renamed.
function _show_rename_symbol_preview(st, word, new_name)
  if typeof(word) != "string" or word == "" then return _set_log(st, "No symbol under the cursor.") end if
  if typeof(new_name) != "string" or s.trim(new_name) == "" then return _set_log(st, "Rename Symbol: no new name provided.") end if
  new_name = s.trim(new_name)
  if word == new_name then return _set_log(st, "Rename Symbol: name is unchanged.") end if

  snapshot = lang_service.analyze_project(st.project)
  items = lang_service.rename_preview_items(snapshot, word, new_name, 200)
  if typeof(items) != "array" or len(items) <= 0 then return _set_log(st, "Rename Symbol: no safe rename targets for " + word) end if

  rows = []
  files = []
  lines_out = []
  cols = []
  for i = 0 to len(items) - 1
    item = items[i]
    if typeof(item) != "struct" then continue end if
    rows = rows + [item.old_name + " -> " + item.new_name + "  " + _project_relative_path(st, item.file) + ":" + item.line + ":" + item.col + "  " + item.text]
    files = files + [item.file]
    lines_out = lines_out + [item.line]
    cols = cols + [item.col]
  end for

  title = "Rename Preview: " + word + " -> " + new_name
  if len(items) >= 200 then title = title + " (first 200 matches)" end if
  return _show_result_panel(st, "rename-preview", title, rows, files, lines_out, cols)
end function

// Return a compact rename error message.
function _rename_error_text(result)
  if typeof(result) != "struct" or typeof(result.errors) != "array" or len(result.errors) <= 0 then return "Rename Symbol failed." end if
  text = "Rename Symbol failed: " + result.errors[0]
  if len(result.errors) > 1 then text = text + " (+" + (len(result.errors) - 1) + " more)" end if
  return text
end function

// Refresh open tabs for files changed by a project-wide rename.
function _refresh_renamed_open_files(st, files)
  if typeof(files) != "array" or len(files) <= 0 then return st end if
  if typeof(st.open_files) != "array" then return st end if
  for fi = 0 to len(files) - 1
    file = files[fi]
    idx = _path_index(st.open_files, file)
    if idx < 0 then continue end if
    text = fs.readAllText(file)
    if typeof(text) != "string" then continue end if
    text = _normalize_editor_text(text)
    st.open_texts[idx] = text
    st.open_saved_texts[idx] = text
    st.open_dirty[idx] = false
    st.open_undo[idx] = []
    st.open_redo[idx] = []
    st = markdown.clear_cache(st, idx)
    st = _invalidate_markdown_view(st, idx)
    if idx == st.active_tab then
      st = _write_active_editor(st, text)
      st.last_editor_text = text
      st = _invalidate_highlight(st)
      st.last_line_numbers_text = ""
    end if
  end for
  st = _refresh_tabs(st)
  _set_title(st)
  return st
end function

// Apply a symbol rename to project files.
function _apply_rename_symbol(st, word, new_name)
  st = _sync_active_tab(st)
  guard = _guard_no_dirty(st, "applying rename")
  st = guard[0]
  if guard[1] == false then return st end if

  snapshot = lang_service.analyze_project(st.project)
  result = lang_service.apply_rename(snapshot, word, new_name, 1000)
  if typeof(result) != "struct" or result.ok == false then return _set_log(st, _rename_error_text(result)) end if

  st = _refresh_renamed_open_files(st, result.files)
  root = "."
  if typeof(st.project) == "struct" then root = st.project.root end if
  st.project = project.load_project(root)
  st = _populate_project_tree(st)
  st = _refresh_tabs(st)
  return _set_log(st, "Renamed " + word + " -> " + s.trim(new_name) + ": " + result.replacements + " replacements in " + len(result.files) + " files.")
end function

// Open rename symbol preview window.
function _open_rename_symbol_window(st)
  // Run a local message loop so the modal UI stays responsive.
  if st.active_tab < 0 or st.active_tab >= len(st.open_texts) then return _set_log(st, "No file is open.") end if
  display_text = win.edit_get_text(st.editor)
  sel = win.edit_getsel(st.editor)
  word = _word_at_pos(display_text, sel[0])
  if word == "" then return _set_log(st, "No symbol under the cursor.") end if

  dlg = win.create_main_window("Rename Symbol", 560, 190)
  if dlg is void then return st end if
  _settings_label(dlg, st.font_ui, "New name", 20, 28, 90, 24)
  rename_edit = _settings_edit_id(dlg, st.font_ui, word, 116, 24, 400, 26, ID_RENAME_SYMBOL_TEXT_EDIT)
  ok_btn = _settings_button(dlg, st.font_ui, "Preview", 196, 104, 94, 30, ID_RENAME_SYMBOL_OK)
  apply_btn = _settings_button(dlg, st.font_ui, "Apply", 300, 104, 94, 30, ID_RENAME_SYMBOL_APPLY)
  cancel_btn = _settings_button(dlg, st.font_ui, "Cancel", 404, 104, 112, 30, ID_RENAME_SYMBOL_CANCEL)
  win.edit_select_all(rename_edit)
  win.SetFocus(rename_edit)

  new_name = ""
  action = ""
  accepted = false
  done = false
  while done == false and win.IsWindow(dlg)
    msg = bytes(48, 0)
    while win.PeekMessageW(msg, void, 0, 0, win.PM_REMOVE)
      code = win.msg_message(msg)
      hwnd = win.msg_hwnd(msg)
      handled = false

      if code == win.WM_QUIT then
        st.running = false
        done = true
        handled = true
      else if code == win.WM_CLOSE and hwnd == dlg then
        done = true
        win.DestroyWindow(dlg)
        handled = true
      else if code == win.WM_CLOSE and hwnd == st.hwnd then
        st = _request_exit(st)
        done = true
        if win.IsWindow(dlg) then win.DestroyWindow(dlg) end if
        handled = true
      else if (code == win.WM_DESTROY or code == win.WM_NCDESTROY) and hwnd == dlg then
        done = true
        handled = true
      else if code == win.WM_KEYDOWN then
        key = win.msg_wparam_u32(msg)
        if key == win.VK_ESCAPE then
          done = true
          win.DestroyWindow(dlg)
          handled = true
        else if key == win.VK_RETURN then
          new_name = s.trim(win.get_control_text(rename_edit))
          action = "preview"
          accepted = true
          done = true
          win.DestroyWindow(dlg)
          handled = true
        end if
      else if code == win.WM_COMMAND and hwnd == dlg then
        cid = win.msg_command_id(msg)
        if cid == ID_RENAME_SYMBOL_CANCEL then
          done = true
          win.DestroyWindow(dlg)
          handled = true
        else if cid == ID_RENAME_SYMBOL_OK then
          new_name = s.trim(win.get_control_text(rename_edit))
          action = "preview"
          accepted = true
          done = true
          win.DestroyWindow(dlg)
          handled = true
        else if cid == ID_RENAME_SYMBOL_APPLY then
          new_name = s.trim(win.get_control_text(rename_edit))
          action = "apply"
          accepted = true
          done = true
          win.DestroyWindow(dlg)
          handled = true
        end if
      else if code == win.WM_LBUTTONUP then
        if hwnd == cancel_btn then
          done = true
          win.DestroyWindow(dlg)
          handled = true
        else if hwnd == ok_btn then
          new_name = s.trim(win.get_control_text(rename_edit))
          action = "preview"
          accepted = true
          done = true
          win.DestroyWindow(dlg)
          handled = true
        else if hwnd == apply_btn then
          new_name = s.trim(win.get_control_text(rename_edit))
          action = "apply"
          accepted = true
          done = true
          win.DestroyWindow(dlg)
          handled = true
        end if
      end if

      if handled == false then
        win.TranslateMessage(msg)
        win.DispatchMessageW(msg)
      end if
    end while
    if done == false then win.Sleep(15) end if
  end while

  if accepted and action == "apply" then return _apply_rename_symbol(st, word, new_name) end if
  if accepted then return _show_rename_symbol_preview(st, word, new_name) end if
  if st.running and win.IsWindow(st.hwnd) then win.SetFocus(st.editor) end if
  return st
end function

// Find references for the current symbol-like word.
function _find_references(st)
  // Walk collections defensively because project data can be partially populated.
  if st.active_tab < 0 or st.active_tab >= len(st.open_texts) then return _set_log(st, "No file is open.") end if
  display_text = win.edit_get_text(st.editor)
  sel = win.edit_getsel(st.editor)
  word = _word_at_pos(display_text, sel[0])
  if word == "" then return _set_log(st, "No symbol under the cursor.") end if

  snapshot = lang_service.analyze_project(st.project)
  refs = lang_service.references(snapshot, word, 100)
  if typeof(refs) != "array" or len(refs) <= 0 then return _set_log(st, "No references found: " + word) end if

  rows = []
  files = []
  lines_out = []
  cols = []
  for i = 0 to len(refs) - 1
    ref = refs[i]
    if typeof(ref) != "struct" then continue end if
    rows = rows + [_project_relative_path(st, ref.file) + ":" + ref.line + ":" + ref.col + "  " + ref.text]
    files = files + [ref.file]
    lines_out = lines_out + [ref.line]
    cols = cols + [ref.col]
  end for

  title = "References: " + word
  if len(refs) >= 100 then title = title + " (first 100 matches)" end if
  return _show_result_panel(st, "references", title, rows, files, lines_out, cols)
end function

// Show call hierarchy for the current symbol-like word.
function _show_call_hierarchy(st)
  // Walk collections defensively because project data can be partially populated.
  if st.active_tab < 0 or st.active_tab >= len(st.open_texts) then return _set_log(st, "No file is open.") end if
  display_text = win.edit_get_text(st.editor)
  sel = win.edit_getsel(st.editor)
  word = _word_at_pos(display_text, sel[0])
  if word == "" then return _set_log(st, "No symbol under the cursor.") end if

  snapshot = lang_service.analyze_project(st.project)
  items = lang_service.call_hierarchy_items(snapshot, word, 120)
  if typeof(items) != "array" or len(items) <= 0 then return _set_log(st, "Call Hierarchy: no entries found for " + word) end if

  rows = []
  files = []
  lines_out = []
  cols = []
  for i = 0 to len(items) - 1
    item = items[i]
    if typeof(item) != "struct" then continue end if
    rows = rows + [item.kind + "  " + _project_relative_path(st, item.file) + ":" + item.line + ":" + item.col + "  " + item.text]
    files = files + [item.file]
    lines_out = lines_out + [item.line]
    cols = cols + [item.col]
  end for

  title = "Call Hierarchy: " + word
  if len(items) >= 120 then title = title + " (first 120 entries)" end if
  return _show_result_panel(st, "call-hierarchy", title, rows, files, lines_out, cols)
end function

// Show symbol info for the current symbol-like word.
function _show_symbol_info(st)
  // Walk collections defensively because project data can be partially populated.
  if st.active_tab < 0 or st.active_tab >= len(st.open_texts) then return _set_log(st, "No file is open.") end if
  display_text = win.edit_get_text(st.editor)
  sel = win.edit_getsel(st.editor)
  word = _word_at_pos(display_text, sel[0])
  if word == "" then return _set_log(st, "No symbol under the cursor.") end if

  snapshot = lang_service.analyze_project(st.project)
  items = lang_service.symbol_info(snapshot, word)
  if typeof(items) != "array" or len(items) <= 0 then return _set_log(st, "Symbol Info: no indexed symbol found for " + word) end if

  rows = []
  files = []
  lines_out = []
  cols = []
  for i = 0 to len(items) - 1
    item = items[i]
    if typeof(item) != "struct" then continue end if
    rows = rows + [item.kind + "  " + item.name + "  " + _project_relative_path(st, item.file) + ":" + item.line + "  references: " + item.reference_count]
    files = files + [item.file]
    lines_out = lines_out + [item.line]
    cols = cols + [1]
  end for

  return _show_result_panel(st, "symbol-info", "Symbol Info: " + word, rows, files, lines_out, cols)
end function

// Move the editor caret to line col.
function _jump_to_line_col(st, line_no, col_no)
  if st.active_tab < 0 or st.active_tab >= len(st.open_texts) then return _set_log(st, "No file is open.") end if
  count = win.edit_line_count(st.editor)
  if typeof(count) != "int" or count <= 0 then count = 1 end if
  if typeof(line_no) != "int" then line_no = 1 end if
  if typeof(col_no) != "int" then col_no = 1 end if
  if line_no < 1 then line_no = 1 end if
  if line_no > count then line_no = count end if
  if col_no < 1 then col_no = 1 end if
  pos = win.edit_line_index(st.editor, line_no - 1)
  if pos < 0 then pos = 0 end if
  pos = pos + col_no - 1
  win.SetFocus(st.editor)
  win.edit_setsel(st.editor, pos, pos)
  win.edit_scroll_caret(st.editor)
  st.last_status_text = ""
  return st
end function

// Move the editor caret to line col.
function _goto_line_col(st, line_no, col_no)
  st = _record_navigation(st)
  st = _jump_to_line_col(st, line_no, col_no)
  return _set_log(st, "Go to line " + line_no + ", column " + col_no + ".")
end function

// Move the editor caret to line number.
function _goto_line_number(st, line_no)
  return _goto_line_col(st, line_no, 1)
end function

// Read goto line.
function _read_goto_line(dlg, edit)
  text = s.trim(win.get_control_text(edit))
  line_no = toNumber(text)
  if typeof(line_no) != "int" or line_no < 1 then
    win.MessageBoxW(dlg, "Please enter a valid line number.", "Go to Line", 0)
    return -1
  end if
  return line_no
end function

// Open goto line window.
function _open_goto_line_window(st)
  // Run a local message loop so the modal UI stays responsive.
  if st.active_tab < 0 or st.active_tab >= len(st.open_texts) then return _set_log(st, "No file is open.") end if
  sel = win.edit_getsel(st.editor)
  current_line = win.edit_line_from_char(st.editor, sel[0]) + 1
  count = win.edit_line_count(st.editor)
  if typeof(count) != "int" or count <= 0 then count = 1 end if

  dlg = win.create_main_window("Go to Line", 360, 170)
  if dlg is void then return st end if
  _settings_label(dlg, st.font_ui, "Line", 20, 28, 70, 24)
  line_edit = _settings_edit_id(dlg, st.font_ui, "" + current_line, 92, 24, 230, 26, ID_GOTO_LINE_EDIT)
  _settings_label(dlg, st.font_ui, "1 to " + count, 92, 54, 230, 22)
  ok_btn = _settings_button(dlg, st.font_ui, "OK", 132, 96, 86, 30, ID_GOTO_LINE_OK)
  cancel_btn = _settings_button(dlg, st.font_ui, "Cancel", 228, 96, 94, 30, ID_GOTO_LINE_CANCEL)
  win.edit_select_all(line_edit)
  win.SetFocus(line_edit)

  line_to_go = -1
  done = false
  while done == false and win.IsWindow(dlg)
    msg = bytes(48, 0)
    while win.PeekMessageW(msg, void, 0, 0, win.PM_REMOVE)
      code = win.msg_message(msg)
      hwnd = win.msg_hwnd(msg)
      handled = false

      if code == win.WM_QUIT then
        st.running = false
        done = true
        handled = true
      else if code == win.WM_CLOSE and hwnd == dlg then
        done = true
        win.DestroyWindow(dlg)
        handled = true
      else if code == win.WM_CLOSE and hwnd == st.hwnd then
        st = _request_exit(st)
        done = true
        if win.IsWindow(dlg) then win.DestroyWindow(dlg) end if
        handled = true
      else if (code == win.WM_DESTROY or code == win.WM_NCDESTROY) and hwnd == dlg then
        done = true
        handled = true
      else if code == win.WM_KEYDOWN then
        key = win.msg_wparam_u32(msg)
        if key == win.VK_ESCAPE then
          done = true
          win.DestroyWindow(dlg)
          handled = true
        else if key == win.VK_RETURN then
          value = _read_goto_line(dlg, line_edit)
          if value > 0 then
            line_to_go = value
            done = true
            win.DestroyWindow(dlg)
          end if
          handled = true
        end if
      else if code == win.WM_COMMAND and hwnd == dlg then
        cid = win.msg_command_id(msg)
        if cid == ID_GOTO_LINE_CANCEL then
          done = true
          win.DestroyWindow(dlg)
          handled = true
        else if cid == ID_GOTO_LINE_OK then
          value = _read_goto_line(dlg, line_edit)
          if value > 0 then
            line_to_go = value
            done = true
            win.DestroyWindow(dlg)
          end if
          handled = true
        end if
      else if code == win.WM_LBUTTONUP then
        if hwnd == cancel_btn then
          done = true
          win.DestroyWindow(dlg)
          handled = true
        else if hwnd == ok_btn then
          value = _read_goto_line(dlg, line_edit)
          if value > 0 then
            line_to_go = value
            done = true
            win.DestroyWindow(dlg)
          end if
          handled = true
        end if
      end if

      if handled == false then
        win.TranslateMessage(msg)
        win.DispatchMessageW(msg)
      end if
    end while
    if done == false then win.Sleep(15) end if
  end while

  if line_to_go > 0 then return _goto_line_number(st, line_to_go) end if
  if st.running and win.IsWindow(st.hwnd) then win.SetFocus(st.editor) end if
  return st
end function

// Return the selected editor text.
function _selected_editor_text(st)
  if st.active_tab < 0 or st.active_tab >= len(st.open_texts) then return "" end if
  sel = win.edit_getsel(st.editor)
  if sel[1] <= sel[0] then return "" end if
  text = win.edit_get_text(st.editor)
  if sel[0] < 0 or sel[1] > len(text) then return "" end if
  return s.substr(text, sel[0], sel[1] - sel[0])
end function

// Return the initial find text.
function _initial_find_text(st)
  selected = _selected_editor_text(st)
  if selected != "" and s.indexOf(selected, "\n", 0) < 0 and s.indexOf(selected, "\r", 0) < 0 then return selected end if
  text = win.edit_get_text(st.editor)
  sel = win.edit_getsel(st.editor)
  word = _word_at_pos(text, sel[0])
  if word != "" then return word end if
  if typeof(st.last_search_text) == "string" then return st.last_search_text end if
  return ""
end function

// Find next in editor.
function _find_next_in_editor(st, query)
  if st.active_tab < 0 or st.active_tab >= len(st.open_texts) then return _set_log(st, "No file is open.") end if
  if typeof(query) != "string" then query = "" end if
  if query == "" then return _set_log(st, "Search text is empty.") end if
  st.last_search_text = query
  text = win.edit_get_text(st.editor)
  sel = win.edit_getsel(st.editor)
  start = sel[1]
  if start < 0 then start = 0 end if
  if start > len(text) then start = len(text) end if
  pos = s.indexOf(text, query, start)
  wrapped = false
  if pos < 0 and start > 0 then
    pos = s.indexOf(text, query, 0)
    wrapped = true
  end if
  if pos < 0 then return _set_log(st, "Not found: " + query) end if
  win.SetFocus(st.editor)
  win.edit_setsel(st.editor, pos, pos + len(query))
  win.edit_scroll_caret(st.editor)
  st.last_status_text = ""
  msg = "Found: " + query
  if wrapped then msg = msg + " (wrapped)" end if
  return _set_log(st, msg)
end function

// Open find window.
function _open_find_window(st)
  // Run a local message loop so the modal UI stays responsive.
  if st.active_tab < 0 or st.active_tab >= len(st.open_texts) then return _set_log(st, "No file is open.") end if
  initial = _initial_find_text(st)
  dlg = win.create_main_window("Find", 460, 170)
  if dlg is void then return st end if
  _settings_label(dlg, st.font_ui, "Search text", 20, 28, 90, 24)
  find_edit = _settings_edit_id(dlg, st.font_ui, initial, 116, 24, 300, 26, ID_FIND_TEXT_EDIT)
  ok_btn = _settings_button(dlg, st.font_ui, "Find Next", 204, 92, 112, 30, ID_FIND_OK)
  cancel_btn = _settings_button(dlg, st.font_ui, "Cancel", 324, 92, 92, 30, ID_FIND_CANCEL)
  win.edit_select_all(find_edit)
  win.SetFocus(find_edit)

  query = ""
  done = false
  while done == false and win.IsWindow(dlg)
    msg = bytes(48, 0)
    while win.PeekMessageW(msg, void, 0, 0, win.PM_REMOVE)
      code = win.msg_message(msg)
      hwnd = win.msg_hwnd(msg)
      handled = false

      if code == win.WM_QUIT then
        st.running = false
        done = true
        handled = true
      else if code == win.WM_CLOSE and hwnd == dlg then
        done = true
        win.DestroyWindow(dlg)
        handled = true
      else if code == win.WM_CLOSE and hwnd == st.hwnd then
        st = _request_exit(st)
        done = true
        if win.IsWindow(dlg) then win.DestroyWindow(dlg) end if
        handled = true
      else if (code == win.WM_DESTROY or code == win.WM_NCDESTROY) and hwnd == dlg then
        done = true
        handled = true
      else if code == win.WM_KEYDOWN then
        key = win.msg_wparam_u32(msg)
        if key == win.VK_ESCAPE then
          done = true
          win.DestroyWindow(dlg)
          handled = true
        else if key == win.VK_RETURN then
          query = win.get_control_text(find_edit)
          done = true
          win.DestroyWindow(dlg)
          handled = true
        end if
      else if code == win.WM_COMMAND and hwnd == dlg then
        cid = win.msg_command_id(msg)
        if cid == ID_FIND_CANCEL then
          done = true
          win.DestroyWindow(dlg)
          handled = true
        else if cid == ID_FIND_OK then
          query = win.get_control_text(find_edit)
          done = true
          win.DestroyWindow(dlg)
          handled = true
        end if
      else if code == win.WM_LBUTTONUP then
        if hwnd == cancel_btn then
          done = true
          win.DestroyWindow(dlg)
          handled = true
        else if hwnd == ok_btn then
          query = win.get_control_text(find_edit)
          done = true
          win.DestroyWindow(dlg)
          handled = true
        end if
      end if

      if handled == false then
        win.TranslateMessage(msg)
        win.DispatchMessageW(msg)
      end if
    end while
    if done == false then win.Sleep(15) end if
  end while

  if query != "" then return _find_next_in_editor(st, query) end if
  if st.running and win.IsWindow(st.hwnd) then win.SetFocus(st.editor) end if
  return st
end function

// Find next.
function _find_next(st)
  if typeof(st.last_search_text) != "string" or st.last_search_text == "" then return _open_find_window(st) end if
  return _find_next_in_editor(st, st.last_search_text)
end function

// Return the short symbol name.
function _short_symbol_name(name)
  if typeof(name) != "string" then return "" end if
  i = len(name) - 1
  while i >= 0
    if name[i] == "." then return s.substr(name, i + 1, len(name) - i - 1) end if
    i = i - 1
  end while
  return name
end function

// Find symbol.
function _find_symbol(index, name)
  // Walk collections defensively because project data can be partially populated.
  if typeof(index) != "struct" or typeof(index.symbols) != "array" then return end if
  target = s.toLowerAscii(name)
  short_target = s.toLowerAscii(_short_symbol_name(name))
  if target == "" then return end if
  for i = 0 to len(index.symbols) - 1
    sym = index.symbols[i]
    if typeof(sym) != "struct" then continue end if
    sym_name = s.toLowerAscii(sym.name)
    if sym_name == target then return sym end if
  end for
  for i = 0 to len(index.symbols) - 1
    sym = index.symbols[i]
    if typeof(sym) != "struct" then continue end if
    sym_name = s.toLowerAscii(_short_symbol_name(sym.name))
    if sym_name == short_target then return sym end if
  end for
end function

// Move the editor caret to definition.
function _goto_definition(st)
  if st.active_tab < 0 or st.active_tab >= len(st.open_texts) then return _set_log(st, "No file is open.") end if
  text = win.edit_get_text(st.editor)
  sel = win.edit_getsel(st.editor)
  word = _word_at_pos(text, sel[0])
  if word == "" then return _set_log(st, "No symbol under the cursor.") end if
  index = symbols.build_index(st.project)
  sym = _find_symbol(index, word)
  if typeof(sym) != "struct" then return _set_log(st, "Definition not found: " + word) end if
  st = _record_navigation(st)
  st = _open_file(st, sym.file)
  st = _jump_to_line_col(st, sym.line + 1, 1)
  return _set_log(st, "Definition: " + sym.name + " in " + _project_relative_path(st, sym.file) + ":" + (sym.line + 1))
end function

// Send the cut operation to a edit control.
function _edit_cut(st)
  win.SetFocus(st.editor)
  win.edit_cut(st.editor)
  st = _record_edit_activity(st)
  return st
end function

// Send the copy operation to a edit control.
function _edit_copy(st)
  win.SetFocus(st.editor)
  win.edit_copy(st.editor)
  return st
end function

// Send the paste operation to a edit control.
function _edit_paste(st)
  win.SetFocus(st.editor)
  win.edit_paste(st.editor)
  st = _record_edit_activity(st)
  return st
end function

// Send the select all operation to a edit control.
function _edit_select_all(st)
  win.SetFocus(st.editor)
  win.edit_select_all(st.editor)
  return st
end function

// Replace active text.
function _replace_active_text(st, text)
  idx = st.active_tab
  if idx < 0 or idx >= len(st.open_texts) then return st end if
  text = _normalize_editor_text(text)
  st.open_texts[idx] = text
  st = markdown.clear_cache(st, idx)
  st = _invalidate_markdown_view(st, idx)
  st = _set_dirty_from_saved(st, idx)
  st.last_editor_text = text
  st = _invalidate_highlight(st)
  st.last_line_numbers_text = ""
  st.last_status_text = ""
  st.last_first_visible_line = -1
  st = _write_active_editor(st, text)
  st = _refresh_tabs(st)
  _set_title(st)
  st = _apply_syntax_highlight(st)
  win.SetFocus(st.editor)
  return st
end function

// Send the undo operation to a edit control.
function _edit_undo(st)
  idx = st.active_tab
  if idx < 0 or idx >= len(st.open_texts) then return st end if
  st = _sync_active_tab(st)
  stack = st.open_undo[idx]
  if typeof(stack) != "array" or len(stack) <= 0 then return _set_log(st, "Nothing to undo.") end if
  current = st.open_texts[idx]
  previous = stack[len(stack) - 1]
  st.open_undo[idx] = _pop_snapshot(stack)
  st.open_redo[idx] = _push_snapshot(st.open_redo[idx], current)
  if idx < len(st.open_folds) then st.open_folds[idx] = [] end if
  st = _replace_active_text(st, previous)
  return _set_log(st, "Undo.")
end function

// Send the redo operation to a edit control.
function _edit_redo(st)
  idx = st.active_tab
  if idx < 0 or idx >= len(st.open_texts) then return st end if
  stack = st.open_redo[idx]
  if typeof(stack) != "array" or len(stack) <= 0 then return _set_log(st, "Nothing to redo.") end if
  current = st.open_texts[idx]
  next_text = stack[len(stack) - 1]
  st.open_redo[idx] = _pop_snapshot(stack)
  st.open_undo[idx] = _push_snapshot(st.open_undo[idx], current)
  if idx < len(st.open_folds) then st.open_folds[idx] = [] end if
  st = _replace_active_text(st, next_text)
  return _set_log(st, "Redo.")
end function

// Return the log copy.
function _log_copy(st)
  win.SetFocus(st.log)
  win.edit_copy(st.log)
  return st
end function

// Return the log select all.
function _log_select_all(st)
  win.SetFocus(st.log)
  win.edit_select_all(st.log)
  return st
end function

// Return the log clear.
function _log_clear(st)
  win.set_window_text(st.log, "")
  return st
end function

// Show the MiniIDE About dialog.
function _about(st)
  win.MessageBoxW(st.hwnd, "MiniIDE\nMiniLang IDE written in MiniLang.", "About MiniIDE", 0)
  return st
end function

// Load RichEdit library.
function _load_msftedit()
  Load = win.LoadLibraryW("Msftedit.dll")
  return Load
end function

// Create editor.
function _create_editor(parent, font)
  _load_msftedit()
  style = win.WS_TABSTOP | win.WS_VSCROLL | win.WS_HSCROLL | win.ES_MULTILINE | win.ES_AUTOVSCROLL | win.ES_AUTOHSCROLL | win.ES_WANTRETURN | win.ES_NOHIDESEL
  hwnd = win.create_child(parent, "RICHEDIT50W", "", 0, style, 0, 0, 100, 100)
  if hwnd is void then
    hwnd = win.create_child(parent, "EDIT", "", 0, style, 0, 0, 100, 100)
  end if
  win.set_control_font(hwnd, font)
  win.edit_allow_large_text(hwnd)
  return hwnd
end function

// Create log.
function _create_log(parent, font)
  _load_msftedit()
  style = win.WS_VSCROLL | win.ES_MULTILINE | win.ES_AUTOVSCROLL | win.ES_READONLY | win.ES_NOHIDESEL
  hwnd = win.create_child(parent, "RICHEDIT50W", "", 0, style, 0, 0, 100, 100)
  if hwnd is void then
    hwnd = win.create_child(parent, "EDIT", "", 0, style, 0, 0, 100, 100)
  end if
  win.set_control_font(hwnd, font)
  win.edit_allow_large_text(hwnd)
  return hwnd
end function

// Create line numbers.
function _create_line_numbers(parent, font)
  _load_msftedit()
  style = win.ES_MULTILINE | win.ES_READONLY | win.ES_NOHIDESEL | win.ES_RIGHT
  hwnd = win.create_child(parent, "RICHEDIT50W", "", 0, style, 0, 0, 64, 100)
  if hwnd is void then
    hwnd = win.create_child(parent, "EDIT", "", 0, style, 0, 0, 64, 100)
  end if
  win.set_control_font(hwnd, font)
  win.edit_allow_large_text(hwnd)
  return hwnd
end function

// Create tab strip.
function _create_tab_strip(parent, font)
  hwnd = win.create_tab(parent, ID_EDITOR_TABS)
  win.set_control_font(hwnd, font)
  return hwnd
end function

// Create toolbar button.
function _create_toolbar_button(parent, font, text, control_id)
  _load_msftedit()
  style = win.ES_READONLY | win.ES_NOHIDESEL
  hwnd = win.create_child_id(parent, "RICHEDIT50W", text, 0, style, 0, 0, 90, 32, control_id)
  win.set_control_font(hwnd, font)
  win.set_window_text(hwnd, text)
  win.edit_allow_large_text(hwnd)
  return hwnd
end function

// Create toolbar icon.
function _create_toolbar_icon(parent, font, glyph_code)
  _load_msftedit()
  text = win.char_from_code(glyph_code)
  style = win.ES_READONLY | win.ES_NOHIDESEL
  hwnd = win.create_child(parent, "RICHEDIT50W", text, 0, style, 0, 0, 22, 22)
  if hwnd is void then
    hwnd = win.create_child(parent, "STATIC", text, 0, win.SS_NOTIFY | win.SS_NOPREFIX, 0, 0, 22, 22)
  end if
  win.set_control_font(hwnd, font)
  win.set_window_text(hwnd, text)
  return hwnd
end function

// Create menu label.
function _create_menu_label(parent, font, text)
  _load_msftedit()
  style = win.ES_READONLY | win.ES_NOHIDESEL
  hwnd = win.create_child(parent, "RICHEDIT50W", text, 0, style, 0, 0, 88, 22)
  win.set_control_font(hwnd, font)
  win.set_window_text(hwnd, text)
  return hwnd
end function

// Create state.
function _create_state(root)
  // Keep validation near the top so callers can treat invalid input as a no-op.
  p = project.load_project(root)
  compiler_path = _load_compiler_path(p)
  build_keep_going = _load_build_keep_going(p)
  build_max_errors = _load_build_max_errors(p)
  build_subsystem = _load_build_subsystem(p)
  build_extra_args = _load_build_extra_args(p)
  build_profile = _load_build_profile(p)
  theme_mode = _load_theme_mode(p)
  win.init_common_controls()
  hwnd = win.create_main_window("MiniIDE", 1180, 760)
  menus = _create_menus()
  win.set_menu_bar(hwnd, void)
  font_ui = win.make_font(-16, "Segoe UI", false)
  font_code = win.make_font(-16, "Consolas", false)
  font_icon = win.make_font(-18, "Segoe MDL2 Assets", false)

  _load_msftedit()
  toolbar_bg = win.create_child(hwnd, "RICHEDIT50W", "", 0, win.ES_READONLY, 0, 0, 100, 40)
  tree_images = win.create_tree_image_list()
  tree = win.create_tree(hwnd, ID_PROJECT_TREE)
  win.tree_set_image_list(tree, tree_images)
  tabbar = _create_tab_strip(hwnd, font_ui)
  line_numbers = _create_line_numbers(hwnd, font_code)
  editor = _create_editor(hwnd, font_code)
  log = _create_log(hwnd, font_code)
  panel_title = win.create_child(hwnd, "RICHEDIT50W", "Results", 0, win.ES_READONLY, 0, 0, 100, 24)
  result_style = win.WS_TABSTOP | win.WS_VSCROLL | win.LBS_NOTIFY | win.LBS_HASSTRINGS | win.LBS_NOINTEGRALHEIGHT
  result_list = win.create_child_id(hwnd, "LISTBOX", "", 0, result_style, 0, 0, 100, 100, ID_RESULT_LIST)
  autocomplete_list = win.create_child_id(hwnd, "LISTBOX", "", 0, result_style, 0, 0, 240, 140, ID_AUTOCOMPLETE_LIST)
  win.ShowWindow(panel_title, win.SW_HIDE)
  win.ShowWindow(result_list, win.SW_HIDE)
  win.ShowWindow(autocomplete_list, win.SW_HIDE)
  status = win.create_child(hwnd, "RICHEDIT50W", "Line 1, Column 1", 0, win.ES_READONLY, 0, 0, 200, STATUS_H)
  btn_open = _create_toolbar_button(hwnd, font_ui, "          Project", ID_FILE_OPEN_PROJECT)
  btn_save = _create_toolbar_button(hwnd, font_ui, "          Save", ID_FILE_SAVE)
  btn_build = _create_toolbar_button(hwnd, font_ui, "          Build", ID_FILE_BUILD)
  btn_run = _create_toolbar_button(hwnd, font_ui, "          Run", ID_FILE_RUN)
  btn_test = _create_toolbar_button(hwnd, font_ui, "          Tests", ID_FILE_TEST)
  btn_reload = _create_toolbar_button(hwnd, font_ui, "          Reload", ID_FILE_RELOAD)
  btn_cut = _create_toolbar_button(hwnd, font_ui, "          Cut", ID_EDIT_CUT)
  btn_copy = _create_toolbar_button(hwnd, font_ui, "          Copy", ID_EDIT_COPY)
  btn_paste = _create_toolbar_button(hwnd, font_ui, "          Paste", ID_EDIT_PASTE)
  toolbar_icons = [
    _create_toolbar_icon(hwnd, font_icon, 0xE8E5),
    _create_toolbar_icon(hwnd, font_icon, 0xE74E),
    _create_toolbar_icon(hwnd, font_icon, 0xE90F),
    _create_toolbar_icon(hwnd, font_icon, 0xE768),
    _create_toolbar_icon(hwnd, font_icon, 0xE9D9),
    _create_toolbar_icon(hwnd, font_icon, 0xE72C),
    _create_toolbar_icon(hwnd, font_icon, 0xE8C6),
    _create_toolbar_icon(hwnd, font_icon, 0xE8C8),
    _create_toolbar_icon(hwnd, font_icon, 0xE77F),
    _create_menu_label(hwnd, font_ui, "File"),
    _create_menu_label(hwnd, font_ui, "Edit"),
    _create_menu_label(hwnd, font_ui, "Navigation"),
    _create_menu_label(hwnd, font_ui, "Configuration"),
    _create_menu_label(hwnd, font_ui, "Help"),
  ]

  win.set_control_font(tree, font_ui)
  win.set_control_font(tabbar, font_ui)
  win.set_control_font(panel_title, font_ui)
  win.set_control_font(result_list, font_ui)
  win.set_control_font(autocomplete_list, font_ui)
  win.set_control_font(status, font_ui)
  win.set_control_font(btn_open, font_ui)
  win.set_control_font(btn_save, font_ui)
  win.set_control_font(btn_build, font_ui)
  win.set_control_font(btn_run, font_ui)
  win.set_control_font(btn_test, font_ui)
  win.set_control_font(btn_reload, font_ui)
  win.set_control_font(btn_cut, font_ui)
  win.set_control_font(btn_copy, font_ui)
  win.set_control_font(btn_paste, font_ui)

  st = AppState(hwnd, menus[0], menus[1], menus[2], menus[3], menus[4], menus[5], toolbar_bg, tree_images, tree, tabbar, line_numbers, editor, editor, log, panel_title, result_list, autocomplete_list, status, btn_open, btn_save, btn_build, btn_run, btn_test, btn_reload, btn_cut, btn_copy, btn_paste, toolbar_icons, font_ui, font_code, p, compiler_path, build_keep_going, build_max_errors, build_subsystem, build_extra_args, build_profile, theme_mode, [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], -1, "", -1, [], [], [], 0, 0, "", "", -1, 0, 0, false, "", 0, "", -1, 0, false, 0, 0, array(256, 0), false, false, -1, "", 0, "", "log", [], [], [], [], "", void, "", false, "", 0, true)
  st = _load_build_config(st)
  st = _populate_project_tree(st)
  st = _open_file(st, _entry_file(p))
  st = _refresh_tabs(st)
  st = _set_log(st, "MiniIDE ready.")
  st = _apply_theme(st)
  return st
end function

// Move toolbar icon.
function _move_toolbar_icon(st, idx, x, y)
  if typeof(st.toolbar_icons) != "array" then return end if
  if idx < 0 or idx >= len(st.toolbar_icons) then return end if
  icon = st.toolbar_icons[idx]
  if icon is void then return end if
  win.MoveWindow(icon, x, y, 24, 24, true)
  win.BringWindowToTop(icon)
end function

// Move menu label.
function _move_menu_label(st, idx, x, w)
  if typeof(st.toolbar_icons) != "array" then return end if
  if idx < 0 or idx >= len(st.toolbar_icons) then return end if
  item = st.toolbar_icons[idx]
  if item is void then return end if
  win.MoveWindow(item, x, 2, w, MENU_H - 4, true)
  win.BringWindowToTop(item)
end function

// Resize and position all child controls for the current window size.
function _layout(st)
  // Keep validation near the top so callers can treat invalid input as a no-op.
  size = win.client_size(st.hwnd)
  w = size[0]
  h = size[1]
  if w == st.last_w and h == st.last_h then return st end if
  st.last_w = w
  st.last_h = h

  _move_menu_label(st, 9, 8, 54)
  _move_menu_label(st, 10, 66, 86)
  _move_menu_label(st, 11, 156, 86)
  _move_menu_label(st, 12, 246, 110)
  _move_menu_label(st, 13, 360, 54)

  toolbar_y = MENU_H + 5
  button_h = 32
  gap = 6
  win.MoveWindow(st.toolbar_bg, 0, 0, w, h, true)
  win.send_to_bottom(st.toolbar_bg)
  x = STATUS_PAD
  win.MoveWindow(st.btn_open, x, toolbar_y, 92, button_h, true)
  x = x + 92 + gap
  win.MoveWindow(st.btn_save, x, toolbar_y, 104, button_h, true)
  x = x + 104 + gap
  win.MoveWindow(st.btn_build, x, toolbar_y, 92, button_h, true)
  x = x + 92 + gap
  win.MoveWindow(st.btn_run, x, toolbar_y, 78, button_h, true)
  x = x + 78 + gap
  win.MoveWindow(st.btn_test, x, toolbar_y, 82, button_h, true)
  x = x + 82 + gap
  win.MoveWindow(st.btn_reload, x, toolbar_y, 92, button_h, true)
  x = x + 92 + (gap * 3)
  win.MoveWindow(st.btn_cut, x, toolbar_y, 78, button_h, true)
  x = x + 78 + gap
  win.MoveWindow(st.btn_copy, x, toolbar_y, 82, button_h, true)
  x = x + 82 + gap
  win.MoveWindow(st.btn_paste, x, toolbar_y, 82, button_h, true)
  win.BringWindowToTop(st.btn_open)
  win.BringWindowToTop(st.btn_save)
  win.BringWindowToTop(st.btn_build)
  win.BringWindowToTop(st.btn_run)
  win.BringWindowToTop(st.btn_test)
  win.BringWindowToTop(st.btn_reload)
  win.BringWindowToTop(st.btn_cut)
  win.BringWindowToTop(st.btn_copy)
  win.BringWindowToTop(st.btn_paste)
  ix = STATUS_PAD
  _move_toolbar_icon(st, 0, ix + 10, toolbar_y + 7)
  ix = ix + 92 + gap
  _move_toolbar_icon(st, 1, ix + 10, toolbar_y + 7)
  ix = ix + 104 + gap
  _move_toolbar_icon(st, 2, ix + 10, toolbar_y + 7)
  ix = ix + 92 + gap
  _move_toolbar_icon(st, 3, ix + 10, toolbar_y + 7)
  ix = ix + 78 + gap
  _move_toolbar_icon(st, 4, ix + 10, toolbar_y + 7)
  ix = ix + 82 + gap
  _move_toolbar_icon(st, 5, ix + 10, toolbar_y + 7)
  ix = ix + 92 + (gap * 3)
  _move_toolbar_icon(st, 6, ix + 10, toolbar_y + 7)
  ix = ix + 78 + gap
  _move_toolbar_icon(st, 7, ix + 10, toolbar_y + 7)
  ix = ix + 82 + gap
  _move_toolbar_icon(st, 8, ix + 10, toolbar_y + 7)

  body_h = h - TOOL_H - TAB_H - LOG_H - STATUS_H - STATUS_PAD
  if body_h < 100 then body_h = 100 end if
  editor_y = TOOL_H + TAB_H
  log_y = editor_y + body_h + STATUS_PAD
  win.MoveWindow(st.tree, STATUS_PAD, TOOL_H, LEFT_W - STATUS_PAD * 2, body_h + TAB_H, true)
  win.MoveWindow(st.tabbar, LEFT_W, TOOL_H, w - LEFT_W - STATUS_PAD, TAB_H + 2, true)
  line_w = LINE_NO_W
  if _active_is_markdown(st) then line_w = 0 end if
  if line_w > 0 then
    win.ShowWindow(st.line_numbers, win.SW_SHOW)
    win.MoveWindow(st.line_numbers, LEFT_W, editor_y, line_w, body_h, true)
  else
    win.ShowWindow(st.line_numbers, win.SW_HIDE)
  end if
  win.MoveWindow(st.editor, LEFT_W + line_w, editor_y, w - LEFT_W - line_w - STATUS_PAD, body_h, true)
  panel_h = LOG_H - STATUS_PAD - STATUS_H
  win.MoveWindow(st.log, STATUS_PAD, log_y, w - STATUS_PAD * 2, panel_h, true)
  win.MoveWindow(st.panel_title, STATUS_PAD, log_y, w - STATUS_PAD * 2, 24, true)
  win.MoveWindow(st.result_list, STATUS_PAD, log_y + 24, w - STATUS_PAD * 2, panel_h - 24, true)
  win.MoveWindow(st.status, STATUS_PAD, log_y + LOG_H - STATUS_PAD - STATUS_H, w - STATUS_PAD * 2, STATUS_H, true)
  return st
end function

// Return the key pressed.
function _key_pressed(st, vk)
  down = win.key_down(vk)
  was = false
  if st.prev_keys[vk] != 0 then was = true end if
  if down then st.prev_keys[vk] = 1 else st.prev_keys[vk] = 0 end if
  return down and was == false
end function

// Return the control down.
function _ctrl_down()
  return win.key_down(win.VK_CONTROL)
end function

// Return the shift down.
function _shift_down()
  return win.key_down(win.VK_SHIFT)
end function

// Return the alt down.
function _alt_down()
  return win.key_down(win.VK_MENU)
end function

// Return the button hit.
function _button_hit(st, mx, my)
  if my < 0 or my > 32 then return 0 end if
  size = win.client_size(st.hwnd)
  x = size[0] - 96
  if mx >= x and mx < x + 32 then return ID_WINDOW_MINIMIZE end if
  if mx >= x + 32 and mx < x + 64 then
    if win.IsZoomed(st.hwnd) then return ID_WINDOW_RESTORE end if
    return ID_WINDOW_MAXIMIZE
  end if
  if mx >= x + 64 and mx < x + 96 then return ID_FILE_EXIT end if
  return 0
end function

// Handle tree click.
function _handle_tree_click(st, clicked, mx, my)
  if clicked == false then return st end if
  if mx < 0 or mx >= LEFT_W or my < TOOL_H then return st end if
  item = win.tree_hit_test(st.tree, mx - STATUS_PAD, my - TOOL_H)
  if item == 0 then item = win.tree_get_selection(st.tree) end if
  if item == 0 then return st end if
  now = win.GetTickCount()
  idx = _tree_handle_index(st, item)
  if idx < 0 then return st end if
  st.current_sel = idx

  if item == st.last_tree_click_item and now - st.last_tree_click_ms <= 500 then
    st.last_tree_click_ms = 0
    st.last_tree_click_item = 0
    is_dir = true
    if idx < len(st.tree_is_dir) then is_dir = st.tree_is_dir[idx] end if
    if is_dir == false and idx < len(st.tree_paths) then
      return _open_file(st, st.tree_paths[idx])
    end if
    return st
  end if

  st.last_tree_click_ms = now
  st.last_tree_click_item = item
  return st
end function

// Open tree file index.
function _open_tree_file_index(st, idx)
  if idx < 0 or idx >= len(st.tree_paths) then return st end if
  is_dir = true
  if idx < len(st.tree_is_dir) then is_dir = st.tree_is_dir[idx] end if
  if is_dir then return st end if
  st.current_sel = idx
  return _open_file(st, st.tree_paths[idx])
end function

// Open tree file at.
function _open_tree_file_at(st, mx, my)
  if mx < 0 or mx >= LEFT_W or my < TOOL_H then return st end if
  item = win.tree_hit_test(st.tree, mx - STATUS_PAD, my - TOOL_H)
  if item == 0 then return st end if
  idx = _tree_handle_index(st, item)
  if idx < 0 then return st end if
  win.tree_select(st.tree, item)
  return _open_tree_file_index(st, idx)
end function

// Handle tab selection.
function _handle_tab_selection(st)
  sel = win.tab_get_cur_sel(st.tabbar)
  if typeof(sel) != "int" then return st end if
  if sel < 0 or sel == st.active_tab then return st end if
  if sel >= len(st.open_files) then return st end if
  st = _sync_active_tab(st)
  return _activate_tab(st, sel)
end function

// Handle tab click.
function _handle_tab_click(st, tx, ty)
  idx = _tab_at(st, tx + LEFT_W, ty + TOOL_H)
  if idx < 0 or idx >= len(st.open_files) then return st end if
  if idx == st.active_tab then return st end if
  st = _sync_active_tab(st)
  return _activate_tab(st, idx)
end function

// Open selected tree file.
function _open_selected_tree_file(st)
  if st.current_sel >= 0 and st.current_sel < len(st.tree_paths) then
    return _open_tree_file_index(st, st.current_sel)
  end if
  item = win.tree_get_selection(st.tree)
  if item == 0 then return st end if
  idx = _tree_handle_index(st, item)
  return _open_tree_file_index(st, idx)
end function

// Reveal the active editor file in the project tree.
function _reveal_active_file(st)
  if typeof(st.current_file) != "string" or st.current_file == "" then return _set_log(st, "Reveal Active File: no file is open.") end if
  if typeof(st.tree_paths) != "array" or typeof(st.tree_handles) != "array" then return _set_log(st, "Reveal Active File: project tree is unavailable.") end if
  current = s.toLowerAscii(st.current_file)
  for i = 0 to len(st.tree_paths) - 1
    if i >= len(st.tree_handles) then continue end if
    path = st.tree_paths[i]
    if typeof(path) != "string" then continue end if
    if s.toLowerAscii(path) == current then
      st.current_sel = i
      win.tree_select(st.tree, st.tree_handles[i])
      win.SetFocus(st.tree)
      return _set_log(st, "Reveal Active File: " + _project_relative_path(st, path))
    end if
  end for
  return _set_log(st, "Reveal Active File: current file is not in the project tree.")
end function

// Close tab.
function _close_tab(st, idx)
  // Walk collections defensively because project data can be partially populated.
  if typeof(st.open_files) != "array" then return st end if
  if idx < 0 or idx >= len(st.open_files) then return st end if
  st = _sync_active_tab(st)
  if idx < len(st.open_dirty) then
    if st.open_dirty[idx] then
      if _is_generated_editor_path(st.open_files[idx]) == false then
        st.context_tab = -1
        return _set_log(st, "Unsaved changes in " + _basename(st.open_files[idx]) + ". Save before closing.")
      end if
    end if
  end if

  old_active = st.active_tab
  st = _ensure_markdown_view_slots(st)
  if idx < len(st.open_markdown_views) then _destroy_markdown_view(st.open_markdown_views[idx]) end if
  files = []
  texts = []
  saved = []
  dirty = []
  undos = []
  redos = []
  folds = []
  md_sources = []
  md_docs = []
  md_views = []
  md_view_sources = []
  md_view_themes = []
  for i = 0 to len(st.open_files) - 1
    if i == idx then continue end if
    files = files + [st.open_files[i]]
    texts = texts + [st.open_texts[i]]
    saved = saved + [st.open_saved_texts[i]]
    keep_dirty = st.open_dirty[i]
    if _is_generated_editor_path(st.open_files[i]) then keep_dirty = false end if
    dirty = dirty + [keep_dirty]
    undos = undos + [st.open_undo[i]]
    redos = redos + [st.open_redo[i]]
    folds = folds + [st.open_folds[i]]
    if typeof(st.open_markdown_sources) == "array" and i < len(st.open_markdown_sources) then md_sources = md_sources + [st.open_markdown_sources[i]] else md_sources = md_sources + [""] end if
    if typeof(st.open_markdown_docs) == "array" and i < len(st.open_markdown_docs) and typeof(st.open_markdown_docs[i]) == "struct" then md_docs = md_docs + [st.open_markdown_docs[i]] else md_docs = md_docs + [markdown.empty_doc()] end if
    if typeof(st.open_markdown_views) == "array" and i < len(st.open_markdown_views) then md_views = md_views + [st.open_markdown_views[i]] else md_views = md_views + [0] end if
    if typeof(st.open_markdown_view_sources) == "array" and i < len(st.open_markdown_view_sources) then md_view_sources = md_view_sources + [st.open_markdown_view_sources[i]] else md_view_sources = md_view_sources + [""] end if
    if typeof(st.open_markdown_view_themes) == "array" and i < len(st.open_markdown_view_themes) then md_view_themes = md_view_themes + [st.open_markdown_view_themes[i]] else md_view_themes = md_view_themes + [""] end if
  end for

  st.open_files = files
  st.open_texts = texts
  st.open_saved_texts = saved
  st.open_dirty = dirty
  st.open_undo = undos
  st.open_redo = redos
  st.open_folds = folds
  st.open_markdown_sources = md_sources
  st.open_markdown_docs = md_docs
  st.open_markdown_views = md_views
  st.open_markdown_view_sources = md_view_sources
  st.open_markdown_view_themes = md_view_themes
  st.context_tab = -1

  if len(st.open_files) <= 0 then
    st.editor = st.code_editor
    win.ShowWindow(st.code_editor, win.SW_SHOW)
    st.active_tab = -1
    st.current_file = ""
    st.last_editor_text = ""
    st = _invalidate_highlight(st)
    st.last_line_numbers_text = ""
    st.last_status_text = ""
    st.last_first_visible_line = -1
    st = _write_editor(st, "")
    st = _refresh_tabs(st)
    _set_title(st)
    return _set_log(st, "Closed tab.")
  end if

  target = old_active
  if idx < old_active then target = old_active - 1 end if
  if idx == old_active then target = idx end if
  if target >= len(st.open_files) then target = len(st.open_files) - 1 end if
  if target < 0 then target = 0 end if
  st.active_tab = -1
  return _activate_tab(st, target)
end function

// Close other tabs.
function _close_other_tabs(st)
  // Walk collections defensively because project data can be partially populated.
  keep = st.context_tab
  if keep < 0 then keep = st.active_tab end if
  if typeof(st.open_files) != "array" or keep < 0 or keep >= len(st.open_files) then return st end if
  st = _sync_active_tab(st)
  for i = 0 to len(st.open_files) - 1
    if i == keep then continue end if
    if i < len(st.open_dirty) and st.open_dirty[i] then
      if _is_generated_editor_path(st.open_files[i]) then continue end if
      st.context_tab = -1
      return _set_log(st, "Unsaved changes in " + _basename(st.open_files[i]) + ". Save before closing other tabs.")
    end if
  end for
  file = st.open_files[keep]
  text = st.open_texts[keep]
  saved = st.open_saved_texts[keep]
  dirty = st.open_dirty[keep]
  if _is_generated_editor_path(file) then dirty = false end if
  undo = st.open_undo[keep]
  redo = st.open_redo[keep]
  folds = st.open_folds[keep]
  md_source = ""
  md_doc = markdown.empty_doc()
  md_view = 0
  md_view_source = ""
  md_view_theme = ""
  st = _ensure_markdown_view_slots(st)
  if typeof(st.open_markdown_sources) == "array" and keep < len(st.open_markdown_sources) then md_source = st.open_markdown_sources[keep] end if
  if typeof(st.open_markdown_docs) == "array" and keep < len(st.open_markdown_docs) and typeof(st.open_markdown_docs[keep]) == "struct" then md_doc = st.open_markdown_docs[keep] end if
  if typeof(st.open_markdown_views) == "array" and keep < len(st.open_markdown_views) then md_view = st.open_markdown_views[keep] end if
  if typeof(st.open_markdown_view_sources) == "array" and keep < len(st.open_markdown_view_sources) then md_view_source = st.open_markdown_view_sources[keep] end if
  if typeof(st.open_markdown_view_themes) == "array" and keep < len(st.open_markdown_view_themes) then md_view_theme = st.open_markdown_view_themes[keep] end if
  for i = 0 to len(st.open_files) - 1
    if i != keep and i < len(st.open_markdown_views) then _destroy_markdown_view(st.open_markdown_views[i]) end if
  end for
  if _is_markdown_path(file) == false then
    _destroy_markdown_view(md_view)
    md_view = 0
    md_view_source = ""
    md_view_theme = ""
  end if
  st.open_files = [file]
  st.open_texts = [text]
  st.open_saved_texts = [saved]
  st.open_dirty = [dirty]
  st.open_undo = [undo]
  st.open_redo = [redo]
  st.open_folds = [folds]
  st.open_markdown_sources = [md_source]
  st.open_markdown_docs = [md_doc]
  st.open_markdown_views = [md_view]
  st.open_markdown_view_sources = [md_view_source]
  st.open_markdown_view_themes = [md_view_theme]
  st.active_tab = -1
  st.context_tab = -1
  return _activate_tab(st, 0)
end function

// Close all tabs.
function _close_all_tabs(st)
  // Walk collections defensively because project data can be partially populated.
  if typeof(st.open_files) != "array" then return st end if
  st = _sync_active_tab(st)
  for i = 0 to len(st.open_files) - 1
    if i < len(st.open_dirty) and st.open_dirty[i] then
      if _is_generated_editor_path(st.open_files[i]) then continue end if
      st.context_tab = -1
      return _set_log(st, "Unsaved changes in " + _basename(st.open_files[i]) + ". Save before closing all tabs.")
    end if
  end for
  st = _destroy_all_markdown_views(st)
  st.editor = st.code_editor
  win.ShowWindow(st.code_editor, win.SW_SHOW)
  st.open_files = []
  st.open_texts = []
  st.open_saved_texts = []
  st.open_dirty = []
  st.open_undo = []
  st.open_redo = []
  st.open_folds = []
  st.open_markdown_sources = []
  st.open_markdown_docs = []
  st.open_markdown_views = []
  st.open_markdown_view_sources = []
  st.open_markdown_view_themes = []
  st.active_tab = -1
  st.current_file = ""
  st.context_tab = -1
  st.last_editor_text = ""
  st = _invalidate_highlight(st)
  st.last_line_numbers_text = ""
  st.last_status_text = ""
  st.last_first_visible_line = -1
  st = _write_editor(st, "")
  st = _refresh_tabs(st)
  _set_title(st)
  return _set_log(st, "Closed all tabs.")
end function

// Return the selected tree index.
function _selected_tree_index(st)
  if st.current_sel >= 0 and st.current_sel < len(st.tree_paths) then return st.current_sel end if
  item = win.tree_get_selection(st.tree)
  if item == 0 then return 0 end if
  idx = _tree_handle_index(st, item)
  if idx < 0 then return 0 end if
  return idx
end function

// Send the target directory operation to a tree-view control.
function _tree_target_dir(st)
  idx = _selected_tree_index(st)
  path = "."
  if typeof(st.project) == "struct" then path = st.project.root end if
  if idx >= 0 and idx < len(st.tree_paths) then path = st.tree_paths[idx] end if
  is_dir = true
  if idx >= 0 and idx < len(st.tree_is_dir) then is_dir = st.tree_is_dir[idx] end if
  if is_dir then return path end if
  return project.dirname(path)
end function

// Reload tree only.
function _reload_tree_only(st)
  root = "."
  if typeof(st.project) == "struct" then root = st.project.root end if
  st.project = project.load_project(root)
  st = _populate_project_tree(st)
  st = _refresh_tabs(st)
  _set_title(st)
  return st
end function

// Return the unique file path.
function _unique_file_path(dir, stem, ext)
  candidate = project.path_join(dir, stem + ext)
  if fs.exists(candidate) == false then return candidate end if
  i = 2
  while i < 1000
    candidate = project.path_join(dir, stem + "_" + i + ext)
    if fs.exists(candidate) == false then return candidate end if
    i = i + 1
  end while
  return project.path_join(dir, stem + "_" + win.GetTickCount() + ext)
end function

// Return the unique named path.
function _unique_named_path(dir, name)
  candidate = project.path_join(dir, name)
  if fs.exists(candidate) == false then return candidate end if
  i = 2
  while i < 1000
    candidate = project.path_join(dir, "copy_" + i + "_" + name)
    if fs.exists(candidate) == false then return candidate end if
    i = i + 1
  end while
  return project.path_join(dir, "copy_" + win.GetTickCount() + "_" + name)
end function

// Return the norm path key.
function _norm_path_key(path)
  if typeof(path) != "string" then return "" end if
  key = s.replaceAll(path, "/", "\\")
  return s.toLowerAscii(key)
end function

// Return the same or child path.
function _same_or_child_path(parent, child)
  p = _norm_path_key(parent)
  c = _norm_path_key(child)
  if p == "" or c == "" then return false end if
  if p == c then return true end if
  if s.endsWith(p, "\\") == false then p = p + "\\" end if
  return s.startsWith(c, p)
end function

// Return true when open path under.
function _has_open_path_under(st, path)
  // Walk collections defensively because project data can be partially populated.
  if typeof(st.open_files) != "array" then return false end if
  for i = 0 to len(st.open_files) - 1
    f = st.open_files[i]
    if f == path or _same_or_child_path(path, f) then return true end if
  end for
  return false
end function

// Return the safe identifier.
function _safe_identifier(name)
  if typeof(name) != "string" or name == "" then return "new_module" end if
  name = s.replaceAll(name, ".ml", "")
  name = s.replaceAll(name, " ", "_")
  name = s.replaceAll(name, "-", "_")
  name = s.replaceAll(name, ".", "_")
  if name == "" then name = "new_module" end if
  return name
end function

// Return the module source.
function _module_source(path)
  id = _safe_identifier(_basename(path))
  return "function " + id + "()\n  return 0\nend function\n"
end function

// Return the test file source.
function _test_file_source(path)
  return "function main(args)\n  print \"Running " + _basename(path) + "\"\n  return 0\nend function\n"
end function

// Copy path recursive.
function _copy_path_recursive(src, dest)
  // Walk collections defensively because project data can be partially populated.
  if fs.isDir(src) then
    if fs.exists(dest) == false then
      ok = win.create_directory(dest)
      if ok == false then return "CreateDirectoryW failed for " + dest end if
    end if
    entries = fs.listDir(src)
    if typeof(entries) == "error" then return entries.message end if
    if typeof(entries) == "array" and len(entries) > 0 then
      for i = 0 to len(entries) - 1
        name = entries[i]
        child_src = project.path_join(src, name)
        child_dest = project.path_join(dest, name)
        err = _copy_path_recursive(child_src, child_dest)
        if err != "" then return err end if
      end for
    end if
    return ""
  end if
  cp = fs.copyFile(src, dest, false)
  if typeof(cp) == "error" then return cp.message end if
  return ""
end function

// Delete path recursive.
function _delete_path_recursive(path)
  // Walk collections defensively because project data can be partially populated.
  if fs.isDir(path) then
    entries = fs.listDir(path)
    if typeof(entries) == "error" then return entries.message end if
    if typeof(entries) == "array" and len(entries) > 0 then
      for i = 0 to len(entries) - 1
        child = project.path_join(path, entries[i])
        err = _delete_path_recursive(child)
        if err != "" then return err end if
      end for
    end if
    if win.remove_directory(path) == false then return "RemoveDirectoryW failed for " + path end if
    return ""
  end if
  if fs.delete(path) == false then return "Delete failed for " + path end if
  return ""
end function

// Create tree file.
function _new_tree_file(st)
  dir = _tree_target_dir(st)
  path = _unique_file_path(dir, "new_file", ".ml")
  wr = fs.writeAllText(path, _module_source(path))
  if typeof(wr) == "error" then return _set_log(st, "New file failed: " + wr.message) end if
  st = _reload_tree_only(st)
  st = _open_file(st, path)
  return _set_log(st, "Created " + path)
end function

// Create tree test file.
function _new_tree_test_file(st)
  dir = _tree_target_dir(st)
  path = _unique_file_path(dir, "new_test", ".ml")
  wr = fs.writeAllText(path, _test_file_source(path))
  if typeof(wr) == "error" then return _set_log(st, "New test failed: " + wr.message) end if
  st = _reload_tree_only(st)
  st = _open_file(st, path)
  return _set_log(st, "Created test " + path)
end function

// Create tree folder.
function _new_tree_folder(st)
  dir = _tree_target_dir(st)
  path = _unique_file_path(dir, "NewFolder", "")
  ok = win.create_directory(path)
  if ok == false then return _set_log(st, "New folder failed: " + path) end if
  st = _reload_tree_only(st)
  return _set_log(st, "Created folder " + path)
end function

// Read rename name.
function _read_rename_name(dlg, edit)
  name = s.trim(win.get_control_text(edit))
  if name == "" then
    win.MessageBoxW(dlg, "Please enter a name.", "Rename", 0)
    return ""
  end if
  if s.indexOf(name, "\\", 0) >= 0 or s.indexOf(name, "/", 0) >= 0 then
    win.MessageBoxW(dlg, "The name must not contain a path.", "Rename", 0)
    return ""
  end if
  return name
end function

// Return the rename tree item.
function _rename_tree_item(st)
  // Run a local message loop so the modal UI stays responsive.
  idx = _selected_tree_index(st)
  if idx <= 0 or idx >= len(st.tree_paths) then return _set_log(st, "The project root cannot be renamed.") end if
  path = st.tree_paths[idx]
  if _has_open_path_under(st, path) then return _set_log(st, "Please close open files under this path before renaming.") end if

  dlg = win.create_main_window("Rename", 460, 170)
  if dlg is void then return st end if
  _settings_label(dlg, st.font_ui, "Name", 20, 28, 80, 24)
  name_edit = _settings_edit_id(dlg, st.font_ui, _basename(path), 104, 24, 312, 26, ID_RENAME_TEXT_EDIT)
  ok_btn = _settings_button(dlg, st.font_ui, "OK", 224, 92, 88, 30, ID_RENAME_OK)
  cancel_btn = _settings_button(dlg, st.font_ui, "Cancel", 322, 92, 94, 30, ID_RENAME_CANCEL)
  win.edit_select_all(name_edit)
  win.SetFocus(name_edit)

  new_name = ""
  done = false
  while done == false and win.IsWindow(dlg)
    msg = bytes(48, 0)
    while win.PeekMessageW(msg, void, 0, 0, win.PM_REMOVE)
      code = win.msg_message(msg)
      hwnd = win.msg_hwnd(msg)
      handled = false
      if code == win.WM_QUIT then
        st.running = false
        done = true
        handled = true
      else if code == win.WM_CLOSE and hwnd == dlg then
        done = true
        win.DestroyWindow(dlg)
        handled = true
      else if code == win.WM_KEYDOWN then
        key = win.msg_wparam_u32(msg)
        if key == win.VK_ESCAPE then
          done = true
          win.DestroyWindow(dlg)
          handled = true
        else if key == win.VK_RETURN then
          value = _read_rename_name(dlg, name_edit)
          if value != "" then
            new_name = value
            done = true
            win.DestroyWindow(dlg)
          end if
          handled = true
        end if
      else if code == win.WM_COMMAND and hwnd == dlg then
        cid = win.msg_command_id(msg)
        if cid == ID_RENAME_CANCEL then
          done = true
          win.DestroyWindow(dlg)
          handled = true
        else if cid == ID_RENAME_OK then
          value = _read_rename_name(dlg, name_edit)
          if value != "" then
            new_name = value
            done = true
            win.DestroyWindow(dlg)
          end if
          handled = true
        end if
      else if code == win.WM_LBUTTONUP then
        if hwnd == cancel_btn then
          done = true
          win.DestroyWindow(dlg)
          handled = true
        else if hwnd == ok_btn then
          value = _read_rename_name(dlg, name_edit)
          if value != "" then
            new_name = value
            done = true
            win.DestroyWindow(dlg)
          end if
          handled = true
        end if
      end if
      if handled == false then
        win.TranslateMessage(msg)
        win.DispatchMessageW(msg)
      end if
    end while
    if done == false then win.Sleep(15) end if
  end while

  if new_name == "" then return st end if
  dest = project.path_join(project.dirname(path), new_name)
  if fs.exists(dest) then return _set_log(st, "Rename failed: target already exists.") end if
  mv = fs.moveFile(path, dest, false)
  if typeof(mv) == "error" then return _set_log(st, "Rename failed: " + mv.message) end if
  st = _reload_tree_only(st)
  return _set_log(st, "Renamed: " + dest)
end function

// Delete tree item.
function _delete_tree_item(st)
  idx = _selected_tree_index(st)
  if idx <= 0 or idx >= len(st.tree_paths) then return _set_log(st, "The project root cannot be deleted.") end if
  path = st.tree_paths[idx]
  if _has_open_path_under(st, path) then return _set_log(st, "Please close open files under this path before deleting.") end if
  answer = win.MessageBoxW(st.hwnd, "Really delete?\n" + path, "Delete", 4)
  if answer != 6 then return st end if
  err = _delete_path_recursive(path)
  if err != "" then return _set_log(st, "Delete failed: " + err) end if
  st = _reload_tree_only(st)
  return _set_log(st, "Deleted: " + path)
end function

// Copy tree item.
function _copy_tree_item(st)
  idx = _selected_tree_index(st)
  if idx < 0 or idx >= len(st.tree_paths) then return st end if
  if idx == 0 then return _set_log(st, "Project root cannot be copied here.") end if
  st.file_clipboard_path = st.tree_paths[idx]
  return _set_log(st, "Copied " + st.file_clipboard_path)
end function

// Paste tree item.
function _paste_tree_item(st)
  if typeof(st.file_clipboard_path) != "string" or st.file_clipboard_path == "" then
    return _set_log(st, "Nothing to paste.")
  end if
  src = st.file_clipboard_path
  if fs.exists(src) == false then return _set_log(st, "Clipboard file no longer exists: " + src) end if
  dir = _tree_target_dir(st)
  if fs.isDir(src) and _same_or_child_path(src, dir) then
    return _set_log(st, "Cannot paste a folder into itself.")
  end if
  dest = _unique_named_path(dir, _basename(src))
  err = _copy_path_recursive(src, dest)
  if err != "" then return _set_log(st, "Paste failed: " + err) end if
  st = _reload_tree_only(st)
  if fs.isDir(dest) == false and s.endsWith(s.toLowerAscii(dest), ".ml") then st = _open_file(st, dest) end if
  return _set_log(st, "Pasted " + dest)
end function

// Return the unfold all.
function _unfold_all(st)
  return st
end function

// Return the remove fold at the requested location.
function _remove_fold_at(folds, source_line)
  // Walk collections defensively because project data can be partially populated.
  remaining = []
  if typeof(folds) != "array" then return remaining end if
  if len(folds) <= 0 then return remaining end if
  for i = 0 to len(folds) - 1
    f = folds[i]
    if typeof(f) == "struct" and f.start_line == source_line then continue end if
    remaining = remaining + [f]
  end for
  return remaining
end function

// Toggle fold line.
function _toggle_fold_line(st, source_line)
  return st
end function

// Toggle fold at the caret.
function _toggle_fold_at_caret(st)
  if st.active_tab < 0 or st.active_tab >= len(st.open_texts) then return st end if
  sel = win.edit_getsel(st.editor)
  display_line = win.edit_line_from_char(st.editor, sel[0])
  source_line = _display_to_source_line(st.open_texts[st.active_tab], _active_folds(st), display_line)
  return _toggle_fold_line(st, source_line)
end function

// Toggle fold from the y.
function _toggle_fold_from_y(st, my)
  if st.active_tab < 0 or st.active_tab >= len(st.open_texts) then return st end if
  editor_y = TOOL_H + TAB_H
  display_line = win.edit_line_from_pos(st.editor, 4, my - editor_y)
  if display_line < 0 then display_line = 0 end if
  source_line = _display_to_source_line(st.open_texts[st.active_tab], _active_folds(st), display_line)
  return _toggle_fold_line(st, source_line)
end function

// Return the line label.
function _line_label(line_no, marker)
  num = "" + line_no
  while len(num) < 4
    num = " " + num
  end while
  return " " + num
end function

// Return the simple line numbers text.
function _simple_line_numbers_text(first_visible, count)
  if typeof(count) != "int" or count <= 0 then count = 1 end if
  if first_visible < 0 then first_visible = 0 end if
  text_out = ""
  added = 0
  line_no = first_visible + 1
  while line_no <= count and added < 300
    if added > 0 then text_out = text_out + "\r\n" end if
    text_out = text_out + _line_label(line_no, " ")
    added = added + 1
    line_no = line_no + 1
  end while
  return text_out
end function

// Return the all line numbers text.
function _all_line_numbers_text(count)
  if typeof(count) != "int" or count <= 0 then count = 1 end if
  text_out = ""
  line_no = 1
  while line_no <= count
    if line_no > 1 then text_out = text_out + "\r\n" end if
    text_out = text_out + _line_label(line_no, " ")
    line_no = line_no + 1
  end while
  return text_out
end function

// Synchronize line numbers.
function _sync_line_numbers(st)
  if _active_is_markdown(st) or st.active_tab < 0 or st.active_tab >= len(st.open_texts) then
    if st.last_line_numbers_text != "" then
      win.set_window_text(st.line_numbers, "")
      st.last_line_numbers_text = ""
      st.last_line_numbers_count = 0
    end if
    return st
  end if
  count = win.edit_line_count(st.editor)
  if typeof(count) != "int" or count <= 0 then count = 1 end if
  if count != st.last_line_numbers_count or st.last_line_numbers_text == "" then
      nums = _all_line_numbers_text(count)
      win.set_window_text(st.line_numbers, nums)
      win.edit_set_background(st.line_numbers, theme.gutter_bg(st))
      win.rich_set_all_color(st.line_numbers, theme.muted_fg(st))
      win.edit_setsel(st.line_numbers, 0, 0)
    win.edit_set_modified(st.line_numbers, false)
    st.last_line_numbers_text = nums
    st.last_line_numbers_count = count
  end if
  scroll = win.edit_get_scroll_pos(st.editor)
  win.edit_set_scroll_pos(st.line_numbers, 0, scroll[1])
  return st
end function

// Return the caret status text.
function _caret_status_text(st)
  if st.active_tab < 0 or st.active_tab >= len(st.open_texts) then return "Line 1, Column 1" end if
  sel = win.edit_getsel(st.editor)
  pos = sel[0]
  display_line = win.edit_line_from_char(st.editor, pos)
  line_start = win.edit_line_index(st.editor, display_line)
  if line_start < 0 then line_start = 0 end if
  col = pos - line_start + 1
  if col < 1 then col = 1 end if
  source_line = display_line
  return "Line " + (source_line + 1) + ", Column " + col
end function

// Update editor aux.
function _update_editor_aux(st)
  now = win.GetTickCount()
  first = win.edit_first_visible_line(st.editor)
  first_changed = first != st.last_first_visible_line
  editor_modified = win.edit_is_modified(st.editor)
  st = _sync_line_numbers(st)
  if first_changed then
    st.last_first_visible_line = first
    st.last_scroll_ms = now
    if _active_is_markdown(st) == false then st.highlight_pending = true end if
  end if
  if st.highlight_pending and editor_modified == false and now - st.last_edit_ms >= HIGHLIGHT_IDLE_MS and now - st.last_scroll_ms >= SCROLL_IDLE_MS then
    st = _apply_syntax_highlight(st)
  end if
  status = _caret_status_text(st)
  if status != st.last_status_text then
    win.set_window_text(st.status, status)
    st.last_status_text = status
  end if
  return st
end function

// Return the tab at the requested location.
function _tab_at(st, mx, my)
  if typeof(st.open_files) != "array" or len(st.open_files) <= 0 then return -1 end if
  if mx < LEFT_W or my < TOOL_H or my >= TOOL_H + TAB_H + 6 then return -1 end if
  idx = win.tab_hit_test(st.tabbar, mx - LEFT_W, my - TOOL_H)
  if typeof(idx) != "int" then return -1 end if
  if idx < 0 or idx >= len(st.open_files) then return -1 end if
  return idx
end function

// Return the popup command.
function _popup_command(st, menu, mx, my)
  cmd = win.track_popup(st.hwnd, menu, mx, my)
  win.destroy_menu(menu)
  st.last_context_ms = win.GetTickCount()
  st.prev_right_mouse = win.key_down(win.VK_RBUTTON)
  if cmd == 0 then return st end if
  st = _perform_command(st, cmd)
  st.last_context_ms = win.GetTickCount()
  st.prev_right_mouse = win.key_down(win.VK_RBUTTON)
  return st
end function

// Return the popup existing command.
function _popup_existing_command(st, menu, mx, my)
  cmd = win.track_popup(st.hwnd, menu, mx, my)
  st.last_context_ms = win.GetTickCount()
  st.prev_right_mouse = win.key_down(win.VK_RBUTTON)
  if cmd == 0 then return st end if
  st = _perform_command(st, cmd)
  st.last_context_ms = win.GetTickCount()
  st.prev_right_mouse = win.key_down(win.VK_RBUTTON)
  return st
end function

// Return the menu label index for a window handle.
function _menu_label_index_for_hwnd(st, hwnd)
  // Walk collections defensively because project data can be partially populated.
  if typeof(st.toolbar_icons) != "array" or len(st.toolbar_icons) < 14 then return -1 end if
  for i = 9 to 13
    if hwnd == st.toolbar_icons[i] then return i - 9 end if
  end for
  return -1
end function

// Show top menu.
function _show_top_menu(st, idx)
  menu = st.file_menu
  x = 8
  if idx == 1 then
    menu = st.edit_menu
    x = 66
  else if idx == 2 then
    menu = st.nav_menu
    x = 156
  else if idx == 3 then
    menu = st.config_menu
    x = 246
  else if idx == 4 then
    menu = st.help_menu
    x = 360
  end if
  return _popup_existing_command(st, menu, x, MENU_H)
end function

// Show tab context.
function _show_tab_context(st, mx, my)
  idx = _tab_at(st, mx, my)
  if idx < 0 then idx = st.active_tab end if
  if idx >= 0 and idx < len(st.open_files) and idx != st.active_tab then
    st = _sync_active_tab(st)
    st = _activate_tab(st, idx)
  end if
  st.context_tab = idx
  menu = win.CreatePopupMenu()
  win.AppendMenuWId(menu, win.MF_STRING, ID_CTX_TAB_CLOSE, "Close Tab")
  win.AppendMenuWId(menu, win.MF_STRING, ID_CTX_TAB_CLOSE_OTHERS, "Close Other Tabs")
  win.AppendMenuWId(menu, win.MF_STRING, ID_CTX_TAB_CLOSE_ALL, "Close All Tabs")
  win.AppendMenuWId(menu, win.MF_SEPARATOR, 0, "")
  win.AppendMenuWId(menu, win.MF_STRING, ID_FILE_SAVE, "Save")
  return _popup_command(st, menu, mx, my)
end function

// Select tree item at.
function _select_tree_item_at(st, mx, my)
  if mx < 0 or mx >= LEFT_W or my < TOOL_H then return st end if
  item = win.tree_hit_test(st.tree, mx - STATUS_PAD, my - TOOL_H)
  if item == 0 then return st end if
  idx = _tree_handle_index(st, item)
  if idx < 0 then return st end if
  st.current_sel = idx
  win.tree_select(st.tree, item)
  return st
end function

// Show tree context.
function _show_tree_context(st, mx, my)
  st = _select_tree_item_at(st, mx, my)
  menu = win.CreatePopupMenu()
  win.AppendMenuWId(menu, win.MF_STRING, ID_CTX_TREE_OPEN, "Open")
  win.AppendMenuWId(menu, win.MF_SEPARATOR, 0, "")
  win.AppendMenuWId(menu, win.MF_STRING, ID_CTX_TREE_NEW_FILE, "New File")
  win.AppendMenuWId(menu, win.MF_STRING, ID_CTX_TREE_NEW_TEST, "New Test File")
  win.AppendMenuWId(menu, win.MF_STRING, ID_CTX_TREE_NEW_FOLDER, "New Folder")
  win.AppendMenuWId(menu, win.MF_SEPARATOR, 0, "")
  win.AppendMenuWId(menu, win.MF_STRING, ID_CTX_TREE_RENAME, "Rename")
  win.AppendMenuWId(menu, win.MF_STRING, ID_CTX_TREE_DELETE, "Delete")
  win.AppendMenuWId(menu, win.MF_SEPARATOR, 0, "")
  win.AppendMenuWId(menu, win.MF_STRING, ID_CTX_TREE_COPY, "Copy")
  win.AppendMenuWId(menu, win.MF_STRING, ID_CTX_TREE_PASTE, "Paste")
  win.AppendMenuWId(menu, win.MF_SEPARATOR, 0, "")
  win.AppendMenuWId(menu, win.MF_STRING, ID_FILE_RELOAD, "Refresh")
  return _popup_command(st, menu, mx, my)
end function

// Show editor context.
function _show_editor_context(st, mx, my)
  menu = win.CreatePopupMenu()
  win.AppendMenuWId(menu, win.MF_STRING, ID_EDIT_UNDO, "Undo")
  win.AppendMenuWId(menu, win.MF_STRING, ID_EDIT_REDO, "Redo")
  win.AppendMenuWId(menu, win.MF_SEPARATOR, 0, "")
  win.AppendMenuWId(menu, win.MF_STRING, ID_EDIT_CUT, "Cut")
  win.AppendMenuWId(menu, win.MF_STRING, ID_EDIT_COPY, "Copy")
  win.AppendMenuWId(menu, win.MF_STRING, ID_EDIT_PASTE, "Paste")
  win.AppendMenuWId(menu, win.MF_STRING, ID_CTX_EDITOR_SELECT_ALL, "Select All")
  win.AppendMenuWId(menu, win.MF_SEPARATOR, 0, "")
  win.AppendMenuWId(menu, win.MF_STRING, ID_EDIT_FIND, "Find...")
  win.AppendMenuWId(menu, win.MF_STRING, ID_EDIT_FIND_NEXT, "Find Next")
  win.AppendMenuWId(menu, win.MF_STRING, ID_NAV_GOTO_DEFINITION, "Go to Definition")
  win.AppendMenuWId(menu, win.MF_STRING, ID_EDIT_RENAME_SYMBOL, "Rename Symbol...")
  win.AppendMenuWId(menu, win.MF_SEPARATOR, 0, "")
  win.AppendMenuWId(menu, win.MF_STRING, ID_FILE_TEST_CURRENT, "Run Current Test File")
  win.AppendMenuWId(menu, win.MF_STRING, ID_FILE_TEST_RELATED, "Run Related Test File")
  win.AppendMenuWId(menu, win.MF_SEPARATOR, 0, "")
  win.AppendMenuWId(menu, win.MF_STRING, ID_FILE_SAVE, "Save")
  win.AppendMenuWId(menu, win.MF_STRING, ID_FILE_BUILD, "Build")
  return _popup_command(st, menu, mx, my)
end function

// Show log context.
function _show_log_context(st, mx, my)
  menu = win.CreatePopupMenu()
  win.AppendMenuWId(menu, win.MF_STRING, ID_CTX_LOG_COPY, "Copy")
  win.AppendMenuWId(menu, win.MF_STRING, ID_CTX_LOG_SELECT_ALL, "Select All")
  win.AppendMenuWId(menu, win.MF_SEPARATOR, 0, "")
  win.AppendMenuWId(menu, win.MF_STRING, ID_CTX_LOG_CLEAR, "Clear")
  return _popup_command(st, menu, mx, my)
end function

// Handle context menu at the force.
function _handle_context_menu_at_force(st, mx, my, force)
  now = win.GetTickCount()
  if force then
    if now - st.last_context_ms < CONTEXT_FORCE_DUP_MS then return st end if
  else
    if now - st.last_context_ms < CONTEXT_SUPPRESS_MS then return st end if
  end if
  st.last_context_ms = now
  if mx < 0 or my < 0 then return st end if

  log_y = st.last_h - LOG_H
  if log_y < TOOL_H + TAB_H + 100 then log_y = TOOL_H + TAB_H + 100 end if
  if my >= log_y then return _show_log_context(st, mx, my) end if
  if mx < LEFT_W and my >= TOOL_H then return _show_tree_context(st, mx, my) end if
  if mx >= LEFT_W and my >= TOOL_H and my < TOOL_H + TAB_H + 6 then return _show_tab_context(st, mx, my) end if
  if mx >= LEFT_W and my >= TOOL_H + TAB_H and my < log_y then
    return _show_editor_context(st, mx, my)
  end if
  return st
end function

// Handle context menu at.
function _handle_context_menu_at(st, mx, my)
  return _handle_context_menu_at_force(st, mx, my, false)
end function

// Handle context menu.
function _handle_context_menu(st)
  pos = win.mouse_client(st.hwnd)
  return _handle_context_menu_at(st, pos[0], pos[1])
end function

// Request application shutdown after checking unsaved tabs.
function _request_exit(st)
  confirm = _confirm_exit_with_dirty_tabs(st)
  st = confirm[0]
  if confirm[1] == false then return st end if
  win.DestroyWindow(st.hwnd)
  st.running = false
  return st
end function

// Dispatch a menu, toolbar, or context-menu command.
function _perform_command(st, id)
  // Keep validation near the top so callers can treat invalid input as a no-op.
  if id == ID_FILE_OPEN_PROJECT then return _open_project_dialog(st) end if
  if id == ID_FILE_QUICK_OPEN then return _open_quick_open_window(st) end if
  if id == ID_FILE_RECENT_FILES then return _show_recent_files(st) end if
  if id == ID_FILE_NEW_PROJECT then return _new_standard_project(st) end if
  if id == ID_FILE_SAVE then return _save_current(st) end if
  if id == ID_FILE_SAVE_ALL then return _save_all(st) end if
  if id == ID_FILE_CLEAN then return _clean_project(st) end if
  if id == ID_FILE_BUILD then return _build_project(st) end if
  if id == ID_FILE_REBUILD then return _rebuild_project(st) end if
  if id == ID_FILE_RUN then return _run_project(st) end if
  if id == ID_FILE_STOP then return _stop_build_job(st) end if
  if id == ID_FILE_TEST then return _run_tests(st) end if
  if id == ID_FILE_TEST_CURRENT then return _run_current_test_file(st) end if
  if id == ID_FILE_TEST_RELATED then return _run_related_test_file(st) end if
  if id == ID_FILE_RELOAD then return _reload_project(st) end if
  if id == ID_EDIT_UNDO then return _edit_undo(st) end if
  if id == ID_EDIT_REDO then return _edit_redo(st) end if
  if id == ID_EDIT_CUT then return _edit_cut(st) end if
  if id == ID_EDIT_COPY then return _edit_copy(st) end if
  if id == ID_EDIT_PASTE then return _edit_paste(st) end if
  if id == ID_EDIT_FIND then return _open_find_window(st) end if
  if id == ID_EDIT_FIND_NEXT then return _find_next(st) end if
  if id == ID_EDIT_SELECT_ALL then return _edit_select_all(st) end if
  if id == ID_COMMAND_PALETTE then return _open_command_palette(st) end if
  if id == ID_EDIT_RENAME_SYMBOL then return _open_rename_symbol_window(st) end if
  if id == ID_EDIT_COMPLETE then return _autocomplete(st) end if
  if id == ID_EDIT_FORMAT then return _format_current(st) end if
  if id == ID_NAV_BACK then return _navigate_back(st) end if
  if id == ID_NAV_FORWARD then return _navigate_forward(st) end if
  if id == ID_NAV_TOGGLE_BOOKMARK then return _toggle_bookmark(st) end if
  if id == ID_NAV_BOOKMARKS then return _show_bookmarks(st) end if
  if id == ID_NAV_NEXT_BOOKMARK then return _goto_bookmark(st, 1) end if
  if id == ID_NAV_PREV_BOOKMARK then return _goto_bookmark(st, -1) end if
  if id == ID_NAV_REVEAL_ACTIVE_FILE then return _reveal_active_file(st) end if
  if id == ID_NAV_OUTLINE then return _show_outline(st) end if
  if id == ID_NAV_FILE_STRUCTURE then return _open_file_structure_window(st) end if
  if id == ID_NAV_WORKSPACE_HEALTH then return _show_workspace_health(st) end if
  if id == ID_NAV_TODOS then return _show_todos(st) end if
  if id == ID_NAV_TEST_EXPLORER then return _show_test_explorer(st) end if
  if id == ID_NAV_RELATED_TESTS then return _show_related_tests(st) end if
  if id == ID_NAV_IMPORT_GRAPH then return _show_import_graph(st) end if
  if id == ID_NAV_CALL_HIERARCHY then return _show_call_hierarchy(st) end if
  if id == ID_NAV_SYMBOL_INFO then return _show_symbol_info(st) end if
  if id == ID_NAV_CODE_INSPECTIONS then return _show_code_inspections(st) end if
  if id == ID_NAV_PROJECT_INDEX then return _show_project_index(st) end if
  if id == ID_NAV_PROJECT_SYMBOLS then return _show_project_symbols(st) end if
  if id == ID_NAV_GOTO_SYMBOL then return _open_goto_symbol_window(st) end if
  if id == ID_NAV_GOTO_LINE then return _open_goto_line_window(st) end if
  if id == ID_NAV_GOTO_DEFINITION then return _goto_definition(st) end if
  if id == ID_NAV_FIND_REFERENCES then return _find_references(st) end if
  if id == ID_NAV_SEARCH_WORD then return _search_current_word(st) end if
  if id == ID_NAV_PROBLEMS then return _show_problems(st) end if
  if id == ID_CTX_EDITOR_SELECT_ALL then return _edit_select_all(st) end if
  if id == ID_CTX_TAB_CLOSE then return _close_tab(st, st.context_tab) end if
  if id == ID_CTX_TAB_CLOSE_OTHERS then return _close_other_tabs(st) end if
  if id == ID_CTX_TAB_CLOSE_ALL then return _close_all_tabs(st) end if
  if id == ID_CTX_TREE_OPEN then return _open_selected_tree_file(st) end if
  if id == ID_CTX_TREE_NEW_FILE then return _new_tree_file(st) end if
  if id == ID_CTX_TREE_NEW_TEST then return _new_tree_test_file(st) end if
  if id == ID_CTX_TREE_NEW_FOLDER then return _new_tree_folder(st) end if
  if id == ID_CTX_TREE_RENAME then return _rename_tree_item(st) end if
  if id == ID_CTX_TREE_DELETE then return _delete_tree_item(st) end if
  if id == ID_CTX_TREE_COPY then return _copy_tree_item(st) end if
  if id == ID_CTX_TREE_PASTE then return _paste_tree_item(st) end if
  if id == ID_CTX_LOG_COPY then return _log_copy(st) end if
  if id == ID_CTX_LOG_SELECT_ALL then return _log_select_all(st) end if
  if id == ID_CTX_LOG_CLEAR then return _log_clear(st) end if
  if id == ID_CONFIG_COMPILE_SETTINGS then return _open_compile_settings_window(st) end if
  if id == ID_CONFIG_PROFILE_DEBUG then return _select_build_profile(st, "debug") end if
  if id == ID_CONFIG_PROFILE_RELEASE then return _select_build_profile(st, "release") end if
  if id == ID_CONFIG_THEME_DARK then return _select_theme(st, "dark") end if
  if id == ID_CONFIG_THEME_LIGHT then return _select_theme(st, "light") end if
  if id == ID_CONFIG_COMPILER_SELECT then return _select_compiler(st) end if
  if id == ID_CONFIG_COMPILER_RESET then return _reset_compiler(st) end if
  if id == ID_CONFIG_RELOAD then return _reload_config(st) end if
  if id == ID_CONFIG_TOGGLE_KEEP_GOING then return _toggle_keep_going(st) end if
  if id == ID_CONFIG_TOGGLE_MAX_ERRORS then return _toggle_max_errors(st) end if
  if id == ID_CONFIG_TOGGLE_SUBSYSTEM then return _toggle_subsystem(st) end if
  if id == ID_CONFIG_SHOW then return _show_config(st) end if
  if id == ID_HELP_WELCOME then return _show_welcome(st) end if
  if id == ID_HELP_LANGUAGE then return _open_language_help(st) end if
  if id == ID_HELP_LANGUAGE_SEARCH then return _open_language_help_search(st) end if
  if id == ID_HELP_ABOUT then return _about(st) end if
  if id == ID_FILE_EXIT then return _request_exit(st) end if
  if id == ID_WINDOW_MINIMIZE then
    win.ShowWindow(st.hwnd, win.SW_MINIMIZE)
    return st
  end if
  if id == ID_WINDOW_MAXIMIZE then
    win.ShowWindow(st.hwnd, win.SW_MAXIMIZE)
    st.last_w = 0
    st.last_h = 0
    return st
  end if
  if id == ID_WINDOW_RESTORE then
    win.ShowWindow(st.hwnd, win.SW_RESTORE)
    st.last_w = 0
    st.last_h = 0
    return st
  end if
  return st
end function

// Handle notify.
function _handle_notify(st, msg)
  id = win.notify_id(msg)
  code = win.notify_code(msg)
  if id == ID_PROJECT_TREE and code == win.NM_DBLCLK then
    pos = win.mouse_client(st.hwnd)
    return _open_tree_file_at(st, pos[0], pos[1])
  end if
  if id == ID_PROJECT_TREE and code == win.NM_RCLICK then
    pos = win.mouse_client(st.hwnd)
    return _handle_context_menu_at_force(st, pos[0], pos[1], true)
  end if
  if id == ID_EDITOR_TABS and code == win.TCN_SELCHANGE then
    return _handle_tab_selection(st)
  end if
  return st
end function

// Handle command.
function _handle_command(st, msg)
  id = win.msg_command_id(msg)
  if id == ID_RESULT_LIST and st.result_mode == "problems" and win.msg_command_notify(msg) == win.LBN_SELCHANGE then
    return _open_result_selection(st)
  end if
  if id == ID_RESULT_LIST and win.msg_command_notify(msg) == win.LBN_DBLCLK then
    return _open_result_selection(st)
  end if
  if id == ID_AUTOCOMPLETE_LIST and win.msg_command_notify(msg) == win.LBN_DBLCLK then
    return _accept_autocomplete(st)
  end if
  if win.msg_command_notify(msg) != 0 then return st end if
  return _perform_command(st, id)
end function

// Update cursor for mouse.
function _update_cursor_for_mouse(st, msg)
  hwnd = win.msg_hwnd(msg)
  if hwnd == st.tabbar or hwnd == st.toolbar_bg or _toolbar_command_for_hwnd(st, hwnd) != 0 or _menu_label_index_for_hwnd(st, hwnd) >= 0 then
    win.set_cursor_arrow()
  else if hwnd == st.log then
    if _mouse_over_log_diagnostic(st, win.msg_lparam_x(msg), win.msg_lparam_y(msg)) then
      win.set_cursor_hand()
    else
      win.set_cursor_ibeam()
    end if
  else if hwnd == st.editor and _active_is_markdown(st) then
    if typeof(markdown.link_at_editor(st, win.msg_lparam_x(msg), win.msg_lparam_y(msg))) == "struct" then
      win.set_cursor_hand()
    else
      win.set_cursor_ibeam()
    end if
  else if hwnd == st.result_list and st.result_mode == "problems" then
    win.set_cursor_hand()
  end if
  return st
end function

// Handle set cursor.
function _handle_set_cursor(st, msg)
  hwnd = win.msg_hwnd(msg)
  if hwnd == st.tabbar or hwnd == st.toolbar_bg or _toolbar_command_for_hwnd(st, hwnd) != 0 or _menu_label_index_for_hwnd(st, hwnd) >= 0 then
    win.set_cursor_arrow()
    return true
  end if
  if hwnd == st.log then
    pos = win.mouse_client(st.log)
    if _mouse_over_log_diagnostic(st, pos[0], pos[1]) then
      win.set_cursor_hand()
    else
      win.set_cursor_ibeam()
    end if
    return true
  end if
  if hwnd == st.editor and _active_is_markdown(st) then
    pos = win.mouse_client(st.editor)
    if typeof(markdown.link_at_editor(st, pos[0], pos[1])) == "struct" then
      win.set_cursor_hand()
    else
      win.set_cursor_ibeam()
    end if
    return true
  end if
  if hwnd == st.result_list and st.result_mode == "problems" then
    win.set_cursor_hand()
    return true
  end if
  return false
end function

// Handle window button.
function _handle_window_button(st, hit)
  if hit == win.HTCLOSE then
    return _request_exit(st)
  end if
  if hit == win.HTMINBUTTON then
    win.ShowWindow(st.hwnd, win.SW_MINIMIZE)
    return st
  end if
  if hit == win.HTMAXBUTTON then
    if win.IsZoomed(st.hwnd) then
      win.ShowWindow(st.hwnd, win.SW_RESTORE)
    else
      win.ShowWindow(st.hwnd, win.SW_MAXIMIZE)
    end if
    st.last_w = 0
    st.last_h = 0
    return st
  end if
  return st
end function

// Handle syscommand.
function _handle_syscommand(st, msg)
  code = win.msg_wparam_u32(msg)
  cmd = code & 0xFFF0
  if cmd == win.SC_CLOSE then
    return _request_exit(st)
  end if
  if cmd == win.SC_MINIMIZE then
    win.ShowWindow(st.hwnd, win.SW_MINIMIZE)
    return st
  end if
  if cmd == win.SC_MAXIMIZE then
    win.ShowWindow(st.hwnd, win.SW_MAXIMIZE)
    st.last_w = 0
    st.last_h = 0
    return st
  end if
  if cmd == win.SC_RESTORE then
    win.ShowWindow(st.hwnd, win.SW_RESTORE)
    st.last_w = 0
    st.last_h = 0
    return st
  end if
  return st
end function

// Handle hotkeys.
function _handle_hotkeys(st)
  ctrl = _ctrl_down()
  shift = _shift_down()
  alt = _alt_down()
  if alt and _key_pressed(st, win.VK_LEFT) then return _navigate_back(st) end if
  if alt and _key_pressed(st, win.VK_RIGHT) then return _navigate_forward(st) end if
  if alt and _key_pressed(st, win.VK_DOWN) then return _goto_bookmark(st, 1) end if
  if alt and _key_pressed(st, win.VK_UP) then return _goto_bookmark(st, -1) end if
  if alt and _key_pressed(st, win.VK_F1) then return _reveal_active_file(st) end if
  if ctrl and _key_pressed(st, win.VK_O) then return _open_project_dialog(st) end if
  if ctrl and _key_pressed(st, win.VK_A) then return _edit_select_all(st) end if
  if ctrl and _key_pressed(st, win.VK_E) then return _show_recent_files(st) end if
  if ctrl and shift and _key_pressed(st, win.VK_S) then return _save_all(st) end if
  if ctrl and _key_pressed(st, win.VK_S) then return _save_current(st) end if
  if ctrl and _key_pressed(st, win.VK_X) then return _edit_cut(st) end if
  if ctrl and _key_pressed(st, win.VK_C) then return _edit_copy(st) end if
  if ctrl and _key_pressed(st, win.VK_F) then return _open_find_window(st) end if
  if ctrl and _key_pressed(st, win.VK_G) then return _open_goto_line_window(st) end if
  if ctrl and shift and _key_pressed(st, win.VK_P) then return _open_command_palette(st) end if
  if ctrl and _key_pressed(st, win.VK_P) then return _open_quick_open_window(st) end if
  if ctrl and _key_pressed(st, win.VK_T) then return _open_goto_symbol_window(st) end if
  if ctrl and _key_pressed(st, win.VK_V) then return _edit_paste(st) end if
  if ctrl and _key_pressed(st, win.VK_SPACE) then return _autocomplete(st) end if
  if ctrl and shift and _key_pressed(st, win.VK_F7) then return _run_related_test_file(st) end if
  if ctrl and _key_pressed(st, win.VK_F7) then return _run_current_test_file(st) end if
  if ctrl and _key_pressed(st, win.VK_F2) then return _toggle_bookmark(st) end if
  if ctrl and _key_pressed(st, win.VK_F12) then return _open_file_structure_window(st) end if
  if shift and _key_pressed(st, win.VK_F2) then return _show_bookmarks(st) end if
  if _key_pressed(st, win.VK_F2) then return _open_rename_symbol_window(st) end if
  if _key_pressed(st, win.VK_F3) then return _find_next(st) end if
  if _key_pressed(st, win.VK_F5) then return _build_project(st) end if
  if _key_pressed(st, win.VK_F6) then return _run_project(st) end if
  if _key_pressed(st, win.VK_F7) then return _run_tests(st) end if
  if shift and _key_pressed(st, win.VK_F12) then return _find_references(st) end if
  if _key_pressed(st, win.VK_F12) then return _goto_definition(st) end if
  return st
end function

// Return the toolbar command at the requested location.
function _toolbar_command_at(mx, my)
  toolbar_y = MENU_H + 5
  button_h = 32
  gap = 6
  if my < toolbar_y or my >= toolbar_y + button_h then return 0 end if
  x = STATUS_PAD
  if mx >= x and mx < x + 92 then return ID_FILE_OPEN_PROJECT end if
  x = x + 92 + gap
  if mx >= x and mx < x + 104 then return ID_FILE_SAVE end if
  x = x + 104 + gap
  if mx >= x and mx < x + 92 then return ID_FILE_BUILD end if
  x = x + 92 + gap
  if mx >= x and mx < x + 78 then return ID_FILE_RUN end if
  x = x + 78 + gap
  if mx >= x and mx < x + 82 then return ID_FILE_TEST end if
  x = x + 82 + gap
  if mx >= x and mx < x + 92 then return ID_FILE_RELOAD end if
  x = x + 92 + (gap * 3)
  if mx >= x and mx < x + 78 then return ID_EDIT_CUT end if
  x = x + 78 + gap
  if mx >= x and mx < x + 82 then return ID_EDIT_COPY end if
  x = x + 82 + gap
  if mx >= x and mx < x + 82 then return ID_EDIT_PASTE end if
  return 0
end function

// Return the top menu at the requested location.
function _top_menu_at(mx, my)
  if my < 0 or my >= MENU_H then return -1 end if
  if mx >= 8 and mx < 62 then return 0 end if
  if mx >= 66 and mx < 152 then return 1 end if
  if mx >= 156 and mx < 242 then return 2 end if
  if mx >= 246 and mx < 356 then return 3 end if
  if mx >= 360 and mx < 414 then return 4 end if
  return -1
end function

// Return the toolbar command for a window handle.
function _toolbar_command_for_hwnd(st, hwnd)
  // Walk collections defensively because project data can be partially populated.
  if hwnd == st.btn_open then return ID_FILE_OPEN_PROJECT end if
  if hwnd == st.btn_save then return ID_FILE_SAVE end if
  if hwnd == st.btn_build then return ID_FILE_BUILD end if
  if hwnd == st.btn_run then return ID_FILE_RUN end if
  if hwnd == st.btn_test then return ID_FILE_TEST end if
  if hwnd == st.btn_reload then return ID_FILE_RELOAD end if
  if hwnd == st.btn_cut then return ID_EDIT_CUT end if
  if hwnd == st.btn_copy then return ID_EDIT_COPY end if
  if hwnd == st.btn_paste then return ID_EDIT_PASTE end if
  if typeof(st.toolbar_icons) == "array" then
    cmds = [ID_FILE_OPEN_PROJECT, ID_FILE_SAVE, ID_FILE_BUILD, ID_FILE_RUN, ID_FILE_TEST, ID_FILE_RELOAD, ID_EDIT_CUT, ID_EDIT_COPY, ID_EDIT_PASTE]
    for i = 0 to len(st.toolbar_icons) - 1
      if i < len(cmds) and hwnd == st.toolbar_icons[i] then return cmds[i] end if
    end for
  end if
  return 0
end function

// Return the toolbar button window handle.
function _toolbar_button_hwnd(st, hwnd)
  if hwnd == st.btn_open then return true end if
  if hwnd == st.btn_save then return true end if
  if hwnd == st.btn_build then return true end if
  if hwnd == st.btn_run then return true end if
  if hwnd == st.btn_test then return true end if
  if hwnd == st.btn_reload then return true end if
  if hwnd == st.btn_cut then return true end if
  if hwnd == st.btn_copy then return true end if
  if hwnd == st.btn_paste then return true end if
  return false
end function

// Return the toolbar icon window handle.
function _toolbar_icon_hwnd(st, hwnd)
  // Walk collections defensively because project data can be partially populated.
  if typeof(st.toolbar_icons) != "array" then return false end if
  for i = 0 to len(st.toolbar_icons) - 1
    if hwnd == st.toolbar_icons[i] then return true end if
  end for
  return false
end function

// Return the toolbar glyph window handle.
function _toolbar_glyph_hwnd(st, hwnd)
  // Walk collections defensively because project data can be partially populated.
  if typeof(st.toolbar_icons) != "array" then return false end if
  max = len(st.toolbar_icons)
  if max > 9 then max = 9 end if
  for i = 0 to max - 1
    if hwnd == st.toolbar_icons[i] then return true end if
  end for
  return false
end function

// Extract the toolbar command from a Win32 message.
function _toolbar_command_from_message(st, msg)
  cmd = _toolbar_command_for_hwnd(st, win.msg_hwnd(msg))
  if cmd != 0 then return cmd end if
  pos = win.mouse_client(st.hwnd)
  return _toolbar_command_at(pos[0], pos[1])
end function

// Handle left click.
function _handle_left_click(st, mx, my)
  cmd = _toolbar_command_at(mx, my)
  if cmd != 0 then return _perform_command(st, cmd) end if
  return st
end function

// Handle mouse.
function _handle_mouse(st)
  left = win.key_down(win.VK_LBUTTON)
  right = win.key_down(win.VK_RBUTTON)
  left_event = win.key_pressed_event(win.VK_LBUTTON)
  left_released = left == false and st.prev_mouse
  st.prev_mouse = left
  st.prev_right_mouse = right
  if win.is_foreground(st.hwnd) and (left_released or left_event) then
    pos = win.mouse_client(st.hwnd)
    log_y = st.last_h - LOG_H
    if log_y < TOOL_H + TAB_H + 100 then log_y = TOOL_H + TAB_H + 100 end if
    if pos[0] < LEFT_W and pos[1] >= TOOL_H and pos[1] < log_y then
      return _handle_tree_click(st, true, pos[0], pos[1])
    end if
  end if
  return st
end function

// Run the Win32 message loop and dispatch MiniIDE UI events.
function _pump_messages(st)
  // Run a local message loop so the modal UI stays responsive.
  msg = bytes(48, 0)
  while win.PeekMessageW(msg, void, 0, 0, win.PM_REMOVE)
    code = win.msg_message(msg)
    handled = false

    if code == win.WM_QUIT then
      st.running = false
      handled = true
    else if code == win.WM_CLOSE then
      if win.msg_hwnd(msg) == st.hwnd then
        st = _request_exit(st)
        handled = true
      end if
    else if code == win.WM_DESTROY or code == win.WM_NCDESTROY then
      if win.msg_hwnd(msg) == st.hwnd then
        st.running = false
        handled = true
      end if
    else if code == win.WM_COMMAND then
      st = _handle_command(st, msg)
      handled = true
    else if code == win.WM_NOTIFY then
      st = _handle_notify(st, msg)
      handled = true
    else if code == win.WM_SETCURSOR then
      handled = _handle_set_cursor(st, msg)
    else if code == win.WM_LBUTTONDBLCLK then
      if win.msg_hwnd(msg) == st.line_numbers then
        win.SetFocus(st.editor)
        handled = true
      else if win.msg_hwnd(msg) == st.log then
        st = _open_log_diagnostic_at(st, win.msg_lparam_x(msg), win.msg_lparam_y(msg))
        handled = true
      else if win.msg_hwnd(msg) == st.tree then
        mx = win.msg_lparam_x(msg) + STATUS_PAD
        my = win.msg_lparam_y(msg) + TOOL_H
        st = _open_tree_file_at(st, mx, my)
        handled = true
      else
        pos = win.mouse_client(st.hwnd)
        st = _open_tree_file_at(st, pos[0], pos[1])
      end if
    else if code == win.WM_LBUTTONDOWN or code == win.WM_MOUSEMOVE or code == win.WM_RBUTTONDOWN then
      if code == win.WM_MOUSEMOVE then
        st = _update_cursor_for_mouse(st, msg)
      end if
      if code == win.WM_RBUTTONDOWN and win.msg_hwnd(msg) == st.tree then
        mx = win.msg_lparam_x(msg) + STATUS_PAD
        my = win.msg_lparam_y(msg) + TOOL_H
        st = _select_tree_item_at(st, mx, my)
        handled = true
      else if code == win.WM_LBUTTONDOWN and _menu_label_index_for_hwnd(st, win.msg_hwnd(msg)) >= 0 then
        handled = true
      else if code == win.WM_LBUTTONDOWN and _toolbar_command_for_hwnd(st, win.msg_hwnd(msg)) != 0 then
        handled = true
      else if code == win.WM_LBUTTONDOWN and win.msg_hwnd(msg) == st.hwnd and _toolbar_command_at(win.msg_lparam_x(msg), win.msg_lparam_y(msg)) != 0 then
        handled = true
      else if code == win.WM_LBUTTONDOWN and win.msg_hwnd(msg) == st.hwnd and _top_menu_at(win.msg_lparam_x(msg), win.msg_lparam_y(msg)) >= 0 then
        handled = true
      else if win.msg_hwnd(msg) == st.line_numbers then
        win.SetFocus(st.editor)
        handled = true
      end if
    else if code == win.WM_KEYDOWN then
      key = win.msg_wparam_u32(msg)
      ctrl = win.key_down(win.VK_CONTROL)
      if ctrl and key == win.VK_Z then
        st = _edit_undo(st)
        handled = true
      else if ctrl and key == win.VK_Y then
        st = _edit_redo(st)
        handled = true
      else if win.msg_hwnd(msg) == st.autocomplete_list and key == win.VK_RETURN then
        st = _accept_autocomplete(st)
        handled = true
      else if win.msg_hwnd(msg) == st.autocomplete_list and key == win.VK_ESCAPE then
        st = _hide_autocomplete(st)
        win.SetFocus(st.editor)
        handled = true
      else
        if win.msg_hwnd(msg) == st.editor and (key == win.VK_BACK or key == win.VK_DELETE) then
          st = _record_edit_activity(st)
        end if
      end if
    else if code == win.WM_CHAR then
      if win.msg_hwnd(msg) == st.editor then st = _record_edit_activity(st) end if
    else if code == win.WM_LBUTTONUP then
      menu_idx = _menu_label_index_for_hwnd(st, win.msg_hwnd(msg))
      if menu_idx < 0 and win.msg_hwnd(msg) == st.hwnd then menu_idx = _top_menu_at(win.msg_lparam_x(msg), win.msg_lparam_y(msg)) end if
      if menu_idx >= 0 then
        st = _show_top_menu(st, menu_idx)
        handled = true
      end if
      cmd = 0
      if handled == false then cmd = _toolbar_command_for_hwnd(st, win.msg_hwnd(msg)) end if
      if cmd != 0 then
        st = _perform_command(st, cmd)
        handled = true
      end if
      if handled == false then
        if win.msg_hwnd(msg) == st.tabbar then
          st = _handle_tab_click(st, win.msg_lparam_x(msg), win.msg_lparam_y(msg))
          handled = true
        else if win.msg_hwnd(msg) == st.editor and _active_is_markdown(st) and typeof(markdown.link_at_editor(st, win.msg_lparam_x(msg), win.msg_lparam_y(msg))) == "struct" then
          st = markdown.open_link_at(st, win.msg_lparam_x(msg), win.msg_lparam_y(msg))
          handled = true
        else if win.msg_hwnd(msg) == st.line_numbers then
          win.SetFocus(st.editor)
          handled = true
        else if win.msg_hwnd(msg) == st.log and _mouse_over_log_diagnostic(st, win.msg_lparam_x(msg), win.msg_lparam_y(msg)) then
          st = _open_log_diagnostic_at(st, win.msg_lparam_x(msg), win.msg_lparam_y(msg))
          handled = true
        else if win.msg_hwnd(msg) == st.result_list and st.result_mode == "problems" then
          st = _open_result_selection(st)
          handled = true
        else if win.msg_hwnd(msg) == st.hwnd then
          st = _handle_left_click(st, win.msg_lparam_x(msg), win.msg_lparam_y(msg))
          handled = true
        end if
      end if
    else if code == win.WM_MOUSEWHEEL then
      if win.msg_hwnd(msg) == st.line_numbers then
        win.SendMessageW(st.editor, win.WM_MOUSEWHEEL, win.msg_wparam_u32(msg), 0)
        handled = true
      end if
    else if code == win.WM_MBUTTONUP then
      if win.msg_hwnd(msg) == st.tabbar then
        idx = _tab_at(st, win.msg_lparam_x(msg) + LEFT_W, win.msg_lparam_y(msg) + TOOL_H)
        st = _close_tab(st, idx)
        handled = true
      end if
    else if code == win.WM_RBUTTONUP then
      if win.msg_hwnd(msg) == st.tree then
        mx = win.msg_lparam_x(msg) + STATUS_PAD
        my = win.msg_lparam_y(msg) + TOOL_H
        st = _handle_context_menu_at_force(st, mx, my, true)
      else if win.msg_hwnd(msg) == st.tabbar then
        mx = win.msg_lparam_x(msg) + LEFT_W
        my = win.msg_lparam_y(msg) + TOOL_H
        st = _handle_context_menu_at(st, mx, my)
      else
        st = _handle_context_menu(st)
      end if
      handled = true
    else if code == win.WM_CONTEXTMENU then
      if win.msg_hwnd(msg) == st.tree then
        pos = win.mouse_client(st.hwnd)
        st = _handle_context_menu_at_force(st, pos[0], pos[1], true)
      else if win.msg_hwnd(msg) == st.tabbar then
        pos = win.mouse_client(st.hwnd)
        st = _handle_context_menu_at(st, pos[0], pos[1])
      else
        st = _handle_context_menu(st)
      end if
      handled = true
    else if code == win.WM_SYSCOMMAND then
      cmd = win.msg_wparam_u32(msg) & 0xFFF0
      if win.msg_hwnd(msg) == st.hwnd and (cmd == win.SC_CLOSE or cmd == win.SC_MINIMIZE or cmd == win.SC_MAXIMIZE or cmd == win.SC_RESTORE) then
        st = _handle_syscommand(st, msg)
        handled = true
      end if
    else if code == win.WM_NCLBUTTONDOWN then
      hit = win.msg_wparam_u32(msg)
      if win.msg_hwnd(msg) == st.hwnd and (hit == win.HTCLOSE or hit == win.HTMINBUTTON or hit == win.HTMAXBUTTON) then
        st = _handle_window_button(st, hit)
        handled = true
      end if
    end if

    if handled == false then
      win.TranslateMessage(msg)
      win.DispatchMessageW(msg)
    end if
  end while
  return st
end function

// Return the default project root used at startup.
function _default_root(args)
  if typeof(args) == "array" and len(args) > 0 and typeof(args[0]) == "string" and args[0] != "" then
    return args[0]
  end if
  if fs.exists("MiniIDE.mlproj") then return "." end if
  if fs.exists("..\\MiniIDE.mlproj") then return ".." end if
  return "."
end function

// Initialize MiniIDE, open the initial project, and start the message loop.
function _run(root)
  st = _create_state(root)
  if st.hwnd is void then
    win.MessageBoxW(void, "MiniIDE: failed to create window", "MiniIDE", 0)
    return 1
  end if

  while st.running
    st = _pump_messages(st)
    if st.running == false then break end if
    st = _layout(st)
    st = _handle_hotkeys(st)
    st = _handle_mouse(st)
    st = _check_editor_dirty(st)
    st = _poll_build(st)
    st = _update_editor_aux(st)
    win.Sleep(15)
  end while
  return 0
end function

// Run the program entry point.
function main(args)
  root = _default_root(args)
  result = try(_run(root))
  if typeof(result) == "error" then
    msg = "MiniIDE crashed."
    if typeof(result.message) == "string" and result.message != "" then
      msg = msg + "\n\n" + result.message
    end if
    win.MessageBoxW(void, msg, "MiniIDE", 0)
    return 1
  end if
  return result
end function
