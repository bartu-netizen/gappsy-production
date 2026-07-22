// netlify/edge-functions/crawler-static.js

const UA_BROWSER =
  "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36";

const NOINDEX_HTML =
  '<!doctype html><html lang="en"><head><meta charset="UTF-8"><meta name="robots" content="noindex,nofollow"><title>Agency Profile</title></head><body></body></html>';

const NOINDEX_HEADERS = {
  "content-type": "text/html; charset=utf-8",
  "x-robots-tag": "noindex, nofollow",
  "cache-control": "no-store, private",
};

function isCrawlerUA(uaRaw) {
  const ua = (uaRaw || "").toLowerCase();
  return /(googlebot|google-inspectiontool|bingbot|slurp|duckduckbot|baiduspider|yandexbot|applebot|petalbot|semrushbot|ahrefsbot|mj12bot|gptbot|chatgpt-user|claudebot|claude-web|anthropic-ai|perplexitybot|ccbot|google-extended)/i.test(
    ua
  );
}

function isAssetPath(pathname) {
  return (
    pathname.startsWith("/assets/") ||
    /\.(js|css|png|jpg|jpeg|webp|svg|gif|ico|json|txt|xml|map|woff2?|ttf|eot)$/i.test(
      pathname
    )
  );
}

export default async (request, context) => {
  try {
    // Only GET/HEAD
    if (request.method !== "GET" && request.method !== "HEAD") return;

    const url = new URL(request.url);
    const ua = request.headers.get("user-agent") || "";

    // Don't touch assets (check before crawler gate so asset requests pass through)
    if (isAssetPath(url.pathname)) return;

    // ── /your-agency — enforce noindex for ALL users (crawlers AND browsers) ──
    // This must run before the isCrawlerUA gate so that curl/browser testing
    // also sees noindex in the HTML source.
    if (/^\/your-agency(\/|$)/i.test(url.pathname)) {
      if (isCrawlerUA(ua)) {
        // Crawlers get a minimal no-content noindex page
        return new Response(NOINDEX_HTML, {
          status: 200,
          headers: NOINDEX_HEADERS,
        });
      }

      // Regular browsers: pass through to SPA but patch the robots meta tag
      // so the initial HTML always contains noindex,nofollow regardless of JS
      const spaRes = await context.next();
      if (!spaRes || spaRes.status >= 400) return;

      const html = await spaRes.text();
      const patched = html.replace(
        /<meta\s+name="robots"\s+content="[^"]*"[^>]*/i,
        '<meta name="robots" content="noindex,nofollow"'
      );

      const outHeaders = new Headers(spaRes.headers);
      outHeaders.set("x-robots-tag", "noindex, nofollow");
      outHeaders.set("cache-control", "no-store, private");

      return new Response(patched, { status: 200, headers: outHeaders });
    }

    // ── All other paths: only act for known crawlers ──
    if (!isCrawlerUA(ua)) return;

    // Determine target prerendered file
    let targetPath = null;

    // Homepage: serve built index.html to crawlers
    if (url.pathname === "/" || url.pathname === "") {
      targetPath = "/index.html";
    } else {
      const m = url.pathname.match(
        /^\/marketing-agencies-in-([a-z0-9-]+)-united-states\/?$/i
      );
      if (!m) return;
      targetPath = `/marketing-agencies-in-${m[1].toLowerCase()}-united-states.html`;
    }

    const targetUrl = new URL(targetPath, url);

    // Make downstream request look like a normal browser to bypass crawler pipeline.
    const headers = new Headers(request.headers);
    headers.set("user-agent", UA_BROWSER);
    headers.set(
      "accept",
      "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"
    );

    const downstreamReq = new Request(targetUrl.toString(), {
      method: request.method,
      headers,
    });

    const res = await context.next(downstreamReq);

    // If missing or error, bypass safely
    if (!res || res.status >= 400) return;

    const outHeaders = new Headers(res.headers);
    outHeaders.set("x-gappsy-crawler-static", "rewritten");
    outHeaders.set("x-gappsy-crawler-target", targetPath);
    outHeaders.set("cache-control", "public, max-age=0, must-revalidate");

    return new Response(res.body, {
      status: res.status,
      statusText: res.statusText,
      headers: outHeaders,
    });
  } catch (e) {
    // swallow errors to keep bypass safe
    return;
  }
};

export const config = {
  onError: "bypass",
};
