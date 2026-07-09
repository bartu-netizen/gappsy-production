import { useState, useRef, useCallback, useEffect, Component, type ReactNode } from 'react';
import { useSearchParams } from 'react-router-dom';

class SafeSection extends Component<
  { name: string; children: ReactNode },
  { hasError: boolean; error?: Error }
> {
  state = { hasError: false, error: undefined as Error | undefined };
  static getDerivedStateFromError(error: Error) {
    return { hasError: true, error };
  }
  componentDidCatch(error: Error, info: unknown) {
    console.error(`[SafeSection:${this.props.name}] crashed:`, error, info);
  }
  render() {
    if (this.state.hasError) {
      return (
        <div className="bg-amber-50 border border-amber-200 rounded-2xl px-5 py-4 text-sm text-amber-700">
          This section could not be loaded ({this.props.name}).
        </div>
      );
    }
    return this.props.children;
  }
}
import {
  UserSearch, Search, Copy, Check, ExternalLink, Globe, Mail, MapPin,
  Star, Building2, AlertCircle, Loader2, MessageSquare, RefreshCw,
  ChevronRight, ChevronDown, Shield, Clock, Zap, Link2, Type, Pin, PinOff, Layers,
  CreditCard, TrendingUp, PackageCheck, AlertTriangle, BadgeDollarSign,
  EyeOff, Activity, PlusCircle,
} from 'lucide-react';
import WpAdminLayout from '../components/wpadmin/WpAdminLayout';
import DiscountLinkPanel from '../components/admin/DiscountLinkPanel';
import ActiveDiscountLinksPanel from '../components/admin/ActiveDiscountLinksPanel';
import DiscountFunnelActivityPanel from '../components/admin/DiscountFunnelActivityPanel';
import DiscountTierPushPanel from '../components/admin/DiscountTierPushPanel';
import AgencyFunnelIntelligence from '../components/admin/AgencyFunnelIntelligence';
import AddNewRequestPanel from '../components/admin/AddNewRequestPanel';
import UpgradeOfferPanel from '../components/admin/UpgradeOfferPanel';
import { SmartRoutingPanel } from '../components/admin/SmartRoutingPanel';
import { useAdminSession } from '../contexts/AdminSessionContext';
import { supabase } from '../lib/supabase';
import {
  ManageHistorySection, IntentSection, ProfileClicksSection, BasicInfoDossierSection,
} from '../components/admin/ManageDossierSections';
import type {
  ManageFunnelContext, ManageFunnelEvent, IntentScoring, ProfileClicks,
} from '../components/admin/ManageDossierSections';

const SUPABASE_URL = import.meta.env.VITE_SUPABASE_URL as string;
const SUPABASE_ANON_KEY = import.meta.env.VITE_SUPABASE_ANON_KEY as string;
const REQUEST_TIMEOUT_MS = 10_000;

interface LinkedEmail {
  id: string;
  email_raw: string;
  email_normalized: string;
  validation_status: string;
  is_primary: boolean;
  outreach_status: string;
}

interface AgencyListing {
  state_slug: string;
  section: 'top25' | 'other';
  rank: number | null;
  page_path: string;
}

interface AgencyMatch {
  agency_id: string;
  agency_name: string;
  agency_slug: string | null;
  agency_domain: string | null;
  website_url: string | null;
  state_slug: string;
  match_confidence: 'exact' | 'normalized' | 'domain_match';
  matched_email: string;
  matched_email_id: string | null;
  is_primary: boolean;
}

interface TimingInfo {
  total_ms: number;
  exact_ms?: number;
  domain_ms?: number;
  parallel_ms?: number;
}

interface CommercialStatus {
  is_paid_listing: boolean;
  paid_listing_type: string | null;
  standard_listing_active: boolean;
  standard_listing_states: string[];
  has_any_paid_product: boolean;
  products: string[];
  paid_source_reason: string;
  stripe_backed: boolean;
  manual_override_active: boolean;
  manual_override_value: boolean | null;
  manual_override_reason: string | null;
  last_paid_event_at: string | null;
  stripe_orders: {
    paid_at: string | null;
    state_slug: string | null;
    source_listing_type: string | null;
    product_summary: string | null;
    amount_total: number | null;
    currency: string | null;
  }[];
}

interface LookupResult {
  ok: boolean;
  found: boolean;
  agency: {
    id: string;
    name: string;
    slug: string | null;
    domain: string | null;
    website_url: string | null;
    state_slug?: string | null;
    is_active?: boolean;
    created_at?: string | null;
    listing_management_status?: string | null;
  } | null;
  your_agency_url: string | null;
  csv_links?: {
    your_agency_url: string | null;
    smart_next_url: string | null;
    manage_listing_url_v2: string | null;
    request_replay_url_v2: string | null;
    request_compare_url: string | null;
    activation_direct_link: string | null;
    activation_discount_link_15: string | null;
    activation_discount_link_20: string | null;
    activation_discount_link_25: string | null;
  } | null;
  match_info: {
    searched_email: string;
    matched_email: string;
    lead_key: string;
    match_type: 'exact' | 'normalized' | 'domain_match' | 'id_lookup';
    matched_email_id: string | null;
  } | null;
  linked_emails: LinkedEmail[];
  listings: AgencyListing[];
  alternative_matches: AgencyMatch[];
  commercial_status?: CommercialStatus;
  manage_funnel_context?: ManageFunnelContext;
  manage_funnel_events_timeline?: ManageFunnelEvent[];
  intent_scoring?: IntentScoring;
  profile_clicks?: ProfileClicks;
  _timing?: TimingInfo;
}

function slugToStateName(slug: string): string {
  return slug
    .split('-')
    .map((w) => w.charAt(0).toUpperCase() + w.slice(1))
    .join(' ');
}

const GENERIC_EMAIL_DOMAINS = new Set(['gmail.com', 'yahoo.com', 'outlook.com', 'hotmail.com']);

function extractDomainFromEmail(email: string | null | undefined): string | null {
  if (!email) return null;
  const parts = email.split('@');
  if (parts.length < 2) return null;
  const domain = parts[1].toLowerCase().trim();
  if (GENERIC_EMAIL_DOMAINS.has(domain)) return null;
  return domain;
}

// ─── controlled variation system ─────────────────────────────────────────────

const REPLY_VARIANTS = {
  intro: [
    "Thanks for getting back to me.",
    "Appreciate your reply.",
    "Thanks for your response.",
    "Good to hear back from you.",
  ],
  listing: [
    "We've had {n} live on our Top {s} Marketing Agencies page for a while now.",
    "{n} has been listed on our Top {s} Marketing Agencies page for some time.",
    "Your agency has been featured on our Top {s} Marketing Agencies page for a while.",
    "We've had {n} on our Top {s} Marketing Agencies page for some time now.",
  ],
  activity: [
    "There's already activity on your profile — worth checking:",
    "We've already seen activity on your profile — take a look:",
    "Your profile is already getting attention — see for yourself:",
  ],
  cta: [
    "Please open your profile via the link above and review & confirm it there.",
    "Open your profile through the link above, review the details, and confirm it there.",
    "Use the link above to open your profile, review it, and confirm it.",
  ],
  conversion: [
    "Once confirmed, we'll start forwarding inquiries to you.",
    "After confirmation, we'll begin sending inquiries your way.",
    "Once you confirm, we'll start routing new inquiries to you.",
  ],
} as const;

interface VariationIndices {
  intro: number;
  listing: number;
  activity: number;
  cta: number;
  conversion: number;
}

function rollVariation(): VariationIndices {
  return {
    intro:      Math.floor(Math.random() * REPLY_VARIANTS.intro.length),
    listing:    Math.floor(Math.random() * REPLY_VARIANTS.listing.length),
    activity:   Math.floor(Math.random() * REPLY_VARIANTS.activity.length),
    cta:        Math.floor(Math.random() * REPLY_VARIANTS.cta.length),
    conversion: Math.floor(Math.random() * REPLY_VARIANTS.conversion.length),
  };
}

function ValidationBadge({ status }: { status: string }) {
  const colors: Record<string, string> = {
    valid: 'bg-emerald-50 text-emerald-700 border-emerald-200',
    invalid: 'bg-red-50 text-red-700 border-red-200',
    catch_all: 'bg-amber-50 text-amber-700 border-amber-200',
    risky: 'bg-orange-50 text-orange-700 border-orange-200',
    unknown: 'bg-slate-50 text-slate-600 border-slate-200',
    duplicate: 'bg-slate-50 text-slate-600 border-slate-200',
  };
  return (
    <span className={`text-[10px] font-semibold px-1.5 py-0.5 rounded border ${colors[status] || colors.unknown}`}>
      {status}
    </span>
  );
}

function SectionBadge({ section, rank }: { section: string; rank: number | null }) {
  if (section === 'top25') {
    return (
      <span className="inline-flex items-center gap-1 text-[11px] font-semibold px-2 py-0.5 rounded-full bg-amber-50 text-amber-700 border border-amber-200">
        <Star className="w-2.5 h-2.5 fill-amber-500 text-amber-500" />
        Top 25{rank ? ` #${rank}` : ''}
      </span>
    );
  }
  return (
    <span className="inline-flex items-center gap-1 text-[11px] font-semibold px-2 py-0.5 rounded-full bg-slate-100 text-slate-600 border border-slate-200">
      <Building2 className="w-2.5 h-2.5" />
      Other
    </span>
  );
}

function MatchTypeBadge({ type }: { type: string }) {
  const config: Record<string, { label: string; className: string }> = {
    exact: { label: 'Exact match', className: 'bg-emerald-50 text-emerald-700 border-emerald-200' },
    normalized: { label: 'Normalized', className: 'bg-blue-50 text-blue-700 border-blue-200' },
    domain_match: { label: 'Domain match', className: 'bg-amber-50 text-amber-700 border-amber-200' },
    id_lookup: { label: 'Direct ID lookup', className: 'bg-slate-100 text-slate-600 border-slate-300' },
  };
  const c = config[type] || config.exact;
  return (
    <span className={`text-[10px] font-semibold px-2 py-0.5 rounded-full border ${c.className}`}>
      {c.label}
    </span>
  );
}

function TimingBadge({ timing, clientMs }: { timing?: TimingInfo; clientMs: number | null }) {
  const serverMs = timing?.total_ms;
  const totalMs = clientMs ?? serverMs;
  if (!totalMs) return null;

  const color = totalMs < 500 ? 'text-emerald-600' : totalMs < 2000 ? 'text-amber-600' : 'text-red-600';

  return (
    <div className={`inline-flex items-center gap-1.5 text-xs font-medium ${color}`}>
      <Zap className="w-3 h-3" />
      {totalMs < 1000 ? `${totalMs}ms` : `${(totalMs / 1000).toFixed(1)}s`}
      {serverMs && clientMs && serverMs !== clientMs && (
        <span className="text-slate-400 font-normal">(server {serverMs}ms)</span>
      )}
    </div>
  );
}

