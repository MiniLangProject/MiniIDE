# `src/lang/service.ml`

[Home](README.md) · [Files](Files.md)

Provides lang service facilities for this project.

Package: [`lang.service`](Package-lang-service-1912945424.md)

Reachable from entry: **yes**

## Imports

- `lang/index.ml` as `lang_index` → [src/lang/index.ml](File-src-lang-index-ml-680000828.md)
- `lang/syntax.ml` as `syntax` → [src/lang/syntax.ml](File-src-lang-syntax-ml-2103667443.md)
- `std/fs.ml` as `fs` → `../MiniLangCompilerML/std/fs.ml` — external dependency
- `std/string.ml` as `s` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-lang-service-add-completion-function-add-completion-items-label-insert-text-kind-file-line-prefix-limit-src-lang-service-ml-24309713"></a>
### _add_completion

```ml
function _add_completion(items, label, insert_text, kind, file, line, prefix, limit)
```

Add a completion item.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `items` | `dynamic` | — | Items consumed or updated by the operation. |
| `label` | `dynamic` | — | label value consumed by this operation. |
| `insert_text` | `dynamic` | — | insert_text value consumed by this operation. |
| `kind` | `dynamic` | — | kind value consumed by this operation. |
| `file` | `dynamic` | — | file value consumed by this operation. |
| `line` | `dynamic` | — | line value consumed by this operation. |
| `prefix` | `dynamic` | — | prefix value consumed by this operation. |
| `limit` | `dynamic` | — | limit value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/lang/service.ml#L404)

<a id="function-function-lang-service-add-duplicate-declaration-inspections-function-add-duplicate-declaration-inspections-items-idx-limit-src-lang-service-ml-1153623217"></a>
### _add_duplicate_declaration_inspections

```ml
function _add_duplicate_declaration_inspections(items, idx, limit)
```

Add duplicate-declaration inspection findings.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `items` | `dynamic` | — | Items consumed or updated by the operation. |
| `idx` | `dynamic` | — | idx value consumed by this operation. |
| `limit` | `dynamic` | — | limit value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/lang/service.ml#L1244)

<a id="function-function-lang-service-add-test-item-function-add-test-item-items-name-kind-file-line-status-src-lang-service-ml-1733148742"></a>
### _add_test_item

```ml
function _add_test_item(items, name, kind, file, line, status)
```

Add a test item once.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `items` | `dynamic` | — | Items consumed or updated by the operation. |
| `name` | `dynamic` | — | Name of the affected item. |
| `kind` | `dynamic` | — | kind value consumed by this operation. |
| `file` | `dynamic` | — | file value consumed by this operation. |
| `line` | `dynamic` | — | line value consumed by this operation. |
| `status` | `dynamic` | — | status value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/lang/service.ml#L819)

<a id="function-function-lang-service-compact-query-text-function-compact-query-text-value-src-lang-service-ml-637474462"></a>
### _compact_query_text

```ml
function _compact_query_text(value)
```

Return compact lower-case text for fuzzy matching.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value consumed or transformed by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/lang/service.ml#L354)

<a id="function-function-lang-service-declaration-col-function-declaration-col-raw-name-src-lang-service-ml-899524804"></a>
### _declaration_col

```ml
function _declaration_col(raw, name)
```

Return a 1-based column for a declaration name.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `raw` | `dynamic` | — | raw value consumed by this operation. |
| `name` | `dynamic` | — | Name of the affected item. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/lang/service.ml#L297)

<a id="function-function-lang-service-declarations-for-file-function-declarations-for-file-file-src-lang-service-ml-2088563001"></a>
### _declarations_for_file

```ml
function _declarations_for_file(file)
```

Return declaration-like symbols from a source file for inspections.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `file` | `dynamic` | — | file value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/lang/service.ml#L1167)

<a id="function-function-lang-service-file-stem-function-file-stem-path-src-lang-service-ml-1136808830"></a>
### _file_stem

```ml
function _file_stem(path)
```

Return a lower-case file stem without extension.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `dynamic` | — | Path of the file or directory used by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/lang/service.ml#L776)

<a id="function-function-lang-service-find-word-function-find-word-line-word-start-src-lang-service-ml-1095589145"></a>
### _find_word

```ml
function _find_word(line, word, start)
```

Find the next whole-word occurrence in a line.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `line` | `dynamic` | — | line value consumed by this operation. |
| `word` | `dynamic` | — | word value consumed by this operation. |
| `start` | `dynamic` | — | start value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/lang/service.ml#L308)

