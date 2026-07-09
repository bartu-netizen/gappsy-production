import { useEffect, useMemo, useRef } from 'react';
import { useParams, useSearchParams, useNavigate } from 'react-router-dom';
import {
  CheckCircle2, XCircle, Users, Lock, Zap, Trophy,
} from 'lucide-react';
import { reliablePost } from '../utils/trackingTransport';
import { useCanonicalAgency } from '../hooks/useCanonicalAgency';
import { buildDeterministicFallback } from '../utils/deterministicFallback';
import { normalizeDisplayedMissedCount } from '../utils/unifiedAgencyKpi';
import { useNoindex } from '../components/NoindexMeta';
import { buildActivationDirectLink } from '../utils/activationDirectLink';
import { resolveCompareCompetitor } from '../utils/compareCompetitor';
import { buildInitialEntries, STATE_ABBREVS, CITIES_BY_STATE } from '../utils/canonicalReplayData';

const DEVICE_CONFIGS = [
  { device: 'Mobile', os: 'iPhone' },
  { device: 'Mobile', os: 'Android' },
  { device: 'Desktop', os: 'Windows' },
  { device: 'Desktop', os: 'macOS' },
  { device: 'Tablet', os: 'iPad' },
];

function djb2(str: string): number {
  let h = 5381;
  for (let i = 0; i < str.length; i++) {
    h = ((h << 5) + h) ^ str.charCodeAt(i);
    h = h >>> 0;
  }
  return h;
}

const REPLAY_CAP_HOURS = 72;
const BUDGETS = ['$500–$1k/mo', '$1k–$2.5k/mo', '$2.5k–$5k/mo', '$5k–$7.5k/mo', '$7.5k–$10k/mo', '$10k+/mo'];
const BUDGET_MIDPOINTS = [750, 1750, 3750, 6250, 8750, 12000];

function formatSlugAsName(slug: string): string {
  return slug.split('-').map(w => w.charAt(0).toUpperCase() + w.slice(1)).join(' ');
}
function pluralHours(ms: number): string {
  // Floor at 3h for public display credibility
  const hours = Math.max(3, Math.floor(ms / 3_600_000));
  const clamped = Math.min(hours, REPLAY_CAP_HOURS);
  return `${clamped} hours ago`;
}

