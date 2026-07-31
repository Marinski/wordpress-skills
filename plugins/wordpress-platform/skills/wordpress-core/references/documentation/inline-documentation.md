# Inline Documentation Standards

## CHUNK 1: PHP DocBlock Formatting and What to Document

WordPress uses a customized documentation schema inspired by PHPDoc. Inline documentation provides a resource for developers and populates the official WordPress Code Reference.

**What to document in PHP files:**
- Functions and class methods
- Classes
- Class members (properties and constants)
- Requires and includes
- Hooks (actions and filters)
- Inline comments
- File headers
- Constants

**DocBlock placement:** DocBlocks must directly precede the hook, action, function, method, or class line. No opening/closing tags or other code should appear between the DocBlock and the declaration.

**Summary rules:** Summaries should be clear, simple, and brief. Avoid HTML in summaries — if referencing HTML elements, write them as text (e.g., "link tag" instead of `<link>`). Inline PHPDoc tags may be used.

**Description rules:** HTML markup must not appear outside code examples. Markdown is allowed. Use hyphens for unordered lists and numbers for ordered lists, with a blank line before and after:

```php
/**
 * Description which includes an unordered list:
 *
 * - This is item 1.
 * - This is item 2.
 * - This is item 3.
 *
 * The description continues on ...
 */
```

```php
/**
 * Description which includes an ordered list:
 *
 * 1. This is item 1.
 * 2. This is item 2.
 * 3. This is item 3.
 *
 * The description continues on ...
 */
```

**`@since` tags:** Use `svn blame` or the WordPress Hooks Database to determine the version something was added. If the version cannot be determined, use `@since Unknown`. Anything ported from WPMU should use `@since MU (3.0.0)`.

---

## CHUNK 2: JavaScript JSDoc Standards and Function Documentation

WordPress follows the **JSDoc 3 standard** for inline JavaScript documentation.

**What to document in JavaScript files:**
- Functions and class methods
- Objects
- Closures
- Object properties
- Requires
- Events
- File headers

**Function documentation format:**

- **Summary:** A brief, one-line explanation of the function's purpose. End with a period.
- **Description:** A supplement to the summary providing more detail. End with a period.
- **`@deprecated x.x.x`:** Only for deprecated functions. Always use 3-digit version (e.g., `@deprecated 3.6.0`). State the replacement function.
- **`@since x.x.x`:** Use 3-digit version for initial introduction (e.g., `@since 3.6.0`). Add additional `@since` tags for significant changes as a changelog.
- **`@access`:** Only use if private. Private functions won't appear in the code reference.
- **`@class`:** For class constructors.
- **`@augments`:** For class constructors, list direct parents.
- **`@mixes`:** List mixins mixed into the object.
- **`@alias`:** Change the documented name when a function is first assigned to a temporary variable.
- **`@memberof`:** Namespace containing the function if JSDoc can't resolve it.
- **`@static`:** Mark static methods on class constructors.
- **`@see`:** Reference a relied-upon function or class.
- **`@link`:** URL providing more information.
- **`@fires`:** Event fired by the function. Prefix class-specific events with the class name.
- **`@listens`:** Events the function listens for. Prefix with event namespace.
- **`@global`:** Mark as a global function.

**Line wrapping:** DocBlock text should wrap after 80 characters. Wrapping should not extend beyond 120 characters total width.

**Aligning comments:** Related `@param` entries should be spaced to align for readability:

```javascript
/**
 * @param {very_long_type} name           Description.
 * @param {type}           very_long_name Description.
 */
```

---

## CHUNK 3: Documentation Language and Grammar Guidelines

These guidelines apply to **both PHP and JavaScript** documentation in WordPress.

**Third-person singular voice:** Functions, hooks, classes, and methods are singular elements. Use third-person singular verbs to describe them. A helpful test: prefix the summary with "It" — if it reads correctly, the grammar is right.

- **Good:** "(It) Does something."
- **Bad:** "(It) Do something."

**Function summaries — describe "what":**
- Good: "Handles a click on X element."
- Bad: "Included for back-compat for X element."

**Filter summaries — describe "what" is being filtered:**
- Good: "Filters the post content."
- Bad: "Lets you edit the post content that is output in the post template."

**Action summaries — describe "when":**
- Good: "Fires after most of core is loaded, and the user is authenticated."

**General principles:**
- Short descriptions should be clear, simple, and brief
- Document "what" and "when" — avoid "why" unless necessary (put "why" in the long description)
- Descriptive elements should be written as complete sentences
- File header summaries are the one exception — they serve as "titles" rather than sentences
- Use the serial (Oxford) comma when listing elements in summaries, descriptions, and parameter/return descriptions

**`@param` and `@return` tags (JavaScript):** No HTML or Markdown is permitted in descriptions for these tags. Reference HTML elements as text (e.g., "audio element" or "link tag").

**Code refactoring rule:** When updating documentation, do not refactor other code in the file. It is permissible to adjust spacing on the specific lines being documented, but nothing more.

---

## SKILL SUMMARY

- **What this skill enables:** An agent can write correctly formatted PHP DocBlocks and JavaScript JSDoc comments following WordPress documentation standards — proper `@since` usage, third-person singular voice, correct list formatting, and tag ordering.
- **When to use:** When generating or reviewing inline documentation for any WordPress PHP or JavaScript file.
