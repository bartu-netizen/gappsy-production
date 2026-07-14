// AI Enrichment Engine — the field-key contract. Every enrichment field key
// used anywhere in the system (export packages, import validation, review
// UI, apply-to-tool) is registered here exactly once. Nothing outside this
// file should hardcode the list of enrichable fields.
//
// `applyTarget` says where an approved suggestion is written by
// enrichmentApply.ts: a scalar `tools` column (direct PUT), a repeatable
// child table (merge-append, never wholesale replace), or the tool's
// category/tag taxonomy links (union, never replace).

export type FieldClassification = "factual" | "editorial";

export type ApplyTarget =
  | { kind: "tools_column"; column: string }
  | { kind: "child_table"; table: "tool_pros" | "tool_cons" }
  | { kind: "use_cases" }
  | { kind: "faqs" }
  | { kind: "features" }
  | { kind: "integrations" }
  | { kind: "pricing_plans" }
  | { kind: "category_suggestions" }
  | { kind: "tag_suggestions" };

export interface FieldDefinition {
  key: string;
  label: string;
  description: string;
  defaultClassification: FieldClassification;
  repeatable: boolean;
  applyTarget: ApplyTarget;
  maxValueLength?: number;
}

export const FIELD_REGISTRY: Record<string, FieldDefinition> = {
  short_description: {
    key: "short_description",
    label: "Short description",
    description: "One or two sentence summary of what the tool does.",
    defaultClassification: "editorial",
    repeatable: false,
    applyTarget: { kind: "tools_column", column: "short_description" },
    maxValueLength: 300,
  },
  long_description: {
    key: "long_description",
    label: "Long description / overview",
    description: "Full 'what is this tool' editorial overview.",
    defaultClassification: "editorial",
    repeatable: false,
    applyTarget: { kind: "tools_column", column: "long_description" },
    maxValueLength: 4000,
  },
  best_for: {
    key: "best_for",
    label: "Best for",
    description: "Gappsy's editorial judgment of who this tool suits best.",
    defaultClassification: "editorial",
    repeatable: false,
    applyTarget: { kind: "tools_column", column: "best_for" },
    maxValueLength: 500,
  },
  target_audience: {
    key: "target_audience",
    label: "Target audience",
    description: "Gappsy's editorial judgment of the intended user base.",
    defaultClassification: "editorial",
    repeatable: false,
    applyTarget: { kind: "tools_column", column: "target_audience" },
    maxValueLength: 500,
  },
  use_cases: {
    key: "use_cases",
    label: "Use cases",
    description: "Concrete use cases, each with a title/description/audience.",
    defaultClassification: "editorial",
    repeatable: true,
    applyTarget: { kind: "use_cases" },
  },
  pros: {
    key: "pros",
    label: "Pros",
    description: "Editorial pros — Gappsy's judgment, not a factual claim.",
    defaultClassification: "editorial",
    repeatable: true,
    applyTarget: { kind: "child_table", table: "tool_pros" },
    maxValueLength: 300,
  },
  cons: {
    key: "cons",
    label: "Cons",
    description: "Editorial cons — Gappsy's judgment, not a factual claim.",
    defaultClassification: "editorial",
    repeatable: true,
    applyTarget: { kind: "child_table", table: "tool_cons" },
    maxValueLength: 300,
  },
  features: {
    key: "features",
    label: "Features",
    description: "Individual product features, each with a title and short description — grounded in evidence.",
    defaultClassification: "factual",
    repeatable: true,
    applyTarget: { kind: "features" },
  },
  integrations: {
    key: "integrations",
    label: "Integrations",
    description: "Third-party tools/services this product integrates with — grounded in evidence.",
    defaultClassification: "factual",
    repeatable: true,
    applyTarget: { kind: "integrations" },
  },
  pricing_plans: {
    key: "pricing_plans",
    label: "Pricing plans",
    description: "Structured pricing tiers, each with plan_name, price, billing_cycle, a short description, and a features array (plain strings) — grounded in evidence. Distinct from pricing_summary (prose); this populates the actual pricing table shown on the page.",
    defaultClassification: "factual",
    repeatable: true,
    applyTarget: { kind: "pricing_plans" },
  },
  pricing_summary: {
    key: "pricing_summary",
    label: "Pricing summary",
    description: "Prose synthesis of pricing evidence — must cite sources.",
    defaultClassification: "factual",
    repeatable: false,
    applyTarget: { kind: "tools_column", column: "pricing_summary" },
    maxValueLength: 1500,
  },
  features_summary: {
    key: "features_summary",
    label: "Features summary",
    description: "Prose synthesis of feature evidence — must cite sources.",
    defaultClassification: "factual",
    repeatable: false,
    applyTarget: { kind: "tools_column", column: "features_summary" },
    maxValueLength: 1500,
  },
  integrations_summary: {
    key: "integrations_summary",
    label: "Integrations summary",
    description: "Prose synthesis of integration evidence — must cite sources.",
    defaultClassification: "factual",
    repeatable: false,
    applyTarget: { kind: "tools_column", column: "integrations_summary" },
    maxValueLength: 1500,
  },
  company_summary: {
    key: "company_summary",
    label: "Company summary",
    description: "Prose synthesis of company evidence — must cite sources.",
    defaultClassification: "factual",
    repeatable: false,
    applyTarget: { kind: "tools_column", column: "company_summary" },
    maxValueLength: 1500,
  },
  editorial_verdict: {
    key: "editorial_verdict",
    label: "Editorial verdict",
    description: "Gappsy's concise editorial verdict — explicitly opinion, not fact.",
    defaultClassification: "editorial",
    repeatable: false,
    applyTarget: { kind: "tools_column", column: "editorial_verdict" },
    maxValueLength: 1200,
  },
  faqs: {
    key: "faqs",
    label: "FAQ drafts",
    description: "Question/answer pairs grounded in evidence.",
    defaultClassification: "factual",
    repeatable: true,
    applyTarget: { kind: "faqs" },
  },
  seo_title: {
    key: "seo_title",
    label: "SEO title",
    description: "Search-engine title tag suggestion.",
    defaultClassification: "editorial",
    repeatable: false,
    applyTarget: { kind: "tools_column", column: "seo_title" },
    maxValueLength: 70,
  },
  seo_meta_description: {
    key: "seo_meta_description",
    label: "Meta description",
    description: "Search-engine meta description suggestion.",
    defaultClassification: "editorial",
    repeatable: false,
    applyTarget: { kind: "tools_column", column: "seo_meta_description" },
    maxValueLength: 165,
  },
  llm_readable_summary: {
    key: "llm_readable_summary",
    label: "LLM-readable summary",
    description: "Dense, factual, citation-grounded summary for machine consumption.",
    defaultClassification: "factual",
    repeatable: false,
    applyTarget: { kind: "tools_column", column: "llm_readable_summary" },
    maxValueLength: 2000,
  },
  category_suggestions: {
    key: "category_suggestions",
    label: "Category suggestions",
    description: "Suggested categories, chosen only from the existing taxonomy.",
    defaultClassification: "editorial",
    repeatable: true,
    applyTarget: { kind: "category_suggestions" },
  },
  tag_suggestions: {
    key: "tag_suggestions",
    label: "Tag suggestions",
    description: "Suggested tags, chosen only from the existing taxonomy.",
    defaultClassification: "editorial",
    repeatable: true,
    applyTarget: { kind: "tag_suggestions" },
  },
};

