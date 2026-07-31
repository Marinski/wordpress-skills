# HTML Coding Standards

## CHUNK 1: HTML Validation, Elements, and Attribute Rules

All WordPress HTML pages should be verified against the **W3C validator** to ensure well-formed markup. Automated validation is not a substitute for manual code review, but it helps catch problems early.

**Self-closing elements** must include a space before the forward slash:

```html
<!-- Correct -->
<br />

<!-- Incorrect -->
<br/>
```

The W3C specifies that a single space should precede the self-closing slash.

**Tags and attributes** must be written in **lowercase**. Attribute values should also be lowercase when they are only interpreted by machines. Use proper title capitalization when values are human-readable:

```html
<!-- For machines -->
<meta http-equiv="content-type" content="text/html; charset=utf-8" />

<!-- For humans -->
<a href="http://example.com/" title="Description Here">Example.com</a>
```

**Quotes:** All attributes must use double or single quotes. Never leave attributes unquoted — failing to quote attributes can lead to **security vulnerabilities**.

```html
<!-- Correct -->
<input type="text" name="email" disabled="disabled" />
<input type='text' name='email' disabled='disabled' />

<!-- Incorrect -->
<input type=text name=email disabled>
```

Omitting the value on **boolean attributes** is allowed, but the values `true` and `false` are not valid for boolean attributes per the HTML5 spec:

```html
<!-- Correct -->
<input type="text" name="email" disabled />

<!-- Incorrect -->
<input type="text" name="email" disabled="true" />
```

**Indentation:** Use tabs (not spaces). HTML indentation must reflect logical structure. When mixing PHP and HTML together, indent PHP blocks to match surrounding HTML code. Closing PHP blocks should match the indentation level of the opening block:

```html
<?php if ( ! have_posts() ) : ?>
<div id="post-1" class="post">
    <h1 class="entry-title">Not Found</h1>
    <div class="entry-content">
        <p>Apologies, but no results were found.</p>
        <?php get_search_form(); ?>
    </div>
</div>
<?php endif; ?>
```

---

## SKILL SUMMARY

- **What this skill enables:** An agent can write or validate HTML markup following WordPress standards — proper self-closing tags, lowercase attributes, quoted values, tab indentation, and security-conscious attribute handling.
- **When to use:** When generating or reviewing HTML in WordPress themes, plugins, or core templates.
