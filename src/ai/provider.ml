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

package ai.provider

// OpenAI-compatible provider calls for MiniIDE's assistant.

import std.fs as fs
import std.string as s
import "project/project.ml" as project
import "build/build_service.ml" as build

struct ProviderResult
  ok,
  text,
  log,
end struct

// Quote a command-line argument for CreateProcess.
function _q(x)
  if typeof(x) != "string" then return "\"\"" end if
  return "\"" + x + "\""
end function

// Escape text for a JSON string literal.
function json_escape(text)
  if typeof(text) != "string" then return "" end if
  text = s.replaceAll(text, "\\", "\\\\")
  text = s.replaceAll(text, "\"", "\\\"")
  text = s.replaceAll(text, "\r", "\\r")
  text = s.replaceAll(text, "\n", "\\n")
  text = s.replaceAll(text, "\t", "\\t")
  return text
end function

// Escape text for a single-quoted PowerShell string literal.
function _ps_escape(text)
  if typeof(text) != "string" then return "" end if
  return s.replaceAll(text, "'", "''")
end function

function _read_file(path)
  text = try(fs.readAllText(path))
  if typeof(text) == "string" then return text end if
  return ""
end function

function _system_prompt()
  text = "You are MiniIDE's programming assistant for MiniLang projects. "
  text = text + "Use the provided read-only tool context as your source of truth. "
  text = text + "Be concise, concrete, and prefer MiniLang-specific guidance. "
  text = text + "Do not claim that you changed files or ran commands. "
  text = text + "If a write would be useful, describe the exact proposed change and wait for confirmation."
  return text
end function

function _request_body(model, prompt, context, transcript)
  if typeof(model) != "string" or model == "" then model = "gpt-5.1" end if
  if typeof(prompt) != "string" then prompt = "" end if
  if typeof(context) != "string" then context = "" end if
  if typeof(transcript) != "string" then transcript = "" end if
  user = "User request:\n" + prompt + "\n\nRecent transcript:\n" + transcript + "\n\nRead-only tool context:\n" + context
  body = "{"
  body = body + "\"model\":\"" + json_escape(model) + "\","
  body = body + "\"messages\":["
  body = body + "{\"role\":\"system\",\"content\":\"" + json_escape(_system_prompt()) + "\"},"
  body = body + "{\"role\":\"user\",\"content\":\"" + json_escape(user) + "\"}"
  body = body + "]"
  body = body + "}"
  return body
end function

function _script_text(config, request_path, response_path)
  base_url = "https://api.openai.com/v1"
  key_env = "OPENAI_API_KEY"
  if typeof(config) == "struct" then
    if typeof(config.base_url) == "string" and config.base_url != "" then base_url = config.base_url end if
    if typeof(config.api_key_env) == "string" and config.api_key_env != "" then key_env = config.api_key_env end if
  end if

  script = "$ErrorActionPreference = 'Stop'\n"
  script = script + "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12\n"
  script = script + "$baseUrl = '" + _ps_escape(base_url) + "'\n"
  script = script + "$apiKey = [Environment]::GetEnvironmentVariable('" + _ps_escape(key_env) + "')\n"
  script = script + "if ([string]::IsNullOrWhiteSpace($apiKey)) { throw 'Environment variable " + _ps_escape(key_env) + " is not set.' }\n"
  script = script + "$uri = $baseUrl.TrimEnd('/') + '/chat/completions'\n"
  script = script + "if ($baseUrl.ToLowerInvariant().EndsWith('/chat/completions')) { $uri = $baseUrl }\n"
  script = script + "$body = [IO.File]::ReadAllText('" + _ps_escape(request_path) + "')\n"
  script = script + "$headers = @{ Authorization = 'Bearer ' + $apiKey }\n"
  script = script + "$response = Invoke-RestMethod -Method Post -Uri $uri -Headers $headers -Body $body -ContentType 'application/json'\n"
  script = script + "$content = $null\n"
  script = script + "if ($response.choices -and $response.choices.Count -gt 0) { $content = $response.choices[0].message.content }\n"
  script = script + "if ($null -eq $content) { $content = ($response | ConvertTo-Json -Depth 20) }\n"
  script = script + "$utf8 = New-Object System.Text.UTF8Encoding -ArgumentList $false\n"
  script = script + "[IO.File]::WriteAllText('" + _ps_escape(response_path) + "', [string]$content, $utf8)\n"
  return script
end function

// Send one chat-completions request through PowerShell without exposing the key on the command line.
function chat_completion(project_root, config, prompt, context, transcript)
  if typeof(project_root) != "string" or project_root == "" then project_root = "." end if
  build_dir = project.path_join(project_root, "build")
  request_path = project.path_join(build_dir, "assistant_request.json")
  script_path = project.path_join(build_dir, "assistant_call.ps1")
  response_path = project.path_join(build_dir, "assistant_response.txt")
  log_path = project.path_join(build_dir, "assistant_call.log")

  model = "gpt-5.1"
  if typeof(config) == "struct" then
    if typeof(config.model) == "string" and config.model != "" then model = config.model end if
  end if
  wr = fs.writeAllText(request_path, _request_body(model, prompt, context, transcript))
  if typeof(wr) == "error" then return ProviderResult(false, "Assistant request failed: " + wr.message, "") end if
  wr = fs.writeAllText(response_path, "")
  if typeof(wr) == "error" then return ProviderResult(false, "Assistant response file failed: " + wr.message, "") end if
  wr = fs.writeAllText(script_path, _script_text(config, request_path, response_path))
  if typeof(wr) == "error" then return ProviderResult(false, "Assistant script failed: " + wr.message, "") end if

  cmd = "powershell.exe -NoProfile -ExecutionPolicy Bypass -File " + _q(script_path)
  job = build.start_hidden_command(project_root, cmd, log_path, "Assistant")
  if build.job_started(job) == false then return ProviderResult(false, job.log_text, job.log_text) end if

  while build.job_is_running(job)
    build.sleep_ms(80)
  end while
  exit_code = build.job_exit_code(job)
  log = build.job_log(job)
  job = build.close_job(job)

  response = _read_file(response_path)
  if exit_code != 0 then
    if response == "" then response = log end if
    if response == "" then response = "Assistant call failed: provider request exited with " + exit_code end if
    return ProviderResult(false, response, log)
  end if
  if response == "" then response = "Assistant call returned an empty response." end if
  return ProviderResult(true, response, log)
end function
