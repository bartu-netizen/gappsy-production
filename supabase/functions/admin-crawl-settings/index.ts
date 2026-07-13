import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { requireAdminSession, CORS_HEADERS } from "../_shared/adminSession.ts";
import { writeAuditLog } from "../_shared/adminAuth.ts";

// Singleton settings row (id=true) governing crawl worker concurrency —
// see claim_crawl_jobs()/crawl_settings in the 20260713140000 migration.
// GET returns it (seeded by migration, so it always exists); PUT updates
// it. Every bound is enforced twice: here (fast, clear error message) and
// again by the table's own CHECK constraints (the real backstop — this
// endpoint cannot be bypassed into an unsafe value even by a bug here).

const JSON_HEADERS = { ...CORS_HEADERS, "Content-Type": "application/json" };
function jsonResponse(body: unknown, status = 200) {
  return new Response(JSON.stringify(body), { status, headers: JSON_HEADERS });
}

const MAX_CONCURRENT_CRAWLS_BOUNDS = { min: 1, max: 4 };
const LEASE_SECONDS_BOUNDS = { min: 30, max: 1200 };
const MAX_AUTO_RETRIES_BOUNDS = { min: 0, max: 10 };

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") return new Response(null, { status: 200, headers: CORS_HEADERS });

  try {
    const session = await requireAdminSession(req);
    const supabaseUrl = Deno.env.get("SUPABASE_URL");
    const serviceRoleKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");
    if (!supabaseUrl || !serviceRoleKey) throw new Error("Missing Supabase credentials");
    const supabase = createClient(supabaseUrl, serviceRoleKey);

    if (req.method === "GET") {
      const { data, error } = await supabase.from("crawl_settings").select("*").eq("id", true).maybeSingle();
      if (error) return jsonResponse({ ok: false, error: error.message }, 500);
      return jsonResponse({ ok: true, data, bounds: { max_concurrent_crawls: MAX_CONCURRENT_CRAWLS_BOUNDS, lease_seconds: LEASE_SECONDS_BOUNDS, max_auto_retries: MAX_AUTO_RETRIES_BOUNDS } });
    }

    if (req.method !== "PUT") return jsonResponse({ ok: false, error: "Method not allowed" }, 405);
    const payload = await req.json();
    const update: Record<string, unknown> = { updated_by: session.email, updated_at: new Date().toISOString() };

    if (payload.max_concurrent_crawls !== undefined) {
      const v = Math.round(Number(payload.max_concurrent_crawls));
      if (!Number.isFinite(v) || v < MAX_CONCURRENT_CRAWLS_BOUNDS.min || v > MAX_CONCURRENT_CRAWLS_BOUNDS.max) {
        return jsonResponse({ ok: false, error: `max_concurrent_crawls must be between ${MAX_CONCURRENT_CRAWLS_BOUNDS.min} and ${MAX_CONCURRENT_CRAWLS_BOUNDS.max}` }, 400);
      }
      update.max_concurrent_crawls = v;
    }
    if (payload.lease_seconds !== undefined) {
      const v = Math.round(Number(payload.lease_seconds));
      if (!Number.isFinite(v) || v < LEASE_SECONDS_BOUNDS.min || v > LEASE_SECONDS_BOUNDS.max) {
        return jsonResponse({ ok: false, error: `lease_seconds must be between ${LEASE_SECONDS_BOUNDS.min} and ${LEASE_SECONDS_BOUNDS.max}` }, 400);
      }
      update.lease_seconds = v;
    }
    if (payload.max_auto_retries !== undefined) {
      const v = Math.round(Number(payload.max_auto_retries));
      if (!Number.isFinite(v) || v < MAX_AUTO_RETRIES_BOUNDS.min || v > MAX_AUTO_RETRIES_BOUNDS.max) {
        return jsonResponse({ ok: false, error: `max_auto_retries must be between ${MAX_AUTO_RETRIES_BOUNDS.min} and ${MAX_AUTO_RETRIES_BOUNDS.max}` }, 400);
      }
      update.max_auto_retries = v;
    }

    const { data: updated, error } = await supabase.from("crawl_settings").update(update).eq("id", true).select().single();
    if (error) return jsonResponse({ ok: false, error: error.message }, 500);

    await writeAuditLog({ actor_session_type: "session_token", actor_email: session.email || undefined, action: "crawl_settings_updated", target_table: "crawl_settings", target_id: "singleton", status: "success" });
    return jsonResponse({ ok: true, data: updated });
  } catch (error) {
    const errorMessage = error instanceof Error ? error.message : "Unknown error";
    if (errorMessage.includes("session") || errorMessage.includes("token") || errorMessage.includes("Missing admin")) {
      return jsonResponse({ ok: false, error: "Invalid or expired admin session" }, 401);
    }
    return jsonResponse({ ok: false, error: "An unexpected error occurred." }, 500);
  }
});
