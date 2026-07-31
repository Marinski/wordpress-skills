# User Capabilities and Least Privilege

## CHUNK 1: Checking Capabilities Before Accepting or Processing Sensitive Input

If a plugin allows users to submit data, whether in admin or on the public side, it should check user capabilities. Capability checks are one of the most important parts of a WordPress security model because they determine whether the current user is allowed to perform the requested action.

WordPress permissioning is based on users, roles, and capabilities. Roles are named groups such as Administrator, Editor, or Author. Capabilities are the actual permissions those roles grant, such as managing options or editing certain content.

The key guidance is to build around the principle of least privilege. Give users only the permissions necessary for the work they need to perform. When a plugin adds custom roles or capabilities, it should do so sparingly and intentionally.

From a plugin perspective, this means:

- check capabilities before displaying privileged controls
- check capabilities again before processing submitted actions
- do not trust that a logged-in user is authorized just because they reached the page
- scope custom capabilities narrowly when adding new roles or permission checks

Capability checks are not optional decoration. They are the gate that determines whether the rest of your security model matters.

---

## CHUNK 2: Working with Roles, Users, and User-Owned Data Safely

WordPress users are accounts with roles and capabilities, and plugins often need to create users, update profiles, or store additional user-specific metadata. Core functions such as `wp_create_user()` and `wp_insert_user()` support account creation and updates, while user metadata provides a flexible way to store arbitrary extra data tied to a user record.

Because the `users` table only stores essential account fields, the `usermeta` table exists for extension data. Plugins can manage this metadata through profile form hooks or programmatically, depending on whether the user is expected to edit the information directly.

Security still applies throughout this workflow. If a plugin exposes profile fields or user-management operations, it must verify the current user’s permissions before reading or writing sensitive data. User metadata is flexible, but that flexibility increases the need for careful authorization and validation.

Use roles and capabilities to constrain access, use usermeta to store additional data, and keep the principle of least privilege at the center of plugin design.

---

## SKILL SUMMARY

- **What this skill enables:** An agent can secure user-facing plugin behavior by applying role and capability checks and by treating user creation, updates, and metadata management as privileged operations.
- **When to use:** Use this when building admin screens, profile integrations, or any plugin feature that reads, writes, or acts on behalf of users.