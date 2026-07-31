# Abilities API and Discovery

## CHUNK 1: Registering Discoverable Site Capabilities with the Abilities API

The Abilities API, available in WordPress 6.9 and above, provides a central registry for site capabilities in a machine-readable form. Its purpose is to make functionality discoverable to core, plugins, themes, automation tools, and AI systems without forcing each integration to invent its own capability exposure pattern.

An ability is registered under a namespaced identifier such as `namespace/ability-name` and is represented by `WP_Ability`. Abilities can include:

- a label and description
- an execute callback
- input and output schemas using JSON Schema
- an optional permission callback
- category metadata for grouping and discovery

This makes abilities more than plain callbacks. They are documented, validated, permission-aware capabilities that can be executed consistently.

Typical registration happens on `wp_abilities_api_init`, while categories are registered on `wp_abilities_api_categories_init`. A practical compatibility pattern is to first check whether `WP_Ability` exists and fail gracefully on older WordPress versions.

The core design benefit is standardization. Instead of custom endpoint registries or ad hoc plugin contracts, the site can expose capabilities in one consistent format with schema-backed input and output definitions.

---

## CHUNK 2: Using Hooks, PHP Helpers, and REST Exposure for Abilities

The API includes PHP helpers for category and ability registration, retrieval, and removal. Category slugs have strict formatting rules: lowercase alphanumeric characters and hyphens only. This matters because categories are intended to be stable discovery identifiers, not just UI labels.

The Abilities API also emits hooks around execution, including:

- initialization hooks for categories and abilities
- `wp_before_execute_ability`
- `wp_after_execute_ability`

These hooks make the system observable and extensible for logging, analytics, or cross-cutting behavior.

Abilities can optionally be exposed via REST under the `/wp-abilities/v1` namespace. The `show_in_rest` flag controls whether an ability is visible and executable through REST. When it is false, the ability remains available internally through PHP but is hidden from REST listings and execution.

This leads to a useful separation:

- internal abilities for PHP-only workflows
- discoverable REST-visible abilities for external tools and automation

Use the Abilities API when you want capability discovery, schema-driven validation, fine-grained permission control, and a stable site-level registry instead of isolated one-off integrations.

---

## SKILL SUMMARY

- **What this skill enables:** An agent can register, categorize, validate, observe, and optionally expose site capabilities through the WordPress Abilities API.
- **When to use:** Use this when building AI-friendly or automation-friendly site capabilities, shared plugin interoperability points, or schema-backed callable features in WordPress 6.9+.