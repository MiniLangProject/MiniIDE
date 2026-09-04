# `src/help/language.ml`

[Home](README.md) · [Files](Files.md)

Provides help language facilities for this project.

Package: [`help.language`](Package-help-language-973688870.md)

Reachable from entry: **yes**

## Imports

- `project/project.ml` as `project_model` → [src/project/project.ml](File-src-project-project-ml-1533851532.md)
- `std/fs.ml` as `fs` → `../MiniLangCompilerML/std/fs.ml` — external dependency
- `std/string.ml` as `s` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-help-language-markdown-heading-title-function-markdown-heading-title-line-src-help-language-ml-569301953"></a>
### _markdown_heading_title

```ml
function _markdown_heading_title(line)
```

Extract the visible title from a Markdown heading line.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `line` | `dynamic` | — | line value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/help/language.ml#L55)

<a id="function-function-help-language-snippet-function-snippet-line-src-help-language-ml-281659561"></a>
### _snippet

```ml
function _snippet(line)
```

Build a compact search-result snippet from one matched line.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `line` | `dynamic` | — | line value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/help/language.ml#L69)

<a id="function-function-help-language-read-reference-function-read-reference-root-compiler-path-src-help-language-ml-528458914"></a>
### read_reference

```ml
function read_reference(root, compiler_path)
```

Read reference.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `root` | `dynamic` | — | root value consumed by this operation. |
| `compiler_path` | `dynamic` | — | Path associated with compiler. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/help/language.ml#L45)

<a id="function-function-help-language-reference-path-function-reference-path-root-compiler-path-src-help-language-ml-1612605702"></a>
### reference_path

```ml
function reference_path(root, compiler_path)
```

Return the reference path.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `root` | `dynamic` | — | root value consumed by this operation. |
| `compiler_path` | `dynamic` | — | Path associated with compiler. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/help/language.ml#L28)

<a id="function-function-help-language-search-document-function-search-document-content-query-src-help-language-ml-20033608"></a>
### search_document

```ml
function search_document(content, query)
```

Search a Markdown document and return matching snippets.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `content` | `dynamic` | — | content value consumed by this operation. |
| `query` | `dynamic` | — | query value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/help/language.ml#L78)
