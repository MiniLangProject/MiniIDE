# `src/ui/markdown.ml`

[Home](README.md) · [Files](Files.md)

Provides ui markdown facilities for this project.

Package: [`ui.markdown`](Package-ui-markdown-1892929778.md)

Reachable from entry: **yes**

## Imports

- `lang/syntax.ml` as `syntax` → [src/lang/syntax.ml](File-src-lang-syntax-ml-2103667443.md)
- `platform/win32.ml` as `win` → [src/platform/win32.ml](File-src-platform-win32-ml-830830664.md)
- `std/string.ml` as `s` → `../MiniLangCompilerML/std/string.ml` — external dependency
- `ui/theme.ml` as `theme` → [src/ui/theme.ml](File-src-ui-theme-ml-499196665.md)

## Declarations

<a id="function-function-ui-markdown-active-cached-markdown-doc-function-active-cached-markdown-doc-st-src-ui-markdown-ml-925876310"></a>
### _active_cached_markdown_doc

```ml
function _active_cached_markdown_doc(st)
```

Return the cached Markdown document for the active tab when valid.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ui/markdown.ml#L757)

<a id="function-function-ui-markdown-active-is-markdown-function-active-is-markdown-st-src-ui-markdown-ml-172627552"></a>
### _active_is_markdown

```ml
function _active_is_markdown(st)
```

Return true when the active tab displays Markdown content.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ui/markdown.ml#L109)

<a id="function-function-ui-markdown-apply-rendered-markdown-line-styles-function-apply-rendered-markdown-line-styles-st-doc-src-ui-markdown-ml-672075576"></a>
### _apply_rendered_markdown_line_styles

```ml
function _apply_rendered_markdown_line_styles(st, doc)
```

Apply paragraph-level styles to rendered Markdown lines.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `doc` | `dynamic` | — | doc value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ui/markdown.ml#L852)

<a id="function-function-ui-markdown-apply-rendered-markdown-styles-function-apply-rendered-markdown-styles-st-doc-src-ui-markdown-ml-9643728"></a>
### _apply_rendered_markdown_styles

```ml
function _apply_rendered_markdown_styles(st, doc)
```

Apply all rendered Markdown styles to the RichEdit control.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `doc` | `dynamic` | — | doc value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ui/markdown.ml#L873)

<a id="function-function-ui-markdown-clear-markdown-cache-function-clear-markdown-cache-st-idx-src-ui-markdown-ml-1909610587"></a>
### _clear_markdown_cache

```ml
function _clear_markdown_cache(st, idx)
```

Clear the cached Markdown render for a tab.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `idx` | `dynamic` | — | idx value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ui/markdown.ml#L727)

<a id="function-function-ui-markdown-editor-display-text-function-editor-display-text-text-src-ui-markdown-ml-1137133080"></a>
### _editor_display_text

```ml
function _editor_display_text(text)
```

Convert internal editor text to the display form expected by RichEdit.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ui/markdown.ml#L94)

<a id="function-function-ui-markdown-empty-markdown-doc-function-empty-markdown-doc-src-ui-markdown-ml-1906094205"></a>
### _empty_markdown_doc

```ml
function _empty_markdown_doc()
```

Return an empty Markdown document used as a non-void cache sentinel.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ui/markdown.ml#L79)

<a id="function-function-ui-markdown-ensure-markdown-cache-slots-function-ensure-markdown-cache-slots-st-src-ui-markdown-ml-1387210300"></a>
### _ensure_markdown_cache_slots

```ml
function _ensure_markdown_cache_slots(st)
```

Ensure the Markdown render cache matches the open tab list.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ui/markdown.ml#L710)

<a id="function-function-ui-markdown-is-markdown-path-function-is-markdown-path-path-src-ui-markdown-ml-1985825494"></a>
### _is_markdown_path

```ml
function _is_markdown_path(path)
```

Return true when a path names a Markdown document.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `dynamic` | — | Path of the file or directory used by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ui/markdown.ml#L101)

