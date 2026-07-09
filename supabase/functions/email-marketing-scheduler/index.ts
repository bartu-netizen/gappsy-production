import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2";
import { sendEmail } from "../_shared/emailClient.ts";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "GET, POST, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey, x-admin-token, x-admin-secret",
};

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: corsHeaders });
  }

  const supabase = createClient(
    Deno.env.get("SUPABASE_URL") ?? "",
    Deno.env.get("SUPABASE_SERVICE_ROLE_KEY") ?? "",
    { auth: { autoRefreshToken: false, persistSession: false } }
  );

  try {
    const { data: settings } = await supabase.from("em_settings").select("key,value");
    const cfg: Record<string, string> = {};
    (settings ?? []).forEach((r: any) => { cfg[r.key] = r.value; });
    const maxPerRun = Math.min(parseInt(cfg["max_per_minute"] ?? "60"), 200);

    const now = new Date().toISOString();

    const { data: messages, error: fetchErr } = await supabase
      .from("em_messages")
      .select("id,to_email,subject_rendered,body_html_rendered,from_name,from_email,reply_to,campaign_id,contact_id")
      .eq("status", "queued")
      .lte("scheduled_for", now)
      .order("scheduled_for", { ascending: true })
      .limit(maxPerRun);

    if (fetchErr) {
      return new Response(JSON.stringify({ ok: false, error: fetchErr.message }), {
        status: 500,
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      });
    }

    if (!messages || messages.length === 0) {
      return new Response(JSON.stringify({ ok: true, processed: 0, message: "No queued messages" }), {
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      });
    }

    // Check suppression list once
    const { data: suppressed } = await supabase.from("em_suppression").select("email");
    const suppressedEmails = new Set((suppressed ?? []).map((s: any) => s.email.toLowerCase()));

    let sent = 0;
    let failed = 0;
    const campaignCounts: Record<string, number> = {};

    for (const msg of messages) {
      if (suppressedEmails.has(msg.to_email.toLowerCase())) {
        await supabase.from("em_messages").update({ status: "suppressed", sent_at: now }).eq("id", msg.id);
        continue;
      }

      const fromStr = msg.from_name ? `${msg.from_name} <${msg.from_email}>` : msg.from_email;
      const baseUrl = Deno.env.get("SUPABASE_URL") ?? "";
      const pixelUrl = `${baseUrl}/functions/v1/email-open-pixel?mid=${msg.id}${msg.campaign_id ? `&cid=${msg.campaign_id}` : ""}`;
      const pixelTag = `<img src="${pixelUrl}" width="1" height="1" alt="" style="display:none!important;opacity:0;border:0;width:1px;height:1px;max-width:1px;max-height:1px;" />`;
      const htmlWithPixel = msg.body_html_rendered
        ? msg.body_html_rendered.replace(/<\/body>/i, `${pixelTag}</body>`)
          || msg.body_html_rendered + pixelTag
        : pixelTag;

      const result = await sendEmail({
        to: msg.to_email,
        subject: msg.subject_rendered,
        html: htmlWithPixel,
        from: fromStr,
        replyTo: msg.reply_to ?? undefined,
      });

      const sentAt = new Date().toISOString();

      if (result.success) {
        await supabase.from("em_messages").update({
          status: "sent",
          sent_at: sentAt,
          provider_message_id: result.messageId ?? null,
        }).eq("id", msg.id);

        await supabase.from("em_events").insert({
          message_id: msg.id,
          contact_id: msg.contact_id,
          event_type: "sent",
          meta: { timestamp: sentAt },
        });

        sent++;
        if (msg.campaign_id) {
          campaignCounts[msg.campaign_id] = (campaignCounts[msg.campaign_id] ?? 0) + 1;
        }
      } else {
        await supabase.from("em_messages").update({
          status: "failed",
          error: result.error ?? "Send failed",
        }).eq("id", msg.id);

        await supabase.from("em_events").insert({
          message_id: msg.id,
          contact_id: msg.contact_id,
          event_type: "failed",
          meta: { error: result.error, timestamp: sentAt },
        });

        failed++;
      }
    }

    // Update campaign sent_count for any campaigns that had messages sent
    for (const [campaignId, count] of Object.entries(campaignCounts)) {
      await supabase.rpc("increment_campaign_sent_count", { campaign_id: campaignId, increment: count }).catch(() => {
        // RPC may not exist; fall back to read-then-write
        supabase.from("em_campaigns").select("sent_count").eq("id", campaignId).maybeSingle().then(({ data }: any) => {
          supabase.from("em_campaigns").update({ sent_count: (data?.sent_count ?? 0) + count }).eq("id", campaignId);
        });
      });
    }

    // Check if any campaigns are now fully sent (no more queued messages)
    for (const campaignId of Object.keys(campaignCounts)) {
      const { count } = await supabase.from("em_messages").select("id", { count: "exact", head: true }).eq("campaign_id", campaignId).eq("status", "queued");
      if ((count ?? 0) === 0) {
        await supabase.from("em_campaigns").update({ status: "completed", completed_at: now }).eq("id", campaignId).eq("status", "sending");
      }
    }

    return new Response(
      JSON.stringify({ ok: true, processed: messages.length, sent, failed }),
      { headers: { ...corsHeaders, "Content-Type": "application/json" } }
    );
  } catch (e: any) {
    console.error("[email-marketing-scheduler]", e);
    return new Response(
      JSON.stringify({ ok: false, error: e.message ?? "Internal error" }),
      { status: 500, headers: { ...corsHeaders, "Content-Type": "application/json" } }
    );
  }
});
