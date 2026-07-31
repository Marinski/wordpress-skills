---
name: wp-content-sync
description: 'Bidirectional WordPress content sync over the WP REST API. Pull existing posts/pages as local markdown for reference. Push approved content as drafts for publishing. Use when asked to: "pull posts from the site", "sync blog posts", "publish this post", "push to WordPress", "list categories", "download posts", or when any content skill needs live site data as reference.'
---

# WordPress Content Sync

Pull posts/pages from the target WordPress site into local markdown. Push approved content back as drafts. All operations use the WP REST API with Application Password auth.

## When To Use

- Pull existing blog posts as markdown reference files (style, structure, keywords)
- Push a finished blog post or page to WordPress as a draft
- Update an existing post (SEO improvements, content refresh)
- List available categories, tags, or post types on the site
- Check what's currently published (titles, dates, slugs, status)

## Credentials

Read from `credentials/wordpress.json` (git-ignored — never commit real values):
```json
{
  "url": "https://example.com",
  "rest_base": "https://example.com/wp-json/wp/v2",
  "user": "WP_USERNAME",
  "app_password": "APPLICATION_PASSWORD"
}
```

All API calls use Basic auth:
```bash
curl -s -u "$USER:$APP_PASSWORD" "$REST_BASE/posts?per_page=10"
```

## Operations

### 1. Pull Posts (Site → Local Markdown)

Fetch recent posts and save as markdown with frontmatter.

**Endpoint:** `GET /wp-json/wp/v2/posts`

**Key parameters:**
- `per_page` — 1–100 (default 10)
- `page` — pagination (check `X-WP-TotalPages` header)
- `status` — `publish`, `draft`, `pending` (auth required for non-publish)
- `orderby` — `date`, `modified`, `title`
- `search` — full-text search
- `categories` — filter by category ID
- `tags` — filter by tag ID
- `after` / `before` — ISO 8601 date range filter
- `_fields` — limit response fields for efficiency

**Procedure:**
1. Read credentials from `credentials/wordpress.json`
2. Fetch posts: `curl -s -u "$USER:$PASS" "$REST_BASE/posts?per_page=20&_fields=id,slug,title,content,excerpt,date,modified,status,categories,tags,yoast_head_json,rank_math_seo"`
3. For each post, extract:
   - `id` — WordPress post ID (for updates)
   - `slug` — URL slug
   - `title.rendered` — post title (HTML entities decoded)
   - `content.rendered` — full HTML body
   - `excerpt.rendered` — excerpt
   - `date` — publish date
   - `modified` — last modified
   - `status` — publish/draft/pending
   - `categories` — array of category IDs (resolve names via `/categories`)
   - `tags` — array of tag IDs (resolve names via `/tags`)
   - SEO fields (Yoast: `yoast_head_json`, RankMath: `rank_math_seo`)
4. Convert HTML body to markdown (strip tags, preserve headings/lists/links/tables)
5. Save to `departments/content/blog/synced/[slug].md` with frontmatter

**Output frontmatter format:**
```yaml
---
wp_id: 1234
slug: example-post-slug
title: "Example Post Title"
status: publish
date: 2026-03-15
modified: 2026-03-20
categories: [Example Category]
tags: [example-tag]
meta_title: "Example Post Title — SEO Version"
meta_description: "Short description for search results..."
synced_at: 2026-03-28T10:00:00Z
---
```

**Storage:** `departments/content/blog/synced/[slug].md`

### 2. Pull Pages

Same as posts but use `GET /wp-json/wp/v2/pages`.

**Storage:** `departments/content/pages/synced/[slug].md`

### 3. Push Post (Local → WordPress Draft)

Create a new post or update an existing one.

**Create:** `POST /wp-json/wp/v2/posts`
**Update:** `POST /wp-json/wp/v2/posts/{id}`

**Required JSON body:**
```json
{
  "title": "Post Title",
  "content": "<p>Full HTML content...</p>",
  "status": "draft",
  "slug": "post-slug",
  "categories": [12, 34],
  "tags": [56, 78],
  "excerpt": "Short excerpt for previews..."
}
```

