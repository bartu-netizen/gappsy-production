// Tests for the fields added to NormalizedExtraction: languages,
// screenshot_candidates, security_indicators, support_channels,
// api_documentation, and taxonomy.category_suggestions/tag_suggestions.
// normalizeCrawlResult is pure (no network) so it's fully unit-testable
// against literal Crawl4aiRawResponse fixtures.
import { assert, assertEquals } from "jsr:@std/assert@1";
import {
  analyzePricingBlocks,
  classifyPricingModel,
  computeStartingPrice,
  looksLikePlanName,
  normalizeCrawlResult,
  type Crawl4aiRawResponse,
} from "./crawlExtractionAdapter.ts";

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

Deno.test("extracts use_case_candidates from a dedicated customers/use-cases/solutions page, never fabricated when none was crawled", () => {
  const raw: Crawl4aiRawResponse = {
    success: true,
    results: [
      page({ url: "https://example.com/" }),
      page({
        url: "https://example.com/customers",
        markdown: "# Customer Stories\n## Scaling checkout for e-commerce teams\nSome customer\n## Automating support workflows\nAnother customer",
      }),
    ],
  };
  const result = normalizeCrawlResult(raw, { discoveryCandidateWebsite: "https://example.com" });
  const values = result.product.use_case_candidates.map((f) => f.value);
  assert(values.includes("Scaling checkout for e-commerce teams"));
  assert(values.includes("Automating support workflows"));
  for (const f of result.product.use_case_candidates) assertEquals(f.source_url, "https://example.com/customers");

  const noUseCasePage: Crawl4aiRawResponse = { success: true, results: [page({ url: "https://example.com/" })] };
  const resultEmpty = normalizeCrawlResult(noUseCasePage, { discoveryCandidateWebsite: "https://example.com" });
  assertEquals(resultEmpty.product.use_case_candidates, []);
});

