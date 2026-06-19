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

package project.templates

import std.fs as fs
import std.string as s

// Bind the native CreateDirectoryW API used by MiniIDE.
extern function CreateDirectoryW(path as wstr, securityAttributes as ptr) from "kernel32.dll" symbol "CreateDirectoryW" returns bool

// Join two path fragments using the project path separator.
function path_join(a, b)
  if typeof(a) != "string" or a == "" then return b end if
  if typeof(b) != "string" or b == "" then return a end if
  last = a[len(a) - 1]
  if last == "\\" or last == "/" then return a + b end if
  return a + "\\" + b
end function

// Create a directory when it does not already exist.
function _mkdir(path)
  if typeof(path) != "string" or path == "" then return false end if
  if fs.exists(path) then return true end if
  CreateDirectoryW(path, void)
  return fs.exists(path)
end function

// Convert a project name into a safe folder and module name.
function _safe_name(name)
  if typeof(name) != "string" or name == "" then return "MiniLangProject" end if
  result = s.replaceAll(name, " ", "")
  result = s.replaceAll(result, ".", "")
  result = s.replaceAll(result, "\\", "")
  result = s.replaceAll(result, "/", "")
  if result == "" then result = "MiniLangProject" end if
  return result
end function

// Build the starter MiniLang source for a new project.
function _main_source(name, kind)
  if kind == "library" then
    return "package " + name + "\n\nfunction hello()\n  return \"Hello from " + name + "\"\nend function\n"
  end if
  return "function main(args)\n  print \"Hello from " + name + "\"\n  return 0\nend function\n"
end function

// Build the starter MiniLang test source for a new project.
function _test_source(name)
  return "import \"..\\src\\main.ml\" as app\n\nfunction main(args)\n  print \"Running tests for " + name + "\"\n  return 0\nend function\n"
end function

// Build the project metadata file for a new project.
function _project_file(name, kind)
  return "name=" + name + "\n" +
    "type=" + kind + "\n" +
    "entry=src\\main.ml\n" +
    "output=build\\" + name + ".exe\n" +
    "testEntry=tests\\main_test.ml\n" +
    "runArgs=\n" +
    "workingDir=.\n" +
    "importPath=src\n" +
    "importPath=lib\n" +
    "importPath=..\\..\\MiniLangCompilerML\n"
end function

// Build the default MiniIDE configuration file for a new project.
function _config_file()
  return "compiler=\nkeepGoing=true\nmaxErrors=20\nsubsystem=console\nextraArgs=\n"
end function

// Build the starter README for a new project.
function _readme(name)
  return "# " + name + "\n\nMiniLang project created by MiniIDE.\n\n## Build\nUse `File > Build`.\n\n## Run\nUse `File > Run`.\n\n## Tests\nUse `File > Run Tests`.\n"
end function

// Create standard project.
function create_standard_project(parent, name, kind)
  if typeof(parent) != "string" or parent == "" then parent = "." end if
  name = _safe_name(name)
  if typeof(kind) != "string" or kind == "" then kind = "console" end if
  root = path_join(parent, name)
  if fs.exists(root) then return error(1, "Project folder already exists: " + root) end if

  _mkdir(root)
  _mkdir(path_join(root, "src"))
  _mkdir(path_join(root, "src\\app"))
  _mkdir(path_join(root, "src\\lib"))
  _mkdir(path_join(root, "lib"))
  _mkdir(path_join(root, "tests"))
  _mkdir(path_join(root, "assets"))
  _mkdir(path_join(root, "assets\\data"))
  _mkdir(path_join(root, "assets\\icons"))
  _mkdir(path_join(root, "build"))

  fs.writeAllText(path_join(root, name + ".mlproj"), _project_file(name, kind))
  fs.writeAllText(path_join(root, ".miniide.cfg"), _config_file())
  fs.writeAllText(path_join(root, "src\\main.ml"), _main_source(name, kind))
  fs.writeAllText(path_join(root, "tests\\main_test.ml"), _test_source(name))
  fs.writeAllText(path_join(root, "README.md"), _readme(name))
  return root
end function
