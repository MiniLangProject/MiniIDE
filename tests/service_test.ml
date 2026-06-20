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

import std.fs as fs
import std.string as s
import "project/project.ml" as project
import "lang/service.ml" as service

extern function CreateDirectoryW(path as wstr, securityAttributes as ptr) from "kernel32.dll" symbol "CreateDirectoryW" returns bool

// Print a failed assertion and return false.
function _assert_true(name, condition)
  if condition then return true end if
  print "FAIL: " + name
  return false
end function

// Create a directory if needed.
function _mkdir(path)
  if fs.exists(path) == false then CreateDirectoryW(path, void) end if
  return path
end function

// Return true when labels contains value.
function _has_label(labels, value)
  if typeof(labels) != "array" then return false end if
  if len(labels) <= 0 then return false end if
  for i = 0 to len(labels) - 1
    if labels[i] == value then return true end if
  end for
  return false
end function

// Return true when a completion item with label and kind exists.
function _has_item(items, label, kind)
  if typeof(items) != "array" then return false end if
  if len(items) <= 0 then return false end if
  for i = 0 to len(items) - 1
    item = items[i]
    if typeof(item) == "struct" and item.label == label and item.kind == kind then return true end if
  end for
  return false
end function

// Return true when a symbol item with name and kind exists.
function _has_symbol_item(items, name, kind)
  if typeof(items) != "array" then return false end if
  if len(items) <= 0 then return false end if
  for i = 0 to len(items) - 1
    item = items[i]
    if typeof(item) == "struct" and item.name == name and item.kind == kind then return true end if
  end for
  return false
end function

// Return true when a symbol info item with name, kind, and references exists.
function _has_symbol_info(items, name, kind, reference_count)
  if typeof(items) != "array" then return false end if
  if len(items) <= 0 then return false end if
  for i = 0 to len(items) - 1
    item = items[i]
    if typeof(item) == "struct" and item.name == name and item.kind == kind and item.reference_count == reference_count then return true end if
  end for
  return false
end function

// Return true when a file item with a relative path exists.
function _has_file_item(items, relative_path)
  if typeof(items) != "array" then return false end if
  if len(items) <= 0 then return false end if
  for i = 0 to len(items) - 1
    item = items[i]
    if typeof(item) == "struct" and item.relative_path == relative_path then return true end if
  end for
  return false
end function

// Return true when an import item with target and status exists.
function _has_import_item(items, target, resolved)
  if typeof(items) != "array" then return false end if
  if len(items) <= 0 then return false end if
  for i = 0 to len(items) - 1
    item = items[i]
    if typeof(item) == "struct" and item.target == target and item.resolved == resolved then return true end if
  end for
  return false
end function

// Return true when a call hierarchy item of the requested kind exists.
function _has_call_item(items, kind, line)
  if typeof(items) != "array" then return false end if
  if len(items) <= 0 then return false end if
  for i = 0 to len(items) - 1
    item = items[i]
    if typeof(item) == "struct" and item.kind == kind and item.line == line then return true end if
  end for
  return false
end function

// Return true when a reference exists on the requested line.
function _has_reference_line(items, line)
  if typeof(items) != "array" then return false end if
  if len(items) <= 0 then return false end if
  for i = 0 to len(items) - 1
    item = items[i]
    if typeof(item) == "struct" and item.line == line then return true end if
  end for
  return false
end function

// Return true when a diagnostic with a message fragment exists.
function _has_diagnostic(items, fragment)
  if typeof(items) != "array" then return false end if
  if len(items) <= 0 then return false end if
  for i = 0 to len(items) - 1
    item = items[i]
    if typeof(item) == "struct" and s.indexOf(item.message, fragment, 0) >= 0 then return true end if
  end for
  return false
end function

// Return true when an inspection message contains the requested fragment.
function _has_inspection(items, fragment)
  if typeof(items) != "array" then return false end if
  if len(items) <= 0 then return false end if
  for i = 0 to len(items) - 1
    item = items[i]
    if typeof(item) == "struct" and s.indexOf(item.message, fragment, 0) >= 0 then return true end if
  end for
  return false
end function

// Return true when a TODO item contains the requested fragment.
function _has_todo(items, kind, fragment)
  if typeof(items) != "array" then return false end if
  if len(items) <= 0 then return false end if
  for i = 0 to len(items) - 1
    item = items[i]
    if typeof(item) == "struct" and item.kind == kind and s.indexOf(item.text, fragment, 0) >= 0 then return true end if
  end for
  return false
end function

// Return true when a test explorer item exists.
function _has_test_item(items, name, kind, status)
  if typeof(items) != "array" then return false end if
  if len(items) <= 0 then return false end if
  for i = 0 to len(items) - 1
    item = items[i]
    if typeof(item) == "struct" and item.name == name and item.kind == kind and item.status == status then return true end if
  end for
  return false
end function

// Return true when a health line equals the requested text.
function _has_health_line(items, expected)
  if typeof(items) != "array" then return false end if
  if len(items) <= 0 then return false end if
  for i = 0 to len(items) - 1
    if items[i] == expected then return true end if
  end for
  return false
end function

