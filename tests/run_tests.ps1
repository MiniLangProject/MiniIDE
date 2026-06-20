# Copyright 2026 Nils Kopal
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

param(
  [switch]$Fast,
  [switch]$SkipUi,
  [switch]$KeepArtifacts
)

$ErrorActionPreference = "Stop"
$Root = (Resolve-Path (Join-Path $PSScriptRoot "..")).Path
$TempRoot = Join-Path $env:TEMP ("mide-" + [guid]::NewGuid().ToString("N").Substring(0, 8))
$Compiler = Join-Path $Root "MiniLangCompilerML\build\mlc_win64.exe"
$MiniIdeExe = Join-Path $Root "build\MiniIDE.exe"
$CompiledMiniIdeExe = $null

# Assert a test condition and stop the test run with a clear message on failure.
function Assert-True($Condition, $Message) {
  if (-not $Condition) {
    throw $Message
  }
}

# Run one named test step while printing progress to the console.
function Step($Name, [scriptblock]$Body) {
  Write-Host "[test] $Name"
  & $Body
}

# Create a fresh temporary directory and refuse unsafe deletion targets.
function New-CleanDir($Path) {
  if (Test-Path -LiteralPath $Path) {
    $resolved = (Resolve-Path -LiteralPath $Path).Path
    Assert-True ($resolved.StartsWith($env:TEMP, [System.StringComparison]::OrdinalIgnoreCase)) "Refusing to remove non-temp path: $resolved"
    Remove-Item -LiteralPath $resolved -Recurse -Force
  }
  New-Item -ItemType Directory -Force -Path $Path | Out-Null
}

# Remove a temporary directory with retries for slow Windows file handles.
function Remove-WithRetry($Path) {
  if (-not (Test-Path -LiteralPath $Path)) { return }
  $resolved = (Resolve-Path -LiteralPath $Path).Path
  Assert-True ($resolved.StartsWith($env:TEMP, [System.StringComparison]::OrdinalIgnoreCase)) "Refusing to remove non-temp path: $resolved"
  for ($i = 0; $i -lt 8; $i++) {
    try {
      Remove-Item -LiteralPath $resolved -Recurse -Force -ErrorAction Stop
      return
    }
    catch {
      Start-Sleep -Milliseconds 250
    }
  }
  Remove-Item -LiteralPath $resolved -Recurse -Force
}

# Run a command, capture output, and fail when the exit code is nonzero.
function Invoke-Checked($File, [string[]]$Arguments, $WorkingDirectory) {
  Push-Location $WorkingDirectory
  try {
    & $File @Arguments
    $exit = $LASTEXITCODE
  }
  finally {
    Pop-Location
  }
  if ($exit -ne 0) {
    throw "Command failed ($exit): $File $($Arguments -join ' ')"
  }
  return "OK: wrote"
}

# Run a command with a timeout so compiler backend hangs do not stall the whole suite.
function Invoke-CheckedTimed($File, [string[]]$Arguments, $WorkingDirectory, [int]$TimeoutSeconds) {
  $name = "proc-" + [guid]::NewGuid().ToString("N")
  $stdout = Join-Path $TempRoot ($name + ".out")
  $stderr = Join-Path $TempRoot ($name + ".err")
  $p = Start-Process -FilePath $File -ArgumentList $Arguments -WorkingDirectory $WorkingDirectory -RedirectStandardOutput $stdout -RedirectStandardError $stderr -NoNewWindow -PassThru
  if (-not $p.WaitForExit($TimeoutSeconds * 1000)) {
    try { $p.Kill() } catch {}
    throw "Command timed out after ${TimeoutSeconds}s: $File $($Arguments -join ' ')"
  }
  $p.WaitForExit() | Out-Null
  $p.Refresh()
  $out = ""
  if (Test-Path -LiteralPath $stdout) { $out += Get-Content -LiteralPath $stdout -Raw }
  if (Test-Path -LiteralPath $stderr) { $out += Get-Content -LiteralPath $stderr -Raw }
  $exitCode = $p.ExitCode
  if ($null -eq $exitCode) {
    if ($out -match "OK: wrote") {
      $exitCode = 0
    }
    else {
      throw "Command finished without exit code: $File $($Arguments -join ' ')`n$out"
    }
  }
  if ($exitCode -ne 0) {
    throw "Command failed ($exitCode): $File $($Arguments -join ' ')`n$out"
  }
  return $out
}

