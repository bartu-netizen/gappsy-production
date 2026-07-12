// Builds the "Claude Code Batch Package" — the single self-contained bundle
// an admin copies into a fresh Claude Code conversation. Every piece
// (master prompt, input JSON, output schema, validation rules) is derived
// from a versioned enrichment_prompt_versions row plus the grounded input
// built by enrichmentInputBuilder.ts — nothing here talks to a database.

import type { ExportInputJson, ExportPackage, ToolExportInput } from "./enrichmentSchema.ts";

export interface PromptVersionRow {
  id: string;
  prompt_key: string;
  version: number;
  system_template: string;
  user_template: string;
  output_schema: Record<string, unknown>;
}

const VALIDATION_RULES: string[] = [
  "Never invent facts. Ground every factual field in the provided evidence or explicit source URLs.",
  "If evidence is missing for a field, set value to null, unsupported to true, and explain what's missing in reason.",
  "Editorial fields (best_for, target_audience, pros, cons, editorial_verdict) are Gappsy's own editorial judgment — write them as such and classify them \"editorial\".",
  "Never generate or alter rating, review_count, popularity/traffic/market-share claims, or unsupported comparisons.",
  "Category and tag suggestions must come only from the taxonomy list provided in the input JSON — never invent a new one.",
  "Only generate the fields listed in each tool's requested_fields — omit everything else.",
  "confidence must be an integer 0-100. classification must be exactly \"factual\" or \"editorial\".",
  "Output strictly valid JSON matching output_schema below. No prose, no markdown fences, no commentary outside the JSON object.",
  "Return one entry in results for every tool_id in the input, even if every field for that tool is unsupported.",
];

export function buildExportPackage(promptVersion: PromptVersionRow, tools: ToolExportInput[], batchId: string): ExportPackage {
  const inputJson: ExportInputJson = {
    batch_id: batchId,
    prompt_version: { key: promptVersion.prompt_key, version: promptVersion.version },
    tools,
  };

  const masterPrompt = [
    promptVersion.system_template.trim(),
    "",
    promptVersion.user_template.trim(),
  ].join("\n\n");

  const combinedMarkdown = [
    `# Gappsy AI Enrichment — Batch ${batchId}`,
    "",
    "Paste this entire document into a new Claude Code conversation. Copy only the JSON result Claude Code produces back into the Gappsy admin \"Import Results\" screen — nothing else.",
    "",
    "## Instructions",
    masterPrompt,
    "",
    "## Validation rules",
    ...VALIDATION_RULES.map((rule) => `- ${rule}`),
    "",
    "## Output schema",
    "```json",
    JSON.stringify(promptVersion.output_schema, null, 2),
    "```",
    "",
    "## Input JSON",
    "```json",
    JSON.stringify(inputJson, null, 2),
    "```",
  ].join("\n");

  return {
    master_prompt: masterPrompt,
    input_json: inputJson,
    output_schema: promptVersion.output_schema,
    validation_rules: VALIDATION_RULES,
    combined_markdown: combinedMarkdown,
  };
}
