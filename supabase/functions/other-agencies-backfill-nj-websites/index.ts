import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2";

const CORS = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "GET, POST, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey, x-internal-secret",
};

const INTERNAL_SECRET = Deno.env.get("INTERNAL_FUNCTION_SECRET") || "internal-fn-secret-2024";
const PAGE_SIZE = 1000;
const BATCH_SIZE = 500;

function json(data: unknown, status = 200) {
  return new Response(JSON.stringify(data), {
    status,
    headers: { ...CORS, "Content-Type": "application/json" },
  });
}

const MAPS_RE = /google\.com\/maps|maps\.google|goo\.gl\/maps/i;

function isJunkUrl(url: string): boolean {
  if (!url) return true;
  if (MAPS_RE.test(url)) return true;
  if (!/^https?:\/\//i.test(url)) return true;
  return false;
}

function normalizeDomain(url: string): string | null {
  try {
    const u = new URL(url);
    return u.hostname.replace(/^www\./, "").toLowerCase();
  } catch {
    return null;
  }
}

function normalizeName(name: string): string {
  return name.toLowerCase().replace(/[^a-z0-9\s]/g, " ").replace(/\s+/g, " ").trim();
}

function splitCsvLine(line: string): string[] {
  const result: string[] = [];
  let current = "";
  let inQuotes = false;
  for (let i = 0; i < line.length; i++) {
    const ch = line[i];
    if (ch === '"') {
      if (inQuotes && line[i + 1] === '"') { current += '"'; i++; }
      else { inQuotes = !inQuotes; }
    } else if (ch === ',' && !inQuotes) {
      result.push(current.trim());
      current = "";
    } else {
      current += ch;
    }
  }
  result.push(current.trim());
  return result;
}

interface CsvRow { name: string; website: string; mapsUrl: string; }

function parseBotsolCsv(text: string): CsvRow[] {
  const lines = text.split(/\r?\n/).filter(l => l.trim());
  if (lines.length < 2) return [];

  let headerIdx = 0, nameIdx = 0, websiteIdx = -1, urlIdx = -1;
  for (let i = 0; i < Math.min(5, lines.length); i++) {
    const cells = splitCsvLine(lines[i]).map(c => c.toLowerCase().trim());
    const ni = cells.findIndex(c => c === "name" || c === "title" || c === "agency name" || c === "company name");
    if (ni >= 0) {
      headerIdx = i; nameIdx = ni;
      websiteIdx = cells.findIndex(c => c === "website");
      for (let j = cells.length - 1; j >= 0; j--) { if (cells[j] === "url") { urlIdx = j; break; } }
      break;
    }
  }
  if (websiteIdx < 0) websiteIdx = 9;
  if (urlIdx < 0) urlIdx = 52;

  const results: CsvRow[] = [];
  for (let i = headerIdx + 1; i < lines.length; i++) {
    const cells = splitCsvLine(lines[i]);
    const name = (cells[nameIdx] ?? "").trim();
    if (!name) continue;
    const websiteCell = (cells[websiteIdx] ?? "").trim();
    const urlCell = (cells[urlIdx] ?? "").trim();
    let website = "", mapsUrl = "";
    if (websiteCell && !MAPS_RE.test(websiteCell)) { website = websiteCell; }
    else if (websiteCell && MAPS_RE.test(websiteCell)) { mapsUrl = websiteCell; }
    if (urlCell && MAPS_RE.test(urlCell)) { if (!mapsUrl) mapsUrl = urlCell; }
    else if (urlCell && !website) { website = urlCell; }
    results.push({ name, website, mapsUrl });
  }
  return results;
}

async function fetchAllNjAgencies(supabase: ReturnType<typeof createClient>) {
  const all: { id: string; name: string; website_url: string | null; maps_url: string | null }[] = [];
  let page = 0;
  while (true) {
    const from = page * PAGE_SIZE;
    const { data, error } = await supabase
      .from("other_agencies")
      .select("id, name, website_url, maps_url")
      .eq("state_slug", "new-jersey")
      .eq("is_active", true)
      .range(from, from + PAGE_SIZE - 1);
    if (error) throw new Error(`Page ${page}: ${error.message}`);
    if (!data?.length) break;
    all.push(...data);
    if (data.length < PAGE_SIZE) break;
    page++;
  }
  return all;
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") return new Response(null, { status: 200, headers: CORS });
  if (req.headers.get("x-internal-secret") !== INTERNAL_SECRET) return json({ error: "FORBIDDEN" }, 403);

  const supabase = createClient(Deno.env.get("SUPABASE_URL")!, Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!, {
    auth: { autoRefreshToken: false, persistSession: false },
  });

  try {
    const body = await req.json().catch(() => ({}));
    const dryRun = body.dry_run !== false;

    // 1. Download CSV
    const { data: fileList, error: listErr } = await supabase.storage.from("import-staging").list("new-jersey", { limit: 50 });
    if (listErr || !fileList?.length) return json({ error: "Cannot list storage", detail: listErr?.message }, 500);

    const botsolFile = fileList.find(f => f.name.includes("botsol") || f.name.includes("newnewjersey"));
    if (!botsolFile) return json({ error: "Botsol CSV not found", files: fileList.map(f => f.name) }, 404);

    const csvPath = `new-jersey/${botsolFile.name}`;
    const { data: fileData, error: dlErr } = await supabase.storage.from("import-staging").download(csvPath);
    if (dlErr || !fileData) return json({ error: "Download failed", detail: dlErr?.message }, 500);

    // 2. Parse CSV → name-keyed map
    const csvRows = parseBotsolCsv(await fileData.text());
    const csvMap = new Map<string, CsvRow>();
    for (const row of csvRows) {
      const key = normalizeName(row.name);
      if (!key) continue;
      const ex = csvMap.get(key);
      if (!ex || (!ex.website && row.website)) csvMap.set(key, row);
    }
    const csvWithRealWebsite = [...csvMap.values()].filter(r => r.website && !isJunkUrl(r.website)).length;

    // 3. Fetch ALL NJ active agencies (paginated)
    const agencies = await fetchAllNjAgencies(supabase);

    // 4. Build update payload
    const updates: { id: string; website_url: string; website_domain_normalized: string | null }[] = [];
    const mapsUpdates: { id: string; maps_url: string }[] = [];
    let skippedAlreadyReal = 0, skippedNoMatch = 0, skippedCsvNoWebsite = 0;
    const sampleUpdates: { name: string; old_website: string | null; new_website: string }[] = [];

    for (const agency of agencies) {
      const key = normalizeName(agency.name ?? "");
      const csvData = csvMap.get(key);
      if (!csvData) { skippedNoMatch++; continue; }

      const currentWebsite = agency.website_url ?? "";
      if (currentWebsite && !isJunkUrl(currentWebsite)) { skippedAlreadyReal++; continue; }

      const rawWebsite = csvData.website?.trim() ?? "";
      if (!rawWebsite || isJunkUrl(rawWebsite)) { skippedCsvNoWebsite++; continue; }

      const domain = normalizeDomain(rawWebsite);
      updates.push({ id: agency.id, website_url: rawWebsite, website_domain_normalized: domain });

      if (!agency.maps_url && csvData.mapsUrl && MAPS_RE.test(csvData.mapsUrl)) {
        mapsUpdates.push({ id: agency.id, maps_url: csvData.mapsUrl });
      }

      if (sampleUpdates.length < 25) {
        sampleUpdates.push({ name: agency.name, old_website: agency.website_url ?? null, new_website: rawWebsite });
      }
    }

    if (dryRun) {
      return json({
        ok: true, dry_run: true, csv_file: csvPath,
        csv_stats: { total_rows: csvRows.length, unique_names: csvMap.size, rows_with_real_website: csvWithRealWebsite },
        db_stats: {
          total_nj_active: agencies.length,
          agencies_to_update: updates.length,
          maps_url_to_backfill: mapsUpdates.length,
          skipped_already_has_real_website: skippedAlreadyReal,
          skipped_no_csv_match: skippedNoMatch,
          skipped_csv_has_no_real_website: skippedCsvNoWebsite,
        },
        sample_updates: sampleUpdates,
        message: `DRY RUN: Would restore website_url for ${updates.length} agencies. POST {"dry_run":false} to apply.`,
      });
    }

    if (updates.length === 0) {
      return json({ ok: true, message: "Nothing to update — all agencies already have real websites." });
    }

    // 5. Bulk update via RPC (single SQL UPDATE per batch — no per-row HTTP)
    let totalUpdated = 0;
    let rpcErrors = 0;

    for (let i = 0; i < updates.length; i += BATCH_SIZE) {
      const batch = updates.slice(i, i + BATCH_SIZE);
      const { data: count, error: rpcErr } = await supabase
        .rpc("bulk_update_agency_websites", { updates: batch });

      if (rpcErr) {
        console.error(`Batch ${i}-${i + batch.length} failed:`, rpcErr.message);
        rpcErrors += batch.length;
      } else {
        totalUpdated += (count as number) ?? batch.length;
      }
    }

    // 6. Backfill maps_url separately (only agencies that had none)
    let mapsUpdated = 0;
    for (const u of mapsUpdates) {
      const { error } = await supabase
        .from("other_agencies")
        .update({ maps_url: u.maps_url })
        .eq("id", u.id)
        .is("maps_url", null);
      if (!error) mapsUpdated++;
    }

    return json({
      ok: true, dry_run: false, csv_file: csvPath,
      csv_stats: { total_rows: csvRows.length, unique_names: csvMap.size, rows_with_real_website: csvWithRealWebsite },
      db_stats: {
        total_nj_active: agencies.length,
        agencies_updated: totalUpdated,
        maps_url_backfilled: mapsUpdated,
        rpc_errors: rpcErrors,
        skipped_already_has_real_website: skippedAlreadyReal,
        skipped_no_csv_match: skippedNoMatch,
        skipped_csv_has_no_real_website: skippedCsvNoWebsite,
      },
      sample_updates: sampleUpdates,
      message: `Restored website_url for ${totalUpdated} NJ agencies from source CSV.`,
    });

  } catch (err) {
    const msg = err instanceof Error ? err.message : String(err);
    console.error("[backfill-nj-websites]", msg);
    return json({ error: "INTERNAL_ERROR", message: msg }, 500);
  }
});
