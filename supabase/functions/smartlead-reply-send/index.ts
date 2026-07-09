import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { requireAdminSession } from "../_shared/adminSession.ts";

const CORS = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "POST, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey, x-admin-token",
};

function json(data: unknown, status = 200) {
  return new Response(JSON.stringify(data), {
    status,
    headers: { ...CORS, "Content-Type": "application/json" },
  });
}

function smartleadApiKey(): string {
  const key = Deno.env.get("SMARTLEAD_API_KEY");
  if (!key) throw new Error("SMARTLEAD_API_KEY not configured");
  return key;
}

async function sendReplyViaSmartlead(
  campaignId: string,
  leadId: string,
  body: { subject?: string; reply_message: string; reply_email_body?: string }
): Promise<{ ok: boolean; message_id?: string; raw?: unknown }> {
  const url = new URL(`https://server.smartlead.ai/api/v1/campaigns/${campaignId}/leads/${leadId}/reply`);
  url.searchParams.set("api_key", smartleadApiKey());

  const res = await fetch(url.toString(), {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(body),
  });

  const raw = await res.json().catch(() => ({}));

  if (!res.ok) {
    throw new Error(`Smartlead reply API returned ${res.status}: ${JSON.stringify(raw).slice(0, 300)}`);
  }

  const message_id =
    (raw as any)?.id ??
    (raw as any)?.message_id ??
    (raw as any)?.email_id ??
    undefined;

  return { ok: true, message_id: message_id ? String(message_id) : undefined, raw };
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") return new Response(null, { status: 200, headers: CORS });

  try {
    const session = await requireAdminSession(req);

    const supabase = createClient(
      Deno.env.get("SUPABASE_URL")!,
      Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!,
      { auth: { autoRefreshToken: false, persistSession: false } },
    );

    const body = await req.json().catch(() => ({}));
    const { conversation_id, reply_text, subject } = body;

    if (!conversation_id || !reply_text?.trim()) {
      return json({ ok: false, error: "conversation_id and reply_text required" }, 400);
    }

    const { data: conv, error: convErr } = await supabase
      .from("smartlead_conversations")
      .select("id, campaign_id, smartlead_lead_id, email_normalized, latest_subject")
      .eq("id", conversation_id)
      .maybeSingle();

    if (convErr) throw convErr;
    if (!conv) return json({ ok: false, error: "Conversation not found" }, 404);

    if (!conv.smartlead_lead_id) {
      return json({ ok: false, error: "No smartlead_lead_id — cannot reply via API" }, 400);
    }

    const replySubject = subject?.trim() || (conv.latest_subject ? `Re: ${conv.latest_subject}` : "Follow up");

    const { message_id, raw } = await sendReplyViaSmartlead(conv.campaign_id, conv.smartlead_lead_id, {
      subject: replySubject,
      reply_message: reply_text,
      reply_email_body: reply_text,
    });

    const msgRow = {
      conversation_id,
      campaign_id: conv.campaign_id,
      lead_id: conv.smartlead_lead_id,
      email_normalized: conv.email_normalized,
      direction: "outbound",
      subject: replySubject,
      body_text: reply_text,
      body_html: null,
      from_email: null,
      to_email: conv.email_normalized,
      event_at: new Date().toISOString(),
      smartlead_message_id: message_id ?? null,
      sequence_number: null,
      raw_json: raw,
    };

    const { data: savedMsg, error: msgErr } = await supabase
      .from("smartlead_messages")
      .insert(msgRow)
      .select("id")
      .maybeSingle();

    if (msgErr) {
      console.warn("[smartlead-reply-send] message save error:", msgErr.message);
    }

    await supabase
      .from("smartlead_conversations")
      .update({
        status: "replied",
        latest_event_type: "replied",
        latest_event_at: new Date().toISOString(),
        latest_subject: replySubject,
        updated_at: new Date().toISOString(),
      })
      .eq("id", conversation_id);

    console.info(`[smartlead-reply-send] replied to conv ${conversation_id} by ${session.admin_email}`);

    return json({ ok: true, message_id, saved_message_id: savedMsg?.id ?? null });
  } catch (err) {
    const message = err instanceof Error ? err.message : String(err);
    console.error("[smartlead-reply-send] error:", message);
    return json({ ok: false, error: message }, message.includes("Unauthorized") ? 401 : 500);
  }
});
