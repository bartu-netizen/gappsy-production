// VS Code Marketplace discovery provider — the public Extension Gallery
// Query API (POST marketplace.visualstudio.com/_apis/public/gallery/
// extensionquery). This is the same unauthenticated endpoint the VS Code
// editor itself uses to power its in-app extension search; no API key or
// publisher account needed for read-only queries. See ./types.ts for the
// DiscoveryProvider contract.
//
// Unlike npm/PyPI (overwhelmingly libraries, so a real external homepage
// is required to filter signal from noise), a VS Code extension IS
// already an end-user-facing tool by nature — many legitimate extensions
// have no separate website at all. official_website therefore prefers a
// genuine external link found in the extension's own metadata, falling
// back to the extension's own marketplace listing page (its de facto
// product page) rather than being skipped.

import { DiscoveryProvider, FetchResult, RawDiscoveryCandidate } from "./types.ts";

const QUERY_URL = "https://marketplace.visualstudio.com/_apis/public/gallery/extensionquery";
const DEFAULT_CATEGORIES = ["Other", "Snippets", "Linters", "Formatters", "Debuggers"];
const PAGE_SIZE = 20;
const MAX_PAGES_PER_RUN = 5;

// Well-known public flag combination (documented across VS Code Marketplace
// API clients/tooling) requesting versions + category/tag metadata +
// short description + statistics for each result.
const QUERY_FLAGS = 914;
// filterType 5 = Category, 8 = Target (VS Code), 10 = SearchText.
const FILTER_TYPE_CATEGORY = 5;
const FILTER_TYPE_TARGET = 8;

interface VsceProperty { key?: string; value?: string }
interface VsceVersion { properties?: VsceProperty[] | null }
interface VscePublisher { publisherName?: string; displayName?: string }
interface VsceExtension {
  extensionName?: string;
  displayName?: string;
  shortDescription?: string | null;
  publisher?: VscePublisher | null;
  versions?: VsceVersion[] | null;
  tags?: string[] | null;
  categories?: string[] | null;
}
interface VsceResultMetadataItem { name?: string; count?: number }
interface VsceResultMetadata { metadataType?: string; metadataItems?: VsceResultMetadataItem[] | null }
interface VsceResult { extensions?: VsceExtension[] | null; resultMetadata?: VsceResultMetadata[] | null }
interface VsceResponse { results?: VsceResult[] | null }

const HOMEPAGE_PROPERTY_KEYS = [
  "Microsoft.VisualStudio.Services.Links.Homepage",
  "Microsoft.VisualStudio.Services.Links.Learn",
  "Microsoft.VisualStudio.Services.Links.Getstarted",
];

function marketplaceItemUrl(publisherName: string, extensionName: string): string {
  return `https://marketplace.visualstudio.com/items?itemName=${encodeURIComponent(publisherName)}.${encodeURIComponent(extensionName)}`;
}

/** Pure mapping of one Marketplace extension node to a candidate.
 *  Exported for unit testing without any network call. */
export function mapExtensionToCandidate(ext: VsceExtension): RawDiscoveryCandidate | null {
  const publisherName = ext.publisher?.publisherName?.trim();
  const extensionName = ext.extensionName?.trim();
  if (!publisherName || !extensionName) return null;

  const properties = ext.versions?.[0]?.properties ?? [];
  let homepage: string | null = null;
  for (const key of HOMEPAGE_PROPERTY_KEYS) {
    const found = properties.find((p) => p.key === key)?.value?.trim();
    if (found) { homepage = found; break; }
  }

  return {
    name: ext.displayName?.trim() || extensionName,
    official_website: homepage || marketplaceItemUrl(publisherName, extensionName),
    short_description: ext.shortDescription?.trim() || null,
    source_url: marketplaceItemUrl(publisherName, extensionName),
    category_hint: ext.categories && ext.categories.length > 0 ? ext.categories[0] : null,
    tags_hint: ext.tags ?? undefined,
    raw: { publisherName, extensionName },
  };
}

