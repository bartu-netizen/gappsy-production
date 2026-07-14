// CrawlProvider adapter — the ONLY place in this codebase that knows
// Crawl4AI's raw response shape. Every downstream consumer (edge functions,
// the review UI, the DB) depends on NormalizedExtraction, never on Crawl4AI
// directly. Swapping crawl providers later means rewriting this file only.
//
// Every extracted fact carries provenance (source_url + evidence snippet)
// and a confidence score — nothing here is ever "verified truth." Fields
// that can't be found are left null/empty with confidence 0, never guessed.

export interface ProvenanceField<T> {
  value: T | null;
  source_url: string | null;
  evidence: string | null;
  confidence: number; // 0-100, heuristic — never fabricated
  review_status: "pending" | "approved" | "rejected" | "edited";
}

function field<T>(value: T | null, source_url: string | null, evidence: string | null, confidence: number): ProvenanceField<T> {
  return { value, source_url, evidence: evidence ? evidence.slice(0, 300) : null, confidence, review_status: "pending" };
}

const EMPTY_FIELD: ProvenanceField<string> = { value: null, source_url: null, evidence: null, confidence: 0, review_status: "pending" };

export interface FaqCandidate {
  question: string;
  answer: string;
  source_url: string;
  confidence: number;
  review_status: "pending" | "approved" | "rejected" | "edited";
}

export interface NormalizedExtraction {
  identity: {
    tool_name_candidate: ProvenanceField<string>;
    canonical_website: ProvenanceField<string>;
    title: ProvenanceField<string>;
    meta_description: ProvenanceField<string>;
    og_title: ProvenanceField<string>;
    og_description: ProvenanceField<string>;
    favicon_candidates: ProvenanceField<string>[];
    logo_candidates: ProvenanceField<string>[];
  };
  company: {
    company_name: ProvenanceField<string>;
    about_text: ProvenanceField<string>;
    founded_year_candidate: ProvenanceField<string>;
    headquarters_candidate: ProvenanceField<string>;
    company_size_candidate: ProvenanceField<string>;
    social_links: ProvenanceField<string>[];
  };
  pricing: {
    pricing_page_url: ProvenanceField<string>;
    pricing_model_candidate: ProvenanceField<string>;
    starting_price_candidate: ProvenanceField<string>;
    free_plan_evidence: ProvenanceField<string>;
    free_trial_evidence: ProvenanceField<string>;
    plan_candidates: ProvenanceField<string>[];
    raw_pricing_evidence: ProvenanceField<string>;
  };
  product: {
    feature_candidates: ProvenanceField<string>[];
    use_case_candidates: ProvenanceField<string>[];
    platform_indicators: ProvenanceField<string>[];
    integrations: ProvenanceField<string>[];
    docs_api_indicators: ProvenanceField<string>[];
    api_documentation: ProvenanceField<string>;
    languages: ProvenanceField<string>[];
    security_indicators: ProvenanceField<string>[];
    support_channels: ProvenanceField<string>[];
  };
  content: {
    faq_candidates: FaqCandidate[];
    important_headings: ProvenanceField<string>[];
    source_summaries: { url: string; summary: string }[];
  };
  assets: {
    screenshot_candidates: ProvenanceField<string>[];
    image_candidates: ProvenanceField<string>[];
    logo_candidates: ProvenanceField<string>[];
  };
  // Suggestions matched against the EXISTING tool_categories/tool_tags
  // taxonomy only (passed in via NormalizeOptions) — never a newly-invented
  // category or tag. A category/tag is suggested only when its name is
  // literally present in the crawled text, so the match is always
  // evidence-grounded, not guessed.
  taxonomy: {
    category_suggestions: ProvenanceField<string>[];
    tag_suggestions: ProvenanceField<string>[];
  };
  crawl_sources: { url: string; status_code: number | null; title: string | null }[];
  warnings: string[];
}

