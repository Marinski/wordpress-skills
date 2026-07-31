# Users and User Metadata

## CHUNK 1: Working with Users Through Roles, Capabilities, and Core User APIs

Users in WordPress are accounts with associated roles and capabilities. Plugins can create users, update them, and constrain behavior based on what those users are allowed to do.

Core APIs such as `wp_create_user()` and `wp_insert_user()` support account creation and insertion. `wp_create_user()` is a simpler convenience wrapper around the lower-level insertion flow, while `wp_insert_user()` supports a fuller set of user properties.

When building plugin behavior around users, remember that a role is only a bundle of capabilities. The real permission checks should target capabilities, not assumptions about role names. This aligns with WordPress’s least-privilege model and keeps integrations more flexible.

Plugins may also define new roles or assign custom capabilities, but they should do so only when the built-in roles cannot express the permission boundaries needed for the feature.

---

## CHUNK 2: Extending Accounts with User Metadata Instead of Overloading the Users Table

The core `users` table stores only essential account fields. Extra plugin-specific profile information belongs in the `usermeta` table, which provides one-to-many storage tied to the user ID.

Plugins can manage user metadata in two broad ways:

- through custom fields on the user profile screen
- programmatically through metadata function calls

The profile-screen approach is appropriate when the user can directly edit the information in admin. Programmatic updates are appropriate when the value is derived, synchronized, or managed entirely by plugin logic.

This separation matters because it keeps user storage normalized and avoids trying to turn the users table into an unrestricted schema.

The right model is:

- essential account identity stays in core user fields
- plugin-owned extra profile data goes in usermeta
- authorization decisions remain capability-based even when data is stored per user

---

## SKILL SUMMARY

- **What this skill enables:** An agent can create and manage WordPress users correctly and store plugin-specific account extensions in user metadata rather than core user columns.
- **When to use:** Use this when building membership features, account-linked plugin data, admin profile extensions, or capability-aware user workflows.