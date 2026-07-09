import { useState, useEffect, useCallback } from 'react';
import { Plus, RefreshCw, AlertTriangle, CheckCircle2, Clock, Shield, Info } from 'lucide-react';
import { CITIES_BY_STATE, STATE_ABBREVS } from '../../utils/canonicalReplayData';

const SUPABASE_URL = import.meta.env.VITE_SUPABASE_URL as string;
const SUPABASE_ANON_KEY = import.meta.env.VITE_SUPABASE_ANON_KEY as string;

const SERVICES = [
  'Web Design', 'SEO', 'Local SEO', 'Google Ads', 'Social Media Marketing',
  'Branding', 'Website Redesign', 'Lead Generation', 'Marketing Strategy',
  'Content Marketing', 'Email Marketing', 'PPC', 'Brand Strategy', 'CRO',
];

const BUDGETS = [
  '$1.5k–$3k/mo', '$2k–$5k/mo', '$3k–$7.5k/mo', '$5k–$10k project',
  '$7.5k–$10k/mo', 'Budget discussed', '$1k–$2.5k/mo', '$10k+/mo',
];

const TIMELINES = [
  'ASAP', 'This month', 'Next 30 days', '2–4 weeks', 'Q2 planning', 'Flexible',
];

const DEVICES = [
  'Mobile · iPhone', 'Mobile · Android', 'Desktop · Chrome',
  'Desktop · Safari', 'Tablet · iPad',
];

const IP_PREFIXES = ['73.162', '104.28', '172.58', '96.84', '184.22', '67.185', '108.90', '50.232', '71.56', '76.103', '174.207', '47.200'];

function rInt(min: number, max: number): number {
  return min + Math.floor(Math.random() * (max - min + 1));
}

function generateMaskedIp(): string {
  const prefix = IP_PREFIXES[rInt(0, IP_PREFIXES.length - 1)];
  const oct3 = rInt(10, 254);
  const oct4 = rInt(10, 99);
  return `${prefix}.${String(oct3).slice(0, 2)}x.${String(oct4).slice(0, 1)}x`;
}

function generateUniqueMaskedIp(existingIps: Set<string>): string {
  let ip = generateMaskedIp();
  let attempts = 0;
  while (existingIps.has(ip) && attempts < 20) {
    ip = generateMaskedIp();
    attempts++;
  }
  // Safe fallback: use a clearly different prefix with fresh random octets
  if (existingIps.has(ip)) {
    const fallbackPrefixes = IP_PREFIXES.filter((p) => !Array.from(existingIps).some((e) => e.startsWith(p)));
    const fallback = fallbackPrefixes.length > 0 ? fallbackPrefixes[0] : '174.207';
    ip = `${fallback}.${rInt(10, 99)}x.${rInt(1, 9)}x`;
  }
  return ip;
}

function pickCity(stateSlug: string): string {
  const cities = CITIES_BY_STATE[stateSlug];
  const abbr = STATE_ABBREVS[stateSlug] ?? stateSlug.toUpperCase().slice(0, 2);
  if (cities && cities.length > 0) {
    return `${cities[rInt(0, cities.length - 1)]}, ${abbr}`;
  }
  return stateSlug ? `${stateSlug.split('-').map(w => w[0].toUpperCase() + w.slice(1)).join(' ')}` : 'Local lead';
}

function generateDefaults(
  stateSlug: string,
  existingIps: Set<string>,
  currentLatest?: CanonicalContextEntry | null,
): FormFields {
  let service = SERVICES[rInt(0, SERVICES.length - 1)];
  let budget = BUDGETS[rInt(0, BUDGETS.length - 1)];
  const timeline = TIMELINES[rInt(0, TIMELINES.length - 1)];
  let location = pickCity(stateSlug);
  let device = DEVICES[rInt(0, DEVICES.length - 1)];
  const maskedIp = generateUniqueMaskedIp(existingIps);

  // Avoid matching latest override on all key fields simultaneously
  if (currentLatest) {
    let attempts = 0;
    while (
      attempts < 8 &&
      service === currentLatest.service &&
      budget === currentLatest.budget &&
      location === currentLatest.location &&
      device === currentLatest.device
    ) {
      service = SERVICES[rInt(0, SERVICES.length - 1)];
      budget = BUDGETS[rInt(0, BUDGETS.length - 1)];
      location = pickCity(stateSlug);
      device = DEVICES[rInt(0, DEVICES.length - 1)];
      attempts++;
    }
  }

  return { service, budget, timeline, location, device, maskedIp, hoursAgo: '3' };
}

