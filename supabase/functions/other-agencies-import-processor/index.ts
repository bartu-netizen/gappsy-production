import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "GET, POST, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, x-admin-token, x-admin-secret",
};

interface ChunkProcessRequest {
  job_id: string;
  chunk_index: number;
  chunk_data: any[];
  state_slug: string;
}

interface ChunkProcessResult {
  ok: boolean;
  job_id: string;
  chunk_index: number;
  inserted_agencies: number;
  inserted_emails: number;
  inserted_phones: number;
  skipped_rows: number;
  error_count: number;
  errors: Array<{ row_number: number; error: string }>;
  job_completed: boolean;
  next_chunk_to_process?: number;
}

async function validateAdmin(token: string, secret: string): Promise<boolean> {
  if (!token || !secret) return false;
  const ADMIN_SECRET = Deno.env.get("ADMIN_SECRET");
  return secret === ADMIN_SECRET;
}

function normalizeDomain(urlOrDomain: string): string | null {
  if (!urlOrDomain) return null;
  let d = urlOrDomain.trim().toLowerCase();
  d = d.replace(/^https?:\/\/(www\.)?/i, "");
  d = d.replace(/\/.*$/, "");
  d = d.replace(/\?.*$/, "");
  d = d.trim();
  if (!d || d.length < 4 || !d.includes(".")) return null;
  return d;
}

function normalizePhoneDigits(phoneRaw: string): string | null {
  if (!phoneRaw) return null;
  let digits = phoneRaw.replace(/\D/g, "");
  if (digits.length === 11 && digits.startsWith("1")) {
    digits = digits.slice(1);
  }
  if (digits.length < 7) return null;
  return digits || null;
}

