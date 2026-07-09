import { useState, useEffect, useRef, useMemo } from 'react';
import { useParams, useSearchParams, useNavigate } from 'react-router-dom';
import {
  MapPin, Monitor, Globe, DollarSign, Calendar, Briefcase, User,
  ArrowRight, CheckCircle2, Clock,
} from 'lucide-react';
import { reliablePost } from '../utils/trackingTransport';
import { useCanonicalAgency } from '../hooks/useCanonicalAgency';
import { CITIES_BY_STATE, STATE_ABBREVS, buildInitialEntries, type CanonicalEntry } from '../utils/canonicalReplayData';
import {
  ClientRequestLedgerHeader,
  ClientRequestLedgerRow,
  LEDGER_ROW_H,
  useIsMobileLedger,
} from '../components/ClientRequestLedger';
import { buildDeterministicFallback } from '../utils/deterministicFallback';
import { normalizeDisplayedMissedCount } from '../utils/unifiedAgencyKpi';
import { useNoindex } from '../components/NoindexMeta';
import { buildActivationDirectLink } from '../utils/activationDirectLink';

// ─── Scene name map (SceneId → canonical replay event scene_name) ──────────────
const SCENE_NAMES: Record<number, string> = {
  1: 'intro',
  2: 'client_information',
  3: 'client_request',
  4: 'routed_to_other_agency',
  5: 'missed_clients_summary',
  6: 'missed_clients_ledger',
  7: 'final_consequence',
  8: 'final_cta',
};

// ─── Competitor config ─────────────────────────────────────────────────────────
const redirectedAgencyName = 'Vazagency';

// ─── Deterministic hash (djb2) ────────────────────────────────────────────────
function djb2(str: string): number {
  let h = 5381;
  for (let i = 0; i < str.length; i++) {
    h = ((h << 5) + h) ^ str.charCodeAt(i);
    h = h >>> 0;
  }
  return h;
}

function pick<T>(arr: T[], seed: number): T {
  return arr[seed % arr.length];
}

// ─── Data pools ───────────────────────────────────────────────────────────────
const SERVICES = [
  'SEO & Content Marketing',
  'Google Ads / PPC',
  'Social Media Marketing',
  'Web Design & Development',
  'Email Marketing',
  'Local SEO',
  'Brand Strategy',
  'Video Production',
];


const BUDGETS = ['$500–$1k/mo', '$1k–$2.5k/mo', '$2.5k–$5k/mo', '$5k–$7.5k/mo', '$7.5k–$10k/mo', '$10k+/mo'];
const BUDGET_MIDPOINTS = [750, 1750, 3750, 6250, 8750, 12000];

const TIMELINES = ['As soon as possible', 'Within 30 days', '1–3 months', 'Flexible'];

const BUSINESS_TYPES = [
  'Local service business',
  'E-commerce store',
  'SaaS / software',
  'Retail business',
  'Healthcare practice',
];

const DEVICE_CONFIGS = [
  { device: 'Mobile', browser: 'Safari' },
  { device: 'Mobile', browser: 'Chrome' },
  { device: 'Desktop', browser: 'Chrome' },
  { device: 'Desktop', browser: 'Edge' },
  { device: 'Tablet', browser: 'Safari' },
];

const IP_PREFIXES = [
  '72.21', '74.125', '98.124', '104.18', '108.162',
  '162.158', '172.217', '199.27', '204.79', '209.85',
  '216.58', '66.249', '142.250', '35.186', '34.102',
  '23.32', '192.0', '198.41', '185.199', '151.101',
];


type LedgerEntry = CanonicalEntry;

function getAgencyNameStyle(name: string, tier: 'large' | 'medium'): React.CSSProperties {
  const len = name.trim().length;

  if (tier === 'large') {
    if (len <= 22) return { fontSize: 'clamp(52px, 11vw, 96px)', lineHeight: 1.0, letterSpacing: '-0.04em' };
    if (len <= 32) return { fontSize: 'clamp(42px, 8.5vw, 76px)', lineHeight: 1.02, letterSpacing: '-0.035em' };
    if (len <= 42) return { fontSize: 'clamp(32px, 6.5vw, 58px)', lineHeight: 1.06, letterSpacing: '-0.03em' };
    return { fontSize: 'clamp(24px, 5vw, 44px)', lineHeight: 1.1, letterSpacing: '-0.025em' };
  }

  if (len <= 22) return { fontSize: 'clamp(44px, 9.5vw, 80px)', lineHeight: 1.02, letterSpacing: '-0.035em' };
  if (len <= 32) return { fontSize: 'clamp(36px, 7.5vw, 64px)', lineHeight: 1.04, letterSpacing: '-0.03em' };
  if (len <= 42) return { fontSize: 'clamp(28px, 5.5vw, 48px)', lineHeight: 1.08, letterSpacing: '-0.025em' };
  return { fontSize: 'clamp(22px, 4.2vw, 38px)', lineHeight: 1.12, letterSpacing: '-0.02em' };
}

function formatSlugAsName(slug: string): string {
  return slug.split('-').map(w => w.charAt(0).toUpperCase() + w.slice(1)).join(' ');
}

// Cap for the replay anchor / "most recent request" UX only.
const REPLAY_CAP_HOURS = 72;
const REPLAY_CAP_MINUTES = REPLAY_CAP_HOURS * 60;

// Anchor-driven label: used for the single "most recent request" copy.
// Hard-capped so the anchor never displays as multi-day.
function pluralHours(n: number): string {
  // Floor at 3h for public display credibility
  const clamped = Math.min(Math.max(3, n), REPLAY_CAP_HOURS);
  return `${clamped} hours ago`;
}


interface ReplayAnchors {
  v: number;
  slug: string;
  singleClientMs: number;
  ledgerBaseMs: number;
}

const ANCHORS_V = 2;

function getOrCreateAnchors(slug: string): ReplayAnchors {
  const h = djb2(slug + ':replayAnchor');
  const offsetH = 2 + (h % 71); // 2–72 hours
  const anchorMs = Date.now() - offsetH * 3_600_000;
  return { v: ANCHORS_V, slug, singleClientMs: anchorMs, ledgerBaseMs: anchorMs };
}

function getDeterministicData(slug: string, stateSlug: string, anchors: ReplayAnchors) {
  const h1 = djb2(slug);
  const h2 = djb2(slug + 'budget');
  const h3 = djb2(slug + 'timeline');
  const h4 = djb2(slug + 'biz');
  const h5 = djb2(slug + 'device');
  const h7 = djb2(slug + 'city');

  const hIpA = djb2(slug + 'ipa');
  const ipOctet3Raw = ((hIpA % 220) + 10).toString();
  const ipPrefix = pick(IP_PREFIXES, djb2(slug + 'ipregion'));
  const ipOctet3Masked = ipOctet3Raw.slice(0, 2) + 'x';

  const stateCities = CITIES_BY_STATE[stateSlug];
  const stateAbbr = stateCities ? (STATE_ABBREVS[stateSlug] ?? stateSlug.toUpperCase().slice(0, 2)) : '';
  const budgetIdx = h2 % BUDGETS.length;
  const devCfg = pick(DEVICE_CONFIGS, h5);

  const minutesAgo = Math.min(Math.max(180, Math.floor((Date.now() - anchors.singleClientMs) / 60_000)), REPLAY_CAP_MINUTES);
  const hoursAgo = Math.min(Math.max(1, Math.floor(minutesAgo / 60)), REPLAY_CAP_HOURS);

  const location = stateCities
    ? `${pick(stateCities, h7)}, ${stateAbbr}`
    : null;

  return {
    service: pick(SERVICES, h1),
    budget: BUDGETS[budgetIdx],
    timeline: pick(TIMELINES, h3),
    businessType: pick(BUSINESS_TYPES, h4),
    device: devCfg.device,
    browser: devCfg.browser,
    maskedIp: `${ipPrefix}.${ipOctet3Masked}.xxx`,
    location,
    hoursAgo,
    budgetMidpoint: BUDGET_MIDPOINTS[budgetIdx],
  };
}

// ─── Scene types ───────────────────────────────────────────────────────────────
type SceneId = 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8;
type S4Phase = 'contact' | 'failed';

const TRANS_MS = 520;
const EASE = 'cubic-bezier(0.22, 1, 0.36, 1)';

