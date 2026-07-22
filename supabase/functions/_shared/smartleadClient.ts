const BASE_URL = "https://server.smartlead.ai/api/v1";

function apiKey(): string {
  const key = Deno.env.get("SMARTLEAD_API_KEY");
  if (!key) throw new Error("SMARTLEAD_API_KEY not configured");
  return key;
}

function buildUrl(path: string, params: Record<string, string> = {}): string {
  const url = new URL(`${BASE_URL}${path}`);
  url.searchParams.set("api_key", apiKey());
  for (const [k, v] of Object.entries(params)) {
    url.searchParams.set(k, v);
  }
  return url.toString();
}

async function apiFetch(path: string, params: Record<string, string> = {}): Promise<unknown> {
  const url = buildUrl(path, params);
  console.log(`[smartleadClient] GET ${path} status=pending`);
  const res = await fetch(url, {
    headers: { "Content-Type": "application/json" },
  });
  console.log(`[smartleadClient] GET ${path} status=${res.status}`);
  if (!res.ok) {
    const body = await res.text().catch(() => "");
    throw new Error(`Smartlead API ${path} returned ${res.status}: ${body.slice(0, 200)}`);
  }
  return res.json();
}

async function apiPost(path: string, body: unknown): Promise<unknown> {
  const url = buildUrl(path);
  console.log(`[smartleadClient] POST ${path} status=pending`);
  const res = await fetch(url, {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(body),
  });
  console.log(`[smartleadClient] POST ${path} status=${res.status}`);
  if (!res.ok) {
    const text = await res.text().catch(() => "");
    throw new Error(`Smartlead API ${path} returned ${res.status}: ${text.slice(0, 200)}`);
  }
  return res.json();
}

export function firstNumber(...values: unknown[]): number | undefined {
  for (const v of values) {
    if (typeof v === "number" && Number.isFinite(v)) return v;
    if (typeof v === "string" && v.trim() !== "" && !Number.isNaN(Number(v))) {
      return Number(v);
    }
  }
  return undefined;
}

function safeGet(obj: unknown, key: string): unknown {
  if (obj && typeof obj === "object" && key in (obj as Record<string, unknown>)) {
    return (obj as Record<string, unknown>)[key];
  }
  return undefined;
}

function isObject(v: unknown): v is Record<string, unknown> {
  return v !== null && typeof v === "object" && !Array.isArray(v);
}

function collectAllNestedContainers(raw: unknown): Record<string, unknown>[] {
  const containers: Record<string, unknown>[] = [];
  if (!isObject(raw)) return containers;

  containers.push(raw);

  const nestedPaths = [
    "data", "report", "stats", "analytics", "summary", "statistics",
    "campaign", "result", "response", "metrics", "campaign_stats",
    "email_stats", "lead_stats", "campaign_report", "campaign_analytics"
  ];

  for (const p of nestedPaths) {
    const nested = safeGet(raw, p);
    if (isObject(nested)) {
      containers.push(nested);
      for (const p2 of nestedPaths) {
        const nested2 = safeGet(nested, p2);
        if (isObject(nested2)) {
          containers.push(nested2);
        }
      }
    }
  }

  return containers;
}

function firstNumberFromContainers(containers: Record<string, unknown>[], keys: string[]): number | undefined {
  for (const container of containers) {
    for (const key of keys) {
      const val = safeGet(container, key);
      const num = firstNumber(val);
      if (num !== undefined) return num;
    }
  }
  return undefined;
}

function collectAllKeys(containers: Record<string, unknown>[]): string[] {
  const allKeys = new Set<string>();
  containers.forEach((c, idx) => {
    Object.keys(c).forEach(k => {
      allKeys.add(idx === 0 ? k : `nested.${k}`);
    });
  });
  return Array.from(allKeys);
}

