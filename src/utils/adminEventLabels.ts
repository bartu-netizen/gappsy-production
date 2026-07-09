export type EventGroup = 'view' | 'engagement' | 'high_intent' | 'checkout' | 'conversion' | 'negative';
export type FunnelStage = 'awareness' | 'engagement' | 'high_intent' | 'checkout' | 'conversion' | 'negative';

export interface EventMeta {
  label: string;
  group: EventGroup;
  stage: FunnelStage;
  weight: number;
}

export const GROUP_WEIGHT: Record<EventGroup, number> = {
  view: 1,
  engagement: 3,
  high_intent: 10,
  checkout: 20,
  conversion: 25,
  negative: -10,
};

export const GROUP_TONE: Record<EventGroup, string> = {
  view: 'bg-slate-100 text-slate-700 border-slate-200',
  engagement: 'bg-sky-100 text-sky-800 border-sky-200',
  high_intent: 'bg-amber-100 text-amber-900 border-amber-300',
  checkout: 'bg-orange-100 text-orange-900 border-orange-300',
  conversion: 'bg-emerald-100 text-emerald-900 border-emerald-300',
  negative: 'bg-rose-100 text-rose-900 border-rose-300',
};

export const GROUP_DOT: Record<EventGroup, string> = {
  view: 'bg-slate-400',
  engagement: 'bg-sky-400',
  high_intent: 'bg-amber-500',
  checkout: 'bg-orange-500',
  conversion: 'bg-emerald-500',
  negative: 'bg-rose-500',
};

