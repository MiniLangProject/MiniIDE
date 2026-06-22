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

import std.string as s
import std.string_builder as sb

extern function WinHttpOpen(agent as wstr, accessType as int, proxyName as ptr, proxyBypass as ptr, flags as u32) from "winhttp.dll" returns ptr
extern function WinHttpConnect(session as ptr, serverName as wstr, serverPort as int, reserved as u32) from "winhttp.dll" returns ptr
extern function WinHttpOpenRequest(connect as ptr, verb as wstr, objectName as wstr, version as ptr, referrer as ptr, acceptTypes as ptr, flags as u32) from "winhttp.dll" returns ptr
extern function WinHttpSendRequest(request as ptr, headers as wstr, headersLength as u32, optional as bytes, optionalLength as u32, totalLength as u32, context as ptr) from "winhttp.dll" returns bool
extern function WinHttpReceiveResponse(request as ptr, reserved as ptr) from "winhttp.dll" returns bool
extern function WinHttpSetOption(handle as ptr, option as u32, buffer as bytes, bufferLength as u32) from "winhttp.dll" returns bool
extern function WinHttpQueryHeaders(request as ptr, infoLevel as u32, name as ptr, buffer as bytes, bufferLength as bytes, index as ptr) from "winhttp.dll" returns bool
extern function WinHttpQueryDataAvailable(request as ptr, bytesAvailable as bytes) from "winhttp.dll" returns bool
extern function WinHttpReadData(request as ptr, buffer as bytes, bytesToRead as u32, bytesRead as bytes) from "winhttp.dll" returns bool
extern function WinHttpCloseHandle(handle as ptr) from "winhttp.dll" returns bool
extern function GetEnvironmentVariableW(name as wstr, buffer as buffer, size as u32) from "kernel32.dll" symbol "GetEnvironmentVariableW" returns u32
extern function GetLastError() from "kernel32.dll" returns u32

const WINHTTP_ACCESS_TYPE_DEFAULT_PROXY = 0
const WINHTTP_FLAG_SECURE = 0x00800000
const WINHTTP_OPTION_SECURITY_FLAGS = 31
const WINHTTP_QUERY_STATUS_CODE = 19
const WINHTTP_QUERY_FLAG_NUMBER = 0x20000000
const SECURITY_FLAG_IGNORE_UNKNOWN_CA = 0x00000100
const SECURITY_FLAG_IGNORE_CERT_WRONG_USAGE = 0x00000200
const SECURITY_FLAG_IGNORE_CERT_CN_INVALID = 0x00001000
const SECURITY_FLAG_IGNORE_CERT_DATE_INVALID = 0x00002000

struct ProviderResult
  ok,
  text,
  log,
end struct

struct HttpUrl
  ok,
  error,
  scheme,
  host,
  port,
  path,
  secure,
end struct

struct HttpResult
  ok,
  status,
  body,
  error,
  log,
end struct

// Write an unsigned 32-bit value into a byte buffer at an offset.
function _write_u32(buf, off, value)
  v = value & 0xFFFFFFFF
  buf[off] = v & 255
  buf[off + 1] = (v >> 8) & 255
  buf[off + 2] = (v >> 16) & 255
  buf[off + 3] = (v >> 24) & 255
end function

// Read an unsigned 32-bit value from a little-endian byte buffer.
function _u32le4(buf)
  if typeof(buf) != "bytes" or len(buf) < 4 then return 0 end if
  return buf[0] + buf[1] * 256 + buf[2] * 65536 + buf[3] * 16777216
end function

// Return the last index of a character in a string.
function _last_index_of(text, ch, before)
  if typeof(text) != "string" then return -1 end if
  i = before
  if i >= len(text) then i = len(text) - 1 end if
  while i >= 0
    if text[i] == ch then return i end if
    i = i - 1
  end while
  return -1
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

function _config_value(config, field, fallback)
  if typeof(config) == "struct" then
    if field == "base_url" and typeof(config.base_url) == "string" and config.base_url != "" then return config.base_url end if
    if field == "api_key_mode" and typeof(config.api_key_mode) == "string" and config.api_key_mode != "" then return config.api_key_mode end if
    if field == "api_key_env" and typeof(config.api_key_env) == "string" and config.api_key_env != "" then return config.api_key_env end if
    if field == "api_key" and typeof(config.api_key) == "string" and config.api_key != "" then return config.api_key end if
    if field == "model" and typeof(config.model) == "string" and config.model != "" then return config.model end if
  end if
  return fallback
