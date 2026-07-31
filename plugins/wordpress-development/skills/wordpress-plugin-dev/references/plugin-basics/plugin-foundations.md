# Plugin Foundations

## CHUNK 1: Starting a Plugin with the Right File Structure and Headers

At its simplest, a WordPress plugin is a PHP file with a valid plugin header comment. In practice, it is better to create a dedicated directory for the plugin and keep all related files there so the project can grow without becoming disorganized.

A typical starting workflow is:

- go to `wp-content/plugins`
- create a unique plugin directory such as `plugin-name`
- create a main PHP file such as `plugin-name.php`
- add the required plugin header fields so WordPress can recognize and load the plugin

This structure keeps the plugin portable and makes it easier to add assets, includes, templates, uninstall logic, and documentation later. The main plugin file is not just an entry point. It is also the source of metadata used by WordPress and, in many cases, by WordPress.org tooling.

Header quality matters because it drives plugin identification and display. Naming also matters. Your directory, file names, symbols, and public identifiers should be unique and prefixed to avoid conflicts with other plugins. In WordPress, all globally accessible procedural code shares the global namespace unless you deliberately isolate it, so collisions are a real risk.

The baseline rules are:

- prefix globally accessible functions, classes, constants, and hooks
- organize the plugin in its own directory, not as a lone root file
- choose a unique plugin name that does not conflict with trademarks or other plugins
- make the main file production-ready because it defines the plugin’s public identity

These decisions look small early on, but they determine whether the plugin stays maintainable and compatible as it grows.

---

## CHUNK 2: Applying Core Plugin Best Practices from the Start

WordPress plugin best practices are mostly about coexistence. Your plugin needs to work alongside core, themes, and other plugins without corrupting data, colliding with symbols, or assuming it is the only code running on the site.

The most important habit is prefixing everything globally reachable. That includes functions, classes, database identifiers, custom hooks, custom post types, taxonomies, and option names. Prefixes reduce the chance that another plugin defines the same symbol or uses the same identifier for a different purpose.

Plugins should also know where they live. WordPress provides functions for determining plugin and content directories instead of relying on hardcoded assumptions. Use platform-aware directory helpers rather than constructing paths manually.

Licensing and packaging also belong in the foundation phase. WordPress plugins commonly use GPL-compatible licensing, and it is good practice to state the license in the plugin header and often in a license comment or separate file.

Finally, plugins should be scoped correctly. A plugin should own behavior and site features, not presentation concerns that belong in a theme. This is why the handbook explicitly recommends that custom post types live in plugins rather than themes: user content should remain portable if the theme changes.

The practical mindset is simple: assume your plugin will run in a crowded environment, be reviewed by others, and live for years. Structure it accordingly from day one.

---

## SKILL SUMMARY

- **What this skill enables:** An agent can scaffold a WordPress plugin with the correct base structure, header metadata, naming strategy, and coexistence-focused coding practices.
- **When to use:** Use this when starting a new plugin, reviewing plugin structure, or cleaning up a plugin that grew without clear foundations.