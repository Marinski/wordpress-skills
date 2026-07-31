# wordpress-content-sync

Agent skill for bidirectional WordPress content synchronization over the
WP REST API.

## Included skills

- **WP Content Sync** — pull posts/pages to local markdown, push approved
  content back as drafts, resolve categories/tags/CPT taxonomies, upload
  media, manage SEO meta (Yoast/RankMath), plus a reusable `sync-posts.sh`
  script.

## Configuration

Connection settings are read from an external, git-ignored credentials file
(see the skill's SKILL.md). Never commit real application passwords.

## Usage

```bash
claude plugin install ./plugins/wordpress-content-sync
```

Then reference the skill by name in your prompts (e.g. "pull posts from the
site using wp-content-sync").