// -- Crawl4AI 0.9.1 raw shapes (only the fields this adapter reads) --------
interface Crawl4aiPageResult {
  url: string;
  html?: string;
  cleaned_html?: string;
  media?: { images?: Array<{ src?: string; alt?: string }> };
  links?: { internal?: Array<{ href?: string; text?: string }>; external?: Array<{ href?: string; text?: string }> };
  metadata?: { title?: string | null; description?: string | null; keywords?: string | null; author?: string | null };
  status_code?: number | null;
  redirected_url?: string | null;
  error_message?: string | null;
  success?: boolean;
  markdown?: { raw_markdown?: string } | string | null;
}
export interface Crawl4aiRawResponse {
  success: boolean;
  results?: Crawl4aiPageResult[];
}

function getMarkdown(page: Crawl4aiPageResult): string {
  if (!page.markdown) return "";
  if (typeof page.markdown === "string") return page.markdown;
  return page.markdown.raw_markdown || "";
}

function pageUrl(page: Crawl4aiPageResult): string {
  return page.redirected_url || page.url;
}

function classifyPage(url: string): string {
  const path = (() => {
    try { return new URL(url).pathname.toLowerCase(); } catch { return url.toLowerCase(); }
  })();
  if (path === "/" || path === "") return "homepage";
  if (/pricing|plans/.test(path)) return "pricing";
  if (/feature/.test(path)) return "features";
  if (/product/.test(path)) return "product";
  if (/integration/.test(path)) return "integrations";
  if (/^\/about/.test(path)) return "about";
  if (/faq|help|support/.test(path)) return "faq";
  if (/^\/docs|documentation/.test(path)) return "docs";
  if (/security|trust/.test(path)) return "security";
  return "other";
}