end function

function _config_bool(config, field, fallback)
  if typeof(config) == "struct" then
    if field == "allow_insecure_tls" and typeof(config.allow_insecure_tls) == "bool" then return config.allow_insecure_tls end if
  end if
  return fallback
end function

function _rstrip_slashes(text)
  if typeof(text) != "string" then return "" end if
  while len(text) > 0 and (text[len(text) - 1] == "/" or text[len(text) - 1] == "\\")
    text = s.substr(text, 0, len(text) - 1)
  end while
  return text
end function

function _chat_url(config)
  base_url = s.trim(_config_value(config, "base_url", "https://api.openai.com/v1"))
  if base_url == "" then base_url = "https://api.openai.com/v1" end if
  lower = s.toLowerAscii(_rstrip_slashes(base_url))
  if s.endsWith(lower, "/chat/completions") then return _rstrip_slashes(base_url) end if
  return _rstrip_slashes(base_url) + "/chat/completions"
end function

function _parse_url(url)
  if typeof(url) != "string" or s.trim(url) == "" then return HttpUrl(false, "Provider URL is empty.", "", "", 0, "", false) end if
  url = s.trim(url)
  lower = s.toLowerAscii(url)
  scheme_pos = s.indexOf(lower, "://", 0)
  if scheme_pos < 0 then return HttpUrl(false, "Provider URL must start with http:// or https://.", "", "", 0, "", false) end if
  scheme = s.substr(lower, 0, scheme_pos)
  secure = false
  port = 80
  if scheme == "https" then
    secure = true
    port = 443
  else if scheme == "http" then
    secure = false
    port = 80
  else
    return HttpUrl(false, "Unsupported provider URL scheme: " + scheme, scheme, "", 0, "", false)
  end if

  rest = s.substr(url, scheme_pos + 3, len(url) - scheme_pos - 3)
  slash = s.indexOf(rest, "/", 0)
  authority = rest
  path = "/"
  if slash >= 0 then
    authority = s.substr(rest, 0, slash)
    path = s.substr(rest, slash, len(rest) - slash)
  end if
  if authority == "" then return HttpUrl(false, "Provider URL host is empty.", scheme, "", port, path, secure) end if

  host = authority
  colon = _last_index_of(authority, ":", len(authority) - 1)
  if colon > 0 then
    host = s.substr(authority, 0, colon)
    port_text = s.substr(authority, colon + 1, len(authority) - colon - 1)
    parsed_port = toNumber(port_text)
    if typeof(parsed_port) != "int" or parsed_port <= 0 then
      return HttpUrl(false, "Provider URL port is invalid: " + port_text, scheme, host, port, path, secure)
    end if
    port = parsed_port
  end if
  if host == "" then return HttpUrl(false, "Provider URL host is empty.", scheme, "", port, path, secure) end if
  if path == "" then path = "/" end if
  return HttpUrl(true, "", scheme, host, port, path, secure)
end function

function _env_value(name)
  if typeof(name) != "string" or name == "" then return "" end if
  // 32768 UTF-16 bytes leaves room for the maximum Windows environment variable value.
  buf = bytes(32768, 0)
  n = GetEnvironmentVariableW(name, buf, 16384)
  if typeof(n) != "int" or n <= 0 then return "" end if
  if n >= 16384 then return "" end if
  value = decode16Z(buf)
  if typeof(value) != "string" then return "" end if
  return value
end function

// Resolve the configured API key without exposing it in logs.
function _api_key_result(config)
  key_mode = s.toLowerAscii(s.trim(_config_value(config, "api_key_mode", "env")))
  if key_mode == "direct" then
    direct_key = s.trim(_config_value(config, "api_key", ""))
    if direct_key == "" then return [false, "", "Direct API key is empty."] end if
    return [true, direct_key, ""]
  end if

  key_env = _config_value(config, "api_key_env", "OPENAI_API_KEY")
  api_key = _env_value(key_env)
  if api_key == "" then return [false, "", "Environment variable " + key_env + " is not set."] end if
  return [true, api_key, ""]
end function

