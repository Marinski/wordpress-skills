# Theme Authoring Quality

## CHUNK 1: Applying Accessibility, UI, and Localization Discipline in Themes

Theme quality is not limited to layout and styling. Accessibility, clear interface behavior, and localization readiness all affect whether a theme works well for real users.

Accessibility guidance in the Theme Handbook emphasizes that presentation choices should not undermine usability. Examples include making the logo link to the homepage, using descriptive anchor text, and ensuring interface regions such as navigation, sidebars, and widget areas remain understandable. Block themes and classic themes both need accessibility attention, even though the implementation details differ.

Localization follows internationalization. A theme should be built so strings and user-facing text can be translated, and any localization workflow should fit the broader WordPress i18n model. Theme authors should treat translation readiness as a baseline quality concern rather than an optional enhancement.

The same mindset applies to privacy compatibility. Themes may not directly implement privacy tooling, but they should not conflict with WordPress privacy features and should render privacy-related links or UI correctly when present.

A helpful rule is to treat accessibility, localization, and privacy as cross-cutting quality constraints. They should inform templates, text output, settings design, and front-end markup from the beginning.

---

## CHUNK 2: Using Child Themes and Theme-Level Best Practices Without Overloading the Theme

Child themes let developers modify an existing parent theme without editing the parent directly. They can be as simple as a few color changes or as complex as full template overrides. This makes them the right mechanism when you need to customize an existing theme while preserving upgradeability.

Good theme authoring also depends on restraint. Themes should own presentation and user-facing configuration, not application behavior that belongs in plugins. This principle appears repeatedly across theme guidance, including recommendations around functions.php usage, admin menus, and feature registration.

When reviewing a theme, ask:

- does this belong in the presentation layer?
- can this be expressed with existing WordPress systems such as `theme.json`, template hierarchy, or the Customizer?
- is the theme exposing only the options and features it can support well?

Following these rules improves not just code quality but also the user experience of running and extending the theme. A well-authored theme gives users flexibility without making the site fragile.

---

## SKILL SUMMARY

- **What this skill enables:** An agent can evaluate and improve theme-level quality across accessibility, localization readiness, privacy compatibility, child-theme extensibility, and scope discipline.
- **When to use:** Use this when auditing a theme for release quality, deciding whether functionality belongs in a theme or plugin, or designing a theme intended to be extended safely by child themes.
