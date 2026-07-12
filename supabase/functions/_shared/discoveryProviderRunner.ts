// Discovery Engine provider orchestration — the one place that turns a
// `DiscoveryProvider.fetchCandidates()` call into a recorded
// `discovery_provider_runs` row and a batch of `discovered_tools` inserts.
// Pure orchestration only: no HTTP handling (the edge function that invokes
// this owns that) and no registry/provider lookup (the caller already
// resolved the `DiscoveryProvider` object and the `discovery_providers` row
// and hands both in). Every per-candidate step reuses discoveryIngest.ts's
// normalizeCandidate/ingestOne exactly as the Manual/CSV admin import does —
// nothing here reimplements validation, duplicate detection, or scoring.

import type { SupabaseClient } from "npm:@supabase/supabase-js@2.57.4";
import type { DiscoveryProvider, FetchResult, RawDiscoveryCandidate } from "./discoveryProviders/types.ts";
import { ingestOne, normalizeCandidate, type RawCandidate } from "./discoveryIngest.ts";

export interface RunSummary {
  run_id: string;
  status: "completed" | "failed" | "partial";
  candidates_found: number;
  candidates_created: number;
  candidates_duplicate: number;
  candidates_rejected: number;
  error_message: string | null;
  warnings: string[];
  cursor_out: string | null;
  rate_limit_remaining: number | null;
  duration_ms: number;
}

// The subset of `discovery_providers` the runner needs. The caller (an
// edge function) already looked the row up; this is not a registry.
export interface DiscoveryProviderRow {
  id: string;
  key: string;
  config: Record<string, unknown>;
  rate_limit_per_run: number;
}

type IngestClassification = "created" | "duplicate" | "rejected";

export interface RunOutcomeCounts {
  status: "completed" | "partial";
  candidates_created: number;
  candidates_duplicate: number;
  candidates_rejected: number;
}

// Pure decision logic extracted out of runProvider so it can be unit-tested
// without a database: given how many candidates the provider handed back,
// what each one resolved to, and any run-level warnings the fetch itself
// reported, decide the final counters and status.
//
// candidates_created vs candidates_duplicate are NOT mutually exclusive:
// candidates_created counts every candidate that resulted in a successful
// INSERT into discovered_tools, regardless of the row's resulting status.
// candidates_duplicate is a sub-count of candidates_created for the rows
// whose status came back 'duplicate' (ingestOne still inserts duplicates —
// it just flags them for review rather than dropping them).
//
// Status: 'completed' only when nothing went wrong (zero rejected
// candidates AND zero fetch-level warnings) — this includes the "fetched
// fine, found zero candidates" case, since finding nothing is not an error.
// 'partial' covers every other non-throwing outcome, including a run where
// every single candidate was rejected. 'failed' is reserved for the
// fetchCandidates()-level throw handled directly in runProvider — it is
// never produced by this function.
export function summarizeRunOutcome(
  candidatesFound: number,
  ingestResults: { status: IngestClassification }[],
  fetchWarnings: string[],
): RunOutcomeCounts {
  let candidatesCreated = 0;
  let candidatesDuplicate = 0;
  let candidatesRejected = 0;

  for (const result of ingestResults) {
    if (result.status === "created") {
      candidatesCreated += 1;
    } else if (result.status === "duplicate") {
      candidatesCreated += 1;
      candidatesDuplicate += 1;
    } else {
      candidatesRejected += 1;
    }
  }

  // candidatesFound plays no role beyond documenting intent here: a fetch
  // that found zero candidates produces an empty ingestResults array and
  // zero fetchWarnings, which already falls through to 'completed' below.
  void candidatesFound;

  const status: "completed" | "partial" = candidatesRejected > 0 || fetchWarnings.length > 0 ? "partial" : "completed";

  return {
    status,
    candidates_created: candidatesCreated,
    candidates_duplicate: candidatesDuplicate,
    candidates_rejected: candidatesRejected,
  };
}

function toRawCandidate(candidate: RawDiscoveryCandidate): RawCandidate {
  return {
    name: candidate.name,
    official_website: candidate.official_website,
    category_hint: candidate.category_hint ?? undefined,
    short_description: candidate.short_description ?? undefined,
    logo_url: candidate.logo_url ?? undefined,
    source_url: candidate.source_url ?? undefined,
  };
}

function errorMessageOf(err: unknown): string {
  return err instanceof Error ? err.message : String(err);
}

function errorCodeOf(err: unknown): string {
  return err instanceof Error ? err.name : "Error";
}

