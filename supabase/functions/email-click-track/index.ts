import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "GET, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey",
};

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: corsHeaders });
  }

  const url = new URL(req.url);
  const mid = url.searchParams.get("mid")?.trim() ?? "";
  const dest = url.searchParams.get("url")?.trim() ?? "";

  const fallback = dest || "https://www.gappsy.com";

  if (!mid || !dest) {
    return Response.redirect(fallback, 302);
  }

  const supabaseUrl = Deno.env.get("SUPABASE_URL");
  const serviceKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");

  if (!supabaseUrl || !serviceKey) {
    return Response.redirect(fallback, 302);
  }

  const supabase = createClient(supabaseUrl, serviceKey, {
    auth: { autoRefreshToken: false, persistSession: false },
  });

  try {
    const userAgent = req.headers.get("user-agent") ?? null;
    const ip = req.headers.get("x-forwarded-for")?.split(",")[0]?.trim()
      ?? req.headers.get("cf-connecting-ip")
      ?? null;

    const { data: evRow, error: evErr } = await supabase.from("em_events").insert({
      message_id: mid,
      event_type: "click",
      url: dest,
      user_agent: userAgent,
      ip_hash: ip ? await hashIp(ip) : null,
      meta: { source: "link" },
    }).select("id").single();

    if (!evErr) {
      const { data: msg } = await supabase
        .from("em_messages")
        .select("contact_id, subject_rendered, campaign_id")
        .eq("id", mid)
        .maybeSingle();

      if (msg?.contact_id) {
        await supabase.from("em_funnel_events").insert({
          contact_id: msg.contact_id,
          event_type: "email_click",
          message_id: mid,
          meta: { url: dest, subject: msg.subject_rendered },
        });
        await supabase
          .from("em_contacts")
          .update({ last_action_at: new Date().toISOString(), updated_at: new Date().toISOString() })
          .eq("id", msg.contact_id);

        if (msg.campaign_id) {
          await supabase.rpc("increment_campaign_click_count", { p_campaign_id: msg.campaign_id }).catch(() => {});
        }
      }
    }
  } catch (e: unknown) {
    console.error("[email-click-track] error:", e instanceof Error ? e.message : e);
  }

  return Response.redirect(fallback, 302);
});

async function hashIp(ip: string): Promise<string> {
  const data = new TextEncoder().encode(ip + "gappsy-pixel-salt");
  const digest = await crypto.subtle.digest("SHA-256", data);
  return Array.from(new Uint8Array(digest)).map(b => b.toString(16).padStart(2, "0")).join("").substring(0, 16);
}
