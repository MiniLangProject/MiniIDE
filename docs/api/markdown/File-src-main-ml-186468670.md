# `src/main.ml`

[Home](README.md) · [Files](Files.md)

Provides main facilities for this project.

Package: [`(global)`](Package-global-1952375359.md)

Reachable from entry: **yes**

## Imports

- `ai/assistant.ml` as `assistant` → [src/ai/assistant.ml](File-src-ai-assistant-ml-1857925730.md)
- `ai/provider.ml` as `ai_provider` → [src/ai/provider.ml](File-src-ai-provider-ml-178084207.md)
- `build/build_service.ml` as `build_service` → [src/build/build_service.ml](File-src-build-build-service-ml-412506232.md)
- `help/language.ml` as `help_lang` → [src/help/language.ml](File-src-help-language-ml-591952903.md)
- `lang/index.ml` as `lang_index` → [src/lang/index.ml](File-src-lang-index-ml-680000828.md)
- `lang/service.ml` as `lang_service` → [src/lang/service.ml](File-src-lang-service-ml-621944297.md)
- `lang/symbols.ml` as `symbols` → [src/lang/symbols.ml](File-src-lang-symbols-ml-2023047483.md)
- `lang/syntax.ml` as `syntax` → [src/lang/syntax.ml](File-src-lang-syntax-ml-2103667443.md)
- `platform/win32.ml` as `win` → [src/platform/win32.ml](File-src-platform-win32-ml-830830664.md)
- `project/config.ml` as `project_config` → [src/project/config.ml](File-src-project-config-ml-1589199733.md)
- `project/project.ml` as `project_model` → [src/project/project.ml](File-src-project-project-ml-1533851532.md)
- `project/templates.ml` as `templates` → [src/project/templates.ml](File-src-project-templates-ml-1433524490.md)
- `std/fs.ml` as `fs` → `../MiniLangCompilerML/std/fs.ml` — external dependency
- `std/string.ml` as `s` → `../MiniLangCompilerML/std/string.ml` — external dependency
- `ui/commands.ml` as `commands` → [src/ui/commands.ml](File-src-ui-commands-ml-847810634.md)
- `ui/markdown.ml` as `markdown` → [src/ui/markdown.ml](File-src-ui-markdown-ml-707379131.md)
- `ui/theme.ml` as `theme` → [src/ui/theme.ml](File-src-ui-theme-ml-499196665.md)

## Declarations

<a id="function-function-about-function-about-st-src-main-ml-595391558"></a>
### _about

```ml
function _about(st)
```

Show the MiniIDE About dialog.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L6335)

<a id="function-function-accept-autocomplete-function-accept-autocomplete-st-src-main-ml-247667462"></a>
### _accept_autocomplete

```ml
function _accept_autocomplete(st)
```

Accept autocomplete.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L4559)

<a id="function-function-activate-tab-function-activate-tab-st-idx-src-main-ml-437663059"></a>
### _activate_tab

```ml
function _activate_tab(st, idx)
```

Switch to tab.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `idx` | `dynamic` | — | idx value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L2491)

<a id="function-function-active-dirty-function-active-dirty-st-src-main-ml-1132970574"></a>
### _active_dirty

```ml
function _active_dirty(st)
```

Return true when the active tab has unsaved changes.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L726)

<a id="function-function-active-folds-function-active-folds-st-src-main-ml-540173886"></a>
### _active_folds

```ml
function _active_folds(st)
```

Return the active folds.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L1690)

<a id="function-function-active-is-markdown-function-active-is-markdown-st-src-main-ml-1676987966"></a>
### _active_is_markdown

```ml
function _active_is_markdown(st)
```

Return true when the active tab displays Markdown content.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L1916)

<a id="function-function-active-live-diagnostics-text-function-active-live-diagnostics-text-st-src-main-ml-890238588"></a>
### _active_live_diagnostics_text

```ml
function _active_live_diagnostics_text(st)
```

Count lightweight diagnostics for the active file.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L7549)

<a id="function-function-all-line-numbers-text-function-all-line-numbers-text-count-src-main-ml-1228934064"></a>
### _all_line_numbers_text

```ml
function _all_line_numbers_text(count)
```

Return the all line numbers text.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `count` | `dynamic` | — | Number of items or units to process. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L7481)

<a id="function-function-alt-down-function-alt-down-src-main-ml-509192441"></a>
### _alt_down

```ml
function _alt_down()
```

Return the alt down.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L6701)

<a id="function-function-api-key-mode-combo-index-function-api-key-mode-combo-index-mode-src-main-ml-1018505324"></a>
### _api_key_mode_combo_index

```ml
function _api_key_mode_combo_index(mode)
```

Return the combo-box index for the assistant API-key source.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `mode` | `dynamic` | — | Mode selecting the requested behavior. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L3747)

<a id="function-function-api-key-mode-from-combo-function-api-key-mode-from-combo-key-mode-combo-src-main-ml-1189444117"></a>
### _api_key_mode_from_combo

```ml
function _api_key_mode_from_combo(key_mode_combo)
```

Return the API-key source represented by the combo-box selection.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `key_mode_combo` | `dynamic` | — | key_mode_combo value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L3755)

<a id="function-function-apply-compile-settings-function-apply-compile-settings-st-dlg-values-keep-going-subsystem-src-main-ml-172881274"></a>
### _apply_compile_settings

```ml
function _apply_compile_settings(st, dlg, values, keep_going, subsystem)
```

Apply compile settings.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `dlg` | `dynamic` | — | dlg value consumed by this operation. |
| `values` | `dynamic` | — | values value consumed by this operation. |
| `keep_going` | `dynamic` | — | keep_going value consumed by this operation. |
| `subsystem` | `dynamic` | — | subsystem value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L4016)

<a id="function-function-apply-rename-symbol-function-apply-rename-symbol-st-word-new-name-src-main-ml-1602537454"></a>
### _apply_rename_symbol

```ml
function _apply_rename_symbol(st, word, new_name)
```

Apply a symbol rename to project files.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `word` | `dynamic` | — | word value consumed by this operation. |
| `new_name` | `dynamic` | — | new_name value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L5623)

<a id="function-function-apply-syntax-highlight-function-apply-syntax-highlight-st-src-main-ml-1922084294"></a>
### _apply_syntax_highlight

```ml
function _apply_syntax_highlight(st)
```

Apply syntax highlight.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L1945)

<a id="function-function-apply-theme-function-apply-theme-st-src-main-ml-8455698"></a>
### _apply_theme

```ml
function _apply_theme(st)
```

Apply theme.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L2216)

<a id="function-function-assistant-append-function-assistant-append-st-role-text-src-main-ml-260957019"></a>
### _assistant_append

```ml
function _assistant_append(st, role, text)
```

Append text to the assistant transcript.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `role` | `dynamic` | — | role value consumed by this operation. |
| `text` | `dynamic` | — | Text consumed by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L996)

<a id="function-function-assistant-diagnostics-text-function-assistant-diagnostics-text-st-src-main-ml-2071938194"></a>
### _assistant_diagnostics_text

```ml
function _assistant_diagnostics_text(st)
```

Return project diagnostics in assistant-friendly text form.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L1124)

<a id="function-function-assistant-execute-tool-call-function-assistant-execute-tool-call-st-call-src-main-ml-1969974418"></a>
### _assistant_execute_tool_call

```ml
function _assistant_execute_tool_call(st, call)
```

Execute one assistant tool call against the current IDE state.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `call` | `dynamic` | — | call value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L1229)

<a id="function-function-assistant-execute-tool-calls-function-assistant-execute-tool-calls-st-calls-src-main-ml-439741637"></a>
### _assistant_execute_tool_calls

```ml
function _assistant_execute_tool_calls(st, calls)
```

Execute tool calls requested by the assistant model.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `calls` | `dynamic` | — | calls value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L1281)

<a id="function-function-assistant-json-arg-function-assistant-json-arg-args-name-src-main-ml-963833491"></a>
### _assistant_json_arg

```ml
function _assistant_json_arg(args, name)
```

Return a simple string argument from a JSON object produced by tool calling.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `args` | `dynamic` | — | Command-line or caller-supplied arguments. |
| `name` | `dynamic` | — | Name of the affected item. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L1014)

<a id="function-function-assistant-path-inside-project-function-assistant-path-inside-project-st-path-src-main-ml-628246135"></a>
### _assistant_path_inside_project

```ml
function _assistant_path_inside_project(st, path)
```

Return true when a resolved path stays inside the current project root.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `path` | `dynamic` | — | Path of the file or directory used by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L1021)

<a id="function-function-assistant-references-text-function-assistant-references-text-st-word-src-main-ml-2065973894"></a>
### _assistant_references_text

```ml
function _assistant_references_text(st, word)
```

Return references for a symbol in assistant-friendly text form.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `word` | `dynamic` | — | word value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L1175)

<a id="function-function-assistant-replace-in-project-file-function-assistant-replace-in-project-file-st-rel-path-old-text-new-text-src-main-ml-325833132"></a>
### _assistant_replace_in_project_file

```ml
function _assistant_replace_in_project_file(st, rel_path, old_text, new_text)
```

Replace exact text in a project file for small assistant edits.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `rel_path` | `dynamic` | — | Path associated with rel. |
| `old_text` | `dynamic` | — | old_text value consumed by this operation. |
| `new_text` | `dynamic` | — | new_text value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L1103)

<a id="function-function-assistant-resolve-project-tool-path-function-assistant-resolve-project-tool-path-st-rel-path-src-main-ml-1278915215"></a>
### _assistant_resolve_project_tool_path

```ml
function _assistant_resolve_project_tool_path(st, rel_path)
```

Resolve a tool path against the project root and reject paths outside it.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `rel_path` | `dynamic` | — | Path associated with rel. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L1038)

<a id="function-function-assistant-selection-text-function-assistant-selection-text-st-src-main-ml-848158542"></a>
### _assistant_selection_text

```ml
function _assistant_selection_text(st)
```

Return current selection or cursor context.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L1197)

<a id="function-function-assistant-send-function-assistant-send-st-src-main-ml-775016238"></a>
### _assistant_send

```ml
function _assistant_send(st)
```

Handle one assistant prompt through local read-only tooling.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L1327)

<a id="function-function-assistant-show-context-function-assistant-show-context-st-src-main-ml-2096636560"></a>
### _assistant_show_context

```ml
function _assistant_show_context(st)
```

Show assistant tool context in the assistant panel.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L1392)

<a id="function-function-assistant-symbols-text-function-assistant-symbols-text-st-query-src-main-ml-434226332"></a>
### _assistant_symbols_text

```ml
function _assistant_symbols_text(st, query)
```

Return project symbols matching a query in assistant-friendly text form.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `query` | `dynamic` | — | query value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L1157)

<a id="function-function-assistant-sync-written-file-function-assistant-sync-written-file-st-path-text-src-main-ml-1955420686"></a>
### _assistant_sync_written_file

```ml
function _assistant_sync_written_file(st, path, text)
```

Keep open editor state in sync after an assistant file write.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `path` | `dynamic` | — | Path of the file or directory used by the operation. |
| `text` | `dynamic` | — | Text consumed by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L1059)

<a id="function-function-assistant-tool-context-function-assistant-tool-context-st-src-main-ml-1205491374"></a>
### _assistant_tool_context

```ml
function _assistant_tool_context(st)
```

Return the current assistant tool context assembled by the AI module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L1007)

<a id="function-function-assistant-write-project-file-function-assistant-write-project-file-st-rel-path-content-src-main-ml-1077274930"></a>
### _assistant_write_project_file

```ml
function _assistant_write_project_file(st, rel_path, content)
```

Write an assistant-provided project file after project-boundary validation.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `rel_path` | `dynamic` | — | Path associated with rel. |
| `content` | `dynamic` | — | content value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L1084)

<a id="function-function-assistant-write-tools-enabled-function-assistant-write-tools-enabled-st-src-main-ml-1874810510"></a>
### _assistant_write_tools_enabled

```ml
function _assistant_write_tools_enabled(st)
```

Return true when assistant tools may modify project files.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L1049)

<a id="function-function-autocomplete-function-autocomplete-st-src-main-ml-1355203952"></a>
### _autocomplete

```ml
function _autocomplete(st)
```

Return the autocomplete.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L4579)

<a id="function-function-basename-function-basename-path-src-main-ml-1671612980"></a>
### _basename

```ml
function _basename(path)
```

Return the file name portion of a path.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `dynamic` | — | Path of the file or directory used by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L679)

<a id="function-function-build-project-function-build-project-st-src-main-ml-817561290"></a>
### _build_project

```ml
function _build_project(st)
```

Build project.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L2965)

<a id="function-function-button-hit-function-button-hit-st-mx-my-src-main-ml-1366445461"></a>
### _button_hit

```ml
function _button_hit(st, mx, my)
```

Return the toolbar command at a mouse position.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `mx` | `dynamic` | — | mx value consumed by this operation. |
| `my` | `dynamic` | — | my value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L6709)

<a id="function-function-caret-status-text-function-caret-status-text-st-src-main-ml-1924560030"></a>
### _caret_status_text

```ml
function _caret_status_text(st)
```

Return the caret status text.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L7523)

<a id="function-function-check-editor-dirty-function-check-editor-dirty-st-src-main-ml-2093041946"></a>
### _check_editor_dirty

```ml
function _check_editor_dirty(st)
```

Check editor dirty.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L2592)

<a id="function-function-clean-project-function-clean-project-st-src-main-ml-1882043930"></a>
### _clean_project

```ml
function _clean_project(st)
```

Clean project.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L3042)

<a id="function-function-close-all-tabs-function-close-all-tabs-st-src-main-ml-236750150"></a>
### _close_all_tabs

```ml
function _close_all_tabs(st)
```

Close all tabs.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L6993)

<a id="function-function-close-current-tab-function-close-current-tab-st-src-main-ml-1932962966"></a>
### _close_current_tab

```ml
function _close_current_tab(st)
```

Close the active editor tab.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L6926)

<a id="function-function-close-other-tabs-function-close-other-tabs-st-src-main-ml-2031262628"></a>
### _close_other_tabs

```ml
function _close_other_tabs(st)
```

Close other tabs.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L6932)

<a id="function-function-close-tab-function-close-tab-st-idx-src-main-ml-1621358731"></a>
### _close_tab

```ml
function _close_tab(st, idx)
```

Close tab.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `idx` | `dynamic` | — | idx value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L6838)

<a id="function-function-command-palette-ids-function-command-palette-ids-src-main-ml-1880811487"></a>
### _command_palette_ids

```ml
function _command_palette_ids()
```

Return the command IDs exposed by the command palette.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L4606)

<a id="function-function-completion-display-text-function-completion-display-text-st-item-src-main-ml-515642563"></a>
### _completion_display_text

```ml
function _completion_display_text(st, item)
```

Return the popup display text for a completion item.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `item` | `dynamic` | — | item value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L4522)

<a id="function-function-completion-insert-text-function-completion-insert-text-item-prefix-src-main-ml-1807631268"></a>
### _completion_insert_text

```ml
function _completion_insert_text(item, prefix)
```

Return the text to insert for a completion item.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `item` | `dynamic` | — | item value consumed by this operation. |
| `prefix` | `dynamic` | — | prefix value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L4535)

<a id="function-function-completion-item-label-function-completion-item-label-item-src-main-ml-2080472914"></a>
### _completion_item_label

```ml
function _completion_item_label(item)
```

Return the user-facing label for a completion item.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `item` | `dynamic` | — | item value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L4509)

<a id="function-function-confirm-exit-with-dirty-tabs-function-confirm-exit-with-dirty-tabs-st-src-main-ml-499743044"></a>
### _confirm_exit_with_dirty_tabs

```ml
function _confirm_exit_with_dirty_tabs(st)
```

Confirm exit with dirty tabs.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L2775)

<a id="function-function-copy-path-recursive-function-copy-path-recursive-src-dest-src-main-ml-207467447"></a>
### _copy_path_recursive

```ml
function _copy_path_recursive(src, dest)
```

Copy path recursive.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `src` | `dynamic` | — | src value consumed by this operation. |
| `dest` | `dynamic` | — | dest value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L7161)

<a id="function-function-copy-tree-item-function-copy-tree-item-st-src-main-ml-1550352320"></a>
### _copy_tree_item

```ml
function _copy_tree_item(st)
```

Copy tree item.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L7371)

<a id="function-function-create-editor-function-create-editor-parent-font-src-main-ml-798446928"></a>
### _create_editor

```ml
function _create_editor(parent, font)
```

Create editor.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `parent` | `dynamic` | — | parent value consumed by this operation. |
| `font` | `dynamic` | — | font value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L6349)

<a id="function-function-create-line-numbers-function-create-line-numbers-parent-font-src-main-ml-1918632612"></a>
### _create_line_numbers

```ml
function _create_line_numbers(parent, font)
```

Create line numbers.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `parent` | `dynamic` | — | parent value consumed by this operation. |
| `font` | `dynamic` | — | font value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L6379)

<a id="function-function-create-log-function-create-log-parent-font-src-main-ml-1708949064"></a>
### _create_log

```ml
function _create_log(parent, font)
```

Create log.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `parent` | `dynamic` | — | parent value consumed by this operation. |
| `font` | `dynamic` | — | font value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L6364)

<a id="function-function-create-markdown-view-function-create-markdown-view-st-src-main-ml-1132134868"></a>
### _create_markdown_view

```ml
function _create_markdown_view(st)
```

Create a hidden RichEdit view used to cache one rendered Markdown tab.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L841)

<a id="function-function-create-menu-label-function-create-menu-label-parent-font-text-src-main-ml-2123584745"></a>
### _create_menu_label

```ml
function _create_menu_label(parent, font, text)
```

Create menu label.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `parent` | `dynamic` | — | parent value consumed by this operation. |
| `font` | `dynamic` | — | font value consumed by this operation. |
| `text` | `dynamic` | — | Text consumed by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L6436)

<a id="function-function-create-menus-function-create-menus-src-main-ml-1273555695"></a>
### _create_menus

```ml
function _create_menus()
```

Create menus.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L2289)

<a id="function-function-create-state-function-create-state-root-src-main-ml-1123921625"></a>
### _create_state

```ml
function _create_state(root)
```

Create state.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `root` | `dynamic` | — | root value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L6447)

<a id="function-function-create-tab-strip-function-create-tab-strip-parent-font-src-main-ml-247631016"></a>
### _create_tab_strip

```ml
function _create_tab_strip(parent, font)
```

Create tab strip.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `parent` | `dynamic` | — | parent value consumed by this operation. |
| `font` | `dynamic` | — | font value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L6394)

<a id="function-function-create-toolbar-button-function-create-toolbar-button-parent-font-text-control-id-src-main-ml-504411872"></a>
### _create_toolbar_button

```ml
function _create_toolbar_button(parent, font, text, control_id)
```

Create toolbar button.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `parent` | `dynamic` | — | parent value consumed by this operation. |
| `font` | `dynamic` | — | font value consumed by this operation. |
| `text` | `dynamic` | — | Text consumed by the operation. |
| `control_id` | `dynamic` | — | Identifier of control. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L6405)

<a id="function-function-create-toolbar-icon-function-create-toolbar-icon-parent-font-glyph-code-src-main-ml-159154770"></a>
### _create_toolbar_icon

```ml
function _create_toolbar_icon(parent, font, glyph_code)
```

