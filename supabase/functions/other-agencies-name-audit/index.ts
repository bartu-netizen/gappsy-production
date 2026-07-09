import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { requireAdminSession, CORS_HEADERS } from "../_shared/adminSession.ts";

const GENERIC_WORDS = new Set([
  "advertising", "digital marketing", "marketing", "agency", "seo",
  "social media", "media", "creative", "design", "web", "website",
  "videos", "video", "content", "branding", "strategy", "solutions",
  "services", "company", "group", "studio", "partners",
]);

const ATTRIBUTE_LABEL_PATTERNS = [
  /^(name|phone|email|address|website|city|state|zip|fax|contact|url|http|category|type|tag|label|field|value|null|undefined|none|unknown)\s*:?/i,
];

const EMAIL_REGEX = /^[a-z0-9._%+\-]+@[a-z0-9.\-]+\.[a-z]{2,}$/i;

interface ClassifiedRow {
  id: string;
  name: string;
  slug: string | null;
  state_slug: string;
  website_url: string | null;
  is_active: boolean;
  tier: "valid" | "suspicious" | "junk";
  reasons: string[];
}

function classifyAgencyName(
  id: string,
  name: string,
  slug: string | null,
  state_slug: string,
  website_url: string | null,
  is_active: boolean
): ClassifiedRow {
  const reasons: string[] = [];
  let tier: "valid" | "suspicious" | "junk" = "valid";

  if (!name || name.trim() === "") {
    return { id, name, slug, state_slug, website_url, is_active, tier: "junk", reasons: ["empty_name"] };
  }

  const trimmed = name.trim();
  const lower = trimmed.toLowerCase();

  // Junk: email address used as name
  if (EMAIL_REGEX.test(trimmed)) {
    reasons.push("email_as_name");
    tier = "junk";
  }

  // Junk: attribute label (must be exact prefix match, not partial word)
  for (const pat of ATTRIBUTE_LABEL_PATTERNS) {
    if (pat.test(trimmed)) {
      reasons.push("attribute_label");
      tier = "junk";
      break;
    }
  }

  // Junk: single generic word (exact match only)
  if (tier !== "junk" && GENERIC_WORDS.has(lower)) {
    reasons.push("generic_single_word");
    tier = "junk";
  }

  // Junk: clearly not an agency name (alphanumeric slug-like, short, no spaces)
  if (tier !== "junk" && /^[a-z0-9]+$/.test(lower) && lower.length < 20 && !lower.includes(" ")) {
    const wordCount = trimmed.split(/\s+/).length;
    if (wordCount === 1 && !website_url) {
      reasons.push("not_agency_name");
      tier = "junk";
    }
  }

  // Suspicious: all-caps short acronym (flag but don't deactivate — many are real)
  if (tier === "valid" && /^[A-Z]{2,6}$/.test(trimmed)) {
    reasons.push("all_caps_short");
    tier = "suspicious";
  }

  // Suspicious: starts with number
  if (tier === "valid" && /^\d/.test(trimmed)) {
    reasons.push("starts_with_number");
    tier = "suspicious";
  }

  return { id, name, slug, state_slug, website_url, is_active, tier, reasons };
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: CORS_HEADERS });
  }

  try {
    const authResult = await requireAdminSession(req);
    if (authResult instanceof Response) return authResult;

    const supabase = createClient(
      Deno.env.get("SUPABASE_URL") || "",
      Deno.env.get("SUPABASE_SERVICE_ROLE_KEY") || ""
    );

    const url = new URL(req.url);
    const mode = url.searchParams.get("mode") || "audit";
    const state = url.searchParams.get("state") || undefined;
    const dryRun = url.searchParams.get("dry_run") !== "false";

    // Fetch all rows
    let query = supabase
      .from("other_agencies")
      .select("id, name, slug, state_slug, website_url, is_active");
    if (state) query = query.eq("state_slug", state);

    const { data: rows, error } = await query;
    if (error) throw error;

    const all = (rows || []) as any[];
    const classified: ClassifiedRow[] = all.map((r) =>
      classifyAgencyName(r.id, r.name, r.slug, r.state_slug, r.website_url, r.is_active)
    );

    // Summary counts
    const summary = {
      total: classified.length,
      active: classified.filter((r) => r.is_active).length,
      inactive: classified.filter((r) => !r.is_active).length,
      valid: classified.filter((r) => r.tier === "valid").length,
      suspicious: classified.filter((r) => r.tier === "suspicious").length,
      junk: classified.filter((r) => r.tier === "junk").length,
      junk_active: classified.filter((r) => r.tier === "junk" && r.is_active).length,
    };

    if (mode === "audit") {
      return new Response(JSON.stringify({
        ok: true,
        summary,
        rows: classified,
      }), {
        status: 200,
        headers: { ...CORS_HEADERS, "Content-Type": "application/json" },
      });
    }

    if (mode === "repair") {
      // Deactivate all active junk rows
      const toDeactivate = classified.filter((r) => r.tier === "junk" && r.is_active);

      if (toDeactivate.length === 0) {
        return new Response(JSON.stringify({
          ok: true,
          message: "No active junk rows found. Nothing to repair.",
          summary,
          deactivated: [],
          dry_run: dryRun,
        }), {
          status: 200,
          headers: { ...CORS_HEADERS, "Content-Type": "application/json" },
        });
      }

      if (dryRun) {
        return new Response(JSON.stringify({
          ok: true,
          message: `DRY RUN: Would deactivate ${toDeactivate.length} junk rows.`,
          summary,
          would_deactivate: toDeactivate,
          dry_run: true,
        }), {
          status: 200,
          headers: { ...CORS_HEADERS, "Content-Type": "application/json" },
        });
      }

      // Log and deactivate each
      const deactivated: any[] = [];
      for (const row of toDeactivate) {
        const logResult = await supabase
          .from("other_agencies_repair_log")
          .insert({
            agency_id: row.id,
            action: "deactivate",
            reason: row.reasons.join(","),
            old_name: row.name,
            new_name: row.name,
            old_is_active: true,
            new_is_active: false,
            performed_by: "admin:edge_function:other-agencies-name-audit",
          });

        const updateResult = await supabase
          .from("other_agencies")
          .update({ is_active: false })
          .eq("id", row.id);

        deactivated.push({
          id: row.id,
          name: row.name,
          reasons: row.reasons,
          log_error: logResult.error?.message || null,
          update_error: updateResult.error?.message || null,
        });
      }

      // Refresh search index
      await supabase.rpc("refresh_agency_search_index").catch(() => null);

      return new Response(JSON.stringify({
        ok: true,
        message: `Deactivated ${deactivated.length} junk rows.`,
        summary,
        deactivated,
        dry_run: false,
      }), {
        status: 200,
        headers: { ...CORS_HEADERS, "Content-Type": "application/json" },
      });
    }

    return new Response(JSON.stringify({ ok: false, error: "Unknown mode. Use ?mode=audit or ?mode=repair" }), {
      status: 400,
      headers: { ...CORS_HEADERS, "Content-Type": "application/json" },
    });
  } catch (err) {
    const message = err instanceof Error ? err.message : String(err);
    console.error("other-agencies-name-audit error:", message);
    return new Response(JSON.stringify({ ok: false, error: message }), {
      status: 500,
      headers: { ...CORS_HEADERS, "Content-Type": "application/json" },
    });
  }
});
