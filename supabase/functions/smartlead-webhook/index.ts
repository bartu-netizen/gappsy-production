import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";

const CORS_HEADERS = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "POST, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, x-webhook-secret",
};

interface WebhookPayload {
  id?: string;
  event_type?: string;
  campaign_id?: string;
  lead_id?: string;
  email?: string;
  [key: string]: any;
}

function computeEventKey(payload: WebhookPayload): string | null {
  // Priority 1: Native event id (most reliable)
  if (payload.id) {
    return payload.id;
  }

  // Priority 2: Include timestamp for repeated events (opens, clicks)
  const eventType = payload.event_type || "";
  if (payload.campaign_id && payload.lead_id && payload.timestamp) {
    // For repeated events, include timestamp to allow multiple occurrences
    if (["opened", "clicked"].includes(eventType)) {
      return `${payload.campaign_id}:${payload.lead_id}:${eventType}:${payload.timestamp}`;
    }
  }

  // Priority 3: Stable hash without timestamp (for single-occurrence events)
  if (payload.campaign_id && payload.lead_id && eventType) {
    return `${payload.campaign_id}:${payload.lead_id}:${eventType}`;
  }

  return null;
}

function normalizePayload(rawPayload: any): WebhookPayload {
  // Ensure consistent field access regardless of Smartlead API variations
  return {
    id: rawPayload.id || rawPayload.event_id,
    event_type: rawPayload.event_type || rawPayload.type,
    campaign_id: rawPayload.campaign_id || rawPayload.campaignId,
    lead_id: rawPayload.lead_id || rawPayload.leadId,
    email: rawPayload.email,
    timestamp: rawPayload.timestamp || rawPayload.received_at || new Date().toISOString(),
    custom_fields: rawPayload.custom_fields || rawPayload.customFields || {},
    ...rawPayload, // Preserve original fields
  };
}

function verifyWebhookSignature(req: Request, secret: string): boolean {
  const headerSecret = req.headers.get("x-webhook-secret");
  if (!headerSecret) {
    return false;
  }
  return headerSecret === secret;
}

async function mapEmailToLocalRow(
  supabase: any,
  payload: WebhookPayload
): Promise<{ email_id: string; agency_id: string } | null> {
  // Priority 1: custom_fields.other_agency_email_id
  if (payload.custom_fields?.other_agency_email_id) {
    const { data: email } = await supabase
      .from("other_agency_emails")
      .select("id, agency_id")
      .eq("id", payload.custom_fields.other_agency_email_id)
      .maybeSingle();

    if (email) {
      return { email_id: email.id, agency_id: email.agency_id };
    }
  }

  // Priority 2: smartlead_campaign_email_sync via lead_id
  if (payload.campaign_id && payload.lead_id) {
    const { data: sync } = await supabase
      .from("smartlead_campaign_email_sync")
      .select("other_agency_email_id, agency_id")
      .eq("campaign_id", payload.campaign_id)
      .eq("smartlead_lead_id", payload.lead_id)
      .maybeSingle();

    if (sync) {
      return { email_id: sync.other_agency_email_id, agency_id: sync.agency_id };
    }
  }

  // Priority 3: email_normalized + campaign_id
  if (payload.email && payload.campaign_id) {
    const { data: sync } = await supabase
      .from("smartlead_campaign_email_sync")
      .select("other_agency_email_id, agency_id")
      .eq("campaign_id", payload.campaign_id)
      .eq("email_normalized", payload.email.toLowerCase())
      .maybeSingle();

    if (sync) {
      return { email_id: sync.other_agency_email_id, agency_id: sync.agency_id };
    }
  }

  return null;
}

function mapEventTypeToOutreachStatus(eventType: string): string | null {
  const statusMap: Record<string, string> = {
    replied: "replied",
    bounced: "bounced",
    unsubscribed: "opted_out",
    blocked: "blocked",
  };
  return statusMap[eventType] || null;
}

