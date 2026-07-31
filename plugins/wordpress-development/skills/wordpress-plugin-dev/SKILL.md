---
name: wordpress-plugin-dev
description: 'Use when building or reviewing WordPress plugins, including plugin foundations, lifecycle hooks, admin menus, settings pages, shortcodes, privacy hooks, internationalization, AJAX, cron, release workflow, must-use plugins, and admin file editing practices. Good triggers: plugin header, activation, deactivation, uninstall, shortcode, admin page, Settings API, mu-plugins, plugin directory, admin_menu, wp_ajax_, wp_schedule_event, cron, dashboard widget, Site Health, Quicktags.'
---

# WordPress Plugin Development

Use this skill for plugin-specific architecture, admin interfaces, lifecycle behavior, and release discipline.

## When To Use

- Starting or refactoring a plugin structure
- Activation, deactivation, uninstall, cleanup, or `mu-plugins`
- Admin menus, settings pages, dashboard integrations, quicktags, or plugin-side UI
- Shortcodes, privacy tooling, JavaScript, AJAX, cron, localization, or WordPress.org release workflow

## Workflow

1. Identify the plugin concern: foundations, lifecycle, hooks, admin UI, front-end behavior, privacy, tooling, or release.
2. Read the matching reference under `./references/`.
3. Pull in core, security, REST, or database skills only if the plugin task crosses those boundaries.
4. Keep plugin logic portable and separate from theme presentation concerns.

## Reference Map

- Admin UI: `./references/admin-ui/`
- Hooks: `./references/hooks/`
- Internationalization: `./references/internationalization/`
- JavaScript and automation: `./references/javascript-and-automation/`
- Plugin basics: `./references/plugin-basics/`
- Privacy: `./references/privacy/`
- Release and directory: `./references/release-and-directory/`
- Shortcodes: `./references/shortcodes/`

## Recommended Entry Points

- `./references/plugin-basics/plugin-foundations.md`
- `./references/plugin-basics/plugin-lifecycle-and-cleanup.md`
- `./references/admin-ui/menus-and-settings-pages.md`
- `./references/plugin-basics/must-use-plugins-and-admin-file-editing.md`

Use the REST, security, and database WordPress skills when the plugin task becomes API-facing, permission-sensitive, or storage-heavy.