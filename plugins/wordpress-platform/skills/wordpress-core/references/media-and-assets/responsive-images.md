# Responsive Images

## CHUNK 1: Understanding How WordPress Generates Responsive Image Markup

Since WordPress 4.4, WordPress has supported native responsive images by automatically adding `srcset` and `sizes` attributes to generated image markup. This allows the browser to choose the most appropriate image resource based on viewport width and display density.

The feature relies on WordPress’s image-size generation process. When a user uploads an image, WordPress creates multiple derivative sizes such as thumbnail, medium, and large. Responsive image markup then advertises those available sizes to the browser.

This is different from older server-side adaptive approaches that tried to guess the correct asset before the page rendered. WordPress instead follows the responsive model: send the browser the available choices and let it decide which image to load.

The practical benefit is that smaller devices do not need to download the largest image just because the full-size asset was attached to the content. This improves bandwidth usage and page performance without requiring manual configuration on each image.

---

## CHUNK 2: Knowing When WordPress Will and Will Not Modify Markup

The responsive-images behavior is designed to work behind the scenes. It does not expose settings that most users need to configure manually, and it tries to preserve compatibility with existing HTML.

In particular, if `srcset` or `sizes` already exist in the content markup, WordPress does not overwrite or modify them. This protects custom markup and avoids breaking integrations that intentionally provide their own responsive behavior.

For developers, this means the default should be to let WordPress generate responsive image attributes when using standard image functions and markup flows. Only step in manually when your use case truly requires custom image markup behavior.

Use the built-in responsive image pipeline as the baseline because it aligns media generation, browser behavior, and performance goals with minimal extra code.

---

## SKILL SUMMARY

- **What this skill enables:** An agent can rely on WordPress’s native responsive image generation and understand when core will preserve custom image markup instead of altering it.
- **When to use:** Use this when building themes or plugins that render media and need responsive behavior without reinventing image selection logic.