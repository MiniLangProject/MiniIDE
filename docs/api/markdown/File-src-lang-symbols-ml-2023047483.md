# `src/lang/symbols.ml`

[Home](README.md) · [Files](Files.md)

Provides lang symbols facilities for this project.

Package: [`lang.symbols`](Package-lang-symbols-1483137522.md)

Reachable from entry: **yes**

## Imports

- `lang/syntax.ml` as `syntax` → [src/lang/syntax.ml](File-src-lang-syntax-ml-2103667443.md)
- `std/fs.ml` as `fs` → `../MiniLangCompilerML/std/fs.ml` — external dependency
- `std/string.ml` as `s` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-lang-symbols-add-symbol-function-add-symbol-symbols-name-kind-file-line-src-lang-symbols-ml-1108696389"></a>
### _add_symbol

```ml
function _add_symbol(symbols, name, kind, file, line)
```

Add symbol.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `symbols` | `dynamic` | — | symbols value consumed by this operation. |
| `name` | `dynamic` | — | Name of the affected item. |
| `kind` | `dynamic` | — | kind value consumed by this operation. |
| `file` | `dynamic` | — | file value consumed by this operation. |
| `line` | `dynamic` | — | line value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/lang/symbols.ml#L88)

<a id="function-function-lang-symbols-completion-add-function-completion-add-items-name-prefix-limit-src-lang-symbols-ml-1973820499"></a>
### _completion_add

```ml
function _completion_add(items, name, prefix, limit)
```

Add a completion item when it is not already present.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `items` | `dynamic` | — | Items consumed or updated by the operation. |
| `name` | `dynamic` | — | Name of the affected item. |
| `prefix` | `dynamic` | — | prefix value consumed by this operation. |
| `limit` | `dynamic` | — | limit value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/lang/symbols.ml#L200)

<a id="function-function-lang-symbols-completion-has-function-completion-has-items-name-src-lang-symbols-ml-102265454"></a>
### _completion_has

```ml
function _completion_has(items, name)
```

Return true when a completion item is already present.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `items` | `dynamic` | — | Items consumed or updated by the operation. |
| `name` | `dynamic` | — | Name of the affected item. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/lang/symbols.ml#L185)

<a id="function-function-lang-symbols-has-symbol-function-has-symbol-symbols-name-src-lang-symbols-ml-1263651325"></a>
### _has_symbol

```ml
function _has_symbol(symbols, name)
```

Return true when symbol.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `symbols` | `dynamic` | — | symbols value consumed by this operation. |
| `name` | `dynamic` | — | Name of the affected item. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/lang/symbols.ml#L72)

<a id="function-function-lang-symbols-is-word-char-function-is-word-char-ch-src-lang-symbols-ml-430925392"></a>
### _is_word_char

```ml
function _is_word_char(ch)
```

Return true when a character belongs to an editor word.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ch` | `dynamic` | — | ch value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/lang/symbols.ml#L45)

<a id="function-function-lang-symbols-scan-source-function-scan-source-path-text-symbols-src-lang-symbols-ml-1586744268"></a>
### _scan_source

```ml
function _scan_source(path, text, symbols)
```

Scan source.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `dynamic` | — | Path of the file or directory used by the operation. |
| `text` | `dynamic` | — | Text consumed by the operation. |
| `symbols` | `dynamic` | — | symbols value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/lang/symbols.ml#L98)

<a id="function-function-lang-symbols-take-word-function-take-word-text-start-src-lang-symbols-ml-1057623360"></a>
### _take_word

```ml
function _take_word(text, start)
```

Read word.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed by the operation. |
| `start` | `dynamic` | — | start value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/lang/symbols.ml#L55)

<a id="function-function-lang-symbols-build-index-function-build-index-project-src-lang-symbols-ml-1420651198"></a>
### build_index

```ml
function build_index(project)
```

Build index.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `project` | `dynamic` | — | project value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/lang/symbols.ml#L162)

<a id="function-function-lang-symbols-completions-function-completions-index-prefix-src-lang-symbols-ml-1287723581"></a>
### completions

```ml
function completions(index, prefix)
```

Return completion items matching a word prefix.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `index` | `dynamic` | — | Zero-based index of the affected item. |
| `prefix` | `dynamic` | — | prefix value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/lang/symbols.ml#L211)

- [lang.symbols.Symbol](Type-lang-symbols-symbol-1041781040.md) — struct
- [lang.symbols.SymbolIndex](Type-lang-symbols-symbolindex-695056204.md) — struct
