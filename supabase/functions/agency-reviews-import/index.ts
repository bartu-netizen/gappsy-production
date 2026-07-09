import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "GET, POST, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey, x-admin-token",
};

interface ImportOptions {
  upsert: boolean;
  publish: boolean;
}

interface ImportRequest {
  rows: Array<{
    agency_name: string;
    agency_slug: string;
    state_slug: string;
    state_name: string;
    city?: string;
    review_type: 'positive' | 'negative';
    is_top_25_ranked: boolean;
    website_url?: string;
    services_offered: string[];
    target_clients?: string[];
    geographic_reach?: string[];
    team_size_range?: string;
    evaluation_status?: string;
    about_description: string;
    strengths: string[];
    concerns: string[];
    risk_factors?: string[];
    fit_for: string[];
    case_studies_status?: string;
    pricing_transparency?: string;
    team_information?: string;
    independent_recognition?: string;
    local_presence?: string;
    entity_signals?: string[];
    errors?: Array<{ row: number; field: string; message: string }>;
    uniqueness_score: number;
  }>;
  options: ImportOptions;
}

interface ImportError {
  row: number;
  agency_slug: string;
  reason: string;
}

async function verifyAdminToken(token: string): Promise<boolean> {
  if (!token) return false;

  // Simple token verification - use the ADMIN_IMPORT_SECRET
  const expectedToken = Deno.env.get("ADMIN_IMPORT_SECRET");
  if (!expectedToken) {
    console.error("[agency-reviews-import] No ADMIN_IMPORT_SECRET configured");
    return false;
  }

  return token === expectedToken;
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: corsHeaders });
  }

  try {
    if (req.method !== "POST") {
      return new Response(
        JSON.stringify({ error: "Method not allowed" }),
        { status: 405, headers: { ...corsHeaders, "Content-Type": "application/json" } }
      );
    }

    // Verify admin token
    const adminToken = req.headers.get("x-admin-token") || "";
    const isValid = await verifyAdminToken(adminToken);
    if (!isValid) {
      return new Response(
        JSON.stringify({ error: "Unauthorized: Invalid admin token" }),
        { status: 401, headers: { ...corsHeaders, "Content-Type": "application/json" } }
      );
    }

    const supabaseUrl = Deno.env.get("SUPABASE_URL");
    const serviceRoleKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");
    if (!supabaseUrl || !serviceRoleKey) {
      throw new Error("Missing Supabase credentials");
    }

    const supabase = createClient(supabaseUrl, serviceRoleKey);
    const importReq: ImportRequest = await req.json();

    if (!importReq.rows || !Array.isArray(importReq.rows)) {
      return new Response(
        JSON.stringify({ error: "Invalid request: rows must be an array" }),
        { status: 400, headers: { ...corsHeaders, "Content-Type": "application/json" } }
      );
    }

    const { rows, options } = importReq;
    let inserted = 0;
    let updated = 0;
    let skipped = 0;
    let failed = 0;
    const errors: ImportError[] = [];

    // Process rows in batches of 100
    const batchSize = 100;
    for (let i = 0; i < rows.length; i += batchSize) {
      const batch = rows.slice(i, i + batchSize);
      const validRows: any[] = [];
      const rowIndexMap: Map<number, any> = new Map();

      for (let j = 0; j < batch.length; j++) {
        const globalIdx = i + j + 1;
        const row = batch[j];

        // Skip rows with validation errors
        if (row.errors && row.errors.length > 0) {
          errors.push({
            row: globalIdx,
            agency_slug: row.agency_slug,
            reason: `Validation errors: ${row.errors.map(e => e.message).join("; ")}`,
          });
          failed++;
          continue;
        }

        validRows.push(row);
        rowIndexMap.set(validRows.length - 1, { globalIdx, row });
      }

      if (validRows.length === 0) continue;

      try {
        if (options.upsert) {
          // Use upsert for this batch
          const { data, error: upsertError } = await supabase
            .from("agency_reviews")
            .upsert(validRows.map(r => prepareRowForInsert(r, options.publish)), {
              onConflict: "agency_slug",
              ignoreDuplicates: false,
            })
            .select();

          if (upsertError) {
            console.error("[agency-reviews-import] Batch upsert error:", upsertError);
            // Fall back to individual inserts
            for (const row of validRows) {
              const { error: singleError } = await supabase
                .from("agency_reviews")
                .upsert([prepareRowForInsert(row, options.publish)], {
                  onConflict: "agency_slug",
                });

              if (singleError) {
                errors.push({
                  row: row.agency_slug,
                  agency_slug: row.agency_slug,
                  reason: singleError.message,
                });
                failed++;
              } else {
                updated++;
              }
            }
          } else if (data) {
            // Check if inserted or updated based on is_published flag
            updated += data.length;
          }
        } else {
          // Check if existing, skip if so
          const existingSlugs = await checkExistingSlugs(
            supabase,
            validRows.map(r => r.agency_slug)
          );

          for (const row of validRows) {
            if (existingSlugs.has(row.agency_slug)) {
              skipped++;
            } else {
              const { error: insertError } = await supabase
                .from("agency_reviews")
                .insert(prepareRowForInsert(row, options.publish));

              if (insertError) {
                errors.push({
                  row: row.agency_slug,
                  agency_slug: row.agency_slug,
                  reason: insertError.message,
                });
                failed++;
              } else {
                inserted++;
              }
            }
          }
        }
      } catch (batchError) {
        console.error("[agency-reviews-import] Batch processing error:", batchError);
        failed += validRows.length;
      }
    }

    return new Response(
      JSON.stringify({
        ok: true,
        total: rows.length,
        inserted,
        updated,
        skipped,
        failed,
        errors: errors.slice(0, 100),
      }),
      { headers: { ...corsHeaders, "Content-Type": "application/json" } }
    );
  } catch (error) {
    console.error("[agency-reviews-import] Error:", error);
    return new Response(
      JSON.stringify({
        error: error instanceof Error ? error.message : "Unknown error",
      }),
      { status: 500, headers: { ...corsHeaders, "Content-Type": "application/json" } }
    );
  }
});