Create toolbar icon.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `parent` | `dynamic` | — | parent value consumed by this operation. |
| `font` | `dynamic` | — | font value consumed by this operation. |
| `glyph_code` | `dynamic` | — | glyph_code value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L6419)

<a id="function-function-ctrl-down-function-ctrl-down-src-main-ml-976891319"></a>
### _ctrl_down

```ml
function _ctrl_down()
```

Return the control down.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L6691)

<a id="function-function-current-nav-location-function-current-nav-location-st-src-main-ml-600292210"></a>
### _current_nav_location

```ml
function _current_nav_location(st)
```

Return the current editor location for navigation history.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L1410)

<a id="function-function-default-root-function-default-root-args-src-main-ml-312573278"></a>
### _default_root

```ml
function _default_root(args)
```

Return the default project root used at startup.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `args` | `dynamic` | — | Command-line or caller-supplied arguments. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L8525)

<a id="function-function-delete-path-recursive-function-delete-path-recursive-path-src-main-ml-2062469630"></a>
### _delete_path_recursive

```ml
function _delete_path_recursive(path)
```

Delete path recursive.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `dynamic` | — | Path of the file or directory used by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L7188)

<a id="function-function-delete-tree-item-function-delete-tree-item-st-src-main-ml-778002360"></a>
### _delete_tree_item

```ml
function _delete_tree_item(st)
```

Delete tree item.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L7356)

<a id="function-function-destroy-all-markdown-views-function-destroy-all-markdown-views-st-src-main-ml-559407690"></a>
### _destroy_all_markdown_views

```ml
function _destroy_all_markdown_views(st)
```

Destroy all cached Markdown views.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L859)

<a id="function-function-destroy-markdown-view-function-destroy-markdown-view-view-src-main-ml-706470744"></a>
### _destroy_markdown_view

```ml
function _destroy_markdown_view(view)
```

Destroy a cached Markdown view when its tab is removed.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `view` | `dynamic` | — | view value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L853)

<a id="function-function-diagnostic-near-log-line-function-diagnostic-near-log-line-lines-line-idx-src-main-ml-321296060"></a>
### _diagnostic_near_log_line

```ml
function _diagnostic_near_log_line(lines, line_idx)
```

Find the diagnostic associated with a result-log line.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `lines` | `dynamic` | — | lines value consumed by this operation. |
| `line_idx` | `dynamic` | — | line_idx value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L1626)

<a id="function-function-dirty-tab-names-function-dirty-tab-names-st-src-main-ml-1958523406"></a>
### _dirty_tab_names

```ml
function _dirty_tab_names(st)
```

Return the dirty tab names.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L2743)

<a id="function-function-display-to-source-line-function-display-to-source-line-text-folds-display-line-src-main-ml-578233489"></a>
### _display_to_source_line

```ml
function _display_to_source_line(text, folds, display_line)
```

Map a visible editor line back to its original source line.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed by the operation. |
| `folds` | `dynamic` | — | folds value consumed by this operation. |
| `display_line` | `dynamic` | — | display_line value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L1789)

<a id="function-function-edit-copy-function-edit-copy-st-src-main-ml-933702714"></a>
### _edit_copy

```ml
function _edit_copy(st)
```

Send the copy operation to a edit control.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L6230)

<a id="function-function-edit-cut-function-edit-cut-st-src-main-ml-1319391898"></a>
### _edit_cut

```ml
function _edit_cut(st)
```

Send the cut operation to a edit control.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L6221)

<a id="function-function-edit-paste-function-edit-paste-st-src-main-ml-1669736348"></a>
### _edit_paste

```ml
function _edit_paste(st)
```

Send the paste operation to a edit control.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L6238)

<a id="function-function-edit-redo-function-edit-redo-st-src-main-ml-79510078"></a>
### _edit_redo

```ml
function _edit_redo(st)
```

Send the redo operation to a edit control.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L6296)

<a id="function-function-edit-select-all-function-edit-select-all-st-src-main-ml-2037089086"></a>
### _edit_select_all

```ml
function _edit_select_all(st)
```

Send the select all operation to a edit control.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L6247)

<a id="function-function-edit-undo-function-edit-undo-st-src-main-ml-2128150322"></a>
### _edit_undo

```ml
function _edit_undo(st)
```

Send the undo operation to a edit control.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L6279)

<a id="function-function-editor-display-text-function-editor-display-text-text-src-main-ml-1839864682"></a>
### _editor_display_text

```ml
function _editor_display_text(text)
```

Convert internal editor text to the display form expected by RichEdit.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L1683)

<a id="function-function-effective-compiler-function-effective-compiler-st-src-main-ml-1703856018"></a>
### _effective_compiler

```ml
function _effective_compiler(st)
```

Return the effective compiler.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L2209)

<a id="function-function-ensure-markdown-view-slots-function-ensure-markdown-view-slots-st-src-main-ml-1258654872"></a>
### _ensure_markdown_view_slots

```ml
function _ensure_markdown_view_slots(st)
```

Ensure the Markdown view cache arrays match the open tab list.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L869)

<a id="function-function-entry-file-function-entry-file-p-src-main-ml-1659885693"></a>
### _entry_file

```ml
function _entry_file(p)
```

Return the entry file.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | p value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L2417)

<a id="function-function-find-fold-end-function-find-fold-end-lines-start-line-src-main-ml-1195746453"></a>
### _find_fold_end

```ml
function _find_fold_end(lines, start_line)
```

Find the matching end line for a fold starting at start_line.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `lines` | `dynamic` | — | lines value consumed by this operation. |
| `start_line` | `dynamic` | — | start_line value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L1743)

<a id="function-function-find-next-function-find-next-st-src-main-ml-1072890150"></a>
### _find_next

```ml
function _find_next(st)
```

Find next.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L6162)

<a id="function-function-find-next-in-editor-function-find-next-in-editor-st-query-src-main-ml-1321585178"></a>
### _find_next_in_editor

```ml
function _find_next_in_editor(st, query)
```

Find next in editor.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `query` | `dynamic` | — | query value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L6044)

<a id="function-function-find-references-function-find-references-st-src-main-ml-1292080110"></a>
### _find_references

```ml
function _find_references(st)
```

Find references for the current symbol-like word.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L5762)

<a id="function-function-find-symbol-function-find-symbol-index-name-src-main-ml-1841440104"></a>
### _find_symbol

```ml
function _find_symbol(index, name)
```

Find symbol.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `index` | `dynamic` | — | Zero-based index of the affected item. |
| `name` | `dynamic` | — | Name of the affected item. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L6182)

<a id="function-function-first-project-file-function-first-project-file-p-src-main-ml-377292685"></a>
### _first_project_file

```ml
function _first_project_file(p)
```

Return the first project file.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | p value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L2402)

<a id="function-function-fold-end-at-function-fold-end-at-folds-source-line-src-main-ml-126617131"></a>
### _fold_end_at

```ml
function _fold_end_at(folds, source_line)
```

Return the fold end at the requested location.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `folds` | `dynamic` | — | folds value consumed by this operation. |
| `source_line` | `dynamic` | — | source_line value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L1710)

<a id="function-function-fold-end-kind-function-fold-end-kind-line-src-main-ml-1508690901"></a>
### _fold_end_kind

```ml
function _fold_end_kind(line)
```

Return the fold end kind.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `line` | `dynamic` | — | line value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L1730)

<a id="function-function-fold-index-at-function-fold-index-at-folds-source-line-src-main-ml-732935307"></a>
### _fold_index_at

```ml
function _fold_index_at(folds, source_line)
```

Return the fold index at the requested location.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `folds` | `dynamic` | — | folds value consumed by this operation. |
| `source_line` | `dynamic` | — | source_line value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L1697)

<a id="function-function-fold-start-kind-function-fold-start-kind-line-src-main-ml-267904513"></a>
### _fold_start_kind

```ml
function _fold_start_kind(line)
```

Return the fold start kind.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `line` | `dynamic` | — | line value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L1718)

<a id="function-function-format-build-log-function-format-build-log-st-log-text-running-exit-code-src-main-ml-1097486985"></a>
### _format_build_log

```ml
function _format_build_log(st, log_text, running, exit_code)
```

Format build log.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `log_text` | `dynamic` | — | log_text value consumed by this operation. |
| `running` | `dynamic` | — | running value consumed by this operation. |
| `exit_code` | `dynamic` | — | exit_code value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L3101)

<a id="function-function-format-current-function-format-current-st-src-main-ml-1359701830"></a>
### _format_current

```ml
function _format_current(st)
```

Format current.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L4456)

<a id="function-function-format-text-basic-function-format-text-basic-text-src-main-ml-335668342"></a>
### _format_text_basic

```ml
function _format_text_basic(text)
```

Format text basic.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L4432)

<a id="function-function-goto-bookmark-function-goto-bookmark-st-step-src-main-ml-531822804"></a>
### _goto_bookmark

```ml
function _goto_bookmark(st, step)
```

Jump to the next or previous session bookmark.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `step` | `dynamic` | — | step value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L1552)

<a id="function-function-goto-definition-function-goto-definition-st-src-main-ml-1142371270"></a>
### _goto_definition

```ml
function _goto_definition(st)
```

Move the editor caret to definition.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L6204)

<a id="function-function-goto-line-col-function-goto-line-col-st-line-no-col-no-src-main-ml-896558158"></a>
### _goto_line_col

```ml
function _goto_line_col(st, line_no, col_no)
```

Move the editor caret to line col.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `line_no` | `dynamic` | — | line_no value consumed by this operation. |
| `col_no` | `dynamic` | — | col_no value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L5887)

<a id="function-function-goto-line-number-function-goto-line-number-st-line-no-src-main-ml-889140700"></a>
### _goto_line_number

```ml
function _goto_line_number(st, line_no)
```

Move the editor caret to line number.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `line_no` | `dynamic` | — | line_no value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L5896)

<a id="function-function-guard-no-dirty-function-guard-no-dirty-st-action-name-src-main-ml-1943146140"></a>
### _guard_no_dirty

```ml
function _guard_no_dirty(st, action_name)
```

Guard no dirty.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `action_name` | `dynamic` | — | action_name value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L2766)

<a id="function-function-handle-command-function-handle-command-st-msg-src-main-ml-1588832023"></a>
### _handle_command

```ml
function _handle_command(st, msg)
```

Handle command.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `msg` | `dynamic` | — | msg value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L8014)

<a id="function-function-handle-context-menu-function-handle-context-menu-st-src-main-ml-281597994"></a>
### _handle_context_menu

```ml
function _handle_context_menu(st)
```

Handle context menu.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L7863)

<a id="function-function-handle-context-menu-at-function-handle-context-menu-at-st-mx-my-src-main-ml-1767988033"></a>
### _handle_context_menu_at

```ml
function _handle_context_menu_at(st, mx, my)
```

Handle context menu at.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `mx` | `dynamic` | — | mx value consumed by this operation. |
| `my` | `dynamic` | — | my value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L7857)

<a id="function-function-handle-context-menu-at-force-function-handle-context-menu-at-force-st-mx-my-force-src-main-ml-1819419538"></a>
### _handle_context_menu_at_force

```ml
function _handle_context_menu_at_force(st, mx, my, force)
```

Handle context menu at the force.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `mx` | `dynamic` | — | mx value consumed by this operation. |
| `my` | `dynamic` | — | my value consumed by this operation. |
| `force` | `dynamic` | — | force value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L7832)

<a id="function-function-handle-hotkeys-function-handle-hotkeys-st-src-main-ml-24960216"></a>
### _handle_hotkeys

```ml
function _handle_hotkeys(st)
```

Handle hotkeys.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L8143)

<a id="function-function-handle-left-click-function-handle-left-click-st-mx-my-src-main-ml-646818151"></a>
### _handle_left_click

```ml
function _handle_left_click(st, mx, my)
```

Handle left click.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `mx` | `dynamic` | — | mx value consumed by this operation. |
| `my` | `dynamic` | — | my value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L8298)

<a id="function-function-handle-mouse-function-handle-mouse-st-src-main-ml-1262156464"></a>
### _handle_mouse

```ml
function _handle_mouse(st)
```

Handle mouse.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L8306)

<a id="function-function-handle-notify-function-handle-notify-st-msg-src-main-ml-1036470069"></a>
### _handle_notify

```ml
function _handle_notify(st, msg)
```

Handle notify.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `msg` | `dynamic` | — | msg value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L7994)

<a id="function-function-handle-set-cursor-function-handle-set-cursor-st-msg-src-main-ml-1525399997"></a>
### _handle_set_cursor

```ml
function _handle_set_cursor(st, msg)
```

Handle set cursor.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `msg` | `dynamic` | — | msg value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L8058)

<a id="function-function-handle-syscommand-function-handle-syscommand-st-msg-src-main-ml-635825021"></a>
### _handle_syscommand

```ml
function _handle_syscommand(st, msg)
```

Handle syscommand.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `msg` | `dynamic` | — | msg value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L8116)

<a id="function-function-handle-tab-click-function-handle-tab-click-st-tx-ty-src-main-ml-929207951"></a>
### _handle_tab_click

```ml
function _handle_tab_click(st, tx, ty)
```

Handle tab click.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `tx` | `dynamic` | — | tx value consumed by this operation. |
| `ty` | `dynamic` | — | ty value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L6795)

<a id="function-function-handle-tab-selection-function-handle-tab-selection-st-src-main-ml-1548112314"></a>
### _handle_tab_selection

```ml
function _handle_tab_selection(st)
```

Handle tab selection.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L6782)

<a id="function-function-handle-tree-click-function-handle-tree-click-st-clicked-mx-my-src-main-ml-949894192"></a>
### _handle_tree_click

```ml
function _handle_tree_click(st, clicked, mx, my)
```

Handle tree click.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `clicked` | `dynamic` | — | clicked value consumed by this operation. |
| `mx` | `dynamic` | — | mx value consumed by this operation. |
| `my` | `dynamic` | — | my value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L6727)

<a id="function-function-handle-window-button-function-handle-window-button-st-hit-src-main-ml-1023682507"></a>
### _handle_window_button

```ml
function _handle_window_button(st, hit)
```

Handle window button.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `hit` | `dynamic` | — | hit value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L8092)

<a id="function-function-has-dirty-tabs-function-has-dirty-tabs-st-src-main-ml-1928797524"></a>
### _has_dirty_tabs

```ml
function _has_dirty_tabs(st)
```

Return true when any open tab has unsaved changes.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L2759)

<a id="function-function-has-open-path-under-function-has-open-path-under-st-path-src-main-ml-1207731887"></a>
### _has_open_path_under

```ml
function _has_open_path_under(st, path)
```

Return true when open path under.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `path` | `dynamic` | — | Path of the file or directory used by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L7123)

<a id="function-function-hide-autocomplete-function-hide-autocomplete-st-src-main-ml-350476678"></a>
### _hide_autocomplete

```ml
function _hide_autocomplete(st)
```

Hide autocomplete.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L4471)

<a id="function-function-hide-markdown-views-except-function-hide-markdown-views-except-st-keep-idx-src-main-ml-25152705"></a>
### _hide_markdown_views_except

```ml
function _hide_markdown_views_except(st, keep_idx)
```

Hide every cached Markdown view except the requested tab.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `keep_idx` | `dynamic` | — | keep_idx value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L890)

<a id="function-function-initial-find-text-function-initial-find-text-st-src-main-ml-1869683366"></a>
### _initial_find_text

```ml
function _initial_find_text(st)
```

Return the initial find text.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L6030)

<a id="function-function-initial-symbol-search-text-function-initial-symbol-search-text-st-src-main-ml-142189424"></a>
### _initial_symbol_search_text

```ml
function _initial_symbol_search_text(st)
```

Return the initial symbol search text.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L5053)

<a id="function-function-invalidate-highlight-function-invalidate-highlight-st-src-main-ml-2127992256"></a>
### _invalidate_highlight

```ml
function _invalidate_highlight(st)
```

Clear cached syntax highlighting so it will be recomputed.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L791)

<a id="function-function-invalidate-markdown-view-function-invalidate-markdown-view-st-idx-src-main-ml-1398792731"></a>
### _invalidate_markdown_view

```ml
function _invalidate_markdown_view(st, idx)
```

Mark one cached Markdown view stale without destroying the rendered document cache.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `idx` | `dynamic` | — | idx value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L902)

<a id="function-function-is-abs-function-is-abs-path-src-main-ml-1295470934"></a>
### _is_abs

```ml
function _is_abs(path)
```

Return true when a path is already absolute.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `dynamic` | — | Path of the file or directory used by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L662)

<a id="function-function-is-generated-editor-path-function-is-generated-editor-path-path-src-main-ml-1104378632"></a>
### _is_generated_editor_path

```ml
function _is_generated_editor_path(path)
```

Return true when a tab shows generated editor text instead of editable source.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `dynamic` | — | Path of the file or directory used by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L719)

<a id="function-function-is-markdown-path-function-is-markdown-path-path-src-main-ml-386481376"></a>
### _is_markdown_path

```ml
function _is_markdown_path(path)
```

Return true when a path names a Markdown document.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `dynamic` | — | Path of the file or directory used by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L705)

<a id="function-function-is-readonly-tab-path-function-is-readonly-tab-path-path-src-main-ml-610721950"></a>
### _is_readonly_tab_path

```ml
function _is_readonly_tab_path(path)
```

Return true when a tab path is read-only.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `dynamic` | — | Path of the file or directory used by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L713)

<a id="function-function-is-test-file-path-function-is-test-file-path-path-src-main-ml-287009850"></a>
### _is_test_file_path

```ml
function _is_test_file_path(path)
```

Return true when a path looks like a MiniLang test file.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `dynamic` | — | Path of the file or directory used by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L3004)

<a id="function-function-is-virtual-doc-path-function-is-virtual-doc-path-path-src-main-ml-1200992914"></a>
### _is_virtual_doc_path

```ml
function _is_virtual_doc_path(path)
```

Return true when a path refers to a built-in virtual document.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `dynamic` | — | Path of the file or directory used by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L699)

<a id="function-function-is-word-char-function-is-word-char-ch-src-main-ml-1018606672"></a>
### _is_word_char

```ml
function _is_word_char(ch)
```

