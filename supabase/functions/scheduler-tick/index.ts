import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { tickScheduler } from "../_shared/schedulerRunner.ts";

// Fired every minute by a single permanent pg_cron entry (see migration
// 20260713170000). This is the platform's heartbeat: claims every
// scheduled_jobs row that is enabled and due (or whose lease expired —
// crash recovery), runs each via its registered handler, records history,
// and computes each job's next run. Nothing here is itself "the pipeline"
// — it only decides when to call the existing Discovery/Crawl/etc. logic
// that already exists.
//
// Auth: a dedicated shared secret (SCHEDULER_TICK_SECRET) known only to
// this function and the pg_cron job that calls it (stored in Supabase
// Vault, injected into the cron command's headers — see migration
// 20260713170000). Deliberately its OWN secret rather than reusing
// SUPABASE_SERVICE_ROLE_KEY via vault.decrypted_secrets the way the older
// daily-funnel-summary cron job does: that job's vault entries
// (supabase_url / supabase_service_role_key) turned out to have never
// actually been populated (a pre-existing gap, unrelated to this work),
// which would have made this function's auth silently no-op too had it
// depended on the same missing secrets.

const CORS_HEADERS = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "POST, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey, x-scheduler-secret",
};

const JSON_HEADERS = { ...CORS_HEADERS, "Content-Type": "application/json" };
function jsonResponse(body: unknown, status = 200) {
  return new Response(JSON.stringify(body), { status, headers: JSON_HEADERS });
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") return new Response(null, { status: 200, headers: CORS_HEADERS });
  if (req.method !== "POST") return jsonResponse({ ok: false, error: "Method not allowed" }, 405);

  const tickSecret = Deno.env.get("SCHEDULER_TICK_SECRET");
  const providedSecret = req.headers.get("x-scheduler-secret");
  if (!tickSecret || providedSecret !== tickSecret) {
    return jsonResponse({ ok: false, error: "FORBIDDEN" }, 403);
  }

  try {
    const supabaseUrl = Deno.env.get("SUPABASE_URL");
    const serviceRoleKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");
    const anonKey = Deno.env.get("SUPABASE_ANON_KEY") || "";
    if (!supabaseUrl || !serviceRoleKey) throw new Error("Missing Supabase credentials");
    const supabase = createClient(supabaseUrl, serviceRoleKey);

    const summary = await tickScheduler(supabase, supabaseUrl, anonKey);
    return jsonResponse({ ok: true, data: summary });
  } catch (error) {
    const message = error instanceof Error ? error.message : "Unknown error";
    return jsonResponse({ ok: false, error: message }, 500);
  }
});
