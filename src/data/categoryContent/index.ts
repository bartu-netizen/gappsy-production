import type { CategoryExtendedContent } from './types';

// Registry of per-category hand-authored editorial content (buyer's guide,
// FAQs, selection criteria, methodology) — same pattern as
// src/data/toolContent/index.ts. Starts empty: no category has editorial
// copy yet, and none is fabricated to fill the UI. A category with no entry
// here simply renders the baseline hub/detail layout from real DB fields
// only, so this is purely additive and can never regress an existing
// published category. Every section that reads from this overlay is
// conditionally rendered, and FAQPage JSON-LD is only emitted when
// `faqs.length > 0`.
const CATEGORY_CONTENT: Record<string, CategoryExtendedContent> = {};

export function getCategoryContent(slug: string): CategoryExtendedContent | undefined {
  return CATEGORY_CONTENT[slug];
}
