# `src/editor/buffer.ml`

[Home](README.md) · [Files](Files.md)

Provides editor buffer facilities for this project.

Package: [`editor.buffer`](Package-editor-buffer-1727826220.md)

Reachable from entry: **no**

## Imports

- `std/fs.ml` as `fs` → `../MiniLangCompilerML/std/fs.ml` — external dependency
- `std/string.ml` as `s` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-editor-buffer-insert-line-function-insert-line-buf-idx-text-src-editor-buffer-ml-681342136"></a>
### _insert_line

```ml
function _insert_line(buf, idx, text)
```

Insert a line into the buffer at a clamped index.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `buf` | `dynamic` | — | buf value consumed by this operation. |
| `idx` | `dynamic` | — | idx value consumed by this operation. |
| `text` | `dynamic` | — | Text consumed by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/editor/buffer.ml#L160)

<a id="function-function-editor-buffer-lines-from-text-function-lines-from-text-text-src-editor-buffer-ml-613297664"></a>
### _lines_from_text

```ml
function _lines_from_text(text)
```

Split normalized text into editable buffer lines.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/editor/buffer.ml#L54)

<a id="function-function-editor-buffer-normalize-text-function-normalize-text-text-src-editor-buffer-ml-629051104"></a>
### _normalize_text

```ml
function _normalize_text(text)
```

Normalize line endings to MiniIDE internal newline format.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/editor/buffer.ml#L47)

<a id="function-function-editor-buffer-remove-line-function-remove-line-buf-idx-src-editor-buffer-ml-1041240251"></a>
### _remove_line

```ml
function _remove_line(buf, idx)
```

Remove one line while keeping the buffer non-empty.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `buf` | `dynamic` | — | buf value consumed by this operation. |
| `idx` | `dynamic` | — | idx value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/editor/buffer.ml#L184)

<a id="function-function-editor-buffer-set-line-function-set-line-buf-idx-text-src-editor-buffer-ml-623625672"></a>
### _set_line

```ml
function _set_line(buf, idx, text)
```

Replace one buffer line and mark the buffer dirty.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `buf` | `dynamic` | — | buf value consumed by this operation. |
| `idx` | `dynamic` | — | idx value consumed by this operation. |
| `text` | `dynamic` | — | Text consumed by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/editor/buffer.ml#L148)

<a id="function-function-editor-buffer-text-from-lines-function-text-from-lines-lines-src-editor-buffer-ml-1720281488"></a>
### _text_from_lines

```ml
function _text_from_lines(lines)
```

Join buffer lines back into normalized text.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `lines` | `dynamic` | — | lines value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/editor/buffer.ml#L64)

<a id="function-function-editor-buffer-backspace-function-backspace-buf-src-editor-buffer-ml-1275070160"></a>
### backspace

```ml
function backspace(buf)
```

Delete the character before the cursor or merge with the previous line.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `buf` | `dynamic` | — | buf value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/editor/buffer.ml#L234)

<a id="function-function-editor-buffer-clamp-cursor-function-clamp-cursor-buf-src-editor-buffer-ml-696848186"></a>
### clamp_cursor

```ml
function clamp_cursor(buf)
```

Clamp cursor and scroll fields so they stay within the buffer.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `buf` | `dynamic` | — | buf value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/editor/buffer.ml#L124)

<a id="function-function-editor-buffer-current-line-function-current-line-buf-src-editor-buffer-ml-1331792558"></a>
### current_line

```ml
function current_line(buf)
```

Return the current cursor line from a text buffer.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `buf` | `dynamic` | — | buf value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/editor/buffer.ml#L114)

<a id="function-function-editor-buffer-delete-forward-function-delete-forward-buf-src-editor-buffer-ml-1623774046"></a>
### delete_forward

```ml
function delete_forward(buf)
```

Delete forward.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `buf` | `dynamic` | — | buf value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/editor/buffer.ml#L261)

<a id="function-function-editor-buffer-ensure-cursor-visible-function-ensure-cursor-visible-buf-visible-lines-src-editor-buffer-ml-2606582"></a>
### ensure_cursor_visible

```ml
function ensure_cursor_visible(buf, visible_lines)
```

Ensure cursor visible.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `buf` | `dynamic` | — | buf value consumed by this operation. |
| `visible_lines` | `dynamic` | — | visible_lines value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/editor/buffer.ml#L357)

<a id="function-function-editor-buffer-insert-text-function-insert-text-buf-text-src-editor-buffer-ml-685360723"></a>
### insert_text

```ml
function insert_text(buf, text)
```

