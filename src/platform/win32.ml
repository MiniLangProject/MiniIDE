// Copyright 2026 Nils Kopal
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

package platform.win32

// Win32/GDI bindings and tiny helpers used by MiniIDE.

import std.string as s

const WS_OVERLAPPEDWINDOW = 0x00CF0000
const WS_CHILD = 0x40000000
const WS_VISIBLE = 0x10000000
const WS_CLIPCHILDREN = 0x02000000
const WS_CLIPSIBLINGS = 0x04000000
const WS_BORDER = 0x00800000
const WS_TABSTOP = 0x00010000
const WS_VSCROLL = 0x00200000
const WS_HSCROLL = 0x00100000
const WS_EX_CLIENTEDGE = 0x00000200
const SW_SHOW = 5
const SW_HIDE = 0
const SW_MAXIMIZE = 3
const SW_MINIMIZE = 6
const SW_RESTORE = 9
const HWND_BOTTOM = 1
const SWP_NOSIZE = 0x0001
const SWP_NOMOVE = 0x0002
const SWP_NOACTIVATE = 0x0010
const PM_REMOVE = 1
const TRANSPARENT = 1
const PS_SOLID = 0
const FW_NORMAL = 400
const FW_BOLD = 700
const MB_YESNO = 0x00000004
const MB_ICONWARNING = 0x00000030
const MB_DEFBUTTON2 = 0x00000100
const IDYES = 6

const WM_QUIT = 0x0012
const WM_CLOSE = 0x0010
const WM_DESTROY = 0x0002
const WM_SETTEXT = 0x000C
const WM_GETTEXT = 0x000D
const WM_GETTEXTLENGTH = 0x000E
const WM_SETCURSOR = 0x0020
const WM_NCDESTROY = 0x0082
const WM_NCLBUTTONDOWN = 0x00A1
const WM_NCLBUTTONUP = 0x00A2
const WM_CONTEXTMENU = 0x007B
const WM_SYSCOMMAND = 0x0112
const WM_CHAR = 0x0102
const WM_KEYDOWN = 0x0100
const WM_LBUTTONDOWN = 0x0201
const WM_LBUTTONUP = 0x0202
const WM_LBUTTONDBLCLK = 0x0203
const WM_RBUTTONDOWN = 0x0204
const WM_RBUTTONUP = 0x0205
const WM_MBUTTONUP = 0x0208
const WM_MOUSEMOVE = 0x0200
const WM_MOUSEWHEEL = 0x020A
const WM_COMMAND = 0x0111
const WM_NOTIFY = 0x004E

const IDC_ARROW = 32512
const IDC_IBEAM = 32513
const IDC_HAND = 32649

const VK_BACK = 0x08
const VK_LBUTTON = 0x01
const VK_RBUTTON = 0x02
const VK_TAB = 0x09
const VK_RETURN = 0x0D
const VK_SHIFT = 0x10
const VK_CONTROL = 0x11
const VK_MENU = 0x12
const VK_ESCAPE = 0x1B
const VK_SPACE = 0x20
const VK_PRIOR = 0x21
const VK_NEXT = 0x22
const VK_END = 0x23
const VK_HOME = 0x24
const VK_LEFT = 0x25
const VK_UP = 0x26
const VK_RIGHT = 0x27
const VK_DOWN = 0x28
const VK_DELETE = 0x2E
const VK_A = 0x41
const VK_C = 0x43
const VK_E = 0x45
const VK_F = 0x46
const VK_G = 0x47
const VK_O = 0x4F
const VK_P = 0x50
const VK_S = 0x53
const VK_T = 0x54
const VK_V = 0x56
const VK_X = 0x58
const VK_Y = 0x59
const VK_Z = 0x5A
const VK_F1 = 0x70
const VK_F2 = 0x71
const VK_F3 = 0x72
const VK_F5 = 0x74
const VK_F6 = 0x75
const VK_F7 = 0x76
const VK_F12 = 0x7B

const ES_MULTILINE = 0x0004
const ES_RIGHT = 0x0002
const ES_AUTOVSCROLL = 0x0040
const ES_AUTOHSCROLL = 0x0080
const ES_NOHIDESEL = 0x0100
const ES_READONLY = 0x0800
const ES_WANTRETURN = 0x1000

const LBS_NOTIFY = 0x0001
const LBS_HASSTRINGS = 0x0040
const LBS_NOINTEGRALHEIGHT = 0x0100

const CBS_DROPDOWNLIST = 0x0003
const CBS_HASSTRINGS = 0x0200

const BS_PUSHBUTTON = 0x0000
const BS_LEFT = 0x0100
const BS_VCENTER = 0x0C00
const BS_MULTILINE = 0x2000
const SS_RIGHT = 0x00000002
const SS_ICON = 0x00000003
const SS_NOPREFIX = 0x00000080
const SS_NOTIFY = 0x00000100

const ICC_TREEVIEW_CLASSES = 0x00000002
const ICC_TAB_CLASSES = 0x00000008

const TVS_HASBUTTONS = 0x0001
const TVS_HASLINES = 0x0002
const TVS_LINESATROOT = 0x0004
const TVS_SHOWSELALWAYS = 0x0020
const TVS_FULLROWSELECT = 0x1000

const TV_FIRST = 0x1100
const TVM_INSERTITEMW = 0x1132
const TVM_DELETEITEM = 0x1101
const TVM_EXPAND = 0x1102
const TVM_SETIMAGELIST = 0x1109
const TVM_GETNEXTITEM = 0x110A
const TVM_SELECTITEM = 0x110B
const TVM_HITTEST = 0x1111
const TVM_SETBKCOLOR = 0x111D
const TVM_SETTEXTCOLOR = 0x111E
const TVM_SETLINECOLOR = 0x1128
const TVGN_CARET = 0x0009
const TVE_EXPAND = 0x0002
const TVSIL_NORMAL = 0
const TVI_ROOT = -65536
const TVI_LAST = -65534
const TVIF_TEXT = 0x0001
const TVIF_IMAGE = 0x0002
const TVIF_PARAM = 0x0004
const TVIF_SELECTEDIMAGE = 0x0020
const TVIF_CHILDREN = 0x0040

const TCS_FOCUSNEVER = 0x8000
const TCS_FIXEDWIDTH = 0x0400
const TCM_FIRST = 0x1300
const TCM_GETCURSEL = 0x130B
const TCM_SETCURSEL = 0x130C
const TCM_HITTEST = 0x130D
const TCM_DELETEALLITEMS = 0x1309
const TCM_SETITEMSIZE = 0x1329
const TCM_INSERTITEMW = 0x133E
const TCIF_TEXT = 0x0001
const TCIF_PARAM = 0x0008
const NM_DBLCLK = -3
const NM_RCLICK = -5
const TCN_SELCHANGE = -551

