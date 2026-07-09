import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { requireAdminSession } from "../_shared/adminSession.ts";

const CORS = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "GET, POST, PATCH, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey, x-admin-token",
};

function json(data: unknown, status = 200) {
  return new Response(JSON.stringify(data), {
    status,
    headers: { ...CORS, "Content-Type": "application/json" },
  });
}

// ─── Enrichment ───────────────────────────────────────────────────────────────

async function enrichLead(supabase: any, emailNorm: string, agencyId: string | null) {
  const promises: Promise<any>[] = [
    supabase
      .from("other_agency_emails")
      .select("id, email_normalized, outreach_status, last_outreach_at, verification_status, other_agencies(id, name, slug, state_slug, website_url)")
      .eq("email_normalized", emailNorm)
      .limit(3),

    supabase
      .from("stripe_orders")
      .select("id, amount_total, currency, payment_status, status, created_at, product_summary, state_slug, agency_name")
      .ilike("customer_email", emailNorm)
      .order("created_at", { ascending: false })
      .limit(5),

    supabase
      .from("contact_messages")
      .select("id, created_at, subject, status, outbound_reply_count")
      .eq("email_normalized", emailNorm)
      .order("created_at", { ascending: false })
      .limit(5),
  ];

  if (agencyId) {
    promises.push(
      supabase
        .from("agency_funnel_sessions")
        .select("id, funnel_step, payment_source, created_at, completed_at")
        .eq("agency_id", agencyId)
        .order("created_at", { ascending: false })
        .limit(5)
    );
  }

  const results = await Promise.allSettled(promises);

  const emailRows   = results[0].status === "fulfilled" ? (results[0].value.data ?? []) : [];
  const orderRows   = results[1].status === "fulfilled" ? (results[1].value.data ?? []) : [];
  const contactMsgs = results[2].status === "fulfilled" ? (results[2].value.data ?? []) : [];
  const funnelRows  = results[3]?.status === "fulfilled" ? ((results[3] as any).value.data ?? []) : [];

  const agencies = emailRows
    .filter((r: any) => r.other_agencies)
    .map((r: any) => {
      const ag = r.other_agencies;
      return { id: ag.id, name: ag.name, slug: ag.slug, state_slug: ag.state_slug, website_url: ag.website_url };
    });

  const totalPaid = orderRows.reduce((sum: number, o: any) => {
    if (o.payment_status === "paid") sum += (o.amount_total ?? 0) / 100;
    return sum;
  }, 0);

  const hasPaid = orderRows.some((o: any) => o.payment_status === "paid");

  let personType = "lead";
  if (hasPaid && agencies.length > 0) personType = "agency_customer";
  else if (hasPaid) personType = "customer";
  else if (agencies.length > 0) personType = "agency";

  return {
    person_type: personType,
    agencies,
    orders: orderRows,
    total_paid_usd: Math.round(totalPaid * 100) / 100,
    has_paid: hasPaid,
    contact_messages: contactMsgs,
    funnel_sessions: funnelRows,
  };
}

// ─── List ──────────────────────────────────────────────────────────────────────

async function handleList(supabase: any, url: URL) {
  const page    = Math.max(1, parseInt(url.searchParams.get("page") ?? "1"));
  const limit   = Math.min(50, Math.max(1, parseInt(url.searchParams.get("limit") ?? "25")));
  const status  = url.searchParams.get("status") ?? null;
  const search  = url.searchParams.get("search") ?? null;
  const campaign_id = url.searchParams.get("campaign_id") ?? null;
  const offset  = (page - 1) * limit;

  let query = supabase
    .from("smartlead_conversations")
    .select(
      `id, campaign_id, smartlead_lead_id, email_normalized, agency_id, other_agency_email_id,
       latest_event_type, latest_event_at, latest_subject, unread_reply_count, status,
       assigned_to, messages_synced_at, created_at, updated_at,
       other_agencies(id, name, slug, state_slug)`,
      { count: "exact" }
    )
    .or("messages_synced_at.not.is.null,latest_event_type.neq.contacted")
    .order("latest_event_at", { ascending: false, nullsFirst: false })
    .range(offset, offset + limit - 1);

  if (status && status !== "all") query = query.eq("status", status);
  if (campaign_id) query = query.eq("campaign_id", campaign_id);
  if (search) query = query.or(`email_normalized.ilike.%${search}%`);

  const { data, error, count } = await query;
  if (error) throw error;

  const rows = (data ?? []).map((c: any) => ({
    ...c,
    agency: c.other_agencies ?? null,
    other_agencies: undefined,
  }));

  console.log(`[smartlead-crm-inbox] list: status=${status ?? "all"} search=${search ?? ""} returned ${rows.length}/${count ?? 0} rows`);

  return json({ ok: true, conversations: rows, total: count ?? 0, page, limit });
}

