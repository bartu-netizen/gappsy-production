import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { requireAdminSession } from "../_shared/adminSession.ts";

const CORS = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "GET, POST, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey, x-admin-token",
};

// Each tick scans at most this many leads per page. Inbox-worthy leads within
// that page each get one message-history call, capped by MAX_HISTORIES_PER_TICK.
const LEADS_PAGE_SIZE = 100;
const MAX_HISTORIES_PER_TICK = 5;

function json(data: unknown, status = 200) {
  return new Response(JSON.stringify(data), {
    status,
    headers: { ...CORS, "Content-Type": "application/json" },
  });
}

// ─── Smartlead status helpers ─────────────────────────────────────────────────

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

// ─── Kickoff ───────────────────────────────────────────────────────────────────

async function handleKickoff(supabase: any, triggeredBy: string) {
  const { data: active } = await supabase
    .from("smartlead_sync_jobs")
    .select("id, status, campaigns_total, campaigns_processed, leads_processed")
    .in("status", ["queued", "running"])
    .order("created_at", { ascending: false })
    .limit(1)
    .maybeSingle();

  if (active) {
    return json({ ok: true, job_id: active.id, status: active.status, already_running: true, stats: active });
  }

  const apiKey = Deno.env.get("SMARTLEAD_API_KEY");
  if (!apiKey) return json({ ok: false, error: "SMARTLEAD_API_KEY not configured" }, 500);

  let campaigns: Array<{ campaign_id: string; name: string; status: string | null }> = [];

  try {
    const res = await fetch(
      `https://server.smartlead.ai/api/v1/campaigns?api_key=${apiKey}&offset=0&limit=100`,
      { headers: { "Content-Type": "application/json" } }
    );
    if (res.ok) {
      const data = await res.json();
      const raw: any[] = Array.isArray(data) ? data : (data?.data ?? []);
      campaigns = raw.map((c: any) => ({
        campaign_id: String(c.id),
        name: c.name ?? String(c.id),
        status: c.status ?? null,
      }));
      for (const camp of campaigns) {
        await supabase.from("smartlead_campaigns").upsert(
          { campaign_id: camp.campaign_id, name: camp.name, status: camp.status,
            last_synced_at: new Date().toISOString(), updated_at: new Date().toISOString() },
          { onConflict: "campaign_id" }
        );
      }
    }
  } catch (_) {}

  if (campaigns.length === 0) {
    const { data: local } = await supabase
      .from("smartlead_campaigns")
      .select("campaign_id, name, status");
    campaigns = local ?? [];
  }

  if (campaigns.length === 0) {
    return json({ ok: false, error: "No campaigns found. Check SMARTLEAD_API_KEY." }, 404);
  }

  const { data: job, error } = await supabase
    .from("smartlead_sync_jobs")
    .insert({
      status: "queued",
      triggered_by: triggeredBy,
      campaign_ids: campaigns,
      campaigns_total: campaigns.length,
      cursor_campaign_index: 0,
      cursor_lead_offset: 0,
    })
    .select("id")
    .single();

  if (error) throw error;

  return json({
    ok: true,
    job_id: job.id,
    status: "queued",
    already_running: false,
    stats: { campaigns_total: campaigns.length },
  });
}

// ─── Tick ──────────────────────────────────────────────────────────────────────
// Processes ONE page of leads from the current campaign cursor.
//
// KEY DESIGN: We only create/update conversations when a lead has REAL thread
// activity. This means:
//   1. Scan one page of leads from Smartlead
//   2. Count all leads scanned (leads_processed)
//   3. For inbox-worthy leads only, fetch their message-history
//   4. Only upsert a conversation + messages if message-history > 0
//
// Leads with status "contacted" / "opened" / etc. that have no reply thread
// are completely ignored and never create conversation rows. This keeps the
// inbox table clean and CRM-meaningful.

