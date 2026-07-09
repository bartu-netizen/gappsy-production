import { useState, useEffect, useMemo, useRef } from 'react';
import { useParams, useSearchParams, useNavigate } from 'react-router-dom';
import {
  Trash2, CheckCircle, AlertTriangle, ArrowRight,
  ChevronLeft, Star, Lock, Clock,
} from 'lucide-react';
import { trackManageFunnelEvent, MANAGE_FUNNEL_EVENTS, normalizeManageListingType } from '../utils/manageFunnelTracking';
import { formatStateName } from '../utils/formatLocation';
import { useCanonicalAgency } from '../hooks/useCanonicalAgency';
import { normalizeDisplayedMissedCount } from '../utils/unifiedAgencyKpi';
import { formatCanonicalTimeAgoShort } from '../utils/unifiedAgencyKpi';
import { useNoindex } from '../components/NoindexMeta';
import { getCanonicalReplayData, type CanonicalEntry } from '../utils/canonicalReplayData';
import { ClientRequestLedger } from '../components/ClientRequestLedger';

const SUPABASE_URL = import.meta.env.VITE_SUPABASE_URL as string;
const SUPABASE_ANON_KEY = import.meta.env.VITE_SUPABASE_ANON_KEY as string;

interface FunnelSummary {
  engagement: {
    engaged_leads_count: number;
    total_interactions: number;
    engagement_hint: string | null;
  };
  triggers: {
    visited_not_activated: boolean;
    checkout_abandoned: boolean;
    remove_intent: boolean;
    high_engagement: boolean;
  };
}

async function fetchFunnelSummary(agencyId: string): Promise<FunnelSummary | null> {
  try {
    const res = await fetch(
      `${SUPABASE_URL}/functions/v1/agency-funnel-summary?agency_id=${encodeURIComponent(agencyId)}`,
      { headers: { Authorization: `Bearer ${SUPABASE_ANON_KEY}` } }
    );
    const data = await res.json();
    if (!data.ok) return null;
    return { engagement: data.engagement, triggers: data.triggers };
  } catch {
    return null;
  }
}


type PageStep = 'loading' | 'invalid_token' | 'tokenless_recovery' | 'ready' | 'remove_recovery' | 'done_keep' | 'done_remove' | 'error';

interface AgencyContext {
  id: string;
  name: string;
  state_slug: string;
  slug: string | null;
  listing_management_status: string | null;
  is_active: boolean;
  is_paid_listing: boolean;
  created_at: string | null;
  listing_type?: 'top25' | 'other_agency';
  can_self_remove?: boolean;
}


async function callAction(token: string, action: string): Promise<{ ok: boolean; error?: string }> {
  const res = await fetch(`${SUPABASE_URL}/functions/v1/manage-listing-action`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json', 'Authorization': `Bearer ${SUPABASE_ANON_KEY}` },
    body: JSON.stringify({ token, action }),
  });
  return res.json();
}


function manageHeadlineClasses(agencyName: string): string {
  const len = (agencyName || '').trim().length;
  if (len <= 22) return 'text-lg md:text-xl';
  if (len <= 32) return 'text-base md:text-lg';
  return 'text-sm md:text-base leading-snug';
}

