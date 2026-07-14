// Server-to-server client for the crawler gateway on the Hivelocity server.
// The gateway is the only thing allowed to reach Crawl4AI (127.0.0.1:11235);
// this client is the only thing in Gappsy allowed to reach the gateway.
//
// Auth: HMAC-SHA256 over `${timestamp}.${requestId}.${body}` using
// CRAWLER_GATEWAY_SECRET (a Supabase secret, never in frontend code or Git).
// The gateway independently verifies the signature, rejects stale
// timestamps (replay protection), and logs the request id.

const GATEWAY_TIMEOUT_MS = 120_000; // raised alongside crawler-gateway/server.js's
// CRAWL4AI_TIMEOUT_MS (60s -> 90s) and MAX_PAGES (10 -> 15), to preserve the
// same safety margin between this edge function's patience and the
// gateway's own internal per-call timeout. The gateway's own hard ceiling
// (CRAWL_LIMITS.MAX_DURATION_MS, 10 min) governs the crawl itself — this is
// only the edge function's own patience for a synchronous response before
// giving up and marking the job failed/retryable.

async function hmacSign(secret: string, message: string): Promise<string> {
  const key = await crypto.subtle.importKey("raw", new TextEncoder().encode(secret), { name: "HMAC", hash: "SHA-256" }, false, ["sign"]);
  const sig = await crypto.subtle.sign("HMAC", key, new TextEncoder().encode(message));
  return Array.from(new Uint8Array(sig)).map((b) => b.toString(16).padStart(2, "0")).join("");
}

export interface GatewayCrawlRequest {
  request_id: string;
  url: string;
  max_pages: number;
  max_depth: number;
  max_duration_ms: number;
}

export interface GatewayCrawlResponse {
  ok: boolean;
  error?: string;
  error_code?: string;
  data?: {
    crawl4ai_version: string;
    discovered_pages: number;
    crawled_pages: number;
    source_urls: string[];
    raw: unknown; // Crawl4aiRawResponse — normalized by crawlExtractionAdapter.ts, never used directly beyond that
    // Base64 PNG of the homepage only (bounded, best-effort) — a REAL
    // rendered screenshot from Crawl4AI's own /screenshot endpoint, not the
    // filename-heuristic guessing crawlExtractionAdapter.ts's
    // screenshot_candidates does over scraped <img> tags. null whenever the
    // gateway's screenshot call failed, timed out, or came back oversized —
    // callers must treat this as optional and never fail the crawl on its
    // absence (see crawler-gateway/server.js's crawl4aiScreenshot()).
    screenshot_base64: string | null;
  };
}

export class GatewayError extends Error {
  code: string;
  constructor(code: string, message: string) {
    super(message);
    this.code = code;
  }
}

export async function callCrawlerGateway(req: GatewayCrawlRequest): Promise<GatewayCrawlResponse> {
  const gatewayUrl = Deno.env.get("CRAWLER_GATEWAY_URL");
  const gatewaySecret = Deno.env.get("CRAWLER_GATEWAY_SECRET");
  if (!gatewayUrl || !gatewaySecret) {
    throw new GatewayError("gateway_not_configured", "Crawler gateway is not configured on this environment.");
  }

  const body = JSON.stringify(req);
  const timestamp = Math.floor(Date.now() / 1000).toString();
  const signature = await hmacSign(gatewaySecret, `${timestamp}.${req.request_id}.${body}`);

  const controller = new AbortController();
  const timeoutId = setTimeout(() => controller.abort(), GATEWAY_TIMEOUT_MS);

  try {
    const res = await fetch(`${gatewayUrl}/crawl`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "X-Gateway-Timestamp": timestamp,
        "X-Gateway-Request-Id": req.request_id,
        "X-Gateway-Signature": signature,
      },
      body,
      signal: controller.signal,
    });

    const text = await res.text();
    let parsed: GatewayCrawlResponse;
    try {
      parsed = JSON.parse(text);
    } catch {
      throw new GatewayError("gateway_malformed_response", "Gateway returned a non-JSON response.");
    }

    if (!res.ok) {
      throw new GatewayError(parsed.error_code || "gateway_error", parsed.error || `Gateway returned HTTP ${res.status}`);
    }
    return parsed;
  } catch (err) {
    if (err instanceof GatewayError) throw err;
    if (err instanceof Error && err.name === "AbortError") {
      throw new GatewayError("gateway_timeout", "Crawler gateway did not respond in time.");
    }
    throw new GatewayError("gateway_unreachable", "Could not reach the crawler gateway.");
  } finally {
    clearTimeout(timeoutId);
  }
}

export async function checkGatewayHealth(): Promise<{ ok: boolean; error?: string }> {
  const gatewayUrl = Deno.env.get("CRAWLER_GATEWAY_URL");
  if (!gatewayUrl) return { ok: false, error: "gateway_not_configured" };
  try {
    const controller = new AbortController();
    const timeoutId = setTimeout(() => controller.abort(), 8000);
    const res = await fetch(`${gatewayUrl}/health`, { signal: controller.signal });
    clearTimeout(timeoutId);
    return { ok: res.ok };
  } catch {
    return { ok: false, error: "gateway_unreachable" };
  }
}
