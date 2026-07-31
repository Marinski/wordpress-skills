# Shortcode Design and Usage

## CHUNK 1: Registering Shortcodes That Behave Predictably

Shortcodes let plugins expose dynamic content through compact tags embedded in posts or pages. The fundamental API is small, but correct shortcode behavior depends on following a few important rules.

Register a shortcode with `add_shortcode( $tag, $func )`. The tag is the name users type in content, and the callback handles rendering.

```php
add_shortcode( 'wporg', 'wporg_shortcode' );

function wporg_shortcode( $atts = [], $content = null ) {
	return $content;
}
```

The most important behavior rule is that shortcode callbacks should return content, not echo it. They are meant to produce a string that WordPress inserts into the rendered output. WordPress also provides `remove_shortcode()` and `shortcode_exists()` for unregistering or checking shortcode availability.

Shortcodes can be self-closing, enclosing, or parameterized. As complexity grows, you need to parse attributes carefully, validate and sanitize values, and keep the rendering predictable so content editors understand what the shortcode will do.

Shortcodes are convenient, but they are also an implicit content API. Once users rely on them, changes become compatibility-sensitive. Choose names carefully and keep the output stable.

---

## CHUNK 2: Extending Shortcodes with Parameters and Editor Enhancements

Shortcodes become more useful when they accept parameters or wrap inner content. Parameterized shortcodes let users control output without custom PHP. Enclosing shortcodes support wrapped content blocks, which is useful for things like panels, messages, or styled containers.

Some shortcode experiences can also be enhanced in the visual editor. WordPress supports TinyMCE-enhanced shortcodes in certain built-in cases so the visual editor can render meaningful previews instead of raw shortcode text. This is how built-in shortcodes such as audio, caption, gallery, playlist, and video can appear more like rendered content while still preserving the underlying shortcode in text mode.

Use this capability carefully. It improves authoring experience, but it also increases implementation complexity and should only be added when previewing the shortcode materially helps the editor workflow.

A good shortcode strategy is:

- keep the shortcode name unique and prefixed where appropriate
- return output instead of echoing
- validate and sanitize attributes
- treat editor enhancements as optional, not default

This preserves both user-facing simplicity and long-term maintainability.

---

## SKILL SUMMARY

- **What this skill enables:** An agent can create, extend, and maintain shortcodes with predictable output, support for parameters or enclosing content, and optional editor-aware enhancements.
- **When to use:** Use this when a plugin needs a content-level insertion API that editors can place directly inside posts, pages, or classic editing workflows.