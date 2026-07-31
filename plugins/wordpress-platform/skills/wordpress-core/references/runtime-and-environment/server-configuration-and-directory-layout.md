# Server Configuration and Directory Layout

## CHUNK 1: Understanding the Server Layer WordPress Depends On

WordPress runs inside a server environment that you do not get to ignore. The advanced administration server docs focus on the operational pieces that determine whether WordPress can route requests, write files, generate permalinks, and support features such as multisite or media uploads reliably.

At the highest level, WordPress needs a web server that can execute PHP and cooperate with the rewrite rules WordPress expects. Apache and Nginx are both supported, but they behave differently. Apache often relies on `.htaccess`, while Nginx requires server-level configuration and cannot be modified automatically by WordPress in the same way.

The practical implications are:

- Apache setups often let WordPress manage permalink rewrites more directly
- Nginx requires administrator-managed config and explicit rewrite handling
- file permissions must allow WordPress to read what it needs and write only where appropriate
- hosting control panels may mediate many of these settings, but they do not remove the need to understand them

Operationally, the correct mindset is to treat the server as a dependency boundary. WordPress application behavior often reflects server decisions made below it.

---

## CHUNK 2: Structuring Directories, Permissions, and Request Topology Deliberately

Advanced administration also covers where WordPress lives in the filesystem and how request routing maps to that structure. Giving WordPress its own directory, using wildcard subdomains, or preparing a server for multisite all change how files and URLs relate.

The common patterns are:

- placing WordPress core in its own directory while exposing the site from a cleaner public URL
- configuring wildcard subdomains when a subdomain-based multisite network is planned
- setting file permissions conservatively so WordPress works without granting unnecessary write access
- understanding mail and server-info tooling as part of operations, not plugin logic

The handbook’s server material is about predictability. If directory structure, permissions, and rewrite behavior are unclear, updates, uploads, plugin installs, and network features become fragile.

A useful decision rule is to keep the filesystem layout intentional and the permission model minimal. Grant only the access WordPress truly needs, and match the server topology to the site architecture you intend to run.

---

## SKILL SUMMARY

- **What this skill enables:** An agent can reason about the server assumptions behind WordPress, including Apache versus Nginx tradeoffs, directory placement, rewrite behavior, and safe file-permission practices.
- **When to use:** Use this when configuring hosting, moving WordPress into a custom directory layout, preparing for multisite, or troubleshooting server-level behavior such as permalinks or file-write access.