import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2";
import {
  authenticateAdmin,
  createAuthErrorResponse,
  writeAuditLog,
  getRequestMeta,
} from "../_shared/adminAuth.ts";
import { loadIntentScores } from "../_shared/agencyIntentScores.ts";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "GET, PATCH, POST, OPTIONS",
  "Access-Control-Allow-Headers":
    "Content-Type, Authorization, X-Client-Info, Apikey, x-admin-token, x-admin-secret",
};

function json(data: unknown, status = 200) {
  return new Response(JSON.stringify(data), {
    status,
    headers: { ...corsHeaders, "Content-Type": "application/json" },
  });
}

const ALLOWED_UPDATE_FIELDS = new Set([
  "website_url",
  "services",
  "is_active",
  "paid_override_active",
  "paid_override_value",
  "paid_override_reason",
  "paid_override_updated_by",
  "showcase_pinned",
  "showcase_position",
  "showcase_updated_by",
]);

const BULK_OPS = new Set([
  "add_badge",
  "remove_badge",
  "set_active",
  "set_inactive",
  "set_paid_override",
  "clear_paid_override",
]);

const LIST_SELECT = [
  "id",
  "name",
  "slug",
  "state_slug",
  "email",
  "website_url",
  "is_paid_listing",
  "paid_listing_type",
  "is_active",
  "services",
  "paid_override_active",
  "paid_override_value",
  "paid_override_reason",
  "paid_override_updated_at",
  "paid_override_updated_by",
  "has_card_visual_upgrade",
  "city",
  "maps_url",
  "showcase_pinned",
  "showcase_position",
  "showcase_updated_at",
  "showcase_updated_by",
  "updated_at",
  "created_at",
].join(", ");

// Returns the set of agency IDs that have at least one confirmed Stripe order.
// Used to verify whether is_paid_listing=true has real purchase backing.
async function fetchConfirmedStripeIds(
  supabase: ReturnType<typeof createClient>,
  agencyIds: string[],
): Promise<Set<string>> {
  if (agencyIds.length === 0) return new Set();
  const { data } = await supabase
    .from("stripe_orders")
    .select("agency_id")
    .eq("payment_status", "paid")
    .in("agency_id", agencyIds);
  const ids = new Set<string>();
  for (const row of data || []) {
    if (row.agency_id) ids.add(row.agency_id as string);
  }
  return ids;
}

// Returns the authoritative set of other_agencies.id values that are
// Standard Paid ($97) for the given state.
//
// Matches the logic in get_other_agencies_stats (DB RPC) exactly so the
// summary card, table filter, showcase, and Step B ranking all agree.
//
// Resolution (either path qualifies an agency as Standard Paid):
//   Path 1: agency_listings.paid_active=true AND listing_tier='standard'
//   Path 2: is_paid_listing=true AND EXISTS stripe_orders WHERE payment_status='paid'
//
// is_paid_listing alone (without a stripe_orders row) does NOT qualify.
// This prevents webhook-flagged rows with no purchase from appearing as paid.
async function fetchStandardPaidIds(
  supabase: ReturnType<typeof createClient>,
  stateSlug: string,
): Promise<Set<string>> {
  const ids = new Set<string>();

  // Path 1: agency_listings activation-backed
  const { data: listingData } = await supabase
    .from("agency_listings")
    .select("agency_id")
    .eq("state_slug", stateSlug)
    .eq("paid_active", true)
    .eq("listing_tier", "standard");

  for (const row of listingData || []) {
    if (row.agency_id) ids.add(row.agency_id as string);
  }

  // Path 2: is_paid_listing=true backed by a confirmed Stripe order.
  // Exclude paid_listing_type='top25': Top 25 purchases are a different product
  // and must NOT appear under the Other Agencies Standard Paid ($97) filter.
  const { data: paidFlagAgencies } = await supabase
    .from("other_agencies")
    .select("id")
    .eq("state_slug", stateSlug)
    .eq("is_paid_listing", true)
    .or("paid_listing_type.is.null,paid_listing_type.neq.top25");

  const paidFlagIds = (paidFlagAgencies || []).map((a) => a.id as string).filter(Boolean);

  if (paidFlagIds.length > 0) {
    const { data: stripeData } = await supabase
      .from("stripe_orders")
      .select("agency_id")
      .eq("payment_status", "paid")
      .in("agency_id", paidFlagIds);

    for (const row of stripeData || []) {
      if (row.agency_id) ids.add(row.agency_id as string);
    }
  }

  return ids;
}

