# Scrub Policy

Every skill published to this marketplace MUST pass through these rules.
The goal is zero prohibited content reaching the marketplace while
preserving the skill's technical value.

---

## Rule 1 — REMOVE OUTRIGHT

The following MUST be replaced with obvious placeholders. No exceptions.

| Category | Examples | Replace with |
|----------|----------|--------------|
| Real site domains | `https://example-site.com` | `https://example.com` |
| Application passwords / API keys | `xxxx xxxx xxxx xxxx` | `APPLICATION_PASSWORD` |
| WP user names | `admin`, `marin` | `WP_USERNAME` |
| Real post/media/user IDs | `1234` | `POST_ID`, `MEDIA_ID` |
| Real server hostnames | `db1.example-host.net` | `DB_HOST` |
| Personal file paths | `C:\Users\<username>\...` | `C:\Users\<user>\...` (keep `<user>` placeholder) |
| Non-official download URLs | `mirror.example.invalid/...` | Replace with official WordPress.org URL or `<official-download-url>` |

### How to replace

- Inline in code: `curl -u "$WP_USER:$WP_PASS" "https://api.example-site.com/..."` → `curl -u "$WP_USER:$WP_PASS" "https://api.example.com/..."`
- In prose: "on our site at algotradingspace.com" → "on the target site (use `example.com` as a placeholder)"
- In config examples: show only the shape of the config, never real values

**Do not** keep real data in comments, commit history, or adjacent files.

---

## Rule 2 — GENERALIZE Named Sites Used as Examples

When a document uses a specific site, plugin, host, or agency as an example
of behaviour:

1. Replace the name with a description of *what the thing does* that causes
   the behaviour the reader needs to handle.
2. Provide runtime resolution where possible instead.

### Examples

| Before | After |
|--------|-------|
| "On algotradingspace.com the upload cap is 64 MB" | "The WP install caps uploads via `upload_max_filesize` (commonly 32–256 MB). Resize images server-side first if larger." |
| "Yoast SEO is active on our site" | "Detect the SEO plugin at runtime via `wp-json/` `namespaces` (contains `yoast` or `rankmath`)." |

### Rationale

A specific name is a liability: it can become outdated, it may not apply to
all versions, and it implies endorsement. Describing the *category of
behaviour* keeps the skill accurate regardless of which site the reader uses.

---

## Rule 3 — KEEP BUT ISOLATE Site-Specific Presets

Site-specific configuration — sync paths, CPT declarations, taxonomy names —
is genuine technical content when expressed as a *pattern*. It stays, but
isolated and generic.

### Structure

Concrete values (real URLs, real term IDs, real file paths) go in exactly
one place: a `references/site-config.md` file, or are referenced as
external config not committed to the repo (e.g. a `credentials/` file that
is git-ignored).

That file MUST begin with a dated verification header:

```
# Site Configuration Presets
> **Last verified:** 2026-07-31
> **Verify before use:** Site configuration changes frequently.
> Replace placeholders with the target site's values before use.
```

### Code pattern in SKILL.md

```php
// Read connection settings from external config (git-ignored), never hardcode
$config = json_decode(
    file_get_contents(WP_CONTENT_DIR . '/credentials/site.json'),
    true
);
```

### What stays in SKILL.md body

- References to "the target site" in descriptions and conceptual guidance.
- Generic algorithms and workflows (pull → convert → push → verify).

### What goes into references/ or external config

- The concrete URL/base for a specific site.
- Term/media/user IDs specific to a site.
- SEO plugin-specific field names (kept generic in the body).

### What is removed

- Hardcoded real URLs, credentials, or IDs inline in code examples.

---

## Rule 4 — AMBIGUOUS: Flag, Do Not Guess

Any content that does not clearly fall into Rule 1, 2, or 3 must be
**flagged** and left unchanged until a human reviews it.

### How to flag

In the migration PR or commit message, add a line like:

```
FLAG: skills/<name>/SKILL.md:42 — references "<content>".
Rule 1/2/3? Decision needed: [context].
```

When in doubt: flag it. The agent must never silently pass ambiguous
content.

---

## Review Checklist for Scrub

- [ ] Rule 1: Real domains, credentials, user names, IDs, hostnames, personal paths, non-official URLs — all replaced with placeholders
- [ ] Rule 2: Named site examples replaced with behaviour descriptions and runtime resolution
- [ ] Rule 3: Site-specific presets isolated to external config or `references/` with dated header; SKILL.md uses generic patterns
- [ ] Rule 4: All ambiguous content flagged for human review
- [ ] `git log` checked for any prohibited content in commit history pre-scrub
