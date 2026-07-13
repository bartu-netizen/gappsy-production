import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { requireAdminSession, CORS_HEADERS } from "../_shared/adminSession.ts";
import { writeAuditLog } from "../_shared/adminAuth.ts";
import { getProvider } from "../_shared/discoveryProviders/registry.ts";
import { runProvider } from "../_shared/discoveryProviderRunner.ts";

// Provider registry CRUD + execution. GET lists every provider with a live
// candidate count (discovered_tools rows), or GET ?id=&runs=true lists a
// provider's run history (Provider Logs). PUT ?id= toggles enabled/updates
// config/schedule. POST {action:'run', id} manually triggers a fetch via
// the shared discoveryProviderRunner — the same path a future scheduler
// would call, just with trigger:'manual'. Adding a NEW automated provider
// is a migration seed row + a provider module (see _shared/
// discoveryProviders/), never a change to this function.

const SCHEDULE_FREQUENCIES = new Set(["hourly", "daily", "weekly", "manual"]);

const JSON_HEADERS = { ...CORS_HEADERS, "Content-Type": "application/json" };

function jsonResponse(body: unknown, status = 200) {
  return new Response(JSON.stringify(body), { status, headers: JSON_HEADERS });
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: CORS_HEADERS });
  }

  try {
    const session = await requireAdminSession(req);

    const supabaseUrl = Deno.env.get("SUPABASE_URL");
    const serviceRoleKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");
    if (!supabaseUrl || !serviceRoleKey) throw new Error("Missing Supabase credentials");
    const supabase = createClient(supabaseUrl, serviceRoleKey);

    const url = new URL(req.url);
    const id = url.searchParams.get("id");

    if (req.method === "GET") {
      if (id && url.searchParams.get("runs") === "true") {
        const page = Math.max(1, Number(url.searchParams.get("page")) || 1);
        const perPage = Math.min(100, Math.max(1, Number(url.searchParams.get("per_page")) || 25));
        const { data: runs, error, count } = await supabase
          .from("discovery_provider_runs")
          .select("*", { count: "exact" })
          .eq("provider_id", id)
          .order("started_at", { ascending: false })
          .range((page - 1) * perPage, page * perPage - 1);
        if (error) return jsonResponse({ ok: false, error: error.message }, 500);
        return jsonResponse({ ok: true, data: runs || [], total: count || 0, page, per_page: perPage });
      }

      const { data: providers, error } = await supabase.from("discovery_providers").select("*").order("priority", { ascending: true });
      if (error) return jsonResponse({ ok: false, error: error.message }, 500);

      const withCounts = await Promise.all(
        (providers || []).map(async (provider: { id: string }) => {
          const { count } = await supabase
            .from("discovered_tools")
            .select("id", { count: "exact", head: true })
            .eq("provider_id", provider.id);
          return { ...provider, candidate_count: count || 0 };
        }),
      );

      return jsonResponse({ ok: true, data: withCounts });
    }

    if (req.method === "PUT") {
      if (!id) return jsonResponse({ ok: false, error: "Provider ID is required" }, 400);
      const payload = await req.json();

      const updates: Record<string, unknown> = { updated_at: new Date().toISOString() };
      if (Object.prototype.hasOwnProperty.call(payload, "enabled")) updates.enabled = Boolean(payload.enabled);
      if (Object.prototype.hasOwnProperty.call(payload, "config") && typeof payload.config === "object" && payload.config !== null) {
        updates.config = payload.config;
      }
      if (Object.prototype.hasOwnProperty.call(payload, "priority")) {
        const priority = Number(payload.priority);
        if (!Number.isFinite(priority)) return jsonResponse({ ok: false, error: "priority must be a number" }, 400);
        updates.priority = Math.round(priority);
      }
      if (Object.prototype.hasOwnProperty.call(payload, "rate_limit_per_run")) {
        const rateLimit = Number(payload.rate_limit_per_run);
        if (!Number.isFinite(rateLimit) || rateLimit <= 0) return jsonResponse({ ok: false, error: "rate_limit_per_run must be a positive number" }, 400);
        updates.rate_limit_per_run = Math.round(rateLimit);
      }
      if (Object.prototype.hasOwnProperty.call(payload, "schedule_frequency")) {
        if (typeof payload.schedule_frequency !== "string" || !SCHEDULE_FREQUENCIES.has(payload.schedule_frequency)) {
          return jsonResponse({ ok: false, error: `schedule_frequency must be one of: ${[...SCHEDULE_FREQUENCIES].join(", ")}` }, 400);
        }
        updates.schedule_frequency = payload.schedule_frequency;
      }
      // Admin cursor reset — the next run starts fresh (cursorIn = null)
      // instead of resuming from wherever this provider last left off.
      // Never happens as a side effect of any other update; only when
      // explicitly requested.
      if (payload.reset_cursor === true) {
        updates.last_cursor = null;
        updates.cursor_reset_at = updates.updated_at;
      }

      const { data: record, error } = await supabase.from("discovery_providers").update(updates).eq("id", id).select().single();
      if (error) return jsonResponse({ ok: false, error: error.message }, 500);
      if (!record) return jsonResponse({ ok: false, error: "Provider not found" }, 404);

      return jsonResponse({ ok: true, data: record });
    }

    if (req.method === "POST") {
      const payload = await req.json();
      if (payload.action !== "run") return jsonResponse({ ok: false, error: "Unknown action" }, 400);

      const providerId = typeof payload.id === "string" ? payload.id : null;
      if (!providerId) return jsonResponse({ ok: false, error: "id is required" }, 400);

      const { data: providerRow, error: providerError } = await supabase
        .from("discovery_providers")
        .select("id, key, enabled, implemented, config, rate_limit_per_run, last_cursor")
        .eq("id", providerId)
        .maybeSingle();
      if (providerError) return jsonResponse({ ok: false, error: providerError.message }, 500);
      if (!providerRow) return jsonResponse({ ok: false, error: "Provider not found" }, 404);
      if (!providerRow.implemented) {
        return jsonResponse({ ok: false, error: "This provider is not implemented yet — nothing to run." }, 409);
      }
      if (!providerRow.enabled) {
        return jsonResponse({ ok: false, error: "This provider is disabled — enable it before running." }, 409);
      }

      let provider;
      try {
        provider = getProvider(providerRow.key as string);
      } catch (err) {
        return jsonResponse({ ok: false, error: err instanceof Error ? err.message : "Unknown provider" }, 409);
      }

      const summary = await runProvider(
        supabase,
        provider,
        {
          id: providerRow.id as string,
          key: providerRow.key as string,
          config: (providerRow.config as Record<string, unknown>) || {},
          rate_limit_per_run: providerRow.rate_limit_per_run as number,
          last_cursor: (providerRow.last_cursor as string | null) ?? null,
        },
        "manual",
        session.email,
      );

      await writeAuditLog({
        actor_session_type: "session_token", actor_email: session.email || undefined,
        action: "discovery_provider_run", target_table: "discovery_providers", target_id: providerId,
        status: summary.status === "failed" ? "error" : "success",
        rejection_reason: summary.status === "failed" ? summary.error_message ?? undefined : undefined,
      });

      return jsonResponse({ ok: true, data: summary });
    }

    return jsonResponse({ ok: false, error: "Method not allowed" }, 405);
  } catch (error) {
    const errorMessage = error instanceof Error ? error.message : "Unknown error";
    if (errorMessage.includes("session") || errorMessage.includes("token") || errorMessage.includes("Missing admin")) {
      return jsonResponse({ ok: false, error: "Invalid or expired admin session" }, 401);
    }
    return jsonResponse({ ok: false, error: errorMessage }, 500);
  }
});
