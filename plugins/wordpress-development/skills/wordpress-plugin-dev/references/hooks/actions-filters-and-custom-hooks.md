# Actions, Filters, and Custom Hooks

## CHUNK 1: Choosing Between Actions and Filters in Plugin Code

Hooks are the main extension mechanism in WordPress. They let one piece of code interact with another at predefined execution points and are the foundation of how plugins integrate with core, themes, and each other.

There are two main hook types:

- actions, which let you run code at a certain point in execution
- filters, which let you modify a value and return the modified result

Use an action when the callback performs a task and does not return anything meaningful to the caller. Use a filter when the callback receives data, changes it, and returns the new value. Filters should behave in isolation and avoid side effects such as writing output or mutating unrelated globals.

Adding a callback always has two parts:

- define the callback function with the expected parameters
- hook it with `add_action()` or `add_filter()`

This distinction matters because it keeps APIs predictable. If a callback is intended to transform data, it should be a filter. If it is intended to trigger behavior, it should be an action.

When integrating with existing WordPress hooks, review the documented parameters and timing carefully. Hooking at the wrong moment or expecting the wrong arguments leads to subtle bugs.

---

## CHUNK 2: Designing Custom Hooks So Other Developers Can Extend Your Plugin

Plugins should not only consume hooks. Well-designed plugins also expose custom hooks so other developers can extend or modify behavior without editing plugin code directly.

Create custom actions with `do_action()` and custom filters with `apply_filters()`. A useful rule from the handbook is to apply filters to text that is output to the browser, especially on the front end, so other code can adapt it to user needs.

When you create custom hooks, naming is critical. Hook collisions happen when two developers choose the same hook name for different purposes. Prefix hook names with a unique plugin identifier just like you prefix functions and classes.

Advanced hook usage also includes removing callbacks with `remove_action()` or `remove_filter()`. Removal only works when the hook name, callback, and priority match exactly, and the removal runs after the original hook registration has happened.

This makes timing important. For example, if a theme or plugin adds a heavy feature on `template_redirect`, you may remove it later from another hook such as `after_setup_theme`, provided the registration already occurred.

The broader principle is that hooks are an API surface. Treat them as part of your plugin’s contract, with clear intent, stable naming, and predictable data flow.

---

## SKILL SUMMARY

- **What this skill enables:** An agent can implement, consume, and expose WordPress hooks correctly, including deciding between actions and filters and designing safe custom hook names.
- **When to use:** Use this when integrating plugin behavior into WordPress execution flow or when making a plugin extensible for third-party developers.