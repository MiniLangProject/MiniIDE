# `src/lang/index.ml`

[Home](README.md) · [Files](Files.md)

Provides lang index facilities for this project.

Package: [`lang.index`](Package-lang-index-767699927.md)

Reachable from entry: **yes**

## Imports

- `lang/symbols.ml` as `symbols` → [src/lang/symbols.ml](File-src-lang-symbols-ml-2023047483.md)
- `project/project.ml` as `project_model` → [src/project/project.ml](File-src-project-project-ml-1533851532.md)
- `std/fs.ml` as `fs` → `../MiniLangCompilerML/std/fs.ml` — external dependency
- `std/string.ml` as `s` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-lang-index-add-source-file-function-add-source-file-files-root-path-text-src-lang-index-ml-724448160"></a>
### _add_source_file

```ml
function _add_source_file(files, root, path, text)
```

Add a source file entry.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `files` | `dynamic` | — | files value consumed by this operation. |
| `root` | `dynamic` | — | root value consumed by this operation. |
| `path` | `dynamic` | — | Path of the file or directory used by the operation. |
| `text` | `dynamic` | — | Text consumed by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/lang/index.ml#L101)

<a id="function-function-lang-index-bare-target-function-bare-target-line-src-lang-index-ml-1445434037"></a>
### _bare_target

```ml
function _bare_target(line)
```

Return the unquoted import target from an import line.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `line` | `dynamic` | — | line value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/lang/index.ml#L127)

<a id="function-function-lang-index-import-alias-function-import-alias-line-src-lang-index-ml-185330319"></a>
### _import_alias

```ml
function _import_alias(line)
```

Return an import alias if present.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `line` | `dynamic` | — | line value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/lang/index.ml#L140)

<a id="function-function-lang-index-is-abs-function-is-abs-path-src-lang-index-ml-1313277050"></a>
### _is_abs

```ml
function _is_abs(path)
```

Return true when the path is absolute on Windows.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `dynamic` | — | Path of the file or directory used by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/lang/index.ml#L68)

<a id="function-function-lang-index-line-count-function-line-count-text-src-lang-index-ml-1898115136"></a>
### _line_count

```ml
function _line_count(text)
```

Return the number of display lines in a source string.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/lang/index.ml#L90)

<a id="function-function-lang-index-module-to-path-function-module-to-path-target-src-lang-index-ml-1712063478"></a>
### _module_to_path

```ml
function _module_to_path(target)
```

Return a module target converted to a likely source path.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `target` | `dynamic` | — | target value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/lang/index.ml#L149)

<a id="function-function-lang-index-quoted-target-function-quoted-target-line-src-lang-index-ml-1100050989"></a>
### _quoted_target

```ml
function _quoted_target(line)
```

Return the quoted import path from an import line.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `line` | `dynamic` | — | line value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/lang/index.ml#L116)

<a id="function-function-lang-index-relative-function-relative-root-path-src-lang-index-ml-1091799556"></a>
### _relative

```ml
function _relative(root, path)
```

Return path relative to the project root when possible.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `root` | `dynamic` | — | root value consumed by this operation. |
| `path` | `dynamic` | — | Path of the file or directory used by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/lang/index.ml#L78)

<a id="function-function-lang-index-resolve-candidate-function-resolve-candidate-root-current-file-import-paths-candidate-src-lang-index-ml-1019115604"></a>
### _resolve_candidate

```ml
function _resolve_candidate(root, current_file, import_paths, candidate)
```

Try to resolve an import candidate against the current file, root, and import paths.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `root` | `dynamic` | — | root value consumed by this operation. |
| `current_file` | `dynamic` | — | current_file value consumed by this operation. |
| `import_paths` | `dynamic` | — | import_paths value consumed by this operation. |
| `candidate` | `dynamic` | — | candidate value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/lang/index.ml#L160)

<a id="function-function-lang-index-scan-imports-function-scan-imports-root-current-file-import-paths-text-src-lang-index-ml-1891734858"></a>
### _scan_imports

```ml
function _scan_imports(root, current_file, import_paths, text)
```

Parse imports from a source file.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `root` | `dynamic` | — | root value consumed by this operation. |
| `current_file` | `dynamic` | — | current_file value consumed by this operation. |
| `import_paths` | `dynamic` | — | import_paths value consumed by this operation. |
| `text` | `dynamic` | — | Text consumed by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/lang/index.ml#L188)

<a id="function-function-lang-index-strip-line-comment-function-strip-line-comment-line-src-lang-index-ml-1330377413"></a>
### _strip_line_comment

```ml
function _strip_line_comment(line)
```

Return text before a line comment.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `line` | `dynamic` | — | line value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/lang/index.ml#L107)

<a id="function-function-lang-index-build-project-index-function-build-project-index-p-src-lang-index-ml-1893272859"></a>
### build_project_index

```ml
function build_project_index(p)
```

Build a project-wide index.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | p value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/lang/index.ml#L213)

- [lang.index.ImportRef](Type-lang-index-importref-1227774507.md) — struct
- [lang.index.ProjectIndex](Type-lang-index-projectindex-2144172196.md) — struct
- [lang.index.SourceFileInfo](Type-lang-index-sourcefileinfo-298672068.md) — struct
<a id="function-function-lang-index-summary-function-summary-idx-src-lang-index-ml-469724616"></a>
### summary

```ml
function summary(idx)
```

Return a compact summary for logs and status panels.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `idx` | `dynamic` | — | idx value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/lang/index.ml#L249)
