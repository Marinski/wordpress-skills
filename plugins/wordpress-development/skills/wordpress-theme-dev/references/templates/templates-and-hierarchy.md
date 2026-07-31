# Templates and Hierarchy

## CHUNK 1: Building Theme Layouts with Templates and Template Parts

Templates are the files that define the front-end document structure of a WordPress site. In modern theme development, they work together with `theme.json`: templates determine where content goes, while `theme.json` controls much of the design system applied to that structure.

A template is responsible for page-level layout. If you want a large footer, a custom page arrangement, or a special archive structure, the template is where that composition happens. Template parts, by contrast, are smaller reusable sections such as headers, footers, sidebars, and comments areas that can be included across multiple templates. Their purpose is to avoid repetition and keep themes maintainable.

Common template parts in classic themes include:

- `header.php`
- `footer.php`
- `sidebar.php`
- `comments.php`
- `content-{$slug}.php`

In block themes, template parts are still reusable sections, but they are expressed through the block-based template system and can also be described in `theme.json` with user-friendly titles and areas. The core idea remains the same: reusable pieces belong in parts, not duplicated inside every top-level template.

Use templates for the outer structure of a page and template parts for repeated sections. This distinction makes it easier to evolve a theme’s design, swap sections across layouts, and keep file responsibilities clear.

---

## CHUNK 2: Understanding the Template Hierarchy and Specialized Template Files

WordPress uses a template hierarchy to decide which file should render a given request. The template loader examines the queried object and works from most specific to most general until it finds a valid match. Every theme must have a fallback template, historically `index.php` in classic themes, because this guarantees WordPress can always render content even when no more specific template exists.

This matters because many specialized templates only make sense when your design needs them. For example, custom post type templates allow different rendering for a specific post type’s single or archive views. Page templates let you define alternate layouts for individual pages or groups of pages. Attachment templates target media attachment views. Post templates govern blog and post-specific output.

A practical workflow is to start with the minimum fallback and then add specialization only when the content model justifies it. Reach for dedicated template files when you need a distinct layout for a page type, post type, taxonomy, attachment, or reusable section.

For classic themes, conditional tags and the template hierarchy often work together: conditional tags help branch logic inside a template, while the hierarchy determines which template file loaded in the first place. Use hierarchy first for structural differences and conditional logic second for smaller behavioral differences within a selected template.

That approach keeps themes easier to reason about and avoids stuffing too many responsibilities into one catch-all template.

---

## SKILL SUMMARY

- **What this skill enables:** An agent can choose the right template file, split reusable sections into template parts, and apply the template hierarchy correctly for both general and specialized views.
- **When to use:** Use this when creating or refactoring theme layouts, adding page or post-type-specific templates, or deciding whether a change belongs in a top-level template, a template part, or conditional logic.
