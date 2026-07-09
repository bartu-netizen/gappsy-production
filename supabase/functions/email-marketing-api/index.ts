import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2";
import { authenticateAdmin, writeAuditLog, getRequestMeta, hashPayload } from "../_shared/adminAuth.ts";
import { sendEmail } from "../_shared/emailClient.ts";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "GET, POST, PUT, DELETE, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey, x-admin-token, x-admin-secret",
};

function json(data: unknown, status = 200) {
  return new Response(JSON.stringify(data), {
    status,
    headers: { ...corsHeaders, "Content-Type": "application/json" },
  });
}

function err(message: string, status = 400, code?: string) {
  return json({ ok: false, error: code ?? "ERROR", message }, status);
}

// Render template variables into a string
function renderTemplate(template: string, vars: Record<string, string>): string {
  return template.replace(/\{\{(\w+)\}\}/g, (_, key) => vars[key] ?? "");
}

// Build HTML from body_json blocks
function renderBlocksToHtml(blocks: any[], vars: Record<string, string>): string {
  const rendered = blocks.map((block: any) => {
    switch (block.type) {
      case "header":
        return `<h1 style="font-family:sans-serif;font-size:24px;font-weight:bold;color:#0f172a;margin:0 0 16px">${renderTemplate(block.content ?? "", vars)}</h1>`;
      case "text":
        return `<p style="font-family:sans-serif;font-size:16px;color:#334155;line-height:1.6;margin:0 0 16px">${renderTemplate(block.content ?? "", vars).replace(/\n/g, "<br>")}</p>`;
      case "button":
        return `<div style="margin:24px 0"><a href="${renderTemplate(block.url ?? "", vars)}" style="display:inline-block;background:#0f172a;color:#fff;font-family:sans-serif;font-size:14px;font-weight:600;padding:12px 24px;border-radius:8px;text-decoration:none">${renderTemplate(block.label ?? "Click here", vars)}</a></div>`;
      case "divider":
        return `<hr style="border:none;border-top:1px solid #e2e8f0;margin:24px 0">`;
      case "spacer":
        return `<div style="height:${block.height ?? 24}px"></div>`;
      case "image":
        return `<img src="${renderTemplate(block.src ?? "", vars)}" alt="${block.alt ?? ""}" style="max-width:100%;border-radius:8px;margin:0 0 16px">`;
      case "footer":
        return `<p style="font-family:sans-serif;font-size:12px;color:#94a3b8;margin:24px 0 0;text-align:center">${renderTemplate(block.content ?? "", vars)}</p>`;
      default:
        return "";
    }
  }).join("\n");

  return `<!DOCTYPE html><html><head><meta charset="UTF-8"><meta name="viewport" content="width=device-width,initial-scale=1"></head><body style="margin:0;padding:0;background:#f8fafc"><div style="max-width:600px;margin:0 auto;background:#fff;border-radius:12px;overflow:hidden;box-shadow:0 1px 3px rgba(0,0,0,.1)"><div style="padding:40px 40px 32px">${rendered}</div></div></body></html>`;
}

