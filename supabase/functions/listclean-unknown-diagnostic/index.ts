import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { requireAdminSession, CORS_HEADERS } from "../_shared/adminSession.ts";

interface DiagnosticEmailRow {
  id: string;
  email_normalized: string;
  agency_id: string | null;
  agency_name: string | null;
  state_slug: string;
  validation_status: string;
  verification_external_status: string | null;
  verification_external_reason: string | null;
  verification_bucket_source: string | null;
  verification_state: string;
  verification_attempt_count: number;
  verification_next_retry_at: string | null;
  validation_checked_at: string | null;
  updated_at: string;
}

interface DiagnosticResponse {
  ok: boolean;
  filters: {
    state_slug?: string;
    limit: number;
  };
  total_retry_count: number;
  total_failed_count: number;
  sample_count: number;
  analysis_basis: "sample_only";
  samples: DiagnosticEmailRow[];
  analysis: {
    retry_with_scheduled_next: number;
    failed_max_retries: number;
    has_clean_bucket_source: number;
    high_retry_count: number;
  };
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

    const supabaseUrl = Deno.env.get("SUPABASE_URL");
    const supabaseServiceKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");

    if (!supabaseUrl || !supabaseServiceKey) {
      throw new Error("Supabase credentials not configured");
    }

    const supabase = createClient(supabaseUrl, supabaseServiceKey);

    const url = new URL(req.url);
    const stateSlug = url.searchParams.get("state_slug") || undefined;
    const limit = Math.min(parseInt(url.searchParams.get("limit") || "50"), 200);

    let retryQuery = supabase
      .from("other_agency_emails")
      .select("id", { count: "exact" })
      .eq("validation_status", "retry");

    if (stateSlug) {
      retryQuery = retryQuery.eq("state_slug", stateSlug);
    }

    const { count: retryCount } = await retryQuery.limit(0);

    let failedQuery = supabase
      .from("other_agency_emails")
      .select("id", { count: "exact" })
      .eq("validation_status", "failed");

    if (stateSlug) {
      failedQuery = failedQuery.eq("state_slug", stateSlug);
    }

    const { count: failedCount } = await failedQuery.limit(0);

    let query = supabase
      .from("other_agency_emails")
      .select(
        `
        id,
        email_normalized,
        agency_id,
        state_slug,
        validation_status,
        verification_external_status,
        verification_external_reason,
        verification_bucket_source,
        verification_state,
        verification_attempt_count,
        verification_next_retry_at,
        validation_checked_at,
        updated_at,
        other_agencies!agency_id(name)
      `,
        { count: "exact" }
      )
      .or("validation_status.eq.retry,validation_status.eq.failed");

    if (stateSlug) {
      query = query.eq("state_slug", stateSlug);
    }

    const { data, error } = await query.limit(limit);

    if (error) throw error;

    const samples = (data || []).map((row: any) => ({
      id: row.id,
      email_normalized: row.email_normalized,
      agency_id: row.agency_id,
      agency_name: row.other_agencies?.name || null,
      state_slug: row.state_slug,
      validation_status: row.validation_status,
      verification_external_status: row.verification_external_status,
      verification_external_reason: row.verification_external_reason,
      verification_bucket_source: row.verification_bucket_source,
      verification_state: row.verification_state,
      verification_attempt_count: row.verification_attempt_count,
      verification_next_retry_at: row.verification_next_retry_at,
      validation_checked_at: row.validation_checked_at,
      updated_at: row.updated_at,
    }));

    const analysis = {
      retry_with_scheduled_next: samples.filter(
        (s: DiagnosticEmailRow) => s.validation_status === "retry" && s.verification_next_retry_at !== null
      ).length,
      failed_max_retries: samples.filter(
        (s: DiagnosticEmailRow) => s.validation_status === "failed" && s.verification_attempt_count >= 6
      ).length,
      has_clean_bucket_source: samples.filter(
        (s: DiagnosticEmailRow) => s.verification_bucket_source === "clean"
      ).length,
      high_retry_count: samples.filter(
        (s: DiagnosticEmailRow) => s.verification_attempt_count > 3
      ).length,
    };

    const response: DiagnosticResponse = {
      ok: true,
      filters: {
        state_slug: stateSlug,
        limit,
      },
      total_retry_count: retryCount || 0,
      total_failed_count: failedCount || 0,
      sample_count: samples.length,
      analysis_basis: "sample_only",
      samples,
      analysis,
    };

    return new Response(JSON.stringify(response), {
      status: 200,
      headers: { ...CORS_HEADERS, "Content-Type": "application/json" },
    });
  } catch (error) {
    console.error("Diagnostic error:", error);
    return new Response(
      JSON.stringify({
        ok: false,
        error: error instanceof Error ? error.message : "Internal error",
      }),
      { status: 500, headers: { ...CORS_HEADERS, "Content-Type": "application/json" } }
    );
  }
});