# Verify static source wiring that should not regress silently.
function Test-StaticWiring {
  $main = Get-Content -LiteralPath (Join-Path $Root "src\main.ml") -Raw
  $build = Get-Content -LiteralPath (Join-Path $Root "src\build\build_service.ml") -Raw
  $service = Get-Content -LiteralPath (Join-Path $Root "src\lang\service.ml") -Raw
  $win32 = Get-Content -LiteralPath (Join-Path $Root "src\platform\win32.ml") -Raw

  $ids = [regex]::Matches($main, 'const\s+(ID_[A-Z0-9_]+)\s*=\s*(\d+)') |
    ForEach-Object { [pscustomobject]@{ Name = $_.Groups[1].Value; Value = [int]$_.Groups[2].Value } }
  $dupes = $ids | Group-Object Value | Where-Object { $_.Count -gt 1 }
  Assert-True ($dupes.Count -eq 0) ("Duplicate command IDs: " + (($dupes | ForEach-Object { $_.Name }) -join ", "))

  $menuIds = [regex]::Matches($main, 'AppendMenuWId\([^`n]*win\.MF_STRING,\s*(ID_[A-Z0-9_]+)') |
    ForEach-Object { $_.Groups[1].Value } | Sort-Object -Unique
  $handled = [regex]::Matches($main, 'if\s+id\s*==\s*(ID_[A-Z0-9_]+)') |
    ForEach-Object { $_.Groups[1].Value } | Sort-Object -Unique
  $missing = @($menuIds | Where-Object { $_ -notin $handled })
  Assert-True ($missing.Count -eq 0) ("Menu IDs without _perform_command dispatch: " + ($missing -join ", "))

  Assert-True ($main.Contains("start_compile_with_options")) "Build command does not use configurable build options."
  Assert-True ($main.Contains("ID_FILE_RUN")) "Run command is missing."
  Assert-True ($main.Contains("ID_FILE_TEST")) "Test command is missing."
  Assert-True ($main.Contains("ID_FILE_TEST_CURRENT")) "Run Current Test File command is missing."
  Assert-True ($main.Contains('Run Current Test &File\tCtrl+F7')) "Run Current Test File menu item is missing."
  Assert-True ($main.Contains("_run_current_test_file")) "Run Current Test File handler is missing."
  Assert-True ($main.Contains("_start_current_test_compile_job")) "Run Current Test File compile job is missing."
  Assert-True ($main.Contains("ctrl and _key_pressed(st, win.VK_F7)")) "Ctrl+F7 Run Current Test File hotkey wiring is missing."
  Assert-True ($main.Contains("Build: Run Current Test File")) "Command palette must expose Run Current Test File."
  Assert-True ($main.Contains("ID_FILE_TEST_RELATED")) "Run Related Test File command is missing."
  Assert-True ($main.Contains('Run &Related Test File\tCtrl+Shift+F7')) "Run Related Test File menu item is missing."
  Assert-True ($main.Contains("_run_related_test_file")) "Run Related Test File handler is missing."
  Assert-True ($main.Contains("_start_related_test_compile_job")) "Run Related Test File compile job is missing."
  Assert-True ($main.Contains("lang_service.related_test_file")) "Run Related Test File must use the language service facade."
  Assert-True ($main.Contains("ctrl and shift and _key_pressed(st, win.VK_F7)")) "Ctrl+Shift+F7 Run Related Test File hotkey wiring is missing."
  Assert-True ($main.Contains("Build: Run Related Test File")) "Command palette must expose Run Related Test File."
  Assert-True ($main.Contains("ID_FILE_CLEAN")) "Clean command is missing."
  Assert-True ($main.Contains("ID_FILE_REBUILD")) "Rebuild command is missing."
  Assert-True ($main.Contains("ID_FILE_STOP")) "Stop command is missing."
  Assert-True ($main.Contains("ID_CONFIG_PROFILE_DEBUG")) "Debug build profile command is missing."
  Assert-True ($main.Contains("ID_CONFIG_PROFILE_RELEASE")) "Release build profile command is missing."
  Assert-True ($main.Contains("ID_CONFIG_THEME_DARK")) "Dark theme command is missing."
  Assert-True ($main.Contains("ID_CONFIG_THEME_LIGHT")) "Light theme command is missing."
  Assert-True ($main.Contains("_apply_theme")) "Theme application function is missing."
  Assert-True ($main.Contains("_load_theme_mode")) "Theme config loader is missing."
  Assert-True ($main.Contains("_create_tab_strip")) "Themeable custom tab strip is missing."
  Assert-True ($main.Contains("_create_toolbar_button")) "Themeable ribbon buttons are missing."
  Assert-True ($main.Contains("ID_FILE_QUICK_OPEN")) "Quick Open command is missing."
  Assert-True ($main.Contains('Quick Open &File...\tCtrl+P')) "Quick Open menu item is missing."
  Assert-True ($main.Contains("_open_quick_open_window")) "Quick Open dialog is missing."
  Assert-True ($main.Contains("_quick_open_query")) "Quick Open query helper is missing."
  Assert-True ($main.Contains("lang_service.file_items")) "Quick Open must use the language service facade."
  Assert-True ($main.Contains("ID_FILE_RECENT_FILES")) "Recent Files command is missing."
  Assert-True ($main.Contains('Recent Fil&es\tCtrl+E')) "Recent Files menu item is missing."
  Assert-True ($main.Contains("_show_recent_files")) "Recent Files renderer is missing."
  Assert-True ($main.Contains('"recent-files"')) "Recent Files result mode is missing."
  Assert-True ($main.Contains("ctrl and _key_pressed(st, win.VK_E)")) "Ctrl+E Recent Files hotkey wiring is missing."
  Assert-True ($main.Contains("File: Recent Files")) "Command palette must expose Recent Files."
  Assert-True ($win32.Contains("VK_E")) "E key constant is missing."
  Assert-True ($main.Contains("ID_FILE_SAVE_ALL")) "Save All command is missing."
  Assert-True ($main.Contains('Save &All\tCtrl+Shift+S')) "Save All menu item is missing."
  Assert-True ($main.Contains("_save_all_open")) "Save All shared implementation is missing."
  Assert-True ($main.Contains("function _save_all(st)")) "Save All command handler is missing."
  Assert-True ($main.Contains("ctrl and shift and _key_pressed(st, win.VK_S)")) "Ctrl+Shift+S Save All hotkey is missing."
  Assert-True ($main.Contains("File: Save All")) "Command palette must expose Save All."
  Assert-True ($main.Contains("ID_FILE_NEW_PROJECT")) "New standard project command is missing."
  Assert-True ($main.Contains("ID_NAV_OUTLINE")) "Outline command is missing."
  Assert-True ($main.Contains("ID_NAV_BACK")) "Navigation Back command is missing."
  Assert-True ($main.Contains("ID_NAV_FORWARD")) "Navigation Forward command is missing."
  Assert-True ($main.Contains("ID_NAV_TOGGLE_BOOKMARK")) "Toggle Bookmark command is missing."
  Assert-True ($main.Contains("ID_NAV_BOOKMARKS")) "Bookmarks command is missing."
  Assert-True ($main.Contains("ID_NAV_NEXT_BOOKMARK")) "Next Bookmark command is missing."
  Assert-True ($main.Contains("ID_NAV_PREV_BOOKMARK")) "Previous Bookmark command is missing."
  Assert-True ($main.Contains("ID_NAV_FILE_STRUCTURE")) "File Structure command is missing."
  Assert-True ($main.Contains("ID_NAV_REVEAL_ACTIVE_FILE")) "Reveal Active File command is missing."
  Assert-True ($main.Contains('Navigate &Back\tAlt+Left')) "Navigation Back menu item is missing."
  Assert-True ($main.Contains('Navigate &Forward\tAlt+Right')) "Navigation Forward menu item is missing."
  Assert-True ($main.Contains('Toggle &Bookmark\tCtrl+F2')) "Toggle Bookmark menu item is missing."
  Assert-True ($main.Contains('&Bookmarks\tShift+F2')) "Bookmarks menu item is missing."
  Assert-True ($main.Contains('Next Bookmark\tAlt+Down')) "Next Bookmark menu item is missing."
  Assert-True ($main.Contains('Previous Bookmark\tAlt+Up')) "Previous Bookmark menu item is missing."
  Assert-True ($main.Contains('Reveal Active &File\tAlt+F1')) "Reveal Active File menu item is missing."
  Assert-True ($main.Contains('File &Structure\tCtrl+F12')) "File Structure menu item is missing."
  Assert-True ($main.Contains("_navigate_back")) "Navigation Back handler is missing."
  Assert-True ($main.Contains("_navigate_forward")) "Navigation Forward handler is missing."
  Assert-True ($main.Contains("_toggle_bookmark")) "Toggle Bookmark handler is missing."
  Assert-True ($main.Contains("_show_bookmarks")) "Bookmarks renderer is missing."
  Assert-True ($main.Contains("_goto_bookmark")) "Bookmark jump handler is missing."
  Assert-True ($main.Contains("_open_file_structure_window")) "File Structure command handler is missing."
  Assert-True ($main.Contains("return _show_outline(st)")) "File Structure must reuse the current-file outline view."
  Assert-True ($main.Contains("_reveal_active_file")) "Reveal Active File handler is missing."
  Assert-True ($main.Contains("win.tree_select(st.tree")) "Reveal Active File must select the project tree item."
  Assert-True ($main.Contains("Reveal Active File:")) "Reveal Active File status messages are missing."
  Assert-True ($main.Contains('"bookmarks"')) "Bookmarks result mode is missing."
  Assert-True ($main.Contains("_record_navigation")) "Navigation history recorder is missing."
  Assert-True ($main.Contains("NavLocation")) "Navigation history location struct is missing."
  Assert-True ($main.Contains("nav_back")) "Navigation back stack is missing."
  Assert-True ($main.Contains("nav_forward")) "Navigation forward stack is missing."
  Assert-True ($main.Contains("bookmarks")) "Bookmarks state is missing."
  Assert-True ($main.Contains("alt and _key_pressed(st, win.VK_LEFT)")) "Alt+Left navigation hotkey is missing."
  Assert-True ($main.Contains("alt and _key_pressed(st, win.VK_RIGHT)")) "Alt+Right navigation hotkey is missing."
  Assert-True ($main.Contains("ctrl and _key_pressed(st, win.VK_F2)")) "Ctrl+F2 Toggle Bookmark hotkey is missing."
  Assert-True ($main.Contains("shift and _key_pressed(st, win.VK_F2)")) "Shift+F2 Bookmarks hotkey is missing."
  Assert-True ($main.Contains("alt and _key_pressed(st, win.VK_DOWN)")) "Alt+Down Next Bookmark hotkey is missing."
  Assert-True ($main.Contains("alt and _key_pressed(st, win.VK_UP)")) "Alt+Up Previous Bookmark hotkey is missing."
  Assert-True ($main.Contains("alt and _key_pressed(st, win.VK_F1)")) "Alt+F1 Reveal Active File hotkey is missing."
  Assert-True ($main.Contains("ctrl and _key_pressed(st, win.VK_F12)")) "Ctrl+F12 File Structure hotkey is missing."
  Assert-True ($main.Contains("Navigation: Back")) "Command palette must expose Navigation Back."
  Assert-True ($main.Contains("Navigation: Forward")) "Command palette must expose Navigation Forward."
  Assert-True ($main.Contains("Navigation: Toggle Bookmark")) "Command palette must expose Toggle Bookmark."
  Assert-True ($main.Contains("Navigation: Bookmarks")) "Command palette must expose Bookmarks."
  Assert-True ($main.Contains("Navigation: Next Bookmark")) "Command palette must expose Next Bookmark."
  Assert-True ($main.Contains("Navigation: Previous Bookmark")) "Command palette must expose Previous Bookmark."
  Assert-True ($main.Contains("Navigation: Reveal Active File")) "Command palette must expose Reveal Active File."
  Assert-True ($main.Contains("Navigation: File Structure")) "Command palette must expose File Structure."
  Assert-True ($win32.Contains("VK_MENU")) "Alt key constant is missing."
  Assert-True ($win32.Contains("VK_F1")) "F1 key support is missing."
  Assert-True ($main.Contains("ID_NAV_WORKSPACE_HEALTH")) "Workspace health command is missing."
  Assert-True ($main.Contains("ID_NAV_TODOS")) "TODO navigation command is missing."
  Assert-True ($main.Contains("ID_NAV_TEST_EXPLORER")) "Test Explorer command is missing."
  Assert-True ($main.Contains("ID_NAV_RELATED_TESTS")) "Related Tests command is missing."
  Assert-True ($main.Contains("ID_NAV_IMPORT_GRAPH")) "Import Graph command is missing."
  Assert-True ($main.Contains("ID_NAV_CALL_HIERARCHY")) "Call Hierarchy command is missing."
  Assert-True ($main.Contains("ID_NAV_SYMBOL_INFO")) "Symbol Info command is missing."
  Assert-True ($main.Contains("ID_NAV_CODE_INSPECTIONS")) "Code Inspections command is missing."
  Assert-True ($main.Contains("ID_NAV_PROJECT_INDEX")) "Project index command is missing."
  Assert-True ($main.Contains("ID_NAV_PROJECT_SYMBOLS")) "Project symbols command is missing."
  Assert-True ($main.Contains("ID_NAV_GOTO_SYMBOL")) "Go to symbol command is missing."
  Assert-True ($main.Contains("ID_NAV_GOTO_LINE")) "Go to line command is missing."
  Assert-True ($main.Contains("ID_NAV_GOTO_DEFINITION")) "Go to definition command is missing."
  Assert-True ($main.Contains("ID_NAV_FIND_REFERENCES")) "Find references command is missing."
  Assert-True ($main.Contains("ID_NAV_PROBLEMS")) "Problems command is missing."
  Assert-True ($main.Contains("lang_service.diagnostics")) "Problems must include language service diagnostics."
  Assert-True ($main.Contains("ID_RESULT_LIST")) "Clickable result panel is missing."
  Assert-True ($main.Contains("_open_result_selection")) "Result panel double-click handler is missing."
  Assert-True ($main.Contains("_goto_line_col")) "Result navigation must jump to line and column."
  Assert-True ($main.Contains("result_cols")) "Result navigation must preserve diagnostic columns."
  Assert-True ($main.Contains("_show_result_panel")) "Result panel renderer is missing."
  Assert-True ($main.Contains("_show_workspace_health")) "Workspace health renderer is missing."
  Assert-True ($main.Contains("lang_service.workspace_health_lines")) "Workspace health must use the language service facade."
  Assert-True ($main.Contains("_show_todos")) "TODO renderer is missing."
  Assert-True ($main.Contains("lang_service.todo_items")) "TODO renderer must use the language service facade."
  Assert-True ($main.Contains("_show_test_explorer")) "Test Explorer renderer is missing."
  Assert-True ($main.Contains("lang_service.test_items")) "Test Explorer must use the language service facade."
  Assert-True ($main.Contains("_show_related_tests")) "Related Tests renderer is missing."
  Assert-True ($main.Contains("lang_service.related_test_items")) "Related Tests must use the language service facade."
  Assert-True ($service.Contains("related_test_file")) "Language service related test file picker is missing."
  Assert-True ($main.Contains("_show_import_graph")) "Import Graph renderer is missing."
  Assert-True ($main.Contains("lang_service.import_items")) "Import Graph must use the language service facade."
  Assert-True ($main.Contains("_show_call_hierarchy")) "Call Hierarchy renderer is missing."
  Assert-True ($main.Contains("lang_service.call_hierarchy_items")) "Call Hierarchy must use the language service facade."
  Assert-True ($main.Contains("_show_symbol_info")) "Symbol Info renderer is missing."
  Assert-True ($main.Contains("lang_service.symbol_info")) "Symbol Info must use the language service facade."
  Assert-True ($main.Contains("_show_code_inspections")) "Code Inspections renderer is missing."
  Assert-True ($main.Contains("lang_service.code_inspection_items")) "Code Inspections must use the language service facade."
  Assert-True ($service.Contains("_import_alias_used")) "Code inspections must detect unused import aliases."
  Assert-True ($service.Contains("Unused import alias")) "Unused import alias inspection message is missing."
  Assert-True ($main.Contains("_show_project_index")) "Project index result renderer is missing."
  Assert-True ($main.Contains("_show_project_symbols")) "Project symbols result renderer is missing."
  Assert-True ($main.Contains("_show_project_symbols_query")) "Project symbol query renderer is missing."
  Assert-True ($main.Contains("_open_goto_symbol_window")) "Go to symbol dialog is missing."
  Assert-True ($main.Contains("ID_SYMBOL_SEARCH_TEXT_EDIT")) "Go to symbol dialog edit control is missing."
  Assert-True ($main.Contains("lang_service.symbol_items")) "Project symbols must use the language service facade."
  Assert-True ($main.Contains("_find_references")) "Find references renderer is missing."
  Assert-True ($main.Contains("lang_service.references")) "Find references must use the language service facade."
  Assert-True ($main.Contains("Shift+F12")) "Find references shortcut text is missing."
  Assert-True ($main.Contains("shift and _key_pressed(st, win.VK_F12)")) "Shift+F12 hotkey wiring is missing."
  Assert-True ($main.Contains("Ctrl+T")) "Go to symbol shortcut text is missing."
  Assert-True ($main.Contains("ctrl and _key_pressed(st, win.VK_T)")) "Ctrl+T hotkey wiring is missing."
  Assert-True ($main.Contains("ID_EDIT_FIND")) "Find command is missing."
  Assert-True ($main.Contains("ID_EDIT_FIND_NEXT")) "Find next command is missing."
  Assert-True ($main.Contains("ID_EDIT_RENAME_SYMBOL")) "Rename Symbol command is missing."
  Assert-True ($main.Contains('Rename &Symbol...\tF2')) "Rename Symbol menu item is missing."
  Assert-True ($main.Contains("_open_rename_symbol_window")) "Rename Symbol dialog is missing."
  Assert-True ($main.Contains("_show_rename_symbol_preview")) "Rename Symbol preview renderer is missing."
  Assert-True ($main.Contains("_apply_rename_symbol")) "Rename Symbol apply action is missing."
  Assert-True ($main.Contains("_refresh_renamed_open_files")) "Rename Symbol must refresh changed open tabs."
  Assert-True ($main.Contains("ID_RENAME_SYMBOL_APPLY")) "Rename Symbol apply button is missing."
  Assert-True ($main.Contains('_settings_button(dlg, st.font_ui, "Apply"')) "Rename Symbol dialog must expose Apply."
  Assert-True ($main.Contains("lang_service.rename_preview_items")) "Rename Symbol must use the language service facade."
  Assert-True ($main.Contains("lang_service.apply_rename")) "Rename Symbol apply must use the language service facade."
  Assert-True ($main.Contains('_guard_no_dirty(st, "applying rename")')) "Rename Symbol apply must guard unsaved tabs."
  Assert-True ($service.Contains("rename_preview_items")) "Language service rename preview is missing."
  Assert-True ($service.Contains("apply_rename")) "Language service rename apply is missing."
  Assert-True ($service.Contains("_replace_word_in_line")) "Rename apply must replace whole words by line."
  Assert-True ($win32.Contains("VK_F2")) "F2 key constant is missing."
  Assert-True ($main.Contains("win.VK_F2")) "F2 Rename Symbol hotkey wiring is missing."
  Assert-True ($main.Contains("ID_COMMAND_PALETTE")) "Command palette command is missing."
  Assert-True ($main.Contains('Command &Palette...\tCtrl+Shift+P')) "Command palette menu item is missing."
  Assert-True ($main.Contains("_open_command_palette")) "Command palette window is missing."
  Assert-True ($main.Contains("_command_palette_ids")) "Command palette ID registry is missing."
  Assert-True ($main.Contains("_command_palette_labels")) "Command palette label registry is missing."
  Assert-True ($main.Contains("_command_palette_pick")) "Command palette selection helper is missing."
  Assert-True ($main.Contains("_perform_palette_command")) "Command palette dispatch helper is missing."
  Assert-True ($main.Contains("File: Quick Open File")) "Command palette must expose Quick Open."
  Assert-True ($main.Contains("Edit: Rename Symbol Preview")) "Command palette must expose Rename Symbol."
  Assert-True ($main.Contains("Navigation: Workspace Health")) "Command palette must expose workspace health."
  Assert-True ($main.Contains("Navigation: TODOs")) "Command palette must expose TODOs."
  Assert-True ($main.Contains("Navigation: Test Explorer")) "Command palette must expose Test Explorer."
  Assert-True ($main.Contains("Navigation: Related Tests")) "Command palette must expose Related Tests."
  Assert-True ($main.Contains("Navigation: Import Graph")) "Command palette must expose Import Graph."
  Assert-True ($main.Contains("Navigation: Call Hierarchy")) "Command palette must expose Call Hierarchy."
  Assert-True ($main.Contains("Navigation: Symbol Info")) "Command palette must expose Symbol Info."
  Assert-True ($main.Contains("Navigation: Code Inspections")) "Command palette must expose Code Inspections."
  Assert-True ($main.Contains("ctrl and shift and _key_pressed(st, win.VK_P)")) "Ctrl+Shift+P hotkey wiring is missing."
  Assert-True ($main.Contains("ctrl and _key_pressed(st, win.VK_P)")) "Ctrl+P Quick Open hotkey wiring is missing."
  Assert-True ($main.Contains("ID_EDIT_COMPLETE")) "Autocomplete command is missing."
  Assert-True ($main.Contains("ID_AUTOCOMPLETE_LIST")) "Autocomplete popup list is missing."
  Assert-True ($main.Contains("lang_service.completion_labels")) "Autocomplete must use the language service facade."
  Assert-True ($main.Contains("_accept_autocomplete")) "Autocomplete accept handler is missing."
  Assert-True ($main.Contains("ID_CTX_TREE_NEW_TEST")) "Tree new test-file context command is missing."
  Assert-True ($main.Contains("ID_CTX_TREE_RENAME")) "Tree rename context command is missing."
  Assert-True ($main.Contains("ID_CTX_TREE_DELETE")) "Tree delete context command is missing."
  Assert-True ($main.Contains("_new_tree_test_file")) "Tree test-file template action is missing."
  Assert-True ($main.Contains("_rename_tree_item")) "Tree rename action is missing."
  Assert-True ($main.Contains("_delete_tree_item")) "Tree delete action is missing."
  Assert-True ($main.Contains("ID_NEW_PROJECT_NAME_EDIT")) "New project dialog wiring is missing."
  Assert-True ($main.Contains("_normalize_project_kind")) "New project type normalization is missing."
  Assert-True ($main.Contains('"COMBOBOX"')) "New project type must use a dropdown combo box."
  $win32 = Get-Content -LiteralPath (Join-Path $Root "src\platform\win32.ml") -Raw
  Assert-True ($win32.Contains("CBS_DROPDOWNLIST")) "Combo box dropdown Win32 constants are missing."
  Assert-True ($win32.Contains("VK_F12")) "F12 key support is missing."
  Assert-True ($win32.Contains("VK_P")) "P key support is missing."
  Assert-True ($win32.Contains("VK_T")) "Ctrl+T key support is missing."
  Assert-True ($win32.Contains("VK_F3")) "F3 key support is missing."
  Assert-True ($win32.Contains("NM_RCLICK")) "Tree right-click notification support is missing."
  Assert-True ($win32.Contains("SetForegroundWindow")) "Popup menus should foreground the owner window."
  Assert-True ($win32.Contains("EM_SETBKGNDCOLOR")) "RichEdit background color support is missing."
  Assert-True ($win32.Contains("TVM_SETBKCOLOR")) "Tree theme color support is missing."
  Assert-True ($win32.Contains("DwmSetWindowAttribute")) "Window dark title bar support is missing."
  Assert-True ($win32.Contains("SetWindowTheme")) "Common-control theme support is missing."
  Assert-True ($main.Contains("_handle_context_menu_at_force")) "Forced context menu handler is missing."
  Assert-True ($main.Contains("_select_tree_item_at")) "Tree context selection helper is missing."
  Assert-True ($main.Contains("WM_RBUTTONDOWN")) "Tree right-button down handling is missing."
  Assert-True ($main.Contains("CONTEXT_FORCE_DUP_MS")) "Tree context menu duplicate guard is missing."
  Assert-True ($main.Contains("ID_HELP_LANGUAGE")) "Help language reference menu is missing."
  Assert-True ($main.Contains("ID_HELP_LANGUAGE_SEARCH")) "Help search menu is missing."
  Assert-True ($main.Contains("_language_help_path")) "Language help path resolver is missing."
  Assert-True ($main.Contains("_search_language_help")) "Language help search is missing."
  Assert-True ($main.Contains('import "help/language.ml" as help_lang')) "Language help module import is missing."
  $helpModule = Get-Content -LiteralPath (Join-Path $Root "src\help\language.ml") -Raw
  Assert-True ($helpModule.Contains('MiniLangCompilerML\\README.md')) "Language help must use the self-hosted compiler README."
  Assert-True ($helpModule.Contains("search_document")) "Language help search document builder is missing."
  Assert-True ($main.Contains('miniide://MiniLang Language Reference.md')) "Language help must open in an editor tab."
  Assert-True ($main.Contains('miniide://MiniLang Help Search.md')) "Language help search must open in an editor tab."
  Assert-True ($main.Contains('import "ui/markdown.ml" as markdown')) "Markdown UI module import is missing."
  $markdown = Get-Content -LiteralPath (Join-Path $Root "src\ui\markdown.ml") -Raw
  Assert-True ($markdown.Contains("_render_markdown_document")) "Markdown tabs must render Markdown to document text."
  Assert-True ($markdown.Contains("_apply_rendered_markdown_styles")) "Rendered Markdown tabs must apply document styles."
  Assert-True ($markdown.Contains("MarkdownLink")) "Rendered Markdown tabs must track clickable links."
  Assert-True ($markdown.Contains("_jump_to_markdown_anchor")) "Markdown links must jump to rendered anchors."
  Assert-True ($markdown.Contains("edit_scroll_lines(st.editor, 0, delta)")) "Markdown anchor jumps must place the target line at the top."
  Assert-True ($markdown.Contains("target_line = win.edit_line_from_char(st.editor, pos)")) "Markdown anchor jumps must use rendered display lines."
  Assert-True ($markdown.Contains("_md_add_line_style(styles, start_pos, end_pos, kind)")) "Markdown block styles must use character ranges, not drifting line numbers."
  Assert-True (-not $markdown.Contains("_md_wrap_cut")) "Markdown renderer must not split raw Markdown before inline parsing."
  Assert-True (-not $markdown.Contains("_md_append_wrapped_inline")) "Markdown renderer must not wrap raw Markdown before inline parsing."
  Assert-True ($markdown.Contains("inner_result = _md_inline")) "Markdown inline styles must parse nested formatting recursively."
  Assert-True ($markdown.Contains("_md_normalize_display_chars")) "Markdown renderer must normalize non-ASCII display text before computing style ranges."
  Assert-True ($markdown.Contains("b[0] < 128")) "Markdown renderer must keep RichEdit style offsets ASCII-safe."
  Assert-True ($markdown.Contains("function empty_doc")) "Markdown module must expose a non-void cache sentinel."
  Assert-True (-not $markdown.Contains("open_markdown_docs[idx] = void")) "Markdown cache clearing must not assign void through an array index."
  Assert-True (-not $main.Contains("open_markdown_docs = st.open_markdown_docs + [void]")) "Markdown tab creation must not store void cache entries."
  Assert-True ($markdown.Contains('if kind == "strong" or kind == "em" then color = -1 end if')) "Nested strong/emphasis must not overwrite inner link colors."
  Assert-True ($markdown.Contains("_md_add_code_spans")) "Markdown fenced MiniLang code blocks must be syntax highlighted."
  Assert-True ($markdown.Contains("if len(segments) <= 0 then return spans end if")) "Markdown code highlighting must tolerate blank code lines."
  Assert-True ($markdown.Contains("win.rich_set_format(st.editor, style.start_pos, style.end_pos")) "Markdown block styles must use RichEdit's native character positions."
  Assert-True ($markdown.Contains("win.rich_set_format(st.editor, span.start_pos, span.end_pos")) "Markdown inline styles must use RichEdit's native character positions."
  Assert-True (-not $markdown.Contains("_md_display_pos(doc.text")) "Markdown styles must not over-shift ranges for CRLF."
  Assert-True ($main.Contains('import "ui/theme.ml" as theme')) "Theme module import is missing."
  Assert-True ($main.Contains('import "lang/index.ml" as lang_index')) "Project index module import is missing."
  Assert-True ($main.Contains('import "lang/service.ml" as lang_service')) "Language service module import is missing."
  $theme = Get-Content -LiteralPath (Join-Path $Root "src\ui\theme.ml") -Raw
  Assert-True ($theme.Contains("function syntax_color")) "Theme module must provide syntax colors."
  Assert-True ($markdown.Contains('import "ui/theme.ml" as theme')) "Markdown module must use shared theme colors."
  Assert-True ($main.Contains("open_markdown_docs")) "Rendered Markdown documents must be cached per tab."
  Assert-True ($main.Contains("function _is_generated_editor_path")) "Generated Markdown/read-only tabs must be guarded from source dirty tracking."
  Assert-True ($main.Contains("function _refresh_active_markdown_view")) "Theme changes must immediately reapply Markdown formatting."
  Assert-True ($main.Contains("function _write_markdown_active_editor")) "Markdown tab switches must reuse cached RichEdit views."
  Assert-True ($main.Contains("open_markdown_views")) "Markdown tabs must cache their rendered RichEdit views."
  Assert-True ($main.Contains("open_markdown_view_themes")) "Markdown view caches must be invalidated when the theme changes."
  Assert-True ($main.Contains("st.editor = st.code_editor")) "The source editor handle must be restored after leaving cached Markdown views."
  Assert-True ($main.Contains("if _active_is_markdown(st) then st = _refresh_active_markdown_view(st, true) end if")) "Theme changes must re-render active Markdown tabs."
  Assert-True ($main.Contains("_is_generated_editor_path(st.open_files[st.active_tab])")) "Markdown/read-only tabs must not become dirty from rendered RichEdit content."
  Assert-True ($win32.Contains("edit_char_from_pos")) "RichEdit character hit-testing is missing."
  Assert-True ($win32.Contains("EM_LINESCROLL")) "RichEdit line scrolling support is missing."
  Assert-True ($win32.Contains("if color >= 0 then mask = mask | CFM_COLOR end if")) "RichEdit formatting must support style-only spans without overwriting colors."
  Assert-True ($build.Contains("CREATE_NO_WINDOW")) "Build process must be hidden."
  Assert-True ($build.Contains("CreateProcessW")) "Build service must use CreateProcessW."
  Assert-True ($build.Contains("TerminateProcess")) "Build stop must use TerminateProcess."
  Assert-True ($build.Contains("stop_job")) "Build stop job function is missing."
  Assert-True ($build.Contains("clean_project")) "Clean project function is missing."
  Assert-True ($build.Contains("extra_args")) "Build service extraArgs wiring is missing."
  Assert-True ($build.Contains("start_run_output")) "Run output capture is missing."
  Assert-True ($build.Contains("start_test_compile_with_options")) "Test build wiring is missing."
  Assert-True ($build.Contains("start_test_file_compile_with_options")) "Current test-file build wiring is missing."
  Assert-True ($build.Contains("_test_compile_paths_for_entry")) "Current test-file build must support a test entry override."
  Assert-True ($build.Contains("needs_recompile")) "Run auto-recompile check is missing."
  Assert-True ($build.Contains(" pos=")) "Diagnostic parser must handle compiler pos= locations."
  Assert-True ($build.Contains("_line_col_from_pos")) "Diagnostic parser must map pos= offsets to line/column."
  Assert-True ($build.Contains("_parse_diag_loc")) "Diagnostic parser must support multiple location formats."

  $templates = Get-Content -LiteralPath (Join-Path $Root "src\project\templates.ml") -Raw
  $projectModule = Get-Content -LiteralPath (Join-Path $Root "src\project\project.ml") -Raw
  Assert-True ($templates.Contains("create_standard_project")) "Standard project template module is missing."
  Assert-True ($templates.Contains("tests\\main_test.ml")) "Standard project template must include a test entry."
  Assert-True ($projectModule.Contains("if fs.isDir(path) then return load_project(path) end if")) "Project loader must accept a project directory in load_project_file."
  Assert-True ($projectModule.Contains("try(fs.readAllText(path))")) "Project loader must not crash on unreadable project paths."
  Assert-True ($main.Contains("created = try(templates.create_standard_project")) "New Project must catch template errors and keep the dialog open."
  Assert-True ($main.Contains("Please choose another project name.")) "New Project duplicate-name error must tell the user how to recover."

  $help = Get-Content -LiteralPath (Join-Path $Root "MiniLangCompilerML\README.md") -Raw
  foreach ($anchor in @("## Contents", "## 16. Syntax Reference (short)", "## 13. Standard Library & Builtins", "## 14. extern", "## Native compiler status")) {
    Assert-True ($help.Contains($anchor)) "Language reference README anchor missing: $anchor"
  }
  foreach ($term in @("function", "extern", "array", "try", "package")) {
    Assert-True ($help -match [regex]::Escape($term)) "Language reference README lacks expected term: $term"
  }
}

