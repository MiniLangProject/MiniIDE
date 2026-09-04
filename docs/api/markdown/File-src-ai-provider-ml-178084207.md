# `src/ai/provider.ml`

[Home](README.md) · [Files](Files.md)

Provides ai provider facilities for this project.

Package: [`ai.provider`](Package-ai-provider-736276914.md)

Reachable from entry: **yes**

## Imports

- `std/string.ml` as `s` → `../MiniLangCompilerML/std/string.ml` — external dependency
- `std/string_builder.ml` as `sb` → `../MiniLangCompilerML/std/string_builder.ml` — external dependency

## Declarations

<a id="function-function-ai-provider-api-key-result-function-api-key-result-config-src-ai-provider-ml-1357558655"></a>
### _api_key_result

```ml
function _api_key_result(config)
```

Resolve the configured API key without exposing it in logs.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `config` | `dynamic` | — | Configuration used by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ai/provider.ml#L410)

<a id="function-function-ai-provider-chat-url-function-chat-url-config-src-ai-provider-ml-767594015"></a>
### _chat_url

```ml
function _chat_url(config)
```

Performs the _chat_url operation for the ai provider module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `config` | `dynamic` | — | Configuration used by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ai/provider.ml#L339)

<a id="function-function-ai-provider-close-http-function-close-http-handle-src-ai-provider-ml-1338463361"></a>
### _close_http

```ml
function _close_http(handle)
```

Closes http owned by the ai provider module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `handle` | `dynamic` | — | Native or runtime handle used by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ai/provider.ml#L426)

<a id="function-function-ai-provider-config-bool-function-config-bool-config-field-fallback-src-ai-provider-ml-9749655"></a>
### _config_bool

```ml
function _config_bool(config, field, fallback)
```

Performs the _config_bool operation for the ai provider module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `config` | `dynamic` | — | Configuration used by the operation. |
| `field` | `dynamic` | — | field value consumed by this operation. |
| `fallback` | `dynamic` | — | Value returned when no explicit result is available. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ai/provider.ml#L320)

<a id="function-function-ai-provider-config-value-function-config-value-config-field-fallback-src-ai-provider-ml-1879287485"></a>
### _config_value

```ml
function _config_value(config, field, fallback)
```

Performs the _config_value operation for the ai provider module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `config` | `dynamic` | — | Configuration used by the operation. |
| `field` | `dynamic` | — | field value consumed by this operation. |
| `fallback` | `dynamic` | — | Value returned when no explicit result is available. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ai/provider.ml#L305)

<a id="function-function-ai-provider-env-value-function-env-value-name-src-ai-provider-ml-2114290784"></a>
### _env_value

```ml
function _env_value(name)
```

Performs the _env_value operation for the ai provider module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Name of the affected item. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ai/provider.ml#L396)

<a id="function-function-ai-provider-find-json-close-function-find-json-close-text-open-pos-open-ch-close-ch-src-ai-provider-ml-1787631581"></a>
### _find_json_close

```ml
function _find_json_close(text, open_pos, open_ch, close_ch)
```

Finds json close used by the ai provider module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed by the operation. |
| `open_pos` | `dynamic` | — | open_pos value consumed by this operation. |
| `open_ch` | `dynamic` | — | open_ch value consumed by this operation. |
| `close_ch` | `dynamic` | — | close_ch value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ai/provider.ml#L616)

<a id="function-function-ai-provider-http-post-json-function-http-post-json-url-api-key-body-allow-insecure-tls-src-ai-provider-ml-1455452804"></a>
### _http_post_json

```ml
function _http_post_json(url, api_key, body, allow_insecure_tls)
```

Performs the _http_post_json operation for the ai provider module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `url` | `dynamic` | — | url value consumed by this operation. |
| `api_key` | `dynamic` | — | api_key value consumed by this operation. |
| `body` | `dynamic` | — | body value consumed by this operation. |
| `allow_insecure_tls` | `dynamic` | — | allow_insecure_tls value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ai/provider.ml#L476)

