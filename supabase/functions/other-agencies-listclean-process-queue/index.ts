import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import {
  listcleanVerifyBatch,
  listcleanGetList,
  listcleanDownloadListJson,
  pollListCleanCompletion,
  mapListCleanStatusToInternal,
} from "../_shared/listcleanClient.ts";
import { requireAdminSession, CORS_HEADERS, extractToken } from "../_shared/adminSession.ts";

function isServiceRoleCall(req: Request): boolean {
  const serviceRoleKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");
  if (!serviceRoleKey) return false;

  const authHeader = req.headers.get("Authorization") || "";
  if (authHeader.startsWith("Bearer ")) {
    const token = authHeader.substring(7).trim();
    return token === serviceRoleKey;
  }
  return false;
}

interface FailureSample {
  email_id: string;
  email_normalized: string;
  validation_status_before: string;
  verification_attempt_count: number;
  failure_stage: "submit_batch" | "poll_batch" | "download_results" | "parse_results" | "db_update" | "other";
  error_message: string;
  external_status?: string;
  batch_id?: string;
}

interface ProcessResult {
  ok: boolean;
  total_selected: number;
  unique_emails_submitted: number;
  duplicate_rows_collapsed: number;
  processed: number;
  verified_valid: number;
  verified_invalid: number;
  verified_retry: number;
  scheduled_for_retry: number;
  verified_failed: number;
  failed: number;
  result_mismatch_count?: number;
  errors: string[];
  failure_samples?: FailureSample[];
  paused?: boolean;
  pause_reason?: string | null;
}