Return true when a character belongs to an editor word.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ch` | `dynamic` | — | ch value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L4371)

<a id="function-function-join-imports-function-join-imports-imports-src-main-ml-530298815"></a>
### _join_imports

```ml
function _join_imports(imports)
```

Join imports.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `imports` | `dynamic` | — | imports value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L2277)

<a id="function-function-jump-to-line-col-function-jump-to-line-col-st-line-no-col-no-src-main-ml-1027528648"></a>
### _jump_to_line_col

```ml
function _jump_to_line_col(st, line_no, col_no)
```

Move the editor caret to line col.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `line_no` | `dynamic` | — | line_no value consumed by this operation. |
| `col_no` | `dynamic` | — | col_no value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L5864)

<a id="function-function-key-pressed-function-key-pressed-st-vk-src-main-ml-744012791"></a>
### _key_pressed

```ml
function _key_pressed(st, vk)
```

Return the key pressed.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `vk` | `dynamic` | — | vk value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L6682)

<a id="function-function-language-help-path-function-language-help-path-st-src-main-ml-1596887068"></a>
### _language_help_path

```ml
function _language_help_path(st)
```

Return the language help path.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L4250)

<a id="function-function-layout-function-layout-st-src-main-ml-191920880"></a>
### _layout

```ml
function _layout(st)
```

Resize and position all child controls for the current window size.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L6587)

<a id="function-function-line-label-function-line-label-line-no-marker-src-main-ml-1249255787"></a>
### _line_label

```ml
function _line_label(line_no, marker)
```

Return the line label.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `line_no` | `dynamic` | — | line_no value consumed by this operation. |
| `marker` | `dynamic` | — | marker value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L7453)

<a id="function-function-live-diagnostics-key-function-live-diagnostics-key-st-src-main-ml-1122687862"></a>
### _live_diagnostics_key

```ml
function _live_diagnostics_key(st)
```

Return a key that invalidates the active-file live diagnostics cache.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L7538)

<a id="function-function-load-assistant-allow-insecure-tls-function-load-assistant-allow-insecure-tls-p-src-main-ml-858354285"></a>
### _load_assistant_allow_insecure_tls

```ml
function _load_assistant_allow_insecure_tls(p)
```

Load whether assistant HTTPS certificate validation may be relaxed.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | p value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L2121)

<a id="function-function-load-assistant-api-key-function-load-assistant-api-key-p-src-main-ml-1526661587"></a>
### _load_assistant_api_key

```ml
function _load_assistant_api_key(p)
```

Load the optional direct assistant API key.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | p value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L2103)

<a id="function-function-load-assistant-api-key-env-function-load-assistant-api-key-env-p-src-main-ml-1049790111"></a>
### _load_assistant_api_key_env

```ml
function _load_assistant_api_key_env(p)
```

Load assistant API key environment variable name.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | p value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L2097)

<a id="function-function-load-assistant-api-key-mode-function-load-assistant-api-key-mode-p-src-main-ml-1414728929"></a>
### _load_assistant_api_key_mode

```ml
function _load_assistant_api_key_mode(p)
```

Load whether the assistant API key is read from an environment variable or config.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | p value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L2091)

<a id="function-function-load-assistant-base-url-function-load-assistant-base-url-p-src-main-ml-508941741"></a>
### _load_assistant_base_url

```ml
function _load_assistant_base_url(p)
```

Load assistant base URL.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | p value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L2085)

<a id="function-function-load-assistant-model-function-load-assistant-model-p-src-main-ml-9244233"></a>
### _load_assistant_model

```ml
function _load_assistant_model(p)
```

Load assistant model.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | p value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L2109)

<a id="function-function-load-assistant-provider-function-load-assistant-provider-p-src-main-ml-966527369"></a>
### _load_assistant_provider

```ml
function _load_assistant_provider(p)
```

Load assistant provider.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | p value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L2079)

<a id="function-function-load-assistant-tool-mode-function-load-assistant-tool-mode-p-src-main-ml-415087275"></a>
### _load_assistant_tool_mode

```ml
function _load_assistant_tool_mode(p)
```

Load assistant tool mode.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | p value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L2115)

<a id="function-function-load-build-config-function-load-build-config-st-src-main-ml-1579889566"></a>
### _load_build_config

```ml
function _load_build_config(st)
```

Load build configuration.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L2127)

<a id="function-function-load-build-extra-args-function-load-build-extra-args-p-src-main-ml-1647935005"></a>
### _load_build_extra_args

```ml
function _load_build_extra_args(p)
```

Load build extra args.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | p value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L2073)

<a id="function-function-load-build-keep-going-function-load-build-keep-going-p-src-main-ml-1384310777"></a>
### _load_build_keep_going

```ml
function _load_build_keep_going(p)
```

Load build keep going.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | p value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L2051)

<a id="function-function-load-build-max-errors-function-load-build-max-errors-p-src-main-ml-1558007649"></a>
### _load_build_max_errors

```ml
function _load_build_max_errors(p)
```

Load build max errors.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | p value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L2057)

<a id="function-function-load-build-profile-function-load-build-profile-p-src-main-ml-868623209"></a>
### _load_build_profile

```ml
function _load_build_profile(p)
```

Load build profile.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | p value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L2017)

<a id="function-function-load-build-subsystem-function-load-build-subsystem-p-src-main-ml-1499050301"></a>
### _load_build_subsystem

```ml
function _load_build_subsystem(p)
```

Load build subsystem.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | p value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L2065)

<a id="function-function-load-compiler-path-function-load-compiler-path-p-src-main-ml-844049375"></a>
### _load_compiler_path

```ml
function _load_compiler_path(p)
```

Load compiler path.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | p value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L2045)

<a id="function-function-load-msftedit-function-load-msftedit-src-main-ml-174168159"></a>
### _load_msftedit

```ml
function _load_msftedit()
```

Load RichEdit library.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L6341)

<a id="function-function-load-theme-mode-function-load-theme-mode-p-src-main-ml-2139519421"></a>
### _load_theme_mode

```ml
function _load_theme_mode(p)
```

Load theme mode.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | p value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L2025)

<a id="function-function-log-clear-function-log-clear-st-src-main-ml-1544598422"></a>
### _log_clear

```ml
function _log_clear(st)
```

Return the log clear.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L6328)

<a id="function-function-log-copy-function-log-copy-st-src-main-ml-235302320"></a>
### _log_copy

```ml
function _log_copy(st)
```

Return the log copy.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L6312)

<a id="function-function-log-diagnostic-at-function-log-diagnostic-at-st-x-y-src-main-ml-39743723"></a>
### _log_diagnostic_at

```ml
function _log_diagnostic_at(st, x, y)
```

Return the log diagnostic at the requested location.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `x` | `dynamic` | — | Horizontal coordinate used by the operation. |
| `y` | `dynamic` | — | Vertical coordinate used by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L1657)

<a id="function-function-log-lines-function-log-lines-text-src-main-ml-714716210"></a>
### _log_lines

```ml
function _log_lines(text)
```

Split the result log into individual display lines.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L1616)

<a id="function-function-log-select-all-function-log-select-all-st-src-main-ml-1438328266"></a>
### _log_select_all

```ml
function _log_select_all(st)
```

Return the log select all.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L6320)

<a id="function-function-mark-active-dirty-pending-function-mark-active-dirty-pending-st-src-main-ml-40573402"></a>
### _mark_active_dirty_pending

```ml
function _mark_active_dirty_pending(st)
```

Mark the active tab dirty after a pending editor notification.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L912)

<a id="function-function-markdown-view-is-live-function-markdown-view-is-live-view-src-main-ml-1243441284"></a>
### _markdown_view_is_live

```ml
function _markdown_view_is_live(view)
```

Return true when a cached Markdown view handle is still a live window.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `view` | `dynamic` | — | view value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L834)

<a id="function-function-mask-secret-function-mask-secret-text-src-main-ml-221373266"></a>
### _mask_secret

```ml
function _mask_secret(text)
```

Return a redacted value for secrets shown in diagnostics dialogs.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L3572)

<a id="function-function-menu-label-index-for-hwnd-function-menu-label-index-for-hwnd-st-hwnd-src-main-ml-760173663"></a>
### _menu_label_index_for_hwnd

```ml
function _menu_label_index_for_hwnd(st, hwnd)
```

Return the menu label index for a window handle.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `hwnd` | `dynamic` | — | hwnd value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L7697)

<a id="function-function-module-source-function-module-source-path-src-main-ml-680738110"></a>
### _module_source

```ml
function _module_source(path)
```

Return the module source.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `dynamic` | — | Path of the file or directory used by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L7147)

<a id="function-function-mouse-over-log-diagnostic-function-mouse-over-log-diagnostic-st-x-y-src-main-ml-33962299"></a>
### _mouse_over_log_diagnostic

```ml
function _mouse_over_log_diagnostic(st, x, y)
```

Return true when the mouse is over a clickable log diagnostic.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `x` | `dynamic` | — | Horizontal coordinate used by the operation. |
| `y` | `dynamic` | — | Vertical coordinate used by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L1668)

<a id="function-function-move-command-palette-selection-function-move-command-palette-selection-command-list-visible-ids-delta-src-main-ml-1530093710"></a>
### _move_command_palette_selection

```ml
function _move_command_palette_selection(command_list, visible_ids, delta)
```

Move the selected command palette row.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `command_list` | `dynamic` | — | command_list value consumed by this operation. |
| `visible_ids` | `dynamic` | — | visible_ids value consumed by this operation. |
| `delta` | `dynamic` | — | delta value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L4664)

<a id="function-function-move-menu-label-function-move-menu-label-st-idx-x-w-src-main-ml-232880692"></a>
### _move_menu_label

```ml
function _move_menu_label(st, idx, x, w)
```

Move menu label.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `idx` | `dynamic` | — | idx value consumed by this operation. |
| `x` | `dynamic` | — | Horizontal coordinate used by the operation. |
| `w` | `dynamic` | — | w value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L6576)

<a id="function-function-move-toolbar-icon-function-move-toolbar-icon-st-idx-x-y-src-main-ml-725857222"></a>
### _move_toolbar_icon

```ml
function _move_toolbar_icon(st, idx, x, y)
```

Move toolbar icon.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `idx` | `dynamic` | — | idx value consumed by this operation. |
| `x` | `dynamic` | — | Horizontal coordinate used by the operation. |
| `y` | `dynamic` | — | Vertical coordinate used by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L6562)

<a id="function-function-navigate-back-function-navigate-back-st-src-main-ml-884770530"></a>
### _navigate_back

```ml
function _navigate_back(st)
```

Navigate backward through jump history.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L1480)

<a id="function-function-navigate-forward-function-navigate-forward-st-src-main-ml-1880854766"></a>
### _navigate_forward

```ml
function _navigate_forward(st)
```

Navigate forward through jump history.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L1492)

<a id="function-function-new-project-create-from-dialog-function-new-project-create-from-dialog-dlg-name-edit-parent-edit-kind-combo-default-parent-src-main-ml-151921598"></a>
### _new_project_create_from_dialog

```ml
function _new_project_create_from_dialog(dlg, name_edit, parent_edit, kind_combo, default_parent)
```

Try to create a project from the New Project dialog fields.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dlg` | `dynamic` | — | dlg value consumed by this operation. |
| `name_edit` | `dynamic` | — | name_edit value consumed by this operation. |
| `parent_edit` | `dynamic` | — | parent_edit value consumed by this operation. |
| `kind_combo` | `dynamic` | — | kind_combo value consumed by this operation. |
| `default_parent` | `dynamic` | — | default_parent value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L3331)

<a id="function-function-new-standard-project-function-new-standard-project-st-src-main-ml-2134624164"></a>
### _new_standard_project

```ml
function _new_standard_project(st)
```

Create standard project.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L3364)

<a id="function-function-new-tree-file-function-new-tree-file-st-src-main-ml-392739830"></a>
### _new_tree_file

```ml
function _new_tree_file(st)
```

Create tree file.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L7209)

<a id="function-function-new-tree-folder-function-new-tree-folder-st-src-main-ml-1977349258"></a>
### _new_tree_folder

```ml
function _new_tree_folder(st)
```

Create tree folder.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L7233)

<a id="function-function-new-tree-test-file-function-new-tree-test-file-st-src-main-ml-484405178"></a>
### _new_tree_test_file

```ml
function _new_tree_test_file(st)
```

Create tree test file.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L7221)

<a id="function-function-norm-path-key-function-norm-path-key-path-src-main-ml-1469665026"></a>
### _norm_path_key

```ml
function _norm_path_key(path)
```

Return the norm path key.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `dynamic` | — | Path of the file or directory used by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L7102)

<a id="function-function-normalize-editor-text-function-normalize-editor-text-text-src-main-ml-1899146826"></a>
### _normalize_editor_text

```ml
function _normalize_editor_text(text)
```

Normalize editor text so RichEdit and MiniLang use the same line endings.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L1674)

<a id="function-function-normalize-project-kind-function-normalize-project-kind-value-src-main-ml-591124080"></a>
### _normalize_project_kind

```ml
function _normalize_project_kind(value)
```

Normalize project kind.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value consumed or transformed by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L3310)

<a id="function-function-on-off-function-on-off-value-src-main-ml-946182698"></a>
### _on_off

```ml
function _on_off(value)
```

Return a compact On/Off label for toggle buttons.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value consumed or transformed by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L3705)

<a id="function-function-open-assistant-settings-window-function-open-assistant-settings-window-st-src-main-ml-303035896"></a>
### _open_assistant_settings_window

```ml
function _open_assistant_settings_window(st)
```

Open assistant settings window.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L3820)

<a id="function-function-open-command-palette-function-open-command-palette-st-src-main-ml-729060748"></a>
### _open_command_palette

```ml
function _open_command_palette(st)
```

Open command palette window.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L4686)

<a id="function-function-open-compile-settings-window-function-open-compile-settings-window-st-src-main-ml-1999713518"></a>
### _open_compile_settings_window

```ml
function _open_compile_settings_window(st)
```

Open compile settings window.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L4069)

<a id="function-function-open-file-function-open-file-st-path-src-main-ml-200777679"></a>
### _open_file

```ml
function _open_file(st, path)
```

Open file.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `path` | `dynamic` | — | Path of the file or directory used by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L2517)

<a id="function-function-open-file-structure-window-function-open-file-structure-window-st-src-main-ml-1715576376"></a>
### _open_file_structure_window

```ml
function _open_file_structure_window(st)
```

Show current file structure.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L5158)

<a id="function-function-open-find-window-function-open-find-window-st-src-main-ml-1508121906"></a>
### _open_find_window

```ml
function _open_find_window(st)
```

Open find window.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L6072)

<a id="function-function-open-goto-line-window-function-open-goto-line-window-st-src-main-ml-1249447094"></a>
### _open_goto_line_window

```ml
function _open_goto_line_window(st)
```

Open goto line window.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L5915)

<a id="function-function-open-goto-symbol-window-function-open-goto-symbol-window-st-src-main-ml-1726160226"></a>
### _open_goto_symbol_window

```ml
function _open_goto_symbol_window(st)
```

Open goto symbol window.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L5064)

<a id="function-function-open-language-help-function-open-language-help-st-src-main-ml-824251998"></a>
### _open_language_help

```ml
function _open_language_help(st)
```

Open language help.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L4258)

<a id="function-function-open-language-help-search-function-open-language-help-search-st-src-main-ml-1552731006"></a>
### _open_language_help_search

```ml
function _open_language_help_search(st)
```

Open language help search.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L4282)

<a id="function-function-open-log-diagnostic-at-function-open-log-diagnostic-at-st-x-y-src-main-ml-2002806539"></a>
### _open_log_diagnostic_at

```ml
function _open_log_diagnostic_at(st, x, y)
```

Open log diagnostic at.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `x` | `dynamic` | — | Horizontal coordinate used by the operation. |
| `y` | `dynamic` | — | Vertical coordinate used by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L1647)

<a id="function-function-open-nav-location-function-open-nav-location-st-loc-src-main-ml-1124933600"></a>
### _open_nav_location

```ml
function _open_nav_location(st, loc)
```

Open a navigation location without recording a new history entry.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `loc` | `dynamic` | — | loc value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L1472)

<a id="function-function-open-problem-location-function-open-problem-location-st-file-line-no-col-no-src-main-ml-223425820"></a>
### _open_problem_location

```ml
function _open_problem_location(st, file, line_no, col_no)
```

Open problem location.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `file` | `dynamic` | — | file value consumed by this operation. |
| `line_no` | `dynamic` | — | line_no value consumed by this operation. |
| `col_no` | `dynamic` | — | col_no value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L1587)

<a id="function-function-open-project-dialog-function-open-project-dialog-st-src-main-ml-508812574"></a>
### _open_project_dialog

```ml
function _open_project_dialog(st)
```

Open project dialog.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L3302)

<a id="function-function-open-project-file-function-open-project-file-st-path-src-main-ml-1162812783"></a>
### _open_project_file

```ml
function _open_project_file(st, path)
```

Open project file.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `path` | `dynamic` | — | Path of the file or directory used by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L3243)

<a id="function-function-open-quick-open-window-function-open-quick-open-window-st-src-main-ml-202808096"></a>
### _open_quick_open_window

```ml
function _open_quick_open_window(st)
```

Open quick file window.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L4883)

<a id="function-function-open-rename-symbol-window-function-open-rename-symbol-window-st-src-main-ml-194826070"></a>
### _open_rename_symbol_window

```ml
function _open_rename_symbol_window(st)
```

Open rename symbol preview window.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L5644)

<a id="function-function-open-result-selection-function-open-result-selection-st-src-main-ml-725046766"></a>
### _open_result_selection

```ml
function _open_result_selection(st)
```

Open result selection.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L1601)

<a id="function-function-open-selected-tree-file-function-open-selected-tree-file-st-src-main-ml-333962654"></a>
### _open_selected_tree_file

```ml
function _open_selected_tree_file(st)
```

Open selected tree file.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L6805)

<a id="function-function-open-tree-file-at-function-open-tree-file-at-st-mx-my-src-main-ml-429161815"></a>
### _open_tree_file_at

```ml
function _open_tree_file_at(st, mx, my)
```

Open tree file at.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `mx` | `dynamic` | — | mx value consumed by this operation. |
| `my` | `dynamic` | — | my value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L6770)

<a id="function-function-open-tree-file-index-function-open-tree-file-index-st-idx-src-main-ml-1187143927"></a>
### _open_tree_file_index

```ml
function _open_tree_file_index(st, idx)
```

Open tree file index.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `idx` | `dynamic` | — | idx value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L6757)

<a id="function-function-open-virtual-tab-function-open-virtual-tab-st-path-text-src-main-ml-2044004648"></a>
### _open_virtual_tab

```ml
function _open_virtual_tab(st, path, text)
```

Open virtual tab.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `path` | `dynamic` | — | Path of the file or directory used by the operation. |
| `text` | `dynamic` | — | Text consumed by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L2553)

<a id="function-function-paste-tree-item-function-paste-tree-item-st-src-main-ml-661176362"></a>
### _paste_tree_item

```ml
function _paste_tree_item(st)
```

Paste tree item.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L7381)

<a id="function-function-path-index-function-path-index-paths-path-src-main-ml-175101182"></a>
### _path_index

```ml
function _path_index(paths, path)
```

Return the index of a path in an array, or -1 when absent.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `paths` | `dynamic` | — | paths value consumed by this operation. |
| `path` | `dynamic` | — | Path of the file or directory used by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L686)

<a id="function-function-perform-command-function-perform-command-st-id-src-main-ml-1331466893"></a>
### _perform_command

```ml
function _perform_command(st, id)
```

Dispatch a menu, toolbar, or context-menu command.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `id` | `dynamic` | — | Stable identifier of the affected item. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L7882)

<a id="function-function-perform-palette-command-function-perform-palette-command-st-id-src-main-ml-907337497"></a>
### _perform_palette_command

```ml
function _perform_palette_command(st, id)
```

Dispatch a command selected through the command palette through the normal command path.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `id` | `dynamic` | — | Stable identifier of the affected item. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L4623)

<a id="function-function-poll-build-function-poll-build-st-src-main-ml-2014312196"></a>
### _poll_build

```ml
function _poll_build(st)
```

Poll build_service.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L3161)

<a id="function-function-pop-nav-stack-function-pop-nav-stack-stack-src-main-ml-134556125"></a>
### _pop_nav_stack

```ml
function _pop_nav_stack(stack)
```

Return a stack without the last navigation item.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `stack` | `dynamic` | — | stack value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L1450)

<a id="function-function-pop-snapshot-function-pop-snapshot-stack-src-main-ml-206123363"></a>
### _pop_snapshot