function CopyButton({
  onClick,
  copied,
  label,
  size = 'sm',
}: {
  onClick: () => void;
  copied: boolean;
  label: string;
  size?: 'xs' | 'sm';
}) {
  const padding = size === 'xs' ? 'py-1.5 px-3 text-xs' : 'py-2 px-4 text-sm';
  return (
    <button
      onClick={onClick}
      className={`inline-flex items-center gap-1.5 font-medium text-slate-600 bg-slate-50 hover:bg-slate-100 border border-slate-200 rounded-lg transition-all ${padding}`}
    >
      {copied ? (
        <><Check className="w-3.5 h-3.5 text-emerald-500" /><span className="text-emerald-600">Copied!</span></>
      ) : (
        <><Copy className="w-3.5 h-3.5 text-slate-400" />{label}</>
      )}
    </button>
  );
}

function CollapsibleSection({
  title,
  icon,
  defaultOpen = false,
  accent,
  children,
}: {
  title: string;
  icon?: ReactNode;
  defaultOpen?: boolean;
  accent?: 'amber';
  children: ReactNode;
}) {
  const [open, setOpen] = useState(defaultOpen);
  const borderClass = accent === 'amber' ? 'border-amber-200' : 'border-slate-200';
  const headerBg = accent === 'amber' ? 'bg-amber-50/40' : '';
  const headerText = accent === 'amber' ? 'text-amber-700' : 'text-slate-500';
  return (
    <div className={`bg-white rounded-2xl border ${borderClass} shadow-sm overflow-hidden`}>
      <button
        type="button"
        onClick={() => setOpen((v) => !v)}
        className={`w-full flex items-center justify-between gap-2 px-4 py-3 border-b border-slate-100 ${headerBg} hover:bg-slate-50/60 transition-colors`}
      >
        <h3 className={`text-xs font-semibold uppercase tracking-wide flex items-center gap-2 ${headerText}`}>
          {icon}
          {title}
        </h3>
        <ChevronDown className={`w-3.5 h-3.5 text-slate-400 transition-transform ${open ? 'rotate-180' : ''}`} />
      </button>
      {open && <div>{children}</div>}
    </div>
  );
}

function GroupLabel({ children }: { children: ReactNode }) {
  return (
    <p className="text-[10px] font-semibold text-slate-400 uppercase tracking-widest px-1 pt-1 pb-0.5">
      {children}
    </p>
  );
}

