import type { ToolComparisonContent } from './types';
import canvaVsFigmaContent from './canva-vs-figma';

// Registry of per-comparison editorial content, keyed by canonical slug.
// A published tool_comparisons row with no entry here still renders on
// /compare/:slug using DB-sourced facts only — this is purely additive.
const COMPARISON_CONTENT: Record<string, ToolComparisonContent> = {
  'canva-vs-figma': canvaVsFigmaContent,
};

export function getComparisonContent(slug: string): ToolComparisonContent | undefined {
  return COMPARISON_CONTENT[slug];
}

export type { ToolComparisonContent, ComparisonDifference, ComparisonFAQ } from './types';