```ml
function _pop_snapshot(stack)
```

Remove the top snapshot from an undo or redo stack.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `stack` | `dynamic` | — | stack value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L779)

<a id="function-function-populate-api-key-mode-combo-function-populate-api-key-mode-combo-key-mode-combo-mode-src-main-ml-1222477224"></a>
### _populate_api_key_mode_combo

```ml
function _populate_api_key_mode_combo(key_mode_combo, mode)
```

Populate the API-key source combo box.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `key_mode_combo` | `dynamic` | — | key_mode_combo value consumed by this operation. |
| `mode` | `dynamic` | — | Mode selecting the requested behavior. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L3764)

<a id="function-function-populate-project-tree-function-populate-project-tree-st-src-main-ml-1662014862"></a>
### _populate_project_tree

```ml
function _populate_project_tree(st)
```

Populate project tree.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L2658)

<a id="function-function-populate-provider-combo-function-populate-provider-combo-provider-combo-provider-src-main-ml-348447080"></a>
### _populate_provider_combo

```ml
function _populate_provider_combo(provider_combo, provider)
```

Populate the provider type combo box.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `provider_combo` | `dynamic` | — | provider_combo value consumed by this operation. |
| `provider` | `dynamic` | — | provider value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L3739)

<a id="function-function-popup-command-function-popup-command-st-menu-mx-my-src-main-ml-812835082"></a>
### _popup_command

```ml
function _popup_command(st, menu, mx, my)
```

Return the popup command.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `menu` | `dynamic` | — | menu value consumed by this operation. |
| `mx` | `dynamic` | — | mx value consumed by this operation. |
| `my` | `dynamic` | — | my value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L7666)

<a id="function-function-popup-existing-command-function-popup-existing-command-st-menu-mx-my-src-main-ml-1971134428"></a>
### _popup_existing_command

```ml
function _popup_existing_command(st, menu, mx, my)
```

Return the popup existing command.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `menu` | `dynamic` | — | menu value consumed by this operation. |
| `mx` | `dynamic` | — | mx value consumed by this operation. |
| `my` | `dynamic` | — | my value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L7683)

<a id="function-function-profile-config-value-function-profile-config-value-p-profile-key-default-value-src-main-ml-1756069804"></a>
### _profile_config_value

```ml
function _profile_config_value(p, profile, key, default_value)
```

Return the profile config value.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | p value consumed by this operation. |
| `profile` | `dynamic` | — | profile value consumed by this operation. |
| `key` | `dynamic` | — | key value consumed by this operation. |
| `default_value` | `dynamic` | — | default_value value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L2036)

<a id="function-function-project-index-summary-function-project-index-summary-st-src-main-ml-274498982"></a>
### _project_index_summary

```ml
function _project_index_summary(st)
```

Return a compact project index summary.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L3355)

<a id="function-function-project-relative-path-function-project-relative-path-st-path-src-main-ml-1906652167"></a>
### _project_relative_path

```ml
function _project_relative_path(st, path)
```

Return the project relative path.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `path` | `dynamic` | — | Path of the file or directory used by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L3964)

<a id="function-function-provider-combo-index-function-provider-combo-index-provider-src-main-ml-432410792"></a>
### _provider_combo_index

```ml
function _provider_combo_index(provider)
```

Return the combo-box index for a provider type.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `provider` | `dynamic` | — | provider value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L3722)

<a id="function-function-provider-from-combo-function-provider-from-combo-provider-combo-src-main-ml-1839556667"></a>
### _provider_from_combo

```ml
function _provider_from_combo(provider_combo)
```

Return the provider type represented by the combo-box selection.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `provider_combo` | `dynamic` | — | provider_combo value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L3730)

<a id="function-function-pump-messages-function-pump-messages-st-src-main-ml-859811970"></a>
### _pump_messages

```ml
function _pump_messages(st)
```

Run the Win32 message loop and dispatch MiniIDE UI events.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L8326)

<a id="function-function-push-nav-stack-function-push-nav-stack-stack-loc-src-main-ml-760002081"></a>
### _push_nav_stack

```ml
function _push_nav_stack(stack, loc)
```

Push one location onto a bounded navigation stack.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `stack` | `dynamic` | — | stack value consumed by this operation. |
| `loc` | `dynamic` | — | loc value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L1435)

<a id="function-function-push-snapshot-function-push-snapshot-stack-text-src-main-ml-1119687064"></a>
### _push_snapshot

```ml
function _push_snapshot(stack, text)
```

Push a text snapshot onto an undo or redo stack.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `stack` | `dynamic` | — | stack value consumed by this operation. |
| `text` | `dynamic` | — | Text consumed by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L762)

<a id="function-function-quick-open-query-function-quick-open-query-st-query-src-main-ml-621466438"></a>
### _quick_open_query

```ml
function _quick_open_query(st, query)
```

Show or open project files matching a query.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `query` | `dynamic` | — | query value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L4816)

<a id="function-function-read-assistant-dialog-config-function-read-assistant-dialog-config-provider-combo-base-url-edit-key-mode-combo-key-env-edit-api-key-edit-model-edit-tool-mode-edit-enabled-allow-insecure-tls-include-tabs-include-project-include-help-src-main-ml-138291923"></a>
### _read_assistant_dialog_config

```ml
function _read_assistant_dialog_config(provider_combo, base_url_edit, key_mode_combo, key_env_edit, api_key_edit, model_edit, tool_mode_edit, enabled, allow_insecure_tls, include_tabs, include_project, include_help)
```

Read assistant settings from controls.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `provider_combo` | `dynamic` | — | provider_combo value consumed by this operation. |
| `base_url_edit` | `dynamic` | — | base_url_edit value consumed by this operation. |
| `key_mode_combo` | `dynamic` | — | key_mode_combo value consumed by this operation. |
| `key_env_edit` | `dynamic` | — | key_env_edit value consumed by this operation. |
| `api_key_edit` | `dynamic` | — | api_key_edit value consumed by this operation. |
| `model_edit` | `dynamic` | — | model_edit value consumed by this operation. |
| `tool_mode_edit` | `dynamic` | — | tool_mode_edit value consumed by this operation. |
| `enabled` | `dynamic` | — | enabled value consumed by this operation. |
| `allow_insecure_tls` | `dynamic` | — | allow_insecure_tls value consumed by this operation. |
| `include_tabs` | `dynamic` | — | include_tabs value consumed by this operation. |
| `include_project` | `dynamic` | — | include_project value consumed by this operation. |
| `include_help` | `dynamic` | — | include_help value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L3802)

<a id="function-function-read-compile-settings-values-function-read-compile-settings-values-st-controls-entry-value-output-value-compiler-value-src-main-ml-1364637042"></a>
### _read_compile_settings_values

```ml
function _read_compile_settings_values(st, controls, entry_value, output_value, compiler_value)
```

Read compile settings values.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `controls` | `dynamic` | — | controls value consumed by this operation. |
| `entry_value` | `dynamic` | — | entry_value value consumed by this operation. |
| `output_value` | `dynamic` | — | output_value value consumed by this operation. |
| `compiler_value` | `dynamic` | — | compiler_value value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L3986)

<a id="function-function-read-editor-function-read-editor-st-src-main-ml-840975866"></a>
### _read_editor

```ml
function _read_editor(st)
```

Read the active editor, routing Markdown tabs through their cached source.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L1834)

<a id="function-function-read-goto-line-function-read-goto-line-dlg-edit-src-main-ml-1884011250"></a>
### _read_goto_line

```ml
function _read_goto_line(dlg, edit)
```

Read goto line.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dlg` | `dynamic` | — | dlg value consumed by this operation. |
| `edit` | `dynamic` | — | edit value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L5903)

<a id="function-function-read-rename-name-function-read-rename-name-dlg-edit-src-main-ml-760783678"></a>
### _read_rename_name

```ml
function _read_rename_name(dlg, edit)
```

Read rename name.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dlg` | `dynamic` | — | dlg value consumed by this operation. |
| `edit` | `dynamic` | — | edit value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L7245)

<a id="function-function-rebuild-project-function-rebuild-project-st-src-main-ml-296939974"></a>
### _rebuild_project

```ml
function _rebuild_project(st)
```

Rebuild project.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L3052)

<a id="function-function-record-edit-activity-function-record-edit-activity-st-src-main-ml-1305677580"></a>
### _record_edit_activity

```ml
function _record_edit_activity(st)
```

Record editor activity used for undo and dirty tracking.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L800)

<a id="function-function-record-navigation-function-record-navigation-st-src-main-ml-881007626"></a>
### _record_navigation

```ml
function _record_navigation(st)
```

Record the current location before an explicit navigation jump.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L1461)

<a id="function-function-record-undo-snapshot-function-record-undo-snapshot-st-idx-src-main-ml-394977715"></a>
### _record_undo_snapshot

```ml
function _record_undo_snapshot(st, idx)
```

Capture the current editor state on the undo stack when needed.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `idx` | `dynamic` | — | idx value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L812)

<a id="function-function-refresh-active-markdown-view-function-refresh-active-markdown-view-st-preserve-view-src-main-ml-908576804"></a>
### _refresh_active_markdown_view

```ml
function _refresh_active_markdown_view(st, preserve_view)
```

Re-render the active Markdown tab with the current theme.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `preserve_view` | `dynamic` | — | preserve_view value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L1924)

<a id="function-function-refresh-assistant-settings-buttons-function-refresh-assistant-settings-buttons-enabled-btn-tls-btn-tabs-btn-project-btn-help-btn-enabled-allow-insecure-tls-include-tabs-include-project-include-help-src-main-ml-218617612"></a>
### _refresh_assistant_settings_buttons

```ml
function _refresh_assistant_settings_buttons(enabled_btn, tls_btn, tabs_btn, project_btn, help_btn, enabled, allow_insecure_tls, include_tabs, include_project, include_help)
```

Refresh assistant settings toggle buttons.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `enabled_btn` | `dynamic` | — | enabled_btn value consumed by this operation. |
| `tls_btn` | `dynamic` | — | tls_btn value consumed by this operation. |
| `tabs_btn` | `dynamic` | — | tabs_btn value consumed by this operation. |
| `project_btn` | `dynamic` | — | project_btn value consumed by this operation. |
| `help_btn` | `dynamic` | — | help_btn value consumed by this operation. |
| `enabled` | `dynamic` | — | enabled value consumed by this operation. |
| `allow_insecure_tls` | `dynamic` | — | allow_insecure_tls value consumed by this operation. |
| `include_tabs` | `dynamic` | — | include_tabs value consumed by this operation. |
| `include_project` | `dynamic` | — | include_project value consumed by this operation. |
| `include_help` | `dynamic` | — | include_help value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L3781)

<a id="function-function-refresh-command-palette-list-function-refresh-command-palette-list-command-list-ids-labels-search-texts-query-src-main-ml-603283361"></a>
### _refresh_command_palette_list

```ml
function _refresh_command_palette_list(command_list, ids, labels, search_texts, query)
```

Refresh the visible command palette list and return visible command IDs.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `command_list` | `dynamic` | — | command_list value consumed by this operation. |
| `ids` | `dynamic` | — | ids value consumed by this operation. |
| `labels` | `dynamic` | — | labels value consumed by this operation. |
| `search_texts` | `dynamic` | — | search_texts value consumed by this operation. |
| `query` | `dynamic` | — | query value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L4633)

<a id="function-function-refresh-renamed-open-files-function-refresh-renamed-open-files-st-files-src-main-ml-379406403"></a>
### _refresh_renamed_open_files

```ml
function _refresh_renamed_open_files(st, files)
```

Refresh open tabs for files changed by a project-wide rename.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `files` | `dynamic` | — | files value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L5590)

<a id="function-function-refresh-settings-buttons-function-refresh-settings-buttons-keep-btn-subsystem-btn-keep-going-subsystem-src-main-ml-1793651784"></a>
### _refresh_settings_buttons

```ml
function _refresh_settings_buttons(keep_btn, subsystem_btn, keep_going, subsystem)
```

Refresh settings buttons.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `keep_btn` | `dynamic` | — | keep_btn value consumed by this operation. |
| `subsystem_btn` | `dynamic` | — | subsystem_btn value consumed by this operation. |
| `keep_going` | `dynamic` | — | keep_going value consumed by this operation. |
| `subsystem` | `dynamic` | — | subsystem value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L3715)

<a id="function-function-refresh-tabs-function-refresh-tabs-st-src-main-ml-2099618008"></a>
### _refresh_tabs

```ml
function _refresh_tabs(st)
```

Refresh tabs.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L2442)

<a id="function-function-reload-config-function-reload-config-st-src-main-ml-2111335322"></a>
### _reload_config

```ml
function _reload_config(st)
```

Reload config.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L3532)

<a id="function-function-reload-project-function-reload-project-st-src-main-ml-1259745494"></a>
### _reload_project

```ml
function _reload_project(st)
```

Reload project.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L3197)

<a id="function-function-reload-tree-only-function-reload-tree-only-st-src-main-ml-1911749854"></a>
### _reload_tree_only

```ml
function _reload_tree_only(st)
```

Reload tree only.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L7059)

<a id="function-function-remove-fold-at-function-remove-fold-at-folds-source-line-src-main-ml-207729265"></a>
### _remove_fold_at

```ml
function _remove_fold_at(folds, source_line)
```

Return the remove fold at the requested location.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `folds` | `dynamic` | — | folds value consumed by this operation. |
| `source_line` | `dynamic` | — | source_line value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L7408)

<a id="function-function-rename-error-text-function-rename-error-text-result-src-main-ml-1549940784"></a>
### _rename_error_text

```ml
function _rename_error_text(result)
```

Return a compact rename error message.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `result` | `dynamic` | — | Result object populated or inspected by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L5580)

<a id="function-function-rename-tree-item-function-rename-tree-item-st-src-main-ml-1181556206"></a>
### _rename_tree_item

```ml
function _rename_tree_item(st)
```

Return the rename tree item.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L7260)

<a id="function-function-replace-active-text-function-replace-active-text-st-text-src-main-ml-632287759"></a>
### _replace_active_text

```ml
function _replace_active_text(st, text)
```

Replace active text.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `text` | `dynamic` | — | Text consumed by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L6256)

<a id="function-function-request-exit-function-request-exit-st-src-main-ml-75301100"></a>
### _request_exit

```ml
function _request_exit(st)
```

Request application shutdown after checking unsaved tabs.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L7870)

<a id="function-function-reset-compiler-function-reset-compiler-st-src-main-ml-22958510"></a>
### _reset_compiler

```ml
function _reset_compiler(st)
```

Reset compiler.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L3524)

<a id="function-function-resolve-function-resolve-root-path-src-main-ml-416104222"></a>
### _resolve

```ml
function _resolve(root, path)
```

Resolve a possibly relative path against the project root.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `root` | `dynamic` | — | root value consumed by this operation. |
| `path` | `dynamic` | — | Path of the file or directory used by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L672)

<a id="function-function-resolve-result-file-function-resolve-result-file-st-file-src-main-ml-1690335952"></a>
### _resolve_result_file

```ml
function _resolve_result_file(st, file)
```

Resolve result file.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `file` | `dynamic` | — | file value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L1400)

<a id="function-function-reveal-active-file-function-reveal-active-file-st-src-main-ml-299051750"></a>
### _reveal_active_file

```ml
function _reveal_active_file(st)
```

Reveal the active editor file in the project tree.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L6817)

<a id="function-function-run-function-run-root-src-main-ml-2131536183"></a>
### _run

```ml
function _run(root)
```

Initialize MiniIDE, open the initial project, and start the message loop.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `root` | `dynamic` | — | root value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L8536)

<a id="function-function-run-current-test-file-function-run-current-test-file-st-src-main-ml-37558098"></a>
### _run_current_test_file

```ml
function _run_current_test_file(st)
```

Run the currently open test file.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L3012)

<a id="function-function-run-project-function-run-project-st-src-main-ml-831703146"></a>
### _run_project

```ml
function _run_project(st)
```

Run project.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L2977)

<a id="function-function-run-related-test-file-function-run-related-test-file-st-src-main-ml-2035078646"></a>
### _run_related_test_file

```ml
function _run_related_test_file(st)
```

Run the first test file related to the currently open source file.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L3026)

<a id="function-function-run-tests-function-run-tests-st-src-main-ml-1674662298"></a>
### _run_tests

```ml
function _run_tests(st)
```

Run tests.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L2992)

<a id="function-function-safe-identifier-function-safe-identifier-name-src-main-ml-356882274"></a>
### _safe_identifier

```ml
function _safe_identifier(name)
```

Return the safe identifier.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Name of the affected item. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L7135)

<a id="function-function-same-nav-location-function-same-nav-location-a-b-src-main-ml-1555975602"></a>
### _same_nav_location

```ml
function _same_nav_location(a, b)
```

Return true when two navigation locations point to the same place.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | a value consumed by this operation. |
| `b` | `dynamic` | — | b value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L1427)

<a id="function-function-same-or-child-path-function-same-or-child-path-parent-child-src-main-ml-906080627"></a>
### _same_or_child_path

```ml
function _same_or_child_path(parent, child)
```

Return the same or child path.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `parent` | `dynamic` | — | parent value consumed by this operation. |
| `child` | `dynamic` | — | child value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L7111)

<a id="function-function-save-all-function-save-all-st-src-main-ml-586890774"></a>
### _save_all

```ml
function _save_all(st)
```

Save all dirty editable tabs.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L2813)

<a id="function-function-save-all-open-function-save-all-open-st-src-main-ml-1338359374"></a>
### _save_all_open

```ml
function _save_all_open(st)
```

Save all open.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L2788)

<a id="function-function-save-compiler-path-function-save-compiler-path-st-src-main-ml-2706318"></a>
### _save_compiler_path

```ml
function _save_compiler_path(st)
```

Save compiler path.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L2203)

<a id="function-function-save-config-function-save-config-st-src-main-ml-5561254"></a>
### _save_config

```ml
function _save_config(st)
```

Save configuration.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L2164)

<a id="function-function-save-current-function-save-current-st-src-main-ml-1688176070"></a>
### _save_current

```ml
function _save_current(st)
```

Save current.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L2711)

<a id="function-function-saved-text-at-function-saved-text-at-st-idx-src-main-ml-28914891"></a>
### _saved_text_at

```ml
function _saved_text_at(st, idx)
```

Return the saved text at the requested location.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `idx` | `dynamic` | — | idx value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L738)

<a id="function-function-search-current-word-function-search-current-word-st-src-main-ml-450950174"></a>
### _search_current_word

```ml
function _search_current_word(st)
```

Search current word.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L5505)

<a id="function-function-search-language-help-function-search-language-help-st-query-src-main-ml-404659562"></a>
### _search_language_help

```ml
function _search_language_help(st, query)
```

Search language help.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `query` | `dynamic` | — | query value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L4269)

<a id="function-function-select-build-profile-function-select-build-profile-st-profile-src-main-ml-1223256805"></a>
### _select_build_profile

```ml
function _select_build_profile(st, profile)
```

Select build profile.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `profile` | `dynamic` | — | profile value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L3080)

<a id="function-function-select-compiler-function-select-compiler-st-src-main-ml-2115275034"></a>
### _select_compiler

```ml
function _select_compiler(st)
```

Select compiler.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L3514)