async function handleTick(supabase: any, jobId: string) {
  const { data: job, error: jobErr } = await supabase
    .from("smartlead_sync_jobs")
    .select("*")
    .eq("id", jobId)
    .maybeSingle();

  if (jobErr) throw jobErr;
  if (!job) return json({ ok: false, error: "Job not found" }, 404);

  if (job.status === "success" || job.status === "error") {
    return json({ ok: true, done: true, status: job.status, stats: buildStats(job) });
  }

  await supabase
    .from("smartlead_sync_jobs")
    .update({ status: "running", updated_at: new Date().toISOString() })
    .eq("id", jobId);

  const apiKey = Deno.env.get("SMARTLEAD_API_KEY");
  if (!apiKey) {
    await supabase.from("smartlead_sync_jobs").update({
      status: "error",
      last_error: "SMARTLEAD_API_KEY not configured",
      completed_at: new Date().toISOString(),
      updated_at: new Date().toISOString(),
    }).eq("id", jobId);
    return json({ ok: false, error: "SMARTLEAD_API_KEY not configured" }, 500);
  }

  const campaignList: any[] = job.campaign_ids ?? [];
  const campIdx: number = job.cursor_campaign_index ?? 0;
  const leadOffset: number = job.cursor_lead_offset ?? 0;

  if (campIdx >= campaignList.length) {
    await supabase.from("smartlead_sync_jobs").update({
      status: "success",
      completed_at: new Date().toISOString(),
      updated_at: new Date().toISOString(),
    }).eq("id", jobId);
    return json({ ok: true, done: true, status: "success", stats: buildStats(job) });
  }

  const camp = campaignList[campIdx];
  const errors: string[] = Array.isArray(job.errors) ? [...job.errors] : [];

  let tick_leads_scanned = 0;
  let tick_worthy_found = 0;
  let tick_histories = 0;
  let tick_convs = 0;
  let tick_messages = 0;

  // ── Fetch one page of leads ────────────────────────────────────────────────
  let leads: any[] = [];
  try {
    const leadsUrl = `https://server.smartlead.ai/api/v1/campaigns/${camp.campaign_id}/leads?api_key=${apiKey}&offset=${leadOffset}&limit=${LEADS_PAGE_SIZE}`;
    const res = await fetch(leadsUrl, { headers: { "Content-Type": "application/json" } });
    if (res.ok) {
      const data = await res.json();
      leads = Array.isArray(data) ? data : (Array.isArray(data?.data) ? data.data : []);
    } else {
      const body = await res.text().catch(() => "");
      errors.push(`Campaign ${camp.campaign_id} leads offset=${leadOffset}: HTTP ${res.status} ${body.slice(0, 80)}`);
    }
  } catch (e) {
    errors.push(`Campaign ${camp.campaign_id} leads fetch: ${e instanceof Error ? e.message : String(e)}`);
  }

  tick_leads_scanned = leads.length;

  if (leads.length > 0) {
    // Collect only inbox-worthy leads first (don't touch non-worthy ones at all)
    const worthyLeads = leads.filter((l: any) => {
      const status = l.lead_status ?? l.status ?? null;
      return isInboxWorthy(status) && !!l.id;
    });
    tick_worthy_found = worthyLeads.length;

    // Batch email lookup only for worthy leads
    const worthyEmails = worthyLeads
      .map((l: any) => (l.email ?? "").toLowerCase().trim())
      .filter(Boolean);
    const emailMap = new Map<string, { id: string; agency_id: string | null }>();
    if (worthyEmails.length > 0) {
      const { data: emailRows } = await supabase
        .from("other_agency_emails")
        .select("id, agency_id, email_normalized")
        .in("email_normalized", worthyEmails);
      for (const row of emailRows ?? []) {
        emailMap.set(row.email_normalized, { id: row.id, agency_id: row.agency_id });
      }
    }

    // For each inbox-worthy lead: fetch messages first, only create conversation if messages exist
    const toHydrate = worthyLeads.slice(0, MAX_HISTORIES_PER_TICK);

    for (const lead of toHydrate) {
      const email = (lead.email ?? "").toLowerCase().trim();
      if (!email) continue;

      const leadStatus = lead.lead_status ?? lead.status ?? null;

      // ── Fetch message history BEFORE creating any conversation row ─────────
      let messages: any[] = [];
      try {
        const histUrl = `https://server.smartlead.ai/api/v1/campaigns/${camp.campaign_id}/leads/${lead.id}/message-history?api_key=${apiKey}`;
        const histRes = await fetch(histUrl, { headers: { "Content-Type": "application/json" } });
        if (histRes.ok) {
          const histData = await histRes.json();
          messages = Array.isArray(histData)
            ? histData
            : (histData?.data ?? histData?.messages ?? histData?.history ?? []);
        } else {
          errors.push(`History ${email}: HTTP ${histRes.status}`);
          continue;
        }
      } catch (e) {
        errors.push(`History ${email}: ${e instanceof Error ? e.message : String(e)}`);
        continue;
      }

      // Skip if no real thread content — don't create an empty conversation row
      if (messages.length === 0) continue;
      tick_histories++;

      const matched = emailMap.get(email);
      const eventType = mapLeadStatusToEventType(leadStatus);
      const eventAt = lead.last_activity_at ?? lead.updated_at ?? lead.created_at ?? new Date().toISOString();

      // Find the best inbound message for conversation metadata
      let latestInboundAt: string | null = null;
      let latestSubject: string | null = null;
      let hasInbound = false;

      for (const item of messages) {
        const direction = normalizeDirection(item.type ?? item.direction ?? item.email_type);
        const sentAt = item.sent_at ?? item.created_at ?? item.received_at ?? item.time ?? null;
        const subject = item.subject ?? item.email_subject ?? null;
        if (direction === "inbound" && sentAt) {
          hasInbound = true;
          if (!latestInboundAt || sentAt > latestInboundAt) {
            latestInboundAt = sentAt;
            latestSubject = subject;
          }
        }
      }

      // ── Now upsert conversation (only because we confirmed messages exist) ──
      const rpcResult = await supabase.rpc("upsert_smartlead_conversation", {
        p_campaign_id: String(camp.campaign_id),
        p_lead_id: String(lead.id),
        p_email_normalized: email,
        p_agency_id: matched?.agency_id ?? null,
        p_other_agency_email_id: matched?.id ?? null,
        p_event_type: hasInbound ? "replied" : eventType,
        p_event_at: hasInbound ? (latestInboundAt ?? eventAt) : eventAt,
        p_subject: latestSubject ?? null,
      });

      if (rpcResult.error) {
        errors.push(`Upsert conv ${email}: ${rpcResult.error.message}`);
        continue;
      }
      tick_convs++;

      // Resolve conversation UUID
      let convId: string | null = typeof rpcResult.data === "string" ? rpcResult.data : null;
      if (!convId) {
        const { data: row } = await supabase
          .from("smartlead_conversations")
          .select("id")
          .eq("email_normalized", email)
          .eq("campaign_id", String(camp.campaign_id))
          .maybeSingle();
        convId = row?.id ?? null;
      }
      if (!convId) continue;

      // ── Insert messages ────────────────────────────────────────────────────
      for (let i = 0; i < messages.length; i++) {
        const item = messages[i];
        const { body_text, body_html } = extractBody(item);
        const direction = normalizeDirection(item.type ?? item.direction ?? item.email_type);
        const sentAt = item.sent_at ?? item.created_at ?? item.received_at ?? item.time ?? null;
        const subject = item.subject ?? item.email_subject ?? null;

        const { error: insErr } = await supabase.from("smartlead_messages").insert({
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
          smartlead_message_id: item.id ? String(item.id) : null,
          sequence_number: item.sequence_number ?? item.seq ?? i + 1,
          raw_json: item,
        });

        if (!insErr) {
          tick_messages++;
        } else if (insErr.code !== "23505") {
          errors.push(`Msg ${email}[${i}]: ${insErr.message}`);
        }
      }

      // Update conversation with real thread metadata
      if (hasInbound && latestInboundAt) {
        await supabase.from("smartlead_conversations").update({
          latest_event_type: "replied",
          latest_event_at: latestInboundAt,
          status: "replied",
          ...(latestSubject ? { latest_subject: latestSubject } : {}),
          messages_synced_at: new Date().toISOString(),
          updated_at: new Date().toISOString(),
        }).eq("id", convId);
      } else {
        await supabase.from("smartlead_conversations").update({
          messages_synced_at: new Date().toISOString(),
          updated_at: new Date().toISOString(),
        }).eq("id", convId);
      }
    }
  }

  // ── Advance cursor ─────────────────────────────────────────────────────────
  const pageWasFull = leads.length >= LEADS_PAGE_SIZE;
  const nextCampIdx  = pageWasFull ? campIdx : campIdx + 1;
  const nextOffset   = pageWasFull ? leadOffset + LEADS_PAGE_SIZE : 0;
  const campAdvanced = !pageWasFull;
  const isDone = nextCampIdx >= campaignList.length;

  const updatedJob = {
    status: isDone ? "success" : "running",
    cursor_campaign_index: nextCampIdx,
    cursor_lead_offset: nextOffset,
    campaigns_processed: (job.campaigns_processed ?? 0) + (campAdvanced ? 1 : 0),
    leads_processed: (job.leads_processed ?? 0) + tick_leads_scanned,
    inbox_worthy_leads: (job.inbox_worthy_leads ?? 0) + tick_worthy_found,
    conversations_upserted: (job.conversations_upserted ?? 0) + tick_convs,
    message_histories_fetched: (job.message_histories_fetched ?? 0) + tick_histories,
    messages_inserted: (job.messages_inserted ?? 0) + tick_messages,
    errors: errors.slice(-50),
    updated_at: new Date().toISOString(),
    ...(isDone ? { completed_at: new Date().toISOString() } : {}),
  };

  await supabase.from("smartlead_sync_jobs").update(updatedJob).eq("id", jobId);

  const stats = {
    campaigns_total: job.campaigns_total ?? campaignList.length,
    campaigns_processed: updatedJob.campaigns_processed,
    leads_processed: updatedJob.leads_processed,
    inbox_worthy_leads: updatedJob.inbox_worthy_leads,
    conversations_upserted: updatedJob.conversations_upserted,
    message_histories_fetched: updatedJob.message_histories_fetched,
    messages_inserted: updatedJob.messages_inserted,
  };

  console.log(
    `[smartlead-sync-job] tick: job=${jobId} camp=${campIdx}/${campaignList.length} ` +
    `scanned=${tick_leads_scanned} worthy=${tick_worthy_found} histories=${tick_histories} ` +
    `convs=${tick_convs} msgs=${tick_messages} done=${isDone}`
  );

  return json({ ok: true, done: isDone, status: isDone ? "success" : "running", stats });
}