export default function ManageListingPage() {
  useNoindex();
  const { agencySlug } = useParams<{ agencySlug: string }>();
  const [searchParams] = useSearchParams();
  const navigate = useNavigate();
  const token = searchParams.get('c') || '';

  // Resolve source attribution: smartlead if lid param or utm_source=smartlead, else direct
  const _leadKey    = searchParams.get('lid') || null;
  const _utmSource  = searchParams.get('utm_source') || '';
  const _sourceHint = searchParams.get('source') || '';
  const manageSource: 'smartlead' | 'direct' | 'unknown' =
    (_utmSource === 'smartlead' || _sourceHint === 'smartlead' || !!_leadKey)
      ? 'smartlead'
      : 'direct';

  const [step, setStep] = useState<PageStep>('loading');
  const [agency, setAgency] = useState<AgencyContext | null>(null);
  const [funnelSummary, setFunnelSummary] = useState<FunnelSummary | null>(null);
  const [isActing, setIsActing] = useState(false);
  const [actionError, setActionError] = useState('');
  // Expired/invalid token is NOT a dead-end if agency can still be resolved.
  // When flipped to true, the tokenless in-family canonical self-heal takes over.
  const [tokenInvalid, setTokenInvalid] = useState(false);

  useEffect(() => {
    if (!agencySlug) { setStep('error'); return; }
    if (!token) {
      // Tokenless legacy link: stay in loading while the canonical-redirect effect below resolves.
      // Do NOT show invalid_token — tokenless old links must self-heal into the public owner funnel.
      setStep('loading');
      return;
    }

    // Limited retry for transient errors (network, timeout, 5xx, null body).
    // Cold-start or temporary upstream failures must not show ErrorView on first try.
    const RETRY_BACKOFFS_MS = [400, 900];
    const FETCH_TIMEOUT_MS = 10_000;
    const fetchManageActionWithRetry = async (): Promise<
      { kind: 'data'; data: any } | { kind: 'transient' }
    > => {
      for (let attempt = 0; attempt < RETRY_BACKOFFS_MS.length + 1; attempt++) {
        try {
          const ctrl = new AbortController();
          const t = setTimeout(() => ctrl.abort(), FETCH_TIMEOUT_MS);
          const r = await fetch(
            `${SUPABASE_URL}/functions/v1/manage-listing-action?c=${encodeURIComponent(token)}`,
            {
              headers: {
                'Authorization': `Bearer ${SUPABASE_ANON_KEY}`,
                apikey: SUPABASE_ANON_KEY,
              },
              signal: ctrl.signal,
            },
          );
          clearTimeout(t);
          if (r.status >= 500 && r.status <= 599) {
            if (attempt < RETRY_BACKOFFS_MS.length) {
              await new Promise((res) => setTimeout(res, RETRY_BACKOFFS_MS[attempt]));
              continue;
            }
            return { kind: 'transient' };
          }
          const data = await r.json().catch(() => null);
          if (!data) {
            if (attempt < RETRY_BACKOFFS_MS.length) {
              await new Promise((res) => setTimeout(res, RETRY_BACKOFFS_MS[attempt]));
              continue;
            }
            return { kind: 'transient' };
          }
          return { kind: 'data', data };
        } catch {
          if (attempt < RETRY_BACKOFFS_MS.length) {
            await new Promise((res) => setTimeout(res, RETRY_BACKOFFS_MS[attempt]));
            continue;
          }
          return { kind: 'transient' };
        }
      }
      return { kind: 'transient' };
    };

    fetchManageActionWithRetry()
      .then(result => {
        if (result.kind === 'transient') {
          // Transient upstream failure after retries. Do NOT hard-fail when we
          // still have a usable agencySlug — fall through to tokenless canonical
          // self-heal so the funnel keeps working.
          if (agencySlug) {
            setTokenInvalid(true);
            setStep('loading');
          } else {
            setStep('error');
          }
          return;
        }
        const data = result.data;
        if (!data.ok || !data.valid) {
          // Token invalid/expired: do NOT hard-fail. Fall through to tokenless
          // in-family canonical resolution so old manage links still land on
          // a working /manage-listing/{canonicalSlug} URL when agency is resolvable.
          setTokenInvalid(true);
          setStep('loading');
          return;
        }
        const tokenAgencySlug = data.agency?.slug as string | undefined;
        const tokenStateSlug = data.agency?.state_slug as string | undefined;
        const urlStateSlug = searchParams.get('stateSlug') || '';
        const slugMismatch = !!tokenAgencySlug && !!agencySlug && tokenAgencySlug !== agencySlug;
        const stateMissing = !!tokenStateSlug && !urlStateSlug;
        const stateMismatch = !!tokenStateSlug && !!urlStateSlug && urlStateSlug !== tokenStateSlug;
        if (slugMismatch || stateMissing || stateMismatch) {
          const redirectParams = new URLSearchParams(searchParams.toString());
          if (tokenStateSlug) redirectParams.set('stateSlug', tokenStateSlug);
          const targetSlug = tokenAgencySlug || agencySlug;
          navigate(`/manage-listing/${targetSlug}?${redirectParams.toString()}`, { replace: true });
          return;
        }
        setAgency(data.agency);
        setStep('ready');

        // IMMEDIATELY send manage_funnel_opened — do NOT wait for fetchFunnelSummary
        trackManageFunnelEvent({
          event_type: MANAGE_FUNNEL_EVENTS.OPENED,
          agency_id: data.agency.id,
          agency_slug: data.agency.slug,
          agency_name: data.agency.name,
          state_slug: data.agency.state_slug,
          token,
          lead_key: _leadKey,
          source: manageSource,
          listing_type: normalizeManageListingType(data.agency.listing_type),
          engaged_leads_count: 0,
          total_interactions: 0,
          engagement_hint: null,
          metadata: {
            current_status: data.agency.listing_management_status,
          },
        }).then(openedResult => {
          console.log('[ManageListing] manage_funnel_opened result:', JSON.stringify(openedResult));
          if (!openedResult.ok) {
            console.error('[ManageListing] manage_funnel_opened FAILED:', openedResult);
          }
        }).catch(err => {
          console.error('[ManageListing] manage_funnel_opened exception:', err);
        });

        fetchFunnelSummary(data.agency.id)
          .then(summary => setFunnelSummary(summary))
          .catch(err => console.error('[ManageListing] fetchFunnelSummary failed:', err));
      })
      .catch(() => {
        // Unexpected error during result handling. Prefer tokenless self-heal
        // when agencySlug is available rather than blocking the user.
        if (agencySlug) {
          setTokenInvalid(true);
          setStep('loading');
        } else {
          setStep('error');
        }
      });
  }, [agencySlug, token]);

  async function handleKeepVisible() {
    if (!agency) return;

    setIsActing(true); setActionError('');
    let result: { ok: boolean; error?: string };
    try {
      result = await callAction(token, 'keep_visible');
    } catch {
      setIsActing(false); setActionError('Network error. Please try again.'); return;
    }
    setIsActing(false);
    if (!result.ok) { setActionError(result.error || 'Something went wrong.'); return; }

    const trackResult = await trackManageFunnelEvent({
      event_type: MANAGE_FUNNEL_EVENTS.RECOVERED,
      agency_id: agency.id,
      agency_slug: agency.slug,
      agency_name: agency.name,
      state_slug: agency.state_slug,
      token,
      lead_key: _leadKey,
      source: manageSource,
      listing_type: normalizeManageListingType(agency.listing_type),
      recovery_type: 'keep_visible',
      engaged_leads_count: funnelSummary?.engagement?.engaged_leads_count || 0,
      total_interactions: funnelSummary?.engagement?.total_interactions || 0,
      engagement_hint: funnelSummary?.engagement?.engagement_hint || null,
    });
    console.log('[ManageListing] keep_visible track result:', trackResult);

    setStep('done_keep');
  }

  const activateClickStartedRef = useRef(false);
  function handleActivate() {
    if (!agency) return;
    if (activateClickStartedRef.current) return;
    activateClickStartedRef.current = true;
    if (import.meta.env.DEV) {
      console.log('[CTA CLICK]', window.location.pathname);
    }

    const resolvedSlug = agency.slug || agencySlug || '';
    if (!resolvedSlug) {
      activateClickStartedRef.current = false;
      return;
    }
    const resolvedState = agency.state_slug || searchParams.get('stateSlug') || '';

    Promise.resolve()
      .then(() =>
        trackManageFunnelEvent({
          event_type: MANAGE_FUNNEL_EVENTS.RECOVERED,
          agency_id: agency.id,
          agency_slug: agency.slug,
          agency_name: agency.name,
          state_slug: agency.state_slug,
          token,
          lead_key: _leadKey,
          source: manageSource,
          listing_type: normalizeManageListingType(agency.listing_type),
          recovery_type: 'activate',
          engaged_leads_count: funnelSummary?.engagement?.engaged_leads_count || 0,
          total_interactions: funnelSummary?.engagement?.total_interactions || 0,
          engagement_hint: funnelSummary?.engagement?.engagement_hint || null,
        })
      )
      .catch(() => {});

    const activateParams = new URLSearchParams();
    activateParams.set('source', 'manage_listing');
    activateParams.set('c', token);
    if (resolvedState) activateParams.set('stateSlug', resolvedState);
    try {
      navigate(`/your-agency/${resolvedSlug}?${activateParams.toString()}`);
    } catch {
      activateClickStartedRef.current = false;
    }
  }

  async function handleRemoveStart() {
    if (!agency) return;
    if (agency.can_self_remove === false) return;
    console.log('[ManageListing] remove clicked', { agencySlug, token, agencyId: agency.id, can_self_remove: agency.can_self_remove });

    const result = await trackManageFunnelEvent({
      event_type: MANAGE_FUNNEL_EVENTS.REMOVE_STARTED,
      agency_id: agency.id,
      agency_slug: agency.slug,
      agency_name: agency.name,
      state_slug: agency.state_slug,
      token,
      lead_key: _leadKey,
      source: manageSource,
      listing_type: normalizeManageListingType(agency.listing_type),
      engaged_leads_count: funnelSummary?.engagement?.engaged_leads_count || 0,
      total_interactions: funnelSummary?.engagement?.total_interactions || 0,
      engagement_hint: funnelSummary?.engagement?.engagement_hint || null,
      entry_reason: 'remove_me',
    });
    console.log('[ManageListing] remove_started track result:', result);

    setStep('remove_recovery');
  }

  function handleRemoveCancel() {
    setStep('ready');
  }

  async function handleRemoveConfirm() {
    if (!agency) return;
    if (agency.can_self_remove === false) return;

    setIsActing(true); setActionError('');
    let result: { ok: boolean; error?: string };
    try {
      result = await callAction(token, 'removal_pending');
    } catch {
      setIsActing(false); setActionError('Network error. Please try again.'); return;
    }
    setIsActing(false);
    if (!result.ok) { setActionError(result.error || 'Something went wrong.'); return; }

    const trackResult = await trackManageFunnelEvent({
      event_type: MANAGE_FUNNEL_EVENTS.REMOVE_CONFIRMED,
      agency_id: agency.id,
      agency_slug: agency.slug,
      agency_name: agency.name,
      state_slug: agency.state_slug,
      token,
      lead_key: _leadKey,
      source: manageSource,
      listing_type: normalizeManageListingType(agency.listing_type),
      engaged_leads_count: funnelSummary?.engagement?.engaged_leads_count || 0,
      total_interactions: funnelSummary?.engagement?.total_interactions || 0,
      engagement_hint: funnelSummary?.engagement?.engagement_hint || null,
      metadata: {
        availability_checks_30d: canonicalMissedCountRaw,
      },
    });
    console.log('[ManageListing] remove_confirmed track result:', trackResult);

    setStep('done_remove');
  }

  const stateName = agency ? formatStateName(agency.state_slug) : '';

  const resolvedSlug = agency?.slug || agencySlug || '';
  const { agency: canonical, loading: canonicalLoading } = useCanonicalAgency(resolvedSlug || undefined, { token: token || undefined });
  const canonicalMissedCountRaw = canonical.missedCount;
  const canonicalMissedCount = normalizeDisplayedMissedCount(canonicalMissedCountRaw);
  const canonicalHoursAgo = formatCanonicalTimeAgoShort(canonical.anchorMs);

  const ledgerEntries: CanonicalEntry[] = useMemo(() => {
    if (!canonical.agencyId || !canonical.stateSlug || canonical.anchorMs <= 0) return [];
    const count = Math.max(canonicalMissedCount, 8);
    const data = getCanonicalReplayData(
      canonical.agencyId,
      canonical.stateSlug,
      count,
      canonical.anchorMs,
      canonical.agencySlug,
      canonical.overrideEntries.length > 0 ? canonical.overrideEntries : undefined,
      canonical.baseAnchorMs > 0 ? canonical.baseAnchorMs : undefined,
      typeof canonical.baseGeneratedCount === "number" ? canonical.baseGeneratedCount : undefined,
    );
    return data.entries;
  }, [canonical.agencyId, canonical.agencySlug, canonical.stateSlug, canonical.anchorMs, canonical.overrideEntries, canonical.baseGeneratedCount, canonicalMissedCount]);

  const manageLedgerViewFiredRef = useRef(false);
  useEffect(() => {
    if (!canonical.agencyId || ledgerEntries.length === 0 || manageLedgerViewFiredRef.current) return;
    manageLedgerViewFiredRef.current = true;
    fetch(
      `${SUPABASE_URL}/functions/v1/record-ledger-view`,
      {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          Authorization: `Bearer ${SUPABASE_ANON_KEY}`,
          apikey: SUPABASE_ANON_KEY,
        },
        body: JSON.stringify({
          agency_id: canonical.agencyId,
          state_slug: canonical.stateSlug || '',
          client_anchor_ms: canonical.anchorMs > 0 ? canonical.anchorMs : undefined,
        }),
      },
    ).catch(() => {});
  }, [canonical.agencyId, canonical.stateSlug, canonical.anchorMs, ledgerEntries.length]);

  const [ledgerHeight, setLedgerHeight] = useState<number>(() => {
    if (typeof window === 'undefined') return 200;
    const w = window.innerWidth;
    const h = window.innerHeight;
    if (w < 640) return Math.max(216, Math.min(256, h - 440));
    if (w < 1024) return Math.max(196, Math.min(240, h - 480));
    return Math.max(220, Math.min(280, h - 460));
  });

  useEffect(() => {
    function handleResize() {
      const w = window.innerWidth;
      const h = window.innerHeight;
      if (w < 640) {
        setLedgerHeight(Math.max(216, Math.min(256, h - 440)));
      } else if (w < 1024) {
        setLedgerHeight(Math.max(196, Math.min(240, h - 480)));
      } else {
        setLedgerHeight(Math.max(220, Math.min(280, h - 460)));
      }
    }
    window.addEventListener('resize', handleResize);
    return () => window.removeEventListener('resize', handleResize);
  }, []);

  // Tokenless legacy link in-family self-heal:
  // 1) Canonicalize slug/state WITHIN /manage-listing (never cross-funnel).
  // 2) Once the URL is canonical, show a graceful in-family recovery view — NOT a redirect.
  // Secure manage actions still require a valid token — this branch never exposes them.
  useEffect(() => {
    // Run when there is no token OR the token is invalid/expired.
    // A valid token path owns its own state and exits here.
    if (token && !tokenInvalid) return;
    if (!agencySlug) return;
    if (canonicalLoading) return;

    // If the agency itself is unresolvable, surface invalid_token only as the
    // true last-resort (agency cannot be found by token, id, or slug).
    if (!canonical.agencyId && !canonical.agencySlug) {
      setStep('invalid_token');
      return;
    }

    const canonicalSlug = canonical.agencySlug || agencySlug;
    const canonicalState = canonical.stateSlug;

    const urlStateSlug = searchParams.get('stateSlug') || '';
    const slugMismatch = !!canonicalSlug && canonicalSlug !== agencySlug;
    const stateMissing = !!canonicalState && !urlStateSlug;
    const stateMismatch = !!canonicalState && !!urlStateSlug && urlStateSlug !== canonicalState;

    if (slugMismatch || stateMissing || stateMismatch) {
      // Strip the now-invalid token from the URL while preserving all other params.
      const params = new URLSearchParams(searchParams.toString());
      if (tokenInvalid) params.delete('c');
      if (canonicalState) params.set('stateSlug', canonicalState);
      const targetSlug = canonicalSlug || agencySlug;
      const qs = params.toString();
      navigate(`/manage-listing/${targetSlug}${qs ? `?${qs}` : ''}`, { replace: true });
      return;
    }

    // Canonical within manage-listing family — render graceful tokenless recovery view.
    setStep('tokenless_recovery');
  }, [token, tokenInvalid, agencySlug, canonicalLoading, canonical.agencyId, canonical.agencySlug, canonical.stateSlug, navigate, searchParams]);

  return (
    <div className="min-h-screen flex flex-col relative overflow-hidden">
      <div className="pointer-events-none absolute inset-0 bg-gradient-to-br from-slate-950 via-slate-900 to-blue-950" />
      <div
        className="pointer-events-none absolute inset-0 opacity-40"
        style={{
          backgroundImage:
            'radial-gradient(circle at 15% 60%, rgba(59,130,246,0.35) 0%, transparent 50%), radial-gradient(circle at 85% 15%, rgba(14,165,233,0.2) 0%, transparent 45%)',
        }}
      />
      <div
        className="absolute inset-0 opacity-[0.04] pointer-events-none"
        style={{
          backgroundImage:
            'linear-gradient(rgba(255,255,255,.5) 1px, transparent 1px), linear-gradient(90deg, rgba(255,255,255,.5) 1px, transparent 1px)',
          backgroundSize: '48px 48px',
        }}
      />

      <header className="relative flex justify-center pt-5 pb-1 md:pt-6 md:pb-2">
        <a href="/" className="inline-flex items-center justify-center">
          <img
            src="/logos/gappsy-logo-white.webp"
            alt="Gappsy"
            className="h-7 md:h-9 w-auto"
          />
        </a>
      </header>

      <main className="relative flex-1 flex items-start justify-center px-3 pt-2 pb-6 md:pt-3 md:pb-6">
        <div className="w-full max-w-md md:max-w-2xl lg:max-w-3xl">
          {step === 'loading'        && <LoadingView />}
          {step === 'invalid_token'  && <InvalidTokenView agencySlug={agencySlug || ''} />}
          {step === 'tokenless_recovery' && (
            <TokenlessRecoveryView
              agencySlug={agencySlug || ''}
              agencyName={canonical.agencyName}
              stateName={canonical.stateName}
            />
          )}
          {step === 'error'          && <ErrorView />}
          {step === 'ready'          && agency && (
            <ReadyView agency={agency} stateName={stateName}
              canonicalMissedCount={canonicalMissedCount}
              canonicalHoursAgo={canonicalHoursAgo}
              ledgerEntries={ledgerEntries}
              ledgerHeight={ledgerHeight}
              funnelSummary={funnelSummary}
              isActing={isActing} actionError={actionError}
              onKeepVisible={handleKeepVisible} onActivate={handleActivate} onRemove={handleRemoveStart} />
          )}
          {step === 'remove_recovery' && agency && (
            <RemoveRecoveryView agency={agency} stateName={stateName}
              canonicalMissedCount={canonicalMissedCount}
              canonicalHoursAgo={canonicalHoursAgo}
              funnelSummary={funnelSummary}
              isActing={isActing} actionError={actionError}
              onKeepVisible={handleKeepVisible} onActivate={handleActivate}
              onConfirm={handleRemoveConfirm} onCancel={handleRemoveCancel} />
          )}
          {step === 'done_keep'  && agency && <DoneKeepView agency={agency} stateName={stateName} agencySlug={agency.slug || agencySlug || ''} token={token} />}
          {step === 'done_remove' && <DoneRemoveView />}
        </div>
      </main>

      <footer className="relative text-center py-3 text-[10px] text-white/40 border-t border-white/10">
        &copy; {new Date().getFullYear()} Gappsy
      </footer>
    </div>
  );
}

