# Installation and Local Development

## CHUNK 1: Preparing a WordPress Environment Before Installation

Advanced administration starts before WordPress is installed. The handbook’s setup material emphasizes that a healthy installation depends on understanding the hosting environment, available tools, and the difference between the live server and your local machine.

Before installation, confirm the environment can run a supported WordPress stack: modern PHP, MySQL or MariaDB, and HTTPS support. You also need operational access to the system through tools such as SFTP, SSH, a text editor, browser access, and often a database tool. These are not optional details. They determine whether you can install WordPress safely, edit configuration files, upload updates, and recover from problems later.

The practical planning workflow is:

- confirm server software and version support before uploading WordPress
- make sure you can edit files and transfer them safely
- understand whether you are installing on local development, staging, or production
- prefer HTTPS-capable hosting from the start instead of retrofitting it later

The installation docs also imply an operational mindset: WordPress is easy to install, but long-term stability depends on decisions made up front. Choosing the wrong host, lacking file access, or treating configuration as an afterthought creates avoidable maintenance problems.

---

## CHUNK 2: Using Development Copies and Multiple Instances Deliberately

The handbook treats local development and multi-instance setups as part of advanced administration, not as edge cases. A development copy gives you a safe place to test updates, theme changes, plugin changes, and configuration work without breaking the live site.

For development, the key rule is separation. Keep local or staging environments distinct from production, and use them to validate upgrades, debugging changes, and deployment steps before touching the public site. This applies equally to developers and administrators responsible for operational reliability.

When running multiple WordPress instances, distinguish between three models:

- separate installs with separate databases
- separate installs sharing one database through unique table prefixes
- a true multisite network managed from one WordPress installation

Those choices affect configuration, isolation, scaling, and administrative complexity. Separate installs maximize isolation. Shared-database installs require careful prefix management. Multisite centralizes core management but changes how themes, plugins, users, and network settings behave.

The decision rule is simple: use a development copy for all nontrivial changes, and choose the installation model based on isolation and management needs instead of convenience alone.

---

## SKILL SUMMARY

- **What this skill enables:** An agent can plan a WordPress installation with the right prerequisites, recommend safe local or staging workflows, and distinguish between single-site, multi-instance, and development-copy setups.
- **When to use:** Use this when preparing a new WordPress environment, setting up staging or local development, or deciding how multiple WordPress instances should be structured.