// Builds the grounded input contract for one tool: existing draft values +
// ONLY reviewed (approved/edited) crawl evidence + existing taxonomy +
// existing child-table content. Never sends raw HTML or unreviewed crawl
// candidates — this is the boundary that keeps the model from working off
// unverified data.

// deno-lint-ignore-file no-explicit-any
/* eslint-disable @typescript-eslint/no-explicit-any -- untyped Supabase rows + extraction tree walk throughout this file */
import type { SupabaseClient } from "npm:@supabase/supabase-js@2.57.4";
import type { NormalizedExtraction, ProvenanceField } from "./crawlExtractionAdapter.ts";
import {
  ALL_FIELD_KEYS,
  FIELD_REGISTRY,
  GroundedEvidenceItem,
  MAX_EVIDENCE_SNIPPET_LENGTH,
  MAX_SOURCE_URLS_PER_FIELD,
  ToolExportInput,
} from "./enrichmentSchema.ts";

interface ReviewStateEntry {
  status: "pending" | "approved" | "rejected" | "edited";
  edited_value?: unknown;
}
type ReviewState = Record<string, ReviewStateEntry>;

function isFaqCandidate(v: unknown): v is { question: string; answer: string; source_url: string; confidence: number } {
  return !!v && typeof v === "object" && "question" in (v as Record<string, unknown>) && "answer" in (v as Record<string, unknown>);
}

function isProvenanceField(v: unknown): v is ProvenanceField<unknown> {
  return !!v && typeof v === "object" && "confidence" in (v as Record<string, unknown>) && !isFaqCandidate(v);
}

function resolvedValue(path: string, f: ProvenanceField<unknown>, reviewState: ReviewState): { value: unknown; approved: boolean } {
  const entry = reviewState[path];
  if (!entry || entry.status === "pending" || entry.status === "rejected") {
    return { value: f.value, approved: entry?.status === "approved" };
  }
  if (entry.status === "approved") return { value: f.value, approved: true };
  if (entry.status === "edited") return { value: entry.edited_value, approved: true };
  return { value: f.value, approved: false };
}

// FaqCandidate has no `.value` — the question/answer pair itself is the
// payload, so it needs its own resolver rather than reusing ProvenanceField's.
function resolvedFaqValue(path: string, faq: { question: string; answer: string }, reviewState: ReviewState): { value: unknown; approved: boolean } {
  const entry = reviewState[path];
  if (!entry || entry.status === "pending" || entry.status === "rejected") return { value: null, approved: false };
  if (entry.status === "approved") return { value: { question: faq.question, answer: faq.answer }, approved: true };
  if (entry.status === "edited") return { value: entry.edited_value, approved: true };
  return { value: null, approved: false };
}

// Walks an extraction tree, collecting only fields marked approved/edited in
// review_state, grouped by "group.field" (array items collapse into the
// same group.field bucket so the model sees them as a candidate list).
function collectApprovedEvidence(extraction: NormalizedExtraction, reviewState: ReviewState): Record<string, GroundedEvidenceItem[]> {
  const out: Record<string, GroundedEvidenceItem[]> = {};
  const push = (bucket: string, item: GroundedEvidenceItem) => {
    if (!out[bucket]) out[bucket] = [];
    out[bucket].push(item);
  };

  for (const [groupName, group] of Object.entries(extraction) as [string, any][]) {
    if (groupName === "crawl_sources" || groupName === "warnings") continue;
    if (Array.isArray(group)) continue;
    for (const [fieldName, value] of Object.entries(group as Record<string, unknown>)) {
      const bucket = `${groupName}.${fieldName}`;
      if (Array.isArray(value)) {
        value.forEach((item, idx) => {
          const path = `${groupName}.${fieldName}[${idx}]`;
          if (isFaqCandidate(item)) {
            const resolved = resolvedFaqValue(path, item, reviewState);
            if (resolved.approved && resolved.value !== null && resolved.value !== undefined) {
              push(bucket, {
                value: resolved.value,
                source_url: item.source_url ?? null,
                evidence: null,
                confidence: item.confidence ?? 0,
              });
            }
            return;
          }
          if (!isProvenanceField(item)) return;
          const resolved = resolvedValue(path, item, reviewState);
          if (resolved.approved && resolved.value !== null && resolved.value !== undefined) {
            push(bucket, {
              value: resolved.value,
              source_url: item.source_url,
              evidence: item.evidence ? item.evidence.slice(0, MAX_EVIDENCE_SNIPPET_LENGTH) : null,
              confidence: item.confidence,
            });
          }
        });
      } else if (isProvenanceField(value)) {
        const path = `${groupName}.${fieldName}`;
        const resolved = resolvedValue(path, value, reviewState);
        if (resolved.approved && resolved.value !== null && resolved.value !== undefined) {
          push(bucket, {
            value: resolved.value,
            source_url: value.source_url,
            evidence: value.evidence ? value.evidence.slice(0, MAX_EVIDENCE_SNIPPET_LENGTH) : null,
            confidence: value.confidence,
          });
        }
      }
    }
  }

  // Bound: cap each bucket's item count and each item's source URL fan-out
  // so a batch export can never balloon on a single tool.
  for (const bucket of Object.keys(out)) {
    out[bucket] = out[bucket].slice(0, MAX_SOURCE_URLS_PER_FIELD);
  }
  return out;
}

