# Front-End Features and Syndication

## CHUNK 1: Distinguishing Theme Presentation Features from Site Operations

Some advanced-administration docs touch front-end capabilities that overlap with theme design: post formats, CSS, site structure, and feeds. The right way to interpret them is as presentation-layer behaviors that administrators should understand, even when developers implement them.

Post formats are standardized presentation hints a theme can support so posts of different types, such as asides or galleries, can be rendered differently. CSS remains the core mechanism for controlling presentation, whether through classic themes, custom CSS, or newer editor-based styling tools.

The important architectural rule is that themes own presentation, not content portability. That means:

- use post formats only as display context, not as content structure
- keep styling concerns in CSS or theme styling systems instead of business logic
- understand site architecture in terms of templates and containers rather than hardcoded pages

This lets administrators reason clearly about what should change when a theme changes and what should remain stable.

---

## CHUNK 2: Using Feeds and oEmbed as Controlled Distribution Surfaces

Feeds and oEmbed are WordPress distribution features. Feeds expose content in machine-readable syndication formats. oEmbed allows external media providers to return embeddable HTML without forcing users to paste large custom snippets directly.

From an advanced-admin perspective, these are controlled surfaces:

- feeds determine how content leaves your site for readers and feed consumers
- oEmbed determines how external content enters your site in a safer, more structured way

The operational lesson is to use WordPress’s built-in mechanisms instead of inventing ad hoc embed or syndication systems. Feeds should be treated as public outputs that may affect caching and content distribution. oEmbed support should be extended or restricted deliberately, especially when security and trusted-provider concerns matter.

Together, these features show that presentation is not only visual. It also includes how content is formatted for external consumers and how outside media is brought into the site safely.

---

## SKILL SUMMARY

- **What this skill enables:** An agent can reason about post formats, CSS, template-driven presentation, feeds, and oEmbed as parts of WordPress’s front-end and content-distribution model.
- **When to use:** Use this when reviewing theme-facing presentation features, planning feed behavior, or deciding how external embeds should be handled within WordPress.