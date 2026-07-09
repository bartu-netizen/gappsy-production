import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2";
import { authenticateAdmin, createAuthErrorResponse } from "../_shared/adminAuth.ts";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "GET, POST, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey, x-admin-secret, x-admin-token",
};

const HIGH_CONFIDENCE_KEYWORDS = [
  "casino",
  "gambling",
  "poker",
  "roulette",
  "sportsbook",
  "blackjack",
  "jackpot",
  "betting",
  "wager",
  "bonus",
];

const SLOT_KEYWORDS = [
  "slots",
  "slot machine",
  "free spins",
];

interface Match {
  source_type: "DB" | "FILE";
  location: string;
  identifier: string;
  context: string;
  matched_keyword: string;
  state_slug?: string;
  rank?: number;
}

function getContextSnippet(text: string, keyword: string, maxLength = 120): string {
  const lowerText = text.toLowerCase();
  const lowerKeyword = keyword.toLowerCase();
  const index = lowerText.indexOf(lowerKeyword);

  if (index === -1) return text.substring(0, maxLength);

  const start = Math.max(0, index - 40);
  const end = Math.min(text.length, index + keyword.length + 40);

  let snippet = text.substring(start, end);
  if (start > 0) snippet = "..." + snippet;
  if (end < text.length) snippet = snippet + "...";

  return snippet;
}

async function scanDatabase(
  supabase: any,
  keywords: string[],
  includeSlotKeywords: boolean
): Promise<Match[]> {
  const matches: Match[] = [];
  const allKeywords = includeSlotKeywords
    ? [...keywords, ...SLOT_KEYWORDS]
    : keywords;

  const tablesToScan = [
    { name: "state_content", columns: ["hero_intro", "hero_intro_short", "state_intro_short", "state_intro_full", "state_description_full"] },
    { name: "state_faqs", columns: ["question", "answer"] },
    { name: "top25_slots", columns: ["agency_name", "description", "short_description", "services"] },
    { name: "other_agencies", columns: ["name", "short_description", "full_description", "services"] },
    { name: "spotlight_placements", columns: ["agency_name", "description"] },
    { name: "sidebar_ads", columns: ["title", "description"] }
  ];

  for (const tableConfig of tablesToScan) {
    try {
      const { data: rows, error } = await supabase
        .from(tableConfig.name)
        .select("*")
        .limit(1000);

      if (error || !rows || rows.length === 0) continue;

      for (const row of rows) {
        const rowId = row.id || row.slug || row.state_slug || "unknown";
        const stateSlug = row.state_slug || undefined;
        const rank = row.rank || undefined;

        for (const column of tableConfig.columns) {
          let textToScan = "";

          if (typeof row[column] === "string") {
            textToScan = row[column];
          } else if (Array.isArray(row[column])) {
            textToScan = row[column].join(" ");
          }

          if (!textToScan) continue;

          for (const keyword of allKeywords) {
            if (textToScan.toLowerCase().includes(keyword.toLowerCase())) {
              matches.push({
                source_type: "DB",
                location: `${tableConfig.name}.${column}`,
                identifier: String(rowId),
                context: getContextSnippet(textToScan, keyword),
                matched_keyword: keyword,
                state_slug: stateSlug,
                rank: rank,
              });
            }
          }
        }
      }
    } catch (error) {
      console.error(`Failed to scan table ${tableConfig.name}:`, error);
    }
  }

  return matches;
}

async function scanFiles(keywords: string[], includeSlotKeywords: boolean): Promise<Match[]> {
  const matches: Match[] = [];
  const allKeywords = includeSlotKeywords
    ? [...keywords, ...SLOT_KEYWORDS]
    : keywords;

  const filesToScan = [
    "/var/task/public/data/new-jersey.json",
    "/var/task/public/data/alabama.json",
  ];

  for (const filePath of filesToScan) {
    try {
      const content = await Deno.readTextFile(filePath);
      const lines = content.split("\n");

      for (let i = 0; i < lines.length; i++) {
        const line = lines[i];
        for (const keyword of allKeywords) {
          if (line.toLowerCase().includes(keyword.toLowerCase())) {
            matches.push({
              source_type: "FILE",
              location: filePath.replace("/var/task/", ""),
              identifier: `line ${i + 1}`,
              context: getContextSnippet(line, keyword),
              matched_keyword: keyword,
            });
          }
        }
      }
    } catch (error) {
      console.error(`Failed to scan file ${filePath}:`, error);
    }
  }

  return matches;
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, {
      status: 200,
      headers: corsHeaders,
    });
  }

  try {
    const auth = await authenticateAdmin(req);
    if (!auth.success) return createAuthErrorResponse(auth, corsHeaders);

    const supabaseUrl = Deno.env.get("SUPABASE_URL") ?? "";
    const supabaseServiceKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY") ?? "";

    const supabase = createClient(supabaseUrl, supabaseServiceKey, {
      auth: { autoRefreshToken: false, persistSession: false },
    });

    const { includeSlotKeywords = false } = await req.json().catch(() => ({}));

    console.log(`[content-scan] Starting scan (includeSlotKeywords: ${includeSlotKeywords})`);

    const [dbMatches, fileMatches] = await Promise.all([
      scanDatabase(supabase, HIGH_CONFIDENCE_KEYWORDS, includeSlotKeywords),
      scanFiles(HIGH_CONFIDENCE_KEYWORDS, includeSlotKeywords),
    ]);

    const allMatches = [...dbMatches, ...fileMatches];

    const keywordCounts: Record<string, number> = {};
    const sourceTypeCounts = { DB: 0, FILE: 0 };

    for (const match of allMatches) {
      keywordCounts[match.matched_keyword] = (keywordCounts[match.matched_keyword] || 0) + 1;
      sourceTypeCounts[match.source_type]++;
    }

    console.log(`[content-scan] Found ${allMatches.length} matches`);

    return new Response(
      JSON.stringify({
        success: true,
        total_matches: allMatches.length,
        matches: allMatches,
        summary: {
          by_keyword: keywordCounts,
          by_source: sourceTypeCounts,
        },
      }),
      {
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      }
    );
  } catch (error: any) {
    console.error("[content-scan] Error:", error);
    return new Response(
      JSON.stringify({
        error: "SCAN_FAILED",
        message: error.message || "Content scan failed",
      }),
      {
        status: 500,
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      }
    );
  }
});
