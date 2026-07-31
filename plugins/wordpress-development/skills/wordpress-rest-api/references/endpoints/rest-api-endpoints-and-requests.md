# REST API Endpoints and Requests

## CHUNK 1: Registering Plugin REST Routes the WordPress Way

The WordPress REST API provides a structured way to get data into and out of WordPress over HTTP using JSON. It supports standard HTTP methods such as GET for retrieval, POST for creation, PUT for updates, DELETE for removal, and OPTIONS for discovery or context.

Plugins register REST routes during the `rest_api_init` action using `register_rest_route()`. The route lives under the site’s `/wp-json/` namespace and maps requests to callbacks.

A minimal example looks like this:

```php
function prefix_get_endpoint_phrase() {
	return rest_ensure_response( 'Hello World, this is the WordPress REST API' );
}

function prefix_register_example_routes() {
	register_rest_route( 'hello-world/v1', '/phrase', array(
		'methods'  => 'GET',
		'callback' => 'prefix_get_endpoint_phrase',
	) );
}

add_action( 'rest_api_init', 'prefix_register_example_routes' );
```

This route would then be reachable under `/wp-json/hello-world/v1/phrase`. The important design ideas are namespacing, explicit method handling, and consistently returning proper REST responses.

Use routes to expose resources cleanly rather than building ad hoc AJAX or front-controller patterns when the interface is really an API.

---

## CHUNK 2: Working with Requests, Permissions, and Response Objects

REST requests in WordPress are represented by `WP_REST_Request`. They include method, route, headers, parameters, and attributes. The server interprets those values and your callback produces either data or an error response.

A proper endpoint is more than a callback. It should also define permission behavior. In practice, this means using a `permissions_callback` so authorization is evaluated separately from business logic. That keeps access control explicit and makes endpoints safer to evolve.

Responses are represented by `WP_REST_Response`, which extends `WP_HTTP_Response`. It stores response data, status codes, and headers. While `rest_ensure_response()` is often enough for simple returns, understanding `WP_REST_Response` is important when you need custom headers or non-default status handling.

The practical model is:

- requests are structured input via `WP_REST_Request`
- permissions are explicit through `permissions_callback`
- responses are structured output via `WP_REST_Response` or `rest_ensure_response()`

This gives plugin APIs a predictable contract and makes them easier to test, document, and extend.

---

## SKILL SUMMARY

- **What this skill enables:** An agent can register WordPress REST routes, model request handling around `WP_REST_Request`, and return structured responses with explicit permission checks.
- **When to use:** Use this when exposing plugin functionality over JSON endpoints, building admin or frontend integrations, or replacing custom AJAX with a proper REST interface.