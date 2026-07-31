# Classic Theme Basics

## CHUNK 1: Building Classic Themes with Template Files, The Loop, and Conditional Logic

Classic themes are built around PHP template files rather than block-based HTML templates. Their anatomy is organized around files such as `index.php`, specialized template files, template tags, The Loop, and conditional logic. Even though block themes are now central to modern WordPress, classic themes remain relevant for maintenance, legacy projects, and some custom builds.

Every valid classic theme needs an `index.php` fallback template. From there, the template hierarchy determines whether more specific files handle a request. Template files are modular and reusable: some, like headers and footers, appear on many pages, while others only load in particular circumstances.

The Loop is the core pattern WordPress uses to pull queried content from the database and render it. Template tags then output dynamic values such as titles, permalinks, excerpts, metadata, and menus. Conditional tags let the theme branch behavior depending on context, such as front page, home, admin, or other query conditions.

A good classic-theme workflow is:

- rely on template hierarchy for structural differences
- use The Loop to render queried content
- use template tags for output
- use conditional tags for controlled context-specific behavior inside templates

This keeps classic themes maintainable instead of turning them into giant monolithic files full of hardcoded branching.

---

## CHUNK 2: Organizing Classic Theme Files and Theme-Level PHP Responsibly

Classic themes benefit from clean file organization. As projects grow, it becomes important to separate base templates, specialized templates, partials, and utility code. Common partials include `header.php`, `footer.php`, `sidebar.php`, `comments.php`, and content partials such as `content-{slug}.php`.

The `functions.php` file remains the main place for theme-specific PHP features. It behaves like a plugin in the sense that it hooks into WordPress and adds functionality, but it should still focus on theme concerns: setup, support flags, menus, sidebars, asset loading, image support, and similar integrations.

Classic themes also often rely on additional concepts that affect template behavior, such as post types, categories, tags, custom taxonomies, and specialized page templates. Because page templates can apply to individual pages or broader groups of content, they are often the right tool when you need alternate layouts without restructuring the whole hierarchy.

As a maintenance strategy, keep structural presentation in templates, reusable fragments in partials, and setup logic in `functions.php`. If behavior becomes more application-like than presentation-related, it likely belongs in a plugin instead of the theme.

---

## SKILL SUMMARY

- **What this skill enables:** An agent can work effectively in classic themes using template files, The Loop, template tags, conditional tags, and disciplined theme file organization.
- **When to use:** Use this when maintaining legacy themes, building classic PHP-based themes, or translating requirements into the classic template hierarchy.
