import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { requireAdminSession } from "../_shared/adminSession.ts";

const CORS = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "GET, PATCH, POST, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey, x-admin-token",
};

function json(data: unknown, status = 200) {
  return new Response(JSON.stringify(data), {
    status,
    headers: { ...CORS, "Content-Type": "application/json" },
  });
}

// ── Default empty enrichment ──────────────────────────────────────────────────

const EMPTY_ENRICHMENT = {
  is_known: false,
  person_type: "unknown",
  agencies: [],
  customer: null,
  orders: [],
  total_paid_usd: 0,
  active_subscription: null,
  prior_messages_count: 0,
  prior_messages: [],
};

// ── Enrich sender identity ────────────────────────────────────────────────────

async function enrichSender(supabase: any, emailNorm: string) {
  try {
    // Step 1: fetch customer IDs separately to avoid invalid .in(subquery) pattern
    let customerIds: string[] = [];
    try {
      const { data: custData } = await supabase
        .from("stripe_customers")
        .select("customer_id, name, email, created_at")
        .ilike("email", emailNorm)
        .limit(1);
      customerIds = (custData ?? []).map((c: any) => c.customer_id).filter(Boolean);
    } catch { /* ignore */ }

    const results = await Promise.allSettled([
      // 1. Agency via email lookup
      supabase
        .from("other_agency_emails")
        .select("agency_id, email_normalized, other_agencies(id, name, slug, state_slug, website_url, email)")
        .eq("email_normalized", emailNorm)
        .limit(5),

      // 2. Stripe customer (already fetched above, re-query for consistency)
      supabase
        .from("stripe_customers")
        .select("customer_id, name, email, created_at")
        .ilike("email", emailNorm)
        .limit(1),

      // 3. Stripe orders
      supabase
        .from("stripe_orders")
        .select("id, amount_total, currency, payment_status, status, created_at, product_summary, state_slug, agency_name, agency_id, subscription_id")
        .ilike("customer_email", emailNorm)
        .order("created_at", { ascending: false })
        .limit(5),

      // 4. Stripe subscriptions — use resolved array of customer IDs, not a subquery builder
      customerIds.length > 0
        ? supabase
            .from("stripe_subscriptions")
            .select("subscription_id, status, current_period_end, cancel_at_period_end, created_at")
            .in("customer_id", customerIds)
            .order("created_at", { ascending: false })
            .limit(3)
        : Promise.resolve({ data: [], error: null }),

      // 5. Prior contact messages (thread)
      supabase
        .from("contact_messages")
        .select("id, created_at, subject, status, outbound_reply_count")
        .eq("email_normalized", emailNorm)
        .order("created_at", { ascending: false })
        .limit(10),
    ]);

    const agencyRows = results[0].status === "fulfilled" ? (results[0].value.data ?? []) : [];
    const custRows   = results[1].status === "fulfilled" ? (results[1].value.data ?? []) : [];
    const orderRows  = results[2].status === "fulfilled" ? (results[2].value.data ?? []) : [];
    const subRows    = results[3].status === "fulfilled" ? (results[3].value.data ?? []) : [];
    const priorMsgs  = results[4].status === "fulfilled" ? (results[4].value.data ?? []) : [];

    const agencies = agencyRows
      .filter((r: any) => r.other_agencies)
      .map((r: any) => {
        const ag = r.other_agencies;
        return { id: ag.id, name: ag.name, slug: ag.slug, state_slug: ag.state_slug, website_url: ag.website_url };
      });

    const customer = custRows[0] ?? null;

    const totalPaid = orderRows.reduce((sum: number, o: any) => {
      if (o.payment_status === "paid") sum += (o.amount_total ?? 0) / 100;
      return sum;
    }, 0);

    const activeSubscription = subRows.find((s: any) =>
      s.status === "active" || s.status === "trialing"
    ) ?? null;

    const isKnown = agencies.length > 0 || !!customer || orderRows.length > 0;

    let personType = "unknown";
    if (agencies.length > 0 && orderRows.some((o: any) => o.payment_status === "paid")) {
      personType = "agency_customer";
    } else if (orderRows.some((o: any) => o.payment_status === "paid")) {
      personType = "customer";
    } else if (agencies.length > 0) {
      personType = "agency";
    } else if (customer) {
      personType = "lead";
    }

    return {
      is_known: isKnown,
      person_type: personType,
      agencies,
      customer,
      orders: orderRows,
      total_paid_usd: Math.round(totalPaid * 100) / 100,
      active_subscription: activeSubscription,
      prior_messages_count: priorMsgs.length,
      prior_messages: priorMsgs,
    };
  } catch (err) {
    console.error("[contact-inbox-admin] enrichSender failed:", err instanceof Error ? err.message : String(err));
    return { ...EMPTY_ENRICHMENT };
  }
}

