# `src/build/build_service.ml`

[Home](README.md) · [Files](Files.md)

Provides build build service facilities for this project.

Package: [`build.build_service`](Package-build-build-service-580912349.md)

Reachable from entry: **yes**

## Imports

- `std/fs.ml` as `fs` → `../MiniLangCompilerML/std/fs.ml` — external dependency
- `std/string.ml` as `s` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-build-build-service-bool-value-function-bool-value-value-default-value-src-build-build-service-ml-1374753037"></a>
### _bool_value

```ml
function _bool_value(value, default_value)
```

Read a boolean option with a default fallback.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value consumed or transformed by the operation. |
| `default_value` | `dynamic` | — | default_value value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/build/build_service.ml#L470)

<a id="function-function-build-build-service-clean-file-function-clean-file-path-src-build-build-service-ml-1400636434"></a>
### _clean_file

```ml
function _clean_file(path)
```

Clean file.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `dynamic` | — | Path of the file or directory used by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/build/build_service.ml#L711)

<a id="function-function-build-build-service-compile-paths-function-compile-paths-project-compiler-override-keep-going-max-errors-subsystem-extra-args-src-build-build-service-ml-158806787"></a>
### _compile_paths

```ml
function _compile_paths(project, compiler_override, keep_going, max_errors, subsystem, extra_args)
```

Build the compiler input, output, and log paths for a project.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `project` | `dynamic` | — | project value consumed by this operation. |
| `compiler_override` | `dynamic` | — | compiler_override value consumed by this operation. |
| `keep_going` | `dynamic` | — | keep_going value consumed by this operation. |
| `max_errors` | `dynamic` | — | max_errors value consumed by this operation. |
| `subsystem` | `dynamic` | — | subsystem value consumed by this operation. |
| `extra_args` | `dynamic` | — | extra_args value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/build/build_service.ml#L498)

<a id="function-function-build-build-service-diag-kind-function-diag-kind-prev-src-build-build-service-ml-238173490"></a>
### _diag_kind

```ml
function _diag_kind(prev)
```

Classify a compiler output line as an error, warning, or note.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `prev` | `dynamic` | — | prev value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/build/build_service.ml#L363)

<a id="function-function-build-build-service-diag-message-function-diag-message-prev-src-build-build-service-ml-1120133210"></a>
### _diag_message

```ml
function _diag_message(prev)
```

Extract the human-readable diagnostic message from compiler output.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `prev` | `dynamic` | — | prev value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/build/build_service.ml#L373)

<a id="function-function-build-build-service-dirname-function-dirname-path-src-build-build-service-ml-50686476"></a>
### _dirname

```ml
function _dirname(path)
```

Return the directory portion of a path.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `dynamic` | — | Path of the file or directory used by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/build/build_service.ml#L249)

<a id="function-function-build-build-service-ensure-dir-function-ensure-dir-path-src-build-build-service-ml-2625770"></a>
### _ensure_dir

```ml
function _ensure_dir(path)
```

Ensure directory.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `dynamic` | — | Path of the file or directory used by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/build/build_service.ml#L282)

<a id="function-function-build-build-service-failed-job-function-failed-job-log-path-command-line-compiler-message-src-build-build-service-ml-1072633993"></a>
### _failed_job

```ml
function _failed_job(log_path, command_line, compiler, message)
```

Create a completed build result for a job that could not be started.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `log_path` | `dynamic` | — | Path associated with log. |
| `command_line` | `dynamic` | — | command_line value consumed by this operation. |
| `compiler` | `dynamic` | — | compiler value consumed by this operation. |
| `message` | `dynamic` | — | Human-readable message associated with the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/build/build_service.ml#L548)

<a id="function-function-build-build-service-file-write-time-function-file-write-time-path-src-build-build-service-ml-1791838588"></a>
### _file_write_time

```ml
function _file_write_time(path)
```

Return the last write timestamp stored in Win32 file attributes.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `dynamic` | — | Path of the file or directory used by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/build/build_service.ml#L208)

<a id="function-function-build-build-service-int-value-function-int-value-value-default-value-src-build-build-service-ml-504480007"></a>
### _int_value

```ml
function _int_value(value, default_value)
```