<a id="function-function-ui-markdown-jump-to-markdown-anchor-function-jump-to-markdown-anchor-st-link-target-src-ui-markdown-ml-434629166"></a>
### _jump_to_markdown_anchor

```ml
function _jump_to_markdown_anchor(st, link_target)
```

Scroll the editor so a Markdown anchor is aligned near the top.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `link_target` | `dynamic` | — | link_target value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ui/markdown.ml#L981)

<a id="function-function-ui-markdown-markdown-anchor-from-target-function-markdown-anchor-from-target-link-target-src-ui-markdown-ml-163559091"></a>
### _markdown_anchor_from_target

```ml
function _markdown_anchor_from_target(link_target)
```

Extract an anchor name from a Markdown link target.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `link_target` | `dynamic` | — | link_target value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ui/markdown.ml#L968)

<a id="function-function-ui-markdown-markdown-doc-for-active-tab-function-markdown-doc-for-active-tab-st-markdown-src-ui-markdown-ml-1834144957"></a>
### _markdown_doc_for_active_tab

```ml
function _markdown_doc_for_active_tab(st, markdown)
```

Return the rendered Markdown document for the active tab.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `markdown` | `dynamic` | — | markdown value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ui/markdown.ml#L738)

<a id="function-function-ui-markdown-markdown-fence-language-function-markdown-fence-language-line-src-ui-markdown-ml-651682749"></a>
### _markdown_fence_language

```ml
function _markdown_fence_language(line)
```

Extract the language name from a Markdown fenced code block.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `line` | `dynamic` | — | line value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ui/markdown.ml#L143)

<a id="function-function-ui-markdown-markdown-fence-line-function-markdown-fence-line-line-src-ui-markdown-ml-1978912849"></a>
### _markdown_fence_line

```ml
function _markdown_fence_line(line)
```

Return true when a Markdown line starts or ends a fenced code block.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `line` | `dynamic` | — | line value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ui/markdown.ml#L136)

<a id="function-function-ui-markdown-markdown-link-at-doc-function-markdown-link-at-doc-doc-char-pos-src-ui-markdown-ml-1486104876"></a>
### _markdown_link_at_doc

```ml
function _markdown_link_at_doc(doc, char_pos)
```

Return the Markdown link covering a document offset.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `doc` | `dynamic` | — | doc value consumed by this operation. |
| `char_pos` | `dynamic` | — | char_pos value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ui/markdown.ml#L941)

<a id="function-function-ui-markdown-markdown-link-at-editor-function-markdown-link-at-editor-st-x-y-src-ui-markdown-ml-642002967"></a>
### _markdown_link_at_editor

```ml
function _markdown_link_at_editor(st, x, y)
```

Return the Markdown link under an editor mouse position.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `x` | `dynamic` | — | Horizontal coordinate used by the operation. |
| `y` | `dynamic` | — | Vertical coordinate used by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ui/markdown.ml#L958)

<a id="function-function-ui-markdown-markdown-span-color-function-markdown-span-color-st-kind-src-ui-markdown-ml-1662927002"></a>
### _markdown_span_color

```ml
function _markdown_span_color(st, kind)
```

Return the RichEdit color for a rendered Markdown span kind.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `kind` | `dynamic` | — | kind value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ui/markdown.ml#L819)

<a id="function-function-ui-markdown-markdown-span-size-function-markdown-span-size-kind-src-ui-markdown-ml-611531831"></a>
### _markdown_span_size

```ml
function _markdown_span_size(kind)
```

Return the font size for a rendered Markdown span kind.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `kind` | `dynamic` | — | kind value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ui/markdown.ml#L839)

<a id="function-function-ui-markdown-md-add-anchor-function-md-add-anchor-anchors-name-start-pos-src-ui-markdown-ml-2043625009"></a>
### _md_add_anchor

```ml
function _md_add_anchor(anchors, name, start_pos)
```

