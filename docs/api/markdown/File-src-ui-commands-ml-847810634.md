# `src/ui/commands.ml`

[Home](README.md) · [Files](Files.md)

Provides ui commands facilities for this project.

Package: [`ui.commands`](Package-ui-commands-1357230349.md)

Reachable from entry: **yes**

## Imports

- `std/string.ml` as `s` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-ui-commands-acronym-function-acronym-text-src-ui-commands-ml-234553554"></a>
### _acronym

```ml
function _acronym(text)
```

Return a lower-case acronym built from command label word starts.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ui/commands.ml#L35)

<a id="function-function-ui-commands-compact-function-compact-text-src-ui-commands-ml-118218442"></a>
### _compact

```ml
function _compact(text)
```

Return text without spaces and punctuation, lower-cased for fuzzy matching.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ui/commands.ml#L53)

<a id="function-function-ui-commands-is-subsequence-function-is-subsequence-haystack-needle-src-ui-commands-ml-1968023642"></a>
### _is_subsequence

```ml
function _is_subsequence(haystack, needle)
```

Return true when needle characters appear in order inside haystack.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `haystack` | `dynamic` | — | haystack value consumed by this operation. |
| `needle` | `dynamic` | — | needle value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ui/commands.ml#L66)

<a id="function-function-ui-commands-is-word-char-function-is-word-char-ch-src-ui-commands-ml-413860972"></a>
### _is_word_char

```ml
function _is_word_char(ch)
```

Return true when a character belongs to an ASCII command word.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ch` | `dynamic` | — | ch value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ui/commands.ml#L25)

<a id="function-function-ui-commands-labels-function-labels-src-ui-commands-ml-1507719021"></a>
### labels

```ml
function labels()
```

Return the display labels exposed by the command palette.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ui/commands.ml#L80)

<a id="function-function-ui-commands-match-score-function-match-score-labels-search-texts-idx-query-src-ui-commands-ml-593927956"></a>
### match_score

```ml
function match_score(labels, search_texts, idx, query)
```

Return the match score for a command palette entry.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `labels` | `dynamic` | — | labels value consumed by this operation. |
| `search_texts` | `dynamic` | — | search_texts value consumed by this operation. |
| `idx` | `dynamic` | — | idx value consumed by this operation. |
| `query` | `dynamic` | — | query value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ui/commands.ml#L114)

<a id="function-function-ui-commands-matches-function-matches-labels-search-texts-idx-query-src-ui-commands-ml-1135746806"></a>
### matches

```ml
function matches(labels, search_texts, idx, query)
```

Return true when a command palette entry matches the query.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `labels` | `dynamic` | — | labels value consumed by this operation. |
| `search_texts` | `dynamic` | — | search_texts value consumed by this operation. |
| `idx` | `dynamic` | — | idx value consumed by this operation. |
| `query` | `dynamic` | — | query value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ui/commands.ml#L134)

<a id="function-function-ui-commands-pick-function-pick-ids-labels-search-texts-query-selected-src-ui-commands-ml-186237094"></a>
### pick

```ml
function pick(ids, labels, search_texts, query, selected)
```

Return the command selected by query or list selection.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ids` | `dynamic` | — | ids value consumed by this operation. |
| `labels` | `dynamic` | — | labels value consumed by this operation. |
| `search_texts` | `dynamic` | — | search_texts value consumed by this operation. |
| `query` | `dynamic` | — | query value consumed by this operation. |
| `selected` | `dynamic` | — | selected value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ui/commands.ml#L164)

<a id="function-function-ui-commands-ranked-indices-function-ranked-indices-labels-search-texts-query-src-ui-commands-ml-108402627"></a>
### ranked_indices

```ml
function ranked_indices(labels, search_texts, query)
```

Return matching command indices ordered by match strength.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `labels` | `dynamic` | — | labels value consumed by this operation. |
| `search_texts` | `dynamic` | — | search_texts value consumed by this operation. |
| `query` | `dynamic` | — | query value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ui/commands.ml#L142)

<a id="function-function-ui-commands-search-texts-function-search-texts-src-ui-commands-ml-811353021"></a>
### search_texts

```ml
function search_texts()
```

Return additional search aliases for command palette labels.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ui/commands.ml#L95)