<a id="function-function-select-completion-prefix-function-select-completion-prefix-editor-prefix-src-main-ml-1467221710"></a>
### _select_completion_prefix

```ml
function _select_completion_prefix(editor, prefix)
```

Select the current prefix when a fuzzy completion replaces it.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `editor` | `dynamic` | — | editor value consumed by this operation. |
| `prefix` | `dynamic` | — | prefix value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L4549)

<a id="function-function-select-theme-function-select-theme-st-mode-src-main-ml-1323079537"></a>
### _select_theme

```ml
function _select_theme(st, mode)
```

Select theme.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `mode` | `dynamic` | — | Mode selecting the requested behavior. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L2266)

<a id="function-function-select-tree-item-at-function-select-tree-item-at-st-mx-my-src-main-ml-1889650983"></a>
### _select_tree_item_at

```ml
function _select_tree_item_at(st, mx, my)
```

Select tree item at.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `mx` | `dynamic` | — | mx value consumed by this operation. |
| `my` | `dynamic` | — | my value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L7753)

<a id="function-function-selected-command-palette-id-function-selected-command-palette-id-visible-ids-selected-src-main-ml-1119301027"></a>
### _selected_command_palette_id

```ml
function _selected_command_palette_id(visible_ids, selected)
```

Return the selected command ID from a filtered command palette list.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `visible_ids` | `dynamic` | — | visible_ids value consumed by this operation. |
| `selected` | `dynamic` | — | selected value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L4655)

<a id="function-function-selected-editor-text-function-selected-editor-text-st-src-main-ml-1220796106"></a>
### _selected_editor_text

```ml
function _selected_editor_text(st)
```

Return the selected editor text.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L6019)

<a id="function-function-selected-project-kind-function-selected-project-kind-kind-combo-src-main-ml-190537982"></a>
### _selected_project_kind

```ml
function _selected_project_kind(kind_combo)
```

Return the selected project kind.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `kind_combo` | `dynamic` | — | kind_combo value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L3319)

<a id="function-function-selected-tree-index-function-selected-tree-index-st-src-main-ml-1655432118"></a>
### _selected_tree_index

```ml
function _selected_tree_index(st)
```

Return the selected tree index.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L7035)

<a id="function-function-set-command-palette-selection-function-set-command-palette-selection-command-list-visible-ids-selected-src-main-ml-1583443797"></a>
### _set_command_palette_selection

```ml
function _set_command_palette_selection(command_list, visible_ids, selected)
```

Set the selected command palette row.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `command_list` | `dynamic` | — | command_list value consumed by this operation. |
| `visible_ids` | `dynamic` | — | visible_ids value consumed by this operation. |
| `selected` | `dynamic` | — | selected value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L4677)

<a id="function-function-set-dirty-from-saved-function-set-dirty-from-saved-st-idx-src-main-ml-536614333"></a>
### _set_dirty_from_saved

```ml
function _set_dirty_from_saved(st, idx)
```

Update a tab dirty flag by comparing it with the saved snapshot.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `idx` | `dynamic` | — | idx value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L747)

<a id="function-function-set-log-function-set-log-st-text-src-main-ml-57992207"></a>
### _set_log

```ml
function _set_log(st, text)
```

Replace the result log text and refresh the log control.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `text` | `dynamic` | — | Text consumed by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L935)

<a id="function-function-set-title-function-set-title-st-src-main-ml-1241015966"></a>
### _set_title

```ml
function _set_title(st)
```

Refresh the window title with project, active file, and dirty marker.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L2003)

<a id="function-function-settings-button-function-settings-button-parent-font-text-x-y-w-h-control-id-src-main-ml-1280737976"></a>
### _settings_button

```ml
function _settings_button(parent, font, text, x, y, w, h, control_id)
```

Return the settings button.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `parent` | `dynamic` | — | parent value consumed by this operation. |
| `font` | `dynamic` | — | font value consumed by this operation. |
| `text` | `dynamic` | — | Text consumed by the operation. |
| `x` | `dynamic` | — | Horizontal coordinate used by the operation. |
| `y` | `dynamic` | — | Vertical coordinate used by the operation. |
| `w` | `dynamic` | — | w value consumed by this operation. |
| `h` | `dynamic` | — | h value consumed by this operation. |
| `control_id` | `dynamic` | — | Identifier of control. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L3696)

<a id="function-function-settings-combo-id-function-settings-combo-id-parent-font-x-y-w-h-control-id-src-main-ml-1109912017"></a>
### _settings_combo_id

```ml
function _settings_combo_id(parent, font, x, y, w, h, control_id)
```

Create a settings combo box with fixed choices.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `parent` | `dynamic` | — | parent value consumed by this operation. |
| `font` | `dynamic` | — | font value consumed by this operation. |
| `x` | `dynamic` | — | Horizontal coordinate used by the operation. |
| `y` | `dynamic` | — | Vertical coordinate used by the operation. |
| `w` | `dynamic` | — | w value consumed by this operation. |
| `h` | `dynamic` | — | h value consumed by this operation. |
| `control_id` | `dynamic` | — | Identifier of control. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L3680)

<a id="function-function-settings-edit-function-settings-edit-parent-font-text-x-y-w-h-src-main-ml-924790037"></a>
### _settings_edit

```ml
function _settings_edit(parent, font, text, x, y, w, h)
```

Create a standard settings edit control.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `parent` | `dynamic` | — | parent value consumed by this operation. |
| `font` | `dynamic` | — | font value consumed by this operation. |
| `text` | `dynamic` | — | Text consumed by the operation. |
| `x` | `dynamic` | — | Horizontal coordinate used by the operation. |
| `y` | `dynamic` | — | Vertical coordinate used by the operation. |
| `w` | `dynamic` | — | w value consumed by this operation. |
| `h` | `dynamic` | — | h value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L3633)

<a id="function-function-settings-edit-id-function-settings-edit-id-parent-font-text-x-y-w-h-control-id-src-main-ml-1720279534"></a>
### _settings_edit_id

```ml
function _settings_edit_id(parent, font, text, x, y, w, h, control_id)
```

Create a settings edit control with a stable command ID.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `parent` | `dynamic` | — | parent value consumed by this operation. |
| `font` | `dynamic` | — | font value consumed by this operation. |
| `text` | `dynamic` | — | Text consumed by the operation. |
| `x` | `dynamic` | — | Horizontal coordinate used by the operation. |
| `y` | `dynamic` | — | Vertical coordinate used by the operation. |
| `w` | `dynamic` | — | w value consumed by this operation. |
| `h` | `dynamic` | — | h value consumed by this operation. |
| `control_id` | `dynamic` | — | Identifier of control. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L3649)

<a id="function-function-settings-label-function-settings-label-parent-font-text-x-y-w-h-src-main-ml-1054364343"></a>
### _settings_label

```ml
function _settings_label(parent, font, text, x, y, w, h)
```

Create a static label for settings dialogs.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `parent` | `dynamic` | — | parent value consumed by this operation. |
| `font` | `dynamic` | — | font value consumed by this operation. |
| `text` | `dynamic` | — | Text consumed by the operation. |
| `x` | `dynamic` | — | Horizontal coordinate used by the operation. |
| `y` | `dynamic` | — | Vertical coordinate used by the operation. |
| `w` | `dynamic` | — | w value consumed by this operation. |
| `h` | `dynamic` | — | h value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L3619)

<a id="function-function-settings-password-id-function-settings-password-id-parent-font-text-x-y-w-h-control-id-src-main-ml-1393772476"></a>
### _settings_password_id

```ml
function _settings_password_id(parent, font, text, x, y, w, h, control_id)
```

Create a password-style settings edit control for direct API keys.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `parent` | `dynamic` | — | parent value consumed by this operation. |
| `font` | `dynamic` | — | font value consumed by this operation. |
| `text` | `dynamic` | — | Text consumed by the operation. |
| `x` | `dynamic` | — | Horizontal coordinate used by the operation. |
| `y` | `dynamic` | — | Vertical coordinate used by the operation. |
| `w` | `dynamic` | — | w value consumed by this operation. |
| `h` | `dynamic` | — | h value consumed by this operation. |
| `control_id` | `dynamic` | — | Identifier of control. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L3665)

<a id="function-function-shift-down-function-shift-down-src-main-ml-388012879"></a>
### _shift_down

```ml
function _shift_down()
```

Return the shift down.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L6696)

<a id="function-function-short-symbol-name-function-short-symbol-name-name-src-main-ml-627778598"></a>
### _short_symbol_name

```ml
function _short_symbol_name(name)
```

Return the short symbol name.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Name of the affected item. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L6169)

<a id="function-function-show-assistant-panel-function-show-assistant-panel-st-src-main-ml-1906043522"></a>
### _show_assistant_panel

```ml
function _show_assistant_panel(st)
```

Show the assistant panel.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L1304)

<a id="function-function-show-autocomplete-popup-function-show-autocomplete-popup-st-items-prefix-src-main-ml-174177234"></a>
### _show_autocomplete_popup

```ml
function _show_autocomplete_popup(st, items, prefix)
```

Show autocomplete popup.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `items` | `dynamic` | — | Items consumed or updated by the operation. |
| `prefix` | `dynamic` | — | prefix value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L4482)

<a id="function-function-show-bookmarks-function-show-bookmarks-st-src-main-ml-1569385422"></a>
### _show_bookmarks

```ml
function _show_bookmarks(st)
```

Show all session bookmarks in the result panel.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L1529)

<a id="function-function-show-call-hierarchy-function-show-call-hierarchy-st-src-main-ml-445555762"></a>
### _show_call_hierarchy

```ml
function _show_call_hierarchy(st)
```

Show call hierarchy for the current symbol-like word.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L5796)

<a id="function-function-show-code-inspections-function-show-code-inspections-st-src-main-ml-1259593906"></a>
### _show_code_inspections

```ml
function _show_code_inspections(st)
```

Show code inspections.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L5473)

<a id="function-function-show-config-function-show-config-st-src-main-ml-1958844490"></a>
### _show_config

```ml
function _show_config(st)
```

Show configuration.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L3580)

<a id="function-function-show-editor-context-function-show-editor-context-st-mx-my-src-main-ml-191270407"></a>
### _show_editor_context

```ml
function _show_editor_context(st, mx, my)
```

Show editor context.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `mx` | `dynamic` | — | mx value consumed by this operation. |
| `my` | `dynamic` | — | my value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L7791)

<a id="function-function-show-import-graph-function-show-import-graph-st-src-main-ml-1050117070"></a>
### _show_import_graph

```ml
function _show_import_graph(st)
```

Show import graph.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L5306)

<a id="function-function-show-log-context-function-show-log-context-st-mx-my-src-main-ml-979710041"></a>
### _show_log_context

```ml
function _show_log_context(st, mx, my)
```

Show log context.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `mx` | `dynamic` | — | mx value consumed by this operation. |
| `my` | `dynamic` | — | my value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L7818)

<a id="function-function-show-outline-function-show-outline-st-src-main-ml-1561230168"></a>
### _show_outline

```ml
function _show_outline(st)
```

Show outline.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L4975)

<a id="function-function-show-problems-function-show-problems-st-src-main-ml-2033388970"></a>
### _show_problems

```ml
function _show_problems(st)
```

Show problems.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L5406)

<a id="function-function-show-project-index-function-show-project-index-st-src-main-ml-420009088"></a>
### _show_project_index

```ml
function _show_project_index(st)
```

Show project index.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L5345)

<a id="function-function-show-project-symbols-function-show-project-symbols-st-src-main-ml-1586098206"></a>
### _show_project_symbols

```ml
function _show_project_symbols(st)
```

Show all project symbols.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L5047)

<a id="function-function-show-project-symbols-query-function-show-project-symbols-query-st-query-src-main-ml-670133024"></a>
### _show_project_symbols_query

```ml
function _show_project_symbols_query(st, query)
```

Show project symbols matching a query.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `query` | `dynamic` | — | query value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L5016)

<a id="function-function-show-recent-files-function-show-recent-files-st-src-main-ml-499337446"></a>
### _show_recent_files

```ml
function _show_recent_files(st)
```

Show the files currently open in this session.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L4850)

<a id="function-function-show-related-tests-function-show-related-tests-st-src-main-ml-1926171626"></a>
### _show_related_tests

```ml
function _show_related_tests(st)
```

Show tests related to the current file.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L5275)

<a id="function-function-show-rename-symbol-preview-function-show-rename-symbol-preview-st-word-new-name-src-main-ml-1928793008"></a>
### _show_rename_symbol_preview

```ml
function _show_rename_symbol_preview(st, word, new_name)
```

Show a preview of the references that would be renamed.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `word` | `dynamic` | — | word value consumed by this operation. |
| `new_name` | `dynamic` | — | new_name value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L5550)

<a id="function-function-show-result-panel-function-show-result-panel-st-mode-title-rows-files-lines-cols-src-main-ml-1473942255"></a>
### _show_result_panel

```ml
function _show_result_panel(st, mode, title, rows, files, lines, cols)
```

Show result panel.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `mode` | `dynamic` | — | Mode selecting the requested behavior. |
| `title` | `dynamic` | — | Human-readable title presented to the user. |
| `rows` | `dynamic` | — | rows value consumed by this operation. |
| `files` | `dynamic` | — | files value consumed by this operation. |
| `lines` | `dynamic` | — | lines value consumed by this operation. |
| `cols` | `dynamic` | — | cols value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L961)

<a id="function-function-show-symbol-info-function-show-symbol-info-st-src-main-ml-1222166910"></a>
### _show_symbol_info

```ml
function _show_symbol_info(st)
```

Show symbol info for the current symbol-like word.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L5832)

<a id="function-function-show-tab-context-function-show-tab-context-st-mx-my-src-main-ml-1023893991"></a>
### _show_tab_context

```ml
function _show_tab_context(st, mx, my)
```

Show tab context.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `mx` | `dynamic` | — | mx value consumed by this operation. |
| `my` | `dynamic` | — | my value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L7732)

<a id="function-function-show-test-explorer-function-show-test-explorer-st-src-main-ml-1793345884"></a>
### _show_test_explorer

```ml
function _show_test_explorer(st)
```

Show test explorer.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L5243)

<a id="function-function-show-todos-function-show-todos-st-src-main-ml-579652630"></a>
### _show_todos

```ml
function _show_todos(st)
```

Show TODO and FIXME items.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L5213)

<a id="function-function-show-top-menu-function-show-top-menu-st-idx-src-main-ml-301257907"></a>
### _show_top_menu

```ml
function _show_top_menu(st, idx)
```

Show top menu.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `idx` | `dynamic` | — | idx value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L7709)

<a id="function-function-show-tree-context-function-show-tree-context-st-mx-my-src-main-ml-439959619"></a>
### _show_tree_context

```ml
function _show_tree_context(st, mx, my)
```

Show tree context.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `mx` | `dynamic` | — | mx value consumed by this operation. |
| `my` | `dynamic` | — | my value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L7768)

<a id="function-function-show-welcome-function-show-welcome-st-src-main-ml-97178664"></a>
### _show_welcome

```ml
function _show_welcome(st)
```

Show welcome.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L3481)

<a id="function-function-show-workspace-health-function-show-workspace-health-st-src-main-ml-1374051326"></a>
### _show_workspace_health

```ml
function _show_workspace_health(st)
```

Show workspace health.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L5164)

<a id="function-function-simple-line-numbers-text-function-simple-line-numbers-text-first-visible-count-src-main-ml-1154241615"></a>
### _simple_line_numbers_text

```ml
function _simple_line_numbers_text(first_visible, count)
```

Return the simple line numbers text.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `first_visible` | `dynamic` | — | first_visible value consumed by this operation. |
| `count` | `dynamic` | — | Number of items or units to process. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L7464)

<a id="function-function-source-line-to-display-line-function-source-line-to-display-line-text-folds-source-line-src-main-ml-964933066"></a>
### _source_line_to_display_line

```ml
function _source_line_to_display_line(text, folds, source_line)
```

Map an original source line to its visible editor line.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed by the operation. |
| `folds` | `dynamic` | — | folds value consumed by this operation. |
| `source_line` | `dynamic` | — | source_line value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L1813)

<a id="function-function-start-compile-job-function-start-compile-job-st-mode-src-main-ml-588347787"></a>
### _start_compile_job

```ml
function _start_compile_job(st, mode)
```

Start compile job.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `mode` | `dynamic` | — | Mode selecting the requested behavior. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L2825)

<a id="function-function-start-current-test-compile-job-function-start-current-test-compile-job-st-test-file-src-main-ml-1621032623"></a>
### _start_current_test_compile_job

```ml
function _start_current_test_compile_job(st, test_file)
```

Start compiling the current test file.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `test_file` | `dynamic` | — | test_file value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L2924)

<a id="function-function-start-related-test-compile-job-function-start-related-test-compile-job-st-test-file-src-main-ml-1627473399"></a>
### _start_related_test_compile_job

```ml
function _start_related_test_compile_job(st, test_file)
```

Start compiling a related test file.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `test_file` | `dynamic` | — | test_file value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L2931)

<a id="function-function-start-run-job-function-start-run-job-st-src-main-ml-1996813534"></a>
### _start_run_job

```ml
function _start_run_job(st)
```

Start run job.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L2871)

<a id="function-function-start-run-job-with-prefix-function-start-run-job-with-prefix-st-prefix-src-main-ml-1410858130"></a>
### _start_run_job_with_prefix

```ml
function _start_run_job_with_prefix(st, prefix)
```

Start run job, optionally keeping a previous compile log above live program output.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `prefix` | `dynamic` | — | prefix value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L2849)

<a id="function-function-start-test-compile-job-function-start-test-compile-job-st-src-main-ml-521785102"></a>
### _start_test_compile_job

```ml
function _start_test_compile_job(st)
```

Start test compile job.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L2877)

<a id="function-function-start-test-file-compile-job-function-start-test-file-compile-job-st-test-file-mode-label-src-main-ml-826145728"></a>
### _start_test_file_compile_job

```ml
function _start_test_file_compile_job(st, test_file, mode, label)
```

Start compiling a specific test file.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `test_file` | `dynamic` | — | test_file value consumed by this operation. |
| `mode` | `dynamic` | — | Mode selecting the requested behavior. |
| `label` | `dynamic` | — | label value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L2900)

<a id="function-function-start-test-run-job-function-start-test-run-job-st-src-main-ml-1079048694"></a>
### _start_test_run_job

```ml
function _start_test_run_job(st)
```

Start test run job.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L2959)

<a id="function-function-start-test-run-job-with-prefix-function-start-test-run-job-with-prefix-st-prefix-src-main-ml-790358222"></a>
### _start_test_run_job_with_prefix

```ml
function _start_test_run_job_with_prefix(st, prefix)
```

Start test run job, optionally keeping a previous test compile log above live test output.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `prefix` | `dynamic` | — | prefix value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L2938)

<a id="function-function-stop-build-job-function-stop-build-job-st-src-main-ml-2060677274"></a>
### _stop_build_job

```ml
function _stop_build_job(st)
```

Stop build job.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L3067)

<a id="function-function-strip-cr-function-strip-cr-line-src-main-ml-1460663231"></a>
### _strip_cr

```ml
function _strip_cr(line)
```

Remove carriage returns from editor or log text.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `line` | `dynamic` | — | line value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L1906)

<a id="function-function-sync-active-tab-function-sync-active-tab-st-src-main-ml-1351469566"></a>
### _sync_active_tab

```ml
function _sync_active_tab(st)
```