// ─── SceneWrapper ──────────────────────────────────────────────────────────────
function SceneWrapper({
  children,
  exiting,
  entered,
}: {
  children: React.ReactNode;
  exiting: boolean;
  entered: boolean;
}) {
  return (
    <div
      style={{
        position: 'fixed',
        inset: 0,
        zIndex: 1,
        display: 'flex',
        flexDirection: 'column',
        alignItems: 'center',
        justifyContent: 'center',
        overflow: 'hidden',
        opacity: exiting ? 0 : entered ? 1 : 0,
        transform: exiting ? 'translateY(-16px)' : entered ? 'translateY(0)' : 'translateY(20px)',
        transition: `opacity ${TRANS_MS}ms ${EASE}, transform ${TRANS_MS}ms ${EASE}`,
        pointerEvents: exiting ? 'none' : 'auto',
      }}
    >
      {children}
    </div>
  );
}

// ─── FadeItem ──────────────────────────────────────────────────────────────────
function FadeItem({
  show,
  delay,
  children,
  style,
}: {
  show: boolean;
  delay: number;
  children: React.ReactNode;
  style?: React.CSSProperties;
}) {
  return (
    <div
      style={{
        opacity: show ? 1 : 0,
        transform: show ? 'translateY(0)' : 'translateY(18px)',
        transition: `opacity 0.68s ${EASE} ${delay}ms, transform 0.68s ${EASE} ${delay}ms`,
        pointerEvents: show ? 'auto' : 'none',
        ...style,
      }}
    >
      {children}
    </div>
  );
}

// ─── ValueReveal ──────────────────────────────────────────────────────────────
function ValueReveal({
  show,
  delay,
  children,
  style,
}: {
  show: boolean;
  delay: number;
  children: React.ReactNode;
  style?: React.CSSProperties;
}) {
  return (
    <div
      style={{
        opacity: show ? 1 : 0,
        transform: show ? 'translateY(0) scale(1)' : 'translateY(10px) scale(0.986)',
        filter: show ? 'blur(0px)' : 'blur(4px)',
        transition: `opacity 0.62s ${EASE} ${delay}ms, transform 0.62s ${EASE} ${delay}ms, filter 0.62s ${EASE} ${delay}ms`,
        willChange: 'opacity, transform, filter',
        ...style,
      }}
    >
      {children}
    </div>
  );
}

// ─── SceneLabel — uppercase label with optional icon ─────────────────────────
function SceneLabel({
  icon,
  text,
  entered,
  delay = 0,
  mb = 'clamp(32px, 6vh, 56px)',
}: {
  icon?: React.ReactNode;
  text: string;
  entered: boolean;
  delay?: number;
  mb?: string;
}) {
  return (
    <div style={{
      display: 'flex',
      alignItems: 'center',
      gap: 8,
      marginBottom: mb,
      opacity: entered ? 1 : 0,
      transform: entered ? 'translateY(0)' : 'translateY(12px)',
      transition: `opacity 0.55s ${EASE} ${delay}ms, transform 0.55s ${EASE} ${delay}ms`,
    }}>
      {icon}
      <p style={{
        fontSize: 'clamp(13px, 1.4vw, 15px)',
        color: 'rgba(255,255,255,0.50)',
        textTransform: 'uppercase',
        fontWeight: 600,
        letterSpacing: '0.16em',
        margin: 0,
      }}>
        {text}
      </p>
    </div>
  );
}

// ─── Scene 6 responsive layout ────────────────────────────────────────────────
const S6_STYLE = `
  .s6-group {
    display: flex;
    flex-direction: column;
    gap: 16px;
  }
  .s6-item {
    display: flex;
    align-items: center;
    gap: 10px;
  }
  .s6-sep {
    display: none;
  }
  @media (min-width: 600px) {
    .s6-group {
      flex-direction: row;
      align-items: center;
      gap: 0;
      flex-wrap: nowrap;
    }
    .s6-sep {
      display: block;
      color: rgba(255,255,255,0.16);
      font-size: 12px;
      margin: 0 16px;
      flex-shrink: 0;
      line-height: 1;
    }
  }
`;

// ─── Scene 8 mobile typography ────────────────────────────────────────────────
const S8_STYLE = `
  .s8-headline {
    font-size: 22px;
    white-space: normal;
    max-width: 100%;
    line-height: 1.18;
  }
  .s8-subline {
    font-size: 15px;
    line-height: 1.5;
  }
  @media (min-width: 480px) {
    .s8-headline {
      font-size: clamp(32px, 6.4vw, 58px);
      white-space: nowrap;
      line-height: 1.1;
    }
    .s8-subline {
      font-size: clamp(19px, 3.2vw, 28px);
      line-height: 1.4;
    }
  }
`;

// ─── Ambient background ───────────────────────────────────────────────────────
const AMBIENT_STYLE = `
  @keyframes ambientDrift {
    0%   { opacity: 1; transform: translate(0%,   0%)   scale(1);    }
    33%  { opacity: 1; transform: translate(1.2%, -0.8%) scale(1.018); }
    66%  { opacity: 1; transform: translate(-0.8%, 1%)  scale(0.992); }
    100% { opacity: 1; transform: translate(0%,   0%)   scale(1);    }
  }
  @keyframes ambientDrift2 {
    0%   { opacity: 0.6; transform: translate(0%, 0%)   scale(1);    }
    40%  { opacity: 0.8; transform: translate(-1%, 0.6%) scale(1.01); }
    70%  { opacity: 0.5; transform: translate(0.8%, -0.5%) scale(0.99); }
    100% { opacity: 0.6; transform: translate(0%, 0%)   scale(1);    }
  }
`;

function AmbientBackground() {
  return (
    <>
      <style>{AMBIENT_STYLE}</style>
      <div style={{
        position: 'fixed',
        inset: 0,
        pointerEvents: 'none',
        zIndex: 0,
        overflow: 'hidden',
      }}>
        <div style={{
          position: 'absolute',
          inset: '-10%',
          background: 'radial-gradient(ellipse 55% 38% at 28% 52%, rgba(37,99,235,0.045) 0%, transparent 68%)',
          animation: 'ambientDrift 16s ease-in-out infinite',
        }} />
        <div style={{
          position: 'absolute',
          inset: '-10%',
          background: 'radial-gradient(ellipse 40% 30% at 72% 46%, rgba(16,185,129,0.022) 0%, transparent 65%)',
          animation: 'ambientDrift2 12s ease-in-out infinite',
        }} />
      </div>
    </>
  );
}

// ─── MissedLedger — premium auto-scrolling activity feed ─────────────────────
function MissedLedger({
  entries,
  active,
}: {
  entries: LedgerEntry[];
  active: boolean;
}) {
  const isMobile = useIsMobileLedger();
  const VISIBLE_ROWS = 5;
  const containerH = LEDGER_ROW_H * VISIBLE_ROWS;
  const maxScroll = Math.max(0, (entries.length - VISIBLE_ROWS) * LEDGER_ROW_H);

  // Adapt scroll speed to entry count: more entries → slightly faster
  const scrollSpeed = entries.length >= 12 ? 22 : 18;

  const [scrollY, setScrollY] = useState(0);
  const scrollRef = useRef(0);
  const rafRef = useRef<number>(0);

  useEffect(() => {
    if (!active || maxScroll <= 0) return;
    scrollRef.current = 0;
    setScrollY(0);

    const DELAY_MS = 2200;
    const startTime = Date.now();
    let lastTime: number | null = null;

    const tick = (now: number) => {
      const elapsed = Date.now() - startTime;
      if (elapsed < DELAY_MS) {
        rafRef.current = requestAnimationFrame(tick);
        return;
      }
      if (lastTime === null) lastTime = now;
      const dt = Math.min(now - lastTime, 100);
      lastTime = now;
      scrollRef.current = Math.min(scrollRef.current + (scrollSpeed * dt / 1000), maxScroll);
      setScrollY(scrollRef.current);
      if (scrollRef.current < maxScroll) {
        rafRef.current = requestAnimationFrame(tick);
      }
    };

    rafRef.current = requestAnimationFrame(tick);
    return () => cancelAnimationFrame(rafRef.current);
  }, [active, maxScroll, scrollSpeed]);

  return (
    <div
      className="rounded-2xl border border-white/10 bg-slate-900/60 backdrop-blur-sm overflow-hidden w-full"
      style={{ maxWidth: '100%' }}
    >
      <ClientRequestLedgerHeader isMobile={isMobile} />
      <div style={{
        position: 'relative',
        height: containerH,
        overflow: 'hidden',
      }}>
        {/* Top fade mask */}
        <div style={{
          position: 'absolute', top: 0, left: 0, right: 0, height: 20,
          background: 'linear-gradient(180deg, rgba(15,23,42,0.95) 0%, transparent 100%)',
          zIndex: 2, pointerEvents: 'none',
        }} />
        {/* Bottom fade mask */}
        <div style={{
          position: 'absolute', bottom: 0, left: 0, right: 0, height: 24,
          background: 'linear-gradient(0deg, rgba(15,23,42,0.95) 0%, transparent 100%)',
          zIndex: 2, pointerEvents: 'none',
        }} />

        {/* Scrolling list */}
        <div style={{
          transform: `translateY(-${scrollY}px)`,
          willChange: 'transform',
        }}>
          {entries.map((entry, i) => {
            const delay = Math.min(i * 75, 550);
            return (
              <ClientRequestLedgerRow
                key={i}
                entry={entry}
                isMobile={isMobile}
                outerStyle={{
                  opacity: active ? 1 : 0,
                  transform: active ? 'translateY(0)' : 'translateY(10px)',
                  transition: `opacity 0.55s cubic-bezier(0.22,1,0.36,1) ${delay}ms, transform 0.55s cubic-bezier(0.22,1,0.36,1) ${delay}ms`,
                }}
              />
            );
          })}
        </div>
      </div>
    </div>
  );
}

