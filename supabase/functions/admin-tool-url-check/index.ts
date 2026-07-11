import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { requireAdminSession, CORS_HEADERS } from "../_shared/adminSession.ts";

const JSON_HEADERS = { ...CORS_HEADERS, "Content-Type": "application/json" };

function jsonResponse(body: unknown, status = 200) {
  return new Response(JSON.stringify(body), { status, headers: JSON_HEADERS });
}

const TIMEOUT_MS = 6000;

// Basic SSRF guard for an admin-supplied URL that this function fetches
// server-side. Not exhaustive DNS-rebinding protection — just refuses the
// obvious cases (localhost, loopback, private/link-local ranges) before
// making any outbound request.
const BLOCKED_HOSTNAME_PATTERNS = [
  /^localhost$/i,
  /^127\./,
  /^0\.0\.0\.0$/,
  /^10\./,
  /^172\.(1[6-9]|2\d|3[01])\./,
  /^192\.168\./,
  /^169\.254\./,
  /\.local$/i,
  /^\[?::1\]?$/,
];

function isBlockedHostname(hostname: string): boolean {
  return BLOCKED_HOSTNAME_PATTERNS.some((re) => re.test(hostname));
}

// Reachability check ONLY — no content is read, parsed, or stored. This is
// URL validation for the New Software wizard's Step 1, not extraction: no
// scraping, no crawling, no Firecrawl/Browserbase/Playwright, no AI. That
// work is explicitly deferred to a later phase.
Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: CORS_HEADERS });
  }

  try {
    await requireAdminSession(req);

    if (req.method !== "POST") {
      return jsonResponse({ ok: false, error: "Method not allowed" }, 405);
    }

    const payload = await req.json();
    const rawUrl = typeof payload.url === "string" ? payload.url.trim() : "";
    if (!rawUrl) return jsonResponse({ ok: false, error: "url is required" }, 400);

    let parsed: URL;
    try {
      parsed = new URL(rawUrl);
    } catch {
      return jsonResponse({ ok: true, data: { valid: false, https: false, reachable: false, error: "Not a valid URL" } });
    }

    const https = parsed.protocol === "https:";
    if (parsed.protocol !== "http:" && parsed.protocol !== "https:") {
      return jsonResponse({ ok: true, data: { valid: false, https: false, reachable: false, error: "URL must use http:// or https://" } });
    }
    if (isBlockedHostname(parsed.hostname)) {
      return jsonResponse({ ok: true, data: { valid: true, https, reachable: false, error: "This host cannot be checked" } });
    }

    async function attempt(method: "HEAD" | "GET") {
      const controller = new AbortController();
      const timeoutId = setTimeout(() => controller.abort(), TIMEOUT_MS);
      try {
        const res = await fetch(parsed.toString(), {
          method,
          redirect: "follow",
          signal: controller.signal,
          headers: { "User-Agent": "GappsyBot/1.0 (+https://www.gappsy.com; URL health check)" },
        });
        return { status: res.status, finalUrl: res.url };
      } finally {
        clearTimeout(timeoutId);
      }
    }

    try {
      const result = await attempt("HEAD");
      return jsonResponse({ ok: true, data: { valid: true, https, reachable: result.status < 500, status: result.status, finalUrl: result.finalUrl } });
    } catch {
      // Some servers reject HEAD outright — retry with GET before concluding unreachable.
      try {
        const result = await attempt("GET");
        return jsonResponse({ ok: true, data: { valid: true, https, reachable: result.status < 500, status: result.status, finalUrl: result.finalUrl } });
      } catch (err) {
        const message = err instanceof Error && err.name === "AbortError" ? "Timed out" : "Could not connect";
        return jsonResponse({ ok: true, data: { valid: true, https, reachable: false, error: message } });
      }
    }
  } catch (error) {
    const errorMessage = error instanceof Error ? error.message : "Unknown error";
    if (errorMessage.includes("session") || errorMessage.includes("token") || errorMessage.includes("Missing admin")) {
      return jsonResponse({ ok: false, error: "Invalid or expired admin session" }, 401);
    }
    return jsonResponse({ ok: false, error: errorMessage }, 500);
  }
});
