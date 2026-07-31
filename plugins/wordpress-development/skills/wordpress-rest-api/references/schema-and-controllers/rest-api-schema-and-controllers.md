# REST API Schema and Controllers

## CHUNK 1: Using JSON Schema to Make Plugin Endpoints Discoverable and Testable

The WordPress REST API uses JSON Schema to describe how data should be structured. Schema is optional in a strict sense, but the handbook makes clear that skipping it means giving up important benefits such as improved testing, discoverability, and overall structure.

Without schema, an endpoint may still function, but clients have less reliable information about what fields exist, what types are expected, and how data should be validated. Schema gives the API a contract.

In practical plugin development, that means schema should be treated as part of endpoint design, not afterthought documentation. It helps both server-side validation and client-side understanding.

The design principle is simple: if you want endpoints to be maintainable, self-describing, and robust, define the structure of the data they accept and return.

---

## CHUNK 2: Organizing Complex Endpoints with Controller Classes

As REST endpoints grow, controller classes provide a more maintainable structure than scattering callbacks across procedural code. A controller typically accepts `WP_REST_Request` input and produces `WP_REST_Response` output, with methods such as `get_items()` and route registration grouped in one place.

This pattern creates a standard interface for endpoint behavior and makes it easier to evolve routes, permissions, schema, and response handling over time. The controller object can be instantiated during `rest_api_init`, and its `register_routes()` method can register all related endpoints.

Use controller classes when an API surface includes multiple related routes or operations. For a tiny single endpoint, a simple callback may be enough. For anything larger, controllers reduce duplication and make the REST layer easier to reason about.

---

## SKILL SUMMARY

- **What this skill enables:** An agent can improve plugin REST APIs by defining schema and organizing larger endpoint sets into controller classes.
- **When to use:** Use this when plugin APIs move beyond one-off routes and need stronger contracts, better structure, or easier long-term maintenance.