<a id="function-function-lang-service-has-completion-function-has-completion-items-label-src-lang-service-ml-516389585"></a>
### _has_completion

```ml
function _has_completion(items, label)
```

Return true when the completion item already exists.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `items` | `dynamic` | — | Items consumed or updated by the operation. |
| `label` | `dynamic` | — | label value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/lang/service.ml#L333)

<a id="function-function-lang-service-has-declaration-name-function-has-declaration-name-items-name-src-lang-service-ml-1881915494"></a>
### _has_declaration_name

```ml
function _has_declaration_name(items, name)
```

Return true when a declaration name has already been seen.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `items` | `dynamic` | — | Items consumed or updated by the operation. |
| `name` | `dynamic` | — | Name of the affected item. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/lang/service.ml#L1230)

<a id="function-function-lang-service-has-test-item-function-has-test-item-items-name-file-line-src-lang-service-ml-1709362210"></a>
### _has_test_item

```ml
function _has_test_item(items, name, file, line)
```

Return true when a test item is already present.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `items` | `dynamic` | — | Items consumed or updated by the operation. |
| `name` | `dynamic` | — | Name of the affected item. |
| `file` | `dynamic` | — | file value consumed by this operation. |
| `line` | `dynamic` | — | line value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/lang/service.ml#L802)

<a id="function-function-lang-service-has-text-function-has-text-items-value-src-lang-service-ml-1972179086"></a>
### _has_text

```ml
function _has_text(items, value)
```

Return true when a string array contains a value.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `items` | `dynamic` | — | Items consumed or updated by the operation. |
| `value` | `dynamic` | — | Value consumed or transformed by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/lang/service.ml#L589)

<a id="function-function-lang-service-import-alias-used-function-import-alias-used-file-alias-import-line-src-lang-service-ml-131885721"></a>
### _import_alias_used

```ml
function _import_alias_used(file, alias, import_line)
```

Return true when an import alias is used outside import declarations.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `file` | `dynamic` | — | file value consumed by this operation. |
| `alias` | `dynamic` | — | alias value consumed by this operation. |
| `import_line` | `dynamic` | — | import_line value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/lang/service.ml#L1148)

<a id="function-function-lang-service-is-abs-path-function-is-abs-path-path-src-lang-service-ml-518013358"></a>
### _is_abs_path

```ml
function _is_abs_path(path)
```

Return true when the path is absolute on Windows.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `dynamic` | — | Path of the file or directory used by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/lang/service.ml#L755)

<a id="function-function-lang-service-is-identifier-char-function-is-identifier-char-ch-src-lang-service-ml-1357713454"></a>
### _is_identifier_char

```ml
function _is_identifier_char(ch)
```

Return true when a character can continue a simple identifier.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ch` | `dynamic` | — | ch value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/lang/service.ml#L248)

<a id="function-function-lang-service-is-identifier-start-function-is-identifier-start-ch-src-lang-service-ml-602087278"></a>
### _is_identifier_start

```ml
function _is_identifier_start(ch)
```

Return true when a character can start a simple identifier.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ch` | `dynamic` | — | ch value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/lang/service.ml#L237)

<a id="function-function-lang-service-is-query-subsequence-function-is-query-subsequence-haystack-needle-src-lang-service-ml-504485640"></a>
### _is_query_subsequence

```ml
function _is_query_subsequence(haystack, needle)
```

Return true when needle appears as an ordered compact subsequence.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `haystack` | `dynamic` | — | haystack value consumed by this operation. |
| `needle` | `dynamic` | — | needle value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/lang/service.ml#L367)

<a id="function-function-lang-service-is-simple-identifier-function-is-simple-identifier-name-src-lang-service-ml-1014522174"></a>
### _is_simple_identifier

```ml
function _is_simple_identifier(name)
```

Return true when the requested rename target is a simple MiniLang identifier.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Name of the affected item. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/lang/service.ml#L258)

<a id="function-function-lang-service-is-test-path-function-is-test-path-path-src-lang-service-ml-656582606"></a>
### _is_test_path

```ml
function _is_test_path(path)
```

Return true when a file path should be treated as test-related.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `dynamic` | — | Path of the file or directory used by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/lang/service.ml#L829)

<a id="function-function-lang-service-is-test-symbol-function-is-test-symbol-name-src-lang-service-ml-26249496"></a>
### _is_test_symbol

