// SaaSHub discovery provider — saashub.com is a plain, server-rendered
// (no JS rendering required) software directory organized into ~150
// category pages ("/best-x-software"), each listing real commercial/
// freemium SaaS products with their own outbound website link. Verified
// directly (2026-07-23) before building this: robots.txt has no general
// disallow rule, their Terms of Service has no anti-scraping clause, and
// their product data is explicitly licensed under Creative Commons
// BY-SA 4.0 (an affirmative invitation to reuse, not just an absence of
// prohibition) — this is what "pending a ToS review" in registry.ts's
// SCRAPER_STUB_REASON was waiting on.
//
// Deliberately the strongest current fit for the standing "no open-source"
// business rule (see feedback memory): SaaSHub is purpose-built around
// commercial/freemium SaaS tools, unlike npm/PyPI/GitHub which are
// developer package ecosystems.
//
// No public API, so this fetches plain HTML and parses it with simple,
// verified-stable regexes (no crawler-gateway/headless rendering needed —
// the content is already in the raw response). See ./types.ts for the
// DiscoveryProvider contract.

import { DiscoveryProvider, FetchResult, RawDiscoveryCandidate } from "./types.ts";

const USER_AGENT = "GappsyBot/1.0 (+https://www.gappsy.com; Discovery Engine)";
const CATEGORIES_URL = "https://www.saashub.com/categories";
const MAX_CATEGORIES_PER_RUN = 8;

const CATEGORY_LINK_RE = /href="(\/best-[a-z0-9-]+)"/g;
const PRODUCT_BLOCK_SPLIT = '<div class="flex-1">';
const NAME_RE = /itemprop="name">([^<]+)<\/span>/;
const WEBSITE_RE = /href="([^"]+)" title="Visit Website"[^>]*data-service-slug="([^"]+)"/;
const DESCRIPTION_RE = /itemprop="description">([^<]*)<\/p>/;

function decodeHtmlEntities(text: string): string {
  return text
    .replace(/&#39;|&rsquo;/g, "'")
    .replace(/&amp;/g, "&")
    .replace(/&quot;/g, '"')
    .replace(/&#8211;|&ndash;/g, "-")
    .replace(/\s+/g, " ")
    .trim();
}

async function fetchHtml(url: string): Promise<string> {
  const response = await fetch(url, { headers: { "User-Agent": USER_AGENT } });
  if (!response.ok) throw new Error(`SaaSHub request to ${url} failed with status ${response.status}`);
  return await response.text();
}

/** Pure parsing of one category page's HTML into candidates. Exported for
 *  unit testing without a network call. */
export function parseCategoryPage(html: string, categoryHint: string): RawDiscoveryCandidate[] {
  const chunks = html.split(PRODUCT_BLOCK_SPLIT).slice(1);
  const candidates: RawDiscoveryCandidate[] = [];
  const seenSlugs = new Set<string>();

  for (const chunk of chunks) {
    const nameMatch = NAME_RE.exec(chunk);
    const websiteMatch = WEBSITE_RE.exec(chunk);
    if (!nameMatch || !websiteMatch) continue;

    const [, websiteUrl, slug] = websiteMatch;
    if (seenSlugs.has(slug)) continue;
    seenSlugs.add(slug);

    const descMatch = DESCRIPTION_RE.exec(chunk);
    candidates.push({
      name: decodeHtmlEntities(nameMatch[1]),
      official_website: websiteUrl,
      short_description: descMatch ? decodeHtmlEntities(descMatch[1]) : null,
      source_url: `https://www.saashub.com/${slug}-alternatives`,
      category_hint: categoryHint,
      raw: { slug },
    });
  }
  return candidates;
}

/** Extracts every /best-x-software category URL from the categories page.
 *  Exported for unit testing without a network call. */
export function parseCategoryList(html: string): string[] {
  const urls = new Set<string>();
  let match: RegExpExecArray | null;
  CATEGORY_LINK_RE.lastIndex = 0;
  while ((match = CATEGORY_LINK_RE.exec(html)) !== null) urls.add(match[1]);
  return [...urls].sort();
}

function categoryHintFromPath(path: string): string {
  // "/best-project-management-software" -> "Project Management"
  return path
    .replace(/^\/best-/, "")
    .replace(/-software$/, "")
    .split("-")
    .map((w) => w.charAt(0).toUpperCase() + w.slice(1))
    .join(" ");
}

export const saashubProvider: DiscoveryProvider = {
  key: "saashub",
  name: "SaaSHub",
  description: "Scans SaaSHub's category pages for real, commercial/freemium SaaS products (CC BY-SA 4.0 licensed data).",
  implemented: true,
  defaultPriority: 25,
  defaultRateLimitPerRun: 60,
  defaultScheduleFrequency: "daily",

  async fetchCandidates(_config, cursorIn, rateLimitPerRun): Promise<FetchResult> {
    const warnings: string[] = [];
    let categoryPaths: string[];
    try {
      categoryPaths = parseCategoryList(await fetchHtml(CATEGORIES_URL));
    } catch (err) {
      throw new Error(`Failed to fetch SaaSHub category list: ${err instanceof Error ? err.message : String(err)}`);
    }
    if (categoryPaths.length === 0) throw new Error("SaaSHub categories page returned no category links — page structure may have changed.");

    let startIndex = 0;
    if (cursorIn) {
      const parsed = Number(cursorIn);
      if (Number.isFinite(parsed) && parsed >= 0 && parsed < categoryPaths.length) startIndex = parsed;
    }

    const candidates: RawDiscoveryCandidate[] = [];
    let index = startIndex;
    let categoriesChecked = 0;

    while (candidates.length < rateLimitPerRun && categoriesChecked < MAX_CATEGORIES_PER_RUN) {
      const path = categoryPaths[index];
      try {
        const html = await fetchHtml(`https://www.saashub.com${path}`);
        const found = parseCategoryPage(html, categoryHintFromPath(path));
        for (const c of found) {
          candidates.push(c);
          if (candidates.length >= rateLimitPerRun) break;
        }
      } catch (err) {
        warnings.push(err instanceof Error ? err.message : String(err));
      }
      categoriesChecked += 1;
      index = (index + 1) % categoryPaths.length;
    }

    return {
      candidates,
      cursor_out: String(index),
      warnings: warnings.length > 0 ? warnings : undefined,
    };
  },
};
