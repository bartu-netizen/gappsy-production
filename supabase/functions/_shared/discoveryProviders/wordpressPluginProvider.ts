// WordPress Plugin Directory discovery provider — the public
// api.wordpress.org/plugins/info/1.2 endpoint (query_plugins action), the
// same API wp-admin's own "Add Plugins" screen uses. Public, unauthenticated,
// documented at developer.wordpress.org/reference/functions/plugins_api/.
// See ./types.ts for the DiscoveryProvider contract.
//
// Like VS Code extensions, a WordPress plugin is already an end-user-facing
// tool by nature — many have no separate marketing site.
// official_website prefers the plugin's own declared homepage, falling
// back to its wordpress.org directory listing (its de facto product page)
// rather than being skipped.

import { DiscoveryProvider, FetchResult, RawDiscoveryCandidate } from "./types.ts";

const API_URL = "https://api.wordpress.org/plugins/info/1.2/";
const PER_PAGE = 20;
const MAX_PAGES_PER_RUN = 5;
// 'new' surfaces recently-added plugins — the natural "discovery" angle
// for this source, distinct from 'popular' (which would mostly resurface
// the same long-established plugins every run).
const BROWSE = "new";

interface WpPlugin {
  name?: string;
  slug?: string;
  homepage?: string | null;
  short_description?: string | null;
  tags?: Record<string, string> | null;
  author?: string | null;
}
interface WpPluginsResponse {
  plugins?: WpPlugin[] | null;
  info?: { page?: number; pages?: number; results?: number } | null;
}

function directoryListingUrl(slug: string): string {
  return `https://wordpress.org/plugins/${encodeURIComponent(slug)}/`;
}

/** Strips WordPress.org's HTML entities/tags from short_description
 *  (the API returns pre-rendered HTML, e.g. "&#8211;" and stray <p> tags)
 *  down to plain text suitable for short_description. Exported for unit
 *  testing without a network call. */
export function cleanWpDescription(html: string | null | undefined): string | null {
  if (!html) return null;
  const text = html
    .replace(/<[^>]+>/g, " ")
    .replace(/&#8211;|&ndash;/g, "-")
    .replace(/&#8217;|&rsquo;/g, "'")
    .replace(/&amp;/g, "&")
    .replace(/&quot;/g, '"')
    .replace(/\s+/g, " ")
    .trim();
  return text.length > 0 ? text : null;
}

/** Pure mapping of one plugin record to a candidate. Exported for unit
 *  testing without any network call. */
export function mapPluginToCandidate(plugin: WpPlugin): RawDiscoveryCandidate | null {
  const slug = plugin.slug?.trim();
  const name = plugin.name?.trim();
  if (!slug || !name) return null;

  const homepage = plugin.homepage?.trim();
  const officialWebsite = homepage && homepage.length > 0 ? homepage : directoryListingUrl(slug);
  const tagNames = plugin.tags ? Object.values(plugin.tags).filter((t): t is string => typeof t === "string" && t.length > 0) : [];

  return {
    name: cleanWpDescription(name) || name,
    official_website: officialWebsite,
    short_description: cleanWpDescription(plugin.short_description),
    source_url: directoryListingUrl(slug),
    category_hint: tagNames.length > 0 ? tagNames[0] : null,
    tags_hint: tagNames.length > 0 ? tagNames : undefined,
    raw: { slug, author: plugin.author },
  };
}

async function fetchPage(page: number): Promise<WpPluginsResponse> {
  const url = new URL(API_URL);
  url.searchParams.set("action", "query_plugins");
  url.searchParams.set("request[page]", String(page));
  url.searchParams.set("request[per_page]", String(PER_PAGE));
  url.searchParams.set("request[browse]", BROWSE);
  url.searchParams.set("request[fields][short_description]", "1");
  url.searchParams.set("request[fields][homepage]", "1");
  url.searchParams.set("request[fields][tags]", "1");

  const response = await fetch(url.toString(), { headers: { "User-Agent": "GappsyBot/1.0 (+https://www.gappsy.com; Discovery Engine)" } });
  if (!response.ok) {
    throw new Error(`WordPress Plugin Directory API request failed with status ${response.status}`);
  }
  return await response.json();
}

export const wordpressPluginProvider: DiscoveryProvider = {
  key: "wordpress_plugins",
  name: "WordPress Plugin Directory",
  description: "Scans the public WordPress.org Plugin Directory API for newly added plugins.",
  implemented: true,
  defaultPriority: 30,
  defaultRateLimitPerRun: 60,
  defaultScheduleFrequency: "daily",

  async fetchCandidates(_config, cursorIn, rateLimitPerRun): Promise<FetchResult> {
    let page = 1;
    if (cursorIn) {
      const parsed = Number(cursorIn);
      if (Number.isFinite(parsed) && parsed >= 1) page = parsed;
    }

    const candidates: RawDiscoveryCandidate[] = [];
    const warnings: string[] = [];
    let pagesFetched = 0;
    let totalPages: number | null = null;

    while (candidates.length < rateLimitPerRun && pagesFetched < MAX_PAGES_PER_RUN) {
      let response: WpPluginsResponse;
      try {
        response = await fetchPage(page);
      } catch (err) {
        warnings.push(err instanceof Error ? err.message : String(err));
        break; // a single-source, single-query provider — nothing to advance past on failure
      }
      pagesFetched += 1;
      totalPages = response.info?.pages ?? totalPages;

      const plugins = response.plugins ?? [];
      for (const plugin of plugins) {
        const mapped = mapPluginToCandidate(plugin);
        if (mapped) candidates.push(mapped);
        if (candidates.length >= rateLimitPerRun) break;
      }

      if (plugins.length === 0 || (totalPages !== null && page >= totalPages)) {
        page = 1; // exhausted the whole directory by "newest" order — wrap to a fresh start
        break;
      }
      page += 1;
    }

    if (pagesFetched >= MAX_PAGES_PER_RUN && candidates.length < rateLimitPerRun) {
      warnings.push(`Stopped after ${MAX_PAGES_PER_RUN} pages (per-run page cap) before reaching rateLimitPerRun=${rateLimitPerRun}.`);
    }

    return {
      candidates,
      cursor_out: String(page),
      warnings: warnings.length > 0 ? warnings : undefined,
    };
  },
};
