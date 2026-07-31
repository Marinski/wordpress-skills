# Multisite Foundations and Network Creation

## CHUNK 1: Knowing When Multisite Is the Right Architecture

WordPress Multisite lets one WordPress installation manage multiple sites that share the same core files and, optionally, shared plugins and themes. It is not just “many sites at once.” It is a distinct architecture with different operational assumptions.

The handbook’s core guidance is to decide on multisite for the right reasons. It works well when multiple related sites need centralized management, shared infrastructure, and coordinated administration. It is less appropriate when each site needs strong isolation, highly different hosting requirements, or fully independent operational ownership.

Before creating a network, plan:

- whether you want subdomains or subdirectories
- whether your server rewrite rules support the model
- how plugins and themes will be governed across the network
- how user management and site creation should work

This is an architectural decision, not a quick toggle. Once a network is active, administration, permissions, media paths, and deployment workflows change.

---

## CHUNK 2: Creating a Network with the Right Operational Expectations

Creating a network turns a normal install into a shared platform. The advanced-admin docs emphasize that network sites are not separate codebases. They are virtual sites using shared WordPress core, shared theme and plugin inventory, and separate tables for per-site content.

Operationally, this means:

- install and configure the network intentionally rather than experimentally
- understand that site administrators are not equivalent to a network super admin
- expect network-wide changes to have broader blast radius than on single-site installs
- prepare server rewrites and any subdomain support before enabling the network

The most useful decision rule is this: choose multisite when central governance is an advantage, not just because multiple sites exist. If the sites need independent code control, separate installs may be safer. If the goal is coordinated management with shared infrastructure, multisite is often the better fit.

---

## SKILL SUMMARY

- **What this skill enables:** An agent can evaluate whether WordPress Multisite fits a use case, explain the architectural tradeoffs, and guide the planning and creation of a network responsibly.
- **When to use:** Use this when deciding between multisite and separate installs, preparing a network rollout, or reviewing whether a multisite design matches operational requirements.