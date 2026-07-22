// Discovery provider for curated GitHub "awesome-*" lists. Fetches the
// README of each configured repo via the GitHub REST Contents API and
// parses its markdown bullet lists into candidate tools. See
// ./types.ts for the DiscoveryProvider contract this implements.

import { DiscoveryProvider, FetchResult, RawDiscoveryCandidate } from "./types.ts";

const GITHUB_API_BASE = "https://api.github.com";
const USER_AGENT = "GappsyBot/1.0 (+https://www.gappsy.com; Discovery Engine)";
const DEFAULT_REPOS = ["sindresorhus/awesome"];

// Matches a markdown link `[text](url)`, capturing an optional leading `!`
// so callers can detect (and skip) image syntax `![alt](url)`.
const LINK_RE = /(!)?\[([^[\]]+)\]\(([^()]+)\)/g;

// A bullet ("-", "*", "+") or numbered ("1.", "2)") list item line.
const LIST_ITEM_RE = /^\s*(?:[-*+]|\d+[.)])\s+/;

// A level 2-6 heading. Level 1 is treated as the document title, not a
// category, so it's intentionally excluded.
const HEADING_RE = /^\s{0,3}(#{2,6})\s+(.+?)\s*$/;

function cleanHeadingText(text: string): string {
  return text
    .replace(/^[\s#]+/, "")
    // Strip a leading emoji (and variation-selector/ZWJ noise) some
    // awesome-lists prefix their section headings with.
    .replace(/^[\p{Extended_Pictographic}\u{FE0F}\u{200D}\s]+/gu, "")
    .trim();
}

function isSkippableUrl(url: string, ownerRepoLower: string): boolean {
  // Anchors (#section), relative paths, and non-http(s) schemes (mailto:,
  // ftp:, etc) are never real project links.
  if (!/^https?:\/\//i.test(url)) return true;

  let parsed: URL;
  try {
    parsed = new URL(url);
  } catch {
    return true;
  }

  const host = parsed.hostname.toLowerCase().replace(/^www\./, "");

  if (host === "shields.io" || host.endsWith(".shields.io")) return true;
  if (host === "opencollective.com" || host.endsWith(".opencollective.com")) return true;
  if (host.includes("travis-ci")) return true;

  if (host === "github.com") {
    const path = parsed.pathname.toLowerCase().replace(/^\/+|\/+$/g, "");
    if (path.startsWith("sponsors")) return true;
    // Self-link back to the awesome-list repo itself (README anchors,
    // CONTRIBUTING.md, etc), not a distinct project.
    if (path === ownerRepoLower || path.startsWith(`${ownerRepoLower}/`)) return true;
    // GitHub Actions / CI badge or workflow links.
    if (path.includes("/actions")) return true;
    // A link to another awesome-list repo (e.g. from sindresorhus/awesome,
    // the meta-index of all awesome-lists) is a list of more curated lists,
    // never itself an individual tool a candidate should be created from.
    const repoSegment = path.split("/")[1] ?? "";
    if (/^awesome(?:[-_].+)?$/.test(repoSegment)) return true;
  }

  // Generic catch-all for badge images hosted elsewhere.
  if (/badge\.svg$/i.test(parsed.pathname)) return true;

  return false;
}

function normalizeUrl(url: string): string {
  return url.trim().toLowerCase().replace(/\/+$/, "");
}

function extractDescription(remainder: string): string | null {
  const match = remainder.match(/^\s*(?:-|—|:)\s+(.+)$/);
  if (!match) return null;
  const text = match[1].trim();
  return text.length > 0 ? text : null;
}

/**
 * Parses an awesome-list README's markdown into candidate tools. Pure and
 * side-effect-free so it's directly unit-testable without mocking fetch —
 * see githubAwesomeListsProvider.test.ts.
 *
 * Design notes:
 * - Only list-item lines are scanned; links in prose, headers, and
 *   table-of-contents entries are ignored.
 * - Per list item, the first link that survives the noise/self-link
 *   filters (see isSkippableUrl) is treated as the project link — this
 *   correctly skips a leading badge image and picks up the real link that
 *   follows it, while treating a single bullet as describing one project.
 * - Candidates are deduped within a single parse pass by normalized URL,
 *   keeping the first occurrence (awesome-lists sometimes cross-list the
 *   same project under multiple sections).
 */
export function parseAwesomeListMarkdown(markdown: string, sourceRepo: string): RawDiscoveryCandidate[] {
  const candidates: RawDiscoveryCandidate[] = [];
  const seen = new Set<string>();
  const ownerRepoLower = sourceRepo.trim().toLowerCase();
  const sourceUrl = `https://github.com/${sourceRepo}`;

  let currentCategory: string | null = null;

  const lines = markdown.split(/\r?\n/);

  for (const line of lines) {
    const headingMatch = line.match(HEADING_RE);
    if (headingMatch) {
      currentCategory = cleanHeadingText(headingMatch[2]);
      continue;
    }

    if (!LIST_ITEM_RE.test(line)) continue;

    const linkMatches = [...line.matchAll(LINK_RE)];
    if (linkMatches.length === 0) continue;

    let winner: RegExpMatchArray | null = null;
    for (const m of linkMatches) {
      if (m[1] === "!") continue; // image syntax, e.g. a badge
      const url = m[3].trim();
      if (isSkippableUrl(url, ownerRepoLower)) continue;
      winner = m;
      break;
    }
    if (!winner) continue;

    const name = winner[2].trim();
    const url = winner[3].trim();
    const normalized = normalizeUrl(url);
    if (seen.has(normalized)) continue;
    seen.add(normalized);

    const matchEnd = (winner.index ?? 0) + winner[0].length;
    const shortDescription = extractDescription(line.slice(matchEnd));

    candidates.push({
      name,
      official_website: url,
      short_description: shortDescription,
      source_url: sourceUrl,
      category_hint: currentCategory,
    });
  }

  return candidates;
}

async function fetchReadme(repo: string): Promise<{ markdown: string; rateLimitRemaining: number | null }> {
  const token = Deno.env.get("GITHUB_TOKEN");
  const headers: Record<string, string> = {
    "Accept": "application/vnd.github.raw+json",
    "User-Agent": USER_AGENT,
  };
  if (token) {
    headers["Authorization"] = `Bearer ${token}`;
  }

  const response = await fetch(`${GITHUB_API_BASE}/repos/${repo}/readme`, { headers });

  const rateLimitHeader = response.headers.get("X-RateLimit-Remaining");
  const parsedRateLimit = rateLimitHeader !== null ? Number.parseInt(rateLimitHeader, 10) : NaN;
  const rateLimitRemaining = Number.isFinite(parsedRateLimit) ? parsedRateLimit : null;

  if (!response.ok) {
    throw new Error(`GitHub API returned ${response.status}`);
  }

  const markdown = await response.text();
  return { markdown, rateLimitRemaining };
}

export const githubAwesomeListsProvider: DiscoveryProvider = {
  key: "github_awesome_lists",
  name: "GitHub Awesome Lists",
  description: "Parses curated 'awesome-*' GitHub README lists into candidate tools.",
  implemented: true,
  defaultPriority: 10,
  defaultRateLimitPerRun: 100,
  defaultScheduleFrequency: "daily",

  async fetchCandidates(config, _cursorIn, rateLimitPerRun): Promise<FetchResult> {
    const configuredRepos = Array.isArray(config?.repos)
      ? config.repos.filter((r): r is string => typeof r === "string" && r.trim().length > 0)
      : [];
    const repos = configuredRepos.length > 0 ? configuredRepos : DEFAULT_REPOS;

    const warnings: string[] = [];
    const allCandidates: RawDiscoveryCandidate[] = [];
    let lastRateLimitRemaining: number | null = null;
    let successCount = 0;

    for (const repo of repos) {
      try {
        const { markdown, rateLimitRemaining } = await fetchReadme(repo);
        lastRateLimitRemaining = rateLimitRemaining;
        successCount++;
        allCandidates.push(...parseAwesomeListMarkdown(markdown, repo));
      } catch (error) {
        const message = error instanceof Error ? error.message : String(error);
        warnings.push(`${repo}: ${message}`);
      }
    }

    if (successCount === 0) {
      throw new Error(
        `GitHub Awesome Lists provider failed: all ${repos.length} configured repo(s) could not be fetched (${warnings.join("; ")})`,
      );
    }

    return {
      candidates: allCandidates.slice(0, rateLimitPerRun),
      rate_limit_remaining: lastRateLimitRemaining,
      // This source has no natural pagination cursor: each run re-scans
      // the full README from scratch. That's safe/idempotent because
      // dedup against existing discovered_tools/tools happens downstream
      // in the shared ingest path — re-fetching just spends GitHub's rate
      // limit budget, which is acceptable for a daily-frequency source.
      cursor_out: null,
      warnings: warnings.length > 0 ? warnings : undefined,
    };
  },
};
