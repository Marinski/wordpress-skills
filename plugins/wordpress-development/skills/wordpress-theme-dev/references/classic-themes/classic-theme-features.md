# Classic Theme Features

## CHUNK 1: Registering Common Theme Features for Menus, Images, Sidebars, and Widgets

Classic themes frequently add support for WordPress features through `functions.php`. Common examples include navigation menus, featured images, custom logos, custom headers, sidebars, widgets, and pagination behavior.

Navigation menus are registered so users can assign menus to named theme locations, then rendered in templates with `wp_nav_menu()`. Featured images must be explicitly enabled before the interface appears on edit screens. Custom logos and custom headers also require theme support declarations before they can be configured and displayed using the relevant template functions.

Sidebars are widgetized areas in a theme where users can place widgets through the Widgets screen or Customizer. Widgets are the units of content and functionality placed into those areas. A theme may have one widget area or many, and the value of each depends on whether it gives users a meaningful place to customize layout.

A reliable rule is to register only the features your theme genuinely supports and to ensure templates actually render them well. Do not expose a menu location, logo slot, or widget area that the front end does not meaningfully use.

---

## CHUNK 2: Handling Post Formats, Media, Accessibility, and Theme-Specific UX

Classic theme functionality can extend beyond baseline support flags. Post formats let a theme present certain kinds of posts differently, but themes must work within the standardized list of formats. They cannot invent their own formats, which preserves interoperability.

Media handling is another common area. Themes often need to render galleries, images, audio, or video appropriately. For example, WordPress offers helpers such as `wp_get_attachment_image()` for generating image markup from media library attachments. This is safer and more consistent than manually composing media HTML.

Accessibility and user experience also matter at the theme level. Examples include making the site logo link to the homepage, using descriptive anchor text, and ensuring widgetized or navigational elements are understandable and operable. Theme-specific interface decisions should support users rather than impose decorative choices that reduce usability.

Finally, remember that some older practices are no longer preferred. For example, standalone admin menu pages for theme options are not the recommended primary path when the Customizer or more modern configuration systems are a better fit.

A strong theme feature set is not about enabling every option WordPress offers. It is about exposing only the capabilities that improve the user’s editing and browsing experience while keeping the theme predictable and maintainable.

---

## SKILL SUMMARY

- **What this skill enables:** An agent can add or review classic theme support for menus, widgets, sidebars, images, logos, headers, post formats, and related front-end behavior.
- **When to use:** Use this when implementing user-configurable theme features in classic themes or auditing whether a theme has correctly wired supported features into both setup and templates.
