# `src/ui/theme.ml`

[Home](README.md) · [Files](Files.md)

Provides ui theme facilities for this project.

Package: [`ui.theme`](Package-ui-theme-1662047872.md)

Reachable from entry: **yes**

## Imports

- `platform/win32.ml` as `win` → [src/platform/win32.ml](File-src-platform-win32-ml-830830664.md)

## Declarations

<a id="function-function-ui-theme-border-color-function-border-color-st-src-ui-theme-ml-592528502"></a>
### border_color

```ml
function border_color(st)
```

Return the border color for the active theme.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ui/theme.ml#L59)

<a id="function-function-ui-theme-chrome-bg-function-chrome-bg-st-src-ui-theme-ml-864302606"></a>
### chrome_bg

```ml
function chrome_bg(st)
```

Return the toolbar and status chrome background color for the active theme.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ui/theme.ml#L52)

<a id="function-function-ui-theme-editor-bg-function-editor-bg-st-src-ui-theme-ml-317831456"></a>
### editor_bg

```ml
function editor_bg(st)
```

Return the editor background color for the active theme.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ui/theme.ml#L31)

<a id="function-function-ui-theme-editor-fg-function-editor-fg-st-src-ui-theme-ml-710347208"></a>
### editor_fg

```ml
function editor_fg(st)
```

Return the editor foreground color for the active theme.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ui/theme.ml#L66)

<a id="function-function-ui-theme-gutter-bg-function-gutter-bg-st-src-ui-theme-ml-1218004248"></a>
### gutter_bg

```ml
function gutter_bg(st)
```

Return the line-number gutter background color for the active theme.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ui/theme.ml#L38)

<a id="function-function-ui-theme-is-dark-function-is-dark-st-src-ui-theme-ml-413933728"></a>
### is_dark

```ml
function is_dark(st)
```

Return true when the active theme is dark.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ui/theme.ml#L25)

<a id="function-function-ui-theme-muted-fg-function-muted-fg-st-src-ui-theme-ml-1028002086"></a>
### muted_fg

```ml
function muted_fg(st)
```

Return the muted foreground color for secondary UI text.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ui/theme.ml#L73)

<a id="function-function-ui-theme-panel-bg-function-panel-bg-st-src-ui-theme-ml-909918194"></a>
### panel_bg

```ml
function panel_bg(st)
```

Return the side and result panel background color for the active theme.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ui/theme.ml#L45)

<a id="function-function-ui-theme-syntax-color-function-syntax-color-st-kind-src-ui-theme-ml-1973974280"></a>
### syntax_color

```ml
function syntax_color(st, kind)
```

Return the syntax-highlight color for a token kind.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `kind` | `dynamic` | — | kind value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ui/theme.ml#L81)
