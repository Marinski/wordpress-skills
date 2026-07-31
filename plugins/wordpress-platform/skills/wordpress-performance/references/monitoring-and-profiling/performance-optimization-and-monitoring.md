# Performance Optimization and Monitoring

## CHUNK 1: Optimizing the Stack Before Chasing Micro-Fixes

The advanced administration performance material frames optimization as a systems problem. WordPress performance depends on the hosting model, server configuration, PHP behavior, caching strategy, media weight, plugin load, and outbound requests. If the foundation is weak, code-level tweaks will not save the site.

The broad workflow is:

- understand the hosting constraints first
- prioritize caching because it often yields the biggest gain fastest
- keep PHP and surrounding software current and tuned appropriately
- reduce avoidable workload such as oversized media, inefficient plugins, and repeated expensive requests

This matters on both shared hosting and more customized environments. Shared hosting limits your control but makes smart caching and plugin discipline even more important. Dedicated infrastructure gives more tuning freedom but also more responsibility.

The important principle is order of operations. Start with architecture and high-impact bottlenecks before reaching for low-level micro-optimizations.

---

## CHUNK 2: Monitoring Uptime, Slow Paths, and Real Bottlenecks

Optimization without measurement turns into guesswork. The handbook therefore pairs performance guidance with monitoring and profiling. Uptime checks show whether the site responds. Performance monitoring shows whether users are getting an acceptable experience. Profiling shows where the real bottlenecks live.

Useful operational practices include:

- external and internal uptime checks
- monitoring slow transactions, slow queries, and PHP-FPM or database logs
- profiling with tools such as application-performance monitors when deeper diagnosis is needed
- watching external HTTP calls and cache effectiveness rather than focusing only on page HTML

This ties directly back to earlier skills on transients, HTTP requests, and server operations. If a site is slow, the cause may be remote calls, bad caching, large queries, overloaded PHP workers, or media bloat.

The right rule is to optimize the measured bottleneck, not the most fashionable one.

---

## SKILL SUMMARY

- **What this skill enables:** An agent can evaluate WordPress performance at the hosting, PHP, caching, and application levels, and can connect optimization work to monitoring and profiling evidence.
- **When to use:** Use this when diagnosing a slow site, planning performance improvements, or deciding whether the main issue is caching, infrastructure, PHP behavior, or application-level load.