**Procedure:**
1. Read the markdown file from `departments/content/blog/[slug].md`
2. Parse frontmatter for metadata
3. Convert markdown body to HTML
4. Resolve category/tag names to IDs (use cached list or fetch)
5. POST to API with `"status": "draft"` — **NEVER set status to publish directly**
6. If frontmatter contains `wp_id`, use PUT to update existing post
7. Log the response `id` back into the frontmatter as `wp_id`
8. Set SEO meta fields if available:
  - **Yoast:** include `meta._yoast_wpseo_title`, `meta._yoast_wpseo_metadesc`, `meta._yoast_wpseo_focuskw`
   - **RankMath:** Include `meta.rank_math_title`, `meta.rank_math_description`, `meta.rank_math_focus_keyword`
9. If the site exposes the custom platform endpoint for that content type, prefer its read model for verification because `platform/v1` can expose stored SEO data under `seo.meta`

**CRITICAL: Always push as `draft`. The site owner reviews in WP Admin and publishes manually, or instructs the agent to set status to `publish` after approval.**

### 4. Publish (Draft → Live)

Only on explicit approval from the site owner:
```bash
curl -s -u "$USER:$PASS" -X POST "$REST_BASE/posts/{id}" \
  -H "Content-Type: application/json" \
  -d '{"status": "publish"}'
```

### 5. List Categories & Tags

**Categories:** `GET /wp-json/wp/v2/categories?per_page=100`
**Tags:** `GET /wp-json/wp/v2/tags?per_page=100`

Cache locally in `departments/content/blog/synced/_categories.json` and `_tags.json` to avoid repeated lookups. Refresh weekly or when a mismatch is found.

### 6. List Post Types (Discovery)

Check registered post types:
```bash
curl -s "$REST_BASE/../" | jq '.routes | keys'
```
Look for custom post types beyond `posts` and `pages` (e.g., `/wp/v2/products`, `/wp/v2/portfolio`, `/wp/v2/team`, `/wp/v2/reviews`).

For each CPT you intend to push to, also fetch its declaration so you know its taxonomies and supported fields:
```bash
curl -s -u "$USER:$PASS" "$REST_BASE/types/{cpt_slug}" | jq '{slug, rest_base, taxonomies, supports}'
```
Cache CPT declarations in `departments/content/blog/synced/_cpt-{slug}.json`.

For each custom taxonomy returned by the CPT (e.g. a `product` CPT may use a custom `product_category` taxonomy instead of the default `category`):
```bash
curl -s -u "$USER:$PASS" "$REST_BASE/{taxonomy_rest_base}?per_page=100" \
  | jq 'map({id, name, slug})' \
  > departments/content/blog/synced/_tax-{taxonomy_rest_base}.json
```
Without this you cannot resolve filter terms → numeric term IDs.

Also check the custom platform API when present:
```bash
curl -s -u "$USER:$PASS" "${REST_BASE/\/wp\/v2/\/platform\/v1}"
```

For supported custom content families, `platform/v1` may expose normalized SEO data under `seo.meta`.

### 7. Detect SEO Plugin

```bash
curl -s "$REST_BASE/../" | jq '.namespaces'
```
- If contains `"yoast"` → Yoast SEO active
- If contains `"rankmath"` → RankMath active
- Store result in `departments/content/blog/synced/_seo-plugin.json`

### 8. Push to Custom Post Type

For non-`posts` content (product pages, portfolio items, team profiles, reviews, tools, etc.) use the CPT's `rest_base` discovered in Step 6.

**Create:** `POST /wp-json/wp/v2/{cpt_rest_base}`
**Update:** `POST /wp-json/wp/v2/{cpt_rest_base}/{id}`

Differences vs. regular posts:
1. The endpoint slug is the CPT's `rest_base` (NOT the CPT registration slug — they often differ; e.g. `company` CPT may register a `rest_base` of `companies`).
2. Built-in `categories` / `tags` parameters do NOT apply to most CPTs. Pass custom taxonomy term IDs under their REST key:
   ```json
   {
     "title": "Example Product",
     "content": "<p>...</p>",
     "status": "draft",
     "slug": "example-product",
     "product_category": [42],
     "product_type": [7],
     "featured_media": 9876
   }
   ```
   The custom-taxonomy REST keys are visible in the `types/{cpt}` response under `taxonomies` (Step 6).
3. SEO meta fields (Yoast/RankMath) work the same as for posts.
4. **Always push as `draft`.** Same publish gate as regular posts — the site owner reviews and publishes manually.
5. After create, log the returned `id` and the `link` (edit URL: `{wp_admin}/post.php?post={id}&action=edit`) into the local frontmatter as `wp_id` and `wp_edit_url`.

