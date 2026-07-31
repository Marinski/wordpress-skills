# Security Primitives and Common Vulnerabilities

## CHUNK 1: Building Around Validation, Sanitization, Escaping, and Nonces

WordPress security guidance starts with a mindset: never trust input, never assume stored data is safe, escape as late as possible, and rely on core APIs when they provide secure helpers.

The core data-handling primitives are:

- validation, which checks whether data matches the allowed format or value set
- sanitization, which cleans data when strict validation is not practical
- escaping, which makes data safe for a specific output context
- nonces, which help protect forms and URLs against misuse such as CSRF

Validation is preferred over sanitization because it is more specific. When validation is not possible, sanitization is the next best choice. Common sanitizers include `sanitize_text_field()`, `sanitize_email()`, `sanitize_textarea_field()`, `sanitize_key()`, and `wp_kses()` variants for controlled HTML.

Escaping must happen at output time, not earlier. Context-specific helpers include `esc_html()`, `esc_attr()`, `esc_url()`, `esc_js()`, `esc_textarea()`, `esc_xml()`, and the `wp_kses()` family when some HTML must be preserved.

Nonces protect intent, not authorization. They should never replace `current_user_can()` or other permission checks. Use them for forms, action links, and AJAX flows where you need to verify that a request came from an expected interface context.

---

## CHUNK 2: Defending Against SQL Injection, XSS, and Capability Mistakes

The handbook’s common-vulnerability guidance highlights several recurring risks.

SQL injection happens when untrusted values are incorporated into queries without proper handling. The first defense is to use a WordPress API function instead of raw SQL whenever possible. When custom queries are necessary, use `$wpdb` helpers, especially `$wpdb->prepare()`, to safely parameterize untrusted values.

Cross-site scripting happens when untrusted content is output without proper escaping. Because themes and plugins often render dynamic content, escaping for the correct context is critical. If partial HTML is allowed, constrain it with `wp_kses()` rather than outputting it raw.

CSRF-related issues are mitigated with nonces, but nonces are not enough on their own. Capability checks still decide whether the current user is allowed to perform the action.

The secure workflow is:

- validate or sanitize incoming data
- check capabilities for privileged operations
- use nonces to protect intent in state-changing actions
- escape data at the final output context
- prefer WordPress APIs over direct SQL or manual output handling

This layered approach is the difference between code that merely works and code that stays safe across real deployments.

---

## SKILL SUMMARY

- **What this skill enables:** An agent can apply the core WordPress security primitives correctly and avoid common vulnerabilities such as SQL injection, XSS, CSRF misuse, and missing capability checks.
- **When to use:** Use this when building forms, processing requests, storing untrusted data, rendering dynamic output, or reviewing plugin and theme code for exploit risk.