# Metrics

[Home](README.md)

Static metrics are calculated from target-specific preprocessed MiniLang files inside the configured source roots. External imported modules, generated documentation, and excluded paths are not measured.

## Project summary

| Metric | Value |
| --- | ---: |
| Blank lines | 1264 |
| Clone groups | 221 |
| Cognitive complexity | 5471 (maximum per function: 211) |
| Comment lines | 3882 |
| Cyclomatic complexity | 4572 (average: 5.78, maximum: 100) |
| Documentation coverage | 100% (3424 of 3424 documentation items) |
| Duplicated lines | 1622 (13.26%) |
| Files | 17 |
| Functions | 791 |
| Maintainability index | 1.71 / 100 |
| Physical lines | 17375 |
| Source lines | 12229 |
| Statements | 10353 |

## Documentation coverage

Coverage is split by documentation contract so strong API summaries cannot hide undocumented parameters or data members.

| Category | Documented | Total | Coverage |
| --- | ---: | ---: | ---: |
| API declarations | 929 | 929 | 100% |
| Constants | 424 | 424 | 100% |
| Enum variants | 0 | 0 | 100% |
| Fields | 302 | 302 | 100% |
| Globals | 1 | 1 | 100% |
| Overall | 3424 | 3424 | 100% |
| Parameters | 1768 | 1768 | 100% |

## Halstead metrics

| Distinct operators | Distinct operands | Total operators | Total operands | Vocabulary | Length | Volume | Difficulty | Effort | Estimated defects |
| ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| 44 | 4284 | 58537 | 44195 | 4328 | 102732 | 1240949.63 | 226.96 | 281644004.8 | 413.65 |

## Files

| File | SLOC | Functions | Cyclomatic total / avg / max | Cognitive total / max | Duplication | Halstead volume | MI |
| --- | ---: | ---: | --- | --- | --- | ---: | ---: |
| [`src/ai/assistant.ml`](File-src-ai-assistant-ml-1857925730.md) | 139 | 12 | 71 / 5.92 / 10 | 66 / 11 | 0 (0%) | 8938.51 | 16.04 |
| [`src/ai/provider.ml`](File-src-ai-provider-ml-178084207.md) | 522 | 30 | 208 / 6.93 / 17 | 246 / 28 | 52 (9.96%) | 38471.23 | 0 |
| [`src/build/build_service.ml`](File-src-build-build-service-ml-412506232.md) | 750 | 53 | 217 / 4.09 / 14 | 200 / 27 | 144 (19.2%) | 49693.61 | 0 |
| [`src/editor/buffer.ml`](File-src-editor-buffer-ml-1966067569.md) | 279 | 26 | 101 / 3.88 / 15 | 80 / 14 | 12 (4.3%) | 15207.66 | 3.78 |
| [`src/help/language.ml`](File-src-help-language-ml-591952903.md) | 69 | 5 | 31 / 6.2 / 10 | 34 / 17 | 0 (0%) | 4036.82 | 30.47 |
| [`src/lang/index.ml`](File-src-lang-index-ml-680000828.md) | 165 | 13 | 76 / 5.85 / 14 | 90 / 27 | 20 (12.12%) | 10846.17 | 13.15 |
| [`src/lang/service.ml`](File-src-lang-service-ml-621944297.md) | 944 | 47 | 505 / 10.74 / 31 | 671 / 64 | 94 (9.96%) | 71730.13 | 0 |
| [`src/lang/symbols.ml`](File-src-lang-symbols-ml-2023047483.md) | 147 | 9 | 64 / 7.11 / 16 | 80 / 25 | 11 (7.48%) | 8202.13 | 16.71 |
| [`src/lang/syntax.ml`](File-src-lang-syntax-ml-2103667443.md) | 132 | 9 | 43 / 4.78 / 31 | 73 / 68 | 0 (0%) | 5693.93 | 21.66 |
| [`src/main.ml`](File-src-main-ml-186468670.md) | 6662 | 358 | 2413 / 6.74 / 100 | 3144 / 211 | 1077 (16.17%) | 647146.58 | 0 |
| [`src/platform/win32.ml`](File-src-platform-win32-ml-830830664.md) | 1077 | 117 | 279 / 2.38 / 14 | 165 / 13 | 102 (9.47%) | 80961.24 | 0 |
| [`src/project/config.ml`](File-src-project-config-ml-1589199733.md) | 44 | 6 | 26 / 4.33 / 11 | 23 / 13 | 0 (0%) | 2635.62 | 36.7 |
| [`src/project/project.ml`](File-src-project-project-ml-1533851532.md) | 275 | 23 | 127 / 5.52 / 21 | 174 / 56 | 25 (9.09%) | 16178.73 | 0.24 |
| [`src/project/templates.ml`](File-src-project-templates-ml-1433524490.md) | 76 | 9 | 27 / 3 / 7 | 18 / 6 | 7 (9.21%) | 4034.91 | 30.09 |
| [`src/ui/commands.ml`](File-src-ui-commands-ml-847810634.md) | 123 | 10 | 58 / 5.8 / 14 | 59 / 14 | 11 (8.94%) | 9252.73 | 18.84 |
| [`src/ui/markdown.ml`](File-src-ui-markdown-ml-707379131.md) | 776 | 55 | 299 / 5.44 / 24 | 325 / 48 | 67 (8.63%) | 54385.88 | 0 |
| [`src/ui/theme.ml`](File-src-ui-theme-ml-499196665.md) | 49 | 9 | 27 / 3 / 12 | 23 / 16 | 0 (0%) | 3282.66 | 34.88 |

## Functions

| Function | Location | LOC | Statements | Cyclomatic | Cognitive | Max nesting | Halstead volume | MI |
| --- | --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| [`_about`](File-src-main-ml-186468670.md#function-function-about-function-about-st-src-main-ml-595391558) | `src/main.ml:6335` | 4 | 2 | 1 | 0 | 0 | 89.86 | 73.05 |
| [`_accept_autocomplete`](File-src-main-ml-186468670.md#function-function-accept-autocomplete-function-accept-autocomplete-st-src-main-ml-247667462) | `src/main.ml:4559` | 17 | 19 | 7 | 6 | 1 | 893.59 | 51.55 |
| [`_activate_tab`](File-src-main-ml-186468670.md#function-function-activate-tab-function-activate-tab-st-idx-src-main-ml-437663059) | `src/main.ml:2491` | 22 | 25 | 7 | 6 | 1 | 1083.62 | 48.52 |
| [`_active_dirty`](File-src-main-ml-186468670.md#function-function-active-dirty-function-active-dirty-st-src-main-ml-1132970574) | `src/main.ml:726` | 8 | 8 | 6 | 6 | 2 | 385.44 | 61.39 |
| [`_active_folds`](File-src-main-ml-186468670.md#function-function-active-folds-function-active-folds-st-src-main-ml-540173886) | `src/main.ml:1690` | 3 | 1 | 1 | 0 | 0 | 31.7 | 78.95 |
| [`_active_is_markdown`](File-src-main-ml-186468670.md#function-function-active-is-markdown-function-active-is-markdown-st-src-main-ml-1676987966) | `src/main.ml:1916` | 4 | 3 | 3 | 2 | 1 | 180.09 | 70.67 |
| [`_active_live_diagnostics_text`](File-src-main-ml-186468670.md#function-function-active-live-diagnostics-text-function-active-live-diagnostics-text-st-src-main-ml-890238588) | `src/main.ml:7549` | 50 | 43 | 26 | 75 | 8 | 2587.52 | 35.54 |
| [`_all_line_numbers_text`](File-src-main-ml-186468670.md#function-function-all-line-numbers-text-function-all-line-numbers-text-count-src-main-ml-1228934064) | `src/main.ml:7481` | 11 | 10 | 5 | 5 | 2 | 309.07 | 59.18 |
| [`_alt_down`](File-src-main-ml-186468670.md#function-function-alt-down-function-alt-down-src-main-ml-509192441) | `src/main.ml:6701` | 3 | 1 | 1 | 0 | 0 | 49.83 | 77.57 |
| [`_api_key_mode_combo_index`](File-src-main-ml-186468670.md#function-function-api-key-mode-combo-index-function-api-key-mode-combo-index-mode-src-main-ml-1018505324) | `src/main.ml:3747` | 5 | 4 | 2 | 1 | 1 | 106.27 | 70.29 |
| [`_api_key_mode_from_combo`](File-src-main-ml-186468670.md#function-function-api-key-mode-from-combo-function-api-key-mode-from-combo-key-mode-combo-src-main-ml-1189444117) | `src/main.ml:3755` | 5 | 4 | 2 | 1 | 1 | 108.42 | 70.23 |
| [`_apply_compile_settings`](File-src-main-ml-186468670.md#function-function-apply-compile-settings-function-apply-compile-settings-st-dlg-values-keep-going-subsystem-src-main-ml-172881274) | `src/main.ml:4016` | 46 | 44 | 10 | 9 | 1 | 2547.74 | 38.53 |
| [`_apply_rename_symbol`](File-src-main-ml-186468670.md#function-function-apply-rename-symbol-function-apply-rename-symbol-st-word-new-name-src-main-ml-1602537454) | `src/main.ml:5623` | 16 | 17 | 5 | 4 | 1 | 1056.94 | 51.89 |
| [`_apply_syntax_highlight`](File-src-main-ml-186468670.md#function-function-apply-syntax-highlight-function-apply-syntax-highlight-st-src-main-ml-1922084294) | `src/main.ml:1945` | 52 | 49 | 18 | 45 | 6 | 2886.33 | 35.92 |
| [`_apply_theme`](File-src-main-ml-186468670.md#function-function-apply-theme-function-apply-theme-st-src-main-ml-8455698) | `src/main.ml:2216` | 45 | 40 | 4 | 4 | 2 | 3340.69 | 38.72 |
| [`_assistant_append`](File-src-main-ml-186468670.md#function-function-assistant-append-function-assistant-append-st-role-text-src-main-ml-260957019) | `src/main.ml:996` | 8 | 10 | 6 | 5 | 1 | 422.59 | 61.11 |
| [`_assistant_diagnostics_text`](File-src-main-ml-186468670.md#function-function-assistant-diagnostics-text-function-assistant-diagnostics-text-st-src-main-ml-2071938194) | `src/main.ml:1124` | 28 | 26 | 9 | 14 | 3 | 1422.8 | 45.14 |
| [`_assistant_execute_tool_call`](File-src-main-ml-186468670.md#function-function-assistant-execute-tool-call-function-assistant-execute-tool-call-st-call-src-main-ml-1969974418) | `src/main.ml:1229` | 48 | 38 | 17 | 19 | 2 | 2998.26 | 36.69 |
| [`_assistant_execute_tool_calls`](File-src-main-ml-186468670.md#function-function-assistant-execute-tool-calls-function-assistant-execute-tool-calls-st-calls-src-main-ml-439741637) | `src/main.ml:1281` | 20 | 18 | 6 | 7 | 2 | 764.32 | 50.62 |
| [`_assistant_json_arg`](File-src-main-ml-186468670.md#function-function-assistant-json-arg-function-assistant-json-arg-args-name-src-main-ml-963833491) | `src/main.ml:1014` | 3 | 1 | 1 | 0 | 0 | 64.53 | 76.79 |
| [`_assistant_path_inside_project`](File-src-main-ml-186468670.md#function-function-assistant-path-inside-project-function-assistant-path-inside-project-st-path-src-main-ml-628246135) | `src/main.ml:1021` | 13 | 13 | 9 | 9 | 2 | 665.24 | 54.72 |
| [`_assistant_references_text`](File-src-main-ml-186468670.md#function-function-assistant-references-text-function-assistant-references-text-st-word-src-main-ml-2065973894) | `src/main.ml:1175` | 19 | 18 | 8 | 8 | 2 | 1147.64 | 49.6 |
| [`_assistant_replace_in_project_file`](File-src-main-ml-186468670.md#function-function-assistant-replace-in-project-file-function-assistant-replace-in-project-file-st-rel-path-old-text-new-text-src-main-ml-325833132) | `src/main.ml:1103` | 18 | 24 | 10 | 9 | 1 | 1689.37 | 48.67 |
| [`_assistant_resolve_project_tool_path`](File-src-main-ml-186468670.md#function-function-assistant-resolve-project-tool-path-function-assistant-resolve-project-tool-path-st-rel-path-src-main-ml-1278915215) | `src/main.ml:1038` | 8 | 9 | 5 | 4 | 1 | 512.93 | 60.65 |
| [`_assistant_selection_text`](File-src-main-ml-186468670.md#function-function-assistant-selection-text-function-assistant-selection-text-st-src-main-ml-848158542) | `src/main.ml:1197` | 28 | 32 | 11 | 10 | 1 | 1710.56 | 44.31 |
| [`_assistant_send`](File-src-main-ml-186468670.md#function-function-assistant-send-function-assistant-send-st-src-main-ml-775016238) | `src/main.ml:1327` | 62 | 49 | 19 | 25 | 3 | 3046.05 | 33.95 |
| [`_assistant_show_context`](File-src-main-ml-186468670.md#function-function-assistant-show-context-function-assistant-show-context-st-src-main-ml-2096636560) | `src/main.ml:1392` | 4 | 2 | 1 | 0 | 0 | 92.51 | 72.96 |
| [`_assistant_symbols_text`](File-src-main-ml-186468670.md#function-function-assistant-symbols-text-function-assistant-symbols-text-st-query-src-main-ml-434226332) | `src/main.ml:1157` | 14 | 14 | 7 | 7 | 2 | 943.13 | 53.23 |
| [`_assistant_sync_written_file`](File-src-main-ml-186468670.md#function-function-assistant-sync-written-file-function-assistant-sync-written-file-st-path-text-src-main-ml-1955420686) | `src/main.ml:1059` | 20 | 19 | 6 | 9 | 2 | 889.89 | 50.16 |
| [`_assistant_tool_context`](File-src-main-ml-186468670.md#function-function-assistant-tool-context-function-assistant-tool-context-st-src-main-ml-1205491374) | `src/main.ml:1007` | 3 | 1 | 1 | 0 | 0 | 211.77 | 73.17 |
| [`_assistant_write_project_file`](File-src-main-ml-186468670.md#function-function-assistant-write-project-file-function-assistant-write-project-file-st-rel-path-content-src-main-ml-1077274930) | `src/main.ml:1084` | 13 | 16 | 6 | 5 | 1 | 960.61 | 54.01 |
| [`_assistant_write_tools_enabled`](File-src-main-ml-186468670.md#function-function-assistant-write-tools-enabled-function-assistant-write-tools-enabled-st-src-main-ml-1874810510) | `src/main.ml:1049` | 5 | 4 | 2 | 1 | 1 | 165 | 68.96 |
| [`_autocomplete`](File-src-main-ml-186468670.md#function-function-autocomplete-function-autocomplete-st-src-main-ml-1355203952) | `src/main.ml:4579` | 23 | 22 | 9 | 10 | 2 | 1275.89 | 47.34 |
| [`_basename`](File-src-main-ml-186468670.md#function-function-basename-function-basename-path-src-main-ml-1671612980) | `src/main.ml:679` | 3 | 1 | 1 | 0 | 0 | 46.51 | 77.78 |
| [`_build_project`](File-src-main-ml-186468670.md#function-function-build-project-function-build-project-st-src-main-ml-817561290) | `src/main.ml:2965` | 9 | 7 | 3 | 2 | 1 | 307.67 | 61.36 |
| [`_button_hit`](File-src-main-ml-186468670.md#function-function-button-hit-function-button-hit-st-mx-my-src-main-ml-1366445461) | `src/main.ml:6709` | 12 | 13 | 10 | 10 | 2 | 557.41 | 55.88 |
| [`_caret_status_text`](File-src-main-ml-186468670.md#function-function-caret-status-text-function-caret-status-text-st-src-main-ml-1924560030) | `src/main.ml:7523` | 12 | 13 | 5 | 4 | 1 | 582.52 | 56.42 |
| [`_check_editor_dirty`](File-src-main-ml-186468670.md#function-function-check-editor-dirty-function-check-editor-dirty-st-src-main-ml-2093041946) | `src/main.ml:2592` | 41 | 36 | 13 | 17 | 3 | 1845.26 | 40.2 |
| [`_clean_project`](File-src-main-ml-186468670.md#function-function-clean-project-function-clean-project-st-src-main-ml-1882043930) | `src/main.ml:3042` | 7 | 4 | 2 | 1 | 1 | 184.48 | 65.43 |
| [`_close_all_tabs`](File-src-main-ml-186468670.md#function-function-close-all-tabs-function-close-all-tabs-st-src-main-ml-236750150) | `src/main.ml:6993` | 38 | 36 | 6 | 8 | 3 | 1601.95 | 42.29 |
| [`_close_current_tab`](File-src-main-ml-186468670.md#function-function-close-current-tab-function-close-current-tab-st-src-main-ml-1932962966) | `src/main.ml:6926` | 3 | 1 | 1 | 0 | 0 | 55.35 | 77.25 |
| [`_close_other_tabs`](File-src-main-ml-186468670.md#function-function-close-other-tabs-function-close-other-tabs-st-src-main-ml-2031262628) | `src/main.ml:6932` | 57 | 62 | 26 | 30 | 3 | 3422.97 | 33.45 |
| [`_close_tab`](File-src-main-ml-186468670.md#function-function-close-tab-function-close-tab-st-idx-src-main-ml-1621358731) | `src/main.ml:6838` | 80 | 92 | 27 | 36 | 3 | 4997.05 | 28.96 |
| [`_command_palette_ids`](File-src-main-ml-186468670.md#function-function-command-palette-ids-function-command-palette-ids-src-main-ml-1880811487) | `src/main.ml:4606` | 13 | 1 | 1 | 0 | 0 | 1031.91 | 54.46 |
| [`_completion_display_text`](File-src-main-ml-186468670.md#function-function-completion-display-text-function-completion-display-text-st-item-src-main-ml-515642563) | `src/main.ml:4522` | 9 | 7 | 6 | 6 | 2 | 408.63 | 60.09 |
| [`_completion_insert_text`](File-src-main-ml-186468670.md#function-function-completion-insert-text-function-completion-insert-text-item-prefix-src-main-ml-1807631268) | `src/main.ml:4535` | 10 | 10 | 9 | 8 | 1 | 623.18 | 57.41 |
| [`_completion_item_label`](File-src-main-ml-186468670.md#function-function-completion-item-label-function-completion-item-label-item-src-main-ml-2080472914) | `src/main.ml:4509` | 9 | 9 | 6 | 7 | 2 | 301.6 | 61.02 |
| [`_confirm_exit_with_dirty_tabs`](File-src-main-ml-186468670.md#function-function-confirm-exit-with-dirty-tabs-function-confirm-exit-with-dirty-tabs-st-src-main-ml-499743044) | `src/main.ml:2775` | 9 | 9 | 3 | 2 | 1 | 441.12 | 60.26 |
| [`_copy_path_recursive`](File-src-main-ml-186468670.md#function-function-copy-path-recursive-function-copy-path-recursive-src-dest-src-main-ml-207467447) | `src/main.ml:7161` | 23 | 21 | 10 | 19 | 4 | 987.67 | 47.98 |
| [`_copy_tree_item`](File-src-main-ml-186468670.md#function-function-copy-tree-item-function-copy-tree-item-st-src-main-ml-1550352320) | `src/main.ml:7371` | 7 | 7 | 4 | 3 | 1 | 317.29 | 63.51 |
| [`_create_editor`](File-src-main-ml-186468670.md#function-function-create-editor-function-create-editor-parent-font-src-main-ml-798446928) | `src/main.ml:6349` | 11 | 8 | 2 | 1 | 1 | 599.71 | 57.56 |
| [`_create_line_numbers`](File-src-main-ml-186468670.md#function-function-create-line-numbers-function-create-line-numbers-parent-font-src-main-ml-1918632612) | `src/main.ml:6379` | 11 | 8 | 2 | 1 | 1 | 504.44 | 58.09 |
| [`_create_log`](File-src-main-ml-186468670.md#function-function-create-log-function-create-log-parent-font-src-main-ml-1708949064) | `src/main.ml:6364` | 11 | 8 | 2 | 1 | 1 | 524.62 | 57.97 |
| [`_create_markdown_view`](File-src-main-ml-186468670.md#function-function-create-markdown-view-function-create-markdown-view-st-src-main-ml-1132134868) | `src/main.ml:841` | 9 | 8 | 2 | 1 | 1 | 297.21 | 61.6 |
| [`_create_menu_label`](File-src-main-ml-186468670.md#function-function-create-menu-label-function-create-menu-label-parent-font-text-src-main-ml-2123584745) | `src/main.ml:6436` | 8 | 6 | 1 | 0 | 0 | 305.53 | 62.77 |
| [`_create_menus`](File-src-main-ml-186468670.md#function-function-create-menus-function-create-menus-src-main-ml-1273555695) | `src/main.ml:2289` | 102 | 100 | 1 | 0 | 0 | 10196.9 | 27.98 |
| [`_create_state`](File-src-main-ml-186468670.md#function-function-create-state-function-create-state-root-src-main-ml-1123921625) | `src/main.ml:6447` | 105 | 88 | 1 | 0 | 0 | 9898.85 | 27.8 |
| [`_create_tab_strip`](File-src-main-ml-186468670.md#function-function-create-tab-strip-function-create-tab-strip-parent-font-src-main-ml-247631016) | `src/main.ml:6394` | 5 | 3 | 1 | 0 | 0 | 116 | 70.16 |
| [`_create_toolbar_button`](File-src-main-ml-186468670.md#function-function-create-toolbar-button-function-create-toolbar-button-parent-font-text-control-id-src-main-ml-504411872) | `src/main.ml:6405` | 9 | 7 | 1 | 0 | 0 | 360.55 | 61.15 |
| [`_create_toolbar_icon`](File-src-main-ml-186468670.md#function-function-create-toolbar-icon-function-create-toolbar-icon-parent-font-glyph-code-src-main-ml-159154770) | `src/main.ml:6419` | 12 | 9 | 2 | 1 | 1 | 559.62 | 56.95 |
| [`_ctrl_down`](File-src-main-ml-186468670.md#function-function-ctrl-down-function-ctrl-down-src-main-ml-976891319) | `src/main.ml:6691` | 3 | 1 | 1 | 0 | 0 | 49.83 | 77.57 |
| [`_current_nav_location`](File-src-main-ml-186468670.md#function-function-current-nav-location-function-current-nav-location-st-src-main-ml-600292210) | `src/main.ml:1410` | 13 | 16 | 9 | 8 | 1 | 792.23 | 54.19 |
| [`_default_root`](File-src-main-ml-186468670.md#function-function-default-root-function-default-root-args-src-main-ml-312573278) | `src/main.ml:8525` | 8 | 7 | 7 | 6 | 1 | 346.13 | 61.58 |
| [`_delete_path_recursive`](File-src-main-ml-186468670.md#function-function-delete-path-recursive-function-delete-path-recursive-path-src-main-ml-2062469630) | `src/main.ml:7188` | 17 | 16 | 9 | 16 | 4 | 730.42 | 51.9 |
| [`_delete_tree_item`](File-src-main-ml-186468670.md#function-function-delete-tree-item-function-delete-tree-item-st-src-main-ml-778002360) | `src/main.ml:7356` | 12 | 14 | 6 | 5 | 1 | 678.28 | 55.83 |
| [`_destroy_all_markdown_views`](File-src-main-ml-186468670.md#function-function-destroy-all-markdown-views-function-destroy-all-markdown-views-st-src-main-ml-559407690) | `src/main.ml:859` | 7 | 5 | 3 | 2 | 1 | 218.26 | 64.78 |
| [`_destroy_markdown_view`](File-src-main-ml-186468670.md#function-function-destroy-markdown-view-function-destroy-markdown-view-view-src-main-ml-706470744) | `src/main.ml:853` | 3 | 2 | 2 | 1 | 1 | 75.28 | 76.18 |
| [`_diagnostic_near_log_line`](File-src-main-ml-186468670.md#function-function-diagnostic-near-log-line-function-diagnostic-near-log-line-lines-line-idx-src-main-ml-321296060) | `src/main.ml:1626` | 15 | 18 | 10 | 10 | 2 | 743.4 | 52.9 |
| [`_dirty_tab_names`](File-src-main-ml-186468670.md#function-function-dirty-tab-names-function-dirty-tab-names-st-src-main-ml-1958523406) | `src/main.ml:2743` | 12 | 11 | 8 | 12 | 3 | 553.96 | 56.17 |
| [`_display_to_source_line`](File-src-main-ml-186468670.md#function-function-display-to-source-line-function-display-to-source-line-text-folds-display-line-src-main-ml-578233489) | `src/main.ml:1789` | 19 | 17 | 6 | 7 | 2 | 559.62 | 52.06 |
| [`_edit_copy`](File-src-main-ml-186468670.md#function-function-edit-copy-function-edit-copy-st-src-main-ml-933702714) | `src/main.ml:6230` | 5 | 3 | 1 | 0 | 0 | 89.62 | 70.95 |
| [`_edit_cut`](File-src-main-ml-186468670.md#function-function-edit-cut-function-edit-cut-st-src-main-ml-1319391898) | `src/main.ml:6221` | 6 | 4 | 1 | 0 | 0 | 118.03 | 68.38 |
| [`_edit_paste`](File-src-main-ml-186468670.md#function-function-edit-paste-function-edit-paste-st-src-main-ml-1669736348) | `src/main.ml:6238` | 6 | 4 | 1 | 0 | 0 | 118.03 | 68.38 |
| [`_edit_redo`](File-src-main-ml-186468670.md#function-function-edit-redo-function-edit-redo-st-src-main-ml-79510078) | `src/main.ml:6296` | 13 | 14 | 6 | 5 | 1 | 777 | 54.65 |
| [`_edit_select_all`](File-src-main-ml-186468670.md#function-function-edit-select-all-function-edit-select-all-st-src-main-ml-2037089086) | `src/main.ml:6247` | 5 | 3 | 1 | 0 | 0 | 89.62 | 70.95 |
| [`_edit_undo`](File-src-main-ml-186468670.md#function-function-edit-undo-function-edit-undo-st-src-main-ml-2128150322) | `src/main.ml:6279` | 14 | 15 | 6 | 5 | 1 | 814.35 | 53.81 |
| [`_editor_display_text`](File-src-main-ml-186468670.md#function-function-editor-display-text-function-editor-display-text-text-src-main-ml-1839864682) | `src/main.ml:1683` | 4 | 2 | 1 | 0 | 0 | 93.77 | 72.92 |
| [`_effective_compiler`](File-src-main-ml-186468670.md#function-function-effective-compiler-function-effective-compiler-st-src-main-ml-1703856018) | `src/main.ml:2209` | 4 | 3 | 3 | 2 | 1 | 164.23 | 70.95 |
| [`_ensure_markdown_view_slots`](File-src-main-ml-186468670.md#function-function-ensure-markdown-view-slots-function-ensure-markdown-view-slots-st-src-main-ml-1258654872) | `src/main.ml:869` | 17 | 16 | 8 | 7 | 1 | 730.72 | 52.03 |
| [`_entry_file`](File-src-main-ml-186468670.md#function-function-entry-file-function-entry-file-p-src-main-ml-1659885693) | `src/main.ml:2417` | 5 | 4 | 2 | 1 | 1 | 130.8 | 69.66 |
| [`_find_fold_end`](File-src-main-ml-186468670.md#function-function-find-fold-end-function-find-fold-end-lines-start-line-src-main-ml-1195746453) | `src/main.ml:1743` | 18 | 18 | 9 | 12 | 3 | 656.55 | 51.68 |
| [`_find_next`](File-src-main-ml-186468670.md#function-function-find-next-function-find-next-st-src-main-ml-1072890150) | `src/main.ml:6162` | 4 | 3 | 3 | 2 | 1 | 168.56 | 70.87 |
| [`_find_next_in_editor`](File-src-main-ml-186468670.md#function-function-find-next-in-editor-function-find-next-in-editor-st-query-src-main-ml-1321585178) | `src/main.ml:6044` | 25 | 29 | 11 | 10 | 1 | 1376.34 | 46.05 |
| [`_find_references`](File-src-main-ml-186468670.md#function-function-find-references-function-find-references-st-src-main-ml-1292080110) | `src/main.ml:5762` | 27 | 29 | 9 | 9 | 2 | 1757.28 | 44.85 |
| [`_find_symbol`](File-src-main-ml-186468670.md#function-function-find-symbol-function-find-symbol-index-name-src-main-ml-1841440104) | `src/main.ml:6182` | 18 | 20 | 10 | 13 | 2 | 865.91 | 50.7 |
| [`_first_project_file`](File-src-main-ml-186468670.md#function-function-first-project-file-function-first-project-file-p-src-main-ml-377292685) | `src/main.ml:2402` | 11 | 9 | 8 | 8 | 2 | 544.4 | 57.05 |
| [`_fold_end_at`](File-src-main-ml-186468670.md#function-function-fold-end-at-function-fold-end-at-folds-source-line-src-main-ml-126617131) | `src/main.ml:1710` | 5 | 4 | 2 | 1 | 1 | 151.62 | 69.21 |
| [`_fold_end_kind`](File-src-main-ml-186468670.md#function-function-fold-end-kind-function-fold-end-kind-line-src-main-ml-1508690901) | `src/main.ml:1730` | 9 | 12 | 6 | 5 | 1 | 332.84 | 60.72 |
| [`_fold_index_at`](File-src-main-ml-186468670.md#function-function-fold-index-at-function-fold-index-at-folds-source-line-src-main-ml-732935307) | `src/main.ml:1697` | 8 | 7 | 6 | 6 | 2 | 345 | 61.72 |
| [`_fold_start_kind`](File-src-main-ml-186468670.md#function-function-fold-start-kind-function-fold-start-kind-line-src-main-ml-267904513) | `src/main.ml:1718` | 9 | 12 | 7 | 6 | 1 | 544.79 | 59.08 |
| [`_format_build_log`](File-src-main-ml-186468670.md#function-function-format-build-log-function-format-build-log-st-log-text-running-exit-code-src-main-ml-1097486985) | `src/main.ml:3101` | 56 | 45 | 24 | 26 | 2 | 2353.38 | 35.03 |
| [`_format_current`](File-src-main-ml-186468670.md#function-function-format-current-function-format-current-st-src-main-ml-1359701830) | `src/main.ml:4456` | 12 | 12 | 4 | 3 | 1 | 640.25 | 56.27 |
| [`_format_text_basic`](File-src-main-ml-186468670.md#function-function-format-text-basic-function-format-text-basic-text-src-main-ml-335668342) | `src/main.ml:4432` | 20 | 19 | 7 | 9 | 2 | 663.26 | 50.92 |
| [`_goto_bookmark`](File-src-main-ml-186468670.md#function-function-goto-bookmark-function-goto-bookmark-st-step-src-main-ml-531822804) | `src/main.ml:1552` | 27 | 28 | 14 | 20 | 3 | 1520.5 | 44.61 |
| [`_goto_definition`](File-src-main-ml-186468670.md#function-function-goto-definition-function-goto-definition-st-src-main-ml-1142371270) | `src/main.ml:6204` | 14 | 15 | 5 | 4 | 1 | 1033.71 | 53.22 |
| [`_goto_line_col`](File-src-main-ml-186468670.md#function-function-goto-line-col-function-goto-line-col-st-line-no-col-no-src-main-ml-896558158) | `src/main.ml:5887` | 5 | 3 | 1 | 0 | 0 | 175.14 | 68.91 |
| [`_goto_line_number`](File-src-main-ml-186468670.md#function-function-goto-line-number-function-goto-line-number-st-line-no-src-main-ml-889140700) | `src/main.ml:5896` | 3 | 1 | 1 | 0 | 0 | 62.27 | 76.89 |
| [`_guard_no_dirty`](File-src-main-ml-186468670.md#function-function-guard-no-dirty-function-guard-no-dirty-st-action-name-src-main-ml-1943146140) | `src/main.ml:2766` | 6 | 5 | 2 | 1 | 1 | 232.19 | 66.19 |
| [`_handle_command`](File-src-main-ml-186468670.md#function-function-handle-command-function-handle-command-st-msg-src-main-ml-1588832023) | `src/main.ml:8014` | 15 | 12 | 11 | 10 | 1 | 670 | 53.08 |
| [`_handle_context_menu`](File-src-main-ml-186468670.md#function-function-handle-context-menu-function-handle-context-menu-st-src-main-ml-281597994) | `src/main.ml:7863` | 4 | 2 | 1 | 0 | 0 | 135.93 | 71.79 |
| [`_handle_context_menu_at`](File-src-main-ml-186468670.md#function-function-handle-context-menu-at-function-handle-context-menu-at-st-mx-my-src-main-ml-1767988033) | `src/main.ml:7857` | 3 | 1 | 1 | 0 | 0 | 78.87 | 76.18 |
| [`_handle_context_menu_at_force`](File-src-main-ml-186468670.md#function-function-handle-context-menu-at-force-function-handle-context-menu-at-force-st-mx-my-force-src-main-ml-1819419538) | `src/main.ml:7832` | 19 | 21 | 16 | 17 | 2 | 1001.86 | 48.94 |
| [`_handle_hotkeys`](File-src-main-ml-186468670.md#function-function-handle-hotkeys-function-handle-hotkeys-st-src-main-ml-24960216) | `src/main.ml:8143` | 33 | 58 | 52 | 51 | 1 | 3262.88 | 35.28 |
| [`_handle_left_click`](File-src-main-ml-186468670.md#function-function-handle-left-click-function-handle-left-click-st-mx-my-src-main-ml-646818151) | `src/main.ml:8298` | 5 | 4 | 2 | 1 | 1 | 145.95 | 69.33 |
| [`_handle_mouse`](File-src-main-ml-186468670.md#function-function-handle-mouse-function-handle-mouse-st-src-main-ml-1262156464) | `src/main.ml:8306` | 17 | 14 | 8 | 9 | 2 | 848.91 | 51.58 |
| [`_handle_notify`](File-src-main-ml-186468670.md#function-function-handle-notify-function-handle-notify-st-msg-src-main-ml-1036470069) | `src/main.ml:7994` | 16 | 11 | 7 | 6 | 1 | 635.9 | 53.16 |
| [`_handle_set_cursor`](File-src-main-ml-186468670.md#function-function-handle-set-cursor-function-handle-set-cursor-st-msg-src-main-ml-1525399997) | `src/main.ml:8058` | 30 | 20 | 12 | 13 | 2 | 1077.9 | 44.93 |
| [`_handle_syscommand`](File-src-main-ml-186468670.md#function-function-handle-syscommand-function-handle-syscommand-st-msg-src-main-ml-635825021) | `src/main.ml:8116` | 24 | 18 | 5 | 4 | 1 | 640.64 | 49.57 |
| [`_handle_tab_click`](File-src-main-ml-186468670.md#function-function-handle-tab-click-function-handle-tab-click-st-tx-ty-src-main-ml-929207951) | `src/main.ml:6795` | 7 | 7 | 4 | 3 | 1 | 325.48 | 63.43 |
| [`_handle_tab_selection`](File-src-main-ml-186468670.md#function-function-handle-tab-selection-function-handle-tab-selection-st-src-main-ml-1548112314) | `src/main.ml:6782` | 8 | 9 | 5 | 4 | 1 | 344.92 | 61.86 |
| [`_handle_tree_click`](File-src-main-ml-186468670.md#function-function-handle-tree-click-function-handle-tree-click-st-clicked-mx-my-src-main-ml-949894192) | `src/main.ml:6727` | 24 | 26 | 13 | 14 | 2 | 1139.33 | 46.74 |
| [`_handle_window_button`](File-src-main-ml-186468670.md#function-function-handle-window-button-function-handle-window-button-st-hit-src-main-ml-1023682507) | `src/main.ml:8092` | 20 | 13 | 5 | 5 | 2 | 514.95 | 51.96 |
| [`_has_dirty_tabs`](File-src-main-ml-186468670.md#function-function-has-dirty-tabs-function-has-dirty-tabs-st-src-main-ml-1928797524) | `src/main.ml:2759` | 3 | 1 | 1 | 0 | 0 | 46.51 | 77.78 |
| [`_has_open_path_under`](File-src-main-ml-186468670.md#function-function-has-open-path-under-function-has-open-path-under-st-path-src-main-ml-1207731887) | `src/main.ml:7123` | 8 | 7 | 5 | 5 | 2 | 320 | 62.09 |
| [`_hide_autocomplete`](File-src-main-ml-186468670.md#function-function-hide-autocomplete-function-hide-autocomplete-st-src-main-ml-350476678) | `src/main.ml:4471` | 6 | 4 | 1 | 0 | 0 | 135.93 | 67.95 |
| [`_hide_markdown_views_except`](File-src-main-ml-186468670.md#function-function-hide-markdown-views-except-function-hide-markdown-views-except-st-keep-idx-src-main-ml-25152705) | `src/main.ml:890` | 8 | 7 | 5 | 5 | 2 | 350 | 61.81 |
| [`_initial_find_text`](File-src-main-ml-186468670.md#function-function-initial-find-text-function-initial-find-text-st-src-main-ml-1869683366) | `src/main.ml:6030` | 10 | 11 | 6 | 5 | 1 | 552.2 | 58.18 |
| [`_initial_symbol_search_text`](File-src-main-ml-186468670.md#function-function-initial-symbol-search-text-function-initial-symbol-search-text-st-src-main-ml-142189424) | `src/main.ml:5053` | 8 | 8 | 4 | 3 | 1 | 351.75 | 61.93 |
| [`_invalidate_highlight`](File-src-main-ml-186468670.md#function-function-invalidate-highlight-function-invalidate-highlight-st-src-main-ml-2127992256) | `src/main.ml:791` | 6 | 4 | 1 | 0 | 0 | 100 | 68.89 |
| [`_invalidate_markdown_view`](File-src-main-ml-186468670.md#function-function-invalidate-markdown-view-function-invalidate-markdown-view-st-idx-src-main-ml-1398792731) | `src/main.ml:902` | 7 | 8 | 4 | 3 | 1 | 294.32 | 63.74 |
| [`_is_abs`](File-src-main-ml-186468670.md#function-function-is-abs-function-is-abs-path-src-main-ml-1295470934) | `src/main.ml:662` | 6 | 7 | 6 | 5 | 1 | 309.13 | 64.78 |
| [`_is_generated_editor_path`](File-src-main-ml-186468670.md#function-function-is-generated-editor-path-function-is-generated-editor-path-path-src-main-ml-1104378632) | `src/main.ml:719` | 4 | 3 | 2 | 1 | 1 | 78.87 | 73.32 |
| [`_is_markdown_path`](File-src-main-ml-186468670.md#function-function-is-markdown-path-function-is-markdown-path-path-src-main-ml-386481376) | `src/main.ml:705` | 5 | 4 | 2 | 1 | 1 | 203.56 | 68.32 |
| [`_is_readonly_tab_path`](File-src-main-ml-186468670.md#function-function-is-readonly-tab-path-function-is-readonly-tab-path-path-src-main-ml-610721950) | `src/main.ml:713` | 3 | 1 | 1 | 0 | 0 | 36 | 78.56 |
| [`_is_test_file_path`](File-src-main-ml-186468670.md#function-function-is-test-file-path-function-is-test-file-path-path-src-main-ml-287009850) | `src/main.ml:3004` | 5 | 4 | 3 | 2 | 1 | 416.15 | 66.01 |
| [`_is_virtual_doc_path`](File-src-main-ml-186468670.md#function-function-is-virtual-doc-path-function-is-virtual-doc-path-path-src-main-ml-1200992914) | `src/main.ml:699` | 3 | 1 | 1 | 0 | 0 | 92 | 75.71 |
| [`_is_word_char`](File-src-main-ml-186468670.md#function-function-is-word-char-function-is-word-char-ch-src-main-ml-1018606672) | `src/main.ml:4371` | 8 | 9 | 6 | 5 | 1 | 465.29 | 60.81 |
| [`_join_imports`](File-src-main-ml-186468670.md#function-function-join-imports-function-join-imports-imports-src-main-ml-530298815) | `src/main.ml:2277` | 9 | 8 | 5 | 5 | 2 | 314.04 | 61.03 |
| [`_jump_to_line_col`](File-src-main-ml-186468670.md#function-function-jump-to-line-col-function-jump-to-line-col-st-line-no-col-no-src-main-ml-1027528648) | `src/main.ml:5864` | 18 | 24 | 11 | 10 | 1 | 1008.36 | 50.11 |
| [`_key_pressed`](File-src-main-ml-186468670.md#function-function-key-pressed-function-key-pressed-st-vk-src-main-ml-744012791) | `src/main.ml:6682` | 7 | 8 | 3 | 2 | 1 | 302.86 | 63.79 |
| [`_language_help_path`](File-src-main-ml-186468670.md#function-function-language-help-path-function-language-help-path-st-src-main-ml-1596887068) | `src/main.ml:4250` | 5 | 4 | 2 | 1 | 1 | 180.09 | 68.69 |
| [`_layout`](File-src-main-ml-186468670.md#function-function-layout-function-layout-st-src-main-ml-191920880) | `src/main.ml:6587` | 87 | 86 | 6 | 5 | 1 | 6732.47 | 30.08 |
| [`_line_label`](File-src-main-ml-186468670.md#function-function-line-label-function-line-label-line-no-marker-src-main-ml-1249255787) | `src/main.ml:7453` | 7 | 4 | 2 | 1 | 1 | 133.44 | 66.41 |
| [`_live_diagnostics_key`](File-src-main-ml-186468670.md#function-function-live-diagnostics-key-function-live-diagnostics-key-st-src-main-ml-1122687862) | `src/main.ml:7538` | 8 | 9 | 5 | 4 | 1 | 456.65 | 61.01 |
| [`_load_assistant_allow_insecure_tls`](File-src-main-ml-186468670.md#function-function-load-assistant-allow-insecure-tls-function-load-assistant-allow-insecure-tls-p-src-main-ml-858354285) | `src/main.ml:2121` | 3 | 1 | 1 | 0 | 0 | 66.61 | 76.69 |
| [`_load_assistant_api_key`](File-src-main-ml-186468670.md#function-function-load-assistant-api-key-function-load-assistant-api-key-p-src-main-ml-1526661587) | `src/main.ml:2103` | 3 | 1 | 1 | 0 | 0 | 66.61 | 76.69 |
| [`_load_assistant_api_key_env`](File-src-main-ml-186468670.md#function-function-load-assistant-api-key-env-function-load-assistant-api-key-env-p-src-main-ml-1049790111) | `src/main.ml:2097` | 3 | 1 | 1 | 0 | 0 | 66.61 | 76.69 |
| [`_load_assistant_api_key_mode`](File-src-main-ml-186468670.md#function-function-load-assistant-api-key-mode-function-load-assistant-api-key-mode-p-src-main-ml-1414728929) | `src/main.ml:2091` | 3 | 1 | 1 | 0 | 0 | 89.86 | 75.78 |
| [`_load_assistant_base_url`](File-src-main-ml-186468670.md#function-function-load-assistant-base-url-function-load-assistant-base-url-p-src-main-ml-508941741) | `src/main.ml:2085` | 3 | 1 | 1 | 0 | 0 | 66.61 | 76.69 |
| [`_load_assistant_model`](File-src-main-ml-186468670.md#function-function-load-assistant-model-function-load-assistant-model-p-src-main-ml-9244233) | `src/main.ml:2109` | 3 | 1 | 1 | 0 | 0 | 66.61 | 76.69 |
| [`_load_assistant_provider`](File-src-main-ml-186468670.md#function-function-load-assistant-provider-function-load-assistant-provider-p-src-main-ml-966527369) | `src/main.ml:2079` | 3 | 1 | 1 | 0 | 0 | 89.86 | 75.78 |
| [`_load_assistant_tool_mode`](File-src-main-ml-186468670.md#function-function-load-assistant-tool-mode-function-load-assistant-tool-mode-p-src-main-ml-415087275) | `src/main.ml:2115` | 3 | 1 | 1 | 0 | 0 | 89.86 | 75.78 |
| [`_load_build_config`](File-src-main-ml-186468670.md#function-function-load-build-config-function-load-build-config-st-src-main-ml-1579889566) | `src/main.ml:2127` | 34 | 19 | 6 | 5 | 1 | 2001.81 | 42.67 |
| [`_load_build_extra_args`](File-src-main-ml-186468670.md#function-function-load-build-extra-args-function-load-build-extra-args-p-src-main-ml-1647935005) | `src/main.ml:2073` | 3 | 1 | 1 | 0 | 0 | 66.61 | 76.69 |
| [`_load_build_keep_going`](File-src-main-ml-186468670.md#function-function-load-build-keep-going-function-load-build-keep-going-p-src-main-ml-1384310777) | `src/main.ml:2051` | 3 | 1 | 1 | 0 | 0 | 66.61 | 76.69 |
| [`_load_build_max_errors`](File-src-main-ml-186468670.md#function-function-load-build-max-errors-function-load-build-max-errors-p-src-main-ml-1558007649) | `src/main.ml:2057` | 5 | 4 | 2 | 1 | 1 | 131.69 | 69.64 |
| [`_load_build_profile`](File-src-main-ml-186468670.md#function-function-load-build-profile-function-load-build-profile-p-src-main-ml-868623209) | `src/main.ml:2017` | 5 | 4 | 2 | 1 | 1 | 153.73 | 69.17 |
| [`_load_build_subsystem`](File-src-main-ml-186468670.md#function-function-load-build-subsystem-function-load-build-subsystem-p-src-main-ml-1499050301) | `src/main.ml:2065` | 5 | 4 | 3 | 2 | 1 | 176.42 | 68.62 |
| [`_load_compiler_path`](File-src-main-ml-186468670.md#function-function-load-compiler-path-function-load-compiler-path-p-src-main-ml-844049375) | `src/main.ml:2045` | 3 | 1 | 1 | 0 | 0 | 66.61 | 76.69 |
| [`_load_msftedit`](File-src-main-ml-186468670.md#function-function-load-msftedit-function-load-msftedit-src-main-ml-174168159) | `src/main.ml:6341` | 4 | 2 | 1 | 0 | 0 | 57.36 | 74.42 |
| [`_load_theme_mode`](File-src-main-ml-186468670.md#function-function-load-theme-mode-function-load-theme-mode-p-src-main-ml-2139519421) | `src/main.ml:2025` | 5 | 4 | 2 | 1 | 1 | 153.73 | 69.17 |
| [`_log_clear`](File-src-main-ml-186468670.md#function-function-log-clear-function-log-clear-st-src-main-ml-1544598422) | `src/main.ml:6328` | 4 | 2 | 1 | 0 | 0 | 70.31 | 73.8 |
| [`_log_copy`](File-src-main-ml-186468670.md#function-function-log-copy-function-log-copy-st-src-main-ml-235302320) | `src/main.ml:6312` | 5 | 3 | 1 | 0 | 0 | 89.62 | 70.95 |
| [`_log_diagnostic_at`](File-src-main-ml-186468670.md#function-function-log-diagnostic-at-function-log-diagnostic-at-st-x-y-src-main-ml-39743723) | `src/main.ml:1657` | 6 | 5 | 3 | 2 | 1 | 288.44 | 65.4 |
| [`_log_lines`](File-src-main-ml-186468670.md#function-function-log-lines-function-log-lines-text-src-main-ml-714716210) | `src/main.ml:1616` | 6 | 5 | 2 | 1 | 1 | 236.35 | 66.14 |
| [`_log_select_all`](File-src-main-ml-186468670.md#function-function-log-select-all-function-log-select-all-st-src-main-ml-1438328266) | `src/main.ml:6320` | 5 | 3 | 1 | 0 | 0 | 89.62 | 70.95 |
| [`_mark_active_dirty_pending`](File-src-main-ml-186468670.md#function-function-mark-active-dirty-pending-function-mark-active-dirty-pending-st-src-main-ml-40573402) | `src/main.ml:912` | 19 | 16 | 6 | 5 | 1 | 682.44 | 51.45 |
| [`_markdown_view_is_live`](File-src-main-ml-186468670.md#function-function-markdown-view-is-live-function-markdown-view-is-live-view-src-main-ml-1243441284) | `src/main.ml:834` | 4 | 3 | 2 | 1 | 1 | 104 | 72.47 |
| [`_mask_secret`](File-src-main-ml-186468670.md#function-function-mask-secret-function-mask-secret-text-src-main-ml-221373266) | `src/main.ml:3572` | 5 | 5 | 4 | 3 | 1 | 249.12 | 67.43 |
| [`_menu_label_index_for_hwnd`](File-src-main-ml-186468670.md#function-function-menu-label-index-for-hwnd-function-menu-label-index-for-hwnd-st-hwnd-src-main-ml-760173663) | `src/main.ml:7697` | 7 | 6 | 5 | 5 | 2 | 297.25 | 63.58 |
| [`_module_source`](File-src-main-ml-186468670.md#function-function-module-source-function-module-source-path-src-main-ml-680738110) | `src/main.ml:7147` | 4 | 2 | 1 | 0 | 0 | 83.76 | 73.27 |
| [`_mouse_over_log_diagnostic`](File-src-main-ml-186468670.md#function-function-mouse-over-log-diagnostic-function-mouse-over-log-diagnostic-st-x-y-src-main-ml-33962299) | `src/main.ml:1668` | 3 | 1 | 1 | 0 | 0 | 95.18 | 75.6 |
| [`_move_command_palette_selection`](File-src-main-ml-186468670.md#function-function-move-command-palette-selection-function-move-command-palette-selection-command-list-visible-ids-delta-src-main-ml-1530093710) | `src/main.ml:4664` | 8 | 11 | 6 | 5 | 1 | 440.92 | 60.98 |
| [`_move_menu_label`](File-src-main-ml-186468670.md#function-function-move-menu-label-function-move-menu-label-st-idx-x-w-src-main-ml-232880692) | `src/main.ml:6576` | 8 | 9 | 5 | 4 | 1 | 432.38 | 61.17 |
| [`_move_toolbar_icon`](File-src-main-ml-186468670.md#function-function-move-toolbar-icon-function-move-toolbar-icon-st-idx-x-y-src-main-ml-725857222) | `src/main.ml:6562` | 8 | 9 | 5 | 4 | 1 | 412.08 | 61.32 |
| [`_navigate_back`](File-src-main-ml-186468670.md#function-function-navigate-back-function-navigate-back-st-src-main-ml-884770530) | `src/main.ml:1480` | 9 | 9 | 4 | 3 | 1 | 668.65 | 58.86 |
| [`_navigate_forward`](File-src-main-ml-186468670.md#function-function-navigate-forward-function-navigate-forward-st-src-main-ml-1880854766) | `src/main.ml:1492` | 9 | 9 | 4 | 3 | 1 | 668.65 | 58.86 |
| [`_new_project_create_from_dialog`](File-src-main-ml-186468670.md#function-function-new-project-create-from-dialog-function-new-project-create-from-dialog-dlg-name-edit-parent-edit-kind-combo-default-parent-src-main-ml-151921598) | `src/main.ml:3331` | 21 | 18 | 6 | 5 | 1 | 939.02 | 49.54 |
| [`_new_standard_project`](File-src-main-ml-186468670.md#function-function-new-standard-project-function-new-standard-project-st-src-main-ml-2134624164) | `src/main.ml:3364` | 104 | 88 | 34 | 84 | 5 | 5665.49 | 25.15 |
| [`_new_tree_file`](File-src-main-ml-186468670.md#function-function-new-tree-file-function-new-tree-file-st-src-main-ml-392739830) | `src/main.ml:7209` | 9 | 8 | 2 | 1 | 1 | 400 | 60.7 |
| [`_new_tree_folder`](File-src-main-ml-186468670.md#function-function-new-tree-folder-function-new-tree-folder-st-src-main-ml-1977349258) | `src/main.ml:7233` | 8 | 7 | 2 | 1 | 1 | 298.06 | 62.71 |
| [`_new_tree_test_file`](File-src-main-ml-186468670.md#function-function-new-tree-test-file-function-new-tree-test-file-st-src-main-ml-484405178) | `src/main.ml:7221` | 9 | 8 | 2 | 1 | 1 | 400 | 60.7 |
| [`_norm_path_key`](File-src-main-ml-186468670.md#function-function-norm-path-key-function-norm-path-key-path-src-main-ml-1469665026) | `src/main.ml:7102` | 5 | 4 | 2 | 1 | 1 | 169.46 | 68.88 |
| [`_normalize_editor_text`](File-src-main-ml-186468670.md#function-function-normalize-editor-text-function-normalize-editor-text-text-src-main-ml-1899146826) | `src/main.ml:1674` | 6 | 5 | 2 | 1 | 1 | 197.65 | 66.68 |
| [`_normalize_project_kind`](File-src-main-ml-186468670.md#function-function-normalize-project-kind-function-normalize-project-kind-value-src-main-ml-591124080) | `src/main.ml:3310` | 6 | 6 | 3 | 2 | 1 | 185.84 | 66.73 |
| [`_on_off`](File-src-main-ml-186468670.md#function-function-on-off-function-on-off-value-src-main-ml-946182698) | `src/main.ml:3705` | 4 | 3 | 2 | 1 | 1 | 55.35 | 74.39 |
| [`_open_assistant_settings_window`](File-src-main-ml-186468670.md#function-function-open-assistant-settings-window-function-open-assistant-settings-window-st-src-main-ml-303035896) | `src/main.ml:3820` | 126 | 117 | 52 | 136 | 5 | 10108.29 | 19.15 |
| [`_open_command_palette`](File-src-main-ml-186468670.md#function-function-open-command-palette-function-open-command-palette-st-src-main-ml-729060748) | `src/main.ml:4686` | 120 | 102 | 42 | 116 | 5 | 6807.01 | 22.16 |
| [`_open_compile_settings_window`](File-src-main-ml-186468670.md#function-function-open-compile-settings-window-function-open-compile-settings-window-st-src-main-ml-1999713518) | `src/main.ml:4069` | 163 | 137 | 52 | 152 | 5 | 10890.25 | 16.48 |
| [`_open_file`](File-src-main-ml-186468670.md#function-function-open-file-function-open-file-st-path-src-main-ml-200777679) | `src/main.ml:2517` | 29 | 29 | 8 | 8 | 2 | 1718.91 | 44.37 |
| [`_open_file_structure_window`](File-src-main-ml-186468670.md#function-function-open-file-structure-window-function-open-file-structure-window-st-src-main-ml-1715576376) | `src/main.ml:5158` | 3 | 1 | 1 | 0 | 0 | 36 | 78.56 |
| [`_open_find_window`](File-src-main-ml-186468670.md#function-function-open-find-window-function-open-find-window-st-src-main-ml-1508121906) | `src/main.ml:6072` | 82 | 70 | 31 | 69 | 4 | 3930.06 | 28.91 |
| [`_open_goto_line_window`](File-src-main-ml-186468670.md#function-function-open-goto-line-window-function-open-goto-line-window-st-src-main-ml-1249447094) | `src/main.ml:5915` | 95 | 81 | 36 | 86 | 5 | 4765.75 | 26.26 |
| [`_open_goto_symbol_window`](File-src-main-ml-186468670.md#function-function-open-goto-symbol-window-function-open-goto-symbol-window-st-src-main-ml-1726160226) | `src/main.ml:5064` | 86 | 73 | 29 | 67 | 4 | 4028.22 | 28.66 |
| [`_open_language_help`](File-src-main-ml-186468670.md#function-function-open-language-help-function-open-language-help-st-src-main-ml-824251998) | `src/main.ml:4258` | 7 | 7 | 3 | 2 | 1 | 366.61 | 63.21 |
| [`_open_language_help_search`](File-src-main-ml-186468670.md#function-function-open-language-help-search-function-open-language-help-search-st-src-main-ml-1552731006) | `src/main.ml:4282` | 81 | 68 | 29 | 67 | 4 | 3700.75 | 29.48 |
| [`_open_log_diagnostic_at`](File-src-main-ml-186468670.md#function-function-open-log-diagnostic-at-function-open-log-diagnostic-at-st-x-y-src-main-ml-2002806539) | `src/main.ml:1647` | 5 | 4 | 2 | 1 | 1 | 226.18 | 68 |
| [`_open_nav_location`](File-src-main-ml-186468670.md#function-function-open-nav-location-function-open-nav-location-st-loc-src-main-ml-1124933600) | `src/main.ml:1472` | 5 | 4 | 2 | 1 | 1 | 193.26 | 68.48 |
| [`_open_problem_location`](File-src-main-ml-186468670.md#function-function-open-problem-location-function-open-problem-location-st-file-line-no-col-no-src-main-ml-223425820) | `src/main.ml:1587` | 11 | 14 | 7 | 6 | 1 | 504.02 | 57.42 |
| [`_open_project_dialog`](File-src-main-ml-186468670.md#function-function-open-project-dialog-function-open-project-dialog-st-src-main-ml-508812574) | `src/main.ml:3302` | 5 | 4 | 3 | 2 | 1 | 180.94 | 68.54 |
| [`_open_project_file`](File-src-main-ml-186468670.md#function-function-open-project-file-function-open-project-file-st-path-src-main-ml-1162812783) | `src/main.ml:3243` | 56 | 53 | 7 | 6 | 1 | 2461.04 | 37.18 |
| [`_open_quick_open_window`](File-src-main-ml-186468670.md#function-function-open-quick-open-window-function-open-quick-open-window-st-src-main-ml-202808096) | `src/main.ml:4883` | 84 | 71 | 29 | 67 | 4 | 3973.03 | 28.92 |
| [`_open_rename_symbol_window`](File-src-main-ml-186468670.md#function-function-open-rename-symbol-window-function-open-rename-symbol-window-st-src-main-ml-194826070) | `src/main.ml:5644` | 109 | 97 | 36 | 80 | 4 | 5394.28 | 24.58 |
| [`_open_result_selection`](File-src-main-ml-186468670.md#function-function-open-result-selection-function-open-result-selection-st-src-main-ml-725046766) | `src/main.ml:1601` | 12 | 15 | 11 | 10 | 1 | 819.24 | 54.58 |
| [`_open_selected_tree_file`](File-src-main-ml-186468670.md#function-function-open-selected-tree-file-function-open-selected-tree-file-st-src-main-ml-333962654) | `src/main.ml:6805` | 9 | 7 | 4 | 3 | 1 | 332.84 | 60.99 |
| [`_open_tree_file_at`](File-src-main-ml-186468670.md#function-function-open-tree-file-at-function-open-tree-file-at-st-mx-my-src-main-ml-429161815) | `src/main.ml:6770` | 9 | 10 | 6 | 5 | 1 | 440.92 | 59.86 |
| [`_open_tree_file_index`](File-src-main-ml-186468670.md#function-function-open-tree-file-index-function-open-tree-file-index-st-idx-src-main-ml-1187143927) | `src/main.ml:6757` | 8 | 9 | 5 | 4 | 1 | 347.83 | 61.83 |
| [`_open_virtual_tab`](File-src-main-ml-186468670.md#function-function-open-virtual-tab-function-open-virtual-tab-st-path-text-src-main-ml-2044004648) | `src/main.ml:2553` | 34 | 32 | 6 | 5 | 1 | 1815.75 | 42.97 |
| [`_paste_tree_item`](File-src-main-ml-186468670.md#function-function-paste-tree-item-function-paste-tree-item-st-src-main-ml-661176362) | `src/main.ml:7381` | 17 | 16 | 9 | 8 | 1 | 950.05 | 51.1 |
| [`_path_index`](File-src-main-ml-186468670.md#function-function-path-index-function-path-index-paths-path-src-main-ml-175101182) | `src/main.ml:686` | 9 | 10 | 6 | 6 | 2 | 361.37 | 60.47 |
| [`_perform_command`](File-src-main-ml-186468670.md#function-function-perform-command-function-perform-command-st-id-src-main-ml-1331466893) | `src/main.ml:7882` | 107 | 190 | 92 | 91 | 1 | 8961.95 | 15.68 |
| [`_perform_palette_command`](File-src-main-ml-186468670.md#function-function-perform-palette-command-function-perform-palette-command-st-id-src-main-ml-907337497) | `src/main.ml:4623` | 3 | 1 | 1 | 0 | 0 | 53.15 | 77.38 |
| [`_poll_build`](File-src-main-ml-186468670.md#function-function-poll-build-function-poll-build-st-src-main-ml-2014312196) | `src/main.ml:3161` | 33 | 28 | 19 | 23 | 3 | 1436.51 | 42.21 |
| [`_pop_nav_stack`](File-src-main-ml-186468670.md#function-function-pop-nav-stack-function-pop-nav-stack-stack-src-main-ml-134556125) | `src/main.ml:1450` | 8 | 6 | 4 | 3 | 1 | 263.22 | 62.81 |
| [`_pop_snapshot`](File-src-main-ml-186468670.md#function-function-pop-snapshot-function-pop-snapshot-stack-src-main-ml-206123363) | `src/main.ml:779` | 8 | 6 | 4 | 3 | 1 | 263.22 | 62.81 |
| [`_populate_api_key_mode_combo`](File-src-main-ml-186468670.md#function-function-populate-api-key-mode-combo-function-populate-api-key-mode-combo-key-mode-combo-mode-src-main-ml-1222477224) | `src/main.ml:3764` | 5 | 3 | 1 | 0 | 0 | 140.65 | 69.58 |
| [`_populate_project_tree`](File-src-main-ml-186468670.md#function-function-populate-project-tree-function-populate-project-tree-st-src-main-ml-1662014862) | `src/main.ml:2658` | 47 | 40 | 15 | 24 | 3 | 2394.54 | 37.85 |
| [`_populate_provider_combo`](File-src-main-ml-186468670.md#function-function-populate-provider-combo-function-populate-provider-combo-provider-combo-provider-src-main-ml-348447080) | `src/main.ml:3739` | 5 | 3 | 1 | 0 | 0 | 140.65 | 69.58 |
| [`_popup_command`](File-src-main-ml-186468670.md#function-function-popup-command-function-popup-command-st-menu-mx-my-src-main-ml-812835082) | `src/main.ml:7666` | 11 | 10 | 2 | 1 | 1 | 461.51 | 58.36 |
| [`_popup_existing_command`](File-src-main-ml-186468670.md#function-function-popup-existing-command-function-popup-existing-command-st-menu-mx-my-src-main-ml-1971134428) | `src/main.ml:7683` | 10 | 9 | 2 | 1 | 1 | 427.94 | 59.49 |
| [`_profile_config_value`](File-src-main-ml-186468670.md#function-function-profile-config-value-function-profile-config-value-p-profile-key-default-value-src-main-ml-1756069804) | `src/main.ml:2036` | 6 | 6 | 4 | 3 | 1 | 263.22 | 65.54 |
| [`_project_index_summary`](File-src-main-ml-186468670.md#function-function-project-index-summary-function-project-index-summary-st-src-main-ml-274498982) | `src/main.ml:3355` | 6 | 6 | 3 | 2 | 1 | 267.93 | 65.62 |
| [`_project_relative_path`](File-src-main-ml-186468670.md#function-function-project-relative-path-function-project-relative-path-st-path-src-main-ml-1906652167) | `src/main.ml:3964` | 15 | 12 | 7 | 7 | 2 | 776.69 | 53.17 |
| [`_provider_combo_index`](File-src-main-ml-186468670.md#function-function-provider-combo-index-function-provider-combo-index-provider-src-main-ml-432410792) | `src/main.ml:3722` | 5 | 4 | 2 | 1 | 1 | 106.27 | 70.29 |
| [`_provider_from_combo`](File-src-main-ml-186468670.md#function-function-provider-from-combo-function-provider-from-combo-provider-combo-src-main-ml-1839556667) | `src/main.ml:3730` | 5 | 4 | 2 | 1 | 1 | 108.42 | 70.23 |
| [`_pump_messages`](File-src-main-ml-186468670.md#function-function-pump-messages-function-pump-messages-st-src-main-ml-859811970) | `src/main.ml:8326` | 193 | 131 | 100 | 211 | 4 | 12809.29 | 7.93 |
| [`_push_nav_stack`](File-src-main-ml-186468670.md#function-function-push-nav-stack-function-push-nav-stack-stack-loc-src-main-ml-760002081) | `src/main.ml:1435` | 12 | 13 | 7 | 6 | 1 | 575 | 56.19 |
| [`_push_snapshot`](File-src-main-ml-186468670.md#function-function-push-snapshot-function-push-snapshot-stack-text-src-main-ml-1119687064) | `src/main.ml:762` | 13 | 14 | 7 | 6 | 1 | 590.15 | 55.36 |
| [`_quick_open_query`](File-src-main-ml-186468670.md#function-function-quick-open-query-function-quick-open-query-st-query-src-main-ml-621466438) | `src/main.ml:4816` | 28 | 31 | 12 | 13 | 2 | 1692.44 | 44.21 |
| [`_read_assistant_dialog_config`](File-src-main-ml-186468670.md#function-function-read-assistant-dialog-config-function-read-assistant-dialog-config-provider-combo-base-url-edit-key-mode-combo-key-env-edit-api-key-edit-model-edit-tool-mode-edit-enabled-allow-insecure-tls-include-tabs-include-project-include-help-src-main-ml-138291923) | `src/main.ml:3802` | 15 | 1 | 1 | 0 | 0 | 553.81 | 55 |
| [`_read_compile_settings_values`](File-src-main-ml-186468670.md#function-function-read-compile-settings-values-function-read-compile-settings-values-st-controls-entry-value-output-value-compiler-value-src-main-ml-1364637042) | `src/main.ml:3986` | 23 | 23 | 10 | 9 | 1 | 1396.24 | 46.93 |
| [`_read_editor`](File-src-main-ml-186468670.md#function-function-read-editor-function-read-editor-st-src-main-ml-840975866) | `src/main.ml:1834` | 3 | 1 | 1 | 0 | 0 | 68.11 | 76.62 |
| [`_read_goto_line`](File-src-main-ml-186468670.md#function-function-read-goto-line-function-read-goto-line-dlg-edit-src-main-ml-1884011250) | `src/main.ml:5903` | 9 | 6 | 3 | 2 | 1 | 292.3 | 61.51 |
| [`_read_rename_name`](File-src-main-ml-186468670.md#function-function-read-rename-name-function-read-rename-name-dlg-edit-src-main-ml-760783678) | `src/main.ml:7245` | 12 | 8 | 4 | 3 | 1 | 431.81 | 57.47 |
| [`_rebuild_project`](File-src-main-ml-186468670.md#function-function-rebuild-project-function-rebuild-project-st-src-main-ml-296939974) | `src/main.ml:3052` | 12 | 10 | 3 | 2 | 1 | 479.22 | 57.29 |
| [`_record_edit_activity`](File-src-main-ml-186468670.md#function-function-record-edit-activity-function-record-edit-activity-st-src-main-ml-1305677580) | `src/main.ml:800` | 8 | 6 | 1 | 0 | 0 | 150.12 | 64.93 |
| [`_record_navigation`](File-src-main-ml-186468670.md#function-function-record-navigation-function-record-navigation-st-src-main-ml-881007626) | `src/main.ml:1461` | 7 | 6 | 2 | 1 | 1 | 200.67 | 65.17 |
| [`_record_undo_snapshot`](File-src-main-ml-186468670.md#function-function-record-undo-snapshot-function-record-undo-snapshot-st-idx-src-main-ml-394977715) | `src/main.ml:812` | 19 | 13 | 9 | 8 | 1 | 692.77 | 51 |
| [`_refresh_active_markdown_view`](File-src-main-ml-186468670.md#function-function-refresh-active-markdown-view-function-refresh-active-markdown-view-st-preserve-view-src-main-ml-908576804) | `src/main.ml:1924` | 18 | 13 | 6 | 9 | 3 | 558.67 | 52.57 |
| [`_refresh_assistant_settings_buttons`](File-src-main-ml-186468670.md#function-function-refresh-assistant-settings-buttons-function-refresh-assistant-settings-buttons-enabled-btn-tls-btn-tabs-btn-project-btn-help-btn-enabled-allow-insecure-tls-include-tabs-include-project-include-help-src-main-ml-218617612) | `src/main.ml:3781` | 7 | 5 | 1 | 0 | 0 | 423.04 | 63.04 |
| [`_refresh_command_palette_list`](File-src-main-ml-186468670.md#function-function-refresh-command-palette-list-function-refresh-command-palette-list-command-list-ids-labels-search-texts-query-src-main-ml-603283361) | `src/main.ml:4633` | 18 | 15 | 7 | 9 | 3 | 745.07 | 51.56 |
| [`_refresh_renamed_open_files`](File-src-main-ml-186468670.md#function-function-refresh-renamed-open-files-function-refresh-renamed-open-files-st-files-src-main-ml-379406403) | `src/main.ml:5590` | 28 | 28 | 8 | 10 | 2 | 1213.74 | 45.76 |
| [`_refresh_settings_buttons`](File-src-main-ml-186468670.md#function-function-refresh-settings-buttons-function-refresh-settings-buttons-keep-btn-subsystem-btn-keep-going-subsystem-src-main-ml-1793651784) | `src/main.ml:3715` | 4 | 2 | 1 | 0 | 0 | 147.15 | 71.55 |
| [`_refresh_tabs`](File-src-main-ml-186468670.md#function-function-refresh-tabs-function-refresh-tabs-st-src-main-ml-2099618008) | `src/main.ml:2442` | 11 | 8 | 5 | 5 | 2 | 542.84 | 57.46 |
| [`_reload_config`](File-src-main-ml-186468670.md#function-function-reload-config-function-reload-config-st-src-main-ml-2111335322) | `src/main.ml:3532` | 5 | 3 | 1 | 0 | 0 | 145.95 | 69.46 |
| [`_reload_project`](File-src-main-ml-186468670.md#function-function-reload-project-function-reload-project-st-src-main-ml-1259745494) | `src/main.ml:3197` | 42 | 42 | 3 | 2 | 1 | 1770.77 | 41.44 |
| [`_reload_tree_only`](File-src-main-ml-186468670.md#function-function-reload-tree-only-function-reload-tree-only-st-src-main-ml-1911749854) | `src/main.ml:7059` | 9 | 8 | 2 | 1 | 1 | 254.19 | 62.07 |
| [`_remove_fold_at`](File-src-main-ml-186468670.md#function-function-remove-fold-at-function-remove-fold-at-folds-source-line-src-main-ml-207729265) | `src/main.ml:7408` | 11 | 11 | 6 | 6 | 2 | 417.17 | 58.13 |
| [`_rename_error_text`](File-src-main-ml-186468670.md#function-function-rename-error-text-function-rename-error-text-result-src-main-ml-1549940784) | `src/main.ml:5580` | 6 | 6 | 5 | 4 | 1 | 391.38 | 64.2 |
| [`_rename_tree_item`](File-src-main-ml-186468670.md#function-function-rename-tree-item-function-rename-tree-item-st-src-main-ml-1181556206) | `src/main.ml:7260` | 89 | 77 | 29 | 72 | 5 | 4309.9 | 28.13 |
| [`_replace_active_text`](File-src-main-ml-186468670.md#function-function-replace-active-text-function-replace-active-text-st-text-src-main-ml-632287759) | `src/main.ml:6256` | 20 | 19 | 3 | 2 | 1 | 721.69 | 51.2 |
| [`_request_exit`](File-src-main-ml-186468670.md#function-function-request-exit-function-request-exit-st-src-main-ml-75301100) | `src/main.ml:7870` | 8 | 7 | 2 | 1 | 1 | 208.08 | 63.8 |
| [`_reset_compiler`](File-src-main-ml-186468670.md#function-function-reset-compiler-function-reset-compiler-st-src-main-ml-22958510) | `src/main.ml:3524` | 5 | 3 | 1 | 0 | 0 | 144.43 | 69.5 |
| [`_resolve`](File-src-main-ml-186468670.md#function-function-resolve-function-resolve-root-path-src-main-ml-416104222) | `src/main.ml:672` | 4 | 3 | 2 | 1 | 1 | 109.39 | 72.32 |
| [`_resolve_result_file`](File-src-main-ml-186468670.md#function-function-resolve-result-file-function-resolve-result-file-st-file-src-main-ml-1690335952) | `src/main.ml:1400` | 7 | 5 | 5 | 4 | 1 | 264.7 | 63.93 |
| [`_reveal_active_file`](File-src-main-ml-186468670.md#function-function-reveal-active-file-function-reveal-active-file-st-src-main-ml-299051750) | `src/main.ml:6817` | 17 | 17 | 9 | 11 | 2 | 999.42 | 50.94 |
| [`_run`](File-src-main-ml-186468670.md#function-function-run-function-run-root-src-main-ml-2131536183) | `src/main.ml:8536` | 19 | 16 | 4 | 4 | 2 | 531.36 | 52.48 |
| [`_run_current_test_file`](File-src-main-ml-186468670.md#function-function-run-current-test-file-function-run-current-test-file-st-src-main-ml-37558098) | `src/main.ml:3012` | 11 | 11 | 6 | 5 | 1 | 568.69 | 57.19 |
| [`_run_project`](File-src-main-ml-186468670.md#function-function-run-project-function-run-project-st-src-main-ml-831703146) | `src/main.ml:2977` | 12 | 9 | 4 | 3 | 1 | 405 | 57.66 |
| [`_run_related_test_file`](File-src-main-ml-186468670.md#function-function-run-related-test-file-function-run-related-test-file-st-src-main-ml-2035078646) | `src/main.ml:3026` | 13 | 13 | 7 | 6 | 1 | 760.32 | 54.59 |
| [`_run_tests`](File-src-main-ml-186468670.md#function-function-run-tests-function-run-tests-st-src-main-ml-1674662298) | `src/main.ml:2992` | 9 | 7 | 3 | 2 | 1 | 294.8 | 61.49 |
| [`_safe_identifier`](File-src-main-ml-186468670.md#function-function-safe-identifier-function-safe-identifier-name-src-main-ml-356882274) | `src/main.ml:7135` | 9 | 9 | 4 | 3 | 1 | 390.14 | 60.5 |
| [`_same_nav_location`](File-src-main-ml-186468670.md#function-function-same-nav-location-function-same-nav-location-a-b-src-main-ml-1555975602) | `src/main.ml:1427` | 4 | 3 | 3 | 2 | 1 | 231.89 | 69.9 |
| [`_same_or_child_path`](File-src-main-ml-186468670.md#function-function-same-or-child-path-function-same-or-child-path-parent-child-src-main-ml-906080627) | `src/main.ml:7111` | 8 | 9 | 5 | 4 | 1 | 333.73 | 61.96 |
| [`_save_all`](File-src-main-ml-186468670.md#function-function-save-all-function-save-all-st-src-main-ml-586890774) | `src/main.ml:2813` | 8 | 8 | 3 | 2 | 1 | 336.51 | 62.2 |
| [`_save_all_open`](File-src-main-ml-186468670.md#function-function-save-all-open-function-save-all-open-st-src-main-ml-1338359374) | `src/main.ml:2788` | 21 | 24 | 10 | 16 | 2 | 1239.86 | 48.15 |
| [`_save_compiler_path`](File-src-main-ml-186468670.md#function-function-save-compiler-path-function-save-compiler-path-st-src-main-ml-2706318) | `src/main.ml:2203` | 3 | 1 | 1 | 0 | 0 | 36 | 78.56 |
| [`_save_config`](File-src-main-ml-186468670.md#function-function-save-config-function-save-config-st-src-main-ml-5561254) | `src/main.ml:2164` | 36 | 34 | 3 | 2 | 1 | 2137.04 | 42.33 |
| [`_save_current`](File-src-main-ml-186468670.md#function-function-save-current-function-save-current-st-src-main-ml-1688176070) | `src/main.ml:2711` | 29 | 23 | 13 | 12 | 1 | 1282.6 | 44.59 |
| [`_saved_text_at`](File-src-main-ml-186468670.md#function-function-saved-text-at-function-saved-text-at-st-idx-src-main-ml-28914891) | `src/main.ml:738` | 5 | 5 | 4 | 3 | 1 | 220.08 | 67.81 |
| [`_search_current_word`](File-src-main-ml-186468670.md#function-function-search-current-word-function-search-current-word-st-src-main-ml-450950174) | `src/main.ml:5505` | 38 | 42 | 19 | 38 | 5 | 2621.44 | 39.05 |
| [`_search_language_help`](File-src-main-ml-186468670.md#function-function-search-language-help-function-search-language-help-st-query-src-main-ml-404659562) | `src/main.ml:4269` | 10 | 11 | 4 | 3 | 1 | 562.62 | 58.39 |
| [`_select_build_profile`](File-src-main-ml-186468670.md#function-function-select-build-profile-function-select-build-profile-st-profile-src-main-ml-1223256805) | `src/main.ml:3080` | 15 | 13 | 4 | 3 | 1 | 400 | 55.59 |
| [`_select_compiler`](File-src-main-ml-186468670.md#function-function-select-compiler-function-select-compiler-st-src-main-ml-2115275034) | `src/main.ml:3514` | 7 | 6 | 3 | 2 | 1 | 252.01 | 64.35 |
| [`_select_completion_prefix`](File-src-main-ml-186468670.md#function-function-select-completion-prefix-function-select-completion-prefix-editor-prefix-src-main-ml-1467221710) | `src/main.ml:4549` | 7 | 8 | 6 | 5 | 1 | 421.11 | 62.38 |
| [`_select_theme`](File-src-main-ml-186468670.md#function-function-select-theme-function-select-theme-st-mode-src-main-ml-1323079537) | `src/main.ml:2266` | 8 | 8 | 3 | 2 | 1 | 283.28 | 62.73 |
| [`_select_tree_item_at`](File-src-main-ml-186468670.md#function-function-select-tree-item-at-function-select-tree-item-at-st-mx-my-src-main-ml-1889650983) | `src/main.ml:7753` | 10 | 11 | 6 | 5 | 1 | 440.92 | 58.86 |
| [`_selected_command_palette_id`](File-src-main-ml-186468670.md#function-function-selected-command-palette-id-function-selected-command-palette-id-visible-ids-selected-src-main-ml-1119301027) | `src/main.ml:4655` | 4 | 3 | 4 | 3 | 1 | 162.52 | 70.85 |
| [`_selected_editor_text`](File-src-main-ml-186468670.md#function-function-selected-editor-text-function-selected-editor-text-st-src-main-ml-1220796106) | `src/main.ml:6019` | 8 | 9 | 6 | 5 | 1 | 549.45 | 60.31 |
| [`_selected_project_kind`](File-src-main-ml-186468670.md#function-function-selected-project-kind-function-selected-project-kind-kind-combo-src-main-ml-190537982) | `src/main.ml:3319` | 5 | 4 | 2 | 1 | 1 | 108.42 | 70.23 |
| [`_selected_tree_index`](File-src-main-ml-186468670.md#function-function-selected-tree-index-function-selected-tree-index-st-src-main-ml-1655432118) | `src/main.ml:7035` | 8 | 9 | 5 | 4 | 1 | 324.33 | 62.05 |
| [`_set_command_palette_selection`](File-src-main-ml-186468670.md#function-function-set-command-palette-selection-function-set-command-palette-selection-command-list-visible-ids-selected-src-main-ml-1583443797) | `src/main.ml:4677` | 6 | 7 | 5 | 4 | 1 | 309.07 | 64.92 |
| [`_set_dirty_from_saved`](File-src-main-ml-186468670.md#function-function-set-dirty-from-saved-function-set-dirty-from-saved-st-idx-src-main-ml-536614333) | `src/main.ml:747` | 11 | 8 | 6 | 6 | 2 | 442.2 | 57.95 |
| [`_set_log`](File-src-main-ml-186468670.md#function-function-set-log-function-set-log-st-text-src-main-ml-57992207) | `src/main.ml:935` | 17 | 16 | 2 | 1 | 1 | 946.09 | 52.05 |
| [`_set_title`](File-src-main-ml-186468670.md#function-function-set-title-function-set-title-st-src-main-ml-1241015966) | `src/main.ml:2003` | 11 | 9 | 5 | 4 | 1 | 450 | 58.03 |
| [`_settings_button`](File-src-main-ml-186468670.md#function-function-settings-button-function-settings-button-parent-font-text-x-y-w-h-control-id-src-main-ml-1280737976) | `src/main.ml:3696` | 6 | 4 | 1 | 0 | 0 | 313.82 | 65.41 |
| [`_settings_combo_id`](File-src-main-ml-186468670.md#function-function-settings-combo-id-function-settings-combo-id-parent-font-x-y-w-h-control-id-src-main-ml-1109912017) | `src/main.ml:3680` | 6 | 4 | 1 | 0 | 0 | 359.49 | 65 |
| [`_settings_edit`](File-src-main-ml-186468670.md#function-function-settings-edit-function-settings-edit-parent-font-text-x-y-w-h-src-main-ml-924790037) | `src/main.ml:3633` | 6 | 4 | 1 | 0 | 0 | 300.83 | 65.54 |
| [`_settings_edit_id`](File-src-main-ml-186468670.md#function-function-settings-edit-id-function-settings-edit-id-parent-font-text-x-y-w-h-control-id-src-main-ml-1720279534) | `src/main.ml:3649` | 6 | 4 | 1 | 0 | 0 | 323.33 | 65.32 |
| [`_settings_label`](File-src-main-ml-186468670.md#function-function-settings-label-function-settings-label-parent-font-text-x-y-w-h-src-main-ml-1054364343) | `src/main.ml:3619` | 5 | 3 | 1 | 0 | 0 | 248.8 | 67.84 |
| [`_settings_password_id`](File-src-main-ml-186468670.md#function-function-settings-password-id-function-settings-password-id-parent-font-text-x-y-w-h-control-id-src-main-ml-1393772476) | `src/main.ml:3665` | 6 | 4 | 1 | 0 | 0 | 346.13 | 65.11 |
| [`_shift_down`](File-src-main-ml-186468670.md#function-function-shift-down-function-shift-down-src-main-ml-388012879) | `src/main.ml:6696` | 3 | 1 | 1 | 0 | 0 | 49.83 | 77.57 |
| [`_short_symbol_name`](File-src-main-ml-186468670.md#function-function-short-symbol-name-function-short-symbol-name-name-src-main-ml-627778598) | `src/main.ml:6169` | 9 | 8 | 4 | 4 | 2 | 343.48 | 60.89 |
| [`_show_assistant_panel`](File-src-main-ml-186468670.md#function-function-show-assistant-panel-function-show-assistant-panel-st-src-main-ml-1906043522) | `src/main.ml:1304` | 20 | 17 | 3 | 2 | 1 | 1101.53 | 49.92 |
| [`_show_autocomplete_popup`](File-src-main-ml-186468670.md#function-function-show-autocomplete-popup-function-show-autocomplete-popup-st-items-prefix-src-main-ml-174177234) | `src/main.ml:4482` | 23 | 24 | 7 | 6 | 1 | 1437.66 | 47.24 |
| [`_show_bookmarks`](File-src-main-ml-186468670.md#function-function-show-bookmarks-function-show-bookmarks-st-src-main-ml-1569385422) | `src/main.ml:1529` | 17 | 17 | 6 | 6 | 2 | 944.6 | 51.52 |
| [`_show_call_hierarchy`](File-src-main-ml-186468670.md#function-function-show-call-hierarchy-function-show-call-hierarchy-st-src-main-ml-445555762) | `src/main.ml:5796` | 29 | 33 | 11 | 13 | 2 | 2010.91 | 43.49 |
| [`_show_code_inspections`](File-src-main-ml-186468670.md#function-function-show-code-inspections-function-show-code-inspections-st-src-main-ml-1259593906) | `src/main.ml:5473` | 26 | 29 | 9 | 12 | 2 | 1577.18 | 45.53 |
| [`_show_config`](File-src-main-ml-186468670.md#function-function-show-config-function-show-config-st-src-main-ml-1958844490) | `src/main.ml:3580` | 30 | 28 | 1 | 0 | 0 | 2105 | 44.37 |
| [`_show_editor_context`](File-src-main-ml-186468670.md#function-function-show-editor-context-function-show-editor-context-st-mx-my-src-main-ml-191270407) | `src/main.ml:7791` | 22 | 20 | 1 | 0 | 0 | 1577.73 | 48.19 |
| [`_show_import_graph`](File-src-main-ml-186468670.md#function-function-show-import-graph-function-show-import-graph-st-src-main-ml-1050117070) | `src/main.ml:5306` | 33 | 32 | 8 | 10 | 2 | 1612 | 43.34 |
| [`_show_log_context`](File-src-main-ml-186468670.md#function-function-show-log-context-function-show-log-context-st-mx-my-src-main-ml-979710041) | `src/main.ml:7818` | 8 | 6 | 1 | 0 | 0 | 404.17 | 61.91 |
| [`_show_outline`](File-src-main-ml-186468670.md#function-function-show-outline-function-show-outline-st-src-main-ml-1561230168) | `src/main.ml:4975` | 35 | 39 | 18 | 23 | 2 | 2281.11 | 40.38 |
| [`_show_problems`](File-src-main-ml-186468670.md#function-function-show-problems-function-show-problems-st-src-main-ml-2033388970) | `src/main.ml:5406` | 59 | 63 | 26 | 54 | 3 | 3911.69 | 32.72 |
| [`_show_project_index`](File-src-main-ml-186468670.md#function-function-show-project-index-function-show-project-index-st-src-main-ml-420009088) | `src/main.ml:5345` | 52 | 49 | 15 | 23 | 3 | 3177.51 | 36.03 |
| [`_show_project_symbols`](File-src-main-ml-186468670.md#function-function-show-project-symbols-function-show-project-symbols-st-src-main-ml-1586098206) | `src/main.ml:5047` | 3 | 1 | 1 | 0 | 0 | 46.51 | 77.78 |
| [`_show_project_symbols_query`](File-src-main-ml-186468670.md#function-function-show-project-symbols-query-function-show-project-symbols-query-st-query-src-main-ml-670133024) | `src/main.ml:5016` | 25 | 26 | 9 | 10 | 2 | 1429.01 | 46.2 |
| [`_show_recent_files`](File-src-main-ml-186468670.md#function-function-show-recent-files-function-show-recent-files-st-src-main-ml-499337446) | `src/main.ml:4850` | 28 | 30 | 11 | 17 | 3 | 1346.64 | 45.04 |
| [`_show_related_tests`](File-src-main-ml-186468670.md#function-function-show-related-tests-function-show-related-tests-st-src-main-ml-1926171626) | `src/main.ml:5275` | 25 | 28 | 11 | 13 | 2 | 1783.43 | 45.26 |
| [`_show_rename_symbol_preview`](File-src-main-ml-186468670.md#function-function-show-rename-symbol-preview-function-show-rename-symbol-preview-st-word-new-name-src-main-ml-1928793008) | `src/main.ml:5550` | 24 | 27 | 11 | 11 | 2 | 1753.19 | 45.7 |
| [`_show_result_panel`](File-src-main-ml-186468670.md#function-function-show-result-panel-function-show-result-panel-st-mode-title-rows-files-lines-cols-src-main-ml-1473942255) | `src/main.ml:961` | 29 | 31 | 9 | 9 | 2 | 1685.71 | 44.29 |
| [`_show_symbol_info`](File-src-main-ml-186468670.md#function-function-show-symbol-info-function-show-symbol-info-st-src-main-ml-1222166910) | `src/main.ml:5832` | 23 | 24 | 8 | 8 | 2 | 1550.71 | 46.88 |
| [`_show_tab_context`](File-src-main-ml-186468670.md#function-function-show-tab-context-function-show-tab-context-st-mx-my-src-main-ml-1023893991) | `src/main.ml:7732` | 16 | 14 | 5 | 4 | 1 | 879.05 | 52.45 |
| [`_show_test_explorer`](File-src-main-ml-186468670.md#function-function-show-test-explorer-function-show-test-explorer-st-src-main-ml-1793345884) | `src/main.ml:5243` | 26 | 29 | 9 | 12 | 2 | 1565.05 | 45.56 |
| [`_show_todos`](File-src-main-ml-186468670.md#function-function-show-todos-function-show-todos-st-src-main-ml-579652630) | `src/main.ml:5213` | 24 | 26 | 8 | 10 | 2 | 1380.75 | 46.83 |
| [`_show_top_menu`](File-src-main-ml-186468670.md#function-function-show-top-menu-function-show-top-menu-st-idx-src-main-ml-301257907) | `src/main.ml:7709` | 18 | 12 | 5 | 4 | 1 | 428.77 | 53.51 |
| [`_show_tree_context`](File-src-main-ml-186468670.md#function-function-show-tree-context-function-show-tree-context-st-mx-my-src-main-ml-439959619) | `src/main.ml:7768` | 18 | 16 | 1 | 0 | 0 | 1176.15 | 50.98 |
| [`_show_welcome`](File-src-main-ml-186468670.md#function-function-show-welcome-function-show-welcome-st-src-main-ml-97178664) | `src/main.ml:3481` | 30 | 27 | 2 | 1 | 1 | 883.18 | 46.88 |
| [`_show_workspace_health`](File-src-main-ml-186468670.md#function-function-show-workspace-health-function-show-workspace-health-st-src-main-ml-1374051326) | `src/main.ml:5164` | 41 | 35 | 8 | 11 | 3 | 1945.28 | 40.71 |
| [`_simple_line_numbers_text`](File-src-main-ml-186468670.md#function-function-simple-line-numbers-text-function-simple-line-numbers-text-first-visible-count-src-main-ml-1154241615) | `src/main.ml:7464` | 14 | 14 | 7 | 7 | 2 | 455 | 55.45 |
| [`_source_line_to_display_line`](File-src-main-ml-186468670.md#function-function-source-line-to-display-line-function-source-line-to-display-line-text-folds-source-line-src-main-ml-964933066) | `src/main.ml:1813` | 18 | 15 | 5 | 8 | 3 | 469.13 | 53.24 |
| [`_start_compile_job`](File-src-main-ml-186468670.md#function-function-start-compile-job-function-start-compile-job-st-mode-src-main-ml-588347787) | `src/main.ml:2825` | 19 | 15 | 3 | 2 | 1 | 765.71 | 51.51 |
| [`_start_current_test_compile_job`](File-src-main-ml-186468670.md#function-function-start-current-test-compile-job-function-start-current-test-compile-job-st-test-file-src-main-ml-1621032623) | `src/main.ml:2924` | 3 | 1 | 1 | 0 | 0 | 71.7 | 76.47 |
| [`_start_related_test_compile_job`](File-src-main-ml-186468670.md#function-function-start-related-test-compile-job-function-start-related-test-compile-job-st-test-file-src-main-ml-1627473399) | `src/main.ml:2931` | 3 | 1 | 1 | 0 | 0 | 71.7 | 76.47 |
| [`_start_run_job`](File-src-main-ml-186468670.md#function-function-start-run-job-function-start-run-job-st-src-main-ml-1996813534) | `src/main.ml:2871` | 3 | 1 | 1 | 0 | 0 | 46.51 | 77.78 |
| [`_start_run_job_with_prefix`](File-src-main-ml-186468670.md#function-function-start-run-job-with-prefix-function-start-run-job-with-prefix-st-prefix-src-main-ml-1410858130) | `src/main.ml:2849` | 18 | 16 | 3 | 2 | 1 | 676.53 | 52.4 |
| [`_start_test_compile_job`](File-src-main-ml-186468670.md#function-function-start-test-compile-job-function-start-test-compile-job-st-src-main-ml-521785102) | `src/main.ml:2877` | 16 | 13 | 2 | 1 | 1 | 681.21 | 53.63 |
| [`_start_test_file_compile_job`](File-src-main-ml-186468670.md#function-function-start-test-file-compile-job-function-start-test-file-compile-job-st-test-file-mode-label-src-main-ml-826145728) | `src/main.ml:2900` | 19 | 18 | 6 | 5 | 1 | 1071.68 | 50.08 |
| [`_start_test_run_job`](File-src-main-ml-186468670.md#function-function-start-test-run-job-function-start-test-run-job-st-src-main-ml-1079048694) | `src/main.ml:2959` | 3 | 1 | 1 | 0 | 0 | 46.51 | 77.78 |
| [`_start_test_run_job_with_prefix`](File-src-main-ml-186468670.md#function-function-start-test-run-job-with-prefix-function-start-test-run-job-with-prefix-st-prefix-src-main-ml-790358222) | `src/main.ml:2938` | 17 | 15 | 3 | 2 | 1 | 660.68 | 53.01 |
| [`_stop_build_job`](File-src-main-ml-186468670.md#function-function-stop-build-job-function-stop-build-job-st-src-main-ml-2060677274) | `src/main.ml:3067` | 9 | 8 | 2 | 1 | 1 | 388.64 | 60.78 |
| [`_strip_cr`](File-src-main-ml-186468670.md#function-function-strip-cr-function-strip-cr-line-src-main-ml-1460663231) | `src/main.ml:1906` | 7 | 5 | 4 | 3 | 1 | 280.54 | 63.89 |
| [`_sync_active_tab`](File-src-main-ml-186468670.md#function-function-sync-active-tab-function-sync-active-tab-st-src-main-ml-1351469566) | `src/main.ml:2457` | 30 | 29 | 10 | 11 | 2 | 1360.17 | 44.49 |
| [`_sync_line_numbers`](File-src-main-ml-186468670.md#function-function-sync-line-numbers-function-sync-line-numbers-st-src-main-ml-1573643406) | `src/main.ml:7495` | 25 | 21 | 9 | 9 | 2 | 1185.21 | 46.77 |
| [`_tab_at`](File-src-main-ml-186468670.md#function-function-tab-at-function-tab-at-st-mx-my-src-main-ml-841649383) | `src/main.ml:7652` | 8 | 10 | 9 | 8 | 1 | 563.52 | 59.83 |
| [`_tab_label`](File-src-main-ml-186468670.md#function-function-tab-label-function-tab-label-st-idx-src-main-ml-736461399) | `src/main.ml:2426` | 13 | 12 | 9 | 9 | 2 | 599.71 | 55.04 |
| [`_test_file_source`](File-src-main-ml-186468670.md#function-function-test-file-source-function-test-file-source-path-src-main-ml-581848130) | `src/main.ml:7154` | 3 | 1 | 1 | 0 | 0 | 55.35 | 77.25 |
| [`_toggle_bookmark`](File-src-main-ml-186468670.md#function-function-toggle-bookmark-function-toggle-bookmark-st-src-main-ml-2118430486) | `src/main.ml:1504` | 22 | 18 | 8 | 8 | 2 | 939.01 | 48.83 |
| [`_toggle_fold_at_caret`](File-src-main-ml-186468670.md#function-function-toggle-fold-at-caret-function-toggle-fold-at-caret-st-src-main-ml-132541872) | `src/main.ml:7430` | 7 | 6 | 3 | 2 | 1 | 401.29 | 62.93 |
| [`_toggle_fold_from_y`](File-src-main-ml-186468670.md#function-function-toggle-fold-from-y-function-toggle-fold-from-y-st-my-src-main-ml-1984466220) | `src/main.ml:7441` | 8 | 8 | 4 | 3 | 1 | 460.12 | 61.12 |
| [`_toggle_fold_line`](File-src-main-ml-186468670.md#function-function-toggle-fold-line-function-toggle-fold-line-st-source-line-src-main-ml-1125220762) | `src/main.ml:7424` | 3 | 1 | 1 | 0 | 0 | 34.87 | 78.66 |
| [`_toggle_keep_going`](File-src-main-ml-186468670.md#function-function-toggle-keep-going-function-toggle-keep-going-st-src-main-ml-444939158) | `src/main.ml:3540` | 5 | 3 | 1 | 0 | 0 | 134.89 | 69.7 |
| [`_toggle_max_errors`](File-src-main-ml-186468670.md#function-function-toggle-max-errors-function-toggle-max-errors-st-src-main-ml-1496391742) | `src/main.ml:3560` | 9 | 5 | 2 | 1 | 1 | 193.26 | 62.91 |
| [`_toggle_subsystem`](File-src-main-ml-186468670.md#function-function-toggle-subsystem-function-toggle-subsystem-st-src-main-ml-1796767288) | `src/main.ml:3548` | 9 | 5 | 2 | 1 | 1 | 193.26 | 62.91 |
| [`_toolbar_button_hwnd`](File-src-main-ml-186468670.md#function-function-toolbar-button-hwnd-function-toolbar-button-hwnd-st-hwnd-src-main-ml-128000159) | `src/main.ml:8245` | 12 | 19 | 10 | 9 | 1 | 504.35 | 56.19 |
| [`_toolbar_command_at`](File-src-main-ml-186468670.md#function-function-toolbar-command-at-function-toolbar-command-at-mx-my-src-main-ml-44515994) | `src/main.ml:8180` | 25 | 33 | 21 | 20 | 1 | 1267.19 | 44.95 |
| [`_toolbar_command_for_hwnd`](File-src-main-ml-186468670.md#function-function-toolbar-command-for-hwnd-function-toolbar-command-for-hwnd-st-hwnd-src-main-ml-1553808279) | `src/main.ml:8222` | 18 | 24 | 14 | 16 | 3 | 1010.94 | 49.7 |
| [`_toolbar_command_from_message`](File-src-main-ml-186468670.md#function-function-toolbar-command-from-message-function-toolbar-command-from-message-st-msg-src-main-ml-673984751) | `src/main.ml:8287` | 6 | 5 | 2 | 1 | 1 | 253.82 | 65.92 |
| [`_toolbar_glyph_hwnd`](File-src-main-ml-186468670.md#function-function-toolbar-glyph-hwnd-function-toolbar-glyph-hwnd-st-hwnd-src-main-ml-1181277361) | `src/main.ml:8273` | 9 | 9 | 5 | 5 | 2 | 335 | 60.83 |
| [`_toolbar_icon_hwnd`](File-src-main-ml-186468670.md#function-function-toolbar-icon-hwnd-function-toolbar-icon-hwnd-st-hwnd-src-main-ml-76787391) | `src/main.ml:8261` | 7 | 6 | 4 | 4 | 2 | 262.33 | 64.09 |
| [`_top_menu_at`](File-src-main-ml-186468670.md#function-function-top-menu-at-function-top-menu-at-mx-my-src-main-ml-1799795970) | `src/main.ml:8209` | 9 | 13 | 13 | 12 | 1 | 455 | 58.82 |
| [`_tree_handle_index`](File-src-main-ml-186468670.md#function-function-tree-handle-index-function-tree-handle-index-st-handle-src-main-ml-1076516332) | `src/main.ml:2637` | 8 | 8 | 5 | 5 | 2 | 341.32 | 61.89 |
| [`_tree_icon`](File-src-main-ml-186468670.md#function-function-tree-icon-function-tree-icon-path-is-dir-src-main-ml-989646790) | `src/main.ml:2650` | 5 | 5 | 3 | 2 | 1 | 157.17 | 68.97 |
| [`_tree_target_dir`](File-src-main-ml-186468670.md#function-function-tree-target-dir-function-tree-target-dir-st-src-main-ml-367805610) | `src/main.ml:7046` | 10 | 12 | 7 | 6 | 1 | 504.44 | 58.32 |
| [`_trim_trailing_ws`](File-src-main-ml-186468670.md#function-function-trim-trailing-ws-function-trim-trailing-ws-line-src-main-ml-961099459) | `src/main.ml:4420` | 9 | 8 | 6 | 5 | 1 | 383.37 | 60.29 |
| [`_unfold_all`](File-src-main-ml-186468670.md#function-function-unfold-all-function-unfold-all-st-src-main-ml-578469848) | `src/main.ml:7401` | 3 | 1 | 1 | 0 | 0 | 25.27 | 79.64 |
| [`_unique_file_path`](File-src-main-ml-186468670.md#function-function-unique-file-path-function-unique-file-path-dir-stem-ext-src-main-ml-283577682) | `src/main.ml:7073` | 11 | 10 | 4 | 4 | 2 | 495.42 | 57.87 |
| [`_unique_named_path`](File-src-main-ml-186468670.md#function-function-unique-named-path-function-unique-named-path-dir-name-src-main-ml-1357012997) | `src/main.ml:7088` | 11 | 10 | 4 | 4 | 2 | 475.6 | 58 |
| [`_update_cursor_for_mouse`](File-src-main-ml-186468670.md#function-function-update-cursor-for-mouse-function-update-cursor-for-mouse-st-msg-src-main-ml-81221917) | `src/main.ml:8033` | 21 | 11 | 12 | 13 | 2 | 922.47 | 48.78 |
| [`_update_editor_aux`](File-src-main-ml-186468670.md#function-function-update-editor-aux-function-update-editor-aux-st-src-main-ml-637552906) | `src/main.ml:7624` | 23 | 20 | 9 | 9 | 2 | 927.96 | 48.31 |
| [`_update_live_diagnostics`](File-src-main-ml-186468670.md#function-function-update-live-diagnostics-function-update-live-diagnostics-st-now-src-main-ml-766187670) | `src/main.ml:7607` | 14 | 13 | 5 | 4 | 1 | 408.63 | 56.04 |
| [`_visible_text_from_source`](File-src-main-ml-186468670.md#function-function-visible-text-from-source-function-visible-text-from-source-text-folds-src-main-ml-1353164778) | `src/main.ml:1765` | 19 | 16 | 6 | 7 | 2 | 618.39 | 51.75 |
| [`_word_at_pos`](File-src-main-ml-186468670.md#function-function-word-at-pos-function-word-at-pos-text-pos-src-main-ml-772395396) | `src/main.ml:4400` | 17 | 18 | 10 | 9 | 1 | 708.49 | 51.86 |
| [`_word_prefix_before`](File-src-main-ml-186468670.md#function-function-word-prefix-before-function-word-prefix-before-text-pos-src-main-ml-386316244) | `src/main.ml:4383` | 13 | 15 | 8 | 7 | 1 | 579.61 | 55.28 |
| [`_write_active_editor`](File-src-main-ml-186468670.md#function-function-write-active-editor-function-write-active-editor-st-text-src-main-ml-237693171) | `src/main.ml:1894` | 9 | 8 | 2 | 1 | 1 | 412.18 | 60.6 |
| [`_write_editor`](File-src-main-ml-186468670.md#function-function-write-editor-function-write-editor-st-text-src-main-ml-233319079) | `src/main.ml:1841` | 10 | 8 | 1 | 0 | 0 | 436.52 | 59.57 |
| [`_write_markdown_active_editor`](File-src-main-ml-186468670.md#function-function-write-markdown-active-editor-function-write-markdown-active-editor-st-text-preserve-view-src-main-ml-1189793531) | `src/main.ml:1856` | 30 | 26 | 7 | 7 | 2 | 1338.69 | 44.94 |
| [`ai.assistant.active_file_text`](File-src-ai-assistant-ml-1857925730.md#function-function-ai-assistant-active-file-text-function-active-file-text-root-current-file-active-tab-open-texts-src-ai-assistant-ml-613298016) | `src/ai/assistant.ml:125` | 12 | 11 | 7 | 6 | 1 | 573.26 | 56.2 |
| [`ai.assistant.build_log_text`](File-src-ai-assistant-ml-1857925730.md#function-function-ai-assistant-build-log-text-function-build-log-text-log-text-src-ai-assistant-ml-1963398539) | `src/ai/assistant.ml:185` | 5 | 4 | 3 | 2 | 1 | 178.81 | 68.58 |
| [`ai.assistant.excerpt`](File-src-ai-assistant-ml-1857925730.md#function-function-ai-assistant-excerpt-function-excerpt-text-limit-src-ai-assistant-ml-1565308137) | `src/ai/assistant.ml:80` | 6 | 7 | 5 | 4 | 1 | 336.51 | 64.66 |
| [`ai.assistant.help_text`](File-src-ai-assistant-ml-1857925730.md#function-function-ai-assistant-help-text-function-help-text-project-root-compiler-path-src-ai-assistant-ml-1284702302) | `src/ai/assistant.ml:177` | 5 | 4 | 2 | 1 | 1 | 348.06 | 66.69 |
| [`ai.assistant.normalize_api_key_mode`](File-src-ai-assistant-ml-1857925730.md#function-function-ai-assistant-normalize-api-key-mode-function-normalize-api-key-mode-value-src-ai-assistant-ml-1127170026) | `src/ai/assistant.ml:63` | 5 | 4 | 5 | 4 | 1 | 188.87 | 68.14 |
| [`ai.assistant.normalize_provider`](File-src-ai-assistant-ml-1857925730.md#function-function-ai-assistant-normalize-provider-function-normalize-provider-value-src-ai-assistant-ml-1404899358) | `src/ai/assistant.ml:55` | 5 | 4 | 3 | 2 | 1 | 148.68 | 69.14 |
| [`ai.assistant.normalize_tool_mode`](File-src-ai-assistant-ml-1857925730.md#function-function-ai-assistant-normalize-tool-mode-function-normalize-tool-mode-value-src-ai-assistant-ml-2031531210) | `src/ai/assistant.ml:71` | 5 | 4 | 7 | 6 | 1 | 230.7 | 67.27 |
| [`ai.assistant.open_tab_contents_text`](File-src-ai-assistant-ml-1857925730.md#function-function-ai-assistant-open-tab-contents-text-function-open-tab-contents-text-root-open-files-open-texts-limit-each-src-ai-assistant-ml-236167525) | `src/ai/assistant.ml:143` | 10 | 9 | 6 | 6 | 2 | 539.11 | 58.25 |
| [`ai.assistant.open_tabs_text`](File-src-ai-assistant-ml-1857925730.md#function-function-ai-assistant-open-tabs-text-function-open-tabs-text-root-open-files-open-dirty-active-tab-src-ai-assistant-ml-536387148) | `src/ai/assistant.ml:107` | 12 | 12 | 8 | 9 | 2 | 633.29 | 55.77 |
| [`ai.assistant.project_files_text`](File-src-ai-assistant-ml-1857925730.md#function-function-ai-assistant-project-files-text-function-project-files-text-root-project-files-limit-src-ai-assistant-ml-1639852307) | `src/ai/assistant.ml:158` | 15 | 17 | 10 | 11 | 2 | 729.11 | 52.95 |
| [`ai.assistant.relative_path`](File-src-ai-assistant-ml-1857925730.md#function-function-ai-assistant-relative-path-function-relative-path-root-path-src-ai-assistant-ml-1614722766) | `src/ai/assistant.ml:90` | 11 | 11 | 8 | 8 | 2 | 745.21 | 56.1 |
| [`ai.assistant.tool_context`](File-src-ai-assistant-ml-1857925730.md#function-function-ai-assistant-tool-context-function-tool-context-project-value-compiler-path-config-current-file-open-files-open-dirty-active-tab-open-texts-latest-build-log-src-ai-assistant-ml-176518748) | `src/ai/assistant.ml:201` | 30 | 27 | 7 | 7 | 2 | 1512.25 | 44.57 |
| [`ai.provider._api_key_result`](File-src-ai-provider-ml-178084207.md#function-function-ai-provider-api-key-result-function-api-key-result-config-src-ai-provider-ml-1357558655) | `src/ai/provider.ml:410` | 12 | 11 | 4 | 4 | 2 | 599.09 | 56.47 |
| [`ai.provider._chat_url`](File-src-ai-provider-ml-178084207.md#function-function-ai-provider-chat-url-function-chat-url-config-src-ai-provider-ml-767594015) | `src/ai/provider.ml:339` | 7 | 7 | 3 | 2 | 1 | 314.93 | 63.67 |
| [`ai.provider._close_http`](File-src-ai-provider-ml-178084207.md#function-function-ai-provider-close-http-function-close-http-handle-src-ai-provider-ml-1338463361) | `src/ai/provider.ml:426` | 4 | 4 | 4 | 3 | 1 | 137.61 | 71.35 |
| [`ai.provider._config_bool`](File-src-ai-provider-ml-178084207.md#function-function-ai-provider-config-bool-function-config-bool-config-field-fallback-src-ai-provider-ml-9749655) | `src/ai/provider.ml:320` | 6 | 4 | 4 | 4 | 2 | 185.84 | 66.6 |
| [`ai.provider._config_value`](File-src-ai-provider-ml-178084207.md#function-function-ai-provider-config-value-function-config-value-config-field-fallback-src-ai-provider-ml-1879287485) | `src/ai/provider.ml:305` | 10 | 12 | 17 | 21 | 2 | 750.75 | 55.77 |
| [`ai.provider._env_value`](File-src-ai-provider-ml-178084207.md#function-function-ai-provider-env-value-function-env-value-name-src-ai-provider-ml-2114290784) | `src/ai/provider.ml:396` | 10 | 12 | 7 | 6 | 1 | 417.79 | 58.89 |
| [`ai.provider._find_json_close`](File-src-ai-provider-ml-178084207.md#function-function-ai-provider-find-json-close-function-find-json-close-text-open-pos-open-ch-close-ch-src-ai-provider-ml-1787631581) | `src/ai/provider.ml:616` | 30 | 21 | 13 | 28 | 4 | 766.38 | 45.83 |
| [`ai.provider._http_post_json`](File-src-ai-provider-ml-178084207.md#function-function-ai-provider-http-post-json-function-http-post-json-url-api-key-body-allow-insecure-tls-src-ai-provider-ml-1455452804) | `src/ai/provider.ml:476` | 65 | 62 | 17 | 17 | 2 | 3760.01 | 33.13 |
| [`ai.provider._http_status`](File-src-ai-provider-ml-178084207.md#function-function-ai-provider-http-status-function-http-status-request-src-ai-provider-ml-1292696670) | `src/ai/provider.ml:433` | 8 | 7 | 2 | 1 | 1 | 296.13 | 62.73 |
| [`ai.provider._json_field_array`](File-src-ai-provider-ml-178084207.md#function-function-ai-provider-json-field-array-function-json-field-array-text-field-src-ai-provider-ml-1752461218) | `src/ai/provider.ml:688` | 17 | 16 | 9 | 12 | 3 | 906.16 | 51.24 |
| [`ai.provider._json_field_object`](File-src-ai-provider-ml-178084207.md#function-function-ai-provider-json-field-object-function-json-field-object-text-field-src-ai-provider-ml-2110787194) | `src/ai/provider.ml:667` | 17 | 16 | 9 | 12 | 3 | 906.16 | 51.24 |
| [`ai.provider._json_unescape_char`](File-src-ai-provider-ml-178084207.md#function-function-ai-provider-json-unescape-char-function-json-unescape-char-escaped-src-ai-provider-ml-2135545564) | `src/ai/provider.ml:552` | 11 | 17 | 9 | 8 | 1 | 361.21 | 58.16 |
| [`ai.provider._last_index_of`](File-src-ai-provider-ml-178084207.md#function-function-ai-provider-last-index-of-function-last-index-of-text-ch-before-src-ai-provider-ml-67430620) | `src/ai/provider.ml:202` | 10 | 10 | 5 | 5 | 2 | 333.73 | 59.84 |
| [`ai.provider._parse_json_string_at`](File-src-ai-provider-ml-178084207.md#function-function-ai-provider-parse-json-string-at-function-parse-json-string-at-text-quote-pos-src-ai-provider-ml-619859293) | `src/ai/provider.ml:567` | 31 | 29 | 12 | 21 | 3 | 1185.21 | 44.33 |
| [`ai.provider._parse_url`](File-src-ai-provider-ml-178084207.md#function-function-ai-provider-parse-url-function-parse-url-url-src-ai-provider-ml-919201054) | `src/ai/provider.ml:349` | 42 | 39 | 13 | 13 | 2 | 2457.13 | 39.1 |
| [`ai.provider._read_response_body`](File-src-ai-provider-ml-178084207.md#function-function-ai-provider-read-response-body-function-read-response-body-request-src-ai-provider-ml-816382882) | `src/ai/provider.ml:444` | 25 | 28 | 10 | 22 | 3 | 1323.93 | 46.3 |
| [`ai.provider._request_body`](File-src-ai-provider-ml-178084207.md#function-function-ai-provider-request-body-function-request-body-model-config-prompt-context-transcript-tool-results-include-tools-src-ai-provider-ml-656593570) | `src/ai/provider.ml:280` | 20 | 23 | 9 | 8 | 1 | 1055 | 49.24 |
| [`ai.provider._rstrip_slashes`](File-src-ai-provider-ml-178084207.md#function-function-ai-provider-rstrip-slashes-function-rstrip-slashes-text-src-ai-provider-ml-1115769106) | `src/ai/provider.ml:329` | 7 | 5 | 5 | 4 | 1 | 361.66 | 62.98 |
| [`ai.provider._short_text`](File-src-ai-provider-ml-178084207.md#function-function-ai-provider-short-text-function-short-text-text-limit-src-ai-provider-ml-1484199947) | `src/ai/provider.ml:752` | 6 | 7 | 5 | 4 | 1 | 336.51 | 64.66 |
| [`ai.provider._skip_json_ws`](File-src-ai-provider-ml-178084207.md#function-function-ai-provider-skip-json-ws-function-skip-json-ws-text-pos-src-ai-provider-ml-428885972) | `src/ai/provider.ml:603` | 7 | 4 | 6 | 5 | 1 | 269.34 | 63.74 |
| [`ai.provider._system_prompt`](File-src-ai-provider-ml-178084207.md#function-function-ai-provider-system-prompt-function-system-prompt-config-src-ai-provider-ml-1332759105) | `src/ai/provider.ml:236` | 13 | 9 | 2 | 1 | 1 | 224.01 | 58.97 |
| [`ai.provider._tool_schema_json`](File-src-ai-provider-ml-178084207.md#function-function-ai-provider-tool-schema-json-function-tool-schema-json-config-src-ai-provider-ml-634524397) | `src/ai/provider.ml:252` | 19 | 16 | 2 | 1 | 1 | 404.17 | 53.59 |
| [`ai.provider._u32le4`](File-src-ai-provider-ml-178084207.md#function-function-ai-provider-u32le4-function-u32le4-buf-src-ai-provider-ml-398858038) | `src/ai/provider.ml:193` | 4 | 3 | 3 | 2 | 1 | 247.25 | 69.71 |
| [`ai.provider._write_tools_enabled`](File-src-ai-provider-ml-178084207.md#function-function-ai-provider-write-tools-enabled-function-write-tools-enabled-config-src-ai-provider-ml-1929684389) | `src/ai/provider.ml:227` | 6 | 6 | 3 | 2 | 1 | 267.93 | 65.62 |
| [`ai.provider._write_u32`](File-src-ai-provider-ml-178084207.md#function-function-ai-provider-write-u32-function-write-u32-buf-off-value-src-ai-provider-ml-880223884) | `src/ai/provider.ml:183` | 7 | 5 | 1 | 0 | 0 | 302.61 | 64.06 |
| [`ai.provider.chat_completion`](File-src-ai-provider-ml-178084207.md#function-function-ai-provider-chat-completion-function-chat-completion-project-root-config-prompt-context-transcript-tool-results-include-tools-src-ai-provider-ml-1888544053) | `src/ai/provider.ml:767` | 18 | 18 | 6 | 6 | 2 | 1334.96 | 49.93 |
| [`ai.provider.json_escape`](File-src-ai-provider-ml-178084207.md#function-function-ai-provider-json-escape-function-json-escape-text-src-ai-provider-ml-843118188) | `src/ai/provider.ml:215` | 9 | 8 | 2 | 1 | 1 | 389.4 | 60.78 |
| [`ai.provider.json_field_string`](File-src-ai-provider-ml-178084207.md#function-function-ai-provider-json-field-string-function-json-field-string-text-field-src-ai-provider-ml-1893797196) | `src/ai/provider.ml:650` | 13 | 13 | 8 | 9 | 2 | 718.81 | 54.62 |
| [`ai.provider.parse_chat_content`](File-src-ai-provider-ml-178084207.md#function-function-ai-provider-parse-chat-content-function-parse-chat-content-response-src-ai-provider-ml-1621574084) | `src/ai/provider.ml:732` | 16 | 15 | 12 | 14 | 2 | 873.56 | 51.52 |
| [`ai.provider.parse_tool_calls`](File-src-ai-provider-ml-178084207.md#function-function-ai-provider-parse-tool-calls-function-parse-tool-calls-response-src-ai-provider-ml-2110867488) | `src/ai/provider.ml:708` | 21 | 20 | 6 | 10 | 3 | 836.59 | 49.89 |
| [`build.build_service._bool_value`](File-src-build-build-service-ml-412506232.md#function-function-build-build-service-bool-value-function-bool-value-value-default-value-src-build-build-service-ml-1374753037) | `src/build/build_service.ml:470` | 4 | 3 | 2 | 1 | 1 | 87.57 | 73 |
| [`build.build_service._clean_file`](File-src-build-build-service-ml-412506232.md#function-function-build-build-service-clean-file-function-clean-file-path-src-build-build-service-ml-1400636434) | `src/build/build_service.ml:711` | 6 | 7 | 5 | 4 | 1 | 341.32 | 64.62 |
| [`build.build_service._compile_paths`](File-src-build-build-service-ml-412506232.md#function-function-build-build-service-compile-paths-function-compile-paths-project-compiler-override-keep-going-max-errors-subsystem-extra-args-src-build-build-service-ml-158806787) | `src/build/build_service.ml:498` | 40 | 36 | 10 | 11 | 2 | 1807.79 | 40.9 |
| [`build.build_service._diag_kind`](File-src-build-build-service-ml-412506232.md#function-function-build-build-service-diag-kind-function-diag-kind-prev-src-build-build-service-ml-238173490) | `src/build/build_service.ml:363` | 7 | 7 | 3 | 2 | 1 | 252.17 | 64.34 |
| [`build.build_service._diag_message`](File-src-build-build-service-ml-412506232.md#function-function-build-build-service-diag-message-function-diag-message-prev-src-build-build-service-ml-1120133210) | `src/build/build_service.ml:373` | 9 | 10 | 4 | 3 | 1 | 520.19 | 59.63 |
| [`build.build_service._dirname`](File-src-build-build-service-ml-412506232.md#function-function-build-build-service-dirname-function-dirname-path-src-build-build-service-ml-50686476) | `src/build/build_service.ml:249` | 13 | 11 | 6 | 8 | 3 | 388.42 | 56.76 |
| [`build.build_service._ensure_dir`](File-src-build-build-service-ml-412506232.md#function-function-build-build-service-ensure-dir-function-ensure-dir-path-src-build-build-service-ml-2625770) | `src/build/build_service.ml:282` | 6 | 6 | 5 | 4 | 1 | 235.23 | 65.75 |
| [`build.build_service._failed_job`](File-src-build-build-service-ml-412506232.md#function-function-build-build-service-failed-job-function-failed-job-log-path-command-line-compiler-message-src-build-build-service-ml-1072633993) | `src/build/build_service.ml:548` | 5 | 3 | 1 | 0 | 0 | 193.26 | 68.61 |
| [`build.build_service._file_write_time`](File-src-build-build-service-ml-412506232.md#function-function-build-build-service-file-write-time-function-file-write-time-path-src-build-build-service-ml-1791838588) | `src/build/build_service.ml:208` | 10 | 11 | 5 | 4 | 1 | 498.55 | 58.62 |
| [`build.build_service._int_value`](File-src-build-build-service-ml-412506232.md#function-function-build-build-service-int-value-function-int-value-value-default-value-src-build-build-service-ml-504480007) | `src/build/build_service.ml:478` | 4 | 3 | 2 | 1 | 1 | 87.57 | 73 |
| [`build.build_service._is_abs`](File-src-build-build-service-ml-412506232.md#function-function-build-build-service-is-abs-function-is-abs-path-src-build-build-service-ml-676905372) | `src/build/build_service.ml:265` | 6 | 7 | 6 | 5 | 1 | 309.13 | 64.78 |
| [`build.build_service._is_digit_char`](File-src-build-build-service-ml-412506232.md#function-function-build-build-service-is-digit-char-function-is-digit-char-ch-src-build-build-service-ml-272872608) | `src/build/build_service.ml:314` | 7 | 7 | 4 | 3 | 1 | 267.19 | 64.03 |
| [`build.build_service._is_source_file`](File-src-build-build-service-ml-412506232.md#function-function-build-build-service-is-source-file-function-is-source-file-path-src-build-build-service-ml-1491828820) | `src/build/build_service.ml:221` | 7 | 8 | 4 | 3 | 1 | 257.84 | 64.14 |
| [`build.build_service._last_index_of`](File-src-build-build-service-ml-412506232.md#function-function-build-build-service-last-index-of-function-last-index-of-text-ch-before-src-build-build-service-ml-1590854208) | `src/build/build_service.ml:301` | 10 | 10 | 5 | 5 | 2 | 333.73 | 59.84 |
| [`build.build_service._leading_int`](File-src-build-build-service-ml-412506232.md#function-function-build-build-service-leading-int-function-leading-int-text-src-build-build-service-ml-1289697316) | `src/build/build_service.ml:324` | 13 | 13 | 6 | 5 | 1 | 431.02 | 56.45 |
| [`build.build_service._line_col_from_pos`](File-src-build-build-service-ml-412506232.md#function-function-build-build-service-line-col-from-pos-function-line-col-from-pos-file-pos-src-build-build-service-ml-893950429) | `src/build/build_service.ml:341` | 19 | 16 | 8 | 9 | 2 | 639.53 | 51.38 |
| [`build.build_service._parse_diag_at`](File-src-build-build-service-ml-412506232.md#function-function-build-build-service-parse-diag-at-function-parse-diag-at-prev-at-line-src-build-build-service-ml-1720112306) | `src/build/build_service.ml:414` | 11 | 9 | 3 | 2 | 1 | 426.9 | 58.46 |
| [`build.build_service._parse_diag_loc`](File-src-build-build-service-ml-412506232.md#function-function-build-build-service-parse-diag-loc-function-parse-diag-loc-prev-loc-src-build-build-service-ml-194633162) | `src/build/build_service.ml:386` | 24 | 26 | 7 | 6 | 1 | 1579.02 | 46.56 |
| [`build.build_service._path_join`](File-src-build-build-service-ml-412506232.md#function-function-build-build-service-path-join-function-path-join-a-b-src-build-build-service-ml-919232804) | `src/build/build_service.ml:239` | 7 | 8 | 7 | 6 | 1 | 347.11 | 62.84 |
| [`build.build_service._q`](File-src-build-build-service-ml-412506232.md#function-function-build-build-service-q-function-q-x-src-build-build-service-ml-354717469) | `src/build/build_service.ml:231` | 4 | 3 | 2 | 1 | 1 | 97.67 | 72.67 |
| [`build.build_service._read_log`](File-src-build-build-service-ml-412506232.md#function-function-build-build-service-read-log-function-read-log-log-path-src-build-build-service-ml-416700031) | `src/build/build_service.ml:291` | 5 | 4 | 2 | 1 | 1 | 135.93 | 69.55 |
| [`build.build_service._read_ptr`](File-src-build-build-service-ml-412506232.md#function-function-build-build-service-read-ptr-function-read-ptr-buf-off-src-build-build-service-ml-893274777) | `src/build/build_service.ml:193` | 5 | 3 | 1 | 0 | 0 | 134.89 | 69.7 |
| [`build.build_service._read_u32`](File-src-build-build-service-ml-412506232.md#function-function-build-build-service-read-u32-function-read-u32-buf-off-src-build-build-service-ml-972939937) | `src/build/build_service.ml:186` | 3 | 1 | 1 | 0 | 0 | 203.13 | 73.3 |
| [`build.build_service._resolve`](File-src-build-build-service-ml-412506232.md#function-function-build-build-service-resolve-function-resolve-root-path-src-build-build-service-ml-1418854660) | `src/build/build_service.ml:275` | 4 | 3 | 2 | 1 | 1 | 96.21 | 72.71 |
| [`build.build_service._run_paths`](File-src-build-build-service-ml-412506232.md#function-function-build-build-service-run-paths-function-run-paths-project-src-build-build-service-ml-340937112) | `src/build/build_service.ml:612` | 21 | 20 | 5 | 4 | 1 | 732.55 | 50.43 |
| [`build.build_service._string_value`](File-src-build-build-service-ml-412506232.md#function-function-build-build-service-string-value-function-string-value-value-default-value-src-build-build-service-ml-1556973119) | `src/build/build_service.ml:486` | 4 | 3 | 3 | 2 | 1 | 110.36 | 72.16 |
| [`build.build_service._test_compile_paths`](File-src-build-build-service-ml-412506232.md#function-function-build-build-service-test-compile-paths-function-test-compile-paths-project-compiler-override-keep-going-max-errors-subsystem-extra-args-src-build-build-service-ml-1038379031) | `src/build/build_service.ml:705` | 3 | 1 | 1 | 0 | 0 | 132.83 | 74.59 |
| [`build.build_service._test_compile_paths_for_entry`](File-src-build-build-service-ml-412506232.md#function-function-build-build-service-test-compile-paths-for-entry-function-test-compile-paths-for-entry-project-test-entry-override-compiler-override-keep-going-max-errors-subsystem-extra-args-src-build-build-service-ml-1262968221) | `src/build/build_service.ml:652` | 41 | 38 | 12 | 13 | 2 | 1937.35 | 40.19 |
| [`build.build_service._test_output_path`](File-src-build-build-service-ml-412506232.md#function-function-build-build-service-test-output-path-function-test-output-path-root-name-src-build-build-service-ml-405232754) | `src/build/build_service.ml:637` | 6 | 5 | 3 | 2 | 1 | 252.62 | 65.8 |
| [`build.build_service._test_run_paths`](File-src-build-build-service-ml-412506232.md#function-function-build-build-service-test-run-paths-function-test-run-paths-project-src-build-build-service-ml-1306208216) | `src/build/build_service.ml:868` | 14 | 11 | 2 | 1 | 1 | 371.56 | 56.73 |
| [`build.build_service._u32_value`](File-src-build-build-service-ml-412506232.md#function-function-build-build-service-u32-value-function-u32-value-value-src-build-build-service-ml-910212740) | `src/build/build_service.ml:201` | 4 | 3 | 2 | 1 | 1 | 74.01 | 73.51 |
| [`build.build_service._write_ptr`](File-src-build-build-service-ml-412506232.md#function-function-build-build-service-write-ptr-function-write-ptr-buf-off-value-src-build-build-service-ml-1513106722) | `src/build/build_service.ml:171` | 11 | 7 | 2 | 1 | 1 | 261.34 | 60.09 |
| [`build.build_service._write_u16`](File-src-build-build-service-ml-412506232.md#function-function-build-build-service-write-u16-function-write-u16-buf-off-value-src-build-build-service-ml-1341606014) | `src/build/build_service.ml:149` | 5 | 3 | 1 | 0 | 0 | 164.23 | 69.11 |
| [`build.build_service._write_u32`](File-src-build-build-service-ml-412506232.md#function-function-build-build-service-write-u32-function-write-u32-buf-off-value-src-build-build-service-ml-2001345514) | `src/build/build_service.ml:159` | 7 | 5 | 1 | 0 | 0 | 302.61 | 64.06 |
| [`build.build_service.clean_project`](File-src-build-build-service-ml-412506232.md#function-function-build-build-service-clean-project-function-clean-project-project-src-build-build-service-ml-1914234266) | `src/build/build_service.ml:720` | 32 | 22 | 4 | 3 | 1 | 984.09 | 45.67 |
| [`build.build_service.close_job`](File-src-build-build-service-ml-412506232.md#function-function-build-build-service-close-job-function-close-job-job-src-build-build-service-ml-2136467078) | `src/build/build_service.ml:1052` | 14 | 9 | 4 | 3 | 1 | 272.28 | 57.41 |
| [`build.build_service.compile`](File-src-build-build-service-ml-412506232.md#function-function-build-build-service-compile-function-compile-project-src-build-build-service-ml-1276843978) | `src/build/build_service.ml:1122` | 3 | 1 | 1 | 0 | 0 | 46.51 | 77.78 |
| [`build.build_service.compile_with_compiler`](File-src-build-build-service-ml-412506232.md#function-function-build-build-service-compile-with-compiler-function-compile-with-compiler-project-compiler-override-src-build-build-service-ml-1699224174) | `src/build/build_service.ml:1116` | 3 | 1 | 1 | 0 | 0 | 91.38 | 75.73 |
| [`build.build_service.compile_with_options`](File-src-build-build-service-ml-412506232.md#function-function-build-build-service-compile-with-options-function-compile-with-options-project-compiler-override-keep-going-max-errors-subsystem-extra-args-src-build-build-service-ml-1479879787) | `src/build/build_service.ml:1099` | 13 | 9 | 3 | 2 | 1 | 564.22 | 56.03 |
| [`build.build_service.default_compiler`](File-src-build-build-service-ml-412506232.md#function-function-build-build-service-default-compiler-function-default-compiler-project-src-build-build-service-ml-721767604) | `src/build/build_service.ml:454` | 12 | 14 | 5 | 4 | 1 | 451.89 | 57.2 |
| [`build.build_service.job_exit_code`](File-src-build-build-service-ml-412506232.md#function-function-build-build-service-job-exit-code-function-job-exit-code-job-src-build-build-service-ml-1279818342) | `src/build/build_service.ml:1035` | 8 | 9 | 4 | 3 | 1 | 330.34 | 62.12 |
| [`build.build_service.job_is_running`](File-src-build-build-service-ml-412506232.md#function-function-build-build-service-job-is-running-function-job-is-running-job-src-build-build-service-ml-1719500302) | `src/build/build_service.ml:1046` | 3 | 1 | 1 | 0 | 0 | 46.51 | 77.78 |
| [`build.build_service.job_log`](File-src-build-build-service-ml-412506232.md#function-function-build-build-service-job-log-function-job-log-job-src-build-build-service-ml-2002018334) | `src/build/build_service.ml:1025` | 7 | 8 | 5 | 4 | 1 | 272.03 | 63.85 |
| [`build.build_service.job_started`](File-src-build-build-service-ml-412506232.md#function-function-build-build-service-job-started-function-job-started-job-src-build-build-service-ml-1919171252) | `src/build/build_service.ml:1019` | 3 | 1 | 1 | 0 | 0 | 66.61 | 76.69 |
| [`build.build_service.needs_recompile`](File-src-build-build-service-ml-412506232.md#function-function-build-build-service-needs-recompile-function-needs-recompile-project-src-build-build-service-ml-24069232) | `src/build/build_service.ml:933` | 31 | 27 | 14 | 27 | 5 | 1174.19 | 44.09 |
| [`build.build_service.parse_diagnostics`](File-src-build-build-service-ml-412506232.md#function-function-build-build-service-parse-diagnostics-function-parse-diagnostics-log-text-src-build-build-service-ml-1712252103) | `src/build/build_service.ml:428` | 22 | 19 | 10 | 15 | 3 | 999.42 | 48.37 |
| [`build.build_service.start_compile_with_compiler`](File-src-build-build-service-ml-412506232.md#function-function-build-build-service-start-compile-with-compiler-function-start-compile-with-compiler-project-compiler-override-src-build-build-service-ml-1413863896) | `src/build/build_service.ml:606` | 3 | 1 | 1 | 0 | 0 | 91.38 | 75.73 |
| [`build.build_service.start_compile_with_options`](File-src-build-build-service-ml-412506232.md#function-function-build-build-service-start-compile-with-options-function-start-compile-with-options-project-compiler-override-keep-going-max-errors-subsystem-extra-args-src-build-build-service-ml-67240151) | `src/build/build_service.ml:561` | 34 | 29 | 4 | 3 | 1 | 1915.54 | 43.07 |
| [`build.build_service.start_run_output`](File-src-build-build-service-ml-412506232.md#function-function-build-build-service-start-run-output-function-start-run-output-project-src-build-build-service-ml-1401074864) | `src/build/build_service.ml:971` | 37 | 31 | 5 | 4 | 1 | 1948.47 | 42.08 |
| [`build.build_service.start_test_compile_with_options`](File-src-build-build-service-ml-412506232.md#function-function-build-build-service-start-test-compile-with-options-function-start-test-compile-with-options-project-compiler-override-keep-going-max-errors-subsystem-extra-args-src-build-build-service-ml-697145633) | `src/build/build_service.ml:764` | 38 | 32 | 5 | 4 | 1 | 2135.03 | 41.55 |
| [`build.build_service.start_test_file_compile_with_options`](File-src-build-build-service-ml-412506232.md#function-function-build-build-service-start-test-file-compile-with-options-function-start-test-file-compile-with-options-project-test-file-compiler-override-keep-going-max-errors-subsystem-extra-args-src-build-build-service-ml-728997008) | `src/build/build_service.ml:819` | 38 | 32 | 5 | 4 | 1 | 2166.37 | 41.51 |
| [`build.build_service.start_test_output`](File-src-build-build-service-ml-412506232.md#function-function-build-build-service-start-test-output-function-start-test-output-project-src-build-build-service-ml-513635990) | `src/build/build_service.ml:885` | 37 | 31 | 5 | 4 | 1 | 1948.47 | 42.08 |
| [`build.build_service.stop_job`](File-src-build-build-service-ml-412506232.md#function-function-build-build-service-stop-job-function-stop-job-job-src-build-build-service-ml-711900922) | `src/build/build_service.ml:1069` | 22 | 18 | 6 | 11 | 4 | 619.26 | 50.36 |
| [`editor.buffer._insert_line`](File-src-editor-buffer-ml-1966067569.md#function-function-editor-buffer-insert-line-function-insert-line-buf-idx-text-src-editor-buffer-ml-681342136) | `src/editor/buffer.ml:160` | 20 | 20 | 7 | 6 | 1 | 751.61 | 50.54 |
| [`editor.buffer._lines_from_text`](File-src-editor-buffer-ml-1966067569.md#function-function-editor-buffer-lines-from-text-function-lines-from-text-text-src-editor-buffer-ml-613297664) | `src/editor/buffer.ml:54` | 7 | 7 | 4 | 3 | 1 | 276.9 | 63.93 |
| [`editor.buffer._normalize_text`](File-src-editor-buffer-ml-1966067569.md#function-function-editor-buffer-normalize-text-function-normalize-text-text-src-editor-buffer-ml-629051104) | `src/editor/buffer.ml:47` | 4 | 3 | 2 | 1 | 1 | 168.56 | 71.01 |
| [`editor.buffer._remove_line`](File-src-editor-buffer-ml-1966067569.md#function-function-editor-buffer-remove-line-function-remove-line-buf-idx-src-editor-buffer-ml-1041240251) | `src/editor/buffer.ml:184` | 17 | 15 | 6 | 6 | 2 | 554.88 | 53.14 |
| [`editor.buffer._set_line`](File-src-editor-buffer-ml-1966067569.md#function-function-editor-buffer-set-line-function-set-line-buf-idx-text-src-editor-buffer-ml-623625672) | `src/editor/buffer.ml:148` | 7 | 7 | 5 | 4 | 1 | 312.48 | 63.42 |
| [`editor.buffer._text_from_lines`](File-src-editor-buffer-ml-1966067569.md#function-function-editor-buffer-text-from-lines-function-text-from-lines-lines-src-editor-buffer-ml-1720281488) | `src/editor/buffer.ml:64` | 4 | 3 | 2 | 1 | 1 | 116.76 | 72.12 |
| [`editor.buffer.backspace`](File-src-editor-buffer-ml-1966067569.md#function-function-editor-buffer-backspace-function-backspace-buf-src-editor-buffer-ml-1275070160) | `src/editor/buffer.ml:234` | 23 | 20 | 4 | 3 | 1 | 976.11 | 48.82 |
| [`editor.buffer.clamp_cursor`](File-src-editor-buffer-ml-1966067569.md#function-function-editor-buffer-clamp-cursor-function-clamp-cursor-buf-src-editor-buffer-ml-696848186) | `src/editor/buffer.ml:124` | 19 | 28 | 15 | 14 | 1 | 1261.8 | 48.37 |
| [`editor.buffer.current_line`](File-src-editor-buffer-ml-1966067569.md#function-function-editor-buffer-current-line-function-current-line-buf-src-editor-buffer-ml-1331792558) | `src/editor/buffer.ml:114` | 7 | 8 | 4 | 3 | 1 | 292.56 | 63.76 |
| [`editor.buffer.delete_forward`](File-src-editor-buffer-ml-1966067569.md#function-function-editor-buffer-delete-forward-function-delete-forward-buf-src-editor-buffer-ml-1623774046) | `src/editor/buffer.ml:261` | 17 | 14 | 4 | 3 | 1 | 800.17 | 52.29 |
| [`editor.buffer.ensure_cursor_visible`](File-src-editor-buffer-ml-1966067569.md#function-function-editor-buffer-ensure-cursor-visible-function-ensure-cursor-visible-buf-visible-lines-src-editor-buffer-ml-2606582) | `src/editor/buffer.ml:357` | 12 | 11 | 7 | 6 | 1 | 456.47 | 56.9 |
| [`editor.buffer.insert_text`](File-src-editor-buffer-ml-1966067569.md#function-function-editor-buffer-insert-text-function-insert-text-buf-text-src-editor-buffer-ml-685360723) | `src/editor/buffer.ml:205` | 11 | 10 | 3 | 2 | 1 | 574.48 | 57.56 |
| [`editor.buffer.line_count`](File-src-editor-buffer-ml-1966067569.md#function-function-editor-buffer-line-count-function-line-count-buf-src-editor-buffer-ml-1115540874) | `src/editor/buffer.ml:107` | 4 | 3 | 3 | 2 | 1 | 145.95 | 71.31 |
| [`editor.buffer.load_file`](File-src-editor-buffer-ml-1966067569.md#function-function-editor-buffer-load-file-function-load-file-path-src-editor-buffer-ml-1910050490) | `src/editor/buffer.ml:79` | 13 | 8 | 5 | 4 | 1 | 366.86 | 57.07 |
| [`editor.buffer.move_down`](File-src-editor-buffer-ml-1966067569.md#function-function-editor-buffer-move-down-function-move-down-buf-src-editor-buffer-ml-438300106) | `src/editor/buffer.ml:320` | 5 | 4 | 2 | 1 | 1 | 179.31 | 68.7 |
| [`editor.buffer.move_end`](File-src-editor-buffer-ml-1966067569.md#function-function-editor-buffer-move-end-function-move-end-buf-src-editor-buffer-ml-1984802330) | `src/editor/buffer.ml:335` | 5 | 3 | 1 | 0 | 0 | 120 | 70.06 |
| [`editor.buffer.move_home`](File-src-editor-buffer-ml-1966067569.md#function-function-editor-buffer-move-home-function-move-home-buf-src-editor-buffer-ml-308872764) | `src/editor/buffer.ml:328` | 4 | 2 | 1 | 0 | 0 | 60.94 | 74.23 |
| [`editor.buffer.move_left`](File-src-editor-buffer-ml-1966067569.md#function-function-editor-buffer-move-left-function-move-left-buf-src-editor-buffer-ml-855193164) | `src/editor/buffer.ml:281` | 12 | 7 | 3 | 3 | 2 | 316.65 | 58.55 |
| [`editor.buffer.move_right`](File-src-editor-buffer-ml-1966067569.md#function-function-editor-buffer-move-right-function-move-right-buf-src-editor-buffer-ml-1641846218) | `src/editor/buffer.ml:296` | 13 | 8 | 3 | 3 | 2 | 366.8 | 57.34 |
| [`editor.buffer.move_up`](File-src-editor-buffer-ml-1966067569.md#function-function-editor-buffer-move-up-function-move-up-buf-src-editor-buffer-ml-1566193836) | `src/editor/buffer.ml:312` | 5 | 4 | 2 | 1 | 1 | 147.15 | 69.31 |
| [`editor.buffer.new_buffer`](File-src-editor-buffer-ml-1966067569.md#function-function-editor-buffer-new-buffer-function-new-buffer-path-text-src-editor-buffer-ml-966634295) | `src/editor/buffer.ml:72` | 4 | 2 | 1 | 0 | 0 | 148 | 71.54 |
| [`editor.buffer.newline`](File-src-editor-buffer-ml-1966067569.md#function-function-editor-buffer-newline-function-newline-buf-src-editor-buffer-ml-1278469390) | `src/editor/buffer.ml:219` | 12 | 11 | 2 | 1 | 1 | 550 | 57 |
| [`editor.buffer.save`](File-src-editor-buffer-ml-1966067569.md#function-function-editor-buffer-save-function-save-buf-src-editor-buffer-ml-561051910) | `src/editor/buffer.ml:95` | 9 | 7 | 3 | 2 | 1 | 278.63 | 61.66 |
| [`editor.buffer.scroll`](File-src-editor-buffer-ml-1966067569.md#function-function-editor-buffer-scroll-function-scroll-buf-delta-src-editor-buffer-ml-434266126) | `src/editor/buffer.ml:344` | 9 | 11 | 5 | 4 | 1 | 362.22 | 60.59 |
| [`editor.buffer.set_cursor`](File-src-editor-buffer-ml-1966067569.md#function-function-editor-buffer-set-cursor-function-set-cursor-buf-line-col-src-editor-buffer-ml-657061884) | `src/editor/buffer.ml:374` | 6 | 5 | 2 | 1 | 1 | 164.23 | 67.24 |
| [`editor.buffer.word_prefix`](File-src-editor-buffer-ml-1966067569.md#function-function-editor-buffer-word-prefix-function-word-prefix-buf-src-editor-buffer-ml-363684940) | `src/editor/buffer.ml:383` | 17 | 17 | 5 | 6 | 2 | 797.29 | 52.17 |
| [`help.language._markdown_heading_title`](File-src-help-language-ml-591952903.md#function-function-help-language-markdown-heading-title-function-markdown-heading-title-line-src-help-language-ml-569301953) | `src/help/language.ml:55` | 11 | 11 | 6 | 5 | 1 | 516.99 | 57.48 |
| [`help.language._snippet`](File-src-help-language-ml-591952903.md#function-function-help-language-snippet-function-snippet-line-src-help-language-ml-281659561) | `src/help/language.ml:69` | 5 | 4 | 2 | 1 | 1 | 182.84 | 68.64 |
| [`help.language.read_reference`](File-src-help-language-ml-591952903.md#function-function-help-language-read-reference-function-read-reference-root-compiler-path-src-help-language-ml-528458914) | `src/help/language.ml:45` | 7 | 7 | 3 | 2 | 1 | 313.82 | 63.68 |
| [`help.language.reference_path`](File-src-help-language-ml-591952903.md#function-function-help-language-reference-path-function-reference-path-root-compiler-path-src-help-language-ml-1612605702) | `src/help/language.ml:28` | 13 | 15 | 10 | 9 | 1 | 791.97 | 54.06 |
| [`help.language.search_document`](File-src-help-language-ml-591952903.md#function-function-help-language-search-document-function-search-document-content-query-src-help-language-ml-20033608) | `src/help/language.ml:78` | 29 | 25 | 10 | 17 | 4 | 1320.98 | 44.9 |
| [`lang.index._add_source_file`](File-src-lang-index-ml-680000828.md#function-function-lang-index-add-source-file-function-add-source-file-files-root-path-text-src-lang-index-ml-724448160) | `src/lang/index.ml:101` | 3 | 1 | 1 | 0 | 0 | 138.97 | 74.45 |
| [`lang.index._bare_target`](File-src-lang-index-ml-680000828.md#function-function-lang-index-bare-target-function-bare-target-line-src-lang-index-ml-1445434037) | `src/lang/index.ml:127` | 10 | 12 | 5 | 4 | 1 | 565 | 58.24 |
| [`lang.index._import_alias`](File-src-lang-index-ml-680000828.md#function-function-lang-index-import-alias-function-import-alias-line-src-lang-index-ml-185330319) | `src/lang/index.ml:140` | 6 | 6 | 3 | 2 | 1 | 337.6 | 64.92 |
| [`lang.index._is_abs`](File-src-lang-index-ml-680000828.md#function-function-lang-index-is-abs-function-is-abs-path-src-lang-index-ml-1313277050) | `src/lang/index.ml:68` | 6 | 7 | 6 | 5 | 1 | 309.13 | 64.78 |
| [`lang.index._line_count`](File-src-lang-index-ml-680000828.md#function-function-lang-index-line-count-function-line-count-text-src-lang-index-ml-1898115136) | `src/lang/index.ml:90` | 5 | 4 | 3 | 2 | 1 | 220.92 | 67.93 |
| [`lang.index._module_to_path`](File-src-lang-index-ml-680000828.md#function-function-lang-index-module-to-path-function-module-to-path-target-src-lang-index-ml-1712063478) | `src/lang/index.ml:149` | 5 | 5 | 4 | 3 | 1 | 255.41 | 67.36 |
| [`lang.index._quoted_target`](File-src-lang-index-ml-680000828.md#function-function-lang-index-quoted-target-function-quoted-target-line-src-lang-index-ml-1100050989) | `src/lang/index.ml:116` | 8 | 9 | 4 | 3 | 1 | 384.59 | 61.66 |
| [`lang.index._relative`](File-src-lang-index-ml-680000828.md#function-function-lang-index-relative-function-relative-root-path-src-lang-index-ml-1091799556) | `src/lang/index.ml:78` | 9 | 8 | 6 | 5 | 1 | 530.1 | 59.3 |
| [`lang.index._resolve_candidate`](File-src-lang-index-ml-680000828.md#function-function-lang-index-resolve-candidate-function-resolve-candidate-root-current-file-import-paths-candidate-src-lang-index-ml-1019115604) | `src/lang/index.ml:160` | 18 | 21 | 14 | 20 | 3 | 1159.95 | 49.28 |
| [`lang.index._scan_imports`](File-src-lang-index-ml-680000828.md#function-function-lang-index-scan-imports-function-scan-imports-root-current-file-import-paths-text-src-lang-index-ml-1891734858) | `src/lang/index.ml:188` | 20 | 23 | 8 | 11 | 2 | 1170.65 | 49.06 |
| [`lang.index._strip_line_comment`](File-src-lang-index-ml-680000828.md#function-function-lang-index-strip-line-comment-function-strip-line-comment-line-src-lang-index-ml-1330377413) | `src/lang/index.ml:107` | 6 | 6 | 3 | 2 | 1 | 230.7 | 66.08 |
| [`lang.index.build_project_index`](File-src-lang-index-ml-680000828.md#function-function-lang-index-build-project-index-function-build-project-index-p-src-lang-index-ml-1893272859) | `src/lang/index.ml:213` | 30 | 30 | 12 | 27 | 5 | 1629.49 | 43.67 |
| [`lang.index.summary`](File-src-lang-index-ml-680000828.md#function-function-lang-index-summary-function-summary-idx-src-lang-index-ml-469724616) | `src/lang/index.ml:249` | 14 | 18 | 7 | 6 | 1 | 760.58 | 53.88 |
| [`lang.service._add_completion`](File-src-lang-service-ml-621944297.md#function-function-lang-service-add-completion-function-add-completion-items-label-insert-text-kind-file-line-prefix-limit-src-lang-service-ml-24309713) | `src/lang/service.ml:404` | 6 | 7 | 4 | 3 | 1 | 361.37 | 64.58 |
| [`lang.service._add_duplicate_declaration_inspections`](File-src-lang-service-ml-621944297.md#function-function-lang-service-add-duplicate-declaration-inspections-function-add-duplicate-declaration-inspections-items-idx-limit-src-lang-service-ml-1153623217) | `src/lang/service.ml:1244` | 24 | 25 | 12 | 22 | 4 | 1225.59 | 46.65 |
| [`lang.service._add_test_item`](File-src-lang-service-ml-621944297.md#function-function-lang-service-add-test-item-function-add-test-item-items-name-kind-file-line-status-src-lang-service-ml-1733148742) | `src/lang/service.ml:819` | 7 | 9 | 7 | 6 | 1 | 475.6 | 61.88 |
| [`lang.service._compact_query_text`](File-src-lang-service-ml-621944297.md#function-function-lang-service-compact-query-text-function-compact-query-text-value-src-lang-service-ml-637474462) | `src/lang/service.ml:354` | 9 | 8 | 4 | 4 | 2 | 310.91 | 61.19 |
| [`lang.service._declaration_col`](File-src-lang-service-ml-621944297.md#function-function-lang-service-declaration-col-function-declaration-col-raw-name-src-lang-service-ml-899524804) | `src/lang/service.ml:297` | 6 | 6 | 5 | 4 | 1 | 267.93 | 65.35 |
| [`lang.service._declarations_for_file`](File-src-lang-service-ml-621944297.md#function-function-lang-service-declarations-for-file-function-declarations-for-file-file-src-lang-service-ml-2088563001) | `src/lang/service.ml:1167` | 52 | 48 | 19 | 35 | 4 | 2597.54 | 36.1 |
| [`lang.service._file_stem`](File-src-lang-service-ml-621944297.md#function-function-lang-service-file-stem-function-file-stem-path-src-lang-service-ml-1136808830) | `src/lang/service.ml:776` | 20 | 17 | 8 | 9 | 2 | 724.1 | 50.52 |
| [`lang.service._find_word`](File-src-lang-service-ml-621944297.md#function-function-lang-service-find-word-function-find-word-line-word-start-src-lang-service-ml-1095589145) | `src/lang/service.ml:308` | 15 | 17 | 13 | 15 | 2 | 814.24 | 52.22 |
| [`lang.service._has_completion`](File-src-lang-service-ml-621944297.md#function-function-lang-service-has-completion-function-has-completion-items-label-src-lang-service-ml-516389585) | `src/lang/service.ml:333` | 9 | 9 | 6 | 6 | 2 | 360 | 60.48 |
| [`lang.service._has_declaration_name`](File-src-lang-service-ml-621944297.md#function-function-lang-service-has-declaration-name-function-has-declaration-name-items-name-src-lang-service-ml-1881915494) | `src/lang/service.ml:1230` | 9 | 9 | 8 | 8 | 2 | 425.73 | 59.7 |
| [`lang.service._has_test_item`](File-src-lang-service-ml-621944297.md#function-function-lang-service-has-test-item-function-has-test-item-items-name-file-line-src-lang-service-ml-1709362210) | `src/lang/service.ml:802` | 9 | 9 | 8 | 8 | 2 | 447.7 | 59.55 |
| [`lang.service._has_text`](File-src-lang-service-ml-621944297.md#function-function-lang-service-has-text-function-has-text-items-value-src-lang-service-ml-1972179086) | `src/lang/service.ml:589` | 9 | 10 | 7 | 7 | 2 | 376.52 | 60.21 |
| [`lang.service._import_alias_used`](File-src-lang-service-ml-621944297.md#function-function-lang-service-import-alias-used-function-import-alias-used-file-alias-import-line-src-lang-service-ml-131885721) | `src/lang/service.ml:1148` | 15 | 19 | 12 | 15 | 2 | 914.3 | 52 |
| [`lang.service._is_abs_path`](File-src-lang-service-ml-621944297.md#function-function-lang-service-is-abs-path-function-is-abs-path-path-src-lang-service-ml-518013358) | `src/lang/service.ml:755` | 6 | 7 | 6 | 5 | 1 | 309.13 | 64.78 |
| [`lang.service._is_identifier_char`](File-src-lang-service-ml-621944297.md#function-function-lang-service-is-identifier-char-function-is-identifier-char-ch-src-lang-service-ml-1357713454) | `src/lang/service.ml:248` | 7 | 7 | 3 | 2 | 1 | 227.55 | 64.66 |
| [`lang.service._is_identifier_start`](File-src-lang-service-ml-621944297.md#function-function-lang-service-is-identifier-start-function-is-identifier-start-ch-src-lang-service-ml-602087278) | `src/lang/service.ml:237` | 8 | 9 | 5 | 4 | 1 | 383.37 | 61.54 |
| [`lang.service._is_query_subsequence`](File-src-lang-service-ml-621944297.md#function-function-lang-service-is-query-subsequence-function-is-query-subsequence-haystack-needle-src-lang-service-ml-504485640) | `src/lang/service.ml:367` | 12 | 11 | 7 | 9 | 3 | 425 | 57.11 |
| [`lang.service._is_simple_identifier`](File-src-lang-service-ml-621944297.md#function-function-lang-service-is-simple-identifier-function-is-simple-identifier-name-src-lang-service-ml-1014522174) | `src/lang/service.ml:258` | 8 | 8 | 6 | 6 | 2 | 330.34 | 61.86 |
| [`lang.service._is_test_path`](File-src-lang-service-ml-621944297.md#function-function-lang-service-is-test-path-function-is-test-path-path-src-lang-service-ml-656582606) | `src/lang/service.ml:829` | 5 | 4 | 2 | 1 | 1 | 341.32 | 66.75 |
| [`lang.service._is_test_symbol`](File-src-lang-service-ml-621944297.md#function-function-lang-service-is-test-symbol-function-is-test-symbol-name-src-lang-service-ml-26249496) | `src/lang/service.ml:837` | 5 | 4 | 2 | 1 | 1 | 230.32 | 67.94 |
| [`lang.service._is_word_char`](File-src-lang-service-ml-621944297.md#function-function-lang-service-is-word-char-function-is-word-char-ch-src-lang-service-ml-246911452) | `src/lang/service.ml:226` | 8 | 9 | 6 | 5 | 1 | 465.29 | 60.81 |
| [`lang.service._join_path`](File-src-lang-service-ml-621944297.md#function-function-lang-service-join-path-function-join-path-root-path-src-lang-service-ml-939156386) | `src/lang/service.ml:765` | 8 | 10 | 8 | 7 | 1 | 399.01 | 61.01 |
| [`lang.service._line_uses_import_alias`](File-src-lang-service-ml-621944297.md#function-function-lang-service-line-uses-import-alias-function-line-uses-import-alias-line-alias-src-lang-service-ml-1408189035) | `src/lang/service.ml:1126` | 17 | 17 | 12 | 16 | 3 | 754.92 | 51.39 |
| [`lang.service._matches_prefix`](File-src-lang-service-ml-621944297.md#function-function-lang-service-matches-prefix-function-matches-prefix-label-prefix-src-lang-service-ml-1614186871) | `src/lang/service.ml:346` | 5 | 5 | 5 | 4 | 1 | 271.41 | 67.04 |
| [`lang.service._query_score`](File-src-lang-service-ml-621944297.md#function-function-lang-service-query-score-function-query-score-label-query-src-lang-service-ml-238113337) | `src/lang/service.ml:383` | 11 | 15 | 8 | 7 | 1 | 600 | 56.75 |
| [`lang.service._replace_word_in_line`](File-src-lang-service-ml-621944297.md#function-function-lang-service-replace-word-in-line-function-replace-word-in-line-line-word-new-name-src-lang-service-ml-1522200639) | `src/lang/service.ml:1015` | 20 | 23 | 9 | 9 | 2 | 1034.01 | 49.3 |
| [`lang.service._replace_word_in_text`](File-src-lang-service-ml-621944297.md#function-function-lang-service-replace-word-in-text-function-replace-word-in-text-text-word-new-name-src-lang-service-ml-1301223170) | `src/lang/service.ml:1040` | 15 | 15 | 5 | 5 | 2 | 701.84 | 53.74 |
| [`lang.service._strip_line_comment`](File-src-lang-service-ml-621944297.md#function-function-lang-service-strip-line-comment-function-strip-line-comment-line-src-lang-service-ml-1269545373) | `src/lang/service.ml:269` | 6 | 6 | 3 | 2 | 1 | 230.7 | 66.08 |
| [`lang.service._take_word`](File-src-lang-service-ml-621944297.md#function-function-lang-service-take-word-function-take-word-text-start-src-lang-service-ml-1622021372) | `src/lang/service.ml:279` | 14 | 13 | 10 | 9 | 1 | 619.26 | 54.1 |
| [`lang.service.analyze_project`](File-src-lang-service-ml-621944297.md#function-function-lang-service-analyze-project-function-analyze-project-project-src-lang-service-ml-414889232) | `src/lang/service.ml:326` | 3 | 1 | 1 | 0 | 0 | 68.11 | 76.62 |
| [`lang.service.apply_rename`](File-src-lang-service-ml-621944297.md#function-function-lang-service-apply-rename-function-apply-rename-snapshot-word-new-name-limit-src-lang-service-ml-1667513802) | `src/lang/service.ml:1061` | 36 | 47 | 22 | 25 | 2 | 2983.5 | 38.76 |
| [`lang.service.call_hierarchy_items`](File-src-lang-service-ml-621944297.md#function-function-lang-service-call-hierarchy-items-function-call-hierarchy-items-snapshot-word-limit-src-lang-service-ml-1305248162) | `src/lang/service.ml:1106` | 16 | 18 | 11 | 13 | 2 | 1000.18 | 51.25 |
| [`lang.service.code_inspection_items`](File-src-lang-service-ml-621944297.md#function-function-lang-service-code-inspection-items-function-code-inspection-items-snapshot-limit-src-lang-service-ml-1960242908) | `src/lang/service.ml:1274` | 37 | 46 | 27 | 44 | 3 | 2511.16 | 38.35 |
| [`lang.service.completion_items`](File-src-lang-service-ml-621944297.md#function-function-lang-service-completion-items-function-completion-items-snapshot-prefix-limit-src-lang-service-ml-369293454) | `src/lang/service.ml:415` | 22 | 20 | 12 | 15 | 3 | 1277.68 | 47.35 |
| [`lang.service.completion_labels`](File-src-lang-service-ml-621944297.md#function-function-lang-service-completion-labels-function-completion-labels-snapshot-prefix-limit-src-lang-service-ml-1358015706) | `src/lang/service.ml:445` | 10 | 9 | 5 | 5 | 2 | 434.27 | 59.04 |
| [`lang.service.diagnostics`](File-src-lang-service-ml-621944297.md#function-function-lang-service-diagnostics-function-diagnostics-snapshot-src-lang-service-ml-1563243999) | `src/lang/service.ml:601` | 56 | 48 | 31 | 52 | 4 | 3670.67 | 32.74 |
| [`lang.service.file_items`](File-src-lang-service-ml-621944297.md#function-function-lang-service-file-items-function-file-items-snapshot-query-limit-src-lang-service-ml-1707250374) | `src/lang/service.ml:522` | 34 | 42 | 19 | 27 | 2 | 1947.49 | 41 |
| [`lang.service.import_items`](File-src-lang-service-ml-621944297.md#function-function-lang-service-import-items-function-import-items-snapshot-query-limit-src-lang-service-ml-1960700654) | `src/lang/service.ml:564` | 18 | 22 | 12 | 14 | 2 | 1335.62 | 49.12 |
| [`lang.service.references`](File-src-lang-service-ml-621944297.md#function-function-lang-service-references-function-references-snapshot-word-limit-src-lang-service-ml-1646887154) | `src/lang/service.ml:957` | 27 | 30 | 15 | 23 | 4 | 1601.68 | 44.32 |
| [`lang.service.related_test_file`](File-src-lang-service-ml-621944297.md#function-function-lang-service-related-test-file-function-related-test-file-snapshot-current-file-src-lang-service-ml-1176049633) | `src/lang/service.ml:937` | 15 | 16 | 12 | 15 | 2 | 798.29 | 52.41 |
| [`lang.service.related_test_items`](File-src-lang-service-ml-621944297.md#function-function-lang-service-related-test-items-function-related-test-items-snapshot-current-file-limit-src-lang-service-ml-1790392626) | `src/lang/service.ml:881` | 47 | 53 | 31 | 64 | 5 | 2980.26 | 35.03 |
| [`lang.service.rename_preview_items`](File-src-lang-service-ml-621944297.md#function-function-lang-service-rename-preview-items-function-rename-preview-items-snapshot-word-new-name-limit-src-lang-service-ml-23981446) | `src/lang/service.ml:993` | 17 | 21 | 13 | 14 | 2 | 1060.28 | 50.23 |
| [`lang.service.symbol_info`](File-src-lang-service-ml-621944297.md#function-function-lang-service-symbol-info-function-symbol-info-snapshot-name-src-lang-service-ml-316283600) | `src/lang/service.ml:498` | 18 | 21 | 10 | 12 | 2 | 966.62 | 50.37 |
| [`lang.service.symbol_items`](File-src-lang-service-ml-621944297.md#function-function-lang-service-symbol-items-function-symbol-items-snapshot-prefix-limit-src-lang-service-ml-1439355102) | `src/lang/service.ml:460` | 31 | 39 | 19 | 27 | 2 | 1999.04 | 41.8 |
| [`lang.service.test_items`](File-src-lang-service-ml-621944297.md#function-function-lang-service-test-items-function-test-items-snapshot-limit-src-lang-service-ml-712335434) | `src/lang/service.ml:846` | 27 | 29 | 15 | 19 | 2 | 1488 | 44.54 |
| [`lang.service.todo_items`](File-src-lang-service-ml-621944297.md#function-function-lang-service-todo-items-function-todo-items-snapshot-limit-src-lang-service-ml-237141062) | `src/lang/service.ml:723` | 26 | 32 | 16 | 27 | 3 | 1644.11 | 44.46 |
| [`lang.service.workspace_health_lines`](File-src-lang-service-ml-621944297.md#function-function-lang-service-workspace-health-lines-function-workspace-health-lines-snapshot-src-lang-service-ml-1077255643) | `src/lang/service.ml:664` | 55 | 53 | 24 | 41 | 3 | 2700.98 | 34.78 |
| [`lang.symbols._add_symbol`](File-src-lang-symbols-ml-2023047483.md#function-function-lang-symbols-add-symbol-function-add-symbol-symbols-name-kind-file-line-src-lang-symbols-ml-1108696389) | `src/lang/symbols.ml:88` | 5 | 5 | 4 | 3 | 1 | 269.34 | 67.2 |
| [`lang.symbols._completion_add`](File-src-lang-symbols-ml-2023047483.md#function-function-lang-symbols-completion-add-function-completion-add-items-name-prefix-limit-src-lang-symbols-ml-1973820499) | `src/lang/symbols.ml:200` | 7 | 9 | 7 | 6 | 1 | 440.92 | 62.11 |
| [`lang.symbols._completion_has`](File-src-lang-symbols-ml-2023047483.md#function-function-lang-symbols-completion-has-function-completion-has-items-name-src-lang-symbols-ml-102265454) | `src/lang/symbols.ml:185` | 8 | 8 | 5 | 5 | 2 | 288.44 | 62.4 |
| [`lang.symbols._has_symbol`](File-src-lang-symbols-ml-2023047483.md#function-function-lang-symbols-has-symbol-function-has-symbol-symbols-name-src-lang-symbols-ml-1263651325) | `src/lang/symbols.ml:72` | 8 | 8 | 6 | 6 | 2 | 356.7 | 61.62 |
| [`lang.symbols._is_word_char`](File-src-lang-symbols-ml-2023047483.md#function-function-lang-symbols-is-word-char-function-is-word-char-ch-src-lang-symbols-ml-430925392) | `src/lang/symbols.ml:45` | 6 | 5 | 2 | 1 | 1 | 341.84 | 65.01 |
| [`lang.symbols._scan_source`](File-src-lang-symbols-ml-2023047483.md#function-function-lang-symbols-scan-source-function-scan-source-path-text-symbols-src-lang-symbols-ml-1586744268) | `src/lang/symbols.ml:98` | 52 | 45 | 16 | 25 | 3 | 2531.64 | 36.58 |
| [`lang.symbols._take_word`](File-src-lang-symbols-ml-2023047483.md#function-function-lang-symbols-take-word-function-take-word-text-start-src-lang-symbols-ml-1057623360) | `src/lang/symbols.ml:55` | 13 | 11 | 8 | 7 | 1 | 522.16 | 55.59 |
| [`lang.symbols.build_index`](File-src-lang-symbols-ml-2023047483.md#function-function-lang-symbols-build-index-function-build-index-project-src-lang-symbols-ml-1420651198) | `src/lang/symbols.ml:162` | 17 | 15 | 9 | 15 | 3 | 784.35 | 51.68 |
| [`lang.symbols.completions`](File-src-lang-symbols-ml-2023047483.md#function-function-lang-symbols-completions-function-completions-index-prefix-src-lang-symbols-ml-1287723581) | `src/lang/symbols.ml:211` | 18 | 11 | 7 | 12 | 4 | 671.73 | 51.88 |
| [`lang.syntax._char_code`](File-src-lang-syntax-ml-2103667443.md#function-function-lang-syntax-char-code-function-char-code-ch-src-lang-syntax-ml-860763200) | `src/lang/syntax.ml:46` | 5 | 4 | 2 | 1 | 1 | 131.69 | 69.64 |
| [`lang.syntax._is_alpha`](File-src-lang-syntax-ml-2103667443.md#function-function-lang-syntax-is-alpha-function-is-alpha-ch-src-lang-syntax-ml-1939120672) | `src/lang/syntax.ml:54` | 4 | 2 | 1 | 0 | 0 | 137.61 | 71.76 |
| [`lang.syntax._is_digit`](File-src-lang-syntax-ml-2103667443.md#function-function-lang-syntax-is-digit-function-is-digit-ch-src-lang-syntax-ml-1876598942) | `src/lang/syntax.ml:61` | 4 | 2 | 1 | 0 | 0 | 82.04 | 73.33 |
| [`lang.syntax._is_ident_part`](File-src-lang-syntax-ml-2103667443.md#function-function-lang-syntax-is-ident-part-function-is-ident-part-ch-src-lang-syntax-ml-191627788) | `src/lang/syntax.ml:74` | 3 | 1 | 1 | 0 | 0 | 56.47 | 77.19 |
| [`lang.syntax._is_ident_start`](File-src-lang-syntax-ml-2103667443.md#function-function-lang-syntax-is-ident-start-function-is-ident-start-ch-src-lang-syntax-ml-1761014926) | `src/lang/syntax.ml:68` | 3 | 1 | 1 | 0 | 0 | 55.35 | 77.25 |
| [`lang.syntax._is_keyword`](File-src-lang-syntax-ml-2103667443.md#function-function-lang-syntax-is-keyword-function-is-keyword-word-src-lang-syntax-ml-1611168093) | `src/lang/syntax.ml:80` | 6 | 4 | 3 | 3 | 2 | 153.8 | 67.31 |
| [`lang.syntax._push_seg`](File-src-lang-syntax-ml-2103667443.md#function-function-lang-syntax-push-seg-function-push-seg-segments-text-kind-src-lang-syntax-ml-1563477006) | `src/lang/syntax.ml:92` | 4 | 3 | 2 | 1 | 1 | 129.27 | 71.81 |
| [`lang.syntax.keywords`](File-src-lang-syntax-ml-2103667443.md#function-function-lang-syntax-keywords-function-keywords-src-lang-syntax-ml-1074472159) | `src/lang/syntax.ml:40` | 3 | 1 | 1 | 0 | 0 | 22.46 | 80 |
| [`lang.syntax.line_segments`](File-src-lang-syntax-ml-2103667443.md#function-function-lang-syntax-line-segments-function-line-segments-line-src-lang-syntax-ml-215739463) | `src/lang/syntax.ml:99` | 88 | 69 | 31 | 68 | 6 | 3086.34 | 28.98 |
| [`main`](File-src-main-ml-186468670.md#function-function-main-function-main-args-src-main-ml-776500952) | `src/main.ml:8559` | 13 | 9 | 4 | 4 | 2 | 400.08 | 56.94 |
| [`platform.win32._image_list_add_shell_icon`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-image-list-add-shell-icon-function-image-list-add-shell-icon-image-list-path-attrs-src-platform-win32-ml-1959251868) | `src/platform/win32.ml:1149` | 8 | 8 | 3 | 2 | 1 | 236.35 | 63.28 |
| [`platform.win32._read_ptr`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-read-ptr-function-read-ptr-buf-off-src-platform-win32-ml-150567033) | `src/platform/win32.ml:989` | 5 | 3 | 1 | 0 | 0 | 134.89 | 69.7 |
| [`platform.win32._read_s32`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-read-s32-function-read-s32-buf-off-src-platform-win32-ml-327066713) | `src/platform/win32.ml:978` | 7 | 4 | 2 | 1 | 1 | 125.1 | 66.61 |
| [`platform.win32._read_u32`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-read-u32-function-read-u32-buf-off-src-platform-win32-ml-1964925241) | `src/platform/win32.ml:971` | 3 | 1 | 1 | 0 | 0 | 203.13 | 73.3 |
| [`platform.win32._shell_small_icon`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-shell-small-icon-function-shell-small-icon-path-attrs-src-platform-win32-ml-684095116) | `src/platform/win32.ml:1135` | 9 | 10 | 5 | 4 | 1 | 418.68 | 60.15 |
| [`platform.win32._signed16`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-signed16-function-signed16-value-src-platform-win32-ml-1106522918) | `src/platform/win32.ml:1335` | 5 | 4 | 2 | 1 | 1 | 102.19 | 70.41 |
| [`platform.win32._wide_alloc`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-wide-alloc-function-wide-alloc-text-src-platform-win32-ml-448296022) | `src/platform/win32.ml:1264` | 16 | 15 | 6 | 5 | 1 | 584.74 | 53.55 |
| [`platform.win32._wide_free`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-wide-free-function-wide-free-mem-src-platform-win32-ml-48566866) | `src/platform/win32.ml:1283` | 4 | 3 | 2 | 1 | 1 | 68.11 | 73.76 |
| [`platform.win32._write_ptr`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-write-ptr-function-write-ptr-buf-off-value-src-platform-win32-ml-1072237496) | `src/platform/win32.ml:956` | 11 | 7 | 2 | 1 | 1 | 261.34 | 60.09 |
| [`platform.win32._write_u32`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-write-u32-function-write-u32-buf-off-value-src-platform-win32-ml-1596345512) | `src/platform/win32.ml:944` | 7 | 5 | 1 | 0 | 0 | 302.61 | 64.06 |
| [`platform.win32.char_from_code`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-char-from-code-function-char-from-code-code-src-platform-win32-ml-2058619892) | `src/platform/win32.ml:1413` | 12 | 13 | 4 | 3 | 1 | 440 | 57.41 |
| [`platform.win32.client_size`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-client-size-function-client-size-hwnd-src-platform-win32-ml-162915476) | `src/platform/win32.ml:1023` | 6 | 5 | 2 | 1 | 1 | 317.29 | 65.24 |
| [`platform.win32.client_to_screen_point`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-client-to-screen-point-function-client-to-screen-point-hwnd-x-y-src-platform-win32-ml-1777664211) | `src/platform/win32.ml:1067` | 7 | 5 | 1 | 0 | 0 | 236.35 | 64.81 |
| [`platform.win32.combo_add`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-combo-add-function-combo-add-hwnd-text-src-platform-win32-ml-456056311) | `src/platform/win32.ml:1607` | 5 | 5 | 3 | 2 | 1 | 194.51 | 68.32 |
| [`platform.win32.combo_getsel`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-combo-getsel-function-combo-getsel-hwnd-src-platform-win32-ml-932450546) | `src/platform/win32.ml:1615` | 4 | 3 | 2 | 1 | 1 | 114.45 | 72.18 |
| [`platform.win32.combo_setsel`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-combo-setsel-function-combo-setsel-hwnd-idx-src-platform-win32-ml-1925691099) | `src/platform/win32.ml:1623` | 4 | 3 | 2 | 1 | 1 | 108 | 72.36 |
| [`platform.win32.create_child`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-create-child-function-create-child-parent-class-name-title-ex-style-style-x-y-w-h-src-platform-win32-ml-1747259839) | `src/platform/win32.ml:1463` | 3 | 1 | 1 | 0 | 0 | 249.73 | 72.67 |
| [`platform.win32.create_child_id`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-create-child-id-function-create-child-id-parent-class-name-title-ex-style-style-x-y-w-h-control-id-src-platform-win32-ml-1476509952) | `src/platform/win32.ml:1478` | 3 | 1 | 1 | 0 | 0 | 262.37 | 72.52 |
| [`platform.win32.create_directory`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-create-directory-function-create-directory-path-src-platform-win32-ml-542963606) | `src/platform/win32.ml:1120` | 4 | 3 | 3 | 2 | 1 | 127.44 | 71.72 |
| [`platform.win32.create_icon_static`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-create-icon-static-function-create-icon-static-parent-icon-src-platform-win32-ml-912804572) | `src/platform/win32.ml:1190` | 6 | 6 | 3 | 2 | 1 | 287.92 | 65.4 |
| [`platform.win32.create_main_window`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-create-main-window-function-create-main-window-title-width-height-src-platform-win32-ml-928126896) | `src/platform/win32.ml:1430` | 13 | 12 | 2 | 1 | 1 | 643.95 | 55.76 |
| [`platform.win32.create_tab`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-create-tab-function-create-tab-parent-control-id-src-platform-win32-ml-1363435038) | `src/platform/win32.ml:1493` | 4 | 2 | 1 | 0 | 0 | 159.91 | 71.3 |
| [`platform.win32.create_tree`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-create-tree-function-create-tree-parent-control-id-src-platform-win32-ml-1437676964) | `src/platform/win32.ml:1485` | 4 | 2 | 1 | 0 | 0 | 215.49 | 70.39 |
| [`platform.win32.create_tree_image_list`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-create-tree-image-list-function-create-tree-image-list-src-platform-win32-ml-2101539927) | `src/platform/win32.ml:1159` | 9 | 8 | 2 | 1 | 1 | 305.53 | 61.51 |
| [`platform.win32.destroy_menu`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-destroy-menu-function-destroy-menu-menu-src-platform-win32-ml-505547406) | `src/platform/win32.ml:1113` | 4 | 3 | 2 | 1 | 1 | 68.11 | 73.76 |
| [`platform.win32.draw_line`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-draw-line-function-draw-line-hdc-x1-y1-x2-y2-color-src-platform-win32-ml-1058222373) | `src/platform/win32.ml:1233` | 9 | 9 | 3 | 2 | 1 | 389.4 | 60.64 |
| [`platform.win32.draw_text`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-draw-text-function-draw-text-hdc-x-y-text-color-src-platform-win32-ml-1608351591) | `src/platform/win32.ml:1219` | 6 | 5 | 2 | 1 | 1 | 236.35 | 66.14 |
| [`platform.win32.edit_allow_large_text`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-edit-allow-large-text-function-edit-allow-large-text-hwnd-src-platform-win32-ml-1839759754) | `src/platform/win32.ml:1782` | 4 | 3 | 2 | 1 | 1 | 100 | 72.59 |
| [`platform.win32.edit_char_from_pos`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-edit-char-from-pos-function-edit-char-from-pos-hwnd-x-y-src-platform-win32-ml-1955606943) | `src/platform/win32.ml:1876` | 9 | 9 | 4 | 3 | 1 | 376.52 | 60.61 |
| [`platform.win32.edit_copy`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-edit-copy-function-edit-copy-hwnd-src-platform-win32-ml-318834330) | `src/platform/win32.ml:1948` | 4 | 3 | 2 | 1 | 1 | 97.67 | 72.67 |
| [`platform.win32.edit_cut`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-edit-cut-function-edit-cut-hwnd-src-platform-win32-ml-1951445946) | `src/platform/win32.ml:1941` | 4 | 3 | 2 | 1 | 1 | 97.67 | 72.67 |
| [`platform.win32.edit_first_visible_line`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-edit-first-visible-line-function-edit-first-visible-line-hwnd-src-platform-win32-ml-1916278788) | `src/platform/win32.ml:1896` | 4 | 3 | 2 | 1 | 1 | 105.49 | 72.43 |
| [`platform.win32.edit_get_scroll_pos`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-edit-get-scroll-pos-function-edit-get-scroll-pos-hwnd-src-platform-win32-ml-1391521138) | `src/platform/win32.ml:1903` | 6 | 5 | 2 | 1 | 1 | 226.18 | 66.27 |
| [`platform.win32.edit_get_text`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-edit-get-text-function-edit-get-text-hwnd-src-platform-win32-ml-108378408) | `src/platform/win32.ml:1935` | 3 | 1 | 1 | 0 | 0 | 36 | 78.56 |
| [`platform.win32.edit_getsel`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-edit-getsel-function-edit-getsel-hwnd-src-platform-win32-ml-1937759344) | `src/platform/win32.ml:1841` | 7 | 6 | 2 | 1 | 1 | 280.46 | 64.16 |
| [`platform.win32.edit_is_modified`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-edit-is-modified-function-edit-is-modified-hwnd-src-platform-win32-ml-174700766) | `src/platform/win32.ml:1814` | 4 | 3 | 2 | 1 | 1 | 118.54 | 72.08 |
| [`platform.win32.edit_line_count`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-edit-line-count-function-edit-line-count-hwnd-src-platform-win32-ml-548168052) | `src/platform/win32.ml:1851` | 4 | 3 | 2 | 1 | 1 | 105.49 | 72.43 |
| [`platform.win32.edit_line_from_char`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-edit-line-from-char-function-edit-line-from-char-hwnd-char-pos-src-platform-win32-ml-35287419) | `src/platform/win32.ml:1889` | 4 | 3 | 2 | 1 | 1 | 116 | 72.14 |
| [`platform.win32.edit_line_from_pos`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-edit-line-from-pos-function-edit-line-from-pos-hwnd-x-y-src-platform-win32-ml-366196959) | `src/platform/win32.ml:1926` | 6 | 6 | 3 | 2 | 1 | 198.81 | 66.53 |
| [`platform.win32.edit_line_index`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-edit-line-index-function-edit-line-index-hwnd-line-no-src-platform-win32-ml-428076402) | `src/platform/win32.ml:1859` | 4 | 3 | 2 | 1 | 1 | 125.1 | 71.91 |
| [`platform.win32.edit_line_length`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-edit-line-length-function-edit-line-length-hwnd-char-pos-src-platform-win32-ml-140603269) | `src/platform/win32.ml:1867` | 4 | 3 | 2 | 1 | 1 | 116 | 72.14 |
| [`platform.win32.edit_paste`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-edit-paste-function-edit-paste-hwnd-src-platform-win32-ml-1840832638) | `src/platform/win32.ml:1955` | 4 | 3 | 2 | 1 | 1 | 97.67 | 72.67 |
| [`platform.win32.edit_replace_sel`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-edit-replace-sel-function-edit-replace-sel-hwnd-text-src-platform-win32-ml-1652117123) | `src/platform/win32.ml:1970` | 5 | 5 | 3 | 2 | 1 | 175.69 | 68.63 |
| [`platform.win32.edit_scroll_caret`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-edit-scroll-caret-function-edit-scroll-caret-hwnd-src-platform-win32-ml-831444874) | `src/platform/win32.ml:1798` | 4 | 3 | 2 | 1 | 1 | 97.67 | 72.67 |
| [`platform.win32.edit_scroll_lines`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-edit-scroll-lines-function-edit-scroll-lines-hwnd-dx-dy-src-platform-win32-ml-1955448195) | `src/platform/win32.ml:1807` | 4 | 3 | 2 | 1 | 1 | 116 | 72.14 |
| [`platform.win32.edit_select_all`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-edit-select-all-function-edit-select-all-hwnd-src-platform-win32-ml-125607116) | `src/platform/win32.ml:1962` | 4 | 3 | 2 | 1 | 1 | 100 | 72.59 |
| [`platform.win32.edit_set_background`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-edit-set-background-function-edit-set-background-hwnd-color-src-platform-win32-ml-154013123) | `src/platform/win32.ml:1979` | 5 | 4 | 2 | 1 | 1 | 145.95 | 69.33 |
| [`platform.win32.edit_set_modified`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-edit-set-modified-function-edit-set-modified-hwnd-modified-src-platform-win32-ml-1102730909) | `src/platform/win32.ml:1822` | 6 | 6 | 3 | 2 | 1 | 161.42 | 67.16 |
| [`platform.win32.edit_set_readonly`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-edit-set-readonly-function-edit-set-readonly-hwnd-readonly-src-platform-win32-ml-802633920) | `src/platform/win32.ml:1832` | 6 | 6 | 3 | 2 | 1 | 161.42 | 67.16 |
| [`platform.win32.edit_set_redraw`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-edit-set-redraw-function-edit-set-redraw-hwnd-enabled-src-platform-win32-ml-156210639) | `src/platform/win32.ml:2090` | 10 | 9 | 4 | 3 | 1 | 245.27 | 60.92 |
| [`platform.win32.edit_set_scroll_pos`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-edit-set-scroll-pos-function-edit-set-scroll-pos-hwnd-x-y-src-platform-win32-ml-309930355) | `src/platform/win32.ml:1914` | 7 | 6 | 2 | 1 | 1 | 239.75 | 64.63 |
| [`platform.win32.edit_setsel`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-edit-setsel-function-edit-setsel-hwnd-start-pos-end-pos-src-platform-win32-ml-1339103201) | `src/platform/win32.ml:1791` | 4 | 3 | 2 | 1 | 1 | 116 | 72.14 |
| [`platform.win32.fill_rect`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-fill-rect-function-fill-rect-hdc-x-y-w-h-color-src-platform-win32-ml-1733390547) | `src/platform/win32.ml:1204` | 8 | 8 | 4 | 3 | 1 | 318.58 | 62.23 |
| [`platform.win32.get_control_text`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-get-control-text-function-get-control-text-hwnd-src-platform-win32-ml-231990846) | `src/platform/win32.ml:1562` | 10 | 11 | 5 | 4 | 1 | 457.87 | 58.88 |
| [`platform.win32.get_plain_window_text`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-get-plain-window-text-function-get-plain-window-text-hwnd-src-platform-win32-ml-1678352718) | `src/platform/win32.ml:1548` | 11 | 13 | 7 | 6 | 1 | 504.44 | 57.42 |
| [`platform.win32.get_window_text`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-get-window-text-function-get-window-text-hwnd-src-platform-win32-ml-882893052) | `src/platform/win32.ml:1528` | 17 | 17 | 6 | 5 | 1 | 797.66 | 52.03 |
| [`platform.win32.init_common_controls`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-init-common-controls-function-init-common-controls-src-platform-win32-ml-1912974603) | `src/platform/win32.ml:1254` | 7 | 5 | 1 | 0 | 0 | 169.92 | 65.81 |
| [`platform.win32.is_foreground`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-is-foreground-function-is-foreground-hwnd-src-platform-win32-ml-1986834946) | `src/platform/win32.ml:1302` | 6 | 6 | 3 | 2 | 1 | 157.17 | 67.24 |
| [`platform.win32.key_down`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-key-down-function-key-down-vk-src-platform-win32-ml-926756118) | `src/platform/win32.ml:1290` | 3 | 1 | 1 | 0 | 0 | 64.53 | 76.79 |
| [`platform.win32.key_pressed_event`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-key-pressed-event-function-key-pressed-event-vk-src-platform-win32-ml-171100996) | `src/platform/win32.ml:1296` | 3 | 1 | 1 | 0 | 0 | 64.53 | 76.79 |
| [`platform.win32.listbox_add`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-listbox-add-function-listbox-add-hwnd-text-src-platform-win32-ml-1553086161) | `src/platform/win32.ml:1583` | 5 | 5 | 3 | 2 | 1 | 194.51 | 68.32 |
| [`platform.win32.listbox_getsel`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-listbox-getsel-function-listbox-getsel-hwnd-src-platform-win32-ml-1717680058) | `src/platform/win32.ml:1591` | 4 | 3 | 2 | 1 | 1 | 114.45 | 72.18 |
| [`platform.win32.listbox_reset`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-listbox-reset-function-listbox-reset-hwnd-src-platform-win32-ml-297161264) | `src/platform/win32.ml:1575` | 4 | 3 | 2 | 1 | 1 | 97.67 | 72.67 |
| [`platform.win32.listbox_setsel`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-listbox-setsel-function-listbox-setsel-hwnd-idx-src-platform-win32-ml-620241147) | `src/platform/win32.ml:1599` | 4 | 3 | 2 | 1 | 1 | 108 | 72.36 |
| [`platform.win32.make_font`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-make-font-function-make-font-height-face-bold-src-platform-win32-ml-2008148912) | `src/platform/win32.ml:1247` | 5 | 4 | 2 | 1 | 1 | 221.01 | 68.07 |
| [`platform.win32.mouse_client`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-mouse-client-function-mouse-client-hwnd-src-platform-win32-ml-589213542) | `src/platform/win32.ml:1032` | 7 | 6 | 2 | 1 | 1 | 253.82 | 64.46 |
| [`platform.win32.msg_command_id`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-msg-command-id-function-msg-command-id-msg-src-platform-win32-ml-1502719886) | `src/platform/win32.ml:1355` | 3 | 1 | 1 | 0 | 0 | 46.51 | 77.78 |
| [`platform.win32.msg_command_notify`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-msg-command-notify-function-msg-command-notify-msg-src-platform-win32-ml-1746834546) | `src/platform/win32.ml:1361` | 3 | 1 | 1 | 0 | 0 | 64.53 | 76.79 |
| [`platform.win32.msg_hwnd`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-msg-hwnd-function-msg-hwnd-msg-src-platform-win32-ml-1323144918) | `src/platform/win32.ml:1317` | 3 | 1 | 1 | 0 | 0 | 46.51 | 77.78 |
| [`platform.win32.msg_lparam_ptr`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-msg-lparam-ptr-function-msg-lparam-ptr-msg-src-platform-win32-ml-1282924822) | `src/platform/win32.ml:1329` | 3 | 1 | 1 | 0 | 0 | 46.51 | 77.78 |
| [`platform.win32.msg_lparam_x`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-msg-lparam-x-function-msg-lparam-x-msg-src-platform-win32-ml-1267824390) | `src/platform/win32.ml:1343` | 3 | 1 | 1 | 0 | 0 | 58.81 | 77.07 |
| [`platform.win32.msg_lparam_y`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-msg-lparam-y-function-msg-lparam-y-msg-src-platform-win32-ml-797750002) | `src/platform/win32.ml:1349` | 3 | 1 | 1 | 0 | 0 | 70.31 | 76.52 |
| [`platform.win32.msg_message`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-msg-message-function-msg-message-msg-src-platform-win32-ml-184023056) | `src/platform/win32.ml:1311` | 3 | 1 | 1 | 0 | 0 | 46.51 | 77.78 |
| [`platform.win32.msg_mouse_x`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-msg-mouse-x-function-msg-mouse-x-msg-src-platform-win32-ml-1236123950) | `src/platform/win32.ml:1397` | 5 | 4 | 2 | 1 | 1 | 133.98 | 69.59 |
| [`platform.win32.msg_mouse_y`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-msg-mouse-y-function-msg-mouse-y-msg-src-platform-win32-ml-615057676) | `src/platform/win32.ml:1405` | 5 | 4 | 2 | 1 | 1 | 156.08 | 69.13 |
| [`platform.win32.msg_wparam_u32`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-msg-wparam-u32-function-msg-wparam-u32-msg-src-platform-win32-ml-462057074) | `src/platform/win32.ml:1323` | 3 | 1 | 1 | 0 | 0 | 46.51 | 77.78 |
| [`platform.win32.notify_code`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-notify-code-function-notify-code-msg-src-platform-win32-ml-1686958036) | `src/platform/win32.ml:1373` | 3 | 1 | 1 | 0 | 0 | 47.55 | 77.71 |
| [`platform.win32.notify_code_from_ptr`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-notify-code-from-ptr-function-notify-code-from-ptr-ptr-src-platform-win32-ml-1344404447) | `src/platform/win32.ml:1388` | 6 | 5 | 2 | 1 | 1 | 165.67 | 67.22 |
| [`platform.win32.notify_id`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-notify-id-function-notify-id-msg-src-platform-win32-ml-1478409736) | `src/platform/win32.ml:1367` | 3 | 1 | 1 | 0 | 0 | 47.55 | 77.71 |
| [`platform.win32.notify_id_from_ptr`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-notify-id-from-ptr-function-notify-id-from-ptr-ptr-src-platform-win32-ml-1621203931) | `src/platform/win32.ml:1379` | 6 | 5 | 2 | 1 | 1 | 165.67 | 67.22 |
| [`platform.win32.open_compiler_dialog`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-open-compiler-dialog-function-open-compiler-dialog-hwnd-src-platform-win32-ml-44161958) | `src/platform/win32.ml:2021` | 31 | 28 | 4 | 4 | 2 | 1085.98 | 45.67 |
| [`platform.win32.open_minilang_file_dialog`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-open-minilang-file-dialog-function-open-minilang-file-dialog-hwnd-src-platform-win32-ml-2006030382) | `src/platform/win32.ml:2055` | 31 | 28 | 4 | 4 | 2 | 1085.98 | 45.67 |
| [`platform.win32.open_project_dialog`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-open-project-dialog-function-open-project-dialog-hwnd-src-platform-win32-ml-889256192) | `src/platform/win32.ml:1987` | 31 | 28 | 4 | 4 | 2 | 1085.98 | 45.67 |
| [`platform.win32.point_x`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-point-x-function-point-x-point-src-platform-win32-ml-1967706085) | `src/platform/win32.ml:1011` | 3 | 1 | 1 | 0 | 0 | 46.51 | 77.78 |
| [`platform.win32.point_y`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-point-y-function-point-y-point-src-platform-win32-ml-2018009127) | `src/platform/win32.ml:1017` | 3 | 1 | 1 | 0 | 0 | 46.51 | 77.78 |
| [`platform.win32.rect_bytes`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-rect-bytes-function-rect-bytes-x-y-w-h-src-platform-win32-ml-2134718259) | `src/platform/win32.ml:1000` | 8 | 6 | 1 | 0 | 0 | 259.15 | 63.27 |
| [`platform.win32.remove_directory`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-remove-directory-function-remove-directory-path-src-platform-win32-ml-1489325138) | `src/platform/win32.ml:1127` | 4 | 3 | 3 | 2 | 1 | 114.45 | 72.05 |
| [`platform.win32.rgb`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-rgb-function-rgb-r-g-b-src-platform-win32-ml-5857646) | `src/platform/win32.ml:936` | 3 | 1 | 1 | 0 | 0 | 148 | 74.26 |
| [`platform.win32.rich_set_all_color`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-rich-set-all-color-function-rich-set-all-color-hwnd-color-src-platform-win32-ml-837409979) | `src/platform/win32.ml:2155` | 10 | 9 | 2 | 1 | 1 | 360.55 | 60.01 |
| [`platform.win32.rich_set_color`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-rich-set-color-function-rich-set-color-hwnd-start-pos-end-pos-color-src-platform-win32-ml-7143864) | `src/platform/win32.ml:2106` | 12 | 13 | 4 | 3 | 1 | 490.47 | 57.08 |
| [`platform.win32.rich_set_format`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-rich-set-format-function-rich-set-format-hwnd-start-pos-end-pos-color-height-twips-bold-italic-underline-src-platform-win32-ml-861463636) | `src/platform/win32.ml:2128` | 23 | 34 | 14 | 13 | 1 | 1223.11 | 46.79 |
| [`platform.win32.send_to_bottom`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-send-to-bottom-function-send-to-bottom-hwnd-src-platform-win32-ml-777624774) | `src/platform/win32.ml:1521` | 4 | 3 | 2 | 1 | 1 | 148.68 | 71.39 |
| [`platform.win32.set_control_dark_theme`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-set-control-dark-theme-function-set-control-dark-theme-hwnd-enabled-src-platform-win32-ml-568899265) | `src/platform/win32.ml:1102` | 8 | 5 | 3 | 2 | 1 | 162.63 | 64.41 |
| [`platform.win32.set_control_font`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-set-control-font-function-set-control-font-hwnd-font-src-platform-win32-ml-1832018029) | `src/platform/win32.ml:1501` | 4 | 3 | 3 | 2 | 1 | 126.71 | 71.74 |
| [`platform.win32.set_cursor_arrow`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-set-cursor-arrow-function-set-cursor-arrow-src-platform-win32-ml-655402739) | `src/platform/win32.ml:1049` | 3 | 1 | 1 | 0 | 0 | 28.07 | 79.32 |
| [`platform.win32.set_cursor_hand`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-set-cursor-hand-function-set-cursor-hand-src-platform-win32-ml-2075336421) | `src/platform/win32.ml:1059` | 3 | 1 | 1 | 0 | 0 | 28.07 | 79.32 |
| [`platform.win32.set_cursor_ibeam`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-set-cursor-ibeam-function-set-cursor-ibeam-src-platform-win32-ml-1439892899) | `src/platform/win32.ml:1054` | 3 | 1 | 1 | 0 | 0 | 28.07 | 79.32 |
| [`platform.win32.set_menu_bar`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-set-menu-bar-function-set-menu-bar-hwnd-menu-src-platform-win32-ml-289568015) | `src/platform/win32.ml:1447` | 5 | 4 | 2 | 1 | 1 | 105.49 | 70.32 |
| [`platform.win32.set_system_cursor`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-set-system-cursor-function-set-system-cursor-cursor-id-src-platform-win32-ml-1430469069) | `src/platform/win32.ml:1042` | 5 | 4 | 2 | 1 | 1 | 108 | 70.25 |
| [`platform.win32.set_window_dark_mode`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-set-window-dark-mode-function-set-window-dark-mode-hwnd-enabled-src-platform-win32-ml-2060613329) | `src/platform/win32.ml:1089` | 9 | 9 | 3 | 2 | 1 | 293.44 | 61.5 |
| [`platform.win32.set_window_text`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-set-window-text-function-set-window-text-hwnd-text-src-platform-win32-ml-1860559813) | `src/platform/win32.ml:1509` | 9 | 10 | 4 | 3 | 1 | 310.23 | 61.2 |
| [`platform.win32.tab_clear`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-tab-clear-function-tab-clear-hwnd-src-platform-win32-ml-851235188) | `src/platform/win32.ml:1719` | 4 | 3 | 2 | 1 | 1 | 97.67 | 72.67 |
| [`platform.win32.tab_get_cur_sel`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-tab-get-cur-sel-function-tab-get-cur-sel-hwnd-src-platform-win32-ml-1724221330) | `src/platform/win32.ml:1745` | 4 | 3 | 2 | 1 | 1 | 114.45 | 72.18 |
| [`platform.win32.tab_hit_test`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-tab-hit-test-function-tab-hit-test-hwnd-x-y-src-platform-win32-ml-1348986291) | `src/platform/win32.ml:1772` | 7 | 6 | 2 | 1 | 1 | 260.06 | 64.39 |
| [`platform.win32.tab_insert`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-tab-insert-function-tab-insert-hwnd-index-text-param-src-platform-win32-ml-269948314) | `src/platform/win32.ml:1729` | 13 | 13 | 3 | 2 | 1 | 531.36 | 56.21 |
| [`platform.win32.tab_set_cur_sel`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-tab-set-cur-sel-function-tab-set-cur-sel-hwnd-index-src-platform-win32-ml-1542873338) | `src/platform/win32.ml:1753` | 4 | 3 | 2 | 1 | 1 | 108 | 72.36 |
| [`platform.win32.tab_set_item_size`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-tab-set-item-size-function-tab-set-item-size-hwnd-width-height-src-platform-win32-ml-318595979) | `src/platform/win32.ml:1762` | 5 | 4 | 2 | 1 | 1 | 192.57 | 68.49 |
| [`platform.win32.toolbar_icon`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-toolbar-icon-function-toolbar-icon-kind-src-platform-win32-ml-1407927249) | `src/platform/win32.ml:1179` | 7 | 9 | 5 | 4 | 1 | 330.12 | 63.26 |
| [`platform.win32.track_popup`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-track-popup-function-track-popup-hwnd-menu-x-y-src-platform-win32-ml-1141663398) | `src/platform/win32.ml:1080` | 5 | 3 | 1 | 0 | 0 | 263.22 | 67.67 |
| [`platform.win32.tree_clear`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-tree-clear-function-tree-clear-hwnd-src-platform-win32-ml-528550538) | `src/platform/win32.ml:1630` | 4 | 3 | 2 | 1 | 1 | 100 | 72.59 |
| [`platform.win32.tree_expand`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-tree-expand-function-tree-expand-hwnd-item-src-platform-win32-ml-2062196877) | `src/platform/win32.ml:1670` | 4 | 3 | 2 | 1 | 1 | 108 | 72.36 |
| [`platform.win32.tree_get_selection`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-tree-get-selection-function-tree-get-selection-hwnd-src-platform-win32-ml-137690418) | `src/platform/win32.ml:1677` | 4 | 3 | 2 | 1 | 1 | 108 | 72.36 |
| [`platform.win32.tree_hit_test`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-tree-hit-test-function-tree-hit-test-hwnd-x-y-src-platform-win32-ml-922995501) | `src/platform/win32.ml:1707` | 9 | 9 | 3 | 2 | 1 | 342.35 | 61.03 |
| [`platform.win32.tree_insert`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-tree-insert-function-tree-insert-hwnd-parent-text-param-has-children-image-src-platform-win32-ml-1886168583) | `src/platform/win32.ml:1642` | 24 | 25 | 6 | 5 | 1 | 1021.54 | 48.01 |
| [`platform.win32.tree_select`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-tree-select-function-tree-select-hwnd-item-src-platform-win32-ml-126835613) | `src/platform/win32.ml:1685` | 4 | 3 | 3 | 2 | 1 | 131.69 | 71.62 |
| [`platform.win32.tree_set_colors`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-tree-set-colors-function-tree-set-colors-hwnd-bg-text-line-src-platform-win32-ml-994081168) | `src/platform/win32.ml:1695` | 7 | 6 | 2 | 1 | 1 | 263.11 | 64.35 |
| [`platform.win32.tree_set_image_list`](File-src-platform-win32-ml-830830664.md#function-function-platform-win32-tree-set-image-list-function-tree-set-image-list-hwnd-image-list-src-platform-win32-ml-1554057304) | `src/platform/win32.ml:1172` | 4 | 3 | 3 | 2 | 1 | 126.71 | 71.74 |
| [`project.config.bool_from_text`](File-src-project-config-ml-1589199733.md#function-function-project-config-bool-from-text-function-bool-from-text-value-default-value-src-project-config-ml-986984341) | `src/project/config.ml:59` | 6 | 6 | 9 | 8 | 1 | 290.05 | 64.57 |
| [`project.config.int_from_text`](File-src-project-config-ml-1589199733.md#function-function-project-config-int-from-text-function-int-from-text-value-default-value-src-project-config-ml-1474678081) | `src/project/config.ml:69` | 5 | 4 | 2 | 1 | 1 | 118.54 | 69.96 |
| [`project.config.load_bool`](File-src-project-config-ml-1589199733.md#function-function-project-config-load-bool-function-load-bool-p-key-default-value-src-project-config-ml-1819221717) | `src/project/config.ml:79` | 3 | 1 | 1 | 0 | 0 | 92.51 | 75.69 |
| [`project.config.load_int`](File-src-project-config-ml-1589199733.md#function-function-project-config-load-int-function-load-int-p-key-default-value-src-project-config-ml-1448064731) | `src/project/config.ml:87` | 3 | 1 | 1 | 0 | 0 | 92.51 | 75.69 |
| [`project.config.load_value`](File-src-project-config-ml-1589199733.md#function-function-project-config-load-value-function-load-value-p-wanted-key-default-value-src-project-config-ml-1023256339) | `src/project/config.ml:37` | 18 | 21 | 11 | 13 | 2 | 1247.75 | 49.46 |
| [`project.config.path`](File-src-project-config-ml-1589199733.md#function-function-project-config-path-function-path-p-src-project-config-ml-1588360249) | `src/project/config.ml:27` | 5 | 4 | 2 | 1 | 1 | 146.95 | 69.31 |
| [`project.project._append_file`](File-src-project-project-ml-1533851532.md#function-function-project-project-append-file-function-append-file-files-path-name-is-dir-depth-src-project-project-ml-1166451527) | `src/project/project.ml:172` | 4 | 3 | 2 | 1 | 1 | 196.21 | 70.54 |
| [`project.project._contains_string`](File-src-project-project-ml-1533851532.md#function-function-project-project-contains-string-function-contains-string-items-value-src-project-project-ml-632201594) | `src/project/project.ml:140` | 8 | 8 | 5 | 5 | 2 | 288.44 | 62.4 |
| [`project.project._dedupe_strings`](File-src-project-project-ml-1533851532.md#function-function-project-project-dedupe-strings-function-dedupe-strings-items-src-project-project-ml-1356015363) | `src/project/project.ml:152` | 12 | 10 | 7 | 7 | 2 | 438.86 | 57.02 |
| [`project.project._parse_project_file`](File-src-project-project-ml-1533851532.md#function-function-project-project-parse-project-file-function-parse-project-file-path-root-src-project-project-ml-817428450) | `src/project/project.ml:236` | 44 | 47 | 21 | 56 | 4 | 2467.5 | 37.57 |
| [`project.project._scan_dir`](File-src-project-project-ml-1533851532.md#function-function-project-project-scan-dir-function-scan-dir-path-depth-out-files-src-project-project-ml-598517587) | `src/project/project.ml:181` | 40 | 28 | 16 | 27 | 4 | 1546.51 | 40.57 |
| [`project.project._sort_strings`](File-src-project-project-ml-1533851532.md#function-function-project-project-sort-strings-function-sort-strings-items-src-project-project-ml-1845885793) | `src/project/project.ml:132` | 4 | 3 | 2 | 1 | 1 | 83.76 | 73.13 |
| [`project.project.abspath`](File-src-project-project-ml-1533851532.md#function-function-project-project-abspath-function-abspath-path-src-project-project-ml-1058620826) | `src/project/project.ml:113` | 9 | 10 | 7 | 6 | 1 | 403.21 | 60 |
| [`project.project.basename`](File-src-project-project-ml-1533851532.md#function-function-project-project-basename-function-basename-path-src-project-project-ml-1751291324) | `src/project/project.ml:97` | 13 | 11 | 6 | 8 | 3 | 459.04 | 56.26 |
| [`project.project.dirname`](File-src-project-project-ml-1533851532.md#function-function-project-project-dirname-function-dirname-path-src-project-project-ml-406938324) | `src/project/project.ml:81` | 13 | 11 | 6 | 8 | 3 | 388.42 | 56.76 |
| [`project.project.has_ext`](File-src-project-project-ml-1533851532.md#function-function-project-project-has-ext-function-has-ext-path-ext-src-project-project-ml-823262119) | `src/project/project.ml:126` | 3 | 1 | 1 | 0 | 0 | 103.61 | 75.35 |
| [`project.project.load_project`](File-src-project-project-ml-1533851532.md#function-function-project-project-load-project-function-load-project-root-src-project-project-ml-1333664099) | `src/project/project.ml:349` | 20 | 15 | 9 | 18 | 5 | 753.4 | 50.26 |
| [`project.project.load_project_file`](File-src-project-project-ml-1533851532.md#function-function-project-project-load-project-file-function-load-project-file-path-src-project-project-ml-205173262) | `src/project/project.ml:375` | 7 | 7 | 4 | 3 | 1 | 282.03 | 63.87 |
| [`project.project.path_join`](File-src-project-project-ml-1533851532.md#function-function-project-project-path-join-function-path-join-a-b-src-project-project-ml-1853722372) | `src/project/project.ml:71` | 7 | 8 | 7 | 6 | 1 | 347.11 | 62.84 |
| [`project.project.project_entry_path`](File-src-project-project-ml-1533851532.md#function-function-project-project-project-entry-path-function-project-entry-path-project-src-project-project-ml-629165400) | `src/project/project.ml:385` | 4 | 3 | 2 | 1 | 1 | 125.1 | 71.91 |
| [`project.project.project_file_path`](File-src-project-project-ml-1533851532.md#function-function-project-project-project-file-path-function-project-file-path-project-src-project-project-ml-1024066472) | `src/project/project.ml:286` | 15 | 15 | 9 | 11 | 3 | 758.86 | 52.97 |
| [`project.project.project_output_path`](File-src-project-project-ml-1533851532.md#function-function-project-project-project-output-path-function-project-output-path-project-src-project-project-ml-2014693874) | `src/project/project.ml:392` | 4 | 3 | 2 | 1 | 1 | 125.1 | 71.91 |
| [`project.project.project_test_entry_path`](File-src-project-project-ml-1533851532.md#function-function-project-project-project-test-entry-path-function-project-test-entry-path-project-src-project-project-ml-1817019038) | `src/project/project.ml:399` | 4 | 3 | 2 | 1 | 1 | 125.1 | 71.91 |
| [`project.project.project_working_dir_path`](File-src-project-project-ml-1533851532.md#function-function-project-project-project-working-dir-path-function-project-working-dir-path-project-src-project-project-ml-1166864532) | `src/project/project.ml:406` | 4 | 3 | 2 | 1 | 1 | 114.45 | 72.18 |
| [`project.project.resolve_project_path`](File-src-project-project-ml-1533851532.md#function-function-project-project-resolve-project-path-function-resolve-project-path-project-path-src-project-project-ml-88524739) | `src/project/project.ml:414` | 6 | 7 | 6 | 5 | 1 | 360 | 64.32 |
| [`project.project.save_project`](File-src-project-project-ml-1533851532.md#function-function-project-project-save-project-function-save-project-project-src-project-project-ml-1457065832) | `src/project/project.ml:305` | 21 | 20 | 6 | 6 | 2 | 1022.09 | 49.28 |
| [`project.project.scan_files`](File-src-project-project-ml-1533851532.md#function-function-project-project-scan-files-function-scan-files-root-src-project-project-ml-868802743) | `src/project/project.ml:229` | 3 | 1 | 1 | 0 | 0 | 60.94 | 76.96 |
| [`project.project.with_compile_settings`](File-src-project-project-ml-1533851532.md#function-function-project-project-with-compile-settings-function-with-compile-settings-project-entry-output-src-project-project-ml-2113977589) | `src/project/project.ml:332` | 4 | 3 | 2 | 1 | 1 | 287.92 | 69.38 |
| [`project.project.with_run_settings`](File-src-project-project-ml-1533851532.md#function-function-project-project-with-run-settings-function-with-run-settings-project-test-entry-run-args-working-dir-src-project-project-ml-247491095) | `src/project/project.ml:342` | 4 | 3 | 2 | 1 | 1 | 287.92 | 69.38 |
| [`project.templates._config_file`](File-src-project-templates-ml-1433524490.md#function-function-project-templates-config-file-function-config-file-src-project-templates-ml-706910315) | `src/project/templates.ml:93` | 3 | 1 | 1 | 0 | 0 | 22.46 | 80 |
| [`project.templates._main_source`](File-src-project-templates-ml-1433524490.md#function-function-project-templates-main-source-function-main-source-name-kind-src-project-templates-ml-820661422) | `src/project/templates.ml:63` | 6 | 3 | 2 | 1 | 1 | 135.93 | 67.82 |
| [`project.templates._mkdir`](File-src-project-templates-ml-1433524490.md#function-function-project-templates-mkdir-function-mkdir-path-src-project-templates-ml-1182415932) | `src/project/templates.ml:41` | 6 | 6 | 4 | 3 | 1 | 217.13 | 66.13 |
| [`project.templates._project_file`](File-src-project-templates-ml-1433524490.md#function-function-project-templates-project-file-function-project-file-name-kind-src-project-templates-ml-2106513632) | `src/project/templates.ml:79` | 12 | 1 | 1 | 0 | 0 | 182.84 | 60.49 |
| [`project.templates._readme`](File-src-project-templates-ml-1433524490.md#function-function-project-templates-readme-function-readme-name-src-project-templates-ml-1892749422) | `src/project/templates.ml:99` | 3 | 1 | 1 | 0 | 0 | 43.19 | 78.01 |
| [`project.templates._safe_name`](File-src-project-templates-ml-1433524490.md#function-function-project-templates-safe-name-function-safe-name-name-src-project-templates-ml-1281750568) | `src/project/templates.ml:50` | 9 | 9 | 4 | 3 | 1 | 390.14 | 60.5 |
| [`project.templates._test_source`](File-src-project-templates-ml-1433524490.md#function-function-project-templates-test-source-function-test-source-name-src-project-templates-ml-1629336904) | `src/project/templates.ml:72` | 3 | 1 | 1 | 0 | 0 | 43.19 | 78.01 |
| [`project.templates.create_standard_project`](File-src-project-templates-ml-1433524490.md#function-function-project-templates-create-standard-project-function-create-standard-project-parent-name-kind-src-project-templates-ml-1923765942) | `src/project/templates.ml:107` | 23 | 24 | 6 | 5 | 1 | 1425.11 | 47.41 |
| [`project.templates.path_join`](File-src-project-templates-ml-1433524490.md#function-function-project-templates-path-join-function-path-join-a-b-src-project-templates-ml-1621208040) | `src/project/templates.ml:31` | 7 | 8 | 7 | 6 | 1 | 347.11 | 62.84 |
| [`ui.commands._acronym`](File-src-ui-commands-ml-847810634.md#function-function-ui-commands-acronym-function-acronym-text-src-ui-commands-ml-234553554) | `src/ui/commands.ml:35` | 15 | 12 | 5 | 7 | 3 | 400.08 | 55.45 |
| [`ui.commands._compact`](File-src-ui-commands-ml-847810634.md#function-function-ui-commands-compact-function-compact-text-src-ui-commands-ml-118218442) | `src/ui/commands.ml:53` | 9 | 8 | 4 | 4 | 2 | 299.32 | 61.31 |
| [`ui.commands._is_subsequence`](File-src-ui-commands-ml-847810634.md#function-function-ui-commands-is-subsequence-function-is-subsequence-haystack-needle-src-ui-commands-ml-1968023642) | `src/ui/commands.ml:66` | 12 | 11 | 7 | 9 | 3 | 425 | 57.11 |
| [`ui.commands._is_word_char`](File-src-ui-commands-ml-847810634.md#function-function-ui-commands-is-word-char-function-is-word-char-ch-src-ui-commands-ml-413860972) | `src/ui/commands.ml:25` | 7 | 7 | 4 | 3 | 1 | 388.42 | 62.9 |
| [`ui.commands.labels`](File-src-ui-commands-ml-847810634.md#function-function-ui-commands-labels-function-labels-src-ui-commands-ml-1507719021) | `src/ui/commands.ml:80` | 13 | 1 | 1 | 0 | 0 | 1031.91 | 54.46 |
| [`ui.commands.match_score`](File-src-ui-commands-ml-847810634.md#function-function-ui-commands-match-score-function-match-score-labels-search-texts-idx-query-src-ui-commands-ml-593927956) | `src/ui/commands.ml:114` | 14 | 20 | 13 | 12 | 1 | 1080.97 | 52.01 |
| [`ui.commands.matches`](File-src-ui-commands-ml-847810634.md#function-function-ui-commands-matches-function-matches-labels-search-texts-idx-query-src-ui-commands-ml-1135746806) | `src/ui/commands.ml:134` | 3 | 1 | 1 | 0 | 0 | 98.99 | 75.48 |
| [`ui.commands.pick`](File-src-ui-commands-ml-847810634.md#function-function-ui-commands-pick-function-pick-ids-labels-search-texts-query-selected-src-ui-commands-ml-186237094) | `src/ui/commands.ml:164` | 20 | 22 | 14 | 14 | 2 | 988.16 | 48.77 |
| [`ui.commands.ranked_indices`](File-src-ui-commands-ml-847810634.md#function-function-ui-commands-ranked-indices-function-ranked-indices-labels-search-texts-query-src-ui-commands-ml-108402627) | `src/ui/commands.ml:142` | 15 | 14 | 8 | 10 | 2 | 670 | 53.48 |
| [`ui.commands.search_texts`](File-src-ui-commands-ml-847810634.md#function-function-ui-commands-search-texts-function-search-texts-src-ui-commands-ml-811353021) | `src/ui/commands.ml:95` | 13 | 1 | 1 | 0 | 0 | 1031.91 | 54.46 |
| [`ui.markdown._active_cached_markdown_doc`](File-src-ui-markdown-ml-707379131.md#function-function-ui-markdown-active-cached-markdown-doc-function-active-cached-markdown-doc-st-src-ui-markdown-ml-925876310) | `src/ui/markdown.ml:757` | 8 | 9 | 5 | 4 | 1 | 313.82 | 62.15 |
| [`ui.markdown._active_is_markdown`](File-src-ui-markdown-ml-707379131.md#function-function-ui-markdown-active-is-markdown-function-active-is-markdown-st-src-ui-markdown-ml-172627552) | `src/ui/markdown.ml:109` | 4 | 3 | 3 | 2 | 1 | 180.09 | 70.67 |
| [`ui.markdown._apply_rendered_markdown_line_styles`](File-src-ui-markdown-ml-707379131.md#function-function-ui-markdown-apply-rendered-markdown-line-styles-function-apply-rendered-markdown-line-styles-st-doc-src-ui-markdown-ml-672075576) | `src/ui/markdown.ml:852` | 16 | 18 | 8 | 10 | 2 | 846.58 | 52.16 |
| [`ui.markdown._apply_rendered_markdown_styles`](File-src-ui-markdown-ml-707379131.md#function-function-ui-markdown-apply-rendered-markdown-styles-function-apply-rendered-markdown-styles-st-doc-src-ui-markdown-ml-9643728) | `src/ui/markdown.ml:873` | 19 | 23 | 13 | 17 | 2 | 1070.41 | 49.14 |
| [`ui.markdown._clear_markdown_cache`](File-src-ui-markdown-ml-707379131.md#function-function-ui-markdown-clear-markdown-cache-function-clear-markdown-cache-st-idx-src-ui-markdown-ml-1909610587) | `src/ui/markdown.ml:727` | 7 | 8 | 4 | 3 | 1 | 307.6 | 63.61 |
| [`ui.markdown._editor_display_text`](File-src-ui-markdown-ml-707379131.md#function-function-ui-markdown-editor-display-text-function-editor-display-text-text-src-ui-markdown-ml-1137133080) | `src/ui/markdown.ml:94` | 4 | 2 | 1 | 0 | 0 | 93.77 | 72.92 |
| [`ui.markdown._empty_markdown_doc`](File-src-ui-markdown-ml-707379131.md#function-function-ui-markdown-empty-markdown-doc-function-empty-markdown-doc-src-ui-markdown-ml-1906094205) | `src/ui/markdown.ml:79` | 3 | 1 | 1 | 0 | 0 | 79.57 | 76.15 |
| [`ui.markdown._ensure_markdown_cache_slots`](File-src-ui-markdown-ml-707379131.md#function-function-ui-markdown-ensure-markdown-cache-slots-function-ensure-markdown-cache-slots-st-src-ui-markdown-ml-1387210300) | `src/ui/markdown.ml:710` | 13 | 12 | 6 | 5 | 1 | 548.04 | 55.72 |
| [`ui.markdown._is_markdown_path`](File-src-ui-markdown-ml-707379131.md#function-function-ui-markdown-is-markdown-path-function-is-markdown-path-path-src-ui-markdown-ml-1985825494) | `src/ui/markdown.ml:101` | 5 | 4 | 2 | 1 | 1 | 203.56 | 68.32 |
| [`ui.markdown._jump_to_markdown_anchor`](File-src-ui-markdown-ml-707379131.md#function-function-ui-markdown-jump-to-markdown-anchor-function-jump-to-markdown-anchor-st-link-target-src-ui-markdown-ml-434629166) | `src/ui/markdown.ml:981` | 33 | 38 | 13 | 22 | 3 | 1891.02 | 42.18 |
| [`ui.markdown._markdown_anchor_from_target`](File-src-ui-markdown-ml-707379131.md#function-function-ui-markdown-markdown-anchor-from-target-function-markdown-anchor-from-target-link-target-src-ui-markdown-ml-163559091) | `src/ui/markdown.ml:968` | 9 | 10 | 4 | 3 | 1 | 435.97 | 60.16 |
| [`ui.markdown._markdown_doc_for_active_tab`](File-src-ui-markdown-ml-707379131.md#function-function-ui-markdown-markdown-doc-for-active-tab-function-markdown-doc-for-active-tab-st-markdown-src-ui-markdown-ml-1834144957) | `src/ui/markdown.ml:738` | 16 | 12 | 6 | 5 | 1 | 620.64 | 53.37 |
| [`ui.markdown._markdown_fence_language`](File-src-ui-markdown-ml-707379131.md#function-function-ui-markdown-markdown-fence-language-function-markdown-fence-language-line-src-ui-markdown-ml-651682749) | `src/ui/markdown.ml:143` | 8 | 6 | 4 | 3 | 1 | 329.71 | 62.13 |
| [`ui.markdown._markdown_fence_line`](File-src-ui-markdown-ml-707379131.md#function-function-ui-markdown-markdown-fence-line-function-markdown-fence-line-line-src-ui-markdown-ml-1978912849) | `src/ui/markdown.ml:136` | 4 | 2 | 1 | 0 | 0 | 134.89 | 71.82 |
| [`ui.markdown._markdown_link_at_doc`](File-src-ui-markdown-ml-707379131.md#function-function-ui-markdown-markdown-link-at-doc-function-markdown-link-at-doc-doc-char-pos-src-ui-markdown-ml-1486104876) | `src/ui/markdown.ml:941` | 11 | 13 | 9 | 10 | 2 | 552.2 | 56.87 |
| [`ui.markdown._markdown_link_at_editor`](File-src-ui-markdown-ml-707379131.md#function-function-ui-markdown-markdown-link-at-editor-function-markdown-link-at-editor-st-x-y-src-ui-markdown-ml-642002967) | `src/ui/markdown.ml:958` | 7 | 7 | 3 | 2 | 1 | 298.06 | 63.84 |
| [`ui.markdown._markdown_span_color`](File-src-ui-markdown-ml-707379131.md#function-function-ui-markdown-markdown-span-color-function-markdown-span-color-st-kind-src-ui-markdown-ml-1662927002) | `src/ui/markdown.ml:819` | 17 | 21 | 13 | 14 | 2 | 1123.13 | 50.05 |
| [`ui.markdown._markdown_span_size`](File-src-ui-markdown-ml-707379131.md#function-function-ui-markdown-markdown-span-size-function-markdown-span-size-kind-src-ui-markdown-ml-611531831) | `src/ui/markdown.ml:839` | 9 | 13 | 7 | 6 | 1 | 284.98 | 61.05 |
| [`ui.markdown._md_add_anchor`](File-src-ui-markdown-ml-707379131.md#function-function-ui-markdown-md-add-anchor-function-md-add-anchor-anchors-name-start-pos-src-ui-markdown-ml-2043625009) | `src/ui/markdown.ml:190` | 6 | 7 | 5 | 4 | 1 | 286.73 | 65.15 |
| [`ui.markdown._md_add_code_spans`](File-src-ui-markdown-ml-707379131.md#function-function-ui-markdown-md-add-code-spans-function-md-add-code-spans-spans-base-pos-raw-lang-src-ui-markdown-ml-1588205142) | `src/ui/markdown.ml:570` | 19 | 20 | 10 | 11 | 2 | 932.04 | 49.97 |
| [`ui.markdown._md_add_line_style`](File-src-ui-markdown-ml-707379131.md#function-function-ui-markdown-md-add-line-style-function-md-add-line-style-styles-start-pos-end-pos-kind-src-ui-markdown-ml-1742630500) | `src/ui/markdown.ml:168` | 5 | 5 | 4 | 3 | 1 | 246.12 | 67.47 |
| [`ui.markdown._md_add_link`](File-src-ui-markdown-ml-707379131.md#function-function-ui-markdown-md-add-link-function-md-add-link-links-start-pos-end-pos-link-target-src-ui-markdown-ml-316026041) | `src/ui/markdown.ml:179` | 6 | 7 | 5 | 4 | 1 | 305.53 | 64.95 |
| [`ui.markdown._md_add_span`](File-src-ui-markdown-ml-707379131.md#function-function-ui-markdown-md-add-span-function-md-add-span-spans-start-pos-end-pos-kind-src-ui-markdown-ml-1015259915) | `src/ui/markdown.ml:157` | 5 | 5 | 3 | 2 | 1 | 218.51 | 67.97 |
| [`ui.markdown._md_anchor_slug`](File-src-ui-markdown-ml-707379131.md#function-function-ui-markdown-md-anchor-slug-function-md-anchor-slug-text-src-ui-markdown-ml-1900884120) | `src/ui/markdown.ml:199` | 25 | 22 | 14 | 20 | 3 | 1012.86 | 46.58 |
| [`ui.markdown._md_append_block_inline`](File-src-ui-markdown-ml-707379131.md#function-function-ui-markdown-md-append-block-inline-function-md-append-block-inline-text-spans-links-prefix-src-kind-src-ui-markdown-ml-1657224790) | `src/ui/markdown.ml:561` | 3 | 1 | 1 | 0 | 0 | 151.24 | 74.2 |
| [`ui.markdown._md_append_inline`](File-src-ui-markdown-ml-707379131.md#function-function-ui-markdown-md-append-inline-function-md-append-inline-text-spans-links-prefix-src-kind-src-ui-markdown-ml-189781734) | `src/ui/markdown.ml:538` | 15 | 12 | 6 | 5 | 1 | 754.92 | 53.39 |
| [`ui.markdown._md_append_plain`](File-src-ui-markdown-ml-707379131.md#function-function-ui-markdown-md-append-plain-function-md-append-plain-text-line-src-ui-markdown-ml-1389532214) | `src/ui/markdown.ml:316` | 7 | 5 | 1 | 0 | 0 | 158.46 | 66.03 |
| [`ui.markdown._md_blank`](File-src-ui-markdown-ml-707379131.md#function-function-ui-markdown-md-blank-function-md-blank-text-src-ui-markdown-ml-638761854) | `src/ui/markdown.ml:299` | 6 | 7 | 4 | 3 | 1 | 208.5 | 66.25 |
| [`ui.markdown._md_display_pos`](File-src-ui-markdown-ml-707379131.md#function-function-ui-markdown-md-display-pos-function-md-display-pos-doc-text-doc-pos-src-ui-markdown-ml-37748168) | `src/ui/markdown.ml:769` | 16 | 14 | 6 | 6 | 2 | 426.06 | 54.51 |
| [`ui.markdown._md_doc_pos_from_display`](File-src-ui-markdown-ml-707379131.md#function-function-ui-markdown-md-doc-pos-from-display-function-md-doc-pos-from-display-doc-text-display-pos-src-ui-markdown-ml-364857244) | `src/ui/markdown.ml:789` | 26 | 23 | 8 | 11 | 3 | 633.31 | 48.44 |
| [`ui.markdown._md_find_strong_close`](File-src-ui-markdown-ml-707379131.md#function-function-ui-markdown-md-find-strong-close-function-md-find-strong-close-src-open-pos-src-ui-markdown-ml-2005534770) | `src/ui/markdown.ml:404` | 9 | 8 | 5 | 5 | 2 | 475 | 59.77 |
| [`ui.markdown._md_heading_level`](File-src-ui-markdown-ml-707379131.md#function-function-ui-markdown-md-heading-level-function-md-heading-level-line-src-ui-markdown-ml-2024944817) | `src/ui/markdown.ml:336` | 12 | 13 | 8 | 7 | 1 | 485.97 | 56.57 |
| [`ui.markdown._md_heading_text`](File-src-ui-markdown-ml-707379131.md#function-function-ui-markdown-md-heading-text-function-md-heading-text-line-src-ui-markdown-ml-27723801) | `src/ui/markdown.ml:351` | 6 | 5 | 2 | 1 | 1 | 230.7 | 66.21 |
| [`ui.markdown._md_hex_string`](File-src-ui-markdown-ml-707379131.md#function-function-ui-markdown-md-hex-string-function-md-hex-string-hex-text-src-ui-markdown-ml-1515469754) | `src/ui/markdown.ml:252` | 7 | 7 | 3 | 2 | 1 | 206.44 | 64.95 |
| [`ui.markdown._md_inline`](File-src-ui-markdown-ml-707379131.md#function-function-ui-markdown-md-inline-function-md-inline-src-base-pos-spans-links-src-ui-markdown-ml-834404503) | `src/ui/markdown.ml:423` | 100 | 87 | 24 | 48 | 4 | 5216.96 | 27.11 |
| [`ui.markdown._md_is_digit`](File-src-ui-markdown-ml-707379131.md#function-function-ui-markdown-md-is-digit-function-md-is-digit-ch-src-ui-markdown-ml-1742634188) | `src/ui/markdown.ml:326` | 7 | 7 | 4 | 3 | 1 | 267.19 | 64.03 |
| [`ui.markdown._md_line_start`](File-src-ui-markdown-ml-707379131.md#function-function-ui-markdown-md-line-start-function-md-line-start-text-src-ui-markdown-ml-16103364) | `src/ui/markdown.ml:308` | 4 | 3 | 3 | 2 | 1 | 178.81 | 70.69 |
| [`ui.markdown._md_next_line_no`](File-src-ui-markdown-ml-707379131.md#function-function-ui-markdown-md-next-line-no-function-md-next-line-no-text-src-ui-markdown-ml-1459420916) | `src/ui/markdown.ml:228` | 9 | 9 | 6 | 6 | 2 | 378.33 | 60.33 |
| [`ui.markdown._md_normalize_display_chars`](File-src-ui-markdown-ml-707379131.md#function-function-ui-markdown-md-normalize-display-chars-function-md-normalize-display-chars-text-src-ui-markdown-ml-905366778) | `src/ui/markdown.ml:262` | 28 | 24 | 5 | 5 | 2 | 1688.32 | 45.16 |
| [`ui.markdown._md_ordered_prefix`](File-src-ui-markdown-ml-707379131.md#function-function-ui-markdown-md-ordered-prefix-function-md-ordered-prefix-line-src-ui-markdown-ml-1248416057) | `src/ui/markdown.ml:360` | 10 | 9 | 7 | 6 | 1 | 471.89 | 58.52 |
| [`ui.markdown._md_table_row`](File-src-ui-markdown-ml-707379131.md#function-function-ui-markdown-md-table-row-function-md-table-row-line-src-ui-markdown-ml-710353285) | `src/ui/markdown.ml:388` | 11 | 10 | 6 | 7 | 2 | 444.61 | 57.93 |
| [`ui.markdown._md_table_separator`](File-src-ui-markdown-ml-707379131.md#function-function-ui-markdown-md-table-separator-function-md-table-separator-line-src-ui-markdown-ml-1582644947) | `src/ui/markdown.ml:373` | 11 | 11 | 8 | 9 | 2 | 458.43 | 57.57 |
| [`ui.markdown._normalize_editor_text`](File-src-ui-markdown-ml-707379131.md#function-function-ui-markdown-normalize-editor-text-function-normalize-editor-text-text-src-ui-markdown-ml-1158513032) | `src/ui/markdown.ml:85` | 6 | 5 | 2 | 1 | 1 | 197.65 | 66.68 |
| [`ui.markdown._open_markdown_link_at`](File-src-ui-markdown-ml-707379131.md#function-function-ui-markdown-open-markdown-link-at-function-open-markdown-link-at-st-x-y-src-ui-markdown-ml-1489022635) | `src/ui/markdown.ml:1020` | 13 | 14 | 5 | 4 | 1 | 644.21 | 55.36 |
| [`ui.markdown._render_markdown_document`](File-src-ui-markdown-ml-707379131.md#function-function-ui-markdown-render-markdown-document-function-render-markdown-document-markdown-src-ui-markdown-ml-1833221288) | `src/ui/markdown.ml:593` | 103 | 90 | 19 | 31 | 3 | 5574.77 | 27.31 |
| [`ui.markdown._set_log`](File-src-ui-markdown-ml-707379131.md#function-function-ui-markdown-set-log-function-set-log-st-text-src-ui-markdown-ml-1299668227) | `src/ui/markdown.ml:117` | 6 | 5 | 2 | 1 | 1 | 200.67 | 66.63 |
| [`ui.markdown._strip_cr`](File-src-ui-markdown-ml-707379131.md#function-function-ui-markdown-strip-cr-function-strip-cr-line-src-ui-markdown-ml-699439131) | `src/ui/markdown.ml:126` | 7 | 5 | 4 | 3 | 1 | 280.54 | 63.89 |
| [`ui.markdown._strip_utf8_bom`](File-src-ui-markdown-ml-707379131.md#function-function-ui-markdown-strip-utf8-bom-function-strip-utf8-bom-text-src-ui-markdown-ml-1619882776) | `src/ui/markdown.ml:241` | 8 | 6 | 6 | 5 | 1 | 376.47 | 61.46 |
| [`ui.markdown._write_markdown_editor`](File-src-ui-markdown-ml-707379131.md#function-function-ui-markdown-write-markdown-editor-function-write-markdown-editor-st-markdown-preserve-view-src-ui-markdown-ml-497295665) | `src/ui/markdown.ml:898` | 38 | 31 | 4 | 3 | 1 | 1846.94 | 42.13 |
| [`ui.markdown.clear_cache`](File-src-ui-markdown-ml-707379131.md#function-function-ui-markdown-clear-cache-function-clear-cache-st-idx-src-ui-markdown-ml-843552369) | `src/ui/markdown.ml:1048` | 3 | 1 | 1 | 0 | 0 | 53.15 | 77.38 |
| [`ui.markdown.empty_doc`](File-src-ui-markdown-ml-707379131.md#function-function-ui-markdown-empty-doc-function-empty-doc-src-ui-markdown-ml-313004551) | `src/ui/markdown.ml:1041` | 3 | 1 | 1 | 0 | 0 | 28.07 | 79.32 |
| [`ui.markdown.link_at_editor`](File-src-ui-markdown-ml-707379131.md#function-function-ui-markdown-link-at-editor-function-link-at-editor-st-x-y-src-ui-markdown-ml-1515549927) | `src/ui/markdown.ml:1064` | 3 | 1 | 1 | 0 | 0 | 69.19 | 76.57 |
| [`ui.markdown.open_link_at`](File-src-ui-markdown-ml-707379131.md#function-function-ui-markdown-open-link-at-function-open-link-at-st-x-y-src-ui-markdown-ml-201077115) | `src/ui/markdown.ml:1072` | 3 | 1 | 1 | 0 | 0 | 69.19 | 76.57 |
| [`ui.markdown.render`](File-src-ui-markdown-ml-707379131.md#function-function-ui-markdown-render-function-render-markdown-src-ui-markdown-ml-1572734374) | `src/ui/markdown.ml:1036` | 3 | 1 | 1 | 0 | 0 | 36 | 78.56 |
| [`ui.markdown.write_editor`](File-src-ui-markdown-ml-707379131.md#function-function-ui-markdown-write-editor-function-write-editor-st-markdown-preserve-view-src-ui-markdown-ml-620052725) | `src/ui/markdown.ml:1056` | 3 | 1 | 1 | 0 | 0 | 69.19 | 76.57 |
| [`ui.theme.border_color`](File-src-ui-theme-ml-499196665.md#function-function-ui-theme-border-color-function-border-color-st-src-ui-theme-ml-592528502) | `src/ui/theme.ml:59` | 4 | 3 | 2 | 1 | 1 | 159.91 | 71.17 |
| [`ui.theme.chrome_bg`](File-src-ui-theme-ml-499196665.md#function-function-ui-theme-chrome-bg-function-chrome-bg-st-src-ui-theme-ml-864302606) | `src/ui/theme.ml:52` | 4 | 3 | 2 | 1 | 1 | 159.91 | 71.17 |
| [`ui.theme.editor_bg`](File-src-ui-theme-ml-499196665.md#function-function-ui-theme-editor-bg-function-editor-bg-st-src-ui-theme-ml-317831456) | `src/ui/theme.ml:31` | 4 | 3 | 2 | 1 | 1 | 154.29 | 71.27 |
| [`ui.theme.editor_fg`](File-src-ui-theme-ml-499196665.md#function-function-ui-theme-editor-fg-function-editor-fg-st-src-ui-theme-ml-710347208) | `src/ui/theme.ml:66` | 4 | 3 | 2 | 1 | 1 | 159.91 | 71.17 |
| [`ui.theme.gutter_bg`](File-src-ui-theme-ml-499196665.md#function-function-ui-theme-gutter-bg-function-gutter-bg-st-src-ui-theme-ml-1218004248) | `src/ui/theme.ml:38` | 4 | 3 | 2 | 1 | 1 | 159.91 | 71.17 |
| [`ui.theme.is_dark`](File-src-ui-theme-ml-499196665.md#function-function-ui-theme-is-dark-function-is-dark-st-src-ui-theme-ml-413933728) | `src/ui/theme.ml:25` | 3 | 1 | 1 | 0 | 0 | 83.76 | 75.99 |
| [`ui.theme.muted_fg`](File-src-ui-theme-ml-499196665.md#function-function-ui-theme-muted-fg-function-muted-fg-st-src-ui-theme-ml-1028002086) | `src/ui/theme.ml:73` | 4 | 3 | 2 | 1 | 1 | 159.91 | 71.17 |
| [`ui.theme.panel_bg`](File-src-ui-theme-ml-499196665.md#function-function-ui-theme-panel-bg-function-panel-bg-st-src-ui-theme-ml-909918194) | `src/ui/theme.ml:45` | 4 | 3 | 2 | 1 | 1 | 159.91 | 71.17 |
| [`ui.theme.syntax_color`](File-src-ui-theme-ml-499196665.md#function-function-ui-theme-syntax-color-function-syntax-color-st-kind-src-ui-theme-ml-1973974280) | `src/ui/theme.ml:81` | 16 | 23 | 12 | 16 | 2 | 1195.93 | 50.57 |

## Code duplication

A clone group is an exact sequence of 6 normalized, contiguous code lines found more than once. Comments and formatting whitespace are ignored. Duplicated-line totals count overlapping windows only once.

Found 221 clone group(s). At most 200 groups are shown.

<details>
<summary>Clone 1 — 3 occurrences</summary>

    function _write_u32 ( buf , off , value )
    v = value & 0xFFFFFFFF
    buf [ off ] = v & 255
    buf [ off + 1 ] = ( v >> 8 ) & 255
    buf [ off + 2 ] = ( v >> 16 ) & 255
    buf [ off + 3 ] = ( v >> 24 ) & 255

- [`src/ai/provider.ml:183`](File-src-ai-provider-ml-178084207.md)
- [`src/build/build_service.ml:159`](File-src-build-build-service-ml-412506232.md)
- [`src/platform/win32.ml:944`](File-src-platform-win32-ml-830830664.md)

</details>

<details>
<summary>Clone 2 — 3 occurrences</summary>

    v = value & 0xFFFFFFFF
    buf [ off ] = v & 255
    buf [ off + 1 ] = ( v >> 8 ) & 255
    buf [ off + 2 ] = ( v >> 16 ) & 255
    buf [ off + 3 ] = ( v >> 24 ) & 255
    end function

- [`src/ai/provider.ml:184`](File-src-ai-provider-ml-178084207.md)
- [`src/build/build_service.ml:160`](File-src-build-build-service-ml-412506232.md)
- [`src/platform/win32.ml:945`](File-src-platform-win32-ml-830830664.md)

</details>

<details>
<summary>Clone 3 — 2 occurrences</summary>

    function _last_index_of ( text , ch , before )
    if typeof ( text ) != "string" then return - 1 end if
    i = before
    if i >= len ( text ) then i = len ( text ) - 1 end if
    while i >= 0
    if text [ i ] == ch then return i end if

- [`src/ai/provider.ml:202`](File-src-ai-provider-ml-178084207.md)
- [`src/build/build_service.ml:301`](File-src-build-build-service-ml-412506232.md)

</details>

<details>
<summary>Clone 4 — 2 occurrences</summary>

    if typeof ( text ) != "string" then return - 1 end if
    i = before
    if i >= len ( text ) then i = len ( text ) - 1 end if
    while i >= 0
    if text [ i ] == ch then return i end if
    i = i - 1

- [`src/ai/provider.ml:203`](File-src-ai-provider-ml-178084207.md)
- [`src/build/build_service.ml:302`](File-src-build-build-service-ml-412506232.md)

</details>

<details>
<summary>Clone 5 — 2 occurrences</summary>

    i = before
    if i >= len ( text ) then i = len ( text ) - 1 end if
    while i >= 0
    if text [ i ] == ch then return i end if
    i = i - 1
    end while

- [`src/ai/provider.ml:204`](File-src-ai-provider-ml-178084207.md)
- [`src/build/build_service.ml:303`](File-src-build-build-service-ml-412506232.md)

</details>

<details>
<summary>Clone 6 — 2 occurrences</summary>

    if i >= len ( text ) then i = len ( text ) - 1 end if
    while i >= 0
    if text [ i ] == ch then return i end if
    i = i - 1
    end while
    return - 1

- [`src/ai/provider.ml:205`](File-src-ai-provider-ml-178084207.md)
- [`src/build/build_service.ml:304`](File-src-build-build-service-ml-412506232.md)

</details>

<details>
<summary>Clone 7 — 2 occurrences</summary>

    while i >= 0
    if text [ i ] == ch then return i end if
    i = i - 1
    end while
    return - 1
    end function

- [`src/ai/provider.ml:206`](File-src-ai-provider-ml-178084207.md)
- [`src/build/build_service.ml:305`](File-src-build-build-service-ml-412506232.md)

</details>

<details>
<summary>Clone 8 — 3 occurrences</summary>

    if typeof ( text ) != "string" or typeof ( field ) != "string" or field == "" then return "" end if
    marker = "\"" + field + "\""
    pos = s . indexOf ( text , marker , 0 )
    while pos >= 0
    colon = s . indexOf ( text , ":" , pos + len ( marker ) )
    if colon < 0 then return "" end if

- [`src/ai/provider.ml:651`](File-src-ai-provider-ml-178084207.md)
- [`src/ai/provider.ml:668`](File-src-ai-provider-ml-178084207.md)
- [`src/ai/provider.ml:689`](File-src-ai-provider-ml-178084207.md)

</details>

<details>
<summary>Clone 9 — 3 occurrences</summary>

    marker = "\"" + field + "\""
    pos = s . indexOf ( text , marker , 0 )
    while pos >= 0
    colon = s . indexOf ( text , ":" , pos + len ( marker ) )
    if colon < 0 then return "" end if
    i = _skip_json_ws ( text , colon + 1 )

- [`src/ai/provider.ml:652`](File-src-ai-provider-ml-178084207.md)
- [`src/ai/provider.ml:669`](File-src-ai-provider-ml-178084207.md)
- [`src/ai/provider.ml:690`](File-src-ai-provider-ml-178084207.md)

</details>

<details>
<summary>Clone 10 — 2 occurrences</summary>

    if close > i then return s . substr ( text , i , close - i + 1 ) end if
    return ""
    end if
    pos = s . indexOf ( text , marker , pos + len ( marker ) )
    end while
    return ""

- [`src/ai/provider.ml:677`](File-src-ai-provider-ml-178084207.md)
- [`src/ai/provider.ml:698`](File-src-ai-provider-ml-178084207.md)

</details>

<details>
<summary>Clone 11 — 2 occurrences</summary>

    return ""
    end if
    pos = s . indexOf ( text , marker , pos + len ( marker ) )
    end while
    return ""
    end function

- [`src/ai/provider.ml:678`](File-src-ai-provider-ml-178084207.md)
- [`src/ai/provider.ml:699`](File-src-ai-provider-ml-178084207.md)

</details>

<details>
<summary>Clone 12 — 2 occurrences</summary>

    function _write_ptr ( buf , off , value )
    low = value & 0xFFFFFFFF
    high = 0
    if value < 0 then
    high = 0xFFFFFFFF
    else

- [`src/build/build_service.ml:171`](File-src-build-build-service-ml-412506232.md)
- [`src/platform/win32.ml:956`](File-src-platform-win32-ml-830830664.md)

</details>

<details>
<summary>Clone 13 — 2 occurrences</summary>

    low = value & 0xFFFFFFFF
    high = 0
    if value < 0 then
    high = 0xFFFFFFFF
    else
    high = ( value >> 32 ) & 0xFFFFFFFF

- [`src/build/build_service.ml:172`](File-src-build-build-service-ml-412506232.md)
- [`src/platform/win32.ml:957`](File-src-platform-win32-ml-830830664.md)

</details>

<details>
<summary>Clone 14 — 2 occurrences</summary>

    high = 0
    if value < 0 then
    high = 0xFFFFFFFF
    else
    high = ( value >> 32 ) & 0xFFFFFFFF
    end if

- [`src/build/build_service.ml:173`](File-src-build-build-service-ml-412506232.md)
- [`src/platform/win32.ml:958`](File-src-platform-win32-ml-830830664.md)

</details>

<details>
<summary>Clone 15 — 2 occurrences</summary>

    if value < 0 then
    high = 0xFFFFFFFF
    else
    high = ( value >> 32 ) & 0xFFFFFFFF
    end if
    _write_u32 ( buf , off , low )

- [`src/build/build_service.ml:174`](File-src-build-build-service-ml-412506232.md)
- [`src/platform/win32.ml:959`](File-src-platform-win32-ml-830830664.md)

</details>

<details>
<summary>Clone 16 — 2 occurrences</summary>

    high = 0xFFFFFFFF
    else
    high = ( value >> 32 ) & 0xFFFFFFFF
    end if
    _write_u32 ( buf , off , low )
    _write_u32 ( buf , off + 4 , high )

- [`src/build/build_service.ml:175`](File-src-build-build-service-ml-412506232.md)
- [`src/platform/win32.ml:960`](File-src-platform-win32-ml-830830664.md)

</details>

<details>
<summary>Clone 17 — 2 occurrences</summary>

    else
    high = ( value >> 32 ) & 0xFFFFFFFF
    end if
    _write_u32 ( buf , off , low )
    _write_u32 ( buf , off + 4 , high )
    end function

- [`src/build/build_service.ml:176`](File-src-build-build-service-ml-412506232.md)
- [`src/platform/win32.ml:961`](File-src-platform-win32-ml-830830664.md)

</details>

<details>
<summary>Clone 18 — 3 occurrences</summary>

    if typeof ( a ) != "string" or a == "" then return b end if
    if typeof ( b ) != "string" or b == "" then return a end if
    last = a [ len ( a ) - 1 ]
    if last == "\\" or last == "/" then return a + b end if
    return a + "\\" + b
    end function

- [`src/build/build_service.ml:240`](File-src-build-build-service-ml-412506232.md)
- [`src/project/project.ml:72`](File-src-project-project-ml-1533851532.md)
- [`src/project/templates.ml:32`](File-src-project-templates-ml-1433524490.md)

</details>

<details>
<summary>Clone 19 — 2 occurrences</summary>

    if typeof ( path ) != "string" then return "." end if
    i = len ( path ) - 1
    while i >= 0
    ch = path [ i ]
    if ch == "\\" or ch == "/" then
    if i <= 0 then return "." end if

- [`src/build/build_service.ml:250`](File-src-build-build-service-ml-412506232.md)
- [`src/project/project.ml:82`](File-src-project-project-ml-1533851532.md)

</details>

<details>
<summary>Clone 20 — 2 occurrences</summary>

    i = len ( path ) - 1
    while i >= 0
    ch = path [ i ]
    if ch == "\\" or ch == "/" then
    if i <= 0 then return "." end if
    return s . substr ( path , 0 , i )

- [`src/build/build_service.ml:251`](File-src-build-build-service-ml-412506232.md)
- [`src/project/project.ml:83`](File-src-project-project-ml-1533851532.md)

</details>

<details>
<summary>Clone 21 — 2 occurrences</summary>

    while i >= 0
    ch = path [ i ]
    if ch == "\\" or ch == "/" then
    if i <= 0 then return "." end if
    return s . substr ( path , 0 , i )
    end if

- [`src/build/build_service.ml:252`](File-src-build-build-service-ml-412506232.md)
- [`src/project/project.ml:84`](File-src-project-project-ml-1533851532.md)

</details>

<details>
<summary>Clone 22 — 2 occurrences</summary>

    ch = path [ i ]
    if ch == "\\" or ch == "/" then
    if i <= 0 then return "." end if
    return s . substr ( path , 0 , i )
    end if
    i = i - 1

- [`src/build/build_service.ml:253`](File-src-build-build-service-ml-412506232.md)
- [`src/project/project.ml:85`](File-src-project-project-ml-1533851532.md)

</details>

<details>
<summary>Clone 23 — 2 occurrences</summary>

    if ch == "\\" or ch == "/" then
    if i <= 0 then return "." end if
    return s . substr ( path , 0 , i )
    end if
    i = i - 1
    end while

- [`src/build/build_service.ml:254`](File-src-build-build-service-ml-412506232.md)
- [`src/project/project.ml:86`](File-src-project-project-ml-1533851532.md)

</details>

<details>
<summary>Clone 24 — 2 occurrences</summary>

    if i <= 0 then return "." end if
    return s . substr ( path , 0 , i )
    end if
    i = i - 1
    end while
    return "."

- [`src/build/build_service.ml:255`](File-src-build-build-service-ml-412506232.md)
- [`src/project/project.ml:87`](File-src-project-project-ml-1533851532.md)

</details>

<details>
<summary>Clone 25 — 2 occurrences</summary>

    return s . substr ( path , 0 , i )
    end if
    i = i - 1
    end while
    return "."
    end function

- [`src/build/build_service.ml:256`](File-src-build-build-service-ml-412506232.md)
- [`src/project/project.ml:88`](File-src-project-project-ml-1533851532.md)

</details>

<details>
<summary>Clone 26 — 3 occurrences</summary>

    function _is_abs ( path )
    if typeof ( path ) != "string" then return false end if
    if len ( path ) > 2 and path [ 1 ] == ":" then return true end if
    if s . startsWith ( path , "\\" ) or s . startsWith ( path , "/" ) then return true end if
    return false
    end function

- [`src/build/build_service.ml:265`](File-src-build-build-service-ml-412506232.md)
- [`src/lang/index.ml:68`](File-src-lang-index-ml-680000828.md)
- [`src/main.ml:662`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 27 — 2 occurrences</summary>

    compiler = default_compiler ( project )
    if typeof ( compiler_override ) == "string" and compiler_override != "" then
    compiler = _resolve ( root , compiler_override )
    end if
    keep_going = _bool_value ( keep_going , true )
    max_errors = _int_value ( max_errors , 20 )

- [`src/build/build_service.ml:517`](File-src-build-build-service-ml-412506232.md)
- [`src/build/build_service.ml:672`](File-src-build-build-service-ml-412506232.md)

</details>

<details>
<summary>Clone 28 — 2 occurrences</summary>

    if typeof ( compiler_override ) == "string" and compiler_override != "" then
    compiler = _resolve ( root , compiler_override )
    end if
    keep_going = _bool_value ( keep_going , true )
    max_errors = _int_value ( max_errors , 20 )
    if max_errors < 1 then max_errors = 1 end if

- [`src/build/build_service.ml:518`](File-src-build-build-service-ml-412506232.md)
- [`src/build/build_service.ml:673`](File-src-build-build-service-ml-412506232.md)

</details>

<details>
<summary>Clone 29 — 2 occurrences</summary>

    cmd = _q ( compiler ) + " " + _q ( input_path ) + " " + _q ( output_path )
    if keep_going then
    cmd = cmd + " --keep-going --max-errors " + max_errors
    end if
    cmd = cmd + " --subsystem " + subsystem
    if len ( imports ) > 0 then

- [`src/build/build_service.ml:527`](File-src-build-build-service-ml-412506232.md)
- [`src/build/build_service.ml:682`](File-src-build-build-service-ml-412506232.md)

</details>

<details>
<summary>Clone 30 — 2 occurrences</summary>

    if keep_going then
    cmd = cmd + " --keep-going --max-errors " + max_errors
    end if
    cmd = cmd + " --subsystem " + subsystem
    if len ( imports ) > 0 then
    for i = 0 to len ( imports ) - 1

- [`src/build/build_service.ml:528`](File-src-build-build-service-ml-412506232.md)
- [`src/build/build_service.ml:683`](File-src-build-build-service-ml-412506232.md)

</details>

<details>
<summary>Clone 31 — 2 occurrences</summary>

    cmd = cmd + " --keep-going --max-errors " + max_errors
    end if
    cmd = cmd + " --subsystem " + subsystem
    if len ( imports ) > 0 then
    for i = 0 to len ( imports ) - 1
    inc = imports [ i ]

- [`src/build/build_service.ml:529`](File-src-build-build-service-ml-412506232.md)
- [`src/build/build_service.ml:684`](File-src-build-build-service-ml-412506232.md)

</details>

<details>
<summary>Clone 32 — 2 occurrences</summary>

    end if
    cmd = cmd + " --subsystem " + subsystem
    if len ( imports ) > 0 then
    for i = 0 to len ( imports ) - 1
    inc = imports [ i ]
    inc_path = _resolve ( root , inc )

- [`src/build/build_service.ml:530`](File-src-build-build-service-ml-412506232.md)
- [`src/build/build_service.ml:685`](File-src-build-build-service-ml-412506232.md)

</details>

<details>
<summary>Clone 33 — 2 occurrences</summary>

    cmd = cmd + " --subsystem " + subsystem
    if len ( imports ) > 0 then
    for i = 0 to len ( imports ) - 1
    inc = imports [ i ]
    inc_path = _resolve ( root , inc )
    cmd = cmd + " -I " + _q ( inc_path )

- [`src/build/build_service.ml:531`](File-src-build-build-service-ml-412506232.md)
- [`src/build/build_service.ml:686`](File-src-build-build-service-ml-412506232.md)

</details>

<details>
<summary>Clone 34 — 2 occurrences</summary>

    if len ( imports ) > 0 then
    for i = 0 to len ( imports ) - 1
    inc = imports [ i ]
    inc_path = _resolve ( root , inc )
    cmd = cmd + " -I " + _q ( inc_path )
    end for

- [`src/build/build_service.ml:532`](File-src-build-build-service-ml-412506232.md)
- [`src/build/build_service.ml:687`](File-src-build-build-service-ml-412506232.md)

</details>

<details>
<summary>Clone 35 — 2 occurrences</summary>

    for i = 0 to len ( imports ) - 1
    inc = imports [ i ]
    inc_path = _resolve ( root , inc )
    cmd = cmd + " -I " + _q ( inc_path )
    end for
    end if

- [`src/build/build_service.ml:533`](File-src-build-build-service-ml-412506232.md)
- [`src/build/build_service.ml:688`](File-src-build-build-service-ml-412506232.md)

</details>

<details>
<summary>Clone 36 — 2 occurrences</summary>

    inc = imports [ i ]
    inc_path = _resolve ( root , inc )
    cmd = cmd + " -I " + _q ( inc_path )
    end for
    end if
    if extra_args != "" then cmd = cmd + " " + extra_args end if

- [`src/build/build_service.ml:534`](File-src-build-build-service-ml-412506232.md)
- [`src/build/build_service.ml:689`](File-src-build-build-service-ml-412506232.md)

</details>

<details>
<summary>Clone 37 — 2 occurrences</summary>

    inc_path = _resolve ( root , inc )
    cmd = cmd + " -I " + _q ( inc_path )
    end for
    end if
    if extra_args != "" then cmd = cmd + " " + extra_args end if
    return [ root , compiler , input_path , output_path , log_path , cmd ]

- [`src/build/build_service.ml:535`](File-src-build-build-service-ml-412506232.md)
- [`src/build/build_service.ml:690`](File-src-build-build-service-ml-412506232.md)

</details>

<details>
<summary>Clone 38 — 2 occurrences</summary>

    cmd = cmd + " -I " + _q ( inc_path )
    end for
    end if
    if extra_args != "" then cmd = cmd + " " + extra_args end if
    return [ root , compiler , input_path , output_path , log_path , cmd ]
    end function

- [`src/build/build_service.ml:536`](File-src-build-build-service-ml-412506232.md)
- [`src/build/build_service.ml:691`](File-src-build-build-service-ml-412506232.md)

</details>

<details>
<summary>Clone 39 — 5 occurrences</summary>

    si = bytes ( 104 , 0 )
    _write_u32 ( si , 0 , 104 )
    _write_u32 ( si , 60 , STARTF_USESHOWWINDOW | STARTF_USESTDHANDLES )
    _write_u16 ( si , 64 , SW_HIDE )
    _write_ptr ( si , 88 , log_handle )
    _write_ptr ( si , 96 , log_handle )

- [`src/build/build_service.ml:584`](File-src-build-build-service-ml-412506232.md)
- [`src/build/build_service.ml:792`](File-src-build-build-service-ml-412506232.md)
- [`src/build/build_service.ml:847`](File-src-build-build-service-ml-412506232.md)
- [`src/build/build_service.ml:912`](File-src-build-build-service-ml-412506232.md)
- [`src/build/build_service.ml:998`](File-src-build-build-service-ml-412506232.md)

</details>

<details>
<summary>Clone 40 — 2 occurrences</summary>

    pi = bytes ( 24 , 0 )
    ok = CreateProcessW ( void , cmd , void , void , true , CREATE_NO_WINDOW , void , root , si , pi )
    CloseHandle ( log_handle )
    if ok == false then
    return _failed_job ( log_path , cmd , compiler , "Test build start failed: CreateProcessW failed.\r\nCommand: " + cmd )
    end if

- [`src/build/build_service.ml:799`](File-src-build-build-service-ml-412506232.md)
- [`src/build/build_service.ml:854`](File-src-build-build-service-ml-412506232.md)

</details>

<details>
<summary>Clone 41 — 2 occurrences</summary>

    i = i + 1
    end while
    buf . lines = result_lines
    buf . dirty = true
    return buf
    end function

- [`src/editor/buffer.ml:174`](File-src-editor-buffer-ml-1966067569.md)
- [`src/editor/buffer.ml:195`](File-src-editor-buffer-ml-1966067569.md)

</details>

<details>
<summary>Clone 42 — 2 occurrences</summary>

    function _strip_line_comment ( line )
    if typeof ( line ) != "string" then return "" end if
    pos = s . indexOf ( line , "//" , 0 )
    if pos < 0 then return line end if
    return s . substr ( line , 0 , pos )
    end function

- [`src/lang/index.ml:107`](File-src-lang-index-ml-680000828.md)
- [`src/lang/service.ml:269`](File-src-lang-service-ml-621944297.md)

</details>

<details>
<summary>Clone 43 — 2 occurrences</summary>

    file_count = 0
    symbol_count = 0
    import_count = 0
    unresolved_count = 0
    if typeof ( idx . files ) == "array" then file_count = len ( idx . files ) end if
    if typeof ( idx . symbols ) == "array" then symbol_count = len ( idx . symbols ) end if

- [`src/lang/index.ml:251`](File-src-lang-index-ml-680000828.md)
- [`src/lang/service.ml:667`](File-src-lang-service-ml-621944297.md)

</details>

<details>
<summary>Clone 44 — 2 occurrences</summary>

    symbol_count = 0
    import_count = 0
    unresolved_count = 0
    if typeof ( idx . files ) == "array" then file_count = len ( idx . files ) end if
    if typeof ( idx . symbols ) == "array" then symbol_count = len ( idx . symbols ) end if
    if typeof ( idx . imports ) == "array" then import_count = len ( idx . imports ) end if

- [`src/lang/index.ml:252`](File-src-lang-index-ml-680000828.md)
- [`src/lang/service.ml:668`](File-src-lang-service-ml-621944297.md)

</details>

<details>
<summary>Clone 45 — 2 occurrences</summary>

    import_count = 0
    unresolved_count = 0
    if typeof ( idx . files ) == "array" then file_count = len ( idx . files ) end if
    if typeof ( idx . symbols ) == "array" then symbol_count = len ( idx . symbols ) end if
    if typeof ( idx . imports ) == "array" then import_count = len ( idx . imports ) end if
    if typeof ( idx . unresolved_imports ) == "array" then unresolved_count = len ( idx . unresolved_imports ) end if

- [`src/lang/index.ml:253`](File-src-lang-index-ml-680000828.md)
- [`src/lang/service.ml:669`](File-src-lang-service-ml-621944297.md)

</details>

<details>
<summary>Clone 46 — 2 occurrences</summary>

    function _is_word_char ( ch )
    if typeof ( ch ) != "string" or ch == "" then return false end if
    if ch == "_" or ch == "." then return true end if
    b = bytes ( ch )
    if len ( b ) <= 0 then return false end if
    c = b [ 0 ]

- [`src/lang/service.ml:226`](File-src-lang-service-ml-621944297.md)
- [`src/main.ml:4371`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 47 — 2 occurrences</summary>

    if typeof ( ch ) != "string" or ch == "" then return false end if
    if ch == "_" or ch == "." then return true end if
    b = bytes ( ch )
    if len ( b ) <= 0 then return false end if
    c = b [ 0 ]
    return ( c >= 65 and c <= 90 ) or ( c >= 97 and c <= 122 ) or ( c >= 48 and c <= 57 )

- [`src/lang/service.ml:227`](File-src-lang-service-ml-621944297.md)
- [`src/main.ml:4372`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 48 — 2 occurrences</summary>

    if ch == "_" or ch == "." then return true end if
    b = bytes ( ch )
    if len ( b ) <= 0 then return false end if
    c = b [ 0 ]
    return ( c >= 65 and c <= 90 ) or ( c >= 97 and c <= 122 ) or ( c >= 48 and c <= 57 )
    end function

- [`src/lang/service.ml:228`](File-src-lang-service-ml-621944297.md)
- [`src/main.ml:4373`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 49 — 2 occurrences</summary>

    i = start
    while i < len ( text ) and ( text [ i ] == " " or text [ i ] == "\t" )
    i = i + 1
    end while
    begin = i
    while i < len ( text ) and _is_word_char ( text [ i ] )

- [`src/lang/service.ml:282`](File-src-lang-service-ml-621944297.md)
- [`src/lang/symbols.ml:57`](File-src-lang-symbols-ml-2023047483.md)

</details>

<details>
<summary>Clone 50 — 2 occurrences</summary>

    while i < len ( text ) and ( text [ i ] == " " or text [ i ] == "\t" )
    i = i + 1
    end while
    begin = i
    while i < len ( text ) and _is_word_char ( text [ i ] )
    i = i + 1

- [`src/lang/service.ml:283`](File-src-lang-service-ml-621944297.md)
- [`src/lang/symbols.ml:58`](File-src-lang-symbols-ml-2023047483.md)

</details>

<details>
<summary>Clone 51 — 2 occurrences</summary>

    i = i + 1
    end while
    begin = i
    while i < len ( text ) and _is_word_char ( text [ i ] )
    i = i + 1
    end while

- [`src/lang/service.ml:284`](File-src-lang-service-ml-621944297.md)
- [`src/lang/symbols.ml:59`](File-src-lang-symbols-ml-2023047483.md)

</details>

<details>
<summary>Clone 52 — 2 occurrences</summary>

    end while
    begin = i
    while i < len ( text ) and _is_word_char ( text [ i ] )
    i = i + 1
    end while
    if i <= begin then return "" end if

- [`src/lang/service.ml:285`](File-src-lang-service-ml-621944297.md)
- [`src/lang/symbols.ml:60`](File-src-lang-symbols-ml-2023047483.md)

</details>

<details>
<summary>Clone 53 — 2 occurrences</summary>

    begin = i
    while i < len ( text ) and _is_word_char ( text [ i ] )
    i = i + 1
    end while
    if i <= begin then return "" end if
    return s . substr ( text , begin , i - begin )

- [`src/lang/service.ml:286`](File-src-lang-service-ml-621944297.md)
- [`src/lang/symbols.ml:61`](File-src-lang-symbols-ml-2023047483.md)

</details>

<details>
<summary>Clone 54 — 2 occurrences</summary>

    while i < len ( text ) and _is_word_char ( text [ i ] )
    i = i + 1
    end while
    if i <= begin then return "" end if
    return s . substr ( text , begin , i - begin )
    end function

- [`src/lang/service.ml:287`](File-src-lang-service-ml-621944297.md)
- [`src/lang/symbols.ml:62`](File-src-lang-symbols-ml-2023047483.md)

</details>

<details>
<summary>Clone 55 — 2 occurrences</summary>

    items = items + [ SymbolItem ( sym . name , sym . kind , sym . file , sym . line ) ]
    if len ( items ) >= limit then return items end if
    end for
    for si = 0 to len ( idx . symbols ) - 1
    sym = idx . symbols [ si ]
    if typeof ( sym ) != "struct" then continue end if

- [`src/lang/service.ml:474`](File-src-lang-service-ml-621944297.md)
- [`src/lang/service.ml:481`](File-src-lang-service-ml-621944297.md)

</details>

<details>
<summary>Clone 56 — 2 occurrences</summary>

    items = items + [ FileItem ( file_info . path , rel , file_info . line_count ) ]
    if len ( items ) >= limit then return items end if
    end for
    for fi = 0 to len ( idx . files ) - 1
    file_info = idx . files [ fi ]
    if typeof ( file_info ) != "struct" then continue end if

- [`src/lang/service.ml:537`](File-src-lang-service-ml-621944297.md)
- [`src/lang/service.ml:545`](File-src-lang-service-ml-621944297.md)

</details>

<details>
<summary>Clone 57 — 2 occurrences</summary>

    if len ( items ) >= limit then return items end if
    end for
    for fi = 0 to len ( idx . files ) - 1
    file_info = idx . files [ fi ]
    if typeof ( file_info ) != "struct" then continue end if
    rel = file_info . relative_path

- [`src/lang/service.ml:538`](File-src-lang-service-ml-621944297.md)
- [`src/lang/service.ml:546`](File-src-lang-service-ml-621944297.md)

</details>

<details>
<summary>Clone 58 — 2 occurrences</summary>

    for fi = 0 to len ( idx . files ) - 1
    file_info = idx . files [ fi ]
    if typeof ( file_info ) != "struct" then continue end if
    text = fs . readAllText ( file_info . path )
    if typeof ( text ) != "string" then continue end if
    lines = s . split ( s . replaceAll ( text , "\r\n" , "\n" ) , "\n" )

- [`src/lang/service.ml:731`](File-src-lang-service-ml-621944297.md)
- [`src/lang/service.ml:966`](File-src-lang-service-ml-621944297.md)

</details>

<details>
<summary>Clone 59 — 2 occurrences</summary>

    file_info = idx . files [ fi ]
    if typeof ( file_info ) != "struct" then continue end if
    text = fs . readAllText ( file_info . path )
    if typeof ( text ) != "string" then continue end if
    lines = s . split ( s . replaceAll ( text , "\r\n" , "\n" ) , "\n" )
    if typeof ( lines ) != "array" then continue end if

- [`src/lang/service.ml:732`](File-src-lang-service-ml-621944297.md)
- [`src/lang/service.ml:967`](File-src-lang-service-ml-621944297.md)

</details>

<details>
<summary>Clone 60 — 2 occurrences</summary>

    if typeof ( file_info ) != "struct" then continue end if
    text = fs . readAllText ( file_info . path )
    if typeof ( text ) != "string" then continue end if
    lines = s . split ( s . replaceAll ( text , "\r\n" , "\n" ) , "\n" )
    if typeof ( lines ) != "array" then continue end if
    for li = 0 to len ( lines ) - 1

- [`src/lang/service.ml:733`](File-src-lang-service-ml-621944297.md)
- [`src/lang/service.ml:968`](File-src-lang-service-ml-621944297.md)

</details>

<details>
<summary>Clone 61 — 2 occurrences</summary>

    text = fs . readAllText ( file_info . path )
    if typeof ( text ) != "string" then continue end if
    lines = s . split ( s . replaceAll ( text , "\r\n" , "\n" ) , "\n" )
    if typeof ( lines ) != "array" then continue end if
    for li = 0 to len ( lines ) - 1
    raw = lines [ li ]

- [`src/lang/service.ml:734`](File-src-lang-service-ml-621944297.md)
- [`src/lang/service.ml:969`](File-src-lang-service-ml-621944297.md)

</details>

<details>
<summary>Clone 62 — 2 occurrences</summary>

    i = end_line + 1
    else
    i = i + 1
    end if
    visible = visible + 1
    end while

- [`src/main.ml:1799`](File-src-main-ml-186468670.md)
- [`src/main.ml:1823`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 63 — 2 occurrences</summary>

    st = _refresh_tabs ( st )
    _set_title ( st )
    end if
    end if
    win . edit_set_modified ( st . editor , false )
    return st

- [`src/main.ml:2480`](File-src-main-ml-186468670.md)
- [`src/main.ml:2626`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 64 — 2 occurrences</summary>

    _set_title ( st )
    end if
    end if
    win . edit_set_modified ( st . editor , false )
    return st
    end function

- [`src/main.ml:2481`](File-src-main-ml-186468670.md)
- [`src/main.ml:2627`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 65 — 2 occurrences</summary>

    st . open_files = st . open_files + [ path ]
    st . open_texts = st . open_texts + [ text ]
    st . open_saved_texts = st . open_saved_texts + [ text ]
    st . open_dirty = st . open_dirty + [ false ]
    st . open_undo = st . open_undo + [ [ ] ]
    st . open_redo = st . open_redo + [ [ ] ]

- [`src/main.ml:2534`](File-src-main-ml-186468670.md)
- [`src/main.ml:2575`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 66 — 2 occurrences</summary>

    st . open_texts = st . open_texts + [ text ]
    st . open_saved_texts = st . open_saved_texts + [ text ]
    st . open_dirty = st . open_dirty + [ false ]
    st . open_undo = st . open_undo + [ [ ] ]
    st . open_redo = st . open_redo + [ [ ] ]
    st . open_folds = st . open_folds + [ [ ] ]

- [`src/main.ml:2535`](File-src-main-ml-186468670.md)
- [`src/main.ml:2576`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 67 — 2 occurrences</summary>

    st . open_saved_texts = st . open_saved_texts + [ text ]
    st . open_dirty = st . open_dirty + [ false ]
    st . open_undo = st . open_undo + [ [ ] ]
    st . open_redo = st . open_redo + [ [ ] ]
    st . open_folds = st . open_folds + [ [ ] ]
    st . open_markdown_sources = st . open_markdown_sources + [ "" ]

- [`src/main.ml:2536`](File-src-main-ml-186468670.md)
- [`src/main.ml:2577`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 68 — 2 occurrences</summary>

    st . open_dirty = st . open_dirty + [ false ]
    st . open_undo = st . open_undo + [ [ ] ]
    st . open_redo = st . open_redo + [ [ ] ]
    st . open_folds = st . open_folds + [ [ ] ]
    st . open_markdown_sources = st . open_markdown_sources + [ "" ]
    st . open_markdown_docs = st . open_markdown_docs + [ markdown . empty_doc ( ) ]

- [`src/main.ml:2537`](File-src-main-ml-186468670.md)
- [`src/main.ml:2578`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 69 — 2 occurrences</summary>

    st . open_undo = st . open_undo + [ [ ] ]
    st . open_redo = st . open_redo + [ [ ] ]
    st . open_folds = st . open_folds + [ [ ] ]
    st . open_markdown_sources = st . open_markdown_sources + [ "" ]
    st . open_markdown_docs = st . open_markdown_docs + [ markdown . empty_doc ( ) ]
    st . open_markdown_views = st . open_markdown_views + [ 0 ]

- [`src/main.ml:2538`](File-src-main-ml-186468670.md)
- [`src/main.ml:2579`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 70 — 2 occurrences</summary>

    st . open_redo = st . open_redo + [ [ ] ]
    st . open_folds = st . open_folds + [ [ ] ]
    st . open_markdown_sources = st . open_markdown_sources + [ "" ]
    st . open_markdown_docs = st . open_markdown_docs + [ markdown . empty_doc ( ) ]
    st . open_markdown_views = st . open_markdown_views + [ 0 ]
    st . open_markdown_view_sources = st . open_markdown_view_sources + [ "" ]

- [`src/main.ml:2539`](File-src-main-ml-186468670.md)
- [`src/main.ml:2580`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 71 — 2 occurrences</summary>

    st . open_folds = st . open_folds + [ [ ] ]
    st . open_markdown_sources = st . open_markdown_sources + [ "" ]
    st . open_markdown_docs = st . open_markdown_docs + [ markdown . empty_doc ( ) ]
    st . open_markdown_views = st . open_markdown_views + [ 0 ]
    st . open_markdown_view_sources = st . open_markdown_view_sources + [ "" ]
    st . open_markdown_view_themes = st . open_markdown_view_themes + [ "" ]

- [`src/main.ml:2540`](File-src-main-ml-186468670.md)
- [`src/main.ml:2581`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 72 — 2 occurrences</summary>

    st . open_markdown_sources = st . open_markdown_sources + [ "" ]
    st . open_markdown_docs = st . open_markdown_docs + [ markdown . empty_doc ( ) ]
    st . open_markdown_views = st . open_markdown_views + [ 0 ]
    st . open_markdown_view_sources = st . open_markdown_view_sources + [ "" ]
    st . open_markdown_view_themes = st . open_markdown_view_themes + [ "" ]
    return _activate_tab ( st , len ( st . open_files ) - 1 )

- [`src/main.ml:2541`](File-src-main-ml-186468670.md)
- [`src/main.ml:2582`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 73 — 2 occurrences</summary>

    st . open_markdown_docs = st . open_markdown_docs + [ markdown . empty_doc ( ) ]
    st . open_markdown_views = st . open_markdown_views + [ 0 ]
    st . open_markdown_view_sources = st . open_markdown_view_sources + [ "" ]
    st . open_markdown_view_themes = st . open_markdown_view_themes + [ "" ]
    return _activate_tab ( st , len ( st . open_files ) - 1 )
    end function

- [`src/main.ml:2542`](File-src-main-ml-186468670.md)
- [`src/main.ml:2583`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 74 — 4 occurrences</summary>

    if st . build_running == false then
    log = _format_build_log ( st , job . log_text , false , job . exit_code )
    st . build_last_log = log
    return _set_log ( st , log )
    end if
    log = _format_build_log ( st , "" , true , build_service . STILL_ACTIVE )

- [`src/main.ml:2832`](File-src-main-ml-186468670.md)
- [`src/main.ml:2858`](File-src-main-ml-186468670.md)
- [`src/main.ml:2885`](File-src-main-ml-186468670.md)
- [`src/main.ml:2947`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 75 — 2 occurrences</summary>

    st . build_running = build_service . job_started ( job )
    st . build_last_poll_ms = 0
    if typeof ( prefix ) != "string" then prefix = "" end if
    st . build_log_prefix = prefix
    if st . build_running == false then
    log = _format_build_log ( st , job . log_text , false , job . exit_code )

- [`src/main.ml:2854`](File-src-main-ml-186468670.md)
- [`src/main.ml:2943`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 76 — 2 occurrences</summary>

    st . build_last_poll_ms = 0
    if typeof ( prefix ) != "string" then prefix = "" end if
    st . build_log_prefix = prefix
    if st . build_running == false then
    log = _format_build_log ( st , job . log_text , false , job . exit_code )
    st . build_last_log = log

- [`src/main.ml:2855`](File-src-main-ml-186468670.md)
- [`src/main.ml:2944`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 77 — 2 occurrences</summary>

    if typeof ( prefix ) != "string" then prefix = "" end if
    st . build_log_prefix = prefix
    if st . build_running == false then
    log = _format_build_log ( st , job . log_text , false , job . exit_code )
    st . build_last_log = log
    return _set_log ( st , log )

- [`src/main.ml:2856`](File-src-main-ml-186468670.md)
- [`src/main.ml:2945`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 78 — 2 occurrences</summary>

    st . build_log_prefix = prefix
    if st . build_running == false then
    log = _format_build_log ( st , job . log_text , false , job . exit_code )
    st . build_last_log = log
    return _set_log ( st , log )
    end if

- [`src/main.ml:2857`](File-src-main-ml-186468670.md)
- [`src/main.ml:2946`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 79 — 3 occurrences</summary>

    log = _format_build_log ( st , job . log_text , false , job . exit_code )
    st . build_last_log = log
    return _set_log ( st , log )
    end if
    log = _format_build_log ( st , "" , true , build_service . STILL_ACTIVE )
    st . build_last_log = log

- [`src/main.ml:2859`](File-src-main-ml-186468670.md)
- [`src/main.ml:2886`](File-src-main-ml-186468670.md)
- [`src/main.ml:2948`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 80 — 2 occurrences</summary>

    st . build_log_prefix = ""
    if st . build_running == false then
    log = _format_build_log ( st , job . log_text , false , job . exit_code )
    st . build_last_log = log
    return _set_log ( st , log )
    end if

- [`src/main.ml:2884`](File-src-main-ml-186468670.md)
- [`src/main.ml:2910`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 81 — 2 occurrences</summary>

    st . build_last_log = log
    return _set_log ( st , log )
    end if
    log = _format_build_log ( st , "" , true , build_service . STILL_ACTIVE )
    st . build_last_log = log
    return _set_log ( st , log )

- [`src/main.ml:2887`](File-src-main-ml-186468670.md)
- [`src/main.ml:2949`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 82 — 2 occurrences</summary>

    return _set_log ( st , log )
    end if
    log = _format_build_log ( st , "" , true , build_service . STILL_ACTIVE )
    st . build_last_log = log
    return _set_log ( st , log )
    end function

- [`src/main.ml:2888`](File-src-main-ml-186468670.md)
- [`src/main.ml:2950`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 83 — 3 occurrences</summary>

    if st . build_running then
    return _set_log ( st , st . build_last_log + "\r\n\r\nA background process is already running." )
    end if
    save_result = _save_all_open ( st )
    st = save_result [ 0 ]
    if save_result [ 1 ] == false then return _set_log ( st , save_result [ 2 ] ) end if

- [`src/main.ml:2966`](File-src-main-ml-186468670.md)
- [`src/main.ml:2978`](File-src-main-ml-186468670.md)
- [`src/main.ml:2993`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 84 — 2 occurrences</summary>

    st = guard [ 0 ]
    if guard [ 1 ] == false then return st end if
    st = _sync_active_tab ( st )
    st = _destroy_all_markdown_views ( st )
    st . editor = st . code_editor
    win . ShowWindow ( st . code_editor , win . SW_SHOW )

- [`src/main.ml:3199`](File-src-main-ml-186468670.md)
- [`src/main.ml:3246`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 85 — 3 occurrences</summary>

    st . open_files = [ ]
    st . open_texts = [ ]
    st . open_saved_texts = [ ]
    st . open_dirty = [ ]
    st . open_undo = [ ]
    st . open_redo = [ ]

- [`src/main.ml:3209`](File-src-main-ml-186468670.md)
- [`src/main.ml:3262`](File-src-main-ml-186468670.md)
- [`src/main.ml:7007`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 86 — 3 occurrences</summary>

    st . open_texts = [ ]
    st . open_saved_texts = [ ]
    st . open_dirty = [ ]
    st . open_undo = [ ]
    st . open_redo = [ ]
    st . open_folds = [ ]

- [`src/main.ml:3210`](File-src-main-ml-186468670.md)
- [`src/main.ml:3263`](File-src-main-ml-186468670.md)
- [`src/main.ml:7008`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 87 — 3 occurrences</summary>

    st . open_saved_texts = [ ]
    st . open_dirty = [ ]
    st . open_undo = [ ]
    st . open_redo = [ ]
    st . open_folds = [ ]
    st . open_markdown_sources = [ ]

- [`src/main.ml:3211`](File-src-main-ml-186468670.md)
- [`src/main.ml:3264`](File-src-main-ml-186468670.md)
- [`src/main.ml:7009`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 88 — 3 occurrences</summary>

    st . open_dirty = [ ]
    st . open_undo = [ ]
    st . open_redo = [ ]
    st . open_folds = [ ]
    st . open_markdown_sources = [ ]
    st . open_markdown_docs = [ ]

- [`src/main.ml:3212`](File-src-main-ml-186468670.md)
- [`src/main.ml:3265`](File-src-main-ml-186468670.md)
- [`src/main.ml:7010`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 89 — 3 occurrences</summary>

    st . open_undo = [ ]
    st . open_redo = [ ]
    st . open_folds = [ ]
    st . open_markdown_sources = [ ]
    st . open_markdown_docs = [ ]
    st . open_markdown_views = [ ]

- [`src/main.ml:3213`](File-src-main-ml-186468670.md)
- [`src/main.ml:3266`](File-src-main-ml-186468670.md)
- [`src/main.ml:7011`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 90 — 3 occurrences</summary>

    st . open_redo = [ ]
    st . open_folds = [ ]
    st . open_markdown_sources = [ ]
    st . open_markdown_docs = [ ]
    st . open_markdown_views = [ ]
    st . open_markdown_view_sources = [ ]

- [`src/main.ml:3214`](File-src-main-ml-186468670.md)
- [`src/main.ml:3267`](File-src-main-ml-186468670.md)
- [`src/main.ml:7012`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 91 — 3 occurrences</summary>

    st . open_folds = [ ]
    st . open_markdown_sources = [ ]
    st . open_markdown_docs = [ ]
    st . open_markdown_views = [ ]
    st . open_markdown_view_sources = [ ]
    st . open_markdown_view_themes = [ ]

- [`src/main.ml:3215`](File-src-main-ml-186468670.md)
- [`src/main.ml:3268`](File-src-main-ml-186468670.md)
- [`src/main.ml:7013`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 92 — 3 occurrences</summary>

    st . open_markdown_sources = [ ]
    st . open_markdown_docs = [ ]
    st . open_markdown_views = [ ]
    st . open_markdown_view_sources = [ ]
    st . open_markdown_view_themes = [ ]
    st . active_tab = - 1

- [`src/main.ml:3216`](File-src-main-ml-186468670.md)
- [`src/main.ml:3269`](File-src-main-ml-186468670.md)
- [`src/main.ml:7014`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 93 — 3 occurrences</summary>

    st . open_markdown_docs = [ ]
    st . open_markdown_views = [ ]
    st . open_markdown_view_sources = [ ]
    st . open_markdown_view_themes = [ ]
    st . active_tab = - 1
    st . current_file = ""

- [`src/main.ml:3217`](File-src-main-ml-186468670.md)
- [`src/main.ml:3270`](File-src-main-ml-186468670.md)
- [`src/main.ml:7015`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 94 — 2 occurrences</summary>

    st . nav_back = [ ]
    st . nav_forward = [ ]
    st . bookmarks = [ ]
    st . last_editor_text = ""
    st = _invalidate_highlight ( st )
    st . last_line_numbers_text = ""

- [`src/main.ml:3223`](File-src-main-ml-186468670.md)
- [`src/main.ml:3277`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 95 — 2 occurrences</summary>

    st . nav_forward = [ ]
    st . bookmarks = [ ]
    st . last_editor_text = ""
    st = _invalidate_highlight ( st )
    st . last_line_numbers_text = ""
    st . last_status_text = ""

- [`src/main.ml:3224`](File-src-main-ml-186468670.md)
- [`src/main.ml:3278`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 96 — 2 occurrences</summary>

    st . bookmarks = [ ]
    st . last_editor_text = ""
    st = _invalidate_highlight ( st )
    st . last_line_numbers_text = ""
    st . last_status_text = ""
    st . last_first_visible_line = - 1

- [`src/main.ml:3225`](File-src-main-ml-186468670.md)
- [`src/main.ml:3279`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 97 — 3 occurrences</summary>

    st . last_editor_text = ""
    st = _invalidate_highlight ( st )
    st . last_line_numbers_text = ""
    st . last_status_text = ""
    st . last_first_visible_line = - 1
    st = _write_editor ( st , "" )

- [`src/main.ml:3280`](File-src-main-ml-186468670.md)
- [`src/main.ml:6904`](File-src-main-ml-186468670.md)
- [`src/main.ml:7022`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 98 — 11 occurrences</summary>

    done = false
    while done == false and win . IsWindow ( dlg )
    msg = bytes ( 48 , 0 )
    while win . PeekMessageW ( msg , void , 0 , 0 , win . PM_REMOVE )
    code = win . msg_message ( msg )
    hwnd = win . msg_hwnd ( msg )

- [`src/main.ml:3393`](File-src-main-ml-186468670.md)
- [`src/main.ml:3867`](File-src-main-ml-186468670.md)
- [`src/main.ml:4115`](File-src-main-ml-186468670.md)
- [`src/main.ml:4295`](File-src-main-ml-186468670.md)
- [`src/main.ml:4705`](File-src-main-ml-186468670.md)
- [`src/main.ml:4896`](File-src-main-ml-186468670.md)
- [`src/main.ml:5079`](File-src-main-ml-186468670.md)
- [`src/main.ml:5665`](File-src-main-ml-186468670.md)
- [`src/main.ml:5934`](File-src-main-ml-186468670.md)
- [`src/main.ml:6086`](File-src-main-ml-186468670.md)
- [`src/main.ml:7277`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 99 — 11 occurrences</summary>

    while done == false and win . IsWindow ( dlg )
    msg = bytes ( 48 , 0 )
    while win . PeekMessageW ( msg , void , 0 , 0 , win . PM_REMOVE )
    code = win . msg_message ( msg )
    hwnd = win . msg_hwnd ( msg )
    handled = false

- [`src/main.ml:3394`](File-src-main-ml-186468670.md)
- [`src/main.ml:3868`](File-src-main-ml-186468670.md)
- [`src/main.ml:4116`](File-src-main-ml-186468670.md)
- [`src/main.ml:4296`](File-src-main-ml-186468670.md)
- [`src/main.ml:4706`](File-src-main-ml-186468670.md)
- [`src/main.ml:4897`](File-src-main-ml-186468670.md)
- [`src/main.ml:5080`](File-src-main-ml-186468670.md)
- [`src/main.ml:5666`](File-src-main-ml-186468670.md)
- [`src/main.ml:5935`](File-src-main-ml-186468670.md)
- [`src/main.ml:6087`](File-src-main-ml-186468670.md)
- [`src/main.ml:7278`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 100 — 11 occurrences</summary>

    if code == win . WM_QUIT then
    st . running = false
    done = true
    handled = true
    else if code == win . WM_CLOSE and hwnd == dlg then
    done = true

- [`src/main.ml:3401`](File-src-main-ml-186468670.md)
- [`src/main.ml:3875`](File-src-main-ml-186468670.md)
- [`src/main.ml:4123`](File-src-main-ml-186468670.md)
- [`src/main.ml:4303`](File-src-main-ml-186468670.md)
- [`src/main.ml:4713`](File-src-main-ml-186468670.md)
- [`src/main.ml:4904`](File-src-main-ml-186468670.md)
- [`src/main.ml:5087`](File-src-main-ml-186468670.md)
- [`src/main.ml:5673`](File-src-main-ml-186468670.md)
- [`src/main.ml:5942`](File-src-main-ml-186468670.md)
- [`src/main.ml:6094`](File-src-main-ml-186468670.md)
- [`src/main.ml:7284`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 101 — 11 occurrences</summary>

    st . running = false
    done = true
    handled = true
    else if code == win . WM_CLOSE and hwnd == dlg then
    done = true
    win . DestroyWindow ( dlg )

- [`src/main.ml:3402`](File-src-main-ml-186468670.md)
- [`src/main.ml:3876`](File-src-main-ml-186468670.md)
- [`src/main.ml:4124`](File-src-main-ml-186468670.md)
- [`src/main.ml:4304`](File-src-main-ml-186468670.md)
- [`src/main.ml:4714`](File-src-main-ml-186468670.md)
- [`src/main.ml:4905`](File-src-main-ml-186468670.md)
- [`src/main.ml:5088`](File-src-main-ml-186468670.md)
- [`src/main.ml:5674`](File-src-main-ml-186468670.md)
- [`src/main.ml:5943`](File-src-main-ml-186468670.md)
- [`src/main.ml:6095`](File-src-main-ml-186468670.md)
- [`src/main.ml:7285`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 102 — 11 occurrences</summary>

    done = true
    handled = true
    else if code == win . WM_CLOSE and hwnd == dlg then
    done = true
    win . DestroyWindow ( dlg )
    handled = true

- [`src/main.ml:3403`](File-src-main-ml-186468670.md)
- [`src/main.ml:3877`](File-src-main-ml-186468670.md)
- [`src/main.ml:4125`](File-src-main-ml-186468670.md)
- [`src/main.ml:4305`](File-src-main-ml-186468670.md)
- [`src/main.ml:4715`](File-src-main-ml-186468670.md)
- [`src/main.ml:4906`](File-src-main-ml-186468670.md)
- [`src/main.ml:5089`](File-src-main-ml-186468670.md)
- [`src/main.ml:5675`](File-src-main-ml-186468670.md)
- [`src/main.ml:5944`](File-src-main-ml-186468670.md)
- [`src/main.ml:6096`](File-src-main-ml-186468670.md)
- [`src/main.ml:7286`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 103 — 10 occurrences</summary>

    handled = true
    else if code == win . WM_CLOSE and hwnd == dlg then
    done = true
    win . DestroyWindow ( dlg )
    handled = true
    else if code == win . WM_CLOSE and hwnd == st . hwnd then

- [`src/main.ml:3404`](File-src-main-ml-186468670.md)
- [`src/main.ml:3878`](File-src-main-ml-186468670.md)
- [`src/main.ml:4126`](File-src-main-ml-186468670.md)
- [`src/main.ml:4306`](File-src-main-ml-186468670.md)
- [`src/main.ml:4716`](File-src-main-ml-186468670.md)
- [`src/main.ml:4907`](File-src-main-ml-186468670.md)
- [`src/main.ml:5090`](File-src-main-ml-186468670.md)
- [`src/main.ml:5676`](File-src-main-ml-186468670.md)
- [`src/main.ml:5945`](File-src-main-ml-186468670.md)
- [`src/main.ml:6097`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 104 — 10 occurrences</summary>

    else if code == win . WM_CLOSE and hwnd == dlg then
    done = true
    win . DestroyWindow ( dlg )
    handled = true
    else if code == win . WM_CLOSE and hwnd == st . hwnd then
    st = _request_exit ( st )

- [`src/main.ml:3405`](File-src-main-ml-186468670.md)
- [`src/main.ml:3879`](File-src-main-ml-186468670.md)
- [`src/main.ml:4127`](File-src-main-ml-186468670.md)
- [`src/main.ml:4307`](File-src-main-ml-186468670.md)
- [`src/main.ml:4717`](File-src-main-ml-186468670.md)
- [`src/main.ml:4908`](File-src-main-ml-186468670.md)
- [`src/main.ml:5091`](File-src-main-ml-186468670.md)
- [`src/main.ml:5677`](File-src-main-ml-186468670.md)
- [`src/main.ml:5946`](File-src-main-ml-186468670.md)
- [`src/main.ml:6098`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 105 — 10 occurrences</summary>

    done = true
    win . DestroyWindow ( dlg )
    handled = true
    else if code == win . WM_CLOSE and hwnd == st . hwnd then
    st = _request_exit ( st )
    done = true

- [`src/main.ml:3406`](File-src-main-ml-186468670.md)
- [`src/main.ml:3880`](File-src-main-ml-186468670.md)
- [`src/main.ml:4128`](File-src-main-ml-186468670.md)
- [`src/main.ml:4308`](File-src-main-ml-186468670.md)
- [`src/main.ml:4718`](File-src-main-ml-186468670.md)
- [`src/main.ml:4909`](File-src-main-ml-186468670.md)
- [`src/main.ml:5092`](File-src-main-ml-186468670.md)
- [`src/main.ml:5678`](File-src-main-ml-186468670.md)
- [`src/main.ml:5947`](File-src-main-ml-186468670.md)
- [`src/main.ml:6099`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 106 — 10 occurrences</summary>

    win . DestroyWindow ( dlg )
    handled = true
    else if code == win . WM_CLOSE and hwnd == st . hwnd then
    st = _request_exit ( st )
    done = true
    if win . IsWindow ( dlg ) then win . DestroyWindow ( dlg ) end if

- [`src/main.ml:3407`](File-src-main-ml-186468670.md)
- [`src/main.ml:3881`](File-src-main-ml-186468670.md)
- [`src/main.ml:4129`](File-src-main-ml-186468670.md)
- [`src/main.ml:4309`](File-src-main-ml-186468670.md)
- [`src/main.ml:4719`](File-src-main-ml-186468670.md)
- [`src/main.ml:4910`](File-src-main-ml-186468670.md)
- [`src/main.ml:5093`](File-src-main-ml-186468670.md)
- [`src/main.ml:5679`](File-src-main-ml-186468670.md)
- [`src/main.ml:5948`](File-src-main-ml-186468670.md)
- [`src/main.ml:6100`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 107 — 10 occurrences</summary>

    handled = true
    else if code == win . WM_CLOSE and hwnd == st . hwnd then
    st = _request_exit ( st )
    done = true
    if win . IsWindow ( dlg ) then win . DestroyWindow ( dlg ) end if
    handled = true

- [`src/main.ml:3408`](File-src-main-ml-186468670.md)
- [`src/main.ml:3882`](File-src-main-ml-186468670.md)
- [`src/main.ml:4130`](File-src-main-ml-186468670.md)
- [`src/main.ml:4310`](File-src-main-ml-186468670.md)
- [`src/main.ml:4720`](File-src-main-ml-186468670.md)
- [`src/main.ml:4911`](File-src-main-ml-186468670.md)
- [`src/main.ml:5094`](File-src-main-ml-186468670.md)
- [`src/main.ml:5680`](File-src-main-ml-186468670.md)
- [`src/main.ml:5949`](File-src-main-ml-186468670.md)
- [`src/main.ml:6101`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 108 — 10 occurrences</summary>

    else if code == win . WM_CLOSE and hwnd == st . hwnd then
    st = _request_exit ( st )
    done = true
    if win . IsWindow ( dlg ) then win . DestroyWindow ( dlg ) end if
    handled = true
    else if ( code == win . WM_DESTROY or code == win . WM_NCDESTROY ) and hwnd == dlg then

- [`src/main.ml:3409`](File-src-main-ml-186468670.md)
- [`src/main.ml:3883`](File-src-main-ml-186468670.md)
- [`src/main.ml:4131`](File-src-main-ml-186468670.md)
- [`src/main.ml:4311`](File-src-main-ml-186468670.md)
- [`src/main.ml:4721`](File-src-main-ml-186468670.md)
- [`src/main.ml:4912`](File-src-main-ml-186468670.md)
- [`src/main.ml:5095`](File-src-main-ml-186468670.md)
- [`src/main.ml:5681`](File-src-main-ml-186468670.md)
- [`src/main.ml:5950`](File-src-main-ml-186468670.md)
- [`src/main.ml:6102`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 109 — 10 occurrences</summary>

    st = _request_exit ( st )
    done = true
    if win . IsWindow ( dlg ) then win . DestroyWindow ( dlg ) end if
    handled = true
    else if ( code == win . WM_DESTROY or code == win . WM_NCDESTROY ) and hwnd == dlg then
    done = true

- [`src/main.ml:3410`](File-src-main-ml-186468670.md)
- [`src/main.ml:3884`](File-src-main-ml-186468670.md)
- [`src/main.ml:4132`](File-src-main-ml-186468670.md)
- [`src/main.ml:4312`](File-src-main-ml-186468670.md)
- [`src/main.ml:4722`](File-src-main-ml-186468670.md)
- [`src/main.ml:4913`](File-src-main-ml-186468670.md)
- [`src/main.ml:5096`](File-src-main-ml-186468670.md)
- [`src/main.ml:5682`](File-src-main-ml-186468670.md)
- [`src/main.ml:5951`](File-src-main-ml-186468670.md)
- [`src/main.ml:6103`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 110 — 10 occurrences</summary>

    done = true
    if win . IsWindow ( dlg ) then win . DestroyWindow ( dlg ) end if
    handled = true
    else if ( code == win . WM_DESTROY or code == win . WM_NCDESTROY ) and hwnd == dlg then
    done = true
    handled = true

- [`src/main.ml:3411`](File-src-main-ml-186468670.md)
- [`src/main.ml:3885`](File-src-main-ml-186468670.md)
- [`src/main.ml:4133`](File-src-main-ml-186468670.md)
- [`src/main.ml:4313`](File-src-main-ml-186468670.md)
- [`src/main.ml:4723`](File-src-main-ml-186468670.md)
- [`src/main.ml:4914`](File-src-main-ml-186468670.md)
- [`src/main.ml:5097`](File-src-main-ml-186468670.md)
- [`src/main.ml:5683`](File-src-main-ml-186468670.md)
- [`src/main.ml:5952`](File-src-main-ml-186468670.md)
- [`src/main.ml:6104`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 111 — 9 occurrences</summary>

    if win . IsWindow ( dlg ) then win . DestroyWindow ( dlg ) end if
    handled = true
    else if ( code == win . WM_DESTROY or code == win . WM_NCDESTROY ) and hwnd == dlg then
    done = true
    handled = true
    else if code == win . WM_KEYDOWN then

- [`src/main.ml:3412`](File-src-main-ml-186468670.md)
- [`src/main.ml:3886`](File-src-main-ml-186468670.md)
- [`src/main.ml:4314`](File-src-main-ml-186468670.md)
- [`src/main.ml:4724`](File-src-main-ml-186468670.md)
- [`src/main.ml:4915`](File-src-main-ml-186468670.md)
- [`src/main.ml:5098`](File-src-main-ml-186468670.md)
- [`src/main.ml:5684`](File-src-main-ml-186468670.md)
- [`src/main.ml:5953`](File-src-main-ml-186468670.md)
- [`src/main.ml:6105`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 112 — 9 occurrences</summary>

    handled = true
    else if ( code == win . WM_DESTROY or code == win . WM_NCDESTROY ) and hwnd == dlg then
    done = true
    handled = true
    else if code == win . WM_KEYDOWN then
    key = win . msg_wparam_u32 ( msg )

- [`src/main.ml:3413`](File-src-main-ml-186468670.md)
- [`src/main.ml:3887`](File-src-main-ml-186468670.md)
- [`src/main.ml:4315`](File-src-main-ml-186468670.md)
- [`src/main.ml:4725`](File-src-main-ml-186468670.md)
- [`src/main.ml:4916`](File-src-main-ml-186468670.md)
- [`src/main.ml:5099`](File-src-main-ml-186468670.md)
- [`src/main.ml:5685`](File-src-main-ml-186468670.md)
- [`src/main.ml:5954`](File-src-main-ml-186468670.md)
- [`src/main.ml:6106`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 113 — 9 occurrences</summary>

    else if ( code == win . WM_DESTROY or code == win . WM_NCDESTROY ) and hwnd == dlg then
    done = true
    handled = true
    else if code == win . WM_KEYDOWN then
    key = win . msg_wparam_u32 ( msg )
    if key == win . VK_ESCAPE then

- [`src/main.ml:3414`](File-src-main-ml-186468670.md)
- [`src/main.ml:3888`](File-src-main-ml-186468670.md)
- [`src/main.ml:4316`](File-src-main-ml-186468670.md)
- [`src/main.ml:4726`](File-src-main-ml-186468670.md)
- [`src/main.ml:4917`](File-src-main-ml-186468670.md)
- [`src/main.ml:5100`](File-src-main-ml-186468670.md)
- [`src/main.ml:5686`](File-src-main-ml-186468670.md)
- [`src/main.ml:5955`](File-src-main-ml-186468670.md)
- [`src/main.ml:6107`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 114 — 10 occurrences</summary>

    done = true
    handled = true
    else if code == win . WM_KEYDOWN then
    key = win . msg_wparam_u32 ( msg )
    if key == win . VK_ESCAPE then
    done = true

- [`src/main.ml:3415`](File-src-main-ml-186468670.md)
- [`src/main.ml:3889`](File-src-main-ml-186468670.md)
- [`src/main.ml:4141`](File-src-main-ml-186468670.md)
- [`src/main.ml:4317`](File-src-main-ml-186468670.md)
- [`src/main.ml:4727`](File-src-main-ml-186468670.md)
- [`src/main.ml:4918`](File-src-main-ml-186468670.md)
- [`src/main.ml:5101`](File-src-main-ml-186468670.md)
- [`src/main.ml:5687`](File-src-main-ml-186468670.md)
- [`src/main.ml:5956`](File-src-main-ml-186468670.md)
- [`src/main.ml:6108`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 115 — 11 occurrences</summary>

    handled = true
    else if code == win . WM_KEYDOWN then
    key = win . msg_wparam_u32 ( msg )
    if key == win . VK_ESCAPE then
    done = true
    win . DestroyWindow ( dlg )

- [`src/main.ml:3416`](File-src-main-ml-186468670.md)
- [`src/main.ml:3890`](File-src-main-ml-186468670.md)
- [`src/main.ml:4142`](File-src-main-ml-186468670.md)
- [`src/main.ml:4318`](File-src-main-ml-186468670.md)
- [`src/main.ml:4728`](File-src-main-ml-186468670.md)
- [`src/main.ml:4919`](File-src-main-ml-186468670.md)
- [`src/main.ml:5102`](File-src-main-ml-186468670.md)
- [`src/main.ml:5688`](File-src-main-ml-186468670.md)
- [`src/main.ml:5957`](File-src-main-ml-186468670.md)
- [`src/main.ml:6109`](File-src-main-ml-186468670.md)
- [`src/main.ml:7291`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 116 — 11 occurrences</summary>

    else if code == win . WM_KEYDOWN then
    key = win . msg_wparam_u32 ( msg )
    if key == win . VK_ESCAPE then
    done = true
    win . DestroyWindow ( dlg )
    handled = true

- [`src/main.ml:3417`](File-src-main-ml-186468670.md)
- [`src/main.ml:3891`](File-src-main-ml-186468670.md)
- [`src/main.ml:4143`](File-src-main-ml-186468670.md)
- [`src/main.ml:4319`](File-src-main-ml-186468670.md)
- [`src/main.ml:4729`](File-src-main-ml-186468670.md)
- [`src/main.ml:4920`](File-src-main-ml-186468670.md)
- [`src/main.ml:5103`](File-src-main-ml-186468670.md)
- [`src/main.ml:5689`](File-src-main-ml-186468670.md)
- [`src/main.ml:5958`](File-src-main-ml-186468670.md)
- [`src/main.ml:6110`](File-src-main-ml-186468670.md)
- [`src/main.ml:7292`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 117 — 10 occurrences</summary>

    key = win . msg_wparam_u32 ( msg )
    if key == win . VK_ESCAPE then
    done = true
    win . DestroyWindow ( dlg )
    handled = true
    else if key == win . VK_RETURN then

- [`src/main.ml:3418`](File-src-main-ml-186468670.md)
- [`src/main.ml:3892`](File-src-main-ml-186468670.md)
- [`src/main.ml:4144`](File-src-main-ml-186468670.md)
- [`src/main.ml:4320`](File-src-main-ml-186468670.md)
- [`src/main.ml:4921`](File-src-main-ml-186468670.md)
- [`src/main.ml:5104`](File-src-main-ml-186468670.md)
- [`src/main.ml:5690`](File-src-main-ml-186468670.md)
- [`src/main.ml:5959`](File-src-main-ml-186468670.md)
- [`src/main.ml:6111`](File-src-main-ml-186468670.md)
- [`src/main.ml:7293`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 118 — 3 occurrences</summary>

    created = _new_project_create_from_dialog ( dlg , name_edit , parent_edit , kind_combo , parent )
    if created != "" then
    created_root = created
    done = true
    win . DestroyWindow ( dlg )
    end if

- [`src/main.ml:3424`](File-src-main-ml-186468670.md)
- [`src/main.ml:3439`](File-src-main-ml-186468670.md)
- [`src/main.ml:3453`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 119 — 3 occurrences</summary>

    if created != "" then
    created_root = created
    done = true
    win . DestroyWindow ( dlg )
    end if
    handled = true

- [`src/main.ml:3425`](File-src-main-ml-186468670.md)
- [`src/main.ml:3440`](File-src-main-ml-186468670.md)
- [`src/main.ml:3454`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 120 — 3 occurrences</summary>

    created_root = created
    done = true
    win . DestroyWindow ( dlg )
    end if
    handled = true
    end if

- [`src/main.ml:3426`](File-src-main-ml-186468670.md)
- [`src/main.ml:3441`](File-src-main-ml-186468670.md)
- [`src/main.ml:3455`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 121 — 4 occurrences</summary>

    done = true
    win . DestroyWindow ( dlg )
    end if
    handled = true
    end if
    else if code == win . WM_COMMAND and hwnd == dlg then

- [`src/main.ml:3427`](File-src-main-ml-186468670.md)
- [`src/main.ml:4154`](File-src-main-ml-186468670.md)
- [`src/main.ml:5968`](File-src-main-ml-186468670.md)
- [`src/main.ml:7302`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 122 — 4 occurrences</summary>

    win . DestroyWindow ( dlg )
    end if
    handled = true
    end if
    else if code == win . WM_COMMAND and hwnd == dlg then
    cid = win . msg_command_id ( msg )

- [`src/main.ml:3428`](File-src-main-ml-186468670.md)
- [`src/main.ml:4155`](File-src-main-ml-186468670.md)
- [`src/main.ml:5969`](File-src-main-ml-186468670.md)
- [`src/main.ml:7303`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 123 — 4 occurrences</summary>

    done = true
    win . DestroyWindow ( dlg )
    end if
    handled = true
    end if
    else if code == win . WM_LBUTTONUP then

- [`src/main.ml:3442`](File-src-main-ml-186468670.md)
- [`src/main.ml:4192`](File-src-main-ml-186468670.md)
- [`src/main.ml:5983`](File-src-main-ml-186468670.md)
- [`src/main.ml:7317`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 124 — 3 occurrences</summary>

    win . DestroyWindow ( dlg )
    end if
    handled = true
    end if
    else if code == win . WM_LBUTTONUP then
    if hwnd == cancel_btn then

- [`src/main.ml:3443`](File-src-main-ml-186468670.md)
- [`src/main.ml:5984`](File-src-main-ml-186468670.md)
- [`src/main.ml:7318`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 125 — 3 occurrences</summary>

    end if
    handled = true
    end if
    else if code == win . WM_LBUTTONUP then
    if hwnd == cancel_btn then
    done = true

- [`src/main.ml:3444`](File-src-main-ml-186468670.md)
- [`src/main.ml:5985`](File-src-main-ml-186468670.md)
- [`src/main.ml:7319`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 126 — 9 occurrences</summary>

    handled = true
    end if
    else if code == win . WM_LBUTTONUP then
    if hwnd == cancel_btn then
    done = true
    win . DestroyWindow ( dlg )

- [`src/main.ml:3445`](File-src-main-ml-186468670.md)
- [`src/main.ml:4341`](File-src-main-ml-186468670.md)
- [`src/main.ml:4783`](File-src-main-ml-186468670.md)
- [`src/main.ml:4944`](File-src-main-ml-186468670.md)
- [`src/main.ml:5127`](File-src-main-ml-186468670.md)
- [`src/main.ml:5722`](File-src-main-ml-186468670.md)
- [`src/main.ml:5986`](File-src-main-ml-186468670.md)
- [`src/main.ml:6132`](File-src-main-ml-186468670.md)
- [`src/main.ml:7320`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 127 — 9 occurrences</summary>

    end if
    else if code == win . WM_LBUTTONUP then
    if hwnd == cancel_btn then
    done = true
    win . DestroyWindow ( dlg )
    handled = true

- [`src/main.ml:3446`](File-src-main-ml-186468670.md)
- [`src/main.ml:4342`](File-src-main-ml-186468670.md)
- [`src/main.ml:4784`](File-src-main-ml-186468670.md)
- [`src/main.ml:4945`](File-src-main-ml-186468670.md)
- [`src/main.ml:5128`](File-src-main-ml-186468670.md)
- [`src/main.ml:5723`](File-src-main-ml-186468670.md)
- [`src/main.ml:5987`](File-src-main-ml-186468670.md)
- [`src/main.ml:6133`](File-src-main-ml-186468670.md)
- [`src/main.ml:7321`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 128 — 8 occurrences</summary>

    else if code == win . WM_LBUTTONUP then
    if hwnd == cancel_btn then
    done = true
    win . DestroyWindow ( dlg )
    handled = true
    else if hwnd == ok_btn then

- [`src/main.ml:3447`](File-src-main-ml-186468670.md)
- [`src/main.ml:4343`](File-src-main-ml-186468670.md)
- [`src/main.ml:4946`](File-src-main-ml-186468670.md)
- [`src/main.ml:5129`](File-src-main-ml-186468670.md)
- [`src/main.ml:5724`](File-src-main-ml-186468670.md)
- [`src/main.ml:5988`](File-src-main-ml-186468670.md)
- [`src/main.ml:6134`](File-src-main-ml-186468670.md)
- [`src/main.ml:7322`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 129 — 4 occurrences</summary>

    done = true
    win . DestroyWindow ( dlg )
    end if
    handled = true
    end if
    end if

- [`src/main.ml:3456`](File-src-main-ml-186468670.md)
- [`src/main.ml:4229`](File-src-main-ml-186468670.md)
- [`src/main.ml:5997`](File-src-main-ml-186468670.md)
- [`src/main.ml:7331`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 130 — 10 occurrences</summary>

    if handled == false then
    win . TranslateMessage ( msg )
    win . DispatchMessageW ( msg )
    end if
    end while
    if done == false then win . Sleep ( 15 ) end if

- [`src/main.ml:3463`](File-src-main-ml-186468670.md)
- [`src/main.ml:4236`](File-src-main-ml-186468670.md)
- [`src/main.ml:4356`](File-src-main-ml-186468670.md)
- [`src/main.ml:4800`](File-src-main-ml-186468670.md)
- [`src/main.ml:4960`](File-src-main-ml-186468670.md)
- [`src/main.ml:5143`](File-src-main-ml-186468670.md)
- [`src/main.ml:5746`](File-src-main-ml-186468670.md)
- [`src/main.ml:6004`](File-src-main-ml-186468670.md)
- [`src/main.ml:6147`](File-src-main-ml-186468670.md)
- [`src/main.ml:7337`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 131 — 10 occurrences</summary>

    win . TranslateMessage ( msg )
    win . DispatchMessageW ( msg )
    end if
    end while
    if done == false then win . Sleep ( 15 ) end if
    end while

- [`src/main.ml:3464`](File-src-main-ml-186468670.md)
- [`src/main.ml:4237`](File-src-main-ml-186468670.md)
- [`src/main.ml:4357`](File-src-main-ml-186468670.md)
- [`src/main.ml:4801`](File-src-main-ml-186468670.md)
- [`src/main.ml:4961`](File-src-main-ml-186468670.md)
- [`src/main.ml:5144`](File-src-main-ml-186468670.md)
- [`src/main.ml:5747`](File-src-main-ml-186468670.md)
- [`src/main.ml:6005`](File-src-main-ml-186468670.md)
- [`src/main.ml:6148`](File-src-main-ml-186468670.md)
- [`src/main.ml:7338`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 132 — 2 occurrences</summary>

    st . assistant_config = _read_assistant_dialog_config ( provider_combo , base_url_edit , key_mode_combo , key_env_edit , api_key_edit , model_edit , tool_mode_edit , enabled , allow_insecure_tls , include_tabs , include_project , include_help )
    st = _save_config ( st )
    done = true
    win . DestroyWindow ( dlg )
    handled = true
    end if

- [`src/main.ml:3898`](File-src-main-ml-186468670.md)
- [`src/main.ml:3919`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 133 — 7 occurrences</summary>

    done = true
    win . DestroyWindow ( dlg )
    handled = true
    end if
    else if code == win . WM_COMMAND and hwnd == dlg then
    cid = win . msg_command_id ( msg )

- [`src/main.ml:3900`](File-src-main-ml-186468670.md)
- [`src/main.ml:4327`](File-src-main-ml-186468670.md)
- [`src/main.ml:4757`](File-src-main-ml-186468670.md)
- [`src/main.ml:4929`](File-src-main-ml-186468670.md)
- [`src/main.ml:5112`](File-src-main-ml-186468670.md)
- [`src/main.ml:5699`](File-src-main-ml-186468670.md)
- [`src/main.ml:6118`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 134 — 3 occurrences</summary>

    values = _read_compile_settings_values ( st , controls , entry_value , output_value , compiler_value )
    applied = _apply_compile_settings ( st , dlg , values , keep_going , subsystem )
    st = applied [ 0 ]
    if applied [ 1 ] then
    done = true
    win . DestroyWindow ( dlg )

- [`src/main.ml:4150`](File-src-main-ml-186468670.md)
- [`src/main.ml:4188`](File-src-main-ml-186468670.md)
- [`src/main.ml:4225`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 135 — 3 occurrences</summary>

    applied = _apply_compile_settings ( st , dlg , values , keep_going , subsystem )
    st = applied [ 0 ]
    if applied [ 1 ] then
    done = true
    win . DestroyWindow ( dlg )
    end if

- [`src/main.ml:4151`](File-src-main-ml-186468670.md)
- [`src/main.ml:4189`](File-src-main-ml-186468670.md)
- [`src/main.ml:4226`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 136 — 3 occurrences</summary>

    st = applied [ 0 ]
    if applied [ 1 ] then
    done = true
    win . DestroyWindow ( dlg )
    end if
    handled = true

- [`src/main.ml:4152`](File-src-main-ml-186468670.md)
- [`src/main.ml:4190`](File-src-main-ml-186468670.md)
- [`src/main.ml:4227`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 137 — 3 occurrences</summary>

    if applied [ 1 ] then
    done = true
    win . DestroyWindow ( dlg )
    end if
    handled = true
    end if

- [`src/main.ml:4153`](File-src-main-ml-186468670.md)
- [`src/main.ml:4191`](File-src-main-ml-186468670.md)
- [`src/main.ml:4228`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 138 — 2 occurrences</summary>

    path = win . open_minilang_file_dialog ( dlg )
    if typeof ( path ) == "string" and path != "" then
    entry_value = _project_relative_path ( st , path )
    win . set_window_text ( entry_edit , entry_value )
    end if
    handled = true

- [`src/main.ml:4162`](File-src-main-ml-186468670.md)
- [`src/main.ml:4199`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 139 — 2 occurrences</summary>

    path = win . open_compiler_dialog ( dlg )
    if typeof ( path ) == "string" and path != "" then
    compiler_value = path
    win . set_window_text ( compiler_edit , compiler_value )
    end if
    handled = true

- [`src/main.ml:4169`](File-src-main-ml-186468670.md)
- [`src/main.ml:4206`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 140 — 2 occurrences</summary>

    query = ""
    done = false
    while done == false and win . IsWindow ( dlg )
    msg = bytes ( 48 , 0 )
    while win . PeekMessageW ( msg , void , 0 , 0 , win . PM_REMOVE )
    code = win . msg_message ( msg )

- [`src/main.ml:4294`](File-src-main-ml-186468670.md)
- [`src/main.ml:6085`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 141 — 6 occurrences</summary>

    done = true
    win . DestroyWindow ( dlg )
    handled = true
    end if
    else if code == win . WM_LBUTTONUP then
    if hwnd == cancel_btn then

- [`src/main.ml:4339`](File-src-main-ml-186468670.md)
- [`src/main.ml:4781`](File-src-main-ml-186468670.md)
- [`src/main.ml:4942`](File-src-main-ml-186468670.md)
- [`src/main.ml:5125`](File-src-main-ml-186468670.md)
- [`src/main.ml:5720`](File-src-main-ml-186468670.md)
- [`src/main.ml:6130`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 142 — 6 occurrences</summary>

    win . DestroyWindow ( dlg )
    handled = true
    end if
    else if code == win . WM_LBUTTONUP then
    if hwnd == cancel_btn then
    done = true

- [`src/main.ml:4340`](File-src-main-ml-186468670.md)
- [`src/main.ml:4782`](File-src-main-ml-186468670.md)
- [`src/main.ml:4943`](File-src-main-ml-186468670.md)
- [`src/main.ml:5126`](File-src-main-ml-186468670.md)
- [`src/main.ml:5721`](File-src-main-ml-186468670.md)
- [`src/main.ml:6131`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 143 — 3 occurrences</summary>

    query = win . get_control_text ( command_edit )
    selected_id = _selected_command_palette_id ( visible_ids , win . listbox_getsel ( command_list ) )
    if selected_id == 0 then selected_id = commands . pick ( ids , labels , search_texts , query , - 1 ) end if
    done = true
    win . DestroyWindow ( dlg )
    handled = true

- [`src/main.ml:4754`](File-src-main-ml-186468670.md)
- [`src/main.ml:4773`](File-src-main-ml-186468670.md)
- [`src/main.ml:4791`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 144 — 2 occurrences</summary>

    selected_id = _selected_command_palette_id ( visible_ids , win . listbox_getsel ( command_list ) )
    if selected_id == 0 then selected_id = commands . pick ( ids , labels , search_texts , query , - 1 ) end if
    done = true
    win . DestroyWindow ( dlg )
    handled = true
    end if

- [`src/main.ml:4755`](File-src-main-ml-186468670.md)
- [`src/main.ml:4792`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 145 — 4 occurrences</summary>

    rows = [ ]
    files = [ ]
    lines_out = [ ]
    cols = [ ]
    for i = 0 to len ( items ) - 1
    item = items [ i ]

- [`src/main.ml:4828`](File-src-main-ml-186468670.md)
- [`src/main.ml:5026`](File-src-main-ml-186468670.md)
- [`src/main.ml:5560`](File-src-main-ml-186468670.md)
- [`src/main.ml:5844`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 146 — 4 occurrences</summary>

    files = [ ]
    lines_out = [ ]
    cols = [ ]
    for i = 0 to len ( items ) - 1
    item = items [ i ]
    if typeof ( item ) != "struct" then continue end if

- [`src/main.ml:4829`](File-src-main-ml-186468670.md)
- [`src/main.ml:5027`](File-src-main-ml-186468670.md)
- [`src/main.ml:5561`](File-src-main-ml-186468670.md)
- [`src/main.ml:5845`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 147 — 2 occurrences</summary>

    query = ""
    accepted = false
    done = false
    while done == false and win . IsWindow ( dlg )
    msg = bytes ( 48 , 0 )
    while win . PeekMessageW ( msg , void , 0 , 0 , win . PM_REMOVE )

- [`src/main.ml:4894`](File-src-main-ml-186468670.md)
- [`src/main.ml:5077`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 148 — 3 occurrences</summary>

    accepted = false
    done = false
    while done == false and win . IsWindow ( dlg )
    msg = bytes ( 48 , 0 )
    while win . PeekMessageW ( msg , void , 0 , 0 , win . PM_REMOVE )
    code = win . msg_message ( msg )

- [`src/main.ml:4895`](File-src-main-ml-186468670.md)
- [`src/main.ml:5078`](File-src-main-ml-186468670.md)
- [`src/main.ml:5664`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 149 — 3 occurrences</summary>

    query = s . trim ( win . get_control_text ( file_edit ) )
    accepted = true
    done = true
    win . DestroyWindow ( dlg )
    handled = true
    end if

- [`src/main.ml:4927`](File-src-main-ml-186468670.md)
- [`src/main.ml:4940`](File-src-main-ml-186468670.md)
- [`src/main.ml:4952`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 150 — 3 occurrences</summary>

    accepted = true
    done = true
    win . DestroyWindow ( dlg )
    handled = true
    end if
    else if code == win . WM_COMMAND and hwnd == dlg then

- [`src/main.ml:4928`](File-src-main-ml-186468670.md)
- [`src/main.ml:5111`](File-src-main-ml-186468670.md)
- [`src/main.ml:5698`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 151 — 3 occurrences</summary>

    accepted = true
    done = true
    win . DestroyWindow ( dlg )
    handled = true
    end if
    else if code == win . WM_LBUTTONUP then

- [`src/main.ml:4941`](File-src-main-ml-186468670.md)
- [`src/main.ml:5124`](File-src-main-ml-186468670.md)
- [`src/main.ml:5719`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 152 — 3 occurrences</summary>

    accepted = true
    done = true
    win . DestroyWindow ( dlg )
    handled = true
    end if
    end if

- [`src/main.ml:4953`](File-src-main-ml-186468670.md)
- [`src/main.ml:5136`](File-src-main-ml-186468670.md)
- [`src/main.ml:5739`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 153 — 3 occurrences</summary>

    query = s . trim ( win . get_control_text ( symbol_edit ) )
    accepted = true
    done = true
    win . DestroyWindow ( dlg )
    handled = true
    end if

- [`src/main.ml:5110`](File-src-main-ml-186468670.md)
- [`src/main.ml:5123`](File-src-main-ml-186468670.md)
- [`src/main.ml:5135`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 154 — 2 occurrences</summary>

    for pi = 0 to len ( project_items ) - 1
    d = project_items [ pi ]
    if typeof ( d ) != "struct" then continue end if
    rows = rows + [ d . kind + "  " + _project_relative_path ( st , d . file ) + ":" + d . line + ":" + d . col + "  " + d . message ]
    files = files + [ d . file ]
    lines_out = lines_out + [ d . line ]

- [`src/main.ml:5193`](File-src-main-ml-186468670.md)
- [`src/main.ml:5419`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 155 — 2 occurrences</summary>

    d = project_items [ pi ]
    if typeof ( d ) != "struct" then continue end if
    rows = rows + [ d . kind + "  " + _project_relative_path ( st , d . file ) + ":" + d . line + ":" + d . col + "  " + d . message ]
    files = files + [ d . file ]
    lines_out = lines_out + [ d . line ]
    cols = cols + [ d . col ]

- [`src/main.ml:5194`](File-src-main-ml-186468670.md)
- [`src/main.ml:5420`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 156 — 2 occurrences</summary>

    lines_out = lines_out + [ d . line ]
    cols = cols + [ d . col ]
    if d . kind == "error" then problem_error_count = problem_error_count + 1 end if
    if d . kind == "warning" then problem_warning_count = problem_warning_count + 1 end if
    if d . kind == "info" then problem_info_count = problem_info_count + 1 end if
    end for

- [`src/main.ml:5424`](File-src-main-ml-186468670.md)
- [`src/main.ml:5458`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 157 — 2 occurrences</summary>

    cols = cols + [ d . col ]
    if d . kind == "error" then problem_error_count = problem_error_count + 1 end if
    if d . kind == "warning" then problem_warning_count = problem_warning_count + 1 end if
    if d . kind == "info" then problem_info_count = problem_info_count + 1 end if
    end for
    end if

- [`src/main.ml:5425`](File-src-main-ml-186468670.md)
- [`src/main.ml:5459`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 158 — 3 occurrences</summary>

    new_name = s . trim ( win . get_control_text ( rename_edit ) )
    action = "preview"
    accepted = true
    done = true
    win . DestroyWindow ( dlg )
    handled = true

- [`src/main.ml:5696`](File-src-main-ml-186468670.md)
- [`src/main.ml:5710`](File-src-main-ml-186468670.md)
- [`src/main.ml:5730`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 159 — 2 occurrences</summary>

    new_name = s . trim ( win . get_control_text ( rename_edit ) )
    action = "apply"
    accepted = true
    done = true
    win . DestroyWindow ( dlg )
    handled = true

- [`src/main.ml:5717`](File-src-main-ml-186468670.md)
- [`src/main.ml:5737`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 160 — 2 occurrences</summary>

    action = "apply"
    accepted = true
    done = true
    win . DestroyWindow ( dlg )
    handled = true
    end if

- [`src/main.ml:5718`](File-src-main-ml-186468670.md)
- [`src/main.ml:5738`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 161 — 3 occurrences</summary>

    value = _read_goto_line ( dlg , line_edit )
    if value > 0 then
    line_to_go = value
    done = true
    win . DestroyWindow ( dlg )
    end if

- [`src/main.ml:5965`](File-src-main-ml-186468670.md)
- [`src/main.ml:5980`](File-src-main-ml-186468670.md)
- [`src/main.ml:5994`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 162 — 3 occurrences</summary>

    if value > 0 then
    line_to_go = value
    done = true
    win . DestroyWindow ( dlg )
    end if
    handled = true

- [`src/main.ml:5966`](File-src-main-ml-186468670.md)
- [`src/main.ml:5981`](File-src-main-ml-186468670.md)
- [`src/main.ml:5995`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 163 — 3 occurrences</summary>

    line_to_go = value
    done = true
    win . DestroyWindow ( dlg )
    end if
    handled = true
    end if

- [`src/main.ml:5967`](File-src-main-ml-186468670.md)
- [`src/main.ml:5982`](File-src-main-ml-186468670.md)
- [`src/main.ml:5996`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 164 — 2 occurrences</summary>

    hwnd = win . create_child ( parent , "RICHEDIT50W" , "" , 0 , style , 0 , 0 , 100 , 100 )
    if hwnd is void then
    hwnd = win . create_child ( parent , "EDIT" , "" , 0 , style , 0 , 0 , 100 , 100 )
    end if
    win . set_control_font ( hwnd , font )
    win . edit_allow_large_text ( hwnd )

- [`src/main.ml:6352`](File-src-main-ml-186468670.md)
- [`src/main.ml:6367`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 165 — 2 occurrences</summary>

    if hwnd is void then
    hwnd = win . create_child ( parent , "EDIT" , "" , 0 , style , 0 , 0 , 100 , 100 )
    end if
    win . set_control_font ( hwnd , font )
    win . edit_allow_large_text ( hwnd )
    return hwnd

- [`src/main.ml:6353`](File-src-main-ml-186468670.md)
- [`src/main.ml:6368`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 166 — 2 occurrences</summary>

    hwnd = win . create_child ( parent , "EDIT" , "" , 0 , style , 0 , 0 , 100 , 100 )
    end if
    win . set_control_font ( hwnd , font )
    win . edit_allow_large_text ( hwnd )
    return hwnd
    end function

- [`src/main.ml:6354`](File-src-main-ml-186468670.md)
- [`src/main.ml:6369`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 167 — 2 occurrences</summary>

    st = _invalidate_highlight ( st )
    st . last_line_numbers_text = ""
    st . last_status_text = ""
    st . last_first_visible_line = - 1
    st = _write_editor ( st , "" )
    st = _refresh_tabs ( st )

- [`src/main.ml:6905`](File-src-main-ml-186468670.md)
- [`src/main.ml:7023`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 168 — 2 occurrences</summary>

    st . last_line_numbers_text = ""
    st . last_status_text = ""
    st . last_first_visible_line = - 1
    st = _write_editor ( st , "" )
    st = _refresh_tabs ( st )
    _set_title ( st )

- [`src/main.ml:6906`](File-src-main-ml-186468670.md)
- [`src/main.ml:7024`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 169 — 3 occurrences</summary>

    value = _read_rename_name ( dlg , name_edit )
    if value != "" then
    new_name = value
    done = true
    win . DestroyWindow ( dlg )
    end if

- [`src/main.ml:7299`](File-src-main-ml-186468670.md)
- [`src/main.ml:7314`](File-src-main-ml-186468670.md)
- [`src/main.ml:7328`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 170 — 3 occurrences</summary>

    if value != "" then
    new_name = value
    done = true
    win . DestroyWindow ( dlg )
    end if
    handled = true

- [`src/main.ml:7300`](File-src-main-ml-186468670.md)
- [`src/main.ml:7315`](File-src-main-ml-186468670.md)
- [`src/main.ml:7329`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 171 — 3 occurrences</summary>

    new_name = value
    done = true
    win . DestroyWindow ( dlg )
    end if
    handled = true
    end if

- [`src/main.ml:7301`](File-src-main-ml-186468670.md)
- [`src/main.ml:7316`](File-src-main-ml-186468670.md)
- [`src/main.ml:7330`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 172 — 2 occurrences</summary>

    st . last_context_ms = win . GetTickCount ( )
    st . prev_right_mouse = win . key_down ( win . VK_RBUTTON )
    if cmd == 0 then return st end if
    st = _perform_command ( st , cmd )
    st . last_context_ms = win . GetTickCount ( )
    st . prev_right_mouse = win . key_down ( win . VK_RBUTTON )

- [`src/main.ml:7669`](File-src-main-ml-186468670.md)
- [`src/main.ml:7685`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 173 — 2 occurrences</summary>

    st . prev_right_mouse = win . key_down ( win . VK_RBUTTON )
    if cmd == 0 then return st end if
    st = _perform_command ( st , cmd )
    st . last_context_ms = win . GetTickCount ( )
    st . prev_right_mouse = win . key_down ( win . VK_RBUTTON )
    return st

- [`src/main.ml:7670`](File-src-main-ml-186468670.md)
- [`src/main.ml:7686`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 174 — 2 occurrences</summary>

    if cmd == 0 then return st end if
    st = _perform_command ( st , cmd )
    st . last_context_ms = win . GetTickCount ( )
    st . prev_right_mouse = win . key_down ( win . VK_RBUTTON )
    return st
    end function

- [`src/main.ml:7671`](File-src-main-ml-186468670.md)
- [`src/main.ml:7687`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 175 — 2 occurrences</summary>

    win . ShowWindow ( st . hwnd , win . SW_RESTORE )
    st . last_w = 0
    st . last_h = 0
    return st
    end if
    return st

- [`src/main.ml:7983`](File-src-main-ml-186468670.md)
- [`src/main.ml:8133`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 176 — 3 occurrences</summary>

    st . last_w = 0
    st . last_h = 0
    return st
    end if
    return st
    end function

- [`src/main.ml:7984`](File-src-main-ml-186468670.md)
- [`src/main.ml:8106`](File-src-main-ml-186468670.md)
- [`src/main.ml:8134`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 177 — 2 occurrences</summary>

    win . set_cursor_hand ( )
    else
    win . set_cursor_ibeam ( )
    end if
    return true
    end if

- [`src/main.ml:8067`](File-src-main-ml-186468670.md)
- [`src/main.ml:8076`](File-src-main-ml-186468670.md)

</details>

<details>
<summary>Clone 178 — 3 occurrences</summary>

    file_buf = GlobalAlloc ( 0x40 , 8192 )
    if file_buf is void then
    _wide_free ( filter )
    _wide_free ( title )
    return ""
    end if

- [`src/platform/win32.ml:1990`](File-src-platform-win32-ml-830830664.md)
- [`src/platform/win32.ml:2024`](File-src-platform-win32-ml-830830664.md)
- [`src/platform/win32.ml:2058`](File-src-platform-win32-ml-830830664.md)

</details>

<details>
<summary>Clone 179 — 3 occurrences</summary>

    if file_buf is void then
    _wide_free ( filter )
    _wide_free ( title )
    return ""
    end if
    ofn = bytes ( 152 , 0 )

- [`src/platform/win32.ml:1991`](File-src-platform-win32-ml-830830664.md)
- [`src/platform/win32.ml:2025`](File-src-platform-win32-ml-830830664.md)
- [`src/platform/win32.ml:2059`](File-src-platform-win32-ml-830830664.md)

</details>

<details>
<summary>Clone 180 — 3 occurrences</summary>

    _wide_free ( filter )
    _wide_free ( title )
    return ""
    end if
    ofn = bytes ( 152 , 0 )
    _write_u32 ( ofn , 0 , 152 )

- [`src/platform/win32.ml:1992`](File-src-platform-win32-ml-830830664.md)
- [`src/platform/win32.ml:2026`](File-src-platform-win32-ml-830830664.md)
- [`src/platform/win32.ml:2060`](File-src-platform-win32-ml-830830664.md)

</details>

<details>
<summary>Clone 181 — 3 occurrences</summary>

    _wide_free ( title )
    return ""
    end if
    ofn = bytes ( 152 , 0 )
    _write_u32 ( ofn , 0 , 152 )
    _write_ptr ( ofn , 8 , hwnd )

- [`src/platform/win32.ml:1993`](File-src-platform-win32-ml-830830664.md)
- [`src/platform/win32.ml:2027`](File-src-platform-win32-ml-830830664.md)
- [`src/platform/win32.ml:2061`](File-src-platform-win32-ml-830830664.md)

</details>

<details>
<summary>Clone 182 — 3 occurrences</summary>

    return ""
    end if
    ofn = bytes ( 152 , 0 )
    _write_u32 ( ofn , 0 , 152 )
    _write_ptr ( ofn , 8 , hwnd )
    _write_ptr ( ofn , 24 , filter )

- [`src/platform/win32.ml:1994`](File-src-platform-win32-ml-830830664.md)
- [`src/platform/win32.ml:2028`](File-src-platform-win32-ml-830830664.md)
- [`src/platform/win32.ml:2062`](File-src-platform-win32-ml-830830664.md)

</details>

<details>
<summary>Clone 183 — 3 occurrences</summary>

    end if
    ofn = bytes ( 152 , 0 )
    _write_u32 ( ofn , 0 , 152 )
    _write_ptr ( ofn , 8 , hwnd )
    _write_ptr ( ofn , 24 , filter )
    _write_u32 ( ofn , 44 , 1 )

- [`src/platform/win32.ml:1995`](File-src-platform-win32-ml-830830664.md)
- [`src/platform/win32.ml:2029`](File-src-platform-win32-ml-830830664.md)
- [`src/platform/win32.ml:2063`](File-src-platform-win32-ml-830830664.md)

</details>

<details>
<summary>Clone 184 — 3 occurrences</summary>

    ofn = bytes ( 152 , 0 )
    _write_u32 ( ofn , 0 , 152 )
    _write_ptr ( ofn , 8 , hwnd )
    _write_ptr ( ofn , 24 , filter )
    _write_u32 ( ofn , 44 , 1 )
    _write_ptr ( ofn , 48 , file_buf )

- [`src/platform/win32.ml:1996`](File-src-platform-win32-ml-830830664.md)
- [`src/platform/win32.ml:2030`](File-src-platform-win32-ml-830830664.md)
- [`src/platform/win32.ml:2064`](File-src-platform-win32-ml-830830664.md)

</details>

<details>
<summary>Clone 185 — 3 occurrences</summary>

    _write_u32 ( ofn , 0 , 152 )
    _write_ptr ( ofn , 8 , hwnd )
    _write_ptr ( ofn , 24 , filter )
    _write_u32 ( ofn , 44 , 1 )
    _write_ptr ( ofn , 48 , file_buf )
    _write_u32 ( ofn , 56 , 4096 )

- [`src/platform/win32.ml:1997`](File-src-platform-win32-ml-830830664.md)
- [`src/platform/win32.ml:2031`](File-src-platform-win32-ml-830830664.md)
- [`src/platform/win32.ml:2065`](File-src-platform-win32-ml-830830664.md)

</details>

<details>
<summary>Clone 186 — 3 occurrences</summary>

    _write_ptr ( ofn , 8 , hwnd )
    _write_ptr ( ofn , 24 , filter )
    _write_u32 ( ofn , 44 , 1 )
    _write_ptr ( ofn , 48 , file_buf )
    _write_u32 ( ofn , 56 , 4096 )
    _write_ptr ( ofn , 88 , title )

- [`src/platform/win32.ml:1998`](File-src-platform-win32-ml-830830664.md)
- [`src/platform/win32.ml:2032`](File-src-platform-win32-ml-830830664.md)
- [`src/platform/win32.ml:2066`](File-src-platform-win32-ml-830830664.md)

</details>

<details>
<summary>Clone 187 — 3 occurrences</summary>

    _write_ptr ( ofn , 24 , filter )
    _write_u32 ( ofn , 44 , 1 )
    _write_ptr ( ofn , 48 , file_buf )
    _write_u32 ( ofn , 56 , 4096 )
    _write_ptr ( ofn , 88 , title )
    _write_u32 ( ofn , 96 , 0x00080000 | 0x00001000 | 0x00000800 | 0x00000008 | 0x00000004 )

- [`src/platform/win32.ml:1999`](File-src-platform-win32-ml-830830664.md)
- [`src/platform/win32.ml:2033`](File-src-platform-win32-ml-830830664.md)
- [`src/platform/win32.ml:2067`](File-src-platform-win32-ml-830830664.md)

</details>

<details>
<summary>Clone 188 — 3 occurrences</summary>

    _write_u32 ( ofn , 44 , 1 )
    _write_ptr ( ofn , 48 , file_buf )
    _write_u32 ( ofn , 56 , 4096 )
    _write_ptr ( ofn , 88 , title )
    _write_u32 ( ofn , 96 , 0x00080000 | 0x00001000 | 0x00000800 | 0x00000008 | 0x00000004 )
    ok = GetOpenFileNameW ( ofn )

- [`src/platform/win32.ml:2000`](File-src-platform-win32-ml-830830664.md)
- [`src/platform/win32.ml:2034`](File-src-platform-win32-ml-830830664.md)
- [`src/platform/win32.ml:2068`](File-src-platform-win32-ml-830830664.md)

</details>

<details>
<summary>Clone 189 — 3 occurrences</summary>

    _write_ptr ( ofn , 48 , file_buf )
    _write_u32 ( ofn , 56 , 4096 )
    _write_ptr ( ofn , 88 , title )
    _write_u32 ( ofn , 96 , 0x00080000 | 0x00001000 | 0x00000800 | 0x00000008 | 0x00000004 )
    ok = GetOpenFileNameW ( ofn )
    result = ""

- [`src/platform/win32.ml:2001`](File-src-platform-win32-ml-830830664.md)
- [`src/platform/win32.ml:2035`](File-src-platform-win32-ml-830830664.md)
- [`src/platform/win32.ml:2069`](File-src-platform-win32-ml-830830664.md)

</details>

<details>
<summary>Clone 190 — 3 occurrences</summary>

    _write_u32 ( ofn , 56 , 4096 )
    _write_ptr ( ofn , 88 , title )
    _write_u32 ( ofn , 96 , 0x00080000 | 0x00001000 | 0x00000800 | 0x00000008 | 0x00000004 )
    ok = GetOpenFileNameW ( ofn )
    result = ""
    if ok then

- [`src/platform/win32.ml:2002`](File-src-platform-win32-ml-830830664.md)
- [`src/platform/win32.ml:2036`](File-src-platform-win32-ml-830830664.md)
- [`src/platform/win32.ml:2070`](File-src-platform-win32-ml-830830664.md)

</details>

<details>
<summary>Clone 191 — 3 occurrences</summary>

    _write_ptr ( ofn , 88 , title )
    _write_u32 ( ofn , 96 , 0x00080000 | 0x00001000 | 0x00000800 | 0x00000008 | 0x00000004 )
    ok = GetOpenFileNameW ( ofn )
    result = ""
    if ok then
    buf = bytes ( 8192 , 0 )

- [`src/platform/win32.ml:2003`](File-src-platform-win32-ml-830830664.md)
- [`src/platform/win32.ml:2037`](File-src-platform-win32-ml-830830664.md)
- [`src/platform/win32.ml:2071`](File-src-platform-win32-ml-830830664.md)

</details>

<details>
<summary>Clone 192 — 3 occurrences</summary>

    _write_u32 ( ofn , 96 , 0x00080000 | 0x00001000 | 0x00000800 | 0x00000008 | 0x00000004 )
    ok = GetOpenFileNameW ( ofn )
    result = ""
    if ok then
    buf = bytes ( 8192 , 0 )
    RtlMoveMemoryFromPtr ( buf , file_buf , 8192 )

- [`src/platform/win32.ml:2004`](File-src-platform-win32-ml-830830664.md)
- [`src/platform/win32.ml:2038`](File-src-platform-win32-ml-830830664.md)
- [`src/platform/win32.ml:2072`](File-src-platform-win32-ml-830830664.md)

</details>

<details>
<summary>Clone 193 — 3 occurrences</summary>

    ok = GetOpenFileNameW ( ofn )
    result = ""
    if ok then
    buf = bytes ( 8192 , 0 )
    RtlMoveMemoryFromPtr ( buf , file_buf , 8192 )
    decoded = decode16Z ( buf )

- [`src/platform/win32.ml:2005`](File-src-platform-win32-ml-830830664.md)
- [`src/platform/win32.ml:2039`](File-src-platform-win32-ml-830830664.md)
- [`src/platform/win32.ml:2073`](File-src-platform-win32-ml-830830664.md)

</details>

<details>
<summary>Clone 194 — 3 occurrences</summary>

    result = ""
    if ok then
    buf = bytes ( 8192 , 0 )
    RtlMoveMemoryFromPtr ( buf , file_buf , 8192 )
    decoded = decode16Z ( buf )
    if typeof ( decoded ) == "string" then result = decoded end if

- [`src/platform/win32.ml:2006`](File-src-platform-win32-ml-830830664.md)
- [`src/platform/win32.ml:2040`](File-src-platform-win32-ml-830830664.md)
- [`src/platform/win32.ml:2074`](File-src-platform-win32-ml-830830664.md)

</details>

<details>
<summary>Clone 195 — 3 occurrences</summary>

    if ok then
    buf = bytes ( 8192 , 0 )
    RtlMoveMemoryFromPtr ( buf , file_buf , 8192 )
    decoded = decode16Z ( buf )
    if typeof ( decoded ) == "string" then result = decoded end if
    end if

- [`src/platform/win32.ml:2007`](File-src-platform-win32-ml-830830664.md)
- [`src/platform/win32.ml:2041`](File-src-platform-win32-ml-830830664.md)
- [`src/platform/win32.ml:2075`](File-src-platform-win32-ml-830830664.md)

</details>

<details>
<summary>Clone 196 — 3 occurrences</summary>

    buf = bytes ( 8192 , 0 )
    RtlMoveMemoryFromPtr ( buf , file_buf , 8192 )
    decoded = decode16Z ( buf )
    if typeof ( decoded ) == "string" then result = decoded end if
    end if
    GlobalFree ( file_buf )

- [`src/platform/win32.ml:2008`](File-src-platform-win32-ml-830830664.md)
- [`src/platform/win32.ml:2042`](File-src-platform-win32-ml-830830664.md)
- [`src/platform/win32.ml:2076`](File-src-platform-win32-ml-830830664.md)

</details>

<details>
<summary>Clone 197 — 3 occurrences</summary>

    RtlMoveMemoryFromPtr ( buf , file_buf , 8192 )
    decoded = decode16Z ( buf )
    if typeof ( decoded ) == "string" then result = decoded end if
    end if
    GlobalFree ( file_buf )
    _wide_free ( filter )

- [`src/platform/win32.ml:2009`](File-src-platform-win32-ml-830830664.md)
- [`src/platform/win32.ml:2043`](File-src-platform-win32-ml-830830664.md)
- [`src/platform/win32.ml:2077`](File-src-platform-win32-ml-830830664.md)

</details>

<details>
<summary>Clone 198 — 3 occurrences</summary>

    decoded = decode16Z ( buf )
    if typeof ( decoded ) == "string" then result = decoded end if
    end if
    GlobalFree ( file_buf )
    _wide_free ( filter )
    _wide_free ( title )

- [`src/platform/win32.ml:2010`](File-src-platform-win32-ml-830830664.md)
- [`src/platform/win32.ml:2044`](File-src-platform-win32-ml-830830664.md)
- [`src/platform/win32.ml:2078`](File-src-platform-win32-ml-830830664.md)

</details>

<details>
<summary>Clone 199 — 3 occurrences</summary>

    if typeof ( decoded ) == "string" then result = decoded end if
    end if
    GlobalFree ( file_buf )
    _wide_free ( filter )
    _wide_free ( title )
    return result

- [`src/platform/win32.ml:2011`](File-src-platform-win32-ml-830830664.md)
- [`src/platform/win32.ml:2045`](File-src-platform-win32-ml-830830664.md)
- [`src/platform/win32.ml:2079`](File-src-platform-win32-ml-830830664.md)

</details>

<details>
<summary>Clone 200 — 3 occurrences</summary>

    end if
    GlobalFree ( file_buf )
    _wide_free ( filter )
    _wide_free ( title )
    return result
    end function

- [`src/platform/win32.ml:2012`](File-src-platform-win32-ml-830830664.md)
- [`src/platform/win32.ml:2046`](File-src-platform-win32-ml-830830664.md)
- [`src/platform/win32.ml:2080`](File-src-platform-win32-ml-830830664.md)

</details>


## Definitions

- **Cognitive complexity:** decision complexity weighted by nesting; logical `and`/`or` operators add one.
- **Cyclomatic complexity:** one plus decisions from conditions, loops, switch cases, and logical `and`/`or` operators.
- **Documentation coverage:** percentage of documented API summaries, parameter contracts, fields, constants, globals, and enum variants. Empty categories report 100% and do not affect the overall ratio.
- **Halstead metrics:** operators and operands are counted from MiniLang lexical tokens. Estimated defects are volume divided by 3,000.
- **Maintainability index:** normalized 0–100 index based on Halstead volume, cyclomatic complexity, and source lines. Project MI is source-line weighted across files.
- **SLOC:** non-empty lines containing MiniLang tokens after conditional preprocessing; comment-only lines are excluded.
