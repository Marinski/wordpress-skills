# Plugin Data Storage and Custom Tables

## CHUNK 1: Deciding Between Options, Meta, and Custom Tables

Plugin data does not all belong in the same storage layer. The handbook separates it into two broad categories:

- setup information, such as user choices and plugin configuration
- ongoing data, such as records that grow over time as the plugin is used

Setup information usually belongs in the options system. This data tends to be limited in size and maps well to key-value storage.

Ongoing, expanding data sometimes justifies a custom database table, but only after you have considered whether WordPress-native storage would work. The handbook explicitly recommends post meta as the preferred option when practical. If the data can be associated cleanly with posts, users, comments, or terms, native metadata is often the better choice.

Create a custom table only when the plugin’s data shape, scale, or query requirements truly need it. Custom tables add schema management, upgrade logic, uninstall responsibilities, and more review surface.

The decision order should usually be:

- options for configuration
- metadata for flexible object-associated data
- custom tables for data that does not fit the native model well

This keeps plugin storage aligned with WordPress conventions and lowers maintenance cost.

---

## CHUNK 2: Managing Table Lifecycle as Part of Plugin Architecture

If a plugin really does need custom tables, table creation becomes part of the plugin lifecycle. Activation may need to create or upgrade the schema, and uninstall may need to remove those tables if the plugin’s data policy warrants full cleanup.

This is why activation, uninstall, and storage design must be considered together. A custom table is not just a database concern. It is a lifecycle concern.

When you create custom tables:

- document what data belongs there and why core storage was insufficient
- create the table during activation or a controlled upgrade path
- avoid deleting it on deactivation
- decide clearly whether uninstall should remove it permanently

Because custom tables increase operational complexity, they should be introduced only when the plugin’s data model requires them, not just because SQL feels familiar.

---

## SKILL SUMMARY

- **What this skill enables:** An agent can choose the correct plugin storage strategy and justify when a custom table is warranted instead of options or metadata.
- **When to use:** Use this when designing plugin persistence, evaluating whether to create tables, or reviewing whether a plugin’s data model is overengineered.