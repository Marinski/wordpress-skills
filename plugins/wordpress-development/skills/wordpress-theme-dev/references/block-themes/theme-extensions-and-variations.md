# Theme Extensions and Variations

## CHUNK 1: Extending Block Themes with Custom Templates, Template Parts, and Style Variations

Block themes can go beyond a single default layout by registering custom templates, reusable template parts, and style variations. These features let a theme offer multiple curated experiences without duplicating the entire theme.

The `customTemplates` property in `theme.json` lets a theme define additional template options beyond the defaults. This is useful when you want alternate layouts such as a blank page, a page with a sidebar, or a simplified post template. Each entry typically identifies the template file by name and gives it metadata that makes sense in the interface.

The `templateParts` property supports reusable sections such as headers and footers. In addition to the file itself, the theme can assign a translatable title and an area so the Site Editor can present those parts more clearly. This makes template parts not only reusable but also easier for users to understand and manage.

Style variations add another layer of flexibility by letting a single theme expose multiple design directions. These are distinct from block variations and block style variations. A style variation changes the broader theme-level visual system, whereas block variations and block styles apply to individual blocks.

Used together, these features let one theme support multiple layouts and visual identities without becoming unmaintainable.

---

## CHUNK 2: Choosing Between Block Variations, Block Stylesheets, and Block Style Variations

WordPress uses the word “variation” in multiple overlapping systems, so theme authors need to keep them distinct. Block style variations, block variations, and global style variations are related but not interchangeable.

Block style variations, often called block styles, are alternate visual treatments for a block. They are not the same as block stylesheets, which are a mechanism for loading CSS specifically for blocks when `theme.json` alone is not enough.

Block variations are variations of an existing block’s behavior or starting configuration. They are often associated with plugin development, but there are valid theme use cases when a theme needs to guide how a block is inserted or initialized.

Block stylesheets are the fallback when styling a block through `theme.json` is insufficient. The handbook explicitly recommends using the `styles` property in `theme.json` whenever possible because it works better with core styles, plugins, and user customizations. Only step outside that system when a stylesheet is genuinely necessary.

A strong decision rule is:

- use global style variations for alternate theme-wide looks
- use block style variations for alternate block appearances
- use block variations for alternate block configurations or behaviors
- use block stylesheets only when `theme.json` cannot express the needed styling

This keeps the theme aligned with WordPress’s preferred systems and reduces conflicts across editing contexts.

---

## SKILL SUMMARY

- **What this skill enables:** An agent can extend block themes with custom templates, template part metadata, style variations, block styles, block variations, and targeted stylesheet fallbacks.
- **When to use:** Use this when a theme needs multiple layouts or visual identities, when block-specific presentation needs alternatives, or when deciding whether a styling concern belongs in `theme.json` or a block stylesheet.
