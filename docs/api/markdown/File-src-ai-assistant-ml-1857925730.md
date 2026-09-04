# `src/ai/assistant.ml`

[Home](README.md) · [Files](Files.md)

Provides ai assistant facilities for this project.

Package: [`ai.assistant`](Package-ai-assistant-1815574817.md)

Reachable from entry: **yes**

## Imports

- `help/language.ml` as `help_lang` → [src/help/language.ml](File-src-help-language-ml-591952903.md)
- `project/project.ml` as `project_model` → [src/project/project.ml](File-src-project-project-ml-1533851532.md)
- `std/string.ml` as `s` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-ai-assistant-active-file-text-function-active-file-text-root-current-file-active-tab-open-texts-src-ai-assistant-ml-613298016"></a>
### active_file_text

```ml
function active_file_text(root, current_file, active_tab, open_texts)
```

Return active file metadata plus a bounded source excerpt.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `root` | `dynamic` | — | root value consumed by this operation. |
| `current_file` | `dynamic` | — | current_file value consumed by this operation. |
| `active_tab` | `dynamic` | — | active_tab value consumed by this operation. |
| `open_texts` | `dynamic` | — | open_texts value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ai/assistant.ml#L125)

- [ai.assistant.AssistantConfig](Type-ai-assistant-assistantconfig-1459215933.md) — struct
<a id="function-function-ai-assistant-build-log-text-function-build-log-text-log-text-src-ai-assistant-ml-1963398539"></a>
### build_log_text

```ml
function build_log_text(log_text)
```

Return the latest build/run log for assistant diagnostics.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `log_text` | `dynamic` | — | log_text value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ai/assistant.ml#L185)

<a id="function-function-ai-assistant-excerpt-function-excerpt-text-limit-src-ai-assistant-ml-1565308137"></a>
### excerpt

```ml
function excerpt(text, limit)
```

Return text capped to a prompt-safe excerpt.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed by the operation. |
| `limit` | `dynamic` | — | limit value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ai/assistant.ml#L80)

<a id="function-function-ai-assistant-help-text-function-help-text-project-root-compiler-path-src-ai-assistant-ml-1284702302"></a>
### help_text

```ml
function help_text(project_root, compiler_path)
```

Return MiniLang reference availability for assistant tooling.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `project_root` | `dynamic` | — | project_root value consumed by this operation. |
| `compiler_path` | `dynamic` | — | Path associated with compiler. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ai/assistant.ml#L177)

<a id="function-function-ai-assistant-normalize-api-key-mode-function-normalize-api-key-mode-value-src-ai-assistant-ml-1127170026"></a>
### normalize_api_key_mode

```ml
function normalize_api_key_mode(value)
```

Normalize API-key source names accepted by the settings dialog and config file.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value consumed or transformed by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ai/assistant.ml#L63)

<a id="function-function-ai-assistant-normalize-provider-function-normalize-provider-value-src-ai-assistant-ml-1404899358"></a>
### normalize_provider

```ml
function normalize_provider(value)
```

Normalize provider names accepted by the settings dialog and config file.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value consumed or transformed by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ai/assistant.ml#L55)

<a id="function-function-ai-assistant-normalize-tool-mode-function-normalize-tool-mode-value-src-ai-assistant-ml-2031531210"></a>
### normalize_tool_mode

```ml
function normalize_tool_mode(value)
```

Normalize tool modes accepted by config and the settings dialog.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value consumed or transformed by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ai/assistant.ml#L71)

<a id="function-function-ai-assistant-open-tab-contents-text-function-open-tab-contents-text-root-open-files-open-texts-limit-each-src-ai-assistant-ml-236167525"></a>
### open_tab_contents_text

```ml
function open_tab_contents_text(root, open_files, open_texts, limit_each)
```

Return bounded source excerpts for all open editor tabs.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `root` | `dynamic` | — | root value consumed by this operation. |
| `open_files` | `dynamic` | — | open_files value consumed by this operation. |
| `open_texts` | `dynamic` | — | open_texts value consumed by this operation. |
| `limit_each` | `dynamic` | — | limit_each value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ai/assistant.ml#L143)

<a id="function-function-ai-assistant-open-tabs-text-function-open-tabs-text-root-open-files-open-dirty-active-tab-src-ai-assistant-ml-536387148"></a>
### open_tabs_text

```ml
function open_tabs_text(root, open_files, open_dirty, active_tab)
```

Return open tabs in the compact form sent to assistant tooling.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `root` | `dynamic` | — | root value consumed by this operation. |
| `open_files` | `dynamic` | — | open_files value consumed by this operation. |
| `open_dirty` | `dynamic` | — | open_dirty value consumed by this operation. |
| `active_tab` | `dynamic` | — | active_tab value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ai/assistant.ml#L107)

<a id="function-function-ai-assistant-project-files-text-function-project-files-text-root-project-files-limit-src-ai-assistant-ml-1639852307"></a>
### project_files_text

```ml
function project_files_text(root, project_files, limit)
```

Return a bounded project-file index for assistant tooling.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `root` | `dynamic` | — | root value consumed by this operation. |
| `project_files` | `dynamic` | — | project_files value consumed by this operation. |
| `limit` | `dynamic` | — | limit value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ai/assistant.ml#L158)

<a id="function-function-ai-assistant-relative-path-function-relative-path-root-path-src-ai-assistant-ml-1614722766"></a>
### relative_path

```ml
function relative_path(root, path)
```

Return a path relative to the project root when possible.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `root` | `dynamic` | — | root value consumed by this operation. |
| `path` | `dynamic` | — | Path of the file or directory used by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ai/assistant.ml#L90)

<a id="function-function-ai-assistant-tool-context-function-tool-context-project-value-compiler-path-config-current-file-open-files-open-dirty-active-tab-open-texts-latest-build-log-src-ai-assistant-ml-176518748"></a>
### tool_context

```ml
function tool_context(project_value, compiler_path, config, current_file, open_files, open_dirty, active_tab, open_texts, latest_build_log)
```

Assemble the local assistant context from IDE state snapshots.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `project_value` | `dynamic` | — | project_value value consumed by this operation. |
| `compiler_path` | `dynamic` | — | Path associated with compiler. |
| `config` | `dynamic` | — | Configuration used by the operation. |
| `current_file` | `dynamic` | — | current_file value consumed by this operation. |
| `open_files` | `dynamic` | — | open_files value consumed by this operation. |
| `open_dirty` | `dynamic` | — | open_dirty value consumed by this operation. |
| `active_tab` | `dynamic` | — | active_tab value consumed by this operation. |
| `open_texts` | `dynamic` | — | open_texts value consumed by this operation. |
| `latest_build_log` | `dynamic` | — | latest_build_log value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ai/assistant.ml#L201)
