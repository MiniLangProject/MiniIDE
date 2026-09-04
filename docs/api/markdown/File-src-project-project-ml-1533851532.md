# `src/project/project.ml`

[Home](README.md) · [Files](Files.md)

Provides project project facilities for this project.

Package: [`project.project`](Package-project-project-1812983061.md)

Reachable from entry: **yes**

## Imports

- `std/fs.ml` as `fs` → `../MiniLangCompilerML/std/fs.ml` — external dependency
- `std/string.ml` as `s` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-project-project-append-file-function-append-file-files-path-name-is-dir-depth-src-project-project-ml-1166451527"></a>
### _append_file

```ml
function _append_file(files, path, name, is_dir, depth)
```

Append file.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `files` | `dynamic` | — | files value consumed by this operation. |
| `path` | `dynamic` | — | Path of the file or directory used by the operation. |
| `name` | `dynamic` | — | Name of the affected item. |
| `is_dir` | `dynamic` | — | is_dir value consumed by this operation. |
| `depth` | `dynamic` | — | depth value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/project/project.ml#L172)

<a id="function-function-project-project-contains-string-function-contains-string-items-value-src-project-project-ml-632201594"></a>
### _contains_string

```ml
function _contains_string(items, value)
```

Return the contains string.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `items` | `dynamic` | — | Items consumed or updated by the operation. |
| `value` | `dynamic` | — | Value consumed or transformed by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/project/project.ml#L140)

<a id="function-function-project-project-dedupe-strings-function-dedupe-strings-items-src-project-project-ml-1356015363"></a>
### _dedupe_strings

```ml
function _dedupe_strings(items)
```

Remove duplicate entries from strings.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `items` | `dynamic` | — | Items consumed or updated by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/project/project.ml#L152)

<a id="function-function-project-project-parse-project-file-function-parse-project-file-path-root-src-project-project-ml-817428450"></a>
### _parse_project_file

```ml
function _parse_project_file(path, root)
```

Parse project file.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `dynamic` | — | Path of the file or directory used by the operation. |
| `root` | `dynamic` | — | root value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/project/project.ml#L236)

<a id="function-function-project-project-scan-dir-function-scan-dir-path-depth-out-files-src-project-project-ml-598517587"></a>
### _scan_dir

```ml
function _scan_dir(path, depth, out_files)
```

Scan directory.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `dynamic` | — | Path of the file or directory used by the operation. |
| `depth` | `dynamic` | — | depth value consumed by this operation. |
| `out_files` | `dynamic` | — | out_files value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/project/project.ml#L181)

<a id="function-function-project-project-sort-strings-function-sort-strings-items-src-project-project-ml-1845885793"></a>
### _sort_strings

```ml
function _sort_strings(items)
```

Sort strings.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `items` | `dynamic` | — | Items consumed or updated by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/project/project.ml#L132)

<a id="function-function-project-project-abspath-function-abspath-path-src-project-project-ml-1058620826"></a>
### abspath

```ml
function abspath(path)
```

Return the normalized absolute form of a path.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `dynamic` | — | Path of the file or directory used by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/project/project.ml#L113)

<a id="function-function-project-project-basename-function-basename-path-src-project-project-ml-1751291324"></a>
### basename

```ml
function basename(path)
```

Return the file name portion of a path.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `dynamic` | — | Path of the file or directory used by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/project/project.ml#L97)

<a id="function-function-project-project-dirname-function-dirname-path-src-project-project-ml-406938324"></a>
### dirname

```ml
function dirname(path)
```

Return the directory portion of a path.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `dynamic` | — | Path of the file or directory used by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/project/project.ml#L81)

<a id="extern_function-extern-function-project-project-getfullpathnamew-extern-function-getfullpathnamew-path-as-wstr-bufferlen-as-u32-buffer-as-buffer-filepart-as-ptr-from-kernel32-dll-symbol-getfullpathnamew-returns-u32-src-project-project-ml-75117622"></a>
### GetFullPathNameW

```ml
extern function GetFullPathNameW(path as wstr, bufferLen as u32, buffer as buffer, filePart as ptr) from "kernel32.dll" symbol "GetFullPathNameW" returns u32
```

Bind the native GetFullPathNameW API used by MiniIDE.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `wstr` | — | Path of the file or directory used by the operation. |
| `bufferLen` | `u32` | — | bufferLen value consumed by this operation. |
| `buffer` | `buffer` | — | Buffer that receives or supplies the operation data. |
| `filePart` | `ptr` | — | filePart value consumed by this operation. |


**Returns:** Native u32 result produced by the call.

