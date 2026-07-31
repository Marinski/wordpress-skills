# Plugin Lifecycle and Cleanup

## CHUNK 1: Using Activation and Deactivation Hooks for Setup and Teardown

Activation and deactivation hooks let a plugin run code when it is enabled or disabled. They are intended for lifecycle tasks tied to the plugin’s runtime state, not for permanent data deletion.

Typical activation responsibilities include:

- adding or refreshing rewrite rules
- creating custom database tables when needed
- setting default option values
- performing one-time setup required before the plugin can function correctly

Typical deactivation responsibilities include:

- removing temporary files or cache data
- undoing runtime state that should not persist while the plugin is inactive
- flushing rewrite rules when the plugin changed routing behavior

The key distinction is that deactivation is reversible. Users deactivate plugins temporarily all the time. That means deactivation logic should avoid destructive cleanup of permanent data.

Use the lifecycle hooks deliberately:

```php
register_activation_hook( __FILE__, 'pluginprefix_function_to_run' );
register_deactivation_hook( __FILE__, 'pluginprefix_function_to_run' );
```

If activation needs to set up database schema or routing, keep that work focused and idempotent. If deactivation needs to stop scheduled tasks or clear temporary state, make sure it only removes data that is safe to recreate.

---

## CHUNK 2: Handling Uninstall Correctly Without Destroying Data Too Early

Uninstall is different from deactivation. A plugin is considered uninstalled when it has been deactivated and then deleted from the admin. This is the point where permanent plugin-owned data may need to be removed.

Common uninstall tasks include:

- deleting plugin options from the options table
- removing custom database tables
- clearing plugin-specific metadata or other stored entities

Less experienced developers often make the mistake of using the deactivation hook for this. That is wrong because users may only be disabling the plugin temporarily and expect their data to remain intact.

WordPress supports two main uninstall approaches:

- registering an uninstall callback with `register_uninstall_hook()`
- adding an `uninstall.php` file in the plugin root that runs automatically on deletion

```php
register_uninstall_hook( __FILE__, 'pluginprefix_function_to_run' );
```

or:

- create `/plugin-name/uninstall.php`
- guard execution with `WP_UNINSTALL_PLUGIN`

The right pattern is to separate reversible shutdown from irreversible removal. Deactivation should stop the plugin safely. Uninstall should perform the permanent cleanup users expect only when they delete the plugin.

---

## SKILL SUMMARY

- **What this skill enables:** An agent can implement activation, deactivation, and uninstall behavior without confusing temporary shutdown with permanent data removal.
- **When to use:** Use this when adding plugin setup routines, stopping scheduled or routed behavior on deactivation, or writing safe uninstall cleanup logic.