interface FormFields {
  service: string;
  budget: string;
  timeline: string;
  location: string;
  device: string;
  maskedIp: string;
  hoursAgo: string;
}

interface CanonicalContextEntry {
  service: string | null;
  budget: string | null;
  location: string | null;
  device: string | null;
  masked_ip: string | null;
  request_at: string;
}

interface CanonicalContext {
  canonical_anchor_ms: number | null;
  base_generated_anchor_ms: number | null;
  generated_most_recent_ms: number | null;
  latest_override_ms: number | null;
  missed_requests_last_30_days: number | null;
  base_generated_count: number | null;
  override_count_last_30_days: number | null;
  latest_override: CanonicalContextEntry | null;
  all_overrides: CanonicalContextEntry[];
  /** Full set of masked IPs from the visible last-30-days ledger (deterministic + overrides) */
  existing_ledger_masked_ips: string[];
  last_seen: {
    viewed_at: string;
    most_recent_request_at_seen: string;
  } | null;
  safe_hours_ago_max: number | null;
}

function formatTimeAgo(isoOrMs: string | number): string {
  const ms = typeof isoOrMs === 'number' ? isoOrMs : new Date(isoOrMs).getTime();
  const diff = Date.now() - ms;
  if (diff < 0) return 'just now';
  const h = Math.floor(diff / 3600000);
  const m = Math.floor((diff % 3600000) / 60000);
  if (h === 0) return `${m}m ago`;
  if (h < 48) {
    if (m === 0) return `${h}h ago`;
    return `${h}h ${m}m ago`;
  }
  const days = Math.max(2, Math.round(h / 24));
  return `${days} days ago`;
}

interface Props {
  agencyId: string;
  stateSlug: string;
  adminSecret: string;
}

function buildExistingIps(ctx: CanonicalContext | null): Set<string> {
  const ips = new Set<string>();
  if (!ctx) return ips;
  // Primary source: full ledger IPs from server (deterministic + overrides, last 30d)
  (ctx.existing_ledger_masked_ips ?? []).forEach((ip) => { if (ip) ips.add(ip); });
  // Belt-and-suspenders: also include any override IPs in case server field is absent
  (ctx.all_overrides ?? []).forEach((o) => { if (o.masked_ip) ips.add(o.masked_ip); });
  if (ctx.latest_override?.masked_ip) ips.add(ctx.latest_override.masked_ip);
  return ips;
}

