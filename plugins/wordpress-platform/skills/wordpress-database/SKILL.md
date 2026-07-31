---
name: wordpress-database
description: 'Use when working with WordPress database design or operations, including wpdb usage, custom tables, plugin data storage, database provisioning, phpMyAdmin workflows, export/import maintenance, and low-level database troubleshooting. Good triggers: wpdb, custom table, phpMyAdmin, DB_NAME, DB_HOST, import, export, migration, schema, storage, prepare, MySQL, MariaDB.'
---

# WordPress Database

Use this skill for persistent storage design and operational database work in WordPress.

## When To Use

- Choosing between options, meta, taxonomy, post types, or custom tables for storage
- Working with `wpdb`, schema design, query safety, or plugin-owned storage
- Provisioning a database for WordPress or using phpMyAdmin for import/export and maintenance
- Diagnosing low-level database connectivity or maintenance problems

## Workflow

1. Determine whether the task is application storage design or operational database management.
2. Read the matching reference from `./references/`.
3. Pull in core or security references when config constants or safe query handling are involved.
4. Prefer WordPress APIs unless low-level access is genuinely necessary.

## Reference Map

- Operations: `./references/operations/`
- `wpdb` and queries: `./references/wpdb-and-queries/`

## Recommended Entry Points

- `./references/operations/database-setup-phpmyadmin-and-maintenance.md`
- `./references/wpdb-and-queries/plugin-data-storage-and-custom-tables.md`

Use this skill when the hard part is how data should be stored, queried, migrated, or maintained.