function LoadingView() {
  return (
    <div className="flex flex-col items-center justify-center py-16 gap-2.5">
      <div className="w-6 h-6 border-2 border-blue-400 border-t-transparent rounded-full animate-spin" />
      <p className="text-sm text-white/60">Loading&hellip;</p>
    </div>
  );
}

function ErrorView() {
  return (
    <div className="bg-slate-800/40 backdrop-blur-sm rounded-2xl border border-red-500/30 ring-1 ring-red-500/10 p-6 text-center">
      <div className="w-10 h-10 rounded-full bg-red-500/10 border border-red-500/30 flex items-center justify-center mx-auto mb-3">
        <AlertTriangle className="w-5 h-5 text-red-400" />
      </div>
      <h2 className="text-base font-semibold text-white mb-1.5">Something went wrong</h2>
      <p className="text-sm text-white/60 mb-4">Unable to load your listing.</p>
      <a href="/" className="text-sm font-medium text-blue-400 hover:text-blue-300">Back to Gappsy &rarr;</a>
    </div>
  );
}

function TokenlessRecoveryView({
  agencySlug,
  agencyName,
  stateName,
}: {
  agencySlug: string;
  agencyName: string;
  stateName: string;
}) {
  const displayName = (agencyName && agencyName.trim()) || agencySlug;
  const locationSuffix = stateName ? ` in ${stateName}` : '';
  return (
    <div className="bg-slate-800/40 backdrop-blur-sm rounded-2xl border border-amber-500/30 ring-1 ring-amber-500/10 p-6 text-center">
      <div className="w-10 h-10 rounded-full bg-amber-500/10 border border-amber-500/30 flex items-center justify-center mx-auto mb-3">
        <Clock className="w-5 h-5 text-amber-300" />
      </div>
      <h2 className="text-base font-semibold text-white mb-1.5">
        Secure manage link required
      </h2>
      <p className="text-sm text-white/70 mb-2 leading-snug max-w-sm mx-auto">
        For security, managing the listing for <strong className="text-white">{displayName}</strong>{locationSuffix} requires
        the one-time link sent to your inbox.
      </p>
      <p className="text-xs text-white/50 mb-4 leading-snug max-w-sm mx-auto">
        Open the most recent Gappsy email and tap the secure manage link. It drops you right back on
        this page with full access.
      </p>
      <a
        href="mailto:support@gappsy.com?subject=Resend%20my%20manage%20link"
        className="inline-flex items-center gap-1.5 text-sm font-medium text-blue-400 hover:text-blue-300"
      >
        Request a new manage link <ArrowRight className="w-3.5 h-3.5" />
      </a>
    </div>
  );
}

