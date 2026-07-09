import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "GET, POST, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, x-admin-token, x-admin-secret",
};

interface StateStatsRequest {
  action: "get_all_states" | "get_state_detail";
  state_slug?: string;
}

interface StateStatsSummary {
  state_slug: string;
  unique_agencies: number;
  total_emails: number;
  pending_verification: number;
  verification_valid: number;
  clean_coverage_rate: number;
  ready_to_sync_emails: number;
  ready_agencies: number;
  last_import_at: string | null;
  import_status: string | null;
}

interface StateStatsDetail {
  state_slug: string;
  inventory: {
    unique_agencies: number;
    total_imported_emails: number;
    avg_emails_per_agency: number;
    agencies_with_phone: number;
    agencies_with_website: number;
    agencies_with_0_emails: number;
    agencies_with_1_email: number;
    agencies_with_2_emails: number;
    agencies_with_3plus_emails: number;
  };
  verification_pipeline: {
    pending_verification: number;
    verification_processing: number;
    verification_retry: number;
    verification_failed: number;
    verification_valid: number;
    verification_invalid: number;
    verification_risky: number;
    verification_catch_all: number;
    avg_verification_attempts: number;
    last_queue_run_at: string | null;
  };
  clean_coverage: {
    unique_agencies_clean_1plus: number;
    agencies_clean_exactly_1: number;
    agencies_clean_2plus: number;
    agencies_clean_3plus: number;
    avg_clean_emails_per_agency: number;
    clean_coverage_rate: number;
  };
  send_ready: {
    unique_agencies_ready_for_smartlead: number;
    ready_to_sync_emails: number;
    role_based_clean_emails: number;
    personal_clean_emails: number;
    agencies_only_role_based_clean: number;
    agencies_with_personal_clean: number;
    send_ready_coverage_rate: number;
  };
  data_quality: {
    pct_without_website: number;
    pct_without_phone: number;
    duplicate_domain_rate: number;
    duplicate_email_rate: number;
    top_import_errors: string[];
  };
  cleaning_quality: {
    valid_rate: number;
    unknown_rate: number;
    risky_rate: number;
    catch_all_rate: number;
    avg_retries_per_unknown: number;
  };
  import_status: {
    last_import_job_id: string | null;
    last_import_at: string | null;
    import_status: string | null;
    rows_imported: number;
    rows_processed: number;
  };
}

async function validateAdmin(token: string, secret: string): Promise<boolean> {
  if (!token || !secret) return false;
  const ADMIN_SECRET = Deno.env.get("ADMIN_SECRET");
  return secret === ADMIN_SECRET;
}

async function getAllStateStats(supabase: any): Promise<StateStatsSummary[]> {
  const allStates = [
    "alabama", "alaska", "arizona", "arkansas", "california", "colorado", "connecticut",
    "delaware", "district-of-columbia", "florida", "georgia", "hawaii", "idaho",
    "illinois", "indiana", "iowa", "kansas", "kentucky", "louisiana", "maine",
    "maryland", "massachusetts", "michigan", "minnesota", "mississippi", "missouri",
    "montana", "nebraska", "nevada", "new-hampshire", "new-jersey", "new-mexico",
    "new-york", "north-carolina", "north-dakota", "ohio", "oklahoma", "oregon",
    "pennsylvania", "puerto-rico", "rhode-island", "south-carolina", "south-dakota",
    "tennessee", "texas", "utah", "vermont", "virginia", "washington",
    "west-virginia", "wisconsin", "wyoming"
  ];

  const summaries: StateStatsSummary[] = [];

  for (const state_slug of allStates) {
    try {
      const { data: stats, error: statsErr } = await supabase
        .from("other_agencies_state_stats")
        .select("*")
        .eq("state_slug", state_slug)
        .maybeSingle();

      if (statsErr || !stats) {
        summaries.push({
          state_slug,
          unique_agencies: 0,
          total_emails: 0,
          pending_verification: 0,
          verification_valid: 0,
          clean_coverage_rate: 0,
          ready_to_sync_emails: 0,
          ready_agencies: 0,
          last_import_at: null,
          import_status: null,
        });
        continue;
      }

      summaries.push({
        state_slug,
        unique_agencies: stats.unique_agencies || 0,
        total_emails: stats.total_imported_emails || 0,
        pending_verification: stats.pending_verification || 0,
        verification_valid: stats.verification_valid || 0,
        clean_coverage_rate: parseFloat(stats.clean_coverage_rate || "0"),
        ready_to_sync_emails: stats.ready_to_sync_emails || 0,
        ready_agencies: stats.unique_agencies_ready_for_smartlead || 0,
        last_import_at: stats.last_import_at,
        import_status: stats.import_status,
      });
    } catch (err) {
      console.error(`Error fetching stats for ${state_slug}:`, err);
      summaries.push({
        state_slug,
        unique_agencies: 0,
        total_emails: 0,
        pending_verification: 0,
        verification_valid: 0,
        clean_coverage_rate: 0,
        ready_to_sync_emails: 0,
        ready_agencies: 0,
        last_import_at: null,
        import_status: null,
      });
    }
  }

  return summaries;
}

