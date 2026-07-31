# Multisite Administration and Domain Mapping

## CHUNK 1: Operating a Network with Super Admin Boundaries in Mind

Once a multisite network exists, administration changes significantly. The advanced administration material stresses that the network introduces a higher operational tier: the network admin or super admin. Site administrators keep control over their own sites, but they do not control network-wide plugin installation, theme availability, or certain user-management tasks.

This distinction matters because mistakes in network administration affect every site, while site-level changes remain narrower in scope. Network settings control registration, onboarding emails, allowed domains, and general platform behavior.

The important operational rules are:

- distinguish clearly between network-level and site-level authority
- treat shared plugins and themes as platform assets, not per-site improvisation
- plan user defaults and registration flows deliberately
- remember that subfolder networks impose routing details such as the main-site `blog` segment

Multisite works best when its governance model is explicit. Confusion over who can install, configure, or map what usually creates the sharpest operational problems.

---

## CHUNK 2: Mapping Domains and Managing Network Routing Carefully

Domain mapping in modern WordPress is a native multisite capability, but it still depends on infrastructure. DNS must point correctly, SSL must be handled for every mapped domain, and the WordPress site address for the target subsite must be updated deliberately.

The handbook’s domain-mapping guidance points to a layered workflow:

- ensure the network is functioning before attempting mapping
- point the mapped domains at the correct DNS destination
- install SSL for each mapped domain
- update the subsite URL in network administration
- apply any required cookie or configuration adjustments only when necessary

The broader lesson is that network routing is never only a WordPress concern. It crosses DNS, certificates, server config, and application settings. Treat it as a coordinated systems change rather than a dashboard-only setting.

---

## SKILL SUMMARY

- **What this skill enables:** An agent can operate a multisite network with the right distinction between super-admin and site-admin responsibilities, and can plan domain-mapping changes across DNS, SSL, and network settings.
- **When to use:** Use this when administering an existing multisite network, configuring network-level policies, or mapping custom domains onto subsites.