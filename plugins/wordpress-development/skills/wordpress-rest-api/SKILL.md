---
name: wordpress-rest-api
description: 'Use when working with WordPress REST API and remote integration surfaces, including endpoints, schema, controllers, HTTP API clients, application-facing requests, authentication methods, and XML-RPC legacy integrations. Good triggers: register_rest_route, REST schema, controller, HTTP API, wp_remote_get, wp_remote_post, application passwords, XML-RPC, permission_callback, remote integration.'
---

# WordPress REST API

Use this skill for API-facing WordPress work, whether the site exposes endpoints or consumes external services.

## When To Use

- Custom REST endpoints, route design, schema, controllers, or request handling
- HTTP API usage for outbound requests to third-party services
- Authentication choices for remote clients or legacy XML-RPC compatibility
- Migration from XML-RPC to REST or review of programmatic integration surfaces

## Workflow

1. Determine whether the task is inbound REST, outbound HTTP, or legacy remote access.
2. Read the most relevant reference in `./references/`.
3. Pull in security references if authentication, permission checks, or input handling matter.
4. Pull in core/options/transients references when caching or shared configuration is part of the solution.

## Reference Map

- Authentication: `./references/authentication/`
- Endpoints: `./references/endpoints/`
- HTTP clients: `./references/http-clients/`
- Schema and controllers: `./references/schema-and-controllers/`

## Recommended Entry Points

- `./references/endpoints/rest-api-endpoints-and-requests.md`
- `./references/schema-and-controllers/rest-api-schema-and-controllers.md`
- `./references/http-clients/http-api-and-external-requests.md`
- `./references/authentication/xml-rpc-and-legacy-remote-interfaces.md`

Use this skill whenever the key question is API contract, remote access, request handling, or external integration behavior.