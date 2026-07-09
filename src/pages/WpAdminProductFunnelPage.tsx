import React, { useMemo, useState, useCallback, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import {
  TrendingUp, Flame, Users, Target, CheckCircle2, DollarSign,
  MousePointer, ShoppingCart, X, Copy, ExternalLink, RotateCw,
  Eye, Zap, RefreshCw, Download, Loader,
} from 'lucide-react';
import WpAdminLayout from '../components/wpadmin/WpAdminLayout';
import { useAdminFetch } from '../hooks/useAdminFetch';
import { adminFetch } from '../utils/adminFetch';
import { AdminErrorBanner, AdminLoadingState, AdminEmptyState } from '../components/admin/AdminErrorBanner';
import FunnelIntelligencePanel from '../components/admin/FunnelIntelligencePanel';
import { TrafficModeToggle, trafficModeToApiParam, type TrafficMode } from '../components/admin/TrafficModeToggle';
import { US_STATES } from '../lib/usStates';
import {
  normalizeFunnelEvent,
  stepToFunnelSource,
  inferRawSource,
  furthestStep,
  CANONICAL_STEP_LABELS,
  FUNNEL_FLOWS,
  FUNNEL_SOURCE_LABELS,
  ENGAGEMENT_MODULE_STEPS,
  ENGAGEMENT_MODULE_LABELS,
  UNIFIED_CONVERSION_STEPS,
  ATTRIBUTION_LABELS,
  type CanonicalStep,
  type FunnelSource,
  type RawEvent,
  type Attribution,
} from '../utils/productFunnelEvents';

type AttributionKind = 'direct' | 'inferred' | 'unknown';

const ATTRIBUTION_KIND_LABELS: Record<AttributionKind, string> = {
  direct: 'directly attributed',
  inferred: 'inferred from agency journey',
  unknown: 'unknown',
};

interface EventRow extends RawEvent {
  id: string;
  created_at: string;
  session_id: string | null;
  state_slug: string | null;
  agency_id: string | null;
  lead_email?: string | null;
  source_table?: string | null;
}

interface AgencyMetaRow {
  key: string;
  agency_id: string | null;
  name: string | null;
  slug: string | null;
  state_slug: string | null;
  website: string | null;
  description: string | null;
  is_paid: boolean;
  paid_source: string | null;
  is_removed: boolean;
  listing_status: string | null;
}

interface ApiResponse {
  window: { from: string | null; to: string | null; range: string };
  events: EventRow[];
  agencies: AgencyMetaRow[];
  sources?: Record<string, number>;
  source_errors?: Record<string, string | null>;
}

interface AgencyAggregate {
  key: string;
  agency_id: string | null;
  name: string;
  slug: string | null;
  state_slug: string | null;
  website: string | null;
  description: string | null;
  is_paid: boolean;
  is_removed: boolean;
  steps: Set<CanonicalStep>;
  lastEventAt: string;
  lastStep: CanonicalStep;
  entryFunnel: Attribution;
  lastAttribution: Attribution;
  lastConversionStep: CanonicalStep | null;
  lastConversionAttribution: Attribution | null;
  events: Array<{ step: CanonicalStep; at: string; raw: EventRow; attribution: Attribution; attributionKind: AttributionKind }>;
  lastConversionKind: AttributionKind | null;
  sessionSources: Map<string, Attribution>;
}

const RANGE_OPTIONS = [
  { value: '24h', label: 'Last 24h' },
  { value: '7d', label: 'Last 7 days' },
  { value: '30d', label: 'Last 30 days' },
  { value: '90d', label: 'Last 90 days' },
  { value: 'all', label: 'All time' },
];

function buildAgencyKey(meta: Record<string, unknown>, topAgencyId: string | null, stateSlug: string | null): string | null {
  const candidates = [
    topAgencyId,
    meta.agency_id,
    meta.aid,
    meta.agencyId,
  ];
  for (const c of candidates) {
    if (typeof c === 'string' && c.trim()) return `id:${c.trim()}`;
  }
  const aname = typeof meta.agency_name === 'string' ? (meta.agency_name as string).trim().toLowerCase() : '';
  const st = (stateSlug ?? (typeof meta.state_slug === 'string' ? meta.state_slug : ''))?.toLowerCase() ?? '';
  if (aname && st) return `ns:${aname}|${st}`;
  return null;
}

function relativeTime(iso: string): string {
  const d = new Date(iso).getTime();
  if (!Number.isFinite(d)) return '-';
  const diff = Date.now() - d;
  if (diff < 60_000) return 'just now';
  if (diff < 3_600_000) return `${Math.floor(diff / 60_000)}m ago`;
  if (diff < 86_400_000) return `${Math.floor(diff / 3_600_000)}h ago`;
  return `${Math.floor(diff / 86_400_000)}d ago`;
}

export default function WpAdminProductFunnelPage() {
  const navigate = useNavigate();
  const [range, setRange] = useState('30d');
  const [funnelFilter, setFunnelFilter] = useState<FunnelSource | 'all'>('all');
  const [stateFilter, setStateFilter] = useState('all');
  const [paidFilter, setPaidFilter] = useState<'all' | 'paid' | 'unpaid'>('unpaid');
  const [includeRemoved, setIncludeRemoved] = useState(false);
  const [includeDemo, setIncludeDemo] = useState(false);
  const [trafficMode, setTrafficMode] = useState<TrafficMode>('all');
  const [detailAgency, setDetailAgency] = useState<AgencyAggregate | null>(null);
  const [copied, setCopied] = useState<string | null>(null);
  const [selectedAgencyIds, setSelectedAgencyIds] = useState<Set<string>>(new Set());
  const [hiExporting, setHiExporting] = useState(false);
  const [hiExportError, setHiExportError] = useState('');
  const [hiDiscountMode, setHiDiscountMode] = useState<'none' | 'existing' | 'auto_create'>('existing');

  const functionPath = useMemo(() => {
    const params = new URLSearchParams();
    params.set('range', range);
    if (stateFilter !== 'all') params.set('state_slugs', stateFilter);
    if (includeRemoved) params.set('include_removed', '1');
    if (includeDemo) params.set('include_demo', '1');
    const tmParam = trafficModeToApiParam(trafficMode);
    if (tmParam) params.set('confidence_filter', tmParam);
    return `wpadmin-product-funnel?${params.toString()}`;
  }, [range, stateFilter, includeRemoved, includeDemo, trafficMode]);

  const { data, isLoading, isError, error, refetch } = useAdminFetch<ApiResponse>(functionPath, {
    deps: [range, stateFilter, includeRemoved, includeDemo, trafficMode],
  });

  const agencyMetaMap = useMemo(() => {
    const map = new Map<string, AgencyMetaRow>();
    for (const a of data?.agencies ?? []) map.set(a.key, a);
    return map;
  }, [data]);

  const {
    agencies, totals, rawStepCounts, fallbackMatchedCounts, unmappedCounts, moduleStats,
    attributedStepCounts, globalStepCounts, checkoutSourceBreakdown, activationSourceBreakdown,
    verifiedFlows, trackingQuality, verifiedConversion, sourceSplit, highIntent,
  } = useMemo(() => {
    const aggMap = new Map<string, AgencyAggregate>();
    const rawCounts: Partial<Record<CanonicalStep, number>> = {};
    const fallbackCounts: Partial<Record<CanonicalStep, number>> = {};
    const unmapped = new Map<string, number>();
    const globalCounts: Partial<Record<CanonicalStep, number>> = {};
    const attributedCounts: Record<Attribution, Partial<Record<CanonicalStep, number>>> = {
      your_agency: {}, request_replay: {}, manage_listing: {}, unknown: {},
    };

    // Tracking quality diagnostics
    let totalMapped = 0;
    let withAgencyId = 0;
    let withSessionId = 0;
    let activationEvents = 0;
    let activationWithSource = 0;
    let checkoutEvents = 0;
    let checkoutWithSource = 0;
    const eventsMissingAttribution = new Map<string, number>();

    // Per-session timeline for verified same-session flows
    const sessionTimelines = new Map<string, Array<{ step: CanonicalStep; at: string; source: FunnelSource | null }>>();

    if (data?.events && typeof window !== 'undefined') {
      const distinct = new Map<string, number>();
      for (const ev of data.events) {
        const k = (ev.event_name ?? '').toString();
        if (!k) continue;
        distinct.set(k, (distinct.get(k) ?? 0) + 1);
      }
      const sorted = Array.from(distinct.entries()).sort((a, b) => b[1] - a[1]);
      // eslint-disable-next-line no-console
      console.log('[ProductFunnel] distinct event_name counts:', sorted);
    }

    const sortedEvents = [...(data?.events ?? [])].sort(
      (a, b) => new Date(a.created_at).getTime() - new Date(b.created_at).getTime(),
    );

    for (const ev of sortedEvents) {
      const canonical = normalizeFunnelEvent({
        event_name: ev.event_name,
        funnel_type: ev.funnel_type,
        funnel_name: ev.funnel_name,
        page_path: ev.page_path,
        metadata: ev.metadata ?? undefined,
        is_demo: ev.is_demo,
      });
      if (!canonical) {
        const k = (ev.event_name ?? '').toString();
        if (k) unmapped.set(k, (unmapped.get(k) ?? 0) + 1);
        continue;
      }

      rawCounts[canonical] = (rawCounts[canonical] ?? 0) + 1;
      globalCounts[canonical] = (globalCounts[canonical] ?? 0) + 1;

      totalMapped += 1;
      if (typeof ev.agency_id === 'string' && ev.agency_id.trim()) withAgencyId += 1;
      if (typeof ev.session_id === 'string' && ev.session_id.trim()) withSessionId += 1;
      const evStepSrc = stepToFunnelSource(canonical);
      const evRawSrc = inferRawSource(ev);
      const hasDirectSource = !!(evStepSrc || evRawSrc);
      const isActivationEv = canonical === 'activation_page_viewed' || canonical === 'activation_cta_clicked';
      const isCheckoutEv = canonical === 'checkout_opened' || canonical === 'checkout_started';
      if (isActivationEv) {
        activationEvents += 1;
        if (hasDirectSource) activationWithSource += 1;
      }
      if (isCheckoutEv) {
        checkoutEvents += 1;
        if (hasDirectSource) checkoutWithSource += 1;
      }
      if (!hasDirectSource && (isActivationEv || isCheckoutEv) && !ev.session_id) {
        const name = (ev.event_name ?? '').toString();
        if (name) eventsMissingAttribution.set(name, (eventsMissingAttribution.get(name) ?? 0) + 1);
      }

      // Per-session timeline
      if (ev.session_id && ev.session_id.trim()) {
        const sId = ev.session_id.trim();
        const list = sessionTimelines.get(sId) ?? [];
        list.push({ step: canonical, at: ev.created_at, source: evStepSrc ?? evRawSrc });
        sessionTimelines.set(sId, list);
      }

      const meta = (ev.metadata ?? {}) as Record<string, unknown>;
      const topId = typeof ev.agency_id === 'string' && ev.agency_id.trim() ? ev.agency_id.trim() : null;
      const aKey = buildAgencyKey(meta, topId, ev.state_slug);
      if (!aKey) continue;
      if (aKey.startsWith('ns:')) {
        fallbackCounts[canonical] = (fallbackCounts[canonical] ?? 0) + 1;
      }
      const metaRow = agencyMetaMap.get(aKey) ?? null;
      const isRemoved = metaRow?.is_removed ?? false;
      const isPaid = metaRow?.is_paid ?? false;

      let agg = aggMap.get(aKey);
      if (!agg) {
        const name = metaRow?.name
          || (typeof meta.agency_name === 'string' ? (meta.agency_name as string) : '')
          || 'Unknown';
        agg = {
          key: aKey,
          agency_id: metaRow?.agency_id ?? (typeof meta.agency_id === 'string' ? (meta.agency_id as string) : null),
          name,
          slug: metaRow?.slug ?? null,
          state_slug: metaRow?.state_slug ?? ev.state_slug ?? null,
          website: metaRow?.website ?? null,
          description: metaRow?.description ?? null,
          is_paid: isPaid,
          is_removed: isRemoved,
          steps: new Set<CanonicalStep>(),
          lastEventAt: ev.created_at,
          lastStep: canonical,
          entryFunnel: 'unknown',
          lastAttribution: 'unknown',
          lastConversionStep: null,
          lastConversionAttribution: null,
          events: [],
          sessionSources: new Map<string, Attribution>(),
          lastConversionKind: null,
        };
        aggMap.set(aKey, agg);
      }

      // Determine attribution + kind
      const stepSrc = stepToFunnelSource(canonical);
      const rawSrc = inferRawSource(ev);
      let attribution: Attribution = 'unknown';
      let attributionKind: AttributionKind = 'unknown';

      if (stepSrc) {
        attribution = stepSrc;
        attributionKind = 'direct';
      } else if (rawSrc) {
        attribution = rawSrc;
        attributionKind = 'direct';
      } else {
        const sessionId = ev.session_id ?? null;
        if (sessionId && agg.sessionSources.has(sessionId)) {
          attribution = agg.sessionSources.get(sessionId)!;
          attributionKind = 'inferred';
        } else if (agg.entryFunnel !== 'unknown') {
          attribution = agg.entryFunnel;
          attributionKind = 'inferred';
        } else {
          attribution = 'unknown';
          attributionKind = 'unknown';
        }
      }

      // Record session source mapping (earliest entry-funnel event wins)
      if (stepSrc && ev.session_id && !agg.sessionSources.has(ev.session_id)) {
        agg.sessionSources.set(ev.session_id, stepSrc);
      }
      if (agg.entryFunnel === 'unknown' && attribution !== 'unknown') {
        agg.entryFunnel = attribution;
      }

      agg.steps.add(canonical);
      agg.events.push({ step: canonical, at: ev.created_at, raw: ev, attribution, attributionKind });
      if (new Date(ev.created_at) >= new Date(agg.lastEventAt)) {
        agg.lastEventAt = ev.created_at;
        agg.lastAttribution = attribution;
      }
      const f = furthestStep(Array.from(agg.steps));
      if (f) agg.lastStep = f;

      const isConversion = canonical === 'activation_page_viewed' || canonical === 'checkout_opened'
        || canonical === 'checkout_started' || canonical === 'purchase_completed';
      if (isConversion) {
        agg.lastConversionStep = canonical;
        agg.lastConversionAttribution = attribution;
        agg.lastConversionKind = attributionKind;
      }

      attributedCounts[attribution][canonical] = (attributedCounts[attribution][canonical] ?? 0) + 1;
    }

    const list = Array.from(aggMap.values()).sort(
      (a, b) => new Date(b.lastEventAt).getTime() - new Date(a.lastEventAt).getTime(),
    );

    // Apply funnel filter (filter agencies whose entry funnel doesn't match)
    const filtered = funnelFilter === 'all'
      ? list
      : list.filter((a) => a.entryFunnel === funnelFilter);

    // Per-funnel unique-agency step counts: count an agency for a step only if it has an
    // event of that step attributed to that funnel.
    const perFunnelUnique: Record<Attribution, Partial<Record<CanonicalStep, number>>> = {
      your_agency: {}, request_replay: {}, manage_listing: {}, unknown: {},
    };
    for (const ag of filtered) {
      const stepAttribs = new Map<CanonicalStep, Set<Attribution>>();
      for (const e of ag.events) {
        if (!stepAttribs.has(e.step)) stepAttribs.set(e.step, new Set());
        stepAttribs.get(e.step)!.add(e.attribution);
      }
      for (const [step, attribs] of stepAttribs.entries()) {
        for (const a of attribs) {
          perFunnelUnique[a][step] = (perFunnelUnique[a][step] ?? 0) + 1;
        }
      }
    }

    // Global (any-entry) unique-agency step counts for the unified card
    const globalUnique: Partial<Record<CanonicalStep, number>> = {};
    for (const ag of filtered) {
      for (const s of ag.steps) {
        globalUnique[s] = (globalUnique[s] ?? 0) + 1;
      }
    }

    const moduleStats: Record<string, { unique: number; raw: number; byFunnel: Record<FunnelSource, number> }> = {};
    for (const step of ENGAGEMENT_MODULE_STEPS) {
      moduleStats[step] = {
        unique: 0,
        raw: rawCounts[step] ?? 0,
        byFunnel: { your_agency: 0, request_replay: 0, manage_listing: 0 },
      };
    }
    for (const ag of filtered) {
      if (!ag.steps.size) continue;
      const perStepAttribs = new Map<CanonicalStep, Set<Attribution>>();
      for (const e of ag.events) {
        if (!perStepAttribs.has(e.step)) perStepAttribs.set(e.step, new Set());
        perStepAttribs.get(e.step)!.add(e.attribution);
      }
      for (const step of ENGAGEMENT_MODULE_STEPS) {
        const attribs = perStepAttribs.get(step);
        if (!attribs) continue;
        moduleStats[step].unique += 1;
        for (const a of attribs) {
          if (a !== 'unknown') moduleStats[step].byFunnel[a] += 1;
        }
      }
    }

    const checkoutSourceBreakdown: Record<Attribution, number> = {
      your_agency: (attributedCounts.your_agency.checkout_opened ?? 0) + (attributedCounts.your_agency.checkout_started ?? 0),
      request_replay: (attributedCounts.request_replay.checkout_opened ?? 0) + (attributedCounts.request_replay.checkout_started ?? 0),
      manage_listing: (attributedCounts.manage_listing.checkout_opened ?? 0) + (attributedCounts.manage_listing.checkout_started ?? 0),
      unknown: (attributedCounts.unknown.checkout_opened ?? 0) + (attributedCounts.unknown.checkout_started ?? 0),
    };
    const activationSourceBreakdown: Record<Attribution, number> = {
      your_agency: attributedCounts.your_agency.activation_page_viewed ?? 0,
      request_replay: attributedCounts.request_replay.activation_page_viewed ?? 0,
      manage_listing: attributedCounts.manage_listing.activation_page_viewed ?? 0,
      unknown: attributedCounts.unknown.activation_page_viewed ?? 0,
    };

    const c = (s: CanonicalStep) => globalUnique[s] ?? 0;
    const checkoutCount = c('checkout_opened') + c('checkout_started');
    const purchaseCount = c('purchase_completed');
    const activationCount = c('activation_page_viewed');
    const convRate = activationCount > 0 ? Math.round((purchaseCount / activationCount) * 100) : 0;

    // Verified same-session flows: entry source → activation_page_viewed → checkout_opened
    const verifiedFlows: Record<FunnelSource, {
      sessionsWithEntry: number;
      entryToActivation: number;
      activationToCheckout: number;
      entryToCheckout: number;
      entryToPurchase: number;
    }> = {
      your_agency: { sessionsWithEntry: 0, entryToActivation: 0, activationToCheckout: 0, entryToCheckout: 0, entryToPurchase: 0 },
      request_replay: { sessionsWithEntry: 0, entryToActivation: 0, activationToCheckout: 0, entryToCheckout: 0, entryToPurchase: 0 },
      manage_listing: { sessionsWithEntry: 0, entryToActivation: 0, activationToCheckout: 0, entryToCheckout: 0, entryToPurchase: 0 },
    };
    for (const timeline of sessionTimelines.values()) {
      timeline.sort((a, b) => new Date(a.at).getTime() - new Date(b.at).getTime());
      // Find first entry source step
      let entrySrc: FunnelSource | null = null;
      let entryIdx = -1;
      for (let i = 0; i < timeline.length; i++) {
        const stepSrc = stepToFunnelSource(timeline[i].step);
        if (stepSrc) { entrySrc = stepSrc; entryIdx = i; break; }
      }
      if (!entrySrc || entryIdx < 0) continue;
      const vf = verifiedFlows[entrySrc];
      vf.sessionsWithEntry += 1;
      let activationIdx = -1;
      for (let i = entryIdx + 1; i < timeline.length; i++) {
        if (timeline[i].step === 'activation_page_viewed') { activationIdx = i; break; }
      }
      if (activationIdx < 0) continue;
      vf.entryToActivation += 1;
      let checkoutIdx = -1;
      for (let i = activationIdx + 1; i < timeline.length; i++) {
        if (timeline[i].step === 'checkout_opened' || timeline[i].step === 'checkout_started') {
          checkoutIdx = i; break;
        }
      }
      if (checkoutIdx >= 0) {
        vf.activationToCheckout += 1;
        vf.entryToCheckout += 1;
        for (let i = checkoutIdx + 1; i < timeline.length; i++) {
          if (timeline[i].step === 'purchase_completed') { vf.entryToPurchase += 1; break; }
        }
      }
    }

    // Unknown attribution total (any event with 'unknown' attribution)
    let unknownAttrCount = 0;
    for (const ag of aggMap.values()) {
      for (const e of ag.events) {
        if (e.attribution === 'unknown') unknownAttrCount += 1;
      }
    }

    const trackingQuality = {
      totalMapped,
      pctAgencyId: totalMapped ? Math.round((withAgencyId / totalMapped) * 100) : 0,
      pctSessionId: totalMapped ? Math.round((withSessionId / totalMapped) * 100) : 0,
      activationEvents,
      pctActivationWithSource: activationEvents ? Math.round((activationWithSource / activationEvents) * 100) : 0,
      checkoutEvents,
      pctCheckoutWithSource: checkoutEvents ? Math.round((checkoutWithSource / checkoutEvents) * 100) : 0,
      pctUnknownAttribution: totalMapped ? Math.round((unknownAttrCount / totalMapped) * 100) : 0,
      topMissingAttribution: Array.from(eventsMissingAttribution.entries())
        .sort((a, b) => b[1] - a[1])
        .slice(0, 10),
    };

    // ── Verified conversion per funnel (session-based, strict chronological order)
    const verifiedConversion: Record<Attribution, {
      sessions_entered: number;
      sessions_reached_activation: number;
      sessions_reached_checkout: number;
      sessions_reached_purchase: number;
    }> = {
      your_agency: { sessions_entered: 0, sessions_reached_activation: 0, sessions_reached_checkout: 0, sessions_reached_purchase: 0 },
      request_replay: { sessions_entered: 0, sessions_reached_activation: 0, sessions_reached_checkout: 0, sessions_reached_purchase: 0 },
      manage_listing: { sessions_entered: 0, sessions_reached_activation: 0, sessions_reached_checkout: 0, sessions_reached_purchase: 0 },
      unknown: { sessions_entered: 0, sessions_reached_activation: 0, sessions_reached_checkout: 0, sessions_reached_purchase: 0 },
    };
    for (const timeline of sessionTimelines.values()) {
      timeline.sort((a, b) => new Date(a.at).getTime() - new Date(b.at).getTime());
      if (!timeline.length) continue;
      // Entry funnel = first event that maps to a funnel source (stepToFunnelSource)
      let entryFunnel: Attribution = 'unknown';
      for (const t of timeline) {
        if (t.source) { entryFunnel = t.source; break; }
      }
      const vc = verifiedConversion[entryFunnel];
      vc.sessions_entered += 1;
      let activationIdx = -1;
      for (let i = 0; i < timeline.length; i++) {
        if (timeline[i].step === 'activation_page_viewed') { activationIdx = i; break; }
      }
      if (activationIdx < 0) continue;
      vc.sessions_reached_activation += 1;
      let checkoutIdx = -1;
      for (let i = activationIdx + 1; i < timeline.length; i++) {
        if (timeline[i].step === 'checkout_opened' || timeline[i].step === 'checkout_started') {
          checkoutIdx = i; break;
        }
      }
      if (checkoutIdx < 0) continue;
      vc.sessions_reached_checkout += 1;
      for (let i = checkoutIdx + 1; i < timeline.length; i++) {
        if (timeline[i].step === 'purchase_completed') {
          vc.sessions_reached_purchase += 1; break;
        }
      }
    }

    // ── Product events vs notification logs split per canonical step
    const PRODUCT_TABLES = new Set([
      'funnel_events', 'your_agency_funnel_events', 'manage_funnel_events', 'owner_demo_events',
    ]);
    const sourceSplit: Partial<Record<CanonicalStep, { product: number; notification: number; total: number }>> = {};
    for (const ev of sortedEvents) {
      const canonical = normalizeFunnelEvent({
        event_name: ev.event_name,
        funnel_type: ev.funnel_type,
        funnel_name: ev.funnel_name,
        page_path: ev.page_path,
        metadata: ev.metadata ?? undefined,
        is_demo: ev.is_demo,
      });
      if (!canonical) continue;
      const src = ev.source_table ?? '';
      const bucket = sourceSplit[canonical] ?? { product: 0, notification: 0, total: 0 };
      if (PRODUCT_TABLES.has(src)) bucket.product += 1;
      else if (src === 'email_notification_logs') bucket.notification += 1;
      bucket.total += 1;
      sourceSplit[canonical] = bucket;
    }

    // ── High Intent: agency has activation + checkout but no purchase
    const highIntent = Array.from(aggMap.values())
      .filter((ag) => {
        if (ag.is_removed && !includeRemoved) return false;
        const has = (s: CanonicalStep) => ag.steps.has(s);
        const viewedActivation = has('activation_page_viewed');
        const openedCheckout = has('checkout_opened') || has('checkout_started');
        const purchased = has('purchase_completed');
        return viewedActivation && openedCheckout && !purchased;
      })
      .map((ag) => ({
        key: ag.key,
        agency_id: ag.agency_id,
        name: ag.name,
        state_slug: ag.state_slug,
        entryFunnel: ag.entryFunnel,
        lastAttribution: ag.lastAttribution,
        lastEventAt: ag.lastEventAt,
        is_paid: ag.is_paid,
        checkoutOpens: ag.events.filter((e) => e.step === 'checkout_opened' || e.step === 'checkout_started').length,
      }))
      .sort((a, b) => new Date(b.lastEventAt).getTime() - new Date(a.lastEventAt).getTime());

    return {
      agencies: filtered,
      totals: {
        totalAgencies: filtered.length,
        perStepCounts: globalUnique,
        checkoutCount,
        purchaseCount,
        activationCount,
        availabilityOpened: c('check_availability_opened'),
        availabilitySubmitted: c('check_availability_submitted'),
        yourAgencyVisits: c('your_agency_visit'),
        replayOpened: c('request_replay_opened'),
        manageOpened: c('manage_listing_opened'),
        removed: c('listing_removed'),
        convRate,
      },
      rawStepCounts: rawCounts,
      fallbackMatchedCounts: fallbackCounts,
      unmappedCounts: Array.from(unmapped.entries()).sort((a, b) => b[1] - a[1]),
      moduleStats,
      attributedStepCounts: perFunnelUnique,
      globalStepCounts: globalUnique,
      checkoutSourceBreakdown,
      activationSourceBreakdown,
      verifiedFlows,
      trackingQuality,
      verifiedConversion,
      sourceSplit,
      highIntent,
    };
  }, [data, funnelFilter, agencyMetaMap, includeRemoved]);

  const copy = useCallback(async (text: string, label: string) => {
    try {
      await navigator.clipboard.writeText(text);
      setCopied(label);
      setTimeout(() => setCopied(null), 1500);
    } catch {
      /* noop */
    }
  }, []);

  const openLookup = useCallback((ag: AgencyAggregate) => {
    const params = new URLSearchParams();
    if (ag.agency_id) params.set('agency_id', ag.agency_id);
    else {
      if (ag.name) params.set('name', ag.name);
      if (ag.state_slug) params.set('state', ag.state_slug);
    }
    navigate(`/wp-admin/email/agency-lookup?${params.toString()}`);
  }, [navigate]);

  const visibleHighIntent = useMemo(() => highIntent.slice(0, 300), [highIntent]);
  const selectableHighIntentIds = useMemo(() => new Set(visibleHighIntent.filter(a => a.agency_id).map(a => a.agency_id!)), [visibleHighIntent]);

  useEffect(() => {
    setSelectedAgencyIds(prev => {
      const intersected = new Set([...prev].filter(id => selectableHighIntentIds.has(id)));
      return intersected.size === prev.size ? prev : intersected;
    });
  }, [selectableHighIntentIds]);

  const handleHiSelectAll = useCallback((checked: boolean) => {
    setSelectedAgencyIds(checked ? new Set(selectableHighIntentIds) : new Set());
  }, [selectableHighIntentIds]);

  const handleHiToggle = useCallback((agencyId: string) => {
    setSelectedAgencyIds(prev => {
      const next = new Set(prev);
      if (next.has(agencyId)) next.delete(agencyId);
      else next.add(agencyId);
      return next;
    });
  }, []);

  const handleHiExport = useCallback(async () => {
    if (selectedAgencyIds.size === 0) return;
    setHiExporting(true);
    setHiExportError('');
    try {
      const params = new URLSearchParams();
      params.set('agency_ids', Array.from(selectedAgencyIds).join(','));
      params.set('send_mode', 'one_per_agency');
      if (hiDiscountMode !== 'none') params.set('discount_link_mode', hiDiscountMode);
      const res = await adminFetch(`smartlead-export-eligible-contacts?${params}`);
      if (!res.ok) {
        const d = await res.json().catch(() => ({}));
        throw new Error(d?.message || d?.error || `HTTP ${res.status}`);
      }
      const blob = await res.blob();
      const u = window.URL.createObjectURL(blob);
      const a = document.createElement('a');
      a.href = u;
      a.download = `high-intent-smartlead-export-${new Date().toISOString().split('T')[0]}.csv`;
      document.body.appendChild(a);
      a.click();
      a.remove();
      setTimeout(() => window.URL.revokeObjectURL(u), 5000);
    } catch (err) {
      setHiExportError(err instanceof Error ? err.message : 'Export failed');
    } finally {
      setHiExporting(false);
    }
  }, [selectedAgencyIds, hiDiscountMode]);

  const hotAgencies = useMemo(
    () => agencies.filter((a) => {
      if (!includeRemoved && a.is_removed) return false;
      if (paidFilter === 'paid' && !a.is_paid) return false;
      if (paidFilter === 'unpaid' && a.is_paid) return false;
      return true;
    }).slice(0, 200),
    [agencies, paidFilter, includeRemoved],
  );

  const origin = typeof window !== 'undefined' ? window.location.origin : '';

  return (
    <WpAdminLayout title="Product Funnel" subtitle="3 entry funnels + shared engagement modules, unified by activation → checkout → purchase.">
      <div className="px-4 sm:px-6 lg:px-8 py-6 max-w-[1600px] mx-auto">
        <header className="mb-6 flex items-start justify-between gap-4 flex-wrap">
          <div>
            <h1 className="text-2xl font-semibold text-slate-900 flex items-center gap-2">
              <Flame className="w-6 h-6 text-orange-500" />
              Product Funnel Intelligence
            </h1>
            <p className="text-sm text-slate-600 mt-1">
              3 entry funnels (Your Agency, Request Replay, Manage Listing) + shared modules. Unified conversion: any entry → activation → checkout → purchase.
            </p>
          </div>
          <button
            onClick={() => refetch()}
            className="inline-flex items-center gap-2 border border-slate-300 rounded-md px-3 py-2 text-sm bg-white hover:bg-slate-50"
          >
            <RefreshCw className="w-4 h-4" /> Refresh
          </button>
        </header>

        <div className="bg-white border border-slate-200 rounded-lg p-4 mb-6">
          <div className="flex flex-wrap gap-3 items-end">
            <div>
              <label className="block text-xs font-medium text-slate-600 mb-1">Date range</label>
              <select
                value={range}
                onChange={(e) => setRange(e.target.value)}
                className="border border-slate-300 rounded-md px-3 py-2 text-sm bg-white"
              >
                {RANGE_OPTIONS.map((r) => (
                  <option key={r.value} value={r.value}>{r.label}</option>
                ))}
              </select>
            </div>
            <div>
              <label className="block text-xs font-medium text-slate-600 mb-1">Funnel</label>
              <select
                value={funnelFilter}
                onChange={(e) => setFunnelFilter(e.target.value as FunnelSource | 'all')}
                className="border border-slate-300 rounded-md px-3 py-2 text-sm bg-white"
              >
                <option value="all">All funnels</option>
                {(Object.keys(FUNNEL_SOURCE_LABELS) as FunnelSource[]).map((s) => (
                  <option key={s} value={s}>{FUNNEL_SOURCE_LABELS[s]}</option>
                ))}
              </select>
            </div>
            <div>
              <label className="block text-xs font-medium text-slate-600 mb-1">State</label>
              <select
                value={stateFilter}
                onChange={(e) => setStateFilter(e.target.value)}
                className="border border-slate-300 rounded-md px-3 py-2 text-sm bg-white"
              >
                <option value="all">All states</option>
                {US_STATES.map((s) => (
                  <option key={s.slug} value={s.slug}>{s.name}</option>
                ))}
              </select>
            </div>
            <div>
              <label className="block text-xs font-medium text-slate-600 mb-1">Paid status</label>
              <select
                value={paidFilter}
                onChange={(e) => setPaidFilter(e.target.value as 'all' | 'paid' | 'unpaid')}
                className="border border-slate-300 rounded-md px-3 py-2 text-sm bg-white"
              >
                <option value="unpaid">Unpaid only (hot)</option>
                <option value="paid">Paid only</option>
                <option value="all">All</option>
              </select>
            </div>
            <label className="inline-flex items-center gap-2 text-sm text-slate-700">
              <input
                type="checkbox"
                checked={includeRemoved}
                onChange={(e) => setIncludeRemoved(e.target.checked)}
                className="rounded border-slate-300"
              />
              Include removed
            </label>
            <label className="inline-flex items-center gap-2 text-sm text-slate-700">
              <input
                type="checkbox"
                checked={includeDemo}
                onChange={(e) => setIncludeDemo(e.target.checked)}
                className="rounded border-slate-300"
              />
              Include demo
            </label>
          </div>
        </div>

        <TrafficModeToggle value={trafficMode} onChange={setTrafficMode} compact />

        {isLoading && <AdminLoadingState message="Loading product funnel events..." />}
        {isError && error && <AdminErrorBanner error={error} onRetry={refetch} />}

        {!isLoading && !isError && data?.source_errors && Object.values(data.source_errors).some((v) => v) && (
          <div className="mb-4 bg-amber-50 border border-amber-200 rounded-md p-3 text-sm text-amber-900">
            <div className="font-semibold mb-1">Source errors (partial data)</div>
            <ul className="list-disc pl-5 text-xs">
              {Object.entries(data.source_errors).map(([src, msg]) =>
                msg ? <li key={src}><span className="font-mono">{src}</span>: {msg}</li> : null,
              )}
            </ul>
          </div>
        )}

        {!isLoading && !isError && data?.sources && (
          <div className="mb-4 text-xs text-slate-500 flex flex-wrap gap-3">
            <span className="font-semibold text-slate-700">Event sources:</span>
            {Object.entries(data.sources).map(([src, n]) => (
              <span key={src} className="font-mono">{src}: {n}</span>
            ))}
            <span className="italic">Raw pre-filter event counts (before traffic mode filtering). Unique agency counts are authoritative.</span>
          </div>
        )}

        {!isLoading && !isError && (
          <>
            <section className="grid grid-cols-2 sm:grid-cols-3 lg:grid-cols-5 gap-3 mb-6">
              <SummaryCard icon={<Users className="w-5 h-5 text-blue-600" />} label="Unique agencies" value={totals.totalAgencies} />
              <SummaryCard icon={<Eye className="w-5 h-5 text-slate-600" />} label="/your-agency entry visits" value={totals.yourAgencyVisits} />
              <SummaryCard icon={<RotateCw className="w-5 h-5 text-amber-600" />} label="Replay opens" value={totals.replayOpened} />
              <SummaryCard icon={<Target className="w-5 h-5 text-emerald-600" />} label="Availability opens" value={totals.availabilityOpened} />
              <SummaryCard icon={<Zap className="w-5 h-5 text-orange-600" />} label="Activation views (global)" value={totals.activationCount} />
              <SummaryCard icon={<MousePointer className="w-5 h-5 text-blue-600" />} label="Manage opens" value={totals.manageOpened} />
              <SummaryCard icon={<ShoppingCart className="w-5 h-5 text-blue-600" />} label="Checkout events (global)" value={totals.checkoutCount} />
              <SummaryCard icon={<CheckCircle2 className="w-5 h-5 text-emerald-600" />} label="Purchases (global)" value={totals.purchaseCount} />
              <SummaryCard icon={<DollarSign className="w-5 h-5 text-emerald-700" />} label="Activation→Paid" value={`${totals.convRate}%`} />
              <SummaryCard icon={<TrendingUp className="w-5 h-5 text-rose-600" />} label="Listing removed" value={totals.removed} />
            </section>

            <FunnelIntelligencePanel trafficMode={trafficMode} />

            {totals.availabilitySubmitted > totals.availabilityOpened && (
              <div className="mb-4 bg-amber-50 border border-amber-200 rounded-md p-3 text-xs text-amber-900">
                Some submissions were recorded without a matching open event (submitted={totals.availabilitySubmitted}, opened={totals.availabilityOpened}).
              </div>
            )}

            <section className="bg-white border border-slate-200 rounded-lg mb-6 p-4">
              <div className="flex items-center justify-between mb-3">
                <h2 className="text-sm font-semibold text-slate-900">Checkout / Activation source breakdown</h2>
                <span className="text-xs text-slate-500">Raw events grouped by inferred attribution</span>
              </div>
              <div className="grid grid-cols-2 md:grid-cols-4 gap-3 text-sm">
                {(['your_agency', 'request_replay', 'manage_listing', 'unknown'] as Attribution[]).map((a) => (
                  <div key={a} className="border border-slate-200 rounded-md p-3">
                    <div className="text-xs text-slate-500 uppercase tracking-wide">{ATTRIBUTION_LABELS[a]}</div>
                    <div className="flex justify-between mt-1"><span className="text-slate-600">Activation</span><span className="font-semibold text-slate-900">{activationSourceBreakdown[a]}</span></div>
                    <div className="flex justify-between"><span className="text-slate-600">Checkout</span><span className="font-semibold text-slate-900">{checkoutSourceBreakdown[a]}</span></div>
                  </div>
                ))}
              </div>
            </section>

            <section className="bg-white border border-slate-200 rounded-lg mb-6 overflow-hidden">
              <div className="px-4 py-3 border-b border-slate-200 flex items-center justify-between">
                <h2 className="text-sm font-semibold text-slate-900">Step breakdown (grouped by funnel)</h2>
                <span className="text-xs text-slate-500">Unique agencies are attribution-specific per funnel. Raw/fallback columns are global (not attribution-filtered).</span>
              </div>
              <div className="overflow-x-auto">
                <table className="min-w-full text-sm">
                  <thead className="bg-slate-50 text-xs uppercase tracking-wide text-slate-600">
                    <tr>
                      <th className="text-left px-4 py-2">Step</th>
                      <th className="text-left px-4 py-2">Funnel</th>
                      <th className="text-right px-4 py-2">Unique agencies</th>
                      <th className="text-right px-4 py-2">Global raw events</th>
                      <th className="text-right px-4 py-2">Global fallback matched</th>
                      <th className="text-right px-4 py-2">Conv % (vs prev in funnel)</th>
                      <th className="text-right px-4 py-2">Drop-off %</th>
                    </tr>
                  </thead>
                  <tbody>
                    {FUNNEL_FLOWS.map((flow) => (
                      <React.Fragment key={flow.source}>
                        <tr className="bg-slate-100/60">
                          <td colSpan={7} className="px-4 py-2 text-xs font-semibold text-slate-700 uppercase tracking-wide">
                            {flow.label} (only events attributed to this funnel)
                          </td>
                        </tr>
                        {flow.steps.map((step, idx) => {
                          const funnelCounts = attributedStepCounts[flow.source];
                          const n = funnelCounts[step] ?? 0;
                          const raw = rawStepCounts[step] ?? 0;
                          const fallback = fallbackMatchedCounts[step] ?? 0;
                          const prev = idx > 0 ? (funnelCounts[flow.steps[idx - 1]] ?? 0) : 0;
                          const convPct = idx === 0 ? null : (prev > 0 ? (n / prev) * 100 : 0);
                          const dropPct = convPct === null ? null : Math.max(0, 100 - convPct);
                          return (
                            <tr key={`${flow.source}-${step}`} className="border-t border-slate-100">
                              <td className="px-4 py-2 text-slate-900">
                                {CANONICAL_STEP_LABELS[step]}
                                {(step === 'check_availability_opened' || step === 'check_availability_submitted') && (
                                  <span className="ml-2 text-xs text-slate-500 italic">(module interaction, not a required linear step)</span>
                                )}
                              </td>
                              <td className="px-4 py-2 text-slate-600">{flow.label}</td>
                              <td className="px-4 py-2 text-right font-medium text-slate-900">{n}</td>
                              <td className="px-4 py-2 text-right text-slate-700">{raw}</td>
                              <td className="px-4 py-2 text-right text-slate-500">{fallback}</td>
                              <td className="px-4 py-2 text-right text-slate-700">
                                {convPct === null ? '-' : `${convPct.toFixed(1)}%`}
                              </td>
                              <td className="px-4 py-2 text-right text-rose-700">
                                {dropPct === null ? '-' : `${dropPct.toFixed(1)}%`}
                              </td>
                            </tr>
                          );
                        })}
                      </React.Fragment>
                    ))}
                  </tbody>
                </table>
              </div>
            </section>

            <section className="bg-white border border-slate-200 rounded-lg mb-6 overflow-hidden">
              <div className="px-4 py-3 border-b border-slate-200 flex items-center justify-between">
                <h2 className="text-sm font-semibold text-slate-900">Engagement modules (shared across funnels)</h2>
                <span className="text-xs text-slate-500">Persuasion modules — not funnel steps, not used in conversion math.</span>
              </div>
              <div className="overflow-x-auto">
                <table className="min-w-full text-sm">
                  <thead className="bg-slate-50 text-xs uppercase tracking-wide text-slate-600">
                    <tr>
                      <th className="text-left px-4 py-2">Module</th>
                      <th className="text-right px-4 py-2">Unique agencies</th>
                      <th className="text-right px-4 py-2">Total events</th>
                      <th className="text-right px-4 py-2">Your Agency</th>
                      <th className="text-right px-4 py-2">Request Replay</th>
                      <th className="text-right px-4 py-2">Manage Listing</th>
                    </tr>
                  </thead>
                  <tbody>
                    {ENGAGEMENT_MODULE_STEPS.map((step) => {
                      const s = moduleStats[step];
                      if (!s) return null;
                      return (
                        <tr key={step} className="border-t border-slate-100">
                          <td className="px-4 py-2 text-slate-900">{ENGAGEMENT_MODULE_LABELS[step] ?? CANONICAL_STEP_LABELS[step]}</td>
                          <td className="px-4 py-2 text-right font-medium text-slate-900">{s.unique}</td>
                          <td className="px-4 py-2 text-right text-slate-700">{s.raw}</td>
                          <td className="px-4 py-2 text-right text-slate-600">{s.byFunnel.your_agency}</td>
                          <td className="px-4 py-2 text-right text-slate-600">{s.byFunnel.request_replay}</td>
                          <td className="px-4 py-2 text-right text-slate-600">{s.byFunnel.manage_listing}</td>
                        </tr>
                      );
                    })}
                  </tbody>
                </table>
              </div>
              <div className="px-4 py-2 border-t border-slate-100 text-xs text-slate-500 italic">
                By-funnel columns reflect the attribution of each individual module event, not every funnel the agency has ever touched. Check Availability also appears in the Your Agency funnel as a module interaction, not a required linear step.
              </div>
            </section>

            <section className="bg-white border border-slate-200 rounded-lg mb-6 p-4">
              <div className="flex items-center justify-between mb-3">
                <h2 className="text-sm font-semibold text-slate-900">Unified conversion path (global — all sources combined)</h2>
                <span className="text-xs text-slate-500">activation_page_viewed → checkout_opened → checkout_started → purchase_completed</span>
              </div>
              <FunnelFlowCard label="Unified (global)" steps={UNIFIED_CONVERSION_STEPS} counts={globalStepCounts} />
            </section>

            <section className="bg-white border border-slate-200 rounded-lg mb-6 overflow-hidden">
              <div className="px-4 py-3 border-b border-slate-200 flex items-center justify-between">
                <h2 className="text-sm font-semibold text-slate-900">Unmapped events (debug)</h2>
                <span className="text-xs text-slate-500">Raw event_name values that normalizeFunnelEvent() returned null for</span>
              </div>
              {unmappedCounts.length === 0 ? (
                <div className="px-4 py-4 text-sm text-slate-500">All events mapped to canonical steps.</div>
              ) : (
                <div className="overflow-x-auto max-h-80 overflow-y-auto">
                  <table className="min-w-full text-sm">
                    <thead className="bg-slate-50 text-xs uppercase tracking-wide text-slate-600 sticky top-0">
                      <tr>
                        <th className="text-left px-4 py-2">event_name</th>
                        <th className="text-right px-4 py-2">Count</th>
                      </tr>
                    </thead>
                    <tbody>
                      {unmappedCounts.map(([name, n]) => (
                        <tr key={name} className="border-t border-slate-100">
                          <td className="px-4 py-2 text-slate-900 font-mono text-xs">{name}</td>
                          <td className="px-4 py-2 text-right text-slate-700">{n}</td>
                        </tr>
                      ))}
                    </tbody>
                  </table>
                </div>
              )}
            </section>

            <section className="bg-white border border-slate-200 rounded-lg mb-6 overflow-hidden">
              <div className="px-4 py-3 border-b border-slate-200 flex items-center justify-between">
                <h2 className="text-sm font-semibold text-slate-900">Tracking quality diagnostics</h2>
                <span className="text-xs text-slate-500">Signal to trust the numbers above</span>
              </div>
              <div className="grid grid-cols-2 md:grid-cols-4 gap-3 p-4 text-sm">
                <DiagStat label="% events with agency_id" value={`${trackingQuality.pctAgencyId}%`} />
                <DiagStat label="% events with session_id" value={`${trackingQuality.pctSessionId}%`} />
                <DiagStat label="% activation events with source" value={`${trackingQuality.pctActivationWithSource}%`} sub={`${trackingQuality.activationEvents} events`} />
                <DiagStat label="% checkout events with source" value={`${trackingQuality.pctCheckoutWithSource}%`} sub={`${trackingQuality.checkoutEvents} events`} />
                <DiagStat label="% events classified unknown" value={`${trackingQuality.pctUnknownAttribution}%`} sub="no source / no session" />
              </div>
              {trackingQuality.topMissingAttribution.length > 0 && (
                <div className="px-4 pb-4">
                  <div className="text-xs font-semibold text-slate-700 mb-2">Top activation/checkout event names missing source and session_id</div>
                  <table className="min-w-full text-xs">
                    <thead className="bg-slate-50 text-slate-600"><tr><th className="text-left px-2 py-1">event_name</th><th className="text-right px-2 py-1">Count</th></tr></thead>
                    <tbody>
                      {trackingQuality.topMissingAttribution.map(([name, n]) => (
                        <tr key={name} className="border-t border-slate-100">
                          <td className="px-2 py-1 font-mono">{name}</td>
                          <td className="px-2 py-1 text-right">{n}</td>
                        </tr>
                      ))}
                    </tbody>
                  </table>
                </div>
              )}
            </section>

            <section className="bg-white border border-slate-200 rounded-lg mb-6 overflow-hidden">
              <div className="px-4 py-3 border-b border-slate-200 flex items-center justify-between">
                <h2 className="text-sm font-semibold text-slate-900">Verified session flows (same session_id, ordered)</h2>
                <span className="text-xs text-slate-500">Only counts sessions where entry → activation → checkout happened in order in the same session. Sessions without session_id are excluded.</span>
              </div>
              <div className="overflow-x-auto">
                <table className="min-w-full text-sm">
                  <thead className="bg-slate-50 text-xs uppercase tracking-wide text-slate-600">
                    <tr>
                      <th className="text-left px-4 py-2">Entry funnel</th>
                      <th className="text-right px-4 py-2">Sessions w/ entry</th>
                      <th className="text-right px-4 py-2">→ Activation</th>
                      <th className="text-right px-4 py-2">→ Checkout</th>
                      <th className="text-right px-4 py-2">→ Purchase</th>
                      <th className="text-right px-4 py-2">Activation → Checkout</th>
                    </tr>
                  </thead>
                  <tbody>
                    {(['your_agency', 'request_replay', 'manage_listing'] as FunnelSource[]).map((src) => {
                      const v = verifiedFlows[src];
                      const entryAct = v.sessionsWithEntry ? (v.entryToActivation / v.sessionsWithEntry) * 100 : 0;
                      const actCk = v.entryToActivation ? (v.activationToCheckout / v.entryToActivation) * 100 : 0;
                      return (
                        <tr key={src} className="border-t border-slate-100">
                          <td className="px-4 py-2 text-slate-900">{FUNNEL_SOURCE_LABELS[src]} → Activation → Checkout</td>
                          <td className="px-4 py-2 text-right font-medium">{v.sessionsWithEntry}</td>
                          <td className="px-4 py-2 text-right">{v.entryToActivation} <span className="text-slate-400 text-xs">({entryAct.toFixed(1)}%)</span></td>
                          <td className="px-4 py-2 text-right">{v.entryToCheckout} <span className="text-slate-400 text-xs">({actCk.toFixed(1)}%)</span></td>
                          <td className="px-4 py-2 text-right">{v.entryToPurchase}</td>
                          <td className="px-4 py-2 text-right text-slate-600">{v.activationToCheckout}</td>
                        </tr>
                      );
                    })}
                  </tbody>
                </table>
              </div>
            </section>

            <section className="bg-white border border-slate-200 rounded-lg mb-6 overflow-hidden">
              <div className="px-4 py-3 border-b border-slate-200 flex items-center justify-between">
                <h2 className="text-sm font-semibold text-slate-900">Verified conversion per funnel (session-based)</h2>
                <span className="text-xs text-slate-500">Based only on sessions with reliable tracking. Sessions without session_id are excluded.</span>
              </div>
              <div className="overflow-x-auto">
                <table className="min-w-full text-sm">
                  <thead className="bg-slate-50 text-xs uppercase tracking-wide text-slate-600">
                    <tr>
                      <th className="text-left px-4 py-2">Entry funnel</th>
                      <th className="text-right px-4 py-2">Sessions entered</th>
                      <th className="text-right px-4 py-2">→ Activation</th>
                      <th className="text-right px-4 py-2">Activation → Checkout</th>
                      <th className="text-right px-4 py-2">Checkout → Purchase</th>
                      <th className="text-right px-4 py-2">Entry → Purchase</th>
                    </tr>
                  </thead>
                  <tbody>
                    {(['your_agency', 'request_replay', 'manage_listing', 'unknown'] as Attribution[]).map((src) => {
                      const v = verifiedConversion[src];
                      const pctAct = v.sessions_entered ? (v.sessions_reached_activation / v.sessions_entered) * 100 : 0;
                      const pctCk = v.sessions_reached_activation ? (v.sessions_reached_checkout / v.sessions_reached_activation) * 100 : 0;
                      const pctPu = v.sessions_reached_checkout ? (v.sessions_reached_purchase / v.sessions_reached_checkout) * 100 : 0;
                      const pctEndToEnd = v.sessions_entered ? (v.sessions_reached_purchase / v.sessions_entered) * 100 : 0;
                      return (
                        <tr key={src} className="border-t border-slate-100">
                          <td className="px-4 py-2 text-slate-900">{ATTRIBUTION_LABELS[src]}</td>
                          <td className="px-4 py-2 text-right font-medium">{v.sessions_entered}</td>
                          <td className="px-4 py-2 text-right">{v.sessions_reached_activation} <span className="text-slate-400 text-xs">({pctAct.toFixed(1)}%)</span></td>
                          <td className="px-4 py-2 text-right">{v.sessions_reached_checkout} <span className="text-slate-400 text-xs">({pctCk.toFixed(1)}%)</span></td>
                          <td className="px-4 py-2 text-right">{v.sessions_reached_purchase} <span className="text-slate-400 text-xs">({pctPu.toFixed(1)}%)</span></td>
                          <td className="px-4 py-2 text-right text-emerald-700 font-medium">{pctEndToEnd.toFixed(1)}%</td>
                        </tr>
                      );
                    })}
                  </tbody>
                </table>
              </div>
              <div className="px-4 py-2 border-t border-slate-100 text-xs text-slate-500 italic">
                Strict chronological order within the same session_id: entry → activation → checkout → purchase.
              </div>
            </section>

            <section className="bg-white border border-slate-200 rounded-lg mb-6 overflow-hidden">
              <div className="px-4 py-3 border-b border-slate-200 flex items-center justify-between">
                <h2 className="text-sm font-semibold text-slate-900">Product events vs Notification logs</h2>
                <span className="text-xs text-slate-500">Product events (trusted) · Notification logs (may include duplicates)</span>
              </div>
              <div className="overflow-x-auto">
                <table className="min-w-full text-sm">
                  <thead className="bg-slate-50 text-xs uppercase tracking-wide text-slate-600">
                    <tr>
                      <th className="text-left px-4 py-2">Step</th>
                      <th className="text-right px-4 py-2">Product events (trusted)</th>
                      <th className="text-right px-4 py-2">Notification logs</th>
                      <th className="text-right px-4 py-2">Total raw events</th>
                    </tr>
                  </thead>
                  <tbody>
                    {UNIFIED_CONVERSION_STEPS.map((step) => {
                      const b = sourceSplit[step] ?? { product: 0, notification: 0, total: 0 };
                      return (
                        <tr key={step} className="border-t border-slate-100">
                          <td className="px-4 py-2 text-slate-900">{CANONICAL_STEP_LABELS[step]}</td>
                          <td className="px-4 py-2 text-right font-medium text-slate-900">{b.product}</td>
                          <td className="px-4 py-2 text-right text-slate-600">{b.notification}</td>
                          <td className="px-4 py-2 text-right text-slate-500">{b.total}</td>
                        </tr>
                      );
                    })}
                  </tbody>
                </table>
              </div>
            </section>

            <section className="bg-white border border-slate-200 rounded-lg mb-6 overflow-hidden">
              <div className="px-4 py-3 border-b border-slate-200 flex flex-wrap items-center gap-3">
                <h2 className="text-sm font-semibold text-slate-900 flex items-center gap-2 mr-auto">
                  <Flame className="w-4 h-4 text-orange-500" />
                  High Intent Agencies
                  <span className="text-xs font-normal text-slate-500 ml-1">{highIntent.length}</span>
                </h2>
                <div className="flex items-center gap-2 flex-wrap">
                  <select
                    value={hiDiscountMode}
                    onChange={(e) => setHiDiscountMode(e.target.value as 'none' | 'existing' | 'auto_create')}
                    className="text-xs border border-slate-300 rounded px-2 py-1 focus:outline-none focus:ring-1 focus:ring-blue-500"
                  >
                    <option value="none">No discount links</option>
                    <option value="existing">Existing offers only</option>
                    <option value="auto_create">Auto-create 15/20/25%</option>
                  </select>
                  <button
                    onClick={handleHiExport}
                    disabled={selectedAgencyIds.size === 0 || hiExporting}
                    className="inline-flex items-center gap-1.5 text-xs font-medium border border-slate-300 rounded px-2.5 py-1 hover:bg-slate-50 disabled:opacity-40 disabled:cursor-not-allowed"
                  >
                    {hiExporting ? <Loader className="w-3 h-3 animate-spin" /> : <Download className="w-3 h-3" />}
                    Export selected ({selectedAgencyIds.size})
                  </button>
                </div>
              </div>
              {hiDiscountMode === 'auto_create' && (
                <div className="px-4 py-1.5 bg-amber-50 border-b border-amber-100 text-[10px] text-amber-700">
                  Auto-create will create unique single-use 15/20/25% activation discount links for selected agencies that do not already have them.
                </div>
              )}
              {hiExportError && (
                <div className="px-4 py-2 bg-red-50 border-b border-red-100 text-xs text-red-700">{hiExportError}</div>
              )}
              {highIntent.length === 0 ? (
                <AdminEmptyState message="No high-intent agencies in this window." />
              ) : (
                <div className="overflow-x-auto max-h-[640px] overflow-y-auto">
                  <table className="min-w-full text-sm">
                    <thead className="bg-slate-50 text-xs uppercase tracking-wide text-slate-600 sticky top-0">
                      <tr>
                        <th className="px-3 py-2 w-8">
                          <input
                            type="checkbox"
                            checked={selectedAgencyIds.size > 0 && selectedAgencyIds.size === selectableHighIntentIds.size}
                            disabled={selectableHighIntentIds.size === 0}
                            onChange={(e) => handleHiSelectAll(e.target.checked)}
                            className="rounded border-slate-300"
                            title="Select all with agency_id"
                          />
                        </th>
                        <th className="text-left px-4 py-2">Agency</th>
                        <th className="text-left px-4 py-2">State</th>
                        <th className="text-left px-4 py-2">Entry funnel</th>
                        <th className="text-left px-4 py-2">Last attributed funnel</th>
                        <th className="text-right px-4 py-2">Checkout opens</th>
                        <th className="text-left px-4 py-2">Last activity</th>
                        <th className="px-4 py-2"></th>
                      </tr>
                    </thead>
                    <tbody>
                      {visibleHighIntent.map((ag) => {
                        const params = new URLSearchParams();
                        if (ag.agency_id) params.set('agencyId', ag.agency_id);
                        else {
                          if (ag.name) params.set('name', ag.name);
                          if (ag.state_slug) params.set('state', ag.state_slug);
                        }
                        const lookupUrl = `/wp-admin/email/agency-lookup?${params.toString()}`;
                        const selectable = !!ag.agency_id;
                        return (
                          <tr key={ag.key} className="border-t border-slate-100 hover:bg-slate-50">
                            <td className="px-3 py-2">
                              {selectable ? (
                                <input
                                  type="checkbox"
                                  checked={selectedAgencyIds.has(ag.agency_id!)}
                                  onChange={() => handleHiToggle(ag.agency_id!)}
                                  className="rounded border-slate-300"
                                />
                              ) : (
                                <input type="checkbox" disabled className="rounded border-slate-200 opacity-30" title="No agency_id" />
                              )}
                            </td>
                            <td className="px-4 py-2">
                              <span className="text-slate-900 font-medium">{ag.name}</span>
                              {ag.is_paid && <span className="ml-2 text-xs font-medium text-emerald-700 bg-emerald-50 rounded px-1.5 py-0.5">PAID</span>}
                            </td>
                            <td className="px-4 py-2 text-slate-600">{ag.state_slug ?? '-'}</td>
                            <td className="px-4 py-2 text-slate-700">{ATTRIBUTION_LABELS[ag.entryFunnel]}</td>
                            <td className="px-4 py-2 text-slate-700">{ATTRIBUTION_LABELS[ag.lastAttribution]}</td>
                            <td className="px-4 py-2 text-right font-medium text-slate-900">{ag.checkoutOpens}</td>
                            <td className="px-4 py-2 text-slate-600">{relativeTime(ag.lastEventAt)}</td>
                            <td className="px-4 py-2 text-right">
                              <button
                                onClick={() => navigate(lookupUrl)}
                                className="inline-flex items-center gap-1 text-xs border border-slate-300 rounded px-2 py-1 hover:bg-white"
                              >
                                <ExternalLink className="w-3 h-3" /> Lookup
                              </button>
                            </td>
                          </tr>
                        );
                      })}
                    </tbody>
                  </table>
                </div>
              )}
            </section>

            <div className="mb-2 text-xs text-slate-500 italic">
              Per-funnel cards show <strong>observed attributed activity</strong> — not strict funnel conversion. Multiple entry points mean a later step's count can exceed an earlier step (agencies enter at different places). Percentages are <strong>share of funnel entry agencies</strong>, not conversion rate.
            </div>
            <section className="grid gap-4 mb-6 md:grid-cols-2 xl:grid-cols-3">
              {FUNNEL_FLOWS.map((flow) => (
                <FunnelFlowCard
                  key={flow.source}
                  label={`${flow.label} — Observed attributed activity`}
                  steps={flow.steps}
                  counts={attributedStepCounts[flow.source]}
                />
              ))}
              <div className="bg-white border border-amber-200 rounded-lg p-4">
                <h3 className="text-sm font-semibold text-slate-900 mb-1">Direct / Unattributed Conversion Events</h3>
                <p className="text-xs text-amber-800 mb-3">These events lack reliable funnel/source/session attribution. They are NOT spread into the per-funnel cards above.</p>
                <FunnelFlowCardInner steps={UNIFIED_CONVERSION_STEPS} counts={attributedStepCounts.unknown} />
              </div>
            </section>

            <section className="bg-white border border-slate-200 rounded-lg overflow-hidden">
              <div className="px-4 py-3 border-b border-slate-200 flex items-center justify-between gap-2 flex-wrap">
                <h2 className="text-sm font-semibold text-slate-900 flex items-center gap-2">
                  <Flame className="w-4 h-4 text-orange-500" />
                  Hot Agencies {paidFilter === 'unpaid' && '(unpaid only)'}
                </h2>
                <span className="text-xs text-slate-500">{hotAgencies.length} agencies</span>
              </div>
              {hotAgencies.length === 0 ? (
                <AdminEmptyState message="No agencies with product activity in this window." />
              ) : (
                <div className="overflow-x-auto">
                  <table className="min-w-full text-sm">
                    <thead className="bg-slate-50 text-xs uppercase tracking-wide text-slate-600">
                      <tr>
                        <th className="text-left px-4 py-2">Agency</th>
                        <th className="text-left px-4 py-2">State</th>
                        <th className="text-left px-4 py-2">Entry funnel</th>
                        <th className="text-left px-4 py-2">Last attributed funnel</th>
                        <th className="text-left px-4 py-2">Last conversion event</th>
                        <th className="text-left px-4 py-2">Conversion attribution</th>
                        <th className="text-left px-4 py-2">Furthest step</th>
                        <th className="text-right px-4 py-2">Steps</th>
                        <th className="text-right px-4 py-2">Events</th>
                        <th className="text-left px-4 py-2">Last activity</th>
                        <th className="px-4 py-2"></th>
                      </tr>
                    </thead>
                    <tbody>
                      {hotAgencies.map((ag) => (
                        <tr key={ag.key} className="border-t border-slate-100 hover:bg-slate-50">
                          <td className="px-4 py-2">
                            <button
                              onClick={() => openLookup(ag)}
                              className="text-blue-700 hover:underline font-medium text-left"
                            >
                              {ag.name}
                            </button>
                            {ag.is_paid && <span className="ml-2 text-xs font-medium text-emerald-700 bg-emerald-50 rounded px-1.5 py-0.5">PAID</span>}
                          </td>
                          <td className="px-4 py-2 text-slate-600">{ag.state_slug ?? '-'}</td>
                          <td className="px-4 py-2 text-slate-700">{ATTRIBUTION_LABELS[ag.entryFunnel]}</td>
                          <td className="px-4 py-2 text-slate-700">{ATTRIBUTION_LABELS[ag.lastAttribution]}</td>
                          <td className="px-4 py-2 text-slate-700">{ag.lastConversionStep ? CANONICAL_STEP_LABELS[ag.lastConversionStep] : '-'}</td>
                          <td className="px-4 py-2 text-slate-700">
                            {ag.lastConversionAttribution
                              ? (ag.lastConversionAttribution === 'unknown'
                                ? <span className="text-amber-700">unknown</span>
                                : (
                                  <span>
                                    {ATTRIBUTION_LABELS[ag.lastConversionAttribution]}
                                    <span className={`ml-1 text-xs ${ag.lastConversionKind === 'direct' ? 'text-emerald-700' : 'text-amber-700'}`}>
                                      ({ag.lastConversionKind ? ATTRIBUTION_KIND_LABELS[ag.lastConversionKind] : '-'})
                                    </span>
                                  </span>
                                ))
                              : '-'}
                          </td>
                          <td className="px-4 py-2 text-slate-700">{CANONICAL_STEP_LABELS[ag.lastStep]}</td>
                          <td className="px-4 py-2 text-right font-medium text-slate-900">{ag.steps.size}</td>
                          <td className="px-4 py-2 text-right text-slate-700">{ag.events.length}</td>
                          <td className="px-4 py-2 text-slate-600">{relativeTime(ag.lastEventAt)}</td>
                          <td className="px-4 py-2 text-right">
                            <button
                              onClick={() => setDetailAgency(ag)}
                              className="text-xs border border-slate-300 rounded px-2 py-1 hover:bg-white"
                            >
                              Details
                            </button>
                          </td>
                        </tr>
                      ))}
                    </tbody>
                  </table>
                </div>
              )}
            </section>
          </>
        )}
      </div>

      {detailAgency && (
        <DetailDrawer
          ag={detailAgency}
          onClose={() => setDetailAgency(null)}
          openLookup={openLookup}
          copy={copy}
          copied={copied}
          origin={origin}
        />
      )}
    </WpAdminLayout>
  );
}

function SummaryCard({ icon, label, value }: { icon: React.ReactNode; label: string; value: number | string }) {
  return (
    <div className="bg-white border border-slate-200 rounded-lg p-3">
      <div className="flex items-center gap-2 mb-1">{icon}<span className="text-xs text-slate-600">{label}</span></div>
      <div className="text-xl font-semibold text-slate-900">{value}</div>
    </div>
  );
}

function DiagStat({ label, value, sub }: { label: string; value: string; sub?: string }) {
  return (
    <div className="border border-slate-200 rounded-md p-3">
      <div className="text-xs text-slate-500">{label}</div>
      <div className="text-xl font-semibold text-slate-900 mt-1">{value}</div>
      {sub && <div className="text-xs text-slate-400 mt-1">{sub}</div>}
    </div>
  );
}

function FunnelFlowCardInner({
  steps, counts,
}: {
  steps: CanonicalStep[];
  counts: Partial<Record<CanonicalStep, number>>;
}) {
  const first = counts[steps[0]] ?? 0;
  let hasNonSequential = false;
  for (let i = 1; i < steps.length; i++) {
    const n = counts[steps[i]] ?? 0;
    const prev = counts[steps[i - 1]] ?? 0;
    if (n > prev) { hasNonSequential = true; break; }
  }
  return (
    <>
      <div className="space-y-2">
        {steps.map((step, idx) => {
          const n = counts[step] ?? 0;
          const prev = idx > 0 ? (counts[steps[idx - 1]] ?? 0) : first;
          const rawPct = idx === 0
            ? (first > 0 ? 100 : 0)
            : (prev > 0 ? (n / prev) * 100 : 0);
          const barPct = Math.min(rawPct, 100);
          const exceeds = idx > 0 && n > prev;
          return (
            <div key={step}>
              <div className="flex items-center justify-between text-xs text-slate-700 mb-1">
                <span>{CANONICAL_STEP_LABELS[step]}</span>
                <span className="font-medium">
                  {n}{' '}
                  {exceeds ? (
                    <span className="text-amber-700" title="Later step exceeds earlier step">(n/a)</span>
                  ) : (
                    <span className="text-slate-400">({rawPct.toFixed(1)}%)</span>
                  )}
                </span>
              </div>
              <div className="h-2 bg-slate-100 rounded">
                <div className={`h-2 rounded ${exceeds ? 'bg-amber-400' : 'bg-blue-500'}`} style={{ width: `${barPct}%` }} />
              </div>
            </div>
          );
        })}
      </div>
      {hasNonSequential && (
        <div className="mt-3 text-xs text-amber-800 bg-amber-50 border border-amber-200 rounded-md px-2 py-1.5">
          Observed across multiple paths (non-sequential).
        </div>
      )}
    </>
  );
}

function FunnelFlowCard({
  label, steps, counts,
}: {
  label: string;
  steps: CanonicalStep[];
  counts: Partial<Record<CanonicalStep, number>>;
}) {
  return (
    <div className="bg-white border border-slate-200 rounded-lg p-4">
      <h3 className="text-sm font-semibold text-slate-900 mb-3">{label}</h3>
      <FunnelFlowCardInner steps={steps} counts={counts} />
    </div>
  );
}

function buildActivationUrl(ag: AgencyAggregate, origin: string, stateName: string | null): string | null {
  if (!ag.agency_id || !ag.state_slug || !ag.name || !stateName) return null;
  const p = new URLSearchParams();
  p.set('agencyId', ag.agency_id);
  p.set('agencyName', ag.name);
  p.set('stateName', stateName);
  p.set('stateSlug', ag.state_slug);
  p.set('agencyWebsite', ag.website ?? '');
  p.set('agencyDescription', ag.description ?? '');
  return `${origin}/activation/upgrade?${p.toString()}`;
}

function DetailDrawer({
  ag, onClose, openLookup, copy, copied, origin,
}: {
  ag: AgencyAggregate;
  onClose: () => void;
  openLookup: (ag: AgencyAggregate) => void;
  copy: (text: string, label: string) => void;
  copied: string | null;
  origin: string;
}) {
  const stateName = ag.state_slug
    ? (US_STATES.find((s) => s.slug === ag.state_slug)?.name ?? null)
    : null;
  const activationLink = buildActivationUrl(ag, origin, stateName);
  const yourAgencyLink = ag.slug ? `${origin}/your-agency/${ag.slug}` : null;

  return (
    <div className="fixed inset-0 z-50 flex">
      <button className="flex-1 bg-black/40" onClick={onClose} aria-label="Close" />
      <div className="w-full max-w-xl bg-white shadow-xl overflow-y-auto">
        <div className="px-5 py-4 border-b border-slate-200 flex items-start justify-between gap-3">
          <div>
            <div className="text-xs text-slate-500 uppercase tracking-wide">Agency detail</div>
            <h2 className="text-lg font-semibold text-slate-900">{ag.name}</h2>
            <div className="text-xs text-slate-500 mt-1">
              {ag.state_slug ?? '-'} · {ag.is_paid ? 'PAID' : 'Unpaid'} · {ag.steps.size} canonical steps · {ag.events.length} events
            </div>
          </div>
          <button onClick={onClose} className="text-slate-500 hover:text-slate-800"><X className="w-5 h-5" /></button>
        </div>

        <div className="px-5 py-4 border-b border-slate-200">
          <div className="flex flex-wrap gap-2">
            <button
              onClick={() => openLookup(ag)}
              className="inline-flex items-center gap-2 text-sm bg-blue-600 hover:bg-blue-700 text-white rounded-md px-3 py-2"
            >
              <ExternalLink className="w-4 h-4" /> Open in Agency Lookup
            </button>
            {ag.website && (
              <a
                href={ag.website}
                target="_blank"
                rel="noreferrer"
                className="inline-flex items-center gap-2 text-sm border border-slate-300 rounded-md px-3 py-2 hover:bg-slate-50"
              >
                <ExternalLink className="w-4 h-4" /> Website
              </a>
            )}
          </div>
        </div>

        <div className="px-5 py-4 border-b border-slate-200">
          <h3 className="text-xs font-semibold text-slate-600 uppercase tracking-wide mb-2">Quick outreach links</h3>
          <div className="space-y-2">
            <LinkRow label="Activation" url={activationLink} copy={copy} copied={copied} />
            <LinkRow label="/your-agency" url={yourAgencyLink} copy={copy} copied={copied} />
          </div>
          <p className="text-xs text-slate-500 mt-3">
            Request Replay, Manage Listing, and discount offers are token-gated and cannot be built here. Use Agency Lookup or Smartlead export to generate them.
          </p>
          <button
            onClick={() => openLookup(ag)}
            className="mt-2 inline-flex items-center gap-2 text-xs border border-slate-300 rounded px-2 py-1 hover:bg-slate-50"
          >
            <ExternalLink className="w-3.5 h-3.5" /> Open Agency Lookup
          </button>
        </div>

        <div className="px-5 py-4">
          <h3 className="text-xs font-semibold text-slate-600 uppercase tracking-wide mb-2">Event timeline</h3>
          <ol className="space-y-2">
            {ag.events.map((e, i) => (
              <li key={i} className="text-sm border-l-2 border-blue-200 pl-3">
                <div className="text-slate-900 font-medium">{CANONICAL_STEP_LABELS[e.step]}</div>
                <div className="text-xs text-slate-500">
                  {new Date(e.at).toLocaleString()} · {e.raw.event_name}
                </div>
              </li>
            ))}
          </ol>
        </div>
      </div>
    </div>
  );
}

function LinkRow({
  label, url, copy, copied,
}: {
  label: string;
  url: string | null;
  copy: (text: string, label: string) => void;
  copied: string | null;
}) {
  if (!url) {
    return (
      <div className="flex items-center justify-between text-sm text-slate-400 border border-dashed border-slate-200 rounded-md px-2 py-1.5">
        <span>{label}</span><span className="text-xs">unavailable (missing data — use Agency Lookup)</span>
      </div>
    );
  }
  const isCopied = copied === label;
  return (
    <div className="flex items-center gap-2 text-sm border border-slate-200 rounded-md px-2 py-1.5">
      <span className="w-32 text-slate-600 shrink-0">{label}</span>
      <code className="flex-1 truncate text-xs text-slate-700">{url}</code>
      <button
        onClick={() => copy(url, label)}
        className="inline-flex items-center gap-1 text-xs border border-slate-300 rounded px-2 py-1 hover:bg-slate-50"
      >
        {isCopied ? <CheckCircle2 className="w-3.5 h-3.5 text-emerald-600" /> : <Copy className="w-3.5 h-3.5" />}
        {isCopied ? 'Copied' : 'Copy'}
      </button>
    </div>
  );
}