const WM_SETFONT = 0x0030
const WM_SETREDRAW = 0x000B
const STM_SETIMAGE = 0x0172
const IMAGE_ICON = 1
const EM_SETLIMITTEXT = 0x00C5
const EM_GETSEL = 0x00B0
const EM_SETSEL = 0x00B1
const EM_LINESCROLL = 0x00B6
const EM_SCROLLCARET = 0x00B7
const EM_GETMODIFY = 0x00B8
const EM_SETMODIFY = 0x00B9
const EM_GETLINECOUNT = 0x00BA
const EM_LINEINDEX = 0x00BB
const EM_LINELENGTH = 0x00C1
const EM_GETLINE = 0x00C4
const EM_LINEFROMCHAR = 0x00C9
const EM_GETFIRSTVISIBLELINE = 0x00CE
const EM_CHARFROMPOS = 0x00D7
const EM_GETTEXTEX = 0x045E
const EM_SETCHARFORMAT = 0x0444
const EM_SETBKGNDCOLOR = 0x0443
const EM_SETREADONLY = 0x00CF
const EM_GETSCROLLPOS = 0x04DD
const EM_SETSCROLLPOS = 0x04DE
const EM_REPLACESEL = 0x00C2
const WM_CUT = 0x0300
const WM_COPY = 0x0301
const WM_PASTE = 0x0302
const SCF_SELECTION = 0x0001
const SCF_ALL = 0x0004
const CFM_BOLD = 0x00000001
const CFM_ITALIC = 0x00000002
const CFM_UNDERLINE = 0x00000004
const CFM_COLOR = 0x40000000
const CFM_SIZE = 0x80000000
const CFE_BOLD = 0x00000001
const CFE_ITALIC = 0x00000002
const CFE_UNDERLINE = 0x00000004
const LB_ADDSTRING = 0x0180
const LB_RESETCONTENT = 0x0184
const LB_SETCURSEL = 0x0186
const LB_GETCURSEL = 0x0188
const LBN_SELCHANGE = 1
const LBN_DBLCLK = 2
const CB_GETCURSEL = 0x0147
const CB_ADDSTRING = 0x0143
const CB_SETCURSEL = 0x014E

const MF_STRING = 0x00000000
const MF_SEPARATOR = 0x00000800
const MF_POPUP = 0x00000010
const TPM_LEFTALIGN = 0x0000
const TPM_TOPALIGN = 0x0000
const TPM_RETURNCMD = 0x0100
const TPM_NONOTIFY = 0x0080

const ILC_MASK = 0x00000001
const ILC_COLOR32 = 0x00000020
const SHGFI_ICON = 0x00000100
const SHGFI_SMALLICON = 0x00000001
const SHGFI_USEFILEATTRIBUTES = 0x00000010
const FILE_ATTRIBUTE_READONLY = 0x00000001
const FILE_ATTRIBUTE_DIRECTORY = 0x00000010
const FILE_ATTRIBUTE_NORMAL = 0x00000080

const HTCAPTION = 2
const HTMINBUTTON = 8
const HTMAXBUTTON = 9
const HTCLOSE = 20

const SC_SIZE = 0xF000
const SC_MOVE = 0xF010
const SC_MINIMIZE = 0xF020
const SC_MAXIMIZE = 0xF030
const SC_CLOSE = 0xF060
const SC_RESTORE = 0xF120

