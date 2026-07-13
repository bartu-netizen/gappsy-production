// npm registry discovery provider — public, unauthenticated search API
// (https://registry.npmjs.org/-/v1/search). No official developer signup
// or token needed; this is the exact endpoint the `npm search` CLI itself
// uses. See ./types.ts for the DiscoveryProvider contract.
//
// Scope: npm is a package registry, not a tool directory — most packages
// are libraries with no product website of their own. Only packages that
// declare a real `homepage` link distinct from their npm/GitHub page
// qualify as a discovery candidate; the rest are silently skipped (not
// rejected as an error — a library with no homepage is simply not a
// candidate). We never fabricate an official_website from the npm or repo
// URL.

import { DiscoveryProvider, FetchResult, RawDiscoveryCandidate } from "./types.ts";

const NPM_SEARCH_URL = "https://registry.npmjs.org/-/v1/search";
const DEFAULT_QUERIES = ["cli tool", "developer tool", "self-hosted"];
const PAGE_SIZE = 20;
// Bounded regardless of rateLimitPerRun, same pattern as Product Hunt —
// one fetchCandidates() call can never hang on an unbounded page loop.
const MAX_PAGES_PER_RUN = 5;

interface NpmPackageLinks {
  npm?: string;
  homepage?: string;
  repository?: string;
  bugs?: string;
}
interface NpmPackage {
  name?: string;
  description?: string | null;
  keywords?: string[];
  links?: NpmPackageLinks;
  publisher?: { username?: string } | null;
}
interface NpmSearchObject {
  package?: NpmPackage;
}
interface NpmSearchResponse {
  objects?: NpmSearchObject[];
  total?: number;
}

// Compound cursor "queryIndex:offset" so pagination can advance through
// MULTIPLE configured search queries in sequence rather than needing one
// provider registration per query. Malformed/foreign cursor values fall
// back to the start rather than throwing — a corrupt or stale cursor must
// never hard-fail a scheduled run.
export function parseNpmCursor(cursor: string | null, queryCount: number): { queryIndex: number; offset: number } {
  if (!cursor) return { queryIndex: 0, offset: 0 };
  const match = cursor.match(/^(\d+):(\d+)$/);
  if (!match) return { queryIndex: 0, offset: 0 };
  const queryIndex = Number(match[1]);
  const offset = Number(match[2]);
  if (!Number.isFinite(queryIndex) || !Number.isFinite(offset) || queryIndex < 0 || queryIndex >= queryCount) {
    return { queryIndex: 0, offset: 0 };
  }
  return { queryIndex, offset };
}

export function formatNpmCursor(queryIndex: number, offset: number): string {
  return `${queryIndex}:${offset}`;
}

/** Pure mapping of one npm search result to a candidate, or null if it
 *  doesn't qualify (no distinct homepage). Exported for unit testing
 *  without any network call. */
export function mapPackageToCandidate(pkg: NpmPackage): RawDiscoveryCandidate | null {
  const homepage = pkg.links?.homepage?.trim();
  if (!homepage) return null;
  // A homepage that just points back to the npm listing or the repo host
  // isn't a distinct product website — skip rather than mis-record it.
  let homepageHost: string;
  try {
    homepageHost = new URL(homepage).hostname.toLowerCase().replace(/^www\./, "");
  } catch {
    return null;
  }
  if (homepageHost === "npmjs.com" || homepageHost === "github.com" || homepageHost === "gitlab.com") return null;

  const name = pkg.name?.trim();
  if (!name) return null;

  return {
    name,
    official_website: homepage,
    short_description: pkg.description?.trim() || null,
    source_url: pkg.links?.npm ?? `https://www.npmjs.com/package/${encodeURIComponent(name)}`,
    category_hint: pkg.keywords && pkg.keywords.length > 0 ? pkg.keywords[0] : null,
    tags_hint: pkg.keywords,
    raw: pkg,
  };
}

async function fetchSearchPage(query: string, from: number, size: number): Promise<NpmSearchResponse> {
  const url = `${NPM_SEARCH_URL}?text=${encodeURIComponent(query)}&size=${size}&from=${from}`;
  const response = await fetch(url, { headers: { "User-Agent": "GappsyBot/1.0 (+https://www.gappsy.com; Discovery Engine)" } });
  if (!response.ok) {
    throw new Error(`npm registry search failed with status ${response.status} for query "${query}"`);
  }
  return await response.json();
}

export const npmRegistryProvider: DiscoveryProvider = {
  key: "npm_registry",
  name: "npm Registry",
  description: "Searches the public npm registry for packages with a distinct product homepage (CLI tools, dev tools, self-hosted software).",
  implemented: true,
  defaultPriority: 30,
  defaultRateLimitPerRun: 60,
  defaultScheduleFrequency: "daily",

  async fetchCandidates(config, cursorIn, rateLimitPerRun): Promise<FetchResult> {
    const queries = Array.isArray(config?.queries)
      ? config.queries.filter((q): q is string => typeof q === "string" && q.trim().length > 0)
      : [];
    const activeQueries = queries.length > 0 ? queries : DEFAULT_QUERIES;

    let { queryIndex, offset } = parseNpmCursor(cursorIn, activeQueries.length);
    const candidates: RawDiscoveryCandidate[] = [];
    const warnings: string[] = [];
    let pagesFetched = 0;
    let exhaustedAllQueries = false;

    while (candidates.length < rateLimitPerRun && pagesFetched < MAX_PAGES_PER_RUN) {
      const query = activeQueries[queryIndex];
      let page: NpmSearchResponse;
      try {
        page = await fetchSearchPage(query, offset, PAGE_SIZE);
      } catch (err) {
        warnings.push(err instanceof Error ? err.message : String(err));
        // One query failing doesn't stop the run — advance past it.
        queryIndex = (queryIndex + 1) % activeQueries.length;
        offset = 0;
        pagesFetched += 1;
        if (queryIndex === 0) exhaustedAllQueries = true;
        continue;
      }
      pagesFetched += 1;

      const objects = page.objects ?? [];
      for (const obj of objects) {
        if (!obj.package) continue;
        const mapped = mapPackageToCandidate(obj.package);
        if (mapped) candidates.push(mapped);
        if (candidates.length >= rateLimitPerRun) break;
      }

      const total = page.total ?? objects.length;
      offset += objects.length;
      if (objects.length === 0 || offset >= total) {
        // This query is exhausted — move to the next configured query.
        queryIndex = (queryIndex + 1) % activeQueries.length;
        offset = 0;
        if (queryIndex === 0) exhaustedAllQueries = true; // wrapped around to the first query again
      }
    }

    if (pagesFetched >= MAX_PAGES_PER_RUN && candidates.length < rateLimitPerRun) {
      warnings.push(`Stopped after ${MAX_PAGES_PER_RUN} pages (per-run page cap) before reaching rateLimitPerRun=${rateLimitPerRun}.`);
    }

    return {
      candidates,
      // Wrapping around every configured query resets to a fresh start
      // (null) rather than growing an ever-cycling cursor forever —
      // bounded, and periodically re-checks earlier queries for new
      // packages too.
      cursor_out: exhaustedAllQueries ? null : formatNpmCursor(queryIndex, offset),
      warnings: warnings.length > 0 ? warnings : undefined,
    };
  },
};
