# `src/lang/syntax.ml`

[Home](README.md) · [Files](Files.md)

Provides lang syntax facilities for this project.

Package: [`lang.syntax`](Package-lang-syntax-1463074878.md)

Reachable from entry: **yes**

## Imports

- `std/string.ml` as `s` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-lang-syntax-char-code-function-char-code-ch-src-lang-syntax-ml-860763200"></a>
### _char_code

```ml
function _char_code(ch)
```

Return the byte value for a one-character string.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ch` | `dynamic` | — | ch value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/lang/syntax.ml#L46)

<a id="function-function-lang-syntax-is-alpha-function-is-alpha-ch-src-lang-syntax-ml-1939120672"></a>
### _is_alpha

```ml
function _is_alpha(ch)
```

Return true when a character is an ASCII letter.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ch` | `dynamic` | — | ch value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/lang/syntax.ml#L54)

<a id="function-function-lang-syntax-is-digit-function-is-digit-ch-src-lang-syntax-ml-1876598942"></a>
### _is_digit

```ml
function _is_digit(ch)
```

Return true when a character is an ASCII digit.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ch` | `dynamic` | — | ch value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/lang/syntax.ml#L61)

<a id="function-function-lang-syntax-is-ident-part-function-is-ident-part-ch-src-lang-syntax-ml-191627788"></a>
### _is_ident_part

```ml
function _is_ident_part(ch)
```

Return true when a character can continue a MiniLang identifier.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ch` | `dynamic` | — | ch value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/lang/syntax.ml#L74)

<a id="function-function-lang-syntax-is-ident-start-function-is-ident-start-ch-src-lang-syntax-ml-1761014926"></a>
### _is_ident_start

```ml
function _is_ident_start(ch)
```

Return true when a character can start a MiniLang identifier.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ch` | `dynamic` | — | ch value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/lang/syntax.ml#L68)

<a id="function-function-lang-syntax-is-keyword-function-is-keyword-word-src-lang-syntax-ml-1611168093"></a>
### _is_keyword

```ml
function _is_keyword(word)
```

Return true when a word is a MiniLang keyword.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `word` | `dynamic` | — | word value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/lang/syntax.ml#L80)

<a id="global-global-lang-syntax-keywords-keywords-src-lang-syntax-ml-1651839231"></a>
### _keywords

```ml
_keywords
```

Stores module-wide keywords state for the lang syntax module.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/lang/syntax.ml#L32)

<a id="function-function-lang-syntax-push-seg-function-push-seg-segments-text-kind-src-lang-syntax-ml-1563477006"></a>
### _push_seg

```ml
function _push_seg(segments, text, kind)
```

Append a non-empty syntax segment to the segment list.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `segments` | `dynamic` | — | segments value consumed by this operation. |
| `text` | `dynamic` | — | Text consumed by the operation. |
| `kind` | `dynamic` | — | kind value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/lang/syntax.ml#L92)

<a id="function-function-lang-syntax-keywords-function-keywords-src-lang-syntax-ml-1074472159"></a>
### keywords

```ml
function keywords()
```

Return the MiniLang keywords known by the syntax highlighter.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/lang/syntax.ml#L40)

<a id="function-function-lang-syntax-line-segments-function-line-segments-line-src-lang-syntax-ml-215739463"></a>
### line_segments

```ml
function line_segments(line)
```

Tokenize one MiniLang source line into syntax-highlight segments.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `line` | `dynamic` | — | line value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/lang/syntax.ml#L99)

- [lang.syntax.Segment](Type-lang-syntax-segment-652467537.md) — struct
