import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { requireAdminSession, CORS_HEADERS } from "../_shared/adminSession.ts";

// Feeds the Dashboard's Agency-summary and Global-summary sections (the
// Software-summary section already has its own real data source,
// admin-publishing-stats — this function deliberately does not duplicate
// it). Every number here is a live count from a real table at request
// time. If a table/column this function expects doesn't exist for some
// reason, that one field is omitted from the response rather than
// defaulting to 0 or any other fabricated value — the frontend renders an
// explicit "no data available" state for anything missing, never a fake
// number dressed up as real.

const JSON_HEADERS = { ...CORS_HEADERS, "Content-Type": "application/json" };

function jsonResponse(body: unknown, status = 200) {
  return new Response(JSON.stringify(body), { status, headers: JSON_HEADERS });
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: CORS_HEADERS });
  }

  try {
    await requireAdminSession(req);
    if (req.method !== "GET") {
      return jsonResponse({ ok: false, error: "Method not allowed" }, 405);
    }

    const supabaseUrl = Deno.env.get("SUPABASE_URL");
    const serviceRoleKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");
    if (!supabaseUrl || !serviceRoleKey) {
      throw new Error("Missing Supabase credentials");
    }
    const supabase = createClient(supabaseUrl, serviceRoleKey);

    // Each count is independent — a failure on one table (e.g. it's been
    // renamed/removed) must not take down the others. `null` means
    // "unavailable", never 0.
    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    async function safeCount(table: string, filter?: (q: any) => any): Promise<number | null> {
      try {
        let query = supabase.from(table).select("*", { count: "exact", head: true });
        if (filter) query = filter(query);
        const { count, error } = await query;
        if (error) {
          console.error(`[admin-workspace-stats] ${table} count failed:`, error.message);
          return null;
        }
        return count ?? 0;
      } catch (e) {
        console.error(`[admin-workspace-stats] ${table} count threw:`, e);
        return null;
      }
    }

    const todayStartIso = new Date(new Date().setUTCHours(0, 0, 0, 0)).toISOString();

    const [
      totalAgencies,
      paidListings,
      agencyReviews,
      auditLogTotal,
      auditLogToday,
      contactMessages,
    ] = await Promise.all([
      safeCount("other_agencies"),
      safeCount("agency_listings", (q) => q.eq("paid_active", true)),
      safeCount("agency_reviews"),
      safeCount("admin_audit_log"),
      safeCount("admin_audit_log", (q) => q.gte("created_at", todayStartIso)),
      safeCount("contact_messages"),
    ]);

    return jsonResponse({
      ok: true,
      data: {
        agency: {
          total_agencies: totalAgencies,
          paid_listings: paidListings,
          reviews: agencyReviews,
        },
        global: {
          audit_log_total: auditLogTotal,
          audit_log_today: auditLogToday,
          contact_messages_total: contactMessages,
        },
      },
    });
  } catch (error) {
    const errorMessage = error instanceof Error ? error.message : "Unknown error";
    if (errorMessage.includes("session") || errorMessage.includes("token") || errorMessage.includes("Missing admin")) {
      return jsonResponse({ ok: false, error: "Invalid or expired admin session" }, 401);
    }
    return jsonResponse({ ok: false, error: errorMessage }, 500);
  }
});