function InvalidTokenView({ agencySlug }: { agencySlug: string }) {
  return (
    <div className="bg-slate-800/40 backdrop-blur-sm rounded-2xl border border-amber-500/30 ring-1 ring-amber-500/10 p-6 text-center">
      <div className="w-10 h-10 rounded-full bg-amber-500/10 border border-amber-500/30 flex items-center justify-center mx-auto mb-3">
        <Clock className="w-5 h-5 text-amber-300" />
      </div>
      <h2 className="text-base font-semibold text-white mb-1.5">Link could not be verified</h2>
      <p className="text-sm text-white/70 mb-4 leading-snug max-w-xs mx-auto">
        Use the link from your most recent Gappsy email.
      </p>
      {agencySlug && (
        <a href={`/your-agency/${agencySlug}`}
          className="inline-flex items-center gap-1.5 text-sm font-medium text-blue-400 hover:text-blue-300">
          View profile <ArrowRight className="w-3.5 h-3.5" />
        </a>
      )}
    </div>
  );
}

function ManageHeroStat({ value, isLoading }: { value: number; isLoading: boolean }) {
  return (
    <div className="bg-white border border-gray-200 rounded-xl px-4 py-3 flex flex-col items-center text-center shadow-sm">
      <p className="text-[11px] font-semibold text-gray-500 uppercase tracking-wide mb-1">
        Last 30 days
      </p>
      {isLoading ? (
        <div className="rounded-lg bg-gray-100 animate-pulse my-1" style={{ width: '4ch', height: '2.5rem' }} />
      ) : (
        <>
          <p className="text-4xl font-extrabold tabular-nums leading-none mb-1.5 text-gray-900">
            {value}
          </p>
          <p className="text-sm font-bold text-red-500 leading-tight">You lost these clients</p>
          <p className="text-xs text-gray-400 leading-tight">Redirected to other agencies</p>
        </>
      )}
    </div>
  );
}