Read an integer option with a default fallback.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value consumed or transformed by the operation. |
| `default_value` | `dynamic` | — | default_value value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/build/build_service.ml#L478)

<a id="function-function-build-build-service-is-abs-function-is-abs-path-src-build-build-service-ml-676905372"></a>
### _is_abs

```ml
function _is_abs(path)
```

Return true when a path is already absolute.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `dynamic` | — | Path of the file or directory used by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/build/build_service.ml#L265)

<a id="function-function-build-build-service-is-digit-char-function-is-digit-char-ch-src-build-build-service-ml-272872608"></a>
### _is_digit_char

```ml
function _is_digit_char(ch)
```

Return true when digit char.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ch` | `dynamic` | — | ch value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/build/build_service.ml#L314)

<a id="function-function-build-build-service-is-source-file-function-is-source-file-path-src-build-build-service-ml-1491828820"></a>
### _is_source_file

```ml
function _is_source_file(path)
```

Return true when a path points at a MiniLang source file.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `dynamic` | — | Path of the file or directory used by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/build/build_service.ml#L221)

<a id="function-function-build-build-service-last-index-of-function-last-index-of-text-ch-before-src-build-build-service-ml-1590854208"></a>
### _last_index_of

```ml
function _last_index_of(text, ch, before)
```

Return the last index of a character in a string.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed by the operation. |
| `ch` | `dynamic` | — | ch value consumed by this operation. |
| `before` | `dynamic` | — | before value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/build/build_service.ml#L301)

<a id="function-function-build-build-service-leading-int-function-leading-int-text-src-build-build-service-ml-1289697316"></a>
### _leading_int

```ml
function _leading_int(text)
```

Parse an integer prefix from a string.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/build/build_service.ml#L324)

<a id="function-function-build-build-service-line-col-from-pos-function-line-col-from-pos-file-pos-src-build-build-service-ml-893950429"></a>
### _line_col_from_pos

```ml
function _line_col_from_pos(file, pos)
```

Convert a character position into one-based line and column numbers.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `file` | `dynamic` | — | file value consumed by this operation. |
| `pos` | `dynamic` | — | pos value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/build/build_service.ml#L341)

<a id="function-function-build-build-service-parse-diag-at-function-parse-diag-at-prev-at-line-src-build-build-service-ml-1720112306"></a>
### _parse_diag_at

```ml
function _parse_diag_at(prev, at_line)
```

Parse one compiler diagnostic at a specific output line.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `prev` | `dynamic` | — | prev value consumed by this operation. |
| `at_line` | `dynamic` | — | at_line value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/build/build_service.ml#L414)

<a id="function-function-build-build-service-parse-diag-loc-function-parse-diag-loc-prev-loc-src-build-build-service-ml-194633162"></a>
### _parse_diag_loc

```ml
function _parse_diag_loc(prev, loc)
```

Parse a source location prefix from a compiler diagnostic line.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `prev` | `dynamic` | — | prev value consumed by this operation. |
| `loc` | `dynamic` | — | loc value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/build/build_service.ml#L386)

<a id="function-function-build-build-service-path-join-function-path-join-a-b-src-build-build-service-ml-919232804"></a>
### _path_join

```ml
function _path_join(a, b)
```

Joins path fragments used by build and process operations.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | a value consumed by this operation. |
| `b` | `dynamic` | — | b value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/build/build_service.ml#L239)

<a id="function-function-build-build-service-q-function-q-x-src-build-build-service-ml-354717469"></a>
### _q

```ml
function _q(x)
```

Quote a command-line argument for CreateProcess.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | `dynamic` | — | Horizontal coordinate used by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/build/build_service.ml#L231)

<a id="function-function-build-build-service-read-log-function-read-log-log-path-src-build-build-service-ml-416700031"></a>
### _read_log

```ml
function _read_log(log_path)
```

Read a build log file, returning an empty string on failure.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `log_path` | `dynamic` | — | Path associated with log. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/build/build_service.ml#L291)

<a id="function-function-build-build-service-read-ptr-function-read-ptr-buf-off-src-build-build-service-ml-893274777"></a>
### _read_ptr

```ml
function _read_ptr(buf, off)
```

Read a pointer-sized value from a byte buffer at an offset.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `buf` | `dynamic` | — | buf value consumed by this operation. |
| `off` | `dynamic` | — | off value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/build/build_service.ml#L193)

<a id="function-function-build-build-service-read-u32-function-read-u32-buf-off-src-build-build-service-ml-972939937"></a>
### _read_u32

```ml
function _read_u32(buf, off)
```

Read an unsigned 32-bit value from a byte buffer at an offset.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `buf` | `dynamic` | — | buf value consumed by this operation. |
| `off` | `dynamic` | — | off value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/build/build_service.ml#L186)

<a id="function-function-build-build-service-resolve-function-resolve-root-path-src-build-build-service-ml-1418854660"></a>
### _resolve

```ml
function _resolve(root, path)
```

Resolve a possibly relative path against the project root.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `root` | `dynamic` | — | root value consumed by this operation. |
| `path` | `dynamic` | — | Path of the file or directory used by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/build/build_service.ml#L275)

<a id="function-function-build-build-service-run-paths-function-run-paths-project-src-build-build-service-ml-340937112"></a>
### _run_paths

```ml
function _run_paths(project)
```

Build the executable and log paths used by a run job.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `project` | `dynamic` | — | project value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/build/build_service.ml#L612)

<a id="function-function-build-build-service-string-value-function-string-value-value-default-value-src-build-build-service-ml-1556973119"></a>
### _string_value

```ml
function _string_value(value, default_value)
```

Read a string option with a default fallback.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value consumed or transformed by the operation. |
| `default_value` | `dynamic` | — | default_value value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/build/build_service.ml#L486)

<a id="function-function-build-build-service-test-compile-paths-function-test-compile-paths-project-compiler-override-keep-going-max-errors-subsystem-extra-args-src-build-build-service-ml-1038379031"></a>
### _test_compile_paths

```ml
function _test_compile_paths(project, compiler_override, keep_going, max_errors, subsystem, extra_args)
```

Build the input, output, and log paths for compiling the configured tests.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `project` | `dynamic` | — | project value consumed by this operation. |
| `compiler_override` | `dynamic` | — | compiler_override value consumed by this operation. |
| `keep_going` | `dynamic` | — | keep_going value consumed by this operation. |
| `max_errors` | `dynamic` | — | max_errors value consumed by this operation. |
| `subsystem` | `dynamic` | — | subsystem value consumed by this operation. |
| `extra_args` | `dynamic` | — | extra_args value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/build/build_service.ml#L705)

<a id="function-function-build-build-service-test-compile-paths-for-entry-function-test-compile-paths-for-entry-project-test-entry-override-compiler-override-keep-going-max-errors-subsystem-extra-args-src-build-build-service-ml-1262968221"></a>
### _test_compile_paths_for_entry

```ml
function _test_compile_paths_for_entry(project, test_entry_override, compiler_override, keep_going, max_errors, subsystem, extra_args)
```

Build the input, output, and log paths for compiling tests.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `project` | `dynamic` | — | project value consumed by this operation. |
| `test_entry_override` | `dynamic` | — | test_entry_override value consumed by this operation. |
| `compiler_override` | `dynamic` | — | compiler_override value consumed by this operation. |
| `keep_going` | `dynamic` | — | keep_going value consumed by this operation. |
| `max_errors` | `dynamic` | — | max_errors value consumed by this operation. |
| `subsystem` | `dynamic` | — | subsystem value consumed by this operation. |
| `extra_args` | `dynamic` | — | extra_args value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/build/build_service.ml#L652)

<a id="function-function-build-build-service-test-output-path-function-test-output-path-root-name-src-build-build-service-ml-405232754"></a>
### _test_output_path

```ml
function _test_output_path(root, name)
```

Return the test output path.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `root` | `dynamic` | — | root value consumed by this operation. |
| `name` | `dynamic` | — | Name of the affected item. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/build/build_service.ml#L637)

<a id="function-function-build-build-service-test-run-paths-function-test-run-paths-project-src-build-build-service-ml-1306208216"></a>
### _test_run_paths

```ml
function _test_run_paths(project)
```

Build the executable and log paths used by a test run job.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `project` | `dynamic` | — | project value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/build/build_service.ml#L868)

<a id="function-function-build-build-service-u32-value-function-u32-value-value-src-build-build-service-ml-910212740"></a>
### _u32_value

```ml
function _u32_value(value)
```

Return a value clamped to the unsigned 32-bit range.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value consumed or transformed by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/build/build_service.ml#L201)

<a id="function-function-build-build-service-write-ptr-function-write-ptr-buf-off-value-src-build-build-service-ml-1513106722"></a>
### _write_ptr

```ml
function _write_ptr(buf, off, value)
```

Write a pointer-sized value into a byte buffer at an offset.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `buf` | `dynamic` | — | buf value consumed by this operation. |
| `off` | `dynamic` | — | off value consumed by this operation. |
| `value` | `dynamic` | — | Value consumed or transformed by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/build/build_service.ml#L171)

<a id="function-function-build-build-service-write-u16-function-write-u16-buf-off-value-src-build-build-service-ml-1341606014"></a>
### _write_u16

```ml
function _write_u16(buf, off, value)
```

Write an unsigned 16-bit value into a byte buffer at an offset.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `buf` | `dynamic` | — | buf value consumed by this operation. |
| `off` | `dynamic` | — | off value consumed by this operation. |
| `value` | `dynamic` | — | Value consumed or transformed by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/build/build_service.ml#L149)

<a id="function-function-build-build-service-write-u32-function-write-u32-buf-off-value-src-build-build-service-ml-2001345514"></a>
### _write_u32

```ml
function _write_u32(buf, off, value)
```

Writes an unsigned 32-bit value into a process-launch buffer.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `buf` | `dynamic` | — | buf value consumed by this operation. |
| `off` | `dynamic` | — | off value consumed by this operation. |
| `value` | `dynamic` | — | Value consumed or transformed by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/build/build_service.ml#L159)

- [build.build_service.BuildDiagnostic](Type-build-build-service-builddiagnostic-2022863388.md) — struct
- [build.build_service.BuildJob](Type-build-build-service-buildjob-999921486.md) — struct
- [build.build_service.BuildResult](Type-build-build-service-buildresult-349806958.md) — struct
<a id="function-function-build-build-service-clean-project-function-clean-project-project-src-build-build-service-ml-1914234266"></a>
### clean_project

```ml
function clean_project(project)
```

Clean project.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `project` | `dynamic` | — | project value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/build/build_service.ml#L720)

<a id="function-function-build-build-service-close-job-function-close-job-job-src-build-build-service-ml-2136467078"></a>
### close_job

```ml
function close_job(job)
```

Close native process handles held by a build job.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `job` | `dynamic` | — | job value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/build/build_service.ml#L1052)

<a id="extern_function-extern-function-build-build-service-closehandle-extern-function-closehandle-handle-as-ptr-from-kernel32-dll-symbol-closehandle-returns-bool-src-build-build-service-ml-579028571"></a>
### CloseHandle

```ml
extern function CloseHandle(handle as ptr) from "kernel32.dll" symbol "CloseHandle" returns bool
```

Bind the native CloseHandle API used by MiniIDE.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `handle` | `ptr` | — | Native or runtime handle used by the operation. |


**Returns:** Native bool result produced by the call.

[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/build/build_service.ml#L71)

<a id="function-function-build-build-service-compile-function-compile-project-src-build-build-service-ml-1276843978"></a>
### compile

```ml
function compile(project)
```

Run a compile job synchronously using project defaults.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `project` | `dynamic` | — | project value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/build/build_service.ml#L1122)

<a id="function-function-build-build-service-compile-with-compiler-function-compile-with-compiler-project-compiler-override-src-build-build-service-ml-1699224174"></a>
### compile_with_compiler

```ml
function compile_with_compiler(project, compiler_override)
```

Run a compile job synchronously with an explicit compiler path.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `project` | `dynamic` | — | project value consumed by this operation. |
| `compiler_override` | `dynamic` | — | compiler_override value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/build/build_service.ml#L1116)

<a id="function-function-build-build-service-compile-with-options-function-compile-with-options-project-compiler-override-keep-going-max-errors-subsystem-extra-args-src-build-build-service-ml-1479879787"></a>
### compile_with_options

```ml
function compile_with_options(project, compiler_override, keep_going, max_errors, subsystem, extra_args)
```

Run a compile job synchronously with explicit build options.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `project` | `dynamic` | — | project value consumed by this operation. |
| `compiler_override` | `dynamic` | — | compiler_override value consumed by this operation. |
| `keep_going` | `dynamic` | — | keep_going value consumed by this operation. |
| `max_errors` | `dynamic` | — | max_errors value consumed by this operation. |
| `subsystem` | `dynamic` | — | subsystem value consumed by this operation. |
| `extra_args` | `dynamic` | — | extra_args value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/build/build_service.ml#L1099)

<a id="constant-constant-build-build-service-create-always-const-create-always-2-src-build-build-service-ml-283860902"></a>
### CREATE_ALWAYS

```ml
const CREATE_ALWAYS = 2
```

Defines the create always constant used by the build build service module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/build/build_service.ml#L85)

<a id="constant-constant-build-build-service-create-no-window-const-create-no-window-134217728-src-build-build-service-ml-926983379"></a>
### CREATE_NO_WINDOW

```ml
const CREATE_NO_WINDOW = 134217728
```

Defines the create no window constant used by the build build service module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/build/build_service.ml#L89)

<a id="extern_function-extern-function-build-build-service-createdirectoryw-extern-function-createdirectoryw-path-as-wstr-securityattributes-as-ptr-from-kernel32-dll-symbol-createdirectoryw-returns-bool-src-build-build-service-ml-1315541033"></a>
### CreateDirectoryW

```ml
extern function CreateDirectoryW(path as wstr, securityAttributes as ptr) from "kernel32.dll" symbol "CreateDirectoryW" returns bool
```

Creates output directories required by the build service.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `wstr` | — | Path of the file or directory used by the operation. |
| `securityAttributes` | `ptr` | — | securityAttributes value consumed by this operation. |


**Returns:** Native bool result produced by the call.

[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/build/build_service.ml#L28)

<a id="extern_function-extern-function-build-build-service-createfilewinherit-extern-function-createfilewinherit-path-as-wstr-access-as-int-share-as-int-security-as-bytes-creation-as-int-flags-as-int-template-as-ptr-from-kernel32-dll-symbol-createfilew-returns-ptr-src-build-build-service-ml-749071079"></a>
### CreateFileWInherit

```ml
extern function CreateFileWInherit(path as wstr, access as int, share as int, security as bytes, creation as int, flags as int, template as ptr) from "kernel32.dll" symbol "CreateFileW" returns ptr
```

Bind the native CreateFileW API used by MiniIDE.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `wstr` | — | Path of the file or directory used by the operation. |
| `access` | `int` | — | access value consumed by this operation. |
| `share` | `int` | — | share value consumed by this operation. |
| `security` | `bytes` | — | security value consumed by this operation. |
| `creation` | `int` | — | creation value consumed by this operation. |
| `flags` | `int` | — | Bit flags controlling the operation. |
| `template` | `ptr` | — | template value consumed by this operation. |


**Returns:** Native ptr result produced by the call.

[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/build/build_service.ml#L38)

<a id="extern_function-extern-function-build-build-service-createprocessw-extern-function-createprocessw-applicationname-as-ptr-commandline-as-wstr-processattributes-as-ptr-threadattributes-as-ptr-inherithandles-as-bool-creationflags-as-u32-environment-as-ptr-currentdirectory-as-wstr-startupinfo-as-bytes-processinformation-as-bytes-from-kernel32-dll-symbol-createprocessw-returns-bool-src-build-build-service-ml-2102680395"></a>
### CreateProcessW

```ml
extern function CreateProcessW(applicationName as ptr, commandLine as wstr, processAttributes as ptr, threadAttributes as ptr, inheritHandles as bool, creationFlags as u32, environment as ptr, currentDirectory as wstr, startupInfo as bytes, processInformation as bytes) from "kernel32.dll" symbol "CreateProcessW" returns bool
```

Bind the native CreateProcessW API used by MiniIDE.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `applicationName` | `ptr` | — | applicationName value consumed by this operation. |
| `commandLine` | `wstr` | — | commandLine value consumed by this operation. |
| `processAttributes` | `ptr` | — | processAttributes value consumed by this operation. |
| `threadAttributes` | `ptr` | — | threadAttributes value consumed by this operation. |
| `inheritHandles` | `bool` | — | inheritHandles value consumed by this operation. |
| `creationFlags` | `u32` | — | creationFlags value consumed by this operation. |
| `environment` | `ptr` | — | environment value consumed by this operation. |
| `currentDirectory` | `wstr` | — | currentDirectory value consumed by this operation. |
| `startupInfo` | `bytes` | — | startupInfo value consumed by this operation. |
| `processInformation` | `bytes` | — | processInformation value consumed by this operation. |


**Returns:** Native bool result produced by the call.

[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/build/build_service.ml#L51)

<a id="function-function-build-build-service-default-compiler-function-default-compiler-project-src-build-build-service-ml-721767604"></a>
### default_compiler

```ml
function default_compiler(project)
```

Return the default self-hosted compiler path for a project.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `project` | `dynamic` | — | project value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/build/build_service.ml#L454)

<a id="constant-constant-build-build-service-file-attribute-normal-const-file-attribute-normal-128-src-build-build-service-ml-530088835"></a>
### FILE_ATTRIBUTE_NORMAL

```ml
const FILE_ATTRIBUTE_NORMAL = 128
```

Defines the file attribute normal constant used by the build build service module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/build/build_service.ml#L87)

<a id="constant-constant-build-build-service-file-share-read-const-file-share-read-1-src-build-build-service-ml-170157153"></a>
### FILE_SHARE_READ

```ml
const FILE_SHARE_READ = 1
```

Defines the file share read constant used by the build build service module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/build/build_service.ml#L81)

<a id="constant-constant-build-build-service-file-share-write-const-file-share-write-2-src-build-build-service-ml-1363289032"></a>
### FILE_SHARE_WRITE

```ml
const FILE_SHARE_WRITE = 2
```

Defines the file share write constant used by the build build service module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/build/build_service.ml#L83)

<a id="constant-constant-build-build-service-generic-write-const-generic-write-1073741824-src-build-build-service-ml-164224551"></a>
### GENERIC_WRITE

```ml
const GENERIC_WRITE = 1073741824
```

Defines the generic write constant used by the build build service module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/build/build_service.ml#L79)

<a id="extern_function-extern-function-build-build-service-getexitcodeprocess-extern-function-getexitcodeprocess-process-as-ptr-exitcode-as-bytes-from-kernel32-dll-symbol-getexitcodeprocess-returns-bool-src-build-build-service-ml-259327940"></a>
### GetExitCodeProcess

```ml
extern function GetExitCodeProcess(process as ptr, exitCode as bytes) from "kernel32.dll" symbol "GetExitCodeProcess" returns bool
```

Bind the native GetExitCodeProcess API used by MiniIDE.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `process` | `ptr` | — | process value consumed by this operation. |
| `exitCode` | `bytes` | — | exitCode value consumed by this operation. |


**Returns:** Native bool result produced by the call.

[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/build/build_service.ml#L62)

<a id="extern_function-extern-function-build-build-service-getfileattributesexw-extern-function-getfileattributesexw-path-as-wstr-infolevelid-as-int-data-as-bytes-from-kernel32-dll-symbol-getfileattributesexw-returns-bool-src-build-build-service-ml-649209346"></a>
### GetFileAttributesExW

```ml
extern function GetFileAttributesExW(path as wstr, infoLevelId as int, data as bytes) from "kernel32.dll" symbol "GetFileAttributesExW" returns bool
```

Bind the native GetFileAttributesExW API used by MiniIDE.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `wstr` | — | Path of the file or directory used by the operation. |
| `infoLevelId` | `int` | — | Identifier of info level. |
| `data` | `bytes` | — | Input data consumed by the operation. |


**Returns:** Native bool result produced by the call.

[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/build/build_service.ml#L57)

<a id="constant-constant-build-build-service-invalid-handle-value-const-invalid-handle-value-1-src-build-build-service-ml-756455606"></a>
### INVALID_HANDLE_VALUE

```ml
const INVALID_HANDLE_VALUE = -1
```

Defines the invalid handle value constant used by the build build service module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/build/build_service.ml#L77)

<a id="function-function-build-build-service-job-exit-code-function-job-exit-code-job-src-build-build-service-ml-1279818342"></a>
### job_exit_code

```ml
function job_exit_code(job)
```

Return the known exit code for a build job.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `job` | `dynamic` | — | job value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/build/build_service.ml#L1035)

<a id="function-function-build-build-service-job-is-running-function-job-is-running-job-src-build-build-service-ml-1719500302"></a>
### job_is_running

```ml
function job_is_running(job)
```

Return true when a build job is still running.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `job` | `dynamic` | — | job value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/build/build_service.ml#L1046)

<a id="function-function-build-build-service-job-log-function-job-log-job-src-build-build-service-ml-2002018334"></a>
### job_log

```ml
function job_log(job)
```

Return the current or completed build log text.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `job` | `dynamic` | — | job value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/build/build_service.ml#L1025)

<a id="function-function-build-build-service-job-started-function-job-started-job-src-build-build-service-ml-1919171252"></a>
### job_started

```ml
function job_started(job)
```

Return true when a build job was started successfully.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `job` | `dynamic` | — | job value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/build/build_service.ml#L1019)

<a id="function-function-build-build-service-needs-recompile-function-needs-recompile-project-src-build-build-service-ml-24069232"></a>
### needs_recompile

```ml
function needs_recompile(project)
```

Return true when source files are newer than the built output.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `project` | `dynamic` | — | project value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/build/build_service.ml#L933)

<a id="function-function-build-build-service-parse-diagnostics-function-parse-diagnostics-log-text-src-build-build-service-ml-1712252103"></a>
### parse_diagnostics

```ml
function parse_diagnostics(log_text)
```

Parse compiler output into structured diagnostics.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `log_text` | `dynamic` | — | log_text value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/build/build_service.ml#L428)

<a id="extern_function-extern-function-build-build-service-sleep-extern-function-sleep-ms-as-int-from-kernel32-dll-symbol-sleep-returns-void-src-build-build-service-ml-1951088383"></a>
### Sleep

```ml
extern function Sleep(ms as int) from "kernel32.dll" symbol "Sleep" returns void
```

Bind the native Sleep API used by MiniIDE.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ms` | `int` | — | ms value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/build/build_service.ml#L74)

