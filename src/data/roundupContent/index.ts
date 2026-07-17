import type { RoundupContent } from './types';

// Registry of per-roundup editorial content, keyed by canonical slug.
// A published tool_roundups row with no entry here still renders on
// /roundup/:slug using DB-sourced facts only — this is purely additive.
// Mirrors src/data/comparisonContent/index.ts's pattern; regenerate this
// file the same way (one import + one registry entry per roundup) when a
// roundup-content generation script is added.
const ROUNDUP_CONTENT: Record<string, RoundupContent> = {};

export function getRoundupContent(slug: string): RoundupContent | undefined {
  return ROUNDUP_CONTENT[slug];
}

export type { RoundupContent, RoundupHighlight, RoundupFAQ, RoundupFeatureMatrixGroup, RoundupFeatureMatrixRow, FeatureStatus } from './types';