interface ReadyViewProps {
  agency: AgencyContext; stateName: string;
  canonicalMissedCount: number;
  canonicalHoursAgo: string;
  ledgerEntries: CanonicalEntry[];
  ledgerHeight: number;
  funnelSummary: FunnelSummary | null;
  isActing: boolean; actionError: string;
  onKeepVisible: () => void; onActivate: () => void; onRemove: () => void;
}
function ReadyView({ agency, stateName, canonicalMissedCount, canonicalHoursAgo, ledgerEntries, ledgerHeight, funnelSummary, isActing, actionError, onKeepVisible, onActivate, onRemove }: ReadyViewProps) {
  const isTop25 = agency.listing_type === 'top25';
  const canSelfRemove = agency.can_self_remove !== false;
  const kpi = canonicalMissedCount;

  return (
    <div>

      {/* HEADLINE */}
      <div className="text-center px-3">
        {isTop25 ? (
          <h1 className="text-xl md:text-2xl font-bold text-white leading-tight">Manage your listing</h1>
        ) : (
          <>
            <h1
              className="font-bold text-white mx-auto break-words text-xl md:text-2xl lg:text-3xl leading-[1.2]"
              style={{ maxWidth: 'min(40rem, 94vw)' }}
            >
              Thinking about removing &ldquo;{agency.name}&rdquo; from the {stateName} page?
            </h1>
          </>
        )}
      </div>

      {/* LEDGER PROOF BLOCK */}
      {!isTop25 && (
        <div className="mt-4">
          <p className="text-center text-base sm:text-lg md:text-xl font-bold text-white leading-snug px-1">
            <span style={{ color: '#f87171', fontVariantNumeric: 'tabular-nums' }}>{kpi}</span>
            {' '}client {kpi === 1 ? 'request' : 'requests'} came in for your listing
          </p>
          {ledgerEntries.length > 0 ? (
            <div className="mt-4">
              <ClientRequestLedger
                entries={ledgerEntries}
                heightPx={ledgerHeight}
              />
            </div>
          ) : (
            <div className="mt-4 rounded-2xl border border-white/10 bg-slate-900/60 backdrop-blur-sm px-4 py-6 text-center">
              <p className="text-xs text-white/60">
                Clients are viewing your listing but you&rsquo;re not receiving inquiries.
              </p>
              <p className="text-[11px] text-white/45 mt-1">
                Free listings don&rsquo;t receive client requests.
              </p>
            </div>
          )}
        </div>
      )}

      {/* TOP 25 INFO BLOCK */}
      {isTop25 && (
        <div className="mt-4 bg-amber-500/10 border border-amber-400/30 backdrop-blur-sm rounded-2xl px-5 py-4">
          <p className="text-sm font-semibold text-amber-200 mb-1">Active Top 25 placement</p>
          <p className="text-xs text-amber-100/80 leading-relaxed">
            This placement is managed by Gappsy directly.
          </p>
        </div>
      )}

      {/* CTA SECTION */}
      <div className="flex flex-col items-center md:flex-row md:items-stretch md:justify-center md:gap-4 relative z-20 pointer-events-auto mt-5 md:mt-6">

          <button
            type="button"
            onClick={onActivate}
            className="cta-pulse-blue w-[90%] max-w-[480px] md:w-full md:max-w-[320px] md:flex-1 bg-gradient-to-r from-blue-600 to-blue-500 hover:from-blue-500 hover:to-blue-400 text-white rounded-xl px-6 py-3 text-center transition-all duration-200 shadow-lg shadow-blue-500/20 hover:scale-[1.02] cursor-pointer pointer-events-auto relative z-10"
          >
            <p className="font-bold text-white text-sm md:text-base leading-tight">
              {isTop25 ? 'View your agency profile' : 'Start receiving these clients \u2192'}
            </p>
            <p className="text-xs text-white/80 mt-0.5 leading-tight">
              {isTop25 ? 'See your live profile on Gappsy' : 'Activate in less than 30 seconds'}
            </p>
          </button>

          {canSelfRemove ? (
            <div className="w-full mt-5 pt-5 border-t border-white/10 md:mt-0 md:pt-0 md:border-t-0 md:w-full md:max-w-[320px] md:flex-1 md:flex md:flex-col md:justify-center relative z-10 pointer-events-auto">
              <div className="text-center space-y-2">
                <button
                  type="button"
                  onClick={onRemove}
                  disabled={isActing}
                  className="w-[90%] max-w-[480px] md:w-full md:max-w-none mx-auto flex items-center justify-center gap-2 px-5 py-3 rounded-xl border border-red-500/40 bg-red-500/10 hover:bg-red-500/20 text-red-300 hover:text-red-200 backdrop-blur-sm transition-all disabled:opacity-60 font-medium text-sm cursor-pointer pointer-events-auto relative z-10"
                >
                  <Trash2 className="w-4 h-4 flex-shrink-0" />
                  {isActing ? 'Removing\u2026' : 'Remove my listing permanently'}
                </button>
                <p className="text-[10px] text-white/45 leading-relaxed">
                  This will remove your agency from all Gappsy pages
                </p>
              </div>
            </div>
          ) : (
            <div className="w-full mt-5 pt-5 border-t border-white/10 md:mt-0 md:pt-0 md:border-t-0 md:w-full md:max-w-[320px] md:flex-1 md:flex md:items-center relative z-10 pointer-events-auto">
              <div className="max-w-sm md:max-w-none w-full mx-auto flex items-center justify-center gap-2 px-3 py-2 rounded-lg border border-white/10 bg-slate-800/40 backdrop-blur-sm">
                <Lock className="w-3.5 h-3.5 text-white/50 flex-shrink-0" />
                <p className="text-[10px] text-white/60 leading-relaxed">
                  Top 25 placements can&rsquo;t be removed.{' '}
                  <a href="mailto:support@gappsy.com" className="underline text-white/80 hover:text-white">Contact support</a>
                </p>
              </div>
            </div>
          )}
        </div>

      {actionError && (
        <div className="bg-red-500/10 border border-red-500/30 backdrop-blur-sm rounded-lg px-4 py-2.5 text-xs text-red-300">{actionError}</div>
      )}
    </div>
  );
}

