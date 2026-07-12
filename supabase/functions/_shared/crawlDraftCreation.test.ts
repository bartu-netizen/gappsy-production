// Tests for the pure logic in crawlDraftCreation.ts: field resolution,
// auto-approve review-state construction, and tool-payload mapping. The
// network-calling createDraftFromCrawlJob is integration-level and not
// covered here.
import { assert, assertEquals } from "jsr:@std/assert@1";
import type { NormalizedExtraction, ProvenanceField } from "./crawlExtractionAdapter.ts";
import {
  buildAutoApproveReviewState,
  buildToolPayloadFromExtraction,
  resolveApprovedFaq,
  resolveApprovedValue,
  type ReviewState,
} from "./crawlDraftCreation.ts";

function emptyField(): ProvenanceField<string> {
  return { value: null, source_url: null, evidence: null, confidence: 0, review_status: "pending" };
}

function f(value: string, confidence = 80): ProvenanceField<string> {
  return { value, source_url: "https://example.com/", evidence: null, confidence, review_status: "pending" };
}

function baseExtraction(overrides: Partial<NormalizedExtraction> = {}): NormalizedExtraction {
  return {
    identity: {
      tool_name_candidate: f("Acme"),
      canonical_website: f("https://acme.example.com/"),
      title: emptyField(),
      meta_description: f("The best tool for acme things."),
      og_title: emptyField(),
      og_description: emptyField(),
      favicon_candidates: [],
      logo_candidates: [f("https://acme.example.com/logo.png")],
    },
    company: {
      company_name: emptyField(),
      about_text: emptyField(),
      founded_year_candidate: f("2019"),
      headquarters_candidate: emptyField(),
      company_size_candidate: emptyField(),
      social_links: [],
    },
    pricing: {
      pricing_page_url: emptyField(),
      pricing_model_candidate: f("Freemium"),
      starting_price_candidate: f("$9/mo"),
      free_plan_evidence: emptyField(),
      free_trial_evidence: emptyField(),
      plan_candidates: [],
      raw_pricing_evidence: emptyField(),
    },
    product: {
      feature_candidates: [f("Real-time sync"), f("Team workspaces")],
      use_case_candidates: [],
      platform_indicators: [],
      integrations: [f("Slack"), f("Zapier")],
      docs_api_indicators: [],
      api_documentation: emptyField(),
      languages: [],
      security_indicators: [],
      support_channels: [],
    },
    content: {
      faq_candidates: [
        { question: "Is there a free plan?", answer: "Yes, forever free for small teams.", source_url: "https://acme.example.com/faq", confidence: 60, review_status: "pending" },
      ],
      important_headings: [],
      source_summaries: [],
    },
    assets: {
      screenshot_candidates: [f("https://acme.example.com/shot1.png")],
      image_candidates: [],
      logo_candidates: [],
    },
    taxonomy: {
      category_suggestions: [{ value: "cat-productivity", source_url: null, evidence: null, confidence: 50, review_status: "pending" }],
      tag_suggestions: [{ value: "tag-saas", source_url: null, evidence: null, confidence: 50, review_status: "pending" }],
    },
    crawl_sources: [],
    warnings: [],
    ...overrides,
  };
}

Deno.test("resolveApprovedValue: pending/no entry -> null; rejected -> null; approved -> field value; edited -> edited value", () => {
  const field = f("hello");
  const state: ReviewState = {
    approved: { status: "approved", reviewed_by: "a@b.com", reviewed_at: "now" },
    rejected: { status: "rejected", reviewed_by: "a@b.com", reviewed_at: "now" },
    edited: { status: "edited", edited_value: "world", reviewed_by: "a@b.com", reviewed_at: "now" },
  };
  assertEquals(resolveApprovedValue("missing", field, state), null);
  assertEquals(resolveApprovedValue("rejected", field, state), null);
  assertEquals(resolveApprovedValue("approved", field, state), "hello");
  assertEquals(resolveApprovedValue("edited", field, state), "world");
});

Deno.test("resolveApprovedFaq mirrors resolveApprovedValue semantics for question/answer pairs", () => {
  const faq = { question: "Q?", answer: "A.", source_url: "https://x", confidence: 60, review_status: "pending" as const };
  const state: ReviewState = {
    approved: { status: "approved", reviewed_by: "a@b.com", reviewed_at: "now" },
    edited: { status: "edited", edited_value: { question: "Q2?", answer: "A2." }, reviewed_by: "a@b.com", reviewed_at: "now" },
  };
  assertEquals(resolveApprovedFaq("missing", faq, state), null);
  assertEquals(resolveApprovedFaq("approved", faq, state), { question: "Q?", answer: "A." });
  assertEquals(resolveApprovedFaq("edited", faq, state), { question: "Q2?", answer: "A2." });
});

