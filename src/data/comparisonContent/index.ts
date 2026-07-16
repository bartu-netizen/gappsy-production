import type { ToolComparisonContent } from './types';
import adobeExpressVsCanvaContent from './adobe-express-vs-canva';
import boltNewVsV0Content from './bolt-new-vs-v0';
import canvaVsFigmaContent from './canva-vs-figma';
import canvaVsMicrosoftDesignerContent from './canva-vs-microsoft-designer';
import canvaVsPhotoshopContent from './canva-vs-photoshop';
import canvaVsVistacreateContent from './canva-vs-vistacreate';
import chatgptVsClaudeContent from './chatgpt-vs-claude';
import chatgptVsGoogleGeminiContent from './chatgpt-vs-google-gemini';
import chatgptVsPerplexityContent from './chatgpt-vs-perplexity';
import claudeVsGoogleGeminiContent from './claude-vs-google-gemini';
import cursorVsGithubCopilotContent from './cursor-vs-github-copilot';
import cursorVsWindsurfContent from './cursor-vs-windsurf';
import dallEVsMidjourneyContent from './dall-e-vs-midjourney';
import dallEVsStableDiffusionContent from './dall-e-vs-stable-diffusion';
import descriptVsVeedContent from './descript-vs-veed';
import githubCopilotVsWindsurfContent from './github-copilot-vs-windsurf';
import heygenVsSynthesiaContent from './heygen-vs-synthesia';
import klingAiVsRunwayContent from './kling-ai-vs-runway';
import lovableVsReplitContent from './lovable-vs-replit';
import midjourneyVsStableDiffusionContent from './midjourney-vs-stable-diffusion';
import pikaVsRunwayContent from './pika-vs-runway';

// Registry of per-comparison editorial content, keyed by canonical slug.
// A published tool_comparisons row with no entry here still renders on
// /compare/:slug using DB-sourced facts only — this is purely additive.
const COMPARISON_CONTENT: Record<string, ToolComparisonContent> = {
  'adobe-express-vs-canva': adobeExpressVsCanvaContent,
  'bolt-new-vs-v0': boltNewVsV0Content,
  'canva-vs-figma': canvaVsFigmaContent,
  'canva-vs-microsoft-designer': canvaVsMicrosoftDesignerContent,
  'canva-vs-photoshop': canvaVsPhotoshopContent,
  'canva-vs-vistacreate': canvaVsVistacreateContent,
  'chatgpt-vs-claude': chatgptVsClaudeContent,
  'chatgpt-vs-google-gemini': chatgptVsGoogleGeminiContent,
  'chatgpt-vs-perplexity': chatgptVsPerplexityContent,
  'claude-vs-google-gemini': claudeVsGoogleGeminiContent,
  'cursor-vs-github-copilot': cursorVsGithubCopilotContent,
  'cursor-vs-windsurf': cursorVsWindsurfContent,
  'dall-e-vs-midjourney': dallEVsMidjourneyContent,
  'dall-e-vs-stable-diffusion': dallEVsStableDiffusionContent,
  'descript-vs-veed': descriptVsVeedContent,
  'github-copilot-vs-windsurf': githubCopilotVsWindsurfContent,
  'heygen-vs-synthesia': heygenVsSynthesiaContent,
  'kling-ai-vs-runway': klingAiVsRunwayContent,
  'lovable-vs-replit': lovableVsReplitContent,
  'midjourney-vs-stable-diffusion': midjourneyVsStableDiffusionContent,
  'pika-vs-runway': pikaVsRunwayContent,
};

export function getComparisonContent(slug: string): ToolComparisonContent | undefined {
  return COMPARISON_CONTENT[slug];
}

export type { ToolComparisonContent, ComparisonDifference, ComparisonFAQ } from './types';