interface RemoveRecoveryViewProps {
  agency: AgencyContext; stateName: string;
  canonicalMissedCount: number;
  canonicalHoursAgo: string;
  funnelSummary: FunnelSummary | null;
  isActing: boolean; actionError: string;
  onKeepVisible: () => void; onActivate: () => void; onConfirm: () => void; onCancel: () => void;
}
function RemoveRecoveryView({ agency, stateName, canonicalMissedCount, canonicalHoursAgo, funnelSummary, isActing, actionError, onKeepVisible, onActivate, onConfirm, onCancel }: RemoveRecoveryViewProps) {
  const kpi = canonicalMissedCount;
  return (
    <div className="space-y-3 md:space-y-4">
      <button
        type="button"
        onClick={onCancel}
        className="flex items-center gap-1 text-xs text-white/60 hover:text-white/90 transition-colors cursor-pointer pointer-events-auto relative z-10">
        <ChevronLeft className="w-3.5 h-3.5" /> Back
      </button>

      <div className="text-center">
        <h2 className="text-xl sm:text-2xl md:text-3xl font-bold text-white leading-tight">
          {kpi > 0 ? (
            <>
              You&rsquo;ve already lost{' '}
              <span style={{ color: '#f87171', fontVariantNumeric: 'tabular-nums' }}>{kpi}</span>
              {' '}potential {kpi === 1 ? 'client' : 'clients'}
            </>
          ) : (
            'Your listing is losing potential clients'
          )}
        </h2>
        <p className="text-sm text-white/70 mt-1.5 leading-snug">
          {kpi > 0
            ? 'In the last 30 days — while your listing was inactive'
            : 'Clients are being redirected right now'
          }
        </p>
        {kpi > 0 && (
          <p className="mt-2 text-center" style={{ color: '#f87171', fontWeight: 600, fontSize: 'clamp(12px, 1.3vw, 14px)' }}>
            Most recent request: {canonicalHoursAgo}
          </p>
        )}
      </div>

      <div className="bg-red-500/10 border border-red-500/30 backdrop-blur-sm rounded-2xl px-4 md:px-5 py-3 md:py-4">
        <p className="text-sm font-semibold text-red-200 leading-snug">If you remove this listing, future clients will be redirected to other agencies and your position in the {stateName} directory is permanently lost.</p>
        <p className="text-xs text-red-200/75 mt-1.5 leading-snug">Your listing spot, visibility, and SEO backlink value will be gone.</p>
      </div>

      {actionError && (
        <div className="bg-red-500/10 border border-red-500/30 backdrop-blur-sm rounded-lg px-3 py-2 text-sm text-red-300">{actionError}</div>
      )}

      <div className="flex flex-col items-center gap-3 md:gap-4 pt-1 relative z-10 pointer-events-auto">
        <button
          type="button"
          onClick={onActivate}
          className="cta-pulse-blue px-8 md:px-10 py-3 md:py-3.5 bg-gradient-to-r from-blue-600 to-blue-500 hover:from-blue-500 hover:to-blue-400 text-white font-bold rounded-xl transition-all shadow-lg shadow-blue-500/20 hover:scale-[1.02] text-sm md:text-base cursor-pointer pointer-events-auto relative z-10">
          Start receiving these clients →
        </button>

        <button
          type="button"
          onClick={onConfirm}
          disabled={isActing}
          className="px-8 md:px-10 py-2.5 md:py-3 bg-red-500/10 hover:bg-red-500/20 border border-red-500/40 hover:border-red-500/60 text-red-300 hover:text-red-200 backdrop-blur-sm font-semibold rounded-xl transition-all text-sm md:text-base disabled:opacity-60 mt-2 cursor-pointer pointer-events-auto relative z-10">
          {isActing ? 'Removing…' : 'Remove permanently'}
        </button>
      </div>
    </div>
  );
}

