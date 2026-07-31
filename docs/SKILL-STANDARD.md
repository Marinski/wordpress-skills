# Skill Authoring Standard

This document defines the contract for authoring and maintaining Claude Code
skills within the `wordpress-skills` plugin marketplace. Every skill in the
`skills/` directory of any plugin MUST conform to this standard.

---

## 1. Directory Layout

```
skills/<skill-name>/
  SKILL.md              # Required — the skill definition
  references/           # Optional — supporting reference docs
  scripts/              # Optional — reusable scripts/snippets
  assets/               # Optional — images, diagrams, templates
```

Each skill lives in its own directory under the plugin's `skills/` folder.
The directory name is the skill's canonical name.

---

## 2. SKILL.md YAML Frontmatter

Every `SKILL.md` MUST begin with YAML frontmatter containing exactly these
fields:

```yaml
---
name: <kebab-case-name>
description: >
  <Third-person statement of WHAT the skill does and WHEN it triggers.
  Include concrete trigger phrases. Maximum 500 characters.>
---
```

### Rules

- **name**: kebab-case, must match the parent directory name exactly.
- **description**: present tense, third person ("Use for", "Activates", "Handles").
  Must state the capability AND list at least 3 concrete trigger phrases.
  Examples: "Use for: building plugins; Trigger: 'register_activation_hook',
  'add_menu_page', 'Settings API'."
  Hard limit: 500 characters.

---

## 3. SKILL.md Body

Target length: **200–400 lines**. If the skill exceeds this, mandatory
sections MUST be extracted into `references/*.md` files and summaries
left in the main body.

### Required Sections

| Section | Purpose |
|---------|---------|
| **Purpose** | One-paragraph summary of the skill's domain and value. |
| **When to use / When NOT to use** | Clear inclusion and exclusion criteria. Prevents false activation. |
| **Core guidance** | The primary methodology, principles, patterns, and decision trees. |
| **Code patterns** | Concrete, runnable PHP (or JavaScript, shell) examples. |
| **Common mistakes** | Antipatterns, gotchas, and pitfalls specific to this domain. |
| **References** | Links to `references/*.md` files OR to authoritative docs (developer.wordpress.org, official sources). |

### Reference Skill Variant

Some skills are primarily **reference catalogs** — hook signatures, API
signatures, database table layouts — where the body would consist of little
more than structured data. These MAY use the **Reference skill** variant.

#### Eligibility

A skill qualifies for the Reference variant ONLY if:
- Its primary function is lookup/retrieval of structured values
- It has no meaningful "Core guidance" or "Code patterns" to teach
- The SKILL.md body (excluding frontmatter) stays **under 100 lines**

#### Structure

```yaml
---
name: <kebab-case-name>
description: >
  <same 500-char rule>
  Must include the phrase "Reference skill" or "Reference" in the
  description so agents can distinguish behaviour from lookup.
---
```

The SKILL.md body MUST contain exactly these sections:

| Section | Required? |
|---------|-----------|
| **Purpose** | Yes |
| **When to use / When NOT to use** | Yes |
| **Core guidance** | No — replace with "This is a reference skill. Go to references/." |
| **Code patterns** | No — same replacement |
| **Common mistakes** | No — same replacement |
| **References** | Yes — MUST list every file in `references/` with one-line annotation |

The body acts as a **routing table**: each `references/*.md` file is
listed with a short description of what it contains and when an agent
should read it.

#### Example

```markdown
## References

| File | Contents | Read when |
|------|----------|-----------|
| `references/hook-reference.md` | Hook execution order and timing across the request lifecycle | Wiring code to the right point in the load sequence |
| `references/multisite-tables.md` | Per-site vs global tables in a network | Designing storage for a multisite plugin |
```

#### Limits

- SKILL.md body: **under 100 lines** (including the routing table).
- If the reference tables themselves exceed 500 lines total across all
  `references/*.md`, the raw data MUST be compressed (e.g. grouped
  tables, abbreviated descriptions) until under that threshold.
- A Reference skill is NOT exempt from the Prohibited Content rules
  (Section 5), the Scrub Policy, or the Review Checklist.

---

### Optional Sections

- Quick reference / cheat-sheet tables (prefer in `references/`)
- Configuration reference
- Workflow diagrams (use Mermaid code blocks)
- FAQ

---

## 4. Code Quality Rules

### PHP Code Blocks

- Every PHP example MUST be **runnable in isolation** or clearly annotated
  with `// Requires:` showing the prerequisite includes/declarations.
- Use WordPress-native APIs and functions — never reinvent core
  (`WP_Query`, `get_option`, `add_action`, `wp_insert_post`).
- Always use `$wpdb->prepare()` for SQL with interpolated values.
- Always escape output (`esc_html`, `esc_attr`, `esc_url`) and sanitize
  input (`sanitize_text_field`, `sanitize_email`) at the boundary.
- Include a plugin/theme file header where relevant for clarity.

Example:

```php
// Compilable snippet — safe custom query with prepared statement
function ats_count_custom_entries() {
    global $wpdb;
    $prefix = $wpdb->prefix;

    return (int) $wpdb->get_var(
        $wpdb->prepare(
            "SELECT COUNT(*) FROM {$prefix}ats_entries WHERE status = %s",
            'active'
        )
    );
}
```

### Non-PHP Code Blocks

JavaScript, shell, and other examples must follow the same principle:
complete enough to run with reasonable setup, with imports shown.

---

## 5. Prohibited Content

The following are NEVER allowed in any skill file:

- **Private domains** (use `example.com` for placeholders)
- **Credentials or secrets** (application passwords, API keys, auth tokens)
- **Account-specific details** (real user names, site URLs, media IDs, user IDs)
- **Personal file paths** (keep `<user>` placeholders)
- **Guarantees** (anything implying a plugin or configuration is always correct or safe)
- **Implied endorsement** (references to specific agencies, hosts, or products as recommendations)

---

## 6. Tone and Style

- **Concise, direct, technical.** No marketing fluff.
- Present tense, active voice where possible.
- Lists > prose for enumerating options, parameters, or steps.
- Code examples > descriptive explanation whenever possible.

---

## 7. Review Checklist

Before submitting a skill PR, verify:

- [ ] Directory name == skill name (kebab-case)
- [ ] `SKILL.md` has valid YAML frontmatter with `name` and `description`
- [ ] Description under 500 chars with trigger phrases
- [ ] Body is 200–400 lines (extracted to `references/` if longer)
- [ ] All required sections present
- [ ] PHP examples use WordPress-native APIs, `$wpdb->prepare()`, and proper escaping
- [ ] No prohibited content (private domains, credentials, account data)
- [ ] No guarantees or implied endorsement
- [ ] `references/`, `scripts/`, `assets/` used if applicable
