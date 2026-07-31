# Theme Foundations

## CHUNK 1: Understanding Theme Structure and Required Files

A WordPress theme defines the presentation layer of a site. Once you move beyond no-code customization, the first practical step is opening the theme in a code editor and understanding its file structure. Modern WordPress supports both block themes and classic themes, and the minimum required files differ depending on which approach you choose.

For a block theme, the smallest viable setup is typically:

- `templates/index.html` as the main template
- `style.css` for stylesheet metadata and any additional CSS
- `theme.json` for global settings and styles

For real-world projects, you will usually add more templates and template parts, but those three files form the core. The `theme.json` file is especially important because it configures design tools, presets, and styles in a structured way that integrates with the Site Editor.

In both block and classic themes, `functions.php` remains a central place for bootstrapping theme behavior. It is optional as a file, but in practice most themes use it. This file behaves similarly to a lightweight plugin: it can call WordPress APIs, register support for features, load text domains, enqueue assets, and define reusable functions. It should contain theme setup and integration logic, not arbitrary business logic that belongs in a plugin.

As a general rule, choose the smallest structure that supports your goal, then expand deliberately. Use templates to define layout, `theme.json` to define settings and styling, and `functions.php` only for PHP-driven behavior the editor configuration system cannot handle directly.

---

## CHUNK 2: Using functions.php and Loading Theme Assets Correctly

The `functions.php` file is where theme-specific PHP functionality lives. It can be used by block themes, classic themes, and child themes. Its purpose is to hook into WordPress and add capabilities that make the theme modular and extensible. Common responsibilities include registering theme features, menus, image sizes, widget areas, and enqueueing scripts or styles.

When loading assets, do not hardcode `<link>`, `<style>`, or `<script>` tags into templates unless there is a specific reason. WordPress provides hooks and functions for controlled asset loading so themes, plugins, and core can cooperate without conflicts. For styles and scripts, enqueue them at the proper hook instead of printing markup directly. This ensures dependency handling, correct load order, and compatibility with the editor and front end.

Many block themes do not need much custom asset loading because `theme.json` can handle a large amount of design configuration. Use CSS and JavaScript files only when the built-in global styles system is not enough. For example, highly specific interactions, complex animations, or styles not expressible through `theme.json` may justify dedicated assets.

A useful decision rule is:

- Use `theme.json` for design tokens, presets, spacing, typography, and most global styling
- Use templates and template parts for structure
- Use `functions.php` for registering support, hooks, and behavior
- Use enqueued CSS and JavaScript only when configuration alone cannot solve the problem

This separation keeps themes maintainable and aligns with modern WordPress architecture.

---

## SKILL SUMMARY

- **What this skill enables:** An agent can scaffold or review a WordPress theme’s foundational structure, including required files, `functions.php` usage, and proper asset-loading strategy.
- **When to use:** Use this when starting a new theme, refactoring an existing one, or deciding whether logic belongs in templates, `theme.json`, `functions.php`, or enqueued assets.