function isReplyLikeEvent(eventType: string | null | undefined): boolean {
  if (!eventType) return false;
  const t = eventType.toLowerCase();
  return t.includes("repl") || t.includes("interest") || t.includes("meeting") || t.includes("qualif");
}

function normalizeMessageDirection(raw: unknown): string {
  if (typeof raw !== "string") return "outbound";
  const s = raw.toLowerCase();
  if (s === "inbound" || s === "received" || s === "reply" || s === "lead_reply") return "inbound";
  return "outbound";
}

async function hydrateConversationThread(
  supabase: any,
  campaignId: string,
  leadId: string,
  emailNorm: string,
): Promise<void> {
  const apiKey = Deno.env.get("SMARTLEAD_API_KEY");
  if (!apiKey) return;

  try {
    const url = `https://server.smartlead.ai/api/v1/campaigns/${campaignId}/leads/${leadId}/message-history?api_key=${apiKey}`;
    const res = await fetch(url, { headers: { "Content-Type": "application/json" } });
    if (!res.ok) {
      console.warn(`[smartlead-webhook] hydrate history ${res.status} for ${emailNorm}`);
      return;
    }

    const raw = await res.json();
    const messages: any[] = Array.isArray(raw) ? raw : (raw?.data ?? raw?.messages ?? raw?.history ?? []);
    if (messages.length === 0) return;

    // Conversation may still be in-flight from waitUntil upsert — retry briefly
    let convId: string | null = null;
    for (let attempt = 0; attempt < 4; attempt++) {
      if (attempt > 0) await new Promise(r => setTimeout(r, 600 * attempt));
      const { data: row } = await supabase
        .from("smartlead_conversations")
        .select("id")
        .eq("email_normalized", emailNorm)
        .eq("campaign_id", campaignId)
        .maybeSingle();
      convId = row?.id ?? null;
      if (convId) break;
    }

    if (!convId) {
      console.warn(`[smartlead-webhook] no conv after retries for ${emailNorm}`);
      return;
    }

    let inserted = 0;
    let latestInboundAt: string | null = null;
    let latestSubject: string | null = null;

    for (let i = 0; i < messages.length; i++) {
      const item = messages[i];
      const msgId = item.id ?? item.message_id ?? item.email_id ?? null;
      const direction = normalizeMessageDirection(item.type ?? item.direction ?? item.email_type);
      const sentAt = item.sent_at ?? item.created_at ?? item.received_at ?? item.time ?? null;
      const subject = item.subject ?? item.email_subject ?? null;
      const html = item.email_body ?? item.body_html ?? item.html_body ?? item.html ?? null;
      const text = item.email_body_text ?? item.body_text ?? item.text_body ?? item.text ?? null;

      if (direction === "inbound" && sentAt) {
        if (!latestInboundAt || sentAt > latestInboundAt) { latestInboundAt = sentAt; latestSubject = subject; }
      }

      const { error } = await supabase.from("smartlead_messages").insert({
        conversation_id: convId,
        campaign_id: campaignId,
        lead_id: leadId,
        email_normalized: emailNorm,
        direction,
        subject,
        body_text: text,
        body_html: html,
        from_email: item.from_email ?? item.from ?? null,
        to_email: item.to_email ?? item.to ?? null,
        event_at: sentAt ?? new Date().toISOString(),
        smartlead_message_id: msgId ? String(msgId) : null,
        sequence_number: item.sequence_number ?? item.seq ?? i + 1,
        raw_json: item,
      });

      if (!error || error.code === "23505") inserted++;
    }

    const update: Record<string, any> = {
      messages_synced_at: new Date().toISOString(),
      updated_at: new Date().toISOString(),
    };
    if (latestInboundAt) {
      update.latest_event_type = "replied";
      update.latest_event_at = latestInboundAt;
      update.status = "replied";
      if (latestSubject) update.latest_subject = latestSubject;
    }
    await supabase.from("smartlead_conversations").update(update).eq("id", convId);
    console.info(`[smartlead-webhook] hydrated ${emailNorm}: ${inserted}/${messages.length} messages`);
  } catch (e) {
    console.warn(`[smartlead-webhook] hydration error for ${emailNorm}:`, e instanceof Error ? e.message : String(e));
  }
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: CORS_HEADERS });
  }

  try {
    if (req.method !== "POST") {
      return new Response(
        JSON.stringify({ error: "Method not allowed" }),
        { status: 405, headers: { ...CORS_HEADERS, "Content-Type": "application/json" } }
      );
    }

    const supabaseUrl = Deno.env.get("SUPABASE_URL");
    const serviceRoleKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");
    if (!supabaseUrl || !serviceRoleKey) {
      throw new Error("Missing Supabase configuration");
    }

    const supabase = createClient(supabaseUrl, serviceRoleKey, {
      auth: { autoRefreshToken: false, persistSession: false },
    });

    // Check webhook signature if secret is configured
    const webhookSecret = Deno.env.get("SMARTLEAD_WEBHOOK_SECRET");
    if (webhookSecret) {
      if (!verifyWebhookSignature(req, webhookSecret)) {
        return new Response(
          JSON.stringify({ ok: false, error: "Invalid webhook signature" }),
          { status: 401, headers: { ...CORS_HEADERS, "Content-Type": "application/json" } }
        );
      }
    } else {
      console.warn("[smartlead-webhook] No webhook secret configured - accepting all requests (dev only)");
    }

    const rawPayload = await req.json();
    const payload = normalizePayload(rawPayload);
    const eventKey = computeEventKey(payload);

    if (!eventKey) {
      console.warn("[smartlead-webhook] Unable to compute event key, missing required fields", { payload });
      return new Response(
        JSON.stringify({
          ok: false,
          error: "Unable to compute event key - missing campaign_id, lead_id, or event_type",
        }),
        { status: 400, headers: { ...CORS_HEADERS, "Content-Type": "application/json" } }
      );
    }

    // Insert raw webhook event
    const eventInsert = {
      event_key: eventKey,
      event_type: payload.event_type,
      campaign_id: payload.campaign_id,
      smartlead_lead_id: payload.lead_id,
      email_normalized: payload.email ? payload.email.toLowerCase() : null,
      payload,
      received_at: new Date().toISOString(),
      processing_status: "received",
    };

    const { data: insertedEvent, error: insertError } = await supabase
      .from("smartlead_webhook_events")
      .insert(eventInsert)
      .select("id")
      .single();

    if (insertError) {
      if (insertError.code !== "23505") {
        // 23505 = unique constraint violation (duplicate event_key), which is expected
        console.error("[smartlead-webhook] Insert error:", insertError);
        throw insertError;
      }
      // Duplicate event, log and return early
      console.info("[smartlead-webhook] Duplicate event received:", { eventKey });
      return new Response(
        JSON.stringify({ ok: true, duplicate: true, message: "Event already received" }),
        { headers: { ...CORS_HEADERS, "Content-Type": "application/json" } }
      );
    }

    // Try to map to local email row
    let emailId: string | null = null;
    let agencyId: string | null = null;
    let mappingError: string | null = null;

    try {
      const mapped = await mapEmailToLocalRow(supabase, payload);
      if (mapped) {
        emailId = mapped.email_id;
        agencyId = mapped.agency_id;
        console.info("[smartlead-webhook] Successfully mapped email:", {
          eventKey,
          emailId,
          agencyId,
          eventType: payload.event_type,
        });
      } else {
        console.warn("[smartlead-webhook] Unable to map email to local row:", {
          eventKey,
          campaign_id: payload.campaign_id,
          lead_id: payload.lead_id,
          email: payload.email,
        });
      }
    } catch (error) {
      mappingError = error instanceof Error ? error.message : String(error);
      console.error("[smartlead-webhook] Error mapping email:", mappingError);
    }

    // Update outreach status if applicable
    if (emailId) {
      const newStatus = mapEventTypeToOutreachStatus(payload.event_type || "");
      if (newStatus && newStatus !== "opened" && newStatus !== "clicked") {
        // Only update for strong signals (not opens/clicks which are weaker)
        const { error: updateError } = await supabase
          .from("other_agency_emails")
          .update({
            outreach_status: newStatus,
            last_outreach_at: new Date().toISOString(),
          })
          .eq("id", emailId);

        if (updateError) {
          console.error("[smartlead-webhook] Error updating email status:", updateError);
          mappingError = `Status update failed: ${updateError.message}`;
        }
      }
    }

    // Write normalized event to smartlead_lead_events for fast analytics
    if (payload.event_type && payload.campaign_id) {
      const normalizedEventRow = {
        event_key: eventKey,
        campaign_id: payload.campaign_id,
        lead_id: payload.lead_id || null,
        email_normalized: payload.email ? payload.email.toLowerCase() : null,
        other_agency_email_id: emailId || null,
        agency_id: agencyId || null,
        event_type: payload.event_type,
        event_at: payload.timestamp || new Date().toISOString(),
        raw_payload: { event_type: payload.event_type, campaign_id: payload.campaign_id },
      };
      const { error: leInsErr } = await supabase
        .from("smartlead_lead_events")
        .insert(normalizedEventRow)
        .select("id")
        .maybeSingle();
      if (leInsErr && leInsErr.code !== "23505") {
        console.warn("[smartlead-webhook] smartlead_lead_events insert error:", leInsErr.message);
      }
    }

    // Update webhook sync health timestamp
    EdgeRuntime.waitUntil(
      supabase.from("smartlead_sync_health").upsert({
        sync_type: "webhook",
        last_run_at: new Date().toISOString(),
        last_success_at: new Date().toISOString(),
        status: "ok",
        records_processed: 1,
        updated_at: new Date().toISOString(),
      }, { onConflict: "sync_type" }),
    );

    // Upsert conversation state for CRM inbox
    if (payload.campaign_id && (payload.email || payload.lead_id)) {
      EdgeRuntime.waitUntil(
        supabase.rpc("upsert_smartlead_conversation", {
          p_campaign_id: payload.campaign_id,
          p_lead_id: payload.lead_id ?? null,
          p_email_normalized: payload.email ? payload.email.toLowerCase() : null,
          p_agency_id: agencyId ?? null,
          p_other_agency_email_id: emailId ?? null,
          p_event_type: payload.event_type ?? null,
          p_event_at: payload.timestamp ?? new Date().toISOString(),
          p_subject: payload.subject ?? null,
        }).catch((err: Error) => console.warn("[smartlead-webhook] conversation upsert failed:", err?.message))
      );
    }

    // Background thread hydration for reply-like events — fetch full message history
    // so the conversation immediately shows up in the inbox with real messages
    if (
      payload.campaign_id &&
      payload.lead_id &&
      payload.email &&
      isReplyLikeEvent(payload.event_type)
    ) {
      EdgeRuntime.waitUntil(
        hydrateConversationThread(
          supabase,
          payload.campaign_id,
          payload.lead_id,
          payload.email.toLowerCase(),
        )
      );
    }

    // Mark event as processed
    const { error: markError } = await supabase
      .from("smartlead_webhook_events")
      .update({
        processed_at: new Date().toISOString(),
        processing_status: emailId ? "processed" : "skipped",
        processing_error: mappingError,
      })
      .eq("id", insertedEvent.id);

    if (markError) {
      console.error("[smartlead-webhook] Error marking event as processed:", markError);
    }

    return new Response(
      JSON.stringify({
        ok: true,
        event_id: insertedEvent.id,
        mapped: !!emailId,
        email_id: emailId,
        agency_id: agencyId,
        event_type: payload.event_type,
      }),
      { headers: { ...CORS_HEADERS, "Content-Type": "application/json" } }
    );
  } catch (error) {
    console.error("[smartlead-webhook] Error:", error);
    return new Response(
      JSON.stringify({
        ok: false,
        error: error instanceof Error ? error.message : "Unknown error",
      }),
      { status: 500, headers: { ...CORS_HEADERS, "Content-Type": "application/json" } }
    );
  }
});
