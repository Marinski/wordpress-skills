# XML-RPC and Legacy Remote Interfaces

## CHUNK 1: Understanding XML-RPC as a Legacy Remote API Surface

WordPress includes an XML-RPC API that predates the REST API and supersedes older Blogger, MovableType, and metaWeblog interfaces. It exposes remote operations for posts, taxonomies, media, comments, options, and users, with methods such as:

- `wp.getPost`, `wp.getPosts`, `wp.newPost`, `wp.editPost`, `wp.deletePost`
- taxonomy methods such as `wp.getTaxonomy` and `wp.newTerm`
- media methods such as `wp.getMediaItem` and `wp.uploadFile`
- comment, option, and user-related methods

The API exists to support external clients across different programming languages, and the handbook references several client libraries in Ruby, PHP, and C#.

In modern WordPress architecture, XML-RPC should generally be viewed as a legacy remote interface rather than the preferred integration surface for new work. The REST API now provides the more modern JSON-based path for remote systems.

---

## CHUNK 2: Choosing Between REST and Legacy Remote Protocols

The main value of the XML-RPC documentation today is compatibility awareness. If you inherit a system that talks to WordPress remotely through XML-RPC, the method catalog tells you what kinds of operations are supported and where posts, taxonomies, media, comments, options, and user actions map.

For new integrations, REST is usually the better default because it aligns with WordPress’s current API direction, uses JSON, and has stronger modern tooling around routing, schema, authentication, and response handling. XML-RPC remains relevant mainly when maintaining older clients or interoperating with systems that already depend on it.

The right decision rule is:

- use REST for new remote integrations whenever possible
- understand XML-RPC when supporting legacy clients or migration work
- treat XML-RPC as an existing protocol surface, not the first-choice API for new WordPress features

This keeps new systems aligned with current WordPress API practices while still acknowledging the installed base of older integrations.

---

## SKILL SUMMARY

- **What this skill enables:** An agent can recognize and reason about WordPress XML-RPC capabilities and decide when a legacy remote integration should remain XML-RPC-based versus when it should move to REST.
- **When to use:** Use this when maintaining older WordPress clients, auditing remote integration surfaces, or planning migrations from XML-RPC to modern REST-based endpoints.