# Must-Use Plugins and Admin File Editing

## CHUNK 1: Knowing When Must-Use Plugins Are the Right Tool

Must-use plugins, or `mu-plugins`, are automatically loaded from a special directory and cannot be toggled off through the normal plugins screen. This makes them useful for host-provided functionality, platform bootstrap code, or operational logic that should always run.

The advantages are operational rather than ergonomic:

- they are always on
- they load before normal plugins
- they work even when normal plugin management is limited or broken

That same behavior makes them a poor choice for ordinary feature development. They do not follow the same update and activation lifecycle as regular plugins, and they are easier to forget because they sit outside the usual plugin workflow.

The rule is to use `mu-plugins` for platform-level guarantees, not just because a plugin feels important.

---

## CHUNK 2: Treating the Built-In File Editor as a Risk Surface

The advanced administration plugin docs also cover the admin-side file editor. Its existence does not mean it should be the default workflow. Editing PHP files in the dashboard is risky because syntax or runtime errors can break a site immediately, often without the guardrails you would have in version control, staging, or local development.

The safer workflow is:

- make code changes in version control or a local environment
- test them before deployment
- use direct file access or deployment tooling instead of dashboard editing for substantial changes
- reserve the built-in editor, if used at all, for exceptional situations

This advice aligns with the broader advanced-admin themes of controlled changes, backups, and rollback capability. The admin file editor is a convenience feature, not a mature engineering workflow.

---

## SKILL SUMMARY

- **What this skill enables:** An agent can distinguish must-use plugins from normal plugins operationally and can recommend safe workflows that avoid risky in-dashboard file editing.
- **When to use:** Use this when deciding where platform bootstrap logic belongs, reviewing `mu-plugins`, or advising on safe code-editing practices in WordPress admin environments.