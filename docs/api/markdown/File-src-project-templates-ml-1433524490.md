# `src/project/templates.ml`

[Home](README.md) · [Files](Files.md)

Provides project templates facilities for this project.

Package: [`project.templates`](Package-project-templates-1433645451.md)

Reachable from entry: **yes**

## Imports

- `std/fs.ml` as `fs` → `../MiniLangCompilerML/std/fs.ml` — external dependency
- `std/string.ml` as `s` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-project-templates-config-file-function-config-file-src-project-templates-ml-706910315"></a>
### _config_file

```ml
function _config_file()
```

Build the default MiniIDE configuration file for a new project.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/project/templates.ml#L93)

<a id="function-function-project-templates-main-source-function-main-source-name-kind-src-project-templates-ml-820661422"></a>
### _main_source

```ml
function _main_source(name, kind)
```

Build the starter MiniLang source for a new project.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Name of the affected item. |
| `kind` | `dynamic` | — | kind value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/project/templates.ml#L63)

<a id="function-function-project-templates-mkdir-function-mkdir-path-src-project-templates-ml-1182415932"></a>
### _mkdir

```ml
function _mkdir(path)
```

Create a directory when it does not already exist.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `dynamic` | — | Path of the file or directory used by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/project/templates.ml#L41)

<a id="function-function-project-templates-project-file-function-project-file-name-kind-src-project-templates-ml-2106513632"></a>
### _project_file

```ml
function _project_file(name, kind)
```

Build the project metadata file for a new project.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Name of the affected item. |
| `kind` | `dynamic` | — | kind value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/project/templates.ml#L79)

<a id="function-function-project-templates-readme-function-readme-name-src-project-templates-ml-1892749422"></a>
### _readme

```ml
function _readme(name)
```

Build the starter README for a new project.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Name of the affected item. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/project/templates.ml#L99)

<a id="function-function-project-templates-safe-name-function-safe-name-name-src-project-templates-ml-1281750568"></a>
### _safe_name

```ml
function _safe_name(name)
```

Convert a project name into a safe folder and module name.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Name of the affected item. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/project/templates.ml#L50)

<a id="function-function-project-templates-test-source-function-test-source-name-src-project-templates-ml-1629336904"></a>
### _test_source

```ml
function _test_source(name)
```

Build the starter MiniLang test source for a new project.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Name of the affected item. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/project/templates.ml#L72)

<a id="function-function-project-templates-create-standard-project-function-create-standard-project-parent-name-kind-src-project-templates-ml-1923765942"></a>
### create_standard_project

```ml
function create_standard_project(parent, name, kind)
```

Create standard project.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `parent` | `dynamic` | — | parent value consumed by this operation. |
| `name` | `dynamic` | — | Name of the affected item. |
| `kind` | `dynamic` | — | kind value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/project/templates.ml#L107)

<a id="extern_function-extern-function-project-templates-createdirectoryw-extern-function-createdirectoryw-path-as-wstr-securityattributes-as-ptr-from-kernel32-dll-symbol-createdirectoryw-returns-bool-src-project-templates-ml-93297033"></a>
### CreateDirectoryW

```ml
extern function CreateDirectoryW(path as wstr, securityAttributes as ptr) from "kernel32.dll" symbol "CreateDirectoryW" returns bool
```

Creates the directory tree for a generated project template.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `wstr` | — | Path of the file or directory used by the operation. |
| `securityAttributes` | `ptr` | — | securityAttributes value consumed by this operation. |


**Returns:** Native bool result produced by the call.

[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/project/templates.ml#L26)

<a id="function-function-project-templates-path-join-function-path-join-a-b-src-project-templates-ml-1621208040"></a>
### path_join

```ml
function path_join(a, b)
```

Joins path fragments used while materializing a project template.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | a value consumed by this operation. |
| `b` | `dynamic` | — | b value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/project/templates.ml#L31)
