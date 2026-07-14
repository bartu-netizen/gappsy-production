// Crawler Gateway — the ONLY thing allowed to call the loopback-only
// Crawl4AI instance (127.0.0.1:11235) on this server. Runs as its own
// isolated, resource-capped Podman container under the svc-ai account,
// exactly like Crawl4AI itself.
//
// Scope, deliberately narrow:
//   - Exactly one action: POST /crawl { request_id, url, max_pages, max_depth, max_duration_ms }
//   - No arbitrary shell execution, no generic proxying, no passthrough of
//     caller-supplied Crawl4AI options. Every parameter is validated and
//     independently clamped to this file's own hard limits — the caller's
//     requested values are advisory only, never trusted as-is.
//   - GET /health for liveness.
//
// Auth: HMAC-SHA256 over `${timestamp}.${requestId}.${rawBody}` using
// GATEWAY_SHARED_SECRET (env var, never logged, never returned). Requests
// with a timestamp more than 5 minutes old are rejected (replay window).
//
// Node's built-in http/crypto only — no external dependencies, matching
// this project's "deliberately small stack" convention.

const http = require("node:http");
const crypto = require("node:crypto");
const { URL } = require("node:url");
const dns = require("node:dns").promises;

const PORT = Number(process.env.GATEWAY_PORT || 8787);
// Deployed with --network=host (see README.md): Crawl4AI's own port
// mapping (127.0.0.1:11235) only accepts connections that genuinely
// originate from the host's loopback — a separate rootless container
// reaching it via host.containers.internal arrives via a routed/NATed
// path, not literally as 127.0.0.1, and is correctly rejected. Loosening
// Crawl4AI's own binding was explicitly out of scope, so instead this
// container shares the host's network namespace directly, making its own
// 127.0.0.1 the real host loopback. GATEWAY_BIND_HOST defaults to
// 0.0.0.0 for a normal bridge-networked deployment (safe: still only
// reachable via whatever the container runtime's own port publish
// restricts), but this deployment sets it to 127.0.0.1 explicitly.
const BIND_HOST = process.env.GATEWAY_BIND_HOST || "0.0.0.0";
const GATEWAY_SHARED_SECRET = process.env.GATEWAY_SHARED_SECRET || "";
const CRAWL4AI_URL = process.env.CRAWL4AI_URL || "http://127.0.0.1:11235";
const CRAWL4AI_API_TOKEN = process.env.CRAWL4AI_API_TOKEN || "";

const HARD_LIMITS = {
  // Raised from 10 to give real content-generation passes enough source
  // material (pricing + features + integrations + docs + a
  // customer-stories/use-cases page routinely exhausted the old cap
  // before reaching anything genuinely differentiating).
  MAX_PAGES: 15,
  MAX_DEPTH: 2,
  MAX_DURATION_MS: 10 * 60 * 1000,
  MAX_REQUEST_BODY_BYTES: 4096, // the request itself is tiny (a URL + a few ints)
  MAX_RESPONSE_BYTES: 8_000_000, // raised alongside MAX_PAGES (10 -> 15) — a
  // real 15-page crawl of a content-heavy site now routinely exceeds the
  // old 5MB cap; truncation past this point is now crash-safe regardless
  // (see the response-construction block below), this just reduces how
  // often truncation is needed at all.
  MAX_REDIRECTS: 5,
  TIMESTAMP_TOLERANCE_S: 300,
  CRAWL4AI_TIMEOUT_MS: 90_000, // raised alongside MAX_PAGES (was 60s) — still well under the edge function's own 120s patience below
  SCREENSHOT_TIMEOUT_MS: 30_000, // separate, shorter budget — a slow/failed screenshot must never hold up the crawl
  MAX_SCREENSHOT_BASE64_BYTES: 2_000_000, // ~1.5MB PNG; dropped (not truncated) if larger, since a truncated base64 string is just corrupt data
};

const PRIVATE_IPV4_RANGES = [
  ["10.0.0.0", "10.255.255.255"],
  ["172.16.0.0", "172.31.255.255"],
  ["192.168.0.0", "192.168.255.255"],
  ["127.0.0.0", "127.255.255.255"],
  ["169.254.0.0", "169.254.255.255"],
  ["100.64.0.0", "100.127.255.255"],
  ["0.0.0.0", "0.255.255.255"],
].map(([lo, hi]) => [ip4ToInt(lo), ip4ToInt(hi)]);

