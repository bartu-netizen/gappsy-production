import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from 'jsr:@supabase/supabase-js@2';
import { authenticateAdmin, writeAuditLog, getRequestMeta, hashPayload } from '../_shared/adminAuth.ts';

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "GET, POST, PUT, DELETE, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey, x-admin-token, x-admin-secret",
};

const FORBIDDEN_KEYWORDS = [
  'casino', 'gambling', 'slots', 'free spins', 'slot machine',
  'online casino', 'casino zonder', 'betspins', 'betway',
  '888casino', 'jackpot', 'pokies', 'wagering'
];

function scanForForbiddenKeywords(fields: (string | null | undefined)[]): string[] {
  const combined = fields.filter(Boolean).join(' ').toLowerCase();
  return FORBIDDEN_KEYWORDS.filter(kw => combined.includes(kw.toLowerCase()));
}

interface UpdateSlotRequest {
  action?: 'update' | 'lock' | 'unlock' | 'mark_sold';
  stateSlug: string;
  rank: number;
  agencyName: string;
  website: string;
  logoUrl?: string;
  description?: string;
  shortDescription?: string;
  services?: string[];
  showLightning?: boolean;
  lockReason?: string;
  adminEmail?: string;
  markSoldManual?: boolean;
  force?: boolean;
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: corsHeaders });
  }

  const { ip, userAgent } = getRequestMeta(req);

  try {
    const authResult = await authenticateAdmin(req);
    if (!authResult.success) {
      await writeAuditLog({
        actor_session_type: 'unknown',
        action: 'top25_admin_update',
        ip,
        user_agent: userAgent,
        status: 'rejected',
        rejection_reason: authResult.error?.code,
      });
      return new Response(
        JSON.stringify({ error: authResult.error?.code, message: authResult.error?.message }),
        { status: 401, headers: { ...corsHeaders, "Content-Type": "application/json" } }
      );
    }

    const supabaseClient = createClient(
      Deno.env.get('SUPABASE_URL') ?? '',
      Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') ?? ''
    );

    const requestData: UpdateSlotRequest = await req.json();
    const { stateSlug, rank, agencyName, website } = requestData;
    const action = requestData.action ?? 'update';
    const payloadHash = await hashPayload(requestData);

    if (!stateSlug || !rank || !agencyName || !website) {
      return new Response(
        JSON.stringify({ error: 'Missing required fields: stateSlug, rank, agencyName, website' }),
        { status: 400, headers: { ...corsHeaders, "Content-Type": "application/json" } }
      );
    }

    // Content safety scan
    const foundKeywords = scanForForbiddenKeywords([
      requestData.description,
      requestData.shortDescription,
      agencyName,
    ]);
    if (foundKeywords.length > 0) {
      await writeAuditLog({
        actor_session_type: authResult.sessionType ?? 'unknown',
        action: 'top25_admin_update',
        state_slug: stateSlug,
        payload_hash: payloadHash,
        ip,
        user_agent: userAgent,
        status: 'rejected',
        rejection_reason: `CONTENT_SAFETY_VIOLATION: ${foundKeywords.join(', ')}`,
      });
      return new Response(
        JSON.stringify({ error: 'CONTENT_SAFETY_VIOLATION', message: 'Content contains forbidden keywords.', foundKeywords }),
        { status: 400, headers: { ...corsHeaders, "Content-Type": "application/json" } }
      );
    }

    const agencySlug = agencyName.toLowerCase().replace(/[^a-z0-9]+/g, '-').replace(/^-+|-+$/g, '');
    const uniqueSlug = `${agencySlug}-${stateSlug}`;

    let agencyId: string | null = null;

    const { data: existingAgency } = await supabaseClient
      .from('other_agencies')
      .select('id, is_paid_listing')
      .eq('state_slug', stateSlug)
      .ilike('name', agencyName)
      .maybeSingle();

    if (existingAgency) {
      agencyId = existingAgency.id;
      await supabaseClient.from('other_agencies').update({
        website_url: website,
        logo_url: requestData.logoUrl,
        intro: requestData.description,
        short_description: requestData.shortDescription,
        services: requestData.services,
        updated_at: new Date().toISOString()
      }).eq('id', agencyId);
    } else {
      const stateName = stateSlug.split('-').map((w: string) => w.charAt(0).toUpperCase() + w.slice(1)).join(' ');
      const { data: newAgency, error: insertError } = await supabaseClient
        .from('other_agencies')
        .insert({
          name: agencyName.trim(), slug: uniqueSlug,
          state_slug: stateSlug, state_name: stateName,
          website_url: website, logo_url: requestData.logoUrl,
          intro: requestData.description || `${agencyName} is a leading marketing agency.`,
          short_description: requestData.shortDescription,
          services: requestData.services || ['Digital Marketing'],
          is_paid_listing: false
        })
        .select('id')
        .single();

      if (insertError || !newAgency) {
        return new Response(
          JSON.stringify({ error: 'Failed to create agency record', details: insertError }),
          { status: 500, headers: { ...corsHeaders, "Content-Type": "application/json" } }
        );
      }
      agencyId = newAgency.id;
    }

    // Fetch current slot — include entitlement linkage fields
    const { data: currentSlot } = await supabaseClient
      .from('top25_slots')
      .select('slot_status, is_paid, is_available, locked_by_admin, id, claimed_by_entitlement_id, stripe_subscription_id, billing_status')
      .eq('state_slug', stateSlug)
      .eq('rank', rank)
      .maybeSingle();

    // Guard: protect slots linked to an active entitlement from destructive overrides
    // Destructive = unlock (wipe sold), mark_sold (double-claim) on an entitlement-linked slot
    const isEntitlementLinked = !!(currentSlot?.claimed_by_entitlement_id || currentSlot?.stripe_subscription_id);
    const isDestructiveAction = action === 'unlock' || (action === 'mark_sold' && currentSlot?.is_paid);
    const forceOverride = requestData.force === true;

    if (isEntitlementLinked && isDestructiveAction && !forceOverride) {
      await writeAuditLog({
        actor_session_type: authResult.sessionType ?? 'unknown',
        action: `top25_admin_update:${action}:BLOCKED_ENTITLEMENT_LINKED`,
        state_slug: stateSlug,
        payload_hash: payloadHash,
        ip,
        user_agent: userAgent,
        status: 'rejected',
        rejection_reason: 'ENTITLEMENT_LINKED_SLOT: destructive action blocked without force flag',
      });
      return new Response(
        JSON.stringify({
          error: 'ENTITLEMENT_LINKED_SLOT',
          message: `Slot #${rank} in ${stateSlug} is linked to an active Stripe subscription (${currentSlot?.stripe_subscription_id ?? 'unknown'}). Pass force:true to override with audit trail.`,
          subscription_id: currentSlot?.stripe_subscription_id,
          entitlement_id: currentSlot?.claimed_by_entitlement_id,
        }),
        { status: 409, headers: { ...corsHeaders, "Content-Type": "application/json" } }
      );
    }

    const now = new Date().toISOString();
    let slotUpdatePayload: Record<string, any>;
    let logAction = action;

    if (action === 'lock') {
      // Explicit lock: admin is saying "this slot is NOT for sale right now"
      slotUpdatePayload = {
        agency_id: agencyId,
        agency_name: agencyName.trim(),
        website,
        logo_url: requestData.logoUrl,
        description: requestData.description,
        short_description: requestData.shortDescription,
        services: requestData.services,
        show_lightning: requestData.showLightning || false,
        slot_status: 'locked',
        is_available: false,
        locked_by_admin: true,
        locked_at: now,
        locked_reason: requestData.lockReason || 'Locked by admin',
        locked_by_email: requestData.adminEmail || null,
        last_admin_edit_at: now,
        last_admin_edit_by: requestData.adminEmail || 'admin',
        status_updated_by: 'admin',
        status_updated_at: now,
        status_reason: requestData.lockReason || 'Locked by admin',
        manual_override: true,
        updated_at: now,
      };
    } else if (action === 'unlock') {
      // Explicit unlock: admin is making slot available for purchase
      // Only allowed on non-sold slots
      if (currentSlot?.is_paid || currentSlot?.slot_status === 'sold') {
        return new Response(
          JSON.stringify({ error: 'CANNOT_UNLOCK_SOLD', message: 'Cannot unlock a sold slot. Contact support if a refund occurred.' }),
          { status: 400, headers: { ...corsHeaders, "Content-Type": "application/json" } }
        );
      }
      slotUpdatePayload = {
        agency_id: agencyId,
        agency_name: agencyName.trim(),
        website,
        logo_url: requestData.logoUrl,
        description: requestData.description,
        short_description: requestData.shortDescription,
        services: requestData.services,
        show_lightning: requestData.showLightning || false,
        slot_status: 'available',
        is_available: true,
        locked_by_admin: false,
        locked_at: null,
        locked_reason: null,
        locked_by_email: null,
        last_admin_edit_at: now,
        last_admin_edit_by: requestData.adminEmail || 'admin',
        status_updated_by: 'admin',
        status_updated_at: now,
        status_reason: 'Unlocked by admin — slot is available for purchase',
        updated_at: now,
      };
    } else if (action === 'mark_sold' || requestData.markSoldManual === true) {
      // Explicit manual sale (e.g. bank transfer outside Stripe)
      slotUpdatePayload = {
        agency_id: agencyId,
        agency_name: agencyName.trim(),
        website,
        logo_url: requestData.logoUrl,
        description: requestData.description,
        short_description: requestData.shortDescription,
        services: requestData.services,
        show_lightning: requestData.showLightning || false,
        slot_status: 'sold',
        is_paid: true,
        is_available: false,
        locked_by_admin: false,
        claimed_at: now,
        sale_source: 'manual',
        last_admin_edit_at: now,
        last_admin_edit_by: requestData.adminEmail || 'admin',
        status_updated_by: 'admin',
        status_updated_at: now,
        status_reason: 'Manually marked sold by admin',
        manual_override: true,
        updated_at: now,
      };
      logAction = 'mark_sold';

      // Also update other_agencies paid status
      await supabaseClient.from('other_agencies').update({
        is_paid_listing: true,
        updated_at: now,
      }).eq('id', agencyId);
    } else {
      // Default: action === 'update' — content-only edit
      // MUST NOT touch: is_paid, is_available, slot_status, locked_*, claimed_at, sale_source, stripe_*
      // Sets manual_override=true so the Check Availability guard treats this
      // admin-assigned placement like a paid listing (self-recommend).
      slotUpdatePayload = {
        agency_id: agencyId,
        agency_name: agencyName.trim(),
        website,
        logo_url: requestData.logoUrl,
        description: requestData.description,
        short_description: requestData.shortDescription,
        services: requestData.services,
        show_lightning: requestData.showLightning || false,
        last_admin_edit_at: now,
        last_admin_edit_by: requestData.adminEmail || 'admin',
        manual_override: true,
        updated_at: now,
      };
    }

    const { error: slotUpdateError } = await supabaseClient
      .from('top25_slots')
      .update(slotUpdatePayload)
      .eq('state_slug', stateSlug)
      .eq('rank', rank);

    if (slotUpdateError) {
      return new Response(
        JSON.stringify({ error: 'Failed to update slot', details: slotUpdateError }),
        { status: 500, headers: { ...corsHeaders, "Content-Type": "application/json" } }
      );
    }

    // Log status changes to audit log (skip for pure content updates)
    const newSlotStatus = slotUpdatePayload.slot_status;
    if (newSlotStatus && currentSlot && currentSlot.slot_status !== newSlotStatus) {
      await supabaseClient.from('slot_status_audit_log').insert({
        state_slug: stateSlug,
        rank,
        slot_id: currentSlot.id,
        old_status: currentSlot.slot_status,
        new_status: newSlotStatus,
        changed_by: 'admin',
        reason: slotUpdatePayload.status_reason,
        ip_address: ip,
        metadata: {
          agency_name: agencyName,
          action: logAction,
          admin_email: requestData.adminEmail,
        },
      });
    }

    await writeAuditLog({
      actor_session_type: authResult.sessionType ?? 'unknown',
      action: `top25_admin_update:${logAction}`,
      target_table: 'top25_slots,other_agencies',
      target_id: agencyId ?? undefined,
      state_slug: stateSlug,
      payload_hash: payloadHash,
      ip,
      user_agent: userAgent,
      status: 'success',
    });

    return new Response(
      JSON.stringify({ success: true, message: 'Slot updated successfully', agencyId, stateSlug, rank, action: logAction }),
      { status: 200, headers: { ...corsHeaders, "Content-Type": "application/json" } }
    );
  } catch (error) {
    return new Response(
      JSON.stringify({ success: false, error: 'Internal server error', message: error instanceof Error ? error.message : String(error) }),
      { status: 500, headers: { ...corsHeaders, "Content-Type": "application/json" } }
    );
  }
});
