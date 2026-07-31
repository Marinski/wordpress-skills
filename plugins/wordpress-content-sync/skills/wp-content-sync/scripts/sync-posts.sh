#!/usr/bin/env bash
# sync-posts.sh — Pull recent posts from the target WP site REST API
# Converts HTML to markdown and stores in departments/content/blog/synced/
#
# Usage: bash skills/wordpress/wp-content-sync/scripts/sync-posts.sh [count]
#   count = number of recent posts to pull (default: 20)

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
WORKSPACE_ROOT="$(cd "$SCRIPT_DIR/../../.." && pwd)"
CRED_FILE="$WORKSPACE_ROOT/../credentials/wordpress.json"
SYNC_DIR="$WORKSPACE_ROOT/departments/content/blog/synced"

# Read credentials
if [[ ! -f "$CRED_FILE" ]]; then
  echo "ERROR: Credentials not found at $CRED_FILE"
  echo "Create an Application Password in WP Admin and update credentials/wordpress.json"
  exit 1
fi

REST_BASE=$(jq -r '.rest_base' "$CRED_FILE")
WP_USER=$(jq -r '.user' "$CRED_FILE")
WP_PASS=$(jq -r '.app_password' "$CRED_FILE")

if [[ "$WP_USER" == "REPLACE_WITH_WP_USERNAME" ]]; then
  echo "ERROR: Credentials not configured. Update $CRED_FILE with real values."
  exit 1
fi

COUNT="${1:-20}"
mkdir -p "$SYNC_DIR"

echo "Pulling $COUNT recent posts from $REST_BASE..."

# Fetch posts
RESPONSE=$(curl -s -u "$WP_USER:$WP_PASS" \
  "$REST_BASE/posts?per_page=$COUNT&orderby=date&order=desc&_fields=id,slug,title,content,excerpt,date,modified,status,categories,tags")

if [[ -z "$RESPONSE" ]] || echo "$RESPONSE" | jq -e '.code' > /dev/null 2>&1; then
  echo "ERROR: API request failed"
  echo "$RESPONSE" | jq . 2>/dev/null || echo "$RESPONSE"
  exit 1
fi

# Cache categories and tags for name resolution
echo "Caching categories and tags..."
curl -s -u "$WP_USER:$WP_PASS" "$REST_BASE/categories?per_page=100&_fields=id,name,slug" | jq '.' > "$SYNC_DIR/_categories.json"
curl -s -u "$WP_USER:$WP_PASS" "$REST_BASE/tags?per_page=100&_fields=id,name,slug" | jq '.' > "$SYNC_DIR/_tags.json"

# Detect SEO plugin
echo "Detecting SEO plugin..."
NAMESPACES=$(curl -s "$REST_BASE/../" | jq -r '.namespaces[]' 2>/dev/null || echo "")
SEO_PLUGIN="none"
if echo "$NAMESPACES" | grep -q "yoast"; then
  SEO_PLUGIN="yoast"
elif echo "$NAMESPACES" | grep -q "rankmath"; then
  SEO_PLUGIN="rankmath"
fi
echo "{\"plugin\": \"$SEO_PLUGIN\", \"detected_at\": \"$(date -Iseconds)\"}" > "$SYNC_DIR/_seo-plugin.json"
echo "SEO plugin detected: $SEO_PLUGIN"

# Process each post
POST_COUNT=$(echo "$RESPONSE" | jq 'length')
echo "Processing $POST_COUNT posts..."

for i in $(seq 0 $((POST_COUNT - 1))); do
  POST=$(echo "$RESPONSE" | jq ".[$i]")
  
  WP_ID=$(echo "$POST" | jq -r '.id')
  SLUG=$(echo "$POST" | jq -r '.slug')
  TITLE=$(echo "$POST" | jq -r '.title.rendered' | sed 's/&amp;/\&/g; s/&#8217;/'"'"'/g; s/&#8211;/–/g; s/&#8230;/.../g; s/&quot;/"/g')
  STATUS=$(echo "$POST" | jq -r '.status')
  DATE=$(echo "$POST" | jq -r '.date' | cut -dT -f1)
  MODIFIED=$(echo "$POST" | jq -r '.modified' | cut -dT -f1)
  EXCERPT=$(echo "$POST" | jq -r '.excerpt.rendered' | sed 's/<[^>]*>//g; s/^[[:space:]]*//; s/[[:space:]]*$//')
  
  # Resolve category names
  CAT_IDS=$(echo "$POST" | jq -r '.categories[]' 2>/dev/null)
  CATS=""
  for cid in $CAT_IDS; do
    CNAME=$(jq -r ".[] | select(.id == $cid) | .name" "$SYNC_DIR/_categories.json" 2>/dev/null)
    if [[ -n "$CNAME" ]]; then
      CATS="${CATS:+$CATS, }$CNAME"
    fi
  done
  
  # Resolve tag names
  TAG_IDS=$(echo "$POST" | jq -r '.tags[]' 2>/dev/null)
  TAGS=""
  for tid in $TAG_IDS; do
    TNAME=$(jq -r ".[] | select(.id == $tid) | .name" "$SYNC_DIR/_tags.json" 2>/dev/null)
    if [[ -n "$TNAME" ]]; then
      TAGS="${TAGS:+$TAGS, }$TNAME"
    fi
  done
  
  # Convert HTML content to basic markdown
  CONTENT=$(echo "$POST" | jq -r '.content.rendered' | \
    sed 's/<h2[^>]*>/\n## /g; s/<\/h2>/\n/g' | \
    sed 's/<h3[^>]*>/\n### /g; s/<\/h3>/\n/g' | \
    sed 's/<h4[^>]*>/\n#### /g; s/<\/h4>/\n/g' | \
    sed 's/<p[^>]*>/\n/g; s/<\/p>/\n/g' | \
    sed 's/<strong>/\*\*/g; s/<\/strong>/\*\*/g' | \
    sed 's/<em>/\*/g; s/<\/em>/\*/g' | \
    sed 's/<li[^>]*>/- /g; s/<\/li>//g' | \
    sed 's/<ul[^>]*>//g; s/<\/ul>//g' | \
    sed 's/<ol[^>]*>//g; s/<\/ol>//g' | \
    sed 's/<br[^>]*>/\n/g' | \
    sed 's/<a href="\([^"]*\)"[^>]*>\([^<]*\)<\/a>/[\2](\1)/g' | \
    sed 's/<img[^>]*src="\([^"]*\)"[^>]*alt="\([^"]*\)"[^>]*/![\2](\1)/g' | \
    sed 's/<[^>]*>//g' | \
    sed 's/&amp;/\&/g; s/&#8217;/'"'"'/g; s/&#8211;/–/g; s/&#8230;/.../g; s/&quot;/"/g; s/&nbsp;/ /g' | \
    sed '/^$/N;/^\n$/d')
  
  # Write markdown file
  OUTFILE="$SYNC_DIR/${SLUG}.md"
  cat > "$OUTFILE" <<FRONTMATTER
---
wp_id: $WP_ID
slug: $SLUG
title: "$TITLE"
status: $STATUS
date: $DATE
modified: $MODIFIED
categories: [$CATS]
tags: [$TAGS]
excerpt: "$EXCERPT"
synced_at: $(date -Iseconds)
---

$CONTENT
FRONTMATTER

  echo "  ✓ $SLUG ($WP_ID)"
done

echo ""
echo "Done. $POST_COUNT posts synced to $SYNC_DIR/"