// ─── Detail ────────────────────────────────────────────────────────────────────

async function handleDetail(supabase: any, url: URL) {
  const id = url.searchParams.get("id");
  if (!id) return json({ ok: false, error: "id required" }, 400);

  const { data: conv, error } = await supabase
    .from("smartlead_conversations")
    .select("*, other_agencies(id, name, slug, state_slug, website_url)")
    .eq("id", id)
    .maybeSingle();

  if (error) throw error;
  if (!conv) return json({ ok: false, error: "Not found" }, 404);

  const emailNorm = conv.email_normalized ?? "";

  const [enrichment, messagesResult, campaignResult] = await Promise.all([
    enrichLead(supabase, emailNorm, conv.agency_id),
    supabase
      .from("smartlead_messages")
      .select("id, direction, subject, body_text, from_email, to_email, event_at, sequence_number, smartlead_message_id")
      .eq("conversation_id", id)
      .order("event_at", { ascending: true })
      .limit(100),
    supabase
      .from("smartlead_campaigns")
      .select("id, name, status, created_at")
      .eq("campaign_id", conv.campaign_id)
      .maybeSingle(),
  ]);

  return json({
    ok: true,
    conversation: {
      ...conv,
      agency: conv.other_agencies ?? null,
      other_agencies: undefined,
    },
    messages: messagesResult.data ?? [],
    campaign: campaignResult.data ?? null,
    enrichment,
  });
}

// ─── Status / Notes ────────────────────────────────────────────────────────────

async function handleStatusUpdate(supabase: any, body: any) {
  const { id, status } = body;
  if (!id || !status) return json({ ok: false, error: "id and status required" }, 400);

  const allowed = ["new", "open", "replied", "closed", "archived"];
  if (!allowed.includes(status)) return json({ ok: false, error: "Invalid status" }, 400);

  const { error } = await supabase
    .from("smartlead_conversations")
    .update({ status, updated_at: new Date().toISOString() })
    .eq("id", id);

  if (error) throw error;
  return json({ ok: true });
}

async function handleNotesUpdate(supabase: any, body: any) {
  const { id, internal_notes, assigned_to } = body;
  if (!id) return json({ ok: false, error: "id required" }, 400);

  const patch: Record<string, unknown> = { updated_at: new Date().toISOString() };
  if (internal_notes !== undefined) patch.internal_notes = internal_notes;
  if (assigned_to !== undefined)    patch.assigned_to    = assigned_to;

  const { error } = await supabase.from("smartlead_conversations").update(patch).eq("id", id);
  if (error) throw error;
  return json({ ok: true });
}

// ─── Counts ────────────────────────────────────────────────────────────────────

async function handleCounts(supabase: any) {
  const { data, error } = await supabase
    .from("smartlead_conversations")
    .select("status")
    .or("messages_synced_at.not.is.null,latest_event_type.neq.contacted");

  if (error) throw error;

  const counts: Record<string, number> = { all: 0, new: 0, open: 0, replied: 0, closed: 0, archived: 0 };
  for (const row of data ?? []) {
    counts.all++;
    const s = row.status ?? "new";
    counts[s] = (counts[s] ?? 0) + 1;
  }
  return json({ ok: true, counts });
}

// ─── Sync helpers ──────────────────────────────────────────────────────────────

