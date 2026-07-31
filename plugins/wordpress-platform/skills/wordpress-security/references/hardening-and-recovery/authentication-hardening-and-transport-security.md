# Authentication Hardening and Transport Security

## CHUNK 1: Hardening Login and Access Surfaces

Advanced WordPress administration treats authentication as an operational surface, not just a user preference. The handbook’s security material covers passwords, two-step authentication, brute-force threats, and application passwords because compromised access is one of the fastest ways to lose control of a site.

The practical security model is layered:

- use strong, unique passwords for all privileged accounts
- enable two-step authentication where feasible to add a second factor
- reduce exposure to brute-force attacks through host, plugin, or gateway protections
- use application passwords for programmatic access instead of sharing a real user password

Application passwords matter because they are revocable, per-application credentials for API or remote-tool access. They are safer than distributing a user’s main password to scripts, mobile apps, or external services. They should be used for machine access, not normal browser logins.

The larger rule is least exposure. Separate interactive authentication from automated access, revoke credentials that are no longer needed, and treat login hardening as part of site operations rather than optional polish.

---

## CHUNK 2: Using HTTPS and Safe Error Handling to Reduce Exposure

Transport security is part of WordPress hardening because login credentials, cookies, and admin sessions all become more vulnerable when traffic is not protected. HTTPS is therefore not only about user trust. It is a baseline requirement for secure administration, API traffic, and reliable browser behavior.

The advanced-admin security docs also connect hardening to error exposure. PHP `display_errors` should be disabled on production sites because verbose warnings can leak filesystem paths, configuration hints, plugin names, or other useful information to attackers.

The practical rules are:

- prefer HTTPS everywhere, not only on checkout or login screens
- keep production error display disabled even if logging is enabled internally
- treat cookies and admin sessions as security-sensitive transport data
- combine credential hardening, transport encryption, and safe operational defaults

This reduces both credential theft risk and information leakage. Security is not one control. It is the combined effect of access control, transport protection, and careful operational configuration.

---

## SKILL SUMMARY

- **What this skill enables:** An agent can harden WordPress authentication flows, distinguish browser logins from programmatic access, and apply transport-level and production-safety controls such as HTTPS and hidden error output.
- **When to use:** Use this when improving admin security, designing API access patterns, configuring production error handling, or reviewing login and credential practices.