function _close_http(handle)
  if handle is void then return end if
  if typeof(handle) == "int" and handle != 0 then WinHttpCloseHandle(handle) end if
end function

function _http_status(request)
  status = bytes(4, 0)
  size = bytes(4, 0)
  _write_u32(size, 0, 4)
  ok = WinHttpQueryHeaders(request, WINHTTP_QUERY_STATUS_CODE | WINHTTP_QUERY_FLAG_NUMBER, void, status, size, void)
  if ok == false then return 0 end if
  return _u32le4(status)
end function

function _read_response_body(request)
  response_builder = sb.StringBuilder.withCapacity(4096)
  while true
    available = bytes(4, 0)
    ok = WinHttpQueryDataAvailable(request, available)
    if ok == false then return [false, response_builder.toString(), "WinHttpQueryDataAvailable failed: " + GetLastError()] end if
    remaining = _u32le4(available)
    if remaining <= 0 then break end if

    while remaining > 0
      take = remaining
      if take > 8192 then take = 8192 end if
      buf = bytes(take, 0)
      read = bytes(4, 0)
      ok = WinHttpReadData(request, buf, take, read)
      if ok == false then return [false, response_builder.toString(), "WinHttpReadData failed: " + GetLastError()] end if
      got = _u32le4(read)
      if got <= 0 then break end if
      part = decode(slice(buf, 0, got), "utf-8")
      if typeof(part) != "string" then part = decode(slice(buf, 0, got)) end if
      if typeof(part) == "string" then response_builder.appendString(part) end if
      remaining = remaining - got
    end while
  end while
  return [true, response_builder.toString(), ""]
end function

function _http_post_json(url, api_key, body, allow_insecure_tls)
  parsed = _parse_url(url)
  if parsed.ok == false then return HttpResult(false, 0, "", parsed.error, parsed.error) end if

  session = void
  connect = void
  request = void
  log = "POST " + parsed.scheme + "://" + parsed.host + ":" + parsed.port + parsed.path

  session = WinHttpOpen("MiniIDE/1.0", WINHTTP_ACCESS_TYPE_DEFAULT_PROXY, void, void, 0)
  if typeof(session) != "int" or session == 0 then return HttpResult(false, 0, "", "WinHttpOpen failed: " + GetLastError(), log) end if

  connect = WinHttpConnect(session, parsed.host, parsed.port, 0)
  if typeof(connect) != "int" or connect == 0 then
    err = "WinHttpConnect failed: " + GetLastError()
    _close_http(session)
    return HttpResult(false, 0, "", err, log)
  end if

  flags = 0
  if parsed.secure then flags = WINHTTP_FLAG_SECURE end if
  request = WinHttpOpenRequest(connect, "POST", parsed.path, void, void, void, flags)
  if typeof(request) != "int" or request == 0 then
    err = "WinHttpOpenRequest failed: " + GetLastError()
    _close_http(connect)
    _close_http(session)
    return HttpResult(false, 0, "", err, log)
  end if

  if parsed.secure and allow_insecure_tls then
    security_flags = bytes(4, 0)
    _write_u32(security_flags, 0, SECURITY_FLAG_IGNORE_UNKNOWN_CA | SECURITY_FLAG_IGNORE_CERT_WRONG_USAGE | SECURITY_FLAG_IGNORE_CERT_CN_INVALID | SECURITY_FLAG_IGNORE_CERT_DATE_INVALID)
    ok_security = WinHttpSetOption(request, WINHTTP_OPTION_SECURITY_FLAGS, security_flags, 4)
    if ok_security == false then
      err = "WinHttpSetOption security flags failed: " + GetLastError()
      _close_http(request)
      _close_http(connect)
      _close_http(session)
      return HttpResult(false, 0, "", err, log)
    end if
    log = log + "\r\nTLS certificate validation: relaxed"
  end if

  headers = "Content-Type: application/json\r\nAccept: application/json\r\nAuthorization: Bearer " + api_key + "\r\n"
  payload = bytes(body)
  ok = WinHttpSendRequest(request, headers, len(headers), payload, len(payload), len(payload), void)
  if ok == false then
    err = "WinHttpSendRequest failed: " + GetLastError()
    _close_http(request)
    _close_http(connect)
    _close_http(session)
    return HttpResult(false, 0, "", err, log)
  end if

  ok = WinHttpReceiveResponse(request, void)
  if ok == false then
    err = "WinHttpReceiveResponse failed: " + GetLastError()
    _close_http(request)
    _close_http(connect)
    _close_http(session)
    return HttpResult(false, 0, "", err, log)
  end if

  status = _http_status(request)
  read_result = _read_response_body(request)
  body_text = read_result[1]
  _close_http(request)
  _close_http(connect)
  _close_http(session)
  if read_result[0] == false then return HttpResult(false, status, body_text, read_result[2], log + "\r\nHTTP " + status) end if
  if status < 200 or status >= 300 then return HttpResult(false, status, body_text, "Provider returned HTTP " + status, log + "\r\nHTTP " + status) end if
  return HttpResult(true, status, body_text, "", log + "\r\nHTTP " + status)
