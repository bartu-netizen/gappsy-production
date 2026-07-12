// Product Hunt discovery provider — real, working GraphQL v2 client against
// https://api.producthunt.com/v2/api/graphql. This provider is registered in
// the DB with enabled: false because there is no PRODUCT_HUNT_API_TOKEN
// secret configured for this project yet; fetchCandidates() fails fast and
// clearly (ProviderConfigError) rather than fabricating candidates. Once a
// token is added as a Supabase Functions secret and the DB row is flipped to
// enabled: true, this code runs as-is. Document PRODUCT_HUNT_API_TOKEN in
// ENVIRONMENT_VARIABLES.md when it is actually added.

import { DiscoveryProvider, FetchResult, ProviderConfigError, RawDiscoveryCandidate } from "./types.ts";

const PRODUCT_HUNT_GRAPHQL_URL = "https://api.producthunt.com/v2/api/graphql";

// One fetchCandidates() invocation is bounded to at most this many GraphQL
// requests, regardless of rateLimitPerRun, so a single run can never hang on
// an unbounded pagination loop.
const MAX_PAGES_PER_RUN = 5;

const POSTS_PAGE_SIZE = 20;

// Product Hunt's public API v2 schema does not confirm a top-level
// `website` field on Post as of this writing — `url` (the Product Hunt post
// page) is the one field guaranteed to resolve. We request `website`
// defensively in case it exists on some API versions, but we do not assert
// it does; official_website falls back to the post `url` when absent. A
// later pipeline stage may need to follow a redirect from the PH post page
// to resolve the true external site.
const POSTS_QUERY = `
  query DiscoveryPosts($after: String, $first: Int!) {
    posts(order: NEWEST, after: $after, first: $first) {
      pageInfo {
        hasNextPage
        endCursor
      }
      edges {
        node {
          id
          name
          tagline
          description
          url
          website
          votesCount
          topics {
            edges {
              node {
                name
              }
            }
          }
          thumbnail {
            url
          }
        }
      }
    }
  }
`;

interface ProductHuntTopicEdge {
  node?: { name?: string | null } | null;
}

interface ProductHuntPostNode {
  id?: string | number | null;
  name?: string | null;
  tagline?: string | null;
  description?: string | null;
  url?: string | null;
  website?: string | null;
  votesCount?: number | null;
  topics?: { edges?: ProductHuntTopicEdge[] | null } | null;
  thumbnail?: { url?: string | null } | null;
}

interface ProductHuntPostsResponse {
  data?: {
    posts?: {
      pageInfo?: { hasNextPage?: boolean | null; endCursor?: string | null } | null;
      edges?: { node?: ProductHuntPostNode | null }[] | null;
    } | null;
  } | null;
  errors?: { message?: string }[] | null;
}

const SHORT_DESCRIPTION_MAX_LENGTH = 300;

/** Pure mapping of one GraphQL post node to a RawDiscoveryCandidate.
 *  Exported so the normalization logic can be unit-tested against literal
 *  fixtures without any network call or fetch-mocking. */
export function mapPostToCandidate(post: ProductHuntPostNode): RawDiscoveryCandidate {
  const topicNames = (post.topics?.edges ?? [])
    .map((edge) => edge?.node?.name)
    .filter((name): name is string => typeof name === "string" && name.length > 0);

  const tagline = post.tagline?.trim();
  const description = post.description?.trim();
  let shortDescription: string | null = tagline && tagline.length > 0 ? tagline : description && description.length > 0 ? description : null;
  if (shortDescription && shortDescription.length > SHORT_DESCRIPTION_MAX_LENGTH) {
    shortDescription = `${shortDescription.slice(0, SHORT_DESCRIPTION_MAX_LENGTH - 1)}…`;
  }

  const officialWebsite = post.website && post.website.trim().length > 0 ? post.website.trim() : post.url ?? "";

  return {
    name: post.name ?? "",
    official_website: officialWebsite,
    short_description: shortDescription,
    logo_url: post.thumbnail?.url ?? null,
    source_url: post.url ?? null,
    category_hint: topicNames.length > 0 ? topicNames[0] : null,
    tags_hint: topicNames,
    raw: post,
  };
}