// Bind the native CreateWindowExW API used by MiniIDE.
extern function CreateWindowExW(exStyle as u32, className as wstr, windowName as wstr, style as u32, x as int, y as int, width as int, height as int, parent as ptr, menu as ptr, instance as ptr, param as ptr) from "user32.dll" symbol "CreateWindowExW" returns ptr
// Bind the native CreateWindowExW API used by MiniIDE.
extern function CreateWindowExWId(exStyle as u32, className as wstr, windowName as wstr, style as u32, x as int, y as int, width as int, height as int, parent as ptr, menuId as int, instance as ptr, param as ptr) from "user32.dll" symbol "CreateWindowExW" returns ptr
// Bind the native AdjustWindowRect API used by MiniIDE.
extern function AdjustWindowRect(rect as bytes, style as u32, hasMenu as bool) from "user32.dll" symbol "AdjustWindowRect" returns bool
// Bind the native ShowWindow API used by MiniIDE.
extern function ShowWindow(hwnd as ptr, cmdShow as int) from "user32.dll" symbol "ShowWindow" returns bool
// Bind the native UpdateWindow API used by MiniIDE.
extern function UpdateWindow(hwnd as ptr) from "user32.dll" symbol "UpdateWindow" returns bool
// Bind the native DestroyWindow API used by MiniIDE.
extern function DestroyWindow(hwnd as ptr) from "user32.dll" symbol "DestroyWindow" returns bool
// Bind the native GetDC API used by MiniIDE.
extern function GetDC(hwnd as ptr) from "user32.dll" symbol "GetDC" returns ptr
// Bind the native ReleaseDC API used by MiniIDE.
extern function ReleaseDC(hwnd as ptr, hdc as ptr) from "user32.dll" symbol "ReleaseDC" returns int
// Bind the native GetClientRect API used by MiniIDE.
extern function GetClientRect(hwnd as ptr, rect as bytes) from "user32.dll" symbol "GetClientRect" returns bool
// Bind the native PeekMessageW API used by MiniIDE.
extern function PeekMessageW(msg as bytes, hwnd as ptr, minMsg as u32, maxMsg as u32, removeMsg as u32) from "user32.dll" symbol "PeekMessageW" returns bool
// Bind the native TranslateMessage API used by MiniIDE.
extern function TranslateMessage(msg as bytes) from "user32.dll" symbol "TranslateMessage" returns bool
// Bind the native DispatchMessageW API used by MiniIDE.
extern function DispatchMessageW(msg as bytes) from "user32.dll" symbol "DispatchMessageW" returns ptr
// Bind the native GetAsyncKeyState API used by MiniIDE.
extern function GetAsyncKeyState(vkey as int) from "user32.dll" symbol "GetAsyncKeyState" returns int
// Bind the native SetWindowTextW API used by MiniIDE.
extern function SetWindowTextW(hwnd as ptr, text as wstr) from "user32.dll" symbol "SetWindowTextW" returns bool
// Bind the native GetWindowTextLengthW API used by MiniIDE.
extern function GetWindowTextLengthW(hwnd as ptr) from "user32.dll" symbol "GetWindowTextLengthW" returns int
// Bind the native GetWindowTextW API used by MiniIDE.
extern function GetWindowTextW(hwnd as ptr, buffer as buffer, maxCount as int) from "user32.dll" symbol "GetWindowTextW" returns int
// Bind the native GetCursorPos API used by MiniIDE.
extern function GetCursorPos(point as bytes) from "user32.dll" symbol "GetCursorPos" returns bool
// Bind the native LoadCursorW API used by MiniIDE.
extern function LoadCursorWId(instance as ptr, cursorId as int) from "user32.dll" symbol "LoadCursorW" returns ptr
// Bind the native SetCursor API used by MiniIDE.
extern function SetCursor(cursor as ptr) from "user32.dll" symbol "SetCursor" returns ptr
// Bind the native GetForegroundWindow API used by MiniIDE.
extern function GetForegroundWindow() from "user32.dll" symbol "GetForegroundWindow" returns ptr
// Bind the native SetForegroundWindow API used by MiniIDE.
extern function SetForegroundWindow(hwnd as ptr) from "user32.dll" symbol "SetForegroundWindow" returns bool
// Bind the native IsChild API used by MiniIDE.
extern function IsChild(parent as ptr, child as ptr) from "user32.dll" symbol "IsChild" returns bool
// Bind the native ScreenToClient API used by MiniIDE.
extern function ScreenToClient(hwnd as ptr, point as bytes) from "user32.dll" symbol "ScreenToClient" returns bool
// Bind the native ClientToScreen API used by MiniIDE.
extern function ClientToScreen(hwnd as ptr, point as bytes) from "user32.dll" symbol "ClientToScreen" returns bool
// Bind the native SetFocus API used by MiniIDE.
extern function SetFocus(hwnd as ptr) from "user32.dll" symbol "SetFocus" returns ptr
// Bind the native IsWindow API used by MiniIDE.
extern function IsWindow(hwnd as ptr) from "user32.dll" symbol "IsWindow" returns bool
// Bind the native IsZoomed API used by MiniIDE.
extern function IsZoomed(hwnd as ptr) from "user32.dll" symbol "IsZoomed" returns bool
// Bind the native MoveWindow API used by MiniIDE.
extern function MoveWindow(hwnd as ptr, x as int, y as int, width as int, height as int, repaint as bool) from "user32.dll" symbol "MoveWindow" returns bool
// Bind the native BringWindowToTop API used by MiniIDE.
extern function BringWindowToTop(hwnd as ptr) from "user32.dll" symbol "BringWindowToTop" returns bool
// Bind the native SetWindowPos API used by MiniIDE.
extern function SetWindowPos(hwnd as ptr, insertAfter as int, x as int, y as int, width as int, height as int, flags as u32) from "user32.dll" symbol "SetWindowPos" returns bool
// Bind the native SendMessageW API used by MiniIDE.
extern function SendMessageW(hwnd as ptr, msg as u32, wParam as int, lParam as int) from "user32.dll" symbol "SendMessageW" returns int
// Bind the native SendMessageW API used by MiniIDE.
extern function SendMessageWStr(hwnd as ptr, msg as u32, wParam as int, lParam as wstr) from "user32.dll" symbol "SendMessageW" returns int
// Bind the native SendMessageW API used by MiniIDE.
extern function SendMessageWPtr(hwnd as ptr, msg as u32, wParam as int, lParam as ptr) from "user32.dll" symbol "SendMessageW" returns int
// Bind the native SendMessageW API used by MiniIDE.
extern function SendMessageWBytes(hwnd as ptr, msg as u32, wParam as int, lParam as bytes) from "user32.dll" symbol "SendMessageW" returns int
// Bind the native SendMessageW API used by MiniIDE.
extern function SendMessageW2Bytes(hwnd as ptr, msg as u32, wParam as bytes, lParam as bytes) from "user32.dll" symbol "SendMessageW" returns int
// Bind the native InvalidateRect API used by MiniIDE.
extern function InvalidateRect(hwnd as ptr, rect as ptr, erase as bool) from "user32.dll" symbol "InvalidateRect" returns bool
// Bind the native LoadLibraryW API used by MiniIDE.
extern function LoadLibraryW(path as wstr) from "kernel32.dll" symbol "LoadLibraryW" returns ptr
// Bind the native GlobalAlloc API used by MiniIDE.
extern function GlobalAlloc(flags as u32, size as u32) from "kernel32.dll" symbol "GlobalAlloc" returns ptr
// Bind the native GlobalFree API used by MiniIDE.
extern function GlobalFree(mem as ptr) from "kernel32.dll" symbol "GlobalFree" returns ptr
// Bind the native MultiByteToWideChar API used by MiniIDE.
extern function MultiByteToWideCharPtr(codePage as u32, flags as u32, src as bytes, srcLen as int, dst as ptr, dstChars as int) from "kernel32.dll" symbol "MultiByteToWideChar" returns int
// Bind the native MultiByteToWideChar API used by MiniIDE.
extern function MultiByteToWideCharLen(codePage as u32, flags as u32, src as bytes, srcLen as int, dst as ptr, dstChars as int) from "kernel32.dll" symbol "MultiByteToWideChar" returns int
// Bind the native RtlMoveMemory API used by MiniIDE.
extern function RtlMoveMemoryFromPtr(dst as bytes, src as ptr, len as u32) from "kernel32.dll" symbol "RtlMoveMemory" returns void
// Bind the native InitCommonControlsEx API used by MiniIDE.
extern function InitCommonControlsEx(data as bytes) from "comctl32.dll" symbol "InitCommonControlsEx" returns bool
// Bind the native GetTickCount API used by MiniIDE.
extern function GetTickCount() from "kernel32.dll" symbol "GetTickCount" returns u32
// Bind the native CreateMenu API used by MiniIDE.
extern function CreateMenu() from "user32.dll" symbol "CreateMenu" returns ptr
// Bind the native CreatePopupMenu API used by MiniIDE.
extern function CreatePopupMenu() from "user32.dll" symbol "CreatePopupMenu" returns ptr
// Bind the native DestroyMenu API used by MiniIDE.
extern function DestroyMenu(menu as ptr) from "user32.dll" symbol "DestroyMenu" returns bool
// Bind the native AppendMenuW API used by MiniIDE.
extern function AppendMenuWId(menu as ptr, flags as u32, id as int, text as wstr) from "user32.dll" symbol "AppendMenuW" returns bool
// Bind the native AppendMenuW API used by MiniIDE.
extern function AppendMenuWPopup(menu as ptr, flags as u32, popup as ptr, text as wstr) from "user32.dll" symbol "AppendMenuW" returns bool
// Bind the native SetMenu API used by MiniIDE.
extern function SetMenu(hwnd as ptr, menu as ptr) from "user32.dll" symbol "SetMenu" returns bool
// Bind the native DrawMenuBar API used by MiniIDE.
extern function DrawMenuBar(hwnd as ptr) from "user32.dll" symbol "DrawMenuBar" returns bool
// Bind the native MessageBoxW API used by MiniIDE.
extern function MessageBoxW(hwnd as ptr, text as wstr, caption as wstr, flags as u32) from "user32.dll" symbol "MessageBoxW" returns int
// Bind the native TrackPopupMenu API used by MiniIDE.
extern function TrackPopupMenu(menu as ptr, flags as u32, x as int, y as int, reserved as int, hwnd as ptr, rect as ptr) from "user32.dll" symbol "TrackPopupMenu" returns int
// Bind the native GetOpenFileNameW API used by MiniIDE.
extern function GetOpenFileNameW(ofn as bytes) from "comdlg32.dll" symbol "GetOpenFileNameW" returns bool
// Bind the native CreateDirectoryW API used by MiniIDE.
extern function CreateDirectoryW(path as wstr, securityAttributes as ptr) from "kernel32.dll" symbol "CreateDirectoryW" returns bool
// Bind the native RemoveDirectoryW API used by MiniIDE.
extern function RemoveDirectoryW(path as wstr) from "kernel32.dll" symbol "RemoveDirectoryW" returns bool
// Bind the native ImageList_Create API used by MiniIDE.
extern function ImageList_Create(cx as int, cy as int, flags as u32, initial as int, grow as int) from "comctl32.dll" symbol "ImageList_Create" returns ptr
// Bind the native ImageList_AddIcon API used by MiniIDE.
extern function ImageList_AddIcon(imageList as ptr, icon as ptr) from "comctl32.dll" symbol "ImageList_AddIcon" returns int
// Bind the native SHGetFileInfoW API used by MiniIDE.
extern function SHGetFileInfoW(path as wstr, fileAttributes as u32, fileInfo as bytes, fileInfoSize as u32, flags as u32) from "shell32.dll" symbol "SHGetFileInfoW" returns ptr
// Bind the native DestroyIcon API used by MiniIDE.
extern function DestroyIcon(icon as ptr) from "user32.dll" symbol "DestroyIcon" returns bool
// Bind the native SetWindowTheme API used by MiniIDE.
extern function SetWindowTheme(hwnd as ptr, subAppName as wstr, subIdList as wstr) from "uxtheme.dll" symbol "SetWindowTheme" returns int
// Bind the native DwmSetWindowAttribute API used by MiniIDE.
extern function DwmSetWindowAttribute(hwnd as ptr, attribute as u32, value as bytes, size as u32) from "dwmapi.dll" symbol "DwmSetWindowAttribute" returns int

