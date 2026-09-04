# `src/project/config.ml`

[Home](README.md) · [Files](Files.md)

Provides project config facilities for this project.

Package: [`project.config`](Package-project-config-1799586142.md)

Reachable from entry: **yes**

## Imports

- `project/project.ml` as `project_model` → [src/project/project.ml](File-src-project-project-ml-1533851532.md)
- `std/fs.ml` as `fs` → `../MiniLangCompilerML/std/fs.ml` — external dependency
- `std/string.ml` as `s` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-project-config-bool-from-text-function-bool-from-text-value-default-value-src-project-config-ml-986984341"></a>
### bool_from_text

```ml
function bool_from_text(value, default_value)
```

Parse common boolean spellings used in project configuration files.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value consumed or transformed by the operation. |
| `default_value` | `dynamic` | — | default_value value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/project/config.ml#L59)

<a id="function-function-project-config-int-from-text-function-int-from-text-value-default-value-src-project-config-ml-1474678081"></a>
### int_from_text

```ml
function int_from_text(value, default_value)
```

Parse an integer and fall back when the config value is empty or invalid.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value consumed or transformed by the operation. |
| `default_value` | `dynamic` | — | default_value value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/project/config.ml#L69)

<a id="function-function-project-config-load-bool-function-load-bool-p-key-default-value-src-project-config-ml-1819221717"></a>
### load_bool

```ml
function load_bool(p, key, default_value)
```

Load a boolean key from .miniide.cfg.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | p value consumed by this operation. |
| `key` | `dynamic` | — | key value consumed by this operation. |
| `default_value` | `dynamic` | — | default_value value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/project/config.ml#L79)

<a id="function-function-project-config-load-int-function-load-int-p-key-default-value-src-project-config-ml-1448064731"></a>
### load_int

```ml
function load_int(p, key, default_value)
```

Load an integer key from .miniide.cfg.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | p value consumed by this operation. |
| `key` | `dynamic` | — | key value consumed by this operation. |
| `default_value` | `dynamic` | — | default_value value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/project/config.ml#L87)

<a id="function-function-project-config-load-value-function-load-value-p-wanted-key-default-value-src-project-config-ml-1023256339"></a>
### load_value

```ml
function load_value(p, wanted_key, default_value)
```

Load one raw key from .miniide.cfg while ignoring comments and blank lines.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | p value consumed by this operation. |
| `wanted_key` | `dynamic` | — | wanted_key value consumed by this operation. |
| `default_value` | `dynamic` | — | default_value value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/project/config.ml#L37)

<a id="function-function-project-config-path-function-path-p-src-project-config-ml-1588360249"></a>
### path

```ml
function path(p)
```

Return the project-local configuration file path.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | p value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/project/config.ml#L27)