export async function runProvider(
  supabase: SupabaseClient,
  provider: DiscoveryProvider,
  providerRow: DiscoveryProviderRow,
  trigger: "manual" | "scheduled" | "retry",
  createdBy: string | null,
): Promise<RunSummary> {
  const startedAt = new Date();

  const { data: runRow, error: runInsertError } = await supabase
    .from("discovery_provider_runs")
    .insert({
      provider_id: providerRow.id,
      trigger,
      status: "running",
      created_by: createdBy,
      started_at: startedAt.toISOString(),
      candidates_found: 0,
      candidates_created: 0,
      candidates_duplicate: 0,
      candidates_rejected: 0,
      warnings: [],
    })
    .select("id")
    .single();

  const runId = (runRow as { id?: string } | null)?.id;

  // If we couldn't even create the run row, there's no row left to update —
  // still return a normal RunSummary (never throw) describing the failure.
  if (runInsertError || !runId) {
    return {
      run_id: runId ?? "unknown",
      status: "failed",
      candidates_found: 0,
      candidates_created: 0,
      candidates_duplicate: 0,
      candidates_rejected: 0,
      error_message: runInsertError?.message ?? "Failed to create discovery_provider_runs row",
      warnings: [],
      cursor_out: null,
      rate_limit_remaining: null,
      duration_ms: Date.now() - startedAt.getTime(),
    };
  }

  let fetchResult: FetchResult;
  try {
    // cursorIn is always null for now. discovery_providers has no
    // dedicated "last_cursor" column in this migration — only
    // discovery_provider_runs.cursor_out, which records history per run
    // but isn't threaded back in as the next run's input yet. Reading the
    // previous run's cursor_out for this provider and passing it here is a
    // follow-up once that lookup/column exists; every run starts fresh
    // until then.
    fetchResult = await provider.fetchCandidates(providerRow.config, null, providerRow.rate_limit_per_run);
  } catch (err) {
    const completedAt = new Date();
    const durationMs = completedAt.getTime() - startedAt.getTime();
    const errorMessage = errorMessageOf(err);
    const errorCode = errorCodeOf(err);

    await supabase
      .from("discovery_provider_runs")
      .update({
        status: "failed",
        error_code: errorCode,
        error_message: errorMessage,
        completed_at: completedAt.toISOString(),
        duration_ms: durationMs,
      })
      .eq("id", runId);

    await supabase
      .from("discovery_providers")
      .update({
        last_run_at: completedAt.toISOString(),
        last_run_status: "failed",
        updated_at: completedAt.toISOString(),
      })
      .eq("id", providerRow.id);

    return {
      run_id: runId,
      status: "failed",
      candidates_found: 0,
      candidates_created: 0,
      candidates_duplicate: 0,
      candidates_rejected: 0,
      error_message: errorMessage,
      warnings: [],
      cursor_out: null,
      rate_limit_remaining: null,
      duration_ms: durationMs,
    };
  }

  const candidatesFound = fetchResult.candidates.length;
  const fetchLevelWarnings = fetchResult.warnings ?? [];
  const warnings: string[] = [...fetchLevelWarnings];
  const ingestResults: { status: IngestClassification }[] = [];

  for (const candidate of fetchResult.candidates) {
    const raw = toRawCandidate(candidate);
    const normalized = await normalizeCandidate(supabase, raw);

    if ("error" in normalized) {
      ingestResults.push({ status: "rejected" });
      warnings.push(`${candidate.name}: ${normalized.error}`);
      continue;
    }

    try {
      const outcome = await ingestOne(supabase, normalized, providerRow.id, createdBy);
      if (!outcome.ok) {
        ingestResults.push({ status: "rejected" });
        warnings.push(`${candidate.name}: ${outcome.error}`);
        continue;
      }
      ingestResults.push({ status: outcome.status === "duplicate" ? "duplicate" : "created" });
    } catch (err) {
      // One candidate's unexpected DB error must not abort the rest of the batch.
      ingestResults.push({ status: "rejected" });
      warnings.push(`${candidate.name}: ${errorMessageOf(err)}`);
    }
  }

  const outcome = summarizeRunOutcome(candidatesFound, ingestResults, fetchLevelWarnings);
  const completedAt = new Date();
  const durationMs = completedAt.getTime() - startedAt.getTime();
  const rateLimitRemaining = fetchResult.rate_limit_remaining ?? null;
  const cursorOut = fetchResult.cursor_out ?? null;

  await supabase
    .from("discovery_provider_runs")
    .update({
      status: outcome.status,
      candidates_found: candidatesFound,
      candidates_created: outcome.candidates_created,
      candidates_duplicate: outcome.candidates_duplicate,
      candidates_rejected: outcome.candidates_rejected,
      rate_limit_remaining: rateLimitRemaining,
      cursor_out: cursorOut,
      warnings,
      completed_at: completedAt.toISOString(),
      duration_ms: durationMs,
    })
    .eq("id", runId);

  await supabase
    .from("discovery_providers")
    .update({
      last_run_at: completedAt.toISOString(),
      last_run_status: outcome.status,
      updated_at: completedAt.toISOString(),
    })
    .eq("id", providerRow.id);

  return {
    run_id: runId,
    status: outcome.status,
    candidates_found: candidatesFound,
    candidates_created: outcome.candidates_created,
    candidates_duplicate: outcome.candidates_duplicate,
    candidates_rejected: outcome.candidates_rejected,
    error_message: null,
    warnings,
    cursor_out: cursorOut,
    rate_limit_remaining: rateLimitRemaining,
    duration_ms: durationMs,
  };
}
