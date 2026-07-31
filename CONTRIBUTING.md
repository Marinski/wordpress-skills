# Contributing

Thanks for contributing to the WordPress Skills plugin marketplace.

## Adding a new skill

1. Pick the right plugin directory in `plugins/<plugin-name>/skills/`.
2. Create a new directory: `skills/<skill-name>/SKILL.md`.
3. Follow the authoring contract in `docs/SKILL-STANDARD.md`.
4. Ensure SKILL.md is 200–400 lines with all required sections.
5. Add your skill's `name` and `description` to the plugin's `plugin.json`
   if it has a `skills` listing.

## Adding a new plugin

1. Create `plugins/<plugin-name>/` with the required structure.
2. Register it in `.claude-plugin/marketplace.json` under `plugins[]`.
3. Do NOT set `version` — commit SHA drives updates.

## Before opening a PR

- Validate the marketplace: `claude plugin validate .`
- Check all SKILL.md files pass the review checklist in SKILL-STANDARD.md.
- No private domains, credentials, application passwords, or account data.
- No guarantees, performance claims, or implied endorsement.

## PR title format

- `feat(plugin):` — new plugin or skill
- `fix(plugin):` — correction to an existing skill
- `docs:` — documentation-only changes
- `chore:` — CI, tooling, or meta changes
