---
name: wordpress-performance
description: 'Use when optimizing or diagnosing WordPress performance, including caching, PHP optimization, monitoring, profiling, uptime checks, slow queries, external request overhead, and general performance operations. Good triggers: cache, optimization, profiling, slow site, PHP-FPM, monitoring, uptime, bottleneck, slow query, transients, object cache, page cache.'
---

# WordPress Performance

Use this skill for WordPress performance diagnosis, optimization planning, and monitoring workflows.

## When To Use

- Investigating a slow WordPress site
- Prioritizing caching, PHP tuning, or infrastructure-level improvements
- Monitoring uptime, page latency, slow queries, or external-call overhead
- Connecting measured bottlenecks to practical remediation steps

## Workflow

1. Start from observed bottlenecks rather than assumptions.
2. Read the relevant performance reference from `./references/`.
3. Pull in HTTP, options/transients, or server references if the bottleneck crosses domains.
4. Optimize the highest-impact measured issue first.

## Reference Map

- Monitoring and profiling: `./references/monitoring-and-profiling/`

## Recommended Entry Points

- `./references/monitoring-and-profiling/performance-optimization-and-monitoring.md`

Use this skill when performance is the main concern and the task needs operational rather than purely code-level reasoning.