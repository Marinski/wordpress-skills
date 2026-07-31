# WP REST API → Local Markdown Field Mapping

Maps WordPress REST API response fields to local markdown frontmatter and body content.

## Post Fields

| WP REST Field | Frontmatter Key | Notes |
|---------------|----------------|-------|
| `id` | `wp_id` | Integer. Used for updates (PUT). |
| `slug` | `slug` | URL path segment. Also used as filename. |
| `title.rendered` | `title` | HTML entities decoded. Wrap in quotes in YAML. |
| `status` | `status` | `publish`, `draft`, `pending`, `private` |
| `date` | `date` | ISO 8601. Truncate to `YYYY-MM-DD` in frontmatter. |
| `modified` | `modified` | ISO 8601. Truncate to `YYYY-MM-DD`. |
| `content.rendered` | _(body)_ | Converted to markdown. Not in frontmatter. |
| `excerpt.rendered` | `excerpt` | Plain text, stripped of `<p>` tags. |
| `author` | `author_id` | Integer. Resolve name via `/wp/v2/users/{id}`. |
| `categories` | `categories` | Array of IDs → resolve to names via cached `_categories.json`. |
| `tags` | `tags` | Array of IDs → resolve to names via cached `_tags.json`. |
| `featured_media` | `featured_image_id` | Integer. Resolve URL via `/wp/v2/media/{id}`. |
| `link` | `permalink` | Full URL on the live site. |
| `format` | `format` | Usually `standard`. |

## SEO Plugin Fields

### Yoast SEO
| WP REST Field | Frontmatter Key | Notes |
|---------------|----------------|-------|
| `yoast_head_json.title` | `meta_title` | SEO title (may differ from post title) |
| `yoast_head_json.description` | `meta_description` | Meta description |
| `yoast_head_json.og_title` | `og_title` | Open Graph title |
| `yoast_head_json.og_description` | `og_description` | Open Graph description |
| `yoast_head_json.canonical` | `canonical` | Canonical URL |
| `meta._yoast_wpseo_focuskw` | `focus_keyword` | Primary focus keyword |
| `platform/v1 ... seo.meta._yoast_wpseo_title` | `meta_title` | Preferred readback when custom platform endpoint exists |
| `platform/v1 ... seo.meta._yoast_wpseo_metadesc` | `meta_description` | Preferred readback when custom platform endpoint exists |
| `platform/v1 ... seo.meta._yoast_wpseo_focuskw` | `focus_keyword` | Preferred readback when custom platform endpoint exists |

### RankMath
| WP REST Field | Frontmatter Key | Notes |
|---------------|----------------|-------|
| `meta.rank_math_title` | `meta_title` | SEO title |
| `meta.rank_math_description` | `meta_description` | Meta description |
| `meta.rank_math_focus_keyword` | `focus_keyword` | Primary focus keyword |
| `meta.rank_math_pillar_content` | `pillar_content` | Boolean — is this a pillar page? |
| `meta.rank_math_seo_score` | `seo_score` | RankMath SEO score (0–100) |

## Push Field Mapping (Local → WP REST)

When pushing content to WordPress, map frontmatter back to API fields:

| Frontmatter Key | WP REST Field | Notes |
|----------------|---------------|-------|
| `title` | `title` | String (raw, not rendered) |
| `slug` | `slug` | URL slug |
| `status` | `status` | **Always `draft` unless explicit publish approval** |
| `excerpt` | `excerpt` | String |
| `categories` | `categories` | Array of IDs (resolve names → IDs first) |
| `tags` | `tags` | Array of IDs (resolve names → IDs first) |
| `meta_title` | `meta._yoast_wpseo_title` or `meta.rank_math_title` | Depends on active SEO plugin |
| `meta_description` | `meta._yoast_wpseo_metadesc` or `meta.rank_math_description` | Depends on active SEO plugin |
| `focus_keyword` | `meta._yoast_wpseo_focuskw` or `meta.rank_math_focus_keyword` | Depends on active SEO plugin |
| _(body)_ | `content` | Markdown → HTML conversion |

## Category & Tag Resolution

Cache at `departments/content/blog/synced/_categories.json`:
```json
[
  {"id": 1, "name": "EA Reviews", "slug": "ea-reviews"},
  {"id": 2, "name": "Forex Robots", "slug": "forex-robots"}
]
```

Cache at `departments/content/blog/synced/_tags.json`:
```json
[
  {"id": 10, "name": "scalping", "slug": "scalping"},
  {"id": 11, "name": "mt5", "slug": "mt5"}
]
```

Refresh weekly or when a name lookup fails.
