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

package project.config

// .miniide.cfg path resolution and typed value parsing.

import std.fs as fs
import std.string as s
import "project/project.ml" as project_model

// Return the project-local configuration file path.
function path(p)
  root = "."
  if typeof(p) == "struct" then root = p.root end if
  return project_model.path_join(root, ".miniide.cfg")
end function

// Load one raw key from .miniide.cfg while ignoring comments and blank lines.
function load_value(p, wanted_key, default_value)
  cfg = path(p)
  if fs.exists(cfg) == false then return default_value end if
  text = fs.readAllText(cfg)
  if typeof(text) != "string" then return default_value end if
  lines = s.split(s.replaceAll(text, "\r\n", "\n"), "\n")
  if typeof(lines) != "array" or len(lines) <= 0 then return default_value end if
  for i = 0 to len(lines) - 1
    line = s.trim(lines[i])
    if line == "" or s.startsWith(line, "#") or s.startsWith(line, "//") then continue end if
    eq = s.indexOf(line, "=", 0)
    if eq < 0 then continue end if
    key = s.trim(s.substr(line, 0, eq))
    value = s.trim(s.substr(line, eq + 1, len(line) - eq - 1))
    if key == wanted_key then return value end if
  end for
  return default_value
end function

// Parse common boolean spellings used in project configuration files.
function bool_from_text(value, default_value)
  value = s.toLowerAscii(value)
  if value == "true" or value == "1" or value == "yes" or value == "on" then return true end if
  if value == "false" or value == "0" or value == "no" or value == "off" then return false end if
  return default_value
end function

// Parse an integer and fall back when the config value is empty or invalid.
function int_from_text(value, default_value)
  n = toNumber(value)
  if typeof(n) == "int" then return n end if
  return default_value
end function

// Load a boolean key from .miniide.cfg.
function load_bool(p, key, default_value)
  return bool_from_text(load_value(p, key, ""), default_value)
end function

// Load an integer key from .miniide.cfg.
function load_int(p, key, default_value)
  return int_from_text(load_value(p, key, ""), default_value)
end function
