# wp-config, Migration, and Site Operations

## CHUNK 1: Treating wp-config.php as Critical Environment Configuration

`wp-config.php` is the operational center of a WordPress installation. It contains database connection details, table-prefix configuration, and many environment-level constants that affect behavior across the entire site.

The advanced administration guidance reinforces a simple rule: edit this file carefully, back up before changes, and understand the effect of each constant before using it. It is not an ordinary application file. A mistake here can break the entire site.

Important operational uses include:

- setting database credentials and host information
- changing `$table_prefix` when multiple installs share one database
- defining environment-sensitive constants for debugging or authentication behavior
- applying certain migration or domain-mapping fixes when the admin UI is unavailable

This file should be changed with a proper text editor and versioned where possible. Do not treat it as a scratchpad for undocumented tweaks. It is part of the environment contract between WordPress and the hosting layer.

---

## CHUNK 2: Managing Site Moves, URL Changes, and Upgrade Workflows Safely

Migration and upgrade tasks often fail because administrators change URLs or files without accounting for the full system. The advanced-admin material on migration highlights that `WordPress Address (URL)` and `Site Address (URL)` are foundational settings. If they are wrong, both admin access and front-end routing can break.

For site moves and repairs, the safe workflow is:

- back up files and database before making changes
- understand whether you are fixing a broken URL or intentionally moving the site
- change URL-related settings through the admin when possible, or through `wp-config.php` or the database only when necessary
- verify file transfers, database imports, and configuration changes together rather than in isolation

This operational mindset also applies to manual updates via FTP or control panels. Updating WordPress is not just about replacing files. It is about keeping core files, database state, backups, and rollback plans aligned.

The right rule is to treat migration and upgrades as controlled operations. Make changes reversibly, verify each layer, and avoid mixing ad hoc fixes with incomplete backups.

---

## SKILL SUMMARY

- **What this skill enables:** An agent can use `wp-config.php` responsibly, distinguish safe configuration edits from application logic, and plan migrations, URL changes, and updates without breaking site routing or connectivity.
- **When to use:** Use this when editing environment settings, repairing a broken site URL, planning a WordPress migration, or carrying out manual update workflows.