# Compile MiniIDE into a temporary executable for test isolation.
function Test-CompileMiniIde {
  $candidates = @("MiniIDE_wtest1.exe", "MiniIDE_wtest2.exe", "MiniIDE_wtest3.exe")
  $lastError = ""
  foreach ($candidate in $candidates) {
    $out = Join-Path $Root ("build\" + $candidate)
    $outArg = ".\build\$candidate"
    if (Test-Path -LiteralPath $out) { Remove-Item -LiteralPath $out -Force }
    $args = @(
      ".\src\main.ml",
      $outArg,
      "-I", ".\src",
      "-I", ".\MiniLangCompilerML",
      "--keep-going", "--max-errors", "160", "--subsystem", "windows"
    )
    try {
      $log = Invoke-CheckedTimed $Compiler $args $Root 420
      Assert-True (Test-Path -LiteralPath $out) "MiniIDE test build did not create $out"
      Assert-True ($log -match "OK: wrote") "Compiler output did not report success."
    }
    catch {
      $lastError = $_.Exception.Message
      continue
    }

    $probe = Start-Process -FilePath $out -ArgumentList @($Root) -PassThru
    try {
      Start-Sleep -Seconds 2
      $probe.Refresh()
      if (-not $probe.HasExited) {
        $script:CompiledMiniIdeExe = $out
        return
      }
    }
    finally {
      if ($probe -and -not $probe.HasExited) {
        $probe.CloseMainWindow() | Out-Null
        Start-Sleep -Milliseconds 300
        if (-not $probe.HasExited) { $probe.Kill() }
      }
    }
  }
  throw "MiniIDE test executable could not be compiled and started after multiple attempts. $lastError"
}

# Compile and run focused Markdown renderer regression tests.
function Test-MarkdownRenderer {
  $out = Join-Path $Root "build\markdown_test.exe"
  if (Test-Path -LiteralPath $out) { Remove-Item -LiteralPath $out -Force }
  $args = @(
    ".\tests\markdown_test.ml",
    ".\build\markdown_test.exe",
    "-I", ".\src",
    "-I", ".\MiniLangCompilerML",
    "--keep-going", "--max-errors", "80", "--subsystem", "console"
  )
  Invoke-Checked $Compiler $args $Root | Out-Null
  & $out
  $exit = $LASTEXITCODE
  Assert-True ($exit -eq 0) "Markdown renderer regression test failed."
}

# Compile and run focused project loader regression tests.
function Test-ProjectLoader {
  $fixture = Join-Path $Root "build\ProjectLoadDirTest"
  if (Test-Path -LiteralPath $fixture) {
    Remove-Item -LiteralPath $fixture -Recurse -Force
  }
  $out = Join-Path $Root "build\project_test.exe"
  if (Test-Path -LiteralPath $out) { Remove-Item -LiteralPath $out -Force }
  $args = @(
    ".\tests\project_test.ml",
    ".\build\project_test.exe",
    "-I", ".\src",
    "-I", ".\MiniLangCompilerML",
    "--keep-going", "--max-errors", "80", "--subsystem", "console"
  )
  Invoke-Checked $Compiler $args $Root | Out-Null
  & $out
  $exit = $LASTEXITCODE
  Assert-True ($exit -eq 0) "Project loader regression test failed."
}

# Compile and run focused project index regression tests.
function Test-ProjectIndex {
  $fixture = Join-Path $Root "build\IndexTestProject"
  if (Test-Path -LiteralPath $fixture) {
    Remove-Item -LiteralPath $fixture -Recurse -Force
  }
  $out = Join-Path $Root "build\index_test.exe"
  if (Test-Path -LiteralPath $out) { Remove-Item -LiteralPath $out -Force }
  $args = @(
    ".\tests\index_test.ml",
    ".\build\index_test.exe",
    "-I", ".\src",
    "-I", ".\MiniLangCompilerML",
    "--keep-going", "--max-errors", "80", "--subsystem", "console"
  )
  Invoke-Checked $Compiler $args $Root | Out-Null
  & $out
  $exit = $LASTEXITCODE
  Assert-True ($exit -eq 0) "Project index regression test failed."
}

# Compile and run focused language service regression tests.
function Test-LanguageService {
  $fixture = Join-Path $Root "build\ServiceTestProject"
  if (Test-Path -LiteralPath $fixture) {
    Remove-Item -LiteralPath $fixture -Recurse -Force
  }
  $out = Join-Path $Root "build\service_test.exe"
  if (Test-Path -LiteralPath $out) { Remove-Item -LiteralPath $out -Force }
  $args = @(
    ".\tests\service_test.ml",
    ".\build\service_test.exe",
    "-I", ".\src",
    "-I", ".\MiniLangCompilerML",
    "--keep-going", "--max-errors", "80", "--subsystem", "console"
  )
  Invoke-Checked $Compiler $args $Root | Out-Null
  & $out
  $exit = $LASTEXITCODE
  Assert-True ($exit -eq 0) "Language service regression test failed."
}

# Create a small sample project used by the UI build smoke test.
function New-TestProject {
  $projectRoot = Join-Path $TempRoot "MiniIDE_Test_Project"
  New-CleanDir $projectRoot
  New-Item -ItemType Directory -Force -Path (Join-Path $projectRoot "src") | Out-Null
  New-Item -ItemType Directory -Force -Path (Join-Path $projectRoot "tests") | Out-Null
  @"
function main(args)
  print "hello from MiniIDE test"
  return 0
end function
"@ | Set-Content -LiteralPath (Join-Path $projectRoot "src\main.ml") -Encoding ASCII
  @"
function main(args)
  print "hello from MiniIDE tests"
  return 0
end function
"@ | Set-Content -LiteralPath (Join-Path $projectRoot "tests\main_test.ml") -Encoding ASCII
  @"
name=MiniIDE Test
type=console
entry=src\main.ml
output=build\hello.exe
testEntry=tests\main_test.ml
runArgs=
workingDir=.
importPath=$($Root)\MiniLangCompilerML
"@ | Set-Content -LiteralPath (Join-Path $projectRoot "MiniIDE.mlproj") -Encoding ASCII
  @"
compiler=$Compiler
keepGoing=true
maxErrors=7
subsystem=console
extraArgs=
"@ | Set-Content -LiteralPath (Join-Path $projectRoot ".miniide.cfg") -Encoding ASCII
  return $projectRoot
}

# Exercise MiniIDE background build behavior through a smoke test.
function Test-UiBuildSmoke {
  $exe = $script:CompiledMiniIdeExe
  if ([string]::IsNullOrWhiteSpace($exe)) { $exe = $MiniIdeExe }
  if (-not (Test-Path -LiteralPath $exe)) {
    throw "MiniIDE.exe not found. Build it first or run without -SkipUi after compiling."
  }

  Add-Type @"
using System;
using System.Text;
using System.Runtime.InteropServices;
using System.Collections.Generic;
public static class MiniIdeUiSmoke {
  public delegate bool EnumWindowsProc(IntPtr hWnd, IntPtr lParam);
  [DllImport("user32.dll")] public static extern bool EnumWindows(EnumWindowsProc cb, IntPtr lp);
  [DllImport("user32.dll")] public static extern bool EnumChildWindows(IntPtr hWnd, EnumWindowsProc cb, IntPtr lp);
  [DllImport("user32.dll")] public static extern uint GetWindowThreadProcessId(IntPtr hWnd, out int pid);
  [DllImport("user32.dll", CharSet=CharSet.Unicode)] public static extern int GetClassName(IntPtr hWnd, StringBuilder sb, int max);
  [DllImport("user32.dll", CharSet=CharSet.Unicode)] public static extern int GetWindowText(IntPtr hWnd, StringBuilder sb, int max);
  [DllImport("user32.dll")] public static extern IntPtr GetDlgItem(IntPtr hWnd, int id);
  [DllImport("user32.dll")] public static extern bool PostMessage(IntPtr hWnd, int msg, IntPtr wParam, IntPtr lParam);
  [DllImport("user32.dll")] public static extern IntPtr SendMessage(IntPtr hWnd, int msg, IntPtr wParam, IntPtr lParam);
  public static string ClassName(IntPtr h) { var sb = new StringBuilder(256); GetClassName(h, sb, sb.Capacity); return sb.ToString(); }
  public static string Text(IntPtr h) { var sb = new StringBuilder(8192); GetWindowText(h, sb, sb.Capacity); return sb.ToString(); }
  public static List<IntPtr> TopWindowsForPid(int pid) { var list = new List<IntPtr>(); EnumWindows((h,l) => { int windowPid; GetWindowThreadProcessId(h, out windowPid); if (windowPid == pid) list.Add(h); return true; }, IntPtr.Zero); return list; }
  public static List<IntPtr> Children(IntPtr p) { var list = new List<IntPtr>(); EnumChildWindows(p, (h,l) => { list.Add(h); return true; }, IntPtr.Zero); return list; }
}
"@

  $projectRoot = New-TestProject
  $p = Start-Process -FilePath $exe -ArgumentList @($projectRoot) -PassThru
  $childPids = @()
  try {
    $classes = @()
    $hwnd = [IntPtr]::Zero
    for ($i = 0; $i -lt 120; $i++) {
      $p.Refresh()
      Assert-True (-not $p.HasExited) "MiniIDE exited before controls appeared. Exit code: $($p.ExitCode)"
      $handles = @()
      if ($p.MainWindowHandle -ne 0) { $handles += [IntPtr]$p.MainWindowHandle }
      $handles += @([MiniIdeUiSmoke]::TopWindowsForPid($p.Id))
      foreach ($candidate in ($handles | Select-Object -Unique)) {
        if ($candidate -eq [IntPtr]::Zero) { continue }
        $candidateClasses = @([MiniIdeUiSmoke]::Children($candidate) | ForEach-Object { [MiniIdeUiSmoke]::ClassName($_) })
        $hasTree = $candidateClasses -contains "SysTreeView32"
        $hasEditor = (($candidateClasses | Where-Object { $_ -like "RICHEDIT*" }).Count -ge 1)
        $hasTabStrip = ([MiniIdeUiSmoke]::GetDlgItem($candidate, 1005) -ne [IntPtr]::Zero)
        $hasCompileButton = ([MiniIdeUiSmoke]::GetDlgItem($candidate, 1002) -ne [IntPtr]::Zero)
        if ($hasTree -and $hasEditor -and $hasTabStrip -and $hasCompileButton) {
          $hwnd = $candidate
          $classes = $candidateClasses
          break
        }
        if ($classes.Count -eq 0 -and $candidateClasses.Count -gt 0) { $classes = $candidateClasses }
      }
      if ($hwnd -ne [IntPtr]::Zero) { break }
      Start-Sleep -Milliseconds 100
    }
    Assert-True ($hwnd -ne [IntPtr]::Zero) "MiniIDE main window did not appear."
    $classText = ($classes -join ", ")
    Assert-True ($classes -contains "SysTreeView32") "Project tree control missing. Classes: $classText"
    Assert-True ([MiniIdeUiSmoke]::GetDlgItem($hwnd, 1005) -ne [IntPtr]::Zero) "Tab strip control missing. Classes: $classText"
    Assert-True (($classes | Where-Object { $_ -like "RICHEDIT*" }).Count -ge 1) "RichEdit editor missing. Classes: $classText"

    $compileButton = [MiniIdeUiSmoke]::GetDlgItem($hwnd, 1002)
    Assert-True ($compileButton -ne [IntPtr]::Zero) "Compile ribbon button missing."
    $buildLog = Join-Path $projectRoot "build\last_build.log"
    $outputExe = Join-Path $projectRoot "build\hello.exe"
    [MiniIdeUiSmoke]::PostMessage($hwnd, 0x0111, [IntPtr]1002, [IntPtr]0) | Out-Null

    $children = @()
    $buildDone = $false
    for ($i = 0; $i -lt 240; $i++) {
      Start-Sleep -Milliseconds 500
      $children = @(Get-CimInstance Win32_Process | Where-Object { $_.ParentProcessId -eq $p.Id })
      Assert-True (($children | Where-Object { $_.Name -ieq "cmd.exe" }).Count -eq 0) "Build used cmd.exe instead of a hidden compiler process."
      if ((Test-Path -LiteralPath $outputExe) -and (Test-Path -LiteralPath $buildLog)) {
        $log = Get-Content -LiteralPath $buildLog -Raw
        if ($log -match "OK: wrote") {
          $buildDone = $true
          break
        }
      }
    }
    $childPids = @($children | ForEach-Object { $_.ProcessId })
    Assert-True $buildDone "Build command did not produce a successful output executable and log."

    for ($i = 0; $i -lt 20; $i++) {
      $children = @(Get-CimInstance Win32_Process | Where-Object { $_.ParentProcessId -eq $p.Id })
      if ($children.Count -eq 0) { break }
      Start-Sleep -Milliseconds 250
    }
    Assert-True ($children.Count -eq 0) "Compiler child process did not finish in time."
    $childPids = @()

    Assert-True (Test-Path -LiteralPath $buildLog) "Build log missing."
    Assert-True (Test-Path -LiteralPath $outputExe) "Output exe missing."
    $log = Get-Content -LiteralPath $buildLog -Raw
    Assert-True ($log -match "OK: wrote") "Build log does not contain success output."

    Remove-Item -LiteralPath $outputExe -Force
    $runLog = Join-Path $projectRoot "build\last_run.log"
    if (Test-Path -LiteralPath $runLog) { Remove-Item -LiteralPath $runLog -Force }

    $runButton = [MiniIdeUiSmoke]::GetDlgItem($hwnd, 1007)
    Assert-True ($runButton -ne [IntPtr]::Zero) "Run ribbon button missing."
    [MiniIdeUiSmoke]::PostMessage($hwnd, 0x0111, [IntPtr]1007, [IntPtr]0) | Out-Null

    for ($i = 0; $i -lt 240; $i++) {
      if (Test-Path -LiteralPath $runLog) {
        $runText = Get-Content -LiteralPath $runLog -Raw
        if ($runText -match "hello from MiniIDE test") { break }
      }
      Start-Sleep -Milliseconds 500
    }
    Assert-True (Test-Path -LiteralPath $outputExe) "Run did not auto-compile missing output exe."
    Assert-True (Test-Path -LiteralPath $runLog) "Run log missing."
    $runText = Get-Content -LiteralPath $runLog -Raw
    Assert-True ($runText -match "hello from MiniIDE test") "Run log does not contain program output."

    $testButton = [MiniIdeUiSmoke]::GetDlgItem($hwnd, 1009)
    Assert-True ($testButton -ne [IntPtr]::Zero) "Tests ribbon button missing."

    $testBuildLog = Join-Path $projectRoot "build\last_test_build.log"
    $testRunLog = Join-Path $projectRoot "build\last_test_run.log"
    if (Test-Path -LiteralPath $testBuildLog) { Remove-Item -LiteralPath $testBuildLog -Force }
    if (Test-Path -LiteralPath $testRunLog) { Remove-Item -LiteralPath $testRunLog -Force }
    [MiniIdeUiSmoke]::PostMessage($hwnd, 0x0111, [IntPtr]1009, [IntPtr]0) | Out-Null

    for ($i = 0; $i -lt 240; $i++) {
      if (Test-Path -LiteralPath $testRunLog) {
        $testText = Get-Content -LiteralPath $testRunLog -Raw
        if ($testText -match "hello from MiniIDE tests") { break }
      }
      Start-Sleep -Milliseconds 500
    }
    Assert-True (Test-Path -LiteralPath $testBuildLog) "Test build log missing."
    Assert-True (Test-Path -LiteralPath $testRunLog) "Test run log missing."
    $testText = Get-Content -LiteralPath $testRunLog -Raw
    Assert-True ($testText -match "hello from MiniIDE tests") "Test run log does not contain test output."

    $cfg = Join-Path $projectRoot ".miniide.cfg"
    [MiniIdeUiSmoke]::PostMessage($hwnd, 0x0111, [IntPtr]1044, [IntPtr]0) | Out-Null
    for ($i = 0; $i -lt 40; $i++) {
      if ((Get-Content -LiteralPath $cfg -Raw) -match "profile=release") { break }
      Start-Sleep -Milliseconds 100
    }
    Assert-True ((Get-Content -LiteralPath $cfg -Raw) -match "profile=release") "Release profile command did not update config."

    [MiniIdeUiSmoke]::PostMessage($hwnd, 0x0111, [IntPtr]1043, [IntPtr]0) | Out-Null
    for ($i = 0; $i -lt 40; $i++) {
      if ((Get-Content -LiteralPath $cfg -Raw) -match "profile=debug") { break }
      Start-Sleep -Milliseconds 100
    }
    Assert-True ((Get-Content -LiteralPath $cfg -Raw) -match "profile=debug") "Debug profile command did not update config."

    [MiniIdeUiSmoke]::PostMessage($hwnd, 0x0111, [IntPtr]1046, [IntPtr]0) | Out-Null
    for ($i = 0; $i -lt 40; $i++) {
      if ((Get-Content -LiteralPath $cfg -Raw) -match "theme=light") { break }
      Start-Sleep -Milliseconds 100
    }
    Assert-True ((Get-Content -LiteralPath $cfg -Raw) -match "theme=light") "Light theme command did not update config."

    [MiniIdeUiSmoke]::PostMessage($hwnd, 0x0111, [IntPtr]1047, [IntPtr]0) | Out-Null
    for ($i = 0; $i -lt 40; $i++) {
      if ((Get-Content -LiteralPath $cfg -Raw) -match "theme=dark") { break }
      Start-Sleep -Milliseconds 100
    }
    Assert-True ((Get-Content -LiteralPath $cfg -Raw) -match "theme=dark") "Dark theme command did not update config."

    [MiniIdeUiSmoke]::PostMessage($hwnd, 0x0111, [IntPtr]1040, [IntPtr]0) | Out-Null
    for ($i = 0; $i -lt 40; $i++) {
      if ((-not (Test-Path -LiteralPath $outputExe)) -and (-not (Test-Path -LiteralPath $testRunLog))) { break }
      Start-Sleep -Milliseconds 100
    }
    Assert-True (-not (Test-Path -LiteralPath $outputExe)) "Clean command did not remove output exe."
    Assert-True (-not (Test-Path -LiteralPath $testRunLog)) "Clean command did not remove test run log."

    [MiniIdeUiSmoke]::PostMessage($hwnd, 0x0111, [IntPtr]1041, [IntPtr]0) | Out-Null
    for ($i = 0; $i -lt 240; $i++) {
      if (Test-Path -LiteralPath $buildLog) {
        $rebuilt = Get-Content -LiteralPath $buildLog -Raw
        if ($rebuilt -match "OK: wrote" -and (Test-Path -LiteralPath $outputExe)) { break }
      }
      Start-Sleep -Milliseconds 500
    }
    Assert-True (Test-Path -LiteralPath $outputExe) "Rebuild command did not recreate output exe."
    Assert-True ((Get-Content -LiteralPath $buildLog -Raw) -match "OK: wrote") "Rebuild log does not contain success output."

    [MiniIdeUiSmoke]::PostMessage($hwnd, 0x0111, [IntPtr]1042, [IntPtr]0) | Out-Null
    Start-Sleep -Milliseconds 300
    $p.Refresh()
    Assert-True (-not $p.HasExited) "Stop command while idle crashed MiniIDE."

    [MiniIdeUiSmoke]::PostMessage($hwnd, 0x0111, [IntPtr]1023, [IntPtr]0) | Out-Null
    $helpTitle = ""
    for ($i = 0; $i -lt 30; $i++) {
      Start-Sleep -Milliseconds 500
      $p.Refresh()
      Assert-True (-not $p.HasExited) "Language reference command crashed MiniIDE."
      $helpTitle = [MiniIdeUiSmoke]::Text($hwnd)
      if ($helpTitle -match "MiniLang Language Reference\.md") { break }
    }
    Assert-True ($helpTitle -match "MiniLang Language Reference\.md") "Language reference tab did not become active before the theme smoke test."

    $tabStrip = [MiniIdeUiSmoke]::GetDlgItem($hwnd, 1005)
    Assert-True ($tabStrip -ne [IntPtr]::Zero) "Tab strip missing before Markdown cache smoke test."
    $tabPointFirst = [IntPtr]((15 -bor (15 -shl 16)))
    $tabPointSecond = [IntPtr]((150 -bor (15 -shl 16)))
    [MiniIdeUiSmoke]::PostMessage($tabStrip, 0x0201, [IntPtr]1, $tabPointFirst) | Out-Null
    [MiniIdeUiSmoke]::PostMessage($tabStrip, 0x0202, [IntPtr]0, $tabPointFirst) | Out-Null
    Start-Sleep -Milliseconds 700
    $p.Refresh()
    Assert-True (-not $p.HasExited) "MiniIDE crashed after switching away from the language reference."
    Assert-True ([MiniIdeUiSmoke]::Text($hwnd) -notmatch "MiniLang Language Reference\.md") "Tab click did not switch away from the language reference."
    [MiniIdeUiSmoke]::PostMessage($tabStrip, 0x0201, [IntPtr]1, $tabPointSecond) | Out-Null
    [MiniIdeUiSmoke]::PostMessage($tabStrip, 0x0202, [IntPtr]0, $tabPointSecond) | Out-Null
    for ($i = 0; $i -lt 20; $i++) {
      Start-Sleep -Milliseconds 200
      $p.Refresh()
      Assert-True (-not $p.HasExited) "MiniIDE crashed after switching back to the language reference."
      if ([MiniIdeUiSmoke]::Text($hwnd) -match "MiniLang Language Reference\.md") { break }
    }
    Assert-True ([MiniIdeUiSmoke]::Text($hwnd) -match "MiniLang Language Reference\.md") "Tab click did not restore the cached language reference view."

    [MiniIdeUiSmoke]::PostMessage($hwnd, 0x0111, [IntPtr]1046, [IntPtr]0) | Out-Null
    Start-Sleep -Milliseconds 1200
    $p.Refresh()
    Assert-True (-not $p.HasExited) "Light theme command crashed MiniIDE while language reference was open."
    $titleAfterLight = [MiniIdeUiSmoke]::Text($hwnd)
    Assert-True ($titleAfterLight -notmatch "\*MiniLang Language Reference\.md") "Language reference was marked dirty after switching to the light theme."

    [MiniIdeUiSmoke]::PostMessage($hwnd, 0x0111, [IntPtr]1047, [IntPtr]0) | Out-Null
    Start-Sleep -Milliseconds 1200
    $p.Refresh()
    Assert-True (-not $p.HasExited) "Dark theme command crashed MiniIDE while language reference was open."
    $titleAfterDark = [MiniIdeUiSmoke]::Text($hwnd)
    Assert-True ($titleAfterDark -notmatch "\*MiniLang Language Reference\.md") "Language reference was marked dirty after switching to the dark theme."
  }
  finally {
    foreach ($cpid in $childPids) {
      try { Stop-Process -Id $cpid -Force -ErrorAction SilentlyContinue } catch {}
    }
    if ($p -and -not $p.HasExited) {
      $p.CloseMainWindow() | Out-Null
      Start-Sleep -Milliseconds 500
      if (-not $p.HasExited) { $p.Kill() }
    }
  }
}

New-CleanDir $TempRoot

try {
  Step "static wiring" { Test-StaticWiring }
  Step "markdown renderer" { Test-MarkdownRenderer }
  Step "project loader" { Test-ProjectLoader }
  Step "project index" { Test-ProjectIndex }
  Step "language service" { Test-LanguageService }
  Step "compile MiniIDE to temp" { Test-CompileMiniIde }
  if (-not $SkipUi) {
    Step "UI background compile smoke" { Test-UiBuildSmoke }
  }
  Write-Host "[test] OK"
}
finally {
  if (-not $KeepArtifacts) {
    if (Test-Path -LiteralPath $TempRoot) {
      Remove-WithRetry $TempRoot
    }
  }
}