// ── Handlers ─────────────────────────────────────────────────────────────────

async function handleList(supabase: any, url: URL) {
  const page    = Math.max(1, parseInt(url.searchParams.get("page") ?? "1"));
  const limit   = Math.min(50, Math.max(1, parseInt(url.searchParams.get("limit") ?? "25")));
  const status  = url.searchParams.get("status") ?? null;
  const search  = url.searchParams.get("search") ?? null;
  const offset  = (page - 1) * limit;

  let query = supabase
    .from("contact_messages")
    .select("id, created_at, full_name, email, subject, message, status, category, outbound_reply_count, page_path, country_name, email_normalized", { count: "exact" })
    .order("created_at", { ascending: false })
    .range(offset, offset + limit - 1);

  if (status && status !== "all") query = query.eq("status", status);
  if (search) {
    query = query.or(
      `full_name.ilike.%${search}%,email.ilike.%${search}%,subject.ilike.%${search}%`
    );
  }

  const { data, error, count } = await query;
  if (error) throw error;

  const rows = (data ?? []).map((m: any) => ({
    ...m,
    preview: m.message?.substring(0, 120).replace(/\n/g, " ") ?? "",
  }));

  return json({ ok: true, messages: rows, total: count ?? 0, page, limit });
}

async function handleDetail(supabase: any, url: URL) {
  const id = url.searchParams.get("id");
  if (!id) return json({ ok: false, error: "id required" }, 400);

  const { data: msg, error } = await supabase
    .from("contact_messages")
    .select("*")
    .eq("id", id)
    .maybeSingle();

  if (error) throw error;
  if (!msg) return json({ ok: false, error: "Not found" }, 404);

  const emailNorm = msg.email_normalized ?? msg.email?.toLowerCase().trim() ?? "";

  const [enrichResult, repliesResult, threadResult] = await Promise.allSettled([
    enrichSender(supabase, emailNorm),
    supabase
      .from("contact_message_replies")
      .select("*")
      .eq("thread_key", emailNorm)
      .order("sent_at", { ascending: true }),
    supabase
      .from("contact_messages")
      .select("id, created_at, subject, message, status, outbound_reply_count, page_url, page_path")
      .eq("email_normalized", emailNorm)
      .neq("id", id)
      .order("created_at", { ascending: false })
      .limit(10),
  ]);

  const enrichment = enrichResult.status === "fulfilled" ? enrichResult.value : { ...EMPTY_ENRICHMENT };
  const replies = repliesResult.status === "fulfilled" ? (repliesResult.value.data ?? []) : [];
  const thread_messages = threadResult.status === "fulfilled" ? (threadResult.value.data ?? []) : [];

  const partial_failure = enrichResult.status === "rejected" || repliesResult.status === "rejected" || threadResult.status === "rejected";

  return json({
    ok: true,
    message: msg,
    enrichment,
    replies,
    thread_messages,
    partial_failure,
  });
}

async function handleStatusUpdate(supabase: any, body: any) {
  const { id, status } = body;
  if (!id || !status) return json({ ok: false, error: "id and status required" }, 400);

  const allowed = ["new", "open", "replied", "closed", "spam"];
  if (!allowed.includes(status)) return json({ ok: false, error: "Invalid status" }, 400);

  const { error } = await supabase
    .from("contact_messages")
    .update({ status, handled: status === "closed", handled_at: status === "closed" ? new Date().toISOString() : null })
    .eq("id", id);

  if (error) throw error;
  return json({ ok: true });
}

async function handleNotesUpdate(supabase: any, body: any) {
  const { id, internal_notes, category, assigned_to } = body;
  if (!id) return json({ ok: false, error: "id required" }, 400);

  const patch: Record<string, unknown> = {};
  if (internal_notes !== undefined) patch.internal_notes = internal_notes;
  if (category !== undefined)       patch.category       = category;
  if (assigned_to !== undefined)    patch.assigned_to    = assigned_to;

  const { error } = await supabase.from("contact_messages").update(patch).eq("id", id);
  if (error) throw error;
  return json({ ok: true });
}

async function handleStatusCounts(supabase: any) {
  const { data, error } = await supabase
    .from("contact_messages")
    .select("status");

  if (error) throw error;

  const counts: Record<string, number> = { all: 0, new: 0, open: 0, replied: 0, closed: 0, spam: 0 };
  for (const row of data ?? []) {
    counts.all++;
    const s = row.status ?? "new";
    counts[s] = (counts[s] ?? 0) + 1;
  }
  return json({ ok: true, counts });
}

// ── Main ──────────────────────────────────────────────────────────────────────

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
      if (action === "counts") return await handleStatusCounts(supabase);
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
    console.error("[contact-inbox-admin] error:", message);
    return json({ ok: false, error: message }, message.includes("Unauthorized") ? 401 : 500);
  }
});
