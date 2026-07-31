# Dashboard, Site Health, and Quicktags

## CHUNK 1: Extending WordPress Admin with Dashboard Widgets and Site Health Tabs

WordPress provides lightweight admin integration APIs that let plugins surface useful information without building a full settings area. Two of the most practical are the Dashboard Widgets API and the Site Health extension points.

Dashboard widgets are added with `wp_add_dashboard_widget()` and are typically registered on the `wp_dashboard_setup` hook, or `wp_network_dashboard_setup` for network admin. The API takes a widget slug, label, render callback, optional control callback, and optional callback arguments. This makes it suitable for operational summaries, quick reports, or admin-facing plugin status panels.

Site Health is more structured. Since WordPress 5.8, plugins can add their own tabs to the Site Health interface by filtering `site_health_navigation_tabs` and then rendering tab content on `site_health_tab_content`. This is useful when you need a diagnostics-oriented interface with more space than a dashboard widget provides.

Use dashboard widgets for concise, glanceable information. Use Site Health tabs for deeper diagnostics, environment checks, or maintenance workflows where a dedicated health-related screen is the better UX.

---

## CHUNK 2: Adding Classic Editor Enhancements with Quicktags

The Quicktags API lets developers add buttons to the Text mode of the Classic Editor. It is a JavaScript-side extension point centered on `QTags.addButton()` and is useful when a plugin needs to insert or wrap markup snippets for authors who work in HTML mode.

Modern usage commonly injects the Quicktags JavaScript through `wp_add_inline_script()` or enqueues a proper script on `admin_enqueue_scripts`, then adds buttons when Quicktags is available. Buttons can be scoped to specific editor instances and can include accessibility-related labels through supported attributes such as `ariaLabel` and `ariaLabelClose`.

This API is appropriate when the plugin’s content authoring flow still depends on the Classic Editor or legacy HTML workflows. It is not a general replacement for block editor integrations, but it remains valuable for backward-compatible authoring tools.

Use Quicktags for small HTML-mode authoring helpers, not for building full editor applications.

---

## SKILL SUMMARY

- **What this skill enables:** An agent can extend WordPress admin with dashboard widgets, Site Health tabs, and Classic Editor Quicktags in a way that fits native admin workflows.
- **When to use:** Use this when a plugin needs lightweight admin visibility, diagnostics surfaces, or classic-editor authoring helpers without building a full custom admin app.