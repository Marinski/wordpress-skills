# Debugging, Staging, and Version Control

## CHUNK 1: Debugging WordPress Without Turning Production Into a Lab

The advanced administration debugging docs consistently reinforce one operational principle: investigate problems in a controlled environment whenever possible. That means using a staging or local copy, taking backups, and enabling debug features deliberately instead of experimenting on the live site.

WordPress provides core debugging constants such as `WP_DEBUG`, `WP_DEBUG_LOG`, `WP_DEBUG_DISPLAY`, and `SCRIPT_DEBUG`. These are useful, but they have different risk profiles. Logging errors privately is usually safer than displaying them publicly. Development assets are useful when debugging scripts and styles, but not on a production site by default.

The practical debugging workflow is:

- use a staging or development copy before invasive investigation
- enable the smallest set of debug features needed for the task
- log errors privately instead of exposing them to visitors
- reproduce the problem systematically before changing code or config

This keeps debugging aligned with operational safety rather than curiosity-driven experimentation.

---

## CHUNK 2: Combining Browser Tools, Network Context, and Version History

Not all WordPress debugging is PHP-only. The handbook also points to browser-based JavaScript diagnostics, network-level debugging for multisite, and version control as a recovery and analysis tool.

Version control is especially valuable because it changes debugging from guesswork into comparison. If you can track code and configuration changes over time, you can identify when a regression started and roll back intentionally rather than rebuilding from memory.

Useful decision rules are:

- use browser developer tools for front-end and JavaScript failures
- use network-aware debugging for multisite-specific issues
- prefer version control for code history over ad hoc file copies
- keep testing environments hidden or isolated from the public when exploring risky changes

The handbook’s “test driving WordPress” material fits this model as well. Staging, sandboxes, and local installs are not optional luxuries. They are the environments where responsible debugging happens.

---

## SKILL SUMMARY

- **What this skill enables:** An agent can turn on the right WordPress debugging tools, keep production-safe defaults in place, and use staging plus version control to investigate issues systematically.
- **When to use:** Use this when debugging WordPress behavior, enabling `WP_DEBUG`-related settings, investigating JavaScript or multisite issues, or planning safe troubleshooting workflows.