function buildStats(job: any) {
  return {
    campaigns_total: job.campaigns_total ?? 0,
    campaigns_processed: job.campaigns_processed ?? 0,
    leads_processed: job.leads_processed ?? 0,
    inbox_worthy_leads: job.inbox_worthy_leads ?? 0,
    conversations_upserted: job.conversations_upserted ?? 0,
    message_histories_fetched: job.message_histories_fetched ?? 0,
    messages_inserted: job.messages_inserted ?? 0,
  };
}

// ─── Status ────────────────────────────────────────────────────────────────────

async function handleStatus(supabase: any, jobId: string) {
  const { data: job, error } = await supabase
    .from("smartlead_sync_jobs")
    .select("*")
    .eq("id", jobId)
    .maybeSingle();
  if (error) throw error;
  if (!job) return json({ ok: false, error: "Job not found" }, 404);
  return json({ ok: true, job, stats: buildStats(job) });
}

// ─── Latest ────────────────────────────────────────────────────────────────────

async function handleLatest(supabase: any) {
  const { data: job } = await supabase
    .from("smartlead_sync_jobs")
    .select("*")
    .order("created_at", { ascending: false })
    .limit(1)
    .maybeSingle();
  return json({ ok: true, job: job ?? null, stats: job ? buildStats(job) : null });
}