export default function RequestComparePage() {
  useNoindex();
  const { agencySlug } = useParams<{ agencySlug: string }>();
  const [searchParams] = useSearchParams();
  const navigate = useNavigate();

  const slug = agencySlug || 'default';
  const token = searchParams.get('t') || searchParams.get('c') || undefined;
  const aidParam = searchParams.get('aid') || undefined;
  const stateHintParam = searchParams.get('stateSlug') || undefined;

  const { agency: canonical, loading: canonicalLoading } = useCanonicalAgency(agencySlug, {
    token, agencyId: aidParam, stateHint: stateHintParam,
  });

  const agencyName = canonical.agencyName || formatSlugAsName(slug) || 'Your Agency';
  const stateSlug = canonical.stateSlug || stateHintParam || '';
  const stateName = canonical.stateName || '';

  const fallback = useMemo(() => buildDeterministicFallback(slug), [slug]);
  const missedCountRaw = canonical.missedCount > 0 ? canonical.missedCount : fallback.missedCount;
  const missedCount = normalizeDisplayedMissedCount(missedCountRaw);
  const resolvedAnchorMs = canonical.anchorMs > 0 ? canonical.anchorMs : fallback.anchorMs;

  const latestEntry = useMemo(() => {
    const baseAnchorMs = (canonical.baseAnchorMs > 0 ? canonical.baseAnchorMs : null) ?? resolvedAnchorMs;
    const baseGeneratedCount = typeof canonical.baseGeneratedCount === "number" ? canonical.baseGeneratedCount : undefined;
    const entries = buildInitialEntries({
      agencyId: canonical.agencyId || slug,
      agencySlug: slug,
      stateSlug: stateSlug || '',
      missedCount: Math.max(1, missedCount),
      baseGeneratedCount,
      anchorMs: baseAnchorMs,
      overrideEntries: canonical.overrideEntries.length > 0 ? canonical.overrideEntries : undefined,
    });
    return entries[0] ?? null;
  }, [canonical.agencyId, canonical.baseAnchorMs, canonical.baseGeneratedCount, canonical.overrideEntries, slug, stateSlug, missedCount, resolvedAnchorMs]);

  const locationFallback = (() => {
    const cities = stateSlug ? CITIES_BY_STATE[stateSlug] : null;
    if (cities && cities.length) {
      const abbr = STATE_ABBREVS[stateSlug] ?? stateSlug.toUpperCase().slice(0, 2);
      return `${cities[0]}, ${abbr}`;
    }
    return stateName || 'Local lead';
  })();

  const service = latestEntry?.service || 'Client Request';
  const budget = latestEntry?.budget || 'Budget discussed';
  const location = latestEntry?.location || locationFallback;
  const maskedIp = latestEntry?.maskedIp || '172.58.xx.xxx';
  const devCfg = DEVICE_CONFIGS[djb2((canonical.agencyId || slug) + 'device') % DEVICE_CONFIGS.length];
  const deviceLabel = `${devCfg.device} · ${devCfg.os}`;

  const budgetIdx = BUDGETS.indexOf(budget);
  const estimatedValueMonthly = budgetIdx >= 0 ? BUDGET_MIDPOINTS[budgetIdx] : 3750;
  const inactiveValueTotal = Math.max(1, missedCount) * 1500;
  const competitorReceivedCount = Math.max(missedCount + 4, 7);
  const competitorValueTotal = competitorReceivedCount * 1500;

  const competitor = useMemo(
    () => resolveCompareCompetitor({ agencySlug: slug, stateName }),
    [slug, stateName],
  );

  const anchorMs = resolvedAnchorMs;
  const hoursAgoMs = Date.now() - anchorMs;
  const mostRecentRequestTime = pluralHours(hoursAgoMs);

  const sessionId = useRef(crypto.randomUUID());
  const visitorId = useRef<string>((() => {
    try {
      let id = localStorage.getItem('gappsy_visitor_id');
      if (!id) { id = crypto.randomUUID(); localStorage.setItem('gappsy_visitor_id', id); }
      return id;
    } catch { return crypto.randomUUID(); }
  })());
  const firedRef = useRef<Set<string>>(new Set());

  // Step numbers for request_compare funnel events (used by log-funnel-event)
  const COMPARE_STEP: Record<string, number> = {
    request_compare_page_viewed:          10,
    request_compare_loaded:               20,
    request_compare_request_seen:         30,
    request_compare_competitor_seen:      40,
    request_compare_cta_activate_clicked: 50,
    request_compare_stay_inactive_clicked: 60,
  };

  const fire = (event_type: string, extra: Record<string, unknown> = {}) => {
    if (firedRef.current.has(event_type)) return;
    firedRef.current.add(event_type);
    reliablePost(
      'log-funnel-event',
      {
        fsid: sessionId.current,
        funnel_name: 'request_compare',
        funnel_type: 'request_compare',
        event_name: event_type,
        step_number: COMPARE_STEP[event_type] ?? 0,
        agency_id: canonical.agencyId || undefined,
        agency_slug: slug,
        agency_name: agencyName,
        state_slug: stateSlug || undefined,
        page_path: `/request-compare/${slug}`,
        metadata: {
          visitor_id: visitorId.current,
          referrer: (typeof document !== 'undefined' ? document.referrer : null) || null,
          timestamp: new Date().toISOString(),
          competitor_name: competitor.name,
          competitor_source: competitor.source,
          missed_count: missedCount,
          most_recent_request_ms: anchorMs,
          ...extra,
        },
      },
      `compare:${event_type}`,
    );
  };

  useEffect(() => {
    fire('request_compare_page_viewed');
  // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  const ledgerViewFiredRef = useRef(false);
  useEffect(() => {
    if (!canonical.agencyId || ledgerViewFiredRef.current) return;
    ledgerViewFiredRef.current = true;
    fetch(
      `${import.meta.env.VITE_SUPABASE_URL}/functions/v1/record-ledger-view`,
      {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          Authorization: `Bearer ${import.meta.env.VITE_SUPABASE_ANON_KEY}`,
          apikey: import.meta.env.VITE_SUPABASE_ANON_KEY as string,
        },
        body: JSON.stringify({
          agency_id: canonical.agencyId,
          state_slug: canonical.stateSlug || stateSlug || '',
          client_anchor_ms: resolvedAnchorMs > 0 ? resolvedAnchorMs : undefined,
        }),
      },
    ).catch(() => {});
  // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [canonical.agencyId]);

  useEffect(() => {
    if (canonicalLoading) return;
    fire('request_compare_loaded');
    fire('request_compare_request_seen');
    fire('request_compare_competitor_seen');
  // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [canonicalLoading]);

  const handleActivate = () => {
    fire('request_compare_cta_activate_clicked', {
      competitor_name: competitor.name,
      competitor_source: competitor.source,
    });
    const baseUrl = buildActivationDirectLink({
      agencyId: canonical.agencyId,
      stateSlug,
      agencyName,
      stateName,
    });
    if (!baseUrl) return;
    const finalUrl = token ? `${baseUrl}&t=${encodeURIComponent(token)}` : baseUrl;
    navigate(finalUrl);
  };

  const handleStayInactive = () => {
    fire('request_compare_stay_inactive_clicked');
  };

  const competitorName = competitor.name || (stateName ? `Active agency in ${stateName}` : 'Active agency');
  const cityShort = location.split(',')[0] || stateName || 'your city';

  return (
    <div
      className="h-screen max-h-screen w-screen overflow-hidden bg-slate-50 flex flex-col"
      style={{ fontFamily: 'Inter, system-ui, -apple-system, sans-serif' }}
    >
      {/* Top bar: logo + Compare Mode badge centered on same row */}
      <header className="shrink-0 px-4 sm:px-6 md:px-8 pt-3 md:pt-4 pb-2">
        <div className="flex flex-col items-center gap-1">
          {/* Logo + badge on one centered row */}
          <div className="flex items-center gap-2.5 sm:gap-3">
            <div
              className="inline-flex items-center rounded-full bg-[#0A1735] px-4 md:px-5"
              style={{ height: '36px', boxShadow: '0 6px 18px rgba(0,0,0,0.08)' }}
            >
              <img
                src="/logos/Gappsy-logo-white.webp"
                alt="Gappsy"
                className="h-4 md:h-5 w-auto"
              />
            </div>
            <div className="inline-flex items-center gap-1.5 px-2.5 py-0.5 rounded-full bg-slate-100 border border-slate-200">
              <Trophy className="w-3 h-3 text-slate-900" />
              <span className="font-bold uppercase tracking-[0.12em] text-slate-900" style={{ fontSize: 'clamp(9px, 1vw, 10px)' }}>
                Compare Mode
              </span>
            </div>
          </div>

          {/* Headline + subtitle below the row */}
          <h1
            className="font-extrabold text-slate-900 leading-[1.05] mt-1 text-center"
            style={{ fontSize: 'clamp(18px, 2.4vw, 30px)', letterSpacing: '-0.02em' }}
          >
            Same request. Different outcome.
          </h1>
          <p
            className="text-slate-500 hidden sm:block text-center"
            style={{ fontSize: 'clamp(11px, 1.2vw, 13px)' }}
          >
            Your listing is visible, but inactive.
          </p>
        </div>
      </header>

      {/* Body: 3 cards on desktop, stacked on mobile — vertically centered, no stretching */}
      <main className="flex-1 min-h-0 overflow-hidden px-3 sm:px-5 md:px-8 pb-1 md:pb-2 pt-1 flex items-center justify-center">
        <div className="w-full max-w-6xl mx-auto grid md:grid-cols-3 grid-cols-1 gap-3 md:gap-4 items-center">

          {/* LEFT — YOU (inactive) */}
          <section className="rounded-2xl border border-rose-200 bg-rose-50/70 overflow-hidden">
            <div className="p-4 md:p-5 flex flex-col gap-3">
              <div className="flex items-center gap-2 flex-wrap">
                <span className="px-2 py-0.5 rounded-md bg-rose-100 text-rose-700 font-bold uppercase tracking-wider" style={{ fontSize: 'clamp(9px, 0.95vw, 10px)' }}>
                  YOU
                </span>
                <span className="inline-flex items-center gap-1.5 px-2 py-0.5 rounded-full bg-white border border-rose-200" style={{ fontSize: 'clamp(10px, 1.05vw, 11px)', animation: 'pill-glow-rose 2.6s ease-in-out infinite' }}>
                  <span className="w-1.5 h-1.5 rounded-full bg-rose-500 shrink-0" style={{ animation: 'dot-pulse-rose 1.8s ease-in-out infinite' }} />
                  <span className="font-semibold text-rose-700">Inactive — not receiving requests</span>
                </span>
              </div>
              <div>
                <h2 className="font-extrabold text-slate-900 leading-tight break-words" style={{ fontSize: 'clamp(15px, 1.75vw, 20px)' }}>
                  {agencyName}
                </h2>
                {stateName && (
                  <p className="text-slate-500 mt-0.5" style={{ fontSize: 'clamp(11px, 1.15vw, 13px)' }}>
                    {stateName}
                  </p>
                )}
              </div>

              <ul className="space-y-1.5">
                {[
                  'Visible in search results',
                  'But not receiving inquiries',
                  'Clients are sent to other agencies',
                ].map((t) => (
                  <li key={t} className="flex items-center gap-1.5 text-slate-700" style={{ fontSize: 'clamp(10px, 1.1vw, 12px)' }}>
                    <XCircle className="w-3.5 h-3.5 text-rose-500 shrink-0" />
                    <span>{t}</span>
                  </li>
                ))}
              </ul>

              <div className="rounded-xl bg-white border border-rose-200 p-3">
                <p className="uppercase tracking-wider font-bold text-slate-400 mb-1" style={{ fontSize: 'clamp(9px, 0.95vw, 10px)' }}>
                  Last 30 days
                </p>
                <div className="flex items-baseline gap-1.5">
                  <span className="font-extrabold text-rose-600" style={{ fontSize: 'clamp(22px, 2.8vw, 32px)', lineHeight: 1 }}>
                    {missedCount}
                  </span>
                  <span className="text-slate-600 font-medium" style={{ fontSize: 'clamp(10px, 1.15vw, 12px)' }}>
                    client requests missed
                  </span>
                </div>
                <div className="mt-2 pt-2 border-t border-slate-100 flex justify-between items-start gap-2">
                  <div className="flex flex-col">
                    <span className="text-slate-500" style={{ fontSize: 'clamp(10px, 1.1vw, 12px)' }}>Estimated opportunity</span>
                    <span className="text-slate-400 mt-0.5 leading-none" style={{ fontSize: '10px', opacity: 0.72 }}>Based on $1,500 avg. project value</span>
                  </div>
                  <span className="font-extrabold text-rose-700 shrink-0" style={{ fontSize: 'clamp(14px, 1.6vw, 18px)' }}>
                    ${inactiveValueTotal.toLocaleString()}
                  </span>
                </div>
              </div>
            </div>
          </section>

          {/* CENTER — Request card: shorter, centered, slightly dominant */}
          <section
            className="rounded-2xl bg-white border border-slate-300 shadow-xl overflow-hidden mx-auto w-full md:scale-[1.02] md:z-10"
          >
            <div className="p-3 md:p-3.5 flex flex-col gap-2">

              {/* Header: timestamp + title */}
              <div className="flex flex-col items-center text-center">
                <div className="inline-flex items-center gap-1 px-2 py-0.5 rounded-full bg-blue-50 border border-blue-100 text-blue-600" style={{ fontSize: 'clamp(9px, 0.95vw, 10px)' }}>
                  <span className="w-1.5 h-1.5 rounded-full bg-blue-500 shrink-0" style={{ animation: 'dot-pulse-rose 1.8s ease-in-out infinite' }} />
                  <Users className="w-3 h-3" />
                  <span className="font-semibold">{mostRecentRequestTime}</span>
                </div>
                <h3 className="font-extrabold text-slate-900 leading-tight mt-1" style={{ fontSize: 'clamp(13px, 1.45vw, 15px)' }}>
                  New client request submitted
                </h3>
              </div>

              {/* REQUEST DETAILS — all fields merged */}
              <div className="border-t border-slate-100 pt-1.5">
                <p className="text-slate-400 uppercase font-semibold tracking-widest mb-1.5" style={{ fontSize: '9px' }}>Request Details</p>
                <dl className="grid grid-cols-2 gap-x-3 gap-y-0.5" style={{ fontSize: 'clamp(9px, 0.95vw, 11px)' }}>
                  {([
                    ['Service', service],
                    ['Budget', budget],
                    ['Timeline', 'ASAP'],
                    ['Location', location],
                    ['IP', maskedIp],
                    ['Device', deviceLabel],
                  ] as [string, string][]).map(([label, value]) => (
                    <div key={label} className="flex items-baseline gap-1 min-w-0">
                      <dt className="text-slate-400 shrink-0">{label}:</dt>
                      <dd className="text-slate-700 font-medium truncate">{value}</dd>
                    </div>
                  ))}
                </dl>
              </div>

              {/* WHAT HAPPENED */}
              <div className="border-t border-slate-100 pt-1.5">
                <p className="text-slate-400 uppercase font-semibold tracking-widest mb-1.5" style={{ fontSize: '9px' }}>What Happened</p>
                {(() => {
                  const steps = [
                    { n: 1, text: 'Request received', tone: 'muted' },
                    { n: 2, text: `Searching ${stateName || cityShort}`, tone: 'muted' },
                    { n: 3, text: 'Found your listing', tone: 'muted' },
                    { n: 4, text: 'Listing is inactive', tone: 'rose' },
                    { n: 5, text: 'Sent to active agency', tone: 'emerald' },
                  ] as const;
                  return (
                    <ol className="grid grid-cols-2 gap-1.5">
                      {steps.filter((s) => s.tone !== 'emerald').map((row) => {
                        const isRose = row.tone === 'rose';
                        return (
                          <li
                            key={row.text}
                            className={`flex items-center gap-1.5 rounded-md px-2 py-1 ${
                              isRose ? 'bg-rose-50 border border-rose-100' : 'bg-slate-50 border border-slate-100'
                            }`}
                          >
                            <span className={`shrink-0 font-bold leading-none ${isRose ? 'text-rose-400' : 'text-slate-300'}`} style={{ fontSize: '9px' }}>
                              {row.n}
                            </span>
                            {isRose
                              ? <XCircle className="w-3 h-3 text-rose-500 shrink-0" />
                              : <CheckCircle2 className="w-3 h-3 text-slate-300 shrink-0" />}
                            <span
                              className={`truncate ${isRose ? 'text-rose-600 font-semibold' : 'text-slate-500'}`}
                              style={{ fontSize: 'clamp(9px, 0.9vw, 11px)' }}
                            >
                              {row.text}
                            </span>
                          </li>
                        );
                      })}
                      <li
                        className="col-span-2 flex items-center justify-center gap-1.5 rounded-md px-2 py-1.5 bg-emerald-50 border border-emerald-200"
                        style={{ boxShadow: '0 0 0 1px rgba(16,185,129,0.12), 0 1px 4px rgba(16,185,129,0.08)' }}
                      >
                        <span className="shrink-0 font-bold leading-none text-emerald-400" style={{ fontSize: '9px' }}>5</span>
                        <CheckCircle2 className="w-3.5 h-3.5 text-emerald-500 shrink-0" />
                        <span className="font-semibold text-emerald-700" style={{ fontSize: 'clamp(10px, 0.95vw, 12px)' }}>
                          Sent to active agency →
                        </span>
                      </li>
                    </ol>
                  );
                })()}
              </div>

            </div>
          </section>

          {/* RIGHT — COMPETITOR (active) */}
          <section className="rounded-2xl border border-emerald-200 bg-emerald-50/70 overflow-hidden">
            <div className="p-4 md:p-5 flex flex-col gap-3">
              <div className="flex items-center gap-2 flex-wrap">
                <span className="px-2 py-0.5 rounded-md bg-emerald-100 text-emerald-800 font-bold uppercase tracking-wider" style={{ fontSize: 'clamp(9px, 0.95vw, 10px)' }}>
                  COMPETITOR
                </span>
                <span className="inline-flex items-center gap-1.5 px-2 py-0.5 rounded-full bg-white border border-emerald-200" style={{ fontSize: 'clamp(10px, 1.05vw, 11px)', animation: 'pill-glow-emerald 2.8s ease-in-out infinite' }}>
                  <span className="w-1.5 h-1.5 rounded-full bg-emerald-500 shrink-0" style={{ animation: 'dot-pulse-emerald 1.8s ease-in-out infinite 0.4s' }} />
                  <span className="font-semibold text-emerald-700">Active — receiving requests</span>
                </span>
              </div>
              <div>
                <h2 className="font-extrabold text-slate-900 leading-tight break-words" style={{ fontSize: 'clamp(15px, 1.75vw, 20px)' }}>
                  {competitorName}
                </h2>
                {stateName && (
                  <p className="text-slate-500 mt-0.5" style={{ fontSize: 'clamp(11px, 1.15vw, 13px)' }}>
                    {stateName}
                  </p>
                )}
              </div>

              <ul className="space-y-1.5">
                {[
                  'Visible to clients',
                  'Receiving inquiries directly',
                  'Winning new business',
                ].map((t) => (
                  <li key={t} className="flex items-center gap-1.5 text-slate-700" style={{ fontSize: 'clamp(10px, 1.1vw, 12px)' }}>
                    <CheckCircle2 className="w-3.5 h-3.5 text-emerald-500 shrink-0" />
                    <span>{t}</span>
                  </li>
                ))}
              </ul>

              <div className="rounded-xl bg-white border border-emerald-200 p-3">
                <p className="uppercase tracking-wider font-bold text-slate-400 mb-1" style={{ fontSize: 'clamp(9px, 0.95vw, 10px)' }}>
                  Last 30 days
                </p>
                <div className="flex items-baseline gap-1.5">
                  <span className="font-extrabold text-emerald-600" style={{ fontSize: 'clamp(22px, 2.8vw, 32px)', lineHeight: 1 }}>
                    {competitorReceivedCount}
                  </span>
                  <span className="text-slate-600 font-medium" style={{ fontSize: 'clamp(10px, 1.15vw, 12px)' }}>
                    client requests received
                  </span>
                </div>
                <div className="mt-2 pt-2 border-t border-slate-100 flex justify-between items-start gap-2">
                  <div className="flex flex-col">
                    <span className="text-slate-500" style={{ fontSize: 'clamp(10px, 1.1vw, 12px)' }}>Estimated opportunity</span>
                    <span className="text-slate-400 mt-0.5 leading-none" style={{ fontSize: '10px', opacity: 0.72 }}>Based on $1,500 avg. project value</span>
                  </div>
                  <span className="font-extrabold text-emerald-700 shrink-0" style={{ fontSize: 'clamp(14px, 1.6vw, 18px)' }}>
                    ${competitorValueTotal.toLocaleString()}
                  </span>
                </div>
              </div>
            </div>
          </section>

        </div>
      </main>

      {/* CTA row */}
      <footer className="shrink-0 px-3 pt-2 pb-3 md:pb-4 flex flex-col items-center gap-2.5 relative z-10 pointer-events-auto">
        <button
          type="button"
          onClick={handleActivate}
          className="w-full md:w-auto rounded-2xl bg-slate-900 hover:bg-slate-800 text-white inline-flex items-center justify-center gap-3 shadow-lg shadow-slate-900/20 transition-colors cursor-pointer relative z-10 pointer-events-auto"
          style={{ maxWidth: '440px', paddingLeft: '32px', paddingRight: '32px', paddingTop: '18px', paddingBottom: '18px', touchAction: 'manipulation', WebkitTapHighlightColor: 'transparent' }}
        >
          <Zap className="w-4 h-4 text-amber-300 shrink-0" fill="currentColor" />
          <span className="flex flex-col items-start">
            <span className="font-bold" style={{ fontSize: 'clamp(15px, 1.6vw, 17px)', lineHeight: 1.2 }}>Activate My Listing</span>
            <span style={{ fontSize: 'clamp(11px, 1.1vw, 13px)', lineHeight: 1.3, opacity: 0.72, marginTop: '4px' }}>Start receiving client requests</span>
          </span>
        </button>
        <button
          type="button"
          onClick={handleStayInactive}
          className="inline-flex items-center gap-1 text-slate-400 hover:text-slate-600 transition-colors cursor-pointer relative z-10 pointer-events-auto"
          style={{ fontSize: 'clamp(11px, 1.1vw, 12px)', touchAction: 'manipulation', WebkitTapHighlightColor: 'transparent' }}
        >
          <Lock className="w-3 h-3" />
          <span>Stay inactive</span>
        </button>
      </footer>
    </div>
  );
}