// Execute segment rules to get matching contact IDs
async function executeSegmentRules(supabase: any, rulesJson: any): Promise<string[]> {
  try {
    const { operator = "AND", groups = [] } = rulesJson;
    if (!groups.length) {
      const { data } = await supabase.from("em_contacts").select("id");
      return (data ?? []).map((r: any) => r.id);
    }

    // Build query dynamically for simple rules
    let query = supabase.from("em_contacts").select("id");
    for (const group of groups) {
      for (const rule of (group.rules ?? [])) {
        const { field, operator: op, value } = rule;
        if (!field || !op) continue;
        if (op === "eq") query = query.eq(field, value);
        else if (op === "neq") query = query.neq(field, value);
        else if (op === "contains") query = query.ilike(field, `%${value}%`);
        else if (op === "gt") query = query.gt(field, value);
        else if (op === "lt") query = query.lt(field, value);
        else if (op === "is_null") query = query.is(field, null);
        else if (op === "in" && Array.isArray(value)) query = query.in(field, value);
      }
    }
    const { data } = await query;
    return (data ?? []).map((r: any) => r.id);
  } catch {
    return [];
  }
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: corsHeaders });
  }

  const auth = await authenticateAdmin(req);
  if (!auth.success) {
    return err(auth.error?.message ?? "Unauthorized", 401, auth.error?.code);
  }

  const supabase = createClient(
    Deno.env.get("SUPABASE_URL") ?? "",
    Deno.env.get("SUPABASE_SERVICE_ROLE_KEY") ?? "",
    { auth: { autoRefreshToken: false, persistSession: false } }
  );

  const url = new URL(req.url);
  const qp = url.searchParams.get("path");
  let path: string;
  if (qp) {
    path = decodeURIComponent(qp).replace(/^\/+|\/+$/g, "");
  } else {
    const segments = url.pathname.split("/").filter(Boolean);
    path = segments.slice(3).join("/");
  }
  const method = req.method.toUpperCase();
  const { ip } = getRequestMeta(req);

  try {
    // ── OVERVIEW ───────────────────────────────────────────────
    if (path === "overview" && method === "GET") {
      const today = new Date();
      today.setHours(0, 0, 0, 0);
      const todayIso = today.toISOString();

      const [contacts, sentToday, campaigns, automations, recent] = await Promise.all([
        supabase.from("em_contacts").select("id", { count: "exact", head: true }),
        supabase.from("em_messages").select("id", { count: "exact", head: true })
          .gte("sent_at", todayIso).neq("status", "queued"),
        supabase.from("em_campaigns").select("id,name,status,sent_count,open_count,click_count,created_at").order("created_at", { ascending: false }).limit(5),
        supabase.from("em_automations").select("id,name,status,enrolled_count").eq("status", "active").limit(5),
        supabase.from("em_messages").select("id,to_email,status,sent_at,subject_rendered").order("created_at", { ascending: false }).limit(10),
      ]);

      const { data: openEvents } = await supabase
        .from("em_events")
        .select("message_id")
        .eq("event_type", "open")
        .gte("created_at", todayIso);

      const { count: clickCount } = await supabase
        .from("em_events")
        .select("id", { count: "exact", head: true })
        .eq("event_type", "click")
        .gte("created_at", todayIso);

      const { count: deliveredToday } = await supabase
        .from("em_messages")
        .select("id", { count: "exact", head: true })
        .eq("status", "sent")
        .gte("sent_at", todayIso);

      const uniqueOpensToday = new Set((openEvents ?? []).map((e: any) => e.message_id)).size;
      const delivered = deliveredToday ?? 0;
      const openRateToday = delivered > 0 ? uniqueOpensToday / delivered : null;

      return json({
        ok: true,
        stats: {
          total_contacts: contacts.count ?? 0,
          sent_today: sentToday.count ?? 0,
          opens_today: uniqueOpensToday,
          clicks_today: clickCount ?? 0,
          delivered_today: delivered,
          unique_opens_today: uniqueOpensToday,
          open_rate_today: openRateToday,
        },
        recent_campaigns: campaigns.data ?? [],
        active_automations: automations.data ?? [],
        recent_messages: recent.data ?? [],
      });
    }

    // ── CONTACTS ───────────────────────────────────────────────
    if (path === "contacts" && method === "GET") {
      const limit = Math.min(parseInt(url.searchParams.get("limit") ?? "50"), 200);
      const offset = parseInt(url.searchParams.get("offset") ?? "0");
      const search = url.searchParams.get("search") ?? "";
      const leadStatus = url.searchParams.get("lead_status") ?? "";
      const sourceType = url.searchParams.get("source_type") ?? "";

      let query = supabase.from("em_contacts").select("*", { count: "exact" }).order("created_at", { ascending: false }).range(offset, offset + limit - 1);
      if (search) query = query.or(`email.ilike.%${search}%,first_name.ilike.%${search}%,last_name.ilike.%${search}%,company_name.ilike.%${search}%`);
      if (leadStatus) query = query.eq("lead_status", leadStatus);
      if (sourceType) query = query.eq("source_type", sourceType);

      const { data, count, error } = await query;
      if (error) return err(error.message, 500);
      return json({ ok: true, contacts: data, total: count, limit, offset });
    }

    if (path === "contacts" && method === "POST") {
      const body = await req.json();
      const { email, first_name, last_name, company_name, source_type = "other", lead_status = "new" } = body;
      if (!email) return err("email is required");
      const { data, error } = await supabase.from("em_contacts").upsert(
        { email: email.toLowerCase().trim(), first_name, last_name, company_name, source_type, lead_status, updated_at: new Date().toISOString() },
        { onConflict: "email" }
      ).select().single();
      if (error) return err(error.message, 500);
      return json({ ok: true, contact: data });
    }

    const contactMatch = path.match(/^contacts\/([^/]+)$/);
    if (contactMatch) {
      const contactId = contactMatch[1];
      if (method === "GET") {
        const [contact, funnel, messages] = await Promise.all([
          supabase.from("em_contacts").select("*").eq("id", contactId).maybeSingle(),
          supabase.from("em_funnel_events").select("*").eq("contact_id", contactId).order("created_at", { ascending: false }).limit(50),
          supabase.from("em_messages").select("id,subject_rendered,status,sent_at,to_email,template_id,campaign_id,error_code,error").eq("contact_id", contactId).order("created_at", { ascending: false }).limit(20),
        ]);
        if (!contact.data) return err("Contact not found", 404);

        // Fetch email events (opens/clicks) for this contact's messages
        const messageIds = (messages.data ?? []).map((m: any) => m.id);
        let emailEvents: any[] = [];
        if (messageIds.length > 0) {
          const { data: evData } = await supabase
            .from("em_events")
            .select("id,message_id,event_type,url,created_at")
            .in("message_id", messageIds)
            .order("created_at", { ascending: false })
            .limit(100);
          emailEvents = evData ?? [];
        }

        return json({
          ok: true,
          contact: contact.data,
          funnel_events: funnel.data ?? [],
          messages: messages.data ?? [],
          email_events: emailEvents,
        });
      }
      if (method === "PUT") {
        const body = await req.json();
        const { error } = await supabase.from("em_contacts").update({ ...body, updated_at: new Date().toISOString() }).eq("id", contactId);
        if (error) return err(error.message, 500);
        return json({ ok: true });
      }
      if (method === "DELETE") {
        const { error } = await supabase.from("em_contacts").delete().eq("id", contactId);
        if (error) return err(error.message, 500);
        return json({ ok: true });
      }
    }

    // ── TAGS ──────────────────────────────────────────────────
    if (path === "tags" && method === "GET") {
      const { data } = await supabase.from("em_tags").select("*").order("name");
      return json({ ok: true, tags: data ?? [] });
    }
    if (path === "tags" && method === "POST") {
      const { name, color } = await req.json();
      if (!name) return err("name is required");
      const { data, error } = await supabase.from("em_tags").insert({ name, color: color ?? "#64748b" }).select().single();
      if (error) return err(error.message, 500);
      return json({ ok: true, tag: data });
    }

    // ── SEGMENTS ──────────────────────────────────────────────
    if (path === "segments" && method === "GET") {
      const { data } = await supabase.from("em_segments").select("*").order("name");
      return json({ ok: true, segments: data ?? [] });
    }
    if (path === "segments" && method === "POST") {
      const body = await req.json();
      const { name, description, rules_json } = body;
      if (!name) return err("name is required");
      const { data, error } = await supabase.from("em_segments").insert({ name, description, rules_json: rules_json ?? { operator: "AND", groups: [] } }).select().single();
      if (error) return err(error.message, 500);
      return json({ ok: true, segment: data });
    }
    const segmentMatch = path.match(/^segments\/([^/]+)$/);
    if (segmentMatch) {
      const segId = segmentMatch[1];
      if (method === "PUT") {
        const body = await req.json();
        const { error } = await supabase.from("em_segments").update({ ...body, updated_at: new Date().toISOString() }).eq("id", segId);
        if (error) return err(error.message, 500);
        return json({ ok: true });
      }
      if (method === "DELETE") {
        const { error } = await supabase.from("em_segments").delete().eq("id", segId);
        if (error) return err(error.message, 500);
        return json({ ok: true });
      }
    }
    if (path.match(/^segments\/([^/]+)\/estimate$/) && method === "GET") {
      const segId = path.split("/")[1];
      const { data: seg } = await supabase.from("em_segments").select("rules_json").eq("id", segId).maybeSingle();
      if (!seg) return err("Segment not found", 404);
      const ids = await executeSegmentRules(supabase, seg.rules_json);
      await supabase.from("em_segments").update({ estimated_count: ids.length, estimated_count_updated_at: new Date().toISOString() }).eq("id", segId);
      return json({ ok: true, count: ids.length });
    }

    // ── TEMPLATES ─────────────────────────────────────────────
    if (path === "templates" && method === "GET") {
      const { data } = await supabase.from("em_templates").select("id,name,subject_template,version,updated_at").order("updated_at", { ascending: false });
      return json({ ok: true, templates: data ?? [] });
    }
    if (path === "templates" && method === "POST") {
      const body = await req.json();
      const { name, subject_template = "", preheader_template = "", body_json = { blocks: [] }, body_html = "" } = body;
      if (!name) return err("name is required");
      const { data, error } = await supabase.from("em_templates").insert({ name, subject_template, preheader_template, body_json, body_html }).select().single();
      if (error) return err(error.message, 500);
      return json({ ok: true, template: data });
    }
    const templateMatch = path.match(/^templates\/([^/]+)$/);
    if (templateMatch) {
      const tplId = templateMatch[1];
      if (method === "GET") {
        const { data, error } = await supabase.from("em_templates").select("*").eq("id", tplId).maybeSingle();
        if (error || !data) return err("Template not found", 404);
        const { data: versions } = await supabase.from("em_template_versions").select("id,version,saved_at").eq("template_id", tplId).order("version", { ascending: false }).limit(10);
        return json({ ok: true, template: data, versions: versions ?? [] });
      }
      if (method === "PUT") {
        const body = await req.json();
        const { data: existing } = await supabase.from("em_templates").select("version,body_json,subject_template,preheader_template,body_html").eq("id", tplId).maybeSingle();
        if (existing) {
          await supabase.from("em_template_versions").insert({ template_id: tplId, version: existing.version, subject_template: existing.subject_template, preheader_template: existing.preheader_template, body_json: existing.body_json, body_html: existing.body_html });
        }
        const { error } = await supabase.from("em_templates").update({ ...body, version: (existing?.version ?? 0) + 1, updated_at: new Date().toISOString() }).eq("id", tplId);
        if (error) return err(error.message, 500);
        return json({ ok: true });
      }
      if (method === "DELETE") {
        const { error } = await supabase.from("em_templates").delete().eq("id", tplId);
        if (error) return err(error.message, 500);
        return json({ ok: true });
      }
    }

    // ── CAMPAIGNS ─────────────────────────────────────────────
    if (path === "campaigns" && method === "GET") {
      const { data } = await supabase.from("em_campaigns").select("*").order("created_at", { ascending: false });
      return json({ ok: true, campaigns: data ?? [] });
    }
    if (path === "campaigns" && method === "POST") {
      const body = await req.json();
      const { name, segment_id, template_id, from_name, from_email, reply_to, send_mode = "now", scheduled_for, subject_override } = body;
      if (!name || !template_id || !from_email) return err("name, template_id, from_email required");
      const { data, error } = await supabase.from("em_campaigns").insert({ name, segment_id, template_id, from_name: from_name ?? "Gappsy", from_email, reply_to, send_mode, scheduled_for, subject_override }).select().single();
      if (error) return err(error.message, 500);
      return json({ ok: true, campaign: data });
    }
    const campaignMatch = path.match(/^campaigns\/([^/]+)$/);
    if (campaignMatch) {
      const campId = campaignMatch[1];
      if (method === "GET") {
        const { data } = await supabase.from("em_campaigns").select("*").eq("id", campId).maybeSingle();
        if (!data) return err("Campaign not found", 404);
        return json({ ok: true, campaign: data });
      }
      if (method === "PUT") {
        const body = await req.json();
        const { error } = await supabase.from("em_campaigns").update({ ...body, updated_at: new Date().toISOString() }).eq("id", campId);
        if (error) return err(error.message, 500);
        return json({ ok: true });
      }
      if (method === "DELETE") {
        const { error } = await supabase.from("em_campaigns").delete().eq("id", campId);
        if (error) return err(error.message, 500);
        return json({ ok: true });
      }
    }

    // Campaign: send (queue messages for all segment contacts)
    if (path.match(/^campaigns\/([^/]+)\/send$/) && method === "POST") {
      const campId = path.split("/")[1];
      const { data: campaign } = await supabase.from("em_campaigns").select("*").eq("id", campId).maybeSingle();
      if (!campaign) return err("Campaign not found", 404);
      if (campaign.status !== "draft" && campaign.status !== "scheduled") return err("Campaign already sent or not in sendable state");

      const { data: template } = await supabase.from("em_templates").select("*").eq("id", campaign.template_id).maybeSingle();
      if (!template) return err("Template not found", 404);

      // Get contacts
      let contactIds: string[] = [];
      if (campaign.segment_id) {
        const { data: seg } = await supabase.from("em_segments").select("rules_json").eq("id", campaign.segment_id).maybeSingle();
        if (seg) contactIds = await executeSegmentRules(supabase, seg.rules_json);
      } else {
        const { data: allContacts } = await supabase.from("em_contacts").select("id");
        contactIds = (allContacts ?? []).map((c: any) => c.id);
      }

      if (!contactIds.length) return err("No contacts match the segment", 400);

      // Check suppression
      const { data: suppressed } = await supabase.from("em_suppression").select("email");
      const suppressedEmails = new Set((suppressed ?? []).map((s: any) => s.email.toLowerCase()));

      const { data: contacts } = await supabase.from("em_contacts").select("id,email,first_name,last_name,company_name,state_name").in("id", contactIds);
      const validContacts = (contacts ?? []).filter((c: any) => !suppressedEmails.has(c.email.toLowerCase()));

      const now = new Date().toISOString();
      const scheduledFor = campaign.scheduled_for ?? now;
      const messages = validContacts.map((c: any) => {
        const vars: Record<string, string> = {
          first_name: c.first_name ?? "",
          last_name: c.last_name ?? "",
          company: c.company_name ?? "",
          state: c.state_name ?? "",
          email: c.email ?? "",
        };
        const bodyHtml = renderBlocksToHtml(template.body_json?.blocks ?? [], vars);
        const subject = renderTemplate(campaign.subject_override ?? template.subject_template, vars);
        return {
          contact_id: c.id,
          campaign_id: campId,
          template_id: campaign.template_id,
          subject_rendered: subject,
          body_html_rendered: bodyHtml,
          to_email: c.email,
          from_name: campaign.from_name,
          from_email: campaign.from_email,
          reply_to: campaign.reply_to,
          status: "queued",
          scheduled_for: scheduledFor,
        };
      });

      const BATCH = 200;
      for (let i = 0; i < messages.length; i += BATCH) {
        await supabase.from("em_messages").insert(messages.slice(i, i + BATCH));
      }

      await supabase.from("em_campaigns").update({ status: campaign.send_mode === "now" ? "sending" : "scheduled", total_recipients: validContacts.length, started_at: now, updated_at: now }).eq("id", campId);

      await writeAuditLog({ actor_session_type: auth.sessionType ?? "unknown", action: "campaign_send", target_table: "em_messages", target_id: campId, payload_hash: await hashPayload({ campId, count: messages.length }), ip, status: "success" });

      return json({ ok: true, queued: messages.length, total_contacts: contactIds.length, suppressed: contactIds.length - validContacts.length });
    }

    // Campaign: test send
    if (path.match(/^campaigns\/([^/]+)\/test-send$/) && method === "POST") {
      const campId = path.split("/")[1];
      const { to_email } = await req.json();
      if (!to_email) return err("to_email required");
      const { data: campaign } = await supabase.from("em_campaigns").select("*").eq("id", campId).maybeSingle();
      if (!campaign) return err("Campaign not found", 404);
      const { data: template } = await supabase.from("em_templates").select("*").eq("id", campaign.template_id).maybeSingle();
      if (!template) return err("Template not found", 404);
      const vars = { first_name: "Preview", last_name: "User", company: "Acme Inc", state: "New Jersey", email: to_email };
      const bodyHtml = renderBlocksToHtml(template.body_json?.blocks ?? [], vars);
      const subject = `[TEST] ${renderTemplate(campaign.subject_override ?? template.subject_template, vars)}`;
      const result = await sendEmail({ to: to_email, subject, html: bodyHtml, from: `${campaign.from_name} <${campaign.from_email}>` });
      return json({ ok: result.success, error: result.error });
    }

    // ── AUTOMATIONS ───────────────────────────────────────────
    if (path === "automations" && method === "GET") {
      const { data } = await supabase.from("em_automations").select("*").order("created_at", { ascending: false });
      return json({ ok: true, automations: data ?? [] });
    }
    if (path === "automations" && method === "POST") {
      const body = await req.json();
      const { name, trigger_type = "form_submitted", trigger_filters = {}, flow_json = { steps: [] } } = body;
      if (!name) return err("name is required");
      const { data, error } = await supabase.from("em_automations").insert({ name, trigger_type, trigger_filters, flow_json }).select().single();
      if (error) return err(error.message, 500);
      return json({ ok: true, automation: data });
    }
    const automationMatch = path.match(/^automations\/([^/]+)$/);
    if (automationMatch) {
      const autoId = automationMatch[1];
      if (method === "GET") {
        const { data } = await supabase.from("em_automations").select("*").eq("id", autoId).maybeSingle();
        if (!data) return err("Automation not found", 404);
        const { data: enroll } = await supabase.from("em_automation_enrollments").select("id,status").eq("automation_id", autoId);
        return json({ ok: true, automation: data, enrollment_stats: { total: enroll?.length ?? 0, active: enroll?.filter((e: any) => e.status === "active").length ?? 0, completed: enroll?.filter((e: any) => e.status === "completed").length ?? 0 } });
      }
      if (method === "PUT") {
        const body = await req.json();
        const { error } = await supabase.from("em_automations").update({ ...body, updated_at: new Date().toISOString() }).eq("id", autoId);
        if (error) return err(error.message, 500);
        return json({ ok: true });
      }
      if (method === "DELETE") {
        const { error } = await supabase.from("em_automations").delete().eq("id", autoId);
        if (error) return err(error.message, 500);
        return json({ ok: true });
      }
    }

    // ── MESSAGES / LOGS ───────────────────────────────────────
    if (path === "logs" && method === "GET") {
      const limit = Math.min(parseInt(url.searchParams.get("limit") ?? "100"), 500);
      const offset = parseInt(url.searchParams.get("offset") ?? "0");
      const status = url.searchParams.get("status") ?? "";
      let query = supabase.from("em_messages").select("id,to_email,subject_rendered,status,sent_at,created_at,campaign_id,automation_id,error,error_code", { count: "exact" }).order("created_at", { ascending: false }).range(offset, offset + limit - 1);
      if (status) query = query.eq("status", status);
      const { data, count } = await query;

      // Attach open/click counts per message
      const messageIds = (data ?? []).map((m: any) => m.id);
      let eventCounts: Record<string, { open_count: number; click_count: number }> = {};
      if (messageIds.length > 0) {
        const { data: evData } = await supabase
          .from("em_events")
          .select("message_id,event_type")
          .in("message_id", messageIds)
          .in("event_type", ["open", "click"]);
        for (const ev of (evData ?? [])) {
          if (!eventCounts[ev.message_id]) eventCounts[ev.message_id] = { open_count: 0, click_count: 0 };
          if (ev.event_type === "open") eventCounts[ev.message_id].open_count++;
          if (ev.event_type === "click") eventCounts[ev.message_id].click_count++;
        }
      }

      const messages = (data ?? []).map((m: any) => ({
        ...m,
        open_count: eventCounts[m.id]?.open_count ?? 0,
        click_count: eventCounts[m.id]?.click_count ?? 0,
      }));

      return json({ ok: true, messages, total: count, limit, offset });
    }

    // ── LOG DETAIL ────────────────────────────────────────────
    const logDetailMatch = path.match(/^logs\/([^/]+)$/);
    if (logDetailMatch && method === "GET") {
      const messageId = logDetailMatch[1];
      const [msg, events] = await Promise.all([
        supabase.from("em_messages").select("*").eq("id", messageId).maybeSingle(),
        supabase.from("em_events").select("id,event_type,url,ip_hash,user_agent,created_at").eq("message_id", messageId).order("created_at", { ascending: true }),
      ]);
      if (!msg.data) return err("Message not found", 404);
      return json({ ok: true, message: msg.data, events: events.data ?? [] });
    }

    // ── SUPPRESSION ───────────────────────────────────────────
    if (path === "suppression" && method === "GET") {
      const { data } = await supabase.from("em_suppression").select("*").order("created_at", { ascending: false }).limit(200);
      return json({ ok: true, suppressed: data ?? [] });
    }
    if (path === "suppression" && method === "POST") {
      const { email, reason = "manual" } = await req.json();
      if (!email) return err("email required");
      const { error } = await supabase.from("em_suppression").upsert({ email: email.toLowerCase().trim(), reason }, { onConflict: "email" });
      if (error) return err(error.message, 500);
      return json({ ok: true });
    }
    if (path.match(/^suppression\/remove$/) && method === "POST") {
      const { email } = await req.json();
      if (!email) return err("email required");
      await supabase.from("em_suppression").delete().eq("email", email.toLowerCase().trim());
      return json({ ok: true });
    }

    // ── SETTINGS ──────────────────────────────────────────────
    if (path === "settings" && method === "GET") {
      const { data } = await supabase.from("em_settings").select("*");
      const settings: Record<string, string> = {};
      (data ?? []).forEach((row: any) => { settings[row.key] = row.value; });
      return json({ ok: true, settings });
    }
    if (path === "settings" && method === "POST") {
      const body = await req.json();
      const entries = Object.entries(body).map(([key, value]) => ({ key, value: String(value), updated_at: new Date().toISOString() }));
      await supabase.from("em_settings").upsert(entries, { onConflict: "key" });
      return json({ ok: true });
    }

    // ── SENDER IDENTITY (canonical: email_sender_settings table) ──
    if (path === "settings/sender" && method === "GET") {
      const { data } = await supabase
        .from("email_sender_settings")
        .select("default_from_name, default_from_email, default_reply_to")
        .order("created_at", { ascending: true })
        .limit(1)
        .maybeSingle();

      return json({
        ok: true,
        sender: {
          from_name: data?.default_from_name ?? "Gappsy",
          from_email: data?.default_from_email ?? "noreply@gappsy.com",
          reply_to: data?.default_reply_to ?? "",
        },
      });
    }

    if ((path === "settings/sender" && method === "PUT") || (path === "settings/sender" && method === "POST")) {
      const body = await req.json();
      const { from_name, from_email, reply_to } = body;

      if (!from_name || from_name.length < 2 || from_name.length > 60) {
        return err("from_name must be 2-60 characters", 400, "VALIDATION_ERROR");
      }
      if (!from_email || !from_email.includes("@")) {
        return err("from_email is required and must contain @", 400, "VALIDATION_ERROR");
      }
      if (reply_to && !reply_to.includes("@")) {
        return err("reply_to must contain @ if provided", 400, "VALIDATION_ERROR");
      }

      const now = new Date().toISOString();
      const payload = {
        default_from_name: from_name.trim(),
        default_from_email: from_email.trim(),
        default_reply_to: reply_to?.trim() || null,
        updated_at: now,
      };

      const { data: existing } = await supabase
        .from("email_sender_settings")
        .select("id")
        .order("created_at", { ascending: true })
        .limit(1)
        .maybeSingle();

      let error;
      if (existing) {
        ({ error } = await supabase
          .from("email_sender_settings")
          .update(payload)
          .eq("id", existing.id));
      } else {
        ({ error } = await supabase
          .from("email_sender_settings")
          .insert(payload));
      }
      if (error) return err(error.message, 500);

      return json({
        ok: true,
        sender: {
          from_name: from_name.trim(),
          from_email: from_email.trim(),
          reply_to: reply_to?.trim() ?? "",
        },
      });
    }

    // ── IMPORT: PREVIEW ───────────────────────────────────────
    // POST contacts/import/preview
    // Body: { filename, rows: Array<Record<string,string>>, mapping: Record<fieldName, csvColumn> }
    if (path === "contacts/import/preview" && method === "POST") {
      const body = await req.json();
      const { filename = "upload.csv", rows = [], mapping = {} } = body;

      if (!Array.isArray(rows) || rows.length === 0) {
        return err("rows array is required and must not be empty", 400, "VALIDATION_ERROR");
      }

      const MAX_PREVIEW = 20;
      const REQUIRED_FIELDS = ["email"];

      // Extract field value via mapping
      const getField = (row: Record<string, string>, fieldName: string): string => {
        const col = mapping[fieldName];
        if (!col) return "";
        return (row[col] ?? "").toString().trim();
      };

      // Normalize tags: "tag1, tag2" -> ["tag1","tag2"]
      const normalizeTags = (raw: string): string[] =>
        raw.split(/[,;|]/).map(t => t.trim().toLowerCase()).filter(Boolean);

      const validationErrors: { row: number; reason: string }[] = [];
      const seenEmails = new Set<string>();
      const previewRows: Record<string, any>[] = [];
      let duplicatesInFile = 0;

      // Get all existing emails for dedupe preview
      const { data: existingData } = await supabase
        .from("em_contacts")
        .select("email");
      const existingEmails = new Set((existingData ?? []).map((r: any) => r.email.toLowerCase()));

      for (let i = 0; i < rows.length; i++) {
        const row = rows[i];
        const email = getField(row, "email").toLowerCase();

        if (!email || !email.includes("@")) {
          validationErrors.push({ row: i + 1, reason: `Invalid email: "${getField(row, "email")}"` });
          continue;
        }
        if (seenEmails.has(email)) {
          duplicatesInFile++;
          continue;
        }
        seenEmails.add(email);

        const contact = {
          email,
          first_name: getField(row, "first_name"),
          last_name: getField(row, "last_name"),
          company_name: getField(row, "company_name"),
          website: getField(row, "website"),
          phone: getField(row, "phone"),
          state_name: getField(row, "state_name"),
          country: getField(row, "country"),
          source_type: getField(row, "source_type") || "import",
          lead_status: getField(row, "lead_status") || "new",
          tags: normalizeTags(getField(row, "tags")),
          notes: getField(row, "notes"),
          _exists: existingEmails.has(email),
        };

        previewRows.push(contact);
      }

      const newCount = previewRows.filter((r: any) => !r._exists).length;
      const updateCount = previewRows.filter((r: any) => r._exists).length;

      return json({
        ok: true,
        filename,
        total_rows: rows.length,
        valid_rows: previewRows.length,
        duplicate_rows: duplicatesInFile,
        invalid_rows: validationErrors.length,
        new_count: newCount,
        update_count: updateCount,
        preview: previewRows.slice(0, MAX_PREVIEW),
        validation_errors: validationErrors.slice(0, 20),
        suggested_mapping: mapping,
      });
    }

    // ── IMPORT: COMMIT ─────────────────────────────────────────
    // POST contacts/import/commit
    // Body: { filename, rows, mapping }
    if (path === "contacts/import/commit" && method === "POST") {
      const body = await req.json();
      const { filename = "upload.csv", rows = [], mapping = {} } = body;

      if (!Array.isArray(rows) || rows.length === 0) {
        return err("rows array is required", 400, "VALIDATION_ERROR");
      }

      const getField = (row: Record<string, string>, fieldName: string): string => {
        const col = mapping[fieldName];
        if (!col) return "";
        return (row[col] ?? "").toString().trim();
      };

      const normalizeTags = (raw: string): string[] =>
        raw.split(/[,;|]/).map(t => t.trim().toLowerCase()).filter(Boolean);

      const errors: { row: number; reason: string }[] = [];
      const seenEmails = new Set<string>();
      const toUpsert: Record<string, any>[] = [];

      for (let i = 0; i < rows.length; i++) {
        const row = rows[i];
        const email = getField(row, "email").toLowerCase();
        if (!email || !email.includes("@")) {
          errors.push({ row: i + 1, reason: `Invalid email: "${getField(row, "email")}"` });
          continue;
        }
        if (seenEmails.has(email)) continue;
        seenEmails.add(email);

        toUpsert.push({
          email,
          first_name: getField(row, "first_name") || null,
          last_name: getField(row, "last_name") || null,
          company_name: getField(row, "company_name") || null,
          website: getField(row, "website") || null,
          phone: getField(row, "phone") || null,
          state_name: getField(row, "state_name") || null,
          country: getField(row, "country") || null,
          source_type: getField(row, "source_type") || "import",
          lead_status: getField(row, "lead_status") || "new",
          tags: normalizeTags(getField(row, "tags")),
          notes: getField(row, "notes") || null,
          updated_at: new Date().toISOString(),
        });
      }

      // Upsert in batches of 100
      const BATCH = 100;
      let inserted = 0;
      let updated = 0;

      // Get existing emails to track insert vs update
      const emailList = toUpsert.map(r => r.email);
      const { data: existingData } = await supabase
        .from("em_contacts")
        .select("email")
        .in("email", emailList);
      const existingEmailSet = new Set((existingData ?? []).map((r: any) => r.email.toLowerCase()));

      for (let i = 0; i < toUpsert.length; i += BATCH) {
        const batch = toUpsert.slice(i, i + BATCH);
        const { error: upsertErr } = await supabase
          .from("em_contacts")
          .upsert(batch, { onConflict: "email" });
        if (upsertErr) {
          errors.push({ row: i, reason: upsertErr.message });
          continue;
        }
        for (const r of batch) {
          if (existingEmailSet.has(r.email)) updated++;
          else inserted++;
        }
      }

      const skipped = rows.length - toUpsert.length;

      // Write import job log
      await supabase.from("email_import_jobs").insert({
        filename,
        status: "imported",
        total_rows: rows.length,
        inserted_count: inserted,
        updated_count: updated,
        skipped_count: skipped + errors.length,
        errors: errors.slice(0, 50),
      });

      await writeAuditLog({
        actor_session_type: auth.sessionType ?? "unknown",
        action: "contacts_import",
        target_table: "em_contacts",
        payload_hash: await hashPayload({ filename, total: rows.length, inserted, updated }),
        ip,
        status: "success",
      });

      return json({
        ok: true,
        total_rows: rows.length,
        inserted_count: inserted,
        updated_count: updated,
        skipped_count: skipped,
        error_count: errors.length,
        errors: errors.slice(0, 20),
      });
    }

    // ── QUICK SEND ─────────────────────────────────────────────
    // POST send/quick
    // Body: { contact_ids?, to_emails?, template_id, subject_override?, from_name?, dry_run? }
    if (path === "send/quick" && method === "POST") {
      const body = await req.json();
      const {
        contact_ids = [],
        to_emails = [],
        template_id,
        subject_override,
        from_name = "Gappsy",
        dry_run = false,
      } = body;

      if (!template_id) return err("template_id is required", 400, "VALIDATION_ERROR");

      const MAX_QUICK_SEND = 25;
      if (contact_ids.length + to_emails.length > MAX_QUICK_SEND) {
        return err(`Quick send is limited to ${MAX_QUICK_SEND} recipients. Use campaigns for bulk sends.`, 400, "LIMIT_EXCEEDED");
      }

      // Fetch template
      const { data: template, error: tplErr } = await supabase
        .from("em_templates")
        .select("*")
        .eq("id", template_id)
        .maybeSingle();
      if (tplErr || !template) return err("Template not found", 404, "NOT_FOUND");

      // Resolve contacts from IDs
      let recipientContacts: any[] = [];
      if (contact_ids.length > 0) {
        const { data: contacts } = await supabase
          .from("em_contacts")
          .select("id,email,first_name,last_name,company_name,state_name,website")
          .in("id", contact_ids);
        recipientContacts = contacts ?? [];
      }

      // Add bare emails as minimal contact objects
      for (const email of to_emails) {
        if (!recipientContacts.some((c: any) => c.email === email)) {
          recipientContacts.push({ id: null, email, first_name: null, last_name: null, company_name: null, state_name: null });
        }
      }

      if (recipientContacts.length === 0) {
        return err("No valid recipients", 400, "VALIDATION_ERROR");
      }

      // Check suppression
      const { data: suppressed } = await supabase.from("em_suppression").select("email");
      const suppressedEmails = new Set((suppressed ?? []).map((s: any) => s.email.toLowerCase()));
      const filtered = recipientContacts.filter((c: any) => !suppressedEmails.has(c.email.toLowerCase()));

      if (dry_run) {
        return json({
          ok: true,
          dry_run: true,
          would_send_to: filtered.map((c: any) => c.email),
          suppressed: recipientContacts.length - filtered.length,
          template_name: template.name,
          subject: subject_override ?? template.subject_template,
        });
      }

      const results: { email: string; status: string; message_id?: string; error?: string }[] = [];
      const fromEmail = Deno.env.get("SMTP_FROM_SUPPORT") ?? "noreply@gappsy.com";
      const now = new Date().toISOString();

      for (const contact of filtered) {
        const vars: Record<string, string> = {
          first_name: contact.first_name ?? "",
          last_name: contact.last_name ?? "",
          full_name: [contact.first_name, contact.last_name].filter(Boolean).join(" "),
          company_name: contact.company_name ?? "",
          state_name: contact.state_name ?? "",
          website: contact.website ?? "",
          email: contact.email,
          unsubscribe_url: `https://www.gappsy.com/em/unsub?email=${encodeURIComponent(contact.email)}`,
        };

        const bodyHtml = renderBlocksToHtml(template.body_json?.blocks ?? [], vars);
        const subject = renderTemplate(subject_override ?? template.subject_template, vars);

        // Create em_messages row (queued -> sent/failed)
        const { data: msgRow } = await supabase.from("em_messages").insert({
          contact_id: contact.id ?? null,
          template_id,
          subject_rendered: subject,
          body_html_rendered: bodyHtml,
          to_email: contact.email,
          from_name,
          from_email: fromEmail,
          status: "queued",
          scheduled_for: now,
        }).select("id").single();

        const messageId: string | null = msgRow?.id ?? null;

        const sendResult = await sendEmail({
          to: contact.email,
          subject,
          html: bodyHtml,
          from: `${from_name} <${fromEmail}>`,
        });

        const logStatus = sendResult.success ? "sent" : "failed";
        results.push({ email: contact.email, status: logStatus, message_id: messageId ?? undefined, ...(sendResult.error ? { error: sendResult.error } : {}) });

        // Update em_messages with final status
        if (messageId) {
          await supabase.from("em_messages").update({
            status: logStatus,
            sent_at: sendResult.success ? now : null,
            error: sendResult.success ? null : sendResult.error,
            error_code: sendResult.success ? null : "SEND_FAILED",
          }).eq("id", messageId);
        }

        // Log to email_send_logs (legacy, keep for SMTP page compatibility)
        await supabase.from("email_send_logs").insert({
          to_email: contact.email,
          template_id,
          subject,
          status: logStatus,
          error_code: sendResult.success ? null : "SEND_FAILED",
          error_message: sendResult.success ? null : sendResult.error,
          provider_message: sendResult.success ? "sent" : null,
          request_id: messageId ?? crypto.randomUUID(),
        });

        // Write funnel event for email_sent
        if (contact.id) {
          await supabase.from("em_funnel_events").insert({
            contact_id: contact.id,
            event_type: "email_sent",
            message_id: messageId,
            meta: { subject, status: logStatus, template_id },
          });
          if (sendResult.success) {
            await supabase.from("em_contacts").update({ last_action_at: now, updated_at: now }).eq("id", contact.id);
          }
        }
      }

      const sentCount = results.filter(r => r.status === "sent").length;
      const failedCount = results.filter(r => r.status === "failed").length;

      await writeAuditLog({
        actor_session_type: auth.sessionType ?? "unknown",
        action: "quick_send",
        target_table: "email_send_logs",
        payload_hash: await hashPayload({ template_id, recipients: filtered.map((c: any) => c.email), sentCount }),
        ip,
        status: sentCount > 0 ? "success" : "error",
      });

      return json({
        ok: sentCount > 0 || filtered.length === 0,
        sent_count: sentCount,
        failed_count: failedCount,
        suppressed_count: recipientContacts.length - filtered.length,
        results,
      });
    }

    // ── UNSUBSCRIBE ────────────────────────────────────────────
    // POST contacts/unsubscribe  Body: { email, message_id? }
    if (path === "contacts/unsubscribe" && method === "POST") {
      const body = await req.json();
      const { email, message_id } = body;
      if (!email) return err("email required");
      const now = new Date().toISOString();
      const normalizedEmail = email.toLowerCase().trim();

      // Mark contact unsubscribed_at
      const { data: contact } = await supabase
        .from("em_contacts")
        .update({ unsubscribed_at: now, updated_at: now })
        .eq("email", normalizedEmail)
        .select("id")
        .maybeSingle();

      // Add to suppression list
      await supabase.from("em_suppression").upsert(
        { email: normalizedEmail, reason: "unsubscribed" },
        { onConflict: "email" }
      );

      // Write funnel event
      if (contact?.id) {
        await supabase.from("em_funnel_events").insert({
          contact_id: contact.id,
          event_type: "unsubscribed",
          message_id: message_id ?? null,
          meta: { email: normalizedEmail },
        });
      }

      // Write em_events for the message if provided
      if (message_id) {
        await supabase.from("em_events").insert({
          message_id,
          contact_id: contact?.id ?? null,
          event_type: "unsub",
          meta: { email: normalizedEmail },
        });
      }

      return json({ ok: true, unsubscribed: true, email: normalizedEmail });
    }

    // ── CONTACT TIMELINE ───────────────────────────────────────
    // GET contacts/:id/timeline
    if (path.match(/^contacts\/([^/]+)\/timeline$/) && method === "GET") {
      const contactId = path.split("/")[1];
      const [funnel, messages] = await Promise.all([
        supabase.from("em_funnel_events").select("*").eq("contact_id", contactId).order("created_at", { ascending: false }).limit(100),
        supabase.from("em_messages").select("id,subject_rendered,status,sent_at,error,error_code,campaign_id").eq("contact_id", contactId).order("created_at", { ascending: false }).limit(50),
      ]);

      const messageIds = (messages.data ?? []).map((m: any) => m.id);
      let emailEvents: any[] = [];
      if (messageIds.length > 0) {
        const { data: evData } = await supabase
          .from("em_events")
          .select("id,message_id,event_type,url,created_at")
          .in("message_id", messageIds)
          .order("created_at", { ascending: false })
          .limit(200);
        emailEvents = evData ?? [];
      }

      // Build unified timeline entries
      const timeline: any[] = [];
      for (const f of (funnel.data ?? [])) {
        timeline.push({ id: f.id, kind: "funnel", type: f.event_type, meta: f.meta, message_id: f.message_id, created_at: f.created_at });
      }
      for (const e of emailEvents) {
        timeline.push({ id: e.id, kind: "email_event", type: e.event_type, url: e.url, message_id: e.message_id, created_at: e.created_at });
      }
      timeline.sort((a, b) => new Date(b.created_at).getTime() - new Date(a.created_at).getTime());

      return json({ ok: true, timeline, messages: messages.data ?? [] });
    }

    // ── CONTACT UPSERT from form submission ───────────────────
    if (path === "contact-ingest" && method === "POST") {
      const body = await req.json();
      const { email, first_name, last_name, company_name, state_name, source_type = "other", source_id, event_type = "form_submitted", product_key, form_type, meta = {} } = body;
      if (!email) return err("email required");
      const { data: contact, error: upsertErr } = await supabase.from("em_contacts").upsert(
        { email: email.toLowerCase().trim(), first_name, last_name, company_name, state_name, source_type, source_id, last_action_at: new Date().toISOString(), updated_at: new Date().toISOString() },
        { onConflict: "email" }
      ).select().single();
      if (upsertErr) return err(upsertErr.message, 500);
      if (contact?.id) {
        await supabase.from("em_funnel_events").insert({ contact_id: contact.id, event_type, product_key, form_type, state_name, meta });
      }
      return json({ ok: true, contact_id: contact?.id });
    }

    return err("Not found", 404, "NOT_FOUND");
  } catch (e: any) {
    console.error("[email-marketing-api]", e);
    return err(e.message ?? "Internal server error", 500, "INTERNAL_ERROR");
  }
});
