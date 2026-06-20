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

// Create a focused language service fixture.
function _create_fixture(root)
  _mkdir("build")
  _mkdir(root)
  _mkdir(project.path_join(root, "src"))

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
    "struct Model\n" +
    "end struct\n" +
    "function main(args)\n" +
    "  return modelValue()\n" +
    "end function\n" +
    "function modelValue()\n" +
    "  return 1\n" +
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

  if ok == false then return 1 end if
  print "Language service tests OK"
  return 0
end function