Record a heading anchor and its rendered line location.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `anchors` | `dynamic` | — | anchors value consumed by this operation. |
| `name` | `dynamic` | — | Name of the affected item. |
| `start_pos` | `dynamic` | — | start_pos value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ui/markdown.ml#L190)

<a id="function-function-ui-markdown-md-add-code-spans-function-md-add-code-spans-spans-base-pos-raw-lang-src-ui-markdown-ml-1588205142"></a>
### _md_add_code_spans

```ml
function _md_add_code_spans(spans, base_pos, raw, lang)
```

Style code block lines in rendered Markdown output.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `spans` | `dynamic` | — | spans value consumed by this operation. |
| `base_pos` | `dynamic` | — | base_pos value consumed by this operation. |
| `raw` | `dynamic` | — | raw value consumed by this operation. |
| `lang` | `dynamic` | — | lang value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ui/markdown.ml#L570)

<a id="function-function-ui-markdown-md-add-line-style-function-md-add-line-style-styles-start-pos-end-pos-kind-src-ui-markdown-ml-1742630500"></a>
### _md_add_line_style

```ml
function _md_add_line_style(styles, start_pos, end_pos, kind)
```

Add a style override for a rendered Markdown line.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `styles` | `dynamic` | — | styles value consumed by this operation. |
| `start_pos` | `dynamic` | — | start_pos value consumed by this operation. |
| `end_pos` | `dynamic` | — | end_pos value consumed by this operation. |
| `kind` | `dynamic` | — | kind value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ui/markdown.ml#L168)

<a id="function-function-ui-markdown-md-add-link-function-md-add-link-links-start-pos-end-pos-link-target-src-ui-markdown-ml-316026041"></a>
### _md_add_link

```ml
function _md_add_link(links, start_pos, end_pos, link_target)
```

Record a clickable link range in rendered Markdown output.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `links` | `dynamic` | — | links value consumed by this operation. |
| `start_pos` | `dynamic` | — | start_pos value consumed by this operation. |
| `end_pos` | `dynamic` | — | end_pos value consumed by this operation. |
| `link_target` | `dynamic` | — | link_target value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ui/markdown.ml#L179)

<a id="function-function-ui-markdown-md-add-span-function-md-add-span-spans-start-pos-end-pos-kind-src-ui-markdown-ml-1015259915"></a>
### _md_add_span

```ml
function _md_add_span(spans, start_pos, end_pos, kind)
```

Add a styled character span to a rendered Markdown document.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `spans` | `dynamic` | — | spans value consumed by this operation. |
| `start_pos` | `dynamic` | — | start_pos value consumed by this operation. |
| `end_pos` | `dynamic` | — | end_pos value consumed by this operation. |
| `kind` | `dynamic` | — | kind value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ui/markdown.ml#L157)

<a id="function-function-ui-markdown-md-anchor-slug-function-md-anchor-slug-text-src-ui-markdown-ml-1900884120"></a>
### _md_anchor_slug

```ml
function _md_anchor_slug(text)
```

Convert heading text into a GitHub-style Markdown anchor slug.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ui/markdown.ml#L199)

<a id="function-function-ui-markdown-md-append-block-inline-function-md-append-block-inline-text-spans-links-prefix-src-kind-src-ui-markdown-ml-1657224790"></a>
### _md_append_block_inline

```ml
function _md_append_block_inline(text, spans, links, prefix, src, kind)
```

Append a full logical Markdown line after parsing all inline markup.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed by the operation. |
| `spans` | `dynamic` | — | spans value consumed by this operation. |
| `links` | `dynamic` | — | links value consumed by this operation. |
| `prefix` | `dynamic` | — | prefix value consumed by this operation. |
| `src` | `dynamic` | — | src value consumed by this operation. |
| `kind` | `dynamic` | — | kind value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ui/markdown.ml#L561)

<a id="function-function-ui-markdown-md-append-inline-function-md-append-inline-text-spans-links-prefix-src-kind-src-ui-markdown-ml-189781734"></a>
### _md_append_inline

```ml
function _md_append_inline(text, spans, links, prefix, src, kind)
```

