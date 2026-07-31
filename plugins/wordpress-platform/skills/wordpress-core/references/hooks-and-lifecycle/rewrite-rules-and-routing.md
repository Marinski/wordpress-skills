# Rewrite Rules and Routing

## CHUNK 1: Registering Custom Rewrite Behavior Without Breaking URLs

WordPress lets themes and plugins register custom rewrite rules so new URL patterns can resolve to meaningful query variables and application behavior. The rewrite system is built around `WP_Rewrite` and helper functions such as:

- `add_rewrite_tag()`
- `add_rewrite_rule()`
- `add_rewrite_endpoint()`
- `add_permastruct()`
- `add_feed()`

These APIs are usually called on the `init` hook. That timing matters because WordPress needs the query environment initialized enough to accept new routing definitions, but you still want the rules registered before request parsing depends on them.

Custom rewrite logic is often necessary when a plugin or theme introduces new URL shapes, querystring variables, endpoints, feeds, or permalink structures. It is also commonly used with custom post types and taxonomies.

The key implementation rule is to separate registration from activation. Register rules on normal runtime hooks such as `init`, but only flush them when necessary, typically on activation, deactivation, or explicit admin maintenance flows. Constantly regenerating rewrite rules on every request is wasteful.

---

## CHUNK 2: Flushing Rules Carefully and Using Rewrite Filters Strategically

After adding or changing rewrite rules, permalinks must be refreshed before the changes take effect. This can be done through the admin permalink screen or with functions such as `flush_rules()` or `flush_rewrite_rules()`. The handbook describes flushing as a one-time operation, not a normal per-request step.

WordPress also exposes filters and actions around rule generation, including:

- `root_rewrite_rules`
- `post_rewrite_rules`
- `page_rewrite_rules`
- `date_rewrite_rules`
- `search_rewrite_rules`
- `comments_rewrite_rules`
- `author_rewrite_rules`
- `rewrite_rules_array`
- `{$permastructname}_rewrite_rules`
- `generate_rewrite_rules`

Use these only when you truly need to alter generated rule sets at a lower level. For most cases, the higher-level helper functions are easier to reason about and less fragile.

The safe pattern is:

- register tags, rules, endpoints, or permastructs on `init`
- flush only when rules actually change
- prefer high-level rewrite helpers over low-level filters unless you need to modify generated rule arrays directly

This keeps routing predictable and avoids turning URL handling into a performance or maintenance problem.

---

## SKILL SUMMARY

- **What this skill enables:** An agent can register custom WordPress routes and rewrite behavior safely, including when to flush rewrite rules and when to use lower-level rewrite filters.
- **When to use:** Use this when a plugin or theme introduces custom URLs, endpoints, query vars, feeds, or permalink structures.