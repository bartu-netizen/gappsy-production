import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2";

const TRANSPARENT_GIF = new Uint8Array([
  0x47, 0x49, 0x46, 0x38, 0x39, 0x61,
  0x01, 0x00, 0x01, 0x00, 0x80, 0x00, 0x00,
  0xff, 0xff, 0xff, 0x00, 0x00, 0x00,
  0x21, 0xf9, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x2c, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00, 0x00,
  0x02, 0x02, 0x44, 0x01, 0x00,
  0x3b,
]);

const GIF_HEADERS = {
  "Content-Type": "image/gif",
  "Cache-Control": "no-store, no-cache, must-revalidate, max-age=0",
  "Pragma": "no-cache",
  "Access-Control-Allow-Origin": "*",
};

function gifResponse(): Response {
  return new Response(TRANSPARENT_GIF, { status: 200, headers: GIF_HEADERS });
}

async function hashIp(ip: string): Promise<string> {
  const data = new TextEncoder().encode(ip + "gappsy-pixel-salt");
  const digest = await crypto.subtle.digest("SHA-256", data);
  return Array.from(new Uint8Array(digest)).map(b => b.toString(16).padStart(2, "0")).join("").substring(0, 16);
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: GIF_HEADERS });
  }

  const url = new URL(req.url);
  const mid = url.searchParams.get("mid")?.trim() ?? "";
  const cid = url.searchParams.get("cid")?.trim() ?? "";

  if (!mid) {
    return gifResponse();
  }

  const supabaseUrl = Deno.env.get("SUPABASE_URL");
  const serviceKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");

  if (!supabaseUrl || !serviceKey) {
    return gifResponse();
  }

  const supabase = createClient(supabaseUrl, serviceKey, {
    auth: { autoRefreshToken: false, persistSession: false },
  });

  try {
    const { data: existing } = await supabase
      .from("em_events")
      .select("id")
      .eq("message_id", mid)
      .eq("event_type", "open")
      .limit(1)
      .maybeSingle();

    if (!existing) {
      const ip = req.headers.get("x-forwarded-for")?.split(",")[0]?.trim()
        ?? req.headers.get("cf-connecting-ip")
        ?? "";
      const ipHash = ip ? await hashIp(ip) : null;
      const userAgent = req.headers.get("user-agent") ?? null;

      const row: Record<string, unknown> = {
        message_id: mid,
        event_type: "open",
        ip_hash: ipHash,
        user_agent: userAgent,
        meta: { source: "pixel" },
      };
      if (cid) row.campaign_id = cid;

      const { error } = await supabase.from("em_events").insert(row);
      if (!error) {
        // Look up the message to get contact_id, then write a funnel event
        const { data: msg } = await supabase
          .from("em_messages")
          .select("contact_id, subject_rendered")
          .eq("id", mid)
          .maybeSingle();

        if (msg?.contact_id) {
          await supabase.from("em_funnel_events").insert({
            contact_id: msg.contact_id,
            event_type: "email_open",
            message_id: mid,
            meta: { subject: msg.subject_rendered, campaign_id: cid || null },
          });
          await supabase
            .from("em_contacts")
            .update({ last_action_at: new Date().toISOString(), updated_at: new Date().toISOString() })
            .eq("id", msg.contact_id);
        }

        // Update campaign open count
        if (cid) {
          await supabase.rpc("increment_campaign_open_count", { p_campaign_id: cid }).catch(() => {});
        }
      }
    }
  } catch (e: unknown) {
    console.error("[email-open-pixel] Unexpected error:", e instanceof Error ? e.message : e);
  }

  return gifResponse();
});
