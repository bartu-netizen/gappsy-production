import type { ToolExtendedContent } from './types';
import canvaContent from './canva';
import figmaContent from './figma';

// Registry of per-tool extended content. Every future flagship listing adds
// one entry here — a tool with no entry simply renders the baseline
// ToolDetailPage layout (DB fields only), so this is fully additive and can
// never regress an existing published tool.
const TOOL_CONTENT: Record<string, ToolExtendedContent> = {
  canva: canvaContent,
  figma: figmaContent,
};

export function getToolContent(slug: string): ToolExtendedContent | undefined {
  return TOOL_CONTENT[slug];
}
