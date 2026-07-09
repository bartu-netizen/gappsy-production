import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import {
  normalizeRow,
  type CanonicalAgencyRow,
} from "../_shared/canonicalRowNormalizer.ts";
import { validateInternalServerCall } from "../_shared/adminSession.ts";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "POST, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, x-admin-token, x-admin-secret",
};

interface ProcessRequest {
  job_id: string;
  chunk_index: number;
}

function normalizeDomain(url: string): string | null {
  if (!url) return null;
  let d = url.trim().toLowerCase();
  d = d.replace(/^https?:\/\/(www\.)?/i, "");
  d = d.replace(/\/.*$/, "");
  d = d.replace(/\?.*$/, "");
  if (!d || d.length < 4 || !d.includes(".")) return null;
  return d;
}

function normalizePhoneDigits(phone: string): string | null {
  if (!phone) return null;
  let digits = phone.replace(/\D/g, "");
  if (digits.length === 11 && digits.startsWith("1")) {
    digits = digits.slice(1);
  }
  if (digits.length < 7) return null;
  return digits;
}

function normalizeAgencyName(name: string): string | null {
  if (!name) return null;
  let n = name.trim().toLowerCase();
  n = n.replace(/\s+/g, " ").trim();
  n = n.replace(/[.,\/#!$%\^&\*;:{}=\-_`~()]/g, "");
  return n || null;
}

function generateSlug(name: string): string {
  return name
    .toLowerCase()
    .replace(/\s+/g, "-")
    .replace(/[^a-z0-9-]/g, "")
    .replace(/-+/g, "-")
    .replace(/^-+|-+$/g, "");
}

async function findOrCreateAgency(
  supabase: any,
  row: CanonicalAgencyRow,
  state_slug: string
): Promise<{ id: string; slug: string; name: string; isNew: boolean } | null> {
  const name = row.name;
  const website = row.website_url || "";
  const phone = row.phone || "";

  if (!name) return null;

  const domain = normalizeDomain(website);
  const phoneDigits = normalizePhoneDigits(phone);
  const normalizedName = normalizeAgencyName(name);

  if (!normalizedName) return null;

  if (domain) {
    const { data: byDomain } = await supabase
      .from("other_agencies")
      .select("id, slug, name")
      .ilike("website_url", `%${domain}%`)
      .eq("is_active", true)
      .limit(1)
      .maybeSingle();

    if (byDomain) {
      return { ...byDomain, isNew: false };
    }
  }

  if (phoneDigits) {
    const { data: byPhone } = await supabase
      .from("other_agency_phones")
      .select("agency_id")
      .ilike("phone_normalized", `%${phoneDigits}%`)
      .limit(1)
      .maybeSingle();

    if (byPhone) {
      const { data: agency } = await supabase
        .from("other_agencies")
        .select("id, slug, name")
        .eq("id", byPhone.agency_id)
        .eq("is_active", true)
        .maybeSingle();

      if (agency) {
        return { ...agency, isNew: false };
      }
    }
  }

  if (normalizedName && state_slug) {
    const { data: byNameInState } = await supabase
      .from("other_agencies")
      .select("id, slug, name")
      .eq("is_active", true)
      .eq("state_slug", state_slug)
      .ilike("name", name)
      .limit(1)
      .maybeSingle();

    if (byNameInState) {
      return { ...byNameInState, isNew: false };
    }
  }

  let slug = generateSlug(name);
  let suffix = 1;

  while (true) {
    const { data: existing } = await supabase
      .from("other_agencies")
      .select("slug")
      .eq("slug", slug)
      .maybeSingle();

    if (!existing) break;
    suffix++;
    slug = `${generateSlug(name)}-${suffix}`;
  }

  const city = row.city || "";
  const description = row.description || "";

  const { data: newAgency, error: createErr } = await supabase
    .from("other_agencies")
    .insert({
      name,
      slug,
      state_slug,
      state_name: state_slug,
      website_url: website,
      phone,
      city,
      description,
      is_active: true,
      created_at: new Date().toISOString(),
    })
    .select("id, slug, name")
    .single();

  if (createErr) {
    console.error(`[processor] Failed to create agency "${name}":`, createErr);
    return null;
  }

  return { ...newAgency, isNew: true };
}

async function processChunkPayload(
  supabase: any,
  job_id: string,
  chunk_index: number,
  chunk_rows: any[],
  state_slug: string
): Promise<{ inserted: number; updated: number; failed: number; errors: string[] }> {
  let inserted = 0;
  let updated = 0;
  let failed = 0;
  const errors: string[] = [];

  console.log(`[processor] Chunk ${chunk_index}: processing ${chunk_rows.length} rows`);

  let rowsWithName = 0;

  for (let rowIdx = 0; rowIdx < chunk_rows.length; rowIdx++) {
    const rawRow = chunk_rows[rowIdx];

    const row = normalizeRow(rawRow, state_slug);

    if (!row) {
      failed++;
      errors.push(`Row ${rowIdx}: No agency name found after normalization`);
      continue;
    }

    rowsWithName++;

    try {
      const agency = await findOrCreateAgency(supabase, row, state_slug);
      if (!agency) {
        failed++;
        errors.push(`Row ${rowIdx}: Failed to find/create agency for "${row.name}"`);
        continue;
      }

      if (agency.isNew) {
        inserted++;
      } else {
        updated++;
      }

      const emailRaw = row.email || "";
      const emailsRaw = emailRaw.split(/[,;\n]+/).map((e: string) => e.trim().toLowerCase()).filter((e: string) => e && e.includes("@"));

      if (emailsRaw.length > 0) {
        for (let idx = 0; idx < emailsRaw.length; idx++) {
          const email = emailsRaw[idx];

          const { data: existing } = await supabase
            .from("other_agency_emails")
            .select("id")
            .eq("agency_id", agency.id)
            .eq("email_normalized", email)
            .maybeSingle();

          if (!existing) {
            await supabase.from("other_agency_emails").insert({
              agency_id: agency.id,
              email_raw: email,
              email_normalized: email,
              validation_status: "pending",
              is_primary: idx === 0,
            });
          }
        }
      }

      const phoneRaw = row.phone || "";
      const phonesRaw = phoneRaw.split(/[,;\n]+/).map((p: string) => p.trim()).filter((p: string) => p);

      if (phonesRaw.length > 0) {
        for (let idx = 0; idx < phonesRaw.length; idx++) {
          const phone = phonesRaw[idx];
          const digits = normalizePhoneDigits(phone);

          if (digits) {
            const { data: existing } = await supabase
              .from("other_agency_phones")
              .select("id")
              .eq("agency_id", agency.id)
              .eq("phone_normalized", digits)
              .maybeSingle();

            if (!existing) {
              await supabase.from("other_agency_phones").insert({
                agency_id: agency.id,
                phone_raw: phone,
                phone_normalized: digits,
                is_primary: idx === 0,
              });
            }
          }
        }
      }
    } catch (err) {
      failed++;
      errors.push(`Row ${rowIdx}: ${String(err).substring(0, 80)}`);
      console.error(`[processor] Row error:`, err);
    }
  }

  console.log(`[processor] Chunk ${chunk_index}: ${rowsWithName} rows had valid names, ${inserted} inserted, ${updated} updated, ${failed} failed`);

  if (chunk_rows.length > 0 && rowsWithName > 0) {
    const sampleRow = normalizeRow(chunk_rows[0], state_slug);
    if (sampleRow) {
      console.log(`[processor] Sample row: name="${sampleRow.name}", website="${sampleRow.website_url || "N/A"}"`);
    }
  }

  return { inserted, updated, failed, errors: errors.slice(0, 10) };
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: corsHeaders });
  }

  try {
    if (!validateInternalServerCall(req)) {
      return new Response(JSON.stringify({ ok: false, error: "Unauthorized - internal server calls only" }), {
        status: 401,
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      });
    }

    const body: ProcessRequest = await req.json();
    const { job_id, chunk_index } = body;

    const supabase = createClient(
      Deno.env.get("SUPABASE_URL")!,
      Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!,
      { auth: { autoRefreshToken: false, persistSession: false } }
    );

    console.log(`[processor] Processing chunk ${chunk_index} of job ${job_id}`);

    const { data: chunk, error: chunkErr } = await supabase
      .from("other_agencies_import_job_chunks")
      .select("payload_json, rows_in_chunk")
      .eq("job_id", job_id)
      .eq("chunk_index", chunk_index)
      .maybeSingle();

    if (chunkErr || !chunk) {
      throw new Error(`Chunk not found: ${chunkErr?.message}`);
    }

    if (!chunk.payload_json || !Array.isArray(chunk.payload_json) || chunk.payload_json.length === 0) {
      throw new Error("Chunk payload is empty or invalid - this is a critical bug");
    }

    const { data: job } = await supabase
      .from("other_agencies_import_jobs")
      .select("state_slug")
      .eq("id", job_id)
      .maybeSingle();

    if (!job) {
      throw new Error("Job not found");
    }

    const startTime = Date.now();

    const result = await processChunkPayload(supabase, job_id, chunk_index, chunk.payload_json, job.state_slug);

    const duration = Date.now() - startTime;

    await supabase
      .from("other_agencies_import_job_chunks")
      .update({
        status: "completed",
        inserted_count: result.inserted,
        updated_count: result.updated,
        failed_count: result.failed,
        error_details: result.errors.length > 0 ? JSON.stringify(result.errors) : null,
        processed_at: new Date().toISOString(),
      })
      .eq("job_id", job_id)
      .eq("chunk_index", chunk_index);

    await supabase
      .from("other_agencies_import_queue")
      .update({ status: "completed", completed_at: new Date().toISOString() })
      .eq("job_id", job_id)
      .eq("chunk_index", chunk_index);

    const { data: jobStats } = await supabase
      .from("other_agencies_import_jobs")
      .select("total_inserted, total_updated, total_failed, chunks_processed, chunks_total")
      .eq("id", job_id)
      .maybeSingle();

    if (jobStats) {
      const newInserted = (jobStats.total_inserted || 0) + result.inserted;
      const newUpdated = (jobStats.total_updated || 0) + result.updated;
      const newFailed = (jobStats.total_failed || 0) + result.failed;
      const newProcessed = (jobStats.chunks_processed || 0) + 1;
      const progressPercent = Math.round((newProcessed / jobStats.chunks_total) * 100);

      await supabase
        .from("other_agencies_import_jobs")
        .update({
          total_inserted: newInserted,
          total_updated: newUpdated,
          total_failed: newFailed,
          chunks_processed: newProcessed,
          progress_percent: progressPercent,
          status: newProcessed >= jobStats.chunks_total ? "completed" : "processing",
          updated_at: new Date().toISOString(),
        })
        .eq("id", job_id);
    }

    console.log(
      `[processor] Chunk ${chunk_index} done: +${result.inserted} inserted, +${result.updated} updated, ${result.failed} failed (${duration}ms)`
    );

    return new Response(
      JSON.stringify({
        ok: true,
        chunk_index,
        inserted: result.inserted,
        updated: result.updated,
        failed: result.failed,
        duration_ms: duration,
      }),
      { headers: { ...corsHeaders, "Content-Type": "application/json" } }
    );
  } catch (err) {
    console.error("[processor] Error:", err);

    return new Response(JSON.stringify({ ok: false, error: String(err) }), {
      status: 500,
      headers: { ...corsHeaders, "Content-Type": "application/json" },
    });
  }
});