```ml
function _is_test_symbol(name)
```

Return true when a symbol name looks like a test.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Name of the affected item. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/lang/service.ml#L837)

<a id="function-function-lang-service-is-word-char-function-is-word-char-ch-src-lang-service-ml-246911452"></a>
### _is_word_char

```ml
function _is_word_char(ch)
```

Return true when a character belongs to an identifier-like word.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ch` | `dynamic` | — | ch value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/lang/service.ml#L226)

<a id="function-function-lang-service-join-path-function-join-path-root-path-src-lang-service-ml-939156386"></a>
### _join_path

```ml
function _join_path(root, path)
```

Join a project root and relative path.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `root` | `dynamic` | — | root value consumed by this operation. |
| `path` | `dynamic` | — | Path of the file or directory used by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/lang/service.ml#L765)

<a id="function-function-lang-service-line-uses-import-alias-function-line-uses-import-alias-line-alias-src-lang-service-ml-1408189035"></a>
### _line_uses_import_alias

```ml
function _line_uses_import_alias(line, alias)
```

Return true when an import alias is used in a source line.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `line` | `dynamic` | — | line value consumed by this operation. |
| `alias` | `dynamic` | — | alias value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/lang/service.ml#L1126)

<a id="function-function-lang-service-matches-prefix-function-matches-prefix-label-prefix-src-lang-service-ml-1614186871"></a>
### _matches_prefix

```ml
function _matches_prefix(label, prefix)
```

Return true when a label matches the requested prefix.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `label` | `dynamic` | — | label value consumed by this operation. |
| `prefix` | `dynamic` | — | prefix value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/lang/service.ml#L346)

<a id="function-function-lang-service-query-score-function-query-score-label-query-src-lang-service-ml-238113337"></a>
### _query_score

```ml
function _query_score(label, query)
```

Return a match score for ranked project navigation.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `label` | `dynamic` | — | label value consumed by this operation. |
| `query` | `dynamic` | — | query value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/lang/service.ml#L383)

<a id="function-function-lang-service-replace-word-in-line-function-replace-word-in-line-line-word-new-name-src-lang-service-ml-1522200639"></a>
### _replace_word_in_line

```ml
function _replace_word_in_line(line, word, new_name)
```

Return a line with whole-word replacements outside line comments.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `line` | `dynamic` | — | line value consumed by this operation. |
| `word` | `dynamic` | — | word value consumed by this operation. |
| `new_name` | `dynamic` | — | new_name value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/lang/service.ml#L1015)

<a id="function-function-lang-service-replace-word-in-text-function-replace-word-in-text-text-word-new-name-src-lang-service-ml-1301223170"></a>
### _replace_word_in_text

```ml
function _replace_word_in_text(text, word, new_name)
```

Return a source text with whole-word replacements outside line comments.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed by the operation. |
| `word` | `dynamic` | — | word value consumed by this operation. |
| `new_name` | `dynamic` | — | new_name value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/lang/service.ml#L1040)

<a id="function-function-lang-service-strip-line-comment-function-strip-line-comment-line-src-lang-service-ml-1269545373"></a>
### _strip_line_comment

```ml
function _strip_line_comment(line)
```

Strip a simple line comment before lexical searches.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `line` | `dynamic` | — | line value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/lang/service.ml#L269)

<a id="function-function-lang-service-take-word-function-take-word-text-start-src-lang-service-ml-1622021372"></a>
### _take_word

```ml
function _take_word(text, start)
```

Read an identifier-like word at the requested position.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed by the operation. |
| `start` | `dynamic` | — | start value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/lang/service.ml#L279)

<a id="function-function-lang-service-analyze-project-function-analyze-project-project-src-lang-service-ml-414889232"></a>
### analyze_project

```ml
function analyze_project(project)
```

Analyze a project and return the reusable language snapshot.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `project` | `dynamic` | — | project value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/lang/service.ml#L326)

<a id="function-function-lang-service-apply-rename-function-apply-rename-snapshot-word-new-name-limit-src-lang-service-ml-1667513802"></a>
### apply_rename

```ml
function apply_rename(snapshot, word, new_name, limit)
```

Apply a project-wide symbol rename to source files.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `snapshot` | `dynamic` | — | snapshot value consumed by this operation. |
| `word` | `dynamic` | — | word value consumed by this operation. |
| `new_name` | `dynamic` | — | new_name value consumed by this operation. |
| `limit` | `dynamic` | — | limit value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/lang/service.ml#L1061)

<a id="function-function-lang-service-call-hierarchy-items-function-call-hierarchy-items-snapshot-word-limit-src-lang-service-ml-1305248162"></a>
### call_hierarchy_items

```ml
function call_hierarchy_items(snapshot, word, limit)
```

Return a simple call hierarchy for a symbol-like word.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `snapshot` | `dynamic` | — | snapshot value consumed by this operation. |
| `word` | `dynamic` | — | word value consumed by this operation. |
| `limit` | `dynamic` | — | limit value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/lang/service.ml#L1106)

- [lang.service.CallHierarchyItem](Type-lang-service-callhierarchyitem-1476597962.md) — struct
<a id="function-function-lang-service-code-inspection-items-function-code-inspection-items-snapshot-limit-src-lang-service-ml-1960242908"></a>
### code_inspection_items

```ml
function code_inspection_items(snapshot, limit)
```

Return lightweight code-inspection findings.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `snapshot` | `dynamic` | — | snapshot value consumed by this operation. |
| `limit` | `dynamic` | — | limit value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/lang/service.ml#L1274)

<a id="function-function-lang-service-completion-items-function-completion-items-snapshot-prefix-limit-src-lang-service-ml-369293454"></a>
### completion_items

```ml
function completion_items(snapshot, prefix, limit)
```

Return rich completion items from a snapshot.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `snapshot` | `dynamic` | — | snapshot value consumed by this operation. |
| `prefix` | `dynamic` | — | prefix value consumed by this operation. |
| `limit` | `dynamic` | — | limit value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/lang/service.ml#L415)

<a id="function-function-lang-service-completion-labels-function-completion-labels-snapshot-prefix-limit-src-lang-service-ml-1358015706"></a>
### completion_labels

```ml
function completion_labels(snapshot, prefix, limit)
```

Return labels for the existing MiniIDE completion popup.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `snapshot` | `dynamic` | — | snapshot value consumed by this operation. |
| `prefix` | `dynamic` | — | prefix value consumed by this operation. |
| `limit` | `dynamic` | — | limit value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/lang/service.ml#L445)

- [lang.service.CompletionItem](Type-lang-service-completionitem-1503625119.md) — struct
- [lang.service.DeclarationItem](Type-lang-service-declarationitem-521717985.md) — struct
- [lang.service.DiagnosticItem](Type-lang-service-diagnosticitem-1612642646.md) — struct
<a id="function-function-lang-service-diagnostics-function-diagnostics-snapshot-src-lang-service-ml-1563243999"></a>
### diagnostics

```ml
function diagnostics(snapshot)
```

Return project-analysis diagnostics.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `snapshot` | `dynamic` | — | snapshot value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/lang/service.ml#L601)

<a id="function-function-lang-service-file-items-function-file-items-snapshot-query-limit-src-lang-service-ml-1707250374"></a>
### file_items

```ml
function file_items(snapshot, query, limit)
```

Return project files from a snapshot.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `snapshot` | `dynamic` | — | snapshot value consumed by this operation. |
| `query` | `dynamic` | — | query value consumed by this operation. |
| `limit` | `dynamic` | — | limit value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/lang/service.ml#L522)

- [lang.service.FileItem](Type-lang-service-fileitem-2098269971.md) — struct
<a id="function-function-lang-service-import-items-function-import-items-snapshot-query-limit-src-lang-service-ml-1960700654"></a>
### import_items

```ml
function import_items(snapshot, query, limit)
```

Return project import edges from a snapshot.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `snapshot` | `dynamic` | — | snapshot value consumed by this operation. |
| `query` | `dynamic` | — | query value consumed by this operation. |
| `limit` | `dynamic` | — | limit value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/lang/service.ml#L564)

- [lang.service.ImportItem](Type-lang-service-importitem-1346914432.md) — struct
- [lang.service.InspectionItem](Type-lang-service-inspectionitem-1693763663.md) — struct
- [lang.service.LanguageSnapshot](Type-lang-service-languagesnapshot-1082178796.md) — struct
- [lang.service.ReferenceItem](Type-lang-service-referenceitem-256885256.md) — struct
<a id="function-function-lang-service-references-function-references-snapshot-word-limit-src-lang-service-ml-1646887154"></a>
### references

```ml
function references(snapshot, word, limit)
```

Return lexical references for a symbol-like word.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `snapshot` | `dynamic` | — | snapshot value consumed by this operation. |
| `word` | `dynamic` | — | word value consumed by this operation. |
| `limit` | `dynamic` | — | limit value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/lang/service.ml#L957)

<a id="function-function-lang-service-related-test-file-function-related-test-file-snapshot-current-file-src-lang-service-ml-1176049633"></a>
### related_test_file

```ml
function related_test_file(snapshot, current_file)
```

Return the first related test file for the requested source file.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `snapshot` | `dynamic` | — | snapshot value consumed by this operation. |
| `current_file` | `dynamic` | — | current_file value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/lang/service.ml#L937)

<a id="function-function-lang-service-related-test-items-function-related-test-items-snapshot-current-file-limit-src-lang-service-ml-1790392626"></a>
### related_test_items

```ml
function related_test_items(snapshot, current_file, limit)
```

Return tests related to the requested source file through imports.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `snapshot` | `dynamic` | — | snapshot value consumed by this operation. |
| `current_file` | `dynamic` | — | current_file value consumed by this operation. |
| `limit` | `dynamic` | — | limit value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/lang/service.ml#L881)

<a id="function-function-lang-service-rename-preview-items-function-rename-preview-items-snapshot-word-new-name-limit-src-lang-service-ml-23981446"></a>
### rename_preview_items

```ml
function rename_preview_items(snapshot, word, new_name, limit)
```

Return the references that would be affected by a symbol rename.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `snapshot` | `dynamic` | — | snapshot value consumed by this operation. |
| `word` | `dynamic` | — | word value consumed by this operation. |
| `new_name` | `dynamic` | — | new_name value consumed by this operation. |
| `limit` | `dynamic` | — | limit value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/lang/service.ml#L993)

- [lang.service.RenameApplyResult](Type-lang-service-renameapplyresult-1491867121.md) — struct
- [lang.service.RenamePreviewItem](Type-lang-service-renamepreviewitem-1013352911.md) — struct
<a id="function-function-lang-service-symbol-info-function-symbol-info-snapshot-name-src-lang-service-ml-316283600"></a>
### symbol_info

```ml
function symbol_info(snapshot, name)
```

Return symbol details for an exact symbol name.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `snapshot` | `dynamic` | — | snapshot value consumed by this operation. |
| `name` | `dynamic` | — | Name of the affected item. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/lang/service.ml#L498)

<a id="function-function-lang-service-symbol-items-function-symbol-items-snapshot-prefix-limit-src-lang-service-ml-1439355102"></a>
### symbol_items

```ml
function symbol_items(snapshot, prefix, limit)
```

Return project symbols from a snapshot.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `snapshot` | `dynamic` | — | snapshot value consumed by this operation. |
| `prefix` | `dynamic` | — | prefix value consumed by this operation. |
| `limit` | `dynamic` | — | limit value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/lang/service.ml#L460)

- [lang.service.SymbolInfoItem](Type-lang-service-symbolinfoitem-1516726409.md) — struct
- [lang.service.SymbolItem](Type-lang-service-symbolitem-1078798049.md) — struct
<a id="function-function-lang-service-test-items-function-test-items-snapshot-limit-src-lang-service-ml-712335434"></a>
### test_items

```ml
function test_items(snapshot, limit)
```

Return test entry and test-like functions for a project snapshot.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `snapshot` | `dynamic` | — | snapshot value consumed by this operation. |
| `limit` | `dynamic` | — | limit value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/lang/service.ml#L846)

- [lang.service.TestItem](Type-lang-service-testitem-446816593.md) — struct
<a id="function-function-lang-service-todo-items-function-todo-items-snapshot-limit-src-lang-service-ml-237141062"></a>
### todo_items

```ml
function todo_items(snapshot, limit)
```

Return TODO and FIXME comments across indexed source files.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `snapshot` | `dynamic` | — | snapshot value consumed by this operation. |
| `limit` | `dynamic` | — | limit value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/lang/service.ml#L723)

- [lang.service.TodoItem](Type-lang-service-todoitem-546419969.md) — struct
<a id="function-function-lang-service-workspace-health-lines-function-workspace-health-lines-snapshot-src-lang-service-ml-1077255643"></a>
### workspace_health_lines

```ml
function workspace_health_lines(snapshot)
```

Return compact workspace-health lines for dashboards and status panels.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `snapshot` | `dynamic` | — | snapshot value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/lang/service.ml#L664)