function logResponseShape(label: string, raw: unknown): void {
  if (!isObject(raw)) {
    console.log(`[smartleadClient] ${label} response is not an object: ${typeof raw}`);
    return;
  }

  const topKeys = Object.keys(raw);
  console.log(`[smartleadClient] ${label} top-level keys: ${JSON.stringify(topKeys)}`);

  const containers = collectAllNestedContainers(raw);
  console.log(`[smartleadClient] ${label} found ${containers.length} nested containers`);

  const allKeys = collectAllKeys(containers);
  const statsRelated = allKeys.filter(k =>
    /sent|open|click|repl|bounce|deliver|lead|total|stats|report|analytics|email|unique|count|positive|interest/i.test(k)
  );
  if (statsRelated.length > 0) {
    console.log(`[smartleadClient] ${label} stats-related keys: ${JSON.stringify(statsRelated)}`);
  }

  for (const key of statsRelated.slice(0, 20)) {
    const cleanKey = key.replace("nested.", "");
    for (const c of containers) {
      const val = safeGet(c, cleanKey);
      if (val !== undefined) {
        console.log(`[smartleadClient] ${label} ${key} = ${JSON.stringify(val)}`);
        break;
      }
    }
  }

  const sanitized: Record<string, unknown> = {};
  for (const key of topKeys.slice(0, 30)) {
    const val = safeGet(raw, key);
    if (typeof val === "number" || typeof val === "string" || typeof val === "boolean" || val === null) {
      sanitized[key] = val;
    } else if (isObject(val)) {
      sanitized[key] = `{object with ${Object.keys(val).length} keys: ${Object.keys(val).slice(0, 5).join(", ")}...}`;
    } else if (Array.isArray(val)) {
      sanitized[key] = `[array with ${val.length} items]`;
    }
  }
  console.log(`[smartleadClient] ${label} sanitized shape: ${JSON.stringify(sanitized)}`);
}

export interface SmartleadCampaign {
  id: number;
  name: string;
  status: string;
  created_at: string;
  updated_at?: string;
  [key: string]: unknown;
}

export interface SmartleadCampaignStats {
  leads_total?: number;
  sent?: number;
  delivered?: number;
  opens?: number;
  clicks?: number;
  replies?: number;
  bounces?: number;
  unsubscribed?: number;
  positive_reply?: number;
  sender_bounced?: number;
  raw_keys: string[];
  extraction_notes: string[];
}

export interface NormalizedCampaignWithStats extends SmartleadCampaign {
  provider_sent?: number;
  provider_opened?: number;
  provider_replied?: number;
  provider_positive_reply?: number;
  provider_bounced?: number;
  provider_sender_bounced?: number;
  provider_leads_total?: number;
  provider_stats_source?: string;
}

const LEADS_KEYS = [
  "total_leads", "leads_count", "leads_total", "totalLeads", "total",
  "lead_count", "total_contacts", "contacts_count", "total_prospects",
  "prospects_count", "leadCount", "totalLeadsCount", "all_leads",
  "total_lead_count", "uploaded_leads", "campaign_leads"
];

const SENT_KEYS = [
  "sent_count", "emails_sent", "sent", "total_sent", "totalSent",
  "email_sent_count", "total_emails_sent", "total_sent_count",
  "total_sent_emails", "emails_sent_count", "sent_email_count",
  "sentCount", "total_sent_mail", "email_sent", "emailsSent",
  "sent_emails", "totalSentCount", "all_sent", "sequence_sent"
];

const DELIVERED_KEYS = [
  "delivered_count", "delivered", "emails_delivered", "totalDelivered",
  "total_delivered", "deliveredCount", "total_delivered_count",
  "emails_delivered_count", "total_emails_delivered"
];

const OPENS_KEYS = [
  "open_count", "unique_opens", "opens", "emails_opened", "opened",
  "total_opens", "totalOpens", "unique_opened", "email_open_count",
  "opened_count", "total_opened", "total_opened_count", "unique_open_count",
  "openCount", "openedCount", "total_unique_opens", "email_opens",
  "emailsOpened", "all_opens", "sequence_opens"
];

const CLICKS_KEYS = [
  "click_count", "unique_clicks", "clicks", "emails_clicked", "clicked",
  "total_clicks", "totalClicks", "email_click_count", "clicked_count",
  "total_clicked", "clickCount", "clickedCount", "total_unique_clicks",
  "link_clicks", "email_clicks"
];

const REPLIES_KEYS = [
  "reply_count", "replies", "emails_replied", "replied",
  "total_replies", "totalReplies", "email_reply_count", "unique_replied",
  "total_replied", "total_reply_count", "replied_count", "replyCount",
  "totalRepliesCount", "replied_email_count", "email_replies",
  "emailsReplied", "all_replies", "sequence_replies"
];

const BOUNCES_KEYS = [
  "bounce_count", "bounces", "emails_bounced", "bounced",
  "total_bounces", "totalBounces", "email_bounce_count", "bounced_count",
  "total_bounced", "total_bounce_count", "hard_bounced", "bouncedCount",
  "total_hard_bounces", "email_bounces", "all_bounces", "sequence_bounces"
];

const UNSUBSCRIBED_KEYS = [
  "unsubscribe_count", "unsubscribed", "emails_unsubscribed",
  "total_unsubscribed", "totalUnsubscribed", "unsubscribed_count",
  "total_unsubscribe_count", "opt_outs", "optouts", "unsubscribes"
];

