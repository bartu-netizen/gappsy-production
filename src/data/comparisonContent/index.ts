import type { ToolComparisonContent } from './types';
import canvaVsFigmaContent from './canva-vs-figma';
import canvaVsPhotoshopContent from './canva-vs-photoshop';
import adobeExpressVsCanvaContent from './adobe-express-vs-canva';
import canvaVsVistacreateContent from './canva-vs-vistacreate';
import canvaVsMicrosoftDesignerContent from './canva-vs-microsoft-designer';

// Registry of per-comparison editorial content, keyed by canonical slug.
// A published tool_comparisons row with no entry here still renders on
// /compare/:slug using DB-sourced facts only — this is purely additive.
const COMPARISON_CONTENT: Record<string, ToolComparisonContent> = {
  'canva-vs-figma': canvaVsFigmaContent,
  'canva-vs-photoshop': canvaVsPhotoshopContent,
  'adobe-express-vs-canva': adobeExpressVsCanvaContent,
  'canva-vs-vistacreate': canvaVsVistacreateContent,
  'canva-vs-microsoft-designer': canvaVsMicrosoftDesignerContent,
};

export function getComparisonContent(slug: string): ToolComparisonContent | undefined {
  return COMPARISON_CONTENT[slug];
}

export type { ToolComparisonContent, ComparisonDifference, ComparisonFAQ } from './types';
