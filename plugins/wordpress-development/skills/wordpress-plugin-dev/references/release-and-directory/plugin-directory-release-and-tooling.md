# Plugin Directory, Release, and Tooling

## CHUNK 1: Preparing a Plugin for WordPress.org Submission and Review

Shipping a plugin to WordPress.org requires more than working code. The plugin must be production-ready, packaged correctly, documented clearly, and aligned with directory guidelines.

The handbook emphasizes several recurring expectations:

- test the plugin thoroughly across realistic environments
- choose a unique, non-conflicting name because the plugin URL cannot later be changed
- write clear documentation and a valid readme
- submit a complete production-ready ZIP, not a placeholder or development snapshot
- follow the Plugin Directory Guidelines and any stricter block-specific rules if relevant

Directory review also looks for common issues such as poor sanitization, missing validation, improper escaping, and misleading compliance claims. In particular, plugins must not imply that they guarantee legal compliance. They may assist with compliance, but responsibility remains with the site owner.

Assets and metadata matter too. Plugin assets belong in the proper top-level `assets` directory in SVN, not in `trunk/assets`. Readmes drive plugin page rendering, and display naming comes from the main plugin file header.

The right release mindset is to treat WordPress.org as an operational environment with strict expectations, not just a file hosting service.

---

## CHUNK 2: Using Review Tools, Support Channels, and Hosting Workflows Effectively

The handbook also documents the ecosystem around plugin maintenance: support forums, asset management, Subversion hosting, security issue reporting, ownership transfer, special roles, and newer tools such as the WordPress.org MCP server.

For day-to-day release readiness and diagnostics, helper tools matter. The Plugin Check plugin helps test whether a plugin meets WordPress.org directory standards and flags broader best-practice concerns across security, accessibility, performance, and internationalization. Query Monitor and Debug Bar provide runtime debugging insight into hooks, queries, redirects, HTTP requests, and shortcode behavior.

Support and directory workflows are also part of plugin maintenance. If you host on WordPress.org, you are expected to follow forum guidelines, manage support responsibly, and understand ownership-transfer or security-reporting procedures.

The practical workflow is:

- validate code and packaging before submission
- use Plugin Check and runtime debugging tools during development
- keep readme, assets, and release metadata accurate
- treat review feedback, support obligations, and security reporting as part of the product lifecycle

This turns plugin publishing into a disciplined release process instead of a one-time upload.

---

## SKILL SUMMARY

- **What this skill enables:** An agent can prepare a plugin for WordPress.org distribution, align it with directory guidelines, and use WordPress-specific review and debugging tools effectively.
- **When to use:** Use this when packaging a plugin for release, responding to review requirements, maintaining a hosted plugin, or improving submission readiness.