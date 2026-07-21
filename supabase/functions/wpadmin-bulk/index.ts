import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { authenticateAdmin, createAuthErrorResponse, writeAuditLog } from "../_shared/adminAuth.ts";
import { fetchInChunks } from "../_shared/dbChunking.ts";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "POST, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey, x-admin-secret, x-admin-token",
};

function jsonResponse(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), {
    status,
    headers: { ...corsHeaders, "Content-Type": "application/json" },
  });
}

function csvResponse(csv: string, filename: string): Response {
  return new Response(csv, {
    status: 200,
    headers: {
      ...corsHeaders,
      "Content-Type": "text/csv; charset=utf-8",
      "Content-Disposition": `attachment; filename="${filename}"`,
    },
  });
}

type TableKind =
  | "matched_leads"
  | "spotlight_applications"
  | "top25_applications"
  | "agency_availability_requests"
  | "owner_demo_events";

const VALID_TABLES = new Set<string>([
  "matched_leads",
  "spotlight_applications",
  "top25_applications",
  "agency_availability_requests",
  "owner_demo_events",
]);

function parseUnifiedIds(ids: string[]): { table: TableKind; id: string }[] {
  const result: { table: TableKind; id: string }[] = [];
  for (const uid of ids) {
    const sep = uid.indexOf(":");
    if (sep < 1) continue;
    const table = uid.slice(0, sep);
    const id = uid.slice(sep + 1);
    if (VALID_TABLES.has(table) && id) {
      result.push({ table: table as TableKind, id });
    }
  }
  return result;
}

function str(v: unknown): string {
  const s = String(v ?? "").trim();
  return s === "null" || s === "undefined" ? "" : s;
}

function fmtDate(iso: string): string {
  if (!iso) return "";
  try {
    return new Date(iso).toLocaleDateString("en-US", {
      month: "short", day: "numeric", year: "numeric",
      hour: "2-digit", minute: "2-digit"
    });
  } catch {
    return iso;
  }
}

function normalizeRow(table: TableKind, row: Record<string, unknown>): Record<string, string>[] {
  const base = {
    source_table: table,
    source_id: str(row.id),
    created_at: fmtDate(str(row.created_at)),
    state: str(row.state_slug ?? row.state_name),
    status: str(row.status),
    is_demo: table === "agency_availability_requests" ? (row.is_demo ? "Yes" : "No") : "",
  };

  if (table === "matched_leads") {
    const emails = [str(row.email ?? row.client_email)].filter(Boolean);
    return (emails.length ? emails : [""]).map(email => ({
      ...base,
      type: "Get Matched",
      company: str(row.company_name ?? row.agency_name),
      contact: `${str(row.first_name)} ${str(row.last_name)}`.trim() || str(row.client_name ?? row.name),
      email,
      phone: str(row.phone ?? row.client_phone),
      service: str(row.service ?? row.service_needed),
      budget: str(row.budget ?? row.budget_range),
      timeline: str(row.timeline),
      message: str(row.message),
      funnel_stage: "",
      drop_off: "",
      payment: "",
    }));
  }

  if (table === "spotlight_applications") {
    return [{
      ...base,
      type: "Spotlight",
      company: str(row.agency_name ?? row.company_name),
      contact: str(row.contact_name),
      email: str(row.email ?? row.contact_email),
      phone: str(row.phone),
      service: str(row.package_type),
      budget: str(row.budget_range),
      timeline: "",
      message: str(row.message),
      funnel_stage: "",
      drop_off: "",
      payment: "",
    }];
  }

  if (table === "top25_applications") {
    return [{
      ...base,
      type: "Top 25",
      company: str(row.agency_name ?? row.company_name),
      contact: str(row.contact_name),
      email: str(row.email ?? row.contact_email),
      phone: str(row.phone),
      service: str(row.package),
      budget: "",
      timeline: "",
      message: str(row.message),
      funnel_stage: "",
      drop_off: "",
      payment: "",
    }];
  }

  if (table === "agency_availability_requests") {
    return [{
      ...base,
      type: "Availability",
      company: str(row.agency_name ?? row.target_agency_name),
      contact: str(row.requester_name ?? row.contact_name ?? row.client_name),
      email: str(row.requester_email ?? row.contact_email ?? row.client_email),
      phone: str(row.requester_phone ?? row.phone ?? row.client_phone),
      service: str(row.service_interest ?? row.service),
      budget: str(row.budget),
      timeline: str(row.timeline),
      message: str(row.requester_message ?? row.message),
      funnel_stage: "",
      drop_off: "",
      payment: "",
    }];
  }

  if (table === "owner_demo_events") {
    const meta = (row.metadata ?? {}) as Record<string, unknown>;
    const person = (meta.person ?? {}) as Record<string, unknown>;
    return [{
      ...base,
      type: "Demo/Connect",
      company: str(row.agency_name),
      contact: str(person.name ?? person.first_name),
      email: str(person.email),
      phone: "",
      service: str(row.event_name),
      budget: "",
      timeline: "",
      message: "",
      funnel_stage: "",
      drop_off: "",
      payment: "",
    }];
  }

  return [{ ...base, type: table, company: "", contact: "", email: "", phone: "", service: "", budget: "", timeline: "", message: "", funnel_stage: "", drop_off: "", payment: "" }];
}

const CSV_HEADERS = [
  "type", "source_table", "source_id", "is_demo",
  "created_at", "state", "status",
  "company", "contact", "email", "phone",
  "service", "budget", "timeline", "message",
  "funnel_stage", "drop_off", "payment",
];

