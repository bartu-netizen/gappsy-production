import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "GET, POST, PUT, DELETE, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey",
};

interface ImportRequest {
  state_slug: string;
  filename: string;
  mode: "csv" | "json";
  data: string;
}

interface AgencyRecord {
  state_slug: string;
  name: string;
  website?: string;
  city?: string;
  description?: string;
  services?: string[];
  primary_service?: string;
  logo_url?: string;
  email?: string;
  phone?: string;
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

    const supabaseUrl = Deno.env.get("SUPABASE_URL");
    const serviceRoleKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");
    if (!supabaseUrl || !serviceRoleKey) {
      throw new Error("Missing environment variables");
    }

    const supabase = createClient(supabaseUrl, serviceRoleKey);

    const importReq: ImportRequest = await req.json();
    const { state_slug, filename, mode, data } = importReq;

    if (!state_slug || !filename || !mode || !data) {
      return new Response(
        JSON.stringify({ error: "Missing required fields" }),
        { status: 400, headers: { ...corsHeaders, "Content-Type": "application/json" } }
      );
    }

    let records: AgencyRecord[] = [];
    let parseError: string | null = null;

    if (mode === "csv") {
      records = parseCSV(data);
    } else if (mode === "json") {
      try {
        records = JSON.parse(data);
        if (!Array.isArray(records)) {
          throw new Error("JSON must be an array");
        }
      } catch (e) {
        parseError = e instanceof Error ? e.message : "Invalid JSON";
      }
    }

    if (parseError) {
      return new Response(
        JSON.stringify({ error: `Parse error: ${parseError}` }),
        { status: 400, headers: { ...corsHeaders, "Content-Type": "application/json" } }
      );
    }

    // Create import job
    const { data: jobData, error: jobError } = await supabase
      .from("other_agency_import_jobs")
      .insert({
        state_slug,
        filename,
        mode,
        total_rows: records.length,
        status: "processing",
      })
      .select()
      .single();

    if (jobError || !jobData) {
      throw new Error(`Failed to create import job: ${jobError?.message}`);
    }

    const jobId = jobData.id;
    let inserted = 0;
    let updated = 0;
    let failed = 0;
    const failedRows: Array<{ row_number: number; error: string; raw: unknown }> = [];

    // Process records in batches of 250
    const batchSize = 250;
    for (let i = 0; i < records.length; i += batchSize) {
      const batch = records.slice(i, i + batchSize);
      const validRecords: AgencyRecord[] = [];

      for (let j = 0; j < batch.length; j++) {
        const rowNum = i + j + 2;
        const record = batch[j];

        if (!record.name || !record.state_slug) {
          failedRows.push({
            row_number: rowNum,
            error: "Missing required fields: name and state_slug",
            raw: record,
          });
          failed++;
          continue;
        }

        if (record.services && typeof record.services === "string") {
          record.services = record.services
            .split(/[|,]/)
            .map((s) => s.trim())
            .filter((s) => s);
        }

        validRecords.push(record);
      }

      if (validRecords.length > 0) {
        const { data: upsertedData, error: upsertError } = await supabase
          .from("other_agencies")
          .upsert(validRecords, {
            onConflict: "state_slug,lower(name),coalesce(lower(website),'')",
            ignoreDuplicates: false,
          })
          .select();

        if (upsertError) {
          for (const record of validRecords) {
            const { error: singleError } = await supabase
              .from("other_agencies")
              .upsert([record], {
                onConflict: "state_slug,lower(name),coalesce(lower(website),'')",
              });

            if (singleError) {
              failedRows.push({
                row_number: i + validRecords.indexOf(record) + 2,
                error: singleError.message,
                raw: record,
              });
              failed++;
            } else {
              updated++;
            }
          }
        } else if (upsertedData) {
          updated += upsertedData.length;
        }
      }
    }

    if (failedRows.length > 0) {
      const failureRecords = failedRows.map((f) => ({
        job_id: jobId,
        row_number: f.row_number,
        raw: f.raw,
        error: f.error,
      }));

      await supabase.from("other_agency_import_job_rows").insert(failureRecords);
    }

    await supabase
      .from("other_agency_import_jobs")
      .update({
        status: "succeeded",
        inserted: Math.max(0, updated - failed),
        updated: 0,
        failed,
        skipped: failedRows.length,
      })
      .eq("id", jobId);

    return new Response(
      JSON.stringify({
        ok: true,
        jobId,
        total: records.length,
        inserted: Math.max(0, updated - failed),
        updated: 0,
        failed,
        skipped: failedRows.length,
      }),
      { headers: { ...corsHeaders, "Content-Type": "application/json" } }
    );
  } catch (error) {
    return new Response(
      JSON.stringify({
        error: error instanceof Error ? error.message : "Unknown error",
      }),
      { status: 500, headers: { ...corsHeaders, "Content-Type": "application/json" } }
    );
  }
});

function parseCSV(csvData: string): AgencyRecord[] {
  const lines = csvData.trim().split("\n");
  if (lines.length < 2) return [];

  const headerLine = lines[0];
  const headers = headerLine.split(";").map((h) => h.trim().toLowerCase());

  const records: AgencyRecord[] = [];

  for (let i = 1; i < lines.length; i++) {
    const line = lines[i].trim();
    if (!line) continue;

    const values = line.split(";").map((v) => v.trim());
    const record: AgencyRecord = {};

    headers.forEach((header, index) => {
      const value = values[index] || "";

      if (header === "state_slug") record.state_slug = value;
      else if (header === "name") record.name = value;
      else if (header === "website") record.website = value;
      else if (header === "city") record.city = value;
      else if (header === "description") record.description = value;
      else if (header === "services") {
        record.services = value
          .split(/[|,]/)
          .map((s) => s.trim())
          .filter((s) => s);
      } else if (header === "primary_service") record.primary_service = value;
      else if (header === "logo_url") record.logo_url = value;
      else if (header === "email") record.email = value;
      else if (header === "phone") record.phone = value;
    });

    if (record.name && record.state_slug) {
      records.push(record);
    }
  }

  return records;
}
