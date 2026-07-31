# JavaScript, AJAX, and Cron

## CHUNK 1: Enqueuing Plugin JavaScript and Handling AJAX Correctly

JavaScript is a common part of WordPress plugins, especially in admin screens and dynamic front-end features. WordPress bundles useful JavaScript libraries, including jQuery, and plugins should integrate with them through WordPress APIs rather than hardcoded script tags.

For AJAX workflows, the handbook emphasizes two recurring rules:

- scripts must be enqueued with `wp_enqueue_script()`
- AJAX requests should be routed through `wp-admin/admin-ajax.php`, not directly to plugin pages

This matters because enqueuing ensures WordPress prints dependencies correctly and allows plugins to localize PHP values into scripts when needed. Sending requests through the standard AJAX entry point keeps the request lifecycle consistent with WordPress expectations.

jQuery remains a common option for plugin-side DOM behavior and AJAX calls, especially in classic admin interfaces. The core structure is selector plus event plus callback. Whether you use jQuery or modern JavaScript wrappers, the important part is that the client-side code is loaded through WordPress and the server-side handler is wired to the proper AJAX flow.

Use JavaScript for browser behavior, use AJAX when you need asynchronous server calls, and always let WordPress manage how those assets and endpoints are exposed.

---

## CHUNK 2: Scheduling and Testing Repeating Tasks with WP-Cron

WP-Cron is WordPress’s task scheduler. It uses hooks to define scheduled work and events to decide when that work should run. The most important implementation step is creating a custom hook and attaching a callback to it before you schedule the event.

For example, if you schedule an event but never register the corresponding hook callback, nothing useful will happen. Conversely, if you call `wp_schedule_event()` repeatedly on every page load without checking whether the event already exists, you may schedule the same task thousands of times.

The core pattern is:

- define a prefixed custom cron hook
- attach a callback with `add_action()`
- schedule the event once, not on every request
- clear or unschedule it appropriately when the plugin is removed or disabled

Testing support exists too. The handbook recommends WP-CLI commands such as `wp cron event list` and `wp cron event run {job name}` for inspection and manual execution. Raw inspection helpers such as `_get_cron_array()` and `wp_get_schedules()` can also be useful.

When site traffic is unreliable, WP-Cron can also be connected to the system task scheduler. This is important for plugins that depend on more predictable timing.

---

## SKILL SUMMARY

- **What this skill enables:** An agent can implement plugin-side JavaScript and AJAX the WordPress way, and add scheduled background tasks using WP-Cron without duplicate scheduling or brittle request handling.
- **When to use:** Use this when a plugin needs interactive admin or frontend behavior, asynchronous server calls, or recurring scheduled tasks.