// Shared "create a batch + its per-tool jobs" logic — used by
// admin-enrichment-batches (new batch from the Queue) AND
// admin-enrichment-review (single-tool/single-field regenerate), so both
// paths get the same active-job guard, batch-size ceiling, and
// generation_version bookkeeping.

// deno-lint-ignore-file no-explicit-any
/* eslint-disable @typescript-eslint/no-explicit-any -- untyped Supabase rows throughout this file */
import type { SupabaseClient } from "npm:@supabase/supabase-js@2.57.4";
import { MAX_BATCH_SIZE_HARD_CEILING } from "./enrichmentSchema.ts";

export class EnrichmentBatchError extends Error {
  blocked?: string[];
  constructor(public error_code: string, message: string, blocked?: string[]) {
    super(message);
    this.blocked = blocked;
  }
}

export interface CreateBatchParams {
  toolIds: string[];
  requestedFields: string[];
  createdBy: string | null;
  promptVersionId: string;
  provider: string;
}

export async function createBatchAndJobs(supabase: SupabaseClient, params: CreateBatchParams) {
  const toolIds = [...new Set(params.toolIds)];
  if (toolIds.length === 0) throw new EnrichmentBatchError("empty_batch", "At least one tool is required.");
  if (toolIds.length > MAX_BATCH_SIZE_HARD_CEILING) {
    throw new EnrichmentBatchError("batch_too_large", `A batch cannot exceed ${MAX_BATCH_SIZE_HARD_CEILING} tools.`);
  }

  const { data: settings } = await supabase.from("enrichment_settings").select("max_batch_size").eq("id", true).maybeSingle();
  const maxBatchSize = settings?.max_batch_size || MAX_BATCH_SIZE_HARD_CEILING;
  if (toolIds.length > maxBatchSize) {
    throw new EnrichmentBatchError("batch_too_large", `A batch cannot exceed the configured limit of ${maxBatchSize} tools.`);
  }

  // One active (queued/exported) job per tool — reject the whole request
  // and tell the caller exactly which tools are blocked, rather than
  // silently skipping them.
  const { data: activeJobs } = await supabase
    .from("enrichment_jobs")
    .select("tool_id")
    .in("tool_id", toolIds)
    .in("status", ["queued", "exported"]);
  const blocked = [...new Set((activeJobs || []).map((r: any) => r.tool_id))];
  if (blocked.length > 0) {
    throw new EnrichmentBatchError(
      "duplicate_active_job",
      `${blocked.length} tool(s) already have an active enrichment job in progress.`,
      blocked,
    );
  }

  const { data: existingTools, error: toolsError } = await supabase.from("tools").select("id").in("id", toolIds);
  if (toolsError) throw new Error(toolsError.message);
  const foundIds = new Set((existingTools || []).map((t: any) => t.id));
  const missing = toolIds.filter((id) => !foundIds.has(id));
  if (missing.length > 0) {
    throw new EnrichmentBatchError("tool_not_found", `${missing.length} tool id(s) do not exist.`);
  }

  const { data: batch, error: batchError } = await supabase
    .from("enrichment_batches")
    .insert({
      status: "queued",
      tool_ids: toolIds,
      requested_fields: params.requestedFields,
      provider: params.provider,
      prompt_version_id: params.promptVersionId,
      created_by: params.createdBy,
    })
    .select()
    .single();
  if (batchError) throw new Error(batchError.message);

  const { data: priorVersions } = await supabase
    .from("enrichment_jobs")
    .select("tool_id, generation_version")
    .in("tool_id", toolIds)
    .order("generation_version", { ascending: false });
  const maxVersionByTool = new Map<string, number>();
  for (const row of priorVersions || []) {
    if (!maxVersionByTool.has(row.tool_id)) maxVersionByTool.set(row.tool_id, row.generation_version);
  }

  const jobRows = toolIds.map((toolId) => ({
    batch_id: batch.id,
    tool_id: toolId,
    status: "queued",
    provider: params.provider,
    prompt_version_id: params.promptVersionId,
    generation_version: (maxVersionByTool.get(toolId) || 0) + 1,
    requested_fields: params.requestedFields,
    created_by: params.createdBy,
  }));
  const { data: jobs, error: jobsError } = await supabase.from("enrichment_jobs").insert(jobRows).select();
  if (jobsError) throw new Error(jobsError.message);

  return { batch, jobs };
}
