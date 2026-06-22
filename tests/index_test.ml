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
import "project/project.ml" as project_model
import "lang/index.ml" as index

extern function CreateDirectoryW(path as wstr, securityAttributes as ptr) from "kernel32.dll" symbol "CreateDirectoryW" returns bool

// Print a failed assertion and return false.
function _assert_true(name, condition)
  if condition then return true end if
  print "FAIL: " + name
  return false
end function

// Create a directory if it does not already exist.
function _mkdir(path)
  if fs.exists(path) == false then
    CreateDirectoryW(path, void)
  end if
  return path
end function

// Return true when a symbol with the requested name exists.
function _has_symbol(items, name)
  if typeof(items) != "array" then return false end if
  if len(items) <= 0 then return false end if
  for i = 0 to len(items) - 1
    item = items[i]
    if typeof(item) == "struct" and item.name == name then return true end if
  end for
  return false
end function

// Return true when an import target exists.
function _has_import(items, target, resolved)
  if typeof(items) != "array" then return false end if
  if len(items) <= 0 then return false end if
  for i = 0 to len(items) - 1
    item = items[i]
    if typeof(item) == "struct" and item.target == target and item.resolved == resolved then return true end if
  end for
  return false
end function

// Create a focused project-index fixture.
function _create_fixture(root)
  _mkdir("build")
  _mkdir(root)
  _mkdir(project_model.path_join(root, "src"))
  _mkdir(project_model.path_join(root, "src\\lib"))
  _mkdir(project_model.path_join(root, "shared"))

  fs.writeAllText(project_model.path_join(root, "IndexTest.mlproj"),
    "name=IndexTest\n" +
    "type=console\n" +
    "entry=src\\main.ml\n" +
    "output=build\\IndexTest.exe\n" +
    "testEntry=tests\\main_test.ml\n" +
    "runArgs=\n" +
    "workingDir=.\n" +
    "importPath=src\n" +
    "importPath=shared\n")

  fs.writeAllText(project_model.path_join(root, "src\\main.ml"),
    "import \"lib\\util.ml\" as util\n" +
    "import helpers as helpers\n" +
    "import \"missing\\nope.ml\" as nope\n" +
    "const APP_NAME = \"IndexTest\"\n" +
    "function main(args)\n" +
    "  return util.add(1, 2)\n" +
    "end function\n")

  fs.writeAllText(project_model.path_join(root, "src\\lib\\util.ml"),
    "package lib.util\n" +
    "function add(a, b)\n" +
    "  return a + b\n" +
    "end function\n")

  fs.writeAllText(project_model.path_join(root, "shared\\helpers.ml"),
    "function helper()\n" +
    "  return 1\n" +
    "end function\n")

  return root
end function

// Run focused project index checks.
function main(args)
  ok = true
  root = project_model.path_join("build", "IndexTestProject")
  suffix = 0
  while fs.exists(root)
    suffix = suffix + 1
    root = project_model.path_join("build", "IndexTestProject_" + suffix)
  end while

  created = _create_fixture(root)
  if _assert_true("index fixture is created", typeof(created) == "string") == false then ok = false end if
  if ok == false then return 1 end if

  p = project_model.load_project(root)
  idx = index.build_project_index(p)

  if _assert_true("index returns a struct", typeof(idx) == "struct") == false then ok = false end if
  if _assert_true("index counts MiniLang files", len(idx.files) == 3) == false then ok = false end if
  if _assert_true("index records imports", len(idx.imports) == 3) == false then ok = false end if
  if _assert_true("index records unresolved imports", len(idx.unresolved_imports) == 1) == false then ok = false end if
  if _assert_true("relative quoted import resolves", _has_import(idx.imports, "lib\\util.ml", true)) == false then ok = false end if
  if _assert_true("importPath module import resolves", _has_import(idx.imports, "helpers", true)) == false then ok = false end if
  if _assert_true("missing import remains unresolved", _has_import(idx.imports, "missing\\nope.ml", false)) == false then ok = false end if
  if _assert_true("function symbol is indexed", _has_symbol(idx.symbols, "main")) == false then ok = false end if
  if _assert_true("package symbol is indexed", _has_symbol(idx.symbols, "lib.util")) == false then ok = false end if
  if _assert_true("summary mentions unresolved imports", s.indexOf(index.summary(idx), "unresolved", 0) >= 0) == false then ok = false end if

  if ok == false then return 1 end if
  print "Project index tests OK"
  return 0
end function
