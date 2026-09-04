# `src/platform/win32.ml`

[Home](README.md) · [Files](Files.md)

Provides platform win32 facilities for this project.

Package: [`platform.win32`](Package-platform-win32-2090551291.md)

Reachable from entry: **yes**

## Imports

- `std/string.ml` as `s` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-platform-win32-image-list-add-shell-icon-function-image-list-add-shell-icon-image-list-path-attrs-src-platform-win32-ml-1959251868"></a>
### _image_list_add_shell_icon

```ml
function _image_list_add_shell_icon(image_list, path, attrs)
```

Return the image list add shell icon.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `image_list` | `dynamic` | — | image_list value consumed by this operation. |
| `path` | `dynamic` | — | Path of the file or directory used by the operation. |
| `attrs` | `dynamic` | — | attrs value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1149)

<a id="function-function-platform-win32-read-ptr-function-read-ptr-buf-off-src-platform-win32-ml-150567033"></a>
### _read_ptr

```ml
function _read_ptr(buf, off)
```

Read a pointer-sized value from a byte buffer at an offset.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `buf` | `dynamic` | — | buf value consumed by this operation. |
| `off` | `dynamic` | — | off value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L989)

<a id="function-function-platform-win32-read-s32-function-read-s32-buf-off-src-platform-win32-ml-327066713"></a>
### _read_s32

```ml
function _read_s32(buf, off)
```

Read a signed 32-bit value from a byte buffer at an offset.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `buf` | `dynamic` | — | buf value consumed by this operation. |
| `off` | `dynamic` | — | off value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L978)

<a id="function-function-platform-win32-read-u32-function-read-u32-buf-off-src-platform-win32-ml-1964925241"></a>
### _read_u32

```ml
function _read_u32(buf, off)
```

Read an unsigned 32-bit value from a byte buffer at an offset.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `buf` | `dynamic` | — | buf value consumed by this operation. |
| `off` | `dynamic` | — | off value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L971)

<a id="function-function-platform-win32-shell-small-icon-function-shell-small-icon-path-attrs-src-platform-win32-ml-684095116"></a>
### _shell_small_icon

```ml
function _shell_small_icon(path, attrs)
```

Return the shell small icon.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `dynamic` | — | Path of the file or directory used by the operation. |
| `attrs` | `dynamic` | — | attrs value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1135)

<a id="function-function-platform-win32-signed16-function-signed16-value-src-platform-win32-ml-1106522918"></a>
### _signed16

```ml
function _signed16(value)
```

Return the signed16.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value consumed or transformed by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1335)

<a id="function-function-platform-win32-wide-alloc-function-wide-alloc-text-src-platform-win32-ml-448296022"></a>
### _wide_alloc

```ml
function _wide_alloc(text)
```

Return the wide alloc.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1264)

<a id="function-function-platform-win32-wide-free-function-wide-free-mem-src-platform-win32-ml-48566866"></a>
### _wide_free

```ml
function _wide_free(mem)
```

Return the wide free.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `mem` | `dynamic` | — | mem value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1283)

<a id="function-function-platform-win32-write-ptr-function-write-ptr-buf-off-value-src-platform-win32-ml-1072237496"></a>
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


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L956)

<a id="function-function-platform-win32-write-u32-function-write-u32-buf-off-value-src-platform-win32-ml-1596345512"></a>
### _write_u32

```ml
function _write_u32(buf, off, value)
```

Writes an unsigned 32-bit value into a Win32 interop buffer.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `buf` | `dynamic` | — | buf value consumed by this operation. |
| `off` | `dynamic` | — | off value consumed by this operation. |
| `value` | `dynamic` | — | Value consumed or transformed by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L944)

<a id="extern_function-extern-function-platform-win32-adjustwindowrect-extern-function-adjustwindowrect-rect-as-bytes-style-as-u32-hasmenu-as-bool-from-user32-dll-symbol-adjustwindowrect-returns-bool-src-platform-win32-ml-671593035"></a>
### AdjustWindowRect

```ml
extern function AdjustWindowRect(rect as bytes, style as u32, hasMenu as bool) from "user32.dll" symbol "AdjustWindowRect" returns bool
```

Bind the native AdjustWindowRect API used by MiniIDE.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `rect` | `bytes` | — | rect value consumed by this operation. |
| `style` | `u32` | — | style value consumed by this operation. |
| `hasMenu` | `bool` | — | hasMenu value consumed by this operation. |


**Returns:** Native bool result produced by the call.

[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L535)

<a id="extern_function-extern-function-platform-win32-appendmenuwid-extern-function-appendmenuwid-menu-as-ptr-flags-as-u32-id-as-int-text-as-wstr-from-user32-dll-symbol-appendmenuw-returns-bool-src-platform-win32-ml-220039934"></a>
### AppendMenuWId

```ml
extern function AppendMenuWId(menu as ptr, flags as u32, id as int, text as wstr) from "user32.dll" symbol "AppendMenuW" returns bool
```

Bind the native AppendMenuW API used by MiniIDE.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `menu` | `ptr` | — | menu value consumed by this operation. |
| `flags` | `u32` | — | Bit flags controlling the operation. |
| `id` | `int` | — | Stable identifier of the affected item. |
| `text` | `wstr` | — | Text consumed by the operation. |


**Returns:** Native bool result produced by the call.

[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L768)

<a id="extern_function-extern-function-platform-win32-appendmenuwpopup-extern-function-appendmenuwpopup-menu-as-ptr-flags-as-u32-popup-as-ptr-text-as-wstr-from-user32-dll-symbol-appendmenuw-returns-bool-src-platform-win32-ml-696255456"></a>
### AppendMenuWPopup

```ml
extern function AppendMenuWPopup(menu as ptr, flags as u32, popup as ptr, text as wstr) from "user32.dll" symbol "AppendMenuW" returns bool
```

Bind the native AppendMenuW API used by MiniIDE.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `menu` | `ptr` | — | menu value consumed by this operation. |
| `flags` | `u32` | — | Bit flags controlling the operation. |
| `popup` | `ptr` | — | popup value consumed by this operation. |
| `text` | `wstr` | — | Text consumed by the operation. |


**Returns:** Native bool result produced by the call.

[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L775)

<a id="extern_function-extern-function-platform-win32-bringwindowtotop-extern-function-bringwindowtotop-hwnd-as-ptr-from-user32-dll-symbol-bringwindowtotop-returns-bool-src-platform-win32-ml-1169888564"></a>
### BringWindowToTop

```ml
extern function BringWindowToTop(hwnd as ptr) from "user32.dll" symbol "BringWindowToTop" returns bool
```

Bind the native BringWindowToTop API used by MiniIDE.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `ptr` | — | hwnd value consumed by this operation. |


**Returns:** Native bool result produced by the call.

[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L657)

<a id="constant-constant-platform-win32-bs-left-const-bs-left-256-src-platform-win32-ml-398579307"></a>
### BS_LEFT

```ml
const BS_LEFT = 256
```

Defines the bs left constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L247)

<a id="constant-constant-platform-win32-bs-multiline-const-bs-multiline-8192-src-platform-win32-ml-1957875540"></a>
### BS_MULTILINE

```ml
const BS_MULTILINE = 8192
```

Defines the bs multiline constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L251)

<a id="constant-constant-platform-win32-bs-pushbutton-const-bs-pushbutton-0-src-platform-win32-ml-528432150"></a>
### BS_PUSHBUTTON

```ml
const BS_PUSHBUTTON = 0
```

Defines the bs pushbutton constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L245)

<a id="constant-constant-platform-win32-bs-vcenter-const-bs-vcenter-3072-src-platform-win32-ml-140658622"></a>
### BS_VCENTER

```ml
const BS_VCENTER = 3072
```

Defines the bs vcenter constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L249)

<a id="constant-constant-platform-win32-cb-addstring-const-cb-addstring-323-src-platform-win32-ml-1222965330"></a>
### CB_ADDSTRING

```ml
const CB_ADDSTRING = 323
```

Defines the cb addstring constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L442)

<a id="constant-constant-platform-win32-cb-getcursel-const-cb-getcursel-327-src-platform-win32-ml-1338649298"></a>
### CB_GETCURSEL

```ml
const CB_GETCURSEL = 327
```

Defines the cb getcursel constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L440)

<a id="constant-constant-platform-win32-cb-setcursel-const-cb-setcursel-334-src-platform-win32-ml-468705830"></a>
### CB_SETCURSEL

```ml
const CB_SETCURSEL = 334
```

Defines the cb setcursel constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L444)

<a id="constant-constant-platform-win32-cbs-dropdownlist-const-cbs-dropdownlist-3-src-platform-win32-ml-284677169"></a>
### CBS_DROPDOWNLIST

```ml
const CBS_DROPDOWNLIST = 3
```

Defines the cbs dropdownlist constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L240)

<a id="constant-constant-platform-win32-cbs-hasstrings-const-cbs-hasstrings-512-src-platform-win32-ml-855604018"></a>
### CBS_HASSTRINGS

```ml
const CBS_HASSTRINGS = 512
```

Defines the cbs hasstrings constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L242)

<a id="constant-constant-platform-win32-cfe-bold-const-cfe-bold-1-src-platform-win32-ml-404706255"></a>
### CFE_BOLD

```ml
const CFE_BOLD = 1
```

Defines the cfe bold constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L420)

<a id="constant-constant-platform-win32-cfe-italic-const-cfe-italic-2-src-platform-win32-ml-1834063580"></a>
### CFE_ITALIC

```ml
const CFE_ITALIC = 2
```

Defines the cfe italic constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L422)

<a id="constant-constant-platform-win32-cfe-underline-const-cfe-underline-4-src-platform-win32-ml-1155498430"></a>
### CFE_UNDERLINE

```ml
const CFE_UNDERLINE = 4
```

Defines the cfe underline constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L424)

<a id="constant-constant-platform-win32-cfm-bold-const-cfm-bold-1-src-platform-win32-ml-1928301871"></a>
### CFM_BOLD

```ml
const CFM_BOLD = 1
```

Defines the cfm bold constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L410)

<a id="constant-constant-platform-win32-cfm-color-const-cfm-color-1073741824-src-platform-win32-ml-558096519"></a>
### CFM_COLOR

```ml
const CFM_COLOR = 1073741824
```

Defines the cfm color constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L416)

<a id="constant-constant-platform-win32-cfm-italic-const-cfm-italic-2-src-platform-win32-ml-860776076"></a>
### CFM_ITALIC

```ml
const CFM_ITALIC = 2
```

Defines the cfm italic constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L412)

<a id="constant-constant-platform-win32-cfm-size-const-cfm-size-2147483648-src-platform-win32-ml-532912763"></a>
### CFM_SIZE

```ml
const CFM_SIZE = 2147483648
```

Defines the cfm size constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L418)

<a id="constant-constant-platform-win32-cfm-underline-const-cfm-underline-4-src-platform-win32-ml-2115151278"></a>
### CFM_UNDERLINE

```ml
const CFM_UNDERLINE = 4
```

Defines the cfm underline constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L414)

<a id="function-function-platform-win32-char-from-code-function-char-from-code-code-src-platform-win32-ml-2058619892"></a>
### char_from_code

```ml
function char_from_code(code)
```

Return the char from code.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `code` | `dynamic` | — | code value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1413)

<a id="function-function-platform-win32-client-size-function-client-size-hwnd-src-platform-win32-ml-162915476"></a>
### client_size

```ml
function client_size(hwnd)
```

Return the client width and height for a window.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `dynamic` | — | hwnd value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1023)

<a id="function-function-platform-win32-client-to-screen-point-function-client-to-screen-point-hwnd-x-y-src-platform-win32-ml-1777664211"></a>
### client_to_screen_point

```ml
function client_to_screen_point(hwnd, x, y)
```

Convert a client coordinate to a screen coordinate.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `dynamic` | — | hwnd value consumed by this operation. |
| `x` | `dynamic` | — | Horizontal coordinate used by the operation. |
| `y` | `dynamic` | — | Vertical coordinate used by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1067)

<a id="extern_function-extern-function-platform-win32-clienttoscreen-extern-function-clienttoscreen-hwnd-as-ptr-point-as-bytes-from-user32-dll-symbol-clienttoscreen-returns-bool-src-platform-win32-ml-846097051"></a>
### ClientToScreen

```ml
extern function ClientToScreen(hwnd as ptr, point as bytes) from "user32.dll" symbol "ClientToScreen" returns bool
```

Bind the native ClientToScreen API used by MiniIDE.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `ptr` | — | hwnd value consumed by this operation. |
| `point` | `bytes` | — | point value consumed by this operation. |


**Returns:** Native bool result produced by the call.

[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L632)

<a id="function-function-platform-win32-combo-add-function-combo-add-hwnd-text-src-platform-win32-ml-456056311"></a>
### combo_add

```ml
function combo_add(hwnd, text)
```

Send the add operation to a combo box.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `dynamic` | — | hwnd value consumed by this operation. |
| `text` | `dynamic` | — | Text consumed by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1607)

<a id="function-function-platform-win32-combo-getsel-function-combo-getsel-hwnd-src-platform-win32-ml-932450546"></a>
### combo_getsel

```ml
function combo_getsel(hwnd)
```

Return selection from a combo box.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `dynamic` | — | hwnd value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1615)

<a id="function-function-platform-win32-combo-setsel-function-combo-setsel-hwnd-idx-src-platform-win32-ml-1925691099"></a>
### combo_setsel

```ml
function combo_setsel(hwnd, idx)
```

Send the selection operation to a combo box.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `dynamic` | — | hwnd value consumed by this operation. |
| `idx` | `dynamic` | — | idx value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1623)

<a id="function-function-platform-win32-create-child-function-create-child-parent-class-name-title-ex-style-style-x-y-w-h-src-platform-win32-ml-1747259839"></a>
### create_child

```ml
function create_child(parent, class_name, title, ex_style, style, x, y, w, h)
```

Create child.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `parent` | `dynamic` | — | parent value consumed by this operation. |
| `class_name` | `dynamic` | — | class_name value consumed by this operation. |
| `title` | `dynamic` | — | Human-readable title presented to the user. |
| `ex_style` | `dynamic` | — | ex_style value consumed by this operation. |
| `style` | `dynamic` | — | style value consumed by this operation. |
| `x` | `dynamic` | — | Horizontal coordinate used by the operation. |
| `y` | `dynamic` | — | Vertical coordinate used by the operation. |
| `w` | `dynamic` | — | w value consumed by this operation. |
| `h` | `dynamic` | — | h value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1463)

<a id="function-function-platform-win32-create-child-id-function-create-child-id-parent-class-name-title-ex-style-style-x-y-w-h-control-id-src-platform-win32-ml-1476509952"></a>
### create_child_id

```ml
function create_child_id(parent, class_name, title, ex_style, style, x, y, w, h, control_id)
```

Create child identifier.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `parent` | `dynamic` | — | parent value consumed by this operation. |
| `class_name` | `dynamic` | — | class_name value consumed by this operation. |
| `title` | `dynamic` | — | Human-readable title presented to the user. |
| `ex_style` | `dynamic` | — | ex_style value consumed by this operation. |
| `style` | `dynamic` | — | style value consumed by this operation. |
| `x` | `dynamic` | — | Horizontal coordinate used by the operation. |
| `y` | `dynamic` | — | Vertical coordinate used by the operation. |
| `w` | `dynamic` | — | w value consumed by this operation. |
| `h` | `dynamic` | — | h value consumed by this operation. |
| `control_id` | `dynamic` | — | Identifier of control. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1478)

<a id="function-function-platform-win32-create-directory-function-create-directory-path-src-platform-win32-ml-542963606"></a>
### create_directory

```ml
function create_directory(path)
```

Create directory.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `dynamic` | — | Path of the file or directory used by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1120)

<a id="function-function-platform-win32-create-icon-static-function-create-icon-static-parent-icon-src-platform-win32-ml-912804572"></a>
### create_icon_static

```ml
function create_icon_static(parent, icon)
```

Create icon static.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `parent` | `dynamic` | — | parent value consumed by this operation. |
| `icon` | `dynamic` | — | icon value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1190)

<a id="function-function-platform-win32-create-main-window-function-create-main-window-title-width-height-src-platform-win32-ml-928126896"></a>
### create_main_window

```ml
function create_main_window(title, width, height)
```

Create main window.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `title` | `dynamic` | — | Human-readable title presented to the user. |
| `width` | `dynamic` | — | Width in the coordinate or storage units used by the caller. |
| `height` | `dynamic` | — | Height in the coordinate or storage units used by the caller. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1430)

<a id="function-function-platform-win32-create-tab-function-create-tab-parent-control-id-src-platform-win32-ml-1363435038"></a>
### create_tab

```ml
function create_tab(parent, control_id)
```

Create tab.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `parent` | `dynamic` | — | parent value consumed by this operation. |
| `control_id` | `dynamic` | — | Identifier of control. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1493)

<a id="function-function-platform-win32-create-tree-function-create-tree-parent-control-id-src-platform-win32-ml-1437676964"></a>
### create_tree

```ml
function create_tree(parent, control_id)
```

Create tree.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `parent` | `dynamic` | — | parent value consumed by this operation. |
| `control_id` | `dynamic` | — | Identifier of control. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1485)

<a id="function-function-platform-win32-create-tree-image-list-function-create-tree-image-list-src-platform-win32-ml-2101539927"></a>
### create_tree_image_list

```ml
function create_tree_image_list()
```

Create tree image list.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1159)

<a id="extern_function-extern-function-platform-win32-createdirectoryw-extern-function-createdirectoryw-path-as-wstr-securityattributes-as-ptr-from-kernel32-dll-symbol-createdirectoryw-returns-bool-src-platform-win32-ml-1549660195"></a>
### CreateDirectoryW

```ml
extern function CreateDirectoryW(path as wstr, securityAttributes as ptr) from "kernel32.dll" symbol "CreateDirectoryW" returns bool
```

Creates directories required by the Win32 platform layer.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `wstr` | — | Path of the file or directory used by the operation. |
| `securityAttributes` | `ptr` | — | securityAttributes value consumed by this operation. |


**Returns:** Native bool result produced by the call.

[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L810)

<a id="extern_function-extern-function-platform-win32-createfontw-extern-function-createfontw-height-as-int-width-as-int-escapement-as-int-orientation-as-int-weight-as-int-italic-as-u32-underline-as-u32-strikeout-as-u32-charset-as-u32-outprecision-as-u32-clipprecision-as-u32-quality-as-u32-pitchandfamily-as-u32-face-as-wstr-from-gdi32-dll-symbol-createfontw-returns-ptr-src-platform-win32-ml-553283200"></a>
### CreateFontW

```ml
extern function CreateFontW(height as int, width as int, escapement as int, orientation as int, weight as int, italic as u32, underline as u32, strikeout as u32, charset as u32, outPrecision as u32, clipPrecision as u32, quality as u32, pitchAndFamily as u32, face as wstr) from "gdi32.dll" symbol "CreateFontW" returns ptr
```

