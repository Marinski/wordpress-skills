# Theme JSON Settings and Presets

## CHUNK 1: Configuring Theme Capabilities with theme.json Settings

The `settings` property in `theme.json` controls which design tools, presets, and configuration options are available across the site. It is a top-level property with many nested sections, and it is one of the main ways a theme defines what users can customize.

The available settings cover a broad surface area, including:

- appearance tools
- block-specific settings
- border options
- color controls and palettes
- custom settings for theme-specific CSS variables
- dimensions
- layout
- lightbox behavior
- position
- shadow presets
- spacing tools
- typography controls
- root-padding-aware alignments

A good mental model is that `settings` defines the theme’s design vocabulary. For example, `settings.color` controls color-related configuration shown in the editor UI. `settings.spacing` deals specifically with margin, padding, and gap. `settings.typography` exposes typography-related controls. `settings.shadow` can define shadow presets, including whether default presets stay enabled.

The `settings.custom` property is especially useful because it lets a theme define its own custom values that can be surfaced as CSS custom properties. This is helpful when your theme needs tokens that do not map cleanly to the built-in preset categories.

Use `settings` to deliberately shape the editor experience. If a design option should be available and standardized, model it here first instead of relying on arbitrary custom CSS.

---

## CHUNK 2: Using Presets, Global Styles, and Root Padding Behavior Effectively

Presets are one of the most important theme.json features because they create reusable design tokens that WordPress can expose consistently in both the editor and front end. For example, when you define a custom color palette or font-size scale, WordPress generates CSS custom properties such as `--wp--preset--color--{slug}` or `--wp--preset--font-size--{slug}`.

This turns theme configuration into reusable tokens that can be referenced throughout the design system. A custom palette with three colors becomes a set of predictable CSS variables output by WordPress, reducing duplication and aligning editor choices with real front-end styles.

The `styles` side of `theme.json` builds on these presets by applying concrete styles to the root element, specific elements, or individual blocks. In many cases, global styling that once lived in a stylesheet can now be expressed directly in `theme.json`, which keeps it compatible with the Styles interface in the Site Editor.

One setting that deserves special care is `settings.useRootPaddingAwareAlignments`. This works alongside `styles.spacing.padding` and changes how wide and aligned blocks behave relative to root padding. If your theme relies on padded page containers and wide/full alignments, this setting can make those relationships more predictable.

The practical workflow is:

- define reusable tokens as presets
- expose only the settings users should have
- apply defaults in `styles`
- use root-padding-aware behavior intentionally when working with container padding and alignments

This produces a cleaner and more coherent block theme system.

---

## SKILL SUMMARY

- **What this skill enables:** An agent can configure `theme.json` settings, presets, and global styles in a way that produces consistent editor controls and reusable design tokens.
- **When to use:** Use this when building a design system for a theme, defining palettes and typography scales, or controlling how layout and spacing tools behave in the editor.