export default function AddNewRequestPanel({ agencyId, stateSlug, adminSecret }: Props) {
  const [context, setContext] = useState<CanonicalContext | null>(null);
  const [contextLoading, setContextLoading] = useState(true);
  const [form, setForm] = useState<FormFields>(() => generateDefaults(stateSlug, new Set(), null));
  const [submitting, setSubmitting] = useState(false);
  const [successMsg, setSuccessMsg] = useState<string | null>(null);
  const [errorMsg, setErrorMsg] = useState<string | null>(null);
  // 60s tick so "3h ago" can become "4h ago" without a manual refresh
  const [, setTickMs] = useState(() => Date.now());
  useEffect(() => {
    const id = setInterval(() => setTickMs(Date.now()), 60_000);
    return () => clearInterval(id);
  }, []);

  const loadContext = useCallback(async () => {
    setContextLoading(true);
    try {
      const res = await fetch(
        `${SUPABASE_URL}/functions/v1/admin-get-canonical-context?agency_id=${agencyId}&state_slug=${encodeURIComponent(stateSlug)}`,
        {
          headers: {
            Authorization: `Bearer ${adminSecret}`,
            apikey: SUPABASE_ANON_KEY,
          },
        },
      );
      const data = await res.json();
      if (data.ok) {
        const ctx: CanonicalContext = {
          ...data,
          all_overrides: Array.isArray(data.all_overrides) ? data.all_overrides : [],
          existing_ledger_masked_ips: Array.isArray(data.existing_ledger_masked_ips) ? data.existing_ledger_masked_ips : [],
        };
        setContext(ctx);
        // Only refine IP uniqueness — don't overwrite other fields the user may have changed
        setForm((prev) => {
          const existingIps = buildExistingIps(ctx);
          if (!existingIps.has(prev.maskedIp)) return prev;
          return { ...prev, maskedIp: generateUniqueMaskedIp(existingIps) };
        });
      }
    } catch {
      // silently fail — panel still works without context
    } finally {
      setContextLoading(false);
    }
  }, [agencyId, stateSlug, adminSecret]);

  // Reset form defaults when stateSlug changes (new agency searched)
  useEffect(() => {
    setForm(generateDefaults(stateSlug, new Set(), null));
  }, [stateSlug]);

  useEffect(() => {
    void loadContext();
  }, [loadContext]);

  const regenerate = useCallback(() => {
    // Build full exclusion set: ledger IPs + current form IP
    const existingIps = buildExistingIps(context);
    if (form.maskedIp) existingIps.add(form.maskedIp);
    const defaults = generateDefaults(stateSlug, existingIps, context?.latest_override ?? null);
    setForm((prev) => ({ ...defaults, hoursAgo: prev.hoursAgo }));
  }, [context, stateSlug, form.maskedIp]);

  const hoursAgoNum = parseFloat(form.hoursAgo) || 0;
  const safeMax = context?.safe_hours_ago_max ?? null;
  const isTooOld = safeMax !== null && hoursAgoNum > safeMax;

  const handleSubmit = async () => {
    if (isTooOld) return;
    setSubmitting(true);
    setErrorMsg(null);
    setSuccessMsg(null);
    try {
      const res = await fetch(`${SUPABASE_URL}/functions/v1/admin-add-canonical-request`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          Authorization: `Bearer ${adminSecret}`,
          apikey: SUPABASE_ANON_KEY,
        },
        body: JSON.stringify({
          agency_id: agencyId,
          state_slug: stateSlug,
          service: form.service,
          budget: form.budget,
          timeline: form.timeline,
          location: form.location,
          masked_ip: form.maskedIp,
          device: form.device,
          hours_ago: hoursAgoNum,
          created_by: 'admin-lookup',
        }),
      });
      const data = await res.json();
      if (data.ok) {
        setSuccessMsg(
          `Request added ${hoursAgoNum === 0 ? 'just now' : `${hoursAgoNum}h ago`} and is now the current most recent request.`,
        );
        await loadContext();
      } else if (res.status === 409) {
        setErrorMsg(data.error ?? 'Blocked: timeline conflict.');
      } else {
        setErrorMsg(data.error ?? 'Failed to add request.');
      }
    } catch {
      setErrorMsg('Network error. Please try again.');
    } finally {
      setSubmitting(false);
    }
  };

  const field = (label: string, children: React.ReactNode) => (
    <div className="flex flex-col gap-1">
      <label className="text-[10px] font-semibold text-slate-500 uppercase tracking-wider">{label}</label>
      {children}
    </div>
  );

  const inputCls = 'w-full rounded-lg border border-slate-200 bg-white px-2.5 py-1.5 text-[12px] text-slate-800 focus:outline-none focus:ring-1 focus:ring-blue-400';
  const selectCls = inputCls;

  return (
    <div className="p-4 space-y-4">

      {/* ── Current state info ────────────────────────────────────────────── */}
      {contextLoading ? (
        <div className="h-8 bg-slate-100 rounded animate-pulse" />
      ) : context ? (
        <div className="grid grid-cols-1 gap-2">
          {/* Current most recent request */}
          {context.canonical_anchor_ms ? (
            (() => {
              const isOverrideCurrent =
                context.latest_override_ms !== null &&
                context.generated_most_recent_ms !== null &&
                context.latest_override_ms >= context.generated_most_recent_ms;
              return (
                <>
                  <div className="rounded-xl bg-slate-50 border border-slate-200 p-3 space-y-1">
                    <div className="text-[10px] font-semibold text-slate-400 uppercase tracking-wider flex items-center gap-1.5">
                      <Clock className="w-3 h-3" /> Current most recent request
                    </div>
                    <div className="grid grid-cols-2 gap-x-4 gap-y-0.5 text-[11px] text-slate-700">
                      {isOverrideCurrent && context.latest_override ? (
                        <>
                          <span className="text-slate-500">Source</span><span className="font-medium text-blue-700">Admin override</span>
                          <span className="text-slate-500">Service</span><span>{context.latest_override.service ?? '—'}</span>
                          <span className="text-slate-500">Budget</span><span>{context.latest_override.budget ?? '—'}</span>
                          <span className="text-slate-500">Location</span><span>{context.latest_override.location ?? '—'}</span>
                          <span className="text-slate-500">Device</span><span>{context.latest_override.device ?? '—'}</span>
                          <span className="text-slate-500">IP</span><span>{context.latest_override.masked_ip ?? '—'}</span>
                          <span className="text-slate-500">When</span><span>{formatTimeAgo(context.latest_override.request_at)}</span>
                          <span className="text-slate-500">Requests (30d)</span><span>{context.missed_requests_last_30_days ?? 0}</span>
                        </>
                      ) : (
                        <>
                          <span className="text-slate-500">Source</span><span className="font-medium text-slate-700">Generated anchor</span>
                          <span className="text-slate-500">When</span><span>{context.generated_most_recent_ms ? formatTimeAgo(context.generated_most_recent_ms) : formatTimeAgo(context.canonical_anchor_ms)}</span>
                          <span className="text-slate-500">Requests (30d)</span><span>{context.missed_requests_last_30_days ?? 0}</span>
                          {context.base_generated_count !== null && (
                            <>
                              <span className="text-slate-500">Generated</span><span>{context.base_generated_count}</span>
                            </>
                          )}
                          {context.override_count_last_30_days !== null && context.override_count_last_30_days > 0 && (
                            <>
                              <span className="text-slate-500">Overrides (30d)</span><span>{context.override_count_last_30_days}</span>
                            </>
                          )}
                        </>
                      )}
                    </div>
                  </div>

                  {!isOverrideCurrent && context.latest_override && (
                    <div className="rounded-xl bg-white border border-slate-200 p-3 space-y-1">
                      <div className="text-[10px] font-semibold text-slate-400 uppercase tracking-wider flex items-center gap-1.5">
                        <Info className="w-3 h-3" /> Latest admin override (older than generated anchor)
                      </div>
                      <div className="grid grid-cols-2 gap-x-4 gap-y-0.5 text-[11px] text-slate-700">
                        <span className="text-slate-500">Service</span><span>{context.latest_override.service ?? '—'}</span>
                        <span className="text-slate-500">Budget</span><span>{context.latest_override.budget ?? '—'}</span>
                        <span className="text-slate-500">Location</span><span>{context.latest_override.location ?? '—'}</span>
                        <span className="text-slate-500">IP</span><span>{context.latest_override.masked_ip ?? '—'}</span>
                        <span className="text-slate-500">When</span><span>{formatTimeAgo(context.latest_override.request_at)}</span>
                      </div>
                    </div>
                  )}
                </>
              );
            })()
          ) : (
            <div className="rounded-xl bg-amber-50 border border-amber-200 p-2.5 text-[11px] text-amber-700 flex items-center gap-1.5">
              <Info className="w-3 h-3 shrink-0" /> No canonical anchor yet for this agency/state.
            </div>
          )}

          {/* Last seen + safe range */}
          <div className="rounded-xl bg-slate-50 border border-slate-200 p-3 space-y-1">
            <div className="text-[10px] font-semibold text-slate-400 uppercase tracking-wider flex items-center gap-1.5">
              <Shield className="w-3 h-3" /> Safety guard
            </div>
            <div className="grid grid-cols-2 gap-x-4 gap-y-0.5 text-[11px] text-slate-700">
              {context.last_seen ? (
                <>
                  <span className="text-slate-500">Last viewed</span>
                  <span>{formatTimeAgo(context.last_seen.viewed_at)}</span>
                  <span className="text-slate-500">Saw up to</span>
                  <span>{formatTimeAgo(context.last_seen.most_recent_request_at_seen)}</span>
                  <span className="text-slate-500">Safe range</span>
                  <span className="font-semibold text-emerald-700">
                    0 – {safeMax !== null ? `${safeMax}h` : '∞'} ago
                  </span>
                </>
              ) : (
                <>
                  <span className="text-slate-500">Last viewed</span>
                  <span className="text-slate-400 italic">No view recorded</span>
                  <span className="text-slate-500">Safe range</span>
                  <span className="font-semibold text-emerald-700">No restriction</span>
                </>
              )}
            </div>
          </div>
        </div>
      ) : null}

      {/* ── Form ─────────────────────────────────────────────────────────── */}
      <div className="space-y-3 border-t border-slate-100 pt-3">
        <div className="flex items-center justify-between">
          <span className="text-[11px] font-semibold text-slate-600">New request details</span>
          <button
            type="button"
            onClick={regenerate}
            className="flex items-center gap-1 text-[10px] text-blue-600 hover:text-blue-700 font-medium"
          >
            <RefreshCw className="w-3 h-3" /> Regenerate
          </button>
        </div>

        <div className="grid grid-cols-2 gap-2">
          {field('Service',
            <select className={selectCls} value={form.service} onChange={(e) => setForm((p) => ({ ...p, service: e.target.value }))}>
              {SERVICES.map((s) => <option key={s}>{s}</option>)}
            </select>
          )}
          {field('Budget',
            <select className={selectCls} value={form.budget} onChange={(e) => setForm((p) => ({ ...p, budget: e.target.value }))}>
              {BUDGETS.map((b) => <option key={b}>{b}</option>)}
            </select>
          )}
          {field('Timeline',
            <select className={selectCls} value={form.timeline} onChange={(e) => setForm((p) => ({ ...p, timeline: e.target.value }))}>
              {TIMELINES.map((t) => <option key={t}>{t}</option>)}
            </select>
          )}
          {field('Device',
            <select className={selectCls} value={form.device} onChange={(e) => setForm((p) => ({ ...p, device: e.target.value }))}>
              {DEVICES.map((d) => <option key={d}>{d}</option>)}
            </select>
          )}
        </div>

        {field('City / Location',
          <input className={inputCls} value={form.location} onChange={(e) => setForm((p) => ({ ...p, location: e.target.value }))} placeholder="e.g. Brooklyn, NY" />
        )}

        {field('Masked IP',
          <input className={inputCls} value={form.maskedIp} onChange={(e) => setForm((p) => ({ ...p, maskedIp: e.target.value }))} placeholder="e.g. 73.162.4x.xx" />
        )}

        {field(
          `Hours ago${safeMax !== null ? ` (safe: 0–${safeMax}h)` : ''}`,
          <input
            className={`${inputCls} ${isTooOld ? 'border-rose-400 ring-1 ring-rose-300' : ''}`}
            type="number"
            step="0.1"
            min="0"
            value={form.hoursAgo}
            onChange={(e) => setForm((p) => ({ ...p, hoursAgo: e.target.value }))}
          />
        )}

        {/* Safety warning */}
        {isTooOld && (
          <div className="rounded-xl bg-rose-50 border border-rose-200 p-2.5 text-[11px] text-rose-700 flex items-start gap-1.5">
            <AlertTriangle className="w-3.5 h-3.5 shrink-0 mt-0.5" />
            <span>This request is older than the most recent request the agency already saw. Adding it could break timeline consistency.</span>
          </div>
        )}

        {/* Success / error */}
        {successMsg && (
          <div className="rounded-xl bg-emerald-50 border border-emerald-200 p-2.5 text-[11px] text-emerald-700 flex items-start gap-1.5">
            <CheckCircle2 className="w-3.5 h-3.5 shrink-0 mt-0.5" />
            <span>{successMsg}</span>
          </div>
        )}
        {errorMsg && (
          <div className="rounded-xl bg-rose-50 border border-rose-200 p-2.5 text-[11px] text-rose-700 flex items-start gap-1.5">
            <AlertTriangle className="w-3.5 h-3.5 shrink-0 mt-0.5" />
            <span>{errorMsg}</span>
          </div>
        )}

        <button
          type="button"
          onClick={handleSubmit}
          disabled={submitting || isTooOld || !form.service}
          className="w-full flex items-center justify-center gap-1.5 rounded-xl bg-blue-600 hover:bg-blue-700 disabled:opacity-50 disabled:cursor-not-allowed text-white text-[12px] font-semibold py-2 transition-colors"
        >
          {submitting ? (
            <><RefreshCw className="w-3.5 h-3.5 animate-spin" /> Adding…</>
          ) : (
            <><Plus className="w-3.5 h-3.5" /> Add request</>
          )}
        </button>
      </div>
    </div>
  );
}