Bind the native CreateFontW API used by MiniIDE.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `height` | `int` | — | Height in the coordinate or storage units used by the caller. |
| `width` | `int` | — | Width in the coordinate or storage units used by the caller. |
| `escapement` | `int` | — | escapement value consumed by this operation. |
| `orientation` | `int` | — | orientation value consumed by this operation. |
| `weight` | `int` | — | weight value consumed by this operation. |
| `italic` | `u32` | — | italic value consumed by this operation. |
| `underline` | `u32` | — | underline value consumed by this operation. |
| `strikeout` | `u32` | — | strikeout value consumed by this operation. |
| `charset` | `u32` | — | charset value consumed by this operation. |
| `outPrecision` | `u32` | — | outPrecision value consumed by this operation. |
| `clipPrecision` | `u32` | — | clipPrecision value consumed by this operation. |
| `quality` | `u32` | — | quality value consumed by this operation. |
| `pitchAndFamily` | `u32` | — | pitchAndFamily value consumed by this operation. |
| `face` | `wstr` | — | face value consumed by this operation. |


**Returns:** Native ptr result produced by the call.

[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L926)

<a id="extern_function-extern-function-platform-win32-createmenu-extern-function-createmenu-from-user32-dll-symbol-createmenu-returns-ptr-src-platform-win32-ml-38759646"></a>
### CreateMenu

```ml
extern function CreateMenu() from "user32.dll" symbol "CreateMenu" returns ptr
```

Bind the native CreateMenu API used by MiniIDE.


**Returns:** Native ptr result produced by the call.

[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L754)

<a id="extern_function-extern-function-platform-win32-createpen-extern-function-createpen-style-as-int-width-as-int-color-as-u32-from-gdi32-dll-symbol-createpen-returns-ptr-src-platform-win32-ml-1268069529"></a>
### CreatePen

```ml
extern function CreatePen(style as int, width as int, color as u32) from "gdi32.dll" symbol "CreatePen" returns ptr
```

Bind the native CreatePen API used by MiniIDE.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `style` | `int` | — | style value consumed by this operation. |
| `width` | `int` | — | Width in the coordinate or storage units used by the caller. |
| `color` | `u32` | — | color value consumed by this operation. |


**Returns:** Native ptr result produced by the call.

[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L891)

<a id="extern_function-extern-function-platform-win32-createpopupmenu-extern-function-createpopupmenu-from-user32-dll-symbol-createpopupmenu-returns-ptr-src-platform-win32-ml-1836539016"></a>
### CreatePopupMenu

```ml
extern function CreatePopupMenu() from "user32.dll" symbol "CreatePopupMenu" returns ptr
```

Bind the native CreatePopupMenu API used by MiniIDE.


**Returns:** Native ptr result produced by the call.

[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L757)

<a id="extern_function-extern-function-platform-win32-createsolidbrush-extern-function-createsolidbrush-color-as-u32-from-gdi32-dll-symbol-createsolidbrush-returns-ptr-src-platform-win32-ml-898429222"></a>
### CreateSolidBrush

```ml
extern function CreateSolidBrush(color as u32) from "gdi32.dll" symbol "CreateSolidBrush" returns ptr
```

Bind the native CreateSolidBrush API used by MiniIDE.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `color` | `u32` | — | color value consumed by this operation. |


**Returns:** Native ptr result produced by the call.

[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L857)

<a id="extern_function-extern-function-platform-win32-createwindowexw-extern-function-createwindowexw-exstyle-as-u32-classname-as-wstr-windowname-as-wstr-style-as-u32-x-as-int-y-as-int-width-as-int-height-as-int-parent-as-ptr-menu-as-ptr-instance-as-ptr-param-as-ptr-from-user32-dll-symbol-createwindowexw-returns-ptr-src-platform-win32-ml-2018891009"></a>
### CreateWindowExW

```ml
extern function CreateWindowExW(exStyle as u32, className as wstr, windowName as wstr, style as u32, x as int, y as int, width as int, height as int, parent as ptr, menu as ptr, instance as ptr, param as ptr) from "user32.dll" symbol "CreateWindowExW" returns ptr
```

Bind the native CreateWindowExW API used by MiniIDE.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `exStyle` | `u32` | — | exStyle value consumed by this operation. |
| `className` | `wstr` | — | className value consumed by this operation. |
| `windowName` | `wstr` | — | windowName value consumed by this operation. |
| `style` | `u32` | — | style value consumed by this operation. |
| `x` | `int` | — | Horizontal coordinate used by the operation. |
| `y` | `int` | — | Vertical coordinate used by the operation. |
| `width` | `int` | — | Width in the coordinate or storage units used by the caller. |
| `height` | `int` | — | Height in the coordinate or storage units used by the caller. |
| `parent` | `ptr` | — | parent value consumed by this operation. |
| `menu` | `ptr` | — | menu value consumed by this operation. |
| `instance` | `ptr` | — | instance value consumed by this operation. |
| `param` | `ptr` | — | param value consumed by this operation. |


**Returns:** Native ptr result produced by the call.

[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L514)

<a id="extern_function-extern-function-platform-win32-createwindowexwid-extern-function-createwindowexwid-exstyle-as-u32-classname-as-wstr-windowname-as-wstr-style-as-u32-x-as-int-y-as-int-width-as-int-height-as-int-parent-as-ptr-menuid-as-int-instance-as-ptr-param-as-ptr-from-user32-dll-symbol-createwindowexw-returns-ptr-src-platform-win32-ml-1856524977"></a>
### CreateWindowExWId

```ml
extern function CreateWindowExWId(exStyle as u32, className as wstr, windowName as wstr, style as u32, x as int, y as int, width as int, height as int, parent as ptr, menuId as int, instance as ptr, param as ptr) from "user32.dll" symbol "CreateWindowExW" returns ptr
```

Bind the native CreateWindowExW API used by MiniIDE.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `exStyle` | `u32` | — | exStyle value consumed by this operation. |
| `className` | `wstr` | — | className value consumed by this operation. |
| `windowName` | `wstr` | — | windowName value consumed by this operation. |
| `style` | `u32` | — | style value consumed by this operation. |
| `x` | `int` | — | Horizontal coordinate used by the operation. |
| `y` | `int` | — | Vertical coordinate used by the operation. |
| `width` | `int` | — | Width in the coordinate or storage units used by the caller. |
| `height` | `int` | — | Height in the coordinate or storage units used by the caller. |
| `parent` | `ptr` | — | parent value consumed by this operation. |
| `menuId` | `int` | — | Identifier of menu. |
| `instance` | `ptr` | — | instance value consumed by this operation. |
| `param` | `ptr` | — | param value consumed by this operation. |


**Returns:** Native ptr result produced by the call.

[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L529)

<a id="extern_function-extern-function-platform-win32-deleteobject-extern-function-deleteobject-obj-as-ptr-from-gdi32-dll-symbol-deleteobject-returns-bool-src-platform-win32-ml-2025008623"></a>
### DeleteObject

```ml
extern function DeleteObject(obj as ptr) from "gdi32.dll" symbol "DeleteObject" returns bool
```

Bind the native DeleteObject API used by MiniIDE.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `obj` | `ptr` | — | obj value consumed by this operation. |


**Returns:** Native bool result produced by the call.

[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L861)

<a id="function-function-platform-win32-destroy-menu-function-destroy-menu-menu-src-platform-win32-ml-505547406"></a>
### destroy_menu

```ml
function destroy_menu(menu)
```

Destroy menu.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `menu` | `dynamic` | — | menu value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1113)

<a id="extern_function-extern-function-platform-win32-destroyicon-extern-function-destroyicon-icon-as-ptr-from-user32-dll-symbol-destroyicon-returns-bool-src-platform-win32-ml-1754540481"></a>
### DestroyIcon

```ml
extern function DestroyIcon(icon as ptr) from "user32.dll" symbol "DestroyIcon" returns bool
```

Bind the native DestroyIcon API used by MiniIDE.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `icon` | `ptr` | — | icon value consumed by this operation. |


**Returns:** Native bool result produced by the call.

[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L839)

<a id="extern_function-extern-function-platform-win32-destroymenu-extern-function-destroymenu-menu-as-ptr-from-user32-dll-symbol-destroymenu-returns-bool-src-platform-win32-ml-293082405"></a>
### DestroyMenu

```ml
extern function DestroyMenu(menu as ptr) from "user32.dll" symbol "DestroyMenu" returns bool
```

Bind the native DestroyMenu API used by MiniIDE.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `menu` | `ptr` | — | menu value consumed by this operation. |


**Returns:** Native bool result produced by the call.

[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L761)

<a id="extern_function-extern-function-platform-win32-destroywindow-extern-function-destroywindow-hwnd-as-ptr-from-user32-dll-symbol-destroywindow-returns-bool-src-platform-win32-ml-1589786370"></a>
### DestroyWindow

```ml
extern function DestroyWindow(hwnd as ptr) from "user32.dll" symbol "DestroyWindow" returns bool
```

Bind the native DestroyWindow API used by MiniIDE.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `ptr` | — | hwnd value consumed by this operation. |


**Returns:** Native bool result produced by the call.

[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L548)

<a id="extern_function-extern-function-platform-win32-dispatchmessagew-extern-function-dispatchmessagew-msg-as-bytes-from-user32-dll-symbol-dispatchmessagew-returns-ptr-src-platform-win32-ml-1704832795"></a>
### DispatchMessageW

```ml
extern function DispatchMessageW(msg as bytes) from "user32.dll" symbol "DispatchMessageW" returns ptr
```

Bind the native DispatchMessageW API used by MiniIDE.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `bytes` | — | msg value consumed by this operation. |


**Returns:** Native ptr result produced by the call.

[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L578)

<a id="function-function-platform-win32-draw-line-function-draw-line-hdc-x1-y1-x2-y2-color-src-platform-win32-ml-1058222373"></a>
### draw_line

```ml
function draw_line(hdc, x1, y1, x2, y2, color)
```

Draw line.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hdc` | `dynamic` | — | hdc value consumed by this operation. |
| `x1` | `dynamic` | — | x1 value consumed by this operation. |
| `y1` | `dynamic` | — | y1 value consumed by this operation. |
| `x2` | `dynamic` | — | x2 value consumed by this operation. |
| `y2` | `dynamic` | — | y2 value consumed by this operation. |
| `color` | `dynamic` | — | color value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1233)

<a id="function-function-platform-win32-draw-text-function-draw-text-hdc-x-y-text-color-src-platform-win32-ml-1608351591"></a>
### draw_text

```ml
function draw_text(hdc, x, y, text, color)
```

Draw text.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hdc` | `dynamic` | — | hdc value consumed by this operation. |
| `x` | `dynamic` | — | Horizontal coordinate used by the operation. |
| `y` | `dynamic` | — | Vertical coordinate used by the operation. |
| `text` | `dynamic` | — | Text consumed by the operation. |
| `color` | `dynamic` | — | color value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1219)

<a id="extern_function-extern-function-platform-win32-drawmenubar-extern-function-drawmenubar-hwnd-as-ptr-from-user32-dll-symbol-drawmenubar-returns-bool-src-platform-win32-ml-212458510"></a>
### DrawMenuBar

```ml
extern function DrawMenuBar(hwnd as ptr) from "user32.dll" symbol "DrawMenuBar" returns bool
```

Bind the native DrawMenuBar API used by MiniIDE.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `ptr` | — | hwnd value consumed by this operation. |


**Returns:** Native bool result produced by the call.

[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L784)

<a id="extern_function-extern-function-platform-win32-dwmsetwindowattribute-extern-function-dwmsetwindowattribute-hwnd-as-ptr-attribute-as-u32-value-as-bytes-size-as-u32-from-dwmapi-dll-symbol-dwmsetwindowattribute-returns-int-src-platform-win32-ml-1255024304"></a>
### DwmSetWindowAttribute

```ml
extern function DwmSetWindowAttribute(hwnd as ptr, attribute as u32, value as bytes, size as u32) from "dwmapi.dll" symbol "DwmSetWindowAttribute" returns int
```

Bind the native DwmSetWindowAttribute API used by MiniIDE.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `ptr` | — | hwnd value consumed by this operation. |
| `attribute` | `u32` | — | attribute value consumed by this operation. |
| `value` | `bytes` | — | Value consumed or transformed by the operation. |
| `size` | `u32` | — | Size in the units required by the operation. |


**Returns:** Native int result produced by the call.

[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L852)

<a id="function-function-platform-win32-edit-allow-large-text-function-edit-allow-large-text-hwnd-src-platform-win32-ml-1839759754"></a>
### edit_allow_large_text

```ml
function edit_allow_large_text(hwnd)
```

Send the allow large text operation to a edit control.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `dynamic` | — | hwnd value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1782)

<a id="function-function-platform-win32-edit-char-from-pos-function-edit-char-from-pos-hwnd-x-y-src-platform-win32-ml-1955606943"></a>
### edit_char_from_pos

```ml
function edit_char_from_pos(hwnd, x, y)
```

Return char from position from a edit control.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `dynamic` | — | hwnd value consumed by this operation. |
| `x` | `dynamic` | — | Horizontal coordinate used by the operation. |
| `y` | `dynamic` | — | Vertical coordinate used by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1876)

<a id="function-function-platform-win32-edit-copy-function-edit-copy-hwnd-src-platform-win32-ml-318834330"></a>
### edit_copy

```ml
function edit_copy(hwnd)
```

Send the copy operation to a edit control.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `dynamic` | — | hwnd value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1948)

<a id="function-function-platform-win32-edit-cut-function-edit-cut-hwnd-src-platform-win32-ml-1951445946"></a>
### edit_cut

```ml
function edit_cut(hwnd)
```

Send the cut operation to a edit control.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `dynamic` | — | hwnd value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1941)

<a id="function-function-platform-win32-edit-first-visible-line-function-edit-first-visible-line-hwnd-src-platform-win32-ml-1916278788"></a>
### edit_first_visible_line

```ml
function edit_first_visible_line(hwnd)
```

Return first visible line from a edit control.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `dynamic` | — | hwnd value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1896)

<a id="function-function-platform-win32-edit-get-scroll-pos-function-edit-get-scroll-pos-hwnd-src-platform-win32-ml-1391521138"></a>
### edit_get_scroll_pos

```ml
function edit_get_scroll_pos(hwnd)
```

Return scroll position from a edit control.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `dynamic` | — | hwnd value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1903)

<a id="function-function-platform-win32-edit-get-text-function-edit-get-text-hwnd-src-platform-win32-ml-108378408"></a>
### edit_get_text

```ml
function edit_get_text(hwnd)
```

Return text from a edit control.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `dynamic` | — | hwnd value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1935)

<a id="function-function-platform-win32-edit-getsel-function-edit-getsel-hwnd-src-platform-win32-ml-1937759344"></a>
### edit_getsel

```ml
function edit_getsel(hwnd)
```

Return selection from a edit control.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `dynamic` | — | hwnd value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1841)

<a id="function-function-platform-win32-edit-is-modified-function-edit-is-modified-hwnd-src-platform-win32-ml-174700766"></a>
### edit_is_modified

```ml
function edit_is_modified(hwnd)
```

Return true when the edit control modified.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `dynamic` | — | hwnd value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1814)

<a id="function-function-platform-win32-edit-line-count-function-edit-line-count-hwnd-src-platform-win32-ml-548168052"></a>
### edit_line_count

```ml
function edit_line_count(hwnd)
```

Return line count from a edit control.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `dynamic` | — | hwnd value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1851)

<a id="function-function-platform-win32-edit-line-from-char-function-edit-line-from-char-hwnd-char-pos-src-platform-win32-ml-35287419"></a>
### edit_line_from_char

```ml
function edit_line_from_char(hwnd, char_pos)
```

Return line from char from a edit control.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `dynamic` | — | hwnd value consumed by this operation. |
| `char_pos` | `dynamic` | — | char_pos value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1889)

<a id="function-function-platform-win32-edit-line-from-pos-function-edit-line-from-pos-hwnd-x-y-src-platform-win32-ml-366196959"></a>
### edit_line_from_pos

```ml
function edit_line_from_pos(hwnd, x, y)
```

Send the line from position operation to a edit control.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `dynamic` | — | hwnd value consumed by this operation. |
| `x` | `dynamic` | — | Horizontal coordinate used by the operation. |
| `y` | `dynamic` | — | Vertical coordinate used by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1926)

<a id="function-function-platform-win32-edit-line-index-function-edit-line-index-hwnd-line-no-src-platform-win32-ml-428076402"></a>
### edit_line_index

```ml
function edit_line_index(hwnd, line_no)
```

Return line index from a edit control.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `dynamic` | — | hwnd value consumed by this operation. |
| `line_no` | `dynamic` | — | line_no value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1859)

<a id="function-function-platform-win32-edit-line-length-function-edit-line-length-hwnd-char-pos-src-platform-win32-ml-140603269"></a>
### edit_line_length

```ml
function edit_line_length(hwnd, char_pos)
```

Return line length from a edit control.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `dynamic` | — | hwnd value consumed by this operation. |
| `char_pos` | `dynamic` | — | char_pos value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1867)

<a id="function-function-platform-win32-edit-paste-function-edit-paste-hwnd-src-platform-win32-ml-1840832638"></a>
### edit_paste

```ml
function edit_paste(hwnd)
```

Send the paste operation to a edit control.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `dynamic` | — | hwnd value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1955)

<a id="function-function-platform-win32-edit-replace-sel-function-edit-replace-sel-hwnd-text-src-platform-win32-ml-1652117123"></a>
### edit_replace_sel

```ml
function edit_replace_sel(hwnd, text)
```

Send the replace selection operation to a edit control.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `dynamic` | — | hwnd value consumed by this operation. |
| `text` | `dynamic` | — | Text consumed by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1970)

<a id="function-function-platform-win32-edit-scroll-caret-function-edit-scroll-caret-hwnd-src-platform-win32-ml-831444874"></a>
### edit_scroll_caret

```ml
function edit_scroll_caret(hwnd)
```

Send the scroll caret operation to a edit control.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `dynamic` | — | hwnd value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1798)

<a id="function-function-platform-win32-edit-scroll-lines-function-edit-scroll-lines-hwnd-dx-dy-src-platform-win32-ml-1955448195"></a>
### edit_scroll_lines

```ml
function edit_scroll_lines(hwnd, dx, dy)
```

Send the scroll lines operation to a edit control.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `dynamic` | — | hwnd value consumed by this operation. |
| `dx` | `dynamic` | — | dx value consumed by this operation. |
| `dy` | `dynamic` | — | dy value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1807)

<a id="function-function-platform-win32-edit-select-all-function-edit-select-all-hwnd-src-platform-win32-ml-125607116"></a>
### edit_select_all

```ml
function edit_select_all(hwnd)
```

Send the select all operation to a edit control.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `dynamic` | — | hwnd value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1962)

<a id="function-function-platform-win32-edit-set-background-function-edit-set-background-hwnd-color-src-platform-win32-ml-154013123"></a>
### edit_set_background

```ml
function edit_set_background(hwnd, color)
```

Send the set background operation to a edit control.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `dynamic` | — | hwnd value consumed by this operation. |
| `color` | `dynamic` | — | color value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1979)

<a id="function-function-platform-win32-edit-set-modified-function-edit-set-modified-hwnd-modified-src-platform-win32-ml-1102730909"></a>
### edit_set_modified

```ml
function edit_set_modified(hwnd, modified)
```

Send the set modified operation to a edit control.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `dynamic` | — | hwnd value consumed by this operation. |
| `modified` | `dynamic` | — | modified value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1822)

<a id="function-function-platform-win32-edit-set-readonly-function-edit-set-readonly-hwnd-readonly-src-platform-win32-ml-802633920"></a>
### edit_set_readonly