function computePaidSourceReason(row: Record<string, unknown>): string {
  if (row.paid_override_active === true) {
    return row.paid_override_value === true ? "manual_override_paid" : "manual_override_unpaid";
  }
  if (row.is_paid_listing === true && row.has_confirmed_stripe_order === true) {
    return "stripe_confirmed";
  }
  if (row.standard_paid_active === true) {
    return "agency_listing_active";
  }
  if (row.is_paid_listing === true) {
    return "is_paid_listing_no_stripe";
  }
  return "none";
}

// Computes effective paid IDs for a state, combining agency_listings standard
// paid with admin overrides from other_agencies.paid_override_*.
// Returns { paidIds, unpaidIds, stdPaidIds } where stdPaidIds is the raw set.
async function fetchEffectivePaidPartitions(
  supabase: ReturnType<typeof createClient>,
  stateSlug: string,
): Promise<{
  paidIds: string[];
  unpaidIds: string[];
  stdPaidIds: Set<string>;
}> {
  const [stdPaidIds, overrideRes, allIdsRes] = await Promise.all([
    fetchStandardPaidIds(supabase, stateSlug),
    supabase
      .from("other_agencies")
      .select("id, paid_override_active, paid_override_value")
      .eq("state_slug", stateSlug)
      .eq("paid_override_active", true),
    supabase
      .from("other_agencies")
      .select("id")
      .eq("state_slug", stateSlug),
  ]);

  const overridePaid = new Set<string>();
  const overrideUnpaid = new Set<string>();
  for (const row of overrideRes.data || []) {
    if (row.paid_override_value === true) overridePaid.add(row.id);
    else if (row.paid_override_value === false) overrideUnpaid.add(row.id);
  }

  const paidIds: string[] = [];
  const unpaidIds: string[] = [];
  for (const row of allIdsRes.data || []) {
    let isPaid: boolean;
    if (overridePaid.has(row.id)) {
      isPaid = true;
    } else if (overrideUnpaid.has(row.id)) {
      isPaid = false;
    } else {
      isPaid = stdPaidIds.has(row.id);
    }
    if (isPaid) paidIds.push(row.id);
    else unpaidIds.push(row.id);
  }

  return { paidIds, unpaidIds, stdPaidIds };
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: corsHeaders });
  }

  try {
    const authResult = await authenticateAdmin(req);
    if (!authResult.success) {
      return createAuthErrorResponse(authResult, corsHeaders);
    }

    const supabaseUrl = Deno.env.get("SUPABASE_URL");
    const serviceKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");
    if (!supabaseUrl || !serviceKey) {
      return json({ error: "Server config error" }, 500);
    }

    const supabase = createClient(supabaseUrl, serviceKey, {
      auth: { autoRefreshToken: false, persistSession: false },
    });

    const url = new URL(req.url);
    const method = req.method;

    // ── GET ────────────────────────────────────────────────────────────────────
    if (method === "GET") {
      const action = url.searchParams.get("action") || "list";
      const stateSlug = url.searchParams.get("state_slug") || "";

      // Summary stats for a state (requires state_slug)
      // Uses the get_other_agencies_stats RPC which computes exact uncapped
      // aggregates via SQL COUNT, respecting the current search + filter context.
      if (action === "summary") {
        if (!stateSlug) {
          return json({ error: "state_slug is required for summary action" }, 400);
        }
        const summarySearch = url.searchParams.get("search") || "";
        const summaryFilter = url.searchParams.get("filter") || "all";

        const { data: stats, error: rpcErr } = await supabase.rpc(
          "get_other_agencies_stats",
          {
            p_state_slug: stateSlug,
            p_search: summarySearch,
            p_filter: summaryFilter,
          },
        );

        if (rpcErr) throw rpcErr;
        return json(stats || {});
      }

      // Paginated list
      const search = url.searchParams.get("search") || "";
      const filter = url.searchParams.get("filter") || "all";
      const page = Math.max(0, parseInt(url.searchParams.get("page") || "0"));
      const pageSize = Math.min(
        Math.max(1, parseInt(url.searchParams.get("page_size") || "25")),
        100,
      );

      // Global search mode: if no state selected, search across all states
      const globalMode = !stateSlug || stateSlug.trim() === "";

      // For paid/unpaid filters, compute effective paid IDs up front.
      //
      // IMPORTANT: we must NOT use fetchEffectivePaidPartitions here because it
      // fetches ALL agency IDs for the state via allIdsRes, which is capped at
      // PostgREST's default 1000-row limit.  For states like NJ with thousands
      // of agencies the paid agencies may fall outside that window → paidIds=[]
      // → table returns 0.
      //
      // Instead we compute paid IDs directly:
      //   Step 1: fetchStandardPaidIds (only fetches paid-flag + stripe rows — tiny)
      //   Step 2: fetch override rows (typically < 10 per state)
      //   Step 3: apply overrides to get the final effective paid set
      //
      // For the unpaid filter we invert with NOT IN (paid set) in SQL so we never
      // need to enumerate all agency IDs at all.
      let resolvedStdPaidIds: Set<string> | null = null;
      let effectivePaidIds: string[] | null = null;

      if (filter === "paid" || filter === "unpaid") {
        if (!globalMode) {
          const [stdPaidIds, overrideRes] = await Promise.all([
            fetchStandardPaidIds(supabase, stateSlug),
            supabase
              .from("other_agencies")
              .select("id, paid_override_value")
              .eq("state_slug", stateSlug)
              .eq("paid_override_active", true),
          ]);

          const overridePaid = new Set<string>();
          const overrideUnpaid = new Set<string>();
          for (const row of overrideRes.data || []) {
            if (row.paid_override_value === true)  overridePaid.add(row.id as string);
            else if (row.paid_override_value === false) overrideUnpaid.add(row.id as string);
          }

          // effective paid = (stdPaid ∪ overridePaid) ∖ overrideUnpaid
          const effectivePaidSet = new Set<string>(stdPaidIds);
          for (const id of overridePaid)  effectivePaidSet.add(id);
          for (const id of overrideUnpaid) effectivePaidSet.delete(id);

          effectivePaidIds = Array.from(effectivePaidSet);
          resolvedStdPaidIds = stdPaidIds;
        }
      }

      let query = supabase
        .from("other_agencies")
        .select(LIST_SELECT, { count: "exact" });

      // Only filter by state if state is provided
      if (!globalMode) {
        query = query.eq("state_slug", stateSlug);
      }

      // Enhanced search: use linked emails when searching
      if (search.trim()) {
        const s = search.trim();
        const normalizedSearch = s.toLowerCase().trim();

        // Check if this looks like an email search
        const looksLikeEmail = s.includes("@");

        if (looksLikeEmail) {
          // Search in other_agency_emails table (linked emails)
          const { data: emailMatches } = await supabase
            .from("other_agency_emails")
            .select("agency_id")
            .eq("email_normalized", normalizedSearch)
            .eq("exclude_from_agency_lookup", false);

          const matchedAgencyIds = new Set<string>();
          if (emailMatches && emailMatches.length > 0) {
            for (const match of emailMatches) {
              if (match.agency_id) matchedAgencyIds.add(match.agency_id);
            }
          }

          if (matchedAgencyIds.size > 0) {
            // Found matches via linked emails - use those IDs
            query = query.in("id", Array.from(matchedAgencyIds));
          } else {
            // No linked email matches - fall back to legacy field search
            query = query.or(
              `name.ilike.%${s}%,email.ilike.%${s}%,website_url.ilike.%${s}%`,
            );
          }
        } else {
          // Not an email search - use name/website search
          query = query.or(
            `name.ilike.%${s}%,email.ilike.%${s}%,website_url.ilike.%${s}%`,
          );
        }
      }

      if (filter === "paid") {
        if (effectivePaidIds && effectivePaidIds.length > 0) {
          query = query.in("id", effectivePaidIds);
        } else {
          // No paid agencies — return empty result set via sentinel UUID
          query = query.eq("id", "00000000-0000-0000-0000-000000000000");
        }
      } else if (filter === "unpaid") {
        if (effectivePaidIds && effectivePaidIds.length > 0) {
          // Invert the paid set — no need to enumerate all agency IDs
          query = query.not("id", "in", `(${effectivePaidIds.join(",")})`);
        }
        // If effectivePaidIds is empty, all agencies are unpaid — no extra filter
      } else if (filter === "active") {
        query = query.eq("is_active", true);
      } else if (filter === "inactive") {
        query = query.eq("is_active", false);
      } else if (filter === "missing_website") {
        query = query.or("website_url.is.null,website_url.eq.");
      } else if (filter === "has_badges") {
        query = query.not("services", "is", null);
      } else if (filter === "no_badges") {
        query = query.is("services", null);
      } else if (filter === "overridden") {
        query = query.eq("paid_override_active", true);
      } else if (filter === "showcase_pinned") {
        query = query.eq("showcase_pinned", true);
      } else if (filter === "showcase_not_pinned") {
        query = query.eq("showcase_pinned", false);
      }

      const { data, error: listErr, count } = await query
        .order("name", { ascending: true })
        .range(page * pageSize, (page + 1) * pageSize - 1);

      if (listErr) throw listErr;

      // Attach standard_paid_active to each row (raw agency_listings lookup, no override).
      // The frontend's effectivePaid() applies paid_override_* on top of this field.
      let agencies: Record<string, unknown>[] = [];

      if (globalMode) {
        // Global mode: compute standard_paid_active per state
        // Group agencies by state for efficient paid lookup
        const byState = new Map<string, Array<{ row: Record<string, unknown>; idx: number }>>();
        (data || []).forEach((row, idx) => {
          const state = row.state_slug as string;
          if (!byState.has(state)) byState.set(state, []);
          byState.get(state)!.push({ row, idx });
        });

        // Initialize agencies array with standard_paid_active = false
        agencies = (data || []).map((row) => ({
          ...row,
          standard_paid_active: false,
          has_confirmed_stripe_order: false,
        }));

        // Lookup paid status per state
        for (const [state, entries] of byState) {
          const stdPaidIds = await fetchStandardPaidIds(supabase, state);
          for (const { row, idx } of entries) {
            agencies[idx] = {
              ...row,
              standard_paid_active: stdPaidIds.has(row.id as string),
              has_confirmed_stripe_order: false,
            };
          }
        }

        // Batch stripe check for this page
        const allIds = agencies.map((a) => a.id as string).filter(Boolean);
        const stripeIds = await fetchConfirmedStripeIds(supabase, allIds);
        agencies = agencies.map((a) => {
          const withStripe = { ...a, has_confirmed_stripe_order: stripeIds.has(a.id as string) };
          return { ...withStripe, paid_source_reason: computePaidSourceReason(withStripe) };
        });
      } else {
        // State mode: fetch once for the state
        if (!resolvedStdPaidIds) {
          resolvedStdPaidIds = await fetchStandardPaidIds(supabase, stateSlug);
        }

        agencies = (data || []).map((row: Record<string, unknown>) => ({
          ...row,
          standard_paid_active: resolvedStdPaidIds!.has(row.id as string),
          has_confirmed_stripe_order: false,
        }));

        // Batch stripe check for this page
        const pageIds = agencies.map((a) => a.id as string).filter(Boolean);
        const stripeIds = await fetchConfirmedStripeIds(supabase, pageIds);
        agencies = agencies.map((a) => {
          const withStripe = { ...a, has_confirmed_stripe_order: stripeIds.has(a.id as string) };
          return { ...withStripe, paid_source_reason: computePaidSourceReason(withStripe) };
        });
      }

      // ── Intent score overlay (state mode only) ──────────────────────────────
      // Merges canonical activity_score (v1) from compute_agency_intent_scores
      // into each agency row so the admin table shows the SAME score used by
      // the live state page ranking.  Global mode is skipped to avoid N-state
      // RPC fan-out on paginated cross-state queries.
      if (!globalMode && stateSlug) {
        const scores = await loadIntentScores(supabase, stateSlug);
        if (scores.size > 0) {
          agencies = agencies.map((a) => {
            const s = scores.get(a.id as string);
            return s
              ? { ...a, activity_score: s.activity_score, deepest_step: s.deepest_step }
              : { ...a, activity_score: null, deepest_step: null };
          });
        }
      }

      return json({
        agencies,
        total: count || 0,
        page,
        page_size: pageSize,
        total_pages: Math.ceil((count || 0) / pageSize),
      });
    }

    // ── PATCH (single agency update) ──────────────────────────────────────────
    if (method === "PATCH") {
      let body: Record<string, unknown>;
      try {
        body = await req.json();
      } catch {
        return json({ error: "Invalid JSON body" }, 400);
      }

      const { id, ...fields } = body as { id: string; [k: string]: unknown };
      if (!id) return json({ error: "id is required" }, 400);

      const isShowcaseChange =
        fields.showcase_pinned !== undefined ||
        fields.showcase_position !== undefined;

      // Non-showcase fields (website_url, services, paid_override_*, etc.)
      const nonShowcasePayload: Record<string, unknown> = {};
      for (const [key, value] of Object.entries(fields)) {
        if (
          ALLOWED_UPDATE_FIELDS.has(key) &&
          key !== "showcase_pinned" &&
          key !== "showcase_position" &&
          key !== "showcase_updated_by"
        ) {
          nonShowcasePayload[key] = value;
        }
      }

      if (
        nonShowcasePayload.paid_override_active !== undefined ||
        nonShowcasePayload.paid_override_value !== undefined
      ) {
        nonShowcasePayload.paid_override_updated_at = new Date().toISOString();
      }

      if (Object.keys(nonShowcasePayload).length === 0 && !isShowcaseChange) {
        return json({ error: "No valid fields to update" }, 400);
      }

      let displaced: Record<string, unknown> | null = null;

      // ── Showcase slot change — transactional via DB RPCs ───────────────────
      if (isShowcaseChange) {
        const newPinned = fields.showcase_pinned as boolean | undefined;
        const newPosition = fields.showcase_position as number | null | undefined;
        const updatedBy = (fields.showcase_updated_by as string) || "admin";

        if (newPinned === false) {
          // Unpin cleanly
          const { error: rpcErr } = await supabase.rpc("unpin_showcase_slot", {
            p_agency_id: id,
            p_updated_by: updatedBy,
          });
          if (rpcErr) {
            console.error("[showcase] unpin_showcase_slot error:", rpcErr);
            throw new Error(`Failed to unpin showcase slot: ${rpcErr.message}`);
          }
        } else if (newPinned === true && newPosition != null) {
          // Assign slot — positions 1–12 use claim_showcase_slot (with displacement),
          // positions 13+ use a direct DB update (extended overflow pins, no displacement).
          const pos = Number(newPosition);
          if (!Number.isInteger(pos) || pos < 1) {
            return json({ error: "showcase_position must be a positive integer" }, 400);
          }

          if (pos <= 12) {
            // ── Standard showcase slots 1–12: atomic claim with displacement ────
            const { data: agencyRow, error: lookupErr } = await supabase
              .from("other_agencies")
              .select("state_slug, name")
              .eq("id", id)
              .maybeSingle();

            if (lookupErr) throw lookupErr;
            if (!agencyRow) return json({ error: "Agency not found" }, 404);

            const stateSlug = agencyRow.state_slug as string;

            // Capture current occupant BEFORE claiming so we can inform the UI
            const { data: currentOccupant } = await supabase
              .from("other_agencies")
              .select("id, name, showcase_position")
              .eq("state_slug", stateSlug)
              .eq("showcase_position", pos)
              .eq("showcase_pinned", true)
              .neq("id", id)
              .maybeSingle();

            // Atomically transfer slot ownership
            const { error: claimErr } = await supabase.rpc("claim_showcase_slot", {
              p_agency_id: id,
              p_state_slug: stateSlug,
              p_slot: pos,
              p_updated_by: updatedBy,
            });

            if (claimErr) {
              console.error("[showcase] claim_showcase_slot error:", claimErr);
              throw new Error(`Failed to claim showcase slot: ${claimErr.message}`);
            }

            if (currentOccupant) {
              displaced = {
                id: currentOccupant.id,
                name: currentOccupant.name,
                previous_slot: currentOccupant.showcase_position,
              };
              console.log(
                `[showcase] Slot ${pos} in ${stateSlug}: displaced "${currentOccupant.name}" → assigned "${agencyRow.name}"`,
              );
            }
          } else {
            // ── Extended overflow pins 13+: direct DB update, no displacement ───
            const { error: updateErr } = await supabase
              .from("other_agencies")
              .update({
                showcase_pinned: true,
                showcase_position: pos,
                showcase_updated_at: new Date().toISOString(),
                showcase_updated_by: updatedBy,
                updated_at: new Date().toISOString(),
              })
              .eq("id", id);

            if (updateErr) {
              console.error("[showcase] extended pin update error:", updateErr);
              throw new Error(`Failed to pin at extended position ${pos}: ${updateErr.message}`);
            }
            console.log(`[showcase] Extended pin: agency ${id} → slot ${pos}`);
          }
        } else {
          // showcase_pinned = true but no position — set pinned flag, clear position
          const { error: updateErr } = await supabase
            .from("other_agencies")
            .update({
              showcase_pinned: true,
              showcase_position: null,
              showcase_updated_at: new Date().toISOString(),
              showcase_updated_by: (fields.showcase_updated_by as string) || "admin",
              updated_at: new Date().toISOString(),
            })
            .eq("id", id);
          if (updateErr) throw updateErr;
        }
      }

      // ── Apply non-showcase field updates ───────────────────────────────────
      if (Object.keys(nonShowcasePayload).length > 0) {
        nonShowcasePayload.updated_at = new Date().toISOString();
        const { error: updateErr } = await supabase
          .from("other_agencies")
          .update(nonShowcasePayload)
          .eq("id", id);
        if (updateErr) throw updateErr;
      }

      // ── Fetch fresh row to return authoritative state ──────────────────────
      const { data: freshRow, error: fetchErr } = await supabase
        .from("other_agencies")
        .select(LIST_SELECT)
        .eq("id", id)
        .maybeSingle();

      if (fetchErr) throw fetchErr;
      if (!freshRow) return json({ error: "Agency not found after update" }, 404);

      const stdPaidIds = await fetchStandardPaidIds(supabase, freshRow.state_slug as string);
      const agencyWithPaidStatus = {
        ...freshRow,
        standard_paid_active: stdPaidIds.has(freshRow.id as string),
      };

      const { ip, userAgent } = getRequestMeta(req);
      await writeAuditLog({
        actor_session_type: authResult.sessionType || "unknown",
        action: "other_agency_manager_update",
        target_table: "other_agencies",
        target_id: id,
        ip,
        user_agent: userAgent,
        status: "success",
      });

      return json({ ok: true, agency: agencyWithPaidStatus, displaced });
    }

    // ── POST (bulk actions) ───────────────────────────────────────────────────
    if (method === "POST") {
      let body: Record<string, unknown>;
      try {
        body = await req.json();
      } catch {
        return json({ error: "Invalid JSON body" }, 400);
      }

      const { action, ids, operation } = body as {
        action: string;
        ids: string[];
        operation: Record<string, unknown>;
      };

      if (action !== "bulk") return json({ error: "Unknown action" }, 400);
      if (!Array.isArray(ids) || ids.length === 0) {
        return json({ error: "ids must be a non-empty array" }, 400);
      }
      if (!operation?.type || !BULK_OPS.has(operation.type as string)) {
        return json({ error: `Unknown operation type: ${operation?.type}` }, 400);
      }

      const { data: agencies, error: fetchErr } = await supabase
        .from("other_agencies")
        .select("id, services, is_active, paid_override_active, paid_override_value")
        .in("id", ids);

      if (fetchErr) throw fetchErr;

      const errors: string[] = [];
      let updated = 0;

      for (const agency of agencies || []) {
        const patch: Record<string, unknown> = {
          updated_at: new Date().toISOString(),
        };

        const opType = operation.type as string;

        if (opType === "add_badge") {
          const badge = operation.badge as string;
          if (!badge) continue;
          const existing = (agency.services as string[]) || [];
          if (existing.includes(badge)) continue;
          patch.services = [...existing, badge];
        } else if (opType === "remove_badge") {
          const badge = operation.badge as string;
          if (!badge) continue;
          patch.services = ((agency.services as string[]) || []).filter(
            (s: string) => s !== badge,
          );
        } else if (opType === "set_active") {
          patch.is_active = true;
        } else if (opType === "set_inactive") {
          patch.is_active = false;
        } else if (opType === "set_paid_override") {
          patch.paid_override_active = true;
          patch.paid_override_value = operation.paid_override_value as boolean;
          patch.paid_override_reason =
            (operation.paid_override_reason as string) || "bulk_admin_override";
          patch.paid_override_updated_at = new Date().toISOString();
          patch.paid_override_updated_by =
            (operation.paid_override_updated_by as string) ||
            authResult.sessionType ||
            "admin";
        } else if (opType === "clear_paid_override") {
          patch.paid_override_active = false;
          patch.paid_override_value = null;
          patch.paid_override_reason = null;
          patch.paid_override_updated_at = new Date().toISOString();
          patch.paid_override_updated_by =
            authResult.sessionType || "admin";
        }

        const { error: patchErr } = await supabase
          .from("other_agencies")
          .update(patch)
          .eq("id", agency.id);

        if (patchErr) {
          errors.push(`${agency.id}: ${patchErr.message}`);
        } else {
          updated++;
        }
      }

      const { ip, userAgent } = getRequestMeta(req);
      await writeAuditLog({
        actor_session_type: authResult.sessionType || "unknown",
        action: `other_agency_bulk_${operation.type}`,
        target_table: "other_agencies",
        ip,
        user_agent: userAgent,
        status: errors.length === 0 ? "success" : "error",
      });

      return json({ ok: true, updated, errors });
    }

    return json({ error: "Method not allowed" }, 405);
  } catch (e) {
    console.error("[other-agencies-manager-api] Error:", e);
    return json(
      { error: e instanceof Error ? e.message : String(e) },
      500,
    );
  }
});