async function fetchPage(category: string, pageNumber: number): Promise<VsceResponse> {
  const response = await fetch(QUERY_URL, {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
      "Accept": "application/json;api-version=3.0-preview.1",
      "User-Agent": "GappsyBot/1.0 (+https://www.gappsy.com; Discovery Engine)",
    },
    body: JSON.stringify({
      filters: [{
        criteria: [
          { filterType: FILTER_TYPE_TARGET, value: "Microsoft.VisualStudio.Code" },
          { filterType: FILTER_TYPE_CATEGORY, value: category },
        ],
        pageNumber,
        pageSize: PAGE_SIZE,
        sortBy: 4, // InstallCount — surfaces established, real tools over noise
        sortOrder: 0,
      }],
      flags: QUERY_FLAGS,
    }),
  });
  if (!response.ok) {
    throw new Error(`VS Code Marketplace query failed with status ${response.status} for category "${category}"`);
  }
  return await response.json();
}

// Compound cursor "categoryIndex:pageNumber", same rotation pattern as
// npmRegistryProvider — pagination advances through multiple configured
// categories in sequence, wrapping to a fresh start once all are
// exhausted rather than growing unbounded.
export function parseVscodeCursor(cursor: string | null, categoryCount: number): { categoryIndex: number; pageNumber: number } {
  if (!cursor) return { categoryIndex: 0, pageNumber: 1 };
  const match = cursor.match(/^(\d+):(\d+)$/);
  if (!match) return { categoryIndex: 0, pageNumber: 1 };
  const categoryIndex = Number(match[1]);
  const pageNumber = Number(match[2]);
  if (!Number.isFinite(categoryIndex) || !Number.isFinite(pageNumber) || categoryIndex < 0 || categoryIndex >= categoryCount || pageNumber < 1) {
    return { categoryIndex: 0, pageNumber: 1 };
  }
  return { categoryIndex, pageNumber };
}

export function formatVscodeCursor(categoryIndex: number, pageNumber: number): string {
  return `${categoryIndex}:${pageNumber}`;
}

export const vscodeMarketplaceProvider: DiscoveryProvider = {
  key: "vscode_marketplace",
  name: "VS Code Marketplace",
  description: "Searches the public VS Code Extension Gallery Query API by category.",
  implemented: true,
  defaultPriority: 30,
  defaultRateLimitPerRun: 60,
  defaultScheduleFrequency: "daily",

  async fetchCandidates(config, cursorIn, rateLimitPerRun): Promise<FetchResult> {
    const configuredCategories = Array.isArray(config?.categories)
      ? config.categories.filter((c): c is string => typeof c === "string" && c.trim().length > 0)
      : [];
    const categories = configuredCategories.length > 0 ? configuredCategories : DEFAULT_CATEGORIES;

    let { categoryIndex, pageNumber } = parseVscodeCursor(cursorIn, categories.length);
    const candidates: RawDiscoveryCandidate[] = [];
    const warnings: string[] = [];
    let pagesFetched = 0;
    let wrappedAround = false;

    while (candidates.length < rateLimitPerRun && pagesFetched < MAX_PAGES_PER_RUN) {
      const category = categories[categoryIndex];
      let response: VsceResponse;
      try {
        response = await fetchPage(category, pageNumber);
      } catch (err) {
        warnings.push(err instanceof Error ? err.message : String(err));
        categoryIndex = (categoryIndex + 1) % categories.length;
        pageNumber = 1;
        pagesFetched += 1;
        if (categoryIndex === 0) wrappedAround = true;
        continue;
      }
      pagesFetched += 1;

      const result = response.results?.[0];
      const extensions = result?.extensions ?? [];
      for (const ext of extensions) {
        const mapped = mapExtensionToCandidate(ext);
        if (mapped) candidates.push(mapped);
        if (candidates.length >= rateLimitPerRun) break;
      }

      const totalCount = result?.resultMetadata
        ?.find((m) => m.metadataType === "ResultCount")
        ?.metadataItems?.find((i) => i.name === "TotalCount")?.count ?? extensions.length;
      const seenSoFar = (pageNumber) * PAGE_SIZE;
      if (extensions.length === 0 || seenSoFar >= totalCount) {
        categoryIndex = (categoryIndex + 1) % categories.length;
        pageNumber = 1;
        if (categoryIndex === 0) wrappedAround = true;
      } else {
        pageNumber += 1;
      }
    }

    if (pagesFetched >= MAX_PAGES_PER_RUN && candidates.length < rateLimitPerRun) {
      warnings.push(`Stopped after ${MAX_PAGES_PER_RUN} pages (per-run page cap) before reaching rateLimitPerRun=${rateLimitPerRun}.`);
    }

    return {
      candidates,
      cursor_out: wrappedAround ? null : formatVscodeCursor(categoryIndex, pageNumber),
      warnings: warnings.length > 0 ? warnings : undefined,
    };
  },
};
