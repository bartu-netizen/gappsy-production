/**
 * Smart Next Step Resolver
 *
 * Deterministic max_step-based routing for /continue/:agencySlug smart links.
 *
 * ALL routing decisions are based ONLY on max_step — the highest funnel step
 * number the lead has reached. Never uses flags, never uses last_event.
 *
 * Routing table (strict, no exceptions):
 *   >= 160  checkout_completed            → manage_listing      (/manage-listing/{slug})
 *   >= 150  checkout_page_viewed          → checkout_resume     (/activation/upgrade?resume=true)
 *   >= 140  listing_activation_offer_...  → direct_offer        (/activation/upgrade)
 *   >= 120  owner_preview_missed_clients  → loss_step           (/availability/owner-demo)
 *   >= 100  check_availability_result_*   → availability_result (/availability/owner-demo?resume=true)
 *   default                               → your_agency         (/your-agency/{slug})
 *
 * Special: flow=manage always routes to /manage-listing/{slug} (hard short-circuit).
 *
 * LOGGING (MANDATORY): Every /continue hit is written to smartlink_logs.
 * FAILSAFE: Always falls back to /your-agency/{slug} on any error.
 */

import 'jsr:@supabase/functions-js/edge-runtime.d.ts';
import { createClient } from 'jsr:@supabase/supabase-js@2';
import { parseSmartLinkParams } from '../_shared/leadIdentity.ts';
import { isBotRequest, isDuplicateClick } from '../_shared/botDetection.ts';
import { computeStepBasedNextStep, applyManualOverride } from '../_shared/smartNextDecision.ts';
import {
  buildYourAgencyDestination,
  buildLossStepDestination,
  buildDirectOfferDestination,
  buildCheckoutResumeDestination,
  buildManageListingDestination,
  buildAvailabilityResultDestination,
} from '../_shared/agencyDestinations.ts';

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Methods': 'GET, OPTIONS',
  'Access-Control-Allow-Headers': 'Content-Type, Authorization, X-Client-Info, Apikey',
};

// Map funnel_sessions.stage → minimum step number equivalent
const STAGE_TO_MIN_STEP: Record<string, number> = {
  paid:             160,
  checkout_started: 150,
  offer_viewed:     140,
  upsell_viewed:    140,  // legacy alias — treated as offer_viewed
  submitted:        90,
  opened:           10,
};

function stageToStep(stage: string | null | undefined): number {
  if (!stage) return 0;
  return STAGE_TO_MIN_STEP[stage] ?? 0;
}

function jsonOk(data: Record<string, unknown>): Response {
  return new Response(JSON.stringify(data), {
    status: 200,
    headers: { ...corsHeaders, 'Content-Type': 'application/json' },
  });
}

/**
 * Map routing step to actual URL destination using agency-specific builders.
 * Only max_step-derived steps are handled. No legacy flag-based steps.
 */
function getDestinationUrl(
  step: string,
  context: {
    agencyId: string;
    agencySlug: string;
    stateSlug: string | null;
    cToken: string | null;
  },
  routingParams: {
    agency_id: string;
    lead_key: string;
    campaign_id?: string | null;
    campaign_name?: string | null;
    sequence_name?: string | null;
    email_step?: string | null;
    timestamp: number | null;
    sig?: string;
  }
): string {
  switch (step) {
    case 'manage_listing':
      return buildManageListingDestination(context.agencySlug, context.cToken, routingParams, context.stateSlug);

    case 'checkout_resume':
      return buildCheckoutResumeDestination(context.agencyId, context.agencySlug, routingParams);

    case 'direct_offer':
      return buildDirectOfferDestination(context.agencyId, context.agencySlug, routingParams);

    case 'loss_step':
      return buildLossStepDestination(context.agencySlug, context.stateSlug, routingParams);

    case 'availability_result':
      return buildAvailabilityResultDestination(context.agencySlug, context.stateSlug, routingParams);

    case 'your_agency':
    default:
      return buildYourAgencyDestination(context.agencySlug, routingParams);
  }
}

