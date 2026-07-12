// Tests for the fields added to NormalizedExtraction: languages,
// screenshot_candidates, security_indicators, support_channels,
// api_documentation, and taxonomy.category_suggestions/tag_suggestions.
// normalizeCrawlResult is pure (no network) so it's fully unit-testable
// against literal Crawl4aiRawResponse fixtures.
import { assert, assertEquals } from "jsr:@std/assert@1";
import { normalizeCrawlResult, type Crawl4aiRawResponse } from "./crawlExtractionAdapter.ts";

function page(overrides: Record<string, unknown>) {
  return {
    url: "https://example.com/",
    html: "<html><body></body></html>",
    media: { images: [] },
    links: { internal: [], external: [] },
    metadata: { title: "Example", description: "An example tool" },
    status_code: 200,
    success: true,
    markdown: "",
    ...overrides,
  };
}

Deno.test("extracts languages from <html lang> across pages, deduped case-insensitively", () => {
  const raw: Crawl4aiRawResponse = {
    success: true,
    results: [
      page({ url: "https://example.com/", html: '<html lang="en"><body></body></html>' }),
      page({ url: "https://example.com/fr", html: '<html lang="FR"><body></body></html>' }),
      page({ url: "https://example.com/en2", html: '<html lang="en"><body></body></html>' }),
    ],
  };
  const result = normalizeCrawlResult(raw, { discoveryCandidateWebsite: "https://example.com" });
  const langs = result.product.languages.map((f) => f.value);
  assertEquals(langs.sort(), ["FR", "en"].sort());
});

Deno.test("classifies a screenshot-hinted image separately from a logo-hinted one", () => {
  const raw: Crawl4aiRawResponse = {
    success: true,
    results: [
      page({
        url: "https://example.com/",
        media: {
          images: [
            { src: "/img/logo.svg", alt: "Company logo" },
            { src: "/img/dashboard-screenshot.png", alt: "Product dashboard screenshot" },
            { src: "/img/random.png", alt: "" },
          ],
        },
      }),
    ],
  };
  const result = normalizeCrawlResult(raw, { discoveryCandidateWebsite: "https://example.com" });
  assertEquals(result.identity.logo_candidates.length, 1);
  assertEquals(result.assets.screenshot_candidates.length, 1);
  assert(result.assets.screenshot_candidates[0].value?.includes("dashboard-screenshot.png"));
  // The random untagged image should show up in the generic pool only.
  assertEquals(result.assets.image_candidates.length, 3);
});

Deno.test("extracts security_indicators from the classified security/trust page only", () => {
  const raw: Crawl4aiRawResponse = {
    success: true,
    results: [
      page({ url: "https://example.com/" }),
      page({ url: "https://example.com/security", markdown: "We are SOC 2 and GDPR compliant, with SSO available." }),
    ],
  };
  const result = normalizeCrawlResult(raw, { discoveryCandidateWebsite: "https://example.com" });
  const matched = result.product.security_indicators.map((f) => f.value);
  assert(matched.includes("soc 2"));
  assert(matched.includes("gdpr"));
  assert(matched.includes("sso"));
  for (const f of result.product.security_indicators) {
    assertEquals(f.source_url, "https://example.com/security");
  }
});

Deno.test("extracts support_channels from the FAQ/help page or homepage", () => {
  const raw: Crawl4aiRawResponse = {
    success: true,
    results: [
      page({ url: "https://example.com/faq", markdown: "Reach us via live chat or email support any time." }),
    ],
  };
  const result = normalizeCrawlResult(raw, { discoveryCandidateWebsite: "https://example.com" });
  const matched = result.product.support_channels.map((f) => f.value);
  assert(matched.includes("live chat"));
  assert(matched.includes("email support"));
});

Deno.test("api_documentation prefers a docs page whose URL/content references an API", () => {
  const raw: Crawl4aiRawResponse = {
    success: true,
    results: [
      page({ url: "https://example.com/" }),
      page({ url: "https://example.com/docs/api", markdown: "# API Reference\nFull REST API documentation." }),
    ],
  };
  const result = normalizeCrawlResult(raw, { discoveryCandidateWebsite: "https://example.com" });
  assertEquals(result.product.api_documentation.value, "https://example.com/docs/api");
  assert(result.product.api_documentation.confidence >= 70);
});

Deno.test("api_documentation is empty when no docs page and no api-shaped link exist", () => {
  const raw: Crawl4aiRawResponse = {
    success: true,
    results: [page({ url: "https://example.com/" })],
  };
  const result = normalizeCrawlResult(raw, { discoveryCandidateWebsite: "https://example.com" });
  assertEquals(result.product.api_documentation.value, null);
});

Deno.test("category/tag suggestions only include EXISTING taxonomy entries literally present in the crawled text", () => {
  const raw: Crawl4aiRawResponse = {
    success: true,
    results: [
      page({ url: "https://example.com/", metadata: { title: "Acme — Analytics for teams", description: "Real-time analytics and reporting." } }),
    ],
  };
  const result = normalizeCrawlResult(raw, {
    discoveryCandidateWebsite: "https://example.com",
    categories: [
      { id: "cat-analytics", name: "Analytics", slug: "analytics" },
      { id: "cat-crm", name: "CRM", slug: "crm" },
    ],
    tags: [
      { id: "tag-reporting", name: "Reporting", slug: "reporting" },
      { id: "tag-payments", name: "Payments", slug: "payments" },
    ],
  });
  const categoryIds = result.taxonomy.category_suggestions.map((f) => f.value);
  const tagIds = result.taxonomy.tag_suggestions.map((f) => f.value);
  assertEquals(categoryIds, ["cat-analytics"]);
  assertEquals(tagIds, ["tag-reporting"]);
});

Deno.test("taxonomy suggestions are empty (never fabricated) when no categories/tags are supplied", () => {
  const raw: Crawl4aiRawResponse = {
    success: true,
    results: [page({ url: "https://example.com/" })],
  };
  const result = normalizeCrawlResult(raw, { discoveryCandidateWebsite: "https://example.com" });
  assertEquals(result.taxonomy.category_suggestions, []);
  assertEquals(result.taxonomy.tag_suggestions, []);
});
