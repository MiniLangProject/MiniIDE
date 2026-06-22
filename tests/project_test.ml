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
import "project/templates.ml" as templates

// Print a failed assertion and return false.
function _assert_true(name, condition)
  if condition then return true end if
  print "FAIL: " + name
  return false
end function

// Run focused project-loading regression checks.
function main(args)
  ok = true
  suffix = 0
  name = "ProjectLoadDirTest"
  while fs.exists(project_model.path_join("build", name))
    suffix = suffix + 1
    name = "ProjectLoadDirTest_" + suffix
  end while
  created = templates.create_standard_project("build", name, "console")
  if _assert_true("standard project template creates a project folder", typeof(created) == "string") == false then ok = false end if
  if ok == false then return 1 end if

  duplicate = try(templates.create_standard_project("build", name, "console"))
  if _assert_true("duplicate project creation returns an error value", typeof(duplicate) == "error") == false then ok = false end if

  loaded_from_dir = try(project_model.load_project_file(created))
  if _assert_true("project directory passed to load_project_file does not crash", typeof(loaded_from_dir) == "struct") == false then ok = false end if
  if typeof(loaded_from_dir) == "struct" then
    if _assert_true("project name is read from generated mlproj", loaded_from_dir.name == name) == false then ok = false end if
    if _assert_true("generated entry file exists", fs.exists(project_model.project_entry_path(loaded_from_dir))) == false then ok = false end if
  end if

  loaded_from_root = try(project_model.load_project(created))
  if _assert_true("project root loads through load_project", typeof(loaded_from_root) == "struct") == false then ok = false end if
  if typeof(loaded_from_root) == "struct" then
    if _assert_true("load_project keeps the same project name", loaded_from_root.name == name) == false then ok = false end if
  end if

  if ok == false then return 1 end if
  print "Project loader tests OK"
  return 0
end function