const POSITIVE_REPLY_KEYS = [
  "positive_reply", "positive_replies", "positive_reply_count",
  "positiveReply", "positive_reply_rate", "positiveCount",
  "positive_replies_count", "interested_count", "opportunities",
  "positiveReplies", "interested", "positive", "interested_leads"
];

const SENDER_BOUNCED_KEYS = [
  "sender_bounced", "sender_bounce", "sender_bounce_count",
  "senderBounced", "senderBounceCount", "mailbox_bounced",
  "mailbox_bounce_count", "account_bounced", "sending_account_bounced"
];

export function extractCampaignStats(raw: unknown): SmartleadCampaignStats {
  const notes: string[] = [];

  if (!isObject(raw)) {
    notes.push("Input is not an object");
    return { raw_keys: [], extraction_notes: notes };
  }

  const containers = collectAllNestedContainers(raw);
  const allKeys = collectAllKeys(containers);

  notes.push(`Found ${containers.length} containers with ${allKeys.length} total keys`);

  const stats: SmartleadCampaignStats = {
    leads_total: firstNumberFromContainers(containers, LEADS_KEYS),
    sent: firstNumberFromContainers(containers, SENT_KEYS),
    delivered: firstNumberFromContainers(containers, DELIVERED_KEYS),
    opens: firstNumberFromContainers(containers, OPENS_KEYS),
    clicks: firstNumberFromContainers(containers, CLICKS_KEYS),
    replies: firstNumberFromContainers(containers, REPLIES_KEYS),
    bounces: firstNumberFromContainers(containers, BOUNCES_KEYS),
    unsubscribed: firstNumberFromContainers(containers, UNSUBSCRIBED_KEYS),
    positive_reply: firstNumberFromContainers(containers, POSITIVE_REPLY_KEYS),
    sender_bounced: firstNumberFromContainers(containers, SENDER_BOUNCED_KEYS),
    raw_keys: allKeys,
    extraction_notes: notes,
  };

  const foundMetrics = Object.entries(stats)
    .filter(([k, v]) => k !== "raw_keys" && k !== "extraction_notes" && v !== undefined)
    .map(([k]) => k);

  if (foundMetrics.length > 0) {
    notes.push(`Extracted metrics: ${foundMetrics.join(", ")}`);
  } else {
    notes.push("No recognized metrics found in response");
  }

  return stats;
}

export function normalizeCampaignWithStats(
  campaign: SmartleadCampaign,
  statsSource?: string
): NormalizedCampaignWithStats {
  const stats = extractCampaignStats(campaign as unknown);
  return {
    ...campaign,
    provider_sent: stats.sent,
    provider_opened: stats.opens,
    provider_replied: stats.replies,
    provider_positive_reply: stats.positive_reply,
    provider_bounced: stats.bounces,
    provider_sender_bounced: stats.sender_bounced,
    provider_leads_total: stats.leads_total,
    provider_stats_source: statsSource ?? "campaign_object",
  };
}

export async function listCampaigns(): Promise<SmartleadCampaign[]> {
  const response = await apiFetch("/campaigns");

  logResponseShape("listCampaigns", response);

  let campaigns: SmartleadCampaign[] = [];
  if (Array.isArray(response)) {
    campaigns = response as SmartleadCampaign[];
  } else if (isObject(response)) {
    const data = safeGet(response, "data");
    if (Array.isArray(data)) {
      campaigns = data as SmartleadCampaign[];
    } else if (Array.isArray(safeGet(response, "campaigns"))) {
      campaigns = safeGet(response, "campaigns") as SmartleadCampaign[];
    }
  }

  if (campaigns.length > 0) {
    console.log(`[smartleadClient] listCampaigns returned ${campaigns.length} campaigns`);
    logResponseShape("listCampaigns[0]", campaigns[0]);
  }

  return campaigns;
}

export async function getCampaign(campaignId: string): Promise<SmartleadCampaign | null> {
  const response = await apiFetch(`/campaigns/${campaignId}`);

  logResponseShape(`getCampaign(${campaignId})`, response);

  if (!isObject(response)) return null;

  const data = safeGet(response, "data");
  if (isObject(data) && Object.keys(data).length > 0) {
    return data as SmartleadCampaign;
  }

  if (Object.keys(response).length > 0) {
    return response as SmartleadCampaign;
  }

  return null;
}

