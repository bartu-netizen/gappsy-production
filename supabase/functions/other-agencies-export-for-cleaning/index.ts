import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { authenticateAdmin } from "../_shared/adminAuth.ts";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "GET, POST, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey, x-admin-token, x-admin-secret",
};

interface ExportRow {
  agency_id: string;
  email_id: string;
  agency_name: string;
  state_slug: string;
  website_url: string;
  phone: string;
  agency_slug: string;
  your_agency_path: string;
  your_agency_url: string;
  email: string;
  validation_status: string;
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: corsHeaders });
  }

  try {
    if (req.method !== "GET") {
      return new Response(
        JSON.stringify({ error: "Method not allowed" }),
        { status: 405, headers: { ...corsHeaders, "Content-Type": "application/json" } }
      );
    }

    const authResult = await authenticateAdmin(req);
    if (!authResult.success) {
      return new Response(
        JSON.stringify({ error: authResult.error?.message || "Unauthorized" }),
        { status: 401, headers: { ...corsHeaders, "Content-Type": "application/json" } }
      );
    }

    const supabaseUrl = Deno.env.get("SUPABASE_URL");
    const serviceRoleKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");
    if (!supabaseUrl || !serviceRoleKey) {
      throw new Error("Missing environment variables");
    }

    const supabase = createClient(supabaseUrl, serviceRoleKey);

    const url = new URL(req.url);
    const stateSlug = url.searchParams.get("state");
    const validationStatus = url.searchParams.get("validation_status") || "pending";
    const format = url.searchParams.get("format") || "csv";
    const baseUrl = url.searchParams.get("base_url") || "https://www.gappsy.com";

    if (!stateSlug) {
      return new Response(
        JSON.stringify({ error: "state parameter is required" }),
        { status: 400, headers: { ...corsHeaders, "Content-Type": "application/json" } }
      );
    }

    const flattenedRows: ExportRow[] = [];
    const PAGE_SIZE = 500;
    let offset = 0;
    let hasMore = true;

    while (hasMore) {
      const { data: rows, error } = await supabase
        .from("other_agencies")
        .select(
          `
          id,
          name,
          slug,
          state_slug,
          website_url,
          phone,
          other_agency_emails(id, email_normalized, validation_status, exclude_from_outreach)
        `
        )
        .eq("state_slug", stateSlug)
        .eq("is_active", true)
        .order("name")
        .range(offset, offset + PAGE_SIZE - 1);

      if (error) {
        throw error;
      }

      if (!rows || rows.length === 0) {
        hasMore = false;
        break;
      }

      for (const agency of rows) {
        const emails = (agency.other_agency_emails as any[]) || [];
        for (const email of emails) {
          if (email.exclude_from_outreach === true) continue;
          if (validationStatus !== "all" && email.validation_status !== validationStatus) {
            continue;
          }
          flattenedRows.push({
            agency_id: agency.id,
            email_id: email.id,
            agency_name: agency.name,
            state_slug: agency.state_slug,
            website_url: agency.website_url || "",
            phone: agency.phone || "",
            agency_slug: agency.slug,
            your_agency_path: `/your-agency/${agency.slug}`,
            your_agency_url: `${baseUrl}/your-agency/${agency.slug}`,
            email: email.email_normalized,
            validation_status: email.validation_status,
          });
        }
      }

      if (rows.length < PAGE_SIZE) {
        hasMore = false;
      } else {
        offset += PAGE_SIZE;
      }
    }

    const exportMeta = JSON.stringify({
      state: stateSlug,
      validation_status_filter: validationStatus,
      active_agencies_only: true,
      total_rows: flattenedRows.length,
      duplicates_included: true,
    });

    if (format === "csv") {
      const headers = [
        "agency_id",
        "email_id",
        "agency_name",
        "state_slug",
        "website_url",
        "phone",
        "agency_slug",
        "your_agency_path",
        "your_agency_url",
        "email",
        "validation_status",
      ];

      const csvContent = [
        headers.join(","),
        ...flattenedRows.map((row) =>
          [
            row.agency_id,
            row.email_id,
            `"${row.agency_name.replace(/"/g, '""')}"`,
            row.state_slug,
            row.website_url,
            row.phone,
            row.agency_slug,
            row.your_agency_path,
            row.your_agency_url,
            row.email,
            row.validation_status,
          ].join(",")
        ),
      ].join("\n");

      return new Response(csvContent, {
        headers: {
          ...corsHeaders,
          "Content-Type": "text/csv",
          "Content-Disposition": `attachment; filename="agencies-emails-${stateSlug}-${validationStatus}.csv"`,
          "X-Export-Meta": exportMeta,
        },
      });
    }

    return new Response(JSON.stringify({ rows: flattenedRows, count: flattenedRows.length, meta: JSON.parse(exportMeta) }), {
      headers: { ...corsHeaders, "Content-Type": "application/json" },
    });
  } catch (error) {
    return new Response(
      JSON.stringify({
        error: error instanceof Error ? error.message : "Unknown error",
      }),
      { status: 500, headers: { ...corsHeaders, "Content-Type": "application/json" } }
    );
  }
});
