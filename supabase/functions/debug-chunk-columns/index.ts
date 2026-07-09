import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "GET, POST, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey",
};

function splitCsvLine(line: string, delimiter = ","): string[] {
  const result: string[] = [];
  let current = "";
  let inQuotes = false;
  for (let i = 0; i < line.length; i++) {
    const ch = line[i];
    if (ch === '"') {
      if (inQuotes && line[i + 1] === '"') { current += '"'; i++; }
      else { inQuotes = !inQuotes; }
    } else if (ch === delimiter && !inQuotes) {
      result.push(current.trim());
      current = "";
    } else {
      current += ch;
    }
  }
  result.push(current.trim());
  return result;
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: corsHeaders });
  }

  try {
    const supabase = createClient(
      Deno.env.get("SUPABASE_URL")!,
      Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!,
      { auth: { autoRefreshToken: false, persistSession: false } }
    );

    const csvPath = "new-jersey/1773341698228_newnewjerseybotsol_data_-1447576125.csv";
    const { data: fileData, error } = await supabase.storage
      .from("import-staging")
      .download(csvPath);

    if (error || !fileData) {
      return new Response(
        JSON.stringify({ error: "Could not download CSV", detail: error }),
        { headers: { ...corsHeaders, "Content-Type": "application/json" } }
      );
    }

    const ab = await fileData.arrayBuffer();
    const slice = ab.slice(0, 600 * 1024);
    const text = new TextDecoder().decode(slice);
    const lines = text.split(/\r?\n/).filter(l => l.trim());

    // The parse function scans first 5 lines for a row containing "name"
    let headerLineIdx = 0;
    let rawHeaders: string[] = [];
    for (let i = 0; i < Math.min(5, lines.length); i++) {
      const cells = splitCsvLine(lines[i]);
      if (cells.some(c => c.toLowerCase().trim() === "name")) {
        headerLineIdx = i;
        rawHeaders = cells;
        break;
      }
    }

    if (!rawHeaders.length) rawHeaders = splitCsvLine(lines[0]);

    // Simulate exactly what the parse function does with HEADER_ALIASES
    const HEADER_ALIASES: Record<string, string> = {
      name: "name", "agency name": "name", company: "name", "company name": "name",
      "business name": "name", organization: "name",
      email: "email", "email address": "email", "e-mail": "email", emails: "email",
      "contact email": "email", "primary email": "email",
      phone: "phone", "phone number": "phone", telephone: "phone", tel: "phone",
      mobile: "phone", cell: "phone",
      website: "website", url: "website", web: "website", site: "website",
      "website url": "website", homepage: "website",
      city: "city", town: "city", location: "city",
      state: "state", "state/province": "state", province: "state",
      zip: "zip", "zip code": "zip", "postal code": "zip", postal: "zip",
      facebook: "facebook", fb: "facebook", "facebook url": "facebook",
      instagram: "instagram", ig: "instagram", "instagram url": "instagram",
      linkedin: "linkedin", "linkedin url": "linkedin",
      address: "address", street: "address",
      description: "description", about: "description",
    };

    const normalizedHeaders = rawHeaders.map(h => {
      const lower = h.trim().toLowerCase();
      return HEADER_ALIASES[lower] ?? lower;
    });

    // Find all columns that normalize to "website"
    const websiteColumns: Array<{ rawName: string; index: number }> = [];
    normalizedHeaders.forEach((norm, idx) => {
      if (norm === "website") {
        websiteColumns.push({ rawName: rawHeaders[idx], index: idx });
      }
    });

    // The last one always wins in object construction
    const winnerCol = websiteColumns[websiteColumns.length - 1];
    const loserCols = websiteColumns.slice(0, -1);

    const MAPS_RE = /google\.com\/maps|maps\.google|goo\.gl\/maps/i;

    // Analyze first 100 data rows
    const samples: any[] = [];
    let loserHadRealUrl = 0;
    let loserHadMapsUrl = 0;
    let loserBlank = 0;
    let winnerBlank = 0;
    let winnerReal = 0;
    let winnerMaps = 0;

    const nameIdx = normalizedHeaders.findIndex(h => h === "name");

    for (let i = headerLineIdx + 1; i < Math.min(lines.length, headerLineIdx + 101); i++) {
      const cells = splitCsvLine(lines[i]);
      const name = nameIdx >= 0 ? (cells[nameIdx] ?? "").trim() : `row_${i}`;

      // Value from the losing column(s) — the real Website col
      const loserVal = loserCols.length > 0 ? (cells[loserCols[0].index] ?? "").trim() : "";
      // Value from the winning column — the URL col that overwrites it
      const winnerVal = winnerCol ? (cells[winnerCol.index] ?? "").trim() : "";

      if (loserVal) {
        if (MAPS_RE.test(loserVal)) loserHadMapsUrl++;
        else loserHadRealUrl++;
      } else {
        loserBlank++;
      }

      if (winnerVal) {
        if (MAPS_RE.test(winnerVal)) winnerMaps++;
        else winnerReal++;
      } else {
        winnerBlank++;
      }

      if (samples.length < 20) {
        samples.push({
          name,
          [`col_${loserCols[0]?.rawName}_idx${loserCols[0]?.index}`]: loserVal || "(blank)",
          [`col_${winnerCol?.rawName}_idx${winnerCol?.index}`]: winnerVal || "(blank)",
          parse_function_stores: winnerVal || "(blank — real url from Website col silently lost)",
        });
      }
    }

    return new Response(
      JSON.stringify({
        header_line_index: headerLineIdx,
        all_columns_normalizing_to_website: websiteColumns,
        winner_column: winnerCol,
        loser_columns: loserCols,
        bug_present: loserCols.length > 0 && winnerCol !== undefined,
        analysis_of_100_rows: {
          loser_col_had_real_url: loserHadRealUrl,
          loser_col_had_maps_url: loserHadMapsUrl,
          loser_col_blank: loserBlank,
          winner_col_blank: winnerBlank,
          winner_col_real: winnerReal,
          winner_col_maps: winnerMaps,
        },
        row_samples: samples,
      }),
      { headers: { ...corsHeaders, "Content-Type": "application/json" } }
    );
  } catch (err) {
    return new Response(
      JSON.stringify({ error: String(err) }),
      { status: 500, headers: { ...corsHeaders, "Content-Type": "application/json" } }
    );
  }
});
