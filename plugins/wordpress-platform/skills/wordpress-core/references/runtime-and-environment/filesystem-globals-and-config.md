# Filesystem, Globals, and Environment

## CHUNK 1: Using Globals Carefully and Preferring Purpose-Built APIs

WordPress exposes a number of global variables that provide access to runtime state such as the current post, author data, multipage state, pagination state, and browser detection flags. While these globals are available, the handbook explicitly recommends using the appropriate API functions when possible rather than modifying globals directly.

To use a WordPress global in PHP, you must import it into scope with `global $variable;`. Common examples include:

- `$post` for the current post object inside The Loop
- `$authordata` for the current post author
- pagination-related globals such as `$page`, `$pages`, and `$numpages`
- booleans that reflect browser detection

Globals can be useful for understanding what WordPress has already computed, but they should be treated as runtime context, not as a primary extension API. If a dedicated function exists, prefer the function because it is easier to reason about and less coupled to WordPress internals.

---

## CHUNK 2: Treating Filesystem and wp-config.php as Environment-Level Interfaces

The Filesystem API and `wp-config.php` material sit at a lower level than most plugin or theme features. They are part of the site environment rather than ordinary content or admin workflows.

`wp-config.php` is one of the most important files in a WordPress installation because it defines database connection information and foundational configuration. It should be edited with a proper text editor, and database-related constants such as `DB_NAME`, `DB_USER`, `DB_PASSWORD`, and `DB_HOST` should be set carefully based on the hosting environment.

This material is best understood as operational and environmental, not as day-to-day application logic. Plugin and theme code typically should not directly modify environment config files. Instead, these docs are useful for understanding the boundaries of what WordPress expects from the runtime environment.

The core rule is to distinguish between runtime context and application logic. Globals, filesystem access, and base config belong to the platform layer. Use them when necessary, but prefer higher-level APIs whenever WordPress already provides one.

---

## SKILL SUMMARY

- **What this skill enables:** An agent can work safely with WordPress runtime globals and understand when filesystem and configuration concerns belong to the environment layer rather than ordinary plugin/theme logic.
- **When to use:** Use this when debugging runtime context, dealing with platform-level file operations, or reasoning about the boundary between application code and WordPress installation configuration.