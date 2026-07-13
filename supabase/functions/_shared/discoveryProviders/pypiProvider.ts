// PyPI discovery provider — the public "Newest Packages" RSS feed
// (https://pypi.org/rss/packages.xml), NOT a search API. PyPI's old
// XML-RPC search was deprecated years ago and has no JSON replacement;
// PyPI's own docs (docs.pypi.org/api/feeds/) now explicitly recommend the
// RSS feeds for "periodically checking for new packages" — this is the
// technically appropriate, documented mechanism for this source, not a
// workaround. See ./types.ts for the DiscoveryProvider contract.
//
// The feed itself only ever returns the newest ~40 packages (no
// pagination), so cursor_out here is "the newest pubDate we've already
// processed," used to skip re-processing the same handful of entries
// every run — not a page offset. Each NEW entry needs one extra JSON
// call (pypi.org/pypi/<name>/json) to find a real external homepage, since
// the RSS <link> is only the PyPI project page — bounded to
// rateLimitPerRun calls per run.

import { DiscoveryProvider, FetchResult, RawDiscoveryCandidate } from "./types.ts";

const RSS_URL = "https://pypi.org/rss/packages.xml";
const USER_AGENT = "GappsyBot/1.0 (+https://www.gappsy.com; Discovery Engine)";

export interface PyPiRssItem {
  title: string;
  link: string;
  description: string | null;
  pubDate: string | null;
}

function decodeXmlEntities(text: string): string {
  return text
    .replace(/&lt;/g, "<").replace(/&gt;/g, ">").replace(/&quot;/g, '"')
    .replace(/&apos;/g, "'").replace(/&amp;/g, "&");
}

function extractTag(block: string, tag: string): string | null {
  const match = block.match(new RegExp(`<${tag}>([\\s\\S]*?)</${tag}>`, "i"));
  if (!match) return null;
  const raw = match[1].trim();
  const cdataMatch = raw.match(/^<!\[CDATA\[([\s\S]*?)\]\]>$/);
  return decodeXmlEntities((cdataMatch ? cdataMatch[1] : raw).trim());
}

/** Minimal, targeted RSS <item> parser for PyPI's simple, well-formed feed
 *  — same "regex over a trusted, simple, well-known format" approach this
 *  codebase already uses for awesome-list markdown (see
 *  githubAwesomeListsProvider.ts), rather than adding a general XML
 *  parsing dependency for one small feed. Exported for unit testing
 *  without any network call. */
export function parsePyPiRssFeed(xml: string): PyPiRssItem[] {
  const items: PyPiRssItem[] = [];
  const itemBlocks = xml.match(/<item>[\s\S]*?<\/item>/g) ?? [];
  for (const block of itemBlocks) {
    const title = extractTag(block, "title");
    const link = extractTag(block, "link");
    if (!title || !link) continue;
    items.push({
      title,
      link,
      description: extractTag(block, "description"),
      pubDate: extractTag(block, "pubDate"),
    });
  }
  return items;
}

// The "Newest Packages" feed's <title> is "package-name added to PyPI"
// (confirmed against the live feed — NOT "package-name version", which is
// the *Project Releases* feed's format, a different feed this provider
// does not use). Falls back to the raw title if the suffix isn't present,
// rather than mangling an unexpected format. Exported for unit testing.
const ADDED_TO_PYPI_SUFFIX = / added to PyPI$/i;
export function packageNameFromTitle(title: string): string {
  const trimmed = title.trim();
  return trimmed.replace(ADDED_TO_PYPI_SUFFIX, "").trim() || trimmed;
}

interface PyPiPackageInfo {
  info?: {
    home_page?: string | null;
    project_urls?: Record<string, string> | null;
    summary?: string | null;
  };
}

/** Picks the first genuinely external homepage from a PyPI package's JSON
 *  info, skipping links that just point back to pypi.org/github.com (same
 *  "must be a distinct product site" standard as the npm provider) or
 *  common non-homepage project_urls keys (issue trackers, docs-as-a-link
 *  that's actually pypi.org, etc — Homepage/Home/Website are checked
 *  first since those are the conventional keys). Exported for unit
 *  testing. */
export function pickHomepage(info: PyPiPackageInfo["info"]): string | null {
  if (!info) return null;
  const candidates: string[] = [];
  const urls = info.project_urls || {};
  for (const key of ["Homepage", "Home", "Website", "homepage"]) {
    if (urls[key]) candidates.push(urls[key]);
  }
  if (info.home_page) candidates.push(info.home_page);
  for (const key of Object.keys(urls)) {
    if (!["Homepage", "Home", "Website", "homepage"].includes(key)) candidates.push(urls[key]);
  }

  for (const raw of candidates) {
    const trimmed = raw?.trim();
    if (!trimmed) continue;
    let host: string;
    try {
      host = new URL(trimmed).hostname.toLowerCase().replace(/^www\./, "");
    } catch {
      continue;
    }
    if (host === "pypi.org" || host === "github.com" || host === "gitlab.com") continue;
    return trimmed;
  }
  return null;
}

async function fetchPackageInfo(name: string): Promise<PyPiPackageInfo | null> {
  try {
    const response = await fetch(`https://pypi.org/pypi/${encodeURIComponent(name)}/json`, { headers: { "User-Agent": USER_AGENT } });
    if (!response.ok) return null;
    return await response.json();
  } catch {
    return null;
  }
}

export const pypiProvider: DiscoveryProvider = {
  key: "pypi",
  name: "PyPI",
  description: "Scans PyPI's public 'Newest Packages' RSS feed for packages with a distinct external homepage.",
  implemented: true,
  defaultPriority: 30,
  defaultRateLimitPerRun: 30,
  defaultScheduleFrequency: "daily",

  async fetchCandidates(_config, cursorIn, rateLimitPerRun): Promise<FetchResult> {
    const response = await fetch(RSS_URL, { headers: { "User-Agent": USER_AGENT } });
    if (!response.ok) {
      throw new Error(`PyPI RSS feed request failed with status ${response.status}`);
    }
    const xml = await response.text();
    const items = parsePyPiRssFeed(xml);

    const cursorDate = cursorIn ? new Date(cursorIn) : null;
    const isNew = (item: PyPiRssItem) => {
      if (!cursorDate || Number.isNaN(cursorDate.getTime())) return true;
      if (!item.pubDate) return true; // can't tell -> treat as new rather than silently dropping
      const itemDate = new Date(item.pubDate);
      return Number.isNaN(itemDate.getTime()) || itemDate.getTime() > cursorDate.getTime();
    };
    const newItems = items.filter(isNew).slice(0, rateLimitPerRun);

    const candidates: RawDiscoveryCandidate[] = [];
    const warnings: string[] = [];
    let newestPubDate: string | null = cursorIn;

    for (const item of newItems) {
      if (item.pubDate && (!newestPubDate || new Date(item.pubDate).getTime() > new Date(newestPubDate).getTime())) {
        newestPubDate = item.pubDate;
      }
      const name = packageNameFromTitle(item.title);
      const info = await fetchPackageInfo(name);
      if (!info) {
        warnings.push(`${name}: could not fetch package info`);
        continue;
      }
      const homepage = pickHomepage(info.info);
      if (!homepage) continue; // no distinct homepage -> not a discovery candidate, not an error

      candidates.push({
        name,
        official_website: homepage,
        short_description: info.info?.summary?.trim() || item.description,
        source_url: item.link,
        raw: { title: item.title, pubDate: item.pubDate },
      });
    }

    return {
      candidates,
      cursor_out: newestPubDate,
      warnings: warnings.length > 0 ? warnings : undefined,
    };
  },
};