Insert text at the current cursor position.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `buf` | `dynamic` | — | buf value consumed by this operation. |
| `text` | `dynamic` | — | Text consumed by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/editor/buffer.ml#L205)

<a id="function-function-editor-buffer-line-count-function-line-count-buf-src-editor-buffer-ml-1115540874"></a>
### line_count

```ml
function line_count(buf)
```

Return the number of lines in a text buffer.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `buf` | `dynamic` | — | buf value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/editor/buffer.ml#L107)

<a id="function-function-editor-buffer-load-file-function-load-file-path-src-editor-buffer-ml-1910050490"></a>
### load_file

```ml
function load_file(path)
```

Load a file into a normalized text buffer.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `dynamic` | — | Path of the file or directory used by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/editor/buffer.ml#L79)

<a id="function-function-editor-buffer-move-down-function-move-down-buf-src-editor-buffer-ml-438300106"></a>
### move_down

```ml
function move_down(buf)
```

Move down.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `buf` | `dynamic` | — | buf value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/editor/buffer.ml#L320)

<a id="function-function-editor-buffer-move-end-function-move-end-buf-src-editor-buffer-ml-1984802330"></a>
### move_end

```ml
function move_end(buf)
```

Move end.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `buf` | `dynamic` | — | buf value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/editor/buffer.ml#L335)

<a id="function-function-editor-buffer-move-home-function-move-home-buf-src-editor-buffer-ml-308872764"></a>
### move_home

```ml
function move_home(buf)
```

Move home.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `buf` | `dynamic` | — | buf value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/editor/buffer.ml#L328)

<a id="function-function-editor-buffer-move-left-function-move-left-buf-src-editor-buffer-ml-855193164"></a>
### move_left

```ml
function move_left(buf)
```

Move left.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `buf` | `dynamic` | — | buf value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/editor/buffer.ml#L281)

<a id="function-function-editor-buffer-move-right-function-move-right-buf-src-editor-buffer-ml-1641846218"></a>
### move_right

```ml
function move_right(buf)
```

Move right.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `buf` | `dynamic` | — | buf value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/editor/buffer.ml#L296)

<a id="function-function-editor-buffer-move-up-function-move-up-buf-src-editor-buffer-ml-1566193836"></a>
### move_up

```ml
function move_up(buf)
```

Move up.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `buf` | `dynamic` | — | buf value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/editor/buffer.ml#L312)

<a id="function-function-editor-buffer-new-buffer-function-new-buffer-path-text-src-editor-buffer-ml-966634295"></a>
### new_buffer

```ml
function new_buffer(path, text)
```

Create a normalized text buffer for a path and initial contents.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `dynamic` | — | Path of the file or directory used by the operation. |
| `text` | `dynamic` | — | Text consumed by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/editor/buffer.ml#L72)

<a id="function-function-editor-buffer-newline-function-newline-buf-src-editor-buffer-ml-1278469390"></a>
### newline

```ml
function newline(buf)
```

Split the current line at the cursor and move to the new line.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `buf` | `dynamic` | — | buf value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/editor/buffer.ml#L219)

<a id="function-function-editor-buffer-save-function-save-buf-src-editor-buffer-ml-561051910"></a>
### save

```ml
function save(buf)
```

Persist a text buffer to disk and clear its dirty flag on success.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `buf` | `dynamic` | — | buf value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/editor/buffer.ml#L95)

<a id="function-function-editor-buffer-scroll-function-scroll-buf-delta-src-editor-buffer-ml-434266126"></a>
### scroll

```ml
function scroll(buf, delta)
```

Return the scroll.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `buf` | `dynamic` | — | buf value consumed by this operation. |
| `delta` | `dynamic` | — | delta value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/editor/buffer.ml#L344)

<a id="function-function-editor-buffer-set-cursor-function-set-cursor-buf-line-col-src-editor-buffer-ml-657061884"></a>
### set_cursor

```ml
function set_cursor(buf, line, col)
```

Set cursor.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `buf` | `dynamic` | — | buf value consumed by this operation. |
| `line` | `dynamic` | — | line value consumed by this operation. |
| `col` | `dynamic` | — | col value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/editor/buffer.ml#L374)

- [editor.buffer.TextBuffer](Type-editor-buffer-textbuffer-122221611.md) — struct
<a id="function-function-editor-buffer-word-prefix-function-word-prefix-buf-src-editor-buffer-ml-363684940"></a>
### word_prefix

```ml
function word_prefix(buf)
```

Return the word prefix.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `buf` | `dynamic` | — | buf value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/editor/buffer.ml#L383)