// Bind the native CreateSolidBrush API used by MiniIDE.
extern function CreateSolidBrush(color as u32) from "gdi32.dll" symbol "CreateSolidBrush" returns ptr
// Bind the native DeleteObject API used by MiniIDE.
extern function DeleteObject(obj as ptr) from "gdi32.dll" symbol "DeleteObject" returns bool
// Bind the native FillRect API used by MiniIDE.
extern function FillRect(hdc as ptr, rect as bytes, brush as ptr) from "user32.dll" symbol "FillRect" returns int
// Bind the native SetTextColor API used by MiniIDE.
extern function SetTextColor(hdc as ptr, color as u32) from "gdi32.dll" symbol "SetTextColor" returns u32
// Bind the native SetBkMode API used by MiniIDE.
extern function SetBkMode(hdc as ptr, mode as int) from "gdi32.dll" symbol "SetBkMode" returns int
// Bind the native TextOutW API used by MiniIDE.
extern function TextOutW(hdc as ptr, x as int, y as int, text as wstr, count as int) from "gdi32.dll" symbol "TextOutW" returns bool
// Bind the native CreatePen API used by MiniIDE.
extern function CreatePen(style as int, width as int, color as u32) from "gdi32.dll" symbol "CreatePen" returns ptr
// Bind the native MoveToEx API used by MiniIDE.
extern function MoveToEx(hdc as ptr, x as int, y as int, point as ptr) from "gdi32.dll" symbol "MoveToEx" returns bool
// Bind the native LineTo API used by MiniIDE.
extern function LineTo(hdc as ptr, x as int, y as int) from "gdi32.dll" symbol "LineTo" returns bool
// Bind the native SelectObject API used by MiniIDE.
extern function SelectObject(hdc as ptr, obj as ptr) from "gdi32.dll" symbol "SelectObject" returns ptr
// Bind the native CreateFontW API used by MiniIDE.
extern function CreateFontW(height as int, width as int, escapement as int, orientation as int, weight as int, italic as u32, underline as u32, strikeout as u32, charset as u32, outPrecision as u32, clipPrecision as u32, quality as u32, pitchAndFamily as u32, face as wstr) from "gdi32.dll" symbol "CreateFontW" returns ptr

// Bind the native Sleep API used by MiniIDE.
extern function Sleep(ms as int) from "kernel32.dll" symbol "Sleep" returns void

// Pack red, green, and blue components into a Win32 COLORREF value.
function rgb(r, g, b)
  return (r & 255) | ((g & 255) << 8) | ((b & 255) << 16)
end function

// Write an unsigned 32-bit value into a byte buffer at an offset.
function _write_u32(buf, off, value)
  v = value & 0xFFFFFFFF
  buf[off] = v & 255
  buf[off + 1] = (v >> 8) & 255
  buf[off + 2] = (v >> 16) & 255
  buf[off + 3] = (v >> 24) & 255
end function

// Write a pointer-sized value into a byte buffer at an offset.
function _write_ptr(buf, off, value)
  low = value & 0xFFFFFFFF
  high = 0
  if value < 0 then
    high = 0xFFFFFFFF
  else
    high = (value >> 32) & 0xFFFFFFFF
  end if
  _write_u32(buf, off, low)
  _write_u32(buf, off + 4, high)
end function

// Read an unsigned 32-bit value from a byte buffer at an offset.
function _read_u32(buf, off)
  return buf[off] | (buf[off + 1] << 8) | (buf[off + 2] << 16) | (buf[off + 3] << 24)
end function

// Read a signed 32-bit value from a byte buffer at an offset.
function _read_s32(buf, off)
  v = _read_u32(buf, off)
  if v >= 2147483648 then
    return v - 4294967296
  end if
  return v
end function

// Read a pointer-sized value from a byte buffer at an offset.
function _read_ptr(buf, off)
  low = _read_u32(buf, off)
  high = _read_u32(buf, off + 4)
  return low + high * 4294967296
end function

// Build a Win32 RECT byte buffer from position and size values.
function rect_bytes(x, y, w, h)
  r = bytes(16, 0)
  _write_u32(r, 0, x)
  _write_u32(r, 4, y)
  _write_u32(r, 8, x + w)
  _write_u32(r, 12, y + h)
  return r
end function

// Read the x coordinate from a Win32 POINT byte buffer.
function point_x(point)
  return _read_s32(point, 0)
end function

// Read the y coordinate from a Win32 POINT byte buffer.
function point_y(point)
  return _read_s32(point, 4)
end function

// Return the client width and height for a window.
function client_size(hwnd)
  r = bytes(16, 0)
  ok = GetClientRect(hwnd, r)
  if ok == false then return [960, 640] end if
  return [_read_s32(r, 8) - _read_s32(r, 0), _read_s32(r, 12) - _read_s32(r, 4)]
end function

// Return the current mouse position in client coordinates.
function mouse_client(hwnd)
  p = bytes(8, 0)
  ok = GetCursorPos(p)
  if ok == false then return [-1, -1] end if
  ScreenToClient(hwnd, p)
  return [point_x(p), point_y(p)]
end function

// Set system cursor.
function set_system_cursor(cursor_id)
  cursor = LoadCursorWId(void, cursor_id)
  if cursor is void then return end if
  SetCursor(cursor)
end function

// Set cursor arrow.
function set_cursor_arrow()
  set_system_cursor(IDC_ARROW)
end function

// Set cursor ibeam.
function set_cursor_ibeam()
  set_system_cursor(IDC_IBEAM)
end function

// Set cursor hand.
function set_cursor_hand()
  set_system_cursor(IDC_HAND)
end function

// Convert a client coordinate to a screen coordinate.
function client_to_screen_point(hwnd, x, y)
  p = bytes(8, 0)
  _write_u32(p, 0, x)
  _write_u32(p, 4, y)
  ClientToScreen(hwnd, p)
  return [point_x(p), point_y(p)]
end function

// Show a popup menu at a client-coordinate position.
function track_popup(hwnd, menu, x, y)
  p = client_to_screen_point(hwnd, x, y)
  SetForegroundWindow(hwnd)
  return TrackPopupMenu(menu, TPM_LEFTALIGN | TPM_TOPALIGN | TPM_RETURNCMD | TPM_NONOTIFY, p[0], p[1], 0, hwnd, void)
end function

// Set window dark mode.
function set_window_dark_mode(hwnd, enabled)
  if hwnd is void then return end if
  data = bytes(4, 0)
  value = 0
  if enabled then value = 1 end if
  _write_u32(data, 0, value)
  DwmSetWindowAttribute(hwnd, 20, data, 4)
  DwmSetWindowAttribute(hwnd, 19, data, 4)
end function

// Set control dark theme.
function set_control_dark_theme(hwnd, enabled)
  if hwnd is void then return end if
  if enabled then
    SetWindowTheme(hwnd, "DarkMode_Explorer", "")
  else
    SetWindowTheme(hwnd, "Explorer", "")
  end if
end function

// Destroy menu.
function destroy_menu(menu)
  if menu is void then return end if
  DestroyMenu(menu)
end function

// Create directory.
function create_directory(path)
  if typeof(path) != "string" or path == "" then return false end if
  return CreateDirectoryW(path, void)
end function

// Remove directory.
function remove_directory(path)
  if typeof(path) != "string" or path == "" then return false end if
  return RemoveDirectoryW(path)
end function

// Return the shell small icon.
function _shell_small_icon(path, attrs)
  if typeof(path) != "string" or path == "" then path = "file" end if
  info = bytes(720, 0)
  rc = SHGetFileInfoW(path, attrs, info, len(info), SHGFI_ICON | SHGFI_SMALLICON | SHGFI_USEFILEATTRIBUTES)
  if rc == 0 then return void end if
  icon = _read_ptr(info, 0)
  if icon == 0 then return void end if
  return icon
end function

// Return the image list add shell icon.
function _image_list_add_shell_icon(image_list, path, attrs)
  if image_list is void then return -1 end if
  icon = _shell_small_icon(path, attrs)
  if icon is void then return -1 end if
  idx = ImageList_AddIcon(image_list, icon)
  DestroyIcon(icon)
  return idx
end function