export default function WpAdminAgencyReplyHelperPage() {
  const [email, setEmail] = useState('');
  const [loading, setLoading] = useState(false);
  const [result, setResult] = useState<LookupResult | null>(null);
  const [error, setError] = useState<string | null>(null);
  const [copiedItem, setCopiedItem] = useState<string | null>(null);
  const [clientMs, setClientMs] = useState<number | null>(null);
  const [variationIndices, setVariationIndices] = useState<VariationIndices>(() => rollVariation());
  const [searchedIdentifier, setSearchedIdentifier] = useState<string>('');
  const inputRef = useRef<HTMLInputElement>(null);
  const abortRef = useRef<AbortController | null>(null);
  const busyRef = useRef(false);
  const prefillAppliedRef = useRef(false);

  const { token } = useAdminSession();
  const [searchParams] = useSearchParams();
  const [showcaseState, setShowcaseState] = useState<{ pinned: boolean; position: number | null } | null>(null);
  const [posInput, setPosInput] = useState('');
  const [placementLoading, setPlacementLoading] = useState(false);
  const [placementMsg, setPlacementMsg] = useState<{ type: 'success' | 'error'; text: string } | null>(null);

  useEffect(() => {
    if (result?.found && result.agency) {
      setVariationIndices(rollVariation());
    }
  }, [result?.agency?.id]);

  useEffect(() => {
    if (!result?.found || !result.agency) {
      setShowcaseState(null);
      setPosInput('');
      setPlacementMsg(null);
      return;
    }
    const hasOther = result.listings.some(l => l.section === 'other');
    if (!hasOther) {
      setShowcaseState(null);
      return;
    }
    setShowcaseState(null);
    supabase
      .from('other_agencies')
      .select('showcase_pinned, showcase_position')
      .eq('id', result.agency.id)
      .maybeSingle()
      .then(({ data }) => {
        const pinned = (data as { showcase_pinned: boolean; showcase_position: number | null } | null)?.showcase_pinned ?? false;
        const position = (data as { showcase_pinned: boolean; showcase_position: number | null } | null)?.showcase_position ?? null;
        setShowcaseState({ pinned, position });
        setPosInput(position != null ? String(position) : '');
      });
  }, [result?.agency?.id]);

  useEffect(() => {
    if (prefillAppliedRef.current) return;
    const prefillAgencyId = searchParams.get('agency_id') || searchParams.get('prefill_agency_id');
    const prefillSlug = searchParams.get('agency_slug') || searchParams.get('agency') || searchParams.get('slug');
    const prefillEmail = searchParams.get('email') || searchParams.get('prefill_email');
    if (prefillAgencyId && prefillAgencyId.trim()) {
      prefillAppliedRef.current = true;
      handleLookup(undefined, prefillAgencyId.trim());
    } else if (prefillSlug && prefillSlug.trim()) {
      prefillAppliedRef.current = true;
      handleLookup(undefined, undefined, prefillSlug.trim());
    } else if (prefillEmail && prefillEmail.includes('@')) {
      prefillAppliedRef.current = true;
      setEmail(prefillEmail);
      handleLookup(prefillEmail);
    }
  // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  const handleLookup = useCallback(async (emailOverride?: string, agencyIdOverride?: string, agencySlugOverride?: string) => {
    if (busyRef.current) return;

    let requestBody: Record<string, string>;
    let identifier: string;

    if (agencyIdOverride && agencyIdOverride.trim()) {
      requestBody = { agency_id: agencyIdOverride.trim() };
      identifier = `[id: ${agencyIdOverride.trim().slice(0, 8)}]`;
    } else if (agencySlugOverride && agencySlugOverride.trim()) {
      requestBody = { agency_slug: agencySlugOverride.trim() };
      identifier = `[slug: ${agencySlugOverride.trim()}]`;
    } else {
      const trimmed = (emailOverride ?? email).trim().toLowerCase();
      if (!trimmed) {
        setError('Please enter an email address');
        return;
      }
      if (!trimmed.includes('@')) {
        setError('Please enter a valid email address');
        return;
      }
      requestBody = { email: trimmed };
      identifier = trimmed;
    }

    if (abortRef.current) abortRef.current.abort();
    const controller = new AbortController();
    abortRef.current = controller;
    const timeout = setTimeout(() => controller.abort(), REQUEST_TIMEOUT_MS);

    busyRef.current = true;
    setLoading(true);
    setError(null);
    setResult(null);
    setClientMs(null);
    setSearchedIdentifier(identifier);

    const t0 = performance.now();

    try {
      const res = await fetch(`${SUPABASE_URL}/functions/v1/agency-lookup-by-email`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          Authorization: `Bearer ${SUPABASE_ANON_KEY}`,
        },
        body: JSON.stringify(requestBody),
        signal: controller.signal,
      });

      const data = await res.json();
      const elapsed = Math.round(performance.now() - t0);
      setClientMs(elapsed);

      if (import.meta.env.DEV) {
        console.log(`[agency-lookup] ${identifier} => ${data.found ? 'FOUND' : 'NOT FOUND'} in ${elapsed}ms`, data._timing);
      }

      if (!data.ok) {
        setError(data.error || 'Lookup failed');
        return;
      }

      const normalized: LookupResult = {
        ...data,
        linked_emails: Array.isArray(data.linked_emails) ? data.linked_emails : [],
        listings: Array.isArray(data.listings) ? data.listings : [],
        alternative_matches: Array.isArray(data.alternative_matches) ? data.alternative_matches : [],
        manage_funnel_events_timeline: Array.isArray(data.manage_funnel_events_timeline)
          ? data.manage_funnel_events_timeline
          : [],
        commercial_status: data.commercial_status
          ? {
              ...data.commercial_status,
              products: Array.isArray(data.commercial_status.products) ? data.commercial_status.products : [],
              standard_listing_states: Array.isArray(data.commercial_status.standard_listing_states)
                ? data.commercial_status.standard_listing_states
                : [],
              stripe_orders: Array.isArray(data.commercial_status.stripe_orders)
                ? data.commercial_status.stripe_orders
                : [],
            }
          : data.commercial_status,
      };

      setResult(normalized);
    } catch (err) {
      if ((err as Error).name === 'AbortError') {
        setError('Request timed out. Please try again.');
      } else {
        setError(err instanceof Error ? err.message : 'Network error');
      }
    } finally {
      clearTimeout(timeout);
      setLoading(false);
      busyRef.current = false;
      abortRef.current = null;
    }
  }, [email]);

  const handleKeyDown = useCallback((e: React.KeyboardEvent) => {
    if (e.key === 'Enter' && !busyRef.current) {
      e.preventDefault();
      handleLookup();
    }
  }, [handleLookup]);

  const copyToClipboard = useCallback(async (text: string, itemId: string) => {
    await navigator.clipboard.writeText(text);
    setCopiedItem(itemId);
    setTimeout(() => setCopiedItem(null), 2000);
  }, []);

  // Smartlead's editor is picky about pasted clipboard formats, so we first try an explicit
  // copy event that sets both text/html and text/plain via clipboardData.setData().
  const copyRichToClipboard = useCallback(async (html: string, plainText: string, itemId: string) => {
    let success = false;

    // Tier 1: Intercept the native copy event and inject both MIME types directly.
    // This is the most reliable method for Smartlead's composer.
    if (!success) {
      try {
        await new Promise<void>((resolve, reject) => {
          const handler = (e: ClipboardEvent) => {
            document.removeEventListener('copy', handler);
            try {
              e.preventDefault();
              e.clipboardData?.setData('text/html', html);
              e.clipboardData?.setData('text/plain', plainText);
              resolve();
            } catch (err) {
              reject(err);
            }
          };
          document.addEventListener('copy', handler);
          const fired = document.execCommand('copy');
          if (!fired) {
            document.removeEventListener('copy', handler);
            reject(new Error('execCommand copy did not fire'));
          }
        });
        success = true;
      } catch {
        // fall through to tier 2
      }
    }

    // Tier 2: ClipboardItem API with explicit text/html + text/plain blobs (Chrome, Edge).
    if (!success && typeof ClipboardItem !== 'undefined') {
      try {
        const htmlBlob = new Blob([html], { type: 'text/html' });
        const textBlob = new Blob([plainText], { type: 'text/plain' });
        await navigator.clipboard.write([
          new ClipboardItem({ 'text/html': htmlBlob, 'text/plain': textBlob }),
        ]);
        success = true;
      } catch {
        // fall through to tier 3
      }
    }

    // Tier 3a: Hidden contenteditable — carries rich HTML through execCommand.
    if (!success) {
      try {
        const el = document.createElement('div');
        el.setAttribute('contenteditable', 'true');
        el.style.cssText = 'position:fixed;top:-9999px;left:-9999px;width:1px;height:1px;overflow:hidden;opacity:0;';
        el.innerHTML = html;
        document.body.appendChild(el);
        const range = document.createRange();
        range.selectNodeContents(el);
        const sel = window.getSelection();
        if (sel) {
          sel.removeAllRanges();
          sel.addRange(range);
        }
        success = document.execCommand('copy');
        if (sel) sel.removeAllRanges();
        document.body.removeChild(el);
      } catch {
        // fall through to tier 3b
      }
    }

    // Tier 3b: Hidden textarea — plain text only, guaranteed legible paste.
    if (!success) {
      try {
        const ta = document.createElement('textarea');
        ta.value = plainText;
        ta.style.cssText = 'position:fixed;top:-9999px;left:-9999px;width:1px;height:1px;opacity:0;';
        ta.setAttribute('readonly', '');
        document.body.appendChild(ta);
        ta.select();
        success = document.execCommand('copy');
        document.body.removeChild(ta);
      } catch {
        // fall through to tier 4
      }
    }

    // Tier 4: Clipboard API plain text — last resort.
    if (!success) {
      try {
        await navigator.clipboard.writeText(plainText);
      } catch {
        // nothing more we can do
      }
    }

    setCopiedItem(itemId);
    setTimeout(() => setCopiedItem(null), 2000);
  }, []);

  const generatePlain = useCallback((v: VariationIndices): string => {
    if (!result?.agency || !result.your_agency_url) return '';
    const n = result.agency.name;
    const s = result.listings.length > 0 ? slugToStateName(result.listings[0].state_slug) : 'US';
    const url = result.your_agency_url;
    const listing = (REPLY_VARIANTS.listing[v.listing] as string)
      .replace('{n}', n)
      .replace('{s}', s);
    // Use CRLF line endings — Smartlead handles them more reliably than bare LF.
    const CRLF = '\r\n';
    return [
      'Hi,',
      '',
      REPLY_VARIANTS.intro[v.intro],
      '',
      listing,
      '',
      REPLY_VARIANTS.activity[v.activity],
      '',
      'View your profile:',
      url,
      '',
      REPLY_VARIANTS.cta[v.cta],
      '',
      REPLY_VARIANTS.conversion[v.conversion],
      '',
      'Best,',
      'Bartu Cavusoglu',
      'Founder & CEO of Gappsy',
    ].join(CRLF);
  }, [result]);

  const generateHtml = useCallback((v: VariationIndices): string => {
    if (!result?.agency || !result.your_agency_url) return '';

    const escapeHtml = (s: string) =>
      s.replace(/&/g, '&amp;')
       .replace(/</g, '&lt;')
       .replace(/>/g, '&gt;')
       .replace(/"/g, '&quot;');

    const n = escapeHtml(result.agency.name);
    const s = result.listings.length > 0 ? slugToStateName(result.listings[0].state_slug) : 'US';
    const url = result.your_agency_url;

    const intro = escapeHtml(REPLY_VARIANTS.intro[v.intro]);
    const listing = (REPLY_VARIANTS.listing[v.listing] as string)
      .replace('{n}', `<strong>${n}</strong>`)
      .replace('{s}', escapeHtml(s));
    const activity = escapeHtml(REPLY_VARIANTS.activity[v.activity]);
    const cta = escapeHtml(REPLY_VARIANTS.cta[v.cta]);
    const conversion = escapeHtml(REPLY_VARIANTS.conversion[v.conversion]);

    const P = 'style="margin:0 0 12px 0;"';

    return `<div style="font-family:Arial,Helvetica,sans-serif;font-size:14px;line-height:1.6;color:#111827;">
<p ${P}>Hi,</p>
<p ${P}>${intro}</p>
<p ${P}>${listing}</p>
<p ${P}>${activity}</p>
<p ${P}>View your profile:<br><a href="${url}" target="_blank" rel="noopener noreferrer" style="color:#2563eb;text-decoration:underline;">${url}</a></p>
<p ${P}>${cta}</p>
<p ${P}>${conversion}</p>
<p style="margin:0;">Best,<br>Bartu Cavusoglu<br>Founder &amp; CEO of Gappsy</p>
</div>`.trim();
  }, [result]);

  const handleClear = useCallback(() => {
    if (abortRef.current) abortRef.current.abort();
    setEmail('');
    setResult(null);
    setError(null);
    setClientMs(null);
    setLoading(false);
    busyRef.current = false;
    setSearchedIdentifier('');
    setShowcaseState(null);
    setPosInput('');
    setPlacementMsg(null);
    inputRef.current?.focus();
  }, []);

  const handlePin = useCallback(async () => {
    if (!result?.agency || !token) return;
    const pos = parseInt(posInput, 10);
    if (!posInput || isNaN(pos) || pos < 1) {
      setPlacementMsg({ type: 'error', text: 'Enter a valid position (1 or higher)' });
      return;
    }
    setPlacementLoading(true);
    setPlacementMsg(null);
    try {
      const res = await fetch(`${SUPABASE_URL}/functions/v1/other-agencies-manager-api`, {
        method: 'PATCH',
        headers: {
          'Content-Type': 'application/json',
          Authorization: `Bearer ${SUPABASE_ANON_KEY}`,
          'x-admin-token': token,
        },
        body: JSON.stringify({
          id: result.agency.id,
          showcase_pinned: true,
          showcase_position: pos,
          showcase_updated_by: 'agency_lookup',
        }),
      });
      const data = await res.json();
      if (!res.ok || !data.ok) throw new Error(data.error || 'Pin failed');
      setShowcaseState({ pinned: true, position: pos });
      let msg = `Pinned at position #${pos}`;
      if (data.displaced) msg += ` — displaced: ${(data.displaced as { name: string }).name}`;
      setPlacementMsg({ type: 'success', text: msg });
    } catch (e) {
      setPlacementMsg({ type: 'error', text: (e as Error).message || 'Failed to pin' });
    } finally {
      setPlacementLoading(false);
    }
  }, [result, token, posInput]);

  const handleUnpin = useCallback(async () => {
    if (!result?.agency || !token) return;
    setPlacementLoading(true);
    setPlacementMsg(null);
    try {
      const res = await fetch(`${SUPABASE_URL}/functions/v1/other-agencies-manager-api`, {
        method: 'PATCH',
        headers: {
          'Content-Type': 'application/json',
          Authorization: `Bearer ${SUPABASE_ANON_KEY}`,
          'x-admin-token': token,
        },
        body: JSON.stringify({
          id: result.agency.id,
          showcase_pinned: false,
          showcase_position: null,
          showcase_updated_by: 'agency_lookup',
        }),
      });
      const data = await res.json();
      if (!res.ok || !data.ok) throw new Error(data.error || 'Unpin failed');
      setShowcaseState({ pinned: false, position: null });
      setPosInput('');
      setPlacementMsg({ type: 'success', text: 'Removed from showcase' });
    } catch (e) {
      setPlacementMsg({ type: 'error', text: (e as Error).message || 'Failed to remove' });
    } finally {
      setPlacementLoading(false);
    }
  }, [result, token]);

  const handleRegenerate = useCallback(() => {
    setVariationIndices(rollVariation());
  }, []);

  const handleCopySmartlead = useCallback(async () => {
    const v = rollVariation();
    setVariationIndices(v);
    await copyRichToClipboard(generateHtml(v), generatePlain(v), 'reply-rich');
  }, [copyRichToClipboard, generateHtml, generatePlain]);

  const handleCopyPlain = useCallback(async () => {
    const v = rollVariation();
    setVariationIndices(v);
    await copyToClipboard(generatePlain(v), 'reply-plain');
  }, [copyToClipboard, generatePlain]);

  const agencyInitial = result?.agency?.name?.charAt(0)?.toUpperCase() ?? '?';

  const safeAgency = result?.agency ?? null;
  const safeMatchInfo = result?.match_info ?? null;
  const safeYourAgencyUrl = result?.your_agency_url ?? '';
  const safeRequestCompareUrl = result?.csv_links?.request_compare_url ?? '';
  const safeLinkedEmails = Array.isArray(result?.linked_emails) ? result!.linked_emails : [];
  const safeListings = Array.isArray(result?.listings) ? result!.listings : [];
  const safeAlternativeMatches = Array.isArray(result?.alternative_matches) ? result!.alternative_matches : [];
  const safeManageTimeline = Array.isArray(result?.manage_funnel_events_timeline) ? result!.manage_funnel_events_timeline : [];

  const resolvedWebsite = safeAgency
    ? safeAgency.website_url ||
      safeAgency.domain ||
      extractDomainFromEmail(safeMatchInfo?.searched_email)
    : null;
  const websiteFromEmail =
    resolvedWebsite != null &&
    resolvedWebsite !== safeAgency?.website_url &&
    resolvedWebsite !== safeAgency?.domain;

  return (
    <WpAdminLayout title="Agency Reply Engine" icon={<UserSearch className="w-5 h-5" />}>
      <div className="max-w-7xl mx-auto space-y-5">

        {/* Search */}
        <div className="bg-white rounded-2xl border border-slate-200 shadow-sm p-6">
          <div className="mb-5">
            <h2 className="text-base font-semibold text-slate-900">Find Agency by Email</h2>
            <p className="text-sm text-slate-400 mt-0.5">
              Paste the responder's email from Smartlead to load their profile and generate a reply.
            </p>
          </div>

          <div className="flex gap-3">
            <div className="flex-1 relative">
              <Mail className="absolute left-3.5 top-1/2 -translate-y-1/2 w-4 h-4 text-slate-300" />
              <input
                ref={inputRef}
                type="email"
                value={email}
                onChange={(e) => setEmail(e.target.value)}
                onKeyDown={handleKeyDown}
                placeholder="responder@agency.com"
                autoComplete="off"
                spellCheck={false}
                className="w-full pl-10 pr-4 py-2.5 border border-slate-200 rounded-xl text-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent placeholder:text-slate-300 text-slate-800"
              />
            </div>
            <button
              onClick={handleLookup}
              disabled={loading}
              className="flex items-center gap-2 bg-slate-800 hover:bg-slate-900 disabled:bg-slate-300 disabled:cursor-not-allowed text-white font-semibold px-5 py-2.5 rounded-xl transition-colors text-sm min-w-[140px] justify-center"
            >
              {loading ? (
                <><Loader2 className="w-4 h-4 animate-spin" />Searching...</>
              ) : (
                <><Search className="w-4 h-4" />Find Agency</>
              )}
            </button>
            {(result || error) && (
              <button
                onClick={handleClear}
                className="flex items-center gap-1.5 text-slate-500 hover:text-slate-700 font-medium px-4 py-2.5 rounded-xl border border-slate-200 hover:bg-slate-50 transition-colors text-sm"
              >
                <RefreshCw className="w-3.5 h-3.5" />
                Clear
              </button>
            )}
          </div>

          {clientMs !== null && (
            <div className="mt-3 flex items-center gap-2">
              <TimingBadge timing={result?._timing} clientMs={clientMs} />
              {result?.found && result?.match_info && (
                <span className="text-xs text-slate-400">
                  {result.match_info.match_type === 'id_lookup' ? 'Loaded by agency ID' :
                   result.match_info.match_type === 'exact' ? 'Exact email match' :
                   result.match_info.match_type === 'domain_match' ? 'Matched by domain' : 'Normalized match'}
                </span>
              )}
            </div>
          )}
        </div>

        {/* Error */}
        {error && (
          <div className="flex items-center gap-3 bg-red-50 border border-red-200 rounded-xl px-5 py-4">
            <AlertCircle className="w-4 h-4 text-red-500 shrink-0" />
            <p className="text-sm font-medium text-red-700">{error}</p>
          </div>
        )}

        {/* Not Found */}
        {result && !result.found && (
          <div className="bg-slate-50 border border-slate-200 rounded-2xl p-8 text-center">
            <div className="w-12 h-12 bg-slate-100 rounded-xl flex items-center justify-center mx-auto mb-3">
              <AlertCircle className="w-5 h-5 text-slate-400" />
            </div>
            <p className="font-semibold text-slate-700">No agency found</p>
            <p className="text-sm text-slate-400 mt-1">
              {searchedIdentifier.startsWith('[id:')
                ? <>No active agency found for ID <code className="font-mono bg-slate-100 px-1 rounded text-slate-600">{searchedIdentifier}</code>. The ID may be invalid or the agency may be inactive.</>
                : <>No agency matches <code className="font-mono bg-slate-100 px-1 rounded text-slate-600">{searchedIdentifier || email.trim()}</code>. Try a different email address.</>
              }
            </p>
          </div>
        )}

        {/* Results */}
        {result && result.found && result.agency && (
          <>
            {/* Sticky compact agency header */}
            <div className="sticky top-0 z-20 -mx-4 md:mx-0">
              <div className="bg-white/95 backdrop-blur rounded-2xl border border-slate-200 shadow-sm px-4 py-3">
                <div className="flex items-center justify-between gap-3 flex-wrap">
                  <div className="flex items-center gap-3 min-w-0 flex-1">
                    <div className="w-9 h-9 bg-slate-100 rounded-lg flex items-center justify-center shrink-0 text-sm font-bold text-slate-600 select-none">
                      {agencyInitial}
                    </div>
                    <div className="min-w-0">
                      <div className="flex items-center gap-2 flex-wrap">
                        <h3 className="text-sm font-semibold text-slate-900 truncate leading-tight">{result.agency.name}</h3>
                        {result.commercial_status && (
                          <span className={`inline-flex items-center gap-1 text-[10px] font-semibold px-2 py-0.5 rounded-full border ${
                            result.commercial_status.has_any_paid_product
                              ? 'bg-emerald-50 text-emerald-700 border-emerald-200'
                              : 'bg-slate-50 text-slate-500 border-slate-200'
                          }`}>
                            <BadgeDollarSign className="w-2.5 h-2.5" />
                            {result.commercial_status.has_any_paid_product ? 'Paid' : 'Not paid'}
                          </span>
                        )}
                        {result.listings.length > 0 && (
                          <span className="text-[11px] text-slate-500 inline-flex items-center gap-1">
                            <MapPin className="w-2.5 h-2.5" />
                            {slugToStateName(result.listings[0].state_slug)}
                          </span>
                        )}
                        {resolvedWebsite && (
                          <a
                            href={resolvedWebsite.includes('://') ? resolvedWebsite : `https://${resolvedWebsite}`}
                            target="_blank"
                            rel="noopener noreferrer"
                            className="text-[11px] text-blue-600 hover:text-blue-700 inline-flex items-center gap-1"
                          >
                            <Globe className="w-2.5 h-2.5" />
                            {resolvedWebsite}
                          </a>
                        )}
                      </div>
                      {safeYourAgencyUrl && (
                        <p className="text-[11px] font-mono text-slate-400 truncate mt-0.5">{safeYourAgencyUrl}</p>
                      )}
                    </div>
                  </div>
                  <div className="flex items-center gap-1.5 shrink-0 flex-wrap">
                    <button
                      onClick={() => safeYourAgencyUrl && copyToClipboard(safeYourAgencyUrl, 'hero-url')}
                      className="inline-flex items-center gap-1 text-[11px] font-medium text-slate-600 bg-slate-50 hover:bg-slate-100 border border-slate-200 px-2 py-1.5 rounded-lg transition-colors"
                    >
                      {copiedItem === 'hero-url' ? <Check className="w-3 h-3 text-emerald-500" /> : <Copy className="w-3 h-3 text-slate-400" />}
                      Copy Profile
                    </button>
                    <a
                      href={safeYourAgencyUrl || '#'}
                      target="_blank"
                      rel="noopener noreferrer"
                      className="inline-flex items-center gap-1 text-[11px] font-medium text-white bg-slate-800 hover:bg-slate-900 px-2 py-1.5 rounded-lg transition-colors"
                    >
                      <ExternalLink className="w-3 h-3" />
                      Open Profile
                    </a>
                    <button
                      onClick={() => safeRequestCompareUrl && copyToClipboard(safeRequestCompareUrl, 'hero-compare-url')}
                      disabled={!safeRequestCompareUrl}
                      className="inline-flex items-center gap-1 text-[11px] font-medium text-rose-700 bg-rose-50 hover:bg-rose-100 border border-rose-200 px-2 py-1.5 rounded-lg transition-colors disabled:opacity-50 disabled:cursor-not-allowed"
                    >
                      {copiedItem === 'hero-compare-url' ? <Check className="w-3 h-3 text-emerald-500" /> : <Copy className="w-3 h-3 text-rose-500" />}
                      Copy Request Compare Link
                    </button>
                    <a
                      href={safeRequestCompareUrl || '#'}
                      target="_blank"
                      rel="noopener noreferrer"
                      className={`inline-flex items-center gap-1 text-[11px] font-medium px-2 py-1.5 rounded-lg transition-colors ${safeRequestCompareUrl ? 'text-white bg-rose-600 hover:bg-rose-700' : 'text-rose-300 bg-rose-50 pointer-events-none'}`}
                    >
                      <ExternalLink className="w-3 h-3" />
                      Open Request Compare
                    </a>
                    <button
                      onClick={() => safeMatchInfo?.matched_email && copyToClipboard(safeMatchInfo.matched_email, 'hero-email')}
                      className="inline-flex items-center gap-1 text-[11px] font-medium text-slate-600 bg-slate-50 hover:bg-slate-100 border border-slate-200 px-2 py-1.5 rounded-lg transition-colors"
                    >
                      {copiedItem === 'hero-email' ? <Check className="w-3 h-3 text-emerald-500" /> : <Mail className="w-3 h-3 text-slate-400" />}
                      Copy Email
                    </button>
                    <a
                      href="/wp-admin/analytics/agency-funnel"
                      target="_blank"
                      rel="noopener noreferrer"
                      className="inline-flex items-center gap-1 text-[11px] font-medium text-slate-600 bg-slate-50 hover:bg-slate-100 border border-slate-200 px-2 py-1.5 rounded-lg transition-colors"
                    >
                      <Activity className="w-3 h-3" />
                      Funnel Analytics
                    </a>
                  </div>
                </div>

                {/* ── Quick Links row ─────────────────────────────────────────── */}
                {(() => {
                  const ql = [
                    { id: 'ql-your-agency',  label: 'Your Agency',  url: result.csv_links?.your_agency_url ?? safeYourAgencyUrl ?? null,            accent: 'slate'   },
                    { id: 'ql-replay',        label: 'Replay',       url: result.csv_links?.request_replay_url_v2 ?? null,                           accent: 'blue'    },
                    { id: 'ql-compare',       label: 'Compare',      url: result.csv_links?.request_compare_url ?? null,                             accent: 'rose'    },
                    { id: 'ql-manage',        label: 'Manage',       url: result.csv_links?.manage_listing_url_v2 ?? null,                           accent: 'slate'   },
                    { id: 'ql-activation',    label: 'Activation',   url: result.csv_links?.activation_direct_link ?? null,                         accent: 'amber'   },
                    { id: 'ql-discount-20',   label: '20% Off',      url: result.csv_links?.activation_discount_link_20 ?? null,                    accent: 'emerald' },
                  ] as const;

                  const chipBase = 'flex items-center gap-1.5 rounded-lg border px-2.5 py-1.5 min-w-0 bg-white';
                  const accentCopy: Record<string, string> = {
                    slate:   'border-slate-200 hover:border-slate-300',
                    blue:    'border-blue-200 hover:border-blue-300',
                    rose:    'border-rose-200 hover:border-rose-300',
                    amber:   'border-amber-200 hover:border-amber-300',
                    emerald: 'border-emerald-200 hover:border-emerald-300',
                  };
                  const accentOpen: Record<string, string> = {
                    slate:   'text-slate-700 bg-slate-50 hover:bg-slate-100 border-slate-200',
                    blue:    'text-blue-700 bg-blue-50 hover:bg-blue-100 border-blue-200',
                    rose:    'text-rose-700 bg-rose-50 hover:bg-rose-100 border-rose-200',
                    amber:   'text-amber-700 bg-amber-50 hover:bg-amber-100 border-amber-200',
                    emerald: 'text-emerald-700 bg-emerald-50 hover:bg-emerald-100 border-emerald-200',
                  };
                  const accentLabel: Record<string, string> = {
                    slate:   'text-slate-700',
                    blue:    'text-blue-700',
                    rose:    'text-rose-700',
                    amber:   'text-amber-700',
                    emerald: 'text-emerald-700',
                  };

                  return (
                    <div className="border-t border-slate-100 pt-3 mt-1">
                      <div className="flex items-center gap-2 mb-2.5">
                        <span className="text-[10px] font-semibold text-slate-400 uppercase tracking-widest">Quick Links</span>
                      </div>
                      <div className="flex flex-wrap gap-2">
                        {ql.map((item) => (
                          <div
                            key={item.id}
                            className={`${chipBase} ${item.url ? accentCopy[item.accent] : 'border-slate-100 opacity-50'} transition-colors`}
                          >
                            <span className={`text-[11px] font-semibold whitespace-nowrap ${item.url ? accentLabel[item.accent] : 'text-slate-400'}`}>
                              {item.label}
                            </span>
                            <div className="flex items-center gap-0.5 ml-1">
                              <button
                                onClick={() => item.url && copyToClipboard(item.url!, item.id)}
                                disabled={!item.url}
                                title={`Copy ${item.label}`}
                                className="p-1 rounded hover:bg-slate-100 transition-colors disabled:cursor-not-allowed"
                              >
                                {copiedItem === item.id
                                  ? <Check className="w-3 h-3 text-emerald-500" />
                                  : <Copy className="w-3 h-3 text-slate-400" />}
                              </button>
                              <a
                                href={item.url || undefined}
                                target="_blank"
                                rel="noopener noreferrer"
                                onClick={(e) => { if (!item.url) e.preventDefault(); }}
                                title={`Open ${item.label}`}
                                className={`p-1 rounded transition-colors ${item.url ? 'hover:bg-slate-100' : 'cursor-not-allowed opacity-40 pointer-events-none'}`}
                              >
                                <ExternalLink className={`w-3 h-3 ${item.url ? accentLabel[item.accent] : 'text-slate-300'}`} />
                              </a>
                            </div>
                          </div>
                        ))}
                      </div>
                    </div>
                  );
                })()}

              </div>
            </div>

            {/* Hidden by owner warning */}
            {result.agency?.listing_management_status === 'removal_pending' && (
              <div className="flex items-start gap-2 bg-red-50 border border-red-200 rounded-xl px-3 py-2">
                <EyeOff className="w-3.5 h-3.5 text-red-500 mt-0.5 flex-shrink-0" />
                <div className="text-xs">
                  <span className="font-semibold text-red-700">Listing hidden by owner.</span>{' '}
                  <span className="text-red-600">Self-removed via manage funnel — preserved internally, not publicly visible.</span>{' '}
                  <a
                    href="/wp-admin/manage-removals"
                    target="_blank"
                    rel="noopener noreferrer"
                    className="font-medium text-red-700 hover:text-red-800 underline underline-offset-2"
                  >
                    View all self-removed listings
                  </a>
                </div>
              </div>
            )}

            {/* Funnel Intelligence — full width, above 3-column grid */}
            {safeAgency?.id && (
              <SafeSection name="AgencyFunnelIntelligence">
                <AgencyFunnelIntelligence
                  agencyId={safeAgency.id}
                  agencySlug={safeAgency.slug}
                />
              </SafeSection>
            )}

            {/* 3-column grid */}
            <div className="grid grid-cols-1 md:grid-cols-2 xl:grid-cols-3 gap-4">

              {/* LEFT — Agency Context */}
              <div className="space-y-4">
                <GroupLabel>Who is this?</GroupLabel>

                {/* Match Details */}
                <div className="bg-white rounded-2xl border border-slate-200 shadow-sm overflow-hidden">
                  <div className="px-5 py-3.5 border-b border-slate-100">
                    <h3 className="text-xs font-semibold text-slate-500 uppercase tracking-wide flex items-center gap-2">
                      <Shield className="w-3 h-3" />
                      Match Details
                    </h3>
                  </div>
                  <div className="p-5 space-y-3">
                    <div className="flex items-center justify-between">
                      <span className="text-xs text-slate-400">Searched</span>
                      <code className="text-xs font-mono bg-slate-50 border border-slate-100 text-slate-600 px-2 py-0.5 rounded">
                        {result.match_info?.searched_email}
                      </code>
                    </div>
                    <div className="flex items-center justify-between">
                      <span className="text-xs text-slate-400">Matched</span>
                      <div className="flex items-center gap-2">
                        <code className="text-xs font-mono bg-blue-50 border border-blue-100 text-blue-700 px-2 py-0.5 rounded">
                          {result.match_info?.matched_email}
                        </code>
                        <button
                          onClick={() => safeMatchInfo?.matched_email && copyToClipboard(safeMatchInfo.matched_email, 'matched-email')}
                          className="p-1 rounded hover:bg-slate-100 transition-colors"
                        >
                          {copiedItem === 'matched-email' ? (
                            <Check className="w-3.5 h-3.5 text-emerald-500" />
                          ) : (
                            <Copy className="w-3.5 h-3.5 text-slate-300" />
                          )}
                        </button>
                      </div>
                    </div>
                    {result.agency.website_url && (
                      <div className="flex items-center justify-between">
                        <span className="text-xs text-slate-400">Website</span>
                        <a
                          href={result.agency.website_url.includes('://') ? result.agency.website_url : `https://${result.agency.website_url}`}
                          target="_blank"
                          rel="noopener noreferrer"
                          className="text-xs font-medium text-blue-600 hover:text-blue-700 flex items-center gap-1"
                        >
                          <Globe className="w-3 h-3" />
                          {result.agency.domain || result.agency.website_url}
                        </a>
                      </div>
                    )}
                    <div className="flex items-center justify-between">
                      <span className="text-xs text-slate-400">Identifiers</span>
                      <div className="flex items-center gap-1.5">
                        {result.agency.slug && (
                          <span className="text-[10px] font-mono bg-slate-50 border border-slate-100 text-slate-500 px-1.5 py-0.5 rounded">
                            {result.agency.slug}
                          </span>
                        )}
                        <span className="text-[10px] font-mono bg-slate-50 border border-slate-100 text-slate-500 px-1.5 py-0.5 rounded truncate max-w-[100px]" title={result.agency.id}>
                          {result.agency.id.slice(0, 8)}
                        </span>
                      </div>
                    </div>
                  </div>
                </div>

                {/* Block B — Commercial Status */}
                {result.commercial_status && (() => {
                  const cs = result.commercial_status!;

                  const sourceConfig: Record<string, { label: string; color: string; icon: React.ReactNode }> = {
                    stripe_confirmed:        { label: 'Stripe confirmed', color: 'text-emerald-700 bg-emerald-50 border-emerald-200', icon: <PackageCheck className="w-3 h-3" /> },
                    stripe_confirmed_top25:  { label: 'Stripe confirmed (Top 25)', color: 'text-emerald-700 bg-emerald-50 border-emerald-200', icon: <PackageCheck className="w-3 h-3" /> },
                    stripe_payment_exists:   { label: 'Payment exists (flag not set)', color: 'text-amber-700 bg-amber-50 border-amber-200', icon: <AlertTriangle className="w-3 h-3" /> },
                    listing_activated_only:  { label: 'Listing activated (no Stripe)', color: 'text-amber-700 bg-amber-50 border-amber-200', icon: <AlertTriangle className="w-3 h-3" /> },
                    webhook_set_no_order_match: { label: 'Webhook set — no order match', color: 'text-amber-700 bg-amber-50 border-amber-200', icon: <AlertTriangle className="w-3 h-3" /> },
                    manual_override:         { label: 'Manual override: Paid', color: 'text-blue-700 bg-blue-50 border-blue-200', icon: <Shield className="w-3 h-3" /> },
                    manual_override_free:    { label: 'Manual override: Free', color: 'text-blue-700 bg-blue-50 border-blue-200', icon: <Shield className="w-3 h-3" /> },
                    none:                    { label: 'Not paid', color: 'text-slate-500 bg-slate-50 border-slate-200', icon: <BadgeDollarSign className="w-3 h-3" /> },
                  };

                  const src = sourceConfig[cs.paid_source_reason] ?? sourceConfig.none;

                  const fmt = (iso: string | null) => {
                    if (!iso) return null;
                    return new Date(iso).toLocaleDateString('en-US', { month: 'short', day: 'numeric', year: 'numeric' });
                  };

                  return (
                    <div className="bg-white rounded-2xl border border-slate-200 shadow-sm overflow-hidden">
                      <div className="px-5 py-3.5 border-b border-slate-100">
                        <h3 className="text-xs font-semibold text-slate-500 uppercase tracking-wide flex items-center gap-2">
                          <CreditCard className="w-3 h-3" />
                          Commercial Status
                        </h3>
                      </div>
                      <div className="p-5 space-y-4">

                        {/* Overall paid verdict */}
                        <div className="flex items-center justify-between">
                          <span className="text-xs text-slate-400">Overall</span>
                          <span className={`inline-flex items-center gap-1.5 text-xs font-semibold px-2.5 py-1 rounded-full border ${src.color}`}>
                            {src.icon}
                            {cs.has_any_paid_product ? 'Paid' : 'Not paid'}
                          </span>
                        </div>

                        {/* Source reason */}
                        <div className="flex items-center justify-between">
                          <span className="text-xs text-slate-400">Source</span>
                          <span className={`inline-flex items-center gap-1.5 text-[11px] font-medium px-2 py-0.5 rounded border ${src.color}`}>
                            {src.icon}
                            {src.label}
                          </span>
                        </div>

                        {/* Key flags row */}
                        <div className="grid grid-cols-2 gap-2">
                          <div className="flex flex-col gap-1 bg-slate-50 rounded-lg px-3 py-2">
                            <span className="text-[10px] text-slate-400 uppercase tracking-wide">is_paid_listing</span>
                            <span className={`text-xs font-semibold ${cs.is_paid_listing ? 'text-emerald-600' : 'text-slate-400'}`}>
                              {cs.is_paid_listing ? 'true' : 'false'}
                            </span>
                          </div>
                          <div className="flex flex-col gap-1 bg-slate-50 rounded-lg px-3 py-2">
                            <span className="text-[10px] text-slate-400 uppercase tracking-wide">Stripe backed</span>
                            <span className={`text-xs font-semibold ${cs.stripe_backed ? 'text-emerald-600' : 'text-slate-400'}`}>
                              {cs.stripe_backed ? 'yes' : 'no'}
                            </span>
                          </div>
                        </div>

                        {/* Products */}
                        {cs.products.length > 0 && (
                          <div className="flex items-start justify-between gap-3">
                            <span className="text-xs text-slate-400 shrink-0">Products</span>
                            <div className="flex flex-wrap gap-1 justify-end">
                              {cs.products.map((p) => (
                                <span key={p} className="text-[10px] font-medium bg-emerald-50 text-emerald-700 border border-emerald-200 px-2 py-0.5 rounded-full">
                                  {p.replace(/_/g, ' ')}
                                </span>
                              ))}
                            </div>
                          </div>
                        )}

                        {/* Last paid event */}
                        {cs.last_paid_event_at && (
                          <div className="flex items-center justify-between">
                            <span className="text-xs text-slate-400">Last paid event</span>
                            <span className="text-xs font-medium text-slate-600">
                              {fmt(cs.last_paid_event_at)}
                            </span>
                          </div>
                        )}

                        {/* Manual override */}
                        {cs.manual_override_active && (
                          <div className="bg-blue-50 border border-blue-200 rounded-lg px-3 py-2.5 space-y-1">
                            <div className="flex items-center gap-1.5 text-[11px] font-semibold text-blue-700">
                              <Shield className="w-3 h-3" />
                              Manual override active
                            </div>
                            <div className="text-[11px] text-blue-600">
                              Value: <strong>{cs.manual_override_value === true ? 'Paid' : cs.manual_override_value === false ? 'Free' : 'null'}</strong>
                              {cs.manual_override_reason && <> &middot; {cs.manual_override_reason}</>}
                            </div>
                          </div>
                        )}

                        {/* Stripe orders */}
                        {cs.stripe_orders.length > 0 && (
                          <div className="space-y-1.5">
                            <p className="text-[10px] font-semibold text-slate-400 uppercase tracking-widest flex items-center gap-1.5">
                              <TrendingUp className="w-3 h-3" />
                              Stripe orders ({cs.stripe_orders.length})
                            </p>
                            {cs.stripe_orders.map((o, i) => (
                              <div key={i} className="bg-slate-50 border border-slate-100 rounded-lg px-3 py-2 flex items-center justify-between gap-2">
                                <div className="min-w-0">
                                  <p className="text-[11px] font-medium text-slate-700">
                                    {o.product_summary || o.source_listing_type || 'Payment'}
                                    {o.state_slug && <span className="text-slate-400 font-normal"> · {slugToStateName(o.state_slug)}</span>}
                                  </p>
                                  <p className="text-[10px] text-slate-400 mt-0.5">{fmt(o.paid_at)}</p>
                                </div>
                                {o.amount_total != null && (
                                  <span className="text-xs font-semibold text-emerald-700 shrink-0">
                                    {(o.amount_total / 100).toFixed(0)} {(o.currency || 'usd').toUpperCase()}
                                  </span>
                                )}
                              </div>
                            ))}
                          </div>
                        )}

                      </div>
                    </div>
                  );
                })()}

                {/* Linked Emails */}
                {result.linked_emails.length > 0 && (
                  <div className="bg-white rounded-2xl border border-slate-200 shadow-sm overflow-hidden">
                    <div className="px-5 py-3.5 border-b border-slate-100">
                      <h3 className="text-xs font-semibold text-slate-500 uppercase tracking-wide flex items-center gap-2">
                        <Mail className="w-3 h-3" />
                        Linked Emails ({result.linked_emails.length})
                      </h3>
                    </div>
                    <div className="divide-y divide-slate-50 max-h-56 overflow-y-auto">
                      {result.linked_emails.map((le) => (
                        <div key={le.id} className="px-5 py-3 flex items-center justify-between gap-2">
                          <div className="flex items-center gap-2 min-w-0">
                            {le.is_primary && (
                              <span className="w-1.5 h-1.5 bg-blue-500 rounded-full shrink-0" title="Primary email" />
                            )}
                            <span className="text-xs font-mono text-slate-700 truncate">{le.email_normalized}</span>
                          </div>
                          <div className="flex items-center gap-2 shrink-0">
                            <ValidationBadge status={le.validation_status} />
                            <button
                              onClick={() => copyToClipboard(le.email_normalized, `email-${le.id}`)}
                              className="p-1 rounded hover:bg-slate-100 transition-colors"
                            >
                              {copiedItem === `email-${le.id}` ? (
                                <Check className="w-3.5 h-3.5 text-emerald-500" />
                              ) : (
                                <Copy className="w-3.5 h-3.5 text-slate-300" />
                              )}
                            </button>
                          </div>
                        </div>
                      ))}
                    </div>
                  </div>
                )}

                {/* State Listings */}
                {result.listings.length > 0 && (
                  <div className="bg-white rounded-2xl border border-slate-200 shadow-sm overflow-hidden">
                    <div className="px-5 py-3.5 border-b border-slate-100">
                      <h3 className="text-xs font-semibold text-slate-500 uppercase tracking-wide flex items-center gap-2">
                        <MapPin className="w-3 h-3" />
                        State Listings ({result.listings.length})
                      </h3>
                    </div>
                    <div className="divide-y divide-slate-50 max-h-56 overflow-y-auto">
                      {result.listings.map((listing) => (
                        <div key={`${listing.state_slug}-${listing.section}`} className="px-5 py-3 flex items-center justify-between gap-2">
                          <div className="flex items-center gap-3 min-w-0">
                            <span className="text-sm font-medium text-slate-800">
                              {slugToStateName(listing.state_slug)}
                            </span>
                            <SectionBadge section={listing.section} rank={listing.rank} />
                          </div>
                          <a
                            href={listing.page_path}
                            target="_blank"
                            rel="noopener noreferrer"
                            className="flex items-center gap-1 text-xs text-blue-600 hover:text-blue-700 font-medium"
                          >
                            View
                            <ChevronRight className="w-3 h-3" />
                          </a>
                        </div>
                      ))}
                    </div>
                  </div>
                )}

                {/* Placement Controls */}
                {showcaseState !== null && (
                  <div className="bg-white rounded-2xl border border-slate-200 shadow-sm overflow-hidden">
                    <div className="px-5 py-3.5 border-b border-slate-100">
                      <h3 className="text-xs font-semibold text-slate-500 uppercase tracking-wide flex items-center gap-2">
                        <Layers className="w-3 h-3" />
                        Placement Controls
                      </h3>
                    </div>
                    <div className="p-5 space-y-4">

                      {/* Current status */}
                      <div className="flex items-center justify-between">
                        <span className="text-xs text-slate-400">Current status</span>
                        {showcaseState.pinned && showcaseState.position != null ? (
                          <span className="inline-flex items-center gap-1.5 text-xs font-semibold text-amber-700 bg-amber-50 border border-amber-200 rounded-full px-2.5 py-1">
                            <Pin className="w-3 h-3" />
                            Pinned at #{showcaseState.position}
                          </span>
                        ) : showcaseState.pinned ? (
                          <span className="inline-flex items-center gap-1.5 text-xs font-semibold text-blue-700 bg-blue-50 border border-blue-200 rounded-full px-2.5 py-1">
                            <Pin className="w-3 h-3" />
                            In showcase (no fixed position)
                          </span>
                        ) : (
                          <span className="inline-flex items-center gap-1.5 text-xs font-medium text-slate-500 bg-slate-50 border border-slate-200 rounded-full px-2.5 py-1">
                            <PinOff className="w-3 h-3" />
                            Not in showcase
                          </span>
                        )}
                      </div>

                      {/* Position input + pin button */}
                      <div className="space-y-2">
                        <label className="text-xs text-slate-500 font-medium">Target position</label>
                        <div className="flex items-center gap-2">
                          <input
                            type="number"
                            min={1}
                            value={posInput}
                            onChange={e => setPosInput(e.target.value)}
                            placeholder="e.g. 15"
                            className="w-24 border border-slate-200 rounded-lg px-3 py-2 text-sm font-mono text-slate-800 focus:outline-none focus:ring-2 focus:ring-slate-300 bg-white"
                          />
                          <button
                            onClick={handlePin}
                            disabled={placementLoading || !posInput}
                            className="inline-flex items-center gap-1.5 text-sm font-medium text-white bg-slate-800 hover:bg-slate-900 disabled:opacity-50 disabled:cursor-not-allowed px-4 py-2 rounded-lg transition-colors"
                          >
                            {placementLoading ? (
                              <Loader2 className="w-3.5 h-3.5 animate-spin" />
                            ) : (
                              <Pin className="w-3.5 h-3.5" />
                            )}
                            Pin to position
                          </button>
                        </div>
                        <p className="text-[11px] text-slate-400">
                          Positions 1–12 are first-page showcase. 13+ extend into ranked overflow.
                          Slots 1–12 use atomic displacement — existing occupant will be unset.
                        </p>
                      </div>

                      {/* Remove button */}
                      {showcaseState.pinned && (
                        <button
                          onClick={handleUnpin}
                          disabled={placementLoading}
                          className="inline-flex items-center gap-1.5 text-sm font-medium text-red-600 border border-red-200 hover:bg-red-50 disabled:opacity-50 disabled:cursor-not-allowed px-4 py-2 rounded-lg transition-colors"
                        >
                          {placementLoading ? (
                            <Loader2 className="w-3.5 h-3.5 animate-spin" />
                          ) : (
                            <PinOff className="w-3.5 h-3.5" />
                          )}
                          Remove from showcase
                        </button>
                      )}

                      {/* Feedback message */}
                      {placementMsg && (
                        <div className={`flex items-start gap-2 rounded-lg px-3 py-2.5 text-xs font-medium ${
                          placementMsg.type === 'success'
                            ? 'bg-emerald-50 border border-emerald-200 text-emerald-700'
                            : 'bg-red-50 border border-red-200 text-red-700'
                        }`}>
                          {placementMsg.type === 'success' ? (
                            <Check className="w-3.5 h-3.5 mt-0.5 shrink-0" />
                          ) : (
                            <AlertCircle className="w-3.5 h-3.5 mt-0.5 shrink-0" />
                          )}
                          {placementMsg.text}
                        </div>
                      )}

                      {/* No session warning */}
                      {!token && (
                        <div className="flex items-center gap-2 text-xs text-amber-600 bg-amber-50 border border-amber-200 rounded-lg px-3 py-2">
                          <AlertCircle className="w-3.5 h-3.5 shrink-0" />
                          Admin session required. Log in at /wp-admin to use placement controls.
                        </div>
                      )}
                    </div>
                  </div>
                )}

                {/* Alternative Matches */}
                {result.alternative_matches.length > 0 && (
                  <div className="bg-white rounded-2xl border border-amber-200 overflow-hidden shadow-sm">
                    <div className="px-5 py-3.5 border-b border-amber-100 bg-amber-50/40">
                      <h3 className="text-xs font-semibold text-amber-700 uppercase tracking-wide flex items-center gap-2">
                        <AlertCircle className="w-3 h-3" />
                        Alternative Matches ({result.alternative_matches.length})
                      </h3>
                    </div>
                    <div className="divide-y divide-slate-50 max-h-48 overflow-y-auto">
                      {result.alternative_matches.map((alt) => (
                        <div key={alt.agency_id} className="px-5 py-3">
                          <div className="flex items-center justify-between gap-2">
                            <div>
                              <p className="text-sm font-medium text-slate-800">{alt.agency_name}</p>
                              <p className="text-xs text-slate-400">
                                {slugToStateName(alt.state_slug)} &middot; {alt.agency_domain || 'no domain'}
                              </p>
                            </div>
                            <MatchTypeBadge type={alt.match_confidence} />
                          </div>
                        </div>
                      ))}
                    </div>
                  </div>
                )}
              </div>

              {/* MIDDLE — Reply & Follow-up */}
              <div className="space-y-4">
                <GroupLabel>What should I reply?</GroupLabel>

                {/* Reply Engine */}
                <div className="bg-white rounded-2xl border border-slate-200 shadow-sm overflow-hidden">
                  <div className="px-5 py-4 border-b border-slate-100">
                    <div className="flex items-start justify-between gap-3">
                      <div>
                        <h3 className="text-sm font-semibold text-slate-800 flex items-center gap-2">
                          <MessageSquare className="w-4 h-4 text-slate-400" />
                          Reply Engine
                        </h3>
                        <p className="text-xs text-slate-400 mt-0.5">Controlled variation — each copy is slightly different</p>
                      </div>
                      <button
                        onClick={handleRegenerate}
                        title="Regenerate variation"
                        className="flex items-center gap-1.5 text-xs font-medium text-slate-500 hover:text-slate-700 bg-slate-50 hover:bg-slate-100 border border-slate-200 px-3 py-1.5 rounded-lg transition-colors shrink-0"
                      >
                        <RefreshCw className="w-3 h-3" />
                        Regenerate
                      </button>
                    </div>
                  </div>

                  <div className="p-5">
                    <div className="bg-slate-50 border border-slate-100 rounded-xl p-4 mb-4">
                      <pre className="text-xs text-slate-600 whitespace-pre-wrap font-mono leading-relaxed">
                        {generatePlain(variationIndices)}
                      </pre>
                    </div>

                    <div className="space-y-2">
                      <p className="text-[10px] font-semibold text-slate-400 uppercase tracking-widest mb-2">Copy options</p>

                      {/* Primary: Smartlead HTML */}
                      <button
                        onClick={handleCopySmartlead}
                        className="w-full flex items-center justify-between gap-3 bg-slate-800 hover:bg-slate-900 text-white font-medium py-3 px-4 rounded-xl transition-all text-sm group"
                      >
                        <div className="flex items-center gap-3">
                          <Link2 className="w-4 h-4 shrink-0 text-white/60 group-hover:text-white/80 transition-colors" />
                          <div className="text-left">
                            <span className="block text-sm font-semibold">Copy for Smartlead</span>
                            <span className="block text-[10px] text-white/40 font-normal leading-tight">HTML — links are clickable · fresh variation each time</span>
                          </div>
                        </div>
                        {copiedItem === 'reply-rich' ? (
                          <Check className="w-4 h-4 shrink-0 text-emerald-400" />
                        ) : (
                          <Copy className="w-4 h-4 shrink-0 text-white/30" />
                        )}
                      </button>

                      {/* Secondary: Plain text */}
                      <button
                        onClick={handleCopyPlain}
                        className="w-full flex items-center justify-between gap-3 text-slate-600 bg-slate-50 hover:bg-slate-100 border border-slate-200 py-2.5 px-4 rounded-xl transition-all text-sm"
                      >
                        <div className="flex items-center gap-2">
                          <Type className="w-4 h-4 text-slate-300 shrink-0" />
                          <span>Copy Plain Text</span>
                        </div>
                        {copiedItem === 'reply-plain' ? (
                          <Check className="w-4 h-4 text-emerald-500 shrink-0" />
                        ) : (
                          <Copy className="w-4 h-4 text-slate-300 shrink-0" />
                        )}
                      </button>

                      <p className="text-[10px] text-slate-400 leading-relaxed pt-0.5">
                        Each copy rolls a fresh variation automatically. Use "Regenerate" to preview a different variation before copying.
                      </p>
                    </div>
                  </div>
                </div>

                {/* Recent reply context — Manage funnel history */}
                <SafeSection name="ManageHistorySection">
                  <ManageHistorySection
                    context={result.manage_funnel_context ?? null}
                    timeline={safeManageTimeline}
                  />
                </SafeSection>

                {/* Add New Request */}
                {safeAgency?.id && safeAgency?.state_slug && (
                  <CollapsibleSection title="Add New Request" icon={<PlusCircle className="w-3 h-3" />} defaultOpen={false}>
                    <SafeSection name="AddNewRequestPanel">
                      <AddNewRequestPanel
                        agencyId={safeAgency.id}
                        stateSlug={safeAgency.state_slug}
                        adminSecret={token ?? ''}
                      />
                    </SafeSection>
                  </CollapsibleSection>
                )}

                {/* Signals — collapsed by default */}
                <GroupLabel>Signals</GroupLabel>

                <CollapsibleSection title="Intent & Recovery Scoring" icon={<TrendingUp className="w-3 h-3" />}>
                  <SafeSection name="IntentSection">
                    <IntentSection scoring={result.intent_scoring ?? null} />
                  </SafeSection>
                </CollapsibleSection>

                <CollapsibleSection title="Profile Click History" icon={<Activity className="w-3 h-3" />}>
                  <SafeSection name="ProfileClicksSection">
                    <ProfileClicksSection clicks={result.profile_clicks ?? null} />
                  </SafeSection>
                </CollapsibleSection>
              </div>

              {/* RIGHT — Links & Actions */}
              <div className="space-y-4">
                <GroupLabel>Where should I send them?</GroupLabel>

                {/* Quick Actions */}
                <div className="bg-white rounded-2xl border border-slate-200 shadow-sm overflow-hidden">
                  <div className="px-5 py-3.5 border-b border-slate-100">
                    <h3 className="text-xs font-semibold text-slate-500 uppercase tracking-wide">Quick Actions</h3>
                  </div>
                  <div className="p-4 space-y-5">

                    {/* ── Basic Actions ── */}
                    <div>
                      <p className="text-[10px] font-semibold text-slate-400 uppercase tracking-widest mb-2.5 flex items-center gap-1.5">
                        <Link2 className="w-3 h-3" />
                        Basic Actions
                      </p>
                      <div className="space-y-2">
                        <div className="grid grid-cols-2 gap-2">
                          <button
                            onClick={() => safeAgency && copyToClipboard(safeAgency.name, 'action-name')}
                            className="flex items-center justify-center gap-2 text-sm font-medium text-slate-600 py-2.5 px-3 rounded-lg border border-slate-200 hover:bg-slate-50 transition-colors"
                          >
                            {copiedItem === 'action-name' ? (
                              <Check className="w-3.5 h-3.5 text-emerald-500" />
                            ) : (
                              <Copy className="w-3.5 h-3.5 text-slate-300" />
                            )}
                            Copy Name
                          </button>
                          <button
                            onClick={() => safeMatchInfo?.matched_email && copyToClipboard(safeMatchInfo.matched_email, 'action-email')}
                            className="flex items-center justify-center gap-2 text-sm font-medium text-slate-600 py-2.5 px-3 rounded-lg border border-slate-200 hover:bg-slate-50 transition-colors"
                          >
                            {copiedItem === 'action-email' ? (
                              <Check className="w-3.5 h-3.5 text-emerald-500" />
                            ) : (
                              <Mail className="w-3.5 h-3.5 text-slate-300" />
                            )}
                            Copy Email
                          </button>
                        </div>
                        <button
                          onClick={() => safeYourAgencyUrl && copyToClipboard(safeYourAgencyUrl, 'action-url')}
                          className="w-full flex items-center justify-center gap-2 text-sm font-medium text-slate-600 py-2.5 px-3 rounded-lg border border-slate-200 hover:bg-slate-50 transition-colors"
                        >
                          {copiedItem === 'action-url' ? (
                            <Check className="w-3.5 h-3.5 text-emerald-500" />
                          ) : (
                            <ExternalLink className="w-3.5 h-3.5 text-slate-300" />
                          )}
                          Copy Gappsy Profile URL
                        </button>
                        <button
                          onClick={() => safeYourAgencyUrl && copyRichToClipboard(
                            `<a href="${safeYourAgencyUrl}" target="_blank">View your profile here</a>`,
                            safeYourAgencyUrl,
                            'action-link-only'
                          )}
                          className="w-full flex items-center justify-center gap-2 text-sm font-medium text-blue-700 py-2.5 px-3 rounded-lg border border-blue-200 bg-blue-50 hover:bg-blue-100 transition-colors"
                        >
                          {copiedItem === 'action-link-only' ? (
                            <Check className="w-3.5 h-3.5 text-emerald-500" />
                          ) : (
                            <Link2 className="w-3.5 h-3.5 text-blue-400" />
                          )}
                          Copy Profile Link (Clickable)
                        </button>
                        {/* Agency Website */}
                        <div className="grid grid-cols-2 gap-2">
                          <button
                            onClick={() => resolvedWebsite && copyToClipboard(resolvedWebsite, 'action-website')}
                            disabled={!resolvedWebsite}
                            title={!resolvedWebsite ? 'No website found' : undefined}
                            className="flex items-center justify-center gap-2 text-sm font-medium text-slate-600 py-2.5 px-3 rounded-lg border border-slate-200 hover:bg-slate-50 transition-colors disabled:opacity-40 disabled:cursor-not-allowed"
                          >
                            {copiedItem === 'action-website' ? (
                              <Check className="w-3.5 h-3.5 text-emerald-500" />
                            ) : (
                              <Globe className="w-3.5 h-3.5 text-slate-300" />
                            )}
                            Copy Website
                          </button>
                          <a
                            href={resolvedWebsite ? (resolvedWebsite.includes('://') ? resolvedWebsite : `https://${resolvedWebsite}`) : '#'}
                            target="_blank"
                            rel="noopener noreferrer"
                            onClick={(e) => { if (!resolvedWebsite) e.preventDefault(); }}
                            className={`flex items-center justify-center gap-2 text-sm font-medium py-2.5 px-3 rounded-lg border transition-colors ${resolvedWebsite ? 'text-slate-600 border-slate-200 hover:bg-slate-50' : 'text-slate-300 border-slate-100 cursor-not-allowed pointer-events-none opacity-40'}`}
                          >
                            <ExternalLink className="w-3.5 h-3.5" />
                            Open Website
                          </a>
                        </div>
                        {resolvedWebsite ? (
                          <p className="text-[11px] font-mono text-slate-400 truncate pl-0.5">
                            {resolvedWebsite}
                            {websiteFromEmail && <span className="text-slate-300 font-normal"> · from email</span>}
                          </p>
                        ) : (
                          <p className="text-[11px] text-slate-400 italic pl-0.5">No website found for this agency</p>
                        )}
                      </div>
                    </div>

                    <div className="border-t border-slate-100" />

                    {/* ── Core Funnel Links ── */}
                    <div>
                      <p className="text-[10px] font-semibold text-slate-400 uppercase tracking-widest mb-2.5 flex items-center gap-1.5">
                        <Zap className="w-3 h-3" />
                        Core Funnel Links
                      </p>
                      <div className="space-y-2">
                        {([
                          { id: 'fl-your-agency', label: 'Your Agency Preview', hint: 'Profile page shown to agency owner', url: result.csv_links?.your_agency_url ?? null },
                          { id: 'fl-smart-next', label: 'Smart Continue Link', hint: 'Routes to best next step', url: result.csv_links?.smart_next_url ?? null },
                          { id: 'fl-replay', label: 'Request Replay', hint: 'Shows replayed client requests', url: result.csv_links?.request_replay_url_v2 ?? null },
                          { id: 'fl-compare', label: 'Request Compare', hint: 'Compare requests vs competitors', url: result.csv_links?.request_compare_url ?? null },
                          { id: 'fl-manage', label: 'Manage Listing / Removal', hint: 'Manage or remove their listing', url: result.csv_links?.manage_listing_url_v2 ?? null },
                        ] as const).map((row) => (
                          <div key={row.id} className="rounded-xl border border-slate-100 bg-slate-50/60 px-3 py-2.5">
                            <div className="flex items-start justify-between gap-2 mb-1.5">
                              <div className="min-w-0">
                                <p className="text-xs font-semibold text-slate-700 leading-tight">{row.label}</p>
                                <p className="text-[10px] text-slate-400 mt-0.5 leading-tight">{row.hint}</p>
                              </div>
                              <div className="flex items-center gap-1 shrink-0">
                                <button
                                  onClick={() => row.url && copyToClipboard(row.url, row.id)}
                                  disabled={!row.url}
                                  className="inline-flex items-center gap-1 text-[11px] font-medium text-slate-600 px-2 py-1 rounded-lg border border-slate-200 bg-white hover:bg-slate-50 transition-colors disabled:opacity-40 disabled:cursor-not-allowed"
                                >
                                  {copiedItem === row.id ? <Check className="w-3 h-3 text-emerald-500" /> : <Copy className="w-3 h-3 text-slate-400" />}
                                  Copy
                                </button>
                                <a
                                  href={row.url || undefined}
                                  target="_blank"
                                  rel="noopener noreferrer"
                                  onClick={(e) => { if (!row.url) e.preventDefault(); }}
                                  className={`inline-flex items-center gap-1 text-[11px] font-medium px-2 py-1 rounded-lg border transition-colors ${row.url ? 'text-blue-700 border-blue-200 bg-blue-50 hover:bg-blue-100' : 'text-slate-300 border-slate-200 opacity-40 cursor-not-allowed'}`}
                                >
                                  <ExternalLink className="w-3 h-3" />
                                  Open
                                </a>
                              </div>
                            </div>
                            {row.url ? (
                              <p className="text-[10px] font-mono text-slate-400 break-all leading-relaxed">{row.url}</p>
                            ) : (
                              <p className="text-[10px] text-slate-300 italic">Not available</p>
                            )}
                          </div>
                        ))}
                      </div>
                    </div>

                    <div className="border-t border-slate-100" />

                    {/* ── Activation Links ── */}
                    <div>
                      <p className="text-[10px] font-semibold text-slate-400 uppercase tracking-widest mb-2.5 flex items-center gap-1.5">
                        <Star className="w-3 h-3" />
                        Activation Links
                      </p>
                      {(() => {
                        const url = result.csv_links?.activation_direct_link ?? null;
                        return (
                          <div className="rounded-xl border border-slate-100 bg-slate-50/60 px-3 py-2.5">
                            <div className="flex items-start justify-between gap-2 mb-1.5">
                              <div className="min-w-0">
                                <p className="text-xs font-semibold text-slate-700 leading-tight">Activation Direct Link</p>
                                <p className="text-[10px] text-slate-400 mt-0.5 leading-tight">Opens activation / upgrade page</p>
                              </div>
                              <div className="flex items-center gap-1 shrink-0">
                                <button
                                  onClick={() => url && copyToClipboard(url, 'fl-activation-direct')}
                                  disabled={!url}
                                  className="inline-flex items-center gap-1 text-[11px] font-medium text-slate-600 px-2 py-1 rounded-lg border border-slate-200 bg-white hover:bg-slate-50 transition-colors disabled:opacity-40 disabled:cursor-not-allowed"
                                >
                                  {copiedItem === 'fl-activation-direct' ? <Check className="w-3 h-3 text-emerald-500" /> : <Copy className="w-3 h-3 text-slate-400" />}
                                  Copy
                                </button>
                                <a
                                  href={url || undefined}
                                  target="_blank"
                                  rel="noopener noreferrer"
                                  onClick={(e) => { if (!url) e.preventDefault(); }}
                                  className={`inline-flex items-center gap-1 text-[11px] font-medium px-2 py-1 rounded-lg border transition-colors ${url ? 'text-blue-700 border-blue-200 bg-blue-50 hover:bg-blue-100' : 'text-slate-300 border-slate-200 opacity-40 cursor-not-allowed'}`}
                                >
                                  <ExternalLink className="w-3 h-3" />
                                  Open
                                </a>
                              </div>
                            </div>
                            {url ? (
                              <p className="text-[10px] font-mono text-slate-400 break-all leading-relaxed">{url}</p>
                            ) : (
                              <p className="text-[10px] text-slate-300 italic">Not available</p>
                            )}
                          </div>
                        );
                      })()}
                    </div>

                    <div className="border-t border-slate-100" />

                    {/* ── Discount Links with Push Controls ── */}
                    <div>
                      <p className="text-[10px] font-semibold text-slate-400 uppercase tracking-widest mb-2.5 flex items-center gap-1.5">
                        <BadgeDollarSign className="w-3 h-3" />
                        Discount Links
                      </p>
                      <DiscountTierPushPanel
                        agencyId={safeAgency?.id ?? ''}
                        agencySlug={safeAgency?.slug ?? null}
                        stateSlug={safeListings[0]?.state_slug ?? safeAgency?.state_slug ?? ''}
                      />
                    </div>

                    {/* ── Admin Tools ── */}
                    <div className="border-t border-slate-100 pt-1 space-y-2">
                      <a
                        href="/wp-admin/analytics/agency-funnel"
                        target="_blank"
                        rel="noopener noreferrer"
                        className="w-full flex items-center justify-center gap-2 text-sm font-medium text-slate-500 py-2.5 px-3 rounded-lg border border-slate-200 hover:bg-slate-50 transition-colors"
                      >
                        <ExternalLink className="w-3.5 h-3.5 text-slate-300" />
                        Open Funnel Analytics
                      </a>
                      <a
                        href="/wp-admin/manage-removals"
                        target="_blank"
                        rel="noopener noreferrer"
                        className="w-full flex items-center justify-center gap-2 text-sm font-medium text-slate-500 py-2.5 px-3 rounded-lg border border-slate-200 hover:bg-slate-50 transition-colors"
                      >
                        <EyeOff className="w-3.5 h-3.5 text-slate-300" />
                        Manage Removals Dashboard
                      </a>
                    </div>

                  </div>
                </div>

                {/* Revenue actions */}
                <GroupLabel>Revenue actions</GroupLabel>

                {/* Discount Link Generator */}
                {safeAgency?.id && (
                  <SafeSection name="DiscountLinkPanel">
                    <DiscountLinkPanel
                      agencyId={safeAgency.id}
                      agencyName={safeAgency.name}
                      agencySlug={safeAgency.slug}
                      stateSlug={safeListings[0]?.state_slug ?? ''}
                      activationDirectLink={result.csv_links?.activation_direct_link ?? null}
                      tierUrl15={result.csv_links?.activation_discount_link_15 ?? null}
                      tierUrl20={result.csv_links?.activation_discount_link_20 ?? null}
                      tierUrl25={result.csv_links?.activation_discount_link_25 ?? null}
                    />
                  </SafeSection>
                )}

                {/* Active Discount Links Visibility */}
                {safeAgency?.id && (
                  <SafeSection name="ActiveDiscountLinksPanel">
                    <ActiveDiscountLinksPanel
                      agencyId={safeAgency.id}
                      agencySlug={safeAgency.slug ?? undefined}
                      stateSlug={safeListings[0]?.state_slug ?? ''}
                    />
                  </SafeSection>
                )}

                {/* Discount Funnel Activity Timeline */}
                {safeAgency?.id && (
                  <SafeSection name="DiscountFunnelActivityPanel">
                    <DiscountFunnelActivityPanel agencyId={safeAgency.id} />
                  </SafeSection>
                )}

                {/* Top 25 Upgrade Offer */}
                {safeAgency?.id && (
                  <SafeSection name="UpgradeOfferPanel">
                    <UpgradeOfferPanel
                      agencyId={safeAgency.id}
                      agencyName={safeAgency.name}
                      stateSlug={safeListings[0]?.state_slug ?? ''}
                    />
                  </SafeSection>
                )}

                {/* Smart Routing State */}
                {safeAgency?.id && safeMatchInfo?.lead_key && (
                  <SafeSection name="SmartRoutingPanel">
                    <SmartRoutingPanel
                      agencyId={safeAgency.id}
                      leadKey={safeMatchInfo.lead_key}
                    />
                  </SafeSection>
                )}

                {/* Performance — collapsed */}
                {result._timing && (
                  <CollapsibleSection title="Performance" icon={<Clock className="w-3 h-3" />}>
                    <div className="p-5 grid grid-cols-2 gap-3">
                      <div className="flex flex-col gap-1">
                        <span className="text-[10px] text-slate-400 uppercase tracking-wide">Client Total</span>
                        <span className="text-sm font-mono font-semibold text-slate-700">{clientMs}ms</span>
                      </div>
                      <div className="flex flex-col gap-1">
                        <span className="text-[10px] text-slate-400 uppercase tracking-wide">Server</span>
                        <span className="text-sm font-mono font-semibold text-slate-700">{result._timing.total_ms}ms</span>
                      </div>
                      {result._timing.exact_ms !== undefined && (
                        <div className="flex flex-col gap-1">
                          <span className="text-[10px] text-slate-400 uppercase tracking-wide">Email Match</span>
                          <span className="text-sm font-mono font-semibold text-slate-700">{result._timing.exact_ms}ms</span>
                        </div>
                      )}
                      {result._timing.domain_ms !== undefined && result._timing.domain_ms > 0 && (
                        <div className="flex flex-col gap-1">
                          <span className="text-[10px] text-slate-400 uppercase tracking-wide">Domain Fallback</span>
                          <span className="text-sm font-mono font-semibold text-slate-700">{result._timing.domain_ms}ms</span>
                        </div>
                      )}
                      {result._timing.parallel_ms !== undefined && (
                        <div className="flex flex-col gap-1">
                          <span className="text-[10px] text-slate-400 uppercase tracking-wide">Detail Queries</span>
                          <span className="text-sm font-mono font-semibold text-slate-700">{result._timing.parallel_ms}ms</span>
                        </div>
                      )}
                    </div>
                  </CollapsibleSection>
                )}
              </div>
            </div>

            {/* Agency Dossier: Basic Info — full-width row below the 3-column grid */}
            {safeAgency && (
              <CollapsibleSection title="Agency Identity" icon={<Shield className="w-3 h-3" />}>
                <SafeSection name="BasicInfoDossierSection">
                  <BasicInfoDossierSection
                    agency={safeAgency}
                    yourAgencyUrl={safeYourAgencyUrl}
                  />
                </SafeSection>
              </CollapsibleSection>
            )}
          </>
        )}

        {/* Empty State */}
        {!result && !error && !loading && (
          <div className="bg-white border border-slate-200 rounded-2xl p-10 text-center shadow-sm">
            <div className="w-14 h-14 bg-slate-50 border border-slate-100 rounded-2xl flex items-center justify-center mx-auto mb-4">
              <Search className="w-6 h-6 text-slate-300" />
            </div>
            <p className="font-semibold text-slate-700">Enter an email address to get started</p>
            <p className="text-sm text-slate-400 mt-1.5 max-w-sm mx-auto">
              Paste the responder's email from your Smartlead inbox to load their agency profile and generate a reply.
            </p>
          </div>
        )}
      </div>
    </WpAdminLayout>
  );
}