```ml
function edit_set_readonly(hwnd, readonly)
```

Send the set readonly operation to a edit control.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `dynamic` | — | hwnd value consumed by this operation. |
| `readonly` | `dynamic` | — | readonly value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1832)

<a id="function-function-platform-win32-edit-set-redraw-function-edit-set-redraw-hwnd-enabled-src-platform-win32-ml-156210639"></a>
### edit_set_redraw

```ml
function edit_set_redraw(hwnd, enabled)
```

Send the set redraw operation to a edit control.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `dynamic` | — | hwnd value consumed by this operation. |
| `enabled` | `dynamic` | — | enabled value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L2090)

<a id="function-function-platform-win32-edit-set-scroll-pos-function-edit-set-scroll-pos-hwnd-x-y-src-platform-win32-ml-309930355"></a>
### edit_set_scroll_pos

```ml
function edit_set_scroll_pos(hwnd, x, y)
```

Send the set scroll position operation to a edit control.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `dynamic` | — | hwnd value consumed by this operation. |
| `x` | `dynamic` | — | Horizontal coordinate used by the operation. |
| `y` | `dynamic` | — | Vertical coordinate used by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1914)

<a id="function-function-platform-win32-edit-setsel-function-edit-setsel-hwnd-start-pos-end-pos-src-platform-win32-ml-1339103201"></a>
### edit_setsel

```ml
function edit_setsel(hwnd, start_pos, end_pos)
```

Send the selection operation to a edit control.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `dynamic` | — | hwnd value consumed by this operation. |
| `start_pos` | `dynamic` | — | start_pos value consumed by this operation. |
| `end_pos` | `dynamic` | — | end_pos value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1791)

<a id="constant-constant-platform-win32-em-charfrompos-const-em-charfrompos-215-src-platform-win32-ml-1775771406"></a>
### EM_CHARFROMPOS

```ml
const EM_CHARFROMPOS = 215
```

Defines the em charfrompos constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L384)

<a id="constant-constant-platform-win32-em-getfirstvisibleline-const-em-getfirstvisibleline-206-src-platform-win32-ml-333266678"></a>
### EM_GETFIRSTVISIBLELINE

```ml
const EM_GETFIRSTVISIBLELINE = 206
```

Defines the em getfirstvisibleline constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L382)

<a id="constant-constant-platform-win32-em-getline-const-em-getline-196-src-platform-win32-ml-158730446"></a>
### EM_GETLINE

```ml
const EM_GETLINE = 196
```

Defines the em getline constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L378)

<a id="constant-constant-platform-win32-em-getlinecount-const-em-getlinecount-186-src-platform-win32-ml-262202123"></a>
### EM_GETLINECOUNT

```ml
const EM_GETLINECOUNT = 186
```

Defines the em getlinecount constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L372)

<a id="constant-constant-platform-win32-em-getmodify-const-em-getmodify-184-src-platform-win32-ml-1140480457"></a>
### EM_GETMODIFY

```ml
const EM_GETMODIFY = 184
```

Defines the em getmodify constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L368)

<a id="constant-constant-platform-win32-em-getscrollpos-const-em-getscrollpos-1245-src-platform-win32-ml-1664837888"></a>
### EM_GETSCROLLPOS

```ml
const EM_GETSCROLLPOS = 1245
```

Defines the em getscrollpos constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L394)

<a id="constant-constant-platform-win32-em-getsel-const-em-getsel-176-src-platform-win32-ml-150802012"></a>
### EM_GETSEL

```ml
const EM_GETSEL = 176
```

Defines the em getsel constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L360)

<a id="constant-constant-platform-win32-em-gettextex-const-em-gettextex-1118-src-platform-win32-ml-1659098879"></a>
### EM_GETTEXTEX

```ml
const EM_GETTEXTEX = 1118
```

Defines the em gettextex constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L386)

<a id="constant-constant-platform-win32-em-linefromchar-const-em-linefromchar-201-src-platform-win32-ml-859147635"></a>
### EM_LINEFROMCHAR

```ml
const EM_LINEFROMCHAR = 201
```

Defines the em linefromchar constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L380)

<a id="constant-constant-platform-win32-em-lineindex-const-em-lineindex-187-src-platform-win32-ml-489451316"></a>
### EM_LINEINDEX

```ml
const EM_LINEINDEX = 187
```

Defines the em lineindex constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L374)

<a id="constant-constant-platform-win32-em-linelength-const-em-linelength-193-src-platform-win32-ml-1745154117"></a>
### EM_LINELENGTH

```ml
const EM_LINELENGTH = 193
```

Defines the em linelength constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L376)

<a id="constant-constant-platform-win32-em-linescroll-const-em-linescroll-182-src-platform-win32-ml-1143165531"></a>
### EM_LINESCROLL

```ml
const EM_LINESCROLL = 182
```

Defines the em linescroll constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L364)

<a id="constant-constant-platform-win32-em-replacesel-const-em-replacesel-194-src-platform-win32-ml-1011493892"></a>
### EM_REPLACESEL

```ml
const EM_REPLACESEL = 194
```

Defines the em replacesel constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L398)

<a id="constant-constant-platform-win32-em-scrollcaret-const-em-scrollcaret-183-src-platform-win32-ml-1114734152"></a>
### EM_SCROLLCARET

```ml
const EM_SCROLLCARET = 183
```

Defines the em scrollcaret constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L366)

<a id="constant-constant-platform-win32-em-setbkgndcolor-const-em-setbkgndcolor-1091-src-platform-win32-ml-571886121"></a>
### EM_SETBKGNDCOLOR

```ml
const EM_SETBKGNDCOLOR = 1091
```

Defines the em setbkgndcolor constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L390)

<a id="constant-constant-platform-win32-em-setcharformat-const-em-setcharformat-1092-src-platform-win32-ml-445390004"></a>
### EM_SETCHARFORMAT

```ml
const EM_SETCHARFORMAT = 1092
```

Defines the em setcharformat constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L388)

<a id="constant-constant-platform-win32-em-setlimittext-const-em-setlimittext-197-src-platform-win32-ml-834938281"></a>
### EM_SETLIMITTEXT

```ml
const EM_SETLIMITTEXT = 197
```

Defines the em setlimittext constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L358)

<a id="constant-constant-platform-win32-em-setmodify-const-em-setmodify-185-src-platform-win32-ml-1774870974"></a>
### EM_SETMODIFY

```ml
const EM_SETMODIFY = 185
```

Defines the em setmodify constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L370)

<a id="constant-constant-platform-win32-em-setreadonly-const-em-setreadonly-207-src-platform-win32-ml-926501033"></a>
### EM_SETREADONLY

```ml
const EM_SETREADONLY = 207
```

Defines the em setreadonly constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L392)

<a id="constant-constant-platform-win32-em-setscrollpos-const-em-setscrollpos-1246-src-platform-win32-ml-996602517"></a>
### EM_SETSCROLLPOS

```ml
const EM_SETSCROLLPOS = 1246
```

Defines the em setscrollpos constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L396)

<a id="constant-constant-platform-win32-em-setsel-const-em-setsel-177-src-platform-win32-ml-554091327"></a>
### EM_SETSEL

```ml
const EM_SETSEL = 177
```

Defines the em setsel constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L362)

<a id="constant-constant-platform-win32-en-change-const-en-change-768-src-platform-win32-ml-710206737"></a>
### EN_CHANGE

```ml
const EN_CHANGE = 768
```

Defines the en change constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L438)

<a id="constant-constant-platform-win32-es-autohscroll-const-es-autohscroll-128-src-platform-win32-ml-834347999"></a>
### ES_AUTOHSCROLL

```ml
const ES_AUTOHSCROLL = 128
```

Defines the es autohscroll constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L224)

<a id="constant-constant-platform-win32-es-autovscroll-const-es-autovscroll-64-src-platform-win32-ml-553558334"></a>
### ES_AUTOVSCROLL

```ml
const ES_AUTOVSCROLL = 64
```

Defines the es autovscroll constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L222)

<a id="constant-constant-platform-win32-es-multiline-const-es-multiline-4-src-platform-win32-ml-366884788"></a>
### ES_MULTILINE

```ml
const ES_MULTILINE = 4
```

Defines the es multiline constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L216)

<a id="constant-constant-platform-win32-es-nohidesel-const-es-nohidesel-256-src-platform-win32-ml-251407309"></a>
### ES_NOHIDESEL

```ml
const ES_NOHIDESEL = 256
```

Defines the es nohidesel constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L226)

<a id="constant-constant-platform-win32-es-password-const-es-password-32-src-platform-win32-ml-380055157"></a>
### ES_PASSWORD

```ml
const ES_PASSWORD = 32
```

Defines the es password constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L220)

<a id="constant-constant-platform-win32-es-readonly-const-es-readonly-2048-src-platform-win32-ml-1748858130"></a>
### ES_READONLY

```ml
const ES_READONLY = 2048
```

Defines the es readonly constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L228)

<a id="constant-constant-platform-win32-es-right-const-es-right-2-src-platform-win32-ml-741012308"></a>
### ES_RIGHT

```ml
const ES_RIGHT = 2
```

Defines the es right constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L218)

<a id="constant-constant-platform-win32-es-wantreturn-const-es-wantreturn-4096-src-platform-win32-ml-185227827"></a>
### ES_WANTRETURN

```ml
const ES_WANTRETURN = 4096
```

Defines the es wantreturn constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L230)

<a id="constant-constant-platform-win32-file-attribute-directory-const-file-attribute-directory-16-src-platform-win32-ml-559850655"></a>
### FILE_ATTRIBUTE_DIRECTORY

```ml
const FILE_ATTRIBUTE_DIRECTORY = 16
```

Defines the file attribute directory constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L474)

<a id="constant-constant-platform-win32-file-attribute-normal-const-file-attribute-normal-128-src-platform-win32-ml-1014380007"></a>
### FILE_ATTRIBUTE_NORMAL

```ml
const FILE_ATTRIBUTE_NORMAL = 128
```

Defines the file attribute normal constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L476)

<a id="constant-constant-platform-win32-file-attribute-readonly-const-file-attribute-readonly-1-src-platform-win32-ml-274133521"></a>
### FILE_ATTRIBUTE_READONLY

```ml
const FILE_ATTRIBUTE_READONLY = 1
```

Defines the file attribute readonly constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L472)

<a id="function-function-platform-win32-fill-rect-function-fill-rect-hdc-x-y-w-h-color-src-platform-win32-ml-1733390547"></a>
### fill_rect

```ml
function fill_rect(hdc, x, y, w, h, color)
```

Fill rect.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hdc` | `dynamic` | — | hdc value consumed by this operation. |
| `x` | `dynamic` | — | Horizontal coordinate used by the operation. |
| `y` | `dynamic` | — | Vertical coordinate used by the operation. |
| `w` | `dynamic` | — | w value consumed by this operation. |
| `h` | `dynamic` | — | h value consumed by this operation. |
| `color` | `dynamic` | — | color value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1204)

<a id="extern_function-extern-function-platform-win32-fillrect-extern-function-fillrect-hdc-as-ptr-rect-as-bytes-brush-as-ptr-from-user32-dll-symbol-fillrect-returns-int-src-platform-win32-ml-1762805065"></a>
### FillRect

```ml
extern function FillRect(hdc as ptr, rect as bytes, brush as ptr) from "user32.dll" symbol "FillRect" returns int
```

Bind the native FillRect API used by MiniIDE.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hdc` | `ptr` | — | hdc value consumed by this operation. |
| `rect` | `bytes` | — | rect value consumed by this operation. |
| `brush` | `ptr` | — | brush value consumed by this operation. |


**Returns:** Native int result produced by the call.

[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L867)

<a id="constant-constant-platform-win32-fw-bold-const-fw-bold-700-src-platform-win32-ml-2104877947"></a>
### FW_BOLD

```ml
const FW_BOLD = 700
```

Defines the fw bold constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L70)

<a id="constant-constant-platform-win32-fw-normal-const-fw-normal-400-src-platform-win32-ml-926484702"></a>
### FW_NORMAL

```ml
const FW_NORMAL = 400
```

Defines the fw normal constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L68)

<a id="function-function-platform-win32-get-control-text-function-get-control-text-hwnd-src-platform-win32-ml-231990846"></a>
### get_control_text

```ml
function get_control_text(hwnd)
```

Return control text.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `dynamic` | — | hwnd value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1562)

<a id="function-function-platform-win32-get-plain-window-text-function-get-plain-window-text-hwnd-src-platform-win32-ml-1678352718"></a>
### get_plain_window_text

```ml
function get_plain_window_text(hwnd)
```

Return plain window text.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `dynamic` | — | hwnd value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1548)

<a id="function-function-platform-win32-get-window-text-function-get-window-text-hwnd-src-platform-win32-ml-882893052"></a>
### get_window_text

```ml
function get_window_text(hwnd)
```

Return window text.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `dynamic` | — | hwnd value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1528)

<a id="extern_function-extern-function-platform-win32-getasynckeystate-extern-function-getasynckeystate-vkey-as-int-from-user32-dll-symbol-getasynckeystate-returns-int-src-platform-win32-ml-298760484"></a>
### GetAsyncKeyState

```ml
extern function GetAsyncKeyState(vkey as int) from "user32.dll" symbol "GetAsyncKeyState" returns int
```

Bind the native GetAsyncKeyState API used by MiniIDE.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vkey` | `int` | — | vkey value consumed by this operation. |


**Returns:** Native int result produced by the call.

[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L582)

<a id="extern_function-extern-function-platform-win32-getclientrect-extern-function-getclientrect-hwnd-as-ptr-rect-as-bytes-from-user32-dll-symbol-getclientrect-returns-bool-src-platform-win32-ml-2075304100"></a>
### GetClientRect

```ml
extern function GetClientRect(hwnd as ptr, rect as bytes) from "user32.dll" symbol "GetClientRect" returns bool
```

Bind the native GetClientRect API used by MiniIDE.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `ptr` | — | hwnd value consumed by this operation. |
| `rect` | `bytes` | — | rect value consumed by this operation. |


**Returns:** Native bool result produced by the call.

[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L562)

<a id="extern_function-extern-function-platform-win32-getcursorpos-extern-function-getcursorpos-point-as-bytes-from-user32-dll-symbol-getcursorpos-returns-bool-src-platform-win32-ml-1804667110"></a>
### GetCursorPos

```ml
extern function GetCursorPos(point as bytes) from "user32.dll" symbol "GetCursorPos" returns bool
```

Bind the native GetCursorPos API used by MiniIDE.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `point` | `bytes` | — | point value consumed by this operation. |


**Returns:** Native bool result produced by the call.

[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L601)

<a id="extern_function-extern-function-platform-win32-getdc-extern-function-getdc-hwnd-as-ptr-from-user32-dll-symbol-getdc-returns-ptr-src-platform-win32-ml-1175019975"></a>
### GetDC

```ml
extern function GetDC(hwnd as ptr) from "user32.dll" symbol "GetDC" returns ptr
```

Bind the native GetDC API used by MiniIDE.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `ptr` | — | hwnd value consumed by this operation. |


**Returns:** Native ptr result produced by the call.

[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L552)

<a id="extern_function-extern-function-platform-win32-getforegroundwindow-extern-function-getforegroundwindow-from-user32-dll-symbol-getforegroundwindow-returns-ptr-src-platform-win32-ml-2000946692"></a>
### GetForegroundWindow

```ml
extern function GetForegroundWindow() from "user32.dll" symbol "GetForegroundWindow" returns ptr
```

Bind the native GetForegroundWindow API used by MiniIDE.


**Returns:** Native ptr result produced by the call.

[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L613)

<a id="extern_function-extern-function-platform-win32-getopenfilenamew-extern-function-getopenfilenamew-ofn-as-bytes-from-comdlg32-dll-symbol-getopenfilenamew-returns-bool-src-platform-win32-ml-555694176"></a>
### GetOpenFileNameW

```ml
extern function GetOpenFileNameW(ofn as bytes) from "comdlg32.dll" symbol "GetOpenFileNameW" returns bool
```

Bind the native GetOpenFileNameW API used by MiniIDE.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ofn` | `bytes` | — | ofn value consumed by this operation. |


**Returns:** Native bool result produced by the call.

[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L805)

<a id="extern_function-extern-function-platform-win32-gettickcount-extern-function-gettickcount-from-kernel32-dll-symbol-gettickcount-returns-u32-src-platform-win32-ml-717315271"></a>
### GetTickCount

```ml
extern function GetTickCount() from "kernel32.dll" symbol "GetTickCount" returns u32
```

Bind the native GetTickCount API used by MiniIDE.


**Returns:** Native u32 result produced by the call.

[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L751)

<a id="extern_function-extern-function-platform-win32-getwindowtextlengthw-extern-function-getwindowtextlengthw-hwnd-as-ptr-from-user32-dll-symbol-getwindowtextlengthw-returns-int-src-platform-win32-ml-1706774419"></a>
### GetWindowTextLengthW

```ml
extern function GetWindowTextLengthW(hwnd as ptr) from "user32.dll" symbol "GetWindowTextLengthW" returns int
```

Bind the native GetWindowTextLengthW API used by MiniIDE.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `ptr` | — | hwnd value consumed by this operation. |


**Returns:** Native int result produced by the call.

[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L591)

<a id="extern_function-extern-function-platform-win32-getwindowtextw-extern-function-getwindowtextw-hwnd-as-ptr-buffer-as-buffer-maxcount-as-int-from-user32-dll-symbol-getwindowtextw-returns-int-src-platform-win32-ml-37266091"></a>
### GetWindowTextW

```ml
extern function GetWindowTextW(hwnd as ptr, buffer as buffer, maxCount as int) from "user32.dll" symbol "GetWindowTextW" returns int
```

Bind the native GetWindowTextW API used by MiniIDE.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `ptr` | — | hwnd value consumed by this operation. |
| `buffer` | `buffer` | — | Buffer that receives or supplies the operation data. |
| `maxCount` | `int` | — | Number of max to process. |


**Returns:** Native int result produced by the call.

[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L597)

<a id="extern_function-extern-function-platform-win32-globalalloc-extern-function-globalalloc-flags-as-u32-size-as-u32-from-kernel32-dll-symbol-globalalloc-returns-ptr-src-platform-win32-ml-1528092941"></a>
### GlobalAlloc

```ml
extern function GlobalAlloc(flags as u32, size as u32) from "kernel32.dll" symbol "GlobalAlloc" returns ptr
```

Bind the native GlobalAlloc API used by MiniIDE.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `flags` | `u32` | — | Bit flags controlling the operation. |
| `size` | `u32` | — | Size in the units required by the operation. |


**Returns:** Native ptr result produced by the call.

[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L717)

<a id="extern_function-extern-function-platform-win32-globalfree-extern-function-globalfree-mem-as-ptr-from-kernel32-dll-symbol-globalfree-returns-ptr-src-platform-win32-ml-1046219033"></a>
### GlobalFree

```ml
extern function GlobalFree(mem as ptr) from "kernel32.dll" symbol "GlobalFree" returns ptr
```

Bind the native GlobalFree API used by MiniIDE.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `mem` | `ptr` | — | mem value consumed by this operation. |


**Returns:** Native ptr result produced by the call.

[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L721)

<a id="constant-constant-platform-win32-htcaption-const-htcaption-2-src-platform-win32-ml-385803200"></a>
### HTCAPTION

```ml
const HTCAPTION = 2
```

