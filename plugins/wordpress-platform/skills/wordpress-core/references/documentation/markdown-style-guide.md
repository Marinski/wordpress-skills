# Markdown Style Guide

## CHUNK 1: Writing Markdown for WordPress Documentation

WordPress documentation uses standard Markdown with specific formatting conventions. Follow these rules when writing or editing WordPress docs.

**Headings:** Use `#` through `######` for h1–h6. Headings h1–h4 are automatically added to the Table of Contents.

```markdown
# Heading h1
## Heading h2
### Heading h3
#### Heading h4
```

**Emphasis:**
- *Italic*: Wrap text with a single underscore: `_italic text_`
- **Bold**: Wrap text with double asterisks: `**bold text**`
- ~~Strikethrough~~: Wrap text with double tildes: `~~strikethrough text~~`

**Links:** Use `[title](https://example.com)` syntax:

```markdown
[WordPress](https://wordpress.org/)
```

**Blockquotes:** Use `>` for blockquotes. Use `>>` for nested indentation:

```markdown
> Blockquote
>> Indented Blockquote
```

**Lists:**
- Unordered: Use `-` with two-space indentation for subitems
- Ordered: Use numbered items followed by `.`

```markdown
- List item
  - Sub-item
- List item

1. First
2. Second
3. Third
```

**Horizontal rules:** Use `---`.

**Tables:**

```markdown
| A     | B     |
| ----- | ----- |
| Alpha | Bravo |
```

**Code:** Use single backticks for inline code. Use fenced code blocks with language identifiers for multi-line examples:

````markdown
This is `inline code` wrapped with backticks.

```javascript
var foo = function (bar) {
    return bar++;
};
```

```php
$array = array(
    "foo" => "bar",
    "bar" => "foo",
);
```
````

Supported language identifiers include: `javascript`, `json`, `css`, `scss`, `html`, `php`, `md`.

---

## SKILL SUMMARY

- **What this skill enables:** An agent can write or format WordPress documentation using correct Markdown syntax — proper headings, emphasis, links, lists, tables, and fenced code blocks with language identifiers.
- **When to use:** When generating or editing Markdown documentation for WordPress developer handbooks, plugin READMEs, or contribution guides.
