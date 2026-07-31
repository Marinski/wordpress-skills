# Hook Reference and Execution Order

## CHUNK 1: Understanding WordPress Hooks as an Execution Map

Hooks are one of the core extension mechanisms in WordPress. They let code run or modify values at predefined points during execution. The hooks reference material is less about how to add a callback and more about understanding where in the request lifecycle those callbacks fire.

The action reference provides an approximate view of typical execution order during a request. It is explicitly a guide, not a formal specification, because plugins, themes, cron events, and admin context can alter timing and cause hooks to run multiple times. Even so, it is useful for orienting plugin and theme logic.

Important early hooks include:

- `muplugins_loaded`, after must-use plugins load
- `plugins_loaded`, after active plugins and before pluggable functions load
- `setup_theme`, before the theme loads
- `after_setup_theme`, the first major theme hook for theme initialization
- `init`, a common hook for plugin initialization when the current user is already authenticated

The main design rule is to hook behavior at the earliest safe point that has the prerequisites you need, but no earlier. For example, theme support must be added on `after_setup_theme`, while many plugin registrations naturally belong on `init`.

Treat the hook timeline as an execution map. It helps answer questions like when globals are ready, when the user is authenticated, when scripts or widgets are initialized, and when it is safe to register or remove behavior.

---

## CHUNK 2: Using Action and Filter References Without Treating Them as Static Contracts

The action and filter reference pages are intentionally broad catalogs of available extension points. They tell you what the hook is for, what data passes through it, and in many cases what function triggers it. This makes them a discovery tool as much as a programming reference.

The filter reference is especially useful because it groups filters by data domain, such as post reads, attachments, authors, links, dates, and administrative values. This helps you locate the layer where a transformation should happen instead of patching behavior at the wrong level.

However, these references should not be treated as immutable contracts for exact runtime order. The documentation itself warns that lists of actions during a request are approximations. The correct mindset is:

- use the references to discover hooks and understand intent
- verify assumptions in the context you are targeting
- prefer hooks that match the responsibility of the change you need

If you need to change behavior broadly, use a hook that represents the right abstraction level. If you need to change only one value, prefer a narrow filter close to that value. This leads to more predictable customizations and fewer side effects.

---

## SKILL SUMMARY

- **What this skill enables:** An agent can reason about WordPress execution timing, choose appropriate action and filter hooks, and use hook reference material as a lifecycle map rather than a brittle sequence chart.
- **When to use:** Use this when deciding where code should run, debugging hook timing, or locating the correct action or filter for a customization.