# Backups, Recovery, and Safe Updates

## CHUNK 1: Treating Backups as a Full-System Responsibility

WordPress backup guidance is explicit: a usable backup strategy includes both the database and the files. Backing up only one side is not enough because WordPress content, configuration, uploads, plugins, themes, and custom code are split across these layers.

The handbook distinguishes clearly between:

- database backups for posts, pages, comments, settings, and structured content
- file backups for themes, plugins, uploads, configuration files, and custom code

The operational rule is to keep these together logically, even when they are produced separately. A database export without the matching uploads or code may be incomplete. A file backup without the matching database may restore the shell of a site but not its content.

This is also why advanced-admin material recommends backing up before upgrades and major changes. Recovery is only realistic if the backup predates the mistake and can be restored coherently.

---

## CHUNK 2: Updating and Restoring with Recovery in Mind

Safe update workflows are really recovery workflows with a forward step in the middle. Whether you update through the dashboard, FTP, a control panel, or WP-CLI, the important issue is not only how to apply the update but how to roll back if something fails.

The practical update discipline is:

- take recent database and file backups before core changes
- test updates on staging when the site matters or the stack is complex
- use secure transfer tools such as SFTP instead of plain FTP when manual file operations are necessary
- verify the site after updates instead of assuming success because file transfer completed

Restoration work often relies on the same operational tools discussed elsewhere in the handbook, such as phpMyAdmin, control panels, and direct file access. That is why backup and update guidance belong together: the person who updates WordPress also needs a credible way to recover it.

---

## SKILL SUMMARY

- **What this skill enables:** An agent can design a backup strategy that covers both files and database state, and can carry out updates with rollback and recovery planning built in.
- **When to use:** Use this when preparing upgrades, creating disaster-recovery procedures, restoring a damaged site, or reviewing whether an update process is operationally safe.