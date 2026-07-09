import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { requireAdminSession, CORS_HEADERS } from "../_shared/adminSession.ts";

interface BeforeSnapshot {
  id: string;
  email_normalized: string;
  validation_status: string;
  verification_external_status: string | null;
  verification_bucket_source: string | null;
  verification_attempt_count: number;
}

interface ReprocessResponse {
  ok: boolean;
  mode: "sample" | "full_state";
  state_slug?: string;
  rows_reset: number;
  rows_available?: number;
  before_snapshots: BeforeSnapshot[];
  after_snapshots: BeforeSnapshot[];
  queue_processor_kicked: boolean;
  queue_kick_error?: string;
  queue_processor_response_status?: number;
}

interface RequestPayload {
  mode: "sample" | "full_state";
  state_slug: string;
  sample_size?: number;
  admin_confirm?: boolean;
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: CORS_HEADERS });
  }

  try {
    const authResult = await requireAdminSession(req);
    if (authResult instanceof Response) {
      return authResult;
    }

    if (req.method !== "POST") {
      return new Response(
        JSON.stringify({ ok: false, error: "POST required" }),
        { status: 405, headers: { ...CORS_HEADERS, "Content-Type": "application/json" } }
      );
    }

    const supabaseUrl = Deno.env.get("SUPABASE_URL");
    const supabaseServiceKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");

    if (!supabaseUrl || !supabaseServiceKey) {
      throw new Error("Supabase credentials not configured");
    }

    const supabase = createClient(supabaseUrl, supabaseServiceKey);

    const payload: RequestPayload = await req.json();
    const { mode, state_slug, sample_size = 5, admin_confirm = false } = payload;

    if (!state_slug) {
      return new Response(
        JSON.stringify({ ok: false, error: "state_slug required" }),
        { status: 400, headers: { ...CORS_HEADERS, "Content-Type": "application/json" } }
      );
    }

    if (mode === "full_state" && !admin_confirm) {
      return new Response(
        JSON.stringify({
          ok: false,
          error: "Full state reprocess requires admin_confirm=true",
        }),
        { status: 400, headers: { ...CORS_HEADERS, "Content-Type": "application/json" } }
      );
    }

    const limit = mode === "sample" ? sample_size : 10000;

    const { data: retryRows, count: totalAvailable, error: selectError } = await supabase
      .from("other_agency_emails")
      .select(
        "id, email_normalized, validation_status, verification_external_status, verification_bucket_source, verification_attempt_count",
        { count: "exact" }
      )
      .eq("state_slug", state_slug)
      .or("validation_status.eq.retry,validation_status.eq.failed")
      .lt("verification_attempt_count", 6)
      .limit(limit);

    if (selectError) throw selectError;

    if (!retryRows || retryRows.length === 0) {
      return new Response(
        JSON.stringify({
          ok: true,
          mode,
          state_slug,
          rows_reset: 0,
          rows_available: totalAvailable || 0,
          before_snapshots: [],
          after_snapshots: [],
          queue_processor_kicked: false,
        }),
        { status: 200, headers: { ...CORS_HEADERS, "Content-Type": "application/json" } }
      );
    }

    const beforeSnapshots: BeforeSnapshot[] = retryRows.map((row: any) => ({
      id: row.id,
      email_normalized: row.email_normalized,
      validation_status: row.validation_status,
      verification_external_status: row.verification_external_status,
      verification_bucket_source: row.verification_bucket_source,
      verification_attempt_count: row.verification_attempt_count,
    }));

    const now = new Date().toISOString();
    const rowIds = retryRows.map((r: any) => r.id);

    const { error: updateError } = await supabase
      .from("other_agency_emails")
      .update({
        validation_status: "retry",
        verification_next_retry_at: now,
        verification_state: "queued",
        updated_at: now,
      })
      .in("id", rowIds);

    if (updateError) throw updateError;

    const { data: afterUpdateRows, error: afterSelectError } = await supabase
      .from("other_agency_emails")
      .select(
        "id, email_normalized, validation_status, verification_external_status, verification_bucket_source, verification_attempt_count"
      )
      .in("id", rowIds);

    if (afterSelectError) throw afterSelectError;

    const afterSnapshots: BeforeSnapshot[] = (afterUpdateRows || []).map((row: any) => ({
      id: row.id,
      email_normalized: row.email_normalized,
      validation_status: row.validation_status,
      verification_external_status: row.verification_external_status,
      verification_bucket_source: row.verification_bucket_source,
      verification_attempt_count: row.verification_attempt_count,
    }));

    let queueProcessorKicked = false;
    let queueKickError: string | undefined;
    let queueProcessorResponseStatus: number | undefined;

    const adminToken = req.headers.get("x-admin-token");
    if (!adminToken) {
      queueKickError = "Admin token missing from request (should not happen after requireAdminSession)";
      console.error("Critical: Missing admin token after auth check");
    } else {
      try {
        const queueUrl = `${supabaseUrl}/functions/v1/other-agencies-listclean-process-queue`;
        const queueHeaders: Record<string, string> = {
          "Content-Type": "application/json",
          "x-admin-token": adminToken,
        };

        const queueResponse = await fetch(queueUrl, {
          method: "POST",
          headers: queueHeaders,
          body: JSON.stringify({ force_run: true }),
        });

        queueProcessorResponseStatus = queueResponse.status;

        if (queueResponse.ok) {
          queueProcessorKicked = true;
        } else {
          const errorText = await queueResponse.text();
          queueKickError = `Queue processor returned HTTP ${queueResponse.status}: ${errorText}`;
          console.error("Queue kick failed:", queueKickError);
        }
      } catch (error) {
        queueKickError = error instanceof Error ? error.message : "Network error calling queue processor";
        console.error("Queue kick error:", queueKickError);
      }
    }

    const response: ReprocessResponse = {
      ok: true,
      mode,
      state_slug,
      rows_reset: rowIds.length,
      rows_available: totalAvailable || 0,
      before_snapshots: beforeSnapshots,
      after_snapshots: afterSnapshots,
      queue_processor_kicked: queueProcessorKicked,
      queue_kick_error: queueKickError,
      queue_processor_response_status: queueProcessorResponseStatus,
    };

    return new Response(JSON.stringify(response), {
      status: 200,
      headers: { ...CORS_HEADERS, "Content-Type": "application/json" },
    });
  } catch (error) {
    console.error("Reprocess error:", error);
    return new Response(
      JSON.stringify({
        ok: false,
        error: error instanceof Error ? error.message : "Internal error",
      }),
      { status: 500, headers: { ...CORS_HEADERS, "Content-Type": "application/json" } }
    );
  }
});
