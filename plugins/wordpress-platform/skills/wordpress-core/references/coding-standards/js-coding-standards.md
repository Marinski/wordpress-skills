# JavaScript Coding Standards

## CHUNK 1: JavaScript Spacing, Indentation, and Line Length

WordPress JavaScript coding standards are adapted from the jQuery JavaScript Style Guide with specific WordPress modifications. The guiding principle: *"All code in any code-base should look like a single person typed it, no matter how many people contributed."*

Key differences from jQuery standards:
- WordPress uses **single quotation marks** for string declarations
- Case statements are indented within switch blocks
- Function contents are consistently indented, including full-file closure wrappers
- Some whitespace rules differ for consistency with WordPress PHP standards

**Spacing rules — use spaces liberally:**

- Indent with **tabs** (not spaces)
- No whitespace at the end of lines or on blank lines
- Lines should usually be no longer than 80 characters, and must not exceed 100 (counting tabs as 4 spaces). This is a soft rule, but long lines indicate disorganized code
- `if`/`else`/`for`/`while`/`try` blocks must always use braces and span multiple lines
- Unary operators (`++`, `--`) must not have space next to their operand
- No space before `,` and `;`
- `;` used as a statement terminator must be at end of line
- No space before `:` after property names in object definitions
- `?` and `:` in ternary conditionals must have space on both sides
- No filler spaces in empty constructs (`{}`, `[]`, `fn()`)
- A new line at the end of each file
- `!` negation operator must have a following space
- All function bodies indented by one tab, even inside a closure wrapper
- Spaces may align code within documentation blocks, but only tabs at the start of a line

Trailing whitespace is caught by JSHint as an error. Enable visible whitespace characters in your editor to detect it.

---

## CHUNK 2: JavaScript Object and Array Declarations

Object declarations can be on a single line if short (respecting the line length guideline). When too long, use one property per line, each ending with a comma. Property names only need quoting if they are reserved words or contain special characters:

```javascript
// Preferred
var obj = {
    ready: 9,
    when: 4,
    'you are': 15,
};
var arr = [
    9,
    4,
    15,
];

// Acceptable for small objects and arrays
var obj = { ready: 9, when: 4, 'you are': 15 };
var arr = [ 9, 4, 15 ];

// Bad
var obj = { ready: 9,
    when: 4, 'you are': 15 };
var arr = [ 9,
    4, 15 ];
```

**Arrays and Function Calls:** Always include extra spaces around elements and arguments:

```javascript
array = [ a, b ];

foo( arg );

foo( 'string', object );

foo( options, object[ property ] );

foo( node, 'property', 2 );

prop = object[ 'default' ];
```

Note the spaces inside brackets and parentheses. This is consistent with WordPress PHP spacing conventions and is a key visual pattern in WordPress JavaScript.

**Code refactoring guidance:** Do not refactor older `.js` files simply to conform to these standards. "Whitespace-only" patches for older files are strongly discouraged. All **new or updated** JavaScript code will be reviewed for standards compliance and must pass JSHint.

---

## SKILL SUMMARY

- **What this skill enables:** An agent can write or review JavaScript code following WordPress conventions — correct spacing, indentation, object/array formatting, and function call patterns.
- **When to use:** Whenever generating or reviewing JavaScript code for WordPress core, plugins, or themes.