Deno.test("extracts platform_indicators as whole-word matches, not substrings of unrelated words", () => {
  const raw: Crawl4aiRawResponse = {
    success: true,
    results: [
      page({ url: "https://example.com/", markdown: "Available on iOS and Android, with a CLI for power users. Also ships as a Docker image." }),
    ],
  };
  const result = normalizeCrawlResult(raw, { discoveryCandidateWebsite: "https://example.com" });
  const values = result.product.platform_indicators.map((f) => f.value);
  assert(values.includes("iOS"));
  assert(values.includes("Android"));
  assert(values.includes("CLI"));
  assert(values.includes("Docker"));
  // "declining"/"capitalize" must never match "CLI"/"API" as substrings.
  assert(!values.includes("API"));
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

// ---------------------------------------------------------------------------
// Pricing extraction — looksLikePlanName / analyzePricingBlocks /
// classifyPricingModel / computeStartingPrice, plus the full pipeline
// through normalizeCrawlResult. The Trunk.io fixture below reproduces the
// real contamination found in production (pricing.plan_candidates included
// "SOC 2 Compliance", "Corporate Security", "Customer Stories" alongside
// the real $0/$18 tiers) to prove it's actually fixed, not just plausible.
// ---------------------------------------------------------------------------

Deno.test("looksLikePlanName: accepts short plan-shaped headings, rejects page furniture", () => {
  assert(looksLikePlanName("Starter"));
  assert(looksLikePlanName("Pro"));
  assert(looksLikePlanName("Enterprise"));
  assert(looksLikePlanName("Team Plan"));
  assert(!looksLikePlanName("SOC 2 Compliance"));
  assert(!looksLikePlanName("Customer Stories"));
  assert(!looksLikePlanName("Frequently Asked Questions"));
  assert(!looksLikePlanName("What happens when CI actually works?"));
  assert(!looksLikePlanName(""));
  assert(!looksLikePlanName("This is a very long heading that is definitely not a plan name at all"));
});

Deno.test("analyzePricingBlocks: pairs a plan heading with the price found in its own body", () => {
  const md = [
    "## Starter",
    "$10 /mo",
    "For small teams getting started.",
    "",
    "## Pro",
    "$25 /mo",
    "For growing teams.",
    "",
    "## Enterprise",
    "Contact us for a custom quote.",
  ].join("\n");
  const entries = analyzePricingBlocks(md);
  assertEquals(entries.map((e) => [e.name, e.price]), [
    ["Starter", "$10 /mo"],
    ["Pro", "$25 /mo"],
    ["Enterprise", "Custom pricing"],
  ]);
});

Deno.test("analyzePricingBlocks: drops a plan-shaped heading with no nearby price, and unrelated page headings entirely (Trunk.io contamination fixture)", () => {
  // Reproduces the real production shape: pricing page markdown that mixes
  // genuine plan cards with unrelated security/social-proof/FAQ sections.
  const md = [
    "## Plans for every stage of your company",
    "",
    "## Free",
    "$0",
    "Get started for free.",
    "",
    "## Team",
    "$18 /mo per seat",
    "For teams that ship fast.",
    "",
    "## Security Overview",
    "",
    "## SOC 2 Compliance",
    "We are independently audited.",
    "",
    "## Infrastructure and Data Security",
    "",
    "## Corporate Security",
    "",
    "## Application and Development Security",
    "",
    "## Customer Stories",
    "See what our customers say.",
    "",
    "## FAQs",
    "Common questions answered.",
  ].join("\n");
  const entries = analyzePricingBlocks(md);
  const names = entries.map((e) => e.name);
  assertEquals(names, ["Free", "Team"]);
  assert(!names.includes("Security Overview"));
  assert(!names.includes("SOC 2 Compliance"));
  assert(!names.includes("Corporate Security"));
  assert(!names.includes("Customer Stories"));
  assert(!names.includes("FAQs"));
  // "Plans for every stage of your company" is plan-shaped-length-wise but
  // has no price in its body and is correctly dropped, not guessed at.
  assert(!names.includes("Plans for every stage of your company"));
});

Deno.test("analyzePricingBlocks: h4 plan cards under an h1 intro are captured, and the run stops before a later footer-nav false positive (real trunk.io/pricing shape)", () => {
  // Condensed but structurally faithful reproduction of the live
  // trunk.io/pricing markdown that originally motivated this fix: real
  // plan cards are h4s under a non-plan h1 intro, followed by a detailed
  // comparison table that repeats the same h4 names with no price nearby,
  // then unrelated sections, ending in a footer nav column ("Connect")
  // whose body happens to contain "Contact us" — which must NOT be read
  // as a fourth, custom-priced plan.
  const md = [
    "# Plans for every stage of your company",
    "#### Free",
    "$0/committer/month",
    "Free for teams up to 5.",
    "",
    "#### Team",
    "$18/committer/month",
    "Everything you need to manage your team's workflow.",
    "",
    "#### Enterprise",
    "Custom",
    "Enterprise includes SSO, on-premise, admin controls, dedicated support, and more.",
    "",
    "#### Trusted by top engineering teams",
    "",
    "#### Free",
    "Flaky Tests\nUsers\nUp to 5 committers\nQuarantining\nIncluded",
    "",
    "#### Team",
    "Flaky Tests\nUsers\nUnlimited\nQuarantining\nIncluded",
    "",
    "## Security Overview",
    "Your code is your IP.",
    "",
    "## SOC 2 Compliance",
    "We are independently audited.",
    "",
    "## FAQs",
    "Common questions answered.",
    "",
    "# Connect",
    "[Twitter](https://x.com/trunkio) [Contact us](https://calendly.com/trunk/demo)",
  ].join("\n");
  const entries = analyzePricingBlocks(md);
  assertEquals(entries.map((e) => [e.name, e.price]), [
    ["Free", "$0"],
    ["Team", "$18"],
    ["Enterprise", "Custom pricing"],
  ]);
});

Deno.test("classifyPricingModel: a $0 tier alongside a paid tier is Freemium, not just 'Paid because a $ sign exists'", () => {
  const entries = [
    { name: "Free", price: "$0", evidence: "" },
    { name: "Team", price: "$18 /mo", evidence: "" },
  ];
  const result = classifyPricingModel(entries, null, null);
  assertEquals(result?.model, "Freemium");
});

Deno.test("classifyPricingModel: only numeric paid tiers (no free tier) is Paid", () => {
  const entries = [
    { name: "Starter", price: "$10 /mo", evidence: "" },
    { name: "Pro", price: "$25 /mo", evidence: "" },
  ];
  const result = classifyPricingModel(entries, null, null);
  assertEquals(result?.model, "Paid");
});

Deno.test("classifyPricingModel: paid tiers plus a free trial is labeled distinctly from plain Paid", () => {
  const entries = [{ name: "Pro", price: "$25 /mo", evidence: "" }];
  const freeTrialMatch = "free trial".match(/free trial/i);
  const result = classifyPricingModel(entries, null, freeTrialMatch);
  assertEquals(result?.model, "Paid (free trial available)");
});

Deno.test("classifyPricingModel: only custom/contact-sales pricing is its own honest category, not silently dropped or mislabeled", () => {
  const entries = [{ name: "Enterprise", price: "Custom pricing", evidence: "" }];
  const result = classifyPricingModel(entries, null, null);
  assertEquals(result?.model, "Custom / Contact sales");
});

Deno.test("classifyPricingModel: no plan entries and no free/trial text evidence returns null (never fabricated)", () => {
  const result = classifyPricingModel([], null, null);
  assertEquals(result, null);
});

Deno.test("computeStartingPrice: picks the lowest numeric paired price, not just the first one found on the page", () => {
  const entries = [
    { name: "Pro", price: "$25 /mo", evidence: "" },
    { name: "Starter", price: "$10 /mo", evidence: "" },
    { name: "Enterprise", price: "Custom pricing", evidence: "" },
  ];
  assertEquals(computeStartingPrice(entries, ["$99"]), "$10 /mo");
});

Deno.test("computeStartingPrice: falls back to the first raw price match when no plan entries were paired", () => {
  assertEquals(computeStartingPrice([], ["$49 /mo", "$99 /mo"]), "$49 /mo");
});

Deno.test("normalizeCrawlResult: full pipeline produces clean name+price plan_candidates and a Freemium classification from the Trunk.io-shaped fixture", () => {
  const pricingMd = [
    "## Free",
    "$0",
    "",
    "## Team",
    "$18 /mo",
    "",
    "## SOC 2 Compliance",
    "We are independently audited.",
    "",
    "## Customer Stories",
    "See what our customers say.",
  ].join("\n");
  const raw: Crawl4aiRawResponse = {
    success: true,
    results: [
      page({ url: "https://example.com/" }),
      page({ url: "https://example.com/pricing", markdown: pricingMd }),
    ],
  };
  const result = normalizeCrawlResult(raw, { discoveryCandidateWebsite: "https://example.com" });
  const planValues = result.pricing.plan_candidates.map((f) => f.value);
  assertEquals(planValues, ["Free — $0", "Team — $18 /mo"]);
  assertEquals(result.pricing.pricing_model_candidate.value, "Freemium");
  assertEquals(result.pricing.starting_price_candidate.value, "$0");
  for (const f of result.pricing.plan_candidates) assertEquals(f.source_url, "https://example.com/pricing");
});

Deno.test("normalizeCrawlResult: no pricing page found leaves all pricing fields empty, never guessed", () => {
  const raw: Crawl4aiRawResponse = {
    success: true,
    results: [page({ url: "https://example.com/" })],
  };
  const result = normalizeCrawlResult(raw, { discoveryCandidateWebsite: "https://example.com" });
  assertEquals(result.pricing.pricing_model_candidate.value, null);
  assertEquals(result.pricing.plan_candidates, []);
  assertEquals(result.pricing.starting_price_candidate.value, null);
});
