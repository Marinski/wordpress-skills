# wordpress-platform

Agent skills for WordPress platform-level work — everything not specific to
a single plugin or theme.

## Included skills

- **WordPress Core** — hooks and execution order, coding and documentation standards, install/migration/staging, multisite, content modeling (CPTs, taxonomies, meta), options and transients, responsive images
- **WordPress Database** — `wpdb` usage, custom tables, plugin data storage, phpMyAdmin workflows, export/import and maintenance
- **WordPress Performance** — caching, PHP optimization, monitoring/profiling, slow queries, uptime checks, external-request overhead
- **WordPress Security** — capabilities and least privilege, sanitization/validation/escaping, nonces, auth hardening, backups and recovery

## Usage

```bash
claude plugin install ./plugins/wordpress-platform
```

Then reference skills by name in your prompts (e.g. "use wordpress-security").
