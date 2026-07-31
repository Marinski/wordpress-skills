# Customizer and Theme Options

## CHUNK 1: Modeling Theme Options with the Customize API

The Customize API is the recommended way for classic themes to provide configurable theme options when a user-facing settings experience is needed. It is object-oriented and built around four main concepts: panels, sections, settings, and controls. Settings represent stored values, controls are the user interface tied to those values, sections group related controls, and panels group sections.

All of these objects are managed through `WP_Customize_Manager`. A theme typically registers them in PHP during the customize registration flow. This gives the theme a structured way to expose options without scattering ad hoc settings pages across the admin.

This approach is preferable to older standalone administration menu patterns for theme options. A theme may still need an admin-facing settings experience in some cases, but the handbook explicitly frames the Customizer as the recommended path for greater control and flexibility.

A practical principle is to expose only settings that users can reasonably understand and that are safe for a presentation layer to own. Visual and layout preferences often belong in a theme. Site-wide business rules usually do not.

---

## CHUNK 2: Improving Customizer UX with Context, JavaScript, and Advanced Usage

The Customize API is more than a static set of controls. It also supports contextual behavior and JavaScript-driven enhancements. Contextual controls, sections, and panels let parts of the Customizer appear only when relevant to the current preview state. For example, a header-related control can be made visible only when the previewed page actually uses the header behavior that setting affects.

WordPress also provides JavaScript APIs for Customizer objects, with models for controls and related entities in core scripts such as `wp-admin/js/customize-controls.js`. This allows themes to build richer interactions, dynamic control behavior, and custom control types, including JavaScript or Underscore-based rendering patterns.

Advanced usage can include adjusting access, building more responsive preview workflows, and improving discoverability of settings. But the goal should remain the same: make the configuration experience clearer, not more complicated.

When deciding whether to use the Customizer, ask whether the option belongs to the theme’s presentation concerns and whether users benefit from a live-preview editing experience. If yes, the Customizer is usually a better fit than a one-off theme settings page.

---

## SKILL SUMMARY

- **What this skill enables:** An agent can model theme options with the Customize API, organize controls into a sensible structure, and improve the configuration experience with contextual and JavaScript-enhanced behavior.
- **When to use:** Use this when adding classic-theme options, replacing older theme option screens, or designing a user-facing customization workflow for theme presentation settings.
