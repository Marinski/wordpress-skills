# Plugin Internationalization and Localization

## CHUNK 1: Preparing a Plugin for Translation

Internationalization makes a plugin translatable. Localization is the later process of translating it into a specific language. For plugin development, this means user-facing strings should be written in a way that WordPress translation tooling can extract and translate them.

The purpose is not only language support. It is also portability and ecosystem compatibility. A plugin that is properly internationalized can be reused across sites and languages without patching source code.

In practice, plugin internationalization means:

- wrapping user-facing strings in the appropriate translation functions
- using a consistent text domain
- keeping text human-readable and translator-friendly
- avoiding concatenated strings where translators need full context

Localization then supplies the translated strings for the target language. The key point is that localization depends on prior internationalization. If a plugin is not built with translatable strings in mind, it cannot be translated cleanly later.

For plugin authors, translation support should be considered standard production quality, not an optional extra added only at release time.

---

## CHUNK 2: Treating Translated Strings as Untrusted Output

The handbook’s internationalization security guidance highlights an often-overlooked rule: translated strings must still be treated as untrusted data. A malicious or careless translation can inject unwanted HTML, JavaScript, or misleading content if strings are output without escaping.

That means translation and escaping are separate concerns. A translated string still needs output-context-appropriate escaping.

For example:

```php
_e( 'The REST API content endpoints were added in WordPress 4.7.', 'your-text-domain' );
```

is less safe than:

```php
esc_html_e( 'The REST API content endpoints were added in WordPress 4.7.', 'your-text-domain' );
```

Plugin authors should also review contributed translations for spam or malicious content, especially in untrusted translation workflows.

The safe rule is simple: internationalized strings are still output, and output must still be escaped.

---

## SKILL SUMMARY

- **What this skill enables:** An agent can make a plugin translatable while preserving security by combining proper i18n usage with output escaping.
- **When to use:** Use this when building or reviewing user-facing plugin interfaces, messages, labels, and documentation strings intended for translation.