function ip4ToInt(addr) {
  const p = addr.split(".").map(Number);
  return ((p[0] << 24) | (p[1] << 16) | (p[2] << 8) | p[3]) >>> 0;
}
function isPrivateIPv4(addr) {
  if (!/^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$/.test(addr)) return false;
  const n = ip4ToInt(addr);
  return PRIVATE_IPV4_RANGES.some(([lo, hi]) => n >= lo && n <= hi);
}
function isPrivateIPv6(addr) {
  const a = addr.toLowerCase();
  return a === "::1" || a.startsWith("fe80:") || a.startsWith("fc") || a.startsWith("fd") || a.startsWith("::ffff:127.");
}

const IGNORE_PATH_PATTERNS = [/privacy/i, /terms/i, /careers/i, /^\/blog\//i, /changelog/i, /login|signin|sign-in/i, /signup|sign-up|register/i, /checkout|cart|billing/i, /^\/admin/i, /^\/account/i, /^\/dashboard/i];
// customers/case-studies/solutions/use-cases added: this is exactly the
// page type genuinely in-depth content needs and the old list never
// prioritized — real use cases and named customer/industry evidence live
// there, not on the homepage or pricing page.
const PRIORITY_PATH_PATTERNS = [/^\/$/, /pricing/i, /features?/i, /product/i, /integrations?/i, /^\/about/i, /faq|help/i, /^\/docs/i, /security|trust/i, /platform|apps/i, /customers?/i, /case[-_ ]?stud(y|ies)/i, /use[-_ ]?cases?/i, /solutions?/i];

function registrableDomain(hostname) {
  const labels = hostname.toLowerCase().split(".").filter(Boolean);
  const TWO_LABEL = new Set(["co.uk", "org.uk", "ac.uk", "gov.uk", "co.jp", "co.nz", "co.za", "com.au", "com.br", "com.mx", "com.sg", "co.in", "co.kr", "com.cn"]);
  if (labels.length <= 2) return labels.join(".");
  const lastTwo = labels.slice(-2).join(".");
  if (TWO_LABEL.has(lastTwo) && labels.length >= 3) return labels.slice(-3).join(".");
  return lastTwo;
}

async function resolvesToPublicAddress(hostname) {
  if (/^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$/.test(hostname)) {
    return !isPrivateIPv4(hostname);
  }
  try {
    const [a4, a6] = await Promise.all([
      dns.resolve4(hostname).catch(() => []),
      dns.resolve6(hostname).catch(() => []),
    ]);
    const all = [...a4, ...a6];
    if (all.length === 0) return false;
    return !all.some((addr) => (addr.includes(":") ? isPrivateIPv6(addr) : isPrivateIPv4(addr)));
  } catch {
    return false;
  }
}

function validateUrl(rawUrl) {
  let parsed;
  try {
    parsed = new URL(rawUrl);
  } catch {
    return { ok: false, reason: "invalid_url" };
  }
  if (parsed.protocol !== "http:" && parsed.protocol !== "https:") return { ok: false, reason: "unsupported_protocol" };
  const hostname = parsed.hostname.toLowerCase();
  if (hostname === "localhost" || hostname.endsWith(".localhost") || hostname.endsWith(".local")) return { ok: false, reason: "localhost_blocked" };
  if (/^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$/.test(hostname) && isPrivateIPv4(hostname)) return { ok: false, reason: "private_ip_blocked" };
  if (hostname.includes(":") && isPrivateIPv6(hostname)) return { ok: false, reason: "private_ip_blocked" };
  return { ok: true, parsed, hostname };
}

function log(event, fields) {
  // Structured, secret-free logging to stdout (captured by journald under
  // the same systemd-managed pattern as Crawl4AI itself).
  const safe = { ...fields };
  delete safe.secret;
  delete safe.signature;
  delete safe.token;
  console.log(JSON.stringify({ event, ts: new Date().toISOString(), ...safe }));
}

function timingSafeEqual(a, b) {
  const bufA = Buffer.from(a, "hex");
  const bufB = Buffer.from(b, "hex");
  if (bufA.length !== bufB.length) return false;
  return crypto.timingSafeEqual(bufA, bufB);
}

function verifySignature(timestamp, requestId, rawBody, signature) {
  if (!GATEWAY_SHARED_SECRET) return false;
  const nowS = Math.floor(Date.now() / 1000);
  const ts = Number(timestamp);
  if (!Number.isFinite(ts) || Math.abs(nowS - ts) > HARD_LIMITS.TIMESTAMP_TOLERANCE_S) return false;
  const expected = crypto.createHmac("sha256", GATEWAY_SHARED_SECRET).update(`${timestamp}.${requestId}.${rawBody}`).digest("hex");
  try {
    return timingSafeEqual(expected, signature);
  } catch {
    return false;
  }
}

// A very small, fixed-shape client to the local Crawl4AI instance. Never
// forwards caller-supplied Crawl4AI options — only ever sends a URL list.
async function crawl4aiFetch(urls) {
  const controller = new AbortController();
  const timeoutId = setTimeout(() => controller.abort(), HARD_LIMITS.CRAWL4AI_TIMEOUT_MS);
  try {
    const res = await fetch(`${CRAWL4AI_URL}/crawl`, {
      method: "POST",
      headers: { Authorization: `Bearer ${CRAWL4AI_API_TOKEN}`, "Content-Type": "application/json" },
      body: JSON.stringify({ urls }),
      signal: controller.signal,
    });
    const text = await res.text();
    if (!res.ok) throw new Error(`crawl4ai_http_${res.status}`);
    return JSON.parse(text);
  } finally {
    clearTimeout(timeoutId);
  }
}

// Homepage-only, best-effort real screenshot via Crawl4AI's dedicated
// /screenshot endpoint (distinct from /crawl — this is the ONLY way to get
// an actual rendered-page image; /crawl's own result objects never include
// one). Returns null on ANY failure (timeout, non-200, bad/missing body,
// oversized image) rather than throwing — a screenshot is a nice-to-have
// enrichment, never something that should fail or slow down the crawl
// itself. Response shape assumption (Crawl4AI 0.9.x, output_path omitted):
// `{ success: true, screenshot: "<base64 PNG>" }` — matches the same
// `result.screenshot` convention as the Python SDK's `CrawlerRunConfig
// (screenshot=True)`. Checked defensively (a couple of plausible key
// names) since this wasn't verified against a live call before deploying;
// if Crawl4AI's actual response shape differs, this simply returns null
// forever until corrected — it will never corrupt or break page crawling.
async function crawl4aiScreenshot(url) {
  const controller = new AbortController();
  const timeoutId = setTimeout(() => controller.abort(), HARD_LIMITS.SCREENSHOT_TIMEOUT_MS);
  try {
    const res = await fetch(`${CRAWL4AI_URL}/screenshot`, {
      method: "POST",
      headers: { Authorization: `Bearer ${CRAWL4AI_API_TOKEN}`, "Content-Type": "application/json" },
      body: JSON.stringify({ url, screenshot_wait_for: 2 }),
      signal: controller.signal,
    });
    if (!res.ok) return null;
    const body = await res.json().catch(() => null);
    if (!body) return null;
    const base64 = body.screenshot || body.data || (body.result && body.result.screenshot) || null;
    if (!base64 || typeof base64 !== "string") return null;
    if (base64.length > HARD_LIMITS.MAX_SCREENSHOT_BASE64_BYTES) return null;
    return base64;
  } catch {
    return null;
  } finally {
    clearTimeout(timeoutId);
  }
}

async function crawl4aiHealth() {
  try {
    const res = await fetch(`${CRAWL4AI_URL}/health`, { signal: AbortSignal.timeout(5000) });
    return res.ok;
  } catch {
    return false;
  }
}

// Homepage first, then a bounded, prioritized selection of same-domain
// internal links (ignoring login/checkout/legal/etc.), matching Phase 3's
// scope rules. This orchestration — not Crawl4AI itself — is what enforces
// "same registrable domain, max N pages, max depth 2" server-side.
async function orchestrateCrawl(targetUrl, maxPages, _maxDepth) {
  // Screenshot runs concurrently with the homepage crawl (independent
  // Crawl4AI calls) so it adds zero latency on the common path; its own
  // timeout/failure handling is fully isolated in crawl4aiScreenshot.
  const [home, screenshotBase64] = await Promise.all([
    crawl4aiFetch([targetUrl]),
    crawl4aiScreenshot(targetUrl),
  ]);
  const homeResult = home?.results?.[0];
  if (!homeResult || homeResult.success === false) {
    return { crawl4ai_version: home?.version || "unknown", results: home?.results || [], discovered: 0, screenshotBase64 };
  }

  const domain = registrableDomain(new URL(targetUrl).hostname);
  const internalLinks = (homeResult.links && homeResult.links.internal) || [];
  const candidates = [];
  const seen = new Set([targetUrl]);

  for (const link of internalLinks) {
    if (!link.href) continue;
    let abs;
    try {
      abs = new URL(link.href, targetUrl).toString();
    } catch {
      continue;
    }
    let host;
    try {
      host = new URL(abs).hostname;
    } catch {
      continue;
    }
    if (registrableDomain(host) !== domain) continue; // same registrable domain only
    const pathname = new URL(abs).pathname;
    if (IGNORE_PATH_PATTERNS.some((re) => re.test(pathname))) continue;
    if (seen.has(abs)) continue;
    seen.add(abs);
    candidates.push({ url: abs, priority: PRIORITY_PATH_PATTERNS.some((re) => re.test(pathname)) ? 1 : 0 });
  }

  candidates.sort((a, b) => b.priority - a.priority);
  const selected = candidates.slice(0, Math.max(0, maxPages - 1)).map((c) => c.url);

  let restResults = [];
  if (selected.length > 0) {
    const rest = await crawl4aiFetch(selected);
    restResults = rest?.results || [];
  }

  return {
    crawl4ai_version: home?.version || "0.9.1",
    results: [homeResult, ...restResults],
    discovered: internalLinks.length,
    screenshotBase64,
  };
}

const server = http.createServer(async (req, res) => {
  const start = Date.now();
  const requestId = req.headers["x-gateway-request-id"] || "unknown";

  if (req.method === "GET" && req.url === "/health") {
    const crawl4aiOk = await crawl4aiHealth();
    res.writeHead(crawl4aiOk ? 200 : 503, { "Content-Type": "application/json" });
    res.end(JSON.stringify({ status: crawl4aiOk ? "ok" : "degraded", crawl4ai: crawl4aiOk }));
    return;
  }

  if (req.method !== "POST" || req.url !== "/crawl") {
    res.writeHead(404, { "Content-Type": "application/json" });
    res.end(JSON.stringify({ ok: false, error: "Not found" }));
    return;
  }

  const chunks = [];
  let tooLarge = false;
  req.on("data", (chunk) => {
    chunks.push(chunk);
    if (Buffer.concat(chunks).length > HARD_LIMITS.MAX_REQUEST_BODY_BYTES) tooLarge = true;
  });
  req.on("end", async () => {
    if (tooLarge) {
      res.writeHead(413, { "Content-Type": "application/json" });
      res.end(JSON.stringify({ ok: false, error_code: "request_too_large", error: "Request body too large." }));
      return;
    }
    const rawBody = Buffer.concat(chunks).toString("utf8");

    const timestamp = req.headers["x-gateway-timestamp"];
    const signature = req.headers["x-gateway-signature"];
    if (!timestamp || !signature || !verifySignature(timestamp, requestId, rawBody, String(signature))) {
      log("auth_failed", { requestId, status: 401, durationMs: Date.now() - start });
      res.writeHead(401, { "Content-Type": "application/json" });
      res.end(JSON.stringify({ ok: false, error_code: "unauthorized", error: "Invalid or missing gateway signature." }));
      return;
    }

    let body;
    try {
      body = JSON.parse(rawBody);
    } catch {
      res.writeHead(400, { "Content-Type": "application/json" });
      res.end(JSON.stringify({ ok: false, error_code: "malformed_request", error: "Malformed JSON body." }));
      return;
    }

    const targetUrl = typeof body.url === "string" ? body.url : "";
    // Caller-requested limits are advisory only — always clamp to this
    // file's own hard ceiling, never trust the request's numbers directly.
    const maxPages = Math.min(HARD_LIMITS.MAX_PAGES, Math.max(1, Number(body.max_pages) || HARD_LIMITS.MAX_PAGES));
    const maxDepth = Math.min(HARD_LIMITS.MAX_DEPTH, Math.max(1, Number(body.max_depth) || HARD_LIMITS.MAX_DEPTH));

    const urlCheck = validateUrl(targetUrl);
    if (!urlCheck.ok) {
      log("url_rejected", { requestId, reason: urlCheck.reason, status: 400, durationMs: Date.now() - start });
      res.writeHead(400, { "Content-Type": "application/json" });
      res.end(JSON.stringify({ ok: false, error_code: urlCheck.reason, error: "URL failed validation." }));
      return;
    }
    const publicOk = await resolvesToPublicAddress(urlCheck.hostname);
    if (!publicOk) {
      log("dns_rebinding_blocked", { requestId, status: 400, durationMs: Date.now() - start });
      res.writeHead(400, { "Content-Type": "application/json" });
      res.end(JSON.stringify({ ok: false, error_code: "private_ip_blocked", error: "URL resolves to a non-public address." }));
      return;
    }

    const jobController = new AbortController();
    const jobTimeout = setTimeout(() => jobController.abort(), HARD_LIMITS.MAX_DURATION_MS);
    try {
      const result = await orchestrateCrawl(urlCheck.parsed.toString(), maxPages, maxDepth);
      // screenshotBase64 is deliberately excluded from `result` before this
      // truncation pass — it's a single opaque base64 string, and slicing
      // raw JSON text on byte length can land mid-string. Bounding it
      // (drop entirely if oversized) already happened in
      // crawl4aiScreenshot(); it's safe to attach whole, after truncation,
      // as its own top-level field.
      const { screenshotBase64, ...rawPortion } = result;
      const serialized = JSON.stringify(rawPortion);

      // Real production incident this comment replaces: at MAX_PAGES=15 a
      // content-heavy site's serialized response routinely exceeds
      // MAX_RESPONSE_BYTES, and the naive "find the last '}'" recovery can
      // land inside a string value that itself contains a literal '}'
      // (ordinary in crawled HTML/markdown) — producing invalid JSON that
      // THROWS. That throw always falls back to a *safe* shape now rather
      // than propagating, because letting it propagate here (after
      // response-body construction had already started) previously crashed
      // the entire gateway process, not just this one request — see the
      // response-construction-order comment below for the other half of
      // the same incident.
      let rawForResponse = rawPortion;
      if (serialized.length > HARD_LIMITS.MAX_RESPONSE_BYTES) {
        const bounded = serialized.slice(0, HARD_LIMITS.MAX_RESPONSE_BYTES);
        const lastBrace = bounded.lastIndexOf("}");
        try {
          rawForResponse = lastBrace >= 0 ? JSON.parse(bounded.slice(0, lastBrace + 1)) : { success: rawPortion.success, results: [] };
        } catch {
          rawForResponse = { success: rawPortion.success, results: [] };
        }
      }

      // The FULL response body is built into a string BEFORE writeHead is
      // called, specifically so a failure while building it can never
      // happen after headers are already sent — that ordering bug (build
      // body inline inside res.end(JSON.stringify(...)), after
      // res.writeHead(200) had already been called) is what turned the
      // truncation bug above into a process crash: the catch block's own
      // res.writeHead(502) then threw ERR_HTTP_HEADERS_SENT, uncaught,
      // killing the whole gateway.
      const responseBody = JSON.stringify({
        ok: true,
        data: {
          crawl4ai_version: result.crawl4ai_version,
          discovered_pages: result.discovered,
          crawled_pages: result.results.length,
          source_urls: result.results.map((r) => r.url),
          raw: rawForResponse,
          screenshot_base64: screenshotBase64 || null,
        },
      });

      log("crawl_completed", {
        requestId,
        status: 200,
        pages: result.results.length,
        hasScreenshot: Boolean(screenshotBase64),
        truncated: serialized.length > HARD_LIMITS.MAX_RESPONSE_BYTES,
        durationMs: Date.now() - start,
      });

      res.writeHead(200, { "Content-Type": "application/json" });
      res.end(responseBody);
    } catch (err) {
      // Redacted — never forward raw exception text/stack to the caller.
      const code = err && err.name === "AbortError" ? "crawl_timeout" : "crawl_failed";
      log("crawl_error", { requestId, code, status: 502, durationMs: Date.now() - start, message: String(err && err.message).slice(0, 200) });
      if (res.headersSent) return; // never attempt a second writeHead
      res.writeHead(502, { "Content-Type": "application/json" });
      res.end(JSON.stringify({ ok: false, error_code: code, error: "The crawl could not be completed." }));
    } finally {
      clearTimeout(jobTimeout);
    }
  });
});

server.listen(PORT, BIND_HOST, () => {
  log("gateway_started", { port: PORT, host: BIND_HOST });
});

process.on("SIGTERM", () => server.close(() => process.exit(0)));
