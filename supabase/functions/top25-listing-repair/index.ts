import 'jsr:@supabase/functions-js/edge-runtime.d.ts';
import Stripe from 'npm:stripe@17.7.0';
import { createClient } from 'npm:@supabase/supabase-js@2.49.1';
import { authenticateAdmin, createAuthErrorResponse } from '../_shared/adminAuth.ts';

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Methods': 'GET, POST, OPTIONS',
  'Access-Control-Allow-Headers': 'Content-Type, Authorization, X-Client-Info, Apikey, x-admin-token, x-admin-secret',
};

const supabase = createClient(
  Deno.env.get('SUPABASE_URL')!,
  Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')!,
);

const stripeSecret = Deno.env.get('STRIPE_SECRET_KEY');
const stripe = stripeSecret ? new Stripe(stripeSecret, { appInfo: { name: 'Gappsy', version: '2.1.0' } }) : null;

Deno.serve(async (req) => {
  if (req.method === 'OPTIONS') return new Response(null, { status: 200, headers: corsHeaders });

  try {
    const authResult = await authenticateAdmin(req);
    if (!authResult.success) return createAuthErrorResponse(authResult, corsHeaders);

    const body = await req.json();
    const { subscriptionId, stateSlug, rank, dryRun = false } = body as {
      subscriptionId?: string;
      stateSlug?: string;
      rank?: number;
      dryRun?: boolean;
    };

    const log: string[] = [];
    const warn: string[] = [];
    const errors: string[] = [];

    const pushLog = (msg: string) => { log.push(msg); console.info('[repair]', msg); };
    const pushWarn = (msg: string) => { warn.push(msg); console.warn('[repair]', msg); };
    const pushErr = (msg: string) => { errors.push(msg); console.error('[repair]', msg); };

    // ── Step 1: Locate the stripe_orders row ─────────────────────────────────
    let orderRow: Record<string, any> | null = null;

    if (subscriptionId) {
      const { data } = await supabase
        .from('stripe_orders')
        .select('*')
        .eq('subscription_id', subscriptionId)
        .maybeSingle();
      orderRow = data;
      if (orderRow) pushLog(`Found stripe_orders row by subscription_id: ${subscriptionId}`);
    }

    if (!orderRow && stateSlug && rank) {
      const { data } = await supabase
        .from('stripe_orders')
        .select('*')
        .eq('state_slug', stateSlug)
        .eq('top25_rank', rank)
        .order('created_at', { ascending: false })
        .limit(1)
        .maybeSingle();
      orderRow = data;
      if (orderRow) pushLog(`Found stripe_orders row by stateSlug+rank: ${stateSlug} #${rank}`);
    }

    if (!orderRow) {
      return Response.json({
        ok: false,
        error: 'No stripe_orders row found for the given parameters',
        log, warn, errors,
      }, { status: 404, headers: corsHeaders });
    }

    // ── Step 2: Extract and enrich metadata ──────────────────────────────────
    const meta: Record<string, string> = {
      ...(orderRow.metadata ?? {}),
    };
    if (orderRow.agency_id && !meta.agencyId) meta.agencyId = orderRow.agency_id;
    if (orderRow.agency_name && !meta.agencyName) meta.agencyName = orderRow.agency_name;
    if (orderRow.state_slug && !meta.stateSlug) meta.stateSlug = orderRow.state_slug;
    if (orderRow.top25_rank != null && !meta.rank) meta.rank = String(orderRow.top25_rank);
    if (orderRow.top25_slot_id && !meta.top25SlotId) meta.top25SlotId = orderRow.top25_slot_id;
    if (!meta.listingType && orderRow.funnel_type) meta.listingType = orderRow.funnel_type;
    if (!meta.listingType && orderRow.source_listing_type) meta.listingType = orderRow.source_listing_type;

    const finalStateSlug = meta.stateSlug || stateSlug || null;
    const finalRank = meta.rank ? parseInt(meta.rank, 10) : (rank ?? null);
    const finalTop25SlotId = meta.top25SlotId || null;
    const finalListingType = meta.listingType || 'top25';
    const finalAgencyName = meta.agencyName || null;
    const finalAgencyWebsite = meta.agencyWebsite || meta.websiteUrl || null;
    const subId = orderRow.subscription_id || subscriptionId || null;

    pushLog(`Meta resolved: stateSlug=${finalStateSlug}, rank=${finalRank}, agencyName=${finalAgencyName}, listingType=${finalListingType}`);

    // ── Step 3: Resolve agencyId ──────────────────────────────────────────────
    let finalAgencyId: string | null = meta.agencyId || orderRow.agency_id || null;

    if (!finalAgencyId && finalAgencyName && finalStateSlug) {
      const { data: byName } = await supabase
        .from('other_agencies')
        .select('id')
        .eq('state_slug', finalStateSlug)
        .ilike('name', finalAgencyName)
        .maybeSingle();

      if (byName) {
        finalAgencyId = byName.id;
        pushLog(`Resolved agencyId ${finalAgencyId} by name lookup`);
      } else if (!dryRun) {
        const aSlug = finalAgencyName.toLowerCase().replace(/[^a-z0-9]+/g, '-').replace(/^-+|-+$/g, '');
        const sName = finalStateSlug!.split('-').map((w: string) => w.charAt(0).toUpperCase() + w.slice(1)).join(' ');
        const { data: newAgency, error: createErr } = await supabase
          .from('other_agencies')
          .insert({
            name: finalAgencyName.trim(),
            slug: `${aSlug}-${finalStateSlug}`,
            state_slug: finalStateSlug,
            state_name: sName,
            website_url: finalAgencyWebsite || '',
            is_paid_listing: true,
            availability_redirect_enabled: true,
            availability_redirect_url: finalAgencyWebsite || '',
          })
          .select('id')
          .single();
        if (newAgency && !createErr) {
          finalAgencyId = newAgency.id;
          pushLog(`Created other_agencies row ${finalAgencyId} for "${finalAgencyName}"`);
        } else {
          pushErr(`Failed to create other_agencies: ${createErr?.message}`);
        }
      } else {
        pushWarn(`[dryRun] Would create other_agencies row for "${finalAgencyName}"`);
      }
    }

    if (!finalAgencyId) {
      return Response.json({
        ok: false,
        error: 'Could not resolve agencyId — cannot repair',
        log, warn, errors,
        meta,
      }, { status: 422, headers: corsHeaders });
    }

    // ── Step 4: Claim the top25 slot ─────────────────────────────────────────
    if (!finalStateSlug || !finalRank) {
      return Response.json({
        ok: false,
        error: 'Missing stateSlug or rank — cannot claim slot',
        log, warn, errors,
      }, { status: 422, headers: corsHeaders });
    }

    const { data: currentSlot } = await supabase
      .from('top25_slots')
      .select('id, slot_status, is_paid, agency_id, agency_name, description, services, stripe_subscription_id')
      .eq('state_slug', finalStateSlug)
      .eq('rank', finalRank)
      .maybeSingle();

    if (!currentSlot) {
      pushErr(`No top25_slots row found for ${finalStateSlug} rank ${finalRank}`);
      return Response.json({ ok: false, error: 'Slot not found', log, warn, errors }, { status: 404, headers: corsHeaders });
    }

    pushLog(`Current slot state: slot_status=${currentSlot.slot_status}, is_paid=${currentSlot.is_paid}, agency_id=${currentSlot.agency_id}`);

    const alreadyClaimed = currentSlot.slot_status === 'sold' && currentSlot.is_paid;
    if (alreadyClaimed) {
      pushLog('Slot already sold+paid — will re-finalize content only');
    }

    if (!dryRun && !alreadyClaimed) {
      const now = new Date().toISOString();
      const { error: claimErr } = await supabase
        .from('top25_slots')
        .update({
          agency_id: finalAgencyId,
          is_paid: true,
          is_available: false,
          slot_status: 'sold',
          sale_source: 'stripe',
          status_updated_by: 'repair_function',
          status_updated_at: now,
          status_reason: `Repair: finalized from subscription ${subId || 'unknown'}`,
          purchased_at: currentSlot.slot_status === 'sold' ? undefined : now,
          billing_status: 'active',
          stripe_subscription_id: subId || currentSlot.stripe_subscription_id || null,
          updated_at: now,
        })
        .eq('state_slug', finalStateSlug)
        .eq('rank', finalRank);

      if (claimErr) {
        pushErr(`Slot claim update failed: ${claimErr.message}`);
      } else {
        pushLog(`Slot ${finalStateSlug} rank ${finalRank} claimed for agency ${finalAgencyId}`);
      }
    } else if (dryRun) {
      pushWarn(`[dryRun] Would claim slot ${finalStateSlug} rank ${finalRank}`);
    }

    // ── Step 5: Update stripe_orders.agency_id ────────────────────────────────
    if (!dryRun && !orderRow.agency_id) {
      await supabase.from('stripe_orders').update({ agency_id: finalAgencyId }).eq('id', orderRow.id);
      pushLog(`Updated stripe_orders.agency_id to ${finalAgencyId}`);
    }

    // ── Step 6: Update other_agencies paid flags ──────────────────────────────
    if (!dryRun) {
      const agencyUpdate: Record<string, any> = {
        is_paid_listing: true,
        paid_listing_type: finalListingType,
        paid_listing_rank: finalRank,
        availability_redirect_enabled: true,
      };
      if (finalAgencyWebsite) agencyUpdate.availability_redirect_url = finalAgencyWebsite;

      const { error: agencyUpdateErr } = await supabase
        .from('other_agencies')
        .update(agencyUpdate)
        .eq('id', finalAgencyId);

      if (agencyUpdateErr) {
        pushErr(`other_agencies update failed: ${agencyUpdateErr.message}`);
      } else {
        pushLog(`other_agencies paid flags set for ${finalAgencyId}`);
      }
    }

    // ── Step 7: Finalize listing content ─────────────────────────────────────
    if (!dryRun) {
      await finalizeContent({
        agencyId: finalAgencyId,
        stateSlug: finalStateSlug,
        rank: finalRank,
        top25SlotId: finalTop25SlotId,
        meta,
        subId,
        log,
        warn,
        errors,
      });
    } else {
      pushWarn('[dryRun] Would finalize listing content');
    }

    // ── Step 8: Snapshot final state ─────────────────────────────────────────
    const { data: finalSlot } = await supabase
      .from('top25_slots')
      .select('id, slot_status, is_paid, agency_id, agency_name, description, services, logo_url, stripe_subscription_id, billing_status')
      .eq('state_slug', finalStateSlug)
      .eq('rank', finalRank)
      .maybeSingle();

    const { data: finalAgency } = await supabase
      .from('other_agencies')
      .select('id, name, is_paid_listing, availability_redirect_enabled, availability_redirect_url, logo_url, intro, services')
      .eq('id', finalAgencyId)
      .maybeSingle();

    return Response.json({
      ok: true,
      dryRun,
      log,
      warn,
      errors,
      result: {
        agencyId: finalAgencyId,
        stateSlug: finalStateSlug,
        rank: finalRank,
        slot: finalSlot,
        agency: finalAgency,
      },
    }, { headers: corsHeaders });

  } catch (err: any) {
    console.error('[repair] Unhandled error:', err);
    return Response.json({ ok: false, error: err.message }, { status: 500, headers: corsHeaders });
  }
});