// ─── Main component ────────────────────────────────────────────────────────────
export default function RequestReplayPage() {
  useNoindex();
  const { agencySlug } = useParams<{ agencySlug: string }>();
  const [searchParams] = useSearchParams();
  const navigate = useNavigate();

  const slug = agencySlug || 'default';

  const token = searchParams.get('t') || searchParams.get('c') || undefined;
  const aidParam = searchParams.get('aid') || undefined;
  const stateHintParam = searchParams.get('stateSlug') || undefined;
  const { agency: canonical, loading: canonicalLoading, failed: canonicalFailed } = useCanonicalAgency(agencySlug, { token, agencyId: aidParam, stateHint: stateHintParam });

  const agencyName = canonical.agencyName || formatSlugAsName(slug);
  // Prefer canonical state, fall back to URL-trusted stateSlug param so CSV/smartlink
  // replay links never get stuck waiting for canonical.stateSlug to resolve.
  const stateSlug = canonical.stateSlug || stateHintParam || '';
  const stateName = canonical.stateName;

  const [scene, setScene] = useState<SceneId>(1);
  const [exiting, setExiting] = useState(false);
  const [entered, setEntered] = useState(false);
  const [s4Phase, setS4Phase] = useState<S4Phase>('contact');
  const [countDisplay, setCountDisplay] = useState(0);
  const anchorReady = !canonicalLoading;
  const countAnimRef = useRef<ReturnType<typeof setInterval> | null>(null);
  const autoCtaRef = useRef<ReturnType<typeof setInterval> | null>(null);
  const [ctaCountdown, setCtaCountdown] = useState(8);

  const replaySessionId = useRef(crypto.randomUUID());
  const visitorId = useRef<string>((() => {
    try {
      let id = localStorage.getItem('gappsy_visitor_id');
      if (!id) { id = crypto.randomUUID(); localStorage.setItem('gappsy_visitor_id', id); }
      return id;
    } catch { return crypto.randomUUID(); }
  })());
  const trackedScenes = useRef<Set<string>>(new Set());
  const completedRef = useRef(false);
  const ctaClickedRef = useRef(false);
  const autoStartedRef = useRef(false);
  const ctaSeenRef = useRef(false);
  const replayStartTimeRef = useRef(Date.now());
  const highestSceneIndexRef = useRef(1);
  const openedFiredRef = useRef(false);

  const anchorsRef = useRef<ReplayAnchors | null>(null);
  if (!anchorsRef.current || anchorsRef.current.slug !== slug) {
    anchorsRef.current = getOrCreateAnchors(slug);
  }
  const anchors = anchorsRef.current;

  // Coherent data layer: if canonical lacks KPI (e.g. token flow without server
  // KPI), fall back to bounded deterministic values so the ledger always renders
  // with sensible numbers. State-safety is preserved because stateSlug still
  // comes from the canonical resolve.
  const fallback = useMemo(() => buildDeterministicFallback(slug), [slug]);
  const missedCountRaw = canonical.missedCount > 0 ? canonical.missedCount : fallback.missedCount;
  const missedCount = normalizeDisplayedMissedCount(missedCountRaw);
  const resolvedAnchorMs = canonical.anchorMs > 0 ? canonical.anchorMs : fallback.anchorMs;
  // Stable generation anchor — use baseAnchorMs when available, fall back to display anchor
  const resolvedBaseAnchorMs = (canonical.baseAnchorMs > 0 ? canonical.baseAnchorMs : null) ?? resolvedAnchorMs;
  const resolvedBaseGeneratedCount = typeof canonical.baseGeneratedCount === "number" ? canonical.baseGeneratedCount : undefined;

  const ledgerEntries = useMemo(
    () =>
      buildInitialEntries({
        agencyId: canonical.agencyId,
        agencySlug: slug,
        stateSlug,
        missedCount,
        baseGeneratedCount: resolvedBaseGeneratedCount,
        anchorMs: resolvedBaseAnchorMs,
        overrideEntries: canonical.overrideEntries.length > 0 ? canonical.overrideEntries : undefined,
      }),
    // eslint-disable-next-line react-hooks/exhaustive-deps
    [canonical.agencyId, canonical.overrideEntries, slug, stateSlug, missedCount, resolvedBaseAnchorMs, resolvedBaseGeneratedCount],
  );

  const effectiveAnchors = useMemo(() => ({
    ...anchors,
    singleClientMs: resolvedAnchorMs > 0 ? resolvedAnchorMs : anchors.singleClientMs,
  }), [anchors, resolvedAnchorMs]);

  const d = useMemo(
    () => getDeterministicData(slug, stateSlug, effectiveAnchors),
    [slug, stateSlug, effectiveAnchors],
  );

  // ─── fireReplayEvent helper ─────────────────────────────────────────────────
  const fireReplayEvent = (
    event_type: string,
    extra: Record<string, unknown> = {},
  ) => {
    reliablePost(
      'replay-funnel-track',
      {
        event_type,
        replay_session_id: replaySessionId.current,
        agency_slug: slug,
        agency_name: agencyName,
        state_slug: stateSlug || null,
        state_name: stateName || null,
        visitor_id: visitorId.current,
        page_path: `/request-replay/${slug}`,
        referrer: (typeof document !== 'undefined' ? document.referrer : null) || null,
        timestamp: new Date().toISOString(),
        ...extra,
      },
      `replay:${event_type}`,
    );
  };

  // ─── replay_opened on mount ─────────────────────────────────────────────────
  useEffect(() => {
    if (openedFiredRef.current) return;
    openedFiredRef.current = true;
    fireReplayEvent('replay_opened');
    const handleAbandon = () => {
      if (completedRef.current) return;
      fireReplayEvent('replay_abandoned', {
        last_scene_seen: SCENE_NAMES[highestSceneIndexRef.current] ?? null,
        highest_scene_index_seen: highestSceneIndexRef.current,
        seconds_in_replay: Math.round((Date.now() - replayStartTimeRef.current) / 1000),
        cta_seen: ctaSeenRef.current,
        cta_clicked: ctaClickedRef.current,
        auto_continue_started: autoStartedRef.current,
        funnel_type: 'request_replay',
      });
    };
    window.addEventListener('pagehide', handleAbandon);
    window.addEventListener('beforeunload', handleAbandon);
    const handleVisibility = () => {
      if (document.visibilityState === 'hidden') handleAbandon();
    };
    document.addEventListener('visibilitychange', handleVisibility);
    return () => {
      window.removeEventListener('pagehide', handleAbandon);
      window.removeEventListener('beforeunload', handleAbandon);
      document.removeEventListener('visibilitychange', handleVisibility);
    };
  // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  // ─── replay_scene_view on each scene change ─────────────────────────────────
  useEffect(() => {
    const sceneName = SCENE_NAMES[scene];
    if (!sceneName) return;
    if (scene > highestSceneIndexRef.current) highestSceneIndexRef.current = scene;
    if (scene === 8) ctaSeenRef.current = true;
    if (trackedScenes.current.has(sceneName)) return;
    trackedScenes.current.add(sceneName);
    fireReplayEvent('replay_scene_view', {
      scene_index: scene,
      scene_name: sceneName,
    });
    // Fire record-ledger-view when the missed_clients_ledger scene is reached
    if (scene === 6 && canonical.agencyId) {
      const agencyId = canonical.agencyId;
      const stateSlugForView = canonical.stateSlug || stateSlug || '';
      const anchorForView = resolvedAnchorMs > 0 ? resolvedAnchorMs : undefined;
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
            agency_id: agencyId,
            state_slug: stateSlugForView,
            client_anchor_ms: anchorForView,
          }),
        },
      ).catch(() => {});
    }
  // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [scene]);

  // Count-up animation for scene 7 (ledger)
  useEffect(() => {
    if (scene !== 7 || !entered || missedCount <= 0) return;
    const total = missedCount;
    const duration = 1000;
    const start = Date.now();
    countAnimRef.current = setInterval(() => {
      const p = Math.min((Date.now() - start) / duration, 1);
      const eased = 1 - Math.pow(1 - p, 3);
      setCountDisplay(Math.round(eased * total));
      if (p >= 1 && countAnimRef.current) {
        clearInterval(countAnimRef.current);
        countAnimRef.current = null;
      }
    }, 16);
    return () => {
      if (countAnimRef.current) clearInterval(countAnimRef.current);
    };
  }, [scene, entered, missedCount]);

  // ─── Scene orchestration ────────────────────────────────────────────────────
  // Gated on anchorReady: no scene starts until the backend canonical anchor has
  // been received (or the 3-second safety timeout fires). This guarantees that
  // every device uses the same server-authoritative timing on the very first paint.
  useEffect(() => {
    if (!anchorReady) return;
    const timers: ReturnType<typeof setTimeout>[] = [];
    const push = (ms: number, fn: () => void) => timers.push(setTimeout(fn, ms));

    const goTo = (exitAt: number, next: SceneId, overlap = false): number => {
      if (!overlap) {
        push(exitAt, () => setExiting(true));
      }
      const enterAt = overlap ? exitAt : exitAt + TRANS_MS;
      push(enterAt, () => {
        setScene(next);
        if (!overlap) setExiting(false);
        setEntered(false);
        if (next !== 4) setS4Phase('contact');
      });
      push(enterAt + 25, () => setEntered(true));
      return enterAt + 25;
    };

    const H1 = 4400;
    const H2 = 4500;
    const H3 = 4500;
    const H4 = 5000;
    const H5 = 3500;
    const H7 = 11000;  // Scene B: missed-clients ledger
    // Scene C (scene 8): consequence + CTA — stays on screen

    push(25, () => setEntered(true));

    let t = goTo(H1, 2);
    t = goTo(t + H2, 3, true);
    t = goTo(t + H3, 4);
    const s4t = t;
    push(s4t + 1500, () => setS4Phase('failed'));
    t = goTo(t + H4, 5);
    t = goTo(t + H5, 7);
    goTo(t + H7, 8);

    return () => timers.forEach(clearTimeout);
  }, [anchorReady]);

  useEffect(() => {
    if (scene === 8) {
      setCtaCountdown(8);
      let count = 8;
      if (!autoStartedRef.current) {
        autoStartedRef.current = true;
        fireReplayEvent('replay_auto_continue_started', { countdown_seconds: 8 });
      }
      autoCtaRef.current = setInterval(() => {
        count -= 1;
        setCtaCountdown(count);
        if (count <= 0) {
          clearInterval(autoCtaRef.current!);
          autoCtaRef.current = null;
          fireReplayEvent('replay_auto_continue_completed');
          handleCta('auto');
        }
      }, 1000);
    }
    return () => {
      if (autoCtaRef.current) {
        clearInterval(autoCtaRef.current);
        autoCtaRef.current = null;
      }
    };
  // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [scene]);

  const handleCta = (click_type: 'manual' | 'auto' = 'manual') => {
    if (autoCtaRef.current) {
      clearInterval(autoCtaRef.current);
      autoCtaRef.current = null;
    }
    if (!ctaClickedRef.current) {
      ctaClickedRef.current = true;
      completedRef.current = true;
      const secondsInReplay = Math.round((Date.now() - replayStartTimeRef.current) / 1000);
      const lastSceneSeen = SCENE_NAMES[highestSceneIndexRef.current] ?? null;
      fireReplayEvent('replay_cta_click', {
        click_type,
        seconds_in_replay: secondsInReplay,
        cta_seen: true,
        cta_clicked: true,
        last_scene_seen: lastSceneSeen,
        highest_scene_index_seen: highestSceneIndexRef.current,
        auto_continue_started: autoStartedRef.current,
        funnel_type: 'request_replay',
      });
      fireReplayEvent('replay_completed', {
        click_type,
        seconds_in_replay: secondsInReplay,
        scenes_viewed: trackedScenes.current.size,
        highest_scene_index_seen: highestSceneIndexRef.current,
        last_scene_seen: lastSceneSeen,
        cta_seen: true,
        cta_clicked: true,
        auto_continue_started: autoStartedRef.current,
        funnel_type: 'request_replay',
      });
    }
    const baseUrl = buildActivationDirectLink({
      agencyId: canonical.agencyId,
      stateSlug,
      agencyName,
      stateName,
    });
    if (!baseUrl) {
      const fallbackParams = new URLSearchParams();
      if (canonical.agencyId) fallbackParams.set('aid', canonical.agencyId);
      if (agencyName) fallbackParams.set('agencyName', agencyName);
      if (stateSlug) fallbackParams.set('stateSlug', stateSlug);
      if (stateName) fallbackParams.set('stateName', stateName);
      const qs = fallbackParams.toString();
      navigate(`/activation/upgrade${qs ? `?${qs}` : ''}`);
      return;
    }
    const finalUrl = token ? `${baseUrl}&t=${encodeURIComponent(token)}` : baseUrl;
    console.log('ACTIVATION_DIRECT_LINK GENERATED:', finalUrl);
    navigate(finalUrl);
  };

  useEffect(() => {
    if (canonicalLoading || canonicalFailed) return;
    const canonicalSlug = canonical.agencySlug;
    const canonicalState = canonical.stateSlug;
    const canonicalAid = canonical.agencyId;
    const urlState = searchParams.get('stateSlug') || '';
    const urlAid = searchParams.get('aid') || '';
    const slugMismatch = !!canonicalSlug && canonicalSlug !== slug;
    const stateMissing = !!canonicalState && !urlState;
    const stateMismatch = !!canonicalState && !!urlState && urlState !== canonicalState;
    const aidMissing = !!canonicalAid && !urlAid;
    const aidMismatch = !!canonicalAid && !!urlAid && urlAid !== canonicalAid;
    if (!slugMismatch && !stateMissing && !stateMismatch && !aidMissing && !aidMismatch) return;
    const params = new URLSearchParams(searchParams.toString());
    if (canonicalState) params.set('stateSlug', canonicalState);
    if (canonicalAid) params.set('aid', canonicalAid);
    const targetSlug = canonicalSlug || slug;
    navigate(`/request-replay/${targetSlug}?${params.toString()}`, { replace: true });
  }, [canonicalLoading, canonicalFailed, canonical.agencySlug, canonical.stateSlug, canonical.agencyId, slug, navigate, searchParams]);

  // Render gate: only block while canonical resolution is actively in progress.
  // Once it finishes, render with whatever context is available — canonical first,
  // URL-fallback (slug/token/aid/stateSlug) second — instead of looping on a
  // missing canonical.stateSlug forever.
  const hasUrlContext = !!(agencySlug || token || aidParam || stateHintParam);
  if (canonicalLoading || (!canonicalFailed && !stateSlug && !hasUrlContext)) {
    return (
      <div style={{
        height: '100dvh', display: 'flex', flexDirection: 'column',
        alignItems: 'center', justifyContent: 'center',
        background: 'linear-gradient(160deg, #0f172a 0%, #0b1120 60%, #080d1a 100%)',
        color: 'white', textAlign: 'center', padding: '0 24px',
      }}>
        <div style={{
          width: 44, height: 44, borderRadius: '50%',
          border: '2px solid rgba(255,255,255,0.12)',
          borderTopColor: 'rgba(255,255,255,0.7)',
          animation: 'spin 0.9s linear infinite', marginBottom: 20,
        }} />
        <p style={{ fontSize: 15, color: 'rgba(255,255,255,0.6)', letterSpacing: '0.02em' }}>
          Loading replay context…
        </p>
        <style>{`@keyframes spin { to { transform: rotate(360deg); } }`}</style>
      </div>
    );
  }

  // Only render "Agency not available" when canonical resolution permanently failed
  // AND there is no usable URL context (slug / token / aid / stateSlug). For valid
  // CSV/smartlink links with any of these, prefer degraded rendering over a hard fail.
  if (canonicalFailed && !hasUrlContext) {
    return (
      <div style={{
        height: '100dvh', display: 'flex', flexDirection: 'column',
        alignItems: 'center', justifyContent: 'center',
        background: 'linear-gradient(160deg, #0f172a 0%, #0b1120 60%, #080d1a 100%)',
        color: 'white', textAlign: 'center', padding: '0 24px',
      }}>
        <p style={{ fontSize: 20, fontWeight: 600, marginBottom: 12 }}>Agency not available</p>
        <p style={{ fontSize: 15, color: 'rgba(255,255,255,0.55)', maxWidth: 400 }}>
          We could not find this agency in our directory.
          Please check the link or browse <a href="/" style={{ color: 'rgba(255,255,255,0.85)', textDecoration: 'underline' }}>Gappsy</a> for the latest availability.
        </p>
      </div>
    );
  }

  const pageBg = 'linear-gradient(160deg, #0f172a 0%, #0b1120 60%, #080d1a 100%)';
  const CONTENT = { width: '100%', maxWidth: 'min(640px, 88vw)' } as const;
  const CONTENT_WIDE = { width: '100%', maxWidth: 'min(680px, 90vw)' } as const;
  const CONTENT_LARGE = { width: '100%', maxWidth: 'min(720px, 90vw)' } as const;

  // Shared icon style for scene labels
  const LABEL_ICON: React.CSSProperties = { width: 14, height: 14, color: 'rgba(255,255,255,0.36)', flexShrink: 0 };

  return (
    <div style={{ height: '100dvh', overflow: 'hidden', background: pageBg, position: 'relative' }}>
      <AmbientBackground />

      {/* ════════════════════════════════════════════════════════════════
          SCENE 1 — HOOK
      ════════════════════════════════════════════════════════════════ */}
      {scene === 1 && (
        <SceneWrapper exiting={exiting} entered={entered}>
          <div style={{ width: '100%', maxWidth: 'min(900px, 94vw)', textAlign: 'center', padding: '0 clamp(20px, 5vw, 48px)', position: 'relative' }}>

            {/* "14 HOURS AGO" */}
            <FadeItem show={entered} delay={0}>
              <p style={{
                fontSize: 'clamp(18px, 2.2vw, 22px)',
                color: 'rgba(255,255,255,0.55)',
                fontWeight: 500,
                marginBottom: 'clamp(28px, 4vh, 40px)',
                letterSpacing: '0.28em',
                textTransform: 'uppercase',
              }}>
                {pluralHours(d.hoursAgo)}
              </p>
            </FadeItem>

            {/* "A client tried to contact you" */}
            <FadeItem show={entered} delay={160}>
              <p style={{
                fontSize: 'clamp(28px, 5.2vw, 40px)',
                color: 'rgba(255,255,255,0.78)',
                fontWeight: 500,
                marginBottom: 'clamp(10px, 1.4vh, 16px)',
                letterSpacing: '-0.02em',
                lineHeight: 1.28,
              }}>
                A client tried to contact you
              </p>
            </FadeItem>

            {/* "through your [Gappsy logo] listing" */}
            <FadeItem show={entered} delay={360}>
              <p style={{
                fontSize: 'clamp(28px, 5.2vw, 40px)',
                color: '#ffffff',
                fontWeight: 500,
                letterSpacing: '-0.02em',
                lineHeight: 1.28,
                textAlign: 'center',
                marginBottom: 'clamp(40px, 6vh, 60px)',
              }}>
                through your{' '}
                <span style={{
                  display: 'inline-block',
                  height: '1em',
                  overflow: 'visible',
                  verticalAlign: 'baseline',
                  margin: '0 0.14em',
                }}>
                  <img
                    src="/logos/gappsy-logo-white.webp"
                    alt="Gappsy"
                    style={{
                      height: '1.64em',
                      width: 'auto',
                      display: 'block',
                      position: 'relative',
                      top: '0.05em',
                    }}
                  />
                </span>
                {' '}listing
              </p>
            </FadeItem>

            {/* "MBNC Inc." — large hero agency name */}
            <FadeItem show={entered} delay={580}>
              <h1 style={{
                ...getAgencyNameStyle(agencyName, 'large'),
                fontWeight: 700,
                color: '#ffffff',
                marginBottom: 0,
                textShadow: '0 2px 48px rgba(0,0,0,0.40)',
                maxWidth: '100%',
                overflowWrap: 'break-word',
                textAlign: 'center',
              }}>
                {agencyName}
              </h1>
            </FadeItem>

          </div>
        </SceneWrapper>
      )}

      {/* ════════════════════════════════════════════════════════════════
          SCENE 2 — IDENTITY (also visible behind scene 3)
      ════════════════════════════════════════════════════════════════ */}
      {(scene === 2 || scene === 3) && (
        <div style={{
          position: 'fixed',
          inset: 0,
          display: 'flex',
          flexDirection: 'column',
          alignItems: 'center',
          justifyContent: 'center',
          overflow: 'hidden',
          opacity: scene === 3
            ? 0.1
            : (exiting ? 0 : entered ? 1 : 0),
          transform: scene === 3
            ? 'translateY(-12px) scale(0.965)'
            : (exiting ? 'translateY(-16px)' : entered ? 'translateY(0)' : 'translateY(20px)'),
          filter: scene === 3 ? 'blur(3px)' : 'blur(0px)',
          transition: scene === 3
            ? `opacity 0.35s ${EASE}, transform 0.35s ${EASE}, filter 0.35s ${EASE}`
            : `opacity ${TRANS_MS}ms ${EASE}, transform ${TRANS_MS}ms ${EASE}, filter 0.2s ease`,
        }}>

          {/* Map background */}
          <div style={{ position: 'absolute', inset: 0, pointerEvents: 'none' }} aria-hidden="true">
            <svg
              style={{
                position: 'absolute', inset: 0, width: '100%', height: '100%',
                opacity: entered ? 0.038 : 0,
                transition: `opacity 2.2s cubic-bezier(0.25,0.46,0.45,0.94) 200ms`,
              }}
              viewBox="0 0 1440 900"
              preserveAspectRatio="xMidYMid slice"
            >
              {[80, 175, 270, 365, 455, 545, 635, 720, 810].map(y => (
                <line key={`h${y}`} x1="0" y1={y} x2="1440" y2={y} stroke="#cbd5e1" strokeWidth="0.55" />
              ))}
              {[120, 250, 380, 510, 640, 770, 900, 1030, 1160, 1300].map(x => (
                <line key={`v${x}`} x1={x} y1="0" x2={x} y2="900" stroke="#cbd5e1" strokeWidth="0.55" />
              ))}
              <path d="M0,640 Q360,490 720,440 Q1080,390 1440,360" fill="none" stroke="#94a3b8" strokeWidth="1.1" />
              <path d="M0,280 Q300,360 580,310 Q860,260 1440,320" fill="none" stroke="#94a3b8" strokeWidth="0.85" />
              <path d="M280,0 Q420,180 380,420 Q340,660 460,900" fill="none" stroke="#94a3b8" strokeWidth="0.75" />
              <path d="M920,0 Q1020,220 980,480 Q940,740 1060,900" fill="none" stroke="#94a3b8" strokeWidth="0.65" />
            </svg>

            <svg
              style={{ position: 'absolute', inset: 0, width: '100%', height: '100%' }}
              viewBox="0 0 1440 900"
              preserveAspectRatio="xMidYMid slice"
            >
              <path
                d="M0,640 Q360,490 720,440 Q1080,390 1440,360"
                fill="none" stroke="#3b82f6" strokeWidth="1.6" strokeLinecap="round"
                style={{
                  opacity: 0.13,
                  strokeDasharray: 1800,
                  strokeDashoffset: entered ? 0 : 1800,
                  transition: `stroke-dashoffset 3s cubic-bezier(0.25, 0.46, 0.45, 0.94) 550ms`,
                }}
              />
              <circle cx="1440" cy="360" r="4" fill="#60a5fa"
                style={{ opacity: entered ? 0.55 : 0, transition: `opacity 0.6s ease 3100ms` }} />
              <circle cx="1440" cy="360" r="10" fill="none" stroke="#3b82f6" strokeWidth="1"
                style={{ opacity: entered ? 0.18 : 0, transition: `opacity 0.6s ease 3100ms` }} />
            </svg>

            <div style={{
              position: 'absolute', left: '50%', top: '52%',
              transform: 'translate(-50%, -50%)',
              width: 'min(700px, 90vw)', height: 'min(480px, 60vh)',
              background: 'radial-gradient(ellipse at center, rgba(37,99,235,0.055) 0%, rgba(37,99,235,0.02) 45%, transparent 72%)',
              opacity: entered ? 1 : 0,
              transition: `opacity 2.4s cubic-bezier(0.25,0.46,0.45,0.94) 400ms`,
            }} />

            <div style={{
              position: 'absolute', left: '50%', top: '52%',
              transform: `translate(calc(-50% - clamp(120px, 28vw, 260px)), -50%)`,
              opacity: entered ? 1 : 0,
              transition: `opacity 0.7s ease 1400ms`,
            }}>
              <div style={{ width: 36, height: 36, borderRadius: '50%', border: '1px solid rgba(59,130,246,0.18)', position: 'absolute', top: '50%', left: '50%', transform: 'translate(-50%, -50%)' }} />
              <div style={{ width: 20, height: 20, borderRadius: '50%', border: '1px solid rgba(59,130,246,0.28)', position: 'absolute', top: '50%', left: '50%', transform: 'translate(-50%, -50%)' }} />
              <div style={{ width: 6, height: 6, borderRadius: '50%', background: 'rgba(96,165,250,0.75)', boxShadow: '0 0 8px 3px rgba(59,130,246,0.30)', position: 'absolute', top: '50%', left: '50%', transform: 'translate(-50%, -50%)' }} />
            </div>
          </div>

          {scene === 2 && (
            <div style={{ ...CONTENT_LARGE, padding: '0 clamp(24px, 6vw, 64px)', position: 'relative' }}>

              <SceneLabel
                icon={<User style={LABEL_ICON} />}
                text="Client Information"
                entered={entered}
                mb="clamp(32px, 6vh, 56px)"
              />

              {d.location && <FadeItem show={entered} delay={120}>
                <div style={{ position: 'relative', paddingBottom: 'clamp(40px, 7vh, 68px)' }}>
                  <div style={{ display: 'flex', alignItems: 'center', gap: 'clamp(10px, 1.4vw, 16px)' }}>
                    <MapPin style={{
                      width: 'clamp(22px, 3.8vw, 34px)',
                      height: 'clamp(22px, 3.8vw, 34px)',
                      color: 'rgba(255,255,255,0.42)',
                      flexShrink: 0,
                      marginTop: '0.04em',
                    }} />
                    <p style={{
                      fontSize: 'clamp(40px, 9vw, 80px)',
                      fontWeight: 700,
                      color: '#ffffff',
                      letterSpacing: '-0.035em',
                      lineHeight: 1,
                      margin: 0,
                    }}>
                      {d.location}
                    </p>
                  </div>
                  <div style={{
                    position: 'absolute',
                    left: 'clamp(14px, 2vw, 20px)',
                    bottom: 'clamp(10px, 1.8vh, 18px)',
                    opacity: entered ? 1 : 0,
                    transition: `opacity 0.5s ease 480ms`,
                  }}>
                    <div style={{ width: 7, height: 7, borderRadius: '50%', background: 'rgba(96,165,250,0.80)', boxShadow: '0 0 10px 4px rgba(59,130,246,0.28)' }} />
                  </div>
                </div>
              </FadeItem>}

              <FadeItem show={entered} delay={280}>
                <div style={{ display: 'flex', alignItems: 'center', gap: 10, marginBottom: 'clamp(14px, 2vh, 20px)' }}>
                  <Globe style={{ width: 15, height: 15, color: 'rgba(255,255,255,0.35)', flexShrink: 0 }} />
                  <p style={{
                    fontSize: 'clamp(17px, 2vw, 22px)',
                    color: 'rgba(255,255,255,0.68)',
                    fontFamily: 'ui-monospace, monospace',
                    fontWeight: 500,
                    letterSpacing: '0.04em',
                    margin: 0,
                  }}>
                    {d.maskedIp}
                  </p>
                </div>
              </FadeItem>

              <FadeItem show={entered} delay={400}>
                <div style={{ display: 'flex', alignItems: 'center', gap: 10 }}>
                  <Monitor style={{ width: 15, height: 15, color: 'rgba(255,255,255,0.32)', flexShrink: 0 }} />
                  <p style={{
                    fontSize: 'clamp(17px, 2vw, 22px)',
                    color: 'rgba(255,255,255,0.65)',
                    fontWeight: 500,
                    letterSpacing: '-0.005em',
                    margin: 0,
                  }}>
                    {d.device} · {d.browser}
                  </p>
                </div>
              </FadeItem>
            </div>
          )}
        </div>
      )}

      {/* ════════════════════════════════════════════════════════════════
          SCENE 3 — INTENT (overlays dimmed scene 2)
      ════════════════════════════════════════════════════════════════ */}
      {scene === 3 && (
        <SceneWrapper exiting={exiting} entered={entered}>
          <div style={{
            position: 'absolute', inset: 0,
            background: 'rgba(8, 13, 26, 0.88)',
            pointerEvents: 'none',
            opacity: entered ? 1 : 0,
            transition: `opacity 0.4s ${EASE}`,
          }} />

          <div style={{ ...CONTENT_LARGE, padding: '0 clamp(24px, 6vw, 64px)', position: 'relative' }}>

            <SceneLabel
              icon={<Briefcase style={LABEL_ICON} />}
              text="Service Needed"
              entered={entered}
              mb="clamp(28px, 5.5vh, 50px)"
            />

            <ValueReveal show={entered} delay={100}>
              <p style={{
                fontSize: 'clamp(32px, 7.5vw, 66px)',
                fontWeight: 700,
                color: '#ffffff',
                letterSpacing: '-0.03em',
                lineHeight: 1.08,
                marginBottom: 'clamp(40px, 7.5vh, 68px)',
              }}>
                {d.service}
              </p>
            </ValueReveal>

            <div style={{
              display: 'flex', alignItems: 'center', gap: 8,
              marginBottom: 'clamp(9px, 1.3vh, 12px)',
              opacity: entered ? 1 : 0,
              transform: entered ? 'translateY(0)' : 'translateY(10px)',
              transition: `opacity 0.55s ${EASE} 260ms, transform 0.55s ${EASE} 260ms`,
            }}>
              <DollarSign style={LABEL_ICON} />
              <p style={{
                fontSize: 'clamp(13px, 1.35vw, 15px)',
                color: 'rgba(255,255,255,0.50)',
                textTransform: 'uppercase',
                fontWeight: 600,
                letterSpacing: '0.14em',
                margin: 0,
              }}>
                Budget
              </p>
            </div>

            <ValueReveal show={entered} delay={320}>
              <p style={{
                fontSize: 'clamp(24px, 4.2vw, 38px)',
                fontWeight: 600,
                color: 'rgba(255,255,255,0.92)',
                letterSpacing: '-0.02em',
                marginBottom: 'clamp(30px, 5.2vh, 46px)',
              }}>
                {d.budget}
              </p>
            </ValueReveal>

            <div style={{
              display: 'flex', alignItems: 'center', gap: 8,
              marginBottom: 'clamp(9px, 1.3vh, 12px)',
              opacity: entered ? 1 : 0,
              transform: entered ? 'translateY(0)' : 'translateY(10px)',
              transition: `opacity 0.55s ${EASE} 430ms, transform 0.55s ${EASE} 430ms`,
            }}>
              <Clock style={LABEL_ICON} />
              <p style={{
                fontSize: 'clamp(13px, 1.35vw, 15px)',
                color: 'rgba(255,255,255,0.50)',
                textTransform: 'uppercase',
                fontWeight: 600,
                letterSpacing: '0.14em',
                margin: 0,
              }}>
                Timeline
              </p>
            </div>

            <ValueReveal show={entered} delay={490}>
              <p style={{
                fontSize: 'clamp(21px, 3.5vw, 32px)',
                color: 'rgba(255,255,255,0.80)',
                fontWeight: 500,
                letterSpacing: '-0.01em',
              }}>
                {d.timeline}
              </p>
            </ValueReveal>
          </div>
        </SceneWrapper>
      )}

      {/* ════════════════════════════════════════════════════════════════
          SCENE 4 — CONTACT ATTEMPT
      ════════════════════════════════════════════════════════════════ */}
      {scene === 4 && (
        <SceneWrapper exiting={exiting} entered={entered}>
          <div style={{ ...CONTENT, padding: '0 clamp(24px, 6vw, 60px)', textAlign: 'center', position: 'relative' }}>

            <div style={{
              opacity: entered ? (s4Phase === 'failed' ? 0.55 : 1) : 0,
              transform: entered
                ? s4Phase === 'failed' ? 'translateY(-6px) scale(0.84)' : 'translateY(0) scale(1)'
                : 'translateY(20px) scale(0.97)',
              transition: s4Phase === 'failed'
                ? `opacity 0.75s ${EASE} 0ms, transform 0.75s ${EASE} 0ms`
                : `opacity 0.55s ${EASE} 0ms, transform 0.55s ${EASE} 0ms`,
              marginBottom: s4Phase === 'failed' ? 'clamp(24px, 4vh, 38px)' : '0px',
              willChange: 'opacity, transform',
            }}>
              <h2 style={{
                ...getAgencyNameStyle(agencyName, 'medium'),
                fontWeight: 700,
                color: '#ffffff',
                maxWidth: '100%',
                overflowWrap: 'break-word',
                textAlign: 'center',
              }}>
                {agencyName}
              </h2>
            </div>

            <div style={{
              opacity: s4Phase === 'failed' ? 1 : 0,
              transform: s4Phase === 'failed' ? 'translateY(0)' : 'translateY(22px)',
              transition: `opacity 0.52s ${EASE} 0ms, transform 0.52s ${EASE} 0ms`,
              marginBottom: 'clamp(12px, 2vh, 18px)',
              pointerEvents: 'none',
            }}>
              <p style={{
                fontSize: 'clamp(19px, 3.6vw, 32px)',
                fontWeight: 400,
                color: 'rgba(255,255,255,0.90)',
                letterSpacing: '-0.02em',
                lineHeight: 1.3,
              }}>
                You didn't receive this client request
              </p>
            </div>

            <div style={{
              opacity: s4Phase === 'failed' ? 1 : 0,
              transform: s4Phase === 'failed' ? 'translateY(0) scale(1)' : 'translateY(26px) scale(0.975)',
              transition: `opacity 0.60s ${EASE} 220ms, transform 0.60s ${EASE} 220ms`,
              pointerEvents: 'none',
            }}>
              <p style={{
                fontSize: 'clamp(21px, 4.2vw, 38px)',
                fontWeight: 700,
                color: '#f87171',
                letterSpacing: '-0.025em',
                lineHeight: 1.2,
                marginBottom: 'clamp(18px, 2.8vh, 26px)',
                textShadow: '0 0 28px rgba(248,113,113,0.25)',
              }}>
                because your listing is not activated
              </p>
              <div style={{
                width: s4Phase === 'failed' ? 'clamp(44px, 6vw, 60px)' : '0px',
                height: '1px',
                background: 'linear-gradient(90deg, transparent, rgba(248,113,113,0.45), transparent)',
                margin: '0 auto',
                transition: `width 0.60s ${EASE} 0.92s`,
              }} />
            </div>
          </div>
        </SceneWrapper>
      )}

      {/* ════════════════════════════════════════════════════════════════
          SCENE 5 — REDIRECT
      ════════════════════════════════════════════════════════════════ */}
      {scene === 5 && (
        <SceneWrapper exiting={exiting} entered={entered}>
          <div style={{ width: '100%', padding: '0 clamp(20px, 4vw, 48px)', textAlign: 'center', position: 'relative' }}>

            <div style={{
              opacity: entered ? 1 : 0,
              transform: entered ? 'translateY(0)' : 'translateY(14px)',
              transition: `opacity 0.50s ${EASE} 0ms, transform 0.50s ${EASE} 0ms`,
              marginBottom: 'clamp(24px, 4vh, 40px)',
            }}>
              <p style={{
                fontSize: 'clamp(18px, 2.4vw, 28px)',
                color: 'rgba(255,255,255,0.68)',
                fontWeight: 500,
                letterSpacing: '-0.015em',
                lineHeight: 1.4,
                margin: 0,
              }}>
                Instead, it was routed to
              </p>
            </div>

            <div style={{
              opacity: entered ? 1 : 0,
              transform: entered ? 'translateY(0) scale(1)' : 'translateY(18px) scale(0.965)',
              filter: entered ? 'blur(0px)' : 'blur(5px)',
              transition: `opacity 0.62s ${EASE} 180ms, transform 0.62s ${EASE} 180ms, filter 0.62s ${EASE} 180ms`,
              willChange: 'opacity, transform, filter',
              marginBottom: 'clamp(16px, 2.5vh, 28px)',
            }}>
              <h2 style={{
                fontSize: 'clamp(56px, 10vw, 96px)',
                fontWeight: 700,
                color: '#34d399',
                letterSpacing: '-0.045em',
                lineHeight: 1.0,
                textShadow: '0 0 64px rgba(52,211,153,0.25)',
                margin: 0,
              }}>
                {redirectedAgencyName}
              </h2>
            </div>

            <FadeItem show={entered} delay={460}>
              <p style={{
                fontSize: 'clamp(16px, 1.9vw, 22px)',
                color: 'rgba(255,255,255,0.52)',
                fontWeight: 400,
                marginBottom: 'clamp(32px, 5.5vh, 52px)',
                letterSpacing: '-0.005em',
                margin: '0 0 clamp(32px, 5.5vh, 52px)',
              }}>
                another {stateName || 'state'} agency
              </p>
            </FadeItem>

            <FadeItem show={entered} delay={610}>
              <div style={{ display: 'inline-flex', alignItems: 'center', gap: 10 }}>
                <CheckCircle2 style={{ width: 20, height: 20, color: '#6ee7b7', flexShrink: 0 }} />
                <span style={{
                  fontSize: 'clamp(16px, 1.9vw, 22px)',
                  color: '#6ee7b7',
                  fontWeight: 500,
                  letterSpacing: '-0.01em',
                }}>
                  Lead received — request fulfilled
                </span>
              </div>
            </FadeItem>
          </div>
        </SceneWrapper>
      )}


      {/* ════════════════════════════════════════════════════════════════
          SCENE 7 — MISSED-CLIENTS LEDGER (Scene B)
      ════════════════════════════════════════════════════════════════ */}
      {scene === 7 && (
        <SceneWrapper exiting={exiting} entered={entered}>
          <div style={{
            ...CONTENT_WIDE,
            padding: '0 clamp(20px, 5vw, 48px)',
            display: 'flex',
            flexDirection: 'column',
          }}>

            {/* Unified one-sentence headline with count-up */}
            <div style={{
              opacity: entered ? 1 : 0,
              transform: entered ? 'translateY(0) scale(1)' : 'translateY(16px) scale(0.97)',
              filter: entered ? 'blur(0px)' : 'blur(4px)',
              transition: `opacity 0.68s ${EASE} 40ms, transform 0.68s ${EASE} 40ms, filter 0.68s ${EASE} 40ms`,
              marginBottom: 'clamp(16px, 2.4vh, 22px)',
            }}>
              <h2 style={{
                fontSize: 'clamp(26px, 5.2vw, 46px)',
                fontWeight: 700,
                color: '#ffffff',
                letterSpacing: '-0.035em',
                lineHeight: 1.18,
              }}>
                You missed{' '}
                <span style={{ color: '#f87171', fontVariantNumeric: 'tabular-nums' }}>
                  {countDisplay}
                </span>
                {' '}clients like this{' '}
                <span style={{ color: 'rgba(248,113,113,0.75)', fontWeight: 600 }}>
                  in the last 30 days
                </span>
              </h2>
            </div>

            {/* Ledger area */}
            <div style={{
              opacity: entered ? 1 : 0,
              transform: entered ? 'translateY(0)' : 'translateY(20px)',
              transition: `opacity 0.70s ${EASE} 260ms, transform 0.70s ${EASE} 260ms`,
            }}>
              <MissedLedger entries={ledgerEntries} active={entered} />
            </div>

            {/* Inline CTA — directly below the request table */}
            <FadeItem show={entered} delay={720} style={{ marginTop: 'clamp(12px, 1.8vh, 18px)', position: 'relative', zIndex: 50 }}>
              <div style={{
                width: '100%',
                maxWidth: 420,
                margin: '0 auto',
                display: 'flex',
                flexDirection: 'column',
                alignItems: 'center',
                gap: 6,
                position: 'relative',
                zIndex: 50,
                pointerEvents: 'auto',
              }}>
                <button
                  type="button"
                  onClick={() => handleCta('manual')}
                  style={{
                    width: '100%',
                    display: 'flex',
                    alignItems: 'center',
                    justifyContent: 'center',
                    gap: 8,
                    padding: 'clamp(12px, 1.8vh, 16px) 24px',
                    fontSize: 'clamp(14px, 1.45vw, 15px)',
                    fontWeight: 600,
                    color: '#ffffff',
                    borderRadius: 12,
                    border: 'none',
                    cursor: 'pointer',
                    position: 'relative',
                    zIndex: 50,
                    pointerEvents: 'auto',
                    touchAction: 'manipulation',
                    WebkitTapHighlightColor: 'transparent',
                    background: 'linear-gradient(135deg, #2563eb, #1d4ed8)',
                    boxShadow: '0 4px 20px rgba(37,99,235,0.30), inset 0 1px 0 rgba(255,255,255,0.08)',
                    transition: 'background 0.18s ease, box-shadow 0.18s ease, transform 0.2s ease',
                    letterSpacing: '-0.01em',
                  }}
                  onMouseEnter={(e) => {
                    e.currentTarget.style.background = 'linear-gradient(135deg, #1d4ed8, #1e40af)';
                    e.currentTarget.style.boxShadow = '0 6px 26px rgba(37,99,235,0.42), inset 0 1px 0 rgba(255,255,255,0.1)';
                  }}
                  onMouseLeave={(e) => {
                    e.currentTarget.style.background = 'linear-gradient(135deg, #2563eb, #1d4ed8)';
                    e.currentTarget.style.boxShadow = '0 4px 20px rgba(37,99,235,0.30), inset 0 1px 0 rgba(255,255,255,0.08)';
                  }}
                >
                  Activate your listing now
                  <ArrowRight style={{ width: 16, height: 16 }} />
                </button>
                <span style={{
                  fontSize: 'clamp(11px, 1vw, 12px)',
                  color: 'rgba(255,255,255,0.45)',
                  fontWeight: 400,
                  letterSpacing: '-0.005em',
                }}>
                  Start receiving client requests
                </span>
              </div>
            </FadeItem>

            {/* Live indicator */}
            <FadeItem show={entered} delay={880} style={{ marginTop: 'clamp(8px, 1.2vh, 12px)' }}>
              <div style={{ display: 'flex', alignItems: 'center', gap: 8 }}>
                <div style={{
                  width: 6, height: 6, borderRadius: '50%',
                  background: '#f87171',
                  boxShadow: '0 0 8px 3px rgba(248,113,113,0.28)',
                  flexShrink: 0,
                }} />
                <span style={{
                  fontSize: 'clamp(13px, 1.2vw, 14px)',
                  color: 'rgba(255,255,255,0.42)',
                  fontWeight: 400,
                  letterSpacing: '-0.005em',
                }}>
                  New clients are arriving right now
                </span>
              </div>
            </FadeItem>

          </div>
        </SceneWrapper>
      )}

      {/* ════════════════════════════════════════════════════════════════
          SCENE 8 — FINAL CONSEQUENCE + CTA (Scene C)
      ════════════════════════════════════════════════════════════════ */}
      {scene === 8 && (
        <SceneWrapper exiting={exiting} entered={entered}>
          <style>{S8_STYLE}</style>
          <div style={{
            ...CONTENT,
            display: 'flex',
            flexDirection: 'column',
            alignItems: 'center',
            justifyContent: 'center',
            padding: '0 clamp(20px, 6vw, 64px)',
            textAlign: 'center',
            position: 'relative',
          }}>

            {/* Ambient red glow */}
            <div style={{
              position: 'absolute', left: '50%', top: '50%',
              transform: 'translate(-50%, -50%)',
              width: 'min(560px, 94vw)', height: 'min(380px, 62vh)',
              background: 'radial-gradient(ellipse at center, rgba(239,68,68,0.048) 0%, transparent 68%)',
              pointerEvents: 'none',
              opacity: entered ? 1 : 0,
              transition: `opacity 1.8s ease 200ms`,
            }} />

            {/* Single centered content column — all elements share one axis */}
            <div style={{
              maxWidth: 'min(720px, 90vw)',
              width: '100%',
              display: 'flex',
              flexDirection: 'column',
              alignItems: 'center',
              textAlign: 'center',
            }}>

              {/* Main headline */}
              <div style={{
                opacity: entered ? 1 : 0,
                transform: entered ? 'translateY(0) scale(1)' : 'translateY(24px) scale(0.97)',
                filter: entered ? 'blur(0px)' : 'blur(5px)',
                transition: `opacity 0.72s ${EASE} 80ms, transform 0.72s ${EASE} 80ms, filter 0.72s ${EASE} 80ms`,
                marginBottom: 'clamp(16px, 2.4vh, 24px)',
              }}>
                <h2 className="s8-headline" style={{
                  fontWeight: 700,
                  color: '#ffffff',
                  letterSpacing: '-0.035em',
                  margin: 0,
                }}>
                  You lost these clients already.
                </h2>
              </div>

              {/* Supporting lines */}
              <FadeItem show={entered} delay={460} style={{ marginBottom: 'clamp(6px, 1vh, 10px)' }}>
                <p className="s8-subline" style={{
                  fontWeight: 400,
                  color: 'rgba(255,255,255,0.70)',
                  letterSpacing: '-0.015em',
                  margin: 0,
                }}>
                  And you'll keep losing more.
                </p>
              </FadeItem>

              <FadeItem show={entered} delay={640} style={{ marginBottom: 'clamp(24px, 3.6vh, 32px)' }}>
                <p className="s8-subline" style={{
                  fontWeight: 500,
                  color: 'rgba(248,113,113,0.90)',
                  letterSpacing: '-0.015em',
                  margin: 0,
                }}>
                  Until your listing is activated.
                </p>
              </FadeItem>

              {/* CTA button */}
              <div style={{
                opacity: entered ? 1 : 0,
                transform: entered ? 'scale(1)' : 'scale(0.96)',
                transition: `opacity 0.72s ${EASE} 860ms, transform 0.72s ${EASE} 860ms`,
                marginBottom: 'clamp(8px, 1.2vh, 12px)',
                position: 'relative',
                zIndex: 50,
                pointerEvents: entered ? 'auto' : 'none',
              }}>
                <button
                  type="button"
                  onClick={() => handleCta('manual')}
                  style={{
                    display: 'flex',
                    alignItems: 'center',
                    justifyContent: 'center',
                    gap: 8,
                    padding: 'clamp(16px, 2.4vh, 20px) 24px',
                    fontSize: 'clamp(15px, 1.55vw, 16px)',
                    fontWeight: 600,
                    color: '#ffffff',
                    borderRadius: 12,
                    border: 'none',
                    cursor: 'pointer',
                    touchAction: 'manipulation',
                    WebkitTapHighlightColor: 'transparent',
                    position: 'relative',
                    zIndex: 50,
                    pointerEvents: 'auto',
                    background: 'linear-gradient(135deg, #2563eb, #1d4ed8)',
                    boxShadow: '0 4px 24px rgba(37,99,235,0.32), inset 0 1px 0 rgba(255,255,255,0.08)',
                    transition: 'background 0.18s ease, box-shadow 0.18s ease, transform 0.2s ease',
                    letterSpacing: '-0.01em',
                    transform: 'translateY(0)',
                  }}
                  onMouseEnter={e => {
                    const el = e.currentTarget as HTMLButtonElement;
                    el.style.background = 'linear-gradient(135deg, #3b82f6, #2563eb)';
                    el.style.boxShadow = '0 8px 32px rgba(37,99,235,0.46), inset 0 1px 0 rgba(255,255,255,0.12)';
                    el.style.transform = 'translateY(-1px)';
                  }}
                  onMouseLeave={e => {
                    const el = e.currentTarget as HTMLButtonElement;
                    el.style.background = 'linear-gradient(135deg, #2563eb, #1d4ed8)';
                    el.style.boxShadow = '0 4px 24px rgba(37,99,235,0.32), inset 0 1px 0 rgba(255,255,255,0.08)';
                    el.style.transform = 'translateY(0)';
                  }}
                >
                  Activate your listing now
                  <ArrowRight style={{ width: 16, height: 16 }} />
                </button>
              </div>

              <p style={{
                textAlign: 'center',
                fontSize: 'clamp(12px, 1.05vw, 13px)',
                color: 'rgba(255,255,255,0.40)',
                margin: 0,
                marginTop: 'clamp(10px, 1.4vh, 14px)',
                opacity: entered ? 1 : 0,
                transition: `opacity 0.6s ease 1100ms`,
              }}>
                Auto-clicking in {ctaCountdown} seconds&hellip; or click to continue now.
              </p>

            </div>

          </div>
        </SceneWrapper>
      )}
    </div>
  );
}