// ─── Router ────────────────────────────────────────────────────────────────────

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") return new Response(null, { status: 200, headers: CORS });

  try {
    await requireAdminSession(req);

    const supabase = createClient(
      Deno.env.get("SUPABASE_URL")!,
      Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!,
      { auth: { autoRefreshToken: false, persistSession: false } }
    );

    const url    = new URL(req.url);
    const action = url.searchParams.get("action") ?? "";

    if (req.method === "GET") {
      const jobId = url.searchParams.get("job_id");
      if (action === "status" && jobId) return await handleStatus(supabase, jobId);
      if (action === "latest") return await handleLatest(supabase);
      return json({ ok: false, error: "Unknown GET action" }, 400);
    }

    if (req.method === "POST") {
      const body = await req.json().catch(() => ({}));
      if (action === "kickoff") return await handleKickoff(supabase, body.triggered_by ?? "manual");
      if (action === "tick") {
        if (!body.job_id) return json({ ok: false, error: "job_id required" }, 400);
        return await handleTick(supabase, body.job_id);
      }
      return json({ ok: false, error: "Unknown POST action" }, 400);
    }

    return json({ ok: false, error: "Method not allowed" }, 405);
  } catch (err) {
    const message = err instanceof Error ? err.message : String(err);
    console.error("[smartlead-sync-job] error:", message);
    return json({ ok: false, error: message }, message.includes("Unauthorized") ? 401 : 500);
  }
});