Append text after applying inline Markdown formatting.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed by the operation. |
| `spans` | `dynamic` | — | spans value consumed by this operation. |
| `links` | `dynamic` | — | links value consumed by this operation. |
| `prefix` | `dynamic` | — | prefix value consumed by this operation. |
| `src` | `dynamic` | — | src value consumed by this operation. |
| `kind` | `dynamic` | — | kind value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ui/markdown.ml#L538)

<a id="function-function-ui-markdown-md-append-plain-function-md-append-plain-text-line-src-ui-markdown-ml-1389532214"></a>
### _md_append_plain

```ml
function _md_append_plain(text, line)
```

Append plain text to the rendered Markdown output.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed by the operation. |
| `line` | `dynamic` | — | line value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ui/markdown.ml#L316)

<a id="function-function-ui-markdown-md-blank-function-md-blank-text-src-ui-markdown-ml-638761854"></a>
### _md_blank

```ml
function _md_blank(text)
```

Append a blank rendered line to a Markdown document.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ui/markdown.ml#L299)

<a id="function-function-ui-markdown-md-display-pos-function-md-display-pos-doc-text-doc-pos-src-ui-markdown-ml-37748168"></a>
### _md_display_pos

```ml
function _md_display_pos(doc_text, doc_pos)
```

Convert a document offset to a RichEdit display offset.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `doc_text` | `dynamic` | — | doc_text value consumed by this operation. |
| `doc_pos` | `dynamic` | — | doc_pos value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ui/markdown.ml#L769)

<a id="function-function-ui-markdown-md-doc-pos-from-display-function-md-doc-pos-from-display-doc-text-display-pos-src-ui-markdown-ml-364857244"></a>
### _md_doc_pos_from_display

```ml
function _md_doc_pos_from_display(doc_text, display_pos)
```

Convert a RichEdit display offset back to a document offset.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `doc_text` | `dynamic` | — | doc_text value consumed by this operation. |
| `display_pos` | `dynamic` | — | display_pos value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ui/markdown.ml#L789)

<a id="function-function-ui-markdown-md-find-strong-close-function-md-find-strong-close-src-open-pos-src-ui-markdown-ml-2005534770"></a>
### _md_find_strong_close

```ml
function _md_find_strong_close(src, open_pos)
```

Find the closing delimiter for a strong emphasis span.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `src` | `dynamic` | — | src value consumed by this operation. |
| `open_pos` | `dynamic` | — | open_pos value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ui/markdown.ml#L404)

<a id="function-function-ui-markdown-md-heading-level-function-md-heading-level-line-src-ui-markdown-ml-2024944817"></a>
### _md_heading_level

```ml
function _md_heading_level(line)
```

Return the ATX heading level for a Markdown line.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `line` | `dynamic` | — | line value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ui/markdown.ml#L336)

<a id="function-function-ui-markdown-md-heading-text-function-md-heading-text-line-src-ui-markdown-ml-27723801"></a>
### _md_heading_text

```ml
function _md_heading_text(line)
```

Extract the visible text from a Markdown heading line.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `line` | `dynamic` | — | line value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ui/markdown.ml#L351)

<a id="function-function-ui-markdown-md-hex-string-function-md-hex-string-hex-text-src-ui-markdown-ml-1515469754"></a>
### _md_hex_string

```ml
function _md_hex_string(hex_text)
```

Build a UTF-8 string from hex bytes while keeping this source file ASCII.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `hex_text` | `dynamic` | — | hex_text value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ui/markdown.ml#L252)

<a id="function-function-ui-markdown-md-inline-function-md-inline-src-base-pos-spans-links-src-ui-markdown-ml-834404503"></a>
### _md_inline

```ml
function _md_inline(src, base_pos, spans, links)
```

Parse inline Markdown formatting into styled output spans.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `src` | `dynamic` | — | src value consumed by this operation. |
| `base_pos` | `dynamic` | — | base_pos value consumed by this operation. |
| `spans` | `dynamic` | — | spans value consumed by this operation. |
| `links` | `dynamic` | — | links value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ui/markdown.ml#L423)

