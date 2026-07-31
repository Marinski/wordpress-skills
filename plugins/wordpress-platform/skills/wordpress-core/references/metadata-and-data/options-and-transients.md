# Options and Transients

## CHUNK 1: Storing Persistent Configuration with the Options API

The Options API is the standard way to store named configuration values in WordPress. It provides a simple key-value model backed primarily by the `wp_options` table, with multisite equivalents in `wp_sitemeta` when network-wide storage is needed.

Core functions include:

- `add_option()` and `delete_option()`
- `get_option()` and `update_option()`
- `add_site_option()` and `delete_site_option()`
- `get_site_option()` and `update_site_option()`

Use options for persistent configuration and settings, not for large evolving datasets. Options are ideal for plugin or theme preferences, feature toggles, and structured configuration that changes occasionally but needs to persist across requests.

The important design distinction is scope. Regular option functions are site-specific. The `_site_` variants are for multisite network-wide values. Choose based on whether the setting belongs to one site or the whole network.

When a plugin or feature needs durable configuration rather than content-like or relational data, the Options API is usually the correct storage layer.

---

## CHUNK 2: Using Transients for Expiring Cached Data

Transients are the time-bounded companion to options. While options are for persistent configuration, transients are for cached values that can expire and be regenerated. This makes them a strong fit for things like remote API responses, expensive computed values, or short-lived snapshots.

The performance guidance in the HTTP documentation aligns naturally with transients: if repeated requests would fetch the same remote data, store the result locally and refresh it on a schedule or expiration instead of hitting the external API every time.

The design rule is:

- use options for canonical configuration
- use transients for cacheable values that may expire or be recomputed

Keeping this distinction clear helps avoid abusing options as a cache or relying on transients for permanent state.

---

## SKILL SUMMARY

- **What this skill enables:** An agent can choose between durable configuration storage with options and expiring cache storage with transients.
- **When to use:** Use this when designing plugin or theme state, caching remote data, or deciding whether a value should persist permanently or be safely regenerated.