end function

function _json_unescape_char(escaped)
  if escaped == "\"" then return "\"" end if
  if escaped == "\\" then return "\\" end if
  if escaped == "/" then return "/" end if
  if escaped == "b" then return "" end if
  if escaped == "f" then return "" end if
  if escaped == "n" then return "\n" end if
  if escaped == "r" then return "\r" end if
  if escaped == "t" then return "\t" end if
  return escaped
end function

function _parse_json_string_at(text, quote_pos)
  if typeof(text) != "string" or quote_pos < 0 or quote_pos >= len(text) then return "" end if
  if text[quote_pos] != "\"" then return "" end if
  value_builder = sb.StringBuilder.withCapacity(512)
  i = quote_pos + 1
  run_start = i
  while i < len(text)
    ch = text[i]
    if ch == "\"" then
      if i > run_start then value_builder.appendSlice(text, run_start, i - run_start) end if
      return value_builder.toString()
    end if
    if ch == "\\" then
      if i > run_start then value_builder.appendSlice(text, run_start, i - run_start) end if
      i = i + 1
      if i >= len(text) then return value_builder.toString() end if
      esc = text[i]
      if esc == "u" then
        // Keep Unicode escapes visible enough for now without a full codepoint decoder.
        value_builder.appendString("?")
        i = i + 4
      else
        value_builder.appendString(_json_unescape_char(esc))
      end if
      i = i + 1
      run_start = i
      continue
    end if
    i = i + 1
  end while
  return value_builder.toString()
end function

function parse_chat_content(response)
  if typeof(response) != "string" or response == "" then return "" end if
  marker = "\"content\""
  pos = s.indexOf(response, marker, 0)
  while pos >= 0
    colon = s.indexOf(response, ":", pos + len(marker))
    if colon < 0 then return "" end if
    i = colon + 1
    while i < len(response) and (response[i] == " " or response[i] == "\t" or response[i] == "\r" or response[i] == "\n")
      i = i + 1
    end while
    if i < len(response) and response[i] == "\"" then return _parse_json_string_at(response, i) end if
    pos = s.indexOf(response, marker, pos + len(marker))
  end while
  return ""
end function

function _short_text(text, limit)
  if typeof(text) != "string" then return "" end if
  if typeof(limit) != "int" or limit <= 0 then limit = 2000 end if
  if len(text) <= limit then return text end if
  return s.substr(text, 0, limit) + "\r\n... [truncated, " + len(text) + " chars total]"
end function

// Send one OpenAI-compatible chat-completions request through native WinHTTP.
function chat_completion(project_root, config, prompt, context, transcript)
  model = _config_value(config, "model", "gpt-5.1")
  key_result = _api_key_result(config)
  if key_result[0] == false then return ProviderResult(false, key_result[2], "") end if
  api_key = key_result[1]

  url = _chat_url(config)
  body = _request_body(model, prompt, context, transcript)
  result = _http_post_json(url, api_key, body, _config_bool(config, "allow_insecure_tls", false))
  if result.ok == false then
    detail = result.error
    if result.body != "" then detail = detail + "\r\n\r\n" + _short_text(result.body, 4000) end if
    return ProviderResult(false, detail, result.log)
  end if

  content = parse_chat_content(result.body)
  if content == "" then return ProviderResult(false, "Provider response did not contain chat content:\r\n\r\n" + _short_text(result.body, 4000), result.log) end if
  return ProviderResult(true, content, result.log)
end function