function mapLeadStatusToEventType(status: string | null): string {
  if (!status) return "contacted";
  const s = status.toUpperCase();
  if (s.includes("REPL") || s.includes("INTERESTED")) return "replied";
  if (s.includes("BOUNCE")) return "bounced";
  if (s.includes("UNSUB") || s.includes("OPT_OUT") || s.includes("OPTED")) return "unsubscribed";
  if (s.includes("OPEN")) return "opened";
  if (s.includes("CLICK")) return "clicked";
  return "contacted";
}

function isInboxWorthy(status: string | null): boolean {
  if (!status) return false;
  const s = status.toUpperCase();
  return (
    s.includes("REPL") ||
    s.includes("INTERESTED") ||
    s.includes("OUT_OF_OFFICE") ||
    s.includes("MEETING") ||
    s.includes("QUALIFIED") ||
    s.includes("NOT_INTERESTED") ||
    s.includes("DO_NOT_CONTACT") ||
    s.includes("INFORMATION_REQUEST") ||
    s.includes("WRONG_PERSON") ||
    s.includes("OPT_OUT")
  );
}

function normalizeDirectionLocal(raw: unknown): string {
  if (typeof raw !== "string") return "outbound";
  const s = raw.toLowerCase();
  if (s === "inbound" || s === "received" || s === "reply" || s === "lead_reply") return "inbound";
  return "outbound";
}

function extractBodyLocal(item: any): { body_text: string | null; body_html: string | null } {
  const html = item.email_body ?? item.body_html ?? item.html_body ?? item.html ?? null;
  const text = item.email_body_text ?? item.body_text ?? item.text_body ?? item.text ?? null;
  return { body_text: text, body_html: html };
}

// ─── Full Inbox Sync ────────────────────────────────────────────────────────────
// Phase 1: Fetch campaigns from Smartlead API (fallback: local table)
// Phase 2: Fetch all leads per campaign, upsert conversations
// Phase 3: For inbox-worthy leads, fetch message-history, upsert messages
// Phase 4: Update conversation metadata from actual thread data

