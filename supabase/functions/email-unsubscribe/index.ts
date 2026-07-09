import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "GET, POST, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey",
};

function html(body: string, status = 200): Response {
  return new Response(`<!DOCTYPE html><html><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1"><title>Unsubscribe</title><style>body{font-family:sans-serif;background:#f8fafc;display:flex;align-items:center;justify-content:center;min-height:100vh;margin:0}.card{background:#fff;border-radius:16px;padding:40px;max-width:480px;width:90%;box-shadow:0 1px 4px rgba(0,0,0,.08);text-align:center}h1{font-size:22px;color:#0f172a;margin:0 0 12px}p{color:#64748b;font-size:15px;line-height:1.6;margin:0 0 24px}.badge{display:inline-block;padding:6px 16px;border-radius:999px;font-size:13px;font-weight:600}.ok{background:#dcfce7;color:#166534}.err{background:#fee2e2;color:#991b1b}</style></head><body><div class="card">${body}</div></body></html>`,
    { status, headers: { ...corsHeaders, "Content-Type": "text/html; charset=utf-8" } });
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: corsHeaders });
  }

  const url = new URL(req.url);
  const email = (url.searchParams.get("email") ?? "").trim().toLowerCase();
  const mid = url.searchParams.get("mid")?.trim() ?? "";

  if (!email || !email.includes("@")) {
    return html(`<h1>Invalid Link</h1><p>This unsubscribe link is missing a valid email address.</p>`);
  }

  const supabaseUrl = Deno.env.get("SUPABASE_URL");
  const serviceKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");

  if (!supabaseUrl || !serviceKey) {
    return html(`<h1>Service Error</h1><p>Unable to process your request. Please try again later.</p>`, 500);
  }

  const supabase = createClient(supabaseUrl, serviceKey, {
    auth: { autoRefreshToken: false, persistSession: false },
  });

  try {
    const now = new Date().toISOString();

    const { data: contact } = await supabase
      .from("em_contacts")
      .update({ unsubscribed_at: now, updated_at: now })
      .eq("email", email)
      .select("id")
      .maybeSingle();

    await supabase.from("em_suppression").upsert(
      { email, reason: "unsubscribed" },
      { onConflict: "email" }
    );

    if (contact?.id) {
      await supabase.from("em_funnel_events").insert({
        contact_id: contact.id,
        event_type: "unsubscribed",
        message_id: mid || null,
        meta: { email, source: "unsubscribe_link" },
      });
    }

    if (mid) {
      await supabase.from("em_events").insert({
        message_id: mid,
        contact_id: contact?.id ?? null,
        event_type: "unsub",
        meta: { email },
      });
    }

    return html(`
      <h1>You've been unsubscribed</h1>
      <p>The email address <strong>${email}</strong> has been removed from our mailing list.</p>
      <span class="badge ok">Unsubscribed successfully</span>
      <p style="margin-top:24px;font-size:13px;color:#94a3b8">If this was a mistake, please contact us at support@gappsy.com</p>
    `);
  } catch (e: unknown) {
    console.error("[email-unsubscribe] error:", e instanceof Error ? e.message : e);
    return html(`<h1>Error</h1><p>Something went wrong. Please try again or contact support@gappsy.com.</p>`, 500);
  }
});