<a id="function-function-ai-provider-http-status-function-http-status-request-src-ai-provider-ml-1292696670"></a>
### _http_status

```ml
function _http_status(request)
```

Performs the _http_status operation for the ai provider module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `request` | `dynamic` | — | request value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ai/provider.ml#L433)

<a id="function-function-ai-provider-json-field-array-function-json-field-array-text-field-src-ai-provider-ml-1752461218"></a>
### _json_field_array

```ml
function _json_field_array(text, field)
```

Performs the _json_field_array operation for the ai provider module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed by the operation. |
| `field` | `dynamic` | — | field value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ai/provider.ml#L688)

<a id="function-function-ai-provider-json-field-object-function-json-field-object-text-field-src-ai-provider-ml-2110787194"></a>
### _json_field_object

```ml
function _json_field_object(text, field)
```

Performs the _json_field_object operation for the ai provider module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed by the operation. |
| `field` | `dynamic` | — | field value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ai/provider.ml#L667)

<a id="function-function-ai-provider-json-unescape-char-function-json-unescape-char-escaped-src-ai-provider-ml-2135545564"></a>
### _json_unescape_char

```ml
function _json_unescape_char(escaped)
```

Performs the _json_unescape_char operation for the ai provider module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `escaped` | `dynamic` | — | escaped value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ai/provider.ml#L552)

<a id="function-function-ai-provider-last-index-of-function-last-index-of-text-ch-before-src-ai-provider-ml-67430620"></a>
### _last_index_of

```ml
function _last_index_of(text, ch, before)
```

Return the last index of a character in a string.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed by the operation. |
| `ch` | `dynamic` | — | ch value consumed by this operation. |
| `before` | `dynamic` | — | before value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ai/provider.ml#L202)

<a id="function-function-ai-provider-parse-json-string-at-function-parse-json-string-at-text-quote-pos-src-ai-provider-ml-619859293"></a>
### _parse_json_string_at

```ml
function _parse_json_string_at(text, quote_pos)
```

Parses json string at for the ai provider workflow.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed by the operation. |
| `quote_pos` | `dynamic` | — | quote_pos value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ai/provider.ml#L567)

<a id="function-function-ai-provider-parse-url-function-parse-url-url-src-ai-provider-ml-919201054"></a>
### _parse_url

```ml
function _parse_url(url)
```

Parses url for the ai provider workflow.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `url` | `dynamic` | — | url value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ai/provider.ml#L349)

<a id="function-function-ai-provider-read-response-body-function-read-response-body-request-src-ai-provider-ml-816382882"></a>
### _read_response_body

```ml
function _read_response_body(request)
```

Reads response body for the ai provider workflow.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `request` | `dynamic` | — | request value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ai/provider.ml#L444)

<a id="function-function-ai-provider-request-body-function-request-body-model-config-prompt-context-transcript-tool-results-include-tools-src-ai-provider-ml-656593570"></a>
### _request_body

```ml
function _request_body(model, config, prompt, context, transcript, tool_results, include_tools)
```

Performs the _request_body operation for the ai provider module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `model` | `dynamic` | — | model value consumed by this operation. |
| `config` | `dynamic` | — | Configuration used by the operation. |
| `prompt` | `dynamic` | — | prompt value consumed by this operation. |
| `context` | `dynamic` | — | Context that carries state for the operation. |
| `transcript` | `dynamic` | — | transcript value consumed by this operation. |
| `tool_results` | `dynamic` | — | tool_results value consumed by this operation. |
| `include_tools` | `dynamic` | — | include_tools value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ai/provider.ml#L280)

<a id="function-function-ai-provider-rstrip-slashes-function-rstrip-slashes-text-src-ai-provider-ml-1115769106"></a>
### _rstrip_slashes

```ml
function _rstrip_slashes(text)
```

Performs the _rstrip_slashes operation for the ai provider module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ai/provider.ml#L329)