async function handleSync(supabase: any, body: any) {
  const apiKey = Deno.env.get("SMARTLEAD_API_KEY");
  if (!apiKey) return json({ ok: false, error: "SMARTLEAD_API_KEY not configured" }, 500);

  const targetCampaignId: string | null = body?.campaign_id ?? null;

  const diag: Record<string, any> = {
    campaign_source: "api",
    campaigns_found: 0,
    campaigns_processed: 0,
    leads_fetched: 0,
    conversations_upserted: 0,
    inbox_worthy_leads: 0,
    message_history_fetched: 0,
    messages_inserted: 0,
    messages_skipped: 0,
    conversations_updated_from_messages: 0,
    final_list_count: 0,
    errors: [] as string[],
  };

  // ── Phase 1: Discover campaigns ────────────────────────────────────────────
  let campaigns: Array<{ campaign_id: string; name: string; status: string | null }> = [];

  try {
    const campUrl = `https://server.smartlead.ai/api/v1/campaigns?api_key=${apiKey}&offset=0&limit=100`;
    const campRes = await fetch(campUrl, { headers: { "Content-Type": "application/json" } });

    if (campRes.ok) {
      const campData = await campRes.json();
      const rawCamps: any[] = Array.isArray(campData) ? campData : (campData?.data ?? []);

      campaigns = rawCamps.map((c: any) => ({
        campaign_id: String(c.id),
        name: c.name ?? String(c.id),
        status: c.status ?? null,
      }));

      console.log(`[smartlead-sync] Phase 1: API returned ${campaigns.length} campaigns`);

      // Keep local smartlead_campaigns table in sync
      for (const camp of campaigns) {
        await supabase.from("smartlead_campaigns").upsert(
          {
            campaign_id: camp.campaign_id,
            name: camp.name,
            status: camp.status,
            last_synced_at: new Date().toISOString(),
            updated_at: new Date().toISOString(),
          },
          { onConflict: "campaign_id" }
        );
      }
    } else {
      const errBody = await campRes.text().catch(() => "");
      diag.errors.push(`Campaigns API ${campRes.status}: ${errBody.slice(0, 100)}`);
      console.warn(`[smartlead-sync] Campaigns API failed: ${campRes.status}`);
    }
  } catch (e) {
    diag.errors.push(`Campaigns fetch error: ${e instanceof Error ? e.message : String(e)}`);
    console.warn(`[smartlead-sync] Campaigns fetch threw: ${e}`);
  }

  // Fallback: read from local table
  if (campaigns.length === 0) {
    const { data: localCamps } = await supabase
      .from("smartlead_campaigns")
      .select("campaign_id, name, status");
    campaigns = localCamps ?? [];
    diag.campaign_source = "local_table";
    console.log(`[smartlead-sync] Phase 1: fallback to ${campaigns.length} local campaigns`);
  }

  diag.campaigns_found = campaigns.length;

  if (campaigns.length === 0) {
    return json({
      ok: false,
      error: "No campaigns found. Ensure Smartlead API key is valid and campaigns exist in Smartlead.",
      debug: diag,
    }, 404);
  }

  const toProcess = targetCampaignId
    ? campaigns.filter(c => String(c.campaign_id) === String(targetCampaignId))
    : campaigns;

  diag.campaigns_processed = toProcess.length;

  // ── Phase 2 + 3 + 4: Per campaign ─────────────────────────────────────────
  for (const camp of toProcess) {
    let offset = 0;
    const PAGE = 100;
    let campLeads = 0;

    while (true) {
      const leadsUrl = `https://server.smartlead.ai/api/v1/campaigns/${camp.campaign_id}/leads?api_key=${apiKey}&offset=${offset}&limit=${PAGE}`;
      let leads: any[] = [];

      try {
        const res = await fetch(leadsUrl, { headers: { "Content-Type": "application/json" } });
        if (!res.ok) {
          diag.errors.push(`Campaign ${camp.campaign_id} leads: API ${res.status}`);
          break;
        }
        const data = await res.json();
        leads = Array.isArray(data) ? data : (Array.isArray(data?.data) ? data.data : []);
      } catch (e) {
        diag.errors.push(`Campaign ${camp.campaign_id} leads fetch: ${e instanceof Error ? e.message : String(e)}`);
        break;
      }

      if (leads.length === 0) break;
      campLeads += leads.length;
      diag.leads_fetched += leads.length;
      console.log(`[smartlead-sync] Campaign ${camp.campaign_id} (${camp.name}): ${leads.length} leads at offset ${offset}`);

      // Batch email → agency_id lookup
      const emails = leads.map((l: any) => (l.email ?? "").toLowerCase().trim()).filter(Boolean);
      const emailMap = new Map<string, { id: string; agency_id: string | null }>();
      if (emails.length > 0) {
        const { data: emailRows } = await supabase
          .from("other_agency_emails")
          .select("id, agency_id, email_normalized")
          .in("email_normalized", emails);
        for (const row of emailRows ?? []) {
          emailMap.set(row.email_normalized, { id: row.id, agency_id: row.agency_id });
        }
      }

      for (const lead of leads) {
        const email = (lead.email ?? "").toLowerCase().trim();
        if (!email) continue;

        const leadStatus = lead.lead_status ?? lead.status ?? null;

        // ── Gate 1: Only process inbox-worthy leads ────────────────────────
        if (!isInboxWorthy(leadStatus) || !lead.id) continue;
        diag.inbox_worthy_leads++;

        // ── Gate 2: Fetch message history BEFORE creating any conversation ─
        let messages: any[] = [];
        try {
          const histUrl = `https://server.smartlead.ai/api/v1/campaigns/${camp.campaign_id}/leads/${lead.id}/message-history?api_key=${apiKey}`;
          const histRes = await fetch(histUrl, { headers: { "Content-Type": "application/json" } });

          if (!histRes.ok) {
            diag.errors.push(`Thread ${email}: history API ${histRes.status}`);
            continue;
          }

          const histData = await histRes.json();
          messages = Array.isArray(histData)
            ? histData
            : (histData?.data ?? histData?.messages ?? histData?.history ?? []);
        } catch (e) {
          diag.errors.push(`Thread ${email} fetch: ${e instanceof Error ? e.message : String(e)}`);
          continue;
        }

        console.log(`[smartlead-sync]   Lead ${email}: status=${leadStatus} lead_id=${lead.id} messages=${messages.length}`);

        // ── Gate 3: Skip if no messages — never create empty conv rows ─────
        if (messages.length === 0) continue;
        diag.message_history_fetched++;

        // ── Pre-compute thread metadata ────────────────────────────────────
        let latestMsgAt: string | null = null;
        let latestInboundAt: string | null = null;
        let latestSubject: string | null = null;
        let hasInbound = false;

        for (const item of messages) {
          const direction = normalizeDirectionLocal(item.type ?? item.direction ?? item.email_type);
          const sentAt = item.sent_at ?? item.created_at ?? item.received_at ?? item.time ?? null;
          const subject = item.subject ?? item.email_subject ?? null;
          if (sentAt && (!latestMsgAt || sentAt > latestMsgAt)) latestMsgAt = sentAt;
          if (direction === "inbound" && sentAt) {
            hasInbound = true;
            if (!latestInboundAt || sentAt > latestInboundAt) { latestInboundAt = sentAt; latestSubject = subject; }
          }
        }

        const matched = emailMap.get(email);
        const eventType = hasInbound ? "replied" : mapLeadStatusToEventType(leadStatus);
        const eventAt = (hasInbound ? latestInboundAt : latestMsgAt) ?? lead.last_activity_at ?? new Date().toISOString();

        // ── Now safe to upsert conversation (guaranteed to have messages) ──
        const { data: convIdRaw, error: rpcErr } = await supabase.rpc("upsert_smartlead_conversation", {
          p_campaign_id: String(camp.campaign_id),
          p_lead_id: String(lead.id),
          p_email_normalized: email,
          p_agency_id: matched?.agency_id ?? null,
          p_other_agency_email_id: matched?.id ?? null,
          p_event_type: eventType,
          p_event_at: eventAt,
          p_subject: latestSubject ?? null,
        });

        if (rpcErr) {
          diag.errors.push(`Upsert conv ${email}: ${rpcErr.message}`);
          continue;
        }
        diag.conversations_upserted++;

        // Resolve conversation UUID
        let convId: string | null = typeof convIdRaw === "string" ? convIdRaw : null;
        if (!convId) {
          const { data: row } = await supabase
            .from("smartlead_conversations")
            .select("id")
            .eq("email_normalized", email)
            .eq("campaign_id", String(camp.campaign_id))
            .maybeSingle();
          convId = row?.id ?? null;
        }

        if (!convId) {
          diag.errors.push(`No conv row for ${email} in campaign ${camp.campaign_id}`);
          continue;
        }

        // ── Insert messages ────────────────────────────────────────────────
        for (let i = 0; i < messages.length; i++) {
          const item = messages[i];
          const msgId = item.id ?? item.message_id ?? item.email_id ?? null;
          const { body_text, body_html } = extractBodyLocal(item);
          const direction = normalizeDirectionLocal(item.type ?? item.direction ?? item.email_type);
          const sentAt = item.sent_at ?? item.created_at ?? item.received_at ?? item.time ?? null;
          const subject = item.subject ?? item.email_subject ?? null;

          const { error: insErr } = await supabase
            .from("smartlead_messages")
            .insert({
              conversation_id: convId,
              campaign_id: String(camp.campaign_id),
              lead_id: String(lead.id),
              email_normalized: email,
              direction,
              subject,
              body_text,
              body_html,
              from_email: item.from_email ?? item.from ?? null,
              to_email: item.to_email ?? item.to ?? null,
              event_at: sentAt ?? new Date().toISOString(),
              smartlead_message_id: msgId ? String(msgId) : null,
              sequence_number: item.sequence_number ?? item.seq ?? i + 1,
              raw_json: item,
            });

          if (!insErr) {
            diag.messages_inserted++;
          } else if (insErr.code === "23505") {
            diag.messages_skipped++;
          } else {
            diag.errors.push(`Msg ${email}[${i}]: ${insErr.message}`);
          }
        }

        // ── Update conversation with real thread metadata ──────────────────
        const update: Record<string, any> = {
          messages_synced_at: new Date().toISOString(),
          updated_at: new Date().toISOString(),
        };
        if (hasInbound && latestInboundAt) {
          update.latest_event_type = "replied";
          update.latest_event_at = latestInboundAt;
          update.status = "replied";
          if (latestSubject) update.latest_subject = latestSubject;
        } else if (latestMsgAt) {
          update.latest_event_at = latestMsgAt;
        }
        await supabase.from("smartlead_conversations").update(update).eq("id", convId);
        diag.conversations_updated_from_messages++;
      }

      if (leads.length < PAGE) break;
      offset += PAGE;
    }

    console.log(`[smartlead-sync] Campaign ${camp.campaign_id} done: ${campLeads} leads`);
  }

  // Count only inbox-visible conversations (same filter as handleList)
  const { count: finalCount } = await supabase
    .from("smartlead_conversations")
    .select("id", { count: "exact", head: true })
    .or("messages_synced_at.not.is.null,latest_event_type.neq.contacted");
  diag.final_list_count = finalCount ?? 0;

  const errorSummary = diag.errors.length;
  console.log(`[smartlead-sync] Complete: campaigns=${diag.campaigns_processed} leads=${diag.leads_fetched} worthy=${diag.inbox_worthy_leads} convs_with_msgs=${diag.conversations_upserted} threads=${diag.message_history_fetched} msgs=${diag.messages_inserted} inbox_visible=${diag.final_list_count} errors=${errorSummary}`);

  return json({
    ok: true,
    campaigns_processed: diag.campaigns_processed,
    leads_scanned: diag.leads_fetched,
    inbox_worthy_leads: diag.inbox_worthy_leads,
    conversations_with_messages: diag.conversations_upserted,
    message_histories_fetched: diag.message_history_fetched,
    messages_inserted: diag.messages_inserted,
    messages_skipped: diag.messages_skipped,
    conversations_updated: diag.conversations_updated_from_messages,
    inbox_visible_count: diag.final_list_count,
    errors: (diag.errors as string[]).slice(0, 25),
    debug: {
      campaign_source: diag.campaign_source,
      campaigns_found: diag.campaigns_found,
    },
  });
}

