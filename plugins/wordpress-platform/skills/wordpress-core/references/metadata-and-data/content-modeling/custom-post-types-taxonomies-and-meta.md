# Custom Post Types, Taxonomies, and Meta

## CHUNK 1: Modeling Plugin Data with Custom Post Types and Taxonomies

Plugins often need to define new content models. WordPress supports this through custom post types and custom taxonomies. The handbook explicitly recommends putting custom post types in plugins rather than themes so user content remains portable when the theme changes.

When registering a custom post type, use `register_post_type()` on the `init` hook and keep the identifier prefixed and under 20 characters because the underlying `post_type` database column has that limit.

Custom taxonomies work similarly. They provide structured classification systems beyond the built-in categories and tags. This is useful when content needs multiple domain-specific ways to be organized. For example, a recipe plugin might use a custom post type for recipes and separate taxonomies for course and ingredient.

This gives plugins a durable content model:

- custom post types define the main content entity
- taxonomies define how those entities are classified
- templates and queries can then target those models explicitly

Use content modeling when the data behaves like WordPress content. Do not invent custom tables prematurely when post types, taxonomies, and meta are already a good fit.

---

## CHUNK 2: Using Post Metadata and Meta Boxes for Flexible Content Attributes

Metadata in WordPress is information associated with posts, users, comments, or terms. For posts in particular, metadata gives plugins a very flexible way to store extra information without changing the core posts schema.

Plugins can manage post metadata through APIs such as:

- `get_post_meta()`
- `get_post_custom()`
- `get_post_custom_values()`
- template helpers such as `the_meta()` where appropriate

When plugin authors need editable post-associated fields in the admin, custom meta boxes can provide the UI for collecting and saving those values.

This makes post meta the preferred solution for many plugin data needs, especially when the data belongs to a post-like entity and does not justify its own relational table. The handbook’s database guidance reinforces this by recommending post meta when possible before creating new custom tables.

The design rule is:

- use custom post types when the thing is a content entity
- use taxonomies when it needs classification
- use metadata when it needs flexible extra attributes

This keeps plugin data aligned with WordPress’s native data model.

---

## SKILL SUMMARY

- **What this skill enables:** An agent can design plugin data models using custom post types, custom taxonomies, and metadata instead of overengineering storage too early.
- **When to use:** Use this when a plugin needs new content entities, domain-specific classifications, or flexible post-associated attributes.