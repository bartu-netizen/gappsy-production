import { useEffect, useState, useCallback } from "react";
import {
  X, Clock, MapPin, Tag, CreditCard, Zap, Globe, ExternalLink,
  CheckCircle2, AlertCircle, ChevronRight, Layers, MousePointer,
  DollarSign, RefreshCw, ArrowRight, Timer, Activity,
} from "lucide-react";
import { formatStateName } from "../../utils/formatLocation";
import { getEventMeta, GROUP_DOT, GROUP_TONE } from "../../utils/adminEventLabels";

const SUPABASE_URL     = import.meta.env.VITE_SUPABASE_URL as string;
const SUPABASE_ANON_KEY = import.meta.env.VITE_SUPABASE_ANON_KEY as string;

// ─── types ────────────────────────────────────────────────────────────────────

interface FunnelEvent {
  id:           string;
  created_at:   string;
  event_name:   string;
  event_stage:  string | null;
  page_path:    string | null;
  referrer:     string | null;
  metadata:     Record<string, unknown> | null;
  ms_from_prev: number | null;
  s_from_prev:  number | null;
}

interface StripeOrder {
  id:                  string;
  checkout_session_id: string | null;
  payment_intent_id:   string | null;
  amount_total:        number | null;
  payment_status:      string | null;
  status:              string | null;
  product_summary:     string | null;
  top25_rank:          number | null;
  customer_email:      string | null;
  paid_at:             string | null;
  created_at:          string;
  subscription_id:     string | null;
  agency_name:         string | null;
  state_slug:          string | null;
}

interface SessionData {
  id:                  string;
  created_at:          string;
  funnel_type:         string | null;
  funnel_name:         string | null;
  stage:               string | null;
  agency_name:         string | null;
  agency_slug:         string | null;
  agency_id:           string | null;
  state_slug:          string | null;
  step_number:         number | null;
  entry_path:          string | null;
  purchased_product:   string | null;
  purchased_amount:    number | null;
  upsell_taken:        boolean | null;
  payment_status:      string | null;
  payment_source:      string | null;
  checkout_session_id: string | null;
  last_event_name:     string | null;
  last_event_at:       string | null;
  lead_email:          string | null;
  visitor_id:          string | null;
  source_label:        string;
}

interface SessionDetail {
  session:           SessionData;
  events:            FunnelEvent[];
  stripe_order:      StripeOrder | null;
  total_duration_ms: number | null;
  event_count:       number;
}

interface Props {
  sessionId: string;
  onClose:   () => void;
}

// ─── helpers ──────────────────────────────────────────────────────────────────

function fmtTs(iso: string): string {
  return new Date(iso).toLocaleString("en-US", {
    month: "short", day: "numeric", hour: "numeric",
    minute: "2-digit", second: "2-digit",
  });
}

function timeAgo(iso: string | null): string {
  if (!iso) return "—";
  const ms = Date.now() - new Date(iso).getTime();
  const s  = Math.floor(ms / 1000);
  if (s < 60)   return `${s}s ago`;
  const m = Math.floor(s / 60);
  if (m < 60)   return `${m} min ago`;
  const h = Math.floor(m / 60);
  if (h < 24)   return `${h}h ago`;
  const d = Math.floor(h / 24);
  if (d === 1)  return "yesterday";
  if (d < 7)    return `${d}d ago`;
  return fmtTs(iso);
}

function fmtDuration(ms: number | null): string {
  if (ms === null || ms < 0) return "—";
  const s = Math.floor(ms / 1000);
  if (s < 60) return `${s}s`;
  const m = Math.floor(s / 60);
  if (m < 60) return `${m}m ${s % 60}s`;
  return `${Math.floor(m / 60)}h ${m % 60}m`;
}

function fmtDelta(s: number | null): string {
  if (s === null || s === 0) return "";
  if (s < 60) return `+${s}s`;
  const m = Math.floor(s / 60);
  return `+${m}m ${s % 60}s`;
}