function prepareRowForInsert(row: any, allowPublish: boolean): Record<string, any> {
  // Check if row meets publishing requirements
  const canPublish = allowPublish && isPublishEligible(row);

  return {
    agency_name: row.agency_name,
    agency_slug: row.agency_slug,
    state_slug: row.state_slug,
    state_name: row.state_name,
    city: row.city || null,
    review_type: row.review_type,
    is_top_25_ranked: row.is_top_25_ranked,
    website_url: row.website_url || null,
    services_offered: row.services_offered || [],
    target_clients: row.target_clients || [],
    geographic_reach: row.geographic_reach || [],
    team_size_range: row.team_size_range || null,
    evaluation_status: row.evaluation_status || null,
    about_description: row.about_description || "",
    strengths: row.strengths || [],
    concerns: row.concerns || [],
    risk_factors: row.risk_factors || [],
    fit_for: row.fit_for || [],
    case_studies_status: row.case_studies_status || null,
    pricing_transparency: row.pricing_transparency || null,
    team_information: row.team_information || null,
    independent_recognition: row.independent_recognition || null,
    local_presence: row.local_presence || null,
    entity_signals: row.entity_signals || [],
    is_published: canPublish,
    uniqueness_score: row.uniqueness_score || 0,
    updated_at: new Date().toISOString(),
  };
}

function isPublishEligible(row: any): boolean {
  if (row.uniqueness_score < 60) return false;

  const minDescLength = 400;
  const minServices = 4;
  const minStrengthsConcerns = 4;
  const minFitFor = 3;

  if ((row.about_description?.length || 0) < minDescLength) return false;
  if ((row.services_offered?.length || 0) < minServices) return false;

  const contentArray = row.review_type === "positive" ? row.strengths : row.concerns;
  if ((contentArray?.length || 0) < minStrengthsConcerns) return false;

  if ((row.fit_for?.length || 0) < minFitFor) return false;

  return true;
}

async function checkExistingSlugs(supabase: any, slugs: string[]): Promise<Set<string>> {
  const { data } = await supabase
    .from("agency_reviews")
    .select("agency_slug")
    .in("agency_slug", slugs);

  return new Set((data || []).map((r: any) => r.agency_slug));
}
