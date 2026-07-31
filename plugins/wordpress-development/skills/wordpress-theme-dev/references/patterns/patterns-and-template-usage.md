# Patterns and Template Usage

## CHUNK 1: Using Block Patterns as Reusable Theme Building Blocks

Block patterns are reusable groups of blocks that help theme authors provide richer layouts without forcing users to assemble everything from scratch. Introduced in WordPress 5.4, patterns are one of the most powerful tools available to theme developers because they sit between raw blocks and full templates: more structured than individual blocks, but more flexible than fixed templates.

Patterns can serve multiple roles inside a theme. They can be insertable layouts for end users, starter content for pages or templates, curated building blocks tied to specific block types, or reusable sections embedded directly into theme output. This flexibility is why patterns often become one of the most-used features in a theme project.

Theme authors can register custom patterns directly in the theme and can also bundle patterns from the WordPress Pattern Directory through `theme.json`. This provides a lightweight way to give users a high-quality set of layouts without rebuilding everything manually.

Patterns are especially effective when you want to guide users without fully locking them into a template. They help create good defaults while preserving editing freedom.

---

## CHUNK 2: When to Use Patterns in Templates and When to Use PHP in Patterns

Patterns are not just editor conveniences. They can also be used directly in templates and template parts to power front-end output. This is one of their strongest capabilities in theme development because it lets you build reusable design sections once and then include them in multiple places.

There are two major reasons to use patterns in templates:

- to reuse the same block composition across multiple templates or parts
- to centralize design changes so updating the pattern updates each place it is included

Patterns also support limited PHP usage, which is a major advantage over plain templates and template parts in some scenarios. This makes them useful for dynamic asset references or specific controlled dynamic output. However, there are limits. Theme authors need to understand when the pattern’s block markup is compiled versus when it is rendered, because that affects what dynamic behavior is possible.

Patterns can also be tied to block types, giving users context-specific starting layouts, and can be combined with the Block Locking API to constrain user actions such as moving or removing blocks. This makes them useful not only for reusable design but also for curating the editing experience.

Use patterns when you want reusable, semi-structured content that can live in both the editor and the theme’s rendered layouts. Use templates when you need fixed page-level structure, and use template parts when the reuse is structural rather than pattern-based.

---

## SKILL SUMMARY

- **What this skill enables:** An agent can register, bundle, and apply block patterns in themes, including using patterns inside templates and understanding when limited PHP or locking behavior is appropriate.
- **When to use:** Use this when building reusable block layouts, starter patterns, block-type-specific patterns, or pattern-driven template sections in block themes.