const STEP_MAP: Record<number, string> = {
  0:   "—",
  10:  "Landing Viewed",
  20:  "Search Submitted",
  25:  "Profile Clicked",
  30:  "Agency Profile Viewed",
  40:  "Start Receiving CTA",
  50:  "State Page (Owner Preview)",
  60:  "Scroll to Listing",
  70:  "Check Availability Opened",
  80:  "Check Availability Modal",
  90:  "Check Availability Submitted",
  100: "Check Availability Result",
  110: "Missed Clients CTA",
  120: "Missed Clients Page",
  130: "Activate Listing CTA",
  140: "Offer Page Viewed",
  150: "Checkout Page Viewed",
  160: "Checkout Completed",
};

function stepLabel(n: number | null): string {
  if (n === null) return "No step";
  return STEP_MAP[n] || `Step ${n}`;
}

function stepBadge(n: number | null, stage: string | null) {
  if (stage === "paid" || n === 160) return "bg-emerald-100 text-emerald-800 border-emerald-200";
  if (n && n >= 150)  return "bg-blue-100 text-blue-800 border-blue-200";
  if (n && n >= 130)  return "bg-amber-100 text-amber-800 border-amber-200";
  if (n && n >= 80)   return "bg-sky-100 text-sky-800 border-sky-200";
  if (n && n >= 30)   return "bg-slate-100 text-slate-700 border-slate-200";
  return "bg-gray-50 text-gray-500 border-gray-200";
}

// ─── sub-components ───────────────────────────────────────────────────────────

function InfoRow({ label, value, mono }: { label: string; value: React.ReactNode; mono?: boolean }) {
  return (
    <div className="flex items-start justify-between gap-3 py-1.5">
      <span className="text-xs text-slate-400 shrink-0 w-32">{label}</span>
      <span className={`text-xs text-right break-all ${mono ? "font-mono" : "font-medium text-slate-700"}`}>
        {value ?? "—"}
      </span>
    </div>
  );
}

function Section({ title, children }: { title: string; children: React.ReactNode }) {
  return (
    <div className="mb-5">
      <p className="text-[10px] font-bold text-slate-400 uppercase tracking-widest mb-2 px-4">{title}</p>
      <div className="bg-white border border-slate-100 rounded-lg mx-4 divide-y divide-slate-50 px-3">
        {children}
      </div>
    </div>
  );
}

// ─── main component ───────────────────────────────────────────────────────────

