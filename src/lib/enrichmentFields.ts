// Frontend mirror of supabase/functions/_shared/enrichmentSchema.ts's
// FIELD_REGISTRY — labels/classification only (the backend is the source of
// truth for validation; this is display metadata for the review UI and
// queue/batch field pickers). Keep the field key list in sync by hand if
// the backend registry changes.

export interface EnrichmentFieldMeta {
  key: string;
  label: string;
  repeatable: boolean;
  defaultClassification: 'factual' | 'editorial';
}

export const ENRICHMENT_FIELDS: EnrichmentFieldMeta[] = [
  { key: 'short_description', label: 'Short description', repeatable: false, defaultClassification: 'editorial' },
  { key: 'long_description', label: 'Long description / overview', repeatable: false, defaultClassification: 'editorial' },
  { key: 'best_for', label: 'Best for', repeatable: false, defaultClassification: 'editorial' },
  { key: 'target_audience', label: 'Target audience', repeatable: false, defaultClassification: 'editorial' },
  { key: 'use_cases', label: 'Use cases', repeatable: true, defaultClassification: 'editorial' },
  { key: 'pros', label: 'Pros', repeatable: true, defaultClassification: 'editorial' },
  { key: 'cons', label: 'Cons', repeatable: true, defaultClassification: 'editorial' },
  { key: 'pricing_summary', label: 'Pricing summary', repeatable: false, defaultClassification: 'factual' },
  { key: 'features_summary', label: 'Features summary', repeatable: false, defaultClassification: 'factual' },
  { key: 'integrations_summary', label: 'Integrations summary', repeatable: false, defaultClassification: 'factual' },
  { key: 'company_summary', label: 'Company summary', repeatable: false, defaultClassification: 'factual' },
  { key: 'editorial_verdict', label: 'Editorial verdict', repeatable: false, defaultClassification: 'editorial' },
  { key: 'faqs', label: 'FAQ drafts', repeatable: true, defaultClassification: 'factual' },
  { key: 'seo_title', label: 'SEO title', repeatable: false, defaultClassification: 'editorial' },
  { key: 'seo_meta_description', label: 'Meta description', repeatable: false, defaultClassification: 'editorial' },
  { key: 'llm_readable_summary', label: 'LLM-readable summary', repeatable: false, defaultClassification: 'factual' },
  { key: 'category_suggestions', label: 'Category suggestions', repeatable: true, defaultClassification: 'editorial' },
  { key: 'tag_suggestions', label: 'Tag suggestions', repeatable: true, defaultClassification: 'editorial' },
];

const BY_KEY = new Map(ENRICHMENT_FIELDS.map((f) => [f.key, f]));

export function enrichmentFieldLabel(key: string): string {
  return BY_KEY.get(key)?.label || key;
}

export const ALL_ENRICHMENT_FIELD_KEYS = ENRICHMENT_FIELDS.map((f) => f.key);

export const BATCH_SIZE_PRESETS = [1, 10, 50, 100];

const SCALAR_COLUMN_KEYS = new Set([
  'short_description', 'long_description', 'best_for', 'target_audience',
  'pricing_summary', 'features_summary', 'integrations_summary', 'company_summary',
  'editorial_verdict', 'seo_title', 'seo_meta_description', 'llm_readable_summary',
]);

// Reads the CURRENT Tool Draft value for a given enrichment field key, from
// the shape admin-tools' GET single-tool response returns (see
// supabase/functions/admin-tools/index.ts) — used by the review screen's
// diff viewer.
export function currentValueOf(tool: Record<string, unknown> | null | undefined, fieldKey: string): unknown {
  if (!tool) return null;
  if (SCALAR_COLUMN_KEYS.has(fieldKey)) return tool[fieldKey] ?? null;
  if (fieldKey === 'pros') return tool.pros ?? [];
  if (fieldKey === 'cons') return tool.cons ?? [];
  if (fieldKey === 'use_cases') return tool.use_cases ?? [];
  if (fieldKey === 'faqs') return tool.faqs ?? [];
  if (fieldKey === 'category_suggestions') return ((tool.categories as { name: string }[]) || []).map((c) => c.name);
  if (fieldKey === 'tag_suggestions') return ((tool.tags as { name: string }[]) || []).map((t) => t.name);
  return null;
}
