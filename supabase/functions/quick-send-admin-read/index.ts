import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { authenticateAdmin, createAuthErrorResponse } from "../_shared/adminAuth.ts";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "GET, POST, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey, x-admin-token, x-admin-secret",
};

function jsonResp(status: number, body: unknown): Response {
  return new Response(JSON.stringify(body), {
    status,
    headers: { ...corsHeaders, "Content-Type": "application/json" },
  });
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: corsHeaders });
  }

  const auth = await authenticateAdmin(req);
  if (!auth.success) {
    return createAuthErrorResponse(auth, corsHeaders);
  }

  const supabaseUrl = Deno.env.get("SUPABASE_URL")!;
  const serviceRole = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!;

  if (!supabaseUrl || !serviceRole) {
    return jsonResp(500, { error: "Server configuration error" });
  }

  const supabase = createClient(supabaseUrl, serviceRole, {
    auth: { persistSession: false },
  });

  const url = new URL(req.url);
  const pathParts = url.pathname.replace(/\/+$/, "").split("/").filter(Boolean);

  const messagesIdx = pathParts.indexOf("messages");
  const messageId = messagesIdx !== -1 ? pathParts[messagesIdx + 1] || "" : "";
  const sub = messagesIdx !== -1 ? pathParts[messagesIdx + 2] || "" : "";

  const action = url.searchParams.get("action") || sub || "message";

  if (!messageId) {
    if (action === "list") {
      const { data: messages, error: msgErr } = await supabase
        .from("email_messages")
        .select("id, to_email, to_name, subject, status, sent_at, created_at, tracking_enabled, tracking_pixel_url")
        .eq("kind", "quick_send")
        .order("created_at", { ascending: false })
        .limit(200);

      if (msgErr) return jsonResp(500, { error: msgErr.message });

      const msgs = messages || [];
      if (msgs.length === 0) return jsonResp(200, { messages: [] });

      const ids = msgs.map((m) => m.id);
      const { data: events } = await supabase
        .from("email_events")
        .select("email_message_id, event_type")
        .in("email_message_id", ids);

      const openCounts: Record<string, number> = {};
      const clickCounts: Record<string, number> = {};
      (events || []).forEach((e) => {
        if (e.event_type === "open") openCounts[e.email_message_id] = (openCounts[e.email_message_id] || 0) + 1;
        else if (e.event_type === "click") clickCounts[e.email_message_id] = (clickCounts[e.email_message_id] || 0) + 1;
      });

      return jsonResp(200, {
        messages: msgs.map((m) => ({
          ...m,
          opens_count: openCounts[m.id] > 0 ? 1 : 0,
          opens_total: openCounts[m.id] || 0,
          clicks_count: clickCounts[m.id] > 0 ? 1 : 0,
          clicks_total: clickCounts[m.id] || 0,
        })),
      });
    }
    return jsonResp(400, { error: "Missing message ID" });
  }

  const uuidRe = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i;
  if (!uuidRe.test(messageId)) {
    return jsonResp(400, { error: "Invalid message ID format", received: messageId });
  }

  try {
    if (action === "events") {
      const { data, error } = await supabase
        .from("email_events")
        .select("id, event_type, occurred_at, url, user_agent, ip_hash")
        .eq("email_message_id", messageId)
        .order("occurred_at", { ascending: true });

      if (error) return jsonResp(500, { error: error.message, code: error.code });
      return jsonResp(200, { events: data || [] });
    }

    if (action === "stats") {
      const { data: evData, error: evErr } = await supabase
        .from("email_events")
        .select("id, event_type, occurred_at, url, ip_hash")
        .eq("email_message_id", messageId);

      if (evErr) return jsonResp(500, { error: evErr.message });

      const evs = evData || [];
      const opens = evs.filter((e) => e.event_type === "open");
      const clicks = evs.filter((e) => e.event_type === "click");

      // For a single-recipient quick send, unique = 0 or 1
      const openUnique = opens.length > 0 ? 1 : 0;
      const clickUnique = clicks.length > 0 ? 1 : 0;

      const opensSorted = [...opens].sort((a, b) => new Date(b.occurred_at).getTime() - new Date(a.occurred_at).getTime());
      const clicksSorted = [...clicks].sort((a, b) => new Date(b.occurred_at).getTime() - new Date(a.occurred_at).getTime());

      const byUrl: Record<string, { url: string; count: number; last_clicked_at: string }> = {};
      clicks.forEach((e) => {
        const u = e.url || "(unknown)";
        if (!byUrl[u]) byUrl[u] = { url: u, count: 0, last_clicked_at: e.occurred_at };
        byUrl[u].count++;
        if (new Date(e.occurred_at) > new Date(byUrl[u].last_clicked_at)) byUrl[u].last_clicked_at = e.occurred_at;
      });

      const opensByHour: Record<number, number> = {};
      opens.forEach((e) => { const h = new Date(e.occurred_at).getUTCHours(); opensByHour[h] = (opensByHour[h] || 0) + 1; });

      const clicksByHour: Record<number, number> = {};
      clicks.forEach((e) => { const h = new Date(e.occurred_at).getUTCHours(); clicksByHour[h] = (clicksByHour[h] || 0) + 1; });

      return jsonResp(200, {
        delivered_count: 1,
        open_total: opens.length,
        open_unique: openUnique,
        click_total: clicks.length,
        click_unique: clickUnique,
        last_open_at: opensSorted[0]?.occurred_at || null,
        last_click_at: clicksSorted[0]?.occurred_at || null,
        clicks_by_url: Object.values(byUrl).sort((a, b) => b.count - a.count),
        opens_by_hour: Object.entries(opensByHour).map(([h, c]) => ({ hour: parseInt(h), count: c })),
        clicks_by_hour: Object.entries(clicksByHour).map(([h, c]) => ({ hour: parseInt(h), count: c })),
      });
    }

    const { data: msg, error: msgErr } = await supabase
      .from("email_messages")
      .select("id, kind, to_email, to_name, subject, from_name, from_email, reply_to, status, provider_message_id, sent_at, delivered_at, created_at, updated_at, html_body, text_body, final_body_html, tracking_pixel_url, tracking_enabled")
      .eq("id", messageId)
      .maybeSingle();

    if (msgErr) return jsonResp(500, { error: msgErr.message, code: msgErr.code });
    if (!msg) return jsonResp(404, { error: "Message not found", id: messageId });

    const bodyPreview = msg.html_body
      ? msg.html_body.replace(/<[^>]+>/g, " ").replace(/\s+/g, " ").trim().substring(0, 200)
      : "";

    return jsonResp(200, { ...msg, body_preview: bodyPreview });

  } catch (err) {
    console.error("[quick-send-admin-read] error:", err);
    return jsonResp(502, { error: err instanceof Error ? err.message : String(err) });
  }
});
