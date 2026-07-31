# HTTP API and External Requests

## CHUNK 1: Making External HTTP Requests with WordPress Helpers

WordPress provides a unified HTTP API for making outbound requests from plugins and themes. The preferred helpers are:

- `wp_remote_get()` for GET requests
- `wp_remote_post()` for POST requests
- `wp_remote_head()` for HEAD requests
- `wp_remote_request()` for arbitrary methods such as PUT, PATCH, DELETE, or OPTIONS

Response processing should generally happen through the retrieval helpers rather than by inspecting raw response arrays directly. Common helpers include:

- `wp_remote_retrieve_body()`
- `wp_remote_retrieve_headers()`
- `wp_remote_retrieve_header()`
- `wp_remote_retrieve_response_code()`
- `wp_remote_retrieve_response_message()`

This pattern gives WordPress code a standard request layer that works across hosting environments and request types. Use it whenever you need to talk to external APIs instead of reaching for raw cURL or custom HTTP code first.

GET requests are appropriate for retrieval. POST requests are appropriate for sending data for the remote service to act on. For nonstandard methods, `wp_remote_request()` provides the flexible fallback.

---

## CHUNK 2: Handling Authentication, Performance, and Advanced Request Options

The HTTP API supports more than basic GET and POST. The `$args` array lets you control options such as method, timeout, headers, HTTP version, redirection behavior, blocking mode, and body content.

Authentication is often API-specific. A simple example is HTTP Basic Authentication using the `Authorization` header, but the handbook explicitly warns that basic auth is insecure and should generally be limited to testing and development unless the remote API specifically requires it in a safe transport context.

Performance is a major concern with outbound HTTP calls because each request can block page rendering while waiting on a remote server. The handbook recommends caching responses whenever possible, often with the Transients API, so repeated visitors do not trigger the same slow remote call. It also points out that some APIs support HEAD requests to check whether content changed before doing a full GET.

The practical workflow is:

- use the standard HTTP helper for the request type
- inspect status codes and response bodies with retrieval helpers
- cache remote results when data does not change frequently
- use advanced options or custom methods only when the API requires them

This gives you a consistent, WordPress-native way to talk to external services without making every request a performance liability.

---

## SKILL SUMMARY

- **What this skill enables:** An agent can make outbound HTTP requests with WordPress’s HTTP API, handle responses safely, add authentication when required, and reduce load through caching and request strategy.
- **When to use:** Use this when integrating with external APIs, pulling remote data into WordPress, posting data to third-party services, or designing performant remote-fetch workflows.