async function processQueueBatch(
  supabase: any,
  emails: Array<{ id: string; email_normalized: string; verification_attempt_count?: number }>
): Promise<{
  successCount: number;
  errorCount: number;
  duplicateRowsCollapsed: number;
  errors: string[];
  failureSamples: FailureSample[];
  listId?: string;
}> {
  if (emails.length === 0) {
    return { successCount: 0, errorCount: 0, duplicateRowsCollapsed: 0, errors: [], failureSamples: [] };
  }

  let successCount = 0;
  let errorCount = 0;
  let duplicateRowsCollapsed = 0;
  const errors: string[] = [];
  const failureSamples: FailureSample[] = [];
  let missingStatusCount = 0;
  let bucketFallbackCount = 0;
  let listId: string | undefined;

  // --- HARD DEDUPE: Never spend ListClean credits on duplicate normalized emails ---
  // Build a map from email_normalized -> canonical row (first occurrence wins).
  // All subsequent rows with the same email are "collapsed" — we apply the result
  // back to them after the API call without submitting them separately.
  const canonicalByEmail = new Map<string, typeof emails[0]>();
  const duplicateRows: Array<{ canonical: typeof emails[0]; duplicate: typeof emails[0] }> = [];

  for (const emailRow of emails) {
    const key = emailRow.email_normalized.toLowerCase().trim();
    if (canonicalByEmail.has(key)) {
      duplicateRows.push({ canonical: canonicalByEmail.get(key)!, duplicate: emailRow });
      duplicateRowsCollapsed++;
    } else {
      canonicalByEmail.set(key, emailRow);
    }
  }

  const uniqueEmails = Array.from(canonicalByEmail.values());
  console.log(
    `[listclean-queue] Dedupe: ${emails.length} selected → ${uniqueEmails.length} unique to submit, ${duplicateRowsCollapsed} collapsed`
  );

  try {
    const emailStrings = uniqueEmails.map((e) => e.email_normalized);

    let batchResponse: any;
    try {
      batchResponse = await listcleanVerifyBatch(emailStrings);
      listId = batchResponse.list_id;

      if (listId === null || listId === undefined || listId === "" || listId === "undefined" || listId === "null") {
        throw new Error(
          `ListClean submit succeeded but returned invalid list_id: ${listId}`
        );
      }

      const numListId = Number(listId);
      if (isNaN(numListId) || numListId <= 0) {
        throw new Error(
          `ListClean submit succeeded but returned invalid list_id: ${listId}`
        );
      }

      console.log("[listclean-queue] extracted listId:", listId);
    } catch (error) {
      const errorMsg = error instanceof Error ? error.message : String(error);
      console.error("[listclean-queue] submit_batch failed:", errorMsg);
      for (const email of uniqueEmails) {
        if (failureSamples.length < 5) {
          failureSamples.push({
            email_id: email.id,
            email_normalized: email.email_normalized,
            validation_status_before: "pending",
            verification_attempt_count: email.verification_attempt_count ?? 0,
            failure_stage: "submit_batch",
            error_message: errorMsg.substring(0, 200),
            batch_id: undefined,
          });
        }
      }
      errorCount += uniqueEmails.length;
      errors.push(`Batch submit failed: ${errorMsg}`);
      return { successCount, errorCount, duplicateRowsCollapsed, errors, failureSamples, listId };
    }

    let listStatus: any;
    try {
      listStatus = await pollListCleanCompletion(listId);
    } catch (error) {
      const errorMsg = error instanceof Error ? error.message : String(error);
      console.error("[listclean-queue] poll_batch failed:", errorMsg);
      for (const email of uniqueEmails) {
        if (failureSamples.length < 5) {
          failureSamples.push({
            email_id: email.id,
            email_normalized: email.email_normalized,
            validation_status_before: "pending",
            verification_attempt_count: email.verification_attempt_count ?? 0,
            failure_stage: "poll_batch",
            error_message: errorMsg.substring(0, 200),
            batch_id: String(listId),
          });
        }
      }
      errorCount += uniqueEmails.length;
      errors.push(`Batch poll failed: ${errorMsg}`);
      return { successCount, errorCount, duplicateRowsCollapsed, errors, failureSamples, listId };
    }

    let cleanEmails: any[] = [];
    let dirtyEmails: any[] = [];
    let unknownEmails: any[] = [];

    const toExpectedCount = (value: unknown): number | undefined => {
      if (value === null || value === undefined || value === "") return undefined;
      const n = Number(value);
      if (!Number.isFinite(n) || n < 0) return undefined;
      return n;
    };

    // Use normalized counts from list status (fallback aliases just in case)
    // undefined = count unknown (still try download), 0 = explicitly empty (safe to skip)
    const cleanCount =
      toExpectedCount(listStatus?.clean_count) ??
      toExpectedCount(listStatus?.clean);
    const dirtyCount =
      toExpectedCount(listStatus?.dirty_count) ??
      toExpectedCount(listStatus?.dirty);
    const unknownCount =
      toExpectedCount(listStatus?.unknown_count) ??
      toExpectedCount(listStatus?.unknown);

    console.log("[listclean-queue] count reliability:", {
      cleanCountKnown: typeof cleanCount === "number",
      dirtyCountKnown: typeof dirtyCount === "number",
      unknownCountKnown: typeof unknownCount === "number",
    });

    const filename = listStatus?.filename || listStatus?.name;
    const rawDownloadCandidates = listStatus?.raw_download_candidates;

    console.log("[listclean-queue] download context:", {
      listId,
      filename,
      hasCandidates: !!rawDownloadCandidates,
    });

    console.log("[listclean-queue] list status counts:", {
      listId,
      cleanCount,
      dirtyCount,
      unknownCount,
      status: listStatus?.status,
    });

    let cleanDownloadSucceeded = false;

    const downloadBucketOrEmpty = async (
      type: "clean" | "dirty" | "unknown",
      expectedCount: number | undefined,
      downloadOpts: { filename?: string; rawDownloadCandidates?: string[] }
    ): Promise<any[]> => {
      // If list status explicitly says this bucket is empty, skip download entirely.
      // Only skip when count is exactly 0 (not undefined = unknown)
      if (typeof expectedCount === "number" && expectedCount === 0) {
        console.log(
          `[listclean-queue] Skipping ${type} download (expected count = 0)`
        );
        return [];
      }

      try {
        return await listcleanDownloadListJson(listId, type, downloadOpts);
      } catch (error) {
        const errorMsg = error instanceof Error ? error.message : String(error);
        const lowerMsg = errorMsg.toLowerCase();

        const is404MissingEndpoint =
          lowerMsg.includes("download endpoint not found") ||
          lowerMsg.includes("failed (404)") ||
          (lowerMsg.includes("404") && lowerMsg.includes("download"));

        const is401or403Auth =
          lowerMsg.includes("auth error (401)") ||
          lowerMsg.includes("auth error (403)") ||
          ((lowerMsg.includes("401") || lowerMsg.includes("403")) && lowerMsg.includes("download"));

        const isOptionalBucket = type === "dirty" || type === "unknown";
        const countIsZeroOrUnknown =
          expectedCount === undefined || expectedCount <= 0;

        // Treat missing/forbidden dirty/unknown endpoint as empty result set
        // Only tolerate 401/403 if clean bucket already succeeded (proves auth is valid)
        if (isOptionalBucket && countIsZeroOrUnknown) {
          if (is404MissingEndpoint || (is401or403Auth && cleanDownloadSucceeded)) {
            console.warn(
              `[listclean-queue] Treating missing/forbidden ${type} endpoint as empty result set`
            );
            return [];
          }
        }

        // Never silently ignore clean bucket errors when clean results are expected.
        throw error;
      }
    };

    try {
      const downloadOpts = { filename };

      cleanEmails = await downloadBucketOrEmpty("clean", cleanCount, downloadOpts);
      cleanDownloadSucceeded = true;
      console.log("[listclean-queue] clean download succeeded for batch");

      dirtyEmails = await downloadBucketOrEmpty("dirty", dirtyCount, downloadOpts);
      unknownEmails = await downloadBucketOrEmpty("unknown", unknownCount, downloadOpts);
    } catch (error) {
      const errorMsg = error instanceof Error ? error.message : String(error);
      console.error("[listclean-queue] download_results failed:", errorMsg);
      for (const email of emails) {
        if (failureSamples.length < 5) {
          failureSamples.push({
            email_id: email.id,
            email_normalized: email.email_normalized,
            validation_status_before: "pending",
            verification_attempt_count: email.verification_attempt_count ?? 0,
            failure_stage: "download_results",
            error_message: errorMsg.substring(0, 200),
            batch_id: String(listId),
          });
        }
      }
      errorCount += uniqueEmails.length;
      errors.push(`Download results failed: ${errorMsg}`);
      return { successCount, errorCount, duplicateRowsCollapsed, errors, failureSamples, listId };
    }

    try {
      const cleanResultsAnnotated = cleanEmails.map((r) => ({ ...r, _bucket: "clean" }));
      const dirtyResultsAnnotated = dirtyEmails.map((r) => ({ ...r, _bucket: "dirty" }));
      const unknownResultsAnnotated = unknownEmails.map((r) => ({ ...r, _bucket: "unknown" }));

      console.log(`[listclean-queue] Batch ${listId} download stats:`, {
        requested: emails.length,
        uniqueSubmitted: uniqueEmails.length,
        clean: cleanResultsAnnotated.length,
        dirty: dirtyResultsAnnotated.length,
        unknown: unknownResultsAnnotated.length,
        totalResults: cleanResultsAnnotated.length + dirtyResultsAnnotated.length + unknownResultsAnnotated.length,
      });

      const bucketPriority: Record<string, number> = { clean: 3, dirty: 2, unknown: 1 };
      const resultMap = new Map<string, any>();

      const allResults = [...unknownResultsAnnotated, ...dirtyResultsAnnotated, ...cleanResultsAnnotated];
      let skippedNoEmail = 0;

      for (const r of allResults) {
        if (typeof r.email !== "string" || !r.email.trim()) {
          skippedNoEmail++;
          continue;
        }
        const key = r.email.toLowerCase().trim();
        const existing = resultMap.get(key);
        if (!existing || (bucketPriority[r._bucket] || 0) > (bucketPriority[existing._bucket] || 0)) {
          resultMap.set(key, r);
        }
      }

      console.log(`[listclean-queue] Batch ${listId} result map build:`, {
        totalResults: allResults.length,
        skippedNoEmail,
        uniqueKeysInMap: resultMap.size,
      });

      const sampleResultKeys = Array.from(resultMap.keys()).slice(0, 5);
      const sampleSubmittedEmails = uniqueEmails.slice(0, 5).map(e => e.email_normalized.toLowerCase().trim());

      console.log(`[listclean-queue] Batch ${listId} matching debug:`, {
        sampleResultKeys,
        sampleSubmittedEmails,
        exactMatchTest: sampleSubmittedEmails.length > 0 ? resultMap.has(sampleSubmittedEmails[0]) : "no emails",
      });

      let matchedCount = 0;
      let unmatchedCount = 0;
      const unmatchedSamples: string[] = [];

      if (resultMap.size === 0) {
        console.error(`[listclean-queue] CRITICAL: resultMap is empty after processing ${allResults.length} results`);
        for (const emailRow of uniqueEmails) {
          const now = new Date().toISOString();
          await supabase
            .from("other_agency_emails")
            .update({
              verification_state: "result_mismatch",
              verification_last_attempt_at: now,
            })
            .eq("id", emailRow.id);
          errorCount++;
        }
        errors.push(`ListClean result retrieval failed: Downloaded ${allResults.length} results but no valid emails found in result map. The batch completed successfully in ListClean, but the backend could not parse the official result files.`);
        return { successCount, errorCount, duplicateRowsCollapsed, errors, failureSamples, listId };
      }

      for (const emailRow of uniqueEmails) {
        try {
          const normalizedEmail = emailRow.email_normalized.toLowerCase().trim();
          const result = resultMap.get(normalizedEmail) as any;

          if (!result) {
            unmatchedCount++;
            if (unmatchedSamples.length < 5) {
              unmatchedSamples.push(normalizedEmail);
            }

            const now = new Date().toISOString();
            await supabase
              .from("other_agency_emails")
              .update({
                verification_state: "result_mismatch",
                verification_last_attempt_at: now,
              })
              .eq("id", emailRow.id);

            errorCount++;
            if (failureSamples.length < 5) {
              failureSamples.push({
                email_id: emailRow.id,
                email_normalized: emailRow.email_normalized,
                validation_status_before: "pending",
                verification_attempt_count: emailRow.verification_attempt_count ?? 0,
                failure_stage: "parse_results",
                error_message: `No match in resultMap (size=${resultMap.size})`,
                batch_id: String(listId),
              });
            }
            continue;
          }

          matchedCount++;

          let externalStatus = result.status;
          if (!externalStatus || (typeof externalStatus === "string" && externalStatus.trim() === "")) {
            missingStatusCount++;
            const bucket = result._bucket;
            externalStatus = bucket || "retry";
            bucketFallbackCount++;
          }

          const internalStatus = mapListCleanStatusToInternal(externalStatus);
          const now = new Date().toISOString();

          const currentAttemptCount = emailRow.verification_attempt_count ?? 0;
          const nextAttemptCount = Math.min(currentAttemptCount + 1, 6);

          let nextRetryAt: string | null = null;
          let finalizedAt: string | null = null;
          let verificationState = "completed";

          let finalValidationStatus = internalStatus;
          if (internalStatus === "valid" || internalStatus === "invalid") {
            finalizedAt = now;
            verificationState = "completed";
          } else if (internalStatus === "retry") {
            if (nextAttemptCount < 6) {
              const retryTime = new Date(Date.now() + 48 * 60 * 60 * 1000);
              nextRetryAt = retryTime.toISOString();
              verificationState = "retry_scheduled";
              finalValidationStatus = "retry";
            } else {
              finalizedAt = now;
              verificationState = "failed_permanent";
              finalValidationStatus = "failed";
            }
          }

          const updatePayload = {
            validation_status: finalValidationStatus,
            validation_provider: "ListClean",
            validation_checked_at: now,
            verification_external_status: externalStatus,
            verification_external_reason: result.reason || result.sub_status || null,
            verification_last_attempt_at: now,
            verification_attempt_count: nextAttemptCount,
            verification_next_retry_at: nextRetryAt,
            verification_finalized_at: finalizedAt,
            verification_state: verificationState,
            verification_bucket_source: result._bucket || null,
          };

          const { error: updateError } = await supabase
            .from("other_agency_emails")
            .update(updatePayload)
            .eq("id", emailRow.id);

          if (updateError) {
            throw updateError;
          }

          successCount++;
        } catch (error) {
          errorCount++;
          const errorMsg = error instanceof Error ? error.message : String(error);
          if (failureSamples.length < 5) {
            failureSamples.push({
              email_id: emailRow.id,
              email_normalized: emailRow.email_normalized,
              validation_status_before: "pending",
              verification_attempt_count: emailRow.verification_attempt_count ?? 0,
              failure_stage: "db_update",
              error_message: errorMsg.substring(0, 200),
              external_status: resultMap.get(emailRow.email_normalized.toLowerCase())?.status,
              batch_id: String(listId),
            });
          }
          errors.push(`Error processing ${emailRow.email_normalized}: ${errorMsg}`);
        }
      }
      console.log(`[listclean-queue] Batch ${listId} processing summary:`, {
        submitted: uniqueEmails.length,
        resultsFromListClean: allResults.length,
        matched: matchedCount,
        unmatched: unmatchedCount,
        unmatchedSamples: unmatchedSamples.slice(0, 3),
        successCount,
        errorCount,
      });

      for (const { canonical, duplicate } of duplicateRows) {
        try {
          const canonicalKey = canonical.email_normalized.toLowerCase().trim();
          const canonicalResult = resultMap.get(canonicalKey) as any;
          if (!canonicalResult) continue;

          let externalStatus = canonicalResult.status;
          if (!externalStatus || (typeof externalStatus === "string" && externalStatus.trim() === "")) {
            externalStatus = canonicalResult._bucket || "retry";
          }
          const internalStatus = mapListCleanStatusToInternal(externalStatus);
          const now = new Date().toISOString();
          const nextAttemptCount = Math.min((duplicate.verification_attempt_count ?? 0) + 1, 6);

          let nextRetryAt: string | null = null;
          let finalizedAt: string | null = null;
          let verificationState = "completed";
          let finalValidationStatusDup = internalStatus;

          if (internalStatus === "valid" || internalStatus === "invalid") {
            finalizedAt = now;
          } else if (internalStatus === "retry") {
            if (nextAttemptCount < 6) {
              nextRetryAt = new Date(Date.now() + 48 * 60 * 60 * 1000).toISOString();
              verificationState = "retry_scheduled";
              finalValidationStatusDup = "retry";
            } else {
              finalizedAt = now;
              verificationState = "failed_permanent";
              finalValidationStatusDup = "failed";
            }
          }

          const { error: fanOutError } = await supabase
            .from("other_agency_emails")
            .update({
              validation_status: finalValidationStatusDup,
              validation_provider: "ListClean",
              validation_checked_at: now,
              verification_external_status: externalStatus,
              verification_external_reason: canonicalResult.reason || canonicalResult.sub_status || null,
              verification_last_attempt_at: now,
              verification_attempt_count: nextAttemptCount,
              verification_next_retry_at: nextRetryAt,
              verification_finalized_at: finalizedAt,
              verification_state: verificationState,
              verification_bucket_source: canonicalResult._bucket || null,
            })
            .eq("id", duplicate.id);

          if (!fanOutError) {
            successCount++;
          } else {
            errorCount++;
            errors.push(`Fan-out update failed for duplicate ${duplicate.email_normalized}: ${fanOutError.message}`);
          }
        } catch (fanErr) {
          errorCount++;
          errors.push(`Fan-out error for ${duplicate.email_normalized}: ${fanErr instanceof Error ? fanErr.message : String(fanErr)}`);
        }
      }
    } catch (error) {
      const errorMsg = error instanceof Error ? error.message : String(error);
      console.error("[listclean-queue] parse_results failed:", errorMsg);
      for (const email of uniqueEmails) {
        if (failureSamples.length < 5) {
          failureSamples.push({
            email_id: email.id,
            email_normalized: email.email_normalized,
            validation_status_before: "pending",
            verification_attempt_count: email.verification_attempt_count ?? 0,
            failure_stage: "parse_results",
            error_message: errorMsg.substring(0, 200),
            batch_id: String(listId),
          });
        }
      }
      errorCount += uniqueEmails.length;
      errors.push(`Parse results failed: ${errorMsg}`);
    }
  } catch (error) {
    const errorMsg = error instanceof Error ? error.message : String(error);
    errorCount += uniqueEmails.length;
    errors.push(`Batch processing error: ${errorMsg}`);
    for (const email of uniqueEmails) {
      if (failureSamples.length < 5) {
        failureSamples.push({
          email_id: email.id,
          email_normalized: email.email_normalized,
          validation_status_before: "pending",
          verification_attempt_count: email.verification_attempt_count ?? 0,
          failure_stage: "other",
          error_message: errorMsg.substring(0, 200),
        });
      }
    }
  }

  // Log bucket fallback metrics for visibility
  if (missingStatusCount > 0) {
    console.log(
      `[listclean-queue] Batch ${listId}: ${missingStatusCount} rows had missing result.status, ${bucketFallbackCount} used bucket fallback`
    );
  }

  return { successCount, errorCount, duplicateRowsCollapsed, errors, failureSamples, listId };
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: CORS_HEADERS });
  }

  try {
    if (req.method !== "POST") {
      return new Response(
        JSON.stringify({ error: "Method not allowed" }),
        { status: 405, headers: { ...CORS_HEADERS, "Content-Type": "application/json" } }
      );
    }

    // Allow either admin session token OR service role key (for internal auto-kick calls)
    const isInternalCall = isServiceRoleCall(req);
    if (!isInternalCall) {
      const authResult = await requireAdminSession(req);
      if (authResult instanceof Response) {
        return authResult;
      }
    } else {
      console.log("[listclean-queue] Authenticated via service role key (internal call)");
    }

    const supabaseUrl = Deno.env.get("SUPABASE_URL");
    const serviceRoleKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");
    if (!supabaseUrl || !serviceRoleKey) {
      throw new Error("Missing Supabase environment variables");
    }

    const supabase = createClient(supabaseUrl, serviceRoleKey);

    // Check if queue is paused before processing
    const { data: monitorState } = await supabase
      .from("listclean_monitor_state")
      .select("queue_auto_paused, queue_pause_reason, manual_pause")
      .eq("id", "default")
      .maybeSingle();

    // Check for force_run override in request body
    let forceRun = false;
    try {
      const bodyText = await req.text();
      if (bodyText) {
        const body = JSON.parse(bodyText);
        forceRun = body.force_run === true;
      }
    } catch {
      // Ignore body parse errors, treat as no force_run
    }

    // If paused and no force_run override, return paused response
    if (monitorState?.queue_auto_paused && !forceRun) {
      return new Response(
        JSON.stringify({
          ok: true,
          total_selected: 0,
          unique_emails_submitted: 0,
          duplicate_rows_collapsed: 0,
          paused: true,
          pause_reason: monitorState.queue_pause_reason || null,
          message: `Queue paused due to ${monitorState.queue_pause_reason || "unspecified reason"}`,
          processed: 0,
          verified_valid: 0,
          verified_invalid: 0,
          verified_retry: 0,
          scheduled_for_retry: 0,
          verified_failed: 0,
          failed: 0,
          errors: [],
          failure_samples: [],
        } as ProcessResult),
        { headers: { ...CORS_HEADERS, "Content-Type": "application/json" } }
      );
    }

    // If force_run, log it
    if (forceRun && monitorState?.queue_auto_paused) {
      console.log("[listclean-queue] Force-run override used to bypass pause");
    }

    // Query for pending and retry emails due for verification
    // Statuses: pending (new), retry (unknown result scheduled for retry)
    const now = new Date().toISOString();
    const { data: dueEmails, error: selectError } = await supabase
      .from("other_agency_emails")
      .select("id, email_normalized, verification_attempt_count")
      .or(`validation_status.eq.pending,validation_status.eq.retry`)
      .lte("verification_next_retry_at", now)
      .lt("verification_attempt_count", 6)
      .order("verification_next_retry_at", { ascending: true })
      .limit(3000);

    if (selectError) {
      throw selectError;
    }

    const totalSelected = dueEmails.length;

    if (!dueEmails || dueEmails.length === 0) {
      return new Response(
        JSON.stringify({
          ok: true,
          total_selected: 0,
          unique_emails_submitted: 0,
          duplicate_rows_collapsed: 0,
          processed: 0,
          verified_valid: 0,
          verified_invalid: 0,
          verified_retry: 0,
          scheduled_for_retry: 0,
          verified_failed: 0,
          failed: 0,
          errors: [],
          failure_samples: [],
        } as ProcessResult),
        { headers: { ...CORS_HEADERS, "Content-Type": "application/json" } }
      );
    }

    let totalProcessed = 0;
    let totalValid = 0;
    let totalInvalid = 0;
    let totalRetry = 0;
    let totalScheduledForRetry = 0;
    let totalVerifiedFailed = 0;
    let totalFailed = 0;
    let totalResultMismatch = 0;
    let totalDuplicateRowsCollapsed = 0;
    const allErrors: string[] = [];
    const allFailureSamples: FailureSample[] = [];

    const batchSize = 1000;
    for (let i = 0; i < dueEmails.length; i += batchSize) {
      const batch = dueEmails.slice(i, i + batchSize);

      const batchResult = await processQueueBatch(supabase, batch);
      totalProcessed += batchResult.successCount;
      totalFailed += batchResult.errorCount;
      totalDuplicateRowsCollapsed += batchResult.duplicateRowsCollapsed;
      allErrors.push(...batchResult.errors);
      allFailureSamples.push(...batchResult.failureSamples);

      for (const email of batch) {
        const { data: updated, error: checkError } = await supabase
          .from("other_agency_emails")
          .select("validation_status, verification_finalized_at, verification_next_retry_at, verification_state")
          .eq("id", email.id)
          .single();

        if (!checkError && updated) {
          if (updated.validation_status === "valid") {
            totalValid++;
          } else if (updated.validation_status === "invalid") {
            totalInvalid++;
          } else if (updated.validation_status === "retry") {
            totalScheduledForRetry++;
          } else if (updated.validation_status === "failed") {
            totalVerifiedFailed++;
          } else if (updated.verification_state === "result_mismatch") {
            totalResultMismatch++;
          } else {
            totalRetry++;
          }
        }
      }
    }

    const runEndTime = Date.now();
    const triggeredBy = forceRun ? "manual" : "auto";

    await supabase
      .from("verification_queue_runs")
      .insert({
        run_started_at: new Date(runEndTime - 1000).toISOString(),
        run_completed_at: new Date(runEndTime).toISOString(),
        duration_ms: 1000,
        total_selected: totalSelected,
        unique_emails_submitted: totalSelected - totalDuplicateRowsCollapsed,
        duplicate_rows_collapsed: totalDuplicateRowsCollapsed,
        processed: totalProcessed,
        verified_valid: totalValid,
        verified_invalid: totalInvalid,
        scheduled_for_retry: totalScheduledForRetry,
        finalized_unknown: totalVerifiedFailed,
        failed: totalFailed,
        result_mismatch_count: totalResultMismatch,
        status: totalFailed > 0 ? "completed_with_errors" : "completed",
        triggered_by: triggeredBy,
      })
      .then(() => {
        console.log("[listclean-queue] Run recorded to verification_queue_runs");
      })
      .catch((err: Error) => {
        console.warn("[listclean-queue] Failed to record run:", err.message);
      });

    const result: ProcessResult = {
      ok: true,
      total_selected: totalSelected,
      unique_emails_submitted: totalSelected - totalDuplicateRowsCollapsed,
      duplicate_rows_collapsed: totalDuplicateRowsCollapsed,
      processed: totalProcessed,
      verified_valid: totalValid,
      verified_invalid: totalInvalid,
      verified_retry: totalRetry,
      scheduled_for_retry: totalScheduledForRetry,
      verified_failed: totalVerifiedFailed,
      failed: totalFailed,
      result_mismatch_count: totalResultMismatch > 0 ? totalResultMismatch : undefined,
      errors: allErrors.slice(0, 50),
      failure_samples: allFailureSamples.length > 0 ? allFailureSamples.slice(0, 5) : undefined,
    };

    return new Response(JSON.stringify(result), {
      headers: { ...CORS_HEADERS, "Content-Type": "application/json" },
    });
  } catch (error) {
    console.error("Queue processing error:", error);
    return new Response(
      JSON.stringify({
        ok: false,
        error: error instanceof Error ? error.message : "Unknown error",
      }),
      { status: 500, headers: { ...CORS_HEADERS, "Content-Type": "application/json" } }
    );
  }
});
