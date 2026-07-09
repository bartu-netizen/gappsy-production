import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { requireAdminSession, CORS_HEADERS } from "../_shared/adminSession.ts";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "GET, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey",
};

interface ContactRow {
  other_agency_email_id: string;
  agency_id: string;
  agency_name: string;
  state_slug: string;
  email_normalized: string;
  validation_status: string;
  outreach_status: string;
  outreach_count: number;
  last_outreach_at: string | null;
  synced_to_campaign: boolean;
  smartlead_lead_id: string | null;
  events_summary: {
    opens: number;
    clicks: number;
    replies: number;
    bounces: number;
    unsubscribed: number;
    last_event_type: string | null;
    last_event_at: string | null;
  };
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: corsHeaders });
  }

  try {
    const authResult = await requireAdminSession(req);
    if (authResult instanceof Response) return authResult;

    const supabase = createClient(
      Deno.env.get("SUPABASE_URL") || "",
      Deno.env.get("SUPABASE_SERVICE_ROLE_KEY") || ""
    );

    const url = new URL(req.url);
    const campaignId = url.searchParams.get("campaign_id") || undefined;
    const state = url.searchParams.get("state") || undefined;
    const q = url.searchParams.get("q") || undefined;
    const status = url.searchParams.get("status") || undefined;
    const page = parseInt(url.searchParams.get("page") || "1", 10);
    const pageSize = Math.min(parseInt(url.searchParams.get("page_size") || "50", 10), 100);
    const offset = (page - 1) * pageSize;

    // Fix CORS headers to include x-admin-token
    const responseCorsHeaders = {
      ...corsHeaders,
      "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey, x-admin-token",
    };

    let emailQuery = supabase
      .from("other_agency_emails")
      .select(
        `
        id,
        agency_id,
        email_normalized,
        validation_status,
        outreach_status,
        outreach_count,
        last_outreach_at,
        other_agencies(id, name, state_slug)
      `,
        { count: "exact" }
      );

    if (state) {
      emailQuery = emailQuery.eq("other_agencies.state_slug", state);
    }

    if (q) {
      emailQuery = emailQuery.or(
        `email_normalized.ilike.%${q}%,other_agencies.name.ilike.%${q}%`
      );
    }

    if (status) {
      if (status === "synced_to_smartlead") {
        emailQuery = emailQuery.not("smartlead_lead_id", "is", null);
      } else if (status === "replied") {
        emailQuery = emailQuery.eq("outreach_status", "replied");
      } else if (status === "opened") {
        emailQuery = emailQuery.eq("outreach_status", "opened");
      } else if (status === "clicked") {
        emailQuery = emailQuery.eq("outreach_status", "clicked");
      } else if (status === "bounced") {
        emailQuery = emailQuery.eq("outreach_status", "bounced");
      } else if (status === "opted_out") {
        emailQuery = emailQuery.eq("outreach_status", "opted_out");
      } else if (status === "blocked") {
        emailQuery = emailQuery.eq("outreach_status", "blocked");
      }
    }

    emailQuery = emailQuery.range(offset, offset + pageSize - 1);

    const { data: emailRows, count: totalCount, error: emailError } = await emailQuery;

    if (emailError) throw emailError;

    if (!Array.isArray(emailRows) || emailRows.length === 0) {
      return new Response(
        JSON.stringify({
          ok: true,
          rows: [],
          pagination: { page, page_size: pageSize, total: 0, total_pages: 0 },
        }),
        { status: 200, headers: { ...corsHeaders, "Content-Type": "application/json" } }
      );
    }

    const emailIds = emailRows.map((e: any) => e.id);
    const normalizedEmails = new Set(emailRows.map((e: any) => e.email_normalized));

    let syncQuery = supabase
      .from("smartlead_campaign_email_sync")
      .select("other_agency_email_id, smartlead_lead_id")
      .in("other_agency_email_id", emailIds);

    if (campaignId) {
      syncQuery = syncQuery.eq("campaign_id", campaignId);
    }

    const { data: syncedEmails = [] } = await syncQuery;
    const syncedEmailIds = new Set(syncedEmails.map((s: any) => s.other_agency_email_id));
    const emailToLeadId = new Map<string, string>();
    syncedEmails.forEach((s: any) => {
      if (s.smartlead_lead_id) {
        emailToLeadId.set(s.other_agency_email_id, s.smartlead_lead_id);
      }
    });

    let eventQuery = supabase
      .from("smartlead_webhook_events")
      .select("smartlead_lead_id, email_normalized, event_type, received_at")
      .in("email_normalized", Array.from(normalizedEmails));

    if (campaignId) {
      eventQuery = eventQuery.eq("campaign_id", campaignId);
    }

    const { data: webhookEvents = [] } = await eventQuery;

    // Map webhook events by email_normalized, then cross-reference with email IDs
    const eventsByEmailNormalized = new Map<string, any[]>();
    webhookEvents.forEach((event: any) => {
      const emailNorm = event.email_normalized || "";
      if (!eventsByEmailNormalized.has(emailNorm)) {
        eventsByEmailNormalized.set(emailNorm, []);
      }
      eventsByEmailNormalized.get(emailNorm)!.push(event);
    });

    const rows: ContactRow[] = emailRows.map((email: any) => {
      const agency = email.other_agencies || {};
      const events = eventsByEmailNormalized.get(email.email_normalized) || [];
      const smartleadLeadId = emailToLeadId.get(email.id);

      const eventCounts = {
        opens: 0,
        clicks: 0,
        replies: 0,
        bounces: 0,
        unsubscribed: 0,
      };

      let lastEventType: string | null = null;
      let lastEventAt: string | null = null;

      events.forEach((e: any) => {
        switch (e.event_type) {
          case "opened":
            eventCounts.opens += 1;
            break;
          case "clicked":
            eventCounts.clicks += 1;
            break;
          case "replied":
            eventCounts.replies += 1;
            break;
          case "bounced":
            eventCounts.bounces += 1;
            break;
          case "unsubscribed":
            eventCounts.unsubscribed += 1;
            break;
        }

        if (!lastEventAt || e.received_at > lastEventAt) {
          lastEventAt = e.received_at;
          lastEventType = e.event_type;
        }
      });

      return {
        other_agency_email_id: email.id,
        agency_id: email.agency_id,
        agency_name: agency.name || "Unknown",
        state_slug: agency.state_slug || "",
        email_normalized: email.email_normalized || "",
        validation_status: email.validation_status || "pending",
        outreach_status: email.outreach_status || "pending",
        outreach_count: email.outreach_count || 0,
        last_outreach_at: email.last_outreach_at,
        synced_to_campaign: syncedEmailIds.has(email.id),
        smartlead_lead_id: smartleadLeadId || null,
        events_summary: {
          opens: eventCounts.opens,
          clicks: eventCounts.clicks,
          replies: eventCounts.replies,
          bounces: eventCounts.bounces,
          unsubscribed: eventCounts.unsubscribed,
          last_event_type: lastEventType,
          last_event_at: lastEventAt,
        },
      };
    });

    const totalPages = Math.ceil((totalCount || 0) / pageSize);

    return new Response(
      JSON.stringify({
        ok: true,
        rows,
        pagination: {
          page,
          page_size: pageSize,
          total: totalCount,
          total_pages: totalPages,
        },
      }),
      { status: 200, headers: { ...responseCorsHeaders, "Content-Type": "application/json" } }
    );
  } catch (error) {
    const message = error instanceof Error ? error.message : String(error);
    console.error("smartlead-contact-activity error:", message);

    return new Response(
      JSON.stringify({
        ok: false,
        error: message,
      }),
      {
        status: 500,
        headers: { ...responseCorsHeaders, "Content-Type": "application/json" },
      }
    );
  }
});
