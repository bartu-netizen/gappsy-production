// Shared content contract for hand-authored group comparison (3+ tool)
// editorial content — the N-ary counterpart to
// src/data/comparisonContent/types.ts. Every approved group comparison (see
// supabase tool_group_comparisons) that has enough real, defensible
// editorial substance gets one file here, registered in index.ts by
// canonical slug. A group comparison with no entry here still renders on
// /compare/:slug using DB-sourced facts only (pricing, rating,
// platforms, tags per member tool); the sections below are additive, never
// required for the page to render.

export interface GroupComparisonFAQ {
  question: string;
  answer: string;
}

// A single standout point across the group — unlike pairwise
// keyDifferences (which contrasts exactly two "toolA"/"toolB" sides), this
// names which member tool(s) the point applies to by slug so it scales to
// any group size.
export interface GroupComparisonHighlight {
  title: string;
  description: string;
  toolSlugs: string[];
}

export type FeatureStatus = 'available' | 'limited' | 'unavailable' | 'not-documented';

// statuses is keyed by tool slug so row order is independent of member
// order and rows stay valid even if members are re-sorted.
export interface GroupComparisonFeatureMatrixRow {
  feature: string;
  statuses: Record<string, FeatureStatus>;
  note?: string;
}

export interface GroupComparisonFeatureMatrixGroup {
  group: string;
  rows: GroupComparisonFeatureMatrixRow[];
}

export interface GroupComparisonContent {
  // Concise, nuanced summary — never a blanket "X wins" declaration.
  verdict: string;
  // Per-tool "best for" recommendation, keyed by slug.
  bestFor: Record<string, string>;
  highlights: GroupComparisonHighlight[];
  featureMatrix: GroupComparisonFeatureMatrixGroup[];
  faqs: GroupComparisonFAQ[];
}