async function finalizeContent({
  agencyId, stateSlug, rank, top25SlotId, meta, subId, log, warn, errors,
}: {
  agencyId: string;
  stateSlug: string;
  rank: number | null;
  top25SlotId: string | null;
  meta: Record<string, string>;
  subId: string | null;
  log: string[];
  warn: string[];
  errors: string[];
}) {
  const pushLog = (msg: string) => { log.push(msg); };
  const pushErr = (msg: string) => { errors.push(msg); };

  let agencyName    = meta.agencyName    || null;
  let agencyWebsite = meta.agencyWebsite || meta.websiteUrl || null;
  let description   = meta.agencyDescription || null;
  let servicesRaw   = meta.agencyServices || null;
  let logoUrl       = meta.logoUrl || null;

  // Fetch from Stripe checkout session if we have a subscription and Stripe key
  if ((!description || !servicesRaw) && subId && stripe) {
    try {
      const { data: orderForSession } = await supabase
        .from('stripe_orders')
        .select('checkout_session_id, metadata')
        .eq('subscription_id', subId)
        .maybeSingle();

      if (orderForSession?.metadata) {
        const om = orderForSession.metadata as Record<string, string>;
        if (!description && om.agencyDescription) description = om.agencyDescription;
        if (!servicesRaw && om.agencyServices) servicesRaw = om.agencyServices;
        if (!logoUrl && om.logoUrl) logoUrl = om.logoUrl;
      }

      if (orderForSession?.checkout_session_id && !orderForSession.checkout_session_id.startsWith('inv_')) {
        const session = await stripe.checkout.sessions.retrieve(orderForSession.checkout_session_id);
        if (!description && session.metadata?.agencyDescription) description = session.metadata.agencyDescription;
        if (!servicesRaw && session.metadata?.agencyServices) servicesRaw = session.metadata.agencyServices;
        if (!agencyName && session.metadata?.agencyName) agencyName = session.metadata.agencyName;
        if (!agencyWebsite && session.metadata?.agencyWebsite) agencyWebsite = session.metadata.agencyWebsite;
        if (!logoUrl && session.metadata?.logoUrl) logoUrl = session.metadata.logoUrl;
        pushLog('Enriched content from Stripe checkout session');
      }
    } catch (stripeErr: any) {
      warn.push(`Could not fetch Stripe session: ${stripeErr.message}`);
    }
  }

  // Fallback from other_agencies
  const { data: existing } = await supabase
    .from('other_agencies')
    .select('intro, services, website_url, name, logo_url')
    .eq('id', agencyId)
    .maybeSingle();

  if (existing) {
    if (!description && existing.intro) description = existing.intro;
    if (!servicesRaw && existing.services?.length) servicesRaw = existing.services.join(',');
    if (!agencyWebsite && existing.website_url) agencyWebsite = existing.website_url;
    if (!agencyName && existing.name) agencyName = existing.name;
    if (!logoUrl && existing.logo_url) logoUrl = existing.logo_url;
    pushLog('Enriched content from other_agencies fallback');
  }

  const services: string[] = servicesRaw
    ? servicesRaw.split(',').map((s: string) => s.trim()).filter(Boolean)
    : [];

  const shortDescription = description ? description.slice(0, 200).replace(/\s+$/, '') : null;

  const slotContent: Record<string, any> = { updated_at: new Date().toISOString() };
  if (agencyName) slotContent.agency_name = agencyName;
  if (agencyWebsite) slotContent.website = agencyWebsite;
  if (description) slotContent.description = description;
  if (shortDescription) slotContent.short_description = shortDescription;
  if (services.length) slotContent.services = services;
  if (logoUrl) slotContent.logo_url = logoUrl;

  let slotQ = supabase.from('top25_slots').update(slotContent).eq('state_slug', stateSlug).eq('is_paid', true);
  if (top25SlotId) slotQ = slotQ.eq('id', top25SlotId);
  else if (rank) slotQ = slotQ.eq('rank', rank);

  const { error: slotErr } = await slotQ;
  if (slotErr) {
    pushErr(`top25_slots content update failed: ${slotErr.message}`);
  } else {
    pushLog(`Content written to slot ${stateSlug} rank ${rank}${logoUrl ? ' (with logo)' : ''}`);
  }

  const agencyContent: Record<string, any> = {
    is_paid_listing: true,
    paid_listing_type: 'top25',
    paid_listing_rank: rank,
  };
  if (description) agencyContent.intro = description;
  if (agencyWebsite) agencyContent.website_url = agencyWebsite;
  if (services.length) agencyContent.services = services;
  if (logoUrl) agencyContent.logo_url = logoUrl;
  if (agencyWebsite) {
    agencyContent.availability_redirect_enabled = true;
    agencyContent.availability_redirect_url = agencyWebsite;
  }

  const { error: agencyErr } = await supabase.from('other_agencies').update(agencyContent).eq('id', agencyId);
  if (agencyErr) {
    pushErr(`other_agencies content sync failed: ${agencyErr.message}`);
  } else {
    pushLog('Content synced back to other_agencies');
  }
}