async function fetchPostsPage(token: string, after: string | null): Promise<{ response: Response; body: ProductHuntPostsResponse }> {
  const response = await fetch(PRODUCT_HUNT_GRAPHQL_URL, {
    method: "POST",
    headers: {
      "Authorization": `Bearer ${token}`,
      "Content-Type": "application/json",
    },
    body: JSON.stringify({
      query: POSTS_QUERY,
      variables: { after, first: POSTS_PAGE_SIZE },
    }),
  });

  let body: ProductHuntPostsResponse;
  try {
    body = await response.json();
  } catch {
    throw new Error(`Product Hunt API returned a non-JSON response (status ${response.status})`);
  }

  if (!response.ok) {
    const firstError = body?.errors?.[0]?.message;
    throw new Error(`Product Hunt API request failed with status ${response.status}${firstError ? `: ${firstError}` : ""}`);
  }

  if (body.errors && body.errors.length > 0) {
    throw new Error(`Product Hunt API returned errors: ${body.errors[0]?.message ?? "unknown error"}`);
  }

  return { response, body };
}

// Product Hunt has historically exposed rate-limit info via response
// headers (e.g. X-Rate-Limit-Remaining) rather than a confirmed GraphQL
// extensions field. We only surface a number here if that header is
// actually present — never fabricate one.
function readRateLimitRemaining(response: Response): number | null {
  const header = response.headers.get("X-Rate-Limit-Remaining") ?? response.headers.get("x-rate-limit-remaining");
  if (!header) return null;
  const parsed = Number(header);
  return Number.isFinite(parsed) ? parsed : null;
}

export const productHuntProvider: DiscoveryProvider = {
  key: "product_hunt",
  name: "Product Hunt",
  description: "Fetches newly launched products from Product Hunt's public GraphQL API v2.",
  implemented: true,
  defaultPriority: 20,
  defaultRateLimitPerRun: 50,
  defaultScheduleFrequency: "daily",

  async fetchCandidates(_config: Record<string, unknown>, cursorIn: string | null, rateLimitPerRun: number): Promise<FetchResult> {
    const token = Deno.env.get("PRODUCT_HUNT_API_TOKEN");
    if (!token || token.trim().length === 0) {
      throw new ProviderConfigError("product_hunt", "PRODUCT_HUNT_API_TOKEN is not configured");
    }

    const candidates: RawDiscoveryCandidate[] = [];
    const warnings: string[] = [];
    let cursor: string | null = cursorIn;
    let rateLimitRemaining: number | null = null;
    let pagesFetched = 0;

    while (candidates.length < rateLimitPerRun && pagesFetched < MAX_PAGES_PER_RUN) {
      const { response, body } = await fetchPostsPage(token, cursor);
      pagesFetched += 1;

      const remaining = readRateLimitRemaining(response);
      if (remaining !== null) {
        rateLimitRemaining = remaining;
      }

      const posts = body.data?.posts;
      const edges = posts?.edges ?? [];
      for (const edge of edges) {
        if (!edge?.node) continue;
        candidates.push(mapPostToCandidate(edge.node));
        if (candidates.length >= rateLimitPerRun) break;
      }

      const pageInfo = posts?.pageInfo;
      cursor = pageInfo?.endCursor ?? cursor;
      if (!pageInfo?.hasNextPage) {
        break;
      }
    }

    if (pagesFetched >= MAX_PAGES_PER_RUN && candidates.length < rateLimitPerRun) {
      warnings.push(`Stopped after ${MAX_PAGES_PER_RUN} pages (per-run page cap) before reaching rateLimitPerRun=${rateLimitPerRun}.`);
    }

    return {
      candidates,
      rate_limit_remaining: rateLimitRemaining,
      cursor_out: cursor,
      warnings: warnings.length > 0 ? warnings : undefined,
    };
  },
};