// ─── Router ───────────────────────────────────────────────────────────────────

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") return new Response(null, { status: 200, headers: CORS });

  try {
    await requireAdminSession(req);

    const supabase = createClient(
      Deno.env.get("SUPABASE_URL")!,
      Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!,
      { auth: { autoRefreshToken: false, persistSession: false } },
    );

    const url    = new URL(req.url);
    const action = url.searchParams.get("action") ?? "list";

    if (req.method === "GET") {
      if (action === "list")   return await handleList(supabase, url);
      if (action === "detail") return await handleDetail(supabase, url);
      if (action === "counts") return await handleCounts(supabase);
      return json({ ok: false, error: "Unknown action" }, 400);
    }

    if (req.method === "POST") {
      const body = await req.json().catch(() => ({}));
      if (action === "pull") return await handleSync(supabase, body);
      return json({ ok: false, error: "Unknown action" }, 400);
    }

    if (req.method === "PATCH") {
      const body = await req.json().catch(() => ({}));
      if (action === "status") return await handleStatusUpdate(supabase, body);
      if (action === "notes")  return await handleNotesUpdate(supabase, body);
      return json({ ok: false, error: "Unknown action" }, 400);
    }

    return json({ ok: false, error: "Method not allowed" }, 405);
  } catch (err) {
    const message = err instanceof Error ? err.message : String(err);
    console.error("[smartlead-crm-inbox] error:", message);
    return json({ ok: false, error: message }, message.includes("Unauthorized") ? 401 : 500);
  }
});
