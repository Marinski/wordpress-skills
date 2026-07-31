# Theme Release, Review, and Testing

## CHUNK 1: Preparing a Theme for Release and WordPress.org Submission

Releasing a theme is more than packaging code. A releasable theme needs the right required files, documentation, testing discipline, and an understanding of review expectations. The Theme Handbook separates these concerns into required files, testing, review guidelines, updates, documentation, and submission workflows for WordPress.org.

A practical release process should verify at least four things:

- the theme includes the minimum required files and valid metadata
- the theme behaves correctly under expected site configurations
- documentation explains setup and user-facing behavior clearly
- the theme aligns with WordPress.org review expectations if it will be distributed there

Theme authors should think about release early rather than as a final afterthought. File structure, documentation quality, accessibility, and standards compliance all affect whether a theme is maintainable and reviewable.

If the goal is directory distribution, submission requirements and review guidelines need to influence implementation choices before release day. Themes built without those constraints in mind often require cleanup late in the process.

---

## CHUNK 2: Testing, Debugging, Security, and Publishing Discipline for Themes

Theme testing should cover more than visual inspection. The handbook groups testing, debugging, security, privacy, and publishing guidance together because they all affect whether a theme is safe to ship.

Testing should confirm that templates load correctly, theme features behave as expected, and user-facing customization points do not break under different content types or site settings. Debugging guidance matters because theme bugs often hide in template hierarchy assumptions, conditional logic, or incorrect asset loading.

Security guidance for themes should be treated as a supplement to the broader WordPress security guidance. Theme code is still code shipped to real sites, so it must be written defensively. Privacy compatibility also matters: themes should not interfere with WordPress privacy tools and should render privacy-related links or interfaces correctly when needed.

Publishing discipline also includes versioned updates and documentation maintenance. A theme that is hard to update or poorly documented creates support debt even if the code is technically correct.

The right mindset is to treat release as an engineering quality gate. A theme is ready only when code quality, UX, documentation, review readiness, and operational safety are aligned.

---

## SKILL SUMMARY

- **What this skill enables:** An agent can prepare a WordPress theme for release by accounting for required files, review expectations, testing, debugging, security, privacy, documentation, and submission workflow.
- **When to use:** Use this when shipping a public theme, preparing for WordPress.org review, or auditing release readiness before versioning and distribution.