<a id="function-function-build-build-service-start-compile-with-compiler-function-start-compile-with-compiler-project-compiler-override-src-build-build-service-ml-1413863896"></a>
### start_compile_with_compiler

```ml
function start_compile_with_compiler(project, compiler_override)
```

Start a compile job using an explicit compiler path.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `project` | `dynamic` | — | project value consumed by this operation. |
| `compiler_override` | `dynamic` | — | compiler_override value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/build/build_service.ml#L606)

<a id="function-function-build-build-service-start-compile-with-options-function-start-compile-with-options-project-compiler-override-keep-going-max-errors-subsystem-extra-args-src-build-build-service-ml-67240151"></a>
### start_compile_with_options

```ml
function start_compile_with_options(project, compiler_override, keep_going, max_errors, subsystem, extra_args)
```

Start compile with options.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `project` | `dynamic` | — | project value consumed by this operation. |
| `compiler_override` | `dynamic` | — | compiler_override value consumed by this operation. |
| `keep_going` | `dynamic` | — | keep_going value consumed by this operation. |
| `max_errors` | `dynamic` | — | max_errors value consumed by this operation. |
| `subsystem` | `dynamic` | — | subsystem value consumed by this operation. |
| `extra_args` | `dynamic` | — | extra_args value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/build/build_service.ml#L561)