async function getStateDetail(supabase: any, state_slug: string): Promise<StateStatsDetail> {
  const { data: stats, error: statsErr } = await supabase
    .from("other_agencies_state_stats")
    .select("*")
    .eq("state_slug", state_slug)
    .maybeSingle();

  if (statsErr || !stats) {
    return {
      state_slug,
      inventory: {
        unique_agencies: 0,
        total_imported_emails: 0,
        avg_emails_per_agency: 0,
        agencies_with_phone: 0,
        agencies_with_website: 0,
        agencies_with_0_emails: 0,
        agencies_with_1_email: 0,
        agencies_with_2_emails: 0,
        agencies_with_3plus_emails: 0,
      },
      verification_pipeline: {
        pending_verification: 0,
        verification_processing: 0,
        verification_retry: 0,
        verification_failed: 0,
        verification_valid: 0,
        verification_invalid: 0,
        verification_risky: 0,
        verification_catch_all: 0,
        avg_verification_attempts: 0,
        last_queue_run_at: null,
      },
      clean_coverage: {
        unique_agencies_clean_1plus: 0,
        agencies_clean_exactly_1: 0,
        agencies_clean_2plus: 0,
        agencies_clean_3plus: 0,
        avg_clean_emails_per_agency: 0,
        clean_coverage_rate: 0,
      },
      send_ready: {
        unique_agencies_ready_for_smartlead: 0,
        ready_to_sync_emails: 0,
        role_based_clean_emails: 0,
        personal_clean_emails: 0,
        agencies_only_role_based_clean: 0,
        agencies_with_personal_clean: 0,
        send_ready_coverage_rate: 0,
      },
      data_quality: {
        pct_without_website: 0,
        pct_without_phone: 0,
        duplicate_domain_rate: 0,
        duplicate_email_rate: 0,
        top_import_errors: [],
      },
      cleaning_quality: {
        valid_rate: 0,
        unknown_rate: 0,
        risky_rate: 0,
        catch_all_rate: 0,
        avg_retries_per_unknown: 0,
      },
      import_status: {
        last_import_job_id: null,
        last_import_at: null,
        import_status: null,
        rows_imported: 0,
        rows_processed: 0,
      },
    };
  }

  const topErrors = Array.isArray(stats.top_import_errors_json) ? stats.top_import_errors_json.slice(0, 5) : [];

  return {
    state_slug,
    inventory: {
      unique_agencies: stats.unique_agencies || 0,
      total_imported_emails: stats.total_imported_emails || 0,
      avg_emails_per_agency: parseFloat(stats.avg_emails_per_agency || "0"),
      agencies_with_phone: stats.agencies_with_phone || 0,
      agencies_with_website: stats.agencies_with_website || 0,
      agencies_with_0_emails: stats.agencies_with_0_emails || 0,
      agencies_with_1_email: stats.agencies_with_1_email || 0,
      agencies_with_2_emails: stats.agencies_with_2_emails || 0,
      agencies_with_3plus_emails: stats.agencies_with_3plus_emails || 0,
    },
    verification_pipeline: {
      pending_verification: stats.pending_verification || 0,
      verification_processing: stats.verification_processing || 0,
      verification_retry: stats.verification_retry || 0,
      verification_failed: stats.verification_failed || 0,
      verification_valid: stats.verification_valid || 0,
      verification_invalid: stats.verification_invalid || 0,
      verification_risky: stats.verification_risky || 0,
      verification_catch_all: stats.verification_catch_all || 0,
      avg_verification_attempts: parseFloat(stats.avg_verification_attempts || "0"),
      last_queue_run_at: stats.last_queue_run_at,
    },
    clean_coverage: {
      unique_agencies_clean_1plus: stats.unique_agencies_clean_1plus || 0,
      agencies_clean_exactly_1: stats.agencies_clean_exactly_1 || 0,
      agencies_clean_2plus: stats.agencies_clean_2plus || 0,
      agencies_clean_3plus: stats.agencies_clean_3plus || 0,
      avg_clean_emails_per_agency: parseFloat(stats.avg_clean_emails_per_agency || "0"),
      clean_coverage_rate: parseFloat(stats.clean_coverage_rate || "0"),
    },
    send_ready: {
      unique_agencies_ready_for_smartlead: stats.unique_agencies_ready_for_smartlead || 0,
      ready_to_sync_emails: stats.ready_to_sync_emails || 0,
      role_based_clean_emails: stats.role_based_clean_emails || 0,
      personal_clean_emails: stats.personal_clean_emails || 0,
      agencies_only_role_based_clean: stats.agencies_only_role_based_clean || 0,
      agencies_with_personal_clean: stats.agencies_with_personal_clean || 0,
      send_ready_coverage_rate: parseFloat(stats.send_ready_coverage_rate || "0"),
    },
    data_quality: {
      pct_without_website: parseFloat(stats.pct_without_website || "0"),
      pct_without_phone: parseFloat(stats.pct_without_phone || "0"),
      duplicate_domain_rate: parseFloat(stats.duplicate_domain_rate || "0"),
      duplicate_email_rate: parseFloat(stats.duplicate_email_rate || "0"),
      top_import_errors: topErrors,
    },
    cleaning_quality: {
      valid_rate: parseFloat(stats.valid_rate || "0"),
      unknown_rate: parseFloat(stats.unknown_rate || "0"),
      risky_rate: parseFloat(stats.risky_rate || "0"),
      catch_all_rate: parseFloat(stats.catch_all_rate || "0"),
      avg_retries_per_unknown: parseFloat(stats.avg_retries_per_unknown || "0"),
    },
    import_status: {
      last_import_job_id: stats.last_import_job_id,
      last_import_at: stats.last_import_at,
      import_status: stats.import_status,
      rows_imported: stats.rows_imported || 0,
      rows_processed: stats.rows_processed || 0,
    },
  };
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: corsHeaders });
  }

  if (req.method !== "POST") {
    return new Response(JSON.stringify({ error: "Method not allowed" }), { status: 405, headers: corsHeaders });
  }

  try {
    const body = (await req.json()) as StateStatsRequest;
    const adminToken = req.headers.get("x-admin-token") || "";
    const adminSecret = req.headers.get("x-admin-secret") || "";

    if (!(await validateAdmin(adminToken, adminSecret))) {
      return new Response(JSON.stringify({ error: "Unauthorized" }), { status: 401, headers: corsHeaders });
    }

    const SUPABASE_URL = Deno.env.get("SUPABASE_URL") as string;
    const SERVICE_ROLE_KEY = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY") as string;
    const supabase = createClient(SUPABASE_URL, SERVICE_ROLE_KEY);

    const { action } = body;

    if (action === "get_all_states") {
      const summaries = await getAllStateStats(supabase);
      return new Response(
        JSON.stringify({
          ok: true,
          action: "get_all_states",
          states: summaries,
        }),
        { headers: { ...corsHeaders, "Content-Type": "application/json" } }
      );
    }

    if (action === "get_state_detail") {
      if (!body.state_slug) {
        return new Response(JSON.stringify({ error: "Missing state_slug" }), { status: 400, headers: corsHeaders });
      }

      const detail = await getStateDetail(supabase, body.state_slug);
      return new Response(
        JSON.stringify({
          ok: true,
          action: "get_state_detail",
          data: detail,
        }),
        { headers: { ...corsHeaders, "Content-Type": "application/json" } }
      );
    }

    return new Response(JSON.stringify({ error: "Unknown action" }), { status: 400, headers: corsHeaders });
  } catch (err) {
    return new Response(JSON.stringify({ error: String(err) }), { status: 500, headers: corsHeaders });
  }
});