function normalizeAgencyName(name: string): string | null {
  if (!name) return null;
  let n = name.trim().toLowerCase();
  n = n.replace(/\s+/g, " ").trim();
  n = n.replace(/[.,\/#!$%\^&\*;:{}=\-_`~()]/g, "");
  return n || null;
}

function parseAgencyRow(row: any): {
  agency: any;
  emails: string[];
  phones: string[];
  error?: string;
} {
  try {
    const agency = {
      name: row.name || row.agency_name || "",
      website_url: row.website_url || row.website || "",
      phone: row.phone || "",
      email: row.email || "",
      state_slug: row.state_slug || "",
      description: row.description || "",
      services: Array.isArray(row.services) ? row.services : (row.services ? row.services.split(",").map((s: string) => s.trim()) : []),
    };

    if (!agency.name || !agency.name.trim()) {
      return { agency: {}, emails: [], phones: [], error: "Missing agency name" };
    }

    const emails = (row.email || "").split(/[,;|\n]/).map((e: string) => e.trim()).filter((e: string) => e && e.includes("@"));
    const phones = (row.phone || "").split(/[,;|\n]/).map((p: string) => p.trim()).filter((p: string) => p && p.length >= 7);

    return { agency, emails, phones };
  } catch (err) {
    return { agency: {}, emails: [], phones: [], error: String(err) };
  }
}

async function findExistingAgencyByIdentity(
  supabase: any,
  name: string,
  website_url: string,
  phone: string,
  state_slug: string
): Promise<{ id: string; slug: string; name: string } | null> {
  const domain = normalizeDomain(website_url);
  const phoneDigits = normalizePhoneDigits(phone);
  const normalizedName = normalizeAgencyName(name);

  if (!normalizedName) return null;

  // Priority 1: Match by domain (cross-state)
  if (domain) {
    const { data: byDomain } = await supabase
      .from("other_agencies")
      .select("id, slug, name")
      .ilike("website_url", `%${domain}%`)
      .eq("is_active", true)
      .limit(1)
      .maybeSingle();

    if (byDomain) {
      console.log(`[import] Identity reuse: Found by domain match for ${name}`);
      return byDomain;
    }
  }

  // Priority 2: Match by phone (cross-state)
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
        console.log(`[import] Identity reuse: Found by phone match for ${name}`);
        return agency;
      }
    }
  }

  // Priority 3: Match by name + website (cross-state)
  if (domain && normalizedName) {
    const { data: agencies } = await supabase
      .from("other_agencies")
      .select("id, slug, name, website_url")
      .eq("is_active", true);

    const match = agencies?.find((a: any) => {
      const agencyDomain = normalizeDomain(a.website_url);
      const agencyName = normalizeAgencyName(a.name);
      return agencyName === normalizedName && agencyDomain === domain;
    });

    if (match) {
      console.log(`[import] Identity reuse: Found by name+website match for ${name}`);
      return match;
    }
  }

  // Priority 4: Match by name + phone (cross-state)
  if (phoneDigits && normalizedName) {
    const { data: agencies } = await supabase
      .from("other_agencies")
      .select("id, slug, name")
      .eq("is_active", true);

    for (const agency of agencies || []) {
      const agencyName = normalizeAgencyName(agency.name);
      if (agencyName === normalizedName) {
        const { data: phones } = await supabase
          .from("other_agency_phones")
          .select("phone_normalized")
          .eq("agency_id", agency.id)
          .limit(1)
          .maybeSingle();

        if (phones) {
          const agencyPhoneDigits = normalizePhoneDigits(phones.phone_normalized);
          if (agencyPhoneDigits === phoneDigits) {
            console.log(`[import] Identity reuse: Found by name+phone match for ${name}`);
            return agency;
          }
        }
      }
    }
  }

  // Priority 5: Match by name within same state (last resort, highest risk)
  if (normalizedName && state_slug) {
    const { data: byNameInState } = await supabase
      .from("other_agencies")
      .select("id, slug, name")
      .eq("state_slug", state_slug)
      .eq("is_active", true)
      .limit(1)
      .maybeSingle();

    if (byNameInState) {
      const agencyName = normalizeAgencyName(byNameInState.name);
      if (agencyName === normalizedName) {
        console.log(`[import] Identity reuse: Found by name+state match for ${name}`);
        return byNameInState;
      }
    }
  }

  return null;
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: corsHeaders });
  }

  if (req.method !== "POST") {
    return new Response(JSON.stringify({ error: "Method not allowed" }), { status: 405, headers: corsHeaders });
  }

  try {
    const body = (await req.json()) as ChunkProcessRequest;
    const adminToken = req.headers.get("x-admin-token") || "";
    const adminSecret = req.headers.get("x-admin-secret") || "";

    if (!(await validateAdmin(adminToken, adminSecret))) {
      return new Response(JSON.stringify({ error: "Unauthorized" }), { status: 401, headers: corsHeaders });
    }

    const SUPABASE_URL = Deno.env.get("SUPABASE_URL") as string;
    const SERVICE_ROLE_KEY = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY") as string;
    const supabase = createClient(SUPABASE_URL, SERVICE_ROLE_KEY);

    const { job_id, chunk_index, chunk_data, state_slug } = body;

    if (!job_id || chunk_index === undefined || !Array.isArray(chunk_data)) {
      return new Response(JSON.stringify({ error: "Invalid request payload" }), { status: 400, headers: corsHeaders });
    }

    await supabase.from("other_agencies_import_job_chunks").update({ status: "processing" }).eq("job_id", job_id).eq("chunk_index", chunk_index);

    let inserted_agencies = 0;
    let inserted_emails = 0;
    let inserted_phones = 0;
    let skipped_rows = 0;
    let error_count = 0;
    const errors: Array<{ row_number: number; error: string }> = [];

    for (let i = 0; i < chunk_data.length; i++) {
      const row = chunk_data[i];
      const row_number = chunk_index * 500 + i + 1;

      try {
        const parsed = parseAgencyRow({ ...row, state_slug });

        if (parsed.error) {
          errors.push({ row_number, error: parsed.error });
          error_count++;
          skipped_rows++;
          continue;
        }

        if (!parsed.agency.name) {
          skipped_rows++;
          continue;
        }

        let agency_id: string | undefined;
        let reusingExisting = false;

        // PART 2: Check for existing agency by identity before creating new one
        const existingAgency = await findExistingAgencyByIdentity(
          supabase,
          parsed.agency.name,
          parsed.agency.website_url,
          parsed.phones[0] || "",
          state_slug
        );

        if (existingAgency) {
          agency_id = existingAgency.id;
          reusingExisting = true;
          console.log(`[import] Reusing existing agency: ${existingAgency.name} (${existingAgency.id})`);
        } else {
          // Create new agency only if no existing identity found
          const slugBase = parsed.agency.name.toLowerCase().replace(/[^a-z0-9]/g, "-").replace(/-+/g, "-");
          const slug = `${slugBase}-${state_slug}`;

          const { data: agencies, error: agencyErr } = await supabase
            .from("other_agencies")
            .insert(
              {
                name: parsed.agency.name,
                state_slug: state_slug,
                slug: slug,
                email: parsed.emails[0] || null,
                phone: parsed.phones[0] || null,
                website_url: parsed.agency.website_url || null,
                description: parsed.agency.description || null,
                services: parsed.agency.services || [],
                import_job_id: job_id,
                import_source: "scraper",
                is_active: true,
                state_name: state_slug
                  .split("-")
                  .map((w: string) => w.charAt(0).toUpperCase() + w.slice(1))
                  .join(" "),
              }
            )
            .select();

          if (agencyErr) {
            errors.push({ row_number, error: `Agency insert: ${agencyErr.message}` });
            error_count++;
            continue;
          }

          agency_id = agencies?.[0]?.id;
          if (!agency_id) {
            errors.push({ row_number, error: "No agency ID returned" });
            error_count++;
            continue;
          }
        }

        if (reusingExisting) {
          // Don't count as inserted if reusing existing
          console.log(`[import] Row ${row_number}: Reused existing agency`);
        } else {
          inserted_agencies++;
        }

        for (const email of parsed.emails) {
          const { error: emailErr } = await supabase.from("other_agency_emails").upsert(
            {
              agency_id,
              email_normalized: email.toLowerCase(),
              validation_status: "pending",
              verification_state: "queued",
              import_job_id: job_id,
            },
            { onConflict: "email_normalized,agency_id" }
          );

          if (!emailErr) inserted_emails++;
        }

        for (const phone of parsed.phones) {
          const { error: phoneErr } = await supabase.from("other_agency_phones").upsert(
            {
              agency_id,
              phone_normalized: phone,
              import_job_id: job_id,
            },
            { onConflict: "phone_normalized,agency_id" }
          );

          if (!phoneErr) inserted_phones++;
        }
      } catch (err) {
        errors.push({ row_number, error: String(err) });
        error_count++;
      }
    }

    await supabase
      .from("other_agencies_import_job_chunks")
      .update({
        status: "completed",
        processed_at: new Date().toISOString(),
        inserted_agencies,
        inserted_emails,
        inserted_phones,
        skipped_rows,
        error_count,
        error_sample_json: errors.slice(0, 10),
      })
      .eq("job_id", job_id)
      .eq("chunk_index", chunk_index);

    const { data: job, error: jobFetchErr } = await supabase.from("other_agencies_import_jobs").select("chunks_total, chunks_processed, source_rows_total").eq("id", job_id).maybeSingle();

    if (!jobFetchErr && job) {
      const chunks_processed = job.chunks_processed + 1;
      const progress_percent = Math.round((chunks_processed / job.chunks_total) * 100);
      const job_completed = chunks_processed >= job.chunks_total;

      await supabase
        .from("other_agencies_import_jobs")
        .update({
          chunks_processed,
          progress_percent,
          source_rows_processed: chunks_processed * 500,
          status: job_completed ? "completed" : "processing",
          updated_at: new Date().toISOString(),
        })
        .eq("id", job_id);

      return new Response(
        JSON.stringify({
          ok: true,
          job_id,
          chunk_index,
          inserted_agencies,
          inserted_emails,
          inserted_phones,
          skipped_rows,
          error_count,
          errors: errors.slice(0, 5),
          job_completed,
          next_chunk_to_process: job_completed ? undefined : chunk_index + 1,
        } as ChunkProcessResult),
        { headers: { ...corsHeaders, "Content-Type": "application/json" } }
      );
    }

    return new Response(
      JSON.stringify({
        ok: true,
        job_id,
        chunk_index,
        inserted_agencies,
        inserted_emails,
        inserted_phones,
        skipped_rows,
        error_count,
        errors: errors.slice(0, 5),
        job_completed: false,
      } as ChunkProcessResult),
      { headers: { ...corsHeaders, "Content-Type": "application/json" } }
    );
  } catch (err) {
    return new Response(JSON.stringify({ error: String(err) }), { status: 500, headers: corsHeaders });
  }
});