Defines the htcaption constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L479)

<a id="constant-constant-platform-win32-htclose-const-htclose-20-src-platform-win32-ml-273004226"></a>
### HTCLOSE

```ml
const HTCLOSE = 20
```

Defines the htclose constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L485)

<a id="constant-constant-platform-win32-htmaxbutton-const-htmaxbutton-9-src-platform-win32-ml-1006787849"></a>
### HTMAXBUTTON

```ml
const HTMAXBUTTON = 9
```

Defines the htmaxbutton constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L483)

<a id="constant-constant-platform-win32-htminbutton-const-htminbutton-8-src-platform-win32-ml-1406348654"></a>
### HTMINBUTTON

```ml
const HTMINBUTTON = 8
```

Defines the htminbutton constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L481)

<a id="constant-constant-platform-win32-hwnd-bottom-const-hwnd-bottom-1-src-platform-win32-ml-843608429"></a>
### HWND_BOTTOM

```ml
const HWND_BOTTOM = 1
```

Defines the hwnd bottom constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L54)

<a id="constant-constant-platform-win32-icc-tab-classes-const-icc-tab-classes-8-src-platform-win32-ml-511913270"></a>
### ICC_TAB_CLASSES

```ml
const ICC_TAB_CLASSES = 8
```

Defines the icc tab classes constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L264)

<a id="constant-constant-platform-win32-icc-treeview-classes-const-icc-treeview-classes-2-src-platform-win32-ml-1474405930"></a>
### ICC_TREEVIEW_CLASSES

```ml
const ICC_TREEVIEW_CLASSES = 2
```

Defines the icc treeview classes constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L262)

<a id="constant-constant-platform-win32-idc-arrow-const-idc-arrow-32512-src-platform-win32-ml-2146578713"></a>
### IDC_ARROW

```ml
const IDC_ARROW = 32512
```

Defines the idc arrow constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L130)

<a id="constant-constant-platform-win32-idc-hand-const-idc-hand-32649-src-platform-win32-ml-1725622234"></a>
### IDC_HAND

```ml
const IDC_HAND = 32649
```

Defines the idc hand constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L134)

<a id="constant-constant-platform-win32-idc-ibeam-const-idc-ibeam-32513-src-platform-win32-ml-1316056766"></a>
### IDC_IBEAM

```ml
const IDC_IBEAM = 32513
```

Defines the idc ibeam constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L132)

<a id="constant-constant-platform-win32-idyes-const-idyes-6-src-platform-win32-ml-1499654488"></a>
### IDYES

```ml
const IDYES = 6
```

Defines the idyes constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L78)

<a id="constant-constant-platform-win32-ilc-color32-const-ilc-color32-32-src-platform-win32-ml-2033502225"></a>
### ILC_COLOR32

```ml
const ILC_COLOR32 = 32
```

Defines the ilc color32 constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L464)

<a id="constant-constant-platform-win32-ilc-mask-const-ilc-mask-1-src-platform-win32-ml-988882293"></a>
### ILC_MASK

```ml
const ILC_MASK = 1
```

Defines the ilc mask constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L462)

<a id="constant-constant-platform-win32-image-icon-const-image-icon-1-src-platform-win32-ml-1557696621"></a>
### IMAGE_ICON

```ml
const IMAGE_ICON = 1
```

Defines the image icon constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L356)

<a id="extern_function-extern-function-platform-win32-imagelist-addicon-extern-function-imagelist-addicon-imagelist-as-ptr-icon-as-ptr-from-comctl32-dll-symbol-imagelist-addicon-returns-int-src-platform-win32-ml-1964104359"></a>
### ImageList_AddIcon

```ml
extern function ImageList_AddIcon(imageList as ptr, icon as ptr) from "comctl32.dll" symbol "ImageList_AddIcon" returns int
```

Bind the native ImageList_AddIcon API used by MiniIDE.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `imageList` | `ptr` | — | imageList value consumed by this operation. |
| `icon` | `ptr` | — | icon value consumed by this operation. |


**Returns:** Native int result produced by the call.

[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L827)

<a id="extern_function-extern-function-platform-win32-imagelist-create-extern-function-imagelist-create-cx-as-int-cy-as-int-flags-as-u32-initial-as-int-grow-as-int-from-comctl32-dll-symbol-imagelist-create-returns-ptr-src-platform-win32-ml-1966463103"></a>
### ImageList_Create

```ml
extern function ImageList_Create(cx as int, cy as int, flags as u32, initial as int, grow as int) from "comctl32.dll" symbol "ImageList_Create" returns ptr
```

Bind the native ImageList_Create API used by MiniIDE.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cx` | `int` | — | cx value consumed by this operation. |
| `cy` | `int` | — | cy value consumed by this operation. |
| `flags` | `u32` | — | Bit flags controlling the operation. |
| `initial` | `int` | — | initial value consumed by this operation. |
| `grow` | `int` | — | grow value consumed by this operation. |


**Returns:** Native ptr result produced by the call.

[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L822)

<a id="function-function-platform-win32-init-common-controls-function-init-common-controls-src-platform-win32-ml-1912974603"></a>
### init_common_controls

```ml
function init_common_controls()
```

Initialize common control classes used by MiniIDE.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1254)

<a id="extern_function-extern-function-platform-win32-initcommoncontrolsex-extern-function-initcommoncontrolsex-data-as-bytes-from-comctl32-dll-symbol-initcommoncontrolsex-returns-bool-src-platform-win32-ml-833683733"></a>
### InitCommonControlsEx

```ml
extern function InitCommonControlsEx(data as bytes) from "comctl32.dll" symbol "InitCommonControlsEx" returns bool
```

Bind the native InitCommonControlsEx API used by MiniIDE.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `bytes` | — | Input data consumed by the operation. |


**Returns:** Native bool result produced by the call.

[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L748)

<a id="extern_function-extern-function-platform-win32-invalidaterect-extern-function-invalidaterect-hwnd-as-ptr-rect-as-ptr-erase-as-bool-from-user32-dll-symbol-invalidaterect-returns-bool-src-platform-win32-ml-201277707"></a>
### InvalidateRect

```ml
extern function InvalidateRect(hwnd as ptr, rect as ptr, erase as bool) from "user32.dll" symbol "InvalidateRect" returns bool
```

Bind the native InvalidateRect API used by MiniIDE.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `ptr` | — | hwnd value consumed by this operation. |
| `rect` | `ptr` | — | rect value consumed by this operation. |
| `erase` | `bool` | — | erase value consumed by this operation. |


**Returns:** Native bool result produced by the call.

[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L708)

<a id="function-function-platform-win32-is-foreground-function-is-foreground-hwnd-src-platform-win32-ml-1986834946"></a>
### is_foreground

```ml
function is_foreground(hwnd)
```

Return true when foreground.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `dynamic` | — | hwnd value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1302)

<a id="extern_function-extern-function-platform-win32-ischild-extern-function-ischild-parent-as-ptr-child-as-ptr-from-user32-dll-symbol-ischild-returns-bool-src-platform-win32-ml-960720429"></a>
### IsChild

```ml
extern function IsChild(parent as ptr, child as ptr) from "user32.dll" symbol "IsChild" returns bool
```

Bind the native IsChild API used by MiniIDE.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `parent` | `ptr` | — | parent value consumed by this operation. |
| `child` | `ptr` | — | child value consumed by this operation. |


**Returns:** Native bool result produced by the call.

[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L622)

<a id="extern_function-extern-function-platform-win32-iswindow-extern-function-iswindow-hwnd-as-ptr-from-user32-dll-symbol-iswindow-returns-bool-src-platform-win32-ml-1739675804"></a>
### IsWindow

```ml
extern function IsWindow(hwnd as ptr) from "user32.dll" symbol "IsWindow" returns bool
```

Bind the native IsWindow API used by MiniIDE.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `ptr` | — | hwnd value consumed by this operation. |


**Returns:** Native bool result produced by the call.

[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L640)

<a id="extern_function-extern-function-platform-win32-iszoomed-extern-function-iszoomed-hwnd-as-ptr-from-user32-dll-symbol-iszoomed-returns-bool-src-platform-win32-ml-39249542"></a>
### IsZoomed

```ml
extern function IsZoomed(hwnd as ptr) from "user32.dll" symbol "IsZoomed" returns bool
```

Bind the native IsZoomed API used by MiniIDE.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `ptr` | — | hwnd value consumed by this operation. |


**Returns:** Native bool result produced by the call.

[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L644)

<a id="function-function-platform-win32-key-down-function-key-down-vk-src-platform-win32-ml-926756118"></a>
### key_down

```ml
function key_down(vk)
```

Return true when a virtual key is currently down.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vk` | `dynamic` | — | vk value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1290)

<a id="function-function-platform-win32-key-pressed-event-function-key-pressed-event-vk-src-platform-win32-ml-171100996"></a>
### key_pressed_event

```ml
function key_pressed_event(vk)
```

Return true when a message represents a key press event.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vk` | `dynamic` | — | vk value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1296)

<a id="constant-constant-platform-win32-lb-addstring-const-lb-addstring-384-src-platform-win32-ml-1925836959"></a>
### LB_ADDSTRING

```ml
const LB_ADDSTRING = 384
```

Defines the lb addstring constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L426)

<a id="constant-constant-platform-win32-lb-getcursel-const-lb-getcursel-392-src-platform-win32-ml-193908356"></a>
### LB_GETCURSEL

```ml
const LB_GETCURSEL = 392
```

Defines the lb getcursel constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L432)

<a id="constant-constant-platform-win32-lb-resetcontent-const-lb-resetcontent-388-src-platform-win32-ml-408536099"></a>
### LB_RESETCONTENT

```ml
const LB_RESETCONTENT = 388
```

Defines the lb resetcontent constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L428)

<a id="constant-constant-platform-win32-lb-setcursel-const-lb-setcursel-390-src-platform-win32-ml-55595238"></a>
### LB_SETCURSEL

```ml
const LB_SETCURSEL = 390
```

Defines the lb setcursel constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L430)

<a id="constant-constant-platform-win32-lbn-dblclk-const-lbn-dblclk-2-src-platform-win32-ml-32098048"></a>
### LBN_DBLCLK

```ml
const LBN_DBLCLK = 2
```

Defines the lbn dblclk constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L436)

<a id="constant-constant-platform-win32-lbn-selchange-const-lbn-selchange-1-src-platform-win32-ml-459160337"></a>
### LBN_SELCHANGE

```ml
const LBN_SELCHANGE = 1
```

Defines the lbn selchange constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L434)

<a id="constant-constant-platform-win32-lbs-hasstrings-const-lbs-hasstrings-64-src-platform-win32-ml-196975448"></a>
### LBS_HASSTRINGS

```ml
const LBS_HASSTRINGS = 64
```

Defines the lbs hasstrings constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L235)

<a id="constant-constant-platform-win32-lbs-nointegralheight-const-lbs-nointegralheight-256-src-platform-win32-ml-2141248125"></a>
### LBS_NOINTEGRALHEIGHT

```ml
const LBS_NOINTEGRALHEIGHT = 256
```

Defines the lbs nointegralheight constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L237)

<a id="constant-constant-platform-win32-lbs-notify-const-lbs-notify-1-src-platform-win32-ml-863073577"></a>
### LBS_NOTIFY

```ml
const LBS_NOTIFY = 1
```

Defines the lbs notify constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L233)

<a id="extern_function-extern-function-platform-win32-lineto-extern-function-lineto-hdc-as-ptr-x-as-int-y-as-int-from-gdi32-dll-symbol-lineto-returns-bool-src-platform-win32-ml-1116027357"></a>
### LineTo

```ml
extern function LineTo(hdc as ptr, x as int, y as int) from "gdi32.dll" symbol "LineTo" returns bool
```

Bind the native LineTo API used by MiniIDE.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hdc` | `ptr` | — | hdc value consumed by this operation. |
| `x` | `int` | — | Horizontal coordinate used by the operation. |
| `y` | `int` | — | Vertical coordinate used by the operation. |


**Returns:** Native bool result produced by the call.

[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L904)

<a id="function-function-platform-win32-listbox-add-function-listbox-add-hwnd-text-src-platform-win32-ml-1553086161"></a>
### listbox_add

```ml
function listbox_add(hwnd, text)
```

Send the add operation to a list box.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `dynamic` | — | hwnd value consumed by this operation. |
| `text` | `dynamic` | — | Text consumed by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1583)

<a id="function-function-platform-win32-listbox-getsel-function-listbox-getsel-hwnd-src-platform-win32-ml-1717680058"></a>
### listbox_getsel

```ml
function listbox_getsel(hwnd)
```

Return selection from a list box.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `dynamic` | — | hwnd value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1591)

<a id="function-function-platform-win32-listbox-reset-function-listbox-reset-hwnd-src-platform-win32-ml-297161264"></a>
### listbox_reset

```ml
function listbox_reset(hwnd)
```

Send the reset operation to a list box.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `dynamic` | — | hwnd value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1575)

<a id="function-function-platform-win32-listbox-setsel-function-listbox-setsel-hwnd-idx-src-platform-win32-ml-620241147"></a>
### listbox_setsel

```ml
function listbox_setsel(hwnd, idx)
```

Send the selection operation to a list box.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `dynamic` | — | hwnd value consumed by this operation. |
| `idx` | `dynamic` | — | idx value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1599)

<a id="extern_function-extern-function-platform-win32-loadcursorwid-extern-function-loadcursorwid-instance-as-ptr-cursorid-as-int-from-user32-dll-symbol-loadcursorw-returns-ptr-src-platform-win32-ml-332918475"></a>
### LoadCursorWId

```ml
extern function LoadCursorWId(instance as ptr, cursorId as int) from "user32.dll" symbol "LoadCursorW" returns ptr
```

Bind the native LoadCursorW API used by MiniIDE.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `instance` | `ptr` | — | instance value consumed by this operation. |
| `cursorId` | `int` | — | Identifier of cursor. |


**Returns:** Native ptr result produced by the call.

[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L606)

<a id="extern_function-extern-function-platform-win32-loadlibraryw-extern-function-loadlibraryw-path-as-wstr-from-kernel32-dll-symbol-loadlibraryw-returns-ptr-src-platform-win32-ml-787738570"></a>
### LoadLibraryW

```ml
extern function LoadLibraryW(path as wstr) from "kernel32.dll" symbol "LoadLibraryW" returns ptr
```

Bind the native LoadLibraryW API used by MiniIDE.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `wstr` | — | Path of the file or directory used by the operation. |


**Returns:** Native ptr result produced by the call.

[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L712)

<a id="function-function-platform-win32-make-font-function-make-font-height-face-bold-src-platform-win32-ml-2008148912"></a>
### make_font

```ml
function make_font(height, face, bold)
```

Create a Win32 font handle for a face, size, and weight.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `height` | `dynamic` | — | Height in the coordinate or storage units used by the caller. |
| `face` | `dynamic` | — | face value consumed by this operation. |
| `bold` | `dynamic` | — | bold value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1247)

<a id="constant-constant-platform-win32-mb-defbutton2-const-mb-defbutton2-256-src-platform-win32-ml-2138591047"></a>
### MB_DEFBUTTON2

```ml
const MB_DEFBUTTON2 = 256
```

Defines the mb defbutton2 constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L76)

<a id="constant-constant-platform-win32-mb-iconwarning-const-mb-iconwarning-48-src-platform-win32-ml-1831722948"></a>
### MB_ICONWARNING

```ml
const MB_ICONWARNING = 48
```

Defines the mb iconwarning constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L74)

<a id="constant-constant-platform-win32-mb-yesno-const-mb-yesno-4-src-platform-win32-ml-763066332"></a>
### MB_YESNO

```ml
const MB_YESNO = 4
```

Defines the mb yesno constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L72)

<a id="extern_function-extern-function-platform-win32-messageboxw-extern-function-messageboxw-hwnd-as-ptr-text-as-wstr-caption-as-wstr-flags-as-u32-from-user32-dll-symbol-messageboxw-returns-int-src-platform-win32-ml-1429752362"></a>
### MessageBoxW

```ml
extern function MessageBoxW(hwnd as ptr, text as wstr, caption as wstr, flags as u32) from "user32.dll" symbol "MessageBoxW" returns int
```

Bind the native MessageBoxW API used by MiniIDE.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `ptr` | — | hwnd value consumed by this operation. |
| `text` | `wstr` | — | Text consumed by the operation. |
| `caption` | `wstr` | — | caption value consumed by this operation. |
| `flags` | `u32` | — | Bit flags controlling the operation. |


**Returns:** Native int result produced by the call.

[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L791)

<a id="constant-constant-platform-win32-mf-popup-const-mf-popup-16-src-platform-win32-ml-1331341809"></a>
### MF_POPUP

```ml
const MF_POPUP = 16
```

Defines the mf popup constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L451)

<a id="constant-constant-platform-win32-mf-separator-const-mf-separator-2048-src-platform-win32-ml-1255733382"></a>
### MF_SEPARATOR

```ml
const MF_SEPARATOR = 2048
```

Defines the mf separator constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L449)

<a id="constant-constant-platform-win32-mf-string-const-mf-string-0-src-platform-win32-ml-671146322"></a>
### MF_STRING

```ml
const MF_STRING = 0
```

Defines the mf string constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L447)

<a id="function-function-platform-win32-mouse-client-function-mouse-client-hwnd-src-platform-win32-ml-589213542"></a>
### mouse_client

```ml
function mouse_client(hwnd)
```

Return the current mouse position in client coordinates.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `dynamic` | — | hwnd value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1032)

<a id="extern_function-extern-function-platform-win32-movetoex-extern-function-movetoex-hdc-as-ptr-x-as-int-y-as-int-point-as-ptr-from-gdi32-dll-symbol-movetoex-returns-bool-src-platform-win32-ml-2057413951"></a>
### MoveToEx

```ml
extern function MoveToEx(hdc as ptr, x as int, y as int, point as ptr) from "gdi32.dll" symbol "MoveToEx" returns bool
```