**Storage** for CPT drafts: `departments/content/data/page-pipeline/{type}/{slug}/draft.md` plus a `wp-draft-url.txt` once pushed.

**Verification** after push (CPT-aware):
```bash
curl -s -u "$USER:$PASS" "$REST_BASE/{cpt_rest_base}/{id}?_fields=id,slug,status,link"
```

### 9. Media Upload (Featured Image + Inline Images)

For every page that needs images (screenshots from a video, logos pulled from the company site, charts, etc.) upload first, then reference the returned attachment ID.

**Endpoint:** `POST /wp-json/wp/v2/media`

**Procedure:**
1. Stage the image file locally (e.g. extracted video frame at `departments/content/data/page-pipeline/{type}/{slug}/media/hero.jpg`, or downloaded site image). Always sanitize the filename — lowercase, hyphens only.
2. Upload with multipart and a `Content-Disposition` header naming the file:
   ```bash
   curl -s -u "$USER:$PASS" \
     -H "Content-Disposition: attachment; filename=hero.jpg" \
     -H "Content-Type: image/jpeg" \
     --data-binary @hero.jpg \
     "$REST_BASE/media"
   ```
   The response is the full attachment object: capture `id`, `source_url`, and `media_details.sizes`.
3. **Set `alt_text` and `caption` immediately** (REST media POST does NOT accept them in the initial body for `--data-binary`):
   ```bash
   curl -s -u "$USER:$PASS" -X POST "$REST_BASE/media/{id}" \
     -H "Content-Type: application/json" \
      -d '{"alt_text":"Example product dashboard showing key metrics","caption":"Source: product admin panel"}'
   ```
4. Use the attachment `id` in the post body:
   - **Featured image:** `"featured_media": <id>` in the create/update payload (Step 3 / Step 8).
   - **Inline image:** in HTML body use `<img src="{source_url}" alt="..." class="wp-image-{id}" />`.
5. Cache the upload result at `departments/content/data/page-pipeline/{type}/{slug}/media/_uploads.json` so re-pushes do not re-upload identical files. Key by content hash.

**Allowed MIME types:** jpg, jpeg, png, webp, gif, svg (only if the site policy allows), mp4 (avoid; prefer YouTube embed). Reject anything else before upload.

**Size limits:** the WP install caps uploads via `upload_max_filesize` (commonly 32–256 MB). Resize images server-side first if larger.

**Image sourcing options (for page-creation routes):**
- `frame:<video_id>:<timestamp>` — extract a frame from a synced video pipeline directory at `departments/content/data/video-pipeline/{video_id}/frames/`. Use `ffmpeg` if the frame doesn't yet exist.
- `download:<url>` — pull from the target company/product website. Always check `robots.txt` and store under `media/source-<n>.jpg` with the originating URL noted in `_uploads.json`.
- `existing:<wp_media_id>` — reuse a media item already in the WP library; skip upload.

## HTML → Markdown Conversion

When converting pulled HTML to markdown:
- `<h2>` → `## `, `<h3>` → `### `, etc.
- `<p>` → paragraph with blank line
- `<ul><li>` → `- ` bullet list
- `<ol><li>` → `1. ` numbered list
- `<a href="url">text</a>` → `[text](url)`
- `<strong>` → `**bold**`, `<em>` → `*italic*`
- `<table>` → markdown table
- `<img>` → `![alt](src)`
- Strip all other HTML tags
- Decode HTML entities (`&amp;` → `&`, `&#8217;` → `'`, etc.)

## Markdown → HTML Conversion

When pushing markdown to WordPress:
- Apply reverse of above rules
- Wrap paragraphs in `<p>` tags
- Use `<h2>`, `<h3>` for headings
- Preserve any embed markers (YouTube, etc.) as WordPress shortcodes or oEmbed URLs on their own line

## Error Handling

- **401 Unauthorized** → Credentials invalid or missing. Check `credentials/wordpress.json`.
- **403 Forbidden** → Application Password lacks permission. Needs Editor or Administrator role.
- **404 Not Found** → Wrong post ID or endpoint. Verify `rest_base` URL.
- **429 Too Many Requests** → Rate limited. Wait and retry with exponential backoff.
- **500 Server Error** → WordPress server issue. Log and escalate.

## Reference

See `references/api-field-mapping.md` for complete WP REST field → local frontmatter mapping.

## Security Notes

- Never log or display the Application Password in output
- Credentials file should not be committed to version control
- All writes go through draft status — no accidental publishes