// Create tree image list.
function create_tree_image_list()
  image_list = ImageList_Create(16, 16, ILC_COLOR32 | ILC_MASK, 4, 4)
  if image_list is void then return image_list end if
  _image_list_add_shell_icon(image_list, "folder", FILE_ATTRIBUTE_DIRECTORY)
  _image_list_add_shell_icon(image_list, "file.ml", FILE_ATTRIBUTE_NORMAL)
  _image_list_add_shell_icon(image_list, "project.mlproj", FILE_ATTRIBUTE_NORMAL)
  _image_list_add_shell_icon(image_list, "program.exe", FILE_ATTRIBUTE_NORMAL)
  return image_list
end function

// Send the set image list operation to a tree-view control.
function tree_set_image_list(hwnd, image_list)
  if hwnd is void or image_list is void then return end if
  SendMessageWPtr(hwnd, TVM_SETIMAGELIST, TVSIL_NORMAL, image_list)
end function

// Return the icon glyph used for a toolbar command.
function toolbar_icon(kind)
  if kind == "folder" then return _shell_small_icon("folder", FILE_ATTRIBUTE_DIRECTORY) end if
  if kind == "exe" then return _shell_small_icon("program.exe", FILE_ATTRIBUTE_NORMAL) end if
  if kind == "project" then return _shell_small_icon("project.mlproj", FILE_ATTRIBUTE_NORMAL) end if
  if kind == "readonly" then return _shell_small_icon("readonly.txt", FILE_ATTRIBUTE_NORMAL | FILE_ATTRIBUTE_READONLY) end if
  return _shell_small_icon("file.txt", FILE_ATTRIBUTE_NORMAL)
end function

// Create icon static.
function create_icon_static(parent, icon)
  hwnd = create_child(parent, "STATIC", "", 0, SS_ICON, 0, 0, 22, 22)
  if hwnd is void then return hwnd end if
  if not(icon is void) then SendMessageWPtr(hwnd, STM_SETIMAGE, IMAGE_ICON, icon) end if
  return hwnd
end function

// Fill rect.
function fill_rect(hdc, x, y, w, h, color)
  if w <= 0 or h <= 0 then return end if
  br = CreateSolidBrush(color)
  if br is void then return end if
  r = rect_bytes(x, y, w, h)
  FillRect(hdc, r, br)
  DeleteObject(br)
end function

// Draw text.
function draw_text(hdc, x, y, text, color)
  if typeof(text) != "string" then return end if
  SetBkMode(hdc, TRANSPARENT)
  SetTextColor(hdc, color)
  TextOutW(hdc, x, y, text, len(text))
end function

// Draw line.
function draw_line(hdc, x1, y1, x2, y2, color)
  pen = CreatePen(PS_SOLID, 1, color)
  if pen is void then return end if
  old = SelectObject(hdc, pen)
  MoveToEx(hdc, x1, y1, void)
  LineTo(hdc, x2, y2)
  if not(old is void) then SelectObject(hdc, old) end if
  DeleteObject(pen)
end function

// Create a Win32 font handle for a face, size, and weight.
function make_font(height, face, bold)
  weight = FW_NORMAL
  if bold then weight = FW_BOLD end if
  return CreateFontW(height, 0, 0, 0, weight, 0, 0, 0, 0, 0, 0, 0, 0, face)
end function

// Initialize common control classes used by MiniIDE.
function init_common_controls()
  LoadLibraryW("Comctl32.dll")
  data = bytes(8, 0)
  _write_u32(data, 0, 8)
  _write_u32(data, 4, ICC_TREEVIEW_CLASSES | ICC_TAB_CLASSES)
  InitCommonControlsEx(data)
end function

// Return the wide alloc.
function _wide_alloc(text)
  if typeof(text) != "string" then text = "" end if
  raw = bytes(text)
  raw_len = len(raw)
  chars = 0
  if raw_len > 0 then
    chars = MultiByteToWideCharLen(65001, 0, raw, raw_len, void, 0)
  end if
  if chars < 0 then chars = 0 end if
  mem = GlobalAlloc(0x40, (chars + 1) * 2)
  if mem is void then return mem end if
  if chars > 0 then
    MultiByteToWideCharPtr(65001, 0, raw, raw_len, mem, chars)
  end if
  return mem
end function

// Return the wide free.
function _wide_free(mem)
  if mem is void then return end if
  GlobalFree(mem)
end function

// Return true when a virtual key is currently down.
function key_down(vk)
  return (GetAsyncKeyState(vk) & 32768) != 0
end function

// Return true when a message represents a key press event.
function key_pressed_event(vk)
  return (GetAsyncKeyState(vk) & 1) != 0
end function

// Return true when foreground.
function is_foreground(hwnd)
  if hwnd is void then return false end if
  fg = GetForegroundWindow()
  if fg == hwnd then return true end if
  return IsChild(hwnd, fg)
end function

// Extract message from a Win32 message.
function msg_message(msg)
  return _read_u32(msg, 8)
end function

// Extract window handle from a Win32 message.
function msg_hwnd(msg)
  return _read_ptr(msg, 0)
end function

// Extract wParam unsigned 32-bit value from a Win32 message.
function msg_wparam_u32(msg)
  return _read_u32(msg, 16)
end function

// Extract lParam pointer from a Win32 message.
function msg_lparam_ptr(msg)
  return _read_ptr(msg, 24)
end function

// Return the signed16.
function _signed16(value)
  v = value & 0xFFFF
  if v >= 32768 then return v - 65536 end if
  return v
end function

// Extract lParam x from a Win32 message.
function msg_lparam_x(msg)
  return _signed16(_read_u32(msg, 24))
end function

// Extract lParam y from a Win32 message.
function msg_lparam_y(msg)
  return _signed16(_read_u32(msg, 24) >> 16)
end function

// Extract command identifier from a Win32 message.
function msg_command_id(msg)
  return msg_wparam_u32(msg) & 0xFFFF
end function

// Extract command notify from a Win32 message.
function msg_command_notify(msg)
  return (msg_wparam_u32(msg) >> 16) & 0xFFFF
end function

// Extract identifier from a notification message.
function notify_id(msg)
  return notify_id_from_ptr(msg_lparam_ptr(msg))
end function

// Extract code from a notification message.
function notify_code(msg)
  return notify_code_from_ptr(msg_lparam_ptr(msg))
end function

// Extract identifier from pointer from a notification message.
function notify_id_from_ptr(ptr)
  data = bytes(24, 0)
  if ptr == 0 then return 0 end if
  RtlMoveMemoryFromPtr(data, ptr, 24)
  return _read_ptr(data, 8)
end function

// Extract code from pointer from a notification message.
function notify_code_from_ptr(ptr)
  data = bytes(24, 0)
  if ptr == 0 then return 0 end if
  RtlMoveMemoryFromPtr(data, ptr, 24)
  return _read_s32(data, 16)
end function

// Extract mouse x from a Win32 message.
function msg_mouse_x(msg)
  v = _read_u32(msg, 24) & 0xFFFF
  if v >= 32768 then v = v - 65536 end if
  return v
end function

// Extract mouse y from a Win32 message.
function msg_mouse_y(msg)
  v = (_read_u32(msg, 24) >> 16) & 0xFFFF
  if v >= 32768 then v = v - 65536 end if
  return v
end function

// Return the char from code.
function char_from_code(code)
  if typeof(code) != "int" then return "" end if
  if code <= 0 then return "" end if
  b = bytes(4, 0)
  b[0] = code & 255
  b[1] = (code >> 8) & 255
  b[2] = 0
  b[3] = 0
  s = decode16Z(b)
  if typeof(s) != "string" then return "" end if
  return s
end function