Bind the native MoveToEx API used by MiniIDE.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hdc` | `ptr` | — | hdc value consumed by this operation. |
| `x` | `int` | — | Horizontal coordinate used by the operation. |
| `y` | `int` | — | Vertical coordinate used by the operation. |
| `point` | `ptr` | — | point value consumed by this operation. |


**Returns:** Native bool result produced by the call.

[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L898)

<a id="extern_function-extern-function-platform-win32-movewindow-extern-function-movewindow-hwnd-as-ptr-x-as-int-y-as-int-width-as-int-height-as-int-repaint-as-bool-from-user32-dll-symbol-movewindow-returns-bool-src-platform-win32-ml-602826044"></a>
### MoveWindow

```ml
extern function MoveWindow(hwnd as ptr, x as int, y as int, width as int, height as int, repaint as bool) from "user32.dll" symbol "MoveWindow" returns bool
```

Bind the native MoveWindow API used by MiniIDE.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `ptr` | — | hwnd value consumed by this operation. |
| `x` | `int` | — | Horizontal coordinate used by the operation. |
| `y` | `int` | — | Vertical coordinate used by the operation. |
| `width` | `int` | — | Width in the coordinate or storage units used by the caller. |
| `height` | `int` | — | Height in the coordinate or storage units used by the caller. |
| `repaint` | `bool` | — | repaint value consumed by this operation. |


**Returns:** Native bool result produced by the call.

[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L653)

<a id="function-function-platform-win32-msg-command-id-function-msg-command-id-msg-src-platform-win32-ml-1502719886"></a>
### msg_command_id

```ml
function msg_command_id(msg)
```

Extract command identifier from a Win32 message.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | msg value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1355)

<a id="function-function-platform-win32-msg-command-notify-function-msg-command-notify-msg-src-platform-win32-ml-1746834546"></a>
### msg_command_notify

```ml
function msg_command_notify(msg)
```

Extract command notify from a Win32 message.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | msg value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1361)

<a id="function-function-platform-win32-msg-hwnd-function-msg-hwnd-msg-src-platform-win32-ml-1323144918"></a>
### msg_hwnd

```ml
function msg_hwnd(msg)
```

Extract window handle from a Win32 message.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | msg value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1317)

<a id="function-function-platform-win32-msg-lparam-ptr-function-msg-lparam-ptr-msg-src-platform-win32-ml-1282924822"></a>
### msg_lparam_ptr

```ml
function msg_lparam_ptr(msg)
```

Extract lParam pointer from a Win32 message.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | msg value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1329)

<a id="function-function-platform-win32-msg-lparam-x-function-msg-lparam-x-msg-src-platform-win32-ml-1267824390"></a>
### msg_lparam_x

```ml
function msg_lparam_x(msg)
```

Extract lParam x from a Win32 message.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | msg value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1343)

<a id="function-function-platform-win32-msg-lparam-y-function-msg-lparam-y-msg-src-platform-win32-ml-797750002"></a>
### msg_lparam_y

```ml
function msg_lparam_y(msg)
```

Extract lParam y from a Win32 message.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | msg value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1349)

<a id="function-function-platform-win32-msg-message-function-msg-message-msg-src-platform-win32-ml-184023056"></a>
### msg_message

```ml
function msg_message(msg)
```

Extract message from a Win32 message.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | msg value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1311)

<a id="function-function-platform-win32-msg-mouse-x-function-msg-mouse-x-msg-src-platform-win32-ml-1236123950"></a>
### msg_mouse_x

```ml
function msg_mouse_x(msg)
```

Extract mouse x from a Win32 message.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | msg value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1397)

<a id="function-function-platform-win32-msg-mouse-y-function-msg-mouse-y-msg-src-platform-win32-ml-615057676"></a>
### msg_mouse_y

```ml
function msg_mouse_y(msg)
```

Extract mouse y from a Win32 message.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | msg value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1405)

<a id="function-function-platform-win32-msg-wparam-u32-function-msg-wparam-u32-msg-src-platform-win32-ml-462057074"></a>
### msg_wparam_u32

```ml
function msg_wparam_u32(msg)
```

Extract wParam unsigned 32-bit value from a Win32 message.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | msg value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1323)

<a id="extern_function-extern-function-platform-win32-multibytetowidecharlen-extern-function-multibytetowidecharlen-codepage-as-u32-flags-as-u32-src-as-bytes-srclen-as-int-dst-as-ptr-dstchars-as-int-from-kernel32-dll-symbol-multibytetowidechar-returns-int-src-platform-win32-ml-1700589533"></a>
### MultiByteToWideCharLen

```ml
extern function MultiByteToWideCharLen(codePage as u32, flags as u32, src as bytes, srcLen as int, dst as ptr, dstChars as int) from "kernel32.dll" symbol "MultiByteToWideChar" returns int
```

Bind the native MultiByteToWideChar API used by MiniIDE.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `codePage` | `u32` | — | codePage value consumed by this operation. |
| `flags` | `u32` | — | Bit flags controlling the operation. |
| `src` | `bytes` | — | src value consumed by this operation. |
| `srcLen` | `int` | — | srcLen value consumed by this operation. |
| `dst` | `ptr` | — | dst value consumed by this operation. |
| `dstChars` | `int` | — | dstChars value consumed by this operation. |


**Returns:** Native int result produced by the call.

[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L739)

<a id="extern_function-extern-function-platform-win32-multibytetowidecharptr-extern-function-multibytetowidecharptr-codepage-as-u32-flags-as-u32-src-as-bytes-srclen-as-int-dst-as-ptr-dstchars-as-int-from-kernel32-dll-symbol-multibytetowidechar-returns-int-src-platform-win32-ml-549373663"></a>
### MultiByteToWideCharPtr

```ml
extern function MultiByteToWideCharPtr(codePage as u32, flags as u32, src as bytes, srcLen as int, dst as ptr, dstChars as int) from "kernel32.dll" symbol "MultiByteToWideChar" returns int
```

Bind the native MultiByteToWideChar API used by MiniIDE.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `codePage` | `u32` | — | codePage value consumed by this operation. |
| `flags` | `u32` | — | Bit flags controlling the operation. |
| `src` | `bytes` | — | src value consumed by this operation. |
| `srcLen` | `int` | — | srcLen value consumed by this operation. |
| `dst` | `ptr` | — | dst value consumed by this operation. |
| `dstChars` | `int` | — | dstChars value consumed by this operation. |


**Returns:** Native int result produced by the call.

[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L730)

<a id="constant-constant-platform-win32-nm-dblclk-const-nm-dblclk-3-src-platform-win32-ml-678360984"></a>
### NM_DBLCLK

```ml
const NM_DBLCLK = -3
```

Defines the nm dblclk constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L343)

<a id="constant-constant-platform-win32-nm-rclick-const-nm-rclick-5-src-platform-win32-ml-1902315294"></a>
### NM_RCLICK

```ml
const NM_RCLICK = -5
```

Defines the nm rclick constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L345)

<a id="function-function-platform-win32-notify-code-function-notify-code-msg-src-platform-win32-ml-1686958036"></a>
### notify_code

```ml
function notify_code(msg)
```

Extract code from a notification message.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | msg value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1373)

<a id="function-function-platform-win32-notify-code-from-ptr-function-notify-code-from-ptr-ptr-src-platform-win32-ml-1344404447"></a>
### notify_code_from_ptr

```ml
function notify_code_from_ptr(ptr)
```

Extract code from pointer from a notification message.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ptr` | `dynamic` | — | ptr value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1388)

<a id="function-function-platform-win32-notify-id-function-notify-id-msg-src-platform-win32-ml-1478409736"></a>
### notify_id

```ml
function notify_id(msg)
```

Extract identifier from a notification message.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | msg value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1367)

<a id="function-function-platform-win32-notify-id-from-ptr-function-notify-id-from-ptr-ptr-src-platform-win32-ml-1621203931"></a>
### notify_id_from_ptr

```ml
function notify_id_from_ptr(ptr)
```

Extract identifier from pointer from a notification message.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ptr` | `dynamic` | — | ptr value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1379)

<a id="function-function-platform-win32-open-compiler-dialog-function-open-compiler-dialog-hwnd-src-platform-win32-ml-44161958"></a>
### open_compiler_dialog

```ml
function open_compiler_dialog(hwnd)
```

Open compiler dialog.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `dynamic` | — | hwnd value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L2021)

<a id="function-function-platform-win32-open-minilang-file-dialog-function-open-minilang-file-dialog-hwnd-src-platform-win32-ml-2006030382"></a>
### open_minilang_file_dialog

```ml
function open_minilang_file_dialog(hwnd)
```

Open MiniLang file dialog.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `dynamic` | — | hwnd value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L2055)

<a id="function-function-platform-win32-open-project-dialog-function-open-project-dialog-hwnd-src-platform-win32-ml-889256192"></a>
### open_project_dialog

```ml
function open_project_dialog(hwnd)
```

Open project dialog.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `dynamic` | — | hwnd value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1987)

<a id="extern_function-extern-function-platform-win32-peekmessagew-extern-function-peekmessagew-msg-as-bytes-hwnd-as-ptr-minmsg-as-u32-maxmsg-as-u32-removemsg-as-u32-from-user32-dll-symbol-peekmessagew-returns-bool-src-platform-win32-ml-1197136844"></a>
### PeekMessageW

```ml
extern function PeekMessageW(msg as bytes, hwnd as ptr, minMsg as u32, maxMsg as u32, removeMsg as u32) from "user32.dll" symbol "PeekMessageW" returns bool
```

Bind the native PeekMessageW API used by MiniIDE.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `bytes` | — | msg value consumed by this operation. |
| `hwnd` | `ptr` | — | hwnd value consumed by this operation. |
| `minMsg` | `u32` | — | minMsg value consumed by this operation. |
| `maxMsg` | `u32` | — | maxMsg value consumed by this operation. |
| `removeMsg` | `u32` | — | removeMsg value consumed by this operation. |


**Returns:** Native bool result produced by the call.

[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L570)

<a id="constant-constant-platform-win32-pm-remove-const-pm-remove-1-src-platform-win32-ml-963380033"></a>
### PM_REMOVE

```ml
const PM_REMOVE = 1
```

Defines the pm remove constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L62)

<a id="function-function-platform-win32-point-x-function-point-x-point-src-platform-win32-ml-1967706085"></a>
### point_x

```ml
function point_x(point)
```

Read the x coordinate from a Win32 POINT byte buffer.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `point` | `dynamic` | — | point value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1011)

<a id="function-function-platform-win32-point-y-function-point-y-point-src-platform-win32-ml-2018009127"></a>
### point_y

```ml
function point_y(point)
```

Read the y coordinate from a Win32 POINT byte buffer.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `point` | `dynamic` | — | point value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1017)

<a id="constant-constant-platform-win32-ps-solid-const-ps-solid-0-src-platform-win32-ml-231236542"></a>
### PS_SOLID

```ml
const PS_SOLID = 0
```

Defines the ps solid constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L66)

<a id="function-function-platform-win32-rect-bytes-function-rect-bytes-x-y-w-h-src-platform-win32-ml-2134718259"></a>
### rect_bytes

```ml
function rect_bytes(x, y, w, h)
```

Build a Win32 RECT byte buffer from position and size values.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | `dynamic` | — | Horizontal coordinate used by the operation. |
| `y` | `dynamic` | — | Vertical coordinate used by the operation. |
| `w` | `dynamic` | — | w value consumed by this operation. |
| `h` | `dynamic` | — | h value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1000)

<a id="extern_function-extern-function-platform-win32-releasedc-extern-function-releasedc-hwnd-as-ptr-hdc-as-ptr-from-user32-dll-symbol-releasedc-returns-int-src-platform-win32-ml-876189586"></a>
### ReleaseDC

```ml
extern function ReleaseDC(hwnd as ptr, hdc as ptr) from "user32.dll" symbol "ReleaseDC" returns int
```

Bind the native ReleaseDC API used by MiniIDE.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `ptr` | — | hwnd value consumed by this operation. |
| `hdc` | `ptr` | — | hdc value consumed by this operation. |


**Returns:** Native int result produced by the call.

[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L557)

<a id="function-function-platform-win32-remove-directory-function-remove-directory-path-src-platform-win32-ml-1489325138"></a>
### remove_directory

```ml
function remove_directory(path)
```

Remove directory.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `dynamic` | — | Path of the file or directory used by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1127)

<a id="extern_function-extern-function-platform-win32-removedirectoryw-extern-function-removedirectoryw-path-as-wstr-from-kernel32-dll-symbol-removedirectoryw-returns-bool-src-platform-win32-ml-352008598"></a>
### RemoveDirectoryW

```ml
extern function RemoveDirectoryW(path as wstr) from "kernel32.dll" symbol "RemoveDirectoryW" returns bool
```

Bind the native RemoveDirectoryW API used by MiniIDE.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `wstr` | — | Path of the file or directory used by the operation. |


**Returns:** Native bool result produced by the call.

[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L814)

<a id="function-function-platform-win32-rgb-function-rgb-r-g-b-src-platform-win32-ml-5857646"></a>
### rgb

```ml
function rgb(r, g, b)
```

Pack red, green, and blue components into a Win32 COLORREF value.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `r` | `dynamic` | — | r value consumed by this operation. |
| `g` | `dynamic` | — | g value consumed by this operation. |
| `b` | `dynamic` | — | b value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L936)

<a id="function-function-platform-win32-rich-set-all-color-function-rich-set-all-color-hwnd-color-src-platform-win32-ml-837409979"></a>
### rich_set_all_color

```ml
function rich_set_all_color(hwnd, color)
```

Send the set all color operation to a RichEdit control.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `dynamic` | — | hwnd value consumed by this operation. |
| `color` | `dynamic` | — | color value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L2155)

<a id="function-function-platform-win32-rich-set-color-function-rich-set-color-hwnd-start-pos-end-pos-color-src-platform-win32-ml-7143864"></a>
### rich_set_color

```ml
function rich_set_color(hwnd, start_pos, end_pos, color)
```

Send the set color operation to a RichEdit control.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `dynamic` | — | hwnd value consumed by this operation. |
| `start_pos` | `dynamic` | — | start_pos value consumed by this operation. |
| `end_pos` | `dynamic` | — | end_pos value consumed by this operation. |
| `color` | `dynamic` | — | color value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L2106)

<a id="function-function-platform-win32-rich-set-format-function-rich-set-format-hwnd-start-pos-end-pos-color-height-twips-bold-italic-underline-src-platform-win32-ml-861463636"></a>
### rich_set_format

```ml
function rich_set_format(hwnd, start_pos, end_pos, color, height_twips, bold, italic, underline)
```

Send the set format operation to a RichEdit control.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `dynamic` | — | hwnd value consumed by this operation. |
| `start_pos` | `dynamic` | — | start_pos value consumed by this operation. |
| `end_pos` | `dynamic` | — | end_pos value consumed by this operation. |
| `color` | `dynamic` | — | color value consumed by this operation. |
| `height_twips` | `dynamic` | — | height_twips value consumed by this operation. |
| `bold` | `dynamic` | — | bold value consumed by this operation. |
| `italic` | `dynamic` | — | italic value consumed by this operation. |
| `underline` | `dynamic` | — | underline value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L2128)

<a id="extern_function-extern-function-platform-win32-rtlmovememoryfromptr-extern-function-rtlmovememoryfromptr-dst-as-bytes-src-as-ptr-len-as-u32-from-kernel32-dll-symbol-rtlmovememory-returns-void-src-platform-win32-ml-776369186"></a>
### RtlMoveMemoryFromPtr

```ml
extern function RtlMoveMemoryFromPtr(dst as bytes, src as ptr, len as u32) from "kernel32.dll" symbol "RtlMoveMemory" returns void
```

Bind the native RtlMoveMemory API used by MiniIDE.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dst` | `bytes` | — | dst value consumed by this operation. |
| `src` | `ptr` | — | src value consumed by this operation. |
| `len` | `u32` | — | len value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L744)

<a id="constant-constant-platform-win32-sc-close-const-sc-close-61536-src-platform-win32-ml-1957705163"></a>
### SC_CLOSE

```ml
const SC_CLOSE = 61536
```

Defines the sc close constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L496)

<a id="constant-constant-platform-win32-sc-maximize-const-sc-maximize-61488-src-platform-win32-ml-950383629"></a>
### SC_MAXIMIZE

```ml
const SC_MAXIMIZE = 61488
```

Defines the sc maximize constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L494)

<a id="constant-constant-platform-win32-sc-minimize-const-sc-minimize-61472-src-platform-win32-ml-530150736"></a>
### SC_MINIMIZE

```ml
const SC_MINIMIZE = 61472
```

Defines the sc minimize constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L492)

<a id="constant-constant-platform-win32-sc-move-const-sc-move-61456-src-platform-win32-ml-55300638"></a>
### SC_MOVE

```ml
const SC_MOVE = 61456
```

Defines the sc move constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L490)

<a id="constant-constant-platform-win32-sc-restore-const-sc-restore-61728-src-platform-win32-ml-888552738"></a>
### SC_RESTORE

```ml
const SC_RESTORE = 61728
```

Defines the sc restore constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L498)

<a id="constant-constant-platform-win32-sc-size-const-sc-size-61440-src-platform-win32-ml-1417814497"></a>
### SC_SIZE

```ml
const SC_SIZE = 61440
```

Defines the sc size constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L488)

<a id="constant-constant-platform-win32-scf-all-const-scf-all-4-src-platform-win32-ml-6031506"></a>
### SCF_ALL

```ml
const SCF_ALL = 4
```

Defines the scf all constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L408)

<a id="constant-constant-platform-win32-scf-selection-const-scf-selection-1-src-platform-win32-ml-86360213"></a>
### SCF_SELECTION

```ml
const SCF_SELECTION = 1
```

Defines the scf selection constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L406)

<a id="extern_function-extern-function-platform-win32-screentoclient-extern-function-screentoclient-hwnd-as-ptr-point-as-bytes-from-user32-dll-symbol-screentoclient-returns-bool-src-platform-win32-ml-1782199035"></a>
### ScreenToClient

```ml
extern function ScreenToClient(hwnd as ptr, point as bytes) from "user32.dll" symbol "ScreenToClient" returns bool
```

Bind the native ScreenToClient API used by MiniIDE.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `ptr` | — | hwnd value consumed by this operation. |
| `point` | `bytes` | — | point value consumed by this operation. |


**Returns:** Native bool result produced by the call.

[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L627)

<a id="extern_function-extern-function-platform-win32-selectobject-extern-function-selectobject-hdc-as-ptr-obj-as-ptr-from-gdi32-dll-symbol-selectobject-returns-ptr-src-platform-win32-ml-2014652991"></a>
### SelectObject

```ml
extern function SelectObject(hdc as ptr, obj as ptr) from "gdi32.dll" symbol "SelectObject" returns ptr
```

