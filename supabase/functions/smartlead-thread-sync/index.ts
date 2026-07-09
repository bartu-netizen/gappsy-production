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

async function fetchLeadMessages(campaignId: string, leadId: string): Promise<any[]> {
  const url = new URL(`https://server.smartlead.ai/api/v1/campaigns/${campaignId}/leads/${leadId}/message-history`);
  url.searchParams.set("api_key", smartleadApiKey());

  const res = await fetch(url.toString(), { headers: { "Content-Type": "application/json" } });
  if (!res.ok) {
    const body = await res.text().catch(() => "");
    throw new Error(`Smartlead API returned ${res.status}: ${body.slice(0, 200)}`);
  }

  const data = await res.json();

  if (Array.isArray(data)) return data;
  if (data && typeof data === "object") {
    if (Array.isArray(data.data)) return data.data;
    if (Array.isArray(data.messages)) return data.messages;
    if (Array.isArray(data.history)) return data.history;
  }
  return [];
}

function normalizeDirection(raw: unknown): string {
  if (typeof raw !== "string") return "outbound";
  const s = raw.toLowerCase();
  if (s === "inbound" || s === "received" || s === "reply" || s === "lead_reply") return "inbound";
  return "outbound";
}

function extractBody(item: any): { body_text: string | null; body_html: string | null } {
  const html = item.email_body ?? item.body_html ?? item.html_body ?? item.html ?? null;
  const text = item.email_body_text ?? item.body_text ?? item.text_body ?? item.text ?? null;
  return { body_text: text, body_html: html };
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") return new Response(null, { status: 200, headers: CORS });

  try {
    await requireAdminSession(req);

    const supabase = createClient(
      Deno.env.get("SUPABASE_URL")!,
      Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!,
      { auth: { autoRefreshToken: false, persistSession: false } },
    );

    const body = await req.json().catch(() => ({}));
    const { conversation_id } = body;

    if (!conversation_id) {
      return json({ ok: false, error: "conversation_id required" }, 400);
    }

    const { data: conv, error: convErr } = await supabase
      .from("smartlead_conversations")
      .select("id, campaign_id, smartlead_lead_id, email_normalized")
      .eq("id", conversation_id)
      .maybeSingle();

    if (convErr) throw convErr;
    if (!conv) return json({ ok: false, error: "Conversation not found" }, 404);

    if (!conv.smartlead_lead_id) {
      return json({ ok: false, error: "No smartlead_lead_id on this conversation" }, 400);
    }

    const rawMessages = await fetchLeadMessages(conv.campaign_id, conv.smartlead_lead_id);
    console.log(`[smartlead-thread-sync] fetched ${rawMessages.length} messages for conv ${conversation_id}`);

    let inserted = 0;
    let skipped = 0;

    for (let i = 0; i < rawMessages.length; i++) {
      const item = rawMessages[i];
      const messageId = item.id ?? item.message_id ?? item.email_id ?? null;
      const { body_text, body_html } = extractBody(item);

      const row = {
        conversation_id,
        campaign_id: conv.campaign_id,
        lead_id: conv.smartlead_lead_id,
        email_normalized: conv.email_normalized,
        direction: normalizeDirection(item.type ?? item.direction ?? item.email_type),
        subject: item.subject ?? item.email_subject ?? null,
        body_text,
        body_html,
        from_email: item.from_email ?? item.from ?? null,
        to_email: item.to_email ?? item.to ?? null,
        event_at: item.sent_at ?? item.created_at ?? item.received_at ?? item.time ?? null,
        smartlead_message_id: messageId ? String(messageId) : null,
        sequence_number: item.sequence_number ?? item.seq ?? i + 1,
        raw_json: item,
      };

      const { error: insErr } = await supabase
        .from("smartlead_messages")
        .insert(row)
        .select("id")
        .maybeSingle();

      if (insErr) {
        if (insErr.code === "23505") {
          skipped++;
        } else {
          console.warn(`[smartlead-thread-sync] insert error for message ${messageId}:`, insErr.message);
          skipped++;
        }
      } else {
        inserted++;
      }
    }

    await supabase
      .from("smartlead_conversations")
      .update({ messages_synced_at: new Date().toISOString(), updated_at: new Date().toISOString() })
      .eq("id", conversation_id);

    return json({ ok: true, fetched: rawMessages.length, inserted, skipped });
  } catch (err) {
    const message = err instanceof Error ? err.message : String(err);
    console.error("[smartlead-thread-sync] error:", message);
    return json({ ok: false, error: message }, message.includes("Unauthorized") ? 401 : 500);
  }
});