const SOCIAL_HOST_PATTERN = /(twitter\.com|x\.com|linkedin\.com|facebook\.com|instagram\.com|youtube\.com|github\.com)/i;
const OG_TAG_RE = /<meta\s+[^>]*property=["']og:(title|description)["'][^>]*content=["']([^"']*)["'][^>]*>/gi;
const FAVICON_RE = /<link\s+[^>]*rel=["'][^"']*icon[^"']*["'][^>]*href=["']([^"']+)["'][^>]*>/gi;
const HEADING_RE = /^#{1,3}\s+(.+)$/gm;
const PRICE_RE = /\$\s?\d[\d,.]*\s*(\/\s*(mo|month|user|seat|yr|year))?/gi;
const CUSTOM_PRICE_RE = /\b(custom pricing|contact (us|sales)|talk to sales|book a demo|request (a )?demo|get a quote)\b/i;
// Headings that are short/title-case like a real plan name ("Starter",
// "Pro", "Enterprise") but are actually unrelated page furniture — this is
// exactly what previously let Trunk.io's "SOC 2 Compliance"/"Customer
// Stories"/"FAQs" headings leak into plan_candidates as if they were
// pricing tiers.
const NON_PLAN_HEADING_RE = /\b(faq|faqs|security|compliance|soc\s*2|customer\s+stor(?:y|ies)|testimonials?|case\s+stud(?:y|ies)|resources?|support|overview|compare|comparison|frequently asked|help|contact|about|why|trust|privacy|terms|guarantee)\b/i;
const FOUNDED_RE = /\bfounded\s+(?:in\s+)?(\d{4})\b/i;
const HQ_RE = /\bheadquartered\s+in\s+([A-Z][A-Za-z ,.-]{2,60})/i;
const COMPANY_SIZE_RE = /\b(\d{1,4}\s?[-–]\s?\d{1,5}|\d{2,5}\+?)\s+employees\b/i;
const FREE_PLAN_RE = /\bfree\s+plan\b|\bforever\s+free\b|\bfree\s+forever\b/i;
const FREE_TRIAL_RE = /\bfree\s+trial\b|\btry\s+(it\s+)?free\b/i;
const LOGO_HINT_RE = /logo/i;
const SCREENSHOT_HINT_RE = /screenshot|dashboard|preview|app[-_ ]?screen|product[-_ ]?shot|ui[-_ ]?preview/i;
const HTML_LANG_RE = /<html[^>]+lang=["']([a-zA-Z]{2}(?:-[a-zA-Z]{2,})?)["']/i;
const SECURITY_KEYWORDS = [
  "soc 2", "soc2", "iso 27001", "gdpr", "hipaa", "pci dss", "penetration test",
  "two-factor", "2fa", "single sign-on", "sso", "end-to-end encryption", "encrypted at rest",
];
const SUPPORT_KEYWORDS = [
  "live chat", "email support", "phone support", "24/7 support", "24/7", "community forum",
  "help center", "helpdesk", "knowledge base", "support ticket",
];

function absoluteUrl(href: string, base: string): string | null {
  try { return new URL(href, base).toString(); } catch { return null; }
}

// Q/A pairs from a markdown FAQ page: a heading followed by the paragraph(s)
// until the next heading. Confidence is fixed moderate — heuristic, not
// guaranteed accurate; a human reviews every candidate before it's used.
function extractFaqCandidates(markdown: string, sourceUrl: string): FaqCandidate[] {
  const lines = markdown.split("\n");
  const faqs: FaqCandidate[] = [];
  let currentQ: string | null = null;
  let currentA: string[] = [];
  const flush = () => {
    if (currentQ && currentA.length > 0) {
      const answer = currentA.join(" ").trim();
      if (answer.length > 5) {
        faqs.push({ question: currentQ.trim(), answer: answer.slice(0, 500), source_url: sourceUrl, confidence: 55, review_status: "pending" });
      }
    }
    currentQ = null;
    currentA = [];
  };
  for (const line of lines) {
    const headingMatch = line.match(/^#{2,4}\s+(.+)$/);
    if (headingMatch) {
      const text = headingMatch[1].trim();
      if (/\?$/.test(text) || /^(what|how|why|when|where|who|can|does|do|is|are|will)\b/i.test(text)) {
        flush();
        currentQ = text;
        continue;
      }
    }
    if (currentQ && line.trim()) currentA.push(line.trim());
  }
  flush();
  return faqs.slice(0, 20);
}

export interface TaxonomyEntry {
  id: string;
  name: string;
  slug: string;
}

export interface NormalizeOptions {
  discoveryCandidateWebsite: string;
  // Existing taxonomy to match category/tag suggestions against — optional
  // and additive; callers that omit it simply get empty suggestion arrays,
  // never an invented category/tag.
  categories?: TaxonomyEntry[];
  tags?: TaxonomyEntry[];
}

// A taxonomy entry "matches" when its name appears as a whole word,
// case-insensitively, in the crawled text corpus — literal textual
// evidence, never a semantic/fuzzy guess.
function matchTaxonomy(entries: TaxonomyEntry[], corpus: string, sourceUrl: string | null): ProvenanceField<string>[] {
  const lowerCorpus = corpus.toLowerCase();
  const matches: ProvenanceField<string>[] = [];
  for (const entry of entries) {
    const name = entry.name.trim();
    if (!name) continue;
    const escaped = name.replace(/[.*+?^${}()|[\]\\]/g, "\\$&");
    const re = new RegExp(`(?:^|[^a-z0-9])${escaped.toLowerCase()}(?:$|[^a-z0-9])`, "i");
    if (re.test(lowerCorpus)) {
      matches.push(field(entry.id, sourceUrl, `Matched taxonomy name "${name}" in crawled content`, 50));
    }
  }
  return matches.slice(0, 10);
}

export interface PricingPlanEntry {
  name: string;
  price: string; // either a "$X/mo"-style match or the literal "Custom pricing"
  evidence: string;
}

// Splits pricing-page markdown into heading -> body blocks (##/###/# only,
// matching the granularity plan cards are actually written at — a deeper
// #### inside a plan's own feature list stays part of that plan's body
// rather than starting a new block).
function splitPricingBlocks(markdown: string): { heading: string; body: string }[] {
  const lines = markdown.split("\n");
  const blocks: { heading: string; body: string[] }[] = [];
  let current: { heading: string; body: string[] } | null = null;
  for (const line of lines) {
    const m = line.match(/^#{1,3}\s+(.+)$/);
    if (m) {
      if (current) blocks.push(current);
      current = { heading: m[1].trim(), body: [] };
    } else if (current) {
      current.body.push(line);
    }
  }
  if (current) blocks.push(current);
  return blocks.map((b) => ({ heading: b.heading, body: b.body.join("\n") }));
}

// A real plan name is short, not a sentence/question, and isn't one of the
// common non-plan headings a pricing page also contains (FAQ, security,
// customer stories, etc.) — exported for unit testing in isolation.
export function looksLikePlanName(heading: string): boolean {
  if (heading.length === 0 || heading.length > 30) return false;
  if (NON_PLAN_HEADING_RE.test(heading)) return false;
  if (/[?.!]$/.test(heading)) return false;
  if (heading.trim().split(/\s+/).length > 4) return false;
  return true;
}

function extractPriceFromBlock(body: string): string | null {
  const priceMatch = body.match(PRICE_RE);
  if (priceMatch) return priceMatch[0].replace(/\s+/g, " ").trim();
  if (CUSTOM_PRICE_RE.test(body)) return "Custom pricing";
  return null;
}

// Pairs a plan name with its price by requiring BOTH a plan-shaped heading
// AND a price signal in the text immediately following it (first ~400
// chars, before the next heading) — structural evidence, not "any short
// heading on the pricing page." A block with a plan-like heading but no
// nearby price is dropped rather than guessed at. Exported for unit
// testing.
export function analyzePricingBlocks(markdown: string): PricingPlanEntry[] {
  const blocks = splitPricingBlocks(markdown);
  const entries: PricingPlanEntry[] = [];
  for (const block of blocks) {
    if (!looksLikePlanName(block.heading)) continue;
    const searchWindow = block.body.slice(0, 400);
    const price = extractPriceFromBlock(searchWindow);
    if (!price) continue;
    entries.push({ name: block.heading, price, evidence: searchWindow.replace(/\s+/g, " ").trim().slice(0, 150) });
  }
  return entries.slice(0, 8);
}

function parsePriceNumber(price: string): number | null {
  const m = price.match(/\$\s?([\d,]+(?:\.\d+)?)/);
  if (!m) return null;
  const n = parseFloat(m[1].replace(/,/g, ""));
  return Number.isFinite(n) ? n : null;
}

// The lowest numeric price among paired plan entries (Custom-pricing-only
// entries have no number and are excluded) — a genuinely representative
// "starting price," not just whichever dollar figure happened to appear
// first on the page (which is often a mid-tier or a testimonial number).
// Exported for unit testing.
export function computeStartingPrice(planEntries: PricingPlanEntry[], fallbackPriceMatches: string[]): string | null {
  const numeric = planEntries
    .map((e) => ({ raw: e.price, n: parsePriceNumber(e.price) }))
    .filter((p): p is { raw: string; n: number } => p.n !== null);
  if (numeric.length > 0) {
    numeric.sort((a, b) => a.n - b.n);
    return numeric[0].raw;
  }
  return fallbackPriceMatches[0] || null;
}

export interface PricingModelClassification {
  model: string;
  confidence: number;
  evidence: string;
}

// Replaces the old "$ sign anywhere on the page -> Paid" heuristic with a
// decision grounded in the actual paired plan/price evidence: a real free
// tier alongside a paid one is Freemium (not just "Paid" because a $ sign
// exists somewhere); custom-only pricing is its own honest category rather
// than being silently dropped or mislabeled Paid. Exported for unit
// testing.
export function classifyPricingModel(
  planEntries: PricingPlanEntry[],
  freePlanMatch: RegExpMatchArray | null,
  freeTrialMatch: RegExpMatchArray | null,
): PricingModelClassification | null {
  const isZero = (price: string) => /^\$?\s?0(\.00)?(\s|$)/.test(price);
  const hasZeroPrice = planEntries.some((e) => isZero(e.price));
  const hasCustomPrice = planEntries.some((e) => e.price === "Custom pricing");
  const hasNumericPaidPrice = planEntries.some((e) => e.price !== "Custom pricing" && !isZero(e.price));

  if (planEntries.length >= 2 && hasZeroPrice && hasNumericPaidPrice) {
    return { model: "Freemium", confidence: 70, evidence: `Free ($0) tier found alongside ${planEntries.length - 1} paid tier(s) on the pricing page.` };
  }
  if (freePlanMatch && hasNumericPaidPrice) {
    return { model: "Freemium", confidence: 55, evidence: freePlanMatch[0] };
  }
  if (hasNumericPaidPrice && hasCustomPrice) {
    return { model: "Paid", confidence: 55, evidence: "Numeric paid tier(s) plus a custom/contact-sales tier found." };
  }
  if (hasNumericPaidPrice) {
    return { model: freeTrialMatch ? "Paid (free trial available)" : "Paid", confidence: 50, evidence: planEntries.find((e) => !isZero(e.price) && e.price !== "Custom pricing")?.price || "" };
  }
  if (hasCustomPrice) {
    return { model: "Custom / Contact sales", confidence: 45, evidence: "Only custom/contact-sales pricing found on the pricing page — no public numeric price." };
  }
  if (freePlanMatch) {
    return { model: "Freemium", confidence: 40, evidence: freePlanMatch[0] };
  }
  return null;
}

// Turns Crawl4AI's raw multi-page response into the stable internal
// contract. Never throws on missing/odd data — degrades to empty fields
// with a warning instead.
export function normalizeCrawlResult(raw: Crawl4aiRawResponse, opts: NormalizeOptions): NormalizedExtraction {
  const warnings: string[] = [];
  const pages = raw.results || [];
  if (pages.length === 0) warnings.push("No pages were successfully crawled.");

  const homepage = pages.find((p) => classifyPage(pageUrl(p)) === "homepage") || pages[0];
  const pricingPage = pages.find((p) => classifyPage(pageUrl(p)) === "pricing");
  const aboutPage = pages.find((p) => classifyPage(pageUrl(p)) === "about");
  const faqPage = pages.find((p) => classifyPage(pageUrl(p)) === "faq");
  const featuresPage = pages.find((p) => classifyPage(pageUrl(p)) === "features" || classifyPage(pageUrl(p)) === "product");
  const integrationsPage = pages.find((p) => classifyPage(pageUrl(p)) === "integrations");
  const docsPage = pages.find((p) => classifyPage(pageUrl(p)) === "docs");
  const securityPage = pages.find((p) => classifyPage(pageUrl(p)) === "security");

  // ---- Identity ----
  const homeUrl = homepage ? pageUrl(homepage) : opts.discoveryCandidateWebsite;
  const homeHtml = homepage?.html || "";
  const homeMd = homepage ? getMarkdown(homepage) : "";

  let ogTitle: string | null = null;
  let ogDescription: string | null = null;
  for (const m of homeHtml.matchAll(OG_TAG_RE)) {
    if (m[1] === "title" && !ogTitle) ogTitle = m[2];
    if (m[1] === "description" && !ogDescription) ogDescription = m[2];
  }

  const faviconCandidates: ProvenanceField<string>[] = [];
  for (const m of homeHtml.matchAll(FAVICON_RE)) {
    const abs = absoluteUrl(m[1], homeUrl);
    if (abs) faviconCandidates.push(field(abs, homeUrl, `<link rel="icon" href="${m[1]}">`, 60));
  }

  const logoCandidates: ProvenanceField<string>[] = [];
  const imageCandidates: ProvenanceField<string>[] = [];
  const screenshotCandidates: ProvenanceField<string>[] = [];
  const seenScreenshot = new Set<string>();
  for (const page of pages) {
    const url = pageUrl(page);
    for (const img of page.media?.images || []) {
      if (!img.src) continue;
      const abs = absoluteUrl(img.src, url);
      if (!abs) continue;
      imageCandidates.push(field(abs, url, img.alt || null, 30));
      const isLogoHint = LOGO_HINT_RE.test(img.src) || (img.alt && LOGO_HINT_RE.test(img.alt));
      if (isLogoHint) {
        logoCandidates.push(field(abs, url, img.alt || "filename/alt contains 'logo'", 65));
        continue;
      }
      const isScreenshotHint = SCREENSHOT_HINT_RE.test(img.src) || (img.alt && SCREENSHOT_HINT_RE.test(img.alt));
      if (isScreenshotHint && !seenScreenshot.has(abs)) {
        seenScreenshot.add(abs);
        screenshotCandidates.push(field(abs, url, img.alt || "filename/alt suggests a product screenshot", 65));
      }
    }
  }

  // ---- Company ----
  const socialLinks: ProvenanceField<string>[] = [];
  const seenSocial = new Set<string>();
  for (const page of pages) {
    for (const link of page.links?.external || []) {
      if (!link.href || !SOCIAL_HOST_PATTERN.test(link.href)) continue;
      if (seenSocial.has(link.href)) continue;
      seenSocial.add(link.href);
      socialLinks.push(field(link.href, pageUrl(page), link.text || null, 50));
    }
  }

  const aboutMd = aboutPage ? getMarkdown(aboutPage) : "";
  const combinedForCompanyFacts = [homeMd, aboutMd].join("\n\n");
  const foundedMatch = combinedForCompanyFacts.match(FOUNDED_RE);
  const hqMatch = combinedForCompanyFacts.match(HQ_RE);
  const sizeMatch = combinedForCompanyFacts.match(COMPANY_SIZE_RE);

  // ---- Pricing ----
  const pricingUrl = pricingPage ? pageUrl(pricingPage) : null;
  const pricingMd = pricingPage ? getMarkdown(pricingPage) : "";
  const priceMatches = [...pricingMd.matchAll(PRICE_RE)].map((m) => m[0]);
  const freePlanMatch = pricingMd.match(FREE_PLAN_RE);
  const freeTrialMatch = pricingMd.match(FREE_TRIAL_RE);
  // Structural plan/price pairing (heading + a price found in its own body),
  // not a flat list of every short heading on the page — see
  // analyzePricingBlocks/classifyPricingModel above for why.
  const planEntries = analyzePricingBlocks(pricingMd);
  const pricingModelClassification = classifyPricingModel(planEntries, freePlanMatch, freeTrialMatch);
  const startingPrice = computeStartingPrice(planEntries, priceMatches);

  // ---- Product ----
  const featureHeadings = featuresPage
    ? [...getMarkdown(featuresPage).matchAll(HEADING_RE)].map((m) => m[1].trim()).filter((h) => h.length < 80)
    : [];
  const integrationNames: string[] = [];
  if (integrationsPage) {
    for (const link of integrationsPage.links?.internal || []) {
      if (link.text && link.text.trim().length > 1 && link.text.trim().length < 40) integrationNames.push(link.text.trim());
    }
  }
  const docsIndicators: ProvenanceField<string>[] = [];
  if (docsPage) docsIndicators.push(field(pageUrl(docsPage), pageUrl(docsPage), "Docs page crawled", 70));
  for (const page of pages) {
    for (const link of [...(page.links?.internal || []), ...(page.links?.external || [])]) {
      if (link.href && /\/api\b|api\.[a-z]+\./i.test(link.href) && docsIndicators.length < 5) {
        docsIndicators.push(field(link.href, pageUrl(page), link.text || null, 40));
      }
    }
  }

  // A single "does this product have API documentation, and where" field,
  // distinct from the broader docs_api_indicators list above: the docs page
  // itself if its URL/content clearly references an API, else the
  // strongest API-shaped link already collected.
  let apiDocumentation: ProvenanceField<string> = EMPTY_FIELD;
  if (docsPage && /\bapi\b/i.test(pageUrl(docsPage) + " " + getMarkdown(docsPage).slice(0, 500))) {
    apiDocumentation = field(pageUrl(docsPage), pageUrl(docsPage), "Docs page URL/content references an API", 75);
  } else if (docsIndicators.length > 0 && docsIndicators[0].value) {
    apiDocumentation = field(docsIndicators[0].value, docsIndicators[0].source_url, docsIndicators[0].evidence, 50);
  }

  // ---- Languages: <html lang="xx"> across crawled pages, deduped. ----
  const languageCandidates: ProvenanceField<string>[] = [];
  const seenLanguages = new Set<string>();
  for (const page of pages) {
    const match = (page.html || "").match(HTML_LANG_RE);
    if (!match) continue;
    const lang = match[1].toLowerCase();
    if (seenLanguages.has(lang)) continue;
    seenLanguages.add(lang);
    languageCandidates.push(field(match[1], pageUrl(page), `<html lang="${match[1]}">`, 70));
  }

  // ---- Security & Support: keyword evidence on their classified pages. ----
  const securityMd = securityPage ? getMarkdown(securityPage) : "";
  const securityUrl = securityPage ? pageUrl(securityPage) : null;
  const securityIndicators: ProvenanceField<string>[] = SECURITY_KEYWORDS
    .filter((kw) => securityMd.toLowerCase().includes(kw))
    .map((kw) => field(kw, securityUrl, `Matched "${kw}" on the security/trust page`, 60));

  const supportCorpus = [faqPage ? getMarkdown(faqPage) : "", homeMd].join("\n\n").toLowerCase();
  const supportUrl = faqPage ? pageUrl(faqPage) : homeUrl;
  const supportChannels: ProvenanceField<string>[] = SUPPORT_KEYWORDS
    .filter((kw) => supportCorpus.includes(kw))
    .map((kw) => field(kw, supportUrl, `Matched "${kw}"`, 55));

  // ---- Taxonomy suggestions: matched against the EXISTING taxonomy only. ----
  const taxonomyCorpus = [
    homepage?.metadata?.title || "", homepage?.metadata?.description || "", ogTitle || "", ogDescription || "",
    ...featureHeadings,
  ].join(" ");
  const categorySuggestions = matchTaxonomy(opts.categories || [], taxonomyCorpus, homeUrl);
  const tagSuggestions = matchTaxonomy(opts.tags || [], taxonomyCorpus, homeUrl);

  // ---- Content ----
  const importantHeadings: ProvenanceField<string>[] = [];
  for (const page of pages) {
    const md = getMarkdown(page);
    const h1 = md.match(/^#\s+(.+)$/m);
    if (h1) importantHeadings.push(field(h1[1].trim(), pageUrl(page), null, 60));
  }
  const faqCandidates = faqPage ? extractFaqCandidates(getMarkdown(faqPage), pageUrl(faqPage)) : [];
  const sourceSummaries = pages.map((p) => ({
    url: pageUrl(p),
    summary: getMarkdown(p).replace(/\s+/g, " ").trim().slice(0, 240),
  }));

  // ---- Crawl sources ----
  const crawlSources = pages.map((p) => ({
    url: pageUrl(p),
    status_code: p.status_code ?? null,
    title: p.metadata?.title ?? null,
  }));

  for (const p of pages) {
    if (p.success === false && p.error_message) warnings.push(`${pageUrl(p)}: ${p.error_message}`);
  }
  if (!pricingPage) warnings.push("No pricing page found — pricing fields are empty.");
  if (!faqPage) warnings.push("No FAQ page found — no FAQ candidates extracted.");

  return {
    identity: {
      tool_name_candidate: field(
        opts.discoveryCandidateWebsite ? new URL(opts.discoveryCandidateWebsite).hostname.replace(/^www\./, "").split(".")[0] : null,
        homeUrl, "Derived from hostname", 30,
      ),
      canonical_website: field(homeUrl, homeUrl, "Homepage final redirected URL", 90),
      title: homepage?.metadata?.title ? field(homepage.metadata.title, homeUrl, null, 85) : EMPTY_FIELD,
      meta_description: homepage?.metadata?.description ? field(homepage.metadata.description, homeUrl, null, 80) : EMPTY_FIELD,
      og_title: ogTitle ? field(ogTitle, homeUrl, null, 75) : EMPTY_FIELD,
      og_description: ogDescription ? field(ogDescription, homeUrl, null, 75) : EMPTY_FIELD,
      favicon_candidates: faviconCandidates.slice(0, 5),
      logo_candidates: logoCandidates.slice(0, 5),
    },
    company: {
      company_name: homepage?.metadata?.title ? field(homepage.metadata.title.split(/[-|–]/)[0].trim(), homeUrl, homepage.metadata.title, 35) : EMPTY_FIELD,
      about_text: aboutMd ? field(aboutMd.replace(/\s+/g, " ").trim().slice(0, 500), aboutPage ? pageUrl(aboutPage) : homeUrl, null, 55) : EMPTY_FIELD,
      founded_year_candidate: foundedMatch ? field(foundedMatch[1], homeUrl, foundedMatch[0], 50) : EMPTY_FIELD,
      headquarters_candidate: hqMatch ? field(hqMatch[1].trim(), homeUrl, hqMatch[0], 45) : EMPTY_FIELD,
      company_size_candidate: sizeMatch ? field(sizeMatch[1], homeUrl, sizeMatch[0], 40) : EMPTY_FIELD,
      social_links: socialLinks.slice(0, 10),
    },
    pricing: {
      pricing_page_url: pricingUrl ? field(pricingUrl, pricingUrl, null, 90) : EMPTY_FIELD,
      pricing_model_candidate: pricingModelClassification
        ? field(pricingModelClassification.model, pricingUrl, pricingModelClassification.evidence, pricingModelClassification.confidence)
        : EMPTY_FIELD,
      starting_price_candidate: startingPrice ? field(startingPrice, pricingUrl, startingPrice, planEntries.length > 0 ? 60 : 45) : EMPTY_FIELD,
      free_plan_evidence: freePlanMatch ? field(freePlanMatch[0], pricingUrl, freePlanMatch[0], 55) : EMPTY_FIELD,
      free_trial_evidence: freeTrialMatch ? field(freeTrialMatch[0], pricingUrl, freeTrialMatch[0], 55) : EMPTY_FIELD,
      // Each entry pairs a real plan name with its own price in one string
      // (e.g. "Pro — $25/mo") rather than two disconnected lists — kept as
      // plain ProvenanceField<string> so no downstream consumer (review UI,
      // buildAutoApproveReviewState, AI enrichment grounded_evidence) needs
      // to change. Deliberately empty (not a noisy fallback) when no block
      // both looks like a plan AND has a nearby price — see
      // analyzePricingBlocks.
      plan_candidates: planEntries.map((e) => field(`${e.name} — ${e.price}`, pricingUrl, e.evidence, 60)),
      raw_pricing_evidence: priceMatches.length ? field(priceMatches.slice(0, 10).join(", "), pricingUrl, null, 40) : EMPTY_FIELD,
    },
    product: {
      feature_candidates: featureHeadings.slice(0, 15).map((h) => field(h, featuresPage ? pageUrl(featuresPage) : null, null, 40)),
      use_case_candidates: [],
      platform_indicators: [],
      integrations: integrationNames.slice(0, 20).map((n) => field(n, integrationsPage ? pageUrl(integrationsPage) : null, null, 35)),
      docs_api_indicators: docsIndicators.slice(0, 5),
      api_documentation: apiDocumentation,
      languages: languageCandidates.slice(0, 10),
      security_indicators: securityIndicators.slice(0, 10),
      support_channels: supportChannels.slice(0, 10),
    },
    content: {
      faq_candidates: faqCandidates,
      important_headings: importantHeadings.slice(0, 10),
      source_summaries: sourceSummaries.slice(0, 10),
    },
    assets: {
      screenshot_candidates: screenshotCandidates.slice(0, 10),
      image_candidates: imageCandidates.slice(0, 20),
      logo_candidates: logoCandidates.slice(0, 5),
    },
    taxonomy: {
      category_suggestions: categorySuggestions,
      tag_suggestions: tagSuggestions,
    },
    crawl_sources: crawlSources,
    warnings,
  };
}

// Bounded raw snapshot for audit/debugging — never the full unbounded raw
// response. Truncates per-page HTML and flags truncation explicitly.
const RAW_SNAPSHOT_MAX_BYTES_PER_PAGE = 20_000;

export function buildBoundedRawSnapshot(raw: Crawl4aiRawResponse): unknown {
  const pages = (raw.results || []).map((p) => {
    const html = p.html || "";
    const truncated = html.length > RAW_SNAPSHOT_MAX_BYTES_PER_PAGE;
    return {
      url: p.url,
      status_code: p.status_code ?? null,
      html_snapshot: html.slice(0, RAW_SNAPSHOT_MAX_BYTES_PER_PAGE),
      html_truncated: truncated,
      html_original_length: html.length,
    };
  });
  return { success: raw.success, pages };
}
