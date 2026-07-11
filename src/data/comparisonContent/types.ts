// Shared content contract for hand-authored comparison editorial content.
// Every approved comparison (see supabase tool_comparisons) that has enough
// real, defensible editorial substance gets one file here, registered in
// index.ts by canonical slug — mirrors src/data/toolContent's pattern.
// A comparison with no entry here still renders on /compare/:slug using
// DB-sourced facts only (pricing, rating, platforms, tags); the sections
// below are additive, never required for the page to render.

export interface ComparisonDifference {
  title: string;
  toolA: string;
  toolB: string;
  // Why this difference is worth caring about, and which kind of user it
  // actually affects — turns a bare fact into a decision-relevant one.
  whyItMatters: string;
  benefitsWho: string;
}

export interface ComparisonFAQ {
  question: string;
  answer: string;
}

// 'not-documented' is the honest default for anything neither tool's
// toolContent/DB facts actually state — never inferred or guessed.
export type FeatureStatus = 'available' | 'limited' | 'unavailable' | 'not-documented';

export interface FeatureMatrixRow {
  feature: string;
  toolA: FeatureStatus;
  toolB: FeatureStatus;
  note?: string;
}

export interface FeatureMatrixGroup {
  group: string;
  rows: FeatureMatrixRow[];
}

export interface ToolComparisonContent {
  // Concise, nuanced summary — never a blanket "X wins" declaration.
  verdict: string;
  // Context-specific recommendation for when each tool is the better fit.
  bestForToolA: string;
  bestForToolB: string;
  // Who should skip picking one and expect to use both.
  whoNeedsBoth: string;
  keyDifferences: ComparisonDifference[];
  featureMatrix: FeatureMatrixGroup[];
  faqs: ComparisonFAQ[];
}
