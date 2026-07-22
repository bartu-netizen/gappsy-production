// GitHub Topics discovery provider — the public GitHub REST search API
// (GET /search/repositories?q=topic:X), the same auth pattern (optional
// GITHUB_TOKEN for a higher rate limit; works unauthenticated too, just
// at GitHub's lower anonymous rate limit) already used by
// githubAwesomeListsProvider.ts. See ./types.ts for the DiscoveryProvider
// contract.
//
// A repository IS its own official presence for most open-source tools —
// official_website prefers a repo's declared `homepage`, falling back to
// the repo page itself, matching the precedent githubAwesomeListsProvider
// already sets for github.com links.

import { DiscoveryProvider, FetchResult, RawDiscoveryCandidate } from "./types.ts";

const GITHUB_API_BASE = "https://api.github.com";
const USER_AGENT = "GappsyBot/1.0 (+https://www.gappsy.com; Discovery Engine)";
const DEFAULT_TOPICS = ["developer-tools", "self-hosted", "cli-app"];
const PAGE_SIZE = 20;
const MAX_PAGES_PER_RUN = 5;
// GitHub Search API hard caps any single query to 1000 results (max page
// 50 at 20/page) — beyond that the API itself errors, regardless of our
// own rateLimitPerRun/page-cap. Treated as "this topic is exhausted."
const GITHUB_SEARCH_MAX_PAGE = 50;

interface GitHubRepoItem {
  name?: string;
  full_name?: string;
  html_url?: string;
  description?: string | null;
  homepage?: string | null;
  topics?: string[] | null;
  owner?: { login?: string } | null;
}
interface GitHubSearchResponse {
  total_count?: number;
  items?: GitHubRepoItem[] | null;
  message?: string; // present on error responses (rate limit, validation)
}

/** Pure mapping of one repo search result to a candidate. Exported for
 *  unit testing without any network call. */
export function mapRepoToCandidate(repo: GitHubRepoItem): RawDiscoveryCandidate | null {
  const fullName = repo.full_name?.trim();
  const htmlUrl = repo.html_url?.trim();
  if (!fullName || !htmlUrl) return null;

  const homepage = repo.homepage?.trim();
  const officialWebsite = homepage && homepage.length > 0 ? homepage : htmlUrl;

  return {
    name: repo.name?.trim() || fullName,
    official_website: officialWebsite,
    short_description: repo.description?.trim() || null,
    source_url: htmlUrl,
    category_hint: repo.topics && repo.topics.length > 0 ? repo.topics[0] : null,
    tags_hint: repo.topics ?? undefined,
    raw: { full_name: fullName },
  };
}

// Compound cursor "topicIndex:page" — same rotation pattern as the other
// multi-query providers in this Discovery batch.
export function parseGithubTopicsCursor(cursor: string | null, topicCount: number): { topicIndex: number; page: number } {
  if (!cursor) return { topicIndex: 0, page: 1 };
  const match = cursor.match(/^(\d+):(\d+)$/);
  if (!match) return { topicIndex: 0, page: 1 };
  const topicIndex = Number(match[1]);
  const page = Number(match[2]);
  if (!Number.isFinite(topicIndex) || !Number.isFinite(page) || topicIndex < 0 || topicIndex >= topicCount || page < 1) {
    return { topicIndex: 0, page: 1 };
  }
  return { topicIndex, page };
}

export function formatGithubTopicsCursor(topicIndex: number, page: number): string {
  return `${topicIndex}:${page}`;
}

async function fetchPage(topic: string, page: number): Promise<{ body: GitHubSearchResponse; rateLimitRemaining: number | null }> {
  const token = Deno.env.get("GITHUB_TOKEN");
  const headers: Record<string, string> = { "Accept": "application/vnd.github+json", "User-Agent": USER_AGENT };
  if (token) headers["Authorization"] = `Bearer ${token}`;

  const url = `${GITHUB_API_BASE}/search/repositories?q=${encodeURIComponent(`topic:${topic}`)}&sort=stars&order=desc&per_page=${PAGE_SIZE}&page=${page}`;
  const response = await fetch(url, { headers });

  const rateLimitHeader = response.headers.get("X-RateLimit-Remaining");
  const parsed = rateLimitHeader !== null ? Number.parseInt(rateLimitHeader, 10) : NaN;
  const rateLimitRemaining = Number.isFinite(parsed) ? parsed : null;

  const body: GitHubSearchResponse = await response.json();
  if (!response.ok) {
    throw new Error(`GitHub search API failed with status ${response.status} for topic "${topic}"${body.message ? `: ${body.message}` : ""}`);
  }
  return { body, rateLimitRemaining };
}

export const githubTopicsProvider: DiscoveryProvider = {
  key: "github_topics",
  name: "GitHub Topics",
  description: "Searches GitHub repositories by topic (developer-tools, self-hosted, etc) via the public Search API.",
  implemented: true,
  defaultPriority: 30,
  defaultRateLimitPerRun: 60,
  defaultScheduleFrequency: "daily",

  async fetchCandidates(config, cursorIn, rateLimitPerRun): Promise<FetchResult> {
    const configuredTopics = Array.isArray(config?.topics)
      ? config.topics.filter((t): t is string => typeof t === "string" && t.trim().length > 0)
      : [];
    const topics = configuredTopics.length > 0 ? configuredTopics : DEFAULT_TOPICS;

    let { topicIndex, page } = parseGithubTopicsCursor(cursorIn, topics.length);
    const candidates: RawDiscoveryCandidate[] = [];
    const warnings: string[] = [];
    let pagesFetched = 0;
    let lastRateLimitRemaining: number | null = null;
    let wrappedAround = false;

    while (candidates.length < rateLimitPerRun && pagesFetched < MAX_PAGES_PER_RUN) {
      const topic = topics[topicIndex];
      let result: { body: GitHubSearchResponse; rateLimitRemaining: number | null };
      try {
        result = await fetchPage(topic, page);
      } catch (err) {
        warnings.push(err instanceof Error ? err.message : String(err));
        topicIndex = (topicIndex + 1) % topics.length;
        page = 1;
        pagesFetched += 1;
        if (topicIndex === 0) wrappedAround = true;
        continue;
      }
      pagesFetched += 1;
      if (result.rateLimitRemaining !== null) lastRateLimitRemaining = result.rateLimitRemaining;

      const items = result.body.items ?? [];
      for (const item of items) {
        const mapped = mapRepoToCandidate(item);
        if (mapped) candidates.push(mapped);
        if (candidates.length >= rateLimitPerRun) break;
      }

      const totalCount = result.body.total_count ?? items.length;
      const seenSoFar = page * PAGE_SIZE;
      if (items.length === 0 || seenSoFar >= totalCount || page >= GITHUB_SEARCH_MAX_PAGE) {
        topicIndex = (topicIndex + 1) % topics.length;
        page = 1;
        if (topicIndex === 0) wrappedAround = true;
      } else {
        page += 1;
      }
    }

    if (pagesFetched >= MAX_PAGES_PER_RUN && candidates.length < rateLimitPerRun) {
      warnings.push(`Stopped after ${MAX_PAGES_PER_RUN} pages (per-run page cap) before reaching rateLimitPerRun=${rateLimitPerRun}.`);
    }

    return {
      candidates,
      rate_limit_remaining: lastRateLimitRemaining,
      cursor_out: wrappedAround ? null : formatGithubTopicsCursor(topicIndex, page),
      warnings: warnings.length > 0 ? warnings : undefined,
    };
  },
};