<a id="function-function-build-build-service-start-run-output-function-start-run-output-project-src-build-build-service-ml-1401074864"></a>
### start_run_output

```ml
function start_run_output(project)
```

Start run output.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `project` | `dynamic` | — | project value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/build/build_service.ml#L971)

<a id="function-function-build-build-service-start-test-compile-with-options-function-start-test-compile-with-options-project-compiler-override-keep-going-max-errors-subsystem-extra-args-src-build-build-service-ml-697145633"></a>
### start_test_compile_with_options

```ml
function start_test_compile_with_options(project, compiler_override, keep_going, max_errors, subsystem, extra_args)
```

Start test compile with options.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `project` | `dynamic` | — | project value consumed by this operation. |
| `compiler_override` | `dynamic` | — | compiler_override value consumed by this operation. |
| `keep_going` | `dynamic` | — | keep_going value consumed by this operation. |
| `max_errors` | `dynamic` | — | max_errors value consumed by this operation. |
| `subsystem` | `dynamic` | — | subsystem value consumed by this operation. |
| `extra_args` | `dynamic` | — | extra_args value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/build/build_service.ml#L764)

<a id="function-function-build-build-service-start-test-file-compile-with-options-function-start-test-file-compile-with-options-project-test-file-compiler-override-keep-going-max-errors-subsystem-extra-args-src-build-build-service-ml-728997008"></a>
### start_test_file_compile_with_options