// Create main window.
function create_main_window(title, width, height)
  style = WS_OVERLAPPEDWINDOW | WS_VISIBLE | WS_CLIPCHILDREN
  rect = rect_bytes(0, 0, width, height)
  AdjustWindowRect(rect, style, false)
  win_w = _read_s32(rect, 8) - _read_s32(rect, 0)
  win_h = _read_s32(rect, 12) - _read_s32(rect, 4)
  hwnd = CreateWindowExW(0, "#32770", title, style, 80, 80, win_w, win_h, void, void, void, void)
  if hwnd is void then return hwnd end if
  ShowWindow(hwnd, SW_SHOW)
  UpdateWindow(hwnd)
  SetFocus(hwnd)
  return hwnd
end function

// Set menu bar.
function set_menu_bar(hwnd, menu)
  if hwnd is void then return end if
  SetMenu(hwnd, menu)
  DrawMenuBar(hwnd)
end function

// Create child.
function create_child(parent, class_name, title, ex_style, style, x, y, w, h)
  return CreateWindowExW(ex_style, class_name, title, style | WS_CHILD | WS_VISIBLE | WS_CLIPSIBLINGS, x, y, w, h, parent, void, void, void)
end function

// Create child identifier.
function create_child_id(parent, class_name, title, ex_style, style, x, y, w, h, control_id)
  return CreateWindowExWId(ex_style, class_name, title, style | WS_CHILD | WS_VISIBLE | WS_CLIPSIBLINGS, x, y, w, h, parent, control_id, void, void)
end function

// Create tree.
function create_tree(parent, control_id)
  style = WS_TABSTOP | WS_VSCROLL | TVS_HASBUTTONS | TVS_HASLINES | TVS_LINESATROOT | TVS_SHOWSELALWAYS | TVS_FULLROWSELECT
  return create_child_id(parent, "SysTreeView32", "", 0, style, 0, 0, 100, 100, control_id)
end function

// Create tab.
function create_tab(parent, control_id)
  style = WS_TABSTOP | TCS_FOCUSNEVER
  return create_child_id(parent, "SysTabControl32", "", 0, style, 0, 0, 100, 30, control_id)
end function

// Set control font.
function set_control_font(hwnd, font)
  if hwnd is void or font is void then return end if
  SendMessageWPtr(hwnd, WM_SETFONT, font, 1)
end function

// Set window text.
function set_window_text(hwnd, text)
  if hwnd is void then return false end if
  if typeof(text) != "string" then text = "" end if
  mem = _wide_alloc(text)
  if mem is void then return false end if
  rc = SendMessageWPtr(hwnd, WM_SETTEXT, 0, mem)
  _wide_free(mem)
  return rc != 0
end function

// Move a child control to the bottom of the z-order.
function send_to_bottom(hwnd)
  if hwnd is void then return end if
  SetWindowPos(hwnd, HWND_BOTTOM, 0, 0, 0, 0, SWP_NOMOVE | SWP_NOSIZE | SWP_NOACTIVATE)
end function

// Return window text.
function get_window_text(hwnd)
  if hwnd is void then return "" end if
  n = SendMessageW(hwnd, WM_GETTEXTLENGTH, 0, 0)
  if typeof(n) != "int" or n <= 0 then return "" end if
  buf = bytes((n + 2) * 2, 0)
  gt = bytes(32, 0)
  _write_u32(gt, 0, (n + 2) * 2)
  _write_u32(gt, 4, 1)
  _write_u32(gt, 8, 1200)
  copied = SendMessageW2Bytes(hwnd, EM_GETTEXTEX, gt, buf)
  if copied <= 0 then
    SendMessageWBytes(hwnd, WM_GETTEXT, n + 1, buf)
  end if
  text = decode16Z(buf)
  if typeof(text) != "string" then return "" end if
  return text
end function

// Return plain window text.
function get_plain_window_text(hwnd)
  if hwnd is void then return "" end if
  n = GetWindowTextLengthW(hwnd)
  if typeof(n) != "int" or n <= 0 then return "" end if
  buf = bytes((n + 2) * 2, 0)
  copied = GetWindowTextW(hwnd, buf, n + 1)
  if typeof(copied) != "int" or copied <= 0 then return "" end if
  text = decode16Z(buf)
  if typeof(text) != "string" then return "" end if
  return text
end function

// Return control text.
function get_control_text(hwnd)
  if hwnd is void then return "" end if
  n = SendMessageW(hwnd, WM_GETTEXTLENGTH, 0, 0)
  if typeof(n) != "int" or n <= 0 then return "" end if
  buf = bytes((n + 2) * 2, 0)
  SendMessageWBytes(hwnd, WM_GETTEXT, n + 1, buf)
  text = decode16Z(buf)
  if typeof(text) != "string" then return "" end if
  return text
end function

// Send the reset operation to a list box.
function listbox_reset(hwnd)
  if hwnd is void then return end if
  SendMessageW(hwnd, LB_RESETCONTENT, 0, 0)
end function

// Send the add operation to a list box.
function listbox_add(hwnd, text)
  if hwnd is void then return -1 end if
  if typeof(text) != "string" then text = "" end if
  return SendMessageWStr(hwnd, LB_ADDSTRING, 0, text)
end function

// Return selection from a list box.
function listbox_getsel(hwnd)
  if hwnd is void then return -1 end if
  return SendMessageW(hwnd, LB_GETCURSEL, 0, 0)
end function

// Send the selection operation to a list box.
function listbox_setsel(hwnd, idx)
  if hwnd is void then return end if
  SendMessageW(hwnd, LB_SETCURSEL, idx, 0)
end function

// Send the add operation to a combo box.
function combo_add(hwnd, text)
  if hwnd is void then return -1 end if
  if typeof(text) != "string" then text = "" end if
  return SendMessageWStr(hwnd, CB_ADDSTRING, 0, text)
end function

// Return selection from a combo box.
function combo_getsel(hwnd)
  if hwnd is void then return -1 end if
  return SendMessageW(hwnd, CB_GETCURSEL, 0, 0)
end function

// Send the selection operation to a combo box.
function combo_setsel(hwnd, idx)
  if hwnd is void then return end if
  SendMessageW(hwnd, CB_SETCURSEL, idx, 0)
end function

// Send the clear operation to a tree-view control.
function tree_clear(hwnd)
  if hwnd is void then return end if
  SendMessageW(hwnd, TVM_DELETEITEM, 0, TVI_ROOT)
end function

// Send the insert operation to a tree-view control.
function tree_insert(hwnd, parent, text, param, has_children, image)
  if hwnd is void then return 0 end if
  text_ptr = _wide_alloc(text)
  if text_ptr is void then return 0 end if
  item = bytes(88, 0)
  _write_ptr(item, 0, parent)
  _write_ptr(item, 8, TVI_LAST)
  mask = TVIF_TEXT | TVIF_PARAM | TVIF_CHILDREN
  if image >= 0 then mask = mask | TVIF_IMAGE | TVIF_SELECTEDIMAGE end if
  _write_u32(item, 16, mask)
  _write_ptr(item, 40, text_ptr)
  _write_u32(item, 48, len(text))
  if image >= 0 then
    _write_u32(item, 52, image)
    _write_u32(item, 56, image)
  end if
  child_flag = 0
  if has_children then child_flag = 1 end if
  _write_u32(item, 60, child_flag)
  _write_ptr(item, 64, param)
  handle = SendMessageWBytes(hwnd, TVM_INSERTITEMW, 0, item)
  _wide_free(text_ptr)
  return handle
end function

// Send the expand operation to a tree-view control.
function tree_expand(hwnd, item)
  if hwnd is void then return end if
  SendMessageW(hwnd, TVM_EXPAND, TVE_EXPAND, item)
end function

// Return selection from a tree-view control.
function tree_get_selection(hwnd)
  if hwnd is void then return 0 end if
  return SendMessageW(hwnd, TVM_GETNEXTITEM, TVGN_CARET, 0)