Synchronize active tab.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L2457)

<a id="function-function-sync-line-numbers-function-sync-line-numbers-st-src-main-ml-1573643406"></a>
### _sync_line_numbers

```ml
function _sync_line_numbers(st)
```

Synchronize line numbers.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L7495)

<a id="function-function-tab-at-function-tab-at-st-mx-my-src-main-ml-841649383"></a>
### _tab_at

```ml
function _tab_at(st, mx, my)
```

Return the tab at the requested location.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `mx` | `dynamic` | — | mx value consumed by this operation. |
| `my` | `dynamic` | — | my value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L7652)

<a id="function-function-tab-label-function-tab-label-st-idx-src-main-ml-736461399"></a>
### _tab_label

```ml
function _tab_label(st, idx)
```

Send the label operation to a tab control.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `idx` | `dynamic` | — | idx value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L2426)

<a id="function-function-test-file-source-function-test-file-source-path-src-main-ml-581848130"></a>
### _test_file_source

```ml
function _test_file_source(path)
```

Return the test file source.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `dynamic` | — | Path of the file or directory used by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L7154)

<a id="function-function-toggle-bookmark-function-toggle-bookmark-st-src-main-ml-2118430486"></a>
### _toggle_bookmark

```ml
function _toggle_bookmark(st)
```

Toggle a bookmark at the current editor line.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L1504)

<a id="function-function-toggle-fold-at-caret-function-toggle-fold-at-caret-st-src-main-ml-132541872"></a>
### _toggle_fold_at_caret

```ml
function _toggle_fold_at_caret(st)
```

Toggle fold at the caret.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L7430)

<a id="function-function-toggle-fold-from-y-function-toggle-fold-from-y-st-my-src-main-ml-1984466220"></a>
### _toggle_fold_from_y

```ml
function _toggle_fold_from_y(st, my)
```

Toggle fold from the y.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `my` | `dynamic` | — | my value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L7441)

<a id="function-function-toggle-fold-line-function-toggle-fold-line-st-source-line-src-main-ml-1125220762"></a>
### _toggle_fold_line

```ml
function _toggle_fold_line(st, source_line)
```

Toggle fold line.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `source_line` | `dynamic` | — | source_line value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L7424)

<a id="function-function-toggle-keep-going-function-toggle-keep-going-st-src-main-ml-444939158"></a>
### _toggle_keep_going

```ml
function _toggle_keep_going(st)
```

Toggle keep going.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L3540)

<a id="function-function-toggle-max-errors-function-toggle-max-errors-st-src-main-ml-1496391742"></a>
### _toggle_max_errors

```ml
function _toggle_max_errors(st)
```

Toggle max errors.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L3560)

<a id="function-function-toggle-subsystem-function-toggle-subsystem-st-src-main-ml-1796767288"></a>
### _toggle_subsystem

```ml
function _toggle_subsystem(st)
```

Toggle subsystem.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L3548)

<a id="function-function-toolbar-button-hwnd-function-toolbar-button-hwnd-st-hwnd-src-main-ml-128000159"></a>
### _toolbar_button_hwnd

```ml
function _toolbar_button_hwnd(st, hwnd)
```

Return the toolbar button window handle.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `hwnd` | `dynamic` | — | hwnd value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L8245)

<a id="function-function-toolbar-command-at-function-toolbar-command-at-mx-my-src-main-ml-44515994"></a>
### _toolbar_command_at

```ml
function _toolbar_command_at(mx, my)
```

Return the toolbar command at the requested location.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `mx` | `dynamic` | — | mx value consumed by this operation. |
| `my` | `dynamic` | — | my value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L8180)

<a id="function-function-toolbar-command-for-hwnd-function-toolbar-command-for-hwnd-st-hwnd-src-main-ml-1553808279"></a>
### _toolbar_command_for_hwnd

```ml
function _toolbar_command_for_hwnd(st, hwnd)
```

Return the toolbar command for a window handle.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `hwnd` | `dynamic` | — | hwnd value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L8222)

<a id="function-function-toolbar-command-from-message-function-toolbar-command-from-message-st-msg-src-main-ml-673984751"></a>
### _toolbar_command_from_message

```ml
function _toolbar_command_from_message(st, msg)
```

Extract the toolbar command from a Win32 message.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `msg` | `dynamic` | — | msg value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L8287)

<a id="function-function-toolbar-glyph-hwnd-function-toolbar-glyph-hwnd-st-hwnd-src-main-ml-1181277361"></a>
### _toolbar_glyph_hwnd

```ml
function _toolbar_glyph_hwnd(st, hwnd)
```

Return the toolbar glyph window handle.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `hwnd` | `dynamic` | — | hwnd value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L8273)

<a id="function-function-toolbar-icon-hwnd-function-toolbar-icon-hwnd-st-hwnd-src-main-ml-76787391"></a>
### _toolbar_icon_hwnd

```ml
function _toolbar_icon_hwnd(st, hwnd)
```

Return the toolbar icon window handle.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `hwnd` | `dynamic` | — | hwnd value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L8261)

<a id="function-function-top-menu-at-function-top-menu-at-mx-my-src-main-ml-1799795970"></a>
### _top_menu_at

```ml
function _top_menu_at(mx, my)
```

Return the top menu at the requested location.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `mx` | `dynamic` | — | mx value consumed by this operation. |
| `my` | `dynamic` | — | my value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L8209)

<a id="function-function-tree-handle-index-function-tree-handle-index-st-handle-src-main-ml-1076516332"></a>
### _tree_handle_index

```ml
function _tree_handle_index(st, handle)
```

Send the handle index operation to a tree-view control.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `handle` | `dynamic` | — | Native or runtime handle used by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L2637)

<a id="function-function-tree-icon-function-tree-icon-path-is-dir-src-main-ml-989646790"></a>
### _tree_icon

```ml
function _tree_icon(path, is_dir)
```

Send the icon operation to a tree-view control.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `dynamic` | — | Path of the file or directory used by the operation. |
| `is_dir` | `dynamic` | — | is_dir value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L2650)

<a id="function-function-tree-target-dir-function-tree-target-dir-st-src-main-ml-367805610"></a>
### _tree_target_dir

```ml
function _tree_target_dir(st)
```

Send the target directory operation to a tree-view control.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L7046)

<a id="function-function-trim-trailing-ws-function-trim-trailing-ws-line-src-main-ml-961099459"></a>
### _trim_trailing_ws

```ml
function _trim_trailing_ws(line)
```

Return the trim trailing whitespace.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `line` | `dynamic` | — | line value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L4420)

<a id="function-function-unfold-all-function-unfold-all-st-src-main-ml-578469848"></a>
### _unfold_all

```ml
function _unfold_all(st)
```

Return the unfold all.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L7401)

<a id="function-function-unique-file-path-function-unique-file-path-dir-stem-ext-src-main-ml-283577682"></a>
### _unique_file_path

```ml
function _unique_file_path(dir, stem, ext)
```

Return the unique file path.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dir` | `dynamic` | — | dir value consumed by this operation. |
| `stem` | `dynamic` | — | stem value consumed by this operation. |
| `ext` | `dynamic` | — | ext value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L7073)

<a id="function-function-unique-named-path-function-unique-named-path-dir-name-src-main-ml-1357012997"></a>
### _unique_named_path

```ml
function _unique_named_path(dir, name)
```

Return the unique named path.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dir` | `dynamic` | — | dir value consumed by this operation. |
| `name` | `dynamic` | — | Name of the affected item. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L7088)

<a id="function-function-update-cursor-for-mouse-function-update-cursor-for-mouse-st-msg-src-main-ml-81221917"></a>
### _update_cursor_for_mouse

```ml
function _update_cursor_for_mouse(st, msg)
```

Update cursor for mouse.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `msg` | `dynamic` | — | msg value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L8033)

<a id="function-function-update-editor-aux-function-update-editor-aux-st-src-main-ml-637552906"></a>
### _update_editor_aux

```ml
function _update_editor_aux(st)
```

Update editor aux.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L7624)

<a id="function-function-update-live-diagnostics-function-update-live-diagnostics-st-now-src-main-ml-766187670"></a>
### _update_live_diagnostics

```ml
function _update_live_diagnostics(st, now)
```

Refresh cached active-file live diagnostics after editor idle.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `now` | `dynamic` | — | now value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L7607)

<a id="function-function-visible-text-from-source-function-visible-text-from-source-text-folds-src-main-ml-1353164778"></a>
### _visible_text_from_source

```ml
function _visible_text_from_source(text, folds)
```

Return source text with folded line ranges collapsed.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed by the operation. |
| `folds` | `dynamic` | — | folds value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L1765)

<a id="function-function-word-at-pos-function-word-at-pos-text-pos-src-main-ml-772395396"></a>
### _word_at_pos

```ml
function _word_at_pos(text, pos)
```

Return the word at position.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed by the operation. |
| `pos` | `dynamic` | — | pos value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L4400)

<a id="function-function-word-prefix-before-function-word-prefix-before-text-pos-src-main-ml-386316244"></a>
### _word_prefix_before

```ml
function _word_prefix_before(text, pos)
```

Return the word prefix before.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed by the operation. |
| `pos` | `dynamic` | — | pos value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L4383)

<a id="function-function-write-active-editor-function-write-active-editor-st-text-src-main-ml-237693171"></a>
### _write_active_editor

```ml
function _write_active_editor(st, text)
```

Write active editor.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `text` | `dynamic` | — | Text consumed by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L1894)

<a id="function-function-write-editor-function-write-editor-st-text-src-main-ml-233319079"></a>
### _write_editor

```ml
function _write_editor(st, text)
```

Write text to the active editor control without changing tab metadata.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `text` | `dynamic` | — | Text consumed by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L1841)

<a id="function-function-write-markdown-active-editor-function-write-markdown-active-editor-st-text-preserve-view-src-main-ml-1189793531"></a>
### _write_markdown_active_editor

```ml
function _write_markdown_active_editor(st, text, preserve_view)
```

Activate and populate the cached view for the current Markdown tab.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `text` | `dynamic` | — | Text consumed by the operation. |
| `preserve_view` | `dynamic` | — | preserve_view value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L1856)

- [AppState](Type-appstate-1337352337.md) — struct
<a id="constant-constant-assistant-max-tool-rounds-const-assistant-max-tool-rounds-12-src-main-ml-2138977251"></a>
### ASSISTANT_MAX_TOOL_ROUNDS

```ml
const ASSISTANT_MAX_TOOL_ROUNDS = 12
```

Defines the assistant max tool rounds constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L627)

- [CompileSettingsControls](Type-compilesettingscontrols-1542950461.md) — struct
- [CompileSettingsValues](Type-compilesettingsvalues-949458977.md) — struct
<a id="constant-constant-context-force-dup-ms-const-context-force-dup-ms-120-src-main-ml-1271456233"></a>
### CONTEXT_FORCE_DUP_MS

```ml
const CONTEXT_FORCE_DUP_MS = 120
```

Defines the context force dup ms constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L342)

<a id="constant-constant-context-suppress-ms-const-context-suppress-ms-650-src-main-ml-1974782217"></a>
### CONTEXT_SUPPRESS_MS

```ml
const CONTEXT_SUPPRESS_MS = 650
```

Defines the context suppress ms constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L340)

<a id="constant-constant-edit-sync-idle-ms-const-edit-sync-idle-ms-260-src-main-ml-1354077194"></a>
### EDIT_SYNC_IDLE_MS

```ml
const EDIT_SYNC_IDLE_MS = 260
```

Defines the edit sync idle ms constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L330)

- [FoldRange](Type-foldrange-865374199.md) — struct
<a id="constant-constant-highlight-idle-ms-const-highlight-idle-ms-450-src-main-ml-1412366235"></a>
### HIGHLIGHT_IDLE_MS

```ml
const HIGHLIGHT_IDLE_MS = 450
```

Defines the highlight idle ms constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L332)

<a id="constant-constant-highlight-visible-lines-const-highlight-visible-lines-90-src-main-ml-426053033"></a>
### HIGHLIGHT_VISIBLE_LINES

```ml
const HIGHLIGHT_VISIBLE_LINES = 90
```

Defines the highlight visible lines constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L336)

<a id="constant-constant-id-ai-allow-insecure-tls-const-id-ai-allow-insecure-tls-1602-src-main-ml-1198985405"></a>
### ID_AI_ALLOW_INSECURE_TLS

```ml
const ID_AI_ALLOW_INSECURE_TLS = 1602
```

Defines the id ai allow insecure tls constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L621)

<a id="constant-constant-id-ai-api-key-edit-const-id-ai-api-key-edit-1604-src-main-ml-394397361"></a>
### ID_AI_API_KEY_EDIT

```ml
const ID_AI_API_KEY_EDIT = 1604
```

Defines the id ai api key edit constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L625)

<a id="constant-constant-id-ai-base-url-edit-const-id-ai-base-url-edit-1592-src-main-ml-212925129"></a>
### ID_AI_BASE_URL_EDIT

```ml
const ID_AI_BASE_URL_EDIT = 1592
```

Defines the id ai base url edit constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L601)

<a id="constant-constant-id-ai-enabled-const-id-ai-enabled-1596-src-main-ml-772836237"></a>
### ID_AI_ENABLED

```ml
const ID_AI_ENABLED = 1596
```

Defines the id ai enabled constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L609)

<a id="constant-constant-id-ai-include-help-const-id-ai-include-help-1599-src-main-ml-1623439332"></a>
### ID_AI_INCLUDE_HELP

```ml
const ID_AI_INCLUDE_HELP = 1599
```

Defines the id ai include help constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L615)

<a id="constant-constant-id-ai-include-project-const-id-ai-include-project-1598-src-main-ml-1908176587"></a>
### ID_AI_INCLUDE_PROJECT

```ml
const ID_AI_INCLUDE_PROJECT = 1598
```

Defines the id ai include project constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L613)

<a id="constant-constant-id-ai-include-tabs-const-id-ai-include-tabs-1597-src-main-ml-1348099320"></a>
### ID_AI_INCLUDE_TABS

```ml
const ID_AI_INCLUDE_TABS = 1597
```

Defines the id ai include tabs constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L611)

<a id="constant-constant-id-ai-key-env-edit-const-id-ai-key-env-edit-1593-src-main-ml-215456462"></a>
### ID_AI_KEY_ENV_EDIT

```ml
const ID_AI_KEY_ENV_EDIT = 1593
```

Defines the id ai key env edit constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L603)

<a id="constant-constant-id-ai-key-mode-const-id-ai-key-mode-1603-src-main-ml-1927086248"></a>
### ID_AI_KEY_MODE

```ml
const ID_AI_KEY_MODE = 1603
```

Defines the id ai key mode constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L623)

<a id="constant-constant-id-ai-model-edit-const-id-ai-model-edit-1594-src-main-ml-532776255"></a>
### ID_AI_MODEL_EDIT

```ml
const ID_AI_MODEL_EDIT = 1594
```

Defines the id ai model edit constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L605)

<a id="constant-constant-id-ai-provider-edit-const-id-ai-provider-edit-1591-src-main-ml-208670724"></a>
### ID_AI_PROVIDER_EDIT

```ml
const ID_AI_PROVIDER_EDIT = 1591
```

Defines the id ai provider edit constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L599)

<a id="constant-constant-id-ai-settings-cancel-const-id-ai-settings-cancel-1601-src-main-ml-724406748"></a>
### ID_AI_SETTINGS_CANCEL

```ml
const ID_AI_SETTINGS_CANCEL = 1601
```

Defines the id ai settings cancel constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L619)

<a id="constant-constant-id-ai-settings-ok-const-id-ai-settings-ok-1600-src-main-ml-1680266943"></a>
### ID_AI_SETTINGS_OK

```ml
const ID_AI_SETTINGS_OK = 1600
```

Defines the id ai settings ok constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L617)

<a id="constant-constant-id-ai-tool-mode-edit-const-id-ai-tool-mode-edit-1595-src-main-ml-1571760102"></a>
### ID_AI_TOOL_MODE_EDIT

```ml
const ID_AI_TOOL_MODE_EDIT = 1595
```

Defines the id ai tool mode edit constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L607)

<a id="constant-constant-id-assistant-context-const-id-assistant-context-1079-src-main-ml-324741619"></a>
### ID_ASSISTANT_CONTEXT

```ml
const ID_ASSISTANT_CONTEXT = 1079
```

Defines the id assistant context constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L497)

<a id="constant-constant-id-assistant-panel-const-id-assistant-panel-1077-src-main-ml-1797607299"></a>
### ID_ASSISTANT_PANEL

```ml
const ID_ASSISTANT_PANEL = 1077
```

Defines the id assistant panel constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L493)

<a id="constant-constant-id-assistant-send-const-id-assistant-send-1078-src-main-ml-1322276346"></a>
### ID_ASSISTANT_SEND

```ml
const ID_ASSISTANT_SEND = 1078
```

Defines the id assistant send constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L495)

<a id="constant-constant-id-autocomplete-list-const-id-autocomplete-list-1091-src-main-ml-97784131"></a>
### ID_AUTOCOMPLETE_LIST

```ml
const ID_AUTOCOMPLETE_LIST = 1091
```

Defines the id autocomplete list constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L351)

<a id="constant-constant-id-command-cancel-const-id-command-cancel-1564-src-main-ml-1473141264"></a>
### ID_COMMAND_CANCEL

```ml
const ID_COMMAND_CANCEL = 1564
```

Defines the id command cancel constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L583)

<a id="constant-constant-id-command-list-const-id-command-list-1562-src-main-ml-889065486"></a>
### ID_COMMAND_LIST

```ml
const ID_COMMAND_LIST = 1562
```

Defines the id command list constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L579)

<a id="constant-constant-id-command-palette-const-id-command-palette-1052-src-main-ml-1431373546"></a>
### ID_COMMAND_PALETTE

```ml
const ID_COMMAND_PALETTE = 1052
```

Defines the id command palette constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L431)

<a id="constant-constant-id-command-run-const-id-command-run-1563-src-main-ml-13351065"></a>
### ID_COMMAND_RUN

```ml
const ID_COMMAND_RUN = 1563
```

Defines the id command run constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L581)

<a id="constant-constant-id-command-search-text-edit-const-id-command-search-text-edit-1561-src-main-ml-493633207"></a>
### ID_COMMAND_SEARCH_TEXT_EDIT

```ml
const ID_COMMAND_SEARCH_TEXT_EDIT = 1561
```

Defines the id command search text edit constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L577)

<a id="constant-constant-id-config-assistant-settings-const-id-config-assistant-settings-1080-src-main-ml-1826395845"></a>
### ID_CONFIG_ASSISTANT_SETTINGS

```ml
const ID_CONFIG_ASSISTANT_SETTINGS = 1080
```

Defines the id config assistant settings constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L499)

<a id="constant-constant-id-config-compile-settings-const-id-config-compile-settings-1024-src-main-ml-1862275653"></a>
### ID_CONFIG_COMPILE_SETTINGS

```ml
const ID_CONFIG_COMPILE_SETTINGS = 1024
```

Defines the id config compile settings constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L407)

<a id="constant-constant-id-config-compiler-reset-const-id-config-compiler-reset-1016-src-main-ml-2032452308"></a>
### ID_CONFIG_COMPILER_RESET

```ml
const ID_CONFIG_COMPILER_RESET = 1016
```

Defines the id config compiler reset constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L389)