const TOOLS_EXISTING_VALUE_COLUMNS = [
  "short_description", "long_description", "best_for", "target_audience",
  "pricing_summary", "features_summary", "integrations_summary", "company_summary",
  "editorial_verdict", "seo_title", "seo_meta_description", "llm_readable_summary",
  "pricing_model", "starting_price", "founded_year", "headquarters", "company_size", "languages",
];

export async function buildToolExportInput(
  supabase: SupabaseClient,
  toolId: string,
  requestedFields: string[],
): Promise<ToolExportInput> {
  const fields = requestedFields.length > 0 ? requestedFields.filter((k) => Object.prototype.hasOwnProperty.call(FIELD_REGISTRY, k)) : ALL_FIELD_KEYS;

  const { data: tool, error: toolError } = await supabase
    .from("tools")
    .select(`id, name, slug, ${TOOLS_EXISTING_VALUE_COLUMNS.join(", ")}`)
    .eq("id", toolId)
    .single();
  if (toolError || !tool) throw new Error(`Tool ${toolId} not found`);

  const existingValues: Record<string, unknown> = {};
  for (const col of TOOLS_EXISTING_VALUE_COLUMNS) existingValues[col] = (tool as any)[col] ?? null;

  const [prosRes, consRes, useCasesRes, faqsRes, categoryLinksRes, tagLinksRes, pricingPlansRes] = await Promise.all([
    supabase.from("tool_pros").select("text").eq("tool_id", toolId),
    supabase.from("tool_cons").select("text").eq("tool_id", toolId),
    supabase.from("tool_use_cases").select("title, description, audience").eq("tool_id", toolId),
    supabase.from("tool_faqs").select("question, answer").eq("tool_id", toolId),
    supabase.from("tool_category_links").select("category_id").eq("tool_id", toolId),
    supabase.from("tool_tag_links").select("tag_id").eq("tool_id", toolId),
    supabase.from("tool_pricing_plans").select("plan_name, price, billing_cycle").eq("tool_id", toolId),
  ]);
  existingValues.pros = (prosRes.data || []).map((r: any) => r.text);
  existingValues.cons = (consRes.data || []).map((r: any) => r.text);
  existingValues.use_cases = useCasesRes.data || [];
  existingValues.faqs = faqsRes.data || [];
  existingValues.category_ids = (categoryLinksRes.data || []).map((r: any) => r.category_id);
  existingValues.tag_ids = (tagLinksRes.data || []).map((r: any) => r.tag_id);
  existingValues.pricing_plans = pricingPlansRes.data || [];

  // Most recent crawl job that produced this tool draft (if any) — reviewed
  // evidence only, per the input-contract rule.
  let groundedEvidence: Record<string, GroundedEvidenceItem[]> = {};
  const { data: crawlJob } = await supabase
    .from("crawl_jobs")
    .select("normalized_extraction, review_state")
    .eq("created_draft_tool_id", toolId)
    .not("normalized_extraction", "is", null)
    .order("completed_at", { ascending: false })
    .limit(1)
    .maybeSingle();
  if (crawlJob?.normalized_extraction) {
    groundedEvidence = collectApprovedEvidence(
      crawlJob.normalized_extraction as NormalizedExtraction,
      (crawlJob.review_state || {}) as ReviewState,
    );
  }

  const missingFields = fields.filter((key) => {
    const def = FIELD_REGISTRY[key];
    const hasExisting = def.applyTarget.kind === "tools_column"
      ? Boolean(existingValues[def.applyTarget.column])
      : Array.isArray((existingValues as any)[key]) ? (existingValues as any)[key].length > 0 : false;
    return !hasExisting && Object.keys(groundedEvidence).length === 0;
  });

  const [categoriesRes, tagsRes] = await Promise.all([
    supabase.from("tool_categories").select("id, slug, name").eq("status", "published").order("name"),
    supabase.from("tool_tags").select("id, slug, name").order("name"),
  ]);

  return {
    tool_id: toolId,
    name: (tool as any).name,
    slug: (tool as any).slug,
    existing_values: existingValues,
    grounded_evidence: groundedEvidence,
    missing_fields: missingFields,
    requested_fields: fields,
    taxonomy: {
      categories: categoriesRes.data || [],
      tags: tagsRes.data || [],
    },
  };
}