<a id="function-function-ui-markdown-md-is-digit-function-md-is-digit-ch-src-ui-markdown-ml-1742634188"></a>
### _md_is_digit

```ml
function _md_is_digit(ch)
```

Return true when a Markdown parser character is an ASCII digit.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ch` | `dynamic` | — | ch value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ui/markdown.ml#L326)

<a id="function-function-ui-markdown-md-line-start-function-md-line-start-text-src-ui-markdown-ml-16103364"></a>
### _md_line_start

```ml
function _md_line_start(text)
```

Return the current output offset at the start of a rendered line.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ui/markdown.ml#L308)

<a id="function-function-ui-markdown-md-next-line-no-function-md-next-line-no-text-src-ui-markdown-ml-1459420916"></a>
### _md_next_line_no

```ml
function _md_next_line_no(text)
```

Return the next rendered line number for Markdown output.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ui/markdown.ml#L228)

<a id="function-function-ui-markdown-md-normalize-display-chars-function-md-normalize-display-chars-text-src-ui-markdown-ml-905366778"></a>
### _md_normalize_display_chars

```ml
function _md_normalize_display_chars(text)
```

Replace mojibake and typographic Unicode with ASCII-safe text.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ui/markdown.ml#L262)

<a id="function-function-ui-markdown-md-ordered-prefix-function-md-ordered-prefix-line-src-ui-markdown-ml-1248416057"></a>
### _md_ordered_prefix

```ml
function _md_ordered_prefix(line)
```

Return the length of a Markdown ordered-list prefix.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `line` | `dynamic` | — | line value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ui/markdown.ml#L360)

<a id="function-function-ui-markdown-md-table-row-function-md-table-row-line-src-ui-markdown-ml-710353285"></a>
### _md_table_row

```ml
function _md_table_row(line)
```

Return true when a Markdown line looks like a table row.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `line` | `dynamic` | — | line value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ui/markdown.ml#L388)

<a id="function-function-ui-markdown-md-table-separator-function-md-table-separator-line-src-ui-markdown-ml-1582644947"></a>
### _md_table_separator

```ml
function _md_table_separator(line)
```

Return true when a Markdown line is a table separator row.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `line` | `dynamic` | — | line value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ui/markdown.ml#L373)

<a id="function-function-ui-markdown-normalize-editor-text-function-normalize-editor-text-text-src-ui-markdown-ml-1158513032"></a>
### _normalize_editor_text

```ml
function _normalize_editor_text(text)
```

Normalize editor text so RichEdit and MiniLang use the same line endings.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ui/markdown.ml#L85)

<a id="function-function-ui-markdown-open-markdown-link-at-function-open-markdown-link-at-st-x-y-src-ui-markdown-ml-1489022635"></a>
### _open_markdown_link_at

```ml
function _open_markdown_link_at(st, x, y)
```

Open an external Markdown link or jump to an in-document anchor.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `x` | `dynamic` | — | Horizontal coordinate used by the operation. |
| `y` | `dynamic` | — | Vertical coordinate used by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ui/markdown.ml#L1020)

<a id="function-function-ui-markdown-render-markdown-document-function-render-markdown-document-markdown-src-ui-markdown-ml-1833221288"></a>
### _render_markdown_document

```ml
function _render_markdown_document(markdown)
```

Render a Markdown document into text, styles, links, and anchors.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `markdown` | `dynamic` | — | markdown value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ui/markdown.ml#L593)

<a id="function-function-ui-markdown-set-log-function-set-log-st-text-src-ui-markdown-ml-1299668227"></a>
### _set_log

```ml
function _set_log(st, text)
```

Replace the result log text and refresh the log control.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `text` | `dynamic` | — | Text consumed by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ui/markdown.ml#L117)

<a id="function-function-ui-markdown-strip-cr-function-strip-cr-line-src-ui-markdown-ml-699439131"></a>
### _strip_cr

```ml
function _strip_cr(line)
```

Remove carriage returns from editor or log text.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `line` | `dynamic` | — | line value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ui/markdown.ml#L126)

<a id="function-function-ui-markdown-strip-utf8-bom-function-strip-utf8-bom-text-src-ui-markdown-ml-1619882776"></a>
### _strip_utf8_bom

```ml
function _strip_utf8_bom(text)
```

Remove a UTF-8 byte order mark from the start of text.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ui/markdown.ml#L241)

<a id="function-function-ui-markdown-write-markdown-editor-function-write-markdown-editor-st-markdown-preserve-view-src-ui-markdown-ml-497295665"></a>
### _write_markdown_editor

```ml
function _write_markdown_editor(st, markdown, preserve_view)
```

Render and write Markdown content into the active editor control.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `markdown` | `dynamic` | — | markdown value consumed by this operation. |
| `preserve_view` | `dynamic` | — | preserve_view value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ui/markdown.ml#L898)

<a id="function-function-ui-markdown-clear-cache-function-clear-cache-st-idx-src-ui-markdown-ml-843552369"></a>
### clear_cache

```ml
function clear_cache(st, idx)
```

Clear the cached rendered Markdown document for a tab.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `idx` | `dynamic` | — | idx value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ui/markdown.ml#L1048)

<a id="function-function-ui-markdown-empty-doc-function-empty-doc-src-ui-markdown-ml-313004551"></a>
### empty_doc

```ml
function empty_doc()
```

Return an empty rendered Markdown document for cache initialization.


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ui/markdown.ml#L1041)

<a id="function-function-ui-markdown-link-at-editor-function-link-at-editor-st-x-y-src-ui-markdown-ml-1515549927"></a>
### link_at_editor

```ml
function link_at_editor(st, x, y)
```

Return the rendered Markdown link under an editor coordinate.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `x` | `dynamic` | — | Horizontal coordinate used by the operation. |
| `y` | `dynamic` | — | Vertical coordinate used by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ui/markdown.ml#L1064)

- [ui.markdown.MarkdownAnchor](Type-ui-markdown-markdownanchor-797870044.md) — struct
- [ui.markdown.MarkdownDocument](Type-ui-markdown-markdowndocument-1251744316.md) — struct
- [ui.markdown.MarkdownLineStyle](Type-ui-markdown-markdownlinestyle-456624336.md) — struct
- [ui.markdown.MarkdownLink](Type-ui-markdown-markdownlink-2063197185.md) — struct
- [ui.markdown.MarkdownSpan](Type-ui-markdown-markdownspan-420514249.md) — struct
<a id="function-function-ui-markdown-open-link-at-function-open-link-at-st-x-y-src-ui-markdown-ml-201077115"></a>
### open_link_at

```ml
function open_link_at(st, x, y)
```

Open or jump to the rendered Markdown link under an editor coordinate.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `x` | `dynamic` | — | Horizontal coordinate used by the operation. |
| `y` | `dynamic` | — | Vertical coordinate used by the operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ui/markdown.ml#L1072)

<a id="function-function-ui-markdown-render-function-render-markdown-src-ui-markdown-ml-1572734374"></a>
### render

```ml
function render(markdown)
```

Render Markdown source into a styled document model.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `markdown` | `dynamic` | — | markdown value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ui/markdown.ml#L1036)

<a id="function-function-ui-markdown-write-editor-function-write-editor-st-markdown-preserve-view-src-ui-markdown-ml-620052725"></a>
### write_editor

```ml
function write_editor(st, markdown, preserve_view)
```

Write rendered Markdown into the RichEdit control.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | `dynamic` | — | st value consumed by this operation. |
| `markdown` | `dynamic` | — | markdown value consumed by this operation. |
| `preserve_view` | `dynamic` | — | preserve_view value consumed by this operation. |


[View source](https://github.com/MiniLangProject/MiniIDE/blob/main/src/ui/markdown.ml#L1056)