const EVENT_LABEL_MAP: Record<string, EventMeta> = {
  // Your-agency profile
  your_agency_landing_page_viewed: {
    label: 'Your-agency profile — Viewed landing page',
    group: 'view', stage: 'awareness', weight: 1,
  },
  your_agency_landing_viewed: {
    label: 'Your-agency profile — Viewed landing page',
    group: 'view', stage: 'awareness', weight: 1,
  },
  your_agency_profile_page_viewed: {
    label: 'Discovery — Owner viewed their own agency profile',
    group: 'view', stage: 'awareness', weight: 1,
  },
  your_agency_page_view: {
    label: 'Discovery — Owner viewed their own agency profile',
    group: 'view', stage: 'awareness', weight: 1,
  },
  your_agency_overview_viewed: {
    label: 'Discovery — Owner viewed their own agency profile',
    group: 'view', stage: 'awareness', weight: 1,
  },
  your_agency_search_submitted: {
    label: 'Your-agency profile — Submitted search',
    group: 'engagement', stage: 'engagement', weight: 3,
  },
  your_agency_profile_clicked: {
    label: 'Your-agency profile — Clicked profile card',
    group: 'engagement', stage: 'engagement', weight: 3,
  },
  your_agency_see_listing_clicked: {
    label: 'Your-agency profile — Clicked "See my listing"',
    group: 'engagement', stage: 'engagement', weight: 3,
  },
  your_agency_view_requests_clicked: {
    label: 'High intent — Clicked to see missed client opportunities',
    group: 'high_intent', stage: 'high_intent', weight: 8,
  },
  your_agency_token_page_viewed: {
    label: 'Your-agency profile — Opened claim link',
    group: 'engagement', stage: 'engagement', weight: 3,
  },

  // Your-agency ledger
  your_agency_ledger_page_viewed: {
    label: 'Interest — Viewed missed client opportunities',
    group: 'engagement', stage: 'engagement', weight: 6,
  },
  your_agency_start_receiving_cta_clicked: {
    label: 'High intent — Signaled intent to activate (CTA clicked)',
    group: 'high_intent', stage: 'high_intent', weight: 15,
  },
  your_agency_activate_clicked: {
    label: 'High intent — Signaled intent to activate (CTA clicked)',
    group: 'high_intent', stage: 'high_intent', weight: 15,
  },

  // Owner preview
  owner_preview_state_page_viewed: {
    label: 'Owner preview — Viewed state page',
    group: 'view', stage: 'awareness', weight: 1,
  },
  owner_preview_scroll_to_listing_cta_clicked: {
    label: 'Owner preview — Clicked "Scroll to my listing"',
    group: 'engagement', stage: 'engagement', weight: 3,
  },
  owner_preview_scroll_to_listing_clicked: {
    label: 'Owner preview — Clicked "Scroll to my listing"',
    group: 'engagement', stage: 'engagement', weight: 3,
  },
  owner_preview_check_availability_opened: {
    label: 'Evaluation — Started client request flow',
    group: 'engagement', stage: 'engagement', weight: 5,
  },
  owner_preview_step2_started: {
    label: 'Evaluation — Started client request flow',
    group: 'engagement', stage: 'engagement', weight: 5,
  },
  owner_preview_check_availability_modal_opened: {
    label: 'Evaluation — Started client request flow',
    group: 'engagement', stage: 'engagement', weight: 5,
  },
  demo_availability_modal_opened: {
    label: 'Evaluation — Started client request flow',
    group: 'engagement', stage: 'engagement', weight: 5,
  },
  owner_preview_check_availability_submitted: {
    label: 'Evaluation — Completed client request flow',
    group: 'high_intent', stage: 'high_intent', weight: 12,
  },
  demo_availability_submitted: {
    label: 'Evaluation — Completed client request flow',
    group: 'high_intent', stage: 'high_intent', weight: 12,
  },
  availability_submitted: {
    label: 'Evaluation — Completed client request flow',
    group: 'high_intent', stage: 'high_intent', weight: 12,
  },
  demo_submitted: {
    label: 'Owner preview — Submitted availability demo',
    group: 'engagement', stage: 'engagement', weight: 3,
  },
  demo_completed: {
    label: 'Owner preview — Completed availability demo',
    group: 'engagement', stage: 'engagement', weight: 3,
  },
  demo_opened: {
    label: 'Owner preview — Opened availability demo',
    group: 'engagement', stage: 'engagement', weight: 3,
  },
  owner_preview_check_availability_result_page_viewed: {
    label: 'Evaluation — Viewed match result (client was routed elsewhere)',
    group: 'engagement', stage: 'engagement', weight: 6,
  },
  demo_post_availability_result_viewed: {
    label: 'Evaluation — Viewed match result (client was routed elsewhere)',
    group: 'engagement', stage: 'engagement', weight: 6,
  },
  owner_preview_missed_clients_cta_clicked: {
    label: 'High intent — Clicked to see missed client opportunities',
    group: 'high_intent', stage: 'high_intent', weight: 15,
  },
  owner_preview_missed_clients_page_viewed: {
    label: 'Interest — Viewed missed client opportunities',
    group: 'engagement', stage: 'engagement', weight: 6,
  },
  upgrade_positions_page_viewed: {
    label: 'Interest — Viewed missed client opportunities',
    group: 'engagement', stage: 'engagement', weight: 6,
  },
  owner_preview_activate_listing_cta_clicked: {
    label: 'High intent — Signaled intent to activate (CTA clicked)',
    group: 'high_intent', stage: 'high_intent', weight: 15,
  },
  activate_listing_clicked: {
    label: 'High intent — Signaled intent to activate (CTA clicked)',
    group: 'high_intent', stage: 'high_intent', weight: 15,
  },

  // Activation offer / upgrade
  activation_upsell_viewed: {
    label: 'Activation offer — Viewed upsell',
    group: 'engagement', stage: 'engagement', weight: 10,
  },
  activation_upgrade_viewed: {
    label: 'Activation offer — Viewed upgrade page',
    group: 'engagement', stage: 'engagement', weight: 10,
  },
  listing_activation_offer_page_viewed: {
    label: 'Activation offer — Viewed offer page',
    group: 'engagement', stage: 'engagement', weight: 10,
  },
  offer_viewed: {
    label: 'Activation offer — Viewed offer page',
    group: 'engagement', stage: 'engagement', weight: 10,
  },
  upsell_viewed: {
    label: 'Activation offer — Viewed upsell',
    group: 'engagement', stage: 'engagement', weight: 10,
  },

  // Top-25 upsell flow
  top25_upsell_viewed: {
    label: 'Top-25 upsell — Viewed upgrade offer page',
    group: 'engagement', stage: 'engagement', weight: 12,
  },
  top25_upgrade_selected: {
    label: 'Top-25 upsell — Selected upgrade position',
    group: 'high_intent', stage: 'high_intent', weight: 18,
  },
  top25_confirm_viewed: {
    label: 'Top-25 upsell — Viewed confirm/checkout page',
    group: 'high_intent', stage: 'high_intent', weight: 15,
  },

  // Checkout
  checkout_opened: {
    label: 'Purchase-ready — Reached Stripe checkout',
    group: 'checkout', stage: 'checkout', weight: 25,
  },
  checkout_started: {
    label: 'Purchase-ready — Reached Stripe checkout',
    group: 'checkout', stage: 'checkout', weight: 25,
  },
  checkout_page_viewed: {
    label: 'Purchase-ready — Reached Stripe checkout',
    group: 'checkout', stage: 'checkout', weight: 25,
  },
  stripe_checkout_opened: {
    label: 'Purchase-ready — Reached Stripe checkout',
    group: 'checkout', stage: 'checkout', weight: 25,
  },
  checkout_failed: {
    label: 'Checkout — Checkout failed',
    group: 'negative', stage: 'negative', weight: 0,
  },
  funnel_started: {
    label: 'Funnel — Started',
    group: 'view', stage: 'awareness', weight: 1,
  },

  // Sale / conversion
  listing_activated: {
    label: 'Converted — Listing activated (paid)',
    group: 'conversion', stage: 'conversion', weight: 30,
  },
  checkout_completed: {
    label: 'Converted — Listing activated (paid)',
    group: 'conversion', stage: 'conversion', weight: 30,
  },
  stripe_checkout_completed: {
    label: 'Converted — Listing activated (paid)',
    group: 'conversion', stage: 'conversion', weight: 30,
  },
  payment_succeeded: {
    label: 'Converted — Listing activated (paid)',
    group: 'conversion', stage: 'conversion', weight: 30,
  },
  stripe_payment_succeeded: {
    label: 'Converted — Listing activated (paid)',
    group: 'conversion', stage: 'conversion', weight: 30,
  },
  listing_activated_paid: {
    label: 'Converted — Listing activated (paid)',
    group: 'conversion', stage: 'conversion', weight: 30,
  },
  top25_purchase_completed: {
    label: 'Sale — Top 25 purchase completed',
    group: 'conversion', stage: 'conversion', weight: 25,
  },
  spotlight_purchase_completed: {
    label: 'Sale — Spotlight purchase completed',
    group: 'conversion', stage: 'conversion', weight: 25,
  },

  // Manage listing
  manage_listing_opened: {
    label: 'Manage listing — Opened manage listing',
    group: 'engagement', stage: 'engagement', weight: 3,
  },
  manage_remove_started: {
    label: 'Churn risk — Owner started removing their listing',
    group: 'negative', stage: 'negative', weight: -10,
  },
  manage_remove_confirmed: {
    label: 'Churn risk — Owner confirmed listing removal',
    group: 'negative', stage: 'negative', weight: -15,
  },
  manage_recovered: {
    label: 'Manage listing — Recovered listing',
    group: 'engagement', stage: 'engagement', weight: 5,
  },
  manage_listing_activate_clicked: {
    label: 'Manage listing — Clicked "Start receiving these clients"',
    group: 'high_intent', stage: 'high_intent', weight: 10,
  },

  // Request replay
  request_replay_opened: {
    label: 'Request replay — Opened replay page',
    group: 'engagement', stage: 'engagement', weight: 6,
  },
  request_replay_engaged: {
    label: 'Request replay — Engaged with replay',
    group: 'engagement', stage: 'engagement', weight: 6,
  },
  replay_opened: {
    label: 'Request replay — Opened replay page',
    group: 'engagement', stage: 'engagement', weight: 6,
  },
  replay_scene_view: {
    label: 'Request replay — Viewed replay scene',
    group: 'engagement', stage: 'engagement', weight: 3,
  },
  replay_auto_continue_started: {
    label: 'Request replay — Auto-continue started',
    group: 'engagement', stage: 'engagement', weight: 3,
  },
  replay_auto_continue_completed: {
    label: 'Request replay — Auto-continue completed',
    group: 'engagement', stage: 'engagement', weight: 3,
  },
  replay_cta_click: {
    label: 'Request replay — Clicked replay CTA',
    group: 'engagement', stage: 'engagement', weight: 6,
  },
  replay_completed: {
    label: 'Request replay — Completed replay',
    group: 'engagement', stage: 'engagement', weight: 6,
  },
  replay_abandoned: {
    label: 'Request replay — Abandoned replay',
    group: 'negative', stage: 'negative', weight: 0,
  },

  // Smart links (email)
  smart_link_opened: {
    label: 'Email — Opened smart link',
    group: 'engagement', stage: 'engagement', weight: 3,
  },
  smart_link_qualified_view: {
    label: 'Email — Qualified smart link view',
    group: 'engagement', stage: 'engagement', weight: 5,
  },

  // Generic fallbacks
  cta_click: {
    label: 'Generic — CTA clicked',
    group: 'engagement', stage: 'engagement', weight: 3,
  },
  form_submit: {
    label: 'Generic — Form submitted',
    group: 'engagement', stage: 'engagement', weight: 3,
  },
};

export function getEventMeta(eventName: string | null | undefined, rpcProvided?: Partial<EventMeta>): EventMeta {
  const key = (eventName || '').trim();
  const mapped = key ? EVENT_LABEL_MAP[key] : undefined;

  if (mapped) {
    return {
      label: rpcProvided?.label || mapped.label,
      group: (rpcProvided?.group as EventGroup) || mapped.group,
      stage: (rpcProvided?.stage as FunnelStage) || mapped.stage,
      weight: typeof rpcProvided?.weight === 'number' ? rpcProvided.weight : mapped.weight,
    };
  }

  const fallbackLabel = rpcProvided?.label || (key ? key.replace(/_/g, ' ') : 'Unknown event');
  return {
    label: fallbackLabel,
    group: (rpcProvided?.group as EventGroup) || 'view',
    stage: (rpcProvided?.stage as FunnelStage) || 'awareness',
    weight: typeof rpcProvided?.weight === 'number' ? rpcProvided.weight : 1,
  };
}

export { EVENT_LABEL_MAP };