<a id="function-function-ai-provider-short-text-function-short-text-text-limit-src-ai-provider-ml-1484199947"></a>
### _short_text

```ml
function _short_text(text, limit)
```

Performs the _short_text operation for the ai provider module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed by the operation. |
| `limit` | `dynamic` | — | limit value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ai/provider.ml#L752)

<a id="function-function-ai-provider-skip-json-ws-function-skip-json-ws-text-pos-src-ai-provider-ml-428885972"></a>
### _skip_json_ws

```ml
function _skip_json_ws(text, pos)
```

Performs the _skip_json_ws operation for the ai provider module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed by the operation. |
| `pos` | `dynamic` | — | pos value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ai/provider.ml#L603)

<a id="function-function-ai-provider-system-prompt-function-system-prompt-config-src-ai-provider-ml-1332759105"></a>
### _system_prompt

```ml
function _system_prompt(config)
```

Performs the _system_prompt operation for the ai provider module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `config` | `dynamic` | — | Configuration used by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ai/provider.ml#L236)

<a id="function-function-ai-provider-tool-schema-json-function-tool-schema-json-config-src-ai-provider-ml-634524397"></a>
### _tool_schema_json

```ml
function _tool_schema_json(config)
```

Performs the _tool_schema_json operation for the ai provider module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `config` | `dynamic` | — | Configuration used by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ai/provider.ml#L252)

<a id="function-function-ai-provider-u32le4-function-u32le4-buf-src-ai-provider-ml-398858038"></a>
### _u32le4

```ml
function _u32le4(buf)
```

Read an unsigned 32-bit value from a little-endian byte buffer.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `buf` | `dynamic` | — | buf value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ai/provider.ml#L193)

<a id="function-function-ai-provider-write-tools-enabled-function-write-tools-enabled-config-src-ai-provider-ml-1929684389"></a>
### _write_tools_enabled

```ml
function _write_tools_enabled(config)
```

Writes tools enabled for the ai provider workflow.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `config` | `dynamic` | — | Configuration used by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ai/provider.ml#L227)

<a id="function-function-ai-provider-write-u32-function-write-u32-buf-off-value-src-ai-provider-ml-880223884"></a>
### _write_u32

```ml
function _write_u32(buf, off, value)
```

Writes an unsigned 32-bit value into an HTTP provider buffer.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `buf` | `dynamic` | — | buf value consumed by this operation. |
| `off` | `dynamic` | — | off value consumed by this operation. |
| `value` | `dynamic` | — | Value consumed or transformed by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ai/provider.ml#L183)

<a id="function-function-ai-provider-chat-completion-function-chat-completion-project-root-config-prompt-context-transcript-tool-results-include-tools-src-ai-provider-ml-1888544053"></a>
### chat_completion

```ml
function chat_completion(project_root, config, prompt, context, transcript, tool_results, include_tools)
```

Send one OpenAI-compatible chat-completions request through native WinHTTP.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `project_root` | `dynamic` | — | project_root value consumed by this operation. |
| `config` | `dynamic` | — | Configuration used by the operation. |
| `prompt` | `dynamic` | — | prompt value consumed by this operation. |
| `context` | `dynamic` | — | Context that carries state for the operation. |
| `transcript` | `dynamic` | — | transcript value consumed by this operation. |
| `tool_results` | `dynamic` | — | tool_results value consumed by this operation. |
| `include_tools` | `dynamic` | — | include_tools value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ai/provider.ml#L767)

<a id="extern_function-extern-function-ai-provider-getenvironmentvariablew-extern-function-getenvironmentvariablew-name-as-wstr-buffer-as-buffer-size-as-u32-from-kernel32-dll-symbol-getenvironmentvariablew-returns-u32-src-ai-provider-ml-343960555"></a>
### GetEnvironmentVariableW

```ml
extern function GetEnvironmentVariableW(name as wstr, buffer as buffer, size as u32) from "kernel32.dll" symbol "GetEnvironmentVariableW" returns u32
```

