# Plugin Privacy Integration

## CHUNK 1: Integrating a Plugin with WordPress Personal Data Tools

If a plugin handles personal data, it should integrate with WordPress privacy tooling instead of treating privacy as an external concern. WordPress added personal data export and erase tools to help site administrators comply with data-access and deletion requests, and plugins can hook into those flows when they store user data in options, metadata, custom post types, or custom tables.

The export flow lets administrators assemble a ZIP file of personal data for a confirmed request. The erase flow lets administrators remove personal data after a confirmed request. In both cases, the UI starts with a username or email address and a confirmation process before the request is executed.

For plugin authors, the key design rule is that if the plugin stores personal data outside the standard WordPress data already covered by core, it should register itself with the exporter and eraser systems so that its data is included in privacy requests.

This applies whether the data is stored in:

- post meta
- user meta
- comments-related data
- custom post types
- custom tables or external systems under plugin control

Privacy support is not just about legality. It is also about making the plugin behave like a first-class citizen in the WordPress admin privacy workflow.

---

## CHUNK 2: Suggesting Privacy Policy Text and Using Privacy Hooks Responsibly

WordPress also lets plugins suggest privacy policy text for site administrators to include in their privacy page. The recommended API is `wp_add_privacy_policy_content( $plugin_name, $policy_text )`, and the handbook recommends calling it during `admin_init` rather than outside an action hook.

This content should describe what the plugin collects, why it collects it, where data is sent, how long it is retained, and any other relevant data-handling behavior. The handbook explicitly warns plugin authors not to overclaim. A plugin may assist with compliance, but it should not imply it can guarantee full legal compliance.

WordPress also provides privacy-related options, actions, and filters such as:

- the site privacy policy page option
- request confirmation actions
- export file generation hooks
- hooks fired after data export or erasure workflows complete

Use these integration points to cooperate with core, not to bypass it. The right pattern is to expose plugin-owned data through native WordPress privacy flows and to describe the plugin’s data practices accurately, conservatively, and transparently.

---

## SKILL SUMMARY

- **What this skill enables:** An agent can integrate a plugin with WordPress privacy exports, erasers, policy text, and related privacy hooks without making misleading compliance claims.
- **When to use:** Use this when a plugin stores personal data or needs to participate in privacy request handling and privacy policy generation.