end function

// Send the select operation to a tree-view control.
function tree_select(hwnd, item)
  if hwnd is void or item == 0 then return end if
  SendMessageW(hwnd, TVM_SELECTITEM, TVGN_CARET, item)
end function

// Send the set colors operation to a tree-view control.
function tree_set_colors(hwnd, bg, text, line)
  if hwnd is void then return end if
  SendMessageW(hwnd, TVM_SETBKCOLOR, 0, bg)
  SendMessageW(hwnd, TVM_SETTEXTCOLOR, 0, text)
  SendMessageW(hwnd, TVM_SETLINECOLOR, 0, line)
  InvalidateRect(hwnd, void, true)
end function

// Send the hit test operation to a tree-view control.
function tree_hit_test(hwnd, x, y)
  if hwnd is void then return 0 end if
  info = bytes(32, 0)
  _write_u32(info, 0, x)
  _write_u32(info, 4, y)
  item = SendMessageWBytes(hwnd, TVM_HITTEST, 0, info)
  if item != 0 then return item end if
  return _read_ptr(info, 16)
end function

// Send the clear operation to a tab control.
function tab_clear(hwnd)
  if hwnd is void then return end if
  SendMessageW(hwnd, TCM_DELETEALLITEMS, 0, 0)
end function

// Send the insert operation to a tab control.
function tab_insert(hwnd, index, text, param)
  if hwnd is void then return -1 end if
  text_ptr = _wide_alloc(text)
  if text_ptr is void then return -1 end if
  item = bytes(40, 0)
  _write_u32(item, 0, TCIF_TEXT | TCIF_PARAM)
  _write_ptr(item, 16, text_ptr)
  _write_u32(item, 24, len(text))
  _write_ptr(item, 32, param)
  rc = SendMessageWBytes(hwnd, TCM_INSERTITEMW, index, item)
  _wide_free(text_ptr)
  return rc
end function

// Return cur selection from a tab control.
function tab_get_cur_sel(hwnd)
  if hwnd is void then return -1 end if
  return SendMessageW(hwnd, TCM_GETCURSEL, 0, 0)
end function

// Send the set cur selection operation to a tab control.
function tab_set_cur_sel(hwnd, index)
  if hwnd is void then return end if
  SendMessageW(hwnd, TCM_SETCURSEL, index, 0)
end function

// Send the set item size operation to a tab control.
function tab_set_item_size(hwnd, width, height)
  if hwnd is void then return end if
  lp = (height << 16) | (width & 0xFFFF)
  SendMessageW(hwnd, TCM_SETITEMSIZE, 0, lp)
end function

// Send the hit test operation to a tab control.
function tab_hit_test(hwnd, x, y)
  if hwnd is void then return -1 end if
  info = bytes(12, 0)
  _write_u32(info, 0, x)
  _write_u32(info, 4, y)
  return SendMessageWBytes(hwnd, TCM_HITTEST, 0, info)
end function

// Send the allow large text operation to a edit control.
function edit_allow_large_text(hwnd)
  if hwnd is void then return end if
  SendMessageW(hwnd, EM_SETLIMITTEXT, 0x7FFFFFFF, 0)
end function

// Send the selection operation to a edit control.
function edit_setsel(hwnd, start_pos, end_pos)
  if hwnd is void then return end if
  SendMessageW(hwnd, EM_SETSEL, start_pos, end_pos)
end function

// Send the scroll caret operation to a edit control.
function edit_scroll_caret(hwnd)
  if hwnd is void then return end if
  SendMessageW(hwnd, EM_SCROLLCARET, 0, 0)
end function

// Send the scroll lines operation to a edit control.
function edit_scroll_lines(hwnd, dx, dy)
  if hwnd is void then return end if
  SendMessageW(hwnd, EM_LINESCROLL, dx, dy)
end function

// Return true when the edit control modified.
function edit_is_modified(hwnd)
  if hwnd is void then return false end if
  return SendMessageW(hwnd, EM_GETMODIFY, 0, 0) != 0
end function

// Send the set modified operation to a edit control.
function edit_set_modified(hwnd, modified)
  if hwnd is void then return end if
  flag = 0
  if modified then flag = 1 end if
  SendMessageW(hwnd, EM_SETMODIFY, flag, 0)
end function

// Send the set readonly operation to a edit control.
function edit_set_readonly(hwnd, readonly)
  if hwnd is void then return end if
  flag = 0
  if readonly then flag = 1 end if
  SendMessageW(hwnd, EM_SETREADONLY, flag, 0)
end function

// Return selection from a edit control.
function edit_getsel(hwnd)
  if hwnd is void then return [0, 0] end if
  start_buf = bytes(4, 0)
  end_buf = bytes(4, 0)
  SendMessageW2Bytes(hwnd, EM_GETSEL, start_buf, end_buf)
  return [_read_u32(start_buf, 0), _read_u32(end_buf, 0)]
end function

// Return line count from a edit control.
function edit_line_count(hwnd)
  if hwnd is void then return 0 end if
  return SendMessageW(hwnd, EM_GETLINECOUNT, 0, 0)
end function

// Return line index from a edit control.
function edit_line_index(hwnd, line_no)
  if hwnd is void then return -1 end if
  return SendMessageW(hwnd, EM_LINEINDEX, line_no, 0)
end function

// Return line length from a edit control.
function edit_line_length(hwnd, char_pos)
  if hwnd is void then return 0 end if
  return SendMessageW(hwnd, EM_LINELENGTH, char_pos, 0)
end function

// Return char from position from a edit control.
function edit_char_from_pos(hwnd, x, y)
  if hwnd is void then return -1 end if
  pt = bytes(8, 0)
  _write_u32(pt, 0, x)
  _write_u32(pt, 4, y)
  char_pos = SendMessageWBytes(hwnd, EM_CHARFROMPOS, 0, pt)
  if typeof(char_pos) != "int" or char_pos < 0 then return -1 end if
  return char_pos
end function

// Return line from char from a edit control.
function edit_line_from_char(hwnd, char_pos)
  if hwnd is void then return 0 end if
  return SendMessageW(hwnd, EM_LINEFROMCHAR, char_pos, 0)
end function

// Return first visible line from a edit control.
function edit_first_visible_line(hwnd)
  if hwnd is void then return 0 end if
  return SendMessageW(hwnd, EM_GETFIRSTVISIBLELINE, 0, 0)
end function

// Return scroll position from a edit control.
function edit_get_scroll_pos(hwnd)
  if hwnd is void then return [0, 0] end if
  pt = bytes(8, 0)
  SendMessageWBytes(hwnd, EM_GETSCROLLPOS, 0, pt)
  return [point_x(pt), point_y(pt)]
end function

// Send the set scroll position operation to a edit control.
function edit_set_scroll_pos(hwnd, x, y)
  if hwnd is void then return end if
  pt = bytes(8, 0)
  _write_u32(pt, 0, x)
  _write_u32(pt, 4, y)
  SendMessageWBytes(hwnd, EM_SETSCROLLPOS, 0, pt)
end function

// Send the line from position operation to a edit control.
function edit_line_from_pos(hwnd, x, y)
  if hwnd is void then return 0 end if
  char_pos = edit_char_from_pos(hwnd, x, y)
  if char_pos < 0 then return 0 end if
  return edit_line_from_char(hwnd, char_pos)
end function

// Return text from a edit control.
function edit_get_text(hwnd)
  return get_window_text(hwnd)
end function

// Send the cut operation to a edit control.
function edit_cut(hwnd)
  if hwnd is void then return end if
  SendMessageW(hwnd, WM_CUT, 0, 0)
end function

// Send the copy operation to a edit control.
function edit_copy(hwnd)
  if hwnd is void then return end if
  SendMessageW(hwnd, WM_COPY, 0, 0)
