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

// Social/chat link-unfurlers — these don't execute JS, so a page that only
// gets correct OG tags from client-side EntitySEOTags (useLayoutEffect) is
// invisible to them; they only ever see whatever's in the initial HTML
// <head>. Separate from isCrawlerUA (search/AI bots) since these need OG
// tag injection specifically, not the generic prerendered-file rewrite.
function isSocialUnfurlerUA(uaRaw) {
  const ua = (uaRaw || "").toLowerCase();
  return /(slackbot|twitterbot|facebookexternalhit|linkedinbot|whatsapp|telegrambot|discordbot|redditbot|pinterest|skypeuripreview|vkshare|w3c_validator)/i.test(
    ua
  );
}

const SUPABASE_URL = "https://jczdgzhnsyzvbpfqueyy.supabase.co";
const SUPABASE_ANON_KEY =
  "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpjemRnemhuc3l6dmJwZnF1ZXl5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjQxOTMzMjAsImV4cCI6MjA3OTc2OTMyMH0.YBz187aDqkiNHaURnGHcOfK5moytq7mcmVZYVGjHP3M";
const GAPPSY_DOMAIN = "https://gappsy.com";
const META_DESCRIPTION_MAX = 160;

function truncateDescription(text, max) {
  const trimmed = text.trim();
  if (trimmed.length <= max) return trimmed;
  const cut = trimmed.slice(0, max - 1);
  const lastSpace = cut.lastIndexOf(" ");
  const clean = lastSpace > max - 20 ? cut.slice(0, lastSpace) : cut;
  return `${clean.trimEnd()}…`;
}

function escapeHtmlAttr(value) {
  return String(value).replace(/&/g, "&amp;").replace(/"/g, "&quot;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
}

// Live Supabase lookup (public anon key — tool_comparisons/tools RLS
// already allows public SELECT for published rows/pairs, same access the
// client-side app itself uses) so a brand-new comparison (created by the
// lead-magnet generator minutes ago, no prerendered static file yet — see
// scripts/prerender-comparisons.js, which only runs at full-build time) gets
// correct OG tags immediately, not just after the next deploy.
async function fetchComparisonSeoData(slug) {
  const url = `${SUPABASE_URL}/rest/v1/tool_comparisons?slug=eq.${encodeURIComponent(slug)}&status=eq.published&select=slug,tool_a:tools!tool_comparisons_tool_a_id_fkey(name,slug,logo,short_description),tool_b:tools!tool_comparisons_tool_b_id_fkey(name,slug,logo,short_description)`;
  const res = await fetch(url, {
    headers: { apikey: SUPABASE_ANON_KEY, Authorization: `Bearer ${SUPABASE_ANON_KEY}` },
  });
  if (!res.ok) return null;
  const rows = await res.json().catch(() => null);
  const row = Array.isArray(rows) ? rows[0] : null;
  if (!row || !row.tool_a || !row.tool_b) return null;

  const { tool_a: toolA, tool_b: toolB } = row;
  const title = `${toolA.name} vs ${toolB.name}: Pricing, Features & Verdict Compared | Gappsy`;
  const description = truncateDescription(
    `Compare ${toolA.name} and ${toolB.name} on pricing, features, platforms, and ratings.`,
    META_DESCRIPTION_MAX
  );
  const canonical = `${GAPPSY_DOMAIN}/compare/${slug}/`;
  const ogImage = toolA.logo || toolB.logo || `${GAPPSY_DOMAIN}/og/default-og-image.svg`;
  return { title, description, canonical, ogImage };
}

function injectComparisonSeoTags(html, seo) {
  let out = html;
  out = out.replace(/<title>[^<]*<\/title>/i, `<title>${escapeHtmlAttr(seo.title)}</title>`);
  out = out.replace(/<meta\s+name="description"\s+content="[^"]*"[^>]*>/i, `<meta name="description" content="${escapeHtmlAttr(seo.description)}">`);
  const replaceOrNoop = (regex, tag) => {
    if (regex.test(out)) out = out.replace(regex, tag);
    else out = out.replace("</head>", `${tag}\n</head>`);
  };
  replaceOrNoop(/<meta\s+property="og:title"\s+content="[^"]*"[^>]*>/i, `<meta property="og:title" content="${escapeHtmlAttr(seo.title)}">`);
  replaceOrNoop(/<meta\s+property="og:description"\s+content="[^"]*"[^>]*>/i, `<meta property="og:description" content="${escapeHtmlAttr(seo.description)}">`);
  replaceOrNoop(/<meta\s+property="og:image"\s+content="[^"]*"[^>]*>/i, `<meta property="og:image" content="${escapeHtmlAttr(seo.ogImage)}">`);
  replaceOrNoop(/<meta\s+property="og:url"\s+content="[^"]*"[^>]*>/i, `<meta property="og:url" content="${escapeHtmlAttr(seo.canonical)}">`);
  replaceOrNoop(/<meta\s+name="twitter:title"\s+content="[^"]*"[^>]*>/i, `<meta name="twitter:title" content="${escapeHtmlAttr(seo.title)}">`);
  replaceOrNoop(/<meta\s+name="twitter:description"\s+content="[^"]*"[^>]*>/i, `<meta name="twitter:description" content="${escapeHtmlAttr(seo.description)}">`);
  replaceOrNoop(/<link\s+rel="canonical"\s+href="[^"]*"[^>]*>/i, `<link rel="canonical" href="${escapeHtmlAttr(seo.canonical)}">`);
  return out;
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

    // ── /compare/:slug — inject correct OG tags for crawlers AND social/
    // chat link-unfurlers, via a live Supabase lookup rather than relying on
    // a static prerendered file. Covers the gap for a comparison created by
    // the lead-magnet generator (schedulerRegistry.ts) since the last full
    // build — EntitySEOTags only sets tags client-side (useLayoutEffect),
    // invisible to anything that doesn't execute JS, and scripts/
    // prerender-comparisons.js only runs at full-build time. Also patches
    // an ALREADY-prerendered page the same way — always correct, either way.
    const compareMatch = url.pathname.match(/^\/compare\/([a-z0-9-]+)\/?$/i);
    if (compareMatch && (isCrawlerUA(ua) || isSocialUnfurlerUA(ua))) {
      const slug = compareMatch[1];
      const spaRes = await context.next();
      if (!spaRes || spaRes.status >= 400) return;

      // Read the body exactly once up front — a Response's stream can't be
      // read twice, so both the success and fallback paths below reuse this
      // same string rather than ever touching spaRes.body/.text() again.
      const originalHtml = await spaRes.text();
      try {
        const seo = await fetchComparisonSeoData(slug);
        if (!seo) return new Response(originalHtml, { status: spaRes.status, statusText: spaRes.statusText, headers: spaRes.headers });

        const patched = injectComparisonSeoTags(originalHtml, seo);
        const outHeaders = new Headers(spaRes.headers);
        outHeaders.set("x-gappsy-compare-seo", "injected");
        outHeaders.set("cache-control", "public, max-age=300, must-revalidate");
        return new Response(patched, { status: 200, headers: outHeaders });
      } catch (_e) {
        // Never let a Supabase hiccup or a bad regex break the page for a
        // real crawler/unfurler — fall back to the original, unpatched HTML.
        return new Response(originalHtml, { status: spaRes.status, statusText: spaRes.statusText, headers: spaRes.headers });
      }
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
