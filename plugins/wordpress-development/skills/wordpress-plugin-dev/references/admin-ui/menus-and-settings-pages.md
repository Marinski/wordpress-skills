# Menus and Settings Pages

## CHUNK 1: Adding Admin Menus Without Creating a Messy Plugin UI

Administration menus are how plugins add option pages inside WordPress admin. WordPress supports both top-level menus and sub-menus, and the right choice depends on the scope of the plugin and the needs of users.

The handbook explicitly recommends restraint here. If your plugin has a single options page, prefer adding it under an existing top-level menu such as Settings or Tools rather than creating a new top-level menu. Top-level menus should be reserved for plugins with enough complexity or breadth to justify a primary navigation entry.

Use `add_menu_page()` for top-level menus and `add_submenu_page()` for child pages. In either case, wrap the page markup in a `<div class="wrap">` so the page aligns with WordPress admin layout conventions.

A practical admin menu strategy is:

- use sub-menus by default for smaller plugins
- create a top-level menu only when the plugin has multiple major screens or a genuinely primary workflow
- check user capabilities before rendering privileged content
- keep menu labels and page titles clear and consistent

Admin navigation is part of plugin UX. The goal is not just to make options reachable, but to place them where users would reasonably expect to find them.

---

## CHUNK 2: Building Settings Pages with the Settings API and Options API

WordPress provides two complementary APIs for admin settings pages:

- the Settings API, which structures forms, sections, and fields
- the Options API, which stores simple key-value configuration data

The Settings API exists to make admin interfaces easier to build, more secure, and visually consistent with core. Settings forms post to `wp-admin/options.php`, which enforces capability checks such as `manage_options` and, in multisite, super admin restrictions.

Core concepts include:

- `register_setting()` to register a setting
- `add_settings_section()` to group related fields
- `add_settings_field()` to add individual controls

You can attach settings to existing admin pages or create a custom settings page that combines menus, settings registration, sections, and fields. The handbook also recommends not defining functions inside callbacks, which keeps code testable and reusable.

Use the Settings API when you want structured, maintainable admin forms. Use the Options API as the storage layer behind those settings. Together, they provide the standard way to build secure plugin configuration screens that feel native to WordPress.

---

## SKILL SUMMARY

- **What this skill enables:** An agent can add WordPress admin menus and build settings pages that use the native Settings API and Options API instead of ad hoc admin forms.
- **When to use:** Use this when a plugin needs admin configuration screens, option storage, or a UI that fits cleanly into WordPress administration.