export const ALL_FIELD_KEYS = Object.keys(FIELD_REGISTRY);

// Fields the engine must never generate or touch (Phase 6 exclusion list),
// kept here so validation can reject them defensively if a pasted-back
// result ever includes one.
export const FORBIDDEN_FIELD_KEYS = new Set([
  "rating",
  "review_count",
  "editorial_rating",
  "popularity_score",
  "traffic",
  "market_share",
  "user_reviews",
  "customer_claims",
]);

export function isKnownFieldKey(key: string): boolean {
  return Object.prototype.hasOwnProperty.call(FIELD_REGISTRY, key);
}

// ---------------------------------------------------------------------------
// Export package contract (what admin-enrichment-export produces and what
// the master prompt tells Claude Code / a future live provider to return).
// ---------------------------------------------------------------------------

export interface GroundedEvidenceItem {
  value: unknown;
  source_url: string | null;
  evidence: string | null;
  confidence: number;
}

export interface ToolExportInput {
  tool_id: string;
  name: string;
  slug: string;
  existing_values: Record<string, unknown>;
  grounded_evidence: Record<string, GroundedEvidenceItem[]>;
  missing_fields: string[];
  requested_fields: string[];
  taxonomy: {
    categories: { id: string; slug: string; name: string }[];
    tags: { id: string; slug: string; name: string }[];
  };
}

export interface ExportInputJson {
  batch_id: string;
  prompt_version: { key: string; version: number };
  field_definitions: Record<string, { label: string; description: string; repeatable: boolean; classification: FieldClassification }>;
  tools: ToolExportInput[];
}

// Field definitions for exactly the keys referenced across a batch's
// tools — embedded in the export package so Claude Code never has to
// guess what a field_key like "features" vs "features_summary" means.
export function fieldDefinitionsFor(fieldKeys: string[]): ExportInputJson["field_definitions"] {
  const out: ExportInputJson["field_definitions"] = {};
  for (const key of new Set(fieldKeys)) {
    const def = FIELD_REGISTRY[key];
    if (!def) continue;
    out[key] = { label: def.label, description: def.description, repeatable: def.repeatable, classification: def.defaultClassification };
  }
  return out;
}

export interface ExportPackage {
  master_prompt: string;
  input_json: ExportInputJson;
  output_schema: Record<string, unknown>;
  validation_rules: string[];
  combined_markdown: string;
}

// ---------------------------------------------------------------------------
// Import payload contract (what the admin pastes back after running the
// export package through Claude Code).
// ---------------------------------------------------------------------------

export interface ImportFieldResult {
  field_key: string;
  value: unknown;
  confidence: number;
  reason?: string;
  source_urls?: string[];
  evidence?: string;
  classification: FieldClassification;
  unsupported?: boolean;
  warnings?: string[];
}

export interface ImportToolResult {
  tool_id: string;
  fields: ImportFieldResult[];
}

export interface ImportPayload {
  batch_id?: string;
  results: ImportToolResult[];
}

export const MAX_BATCH_SIZE_HARD_CEILING = 250;
export const MAX_SOURCE_URLS_PER_FIELD = 5;
export const MAX_EVIDENCE_SNIPPET_LENGTH = 300;
