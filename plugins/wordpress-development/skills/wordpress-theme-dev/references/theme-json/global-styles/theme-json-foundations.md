# Theme JSON Foundations

## CHUNK 1: Treating theme.json as the Core of Modern Theme Development

The `theme.json` file is the foundation of modern WordPress theming. It works with both block and classic themes, but it is especially central to block themes. While technically not always required, nearly every serious theme project needs it because it defines the settings, styles, presets, templates, and other global design behavior that WordPress exposes across the editor and front end.

Think of `theme.json` as the configuration layer that connects your theme’s design system to WordPress. It can define colors, typography, spacing, layout behavior, block-specific settings, and style rules that are reflected in the editor UI. This means the same configuration can influence both what users are allowed to customize and how the theme actually renders.

Its major strengths are consistency and interoperability. Instead of scattering design decisions across template markup, custom CSS, and ad hoc PHP, you can express many choices in a single structured file. This helps your theme cooperate with WordPress core styles, plugin styles, and user customizations in the Site Editor.

Several major capabilities flow through `theme.json`, including:

- global settings exposed in the editor
- global and block-level styles
- presets such as color palettes and font sizes
- custom templates
- template part metadata
- bundled patterns
- style variations

In practice, `theme.json` should be your first stop for theme design decisions. Only fall back to custom CSS or PHP when the built-in configuration model cannot represent what you need.

---

## CHUNK 2: Structuring theme.json Around Settings, Styles, and Theme Features

A practical way to reason about `theme.json` is to separate its concerns into three groups: settings, styles, and theme-level extras.

The `settings` section controls the design tools and presets available to the site. It includes nested properties for things like color, typography, spacing, layout, border, dimensions, position, shadow, lightbox behavior, block-level settings, appearance tools, and custom values. These settings determine what options users can access and what defaults or presets the theme provides.

The `styles` section controls actual styling applied globally, to elements, or to specific blocks. In modern themes, many styles that would traditionally go into a stylesheet can instead be declared here. This makes them available in the Site Editor’s Styles interface and helps user modifications remain compatible with the theme’s defaults.

Beyond settings and styles, `theme.json` can also define theme-level features such as:

- `customTemplates` for registering additional template options
- `templateParts` for labeling reusable parts and assigning UI areas
- `patterns` for bundling items from the Pattern Directory
- style variation support

This structure supports a clean workflow:

- configure capabilities and presets in `settings`
- define actual default design in `styles`
- register editor-facing theme features with the remaining top-level properties

If you keep that separation clear, your `theme.json` stays understandable as it grows and is easier to maintain over time.

---

## SKILL SUMMARY

- **What this skill enables:** An agent can design or refactor a theme around `theme.json` as the primary configuration source for settings, styles, and editor-integrated theme features.
- **When to use:** Use this when building block themes, modernizing classic themes, or deciding how much of a theme should be expressed in `theme.json` instead of CSS or PHP.