export default function SessionDetailDrawer({ sessionId, onClose }: Props) {
  const [detail, setDetail]   = useState<SessionDetail | null>(null);
  const [loading, setLoading] = useState(true);
  const [error,   setError]   = useState<string | null>(null);
  const [expandMeta, setExpandMeta] = useState<string | null>(null);

  const apiBase = `${SUPABASE_URL}/functions/v1/agency-funnel-analytics`;
  const headers = { Authorization: `Bearer ${SUPABASE_ANON_KEY}` };

  const fetch_ = useCallback(async () => {
    setLoading(true);
    setError(null);
    try {
      const res  = await fetch(`${apiBase}?action=session_detail&session_id=${sessionId}`, { headers });
      const data = await res.json();
      if (data.error) throw new Error(data.error);
      setDetail(data);
    } catch (e) {
      setError((e as Error).message);
    } finally {
      setLoading(false);
    }
  }, [sessionId]);

  useEffect(() => { fetch_(); }, [fetch_]);

  useEffect(() => {
    const handler = (e: KeyboardEvent) => { if (e.key === "Escape") onClose(); };
    window.addEventListener("keydown", handler);
    return () => window.removeEventListener("keydown", handler);
  }, [onClose]);

  const s  = detail?.session;
  const isPaid = s?.stage === "paid" || s?.payment_status === "paid";

  return (
    <>
      <div
        className="fixed inset-0 bg-black/20 backdrop-blur-[2px] z-40"
        onClick={onClose}
      />
      <div className="fixed top-0 right-0 h-full w-full max-w-[520px] bg-slate-50 border-l border-slate-200 shadow-2xl z-50 flex flex-col">

        {/* Header */}
        <div className={`px-5 py-4 border-b flex items-start gap-3 shrink-0 ${
          isPaid ? "bg-emerald-50 border-emerald-200" : "bg-white border-slate-200"
        }`}>
          <div className="flex-1 min-w-0">
            <div className="flex items-center gap-2 flex-wrap">
              {isPaid && <CheckCircle2 className="w-4 h-4 text-emerald-600 shrink-0" />}
              <h2 className="text-sm font-bold text-slate-900 truncate">
                {s?.agency_name || s?.agency_slug || "Anonymous Session"}
              </h2>
              {s?.state_slug && (
                <span className="text-xs bg-slate-100 text-slate-500 px-1.5 py-0.5 rounded">
                  {formatStateName(s.state_slug)}
                </span>
              )}
            </div>
            <p className="text-xs text-slate-400 mt-0.5 font-mono truncate">
              {sessionId.slice(0, 8)}…{sessionId.slice(-6)}
            </p>
          </div>
          <button
            onClick={onClose}
            className="p-1.5 rounded-lg text-slate-400 hover:text-slate-600 hover:bg-slate-100 transition-colors shrink-0"
          >
            <X className="w-4 h-4" />
          </button>
        </div>

        {/* Body */}
        <div className="flex-1 overflow-y-auto py-4">
          {loading ? (
            <div className="flex items-center justify-center h-40 gap-2 text-slate-400 text-sm">
              <RefreshCw className="w-4 h-4 animate-spin" />
              Loading session…
            </div>
          ) : error ? (
            <div className="mx-4 mt-4 bg-red-50 border border-red-200 rounded-lg p-4 flex items-center gap-2 text-sm text-red-700">
              <AlertCircle className="w-4 h-4 shrink-0" />
              {error}
            </div>
          ) : s ? (
            <>
              {/* Paid conversion banner */}
              {isPaid && (
                <div className="mx-4 mb-4 bg-emerald-50 border border-emerald-200 rounded-lg px-4 py-3 flex items-center gap-3">
                  <DollarSign className="w-5 h-5 text-emerald-600 shrink-0" />
                  <div>
                    <div className="text-sm font-bold text-emerald-800">
                      {s.purchased_amount && s.purchased_amount > 0
                        ? `$${(s.purchased_amount / 100).toFixed(0)} paid`
                        : detail?.stripe_order?.amount_total
                          ? `$${((detail.stripe_order.amount_total) / 100).toFixed(0)} paid`
                          : "Paid conversion"}
                    </div>
                    {s.purchased_product && (
                      <div className="text-xs text-emerald-700">{s.purchased_product}</div>
                    )}
                    {s.upsell_taken && (
                      <div className="text-xs text-emerald-600 flex items-center gap-1 mt-0.5">
                        <Zap className="w-3 h-3" /> Upsell taken
                      </div>
                    )}
                  </div>
                  <div className="ml-auto text-xs text-emerald-600">
                    {s.payment_source === "webhook" ? (
                      <span className="flex items-center gap-1"><Zap className="w-3 h-3" />webhook</span>
                    ) : (
                      <span className="flex items-center gap-1"><Globe className="w-3 h-3" />client</span>
                    )}
                  </div>
                </div>
              )}

              {/* Status badges */}
              <div className="mx-4 mb-4 flex flex-wrap gap-2">
                <span className={`inline-flex items-center gap-1 px-2.5 py-1 rounded-full text-xs font-semibold border ${stepBadge(s.step_number, s.stage)}`}>
                  <Layers className="w-3 h-3" />
                  {stepLabel(s.step_number)}
                </span>
                {s.source_label && (
                  <span className="inline-flex items-center gap-1 px-2.5 py-1 rounded-full text-xs font-medium bg-slate-100 text-slate-600 border border-slate-200">
                    <MousePointer className="w-3 h-3" />
                    {s.source_label}
                  </span>
                )}
                {s.funnel_type && (
                  <span className="inline-flex items-center px-2.5 py-1 rounded-full text-xs font-medium bg-blue-50 text-blue-700 border border-blue-200">
                    {s.funnel_type}
                  </span>
                )}
              </div>

              {/* Session Metadata */}
              <Section title="Session Metadata">
                <InfoRow label="Session ID"    value={<span className="text-[10px] font-mono">{s.id.slice(0, 18)}…</span>} mono />
                <InfoRow label="First seen"    value={fmtTs(s.created_at)} />
                <InfoRow label="Last seen"     value={s.last_event_at ? fmtTs(s.last_event_at) : fmtTs(s.created_at)} />
                <InfoRow label="Time ago"      value={timeAgo(s.last_event_at || s.created_at)} />
                <InfoRow label="Total duration" value={fmtDuration(detail?.total_duration_ms ?? null)} />
                <InfoRow label="Event count"   value={detail?.event_count ?? 0} />
                {s.visitor_id && <InfoRow label="Visitor ID" value={<span className="text-[10px] font-mono">{s.visitor_id.slice(0, 16)}…</span>} mono />}
                {s.lead_email && <InfoRow label="Email" value={s.lead_email} />}
              </Section>

              {/* Journey / Drop-off */}
              <Section title="Funnel Journey">
                <InfoRow label="Entry source"   value={s.source_label} />
                <InfoRow label="Entry path"     value={s.entry_path || "—"} />
                <InfoRow label="Last step"      value={stepLabel(s.step_number)} />
                <InfoRow label="Last event"     value={s.last_event_name?.replace(/_/g, " ") || "—"} />
                <InfoRow label="Stage"          value={s.stage || "—"} />
                {s.stage !== "paid" && s.step_number !== null && s.step_number < 160 && (
                  <div className="py-2">
                    <div className={`flex items-center gap-2 text-xs ${s.step_number >= 150 ? "text-orange-600" : "text-amber-600"}`}>
                      <AlertCircle className="w-3.5 h-3.5 shrink-0" />
                      <span>
                        {s.step_number >= 150 ? "Abandoned at checkout: " : "Dropped off at: "}
                        <strong>{stepLabel(s.step_number)}</strong>
                      </span>
                    </div>
                  </div>
                )}
              </Section>

              {/* Commerce */}
              {(isPaid || s.checkout_session_id || detail?.stripe_order) && (
                <Section title="Commerce">
                  {s.purchased_product  && <InfoRow label="Product"        value={s.purchased_product} />}
                  {s.purchased_amount && s.purchased_amount > 0 && (
                    <InfoRow label="Amount" value={`$${(s.purchased_amount / 100).toFixed(2)}`} />
                  )}
                  <InfoRow label="Payment status"  value={s.payment_status || "—"} />
                  <InfoRow label="Payment source"  value={s.payment_source || "—"} />
                  {s.upsell_taken !== null && (
                    <InfoRow label="Upsell taken"  value={s.upsell_taken ? "Yes" : "No"} />
                  )}
                  {s.checkout_session_id && (
                    <InfoRow label="Checkout ID"   value={<span className="text-[10px] font-mono">{s.checkout_session_id.slice(0, 20)}…</span>} mono />
                  )}
                  {detail?.stripe_order && (
                    <>
                      <div className="py-1.5">
                        <span className="text-xs text-slate-400">Stripe Order</span>
                        <div className="mt-1 bg-emerald-50 rounded-md p-2 border border-emerald-100 space-y-1">
                          {detail.stripe_order.amount_total && (
                            <div className="text-xs font-semibold text-emerald-800">
                              ${(detail.stripe_order.amount_total / 100).toFixed(2)}
                            </div>
                          )}
                          {detail.stripe_order.product_summary && (
                            <div className="text-xs text-emerald-700">{detail.stripe_order.product_summary}</div>
                          )}
                          {detail.stripe_order.top25_rank && (
                            <div className="text-xs text-emerald-600">Rank #{detail.stripe_order.top25_rank}</div>
                          )}
                          {detail.stripe_order.subscription_id && (
                            <div className="text-xs text-emerald-600 flex items-center gap-1">
                              <RefreshCw className="w-3 h-3" /> Subscription
                            </div>
                          )}
                          {detail.stripe_order.customer_email && (
                            <div className="text-xs text-slate-500">{detail.stripe_order.customer_email}</div>
                          )}
                          {detail.stripe_order.paid_at && (
                            <div className="text-xs text-slate-400">{fmtTs(detail.stripe_order.paid_at)}</div>
                          )}
                        </div>
                      </div>
                    </>
                  )}
                </Section>
              )}

              {/* Event Timeline */}
              <div className="mb-5">
                <p className="text-[10px] font-bold text-slate-400 uppercase tracking-widest mb-3 px-4 flex items-center gap-2">
                  <Activity className="w-3 h-3" />
                  Event Timeline
                  {(detail?.events?.length ?? 0) > 0 && (
                    <span className="text-[10px] bg-slate-100 px-1.5 py-0.5 rounded text-slate-500 normal-case font-normal">
                      {detail.events.length} events
                    </span>
                  )}
                </p>

                {(!detail?.events || detail.events.length === 0) ? (
                  <p className="text-xs text-slate-400 px-5">No events recorded for this session.</p>
                ) : (
                  <div className="relative px-4">
                    <div className="absolute left-[27px] top-0 bottom-0 w-px bg-slate-100" />
                    <div className="space-y-0">
                      {detail.events.map((evt, idx) => {
                        const meta       = getEventMeta(evt.event_name);
                        const label      = meta.label;
                        const dotColor   = GROUP_DOT[meta.group];
                        const isLast     = idx === detail.events.length - 1;
                        const isPaidEvt  = meta.group === "conversion";
                        const hasMeta    = evt.metadata && Object.keys(evt.metadata).length > 0;

                        return (
                          <div key={evt.id} className={`relative flex gap-3 pb-3 ${isLast ? "pb-0" : ""}`}>
                            <div className="relative z-10 flex flex-col items-center mt-0.5">
                              <div className={`w-3.5 h-3.5 rounded-full border-2 border-white shadow-sm ${dotColor} shrink-0`} />
                            </div>
                            <div className={`flex-1 min-w-0 pb-1 rounded-lg px-2.5 py-2 ${
                              isPaidEvt ? "bg-emerald-50 border border-emerald-200" :
                              idx === detail.events.length - 1 ? "bg-white border border-slate-100" :
                              "bg-white border border-transparent hover:border-slate-100"
                            } transition-colors`}>
                              <div className="flex items-start gap-2 justify-between">
                                <div className="flex-1 min-w-0">
                                  <span className={`text-xs font-semibold leading-tight block ${
                                    isPaidEvt ? "text-emerald-800" : "text-slate-800"
                                  }`}>
                                    {label}
                                  </span>
                                  <span className="text-[10px] text-slate-400 font-mono block mt-0.5 truncate">
                                    {evt.event_name}
                                  </span>
                                </div>
                                <div className="text-right shrink-0 flex flex-col items-end gap-1">
                                  <span className={`text-[9px] px-1.5 py-0.5 rounded border font-semibold ${GROUP_TONE[meta.group]}`}>
                                    {meta.weight > 0 ? `+${meta.weight}` : meta.weight} {meta.group}
                                  </span>
                                  {evt.s_from_prev !== null && evt.s_from_prev > 0 && (
                                    <span className="text-[10px] text-slate-400 font-mono">
                                      {fmtDelta(evt.s_from_prev)}
                                    </span>
                                  )}
                                </div>
                              </div>
                              <div className="flex items-center gap-2 mt-0.5 flex-wrap">
                                <span className="text-[10px] text-slate-400">
                                  {new Date(evt.created_at).toLocaleTimeString("en-US", {
                                    hour: "numeric", minute: "2-digit", second: "2-digit",
                                  })}
                                </span>
                                {evt.page_path && (
                                  <span className="text-[10px] text-slate-400 font-mono truncate max-w-[160px]">
                                    {evt.page_path}
                                  </span>
                                )}
                              </div>
                              {hasMeta && (
                                <button
                                  onClick={() => setExpandMeta(expandMeta === evt.id ? null : evt.id)}
                                  className="mt-1 text-[10px] text-blue-500 hover:text-blue-700 flex items-center gap-0.5"
                                >
                                  <ChevronRight className={`w-3 h-3 transition-transform ${expandMeta === evt.id ? "rotate-90" : ""}`} />
                                  metadata
                                </button>
                              )}
                              {expandMeta === evt.id && hasMeta && (
                                <pre className="mt-1.5 text-[9px] font-mono bg-slate-50 rounded p-2 overflow-x-auto text-slate-600 leading-relaxed border border-slate-100">
                                  {JSON.stringify(evt.metadata, null, 2)}
                                </pre>
                              )}
                            </div>
                          </div>
                        );
                      })}
                    </div>
                  </div>
                )}
              </div>

              {/* Agency Links */}
              {(s.agency_slug || s.agency_id) && (
                <div className="mx-4 mb-4 flex flex-wrap gap-2">
                  {s.agency_slug && (
                    <a
                      href={`/your-agency/${s.agency_slug}`}
                      target="_blank"
                      rel="noopener noreferrer"
                      className="flex items-center gap-1.5 px-3 py-1.5 text-xs bg-white border border-slate-200 rounded-lg text-slate-600 hover:bg-slate-50 transition-colors"
                    >
                      <ExternalLink className="w-3 h-3" />
                      View Agency Page
                    </a>
                  )}
                  {s.agency_slug && s.funnel_type === "request_replay" && (
                    <a
                      href={`/request-replay/${s.agency_slug}${s.state_slug ? `?stateSlug=${s.state_slug}&stateName=${encodeURIComponent(formatStateName(s.state_slug))}&agencyName=${encodeURIComponent(s.agency_name || "")}` : ""}`}
                      target="_blank"
                      rel="noopener noreferrer"
                      className="flex items-center gap-1.5 px-3 py-1.5 text-xs bg-orange-50 border border-orange-200 rounded-lg text-orange-700 hover:bg-orange-100 transition-colors"
                    >
                      <Timer className="w-3 h-3" />
                      View Replay
                    </a>
                  )}
                  {s.state_slug && s.agency_slug && s.funnel_type !== "request_replay" && (
                    <a
                      href={`/marketing-agencies-in-${s.state_slug}#owner=1&agency=${s.agency_id || ""}&section=other`}
                      target="_blank"
                      rel="noopener noreferrer"
                      className="flex items-center gap-1.5 px-3 py-1.5 text-xs bg-white border border-slate-200 rounded-lg text-slate-600 hover:bg-slate-50 transition-colors"
                    >
                      <ArrowRight className="w-3 h-3" />
                      Owner Preview
                    </a>
                  )}
                </div>
              )}
            </>
          ) : null}
        </div>

        {/* Footer */}
        <div className="shrink-0 px-5 py-3 border-t border-slate-200 bg-white flex items-center justify-between">
          <span className="text-[10px] text-slate-400 font-mono">
            {sessionId.slice(0, 12)}…
          </span>
          <button
            onClick={onClose}
            className="px-3 py-1.5 text-xs text-slate-600 hover:text-slate-900 bg-slate-100 hover:bg-slate-200 rounded-lg transition-colors"
          >
            Close
          </button>
        </div>
      </div>
    </>
  );
}