function buildCsv(normalizedRows: Record<string, string>[]): string {
  const esc = (v: string) => `"${v.replace(/"/g, '""')}"`;
  const header = CSV_HEADERS.map(esc).join(";");
  const rows = normalizedRows.map(r =>
    CSV_HEADERS.map(k => esc(r[k] ?? "")).join(";")
  );
  return [header, ...rows].join("\n");
}

async function fetchRowsByTable(
  supabase: ReturnType<typeof createClient>,
  parsed: { table: TableKind; id: string }[]
): Promise<{ table: TableKind; row: Record<string, unknown> }[]> {
  const byTable = new Map<TableKind, string[]>();
  for (const { table, id } of parsed) {
    if (!byTable.has(table)) byTable.set(table, []);
    byTable.get(table)!.push(id);
  }

  const results: { table: TableKind; row: Record<string, unknown> }[] = [];

  await Promise.all(
    Array.from(byTable.entries()).map(async ([table, ids]) => {
      const { data, error } = await fetchInChunks(ids, (chunk) =>
        supabase.from(table).select("*").in("id", chunk)
      );
      if (!error && data) {
        for (const row of data) {
          results.push({ table, row: row as Record<string, unknown> });
        }
      }
    })
  );

  return results;
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: corsHeaders });
  }

  if (req.method !== "POST") {
    return jsonResponse({ error: "Method not allowed" }, 405);
  }

  const authResult = await authenticateAdmin(req);
  if (!authResult.success) {
    return createAuthErrorResponse(authResult, corsHeaders);
  }

  const SUPABASE_URL = Deno.env.get("SUPABASE_URL");
  const SUPABASE_SERVICE_KEY = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");
  if (!SUPABASE_URL || !SUPABASE_SERVICE_KEY) {
    return jsonResponse({ error: "Missing server config" }, 500);
  }

  const supabase = createClient(SUPABASE_URL, SUPABASE_SERVICE_KEY, {
    auth: { autoRefreshToken: false, persistSession: false },
  });

  const url = new URL(req.url);
  const action = url.searchParams.get("action");

  let body: Record<string, unknown> = {};
  try {
    body = await req.json();
  } catch {
    return jsonResponse({ error: "Invalid JSON body" }, 400);
  }

  const ids = Array.isArray(body.ids) ? (body.ids as string[]) : [];
  if (ids.length === 0) {
    return jsonResponse({ error: "No ids provided" }, 400);
  }
  if (ids.length > 500) {
    return jsonResponse({ error: "Too many ids (max 500)" }, 400);
  }

  const parsed = parseUnifiedIds(ids);
  if (parsed.length === 0) {
    return jsonResponse({ error: "No valid ids after parsing" }, 400);
  }

  try {
    // ── EXPORT ──────────────────────────────────────────────────────────────
    if (action === "export") {
      const rows = await fetchRowsByTable(supabase, parsed);

      const ordered: typeof rows = [];
      for (const uid of ids) {
        const sep = uid.indexOf(":");
        if (sep < 1) continue;
        const table = uid.slice(0, sep) as TableKind;
        const id = uid.slice(sep + 1);
        const found = rows.find(r => r.table === table && str(r.row.id) === id);
        if (found) ordered.push(found);
      }

      const normalized = ordered.flatMap(({ table, row }) => normalizeRow(table, row));
      const csv = buildCsv(normalized);
      const today = new Date().toISOString().slice(0, 10);
      return csvResponse(csv, `submissions-selected-${today}.csv`);
    }

    // ── DELETE ───────────────────────────────────────────────────────────────
    if (action === "delete") {
      const now = new Date().toISOString();
      const deletedBy = authResult.sessionType ?? "admin";

      const byTable = new Map<TableKind, string[]>();
      for (const { table, id } of parsed) {
        if (!byTable.has(table)) byTable.set(table, []);
        byTable.get(table)!.push(id);
      }

      const errors: string[] = [];
      let totalDeleted = 0;

      // A single .in("id", tableIds) update can carry up to 500 UUIDs inlined
      // into the request — the same URL-length class that broke
      // tool-analytics/tool-comparisons — so each table's ids are chunked
      // into parallel sub-updates rather than one giant call.
      const CHUNK_SIZE = 100;
      await Promise.all(
        Array.from(byTable.entries()).flatMap(([table, tableIds]) => {
          const chunks: string[][] = [];
          for (let i = 0; i < tableIds.length; i += CHUNK_SIZE) chunks.push(tableIds.slice(i, i + CHUNK_SIZE));
          return chunks.map(async (chunk) => {
            const { error, count } = await supabase
              .from(table)
              .update({ deleted_at: now, deleted_by: deletedBy })
              .in("id", chunk)
              .select("id", { count: "exact", head: true });

            if (error) {
              errors.push(`${table}: ${error.message}`);
            } else {
              totalDeleted += count ?? chunk.length;
            }
          });
        })
      );

      await writeAuditLog({
        actor_session_type: authResult.sessionType ?? "unknown",
        action: "bulk_delete_submissions",
        payload_hash: ids.join(",").slice(0, 200),
        status: errors.length > 0 ? "error" : "success",
        rejection_reason: errors.length > 0 ? errors.join("; ") : undefined,
      });

      if (errors.length > 0) {
        return jsonResponse({ ok: false, errors, deleted: totalDeleted }, 207);
      }

      return jsonResponse({ ok: true, deleted: totalDeleted });
    }

    return jsonResponse({ error: "Unknown action. Use ?action=export or ?action=delete" }, 400);
  } catch (err) {
    console.error("[wpadmin-bulk] Unexpected error:", err);
    return jsonResponse({ error: err instanceof Error ? err.message : "Unknown error" }, 500);
  }
});