Bind the native SelectObject API used by MiniIDE.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hdc` | `ptr` | — | hdc value consumed by this operation. |
| `obj` | `ptr` | — | obj value consumed by this operation. |


**Returns:** Native ptr result produced by the call.

[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L909)

<a id="function-function-platform-win32-send-to-bottom-function-send-to-bottom-hwnd-src-platform-win32-ml-777624774"></a>
### send_to_bottom

```ml
function send_to_bottom(hwnd)
```

Move a child control to the bottom of the z-order.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `dynamic` | — | hwnd value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1521)

<a id="extern_function-extern-function-platform-win32-sendmessagew-extern-function-sendmessagew-hwnd-as-ptr-msg-as-u32-wparam-as-int-lparam-as-int-from-user32-dll-symbol-sendmessagew-returns-int-src-platform-win32-ml-1124113671"></a>
### SendMessageW

```ml
extern function SendMessageW(hwnd as ptr, msg as u32, wParam as int, lParam as int) from "user32.dll" symbol "SendMessageW" returns int
```

Sends an integer message payload through the native SendMessageW API.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `ptr` | — | hwnd value consumed by this operation. |
| `msg` | `u32` | — | msg value consumed by this operation. |
| `wParam` | `int` | — | wParam value consumed by this operation. |
| `lParam` | `int` | — | lParam value consumed by this operation. |


**Returns:** Native int result produced by the call.

[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L674)

<a id="extern_function-extern-function-platform-win32-sendmessagew2bytes-extern-function-sendmessagew2bytes-hwnd-as-ptr-msg-as-u32-wparam-as-bytes-lparam-as-bytes-from-user32-dll-symbol-sendmessagew-returns-int-src-platform-win32-ml-2004423797"></a>
### SendMessageW2Bytes

```ml
extern function SendMessageW2Bytes(hwnd as ptr, msg as u32, wParam as bytes, lParam as bytes) from "user32.dll" symbol "SendMessageW" returns int
```

Sends byte-buffer values in both message parameter slots.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `ptr` | — | hwnd value consumed by this operation. |
| `msg` | `u32` | — | msg value consumed by this operation. |
| `wParam` | `bytes` | — | wParam value consumed by this operation. |
| `lParam` | `bytes` | — | lParam value consumed by this operation. |


**Returns:** Native int result produced by the call.

[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L702)

<a id="extern_function-extern-function-platform-win32-sendmessagewbytes-extern-function-sendmessagewbytes-hwnd-as-ptr-msg-as-u32-wparam-as-int-lparam-as-bytes-from-user32-dll-symbol-sendmessagew-returns-int-src-platform-win32-ml-627651689"></a>
### SendMessageWBytes

```ml
extern function SendMessageWBytes(hwnd as ptr, msg as u32, wParam as int, lParam as bytes) from "user32.dll" symbol "SendMessageW" returns int
```

Sends a byte-buffer payload through the native SendMessageW API.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `ptr` | — | hwnd value consumed by this operation. |
| `msg` | `u32` | — | msg value consumed by this operation. |
| `wParam` | `int` | — | wParam value consumed by this operation. |
| `lParam` | `bytes` | — | lParam value consumed by this operation. |


**Returns:** Native int result produced by the call.

[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L695)

<a id="extern_function-extern-function-platform-win32-sendmessagewptr-extern-function-sendmessagewptr-hwnd-as-ptr-msg-as-u32-wparam-as-int-lparam-as-ptr-from-user32-dll-symbol-sendmessagew-returns-int-src-platform-win32-ml-305429858"></a>
### SendMessageWPtr

```ml
extern function SendMessageWPtr(hwnd as ptr, msg as u32, wParam as int, lParam as ptr) from "user32.dll" symbol "SendMessageW" returns int
```

Sends a pointer payload through the native SendMessageW API.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `ptr` | — | hwnd value consumed by this operation. |
| `msg` | `u32` | — | msg value consumed by this operation. |
| `wParam` | `int` | — | wParam value consumed by this operation. |
| `lParam` | `ptr` | — | lParam value consumed by this operation. |


**Returns:** Native int result produced by the call.

[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L688)

<a id="extern_function-extern-function-platform-win32-sendmessagewstr-extern-function-sendmessagewstr-hwnd-as-ptr-msg-as-u32-wparam-as-int-lparam-as-wstr-from-user32-dll-symbol-sendmessagew-returns-int-src-platform-win32-ml-1159734776"></a>
### SendMessageWStr

```ml
extern function SendMessageWStr(hwnd as ptr, msg as u32, wParam as int, lParam as wstr) from "user32.dll" symbol "SendMessageW" returns int
```

Sends a UTF-16 string payload through the native SendMessageW API.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `ptr` | — | hwnd value consumed by this operation. |
| `msg` | `u32` | — | msg value consumed by this operation. |
| `wParam` | `int` | — | wParam value consumed by this operation. |
| `lParam` | `wstr` | — | lParam value consumed by this operation. |


**Returns:** Native int result produced by the call.

[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L681)

<a id="function-function-platform-win32-set-control-dark-theme-function-set-control-dark-theme-hwnd-enabled-src-platform-win32-ml-568899265"></a>
### set_control_dark_theme

```ml
function set_control_dark_theme(hwnd, enabled)
```

Set control dark theme.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `dynamic` | — | hwnd value consumed by this operation. |
| `enabled` | `dynamic` | — | enabled value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1102)

<a id="function-function-platform-win32-set-control-font-function-set-control-font-hwnd-font-src-platform-win32-ml-1832018029"></a>
### set_control_font

```ml
function set_control_font(hwnd, font)
```

Set control font.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `dynamic` | — | hwnd value consumed by this operation. |
| `font` | `dynamic` | — | font value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1501)

<a id="function-function-platform-win32-set-cursor-arrow-function-set-cursor-arrow-src-platform-win32-ml-655402739"></a>
### set_cursor_arrow

```ml
function set_cursor_arrow()
```

Set cursor arrow.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1049)

<a id="function-function-platform-win32-set-cursor-hand-function-set-cursor-hand-src-platform-win32-ml-2075336421"></a>
### set_cursor_hand

```ml
function set_cursor_hand()
```

Set cursor hand.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1059)

<a id="function-function-platform-win32-set-cursor-ibeam-function-set-cursor-ibeam-src-platform-win32-ml-1439892899"></a>
### set_cursor_ibeam

```ml
function set_cursor_ibeam()
```

Set cursor ibeam.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1054)

<a id="function-function-platform-win32-set-menu-bar-function-set-menu-bar-hwnd-menu-src-platform-win32-ml-289568015"></a>
### set_menu_bar

```ml
function set_menu_bar(hwnd, menu)
```

Set menu bar.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `dynamic` | — | hwnd value consumed by this operation. |
| `menu` | `dynamic` | — | menu value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1447)

<a id="function-function-platform-win32-set-system-cursor-function-set-system-cursor-cursor-id-src-platform-win32-ml-1430469069"></a>
### set_system_cursor

```ml
function set_system_cursor(cursor_id)
```

Set system cursor.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cursor_id` | `dynamic` | — | Identifier of cursor. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1042)

<a id="function-function-platform-win32-set-window-dark-mode-function-set-window-dark-mode-hwnd-enabled-src-platform-win32-ml-2060613329"></a>
### set_window_dark_mode

```ml
function set_window_dark_mode(hwnd, enabled)
```

Set window dark mode.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `dynamic` | — | hwnd value consumed by this operation. |
| `enabled` | `dynamic` | — | enabled value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1089)

<a id="function-function-platform-win32-set-window-text-function-set-window-text-hwnd-text-src-platform-win32-ml-1860559813"></a>
### set_window_text

```ml
function set_window_text(hwnd, text)
```

Set window text.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `dynamic` | — | hwnd value consumed by this operation. |
| `text` | `dynamic` | — | Text consumed by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1509)

<a id="extern_function-extern-function-platform-win32-setbkmode-extern-function-setbkmode-hdc-as-ptr-mode-as-int-from-gdi32-dll-symbol-setbkmode-returns-int-src-platform-win32-ml-1443155330"></a>
### SetBkMode

```ml
extern function SetBkMode(hdc as ptr, mode as int) from "gdi32.dll" symbol "SetBkMode" returns int
```

Bind the native SetBkMode API used by MiniIDE.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hdc` | `ptr` | — | hdc value consumed by this operation. |
| `mode` | `int` | — | Mode selecting the requested behavior. |


**Returns:** Native int result produced by the call.

[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L877)

<a id="extern_function-extern-function-platform-win32-setcursor-extern-function-setcursor-cursor-as-ptr-from-user32-dll-symbol-setcursor-returns-ptr-src-platform-win32-ml-259257917"></a>
### SetCursor

```ml
extern function SetCursor(cursor as ptr) from "user32.dll" symbol "SetCursor" returns ptr
```

Bind the native SetCursor API used by MiniIDE.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cursor` | `ptr` | — | cursor value consumed by this operation. |


**Returns:** Native ptr result produced by the call.

[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L610)

<a id="extern_function-extern-function-platform-win32-setfocus-extern-function-setfocus-hwnd-as-ptr-from-user32-dll-symbol-setfocus-returns-ptr-src-platform-win32-ml-960898644"></a>
### SetFocus

```ml
extern function SetFocus(hwnd as ptr) from "user32.dll" symbol "SetFocus" returns ptr
```

Bind the native SetFocus API used by MiniIDE.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `ptr` | — | hwnd value consumed by this operation. |


**Returns:** Native ptr result produced by the call.

[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L636)

<a id="extern_function-extern-function-platform-win32-setforegroundwindow-extern-function-setforegroundwindow-hwnd-as-ptr-from-user32-dll-symbol-setforegroundwindow-returns-bool-src-platform-win32-ml-1256588397"></a>
### SetForegroundWindow

```ml
extern function SetForegroundWindow(hwnd as ptr) from "user32.dll" symbol "SetForegroundWindow" returns bool
```

Bind the native SetForegroundWindow API used by MiniIDE.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `ptr` | — | hwnd value consumed by this operation. |


**Returns:** Native bool result produced by the call.

[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L617)

<a id="extern_function-extern-function-platform-win32-setmenu-extern-function-setmenu-hwnd-as-ptr-menu-as-ptr-from-user32-dll-symbol-setmenu-returns-bool-src-platform-win32-ml-986623904"></a>
### SetMenu

```ml
extern function SetMenu(hwnd as ptr, menu as ptr) from "user32.dll" symbol "SetMenu" returns bool
```

Bind the native SetMenu API used by MiniIDE.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `ptr` | — | hwnd value consumed by this operation. |
| `menu` | `ptr` | — | menu value consumed by this operation. |


**Returns:** Native bool result produced by the call.

[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L780)

<a id="extern_function-extern-function-platform-win32-settextcolor-extern-function-settextcolor-hdc-as-ptr-color-as-u32-from-gdi32-dll-symbol-settextcolor-returns-u32-src-platform-win32-ml-454574236"></a>
### SetTextColor

```ml
extern function SetTextColor(hdc as ptr, color as u32) from "gdi32.dll" symbol "SetTextColor" returns u32
```

Bind the native SetTextColor API used by MiniIDE.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hdc` | `ptr` | — | hdc value consumed by this operation. |
| `color` | `u32` | — | color value consumed by this operation. |


**Returns:** Native u32 result produced by the call.

[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L872)

<a id="extern_function-extern-function-platform-win32-setwindowpos-extern-function-setwindowpos-hwnd-as-ptr-insertafter-as-int-x-as-int-y-as-int-width-as-int-height-as-int-flags-as-u32-from-user32-dll-symbol-setwindowpos-returns-bool-src-platform-win32-ml-1395379485"></a>
### SetWindowPos

```ml
extern function SetWindowPos(hwnd as ptr, insertAfter as int, x as int, y as int, width as int, height as int, flags as u32) from "user32.dll" symbol "SetWindowPos" returns bool
```

Bind the native SetWindowPos API used by MiniIDE.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `ptr` | — | hwnd value consumed by this operation. |
| `insertAfter` | `int` | — | insertAfter value consumed by this operation. |
| `x` | `int` | — | Horizontal coordinate used by the operation. |
| `y` | `int` | — | Vertical coordinate used by the operation. |
| `width` | `int` | — | Width in the coordinate or storage units used by the caller. |
| `height` | `int` | — | Height in the coordinate or storage units used by the caller. |
| `flags` | `u32` | — | Bit flags controlling the operation. |


**Returns:** Native bool result produced by the call.

[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L667)

<a id="extern_function-extern-function-platform-win32-setwindowtextw-extern-function-setwindowtextw-hwnd-as-ptr-text-as-wstr-from-user32-dll-symbol-setwindowtextw-returns-bool-src-platform-win32-ml-1769858159"></a>
### SetWindowTextW

```ml
extern function SetWindowTextW(hwnd as ptr, text as wstr) from "user32.dll" symbol "SetWindowTextW" returns bool
```

Bind the native SetWindowTextW API used by MiniIDE.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `ptr` | — | hwnd value consumed by this operation. |
| `text` | `wstr` | — | Text consumed by the operation. |


**Returns:** Native bool result produced by the call.

[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L587)

<a id="extern_function-extern-function-platform-win32-setwindowtheme-extern-function-setwindowtheme-hwnd-as-ptr-subappname-as-wstr-subidlist-as-wstr-from-uxtheme-dll-symbol-setwindowtheme-returns-int-src-platform-win32-ml-353407537"></a>
### SetWindowTheme

```ml
extern function SetWindowTheme(hwnd as ptr, subAppName as wstr, subIdList as wstr) from "uxtheme.dll" symbol "SetWindowTheme" returns int
```

Bind the native SetWindowTheme API used by MiniIDE.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `ptr` | — | hwnd value consumed by this operation. |
| `subAppName` | `wstr` | — | subAppName value consumed by this operation. |
| `subIdList` | `wstr` | — | subIdList value consumed by this operation. |


**Returns:** Native int result produced by the call.

[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L845)

<a id="extern_function-extern-function-platform-win32-shgetfileinfow-extern-function-shgetfileinfow-path-as-wstr-fileattributes-as-u32-fileinfo-as-bytes-fileinfosize-as-u32-flags-as-u32-from-shell32-dll-symbol-shgetfileinfow-returns-ptr-src-platform-win32-ml-949549525"></a>
### SHGetFileInfoW

```ml
extern function SHGetFileInfoW(path as wstr, fileAttributes as u32, fileInfo as bytes, fileInfoSize as u32, flags as u32) from "shell32.dll" symbol "SHGetFileInfoW" returns ptr
```

Bind the native SHGetFileInfoW API used by MiniIDE.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `wstr` | — | Path of the file or directory used by the operation. |
| `fileAttributes` | `u32` | — | fileAttributes value consumed by this operation. |
| `fileInfo` | `bytes` | — | fileInfo value consumed by this operation. |
| `fileInfoSize` | `u32` | — | fileInfoSize value consumed by this operation. |
| `flags` | `u32` | — | Bit flags controlling the operation. |


**Returns:** Native ptr result produced by the call.

[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L835)

<a id="constant-constant-platform-win32-shgfi-icon-const-shgfi-icon-256-src-platform-win32-ml-2061289187"></a>
### SHGFI_ICON

```ml
const SHGFI_ICON = 256
```

Defines the shgfi icon constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L466)

<a id="constant-constant-platform-win32-shgfi-smallicon-const-shgfi-smallicon-1-src-platform-win32-ml-876663597"></a>
### SHGFI_SMALLICON

```ml
const SHGFI_SMALLICON = 1
```

Defines the shgfi smallicon constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L468)

<a id="constant-constant-platform-win32-shgfi-usefileattributes-const-shgfi-usefileattributes-16-src-platform-win32-ml-1131398691"></a>
### SHGFI_USEFILEATTRIBUTES

```ml
const SHGFI_USEFILEATTRIBUTES = 16
```

Defines the shgfi usefileattributes constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L470)

<a id="extern_function-extern-function-platform-win32-showwindow-extern-function-showwindow-hwnd-as-ptr-cmdshow-as-int-from-user32-dll-symbol-showwindow-returns-bool-src-platform-win32-ml-1175203633"></a>
### ShowWindow

```ml
extern function ShowWindow(hwnd as ptr, cmdShow as int) from "user32.dll" symbol "ShowWindow" returns bool
```

Bind the native ShowWindow API used by MiniIDE.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `ptr` | — | hwnd value consumed by this operation. |
| `cmdShow` | `int` | — | cmdShow value consumed by this operation. |


**Returns:** Native bool result produced by the call.

[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L540)

<a id="extern_function-extern-function-platform-win32-sleep-extern-function-sleep-ms-as-int-from-kernel32-dll-symbol-sleep-returns-void-src-platform-win32-ml-1998382365"></a>
### Sleep

```ml
extern function Sleep(ms as int) from "kernel32.dll" symbol "Sleep" returns void
```

Bind the native Sleep API used by MiniIDE.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ms` | `int` | — | ms value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L930)

<a id="constant-constant-platform-win32-ss-icon-const-ss-icon-3-src-platform-win32-ml-642255187"></a>
### SS_ICON

```ml
const SS_ICON = 3
```

Defines the ss icon constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L255)

<a id="constant-constant-platform-win32-ss-noprefix-const-ss-noprefix-128-src-platform-win32-ml-604862227"></a>
### SS_NOPREFIX

```ml
const SS_NOPREFIX = 128
```

Defines the ss noprefix constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L257)

<a id="constant-constant-platform-win32-ss-notify-const-ss-notify-256-src-platform-win32-ml-486394439"></a>
### SS_NOTIFY

```ml
const SS_NOTIFY = 256
```

Defines the ss notify constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L259)

<a id="constant-constant-platform-win32-ss-right-const-ss-right-2-src-platform-win32-ml-1055060616"></a>
### SS_RIGHT

```ml
const SS_RIGHT = 2
```

Defines the ss right constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L253)

<a id="constant-constant-platform-win32-stm-setimage-const-stm-setimage-370-src-platform-win32-ml-2031687434"></a>
### STM_SETIMAGE

```ml
const STM_SETIMAGE = 370
```

Defines the stm setimage constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L354)

<a id="constant-constant-platform-win32-sw-hide-const-sw-hide-0-src-platform-win32-ml-1622671502"></a>
### SW_HIDE

```ml
const SW_HIDE = 0
```

Defines the sw hide constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L46)

<a id="constant-constant-platform-win32-sw-maximize-const-sw-maximize-3-src-platform-win32-ml-1192450851"></a>
### SW_MAXIMIZE

```ml
const SW_MAXIMIZE = 3
```

Defines the sw maximize constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L48)

<a id="constant-constant-platform-win32-sw-minimize-const-sw-minimize-6-src-platform-win32-ml-399087216"></a>
### SW_MINIMIZE

```ml
const SW_MINIMIZE = 6
```

Defines the sw minimize constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L50)

<a id="constant-constant-platform-win32-sw-restore-const-sw-restore-9-src-platform-win32-ml-1075877949"></a>
### SW_RESTORE

```ml
const SW_RESTORE = 9
```

Defines the sw restore constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L52)

<a id="constant-constant-platform-win32-sw-show-const-sw-show-5-src-platform-win32-ml-1875382805"></a>
### SW_SHOW

```ml
const SW_SHOW = 5
```

Defines the sw show constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L44)

<a id="constant-constant-platform-win32-swp-noactivate-const-swp-noactivate-16-src-platform-win32-ml-476486639"></a>
### SWP_NOACTIVATE

```ml
const SWP_NOACTIVATE = 16
```

Defines the swp noactivate constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L60)

<a id="constant-constant-platform-win32-swp-nomove-const-swp-nomove-2-src-platform-win32-ml-8841864"></a>
### SWP_NOMOVE

```ml
const SWP_NOMOVE = 2
```

Defines the swp nomove constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L58)

<a id="constant-constant-platform-win32-swp-nosize-const-swp-nosize-1-src-platform-win32-ml-1521822477"></a>
### SWP_NOSIZE

```ml
const SWP_NOSIZE = 1
```

Defines the swp nosize constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L56)

<a id="function-function-platform-win32-tab-clear-function-tab-clear-hwnd-src-platform-win32-ml-851235188"></a>
### tab_clear

```ml
function tab_clear(hwnd)
```

Send the clear operation to a tab control.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `dynamic` | — | hwnd value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1719)

<a id="function-function-platform-win32-tab-get-cur-sel-function-tab-get-cur-sel-hwnd-src-platform-win32-ml-1724221330"></a>
### tab_get_cur_sel

```ml
function tab_get_cur_sel(hwnd)
```

Return cur selection from a tab control.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `dynamic` | — | hwnd value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1745)

<a id="function-function-platform-win32-tab-hit-test-function-tab-hit-test-hwnd-x-y-src-platform-win32-ml-1348986291"></a>
### tab_hit_test

```ml
function tab_hit_test(hwnd, x, y)
```

Send the hit test operation to a tab control.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `dynamic` | — | hwnd value consumed by this operation. |
| `x` | `dynamic` | — | Horizontal coordinate used by the operation. |
| `y` | `dynamic` | — | Vertical coordinate used by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1772)

<a id="function-function-platform-win32-tab-insert-function-tab-insert-hwnd-index-text-param-src-platform-win32-ml-269948314"></a>
### tab_insert