<a id="constant-constant-id-config-compiler-select-const-id-config-compiler-select-1015-src-main-ml-1106117159"></a>
### ID_CONFIG_COMPILER_SELECT

```ml
const ID_CONFIG_COMPILER_SELECT = 1015
```

Defines the id config compiler select constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L387)

<a id="constant-constant-id-config-profile-debug-const-id-config-profile-debug-1043-src-main-ml-265678104"></a>
### ID_CONFIG_PROFILE_DEBUG

```ml
const ID_CONFIG_PROFILE_DEBUG = 1043
```

Defines the id config profile debug constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L409)

<a id="constant-constant-id-config-profile-release-const-id-config-profile-release-1044-src-main-ml-1884138033"></a>
### ID_CONFIG_PROFILE_RELEASE

```ml
const ID_CONFIG_PROFILE_RELEASE = 1044
```

Defines the id config profile release constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L411)

<a id="constant-constant-id-config-reload-const-id-config-reload-1018-src-main-ml-1622709438"></a>
### ID_CONFIG_RELOAD

```ml
const ID_CONFIG_RELOAD = 1018
```

Defines the id config reload constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L393)

<a id="constant-constant-id-config-show-const-id-config-show-1017-src-main-ml-1566647091"></a>
### ID_CONFIG_SHOW

```ml
const ID_CONFIG_SHOW = 1017
```

Defines the id config show constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L391)

<a id="constant-constant-id-config-theme-dark-const-id-config-theme-dark-1047-src-main-ml-1748697552"></a>
### ID_CONFIG_THEME_DARK

```ml
const ID_CONFIG_THEME_DARK = 1047
```

Defines the id config theme dark constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L415)

<a id="constant-constant-id-config-theme-light-const-id-config-theme-light-1046-src-main-ml-2072100079"></a>
### ID_CONFIG_THEME_LIGHT

```ml
const ID_CONFIG_THEME_LIGHT = 1046
```

Defines the id config theme light constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L413)

<a id="constant-constant-id-config-toggle-keep-going-const-id-config-toggle-keep-going-1019-src-main-ml-491057075"></a>
### ID_CONFIG_TOGGLE_KEEP_GOING

```ml
const ID_CONFIG_TOGGLE_KEEP_GOING = 1019
```

Defines the id config toggle keep going constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L395)

<a id="constant-constant-id-config-toggle-max-errors-const-id-config-toggle-max-errors-1022-src-main-ml-1000362445"></a>
### ID_CONFIG_TOGGLE_MAX_ERRORS

```ml
const ID_CONFIG_TOGGLE_MAX_ERRORS = 1022
```

Defines the id config toggle max errors constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L399)

<a id="constant-constant-id-config-toggle-subsystem-const-id-config-toggle-subsystem-1021-src-main-ml-1535810692"></a>
### ID_CONFIG_TOGGLE_SUBSYSTEM

```ml
const ID_CONFIG_TOGGLE_SUBSYSTEM = 1021
```

Defines the id config toggle subsystem constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L397)

<a id="constant-constant-id-ctx-editor-select-all-const-id-ctx-editor-select-all-1220-src-main-ml-1971508199"></a>
### ID_CTX_EDITOR_SELECT_ALL

```ml
const ID_CTX_EDITOR_SELECT_ALL = 1220
```

Defines the id ctx editor select all constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L652)

<a id="constant-constant-id-ctx-log-clear-const-id-ctx-log-clear-1232-src-main-ml-1770433348"></a>
### ID_CTX_LOG_CLEAR

```ml
const ID_CTX_LOG_CLEAR = 1232
```

Defines the id ctx log clear constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L658)

<a id="constant-constant-id-ctx-log-copy-const-id-ctx-log-copy-1230-src-main-ml-1600569996"></a>
### ID_CTX_LOG_COPY

```ml
const ID_CTX_LOG_COPY = 1230
```

Defines the id ctx log copy constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L654)

<a id="constant-constant-id-ctx-log-select-all-const-id-ctx-log-select-all-1231-src-main-ml-1817166811"></a>
### ID_CTX_LOG_SELECT_ALL

```ml
const ID_CTX_LOG_SELECT_ALL = 1231
```

Defines the id ctx log select all constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L656)

<a id="constant-constant-id-ctx-tab-close-const-id-ctx-tab-close-1201-src-main-ml-2089024010"></a>
### ID_CTX_TAB_CLOSE

```ml
const ID_CTX_TAB_CLOSE = 1201
```

Defines the id ctx tab close constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L630)

<a id="constant-constant-id-ctx-tab-close-all-const-id-ctx-tab-close-all-1203-src-main-ml-1686548644"></a>
### ID_CTX_TAB_CLOSE_ALL

```ml
const ID_CTX_TAB_CLOSE_ALL = 1203
```

Defines the id ctx tab close all constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L634)

<a id="constant-constant-id-ctx-tab-close-others-const-id-ctx-tab-close-others-1202-src-main-ml-1162848345"></a>
### ID_CTX_TAB_CLOSE_OTHERS

```ml
const ID_CTX_TAB_CLOSE_OTHERS = 1202
```

Defines the id ctx tab close others constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L632)

<a id="constant-constant-id-ctx-tree-copy-const-id-ctx-tree-copy-1213-src-main-ml-354742509"></a>
### ID_CTX_TREE_COPY

```ml
const ID_CTX_TREE_COPY = 1213
```

Defines the id ctx tree copy constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L642)

<a id="constant-constant-id-ctx-tree-delete-const-id-ctx-tree-delete-1216-src-main-ml-1082100930"></a>
### ID_CTX_TREE_DELETE

```ml
const ID_CTX_TREE_DELETE = 1216
```

Defines the id ctx tree delete constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L648)

<a id="constant-constant-id-ctx-tree-new-file-const-id-ctx-tree-new-file-1211-src-main-ml-408823483"></a>
### ID_CTX_TREE_NEW_FILE

```ml
const ID_CTX_TREE_NEW_FILE = 1211
```

Defines the id ctx tree new file constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L638)

<a id="constant-constant-id-ctx-tree-new-folder-const-id-ctx-tree-new-folder-1212-src-main-ml-325213386"></a>
### ID_CTX_TREE_NEW_FOLDER

```ml
const ID_CTX_TREE_NEW_FOLDER = 1212
```

Defines the id ctx tree new folder constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L640)

<a id="constant-constant-id-ctx-tree-new-test-const-id-ctx-tree-new-test-1217-src-main-ml-1394293541"></a>
### ID_CTX_TREE_NEW_TEST

```ml
const ID_CTX_TREE_NEW_TEST = 1217
```

Defines the id ctx tree new test constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L650)

<a id="constant-constant-id-ctx-tree-open-const-id-ctx-tree-open-1210-src-main-ml-1007374898"></a>
### ID_CTX_TREE_OPEN

```ml
const ID_CTX_TREE_OPEN = 1210
```

Defines the id ctx tree open constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L636)

<a id="constant-constant-id-ctx-tree-paste-const-id-ctx-tree-paste-1214-src-main-ml-1750595890"></a>
### ID_CTX_TREE_PASTE

```ml
const ID_CTX_TREE_PASTE = 1214
```

Defines the id ctx tree paste constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L644)

<a id="constant-constant-id-ctx-tree-rename-const-id-ctx-tree-rename-1215-src-main-ml-1786694453"></a>
### ID_CTX_TREE_RENAME

```ml
const ID_CTX_TREE_RENAME = 1215
```

Defines the id ctx tree rename constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L646)

<a id="constant-constant-id-edit-complete-const-id-edit-complete-1033-src-main-ml-790106657"></a>
### ID_EDIT_COMPLETE

```ml
const ID_EDIT_COMPLETE = 1033
```

Defines the id edit complete constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L479)

<a id="constant-constant-id-edit-copy-const-id-edit-copy-1011-src-main-ml-325072209"></a>
### ID_EDIT_COPY

```ml
const ID_EDIT_COPY = 1011
```

Defines the id edit copy constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L379)

<a id="constant-constant-id-edit-cut-const-id-edit-cut-1010-src-main-ml-1443805228"></a>
### ID_EDIT_CUT

```ml
const ID_EDIT_CUT = 1010
```

Defines the id edit cut constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L377)

<a id="constant-constant-id-edit-find-const-id-edit-find-1037-src-main-ml-1504762225"></a>
### ID_EDIT_FIND

```ml
const ID_EDIT_FIND = 1037
```

Defines the id edit find constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L487)

<a id="constant-constant-id-edit-find-next-const-id-edit-find-next-1038-src-main-ml-1340995298"></a>
### ID_EDIT_FIND_NEXT

```ml
const ID_EDIT_FIND_NEXT = 1038
```

Defines the id edit find next constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L489)

<a id="constant-constant-id-edit-format-const-id-edit-format-1034-src-main-ml-1336778024"></a>
### ID_EDIT_FORMAT

```ml
const ID_EDIT_FORMAT = 1034
```

Defines the id edit format constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L481)

<a id="constant-constant-id-edit-paste-const-id-edit-paste-1012-src-main-ml-1631805334"></a>
### ID_EDIT_PASTE

```ml
const ID_EDIT_PASTE = 1012
```

Defines the id edit paste constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L381)

<a id="constant-constant-id-edit-redo-const-id-edit-redo-1014-src-main-ml-1301103536"></a>
### ID_EDIT_REDO

```ml
const ID_EDIT_REDO = 1014
```

Defines the id edit redo constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L385)

<a id="constant-constant-id-edit-rename-symbol-const-id-edit-rename-symbol-1062-src-main-ml-324183453"></a>
### ID_EDIT_RENAME_SYMBOL

```ml
const ID_EDIT_RENAME_SYMBOL = 1062
```

Defines the id edit rename symbol constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L449)

<a id="constant-constant-id-edit-select-all-const-id-edit-select-all-1075-src-main-ml-991827597"></a>
### ID_EDIT_SELECT_ALL

```ml
const ID_EDIT_SELECT_ALL = 1075
```

Defines the id edit select all constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L475)

<a id="constant-constant-id-edit-undo-const-id-edit-undo-1013-src-main-ml-2138737409"></a>
### ID_EDIT_UNDO

```ml
const ID_EDIT_UNDO = 1013
```

Defines the id edit undo constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L383)

<a id="constant-constant-id-editor-tabs-const-id-editor-tabs-1005-src-main-ml-155476856"></a>
### ID_EDITOR_TABS

```ml
const ID_EDITOR_TABS = 1005
```

Defines the id editor tabs constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L347)

<a id="constant-constant-id-file-build-const-id-file-build-1002-src-main-ml-484335591"></a>
### ID_FILE_BUILD

```ml
const ID_FILE_BUILD = 1002
```

Defines the id file build constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L357)

<a id="constant-constant-id-file-clean-const-id-file-clean-1040-src-main-ml-1653506105"></a>
### ID_FILE_CLEAN

```ml
const ID_FILE_CLEAN = 1040
```

Defines the id file clean constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L369)

<a id="constant-constant-id-file-close-tab-const-id-file-close-tab-1076-src-main-ml-1169184436"></a>
### ID_FILE_CLOSE_TAB

```ml
const ID_FILE_CLOSE_TAB = 1076
```

Defines the id file close tab constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L477)

<a id="constant-constant-id-file-exit-const-id-file-exit-1004-src-main-ml-992954605"></a>
### ID_FILE_EXIT

```ml
const ID_FILE_EXIT = 1004
```

Defines the id file exit constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L361)

<a id="constant-constant-id-file-new-project-const-id-file-new-project-1008-src-main-ml-1931188385"></a>
### ID_FILE_NEW_PROJECT

```ml
const ID_FILE_NEW_PROJECT = 1008
```

Defines the id file new project constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L365)

<a id="constant-constant-id-file-open-project-const-id-file-open-project-1006-src-main-ml-102444275"></a>
### ID_FILE_OPEN_PROJECT

```ml
const ID_FILE_OPEN_PROJECT = 1006
```

Defines the id file open project constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L353)

<a id="constant-constant-id-file-quick-open-const-id-file-quick-open-1056-src-main-ml-1984866218"></a>
### ID_FILE_QUICK_OPEN

```ml
const ID_FILE_QUICK_OPEN = 1056
```

Defines the id file quick open constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L375)

<a id="constant-constant-id-file-rebuild-const-id-file-rebuild-1041-src-main-ml-1354944698"></a>
### ID_FILE_REBUILD

```ml
const ID_FILE_REBUILD = 1041
```

Defines the id file rebuild constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L371)

<a id="constant-constant-id-file-recent-files-const-id-file-recent-files-1065-src-main-ml-1571725206"></a>
### ID_FILE_RECENT_FILES

```ml
const ID_FILE_RECENT_FILES = 1065
```

Defines the id file recent files constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L455)

<a id="constant-constant-id-file-reload-const-id-file-reload-1003-src-main-ml-1925060746"></a>
### ID_FILE_RELOAD

```ml
const ID_FILE_RELOAD = 1003
```

Defines the id file reload constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L359)

<a id="constant-constant-id-file-run-const-id-file-run-1007-src-main-ml-1096683864"></a>
### ID_FILE_RUN

```ml
const ID_FILE_RUN = 1007
```

Defines the id file run constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L363)

<a id="constant-constant-id-file-save-const-id-file-save-1001-src-main-ml-1230067852"></a>
### ID_FILE_SAVE

```ml
const ID_FILE_SAVE = 1001
```

Defines the id file save constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L355)

<a id="constant-constant-id-file-save-all-const-id-file-save-all-1074-src-main-ml-1735413640"></a>
### ID_FILE_SAVE_ALL

```ml
const ID_FILE_SAVE_ALL = 1074
```

Defines the id file save all constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L473)

<a id="constant-constant-id-file-stop-const-id-file-stop-1042-src-main-ml-310027243"></a>
### ID_FILE_STOP

```ml
const ID_FILE_STOP = 1042
```

Defines the id file stop constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L373)

<a id="constant-constant-id-file-test-const-id-file-test-1009-src-main-ml-1125409358"></a>
### ID_FILE_TEST

```ml
const ID_FILE_TEST = 1009
```

Defines the id file test constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L367)

<a id="constant-constant-id-file-test-current-const-id-file-test-current-1063-src-main-ml-2046706442"></a>
### ID_FILE_TEST_CURRENT

```ml
const ID_FILE_TEST_CURRENT = 1063
```

Defines the id file test current constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L451)

<a id="constant-constant-id-file-test-related-const-id-file-test-related-1064-src-main-ml-831448775"></a>
### ID_FILE_TEST_RELATED

```ml
const ID_FILE_TEST_RELATED = 1064
```

Defines the id file test related constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L453)

<a id="constant-constant-id-find-cancel-const-id-find-cancel-1523-src-main-ml-204219527"></a>
### ID_FIND_CANCEL

```ml
const ID_FIND_CANCEL = 1523
```

Defines the id find cancel constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L557)

<a id="constant-constant-id-find-ok-const-id-find-ok-1522-src-main-ml-1376521108"></a>
### ID_FIND_OK

```ml
const ID_FIND_OK = 1522
```

Defines the id find ok constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L555)

<a id="constant-constant-id-find-text-edit-const-id-find-text-edit-1521-src-main-ml-929827675"></a>
### ID_FIND_TEXT_EDIT

```ml
const ID_FIND_TEXT_EDIT = 1521
```

Defines the id find text edit constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L553)

<a id="constant-constant-id-goto-line-cancel-const-id-goto-line-cancel-1513-src-main-ml-1219644982"></a>
### ID_GOTO_LINE_CANCEL

```ml
const ID_GOTO_LINE_CANCEL = 1513
```

Defines the id goto line cancel constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L551)

<a id="constant-constant-id-goto-line-edit-const-id-goto-line-edit-1511-src-main-ml-1889761812"></a>
### ID_GOTO_LINE_EDIT

```ml
const ID_GOTO_LINE_EDIT = 1511
```

Defines the id goto line edit constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L547)

<a id="constant-constant-id-goto-line-ok-const-id-goto-line-ok-1512-src-main-ml-848601441"></a>
### ID_GOTO_LINE_OK

```ml
const ID_GOTO_LINE_OK = 1512
```

Defines the id goto line ok constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L549)

<a id="constant-constant-id-help-about-const-id-help-about-1020-src-main-ml-968691227"></a>
### ID_HELP_ABOUT

```ml
const ID_HELP_ABOUT = 1020
```

Defines the id help about constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L401)

<a id="constant-constant-id-help-language-const-id-help-language-1023-src-main-ml-591659096"></a>
### ID_HELP_LANGUAGE

```ml
const ID_HELP_LANGUAGE = 1023
```

Defines the id help language constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L403)

<a id="constant-constant-id-help-language-search-const-id-help-language-search-1045-src-main-ml-506133754"></a>
### ID_HELP_LANGUAGE_SEARCH

```ml
const ID_HELP_LANGUAGE_SEARCH = 1045
```

Defines the id help language search constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L405)

<a id="constant-constant-id-help-search-cancel-const-id-help-search-cancel-1543-src-main-ml-795674887"></a>
### ID_HELP_SEARCH_CANCEL

```ml
const ID_HELP_SEARCH_CANCEL = 1543
```

Defines the id help search cancel constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L569)

<a id="constant-constant-id-help-search-ok-const-id-help-search-ok-1542-src-main-ml-1506533808"></a>
### ID_HELP_SEARCH_OK

```ml
const ID_HELP_SEARCH_OK = 1542
```

Defines the id help search ok constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L567)

<a id="constant-constant-id-help-search-text-edit-const-id-help-search-text-edit-1541-src-main-ml-981478145"></a>
### ID_HELP_SEARCH_TEXT_EDIT

```ml
const ID_HELP_SEARCH_TEXT_EDIT = 1541
```

Defines the id help search text edit constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L565)

<a id="constant-constant-id-help-welcome-const-id-help-welcome-1035-src-main-ml-693788429"></a>
### ID_HELP_WELCOME

```ml
const ID_HELP_WELCOME = 1035
```

Defines the id help welcome constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L483)

<a id="constant-constant-id-nav-back-const-id-nav-back-1066-src-main-ml-986321105"></a>
### ID_NAV_BACK

```ml
const ID_NAV_BACK = 1066
```

Defines the id nav back constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L457)

<a id="constant-constant-id-nav-bookmarks-const-id-nav-bookmarks-1069-src-main-ml-1203769632"></a>
### ID_NAV_BOOKMARKS

```ml
const ID_NAV_BOOKMARKS = 1069
```

Defines the id nav bookmarks constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L463)

<a id="constant-constant-id-nav-call-hierarchy-const-id-nav-call-hierarchy-1058-src-main-ml-955614204"></a>
### ID_NAV_CALL_HIERARCHY

```ml
const ID_NAV_CALL_HIERARCHY = 1058
```

Defines the id nav call hierarchy constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L441)

<a id="constant-constant-id-nav-code-inspections-const-id-nav-code-inspections-1060-src-main-ml-190310135"></a>
### ID_NAV_CODE_INSPECTIONS

```ml
const ID_NAV_CODE_INSPECTIONS = 1060
```

Defines the id nav code inspections constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L445)

<a id="constant-constant-id-nav-file-structure-const-id-nav-file-structure-1072-src-main-ml-1476398192"></a>
### ID_NAV_FILE_STRUCTURE

```ml
const ID_NAV_FILE_STRUCTURE = 1072
```

Defines the id nav file structure constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L469)

