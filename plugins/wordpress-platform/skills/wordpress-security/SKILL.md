---
name: wordpress-security
description: 'Use when handling WordPress security, including capabilities, least privilege, sanitization, validation, escaping, nonces, authentication hardening, application passwords, HTTPS, backups, safe updates, and operational recovery. Good triggers: current_user_can, nonce, XSS, SQL injection, CSRF, brute force, 2FA, HTTPS, backup, recovery, hardening, esc_html, sanitize_text_field, wp_kses, capability checks.'
---

# WordPress Security

Use this skill for security controls, access boundaries, hardening, and recovery planning.

## When To Use

- Capability checks, roles, least privilege, or access design
- Input validation, sanitization, escaping, nonces, or common vulnerability prevention
- Login hardening, application passwords, HTTPS, brute-force mitigation, or transport safety
- Backups, recovery, or update workflows where security and rollback matter

## Workflow

1. Identify whether the task is authorization, data handling, authentication, transport hardening, or recovery.
2. Read the relevant reference in `./references/`.
3. Combine with plugin/core/REST references only as needed for the concrete feature.
4. Prefer layered controls over single-mechanism fixes.

## Reference Map

- Hardening and recovery: `./references/hardening-and-recovery/`
- Permissions and capabilities: `./references/permissions-and-capabilities/`
- Sanitization and validation: `./references/sanitization-validation/`

## Recommended Entry Points

- `./references/sanitization-validation/security-primitives-and-common-vulnerabilities.md`
- `./references/permissions-and-capabilities/user-capabilities-and-least-privilege.md`
- `./references/hardening-and-recovery/authentication-hardening-and-transport-security.md`
- `./references/hardening-and-recovery/backups-recovery-and-safe-updates.md`

Use this skill whenever safety, access control, or recovery posture is a primary concern.