```ml
function tab_insert(hwnd, index, text, param)
```

Send the insert operation to a tab control.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `dynamic` | — | hwnd value consumed by this operation. |
| `index` | `dynamic` | — | Zero-based index of the affected item. |
| `text` | `dynamic` | — | Text consumed by the operation. |
| `param` | `dynamic` | — | param value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1729)

<a id="function-function-platform-win32-tab-set-cur-sel-function-tab-set-cur-sel-hwnd-index-src-platform-win32-ml-1542873338"></a>
### tab_set_cur_sel

```ml
function tab_set_cur_sel(hwnd, index)
```

Send the set cur selection operation to a tab control.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `dynamic` | — | hwnd value consumed by this operation. |
| `index` | `dynamic` | — | Zero-based index of the affected item. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1753)

<a id="function-function-platform-win32-tab-set-item-size-function-tab-set-item-size-hwnd-width-height-src-platform-win32-ml-318595979"></a>
### tab_set_item_size

```ml
function tab_set_item_size(hwnd, width, height)
```

Send the set item size operation to a tab control.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `dynamic` | — | hwnd value consumed by this operation. |
| `width` | `dynamic` | — | Width in the coordinate or storage units used by the caller. |
| `height` | `dynamic` | — | Height in the coordinate or storage units used by the caller. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1762)

<a id="constant-constant-platform-win32-tcif-param-const-tcif-param-8-src-platform-win32-ml-1795334236"></a>
### TCIF_PARAM

```ml
const TCIF_PARAM = 8
```

Defines the tcif param constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L341)

<a id="constant-constant-platform-win32-tcif-text-const-tcif-text-1-src-platform-win32-ml-1812237297"></a>
### TCIF_TEXT

```ml
const TCIF_TEXT = 1
```

Defines the tcif text constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L339)

<a id="constant-constant-platform-win32-tcm-deleteallitems-const-tcm-deleteallitems-4873-src-platform-win32-ml-908946294"></a>
### TCM_DELETEALLITEMS

```ml
const TCM_DELETEALLITEMS = 4873
```

Defines the tcm deleteallitems constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L333)

<a id="constant-constant-platform-win32-tcm-first-const-tcm-first-4864-src-platform-win32-ml-293740902"></a>
### TCM_FIRST

```ml
const TCM_FIRST = 4864
```

Defines the tcm first constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L325)

<a id="constant-constant-platform-win32-tcm-getcursel-const-tcm-getcursel-4875-src-platform-win32-ml-1565372320"></a>
### TCM_GETCURSEL

```ml
const TCM_GETCURSEL = 4875
```

Defines the tcm getcursel constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L327)

<a id="constant-constant-platform-win32-tcm-hittest-const-tcm-hittest-4877-src-platform-win32-ml-1388270642"></a>
### TCM_HITTEST

```ml
const TCM_HITTEST = 4877
```

Defines the tcm hittest constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L331)

<a id="constant-constant-platform-win32-tcm-insertitemw-const-tcm-insertitemw-4926-src-platform-win32-ml-185426343"></a>
### TCM_INSERTITEMW

```ml
const TCM_INSERTITEMW = 4926
```

Defines the tcm insertitemw constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L337)

<a id="constant-constant-platform-win32-tcm-setcursel-const-tcm-setcursel-4876-src-platform-win32-ml-208488341"></a>
### TCM_SETCURSEL

```ml
const TCM_SETCURSEL = 4876
```

Defines the tcm setcursel constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L329)

<a id="constant-constant-platform-win32-tcm-setitemsize-const-tcm-setitemsize-4905-src-platform-win32-ml-1285281280"></a>
### TCM_SETITEMSIZE

```ml
const TCM_SETITEMSIZE = 4905
```

Defines the tcm setitemsize constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L335)

<a id="constant-constant-platform-win32-tcn-selchange-const-tcn-selchange-551-src-platform-win32-ml-426880844"></a>
### TCN_SELCHANGE

```ml
const TCN_SELCHANGE = -551
```

Defines the tcn selchange constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L347)

<a id="constant-constant-platform-win32-tcs-fixedwidth-const-tcs-fixedwidth-1024-src-platform-win32-ml-4739947"></a>
### TCS_FIXEDWIDTH

```ml
const TCS_FIXEDWIDTH = 1024
```

Defines the tcs fixedwidth constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L323)

<a id="constant-constant-platform-win32-tcs-focusnever-const-tcs-focusnever-32768-src-platform-win32-ml-2125925026"></a>
### TCS_FOCUSNEVER

```ml
const TCS_FOCUSNEVER = 32768
```

Defines the tcs focusnever constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L321)

<a id="extern_function-extern-function-platform-win32-textoutw-extern-function-textoutw-hdc-as-ptr-x-as-int-y-as-int-text-as-wstr-count-as-int-from-gdi32-dll-symbol-textoutw-returns-bool-src-platform-win32-ml-644487483"></a>
### TextOutW

```ml
extern function TextOutW(hdc as ptr, x as int, y as int, text as wstr, count as int) from "gdi32.dll" symbol "TextOutW" returns bool
```

Bind the native TextOutW API used by MiniIDE.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hdc` | `ptr` | — | hdc value consumed by this operation. |
| `x` | `int` | — | Horizontal coordinate used by the operation. |
| `y` | `int` | — | Vertical coordinate used by the operation. |
| `text` | `wstr` | — | Text consumed by the operation. |
| `count` | `int` | — | Number of items or units to process. |


**Returns:** Native bool result produced by the call.

[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L885)

<a id="function-function-platform-win32-toolbar-icon-function-toolbar-icon-kind-src-platform-win32-ml-1407927249"></a>
### toolbar_icon

```ml
function toolbar_icon(kind)
```

Return the icon glyph used for a toolbar command.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `kind` | `dynamic` | — | kind value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1179)

<a id="constant-constant-platform-win32-tpm-leftalign-const-tpm-leftalign-0-src-platform-win32-ml-1917612298"></a>
### TPM_LEFTALIGN

```ml
const TPM_LEFTALIGN = 0
```

Defines the tpm leftalign constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L453)

<a id="constant-constant-platform-win32-tpm-nonotify-const-tpm-nonotify-128-src-platform-win32-ml-1821237741"></a>
### TPM_NONOTIFY

```ml
const TPM_NONOTIFY = 128
```

Defines the tpm nonotify constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L459)

<a id="constant-constant-platform-win32-tpm-returncmd-const-tpm-returncmd-256-src-platform-win32-ml-759224463"></a>
### TPM_RETURNCMD

```ml
const TPM_RETURNCMD = 256
```

Defines the tpm returncmd constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L457)

<a id="constant-constant-platform-win32-tpm-topalign-const-tpm-topalign-0-src-platform-win32-ml-939440700"></a>
### TPM_TOPALIGN

```ml
const TPM_TOPALIGN = 0
```

Defines the tpm topalign constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L455)

<a id="function-function-platform-win32-track-popup-function-track-popup-hwnd-menu-x-y-src-platform-win32-ml-1141663398"></a>
### track_popup

```ml
function track_popup(hwnd, menu, x, y)
```

Show a popup menu at a client-coordinate position.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `dynamic` | — | hwnd value consumed by this operation. |
| `menu` | `dynamic` | — | menu value consumed by this operation. |
| `x` | `dynamic` | — | Horizontal coordinate used by the operation. |
| `y` | `dynamic` | — | Vertical coordinate used by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1080)

<a id="extern_function-extern-function-platform-win32-trackpopupmenu-extern-function-trackpopupmenu-menu-as-ptr-flags-as-u32-x-as-int-y-as-int-reserved-as-int-hwnd-as-ptr-rect-as-ptr-from-user32-dll-symbol-trackpopupmenu-returns-int-src-platform-win32-ml-1054691691"></a>
### TrackPopupMenu

```ml
extern function TrackPopupMenu(menu as ptr, flags as u32, x as int, y as int, reserved as int, hwnd as ptr, rect as ptr) from "user32.dll" symbol "TrackPopupMenu" returns int
```

Bind the native TrackPopupMenu API used by MiniIDE.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `menu` | `ptr` | — | menu value consumed by this operation. |
| `flags` | `u32` | — | Bit flags controlling the operation. |
| `x` | `int` | — | Horizontal coordinate used by the operation. |
| `y` | `int` | — | Vertical coordinate used by the operation. |
| `reserved` | `int` | — | reserved value consumed by this operation. |
| `hwnd` | `ptr` | — | hwnd value consumed by this operation. |
| `rect` | `ptr` | — | rect value consumed by this operation. |


**Returns:** Native int result produced by the call.

[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L801)

<a id="extern_function-extern-function-platform-win32-translatemessage-extern-function-translatemessage-msg-as-bytes-from-user32-dll-symbol-translatemessage-returns-bool-src-platform-win32-ml-1360573960"></a>
### TranslateMessage

```ml
extern function TranslateMessage(msg as bytes) from "user32.dll" symbol "TranslateMessage" returns bool
```

Bind the native TranslateMessage API used by MiniIDE.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `bytes` | — | msg value consumed by this operation. |


**Returns:** Native bool result produced by the call.

[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L574)

<a id="constant-constant-platform-win32-transparent-const-transparent-1-src-platform-win32-ml-376680345"></a>
### TRANSPARENT

```ml
const TRANSPARENT = 1
```

Defines the transparent constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L64)

<a id="function-function-platform-win32-tree-clear-function-tree-clear-hwnd-src-platform-win32-ml-528550538"></a>
### tree_clear

```ml
function tree_clear(hwnd)
```

Send the clear operation to a tree-view control.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `dynamic` | — | hwnd value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1630)

<a id="function-function-platform-win32-tree-expand-function-tree-expand-hwnd-item-src-platform-win32-ml-2062196877"></a>
### tree_expand

```ml
function tree_expand(hwnd, item)
```

Send the expand operation to a tree-view control.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `dynamic` | — | hwnd value consumed by this operation. |
| `item` | `dynamic` | — | item value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1670)

<a id="function-function-platform-win32-tree-get-selection-function-tree-get-selection-hwnd-src-platform-win32-ml-137690418"></a>
### tree_get_selection

```ml
function tree_get_selection(hwnd)
```

Return selection from a tree-view control.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `dynamic` | — | hwnd value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1677)

<a id="function-function-platform-win32-tree-hit-test-function-tree-hit-test-hwnd-x-y-src-platform-win32-ml-922995501"></a>
### tree_hit_test

```ml
function tree_hit_test(hwnd, x, y)
```

Send the hit test operation to a tree-view control.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `dynamic` | — | hwnd value consumed by this operation. |
| `x` | `dynamic` | — | Horizontal coordinate used by the operation. |
| `y` | `dynamic` | — | Vertical coordinate used by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1707)

<a id="function-function-platform-win32-tree-insert-function-tree-insert-hwnd-parent-text-param-has-children-image-src-platform-win32-ml-1886168583"></a>
### tree_insert

```ml
function tree_insert(hwnd, parent, text, param, has_children, image)
```

Send the insert operation to a tree-view control.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `dynamic` | — | hwnd value consumed by this operation. |
| `parent` | `dynamic` | — | parent value consumed by this operation. |
| `text` | `dynamic` | — | Text consumed by the operation. |
| `param` | `dynamic` | — | param value consumed by this operation. |
| `has_children` | `dynamic` | — | has_children value consumed by this operation. |
| `image` | `dynamic` | — | image value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1642)

<a id="function-function-platform-win32-tree-select-function-tree-select-hwnd-item-src-platform-win32-ml-126835613"></a>
### tree_select

```ml
function tree_select(hwnd, item)
```

Send the select operation to a tree-view control.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `dynamic` | — | hwnd value consumed by this operation. |
| `item` | `dynamic` | — | item value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1685)

<a id="function-function-platform-win32-tree-set-colors-function-tree-set-colors-hwnd-bg-text-line-src-platform-win32-ml-994081168"></a>
### tree_set_colors

```ml
function tree_set_colors(hwnd, bg, text, line)
```

Send the set colors operation to a tree-view control.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `dynamic` | — | hwnd value consumed by this operation. |
| `bg` | `dynamic` | — | bg value consumed by this operation. |
| `text` | `dynamic` | — | Text consumed by the operation. |
| `line` | `dynamic` | — | line value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1695)

<a id="function-function-platform-win32-tree-set-image-list-function-tree-set-image-list-hwnd-image-list-src-platform-win32-ml-1554057304"></a>
### tree_set_image_list

```ml
function tree_set_image_list(hwnd, image_list)
```

Send the set image list operation to a tree-view control.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `dynamic` | — | hwnd value consumed by this operation. |
| `image_list` | `dynamic` | — | image_list value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L1172)

<a id="constant-constant-platform-win32-tv-first-const-tv-first-4352-src-platform-win32-ml-1302367674"></a>
### TV_FIRST

```ml
const TV_FIRST = 4352
```

Defines the tv first constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L278)

<a id="constant-constant-platform-win32-tve-expand-const-tve-expand-2-src-platform-win32-ml-354284354"></a>
### TVE_EXPAND

```ml
const TVE_EXPAND = 2
```

Defines the tve expand constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L302)

<a id="constant-constant-platform-win32-tvgn-caret-const-tvgn-caret-9-src-platform-win32-ml-1685104061"></a>
### TVGN_CARET

```ml
const TVGN_CARET = 9
```

Defines the tvgn caret constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L300)

<a id="constant-constant-platform-win32-tvi-last-const-tvi-last-65534-src-platform-win32-ml-1667448540"></a>
### TVI_LAST

```ml
const TVI_LAST = -65534
```

Defines the tvi last constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L308)

<a id="constant-constant-platform-win32-tvi-root-const-tvi-root-65536-src-platform-win32-ml-123228882"></a>
### TVI_ROOT

```ml
const TVI_ROOT = -65536
```

Defines the tvi root constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L306)

<a id="constant-constant-platform-win32-tvif-children-const-tvif-children-64-src-platform-win32-ml-1138826634"></a>
### TVIF_CHILDREN

```ml
const TVIF_CHILDREN = 64
```

Defines the tvif children constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L318)

<a id="constant-constant-platform-win32-tvif-image-const-tvif-image-2-src-platform-win32-ml-1569189992"></a>
### TVIF_IMAGE

```ml
const TVIF_IMAGE = 2
```

Defines the tvif image constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L312)

<a id="constant-constant-platform-win32-tvif-param-const-tvif-param-4-src-platform-win32-ml-626582422"></a>
### TVIF_PARAM

```ml
const TVIF_PARAM = 4
```

Defines the tvif param constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L314)

<a id="constant-constant-platform-win32-tvif-selectedimage-const-tvif-selectedimage-32-src-platform-win32-ml-31927763"></a>
### TVIF_SELECTEDIMAGE

```ml
const TVIF_SELECTEDIMAGE = 32
```

Defines the tvif selectedimage constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L316)

<a id="constant-constant-platform-win32-tvif-text-const-tvif-text-1-src-platform-win32-ml-119685853"></a>
### TVIF_TEXT

```ml
const TVIF_TEXT = 1
```

Defines the tvif text constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L310)

<a id="constant-constant-platform-win32-tvm-deleteitem-const-tvm-deleteitem-4353-src-platform-win32-ml-398052559"></a>
### TVM_DELETEITEM

```ml
const TVM_DELETEITEM = 4353
```

Defines the tvm deleteitem constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L282)

<a id="constant-constant-platform-win32-tvm-expand-const-tvm-expand-4354-src-platform-win32-ml-516006722"></a>
### TVM_EXPAND

```ml
const TVM_EXPAND = 4354
```

Defines the tvm expand constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L284)

<a id="constant-constant-platform-win32-tvm-getnextitem-const-tvm-getnextitem-4362-src-platform-win32-ml-805830625"></a>
### TVM_GETNEXTITEM

```ml
const TVM_GETNEXTITEM = 4362
```

Defines the tvm getnextitem constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L288)

<a id="constant-constant-platform-win32-tvm-hittest-const-tvm-hittest-4369-src-platform-win32-ml-1076101832"></a>
### TVM_HITTEST

```ml
const TVM_HITTEST = 4369
```

Defines the tvm hittest constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L292)

<a id="constant-constant-platform-win32-tvm-insertitemw-const-tvm-insertitemw-4402-src-platform-win32-ml-1347284122"></a>
### TVM_INSERTITEMW

```ml
const TVM_INSERTITEMW = 4402
```

Defines the tvm insertitemw constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L280)

<a id="constant-constant-platform-win32-tvm-selectitem-const-tvm-selectitem-4363-src-platform-win32-ml-94294938"></a>
### TVM_SELECTITEM

```ml
const TVM_SELECTITEM = 4363
```

Defines the tvm selectitem constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L290)

<a id="constant-constant-platform-win32-tvm-setbkcolor-const-tvm-setbkcolor-4381-src-platform-win32-ml-625887164"></a>
### TVM_SETBKCOLOR

```ml
const TVM_SETBKCOLOR = 4381
```

Defines the tvm setbkcolor constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L294)

<a id="constant-constant-platform-win32-tvm-setimagelist-const-tvm-setimagelist-4361-src-platform-win32-ml-1194963436"></a>
### TVM_SETIMAGELIST

```ml
const TVM_SETIMAGELIST = 4361
```

Defines the tvm setimagelist constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L286)

<a id="constant-constant-platform-win32-tvm-setlinecolor-const-tvm-setlinecolor-4392-src-platform-win32-ml-274434886"></a>
### TVM_SETLINECOLOR

```ml
const TVM_SETLINECOLOR = 4392
```

Defines the tvm setlinecolor constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L298)

<a id="constant-constant-platform-win32-tvm-settextcolor-const-tvm-settextcolor-4382-src-platform-win32-ml-2669341"></a>
### TVM_SETTEXTCOLOR

```ml
const TVM_SETTEXTCOLOR = 4382
```

Defines the tvm settextcolor constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L296)

<a id="constant-constant-platform-win32-tvs-fullrowselect-const-tvs-fullrowselect-4096-src-platform-win32-ml-2085743879"></a>
### TVS_FULLROWSELECT

```ml
const TVS_FULLROWSELECT = 4096
```

Defines the tvs fullrowselect constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L275)

<a id="constant-constant-platform-win32-tvs-hasbuttons-const-tvs-hasbuttons-1-src-platform-win32-ml-1052788697"></a>
### TVS_HASBUTTONS

```ml
const TVS_HASBUTTONS = 1
```

Defines the tvs hasbuttons constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L267)

<a id="constant-constant-platform-win32-tvs-haslines-const-tvs-haslines-2-src-platform-win32-ml-630492016"></a>
### TVS_HASLINES

```ml
const TVS_HASLINES = 2
```

Defines the tvs haslines constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L269)

<a id="constant-constant-platform-win32-tvs-linesatroot-const-tvs-linesatroot-4-src-platform-win32-ml-1452165366"></a>
### TVS_LINESATROOT

```ml
const TVS_LINESATROOT = 4
```

Defines the tvs linesatroot constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L271)

<a id="constant-constant-platform-win32-tvs-showselalways-const-tvs-showselalways-32-src-platform-win32-ml-1938060405"></a>
### TVS_SHOWSELALWAYS

```ml
const TVS_SHOWSELALWAYS = 32
```

Defines the tvs showselalways constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L273)

<a id="constant-constant-platform-win32-tvsil-normal-const-tvsil-normal-0-src-platform-win32-ml-1007196988"></a>
### TVSIL_NORMAL

```ml
const TVSIL_NORMAL = 0
```

Defines the tvsil normal constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L304)

<a id="extern_function-extern-function-platform-win32-updatewindow-extern-function-updatewindow-hwnd-as-ptr-from-user32-dll-symbol-updatewindow-returns-bool-src-platform-win32-ml-2113640815"></a>
### UpdateWindow

```ml
extern function UpdateWindow(hwnd as ptr) from "user32.dll" symbol "UpdateWindow" returns bool
```

Bind the native UpdateWindow API used by MiniIDE.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hwnd` | `ptr` | — | hwnd value consumed by this operation. |