```ml
function start_test_file_compile_with_options(project, test_file, compiler_override, keep_going, max_errors, subsystem, extra_args)
```

Start compiling a specific test file as the test entry.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `project` | `dynamic` | — | project value consumed by this operation. |
| `test_file` | `dynamic` | — | test_file value consumed by this operation. |
| `compiler_override` | `dynamic` | — | compiler_override value consumed by this operation. |
| `keep_going` | `dynamic` | — | keep_going value consumed by this operation. |
| `max_errors` | `dynamic` | — | max_errors value consumed by this operation. |
| `subsystem` | `dynamic` | — | subsystem value consumed by this operation. |
| `extra_args` | `dynamic` | — | extra_args value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/build/build_service.ml#L819)

<a id="function-function-build-build-service-start-test-output-function-start-test-output-project-src-build-build-service-ml-513635990"></a>
### start_test_output

```ml
function start_test_output(project)
```

Start test output.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `project` | `dynamic` | — | project value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/build/build_service.ml#L885)

<a id="constant-constant-build-build-service-startf-useshowwindow-const-startf-useshowwindow-1-src-build-build-service-ml-1506245961"></a>
### STARTF_USESHOWWINDOW

```ml
const STARTF_USESHOWWINDOW = 1
```

Defines the startf useshowwindow constant used by the build build service module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/build/build_service.ml#L91)