function DoneKeepView({ agency, stateName, agencySlug, token }: { agency: AgencyContext; stateName: string; agencySlug: string; token: string }) {
  const activationUrl = `/your-agency/${agencySlug}?source=manage_listing&c=${encodeURIComponent(token)}`;
  return (
    <div className="bg-slate-800/40 backdrop-blur-sm rounded-2xl border border-slate-700/50 p-6 text-center">
      <div className="w-12 h-12 rounded-full bg-emerald-500/10 border border-emerald-500/30 flex items-center justify-center mx-auto mb-3">
        <CheckCircle className="w-6 h-6 text-emerald-400" />
      </div>
      <h2 className="text-lg font-bold text-white mb-1">Listing confirmed</h2>
      <p className="text-sm text-white/70 mb-1">
        <strong className="text-white">{agency.name}</strong> stays visible in {stateName}.
      </p>
      <p className="text-xs text-white/50 mb-4">Businesses can still find you.</p>

      <div className="bg-blue-500/10 border border-blue-500/30 backdrop-blur-sm rounded-lg px-3 py-2.5 text-left mb-3">
        <div className="flex items-center gap-1.5 mb-1">
          <Star className="w-3.5 h-3.5 text-blue-300" />
          <p className="text-xs font-semibold text-blue-100">Ready to receive inquiries?</p>
        </div>
        <p className="text-xs text-blue-200/80 leading-snug">
          Activate to start receiving forwarded inquiries.
        </p>
      </div>

      <button
        type="button"
        onClick={() => window.location.href = activationUrl}
        className="cta-pulse-blue w-full bg-gradient-to-r from-blue-600 to-blue-500 hover:from-blue-500 hover:to-blue-400 text-white rounded-xl py-2.5 text-sm font-bold transition-all shadow-lg shadow-blue-500/20 mb-2 cursor-pointer pointer-events-auto relative z-10">
        See activation options &rarr;
      </button>
      <a href="/" className="block text-xs text-white/50 hover:text-white/80 transition-colors">Return to Gappsy</a>
    </div>
  );
}

function DoneRemoveView() {
  return (
    <div className="bg-slate-800/40 backdrop-blur-sm rounded-2xl border border-slate-700/50 p-6 text-center">
      <div className="w-12 h-12 rounded-full bg-white/5 border border-white/10 flex items-center justify-center mx-auto mb-3">
        <CheckCircle className="w-6 h-6 text-white/70" />
      </div>
      <h2 className="text-lg font-bold text-white mb-1">Removal request received</h2>
      <p className="text-sm text-white/70 mb-4 leading-snug">
        Your listing will be removed. To reinstate, reply to any Gappsy email.
      </p>
      <a href="/" className="text-sm font-medium text-white/60 hover:text-white/90 transition-colors">
        Back to Gappsy &rarr;
      </a>
    </div>
  );
}
