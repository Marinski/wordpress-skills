# Database Setup, phpMyAdmin, and Maintenance

## CHUNK 1: Creating and Configuring a WordPress Database Safely

WordPress installation depends on a correctly provisioned database and user. The advanced administration material frames this as an operational task, not just a setup checkbox. You need a database, a user with the right privileges, and configuration values that match what will later be placed in `wp-config.php`.

When using phpMyAdmin or a host control panel, the core workflow is:

- create a dedicated database for the WordPress site
- create or select a database user
- grant the user the privileges needed for that database
- choose a modern collation and character set, typically `utf8mb4`
- record the database name, username, password, and host accurately

This information flows directly into `DB_NAME`, `DB_USER`, `DB_PASSWORD`, and `DB_HOST`. If it is wrong, installation fails. If it is sloppy, later migration or troubleshooting becomes harder.

The handbook also makes clear that shared hosting conventions matter. Some hosts require prefixed database names or specific workflows in their panels. The operational rule is to respect the hosting environment rather than assuming a generic local-development pattern will map cleanly to production.

---

## CHUNK 2: Using phpMyAdmin for Inspection, Backup, and Low-Level Maintenance

phpMyAdmin appears throughout advanced administration because it is often the most accessible database tool available to WordPress site operators. It is useful for inspecting tables, exporting backups, importing data, and performing one-off maintenance when WordPress itself is unavailable.

That power comes with risk. Raw database access bypasses WordPress APIs, capability checks, and validation layers. Use it for operational tasks such as export, import, inspection, and carefully controlled maintenance, not for casual content management.

Relevant advanced-admin patterns include:

- exporting databases for backup or migration
- importing dumps during restore or site moves
- emptying tables only when you understand the data impact
- checking environment variables such as temporary-directory configuration when SQL file-write errors appear

The important decision rule is to prefer normal WordPress interfaces or WP-CLI for routine work when possible. Reach for phpMyAdmin when the task is operational, recovery-oriented, or impossible through the normal application layer.

Treat database administration as part of site reliability. Back up before risky changes, document what you touched, and keep database operations aligned with the WordPress configuration that points to them.

---

## SKILL SUMMARY

- **What this skill enables:** An agent can provision a WordPress database correctly, map database credentials into WordPress configuration, and use phpMyAdmin or equivalent tools safely for maintenance and recovery tasks.
- **When to use:** Use this when installing WordPress, diagnosing database-connection problems, performing manual backup or restore work, or handling low-level database maintenance.