[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/project/project.ml#L30)

<a id="function-function-project-project-has-ext-function-has-ext-path-ext-src-project-project-ml-823262119"></a>
### has_ext

```ml
function has_ext(path, ext)
```

Return true when a path has the requested file extension.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `dynamic` | — | Path of the file or directory used by the operation. |
| `ext` | `dynamic` | — | ext value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/project/project.ml#L126)

<a id="function-function-project-project-load-project-function-load-project-root-src-project-project-ml-1333664099"></a>
### load_project

```ml
function load_project(root)
```

Load project.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `root` | `dynamic` | — | root value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/project/project.ml#L349)

<a id="function-function-project-project-load-project-file-function-load-project-file-path-src-project-project-ml-205173262"></a>
### load_project_file

```ml
function load_project_file(path)
```

Load project file.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `dynamic` | — | Path of the file or directory used by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/project/project.ml#L375)

- [project.project.MiniProject](Type-project-project-miniproject-1273304103.md) — struct
<a id="function-function-project-project-path-join-function-path-join-a-b-src-project-project-ml-1853722372"></a>
### path_join

```ml
function path_join(a, b)
```

Joins path fragments used by the project model.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | a value consumed by this operation. |
| `b` | `dynamic` | — | b value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/project/project.ml#L71)

<a id="function-function-project-project-project-entry-path-function-project-entry-path-project-src-project-project-ml-629165400"></a>
### project_entry_path

```ml
function project_entry_path(project)
```

Return the project entry path.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `project` | `dynamic` | — | project value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/project/project.ml#L385)

<a id="function-function-project-project-project-file-path-function-project-file-path-project-src-project-project-ml-1024066472"></a>
### project_file_path

```ml
function project_file_path(project)
```

Return the project file path.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `project` | `dynamic` | — | project value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/project/project.ml#L286)

<a id="function-function-project-project-project-output-path-function-project-output-path-project-src-project-project-ml-2014693874"></a>
### project_output_path

```ml
function project_output_path(project)
```

Return the project output path.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `project` | `dynamic` | — | project value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/project/project.ml#L392)

<a id="function-function-project-project-project-test-entry-path-function-project-test-entry-path-project-src-project-project-ml-1817019038"></a>
### project_test_entry_path

```ml
function project_test_entry_path(project)
```

Return the project test entry path.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `project` | `dynamic` | — | project value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/project/project.ml#L399)

<a id="function-function-project-project-project-working-dir-path-function-project-working-dir-path-project-src-project-project-ml-1166864532"></a>
### project_working_dir_path

```ml
function project_working_dir_path(project)
```

Return the project working directory path.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `project` | `dynamic` | — | project value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/project/project.ml#L406)

- [project.project.ProjectFile](Type-project-project-projectfile-558527884.md) — struct
<a id="function-function-project-project-resolve-project-path-function-resolve-project-path-project-path-src-project-project-ml-88524739"></a>
### resolve_project_path

```ml
function resolve_project_path(project, path)
```

Resolve project path.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `project` | `dynamic` | — | project value consumed by this operation. |
| `path` | `dynamic` | — | Path of the file or directory used by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/project/project.ml#L414)

<a id="function-function-project-project-save-project-function-save-project-project-src-project-project-ml-1457065832"></a>
### save_project

```ml
function save_project(project)
```

Save project.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `project` | `dynamic` | — | project value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/project/project.ml#L305)

<a id="function-function-project-project-scan-files-function-scan-files-root-src-project-project-ml-868802743"></a>
### scan_files

```ml
function scan_files(root)
```

Scan files.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `root` | `dynamic` | — | root value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/project/project.ml#L229)

<a id="function-function-project-project-with-compile-settings-function-with-compile-settings-project-entry-output-src-project-project-ml-2113977589"></a>
### with_compile_settings

```ml
function with_compile_settings(project, entry, output)
```

Return a copy with updated compile settings.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `project` | `dynamic` | — | project value consumed by this operation. |
| `entry` | `dynamic` | — | entry value consumed by this operation. |
| `output` | `dynamic` | — | Output collection or buffer populated by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/project/project.ml#L332)

<a id="function-function-project-project-with-run-settings-function-with-run-settings-project-test-entry-run-args-working-dir-src-project-project-ml-247491095"></a>
### with_run_settings

```ml
function with_run_settings(project, test_entry, run_args, working_dir)
```

Return a copy with updated run settings.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `project` | `dynamic` | — | project value consumed by this operation. |
| `test_entry` | `dynamic` | — | test_entry value consumed by this operation. |
| `run_args` | `dynamic` | — | run_args value consumed by this operation. |
| `working_dir` | `dynamic` | — | working_dir value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/project/project.ml#L342)
