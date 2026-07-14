// deno-lint-ignore-file no-explicit-any
import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { validateCrawlUrl, resolvesToPublicAddress } from "../_shared/crawlUrlSafety.ts";

const CORS_HEADERS = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "POST, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey",
};

function jsonResponse(body: unknown, status = 200) {
  return new Response(JSON.stringify(body), { status, headers: { ...CORS_HEADERS, "Content-Type": "application/json" } });
}

const supabase = createClient(Deno.env.get("SUPABASE_URL") ?? "", Deno.env.get("SUPABASE_SERVICE_ROLE_KEY") ?? "");
const FETCH_TIMEOUT_MS = 6000;
const MAX_BYTES = 200_000;

async function safeFetchText(url: string): Promise<string | null> {
  const parsed = validateCrawlUrl(url);
  if (!parsed.ok) return null;
  const dns = await resolvesToPublicAddress(parsed.hostname!);
  if (!dns.ok) return null;
  const controller = new AbortController();
  const timeoutId = setTimeout(() => controller.abort(), FETCH_TIMEOUT_MS);
  try {
    const res = await fetch(parsed.normalizedUrl!, { redirect: "follow", signal: controller.signal, headers: { "User-Agent": "GappsyBot/1.0 (+https://www.gappsy.com; ownership verification)" } });
    if (!res.ok || !res.body) return null;
    const reader = res.body.getReader();
    const chunks: Uint8Array[] = [];
    let total = 0;
    while (total < MAX_BYTES) {
      const { done, value } = await reader.read();
      if (done) break;
      chunks.push(value);
      total += value.length;
    }
    reader.cancel().catch(() => {});
    return new TextDecoder().decode(new Uint8Array(chunks.flatMap((c) => Array.from(c))));
  } catch {
    return null;
  } finally {
    clearTimeout(timeoutId);
  }
}

async function fetchTokenRow(token: string) {
  const { data } = await supabase.from("vendor_ownership_tokens").select("*").eq("token", token).maybeSingle();
  return data;
}

function isExpired(row: { expires_at: string }): boolean {
  return new Date(row.expires_at).getTime() < Date.now();
}

async function getWebsiteForToken(row: any): Promise<string | null> {
  if (row.tool_id) {
    const { data } = await supabase.from("tools").select("website").eq("id", row.tool_id).maybeSingle();
    return data?.website || null;
  }
  const { data: sub } = await supabase.from("vendor_feature_subscriptions").select("discovered_tool_id").eq("id", row.vendor_subscription_id).maybeSingle();
  if (sub?.discovered_tool_id) {
    const { data: candidate } = await supabase.from("discovered_tools").select("official_website").eq("id", sub.discovered_tool_id).maybeSingle();
    return candidate?.official_website || null;
  }
  return null;
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") return new Response(null, { status: 200, headers: CORS_HEADERS });
  if (req.method !== "POST") return jsonResponse({ ok: false, error: "Method not allowed" }, 405);

  let payload: Record<string, unknown>;
  try {
    payload = await req.json();
  } catch {
    return jsonResponse({ ok: false, error: "Invalid JSON body" }, 400);
  }
  const action = typeof payload.action === "string" ? payload.action : null;
  const token = typeof payload.token === "string" ? payload.token : "";

  try {
    switch (action) {
      // Renders the "verify ownership" screen: current state + methods.
      case "get": {
        const row = await fetchTokenRow(token);
        if (!row) return jsonResponse({ ok: false, error: "Verification link not found" }, 404);
        if (isExpired(row) && !row.verified) return jsonResponse({ ok: false, error_code: "expired", error: "This verification link has expired. Contact support to get a new one." }, 410);

        const website = await getWebsiteForToken(row);
        let hostname: string | null = null;
        try { hostname = website ? new URL(website).hostname.replace(/^www\./, "") : null; } catch { /* leave null */ }

        return jsonResponse({
          ok: true,
          verified: row.verified,
          verification_method: row.verification_method,
          contact_email: row.contact_email,
          onboarding_session_id: row.onboarding_session_id,
          website,
          meta_tag_snippet: hostname ? `<meta name="gappsy-site-verification" content="${row.verification_target}">` : null,
          dns_txt_record: hostname ? { host: `_gappsy-verify.${hostname}`, value: `gappsy-site-verification=${row.verification_target}` } : null,
          html_file: hostname ? { path: `/gappsy-verify-${row.verification_target}.html`, body: row.verification_target } : null,
        });
      }

      // Runs the live check for one method and marks the token verified on
      // success. Domain-email match is NOT accepted here — it's a signal
      // only (see submit_contact's email_domain_matches_website), never
      // sufficient alone to unlock edit access.
      case "check": {
        const method = typeof payload.method === "string" ? payload.method : "";
        if (!["html_meta_tag", "dns_txt", "html_file"].includes(method)) return jsonResponse({ ok: false, error: "Invalid method" }, 400);

        const row = await fetchTokenRow(token);
        if (!row) return jsonResponse({ ok: false, error: "Verification link not found" }, 404);
        if (isExpired(row)) return jsonResponse({ ok: false, error_code: "expired", error: "This verification link has expired. Contact support to get a new one." }, 410);
        if (row.verified) return jsonResponse({ ok: true, verified: true, already_verified: true });

        const website = await getWebsiteForToken(row);
        if (!website) return jsonResponse({ ok: false, error: "No website on file to verify against" }, 400);
        let hostname: string;
        try { hostname = new URL(website).hostname.replace(/^www\./, ""); } catch { return jsonResponse({ ok: false, error: "Invalid website on file" }, 400); }

        let verified = false;
        if (method === "html_meta_tag") {
          const html = await safeFetchText(website);
          verified = !!html && new RegExp(`<meta[^>]+name=["']gappsy-site-verification["'][^>]+content=["']${row.verification_target}["']`, "i").test(html);
        } else if (method === "html_file") {
          const html = await safeFetchText(`https://${hostname}/gappsy-verify-${row.verification_target}.html`);
          verified = !!html && html.includes(row.verification_target);
        } else if (method === "dns_txt") {
          try {
            const records = await Deno.resolveDns(`_gappsy-verify.${hostname}`, "TXT");
            verified = records.some((rec) => rec.join("").includes(row.verification_target));
          } catch {
            verified = false;
          }
        }

        if (!verified) return jsonResponse({ ok: true, verified: false });

        await supabase
          .from("vendor_ownership_tokens")
          .update({ verified: true, verified_at: new Date().toISOString(), verification_method: method })
          .eq("id", row.id);
        if (row.onboarding_session_id) {
          await supabase.from("vendor_onboarding_sessions").update({ status: "verified", updated_at: new Date().toISOString() }).eq("id", row.onboarding_session_id);
          await supabase.from("vendor_funnel_events").insert({ onboarding_session_id: row.onboarding_session_id, event_name: "verification_completed", metadata: { method } });
        }
        return jsonResponse({ ok: true, verified: true });
      }

      default:
        return jsonResponse({ ok: false, error: "Unknown action" }, 400);
    }
  } catch (err) {
    console.error("[vendor-ownership-verify] unhandled error:", (err as Error).message);
    return jsonResponse({ ok: false, error: "Something went wrong. Please try again." }, 500);
  }
});
