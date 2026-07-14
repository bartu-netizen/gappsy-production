// A fast, single-page metadata read for the vendor onboarding "new product"
// prefill step — NOT the full multi-page Discovery crawler (that runs later,
// async, only after payment — see vendorFeatureActivation.ts). Deliberately
// minimal: one GET, capped bytes, capped time, head-only regex extraction.
//
// SSRF protection is the caller's responsibility (validateCrawlUrl +
// resolvesToPublicAddress from crawlUrlSafety.ts) — this module trusts that
// the URL passed in has already cleared those checks, exactly like
// discoveryValidation.ts's validateWebsite trusts isBlockedHostname ran first.

const TIMEOUT_MS = 5000;
const MAX_BYTES = 300_000;
const USER_AGENT = "GappsyBot/1.0 (+https://www.gappsy.com; Feature My Product onboarding)";

export interface LightweightMetadata {
  title: string | null;
  description: string | null;
  faviconUrl: string | null;
  ogImageUrl: string | null;
  canonicalUrl: string | null;
}

function extractTag(html: string, re: RegExp): string | null {
  const match = html.match(re);
  return match ? match[1].trim() : null;
}

function resolveUrl(base: string, maybeRelative: string | null): string | null {
  if (!maybeRelative) return null;
  try {
    return new URL(maybeRelative, base).toString();
  } catch {
    return null;
  }
}

export async function fetchLightweightMetadata(url: string): Promise<LightweightMetadata> {
  const empty: LightweightMetadata = { title: null, description: null, faviconUrl: null, ogImageUrl: null, canonicalUrl: null };

  const controller = new AbortController();
  const timeoutId = setTimeout(() => controller.abort(), TIMEOUT_MS);
  try {
    const res = await fetch(url, {
      method: "GET",
      redirect: "follow",
      signal: controller.signal,
      headers: { "User-Agent": USER_AGENT, Accept: "text/html" },
    });
    if (!res.ok || !res.body) return empty;

    // Read only up to MAX_BYTES — the head section we need is always near
    // the top of a well-formed document, and this bounds memory/time
    // regardless of how large the actual page is.
    const reader = res.body.getReader();
    const chunks: Uint8Array[] = [];
    let total = 0;
    while (total < MAX_BYTES) {
      const { done, value } = await reader.read();
      if (done) break;
      chunks.push(value);
      total += value.length;
    }
    reader.cancel().catch(() => {});
    const html = new TextDecoder().decode(new Uint8Array(chunks.flatMap((c) => Array.from(c))));

    const finalUrl = res.url || url;
    const title = extractTag(html, /<title[^>]*>([^<]*)<\/title>/i);
    const description =
      extractTag(html, /<meta[^>]+name=["']description["'][^>]+content=["']([^"']*)["']/i) ||
      extractTag(html, /<meta[^>]+content=["']([^"']*)["'][^>]+name=["']description["']/i);
    const ogImage =
      extractTag(html, /<meta[^>]+property=["']og:image["'][^>]+content=["']([^"']*)["']/i) ||
      extractTag(html, /<meta[^>]+content=["']([^"']*)["'][^>]+property=["']og:image["']/i);
    const canonical =
      extractTag(html, /<link[^>]+rel=["']canonical["'][^>]+href=["']([^"']*)["']/i) ||
      extractTag(html, /<link[^>]+href=["']([^"']*)["'][^>]+rel=["']canonical["']/i);
    const iconHref =
      extractTag(html, /<link[^>]+rel=["'](?:shortcut icon|icon)["'][^>]+href=["']([^"']*)["']/i) ||
      extractTag(html, /<link[^>]+href=["']([^"']*)["'][^>]+rel=["'](?:shortcut icon|icon)["']/i);

    return {
      title: title || null,
      description: description || null,
      faviconUrl: resolveUrl(finalUrl, iconHref) || resolveUrl(finalUrl, "/favicon.ico"),
      ogImageUrl: resolveUrl(finalUrl, ogImage),
      canonicalUrl: resolveUrl(finalUrl, canonical) || finalUrl,
    };
  } catch {
    return empty;
  } finally {
    clearTimeout(timeoutId);
  }
}