<a id="constant-constant-id-nav-find-references-const-id-nav-find-references-1049-src-main-ml-1831729216"></a>
### ID_NAV_FIND_REFERENCES

```ml
const ID_NAV_FIND_REFERENCES = 1049
```

Defines the id nav find references constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L425)

<a id="constant-constant-id-nav-forward-const-id-nav-forward-1067-src-main-ml-2064938070"></a>
### ID_NAV_FORWARD

```ml
const ID_NAV_FORWARD = 1067
```

Defines the id nav forward constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L459)

<a id="constant-constant-id-nav-goto-definition-const-id-nav-goto-definition-1039-src-main-ml-886940585"></a>
### ID_NAV_GOTO_DEFINITION

```ml
const ID_NAV_GOTO_DEFINITION = 1039
```

Defines the id nav goto definition constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L491)

<a id="constant-constant-id-nav-goto-line-const-id-nav-goto-line-1036-src-main-ml-243862326"></a>
### ID_NAV_GOTO_LINE

```ml
const ID_NAV_GOTO_LINE = 1036
```

Defines the id nav goto line constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L485)

<a id="constant-constant-id-nav-goto-symbol-const-id-nav-goto-symbol-1051-src-main-ml-1383134685"></a>
### ID_NAV_GOTO_SYMBOL

```ml
const ID_NAV_GOTO_SYMBOL = 1051
```

Defines the id nav goto symbol constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L429)

<a id="constant-constant-id-nav-import-graph-const-id-nav-import-graph-1057-src-main-ml-1388589941"></a>
### ID_NAV_IMPORT_GRAPH

```ml
const ID_NAV_IMPORT_GRAPH = 1057
```

Defines the id nav import graph constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L439)

<a id="constant-constant-id-nav-next-bookmark-const-id-nav-next-bookmark-1070-src-main-ml-1904707360"></a>
### ID_NAV_NEXT_BOOKMARK

```ml
const ID_NAV_NEXT_BOOKMARK = 1070
```

Defines the id nav next bookmark constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L465)

<a id="constant-constant-id-nav-outline-const-id-nav-outline-1030-src-main-ml-1111564356"></a>
### ID_NAV_OUTLINE

```ml
const ID_NAV_OUTLINE = 1030
```

Defines the id nav outline constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L417)

<a id="constant-constant-id-nav-prev-bookmark-const-id-nav-prev-bookmark-1071-src-main-ml-359099811"></a>
### ID_NAV_PREV_BOOKMARK

```ml
const ID_NAV_PREV_BOOKMARK = 1071
```

Defines the id nav prev bookmark constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L467)

<a id="constant-constant-id-nav-problems-const-id-nav-problems-1032-src-main-ml-1966361420"></a>
### ID_NAV_PROBLEMS

```ml
const ID_NAV_PROBLEMS = 1032
```

Defines the id nav problems constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L421)

<a id="constant-constant-id-nav-project-index-const-id-nav-project-index-1048-src-main-ml-150321431"></a>
### ID_NAV_PROJECT_INDEX

```ml
const ID_NAV_PROJECT_INDEX = 1048
```

Defines the id nav project index constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L423)

<a id="constant-constant-id-nav-project-symbols-const-id-nav-project-symbols-1050-src-main-ml-1752210432"></a>
### ID_NAV_PROJECT_SYMBOLS

```ml
const ID_NAV_PROJECT_SYMBOLS = 1050
```

Defines the id nav project symbols constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L427)

<a id="constant-constant-id-nav-related-tests-const-id-nav-related-tests-1061-src-main-ml-127401420"></a>
### ID_NAV_RELATED_TESTS

```ml
const ID_NAV_RELATED_TESTS = 1061
```

Defines the id nav related tests constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L447)

<a id="constant-constant-id-nav-reveal-active-file-const-id-nav-reveal-active-file-1073-src-main-ml-1743165739"></a>
### ID_NAV_REVEAL_ACTIVE_FILE

```ml
const ID_NAV_REVEAL_ACTIVE_FILE = 1073
```

Defines the id nav reveal active file constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L471)

<a id="constant-constant-id-nav-search-word-const-id-nav-search-word-1031-src-main-ml-775676837"></a>
### ID_NAV_SEARCH_WORD

```ml
const ID_NAV_SEARCH_WORD = 1031
```

Defines the id nav search word constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L419)

<a id="constant-constant-id-nav-symbol-info-const-id-nav-symbol-info-1059-src-main-ml-275004167"></a>
### ID_NAV_SYMBOL_INFO

```ml
const ID_NAV_SYMBOL_INFO = 1059
```

Defines the id nav symbol info constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L443)

<a id="constant-constant-id-nav-test-explorer-const-id-nav-test-explorer-1055-src-main-ml-1380925225"></a>
### ID_NAV_TEST_EXPLORER

```ml
const ID_NAV_TEST_EXPLORER = 1055
```

Defines the id nav test explorer constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L437)

<a id="constant-constant-id-nav-todos-const-id-nav-todos-1054-src-main-ml-592015956"></a>
### ID_NAV_TODOS

```ml
const ID_NAV_TODOS = 1054
```

Defines the id nav todos constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L435)

<a id="constant-constant-id-nav-toggle-bookmark-const-id-nav-toggle-bookmark-1068-src-main-ml-1154910875"></a>
### ID_NAV_TOGGLE_BOOKMARK

```ml
const ID_NAV_TOGGLE_BOOKMARK = 1068
```

Defines the id nav toggle bookmark constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L461)

<a id="constant-constant-id-nav-workspace-health-const-id-nav-workspace-health-1053-src-main-ml-938208265"></a>
### ID_NAV_WORKSPACE_HEALTH

```ml
const ID_NAV_WORKSPACE_HEALTH = 1053
```

Defines the id nav workspace health constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L433)

<a id="constant-constant-id-new-project-cancel-const-id-new-project-cancel-1505-src-main-ml-1043388169"></a>
### ID_NEW_PROJECT_CANCEL

```ml
const ID_NEW_PROJECT_CANCEL = 1505
```

Defines the id new project cancel constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L545)

<a id="constant-constant-id-new-project-kind-const-id-new-project-kind-1503-src-main-ml-595303419"></a>
### ID_NEW_PROJECT_KIND

```ml
const ID_NEW_PROJECT_KIND = 1503
```

Defines the id new project kind constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L541)

<a id="constant-constant-id-new-project-name-edit-const-id-new-project-name-edit-1501-src-main-ml-929835917"></a>
### ID_NEW_PROJECT_NAME_EDIT

```ml
const ID_NEW_PROJECT_NAME_EDIT = 1501
```

Defines the id new project name edit constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L537)

<a id="constant-constant-id-new-project-ok-const-id-new-project-ok-1504-src-main-ml-1895906170"></a>
### ID_NEW_PROJECT_OK

```ml
const ID_NEW_PROJECT_OK = 1504
```

Defines the id new project ok constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L543)

<a id="constant-constant-id-new-project-parent-edit-const-id-new-project-parent-edit-1502-src-main-ml-1152804702"></a>
### ID_NEW_PROJECT_PARENT_EDIT

```ml
const ID_NEW_PROJECT_PARENT_EDIT = 1502
```

Defines the id new project parent edit constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L539)

<a id="constant-constant-id-project-tree-const-id-project-tree-1000-src-main-ml-757123793"></a>
### ID_PROJECT_TREE

```ml
const ID_PROJECT_TREE = 1000
```

Defines the id project tree constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L345)

<a id="constant-constant-id-quick-open-cancel-const-id-quick-open-cancel-1573-src-main-ml-196241920"></a>
### ID_QUICK_OPEN_CANCEL

```ml
const ID_QUICK_OPEN_CANCEL = 1573
```

Defines the id quick open cancel constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L589)

<a id="constant-constant-id-quick-open-ok-const-id-quick-open-ok-1572-src-main-ml-1861083099"></a>
### ID_QUICK_OPEN_OK

```ml
const ID_QUICK_OPEN_OK = 1572
```

Defines the id quick open ok constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L587)

<a id="constant-constant-id-quick-open-text-edit-const-id-quick-open-text-edit-1571-src-main-ml-1748495126"></a>
### ID_QUICK_OPEN_TEXT_EDIT

```ml
const ID_QUICK_OPEN_TEXT_EDIT = 1571
```

Defines the id quick open text edit constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L585)

<a id="constant-constant-id-rename-cancel-const-id-rename-cancel-1533-src-main-ml-1621810512"></a>
### ID_RENAME_CANCEL

```ml
const ID_RENAME_CANCEL = 1533
```

Defines the id rename cancel constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L563)

<a id="constant-constant-id-rename-ok-const-id-rename-ok-1532-src-main-ml-1022684535"></a>
### ID_RENAME_OK

```ml
const ID_RENAME_OK = 1532
```

Defines the id rename ok constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L561)

<a id="constant-constant-id-rename-symbol-apply-const-id-rename-symbol-apply-1584-src-main-ml-735751056"></a>
### ID_RENAME_SYMBOL_APPLY

```ml
const ID_RENAME_SYMBOL_APPLY = 1584
```

Defines the id rename symbol apply constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L597)

<a id="constant-constant-id-rename-symbol-cancel-const-id-rename-symbol-cancel-1583-src-main-ml-1176934647"></a>
### ID_RENAME_SYMBOL_CANCEL

```ml
const ID_RENAME_SYMBOL_CANCEL = 1583
```

Defines the id rename symbol cancel constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L595)

<a id="constant-constant-id-rename-symbol-ok-const-id-rename-symbol-ok-1582-src-main-ml-1643990524"></a>
### ID_RENAME_SYMBOL_OK

```ml
const ID_RENAME_SYMBOL_OK = 1582
```

Defines the id rename symbol ok constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L593)

<a id="constant-constant-id-rename-symbol-text-edit-const-id-rename-symbol-text-edit-1581-src-main-ml-1792266295"></a>
### ID_RENAME_SYMBOL_TEXT_EDIT

```ml
const ID_RENAME_SYMBOL_TEXT_EDIT = 1581
```

Defines the id rename symbol text edit constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L591)

<a id="constant-constant-id-rename-text-edit-const-id-rename-text-edit-1531-src-main-ml-1178086942"></a>
### ID_RENAME_TEXT_EDIT

```ml
const ID_RENAME_TEXT_EDIT = 1531
```

Defines the id rename text edit constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L559)

<a id="constant-constant-id-result-list-const-id-result-list-1090-src-main-ml-1049555986"></a>
### ID_RESULT_LIST

```ml
const ID_RESULT_LIST = 1090
```

Defines the id result list constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L349)

<a id="constant-constant-id-settings-cancel-const-id-settings-cancel-1406-src-main-ml-653908689"></a>
### ID_SETTINGS_CANCEL

```ml
const ID_SETTINGS_CANCEL = 1406
```

Defines the id settings cancel constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L518)

<a id="constant-constant-id-settings-compiler-browse-const-id-settings-compiler-browse-1402-src-main-ml-1592472911"></a>
### ID_SETTINGS_COMPILER_BROWSE

```ml
const ID_SETTINGS_COMPILER_BROWSE = 1402
```

Defines the id settings compiler browse constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L510)

<a id="constant-constant-id-settings-compiler-edit-const-id-settings-compiler-edit-1413-src-main-ml-1009862733"></a>
### ID_SETTINGS_COMPILER_EDIT

```ml
const ID_SETTINGS_COMPILER_EDIT = 1413
```

Defines the id settings compiler edit constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L524)

<a id="constant-constant-id-settings-entry-browse-const-id-settings-entry-browse-1401-src-main-ml-1997822894"></a>
### ID_SETTINGS_ENTRY_BROWSE

```ml
const ID_SETTINGS_ENTRY_BROWSE = 1401
```

Defines the id settings entry browse constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L508)

<a id="constant-constant-id-settings-entry-edit-const-id-settings-entry-edit-1411-src-main-ml-1759667231"></a>
### ID_SETTINGS_ENTRY_EDIT

```ml
const ID_SETTINGS_ENTRY_EDIT = 1411
```

Defines the id settings entry edit constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L520)

<a id="constant-constant-id-settings-extra-edit-const-id-settings-extra-edit-1415-src-main-ml-1012224427"></a>
### ID_SETTINGS_EXTRA_EDIT

```ml
const ID_SETTINGS_EXTRA_EDIT = 1415
```

Defines the id settings extra edit constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L528)

<a id="constant-constant-id-settings-keep-going-const-id-settings-keep-going-1403-src-main-ml-1144581730"></a>
### ID_SETTINGS_KEEP_GOING

```ml
const ID_SETTINGS_KEEP_GOING = 1403
```

Defines the id settings keep going constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L512)

<a id="constant-constant-id-settings-max-edit-const-id-settings-max-edit-1414-src-main-ml-640215764"></a>
### ID_SETTINGS_MAX_EDIT

```ml
const ID_SETTINGS_MAX_EDIT = 1414
```

Defines the id settings max edit constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L526)

<a id="constant-constant-id-settings-ok-const-id-settings-ok-1405-src-main-ml-1700950928"></a>
### ID_SETTINGS_OK

```ml
const ID_SETTINGS_OK = 1405
```

Defines the id settings ok constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L516)

<a id="constant-constant-id-settings-output-edit-const-id-settings-output-edit-1412-src-main-ml-1240890790"></a>
### ID_SETTINGS_OUTPUT_EDIT

```ml
const ID_SETTINGS_OUTPUT_EDIT = 1412
```

Defines the id settings output edit constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L522)

<a id="constant-constant-id-settings-run-args-edit-const-id-settings-run-args-edit-1417-src-main-ml-1126668193"></a>
### ID_SETTINGS_RUN_ARGS_EDIT

```ml
const ID_SETTINGS_RUN_ARGS_EDIT = 1417
```

Defines the id settings run args edit constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L532)

<a id="constant-constant-id-settings-subsystem-const-id-settings-subsystem-1404-src-main-ml-1044785057"></a>
### ID_SETTINGS_SUBSYSTEM

```ml
const ID_SETTINGS_SUBSYSTEM = 1404
```

Defines the id settings subsystem constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L514)

<a id="constant-constant-id-settings-test-edit-const-id-settings-test-edit-1416-src-main-ml-1923241022"></a>
### ID_SETTINGS_TEST_EDIT

```ml
const ID_SETTINGS_TEST_EDIT = 1416
```

Defines the id settings test edit constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L530)

<a id="constant-constant-id-settings-workdir-edit-const-id-settings-workdir-edit-1418-src-main-ml-1712791668"></a>
### ID_SETTINGS_WORKDIR_EDIT

```ml
const ID_SETTINGS_WORKDIR_EDIT = 1418
```

Defines the id settings workdir edit constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L534)

<a id="constant-constant-id-symbol-search-cancel-const-id-symbol-search-cancel-1553-src-main-ml-1062014338"></a>
### ID_SYMBOL_SEARCH_CANCEL

```ml
const ID_SYMBOL_SEARCH_CANCEL = 1553
```

Defines the id symbol search cancel constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L575)

<a id="constant-constant-id-symbol-search-ok-const-id-symbol-search-ok-1552-src-main-ml-221678961"></a>
### ID_SYMBOL_SEARCH_OK

```ml
const ID_SYMBOL_SEARCH_OK = 1552
```

Defines the id symbol search ok constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L573)

<a id="constant-constant-id-symbol-search-text-edit-const-id-symbol-search-text-edit-1551-src-main-ml-1675680050"></a>
### ID_SYMBOL_SEARCH_TEXT_EDIT

```ml
const ID_SYMBOL_SEARCH_TEXT_EDIT = 1551
```

Defines the id symbol search text edit constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L571)

<a id="constant-constant-id-window-maximize-const-id-window-maximize-1102-src-main-ml-115901512"></a>
### ID_WINDOW_MAXIMIZE

```ml
const ID_WINDOW_MAXIMIZE = 1102
```

Defines the id window maximize constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L503)

<a id="constant-constant-id-window-minimize-const-id-window-minimize-1101-src-main-ml-1482583945"></a>
### ID_WINDOW_MINIMIZE

```ml
const ID_WINDOW_MINIMIZE = 1101
```

Defines the id window minimize constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L501)

<a id="constant-constant-id-window-restore-const-id-window-restore-1103-src-main-ml-1394889447"></a>
### ID_WINDOW_RESTORE

```ml
const ID_WINDOW_RESTORE = 1103
```

Defines the id window restore constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L505)

<a id="constant-constant-left-w-const-left-w-300-src-main-ml-1849011891"></a>
### LEFT_W

```ml
const LEFT_W = 300
```

Defines the left w constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L314)

<a id="constant-constant-line-no-w-const-line-no-w-58-src-main-ml-615708885"></a>
### LINE_NO_W

```ml
const LINE_NO_W = 58
```

Defines the line no w constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L316)

<a id="constant-constant-live-diagnostics-idle-ms-const-live-diagnostics-idle-ms-850-src-main-ml-1654836199"></a>
### LIVE_DIAGNOSTICS_IDLE_MS

```ml
const LIVE_DIAGNOSTICS_IDLE_MS = 850
```

Defines the live diagnostics idle ms constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L334)

<a id="constant-constant-log-h-const-log-h-190-src-main-ml-1646579008"></a>
### LOG_H

```ml
const LOG_H = 190
```

Defines the log h constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L318)

<a id="function-function-main-function-main-args-src-main-ml-776500952"></a>
### main

```ml
function main(args)
```

Run the program entry point.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `args` | `dynamic` | — | Command-line or caller-supplied arguments. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L8559)

<a id="constant-constant-max-tabs-const-max-tabs-8-src-main-ml-817064118"></a>
### MAX_TABS

```ml
const MAX_TABS = 8
```

Defines the max tabs constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L324)

<a id="constant-constant-max-undo-const-max-undo-80-src-main-ml-289961476"></a>
### MAX_UNDO

```ml
const MAX_UNDO = 80
```

Defines the max undo constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L326)

<a id="constant-constant-menu-h-const-menu-h-26-src-main-ml-405228806"></a>
### MENU_H

```ml
const MENU_H = 26
```

Defines the menu h constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L308)

- [NavLocation](Type-navlocation-813613489.md) — struct
<a id="constant-constant-scroll-idle-ms-const-scroll-idle-ms-180-src-main-ml-1499306445"></a>
### SCROLL_IDLE_MS

```ml
const SCROLL_IDLE_MS = 180
```

Defines the scroll idle ms constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L338)

<a id="constant-constant-status-h-const-status-h-24-src-main-ml-1024203482"></a>
### STATUS_H

```ml
const STATUS_H = 24
```

Defines the status h constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L320)

<a id="constant-constant-status-pad-const-status-pad-8-src-main-ml-1118590896"></a>
### STATUS_PAD

```ml
const STATUS_PAD = 8
```

Defines the status pad constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L322)

<a id="constant-constant-tab-h-const-tab-h-30-src-main-ml-252573627"></a>
### TAB_H

```ml
const TAB_H = 30
```

Defines the tab h constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L312)

<a id="constant-constant-tool-h-const-tool-h-70-src-main-ml-831035263"></a>
### TOOL_H

```ml
const TOOL_H = 70
```

Defines the tool h constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L310)

<a id="constant-constant-undo-group-ms-const-undo-group-ms-900-src-main-ml-1576397413"></a>
### UNDO_GROUP_MS

```ml
const UNDO_GROUP_MS = 900
```

Defines the undo group ms constant used by the main module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/main.ml#L328)