export async function getCampaignAnalytics(campaignId: string): Promise<SmartleadCampaignStats> {
  const response = await apiFetch(`/campaigns/${campaignId}/analytics`);

  logResponseShape(`getCampaignAnalytics(${campaignId})`, response);

  let normalized: unknown = response;

  if (Array.isArray(response) && response.length > 0) {
    const merged: Record<string, unknown> = {};
    for (const item of response as Record<string, unknown>[]) {
      if (isObject(item)) {
        for (const [k, v] of Object.entries(item)) {
          if (typeof v === "number") {
            merged[k] = (typeof merged[k] === "number" ? (merged[k] as number) : 0) + v;
          } else if (merged[k] === undefined) {
            merged[k] = v;
          }
        }
      }
    }
    console.log(`[smartleadClient] getCampaignAnalytics(${campaignId}) merged ${response.length} array items: ${JSON.stringify(Object.keys(merged))}`);
    normalized = merged;
  }

  const stats = extractCampaignStats(normalized);
  console.log(`[smartleadClient] getCampaignAnalytics(${campaignId}) extracted: ${JSON.stringify(
    Object.entries(stats).filter(([k, v]) => k !== "raw_keys" && k !== "extraction_notes" && v !== undefined)
  )}`);
  return stats;
}

export async function getCampaignStatistics(campaignId: string): Promise<SmartleadCampaignStats> {
  const response = await apiFetch(`/campaigns/${campaignId}/statistics`);

  logResponseShape(`getCampaignStatistics(${campaignId})`, response);

  return extractCampaignStats(response);
}

export async function getCampaignLeadStats(campaignId: string): Promise<SmartleadCampaignStats> {
  const response = await apiFetch(`/campaigns/${campaignId}/lead-stats`);

  logResponseShape(`getCampaignLeadStats(${campaignId})`, response);

  return extractCampaignStats(response);
}

export interface SmartleadLead {
  email: string;
  first_name?: string;
  last_name?: string;
  company_name?: string;
  website?: string;
  phone_number?: string;
  custom_fields?: Record<string, unknown>;
}

export interface AddLeadsResult {
  ok: boolean;
  upload_count?: number;
  total_leads?: number;
  duplicate_count?: number;
  invalid_email_count?: number;
  already_added_to_campaign?: number;
  invalid_emails?: string[];
  raw: unknown;
}

// Never previously defined here despite being imported elsewhere
// (smartlead-sync-eligible-contacts) — that import was dead code, always
// throwing at module load. Matches Smartlead's actual documented "Add
// Leads to Campaign" endpoint: POST /campaigns/{id}/leads with
// { lead_list, settings }.
export async function addLeadsToCampaign(campaignId: string, leads: SmartleadLead[]): Promise<AddLeadsResult> {
  const response = await apiPost(`/campaigns/${campaignId}/leads`, {
    lead_list: leads,
    settings: {
      ignore_global_block_list: false,
      ignore_unsubscribe_list: false,
      ignore_community_bounce_list: false,
      ignore_duplicate_leads_in_other_campaign: false,
    },
  });

  logResponseShape(`addLeadsToCampaign(${campaignId})`, response);

  if (!isObject(response)) {
    return { ok: false, raw: response };
  }

  return {
    ok: response.ok === true || response.success === true || typeof safeGet(response, "upload_count") === "number",
    upload_count: firstNumber(safeGet(response, "upload_count")),
    total_leads: firstNumber(safeGet(response, "total_leads")),
    duplicate_count: firstNumber(safeGet(response, "duplicate_count")),
    invalid_email_count: firstNumber(safeGet(response, "invalid_email_count")),
    already_added_to_campaign: firstNumber(safeGet(response, "already_added_to_campaign")),
    invalid_emails: Array.isArray(safeGet(response, "invalid_emails")) ? (safeGet(response, "invalid_emails") as string[]) : undefined,
    raw: response,
  };
}

export async function startCampaign(campaignId: string): Promise<boolean> {
  const response = await apiPost(`/campaigns/${campaignId}/status`, { status: "START" });
  if (!isObject(response)) return false;
  return response.ok === true || response.success === true;
}

export async function pauseCampaign(campaignId: string): Promise<boolean> {
  const response = await apiPost(`/campaigns/${campaignId}/status`, { status: "PAUSED" });
  if (!isObject(response)) return false;
  return response.ok === true || response.success === true;
}

export async function resumeCampaign(campaignId: string): Promise<boolean> {
  const response = await apiPost(`/campaigns/${campaignId}/status`, { status: "ACTIVE" });
  if (!isObject(response)) return false;
  return response.ok === true || response.success === true;
}