Deno.test("buildAutoApproveReviewState approves every non-null field, including array items and FAQs, but never an empty field", () => {
  const extraction = baseExtraction();
  const state = buildAutoApproveReviewState(extraction, "system@gappsy.com");

  assertEquals(state["identity.tool_name_candidate"]?.status, "approved");
  assertEquals(state["identity.title"], undefined); // empty field never approved
  assertEquals(state["product.feature_candidates[0]"]?.status, "approved");
  assertEquals(state["product.feature_candidates[1]"]?.status, "approved");
  assertEquals(state["content.faq_candidates[0]"]?.status, "approved");
  assertEquals(state["taxonomy.category_suggestions[0]"]?.status, "approved");
});

Deno.test("buildToolPayloadFromExtraction maps scalar fields, features, integrations, faqs, screenshots, categories and tags", () => {
  const extraction = baseExtraction();
  const reviewState = buildAutoApproveReviewState(extraction, "system@gappsy.com");
  const candidate = { id: "candidate-1", name: "Acme (discovered)", official_website: "https://acme.example.com", category_id: "cat-existing" };

  const { payload, missingFields } = buildToolPayloadFromExtraction(extraction, reviewState, candidate, "job-1", "2026-07-13T00:00:00.000Z");

  assertEquals(payload.name, "Acme");
  assertEquals(payload.website, "https://acme.example.com/");
  assertEquals(payload.logo, "https://acme.example.com/logo.png");
  assertEquals(payload.pricing_model, "Freemium");
  assertEquals(payload.founded_year, 2019);
  assert((payload.editorial_notes as string).includes("job_id=job-1"));
  assert((payload.editorial_notes as string).includes("crawled_at=2026-07-13T00:00:00.000Z"));

  assertEquals(payload.features, [
    { group_name: null, title: "Real-time sync", description: null, sort_order: 0 },
    { group_name: null, title: "Team workspaces", description: null, sort_order: 1 },
  ]);
  assertEquals(payload.integrations, [
    { integration_name: "Slack", integration_slug: null, integration_logo: null, description: null },
    { integration_name: "Zapier", integration_slug: null, integration_logo: null, description: null },
  ]);
  assertEquals(payload.faqs, [
    { question: "Is there a free plan?", answer: "Yes, forever free for small teams.", status: "draft", sort_order: 0 },
  ]);
  assertEquals(payload.screenshots, [
    { image_url: "https://acme.example.com/shot1.png", caption: null, alt_text: null, is_featured: true, sort_order: 0 },
  ]);
  // Union of the candidate's own category with the crawl's suggestion — never dropping the existing one.
  assertEquals((payload.category_ids as string[]).sort(), ["cat-existing", "cat-productivity"].sort());
  assertEquals(payload.primary_category_id, "cat-existing");
  assertEquals(payload.tag_ids, ["tag-saas"]);

  // Everything in this fixture was found, so nothing should be reported missing
  // except the fields we deliberately left empty (headquarters, company_size, api_documentation).
  assert(missingFields.includes("headquarters"));
  assert(missingFields.includes("company size"));
  assert(missingFields.includes("API documentation"));
  assert(!missingFields.includes("website"));
});

Deno.test("buildToolPayloadFromExtraction: rejected/edited fields are respected, not just approved", () => {
  const extraction = baseExtraction();
  const candidate = { id: "candidate-1", name: "Acme (discovered)", official_website: "https://acme.example.com", category_id: null };
  const reviewState: ReviewState = {
    "identity.tool_name_candidate": { status: "edited", edited_value: "Acme Pro", reviewed_by: "human@gappsy.com", reviewed_at: "now" },
    "pricing.pricing_model_candidate": { status: "rejected", reviewed_by: "human@gappsy.com", reviewed_at: "now" },
  };
  const { payload } = buildToolPayloadFromExtraction(extraction, reviewState, candidate, "job-2", null);
  assertEquals(payload.name, "Acme Pro");
  assertEquals(payload.pricing_model, undefined);
  assertEquals(payload.features, undefined); // nothing approved -> key omitted entirely, not an empty array
});

Deno.test("buildToolPayloadFromExtraction: no name resolved falls back to candidate.name", () => {
  const extraction = baseExtraction({
    identity: { ...baseExtraction().identity, tool_name_candidate: emptyField() },
  });
  const candidate = { id: "candidate-1", name: "Fallback Name", official_website: null, category_id: null };
  const { payload } = buildToolPayloadFromExtraction(extraction, {}, candidate, "job-3", null);
  assertEquals(payload.name, "Fallback Name");
});