Deno.serve(async (req: Request) => {
  if (req.method === 'OPTIONS') {
    return new Response(null, { status: 200, headers: corsHeaders });
  }

  const supabaseUrl = Deno.env.get('SUPABASE_URL')!;
  const supabaseKey = Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')!;
  const supabase = createClient(supabaseUrl, supabaseKey);

  try {
    const url = new URL(req.url);
    const pathParts = url.pathname.split('/').filter(Boolean);
    const agencySlug = pathParts[pathParts.length - 1] || url.searchParams.get('agency_slug');

    if (!agencySlug) {
      console.error('[smart-next-resolver] Missing agency slug');
      return jsonOk({ ok: true, destination: '/your-agency/not-found' });
    }

    // ============================================================================
    // CRITICAL: flow=manage MUST SHORT-CIRCUIT ALL OTHER ROUTING LOGIC
    // Happens BEFORE signature validation, bot detection, or any other check.
    // ============================================================================
    const flowParam = url.searchParams.get('flow');
    const cToken = url.searchParams.get('c');

    if (flowParam === 'manage') {
      const lid = url.searchParams.get('lid');
      const utmSource = url.searchParams.get('utm_source');
      const aid = url.searchParams.get('aid');

      const destParams = new URLSearchParams();
      if (cToken)    destParams.set('c', cToken);
      if (lid)       destParams.set('lid', lid);
      if (utmSource) destParams.set('utm_source', utmSource);
      if (aid)       destParams.set('aid', aid);

      const queryString = destParams.toString();
      const manageDestination = queryString
        ? `/manage-listing/${agencySlug}?${queryString}`
        : `/manage-listing/${agencySlug}`;

      console.log('[smart-next-resolver] flow=manage short-circuit', { agencySlug, hasToken: !!cToken });

      const userAgent = req.headers.get('user-agent');
      const ip = req.headers.get('x-forwarded-for')?.split(',')[0].trim() ||
                 req.headers.get('x-real-ip') || 'unknown';
      const referrer = req.headers.get('referer') || req.headers.get('referrer');

      supabase.from('smartlead_link_events').insert({
        agency_id: aid || null,
        agency_slug: agencySlug,
        state_slug: null,
        lead_email: null,
        lead_key: lid || null,
        campaign_id: null,
        campaign_name: null,
        sequence_name: null,
        email_step: null,
        email_variant: null,
        smart_link_type: 'manage_url',
        event_type: 'manage_listing_opened',
        session_id: null,
        request_ip: ip,
        user_agent: userAgent,
        referrer,
        is_bot: false,
        is_duplicate: false,
        metadata: { short_circuit: true, has_token: !!cToken, utm_source: utmSource || null },
      }).then(() => {}).catch((err: unknown) => console.error('[smart-next-resolver] Manage event log error:', err));

      supabase.from('smartlink_logs').insert({
        agency_id: aid || null,
        lead_id: lid || null,
        token: cToken || null,
        max_step: 160,
        destination_url: manageDestination,
      }).then(() => {}).catch((err: unknown) => console.error('[smart-next-resolver] smartlink_logs error:', err));

      return jsonOk({
        ok: true,
        destination: manageDestination,
        step: 'manage_listing',
        reason: 'Manage listing flow — short-circuit routing',
      });
    }

    // ── Compact token resolution ────────────────────────────────────────────────
    // ?c=<token> compact URLs are resolved to full signed params here so the rest
    // of the resolver handles both formats identically.
    let resolvedUrl = url;

    if (cToken) {
      const { data: tokenRow, error: tokenLookupError } = await supabase
        .from('smart_link_tokens')
        .select('agency_id, lead_key, ts, sig, campaign_id, campaign_name, sequence_name, email_step')
        .eq('token', cToken)
        .maybeSingle();

      if (tokenLookupError) {
        console.error('[smart-next-resolver] Token lookup error:', tokenLookupError.message);
      }

      if (tokenRow) {
        resolvedUrl = new URL(url.toString());
        resolvedUrl.searchParams.set('aid', tokenRow.agency_id);
        resolvedUrl.searchParams.set('lid', tokenRow.lead_key);
        resolvedUrl.searchParams.set('ts', String(tokenRow.ts));
        resolvedUrl.searchParams.set('sig', tokenRow.sig);
        if (tokenRow.campaign_id)   resolvedUrl.searchParams.set('cid', tokenRow.campaign_id);
        if (tokenRow.campaign_name) resolvedUrl.searchParams.set('cn', encodeURIComponent(tokenRow.campaign_name));
        if (tokenRow.sequence_name) resolvedUrl.searchParams.set('sn', encodeURIComponent(tokenRow.sequence_name));
        if (tokenRow.email_step)    resolvedUrl.searchParams.set('es', tokenRow.email_step);
        resolvedUrl.searchParams.delete('c');
      } else if (!tokenLookupError) {
        console.warn('[smart-next-resolver] Token not found in smart_link_tokens:', cToken);
        // Signature check below will fail → safe /your-agency fallback
      }
    }

    // ── Parse and verify signed parameters ─────────────────────────────────────
    const params = parseSmartLinkParams(resolvedUrl);

    if (!params.valid || !params.agency_id || !params.lead_key) {
      console.warn('[smart-next-resolver] Invalid or missing signature', {
        agencySlug,
        valid: params.valid,
        hasAgencyId: !!params.agency_id,
        hasLeadKey: !!params.lead_key,
      });
      return jsonOk({ ok: true, destination: `/your-agency/${agencySlug}` });
    }

    const { agency_id, lead_key, campaign_id, campaign_name, sequence_name, email_step } = params;

    // ── Request metadata ────────────────────────────────────────────────────────
    const userAgent = req.headers.get('user-agent');
    const ip = req.headers.get('x-forwarded-for')?.split(',')[0].trim() ||
               req.headers.get('x-real-ip') || 'unknown';
    const referrer = req.headers.get('referer') || req.headers.get('referrer');

    // ── Bot + duplicate detection ───────────────────────────────────────────────
    const botCheck = isBotRequest({ userAgent, ip, referrer });
    const isBot = botCheck.isBot;
    const isDuplicate = !isBot && await isDuplicateClick(supabase, agency_id, lead_key, 5);

    // Log smartlead_link_events (best effort, fire-and-forget)
    supabase.from('smartlead_link_events').insert({
      agency_id,
      agency_slug: agencySlug,
      state_slug: null,
      lead_email: null,
      lead_key,
      campaign_id,
      campaign_name,
      sequence_name,
      email_step,
      email_variant: null,
      smart_link_type: 'continue_url',
      event_type: 'smart_link_opened',
      session_id: null,
      request_ip: ip,
      user_agent: userAgent,
      referrer,
      is_bot: isBot,
      is_duplicate: isDuplicate,
      metadata: { bot_reason: botCheck.reason, timestamp: params.timestamp },
    }).then(() => {}).catch((err: unknown) => console.error('[smart-next-resolver] Link event log error:', err));

    // Bots and duplicates get a safe fallback without state mutation
    if (isBot || isDuplicate) {
      console.log('[smart-next-resolver] Bot/duplicate — safe fallback', { isBot, isDuplicate });
      return jsonOk({ ok: true, destination: `/your-agency/${agencySlug}` });
    }

    // ── Fetch or create lead_funnel_state ───────────────────────────────────────
    let { data: state, error: stateError } = await supabase
      .from('lead_funnel_state')
      .select('*')
      .eq('agency_id', agency_id)
      .eq('lead_key', lead_key)
      .maybeSingle();

    if (stateError) {
      console.error('[smart-next-resolver] State fetch error:', stateError);
      return jsonOk({ ok: true, destination: `/your-agency/${agencySlug}` });
    }

    if (!state) {
      const { data: created, error: createError } = await supabase
        .from('lead_funnel_state')
        .insert({
          agency_id,
          agency_slug: agencySlug,
          state_slug: null,
          lead_email: null,
          lead_key,
          campaign_id,
          campaign_name,
          sequence_name,
          last_email_step: email_step,
          your_agency_raw_clicks: 1,
          your_agency_qualified_views_count: 0,
          last_activity_at: new Date().toISOString(),
          best_next_step: 'your_agency',
          best_next_reason: 'Initial smart link click',
          intent_score: 0,
          max_step: 0,
        })
        .select()
        .single();

      if (createError) {
        console.error('[smart-next-resolver] State create error:', createError);
        return jsonOk({ ok: true, destination: `/your-agency/${agencySlug}` });
      }

      state = created;
    } else {
      // Update activity count and attribution (fire-and-forget)
      supabase.from('lead_funnel_state').update({
        last_activity_at: new Date().toISOString(),
        your_agency_raw_clicks: (state.your_agency_raw_clicks ?? 0) + 1,
        campaign_id: campaign_id || state.campaign_id,
        campaign_name: campaign_name || state.campaign_name,
        sequence_name: sequence_name || state.sequence_name,
        last_email_step: email_step || state.last_email_step,
      }).eq('id', state.id)
        .then(() => {})
        .catch((err: unknown) => console.error('[smart-next-resolver] Activity update error:', err));
    }

    // ── Compute effective max_step ──────────────────────────────────────────────
    // Source 1: stored max_step (maintained by log-funnel-event as canonical events fire)
    const storedMaxStep: number = state.max_step ?? 0;

    // Source 2: funnel_sessions.stage for this lead (cross-check — never downgrades stored)
    let freshStageStep = 0;
    const { data: sessionRow } = await supabase
      .from('funnel_sessions')
      .select('stage')
      .eq('lead_key', lead_key)
      .order('updated_at', { ascending: false })
      .limit(1)
      .maybeSingle();

    if (sessionRow?.stage) {
      freshStageStep = stageToStep(sessionRow.stage);
    }

    const effectiveMaxStep = Math.max(storedMaxStep, freshStageStep);

    // Persist if max_step advanced beyond what was stored
    if (effectiveMaxStep > storedMaxStep) {
      supabase.from('lead_funnel_state')
        .update({ max_step: effectiveMaxStep, updated_at: new Date().toISOString() })
        .eq('id', state.id)
        .then(() => {})
        .catch((err: unknown) => console.error('[smart-next-resolver] max_step persist error:', err));
    }

    // ── Compute routing decision — max_step ONLY, no flags ─────────────────────
    const decision = computeStepBasedNextStep(effectiveMaxStep);

    // Apply admin manual override if present (respects expiry)
    const { data: override } = await supabase
      .from('lead_routing_overrides')
      .select('override_step, override_reason, expires_at')
      .eq('agency_id', agency_id)
      .eq('lead_key', lead_key)
      .maybeSingle();

    const finalDecision = applyManualOverride(decision, override);

    // ── Build destination URL ───────────────────────────────────────────────────
    const destination = getDestinationUrl(
      finalDecision.step,
      {
        agencyId: agency_id,
        agencySlug,
        stateSlug: state.state_slug,
        cToken,
      },
      {
        agency_id,
        lead_key,
        campaign_id,
        campaign_name,
        sequence_name,
        email_step,
        timestamp: params.timestamp,
        sig: url.searchParams.get('sig') || undefined,
      }
    );

    // ── Update lead_funnel_state with final decision ────────────────────────────
    supabase.from('lead_funnel_state').update({
      best_next_step: finalDecision.step,
      best_next_reason: finalDecision.reason,
      intent_score: finalDecision.intent_score,
      max_step: effectiveMaxStep,
      updated_at: new Date().toISOString(),
    }).eq('id', state.id)
      .then(() => {})
      .catch((err: unknown) => console.error('[smart-next-resolver] Decision persist error:', err));

    // ── MANDATORY: Log every /continue resolution to smartlink_logs ────────────
    supabase.from('smartlink_logs').insert({
      agency_id,
      lead_id: lead_key,
      token: cToken || null,
      max_step: effectiveMaxStep,
      destination_url: destination,
    }).then(() => {}).catch((err: unknown) => console.error('[smart-next-resolver] smartlink_logs write error:', err));

    console.log('[smart-next-resolver] Resolved', {
      agencySlug,
      step: finalDecision.step,
      reason: finalDecision.reason,
      effectiveMaxStep,
      destination,
    });

    return jsonOk({
      ok: true,
      destination,
      step: finalDecision.step,
      reason: finalDecision.reason,
      max_step: effectiveMaxStep,
    });

  } catch (err) {
    console.error('[smart-next-resolver] Unexpected error:', err);

    const url = new URL(req.url);
    const pathParts = url.pathname.split('/').filter(Boolean);
    const agencySlug = pathParts[pathParts.length - 1];

    return jsonOk({
      ok: true,
      destination: agencySlug ? `/your-agency/${agencySlug}` : '/your-agency/not-found',
    });
  }
});