Invokes the native GetEnvironmentVariableW entry point used by the ai provider module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `wstr` | — | Name of the affected item. |
| `buffer` | `buffer` | — | Buffer that receives or supplies the operation data. |
| `size` | `u32` | — | Size in the units required by the operation. |


**Returns:** Native u32 result produced by the call.

[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ai/provider.ml#L101)

<a id="extern_function-extern-function-ai-provider-getlasterror-extern-function-getlasterror-from-kernel32-dll-returns-u32-src-ai-provider-ml-1173709987"></a>
### GetLastError

```ml
extern function GetLastError() from "kernel32.dll" returns u32
```

Invokes the native GetLastError entry point used by the ai provider module.


**Returns:** Native u32 result produced by the call.

[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ai/provider.ml#L104)

- [ai.provider.HttpResult](Type-ai-provider-httpresult-567148605.md) — struct
- [ai.provider.HttpUrl](Type-ai-provider-httpurl-1648467133.md) — struct
<a id="function-function-ai-provider-json-escape-function-json-escape-text-src-ai-provider-ml-843118188"></a>
### json_escape

```ml
function json_escape(text)
```

Escape text for a JSON string literal.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ai/provider.ml#L215)

<a id="function-function-ai-provider-json-field-string-function-json-field-string-text-field-src-ai-provider-ml-1893797196"></a>
### json_field_string

```ml
function json_field_string(text, field)
```

Performs the json_field_string operation for the ai provider module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed by the operation. |
| `field` | `dynamic` | — | field value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ai/provider.ml#L650)

<a id="function-function-ai-provider-parse-chat-content-function-parse-chat-content-response-src-ai-provider-ml-1621574084"></a>
### parse_chat_content

```ml
function parse_chat_content(response)
```

Parses chat content for the ai provider workflow.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `response` | `dynamic` | — | response value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ai/provider.ml#L732)

<a id="function-function-ai-provider-parse-tool-calls-function-parse-tool-calls-response-src-ai-provider-ml-2110867488"></a>
### parse_tool_calls

```ml
function parse_tool_calls(response)
```

Parses tool calls for the ai provider workflow.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `response` | `dynamic` | — | response value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ai/provider.ml#L708)

- [ai.provider.ProviderResult](Type-ai-provider-providerresult-962181424.md) — struct
<a id="constant-constant-ai-provider-security-flag-ignore-cert-cn-invalid-const-security-flag-ignore-cert-cn-invalid-4096-src-ai-provider-ml-1061786811"></a>
### SECURITY_FLAG_IGNORE_CERT_CN_INVALID

```ml
const SECURITY_FLAG_IGNORE_CERT_CN_INVALID = 4096
```

Defines the security flag ignore cert cn invalid constant used by the ai provider module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ai/provider.ml#L121)

<a id="constant-constant-ai-provider-security-flag-ignore-cert-date-invalid-const-security-flag-ignore-cert-date-invalid-8192-src-ai-provider-ml-1582389284"></a>
### SECURITY_FLAG_IGNORE_CERT_DATE_INVALID

```ml
const SECURITY_FLAG_IGNORE_CERT_DATE_INVALID = 8192
```

Defines the security flag ignore cert date invalid constant used by the ai provider module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ai/provider.ml#L123)

<a id="constant-constant-ai-provider-security-flag-ignore-cert-wrong-usage-const-security-flag-ignore-cert-wrong-usage-512-src-ai-provider-ml-459057222"></a>
### SECURITY_FLAG_IGNORE_CERT_WRONG_USAGE

```ml
const SECURITY_FLAG_IGNORE_CERT_WRONG_USAGE = 512
```

Defines the security flag ignore cert wrong usage constant used by the ai provider module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ai/provider.ml#L119)

<a id="constant-constant-ai-provider-security-flag-ignore-unknown-ca-const-security-flag-ignore-unknown-ca-256-src-ai-provider-ml-1522937005"></a>
### SECURITY_FLAG_IGNORE_UNKNOWN_CA

```ml
const SECURITY_FLAG_IGNORE_UNKNOWN_CA = 256
```

Defines the security flag ignore unknown ca constant used by the ai provider module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ai/provider.ml#L117)

- [ai.provider.ToolCall](Type-ai-provider-toolcall-1373709394.md) — struct
<a id="constant-constant-ai-provider-winhttp-access-type-default-proxy-const-winhttp-access-type-default-proxy-0-src-ai-provider-ml-817384030"></a>
### WINHTTP_ACCESS_TYPE_DEFAULT_PROXY

```ml
const WINHTTP_ACCESS_TYPE_DEFAULT_PROXY = 0
```

Defines the winhttp access type default proxy constant used by the ai provider module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ai/provider.ml#L107)

<a id="constant-constant-ai-provider-winhttp-flag-secure-const-winhttp-flag-secure-8388608-src-ai-provider-ml-192516297"></a>
### WINHTTP_FLAG_SECURE

```ml
const WINHTTP_FLAG_SECURE = 8388608
```

Defines the winhttp flag secure constant used by the ai provider module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ai/provider.ml#L109)

<a id="constant-constant-ai-provider-winhttp-option-security-flags-const-winhttp-option-security-flags-31-src-ai-provider-ml-425840114"></a>
### WINHTTP_OPTION_SECURITY_FLAGS

```ml
const WINHTTP_OPTION_SECURITY_FLAGS = 31
```

Defines the winhttp option security flags constant used by the ai provider module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ai/provider.ml#L111)

<a id="constant-constant-ai-provider-winhttp-query-flag-number-const-winhttp-query-flag-number-536870912-src-ai-provider-ml-387339447"></a>
### WINHTTP_QUERY_FLAG_NUMBER

```ml
const WINHTTP_QUERY_FLAG_NUMBER = 536870912
```

Defines the winhttp query flag number constant used by the ai provider module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ai/provider.ml#L115)

<a id="constant-constant-ai-provider-winhttp-query-status-code-const-winhttp-query-status-code-19-src-ai-provider-ml-1987788892"></a>
### WINHTTP_QUERY_STATUS_CODE

```ml
const WINHTTP_QUERY_STATUS_CODE = 19
```

Defines the winhttp query status code constant used by the ai provider module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ai/provider.ml#L113)

<a id="extern_function-extern-function-ai-provider-winhttpclosehandle-extern-function-winhttpclosehandle-handle-as-ptr-from-winhttp-dll-returns-bool-src-ai-provider-ml-1510859011"></a>
### WinHttpCloseHandle

```ml
extern function WinHttpCloseHandle(handle as ptr) from "winhttp.dll" returns bool
```

Invokes the native WinHttpCloseHandle entry point used by the ai provider module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `handle` | `ptr` | — | Native or runtime handle used by the operation. |


**Returns:** Native bool result produced by the call.

[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ai/provider.ml#L95)

<a id="extern_function-extern-function-ai-provider-winhttpconnect-extern-function-winhttpconnect-session-as-ptr-servername-as-wstr-serverport-as-int-reserved-as-u32-from-winhttp-dll-returns-ptr-src-ai-provider-ml-737991244"></a>
### WinHttpConnect

```ml
extern function WinHttpConnect(session as ptr, serverName as wstr, serverPort as int, reserved as u32) from "winhttp.dll" returns ptr
```

Invokes the native WinHttpConnect entry point used by the ai provider module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `session` | `ptr` | — | session value consumed by this operation. |
| `serverName` | `wstr` | — | serverName value consumed by this operation. |
| `serverPort` | `int` | — | serverPort value consumed by this operation. |
| `reserved` | `u32` | — | reserved value consumed by this operation. |


**Returns:** Native ptr result produced by the call.

[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ai/provider.ml#L38)

<a id="extern_function-extern-function-ai-provider-winhttpopen-extern-function-winhttpopen-agent-as-wstr-accesstype-as-int-proxyname-as-ptr-proxybypass-as-ptr-flags-as-u32-from-winhttp-dll-returns-ptr-src-ai-provider-ml-543643643"></a>
### WinHttpOpen

```ml
extern function WinHttpOpen(agent as wstr, accessType as int, proxyName as ptr, proxyBypass as ptr, flags as u32) from "winhttp.dll" returns ptr
```

Invokes the native WinHttpOpen entry point used by the ai provider module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `agent` | `wstr` | — | agent value consumed by this operation. |
| `accessType` | `int` | — | accessType value consumed by this operation. |
| `proxyName` | `ptr` | — | proxyName value consumed by this operation. |
| `proxyBypass` | `ptr` | — | proxyBypass value consumed by this operation. |
| `flags` | `u32` | — | Bit flags controlling the operation. |


**Returns:** Native ptr result produced by the call.

[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ai/provider.ml#L31)

<a id="extern_function-extern-function-ai-provider-winhttpopenrequest-extern-function-winhttpopenrequest-connect-as-ptr-verb-as-wstr-objectname-as-wstr-version-as-ptr-referrer-as-ptr-accepttypes-as-ptr-flags-as-u32-from-winhttp-dll-returns-ptr-src-ai-provider-ml-1685871717"></a>
### WinHttpOpenRequest

```ml
extern function WinHttpOpenRequest(connect as ptr, verb as wstr, objectName as wstr, version as ptr, referrer as ptr, acceptTypes as ptr, flags as u32) from "winhttp.dll" returns ptr
```

Invokes the native WinHttpOpenRequest entry point used by the ai provider module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `connect` | `ptr` | — | connect value consumed by this operation. |
| `verb` | `wstr` | — | verb value consumed by this operation. |
| `objectName` | `wstr` | — | objectName value consumed by this operation. |
| `version` | `ptr` | — | version value consumed by this operation. |
| `referrer` | `ptr` | — | referrer value consumed by this operation. |
| `acceptTypes` | `ptr` | — | acceptTypes value consumed by this operation. |
| `flags` | `u32` | — | Bit flags controlling the operation. |


**Returns:** Native ptr result produced by the call.

[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ai/provider.ml#L48)

<a id="extern_function-extern-function-ai-provider-winhttpquerydataavailable-extern-function-winhttpquerydataavailable-request-as-ptr-bytesavailable-as-bytes-from-winhttp-dll-returns-bool-src-ai-provider-ml-290385349"></a>
### WinHttpQueryDataAvailable

```ml
extern function WinHttpQueryDataAvailable(request as ptr, bytesAvailable as bytes) from "winhttp.dll" returns bool
```

Invokes the native WinHttpQueryDataAvailable entry point used by the ai provider module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `request` | `ptr` | — | request value consumed by this operation. |
| `bytesAvailable` | `bytes` | — | bytesAvailable value consumed by this operation. |


**Returns:** Native bool result produced by the call.

[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ai/provider.ml#L84)

<a id="extern_function-extern-function-ai-provider-winhttpqueryheaders-extern-function-winhttpqueryheaders-request-as-ptr-infolevel-as-u32-name-as-ptr-buffer-as-bytes-bufferlength-as-bytes-index-as-ptr-from-winhttp-dll-returns-bool-src-ai-provider-ml-365464287"></a>
### WinHttpQueryHeaders

```ml
extern function WinHttpQueryHeaders(request as ptr, infoLevel as u32, name as ptr, buffer as bytes, bufferLength as bytes, index as ptr) from "winhttp.dll" returns bool
```

Invokes the native WinHttpQueryHeaders entry point used by the ai provider module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `request` | `ptr` | — | request value consumed by this operation. |
| `infoLevel` | `u32` | — | infoLevel value consumed by this operation. |
| `name` | `ptr` | — | Name of the affected item. |
| `buffer` | `bytes` | — | Buffer that receives or supplies the operation data. |
| `bufferLength` | `bytes` | — | bufferLength value consumed by this operation. |
| `index` | `ptr` | — | Zero-based index of the affected item. |


**Returns:** Native bool result produced by the call.

[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ai/provider.ml#L79)

<a id="extern_function-extern-function-ai-provider-winhttpreaddata-extern-function-winhttpreaddata-request-as-ptr-buffer-as-bytes-bytestoread-as-u32-bytesread-as-bytes-from-winhttp-dll-returns-bool-src-ai-provider-ml-1479587127"></a>
### WinHttpReadData

```ml
extern function WinHttpReadData(request as ptr, buffer as bytes, bytesToRead as u32, bytesRead as bytes) from "winhttp.dll" returns bool
```

Invokes the native WinHttpReadData entry point used by the ai provider module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `request` | `ptr` | — | request value consumed by this operation. |
| `buffer` | `bytes` | — | Buffer that receives or supplies the operation data. |
| `bytesToRead` | `u32` | — | bytesToRead value consumed by this operation. |
| `bytesRead` | `bytes` | — | bytesRead value consumed by this operation. |


**Returns:** Native bool result produced by the call.

[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ai/provider.ml#L91)

<a id="extern_function-extern-function-ai-provider-winhttpreceiveresponse-extern-function-winhttpreceiveresponse-request-as-ptr-reserved-as-ptr-from-winhttp-dll-returns-bool-src-ai-provider-ml-725102286"></a>
### WinHttpReceiveResponse

```ml
extern function WinHttpReceiveResponse(request as ptr, reserved as ptr) from "winhttp.dll" returns bool
```

Invokes the native WinHttpReceiveResponse entry point used by the ai provider module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `request` | `ptr` | — | request value consumed by this operation. |
| `reserved` | `ptr` | — | reserved value consumed by this operation. |


**Returns:** Native bool result produced by the call.

[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ai/provider.ml#L63)

<a id="extern_function-extern-function-ai-provider-winhttpsendrequest-extern-function-winhttpsendrequest-request-as-ptr-headers-as-wstr-headerslength-as-u32-optional-as-bytes-optionallength-as-u32-totallength-as-u32-context-as-ptr-from-winhttp-dll-returns-bool-src-ai-provider-ml-73140904"></a>
### WinHttpSendRequest

```ml
extern function WinHttpSendRequest(request as ptr, headers as wstr, headersLength as u32, optional as bytes, optionalLength as u32, totalLength as u32, context as ptr) from "winhttp.dll" returns bool
```

Invokes the native WinHttpSendRequest entry point used by the ai provider module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `request` | `ptr` | — | request value consumed by this operation. |
| `headers` | `wstr` | — | headers value consumed by this operation. |
| `headersLength` | `u32` | — | headersLength value consumed by this operation. |
| `optional` | `bytes` | — | optional value consumed by this operation. |
| `optionalLength` | `u32` | — | optionalLength value consumed by this operation. |
| `totalLength` | `u32` | — | totalLength value consumed by this operation. |
| `context` | `ptr` | — | Context that carries state for the operation. |


**Returns:** Native bool result produced by the call.

[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ai/provider.ml#L58)

<a id="extern_function-extern-function-ai-provider-winhttpsetoption-extern-function-winhttpsetoption-handle-as-ptr-option-as-u32-buffer-as-bytes-bufferlength-as-u32-from-winhttp-dll-returns-bool-src-ai-provider-ml-1404857025"></a>
### WinHttpSetOption

```ml
extern function WinHttpSetOption(handle as ptr, option as u32, buffer as bytes, bufferLength as u32) from "winhttp.dll" returns bool
```

Invokes the native WinHttpSetOption entry point used by the ai provider module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `handle` | `ptr` | — | Native or runtime handle used by the operation. |
| `option` | `u32` | — | option value consumed by this operation. |
| `buffer` | `bytes` | — | Buffer that receives or supplies the operation data. |
| `bufferLength` | `u32` | — | bufferLength value consumed by this operation. |


**Returns:** Native bool result produced by the call.

[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ai/provider.ml#L70)
