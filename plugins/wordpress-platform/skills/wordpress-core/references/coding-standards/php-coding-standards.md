# PHP Coding Standards

## CHUNK 1: Using PHP Tags and Embedding PHP in HTML

When writing WordPress PHP code, always use full PHP tags (`<?php ... ?>`) — never shorthand (`<? ... ?>` or `<?= ?>`). Shorthand tags depend on server configuration and break portability.

**Correct:**
```php
<?php echo esc_html( $var ); ?>
```

**Incorrect:**
```php
<?= esc_html( $var ) ?>
```

When embedding multi-line PHP snippets inside HTML blocks, place the PHP open and close tags on their own lines:

**Correct (multiline):**
```php
function foo() {
    ?>
    <div>
        <p>HTML content here</p>
    </div>
    <?php
}
```

**Correct (single line):**
```php
<input name="<?php echo esc_attr( $name ); ?>" />
```

**Incorrect:**
```php
if ( $a === $b ) { ?>
<some html>
<?php }
```

When mixing PHP and HTML, indent PHP blocks to match the surrounding HTML code. Closing PHP blocks should match the same indentation level as the opening block:

```php
<?php if ( ! have_posts() ) : ?>
<div id="post-1" class="post">
    <h1 class="entry-title">Not Found</h1>
    <div class="entry-content">
        <p>Apologies, but no results were found.</p>
        <?php get_search_form(); ?>
    </div>
</div>
<?php endif; ?>
```

For strings, use single and double quotes appropriately. If you are not evaluating anything inside the string, use single quotes. Alternate quoting styles to avoid escaping:

```php
echo '<a href="/static/link" class="button button-primary">Link name</a>';
echo "<a href='{$escaped_link}'>text with a ' single quote</a>";
```

Text that goes into HTML or XML attributes must be escaped to prevent security issues where unescaped quotes could end the attribute value and invalidate the HTML.

For `require` and `include` statements, do not use parentheses — they are language constructs, not functions. Use one space between the keyword and the path. Prefer `require_once` over `include_once` for unconditional includes, as `include_once` only issues a warning on failure while `require_once` throws a fatal error:

```php
// Correct.
require_once ABSPATH . 'file-name.php';

// Incorrect.
include_once  ( ABSPATH . 'file-name.php' );
require_once     __DIR__ . '/file-name.php';
```

---

## CHUNK 2: PHP Naming Conventions and File Naming

WordPress PHP code follows strict naming conventions to ensure consistency across its large codebase.

**Functions, Variables, Actions, and Filters:** Use lowercase letters with words separated by underscores. Never use camelCase. Do not abbreviate variable names unnecessarily — let the code be self-documenting:

```php
function some_name( $some_variable ) {}
```

For function parameter names, avoid using PHP reserved keywords as names. This improves readability when using PHP 8.0+ named parameters in function calls. Renaming a function parameter is a breaking change since PHP 8.0, so name parameters with care.

**Classes, Traits, Interfaces, and Enums:** Use capitalized words separated by underscores. Acronyms should be all upper case:

```php
class Walker_Category extends Walker {}
class WP_HTTP {}

interface Mailer_Interface {}
trait Forbid_Dynamic_Properties {}
enum Post_Status {}
```

**Constants:** All upper-case with underscores separating words:

```php
define( 'DOING_AJAX', true );
```

**File Naming:** Use lowercase letters with hyphens separating words:

```
my-plugin-name.php
```

Class files should be named based on the class name with `class-` prepended and underscores replaced by hyphens. For example, `WP_Error` becomes:

```
class-wp-error.php
```

This standard applies to all current and new files containing classes, **except** test classes. Test class files should reflect the class name exactly (per PSR-4) to ensure cross-version compatibility with all supported PHPUnit versions.

---

## SKILL SUMMARY

- **What this skill enables:** An agent can write, review, or refactor PHP code that complies with WordPress coding standards — correct tag usage, proper quoting, naming conventions, file naming, and include/require patterns.
- **When to use:** Whenever generating or reviewing PHP code intended for WordPress core, plugins, or themes.