<a id="constant-constant-build-build-service-startf-usestdhandles-const-startf-usestdhandles-256-src-build-build-service-ml-599136845"></a>
### STARTF_USESTDHANDLES

```ml
const STARTF_USESTDHANDLES = 256
```

Defines the startf usestdhandles constant used by the build build service module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/build/build_service.ml#L93)

<a id="constant-constant-build-build-service-still-active-const-still-active-259-src-build-build-service-ml-1423766248"></a>
### STILL_ACTIVE

```ml
const STILL_ACTIVE = 259
```

Defines the still active constant used by the build build service module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/build/build_service.ml#L97)

<a id="function-function-build-build-service-stop-job-function-stop-job-job-src-build-build-service-ml-711900922"></a>
### stop_job

```ml
function stop_job(job)
```

Terminate a running build job and preserve its latest log text.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `job` | `dynamic` | — | job value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/build/build_service.ml#L1069)

<a id="constant-constant-build-build-service-sw-hide-const-sw-hide-0-src-build-build-service-ml-73153016"></a>
### SW_HIDE

```ml
const SW_HIDE = 0
```

Defines the sw hide constant used by the build build service module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/build/build_service.ml#L95)

<a id="extern_function-extern-function-build-build-service-terminateprocess-extern-function-terminateprocess-process-as-ptr-exitcode-as-u32-from-kernel32-dll-symbol-terminateprocess-returns-bool-src-build-build-service-ml-1634444881"></a>
### TerminateProcess

```ml
extern function TerminateProcess(process as ptr, exitCode as u32) from "kernel32.dll" symbol "TerminateProcess" returns bool
```

Bind the native TerminateProcess API used by MiniIDE.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `process` | `ptr` | — | process value consumed by this operation. |
| `exitCode` | `u32` | — | exitCode value consumed by this operation. |


**Returns:** Native bool result produced by the call.

[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/build/build_service.ml#L67)
