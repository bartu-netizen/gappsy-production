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
}

export interface ComparisonFAQ {
  question: string;
  answer: string;
}

export interface ToolComparisonContent {
  // Concise, nuanced summary — never a blanket "X wins" declaration.
  verdict: string;
  // Context-specific recommendation for when each tool is the better fit.
  bestForToolA: string;
  bestForToolB: string;
  keyDifferences: ComparisonDifference[];
  faqs: ComparisonFAQ[];
}
