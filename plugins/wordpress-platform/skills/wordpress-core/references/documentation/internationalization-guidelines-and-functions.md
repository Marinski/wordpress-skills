# Internationalization Guidelines and Functions

## CHUNK 1: Choosing the Right Translation Function and Writing Translator-Friendly Strings

Internationalization in WordPress means writing code so it can be translated without modifying source files. The Common APIs handbook documents the general-purpose i18n functions and the string-authoring guidelines that apply across plugins, themes, PHP, and JavaScript.

The basic translation helpers include:

- `__()` to return a translated string
- `_e()` to echo a translated string
- `_x()` and related context-aware helpers
- plural helpers such as `_n()` and `_nx()`
- nooped plural helpers such as `_n_noop()` and `_nx_noop()`

The handbook also highlights translated-and-escaped helpers such as:

- `esc_html__()` and `esc_html_e()`
- `esc_attr__()` and `esc_attr_e()`

Use these when the translated string is being output into HTML text or attributes and should be escaped in the same step.

A core writing rule is to translate complete templates, not partially assembled strings. When variables are involved, use `printf()` or `sprintf()` with placeholders instead of concatenating raw fragments. For multiple placeholders, use argument swapping so translators can reorder parts naturally.

This makes strings easier to translate correctly and reduces the risk of awkward or untranslatable output.

---

## CHUNK 2: Internationalizing JavaScript and Keeping Text Domains Consistent

The Common APIs handbook also covers JavaScript internationalization. Since WordPress 5.0, JavaScript can use the same conceptual i18n model as PHP through the `wp-i18n` package. To make this work, the script must declare the proper dependency and WordPress must load the translation catalog with `wp_set_script_translations()`.

Text domains are the namespace that keeps your translations associated with the correct plugin or theme. They prevent conflicts between strings from core, plugins, and themes. If you are not using a text domain consistently, your translations will not resolve predictably.

The practical rules are:

- wrap all user-facing strings in the appropriate i18n function
- use the correct text domain consistently
- use placeholders for variables instead of concatenation
- use escaped translation helpers when the output context requires them
- set up JavaScript translations explicitly when localizing JS files

These guidelines are broader than plugin- or theme-specific setup steps. They form the common i18n grammar for WordPress development as a whole.

---

## SKILL SUMMARY

- **What this skill enables:** An agent can select the correct WordPress translation function, write translator-friendly strings, and internationalize both PHP and JavaScript using the shared core guidelines.
- **When to use:** Use this when reviewing translatable strings, adding i18n to shared libraries, or deciding how to localize output in a WordPress-agnostic way before plugin/theme-specific packaging steps.