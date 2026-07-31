---
name: wordpress-core
description: 'Use when working with WordPress core concepts, coding standards, documentation standards, hooks, runtime environment, installation, migration, debugging, multisite, content modeling, options, transients, responsive images, or general operational troubleshooting. Good triggers: wp-config, add_action, add_filter, hooks, coding standards, inline docs, multisite, installation, staging, migration, loopbacks, CPT, custom post type, taxonomy, user meta, metadata, globals, rewrite rules, options API, transients API, permalink issues.'
---

# WordPress Core

Use this skill for WordPress platform-level work that is not specific to a single plugin or theme.

## When To Use

- Core PHP, JavaScript, HTML, or documentation standards
- Hooks, rewrite rules, execution order, or runtime behavior
- Installation, local development, staging, migration, or `wp-config.php`
- Multisite architecture, creation, administration, or domain mapping
- Content modeling with post types, taxonomies, meta, users, options, or transients
- Debugging, loopbacks, operational troubleshooting, responsive images, or environment boundaries

## Workflow

1. Identify whether the task is core/platform-level rather than plugin-only or theme-only.
2. Read the most relevant reference file from `./references/`.
3. If the task spans multiple areas, combine only the needed references instead of loading the whole corpus.
4. Prefer WordPress-native APIs and operationally safe workflows over ad hoc edits.

## Reference Map

- Coding standards: `./references/coding-standards/`
- Documentation standards: `./references/documentation/`
- Hooks and routing: `./references/hooks-and-lifecycle/`
- Metadata and data modeling: `./references/metadata-and-data/`
- Runtime, install, migration, debugging, troubleshooting: `./references/runtime-and-environment/`
- Multisite: `./references/multisite/`
- Media and assets: `./references/media-and-assets/`

## Recommended Entry Points

- Start with `./references/runtime-and-environment/installation-and-local-development.md` for setup and staging
- Start with `./references/runtime-and-environment/wp-config-migration-and-operations.md` for environment config or site moves
- Start with `./references/hooks-and-lifecycle/hook-reference-and-execution-order.md` for hook timing and flow
- Start with `./references/multisite/multisite-foundations-and-network-creation.md` for network decisions

Keep this skill focused on core architecture and operations. For REST integration, plugin-specific UI, theme behavior, or security-only questions, use the corresponding domain skill.