// Create a focused language service fixture.
function _create_fixture(root)
  _mkdir("build")
  _mkdir(root)
  _mkdir(project.path_join(root, "src"))
  _mkdir(project.path_join(root, "tests"))

  fs.writeAllText(project.path_join(root, "ServiceTest.mlproj"),
    "name=ServiceTest\n" +
    "type=console\n" +
    "entry=src\\main.ml\n" +
    "output=build\\ServiceTest.exe\n" +
    "testEntry=tests\\main_test.ml\n" +
    "runArgs=\n" +
    "workingDir=.\n" +
    "importPath=src\n")

  fs.writeAllText(project.path_join(root, "src\\main.ml"),
    "import \"missing\\nope.ml\" as nope\n" +
    "import \"util.ml\" as util\n" +
    "struct Model\n" +
    "end struct\n" +
    "function main(args)\n" +
    "  return modelValue()\n" +
    "end function\n" +
    "function modelValue()\n" +
    "  return 1\n" +
    "end function\n" +
    "function modelValueExtra()\n" +
    "  // modelValue should not be counted in a line comment\n" +
    "  return 2\n" +
    "end function\n" +
    "// TODO: revisit model lifecycle\n")

  fs.writeAllText(project.path_join(root, "src\\util.ml"),
    "function helper_util()\n" +
    "  return 1\n" +
    "end function\n")

  fs.writeAllText(project.path_join(root, "tests\\main_test.ml"),
    "import \"..\\src\\main.ml\" as app\n" +
    "function test_model_lifecycle()\n" +
    "  return 0\n" +
    "end function\n")

  return root
end function

// Run focused language service checks.
function main(args)
  ok = true
  root = project.path_join("build", "ServiceTestProject")
  suffix = 0
  while fs.exists(root)
    suffix = suffix + 1
    root = project.path_join("build", "ServiceTestProject_" + suffix)
  end while

  _create_fixture(root)
  p = project.load_project(root)
  snapshot = service.analyze_project(p)

  labels = service.completion_labels(snapshot, "mo", 20)
  if _assert_true("symbol completion includes modelValue", _has_label(labels, "modelValue")) == false then ok = false end if
  if _assert_true("symbol completion includes Model", _has_label(labels, "Model")) == false then ok = false end if

  keyword_items = service.completion_items(snapshot, "fun", 20)
  if _assert_true("keyword completion includes function", _has_item(keyword_items, "function", "keyword")) == false then ok = false end if

  symbol_items = service.completion_items(snapshot, "main", 20)
  if _assert_true("symbol completion keeps function kind", _has_item(symbol_items, "main", "function")) == false then ok = false end if

  project_symbols = service.symbol_items(snapshot, "mo", 20)
  if _assert_true("project symbols include filtered function", _has_symbol_item(project_symbols, "modelValue", "function")) == false then ok = false end if
  if _assert_true("project symbols include filtered struct", _has_symbol_item(project_symbols, "Model", "struct")) == false then ok = false end if

  symbol_info = service.symbol_info(snapshot, "modelValue")
  if _assert_true("symbol info includes reference count", _has_symbol_info(symbol_info, "modelValue", "function", 2)) == false then ok = false end if

  file_items = service.file_items(snapshot, "tests", 20)
  if _assert_true("quick open files include matching test file", _has_file_item(file_items, "tests\\main_test.ml")) == false then ok = false end if

  import_items = service.import_items(snapshot, "missing", 20)
  if _assert_true("import graph includes unresolved import", _has_import_item(import_items, "missing\\nope.ml", false)) == false then ok = false end if
  resolved_imports = service.import_items(snapshot, "util", 20)
  if _assert_true("import graph includes resolved import", _has_import_item(resolved_imports, "util.ml", true)) == false then ok = false end if

  refs = service.references(snapshot, "modelValue", 20)
  if _assert_true("references include call and definition only", len(refs) == 2) == false then ok = false end if
  if _assert_true("references include call line", _has_reference_line(refs, 6)) == false then ok = false end if
  if _assert_true("references include definition line", _has_reference_line(refs, 8)) == false then ok = false end if

  call_items = service.call_hierarchy_items(snapshot, "modelValue", 20)
  if _assert_true("call hierarchy includes call reference", _has_call_item(call_items, "reference", 6)) == false then ok = false end if
  if _assert_true("call hierarchy includes definition", _has_call_item(call_items, "definition", 8)) == false then ok = false end if

  diagnostics = service.diagnostics(snapshot)
  if _assert_true("project diagnostics include unresolved imports", _has_diagnostic(diagnostics, "Unresolved import: missing\\nope.ml")) == false then ok = false end if

  inspections = service.code_inspection_items(snapshot, 50)
  if _assert_true("code inspections include unused helper", _has_inspection(inspections, "Possibly unused function: helper_util")) == false then ok = false end if

  health = service.workspace_health_lines(snapshot)
  if _assert_true("workspace health counts files", _has_health_line(health, "Files: 3")) == false then ok = false end if
  if _assert_true("workspace health counts imports", _has_health_line(health, "Imports: 3")) == false then ok = false end if
  if _assert_true("workspace health counts unresolved imports", _has_health_line(health, "Unresolved imports: 1")) == false then ok = false end if
  if _assert_true("workspace health counts diagnostics", _has_health_line(health, "Diagnostics: 1")) == false then ok = false end if

  todos = service.todo_items(snapshot, 20)
  if _assert_true("TODO explorer finds project task", _has_todo(todos, "TODO", "revisit model lifecycle")) == false then ok = false end if

  tests = service.test_items(snapshot, 20)
  if _assert_true("test explorer includes configured entry", _has_test_item(tests, "Test Entry", "entry", "configured")) == false then ok = false end if
  if _assert_true("test explorer discovers test function", _has_test_item(tests, "test_model_lifecycle", "function", "discovered")) == false then ok = false end if

  related_tests = service.related_test_items(snapshot, project.path_join(p.root, "src\\main.ml"), 20)
  if _assert_true("related tests include importing test file", _has_test_item(related_tests, project.path_join(p.root, "tests\\main_test.ml"), "file", "related")) == false then ok = false end if
  if _assert_true("related tests include importing test function", _has_test_item(related_tests, "test_model_lifecycle", "function", "related")) == false then ok = false end if

  if ok == false then return 1 end if
  print "Language service tests OK"
  return 0
end function
