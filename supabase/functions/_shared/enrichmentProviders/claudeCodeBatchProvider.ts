// The only provider implemented today: a human-in-the-loop batch workflow
// that uses the admin's own Claude Code / Claude Max subscription instead of
// a metered API. No API key, no server-side LLM call — `generate` is
// intentionally absent (mode: "manual_batch").

import { buildExportPackage, PromptVersionRow } from "../enrichmentPromptBuilder.ts";
import { validateImportPayload } from "../enrichmentValidation.ts";
import { ExportPackage, ToolExportInput } from "../enrichmentSchema.ts";
import { EnrichmentProvider, ParsedProviderResult, SafeError } from "./types.ts";

export const claudeCodeBatchProvider: EnrichmentProvider = {
  key: "claude_code_batch",
  mode: "manual_batch",
  label: "Claude Code Batch (Claude Max subscription)",

  buildExportPackage(promptVersion: PromptVersionRow, tools: ToolExportInput[], batchId: string): ExportPackage {
    return buildExportPackage(promptVersion, tools, batchId);
  },

  parseResult(raw: unknown, expectedToolIds: Set<string>, requestedFieldsByTool: Map<string, string[]>): ParsedProviderResult {
    const { results, issues } = validateImportPayload(raw, expectedToolIds, requestedFieldsByTool);
    return { results, issues };
  },

  normalizeErrors(err: unknown): SafeError {
    const message = err instanceof Error ? err.message : "Unknown error";
    return { error_code: "batch_import_error", error_message: message.slice(0, 500) };
  },
};
