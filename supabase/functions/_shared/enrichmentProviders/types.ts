// Provider-agnostic contract for the AI Enrichment Engine. Every enrichment
// code path (export, import, review, apply) talks only to this interface —
// never to a specific vendor SDK. Adding a live API provider later (OpenAI,
// Anthropic, Gemini) means writing one new file that implements this
// interface and registering it in registry.ts; nothing else changes.

import type { ExportPackage, ImportFieldResult, ToolExportInput } from "../enrichmentSchema.ts";
import type { PromptVersionRow } from "../enrichmentPromptBuilder.ts";

export type ProviderMode = "manual_batch" | "live_api";

export interface UsageInfo {
  input_tokens: number | null;
  output_tokens: number | null;
  total_tokens: number | null;
  estimated_cost_usd: number | null;
}

export interface SafeError {
  error_code: string;
  error_message: string;
}

export interface ParsedProviderResult {
  results: { tool_id: string; fields: ImportFieldResult[] }[];
  issues: { tool_id: string | null; field_key: string | null; reason: string }[];
  usage?: UsageInfo;
}

export interface EnrichmentProvider {
  readonly key: string;
  readonly mode: ProviderMode;
  readonly label: string;

  /** Builds the request/export package. Every provider implements this —
   *  for a manual_batch provider it IS the deliverable; a live_api provider
   *  can use the same shape as its request body. */
  buildExportPackage(promptVersion: PromptVersionRow, tools: ToolExportInput[], batchId: string): ExportPackage;

  /** Only implemented by live_api providers — calls the vendor API and
   *  returns its raw response. manual_batch providers omit this; callers
   *  must check `mode` before invoking it. */
  generate?(exportPackage: ExportPackage): Promise<unknown>;

  /** Validates + normalizes a raw result (either a live API response or a
   *  pasted-back batch result) into the shared field-suggestion shape. */
  parseResult(raw: unknown, expectedToolIds: Set<string>, requestedFieldsByTool: Map<string, string[]>): ParsedProviderResult;

  normalizeUsage?(raw: unknown): UsageInfo;
  normalizeErrors(err: unknown): SafeError;
}

export class ProviderNotImplementedError extends Error {
  constructor(providerKey: string) {
    super(`Provider "${providerKey}" is not implemented yet.`);
    this.name = "ProviderNotImplementedError";
  }
}
