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

package ai.assistant

// Assistant configuration and read-only context assembly for MiniIDE.

import std.string as s
import "project/project.ml" as project_model
import "help/language.ml" as help_lang

struct AssistantConfig
  enabled,
  provider,
  base_url,
  api_key_mode,
  api_key_env,
  api_key,
  model,
  tool_mode,
  allow_insecure_tls,
  include_tabs,
  include_project,
  include_help,
end struct

// Normalize provider names accepted by the settings dialog and config file.
function normalize_provider(value)
  value = s.toLowerAscii(s.trim(value))
  if value == "openai-compatible" or value == "compatible" then return "openai-compatible" end if
  return "openai"
end function

// Normalize API-key source names accepted by the settings dialog and config file.
function normalize_api_key_mode(value)
  value = s.toLowerAscii(s.trim(value))
  if value == "direct" or value == "key" or value == "api-key" or value == "static" then return "direct" end if
  return "env"
end function

// Normalize future tool modes while keeping the current build read-only.
function normalize_tool_mode(value)
  value = s.toLowerAscii(s.trim(value))
  if value == "confirm-writes" or value == "confirm" then return "confirm-writes" end if
  return "read-only"
end function

// Return text capped to a prompt-safe excerpt.
function excerpt(text, limit)
  if typeof(text) != "string" then return "" end if
  if typeof(limit) != "int" or limit <= 0 then limit = 2000 end if
  if len(text) <= limit then return text end if
  return s.substr(text, 0, limit) + "\n... [truncated, " + len(text) + " chars total]"
end function

// Return a path relative to the project root when possible.
function relative_path(root, path)
  if typeof(path) != "string" then return "" end if
  if typeof(root) != "string" or root == "" then return path end if
  abs = project_model.abspath(path)
  base = project_model.abspath(root)
  if len(abs) > len(base) + 1 and s.toLowerAscii(s.substr(abs, 0, len(base))) == s.toLowerAscii(base) then
    sep = abs[len(base)]
    if sep == "\\" or sep == "/" then return s.substr(abs, len(base) + 1, len(abs) - len(base) - 1) end if
  end if
  return path
end function

// Return open tabs in the compact form sent to assistant tooling.
function open_tabs_text(root, open_files, open_dirty, active_tab)
  text = "open_tabs:\n"
  if typeof(open_files) != "array" or len(open_files) <= 0 then return text + "- none\n" end if
  for i = 0 to len(open_files) - 1
    marker = " "
    if i == active_tab then marker = "*" end if
    dirty = ""
    if typeof(open_dirty) == "array" and i < len(open_dirty) and open_dirty[i] then dirty = " dirty" end if
    text = text + "- " + marker + " " + relative_path(root, open_files[i]) + dirty + "\n"
  end for
  return text
end function

// Return active file metadata plus a bounded source excerpt.
function active_file_text(root, current_file, active_tab, open_texts)
  if typeof(current_file) != "string" or current_file == "" then return "active_file: none\n" end if
  text_len = 0
  content = ""
  if typeof(open_texts) == "array" and active_tab >= 0 and active_tab < len(open_texts) then
    content = open_texts[active_tab]
    text_len = len(content)
  end if
  text = "active_file: " + relative_path(root, current_file) + "\nactive_text_length: " + text_len + "\n"
  if content != "" then text = text + "active_file_excerpt:\n```minilang\n" + excerpt(content, 5000) + "\n```\n" end if
  return text
end function

// Return bounded source excerpts for all open editor tabs.
function open_tab_contents_text(root, open_files, open_texts, limit_each)
  text = "open_tab_contents:\n"
  if typeof(open_files) != "array" or typeof(open_texts) != "array" or len(open_files) <= 0 then return text + "- none\n" end if
  for i = 0 to len(open_files) - 1
    if i >= len(open_texts) then continue end if
    text = text + "\n--- " + relative_path(root, open_files[i]) + " ---\n"
    text = text + excerpt(open_texts[i], limit_each) + "\n"
  end for
  return text
end function

// Return a bounded project-file index for assistant tooling.
function project_files_text(root, project_files, limit)
  if typeof(limit) != "int" or limit <= 0 then limit = 80 end if
  text = "project_files:\n"
  count = 0
  if typeof(project_files) != "array" or len(project_files) <= 0 then return text + "- none\n" end if
  for i = 0 to len(project_files) - 1
    if count >= limit then break end if
    f = project_files[i]
    if typeof(f) != "struct" or f.is_dir then continue end if
    text = text + "- " + relative_path(root, f.path) + "\n"
    count = count + 1
  end for
  if count >= limit then text = text + "- ...\n" end if
  return text
end function

// Return MiniLang reference availability for assistant tooling.
function help_text(project_root, compiler_path)
  loaded = help_lang.read_reference(project_root, compiler_path)
  if loaded[2] != "" then return "minilang_help: unavailable (" + loaded[2] + ")\n" end if
  return "minilang_help: " + loaded[0] + " (" + len(loaded[1]) + " chars)\nminilang_help_excerpt:\n" + excerpt(loaded[1], 6000) + "\n"
end function

// Return the latest build/run log for assistant diagnostics.
function build_log_text(log_text)
  text = "latest_build_log:\n"
  if typeof(log_text) != "string" or log_text == "" then return text + "- none\n" end if
  return text + excerpt(log_text, 5000) + "\n"
end function

// Assemble the local read-only assistant context from IDE state snapshots.
function tool_context(project_value, compiler_path, config, current_file, open_files, open_dirty, active_tab, open_texts, latest_build_log)
  project_name = "MiniIDE"
  project_root = "."
  project_files = []
  if typeof(project_value) == "struct" then
    project_name = project_value.name
    project_root = project_value.root
    if typeof(project_value.files) == "array" then project_files = project_value.files end if
  end if

  text = "MiniIDE assistant tool context\n"
  text = text + "project: " + project_name + "\n"
  text = text + "provider: " + config.provider + "\n"
  text = text + "model: " + config.model + "\n"
  text = text + "tool_mode: " + config.tool_mode + "\n"
  text = text + "enabled: " + config.enabled + "\n\n"
  text = text + active_file_text(project_root, current_file, active_tab, open_texts) + "\n"
  if config.include_tabs then
    text = text + open_tabs_text(project_root, open_files, open_dirty, active_tab) + "\n"
    text = text + open_tab_contents_text(project_root, open_files, open_texts, 3000) + "\n"
  end if
  if config.include_project then text = text + project_files_text(project_root, project_files, 80) + "\n" end if
  if config.include_help then text = text + help_text(project_root, compiler_path) + "\n" end if
  text = text + build_log_text(latest_build_log) + "\n"
  return text
end function