**Returns:** Native bool result produced by the call.

[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L544)

<a id="constant-constant-platform-win32-vk-a-const-vk-a-65-src-platform-win32-ml-104651829"></a>
### VK_A

```ml
const VK_A = 65
```

Defines the vk a constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L175)

<a id="constant-constant-platform-win32-vk-back-const-vk-back-8-src-platform-win32-ml-1281782282"></a>
### VK_BACK

```ml
const VK_BACK = 8
```

Defines the vk back constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L137)

<a id="constant-constant-platform-win32-vk-c-const-vk-c-67-src-platform-win32-ml-1930894471"></a>
### VK_C

```ml
const VK_C = 67
```

Defines the vk c constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L177)

<a id="constant-constant-platform-win32-vk-control-const-vk-control-17-src-platform-win32-ml-39698008"></a>
### VK_CONTROL

```ml
const VK_CONTROL = 17
```

Defines the vk control constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L149)

<a id="constant-constant-platform-win32-vk-delete-const-vk-delete-46-src-platform-win32-ml-1039802158"></a>
### VK_DELETE

```ml
const VK_DELETE = 46
```

Defines the vk delete constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L173)

<a id="constant-constant-platform-win32-vk-down-const-vk-down-40-src-platform-win32-ml-1437672880"></a>
### VK_DOWN

```ml
const VK_DOWN = 40
```

Defines the vk down constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L171)

<a id="constant-constant-platform-win32-vk-e-const-vk-e-69-src-platform-win32-ml-2035500585"></a>
### VK_E

```ml
const VK_E = 69
```

Defines the vk e constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L179)

<a id="constant-constant-platform-win32-vk-end-const-vk-end-35-src-platform-win32-ml-1827186188"></a>
### VK_END

```ml
const VK_END = 35
```

Defines the vk end constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L161)

<a id="constant-constant-platform-win32-vk-escape-const-vk-escape-27-src-platform-win32-ml-617134563"></a>
### VK_ESCAPE

```ml
const VK_ESCAPE = 27
```

Defines the vk escape constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L153)

<a id="constant-constant-platform-win32-vk-f-const-vk-f-70-src-platform-win32-ml-1474074385"></a>
### VK_F

```ml
const VK_F = 70
```

Defines the vk f constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L181)

<a id="constant-constant-platform-win32-vk-f1-const-vk-f1-112-src-platform-win32-ml-75737890"></a>
### VK_F1

```ml
const VK_F1 = 112
```

Defines the vk f1 constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L201)

<a id="constant-constant-platform-win32-vk-f12-const-vk-f12-123-src-platform-win32-ml-138501246"></a>
### VK_F12

```ml
const VK_F12 = 123
```

Defines the vk f12 constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L213)

<a id="constant-constant-platform-win32-vk-f2-const-vk-f2-113-src-platform-win32-ml-1303162665"></a>
### VK_F2

```ml
const VK_F2 = 113
```

Defines the vk f2 constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L203)

<a id="constant-constant-platform-win32-vk-f3-const-vk-f3-114-src-platform-win32-ml-370634440"></a>
### VK_F3

```ml
const VK_F3 = 114
```

Defines the vk f3 constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L205)

<a id="constant-constant-platform-win32-vk-f5-const-vk-f5-116-src-platform-win32-ml-219998358"></a>
### VK_F5

```ml
const VK_F5 = 116
```

Defines the vk f5 constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L207)

<a id="constant-constant-platform-win32-vk-f6-const-vk-f6-117-src-platform-win32-ml-796973901"></a>
### VK_F6

```ml
const VK_F6 = 117
```

Defines the vk f6 constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L209)

<a id="constant-constant-platform-win32-vk-f7-const-vk-f7-118-src-platform-win32-ml-1510872828"></a>
### VK_F7

```ml
const VK_F7 = 118
```

Defines the vk f7 constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L211)

<a id="constant-constant-platform-win32-vk-g-const-vk-g-71-src-platform-win32-ml-1011453500"></a>
### VK_G

```ml
const VK_G = 71
```

Defines the vk g constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L183)

<a id="constant-constant-platform-win32-vk-home-const-vk-home-36-src-platform-win32-ml-2015724237"></a>
### VK_HOME

```ml
const VK_HOME = 36
```

Defines the vk home constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L163)

<a id="constant-constant-platform-win32-vk-lbutton-const-vk-lbutton-1-src-platform-win32-ml-1365645899"></a>
### VK_LBUTTON

```ml
const VK_LBUTTON = 1
```

Defines the vk lbutton constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L139)

<a id="constant-constant-platform-win32-vk-left-const-vk-left-37-src-platform-win32-ml-1880274322"></a>
### VK_LEFT

```ml
const VK_LEFT = 37
```

Defines the vk left constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L165)

<a id="constant-constant-platform-win32-vk-menu-const-vk-menu-18-src-platform-win32-ml-1736562021"></a>
### VK_MENU

```ml
const VK_MENU = 18
```

Defines the vk menu constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L151)

<a id="constant-constant-platform-win32-vk-next-const-vk-next-34-src-platform-win32-ml-916535683"></a>
### VK_NEXT

```ml
const VK_NEXT = 34
```

Defines the vk next constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L159)

<a id="constant-constant-platform-win32-vk-o-const-vk-o-79-src-platform-win32-ml-822292292"></a>
### VK_O

```ml
const VK_O = 79
```

Defines the vk o constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L185)

<a id="constant-constant-platform-win32-vk-p-const-vk-p-80-src-platform-win32-ml-1597281826"></a>
### VK_P

```ml
const VK_P = 80
```

Defines the vk p constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L187)

<a id="constant-constant-platform-win32-vk-prior-const-vk-prior-33-src-platform-win32-ml-1238458192"></a>
### VK_PRIOR

```ml
const VK_PRIOR = 33
```

Defines the vk prior constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L157)

<a id="constant-constant-platform-win32-vk-rbutton-const-vk-rbutton-2-src-platform-win32-ml-734270846"></a>
### VK_RBUTTON

```ml
const VK_RBUTTON = 2
```

Defines the vk rbutton constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L141)

<a id="constant-constant-platform-win32-vk-return-const-vk-return-13-src-platform-win32-ml-1415547268"></a>
### VK_RETURN

```ml
const VK_RETURN = 13
```

Defines the vk return constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L145)

<a id="constant-constant-platform-win32-vk-right-const-vk-right-39-src-platform-win32-ml-2132767054"></a>
### VK_RIGHT

```ml
const VK_RIGHT = 39
```

Defines the vk right constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L169)

<a id="constant-constant-platform-win32-vk-s-const-vk-s-83-src-platform-win32-ml-2140868113"></a>
### VK_S

```ml
const VK_S = 83
```

Defines the vk s constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L189)

<a id="constant-constant-platform-win32-vk-shift-const-vk-shift-16-src-platform-win32-ml-544412385"></a>
### VK_SHIFT

```ml
const VK_SHIFT = 16
```

Defines the vk shift constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L147)

<a id="constant-constant-platform-win32-vk-space-const-vk-space-32-src-platform-win32-ml-1595822267"></a>
### VK_SPACE

```ml
const VK_SPACE = 32
```

Defines the vk space constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L155)

<a id="constant-constant-platform-win32-vk-t-const-vk-t-84-src-platform-win32-ml-1837057998"></a>
### VK_T

```ml
const VK_T = 84
```

Defines the vk t constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L191)

<a id="constant-constant-platform-win32-vk-tab-const-vk-tab-9-src-platform-win32-ml-1474034877"></a>
### VK_TAB

```ml
const VK_TAB = 9
```

Defines the vk tab constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L143)

<a id="constant-constant-platform-win32-vk-up-const-vk-up-38-src-platform-win32-ml-1896841775"></a>
### VK_UP

```ml
const VK_UP = 38
```

Defines the vk up constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L167)

<a id="constant-constant-platform-win32-vk-v-const-vk-v-86-src-platform-win32-ml-2116916636"></a>
### VK_V

```ml
const VK_V = 86
```

Defines the vk v constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L193)

<a id="constant-constant-platform-win32-vk-x-const-vk-x-88-src-platform-win32-ml-245586202"></a>
### VK_X

```ml
const VK_X = 88
```

Defines the vk x constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L195)

<a id="constant-constant-platform-win32-vk-y-const-vk-y-89-src-platform-win32-ml-450596563"></a>
### VK_Y

```ml
const VK_Y = 89
```

Defines the vk y constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L197)

<a id="constant-constant-platform-win32-vk-z-const-vk-z-90-src-platform-win32-ml-1419028223"></a>
### VK_Z

```ml
const VK_Z = 90
```

Defines the vk z constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L199)

<a id="constant-constant-platform-win32-wm-char-const-wm-char-258-src-platform-win32-ml-146398185"></a>
### WM_CHAR

```ml
const WM_CHAR = 258
```

Defines the wm char constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L105)

<a id="constant-constant-platform-win32-wm-close-const-wm-close-16-src-platform-win32-ml-1107166743"></a>
### WM_CLOSE

```ml
const WM_CLOSE = 16
```

Defines the wm close constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L83)

<a id="constant-constant-platform-win32-wm-command-const-wm-command-273-src-platform-win32-ml-940990872"></a>
### WM_COMMAND

```ml
const WM_COMMAND = 273
```

Defines the wm command constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L125)

<a id="constant-constant-platform-win32-wm-contextmenu-const-wm-contextmenu-123-src-platform-win32-ml-652400854"></a>
### WM_CONTEXTMENU

```ml
const WM_CONTEXTMENU = 123
```

Defines the wm contextmenu constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L101)

<a id="constant-constant-platform-win32-wm-copy-const-wm-copy-769-src-platform-win32-ml-509028166"></a>
### WM_COPY

```ml
const WM_COPY = 769
```

Defines the wm copy constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L402)

<a id="constant-constant-platform-win32-wm-cut-const-wm-cut-768-src-platform-win32-ml-197601841"></a>
### WM_CUT

```ml
const WM_CUT = 768
```

Defines the wm cut constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L400)

<a id="constant-constant-platform-win32-wm-destroy-const-wm-destroy-2-src-platform-win32-ml-1142569016"></a>
### WM_DESTROY

```ml
const WM_DESTROY = 2
```

Defines the wm destroy constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L85)

<a id="constant-constant-platform-win32-wm-gettext-const-wm-gettext-13-src-platform-win32-ml-273512774"></a>
### WM_GETTEXT

```ml
const WM_GETTEXT = 13
```

Defines the wm gettext constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L89)

<a id="constant-constant-platform-win32-wm-gettextlength-const-wm-gettextlength-14-src-platform-win32-ml-1792335983"></a>
### WM_GETTEXTLENGTH

```ml
const WM_GETTEXTLENGTH = 14
```

Defines the wm gettextlength constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L91)

<a id="constant-constant-platform-win32-wm-keydown-const-wm-keydown-256-src-platform-win32-ml-1843128693"></a>
### WM_KEYDOWN

```ml
const WM_KEYDOWN = 256
```

Defines the wm keydown constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L107)

<a id="constant-constant-platform-win32-wm-lbuttondblclk-const-wm-lbuttondblclk-515-src-platform-win32-ml-1013449631"></a>
### WM_LBUTTONDBLCLK

```ml
const WM_LBUTTONDBLCLK = 515
```

Defines the wm lbuttondblclk constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L113)

<a id="constant-constant-platform-win32-wm-lbuttondown-const-wm-lbuttondown-513-src-platform-win32-ml-1148211065"></a>
### WM_LBUTTONDOWN

```ml
const WM_LBUTTONDOWN = 513
```

Defines the wm lbuttondown constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L109)

<a id="constant-constant-platform-win32-wm-lbuttonup-const-wm-lbuttonup-514-src-platform-win32-ml-55847818"></a>
### WM_LBUTTONUP

```ml
const WM_LBUTTONUP = 514
```

Defines the wm lbuttonup constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L111)

<a id="constant-constant-platform-win32-wm-mbuttonup-const-wm-mbuttonup-520-src-platform-win32-ml-636039715"></a>
### WM_MBUTTONUP

```ml
const WM_MBUTTONUP = 520
```

Defines the wm mbuttonup constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L119)

<a id="constant-constant-platform-win32-wm-mousemove-const-wm-mousemove-512-src-platform-win32-ml-1459350082"></a>
### WM_MOUSEMOVE

```ml
const WM_MOUSEMOVE = 512
```

Defines the wm mousemove constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L121)

<a id="constant-constant-platform-win32-wm-mousewheel-const-wm-mousewheel-522-src-platform-win32-ml-1660302545"></a>
### WM_MOUSEWHEEL

```ml
const WM_MOUSEWHEEL = 522
```

Defines the wm mousewheel constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L123)

<a id="constant-constant-platform-win32-wm-ncdestroy-const-wm-ncdestroy-130-src-platform-win32-ml-196529692"></a>
### WM_NCDESTROY

```ml
const WM_NCDESTROY = 130
```

Defines the wm ncdestroy constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L95)

<a id="constant-constant-platform-win32-wm-nclbuttondown-const-wm-nclbuttondown-161-src-platform-win32-ml-1698986"></a>
### WM_NCLBUTTONDOWN

```ml
const WM_NCLBUTTONDOWN = 161
```

Defines the wm nclbuttondown constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L97)

<a id="constant-constant-platform-win32-wm-nclbuttonup-const-wm-nclbuttonup-162-src-platform-win32-ml-1851403645"></a>
### WM_NCLBUTTONUP

```ml
const WM_NCLBUTTONUP = 162
```

Defines the wm nclbuttonup constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L99)

<a id="constant-constant-platform-win32-wm-notify-const-wm-notify-78-src-platform-win32-ml-1085523623"></a>
### WM_NOTIFY

```ml
const WM_NOTIFY = 78
```

Defines the wm notify constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L127)

<a id="constant-constant-platform-win32-wm-paste-const-wm-paste-770-src-platform-win32-ml-1109917434"></a>
### WM_PASTE

```ml
const WM_PASTE = 770
```

Defines the wm paste constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L404)

<a id="constant-constant-platform-win32-wm-quit-const-wm-quit-18-src-platform-win32-ml-805856181"></a>
### WM_QUIT

```ml
const WM_QUIT = 18
```

Defines the wm quit constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L81)

<a id="constant-constant-platform-win32-wm-rbuttondown-const-wm-rbuttondown-516-src-platform-win32-ml-1723588322"></a>
### WM_RBUTTONDOWN

```ml
const WM_RBUTTONDOWN = 516
```

Defines the wm rbuttondown constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L115)

<a id="constant-constant-platform-win32-wm-rbuttonup-const-wm-rbuttonup-517-src-platform-win32-ml-921469951"></a>
### WM_RBUTTONUP

```ml
const WM_RBUTTONUP = 517
```

Defines the wm rbuttonup constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L117)

<a id="constant-constant-platform-win32-wm-setcursor-const-wm-setcursor-32-src-platform-win32-ml-1941833493"></a>
### WM_SETCURSOR

```ml
const WM_SETCURSOR = 32
```

Defines the wm setcursor constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L93)

<a id="constant-constant-platform-win32-wm-setfont-const-wm-setfont-48-src-platform-win32-ml-1648492126"></a>
### WM_SETFONT

```ml
const WM_SETFONT = 48
```

Defines the wm setfont constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L350)

<a id="constant-constant-platform-win32-wm-setredraw-const-wm-setredraw-11-src-platform-win32-ml-1539286488"></a>
### WM_SETREDRAW

```ml
const WM_SETREDRAW = 11
```

Defines the wm setredraw constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L352)

<a id="constant-constant-platform-win32-wm-settext-const-wm-settext-12-src-platform-win32-ml-1161445185"></a>
### WM_SETTEXT

```ml
const WM_SETTEXT = 12
```

Defines the wm settext constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L87)

<a id="constant-constant-platform-win32-wm-syscommand-const-wm-syscommand-274-src-platform-win32-ml-2009982203"></a>
### WM_SYSCOMMAND

```ml
const WM_SYSCOMMAND = 274
```

Defines the wm syscommand constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L103)

<a id="constant-constant-platform-win32-ws-border-const-ws-border-8388608-src-platform-win32-ml-378763911"></a>
### WS_BORDER

```ml
const WS_BORDER = 8388608
```

Defines the ws border constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L34)

<a id="constant-constant-platform-win32-ws-child-const-ws-child-1073741824-src-platform-win32-ml-1303017763"></a>
### WS_CHILD

```ml
const WS_CHILD = 1073741824
```

Defines the ws child constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L26)

<a id="constant-constant-platform-win32-ws-clipchildren-const-ws-clipchildren-33554432-src-platform-win32-ml-79107721"></a>
### WS_CLIPCHILDREN

```ml
const WS_CLIPCHILDREN = 33554432
```

Defines the ws clipchildren constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L30)

<a id="constant-constant-platform-win32-ws-clipsiblings-const-ws-clipsiblings-67108864-src-platform-win32-ml-1668078724"></a>
### WS_CLIPSIBLINGS

```ml
const WS_CLIPSIBLINGS = 67108864
```

Defines the ws clipsiblings constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L32)

<a id="constant-constant-platform-win32-ws-ex-clientedge-const-ws-ex-clientedge-512-src-platform-win32-ml-893292206"></a>
### WS_EX_CLIENTEDGE

```ml
const WS_EX_CLIENTEDGE = 512
```

Defines the ws ex clientedge constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L42)

<a id="constant-constant-platform-win32-ws-hscroll-const-ws-hscroll-1048576-src-platform-win32-ml-714082681"></a>
### WS_HSCROLL

```ml
const WS_HSCROLL = 1048576
```

Defines the ws hscroll constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L40)

<a id="constant-constant-platform-win32-ws-overlappedwindow-const-ws-overlappedwindow-13565952-src-platform-win32-ml-501012702"></a>
### WS_OVERLAPPEDWINDOW

```ml
const WS_OVERLAPPEDWINDOW = 13565952
```

Defines the ws overlappedwindow constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L24)

<a id="constant-constant-platform-win32-ws-tabstop-const-ws-tabstop-65536-src-platform-win32-ml-1112264973"></a>
### WS_TABSTOP

```ml
const WS_TABSTOP = 65536
```

Defines the ws tabstop constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L36)

<a id="constant-constant-platform-win32-ws-visible-const-ws-visible-268435456-src-platform-win32-ml-100739413"></a>
### WS_VISIBLE

```ml
const WS_VISIBLE = 268435456
```

Defines the ws visible constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L28)

<a id="constant-constant-platform-win32-ws-vscroll-const-ws-vscroll-2097152-src-platform-win32-ml-1035087914"></a>
### WS_VSCROLL

```ml
const WS_VSCROLL = 2097152
```

Defines the ws vscroll constant used by the platform win32 module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/platform/win32.ml#L38)