end function

// Send the paste operation to a edit control.
function edit_paste(hwnd)
  if hwnd is void then return end if
  SendMessageW(hwnd, WM_PASTE, 0, 0)
end function

// Send the select all operation to a edit control.
function edit_select_all(hwnd)
  if hwnd is void then return end if
  SendMessageW(hwnd, EM_SETSEL, 0, 0x7FFFFFFF)
end function

// Send the replace selection operation to a edit control.
function edit_replace_sel(hwnd, text)
  if hwnd is void then return end if
  if typeof(text) != "string" then text = "" end if
  SendMessageWStr(hwnd, EM_REPLACESEL, 1, text)
end function

// Send the set background operation to a edit control.
function edit_set_background(hwnd, color)
  if hwnd is void then return end if
  SendMessageW(hwnd, EM_SETBKGNDCOLOR, 0, color)
  InvalidateRect(hwnd, void, true)
end function

// Open project dialog.
function open_project_dialog(hwnd)
  filter = _wide_alloc("MiniLang projects (*.mlproj)\0*.mlproj\0All files (*.*)\0*.*\0\0")
  title = _wide_alloc("Open Project")
  file_buf = GlobalAlloc(0x40, 8192)
  if file_buf is void then
    _wide_free(filter)
    _wide_free(title)
    return ""
  end if
  ofn = bytes(152, 0)
  _write_u32(ofn, 0, 152)
  _write_ptr(ofn, 8, hwnd)
  _write_ptr(ofn, 24, filter)
  _write_u32(ofn, 44, 1)
  _write_ptr(ofn, 48, file_buf)
  _write_u32(ofn, 56, 4096)
  _write_ptr(ofn, 88, title)
  _write_u32(ofn, 96, 0x00080000 | 0x00001000 | 0x00000800 | 0x00000008 | 0x00000004)
  ok = GetOpenFileNameW(ofn)
  result = ""
  if ok then
    buf = bytes(8192, 0)
    RtlMoveMemoryFromPtr(buf, file_buf, 8192)
    decoded = decode16Z(buf)
    if typeof(decoded) == "string" then result = decoded end if
  end if
  GlobalFree(file_buf)
  _wide_free(filter)
  _wide_free(title)
  return result
end function

// Open compiler dialog.
function open_compiler_dialog(hwnd)
  filter = _wide_alloc("Executable (*.exe)\0*.exe\0All files (*.*)\0*.*\0\0")
  title = _wide_alloc("Select Compiler")
  file_buf = GlobalAlloc(0x40, 8192)
  if file_buf is void then
    _wide_free(filter)
    _wide_free(title)
    return ""
  end if
  ofn = bytes(152, 0)
  _write_u32(ofn, 0, 152)
  _write_ptr(ofn, 8, hwnd)
  _write_ptr(ofn, 24, filter)
  _write_u32(ofn, 44, 1)
  _write_ptr(ofn, 48, file_buf)
  _write_u32(ofn, 56, 4096)
  _write_ptr(ofn, 88, title)
  _write_u32(ofn, 96, 0x00080000 | 0x00001000 | 0x00000800 | 0x00000008 | 0x00000004)
  ok = GetOpenFileNameW(ofn)
  result = ""
  if ok then
    buf = bytes(8192, 0)
    RtlMoveMemoryFromPtr(buf, file_buf, 8192)
    decoded = decode16Z(buf)
    if typeof(decoded) == "string" then result = decoded end if
  end if
  GlobalFree(file_buf)
  _wide_free(filter)
  _wide_free(title)
  return result
end function

// Open MiniLang file dialog.
function open_minilang_file_dialog(hwnd)
  filter = _wide_alloc("MiniLang files (*.ml)\0*.ml\0All files (*.*)\0*.*\0\0")
  title = _wide_alloc("Select Main File")
  file_buf = GlobalAlloc(0x40, 8192)
  if file_buf is void then
    _wide_free(filter)
    _wide_free(title)
    return ""
  end if
  ofn = bytes(152, 0)
  _write_u32(ofn, 0, 152)
  _write_ptr(ofn, 8, hwnd)
  _write_ptr(ofn, 24, filter)
  _write_u32(ofn, 44, 1)
  _write_ptr(ofn, 48, file_buf)
  _write_u32(ofn, 56, 4096)
  _write_ptr(ofn, 88, title)
  _write_u32(ofn, 96, 0x00080000 | 0x00001000 | 0x00000800 | 0x00000008 | 0x00000004)
  ok = GetOpenFileNameW(ofn)
  result = ""
  if ok then
    buf = bytes(8192, 0)
    RtlMoveMemoryFromPtr(buf, file_buf, 8192)
    decoded = decode16Z(buf)
    if typeof(decoded) == "string" then result = decoded end if
  end if
  GlobalFree(file_buf)
  _wide_free(filter)
  _wide_free(title)
  return result
end function

// Send the set redraw operation to a edit control.
function edit_set_redraw(hwnd, enabled)
  if hwnd is void then return end if
  flag = 0
  if enabled then flag = 1 end if
  SendMessageW(hwnd, WM_SETREDRAW, flag, 0)
  if enabled then
    InvalidateRect(hwnd, void, true)
    UpdateWindow(hwnd)
  end if
end function

// Send the set color operation to a RichEdit control.
function rich_set_color(hwnd, start_pos, end_pos, color)
  if hwnd is void then return end if
  if start_pos < 0 then start_pos = 0 end if
  if end_pos < start_pos then return end if
  SendMessageW(hwnd, EM_SETSEL, start_pos, end_pos)
  fmt = bytes(116, 0)
  _write_u32(fmt, 0, 116)
  _write_u32(fmt, 4, CFM_COLOR)
  _write_u32(fmt, 8, 0)
  _write_u32(fmt, 20, color)
  SendMessageWBytes(hwnd, EM_SETCHARFORMAT, SCF_SELECTION, fmt)
end function

// Send the set format operation to a RichEdit control.
function rich_set_format(hwnd, start_pos, end_pos, color, height_twips, bold, italic, underline)
  if hwnd is void then return end if
  if start_pos < 0 then start_pos = 0 end if
  if end_pos < start_pos then return end if
  SendMessageW(hwnd, EM_SETSEL, start_pos, end_pos)
  mask = 0
  if color >= 0 then mask = mask | CFM_COLOR end if
  if height_twips > 0 then mask = mask | CFM_SIZE end if
  if bold then mask = mask | CFM_BOLD end if
  if italic then mask = mask | CFM_ITALIC end if
  if underline then mask = mask | CFM_UNDERLINE end if
  effects = 0
  if bold then effects = effects | CFE_BOLD end if
  if italic then effects = effects | CFE_ITALIC end if
  if underline then effects = effects | CFE_UNDERLINE end if
  fmt = bytes(116, 0)
  _write_u32(fmt, 0, 116)
  _write_u32(fmt, 4, mask)
  _write_u32(fmt, 8, effects)
  if height_twips > 0 then _write_u32(fmt, 12, height_twips) end if
  if color >= 0 then _write_u32(fmt, 20, color) end if
  SendMessageWBytes(hwnd, EM_SETCHARFORMAT, SCF_SELECTION, fmt)
end function

// Send the set all color operation to a RichEdit control.
function rich_set_all_color(hwnd, color)
  if hwnd is void then return end if
  fmt = bytes(116, 0)
  _write_u32(fmt, 0, 116)
  _write_u32(fmt, 4, CFM_COLOR)
  _write_u32(fmt, 8, 0)
  _write_u32(fmt, 20, color)
  SendMessageWBytes(hwnd, EM_SETCHARFORMAT, SCF_ALL, fmt)
  InvalidateRect(hwnd, void, true)
end function
