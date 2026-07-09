import React, { useState, useMemo, useCallback, useRef, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import { Flame, Target, ShoppingCart, Zap, TrendingUp, ExternalLink, ChevronUp, ChevronDown, Copy, Check, Link2, Download, Loader } from 'lucide-react';
import { useAdminFetch } from '../../hooks/useAdminFetch';
import { adminFetch } from '../../utils/adminFetch';
import { AdminErrorBanner, AdminLoadingState } from './AdminErrorBanner';
import { trafficModeToApiParam, type TrafficMode } from '../admin/TrafficModeToggle';

// ── Outreach tracking (localStorage-backed, structured for future Supabase migration) ──
const OUTREACH_STORAGE_KEY = 'gappsy_funnel_outreach_contacted';

interface OutreachEntry {
  contacted_at: string;
}

function loadOutreachMap(): Map<string, OutreachEntry> {
  try {
    const raw = localStorage.getItem(OUTREACH_STORAGE_KEY);
    if (!raw) return new Map();
    const obj = JSON.parse(raw) as Record<string, OutreachEntry>;
    return new Map(Object.entries(obj));
  } catch {
    return new Map();
  }
}

function saveOutreachMap(map: Map<string, OutreachEntry>): void {
  try {
    const obj: Record<string, OutreachEntry> = {};
    for (const [k, v] of map) obj[k] = v;
    localStorage.setItem(OUTREACH_STORAGE_KEY, JSON.stringify(obj));
  } catch { /* noop */ }
}

function outreachKey(agency: { agency_id: string; state_slug: string }): string {
  return agency.agency_id || `slug:${agency.state_slug}`;
}

function useOutreachTracking() {
  const [contactedMap, setContactedMap] = useState<Map<string, OutreachEntry>>(loadOutreachMap);
  const [tick, setTick] = useState(0);

  useEffect(() => {
    const id = setInterval(() => setTick(t => t + 1), 30_000);
    return () => clearInterval(id);
  }, []);

  const isContacted = useCallback((agency: { agency_id: string; state_slug: string }) => {
    return contactedMap.has(outreachKey(agency));
  }, [contactedMap]);

  const getContactedAt = useCallback((agency: { agency_id: string; state_slug: string }): string | null => {
    const entry = contactedMap.get(outreachKey(agency));
    return entry?.contacted_at ?? null;
  }, [contactedMap, tick]);

  const toggleContacted = useCallback((agency: { agency_id: string; state_slug: string }) => {
    setContactedMap(prev => {
      const next = new Map(prev);
      const key = outreachKey(agency);
      if (next.has(key)) {
        next.delete(key);
      } else {
        next.set(key, { contacted_at: new Date().toISOString() });
      }
      saveOutreachMap(next);
      return next;
    });
  }, []);

  return { isContacted, getContactedAt, toggleContacted };
}

interface AgencyIntel {
  agency_id: string;
  agency_name: string;
  state_slug: string;
  activation_views: number;
  standard_selections: number;
  top25_upsell_views: number;
  top25_selections: number;
  top25_confirm_views: number;
  checkout_opens: number;
  purchases: number;
  last_activation_view: string | null;
  last_standard_selection: string | null;
  last_top25_upsell_view: string | null;
  last_top25_selection: string | null;
  last_top25_confirm_view: string | null;
  last_checkout_open: string | null;
  last_purchase: string | null;
  deepest_step: string;
  deepest_step_label: string;
  intent_level: string;
  is_paid: boolean;
  listing_status: string | null;
  last_selected_rank: string | null;
  last_selected_price: string | null;
  discount_token: string | null;
  discount_percent: string | null;
  last_checkout_product: string | null;
  offer_15_url: string | null;
}

interface ApiResponse {
  range: string;
  from: string | null;
  total_agencies: number;
  agencies: AgencyIntel[];
}

const RANGE_OPTIONS = [
  { value: '24h', label: '24h' },
  { value: '7d', label: '7d' },
  { value: '30d', label: '30d' },
  { value: '90d', label: '90d' },
];

type Section = 'activation' | 'standard' | 'top25_upsell' | 'top25_upgrade' | 'checkout';
type SortDirection = 'asc' | 'desc';

interface SortState {
  key: string | null;
  direction: SortDirection | null;
}

const INTENT_ORDER: Record<string, number> = {
  low: 0, medium: 1, medium_high: 2, high: 3, very_high: 4, purchased: 5,
};

const NUMBER_KEYS = new Set([
  'activation_views', 'standard_selections', 'top25_upsell_views',
  'top25_selections', 'checkout_opens', 'purchases',
]);

const DATE_KEYS = new Set([
  'last_activation_view', 'last_standard_selection', 'last_top25_upsell_view',
  'last_top25_selection', 'last_checkout_open', 'last_purchase', 'last_top25_confirm_view',
]);

const NUMERIC_STRING_KEYS = new Set(['last_selected_price', 'last_selected_rank']);

function compareValues(a: AgencyIntel, b: AgencyIntel, key: string, dir: SortDirection): number {
  const mult = dir === 'asc' ? 1 : -1;

  if (key === 'intent_level') {
    return mult * ((INTENT_ORDER[a.intent_level] ?? 0) - (INTENT_ORDER[b.intent_level] ?? 0));
  }
  if (key === 'checkout_bool') {
    return mult * ((a.checkout_opens > 0 ? 1 : 0) - (b.checkout_opens > 0 ? 1 : 0));
  }
  if (key === 'purchased_bool') {
    return mult * ((a.purchases > 0 ? 1 : 0) - (b.purchases > 0 ? 1 : 0));
  }
  if (key === 'top25_selected_bool') {
    return mult * ((a.top25_selections > 0 ? 1 : 0) - (b.top25_selections > 0 ? 1 : 0));
  }
  if (key === 'discount_bool') {
    return mult * ((a.discount_token ? 1 : 0) - (b.discount_token ? 1 : 0));
  }

  if (NUMBER_KEYS.has(key)) {
    const av = (a as unknown as Record<string, number>)[key] ?? 0;
    const bv = (b as unknown as Record<string, number>)[key] ?? 0;
    return mult * (av - bv);
  }

  if (DATE_KEYS.has(key)) {
    const av = (a as unknown as Record<string, string | null>)[key] ?? '';
    const bv = (b as unknown as Record<string, string | null>)[key] ?? '';
    return mult * av.localeCompare(bv);
  }

  if (NUMERIC_STRING_KEYS.has(key)) {
    const av = parseFloat((a as unknown as Record<string, string | null>)[key] ?? '') || 0;
    const bv = parseFloat((b as unknown as Record<string, string | null>)[key] ?? '') || 0;
    return mult * (av - bv);
  }

  // String comparison
  const av = ((a as unknown as Record<string, string | null>)[key] ?? '').toLowerCase();
  const bv = ((b as unknown as Record<string, string | null>)[key] ?? '').toLowerCase();
  return mult * av.localeCompare(bv);
}

function sortAgencies(agencies: AgencyIntel[], sort: SortState): AgencyIntel[] {
  if (!sort.key || !sort.direction) return agencies;
  return [...agencies].sort((a, b) => compareValues(a, b, sort.key!, sort.direction!));
}

function SortableHeader({
  label,
  sortKey,
  align,
  currentSort,
  onSort,
}: {
  label: string;
  sortKey: string;
  align?: 'right';
  currentSort: SortState;
  onSort: (key: string) => void;
}) {
  const isActive = currentSort.key === sortKey;
  return (
    <th
      className={`px-2 py-2 font-semibold text-slate-600 cursor-pointer select-none hover:text-slate-900 hover:bg-slate-50 transition-colors ${align === 'right' ? 'text-right' : 'text-left'}`}
      onClick={() => onSort(sortKey)}
    >
      <span className="inline-flex items-center gap-0.5">
        {label}
        {isActive && currentSort.direction === 'asc' && <ChevronUp className="w-3 h-3 text-slate-900" />}
        {isActive && currentSort.direction === 'desc' && <ChevronDown className="w-3 h-3 text-slate-900" />}
      </span>
    </th>
  );
}

function relativeTime(iso: string | null): string {
  if (!iso) return '-';
  const d = new Date(iso).getTime();
  if (!Number.isFinite(d)) return '-';
  const diff = Date.now() - d;
  if (diff < 60_000) return 'just now';
  if (diff < 3_600_000) return `${Math.floor(diff / 60_000)}m ago`;
  if (diff < 86_400_000) return `${Math.floor(diff / 3_600_000)}h ago`;
  return `${Math.floor(diff / 86_400_000)}d ago`;
}

function formatState(slug: string): string {
  if (!slug) return '-';
  return slug.split('-').map(w => w.charAt(0).toUpperCase() + w.slice(1)).join(' ');
}

function IntentBadge({ level }: { level: string }) {
  const styles: Record<string, { bg: string; text: string; label: string }> = {
    low: { bg: 'bg-slate-100', text: 'text-slate-600', label: 'Low' },
    medium: { bg: 'bg-amber-50', text: 'text-amber-700', label: 'Medium' },
    medium_high: { bg: 'bg-orange-50', text: 'text-orange-700', label: 'Med/High' },
    high: { bg: 'bg-rose-50', text: 'text-rose-700', label: 'High' },
    very_high: { bg: 'bg-red-50', text: 'text-red-800', label: 'Very High' },
    purchased: { bg: 'bg-emerald-50', text: 'text-emerald-700', label: 'Purchased' },
  };
  const s = styles[level] ?? styles.low;
  return (
    <span className={`inline-flex items-center px-1.5 py-0.5 rounded text-[10px] font-semibold ${s.bg} ${s.text}`}>
      {s.label}
    </span>
  );
}

function RepeatBadge({ count, label }: { count: number; label?: string }) {
  if (count < 2) return null;
  const isHot = count >= 5;
  return (
    <span className={`inline-flex items-center gap-0.5 px-1.5 py-0.5 rounded text-[10px] font-semibold ${isHot ? 'bg-red-50 text-red-700' : 'bg-blue-50 text-blue-700'}`}>
      {isHot && <Flame className="w-2.5 h-2.5" />}
      {label ?? `${count}x`}
    </span>
  );
}

function outreachRelativeTime(iso: string | null): string {
  if (!iso) return '';
  const d = new Date(iso).getTime();
  if (!Number.isFinite(d)) return '';
  const diff = Date.now() - d;
  if (diff < 60_000) return 'just now';
  if (diff < 3_600_000) return `${Math.floor(diff / 60_000)}m ago`;
  if (diff < 86_400_000) return `${Math.floor(diff / 3_600_000)}h ago`;
  return `${Math.floor(diff / 86_400_000)}d ago`;
}

function OutreachCheckbox({ contacted, contactedAt, onToggle }: { contacted: boolean; contactedAt: string | null; onToggle: () => void }) {
  const timeLabel = contacted ? outreachRelativeTime(contactedAt) : '';
  return (
    <label className="inline-flex items-center gap-1 cursor-pointer select-none whitespace-nowrap">
      <input
        type="checkbox"
        checked={contacted}
        onChange={onToggle}
        className="w-3.5 h-3.5 rounded border-slate-300 text-emerald-600 focus:ring-emerald-500 cursor-pointer"
      />
      {contacted && (
        <span className="text-[9px] font-medium text-emerald-700">
          {timeLabel}
        </span>
      )}
    </label>
  );
}

function AgencyLink({ agency }: { agency: AgencyIntel; navigate?: (path: string) => void }) {
  return (
    <a
      href={`/wp-admin/email/agency-lookup?agency_id=${agency.agency_id}`}
      target="_blank"
      rel="noopener noreferrer"
      className="text-left text-blue-700 hover:text-blue-900 hover:underline font-medium text-sm truncate max-w-[180px] block"
      title={agency.agency_name}
    >
      {agency.agency_name}
    </a>
  );
}

function OpenAdminBtn({ agency }: { agency: AgencyIntel; navigate?: (path: string) => void }) {
  return (
    <a
      href={`/wp-admin/email/agency-lookup?agency_id=${agency.agency_id}`}
      target="_blank"
      rel="noopener noreferrer"
      className="inline-flex items-center gap-1 text-[11px] border border-slate-300 rounded px-1.5 py-0.5 hover:bg-slate-50 text-slate-600"
    >
      <ExternalLink className="w-3 h-3" /> Admin
    </a>
  );
}

function CopyDiscountBtn({ url, agencyId, stateSlug }: { url: string | null; agencyId: string; stateSlug: string }) {
  const [state, setState] = useState<'idle' | 'loading' | 'copied'>('idle');
  const [resolvedUrl, setResolvedUrl] = useState(url);
  const timeoutRef = useRef<ReturnType<typeof setTimeout>>();

  const copyToClipboard = (link: string) => {
    navigator.clipboard.writeText(link).then(() => {
      setState('copied');
      if (timeoutRef.current) clearTimeout(timeoutRef.current);
      timeoutRef.current = setTimeout(() => setState('idle'), 1500);
    });
  };

  const handleClick = async () => {
    if (resolvedUrl) {
      copyToClipboard(resolvedUrl);
      return;
    }

    setState('loading');
    try {
      const { adminApiFetch } = await import('../../lib/adminApiFetch');
      const result = await adminApiFetch<{ ok: boolean; offers: { discount_value: number; url: string }[] }>(
        'discount-offers-ensure-tiers',
        { method: 'POST', body: { agency_id: agencyId, state_slug: stateSlug || null } }
      );
      if (result.ok && result.data?.offers) {
        const tier15 = result.data.offers.find(o => o.discount_value === 15);
        if (tier15?.url) {
          const fullUrl = `https://www.gappsy.com${tier15.url}`;
          setResolvedUrl(fullUrl);
          copyToClipboard(fullUrl);
          return;
        }
      }
      setState('idle');
    } catch {
      setState('idle');
    }
  };

  if (state === 'copied') {
    return (
      <span className="inline-flex items-center gap-0.5 text-[10px] font-medium text-emerald-700 px-1.5 py-0.5">
        <Check className="w-3 h-3" /> Copied
      </span>
    );
  }

  if (state === 'loading') {
    return (
      <span className="inline-flex items-center gap-0.5 text-[10px] text-slate-500 px-1.5 py-0.5 animate-pulse">
        Loading...
      </span>
    );
  }

  return (
    <button
      onClick={handleClick}
      className="inline-flex items-center gap-0.5 text-[10px] font-medium border border-slate-300 rounded px-1.5 py-0.5 hover:bg-slate-50 hover:border-slate-400 text-slate-700 transition-colors cursor-pointer"
      title={resolvedUrl || 'Click to generate & copy 15% discount link'}
    >
      <Copy className="w-3 h-3" /> 15%
    </button>
  );
}

function CopyOfferLinkBtn({ url, agencyId, stateSlug, agencyName }: { url: string | null; agencyId: string; stateSlug: string; agencyName: string }) {
  const [state, setState] = useState<'idle' | 'loading' | 'copied'>('idle');
  const [resolvedUrl, setResolvedUrl] = useState(url);
  const timeoutRef = useRef<ReturnType<typeof setTimeout>>();

  const copyToClipboard = (link: string) => {
    const text = `${agencyName} ${link}`;
    navigator.clipboard.writeText(text).then(() => {
      setState('copied');
      if (timeoutRef.current) clearTimeout(timeoutRef.current);
      timeoutRef.current = setTimeout(() => setState('idle'), 1500);
    });
  };

  const handleClick = async () => {
    if (resolvedUrl) {
      copyToClipboard(resolvedUrl);
      return;
    }

    setState('loading');
    try {
      const { adminApiFetch } = await import('../../lib/adminApiFetch');
      const result = await adminApiFetch<{ ok: boolean; offers: { discount_value: number; url: string }[] }>(
        'discount-offers-ensure-tiers',
        { method: 'POST', body: { agency_id: agencyId, state_slug: stateSlug || null } }
      );
      if (result.ok && result.data?.offers) {
        const tier15 = result.data.offers.find(o => o.discount_value === 15);
        if (tier15?.url) {
          const fullUrl = `https://www.gappsy.com${tier15.url}`;
          setResolvedUrl(fullUrl);
          copyToClipboard(fullUrl);
          return;
        }
      }
      setState('idle');
    } catch {
      setState('idle');
    }
  };

  if (state === 'copied') {
    return (
      <span className="inline-flex items-center gap-0.5 text-[10px] font-medium text-emerald-700 px-1.5 py-0.5">
        <Check className="w-3 h-3" /> Copied
      </span>
    );
  }

  if (state === 'loading') {
    return (
      <span className="inline-flex items-center gap-0.5 text-[10px] text-slate-500 px-1.5 py-0.5 animate-pulse">
        Loading...
      </span>
    );
  }

  if (!url) {
    return <span className="text-[10px] text-slate-400">No offer</span>;
  }

  return (
    <button
      onClick={handleClick}
      className="inline-flex items-center gap-0.5 text-[10px] font-medium border border-slate-300 rounded px-1.5 py-0.5 hover:bg-slate-50 hover:border-slate-400 text-slate-700 transition-colors cursor-pointer"
      title={`Copy: ${agencyName} ${resolvedUrl || url}`}
    >
      <Link2 className="w-3 h-3" /> Offer
    </button>
  );
}

function SectionHeader({ icon, title, count, visibleCount }: { icon: React.ReactNode; title: string; count: number; visibleCount?: number }) {
  return (
    <div className="flex items-center gap-2 mb-2">
      {icon}
      <h3 className="text-sm font-semibold text-slate-900">{title}</h3>
      <span className="text-xs text-slate-500 ml-auto">
        {count} agencies{visibleCount != null && visibleCount < count && ` · showing ${visibleCount}`}
      </span>
    </div>
  );
}

const DEFAULT_SORTS: Record<Section, SortState> = {
  activation: { key: null, direction: null },
  standard: { key: null, direction: null },
  top25_upsell: { key: null, direction: null },
  top25_upgrade: { key: null, direction: null },
  checkout: { key: null, direction: null },
};

interface FunnelIntelligencePanelProps {
  trafficMode?: TrafficMode;
}

export default function FunnelIntelligencePanel({ trafficMode = 'all' }: FunnelIntelligencePanelProps) {
  const navigate = useNavigate();
  const [range, setRange] = useState('30d');
  const [activeSection, setActiveSection] = useState<Section>('activation');
  const [sortStates, setSortStates] = useState<Record<Section, SortState>>({ ...DEFAULT_SORTS });
  const { isContacted, getContactedAt, toggleContacted } = useOutreachTracking();

  const currentSort = sortStates[activeSection];

  const handleSort = useCallback((key: string) => {
    setSortStates(prev => {
      const current = prev[activeSection];
      let next: SortState;
      if (current.key !== key) {
        next = { key, direction: 'desc' };
      } else if (current.direction === 'desc') {
        next = { key, direction: 'asc' };
      } else {
        next = { key: null, direction: null };
      }
      return { ...prev, [activeSection]: next };
    });
  }, [activeSection]);

  const [selectedIds, setSelectedIds] = useState<Set<string>>(new Set());
  const [exportDiscountMode, setExportDiscountMode] = useState<'none' | 'existing' | 'auto_create'>('existing');
  const [exporting, setExporting] = useState(false);
  const [exportError, setExportError] = useState('');

  const functionPath = useMemo(() => {
    const tmParam = trafficModeToApiParam(trafficMode);
    const base = `wpadmin-funnel-intelligence?range=${range}`;
    return tmParam ? `${base}&confidence_filter=${tmParam}` : base;
  }, [range, trafficMode]);

  const { data, isLoading, isError, error, refetch } = useAdminFetch<ApiResponse>(functionPath, {
    deps: [range, trafficMode],
  });

  const sections = useMemo(() => {
    if (!data?.agencies) return { activation: [], standard: [], top25_upsell: [], top25_upgrade: [], checkout: [] };

    const all = data.agencies;

    const activation = all
      .filter(a => a.activation_views > 0 && !a.is_paid)
      .sort((a, b) => b.activation_views - a.activation_views || (b.last_activation_view ?? '').localeCompare(a.last_activation_view ?? ''));

    const standard = all
      .filter(a => a.standard_selections > 0)
      .sort((a, b) => (b.last_standard_selection ?? '').localeCompare(a.last_standard_selection ?? ''));

    const top25_upsell = all
      .filter(a => a.top25_upsell_views > 0)
      .sort((a, b) => (b.last_top25_upsell_view ?? '').localeCompare(a.last_top25_upsell_view ?? ''));

    const top25_upgrade = all
      .filter(a => a.top25_selections > 0)
      .sort((a, b) => (b.last_top25_selection ?? '').localeCompare(a.last_top25_selection ?? '') || b.top25_selections - a.top25_selections);

    const checkout = all
      .filter(a => a.checkout_opens > 0)
      .sort((a, b) => b.checkout_opens - a.checkout_opens || (b.last_checkout_open ?? '').localeCompare(a.last_checkout_open ?? ''));

    return { activation, standard, top25_upsell, top25_upgrade, checkout };
  }, [data]);

  const sortedRows = useMemo(() => {
    const base = sections[activeSection];
    if (!currentSort.key || !currentSort.direction) return base;
    return sortAgencies(base, currentSort);
  }, [sections, activeSection, currentSort]);

  const activationVisibleIds = useMemo(() => {
    if (activeSection !== 'activation') return new Set<string>();
    return new Set(sortedRows.map(a => a.agency_id).filter(Boolean));
  }, [activeSection, sortedRows]);

  useEffect(() => {
    setSelectedIds(prev => {
      const intersected = new Set([...prev].filter(id => activationVisibleIds.has(id)));
      return intersected.size === prev.size ? prev : intersected;
    });
  }, [activationVisibleIds]);

  const handleSelectAll = useCallback((checked: boolean) => {
    setSelectedIds(checked ? new Set(activationVisibleIds) : new Set());
  }, [activationVisibleIds]);

  const handleToggleId = useCallback((id: string) => {
    setSelectedIds(prev => {
      const next = new Set(prev);
      if (next.has(id)) next.delete(id); else next.add(id);
      return next;
    });
  }, []);

  const handleExportCsv = useCallback(async () => {
    if (selectedIds.size === 0) return;
    setExporting(true);
    setExportError('');
    try {
      const params = new URLSearchParams();
      params.set('agency_ids', Array.from(selectedIds).join(','));
      params.set('send_mode', 'one_per_agency');
      if (exportDiscountMode !== 'none') params.set('discount_link_mode', exportDiscountMode);
      const res = await adminFetch(`smartlead-export-eligible-contacts?${params}`);
      if (!res.ok) {
        const d = await res.json().catch(() => ({}));
        throw new Error(d?.message || d?.error || `HTTP ${res.status}`);
      }
      const blob = await res.blob();
      const u = window.URL.createObjectURL(blob);
      const a = document.createElement('a');
      a.href = u;
      a.download = `high-intent-activation-export-${new Date().toISOString().split('T')[0]}.csv`;
      document.body.appendChild(a);
      a.click();
      a.remove();
      setTimeout(() => window.URL.revokeObjectURL(u), 5000);
    } catch (err) {
      setExportError(err instanceof Error ? err.message : 'Export failed');
    } finally {
      setExporting(false);
    }
  }, [selectedIds, exportDiscountMode]);

  const tabs: { key: Section; label: string; count: number; icon: React.ReactNode }[] = [
    { key: 'activation', label: 'Activation Visitors', count: sections.activation.length, icon: <Zap className="w-3.5 h-3.5 text-orange-600" /> },
    { key: 'standard', label: 'Standard Interest', count: sections.standard.length, icon: <Target className="w-3.5 h-3.5 text-blue-600" /> },
    { key: 'top25_upsell', label: 'Top-25 Upsell', count: sections.top25_upsell.length, icon: <TrendingUp className="w-3.5 h-3.5 text-rose-600" /> },
    { key: 'top25_upgrade', label: 'Top-25 Upgrade', count: sections.top25_upgrade.length, icon: <Flame className="w-3.5 h-3.5 text-red-600" /> },
    { key: 'checkout', label: 'Checkout Visitors', count: sections.checkout.length, icon: <ShoppingCart className="w-3.5 h-3.5 text-emerald-600" /> },
  ];

  return (
    <section className="bg-white border border-slate-200 rounded-lg mb-6">
      <div className="px-4 py-3 border-b border-slate-200">
        <div className="flex items-center justify-between flex-wrap gap-2">
          <div className="flex items-center gap-2">
            <Flame className="w-4 h-4 text-rose-600" />
            <h2 className="text-sm font-semibold text-slate-900">High-Intent Funnel Intelligence</h2>
            {trafficMode !== 'all' && (
              <span className={`text-xs font-medium px-2 py-0.5 rounded-full ${trafficMode === 'verified_only' ? 'bg-emerald-100 text-emerald-700' : 'bg-amber-100 text-amber-700'}`}>
                {trafficMode === 'verified_only' ? 'Verified Human' : 'Likely Human'}
              </span>
            )}
          </div>
          <div className="flex items-center gap-2">
            <div className="flex rounded-md border border-slate-300 overflow-hidden">
              {RANGE_OPTIONS.map(opt => (
                <button
                  key={opt.value}
                  onClick={() => setRange(opt.value)}
                  className={`px-2.5 py-1 text-xs font-medium ${range === opt.value ? 'bg-slate-900 text-white' : 'bg-white text-slate-600 hover:bg-slate-50'}`}
                >
                  {opt.label}
                </button>
              ))}
            </div>
            <button onClick={() => refetch()} className="text-xs border border-slate-300 rounded px-2 py-1 hover:bg-slate-50 text-slate-600">Refresh</button>
          </div>
        </div>

        <div className="flex gap-1 mt-3 overflow-x-auto">
          {tabs.map(tab => (
            <button
              key={tab.key}
              onClick={() => setActiveSection(tab.key)}
              className={`flex items-center gap-1.5 px-3 py-1.5 rounded-md text-xs font-medium whitespace-nowrap transition-colors ${
                activeSection === tab.key
                  ? 'bg-slate-900 text-white'
                  : 'bg-slate-100 text-slate-700 hover:bg-slate-200'
              }`}
            >
              {tab.icon}
              {tab.label}
              <span className={`ml-1 px-1.5 rounded-full text-[10px] ${activeSection === tab.key ? 'bg-white/20 text-white' : 'bg-slate-200 text-slate-600'}`}>
                {tab.count}
              </span>
            </button>
          ))}
        </div>
      </div>

      <div className="p-4">
        {isLoading && <AdminLoadingState message="Loading funnel intelligence..." />}
        {isError && error && <AdminErrorBanner error={error} onRetry={refetch} />}

        {!isLoading && !isError && activeSection === 'activation' && (
          <ActivationTable
            agencies={sortedRows}
            navigate={navigate}
            sort={currentSort}
            onSort={handleSort}
            isContacted={isContacted}
            getContactedAt={getContactedAt}
            toggleContacted={toggleContacted}
            selectedIds={selectedIds}
            selectableIds={activationVisibleIds}
            onSelectAll={handleSelectAll}
            onToggleId={handleToggleId}
            exportDiscountMode={exportDiscountMode}
            onExportDiscountModeChange={setExportDiscountMode}
            onExportCsv={handleExportCsv}
            exporting={exporting}
            exportError={exportError}
          />
        )}
        {!isLoading && !isError && activeSection === 'standard' && (
          <StandardTable agencies={sortedRows} navigate={navigate} sort={currentSort} onSort={handleSort} isContacted={isContacted} getContactedAt={getContactedAt} toggleContacted={toggleContacted} />
        )}
        {!isLoading && !isError && activeSection === 'top25_upsell' && (
          <Top25UpsellTable agencies={sortedRows} navigate={navigate} sort={currentSort} onSort={handleSort} isContacted={isContacted} getContactedAt={getContactedAt} toggleContacted={toggleContacted} />
        )}
        {!isLoading && !isError && activeSection === 'top25_upgrade' && (
          <Top25UpgradeTable agencies={sortedRows} navigate={navigate} sort={currentSort} onSort={handleSort} isContacted={isContacted} getContactedAt={getContactedAt} toggleContacted={toggleContacted} />
        )}
        {!isLoading && !isError && activeSection === 'checkout' && (
          <CheckoutTable agencies={sortedRows} navigate={navigate} sort={currentSort} onSort={handleSort} isContacted={isContacted} getContactedAt={getContactedAt} toggleContacted={toggleContacted} />
        )}
      </div>
    </section>
  );
}

interface TableProps {
  agencies: AgencyIntel[];
  navigate: (p: string) => void;
  sort: SortState;
  onSort: (key: string) => void;
  isContacted: (agency: { agency_id: string; state_slug: string }) => boolean;
  getContactedAt: (agency: { agency_id: string; state_slug: string }) => string | null;
  toggleContacted: (agency: { agency_id: string; state_slug: string }) => void;
}

interface ActivationTableProps extends TableProps {
  selectedIds: Set<string>;
  selectableIds: Set<string>;
  onSelectAll: (checked: boolean) => void;
  onToggleId: (id: string) => void;
  exportDiscountMode: 'none' | 'existing' | 'auto_create';
  onExportDiscountModeChange: (mode: 'none' | 'existing' | 'auto_create') => void;
  onExportCsv: () => void;
  exporting: boolean;
  exportError: string;
}

function ActivationTable({ agencies, navigate, sort, onSort, isContacted, getContactedAt, toggleContacted, selectedIds, selectableIds, onSelectAll, onToggleId, exportDiscountMode, onExportDiscountModeChange, onExportCsv, exporting, exportError }: ActivationTableProps) {
  if (agencies.length === 0) return <p className="text-sm text-slate-500">No activation visitors in this timeframe.</p>;
  const allSelected = selectedIds.size > 0 && selectedIds.size === selectableIds.size;
  return (
    <>
      <div className="flex items-center justify-between flex-wrap gap-2 mb-2">
        <SectionHeader icon={<Zap className="w-4 h-4 text-orange-600" />} title="High-Intent Activation Visitors" count={agencies.length} />
        <div className="flex items-center gap-2 flex-wrap">
          <select
            value={exportDiscountMode}
            onChange={(e) => onExportDiscountModeChange(e.target.value as 'none' | 'existing' | 'auto_create')}
            className="text-[11px] border border-slate-300 rounded px-2 py-1 focus:outline-none focus:ring-1 focus:ring-blue-500"
          >
            <option value="none">No discount links</option>
            <option value="existing">Existing offers only</option>
            <option value="auto_create">Auto-create 15/20/25%</option>
          </select>
          <button
            onClick={onExportCsv}
            disabled={selectedIds.size === 0 || exporting}
            className="inline-flex items-center gap-1.5 text-[11px] font-medium border border-slate-300 rounded px-2 py-1 hover:bg-slate-50 disabled:opacity-40 disabled:cursor-not-allowed"
          >
            {exporting ? <Loader className="w-3 h-3 animate-spin" /> : <Download className="w-3 h-3" />}
            Export selected ({selectedIds.size})
          </button>
        </div>
      </div>
      {exportDiscountMode === 'auto_create' && (
        <div className="mb-2 px-3 py-1.5 bg-amber-50 border border-amber-100 rounded text-[10px] text-amber-700">
          Auto-create will create unique single-use 15/20/25% activation discount links for selected agencies that do not already have them.
        </div>
      )}
      {exportError && (
        <div className="mb-2 px-3 py-1.5 bg-red-50 border border-red-100 rounded text-xs text-red-700">{exportError}</div>
      )}
      <div className="overflow-x-auto">
        <table className="w-full text-xs">
          <thead>
            <tr className="border-b border-slate-200">
              <th className="px-2 py-2 w-7">
                <input
                  type="checkbox"
                  checked={allSelected}
                  disabled={selectableIds.size === 0}
                  onChange={(e) => onSelectAll(e.target.checked)}
                  className="rounded border-slate-300"
                  title="Select all"
                />
              </th>
              <SortableHeader label="Agency" sortKey="agency_name" currentSort={sort} onSort={onSort} />
              <SortableHeader label="State" sortKey="state_slug" currentSort={sort} onSort={onSort} />
              <SortableHeader label="Views" sortKey="activation_views" align="right" currentSort={sort} onSort={onSort} />
              <SortableHeader label="Last visit" sortKey="last_activation_view" currentSort={sort} onSort={onSort} />
              <SortableHeader label="Deepest step" sortKey="deepest_step_label" currentSort={sort} onSort={onSort} />
              <SortableHeader label="Intent" sortKey="intent_level" currentSort={sort} onSort={onSort} />
              <th className="px-2 py-2 font-semibold text-slate-600">Repeat</th>
              <SortableHeader label="Status" sortKey="listing_status" currentSort={sort} onSort={onSort} />
              <th className="px-2 py-2 font-semibold text-slate-600">Discount</th>
              <th className="px-2 py-2 font-semibold text-slate-600">Offer Link</th>
              <th className="px-2 py-2 font-semibold text-slate-600">Outreach</th>
              <th className="px-2 py-2"></th>
            </tr>
          </thead>
          <tbody>
            {agencies.map(a => {
              const contacted = isContacted(a);
              return (
              <tr key={a.agency_id} className={`border-b border-slate-100 ${contacted ? 'bg-emerald-50/60 hover:bg-emerald-100/50' : 'hover:bg-slate-50/50'}`}>
                <td className="px-2 py-1.5">
                  <input
                    type="checkbox"
                    checked={selectedIds.has(a.agency_id)}
                    onChange={() => onToggleId(a.agency_id)}
                    className="rounded border-slate-300"
                  />
                </td>
                <td className="px-2 py-1.5"><AgencyLink agency={a} navigate={navigate} /></td>
                <td className="px-2 py-1.5 text-slate-600">{formatState(a.state_slug)}</td>
                <td className="px-2 py-1.5 text-right font-semibold text-slate-900">{a.activation_views}</td>
                <td className="px-2 py-1.5 text-slate-600">{relativeTime(a.last_activation_view)}</td>
                <td className="px-2 py-1.5 text-slate-700">{a.deepest_step_label}</td>
                <td className="px-2 py-1.5"><IntentBadge level={a.intent_level} /></td>
                <td className="px-2 py-1.5">
                  <RepeatBadge count={a.activation_views} label={a.activation_views >= 5 ? 'Hot Lead' : `Returned ${a.activation_views}x`} />
                </td>
                <td className="px-2 py-1.5 text-slate-500">{a.listing_status ?? '-'}</td>
                <td className="px-2 py-1.5"><CopyDiscountBtn url={a.offer_15_url} agencyId={a.agency_id} stateSlug={a.state_slug} /></td>
                <td className="px-2 py-1.5"><CopyOfferLinkBtn url={a.offer_15_url} agencyId={a.agency_id} stateSlug={a.state_slug} agencyName={a.agency_name} /></td>
                <td className="px-2 py-1.5"><OutreachCheckbox contacted={contacted} contactedAt={getContactedAt(a)} onToggle={() => toggleContacted(a)} /></td>
                <td className="px-2 py-1.5"><OpenAdminBtn agency={a} navigate={navigate} /></td>
              </tr>
              );
            })}
          </tbody>
        </table>
      </div>
    </>
  );
}

function StandardTable({ agencies, navigate, sort, onSort, isContacted, getContactedAt, toggleContacted }: TableProps) {
  if (agencies.length === 0) return <p className="text-sm text-slate-500">No standard listing selections in this timeframe.</p>;
  return (
    <>
      <SectionHeader icon={<Target className="w-4 h-4 text-blue-600" />} title="Standard Listing Interest" count={agencies.length} />
      <div className="overflow-x-auto">
        <table className="w-full text-xs">
          <thead>
            <tr className="border-b border-slate-200">
              <SortableHeader label="Agency" sortKey="agency_name" currentSort={sort} onSort={onSort} />
              <SortableHeader label="State" sortKey="state_slug" currentSort={sort} onSort={onSort} />
              <SortableHeader label="Selections" sortKey="standard_selections" align="right" currentSort={sort} onSort={onSort} />
              <SortableHeader label="Last selected" sortKey="last_standard_selection" currentSort={sort} onSort={onSort} />
              <SortableHeader label="Checkout?" sortKey="checkout_bool" currentSort={sort} onSort={onSort} />
              <SortableHeader label="Purchased?" sortKey="purchased_bool" currentSort={sort} onSort={onSort} />
              <SortableHeader label="Deepest step" sortKey="deepest_step_label" currentSort={sort} onSort={onSort} />
              <th className="px-2 py-2 font-semibold text-slate-600">Discount</th>
              <th className="px-2 py-2 font-semibold text-slate-600">Offer Link</th>
              <th className="px-2 py-2 font-semibold text-slate-600">Outreach</th>
              <th className="px-2 py-2"></th>
            </tr>
          </thead>
          <tbody>
            {agencies.slice(0, 50).map(a => {
              const contacted = isContacted(a);
              return (
              <tr key={a.agency_id} className={`border-b border-slate-100 ${contacted ? 'bg-emerald-50/60 hover:bg-emerald-100/50' : 'hover:bg-slate-50/50'}`}>
                <td className="px-2 py-1.5"><AgencyLink agency={a} navigate={navigate} /></td>
                <td className="px-2 py-1.5 text-slate-600">{formatState(a.state_slug)}</td>
                <td className="px-2 py-1.5 text-right font-semibold text-slate-900">{a.standard_selections}</td>
                <td className="px-2 py-1.5 text-slate-600">{relativeTime(a.last_standard_selection)}</td>
                <td className="px-2 py-1.5">{a.checkout_opens > 0 ? <span className="text-emerald-700 font-semibold">Yes</span> : <span className="text-slate-400">No</span>}</td>
                <td className="px-2 py-1.5">{a.purchases > 0 ? <span className="text-emerald-700 font-semibold">Yes</span> : <span className="text-slate-400">No</span>}</td>
                <td className="px-2 py-1.5 text-slate-700">{a.deepest_step_label}</td>
                <td className="px-2 py-1.5"><CopyDiscountBtn url={a.offer_15_url} agencyId={a.agency_id} stateSlug={a.state_slug} /></td>
                <td className="px-2 py-1.5"><CopyOfferLinkBtn url={a.offer_15_url} agencyId={a.agency_id} stateSlug={a.state_slug} agencyName={a.agency_name} /></td>
                <td className="px-2 py-1.5"><OutreachCheckbox contacted={contacted} contactedAt={getContactedAt(a)} onToggle={() => toggleContacted(a)} /></td>
                <td className="px-2 py-1.5"><OpenAdminBtn agency={a} navigate={navigate} /></td>
              </tr>
              );
            })}
          </tbody>
        </table>
      </div>
    </>
  );
}

function Top25UpsellTable({ agencies, navigate, sort, onSort, isContacted, getContactedAt, toggleContacted }: TableProps) {
  if (agencies.length === 0) return <p className="text-sm text-slate-500">No Top-25 upsell viewers in this timeframe.</p>;
  return (
    <>
      <SectionHeader icon={<TrendingUp className="w-4 h-4 text-rose-600" />} title="Top-25 Upsell Viewers" count={agencies.length} />
      <div className="overflow-x-auto">
        <table className="w-full text-xs">
          <thead>
            <tr className="border-b border-slate-200">
              <SortableHeader label="Agency" sortKey="agency_name" currentSort={sort} onSort={onSort} />
              <SortableHeader label="State" sortKey="state_slug" currentSort={sort} onSort={onSort} />
              <SortableHeader label="Views" sortKey="top25_upsell_views" align="right" currentSort={sort} onSort={onSort} />
              <SortableHeader label="Last view" sortKey="last_top25_upsell_view" currentSort={sort} onSort={onSort} />
              <SortableHeader label="Top-25 selected?" sortKey="top25_selected_bool" currentSort={sort} onSort={onSort} />
              <SortableHeader label="Checkout?" sortKey="checkout_bool" currentSort={sort} onSort={onSort} />
              <SortableHeader label="Purchased?" sortKey="purchased_bool" currentSort={sort} onSort={onSort} />
              <th className="px-2 py-2 font-semibold text-slate-600">Discount</th>
              <th className="px-2 py-2 font-semibold text-slate-600">Offer Link</th>
              <th className="px-2 py-2 font-semibold text-slate-600">Outreach</th>
              <th className="px-2 py-2"></th>
            </tr>
          </thead>
          <tbody>
            {agencies.slice(0, 50).map(a => {
              const contacted = isContacted(a);
              return (
              <tr key={a.agency_id} className={`border-b border-slate-100 ${contacted ? 'bg-emerald-50/60 hover:bg-emerald-100/50' : 'hover:bg-slate-50/50'}`}>
                <td className="px-2 py-1.5"><AgencyLink agency={a} navigate={navigate} /></td>
                <td className="px-2 py-1.5 text-slate-600">{formatState(a.state_slug)}</td>
                <td className="px-2 py-1.5 text-right font-semibold text-slate-900">{a.top25_upsell_views}</td>
                <td className="px-2 py-1.5 text-slate-600">{relativeTime(a.last_top25_upsell_view)}</td>
                <td className="px-2 py-1.5">{a.top25_selections > 0 ? <span className="text-emerald-700 font-semibold">Yes</span> : <span className="text-slate-400">No</span>}</td>
                <td className="px-2 py-1.5">{a.checkout_opens > 0 ? <span className="text-emerald-700 font-semibold">Yes</span> : <span className="text-slate-400">No</span>}</td>
                <td className="px-2 py-1.5">{a.purchases > 0 ? <span className="text-emerald-700 font-semibold">Yes</span> : <span className="text-slate-400">No</span>}</td>
                <td className="px-2 py-1.5"><CopyDiscountBtn url={a.offer_15_url} agencyId={a.agency_id} stateSlug={a.state_slug} /></td>
                <td className="px-2 py-1.5"><CopyOfferLinkBtn url={a.offer_15_url} agencyId={a.agency_id} stateSlug={a.state_slug} agencyName={a.agency_name} /></td>
                <td className="px-2 py-1.5"><OutreachCheckbox contacted={contacted} contactedAt={getContactedAt(a)} onToggle={() => toggleContacted(a)} /></td>
                <td className="px-2 py-1.5"><OpenAdminBtn agency={a} navigate={navigate} /></td>
              </tr>
              );
            })}
          </tbody>
        </table>
      </div>
    </>
  );
}

function Top25UpgradeTable({ agencies, navigate, sort, onSort, isContacted, getContactedAt, toggleContacted }: TableProps) {
  if (agencies.length === 0) return <p className="text-sm text-slate-500">No Top-25 upgrade selections in this timeframe.</p>;
  return (
    <>
      <SectionHeader icon={<Flame className="w-4 h-4 text-red-600" />} title="Top-25 Upgrade Interest" count={agencies.length} />
      <div className="overflow-x-auto">
        <table className="w-full text-xs">
          <thead>
            <tr className="border-b border-slate-200">
              <SortableHeader label="Agency" sortKey="agency_name" currentSort={sort} onSort={onSort} />
              <SortableHeader label="State" sortKey="state_slug" currentSort={sort} onSort={onSort} />
              <SortableHeader label="Selections" sortKey="top25_selections" align="right" currentSort={sort} onSort={onSort} />
              <SortableHeader label="Last selected" sortKey="last_top25_selection" currentSort={sort} onSort={onSort} />
              <SortableHeader label="Rank" sortKey="last_selected_rank" currentSort={sort} onSort={onSort} />
              <SortableHeader label="Price" sortKey="last_selected_price" currentSort={sort} onSort={onSort} />
              <SortableHeader label="Discount" sortKey="discount_percent" currentSort={sort} onSort={onSort} />
              <SortableHeader label="Checkout?" sortKey="checkout_bool" currentSort={sort} onSort={onSort} />
              <SortableHeader label="Purchased?" sortKey="purchased_bool" currentSort={sort} onSort={onSort} />
              <SortableHeader label="Intent" sortKey="intent_level" currentSort={sort} onSort={onSort} />
              <th className="px-2 py-2 font-semibold text-slate-600">Discount</th>
              <th className="px-2 py-2 font-semibold text-slate-600">Offer Link</th>
              <th className="px-2 py-2 font-semibold text-slate-600">Outreach</th>
              <th className="px-2 py-2"></th>
            </tr>
          </thead>
          <tbody>
            {agencies.slice(0, 50).map(a => {
              const contacted = isContacted(a);
              return (
              <tr key={a.agency_id} className={`border-b border-slate-100 ${contacted ? 'bg-emerald-50/60 hover:bg-emerald-100/50' : a.top25_selections >= 3 ? 'bg-red-50/30 hover:bg-slate-50/50' : 'hover:bg-slate-50/50'}`}>
                <td className="px-2 py-1.5">
                  <AgencyLink agency={a} navigate={navigate} />
                  {a.top25_selections >= 2 && <RepeatBadge count={a.top25_selections} label={a.top25_selections >= 3 ? 'High Intent' : `Selected ${a.top25_selections}x`} />}
                </td>
                <td className="px-2 py-1.5 text-slate-600">{formatState(a.state_slug)}</td>
                <td className="px-2 py-1.5 text-right font-semibold text-slate-900">{a.top25_selections}</td>
                <td className="px-2 py-1.5 text-slate-600">{relativeTime(a.last_top25_selection)}</td>
                <td className="px-2 py-1.5 text-slate-700 font-medium">{a.last_selected_rank || '-'}</td>
                <td className="px-2 py-1.5 text-slate-700">{a.last_selected_price || '-'}</td>
                <td className="px-2 py-1.5 text-slate-600">{a.discount_percent ? `${a.discount_percent}%` : '-'}</td>
                <td className="px-2 py-1.5">{a.checkout_opens > 0 ? <span className="text-emerald-700 font-semibold">Yes</span> : <span className="text-slate-400">No</span>}</td>
                <td className="px-2 py-1.5">{a.purchases > 0 ? <span className="text-emerald-700 font-semibold">Yes</span> : <span className="text-slate-400">No</span>}</td>
                <td className="px-2 py-1.5"><IntentBadge level={a.intent_level} /></td>
                <td className="px-2 py-1.5"><CopyDiscountBtn url={a.offer_15_url} agencyId={a.agency_id} stateSlug={a.state_slug} /></td>
                <td className="px-2 py-1.5"><CopyOfferLinkBtn url={a.offer_15_url} agencyId={a.agency_id} stateSlug={a.state_slug} agencyName={a.agency_name} /></td>
                <td className="px-2 py-1.5"><OutreachCheckbox contacted={contacted} contactedAt={getContactedAt(a)} onToggle={() => toggleContacted(a)} /></td>
                <td className="px-2 py-1.5"><OpenAdminBtn agency={a} navigate={navigate} /></td>
              </tr>
              );
            })}
          </tbody>
        </table>
      </div>
    </>
  );
}

function CheckoutTable({ agencies, navigate, sort, onSort, isContacted, getContactedAt, toggleContacted }: TableProps) {
  if (agencies.length === 0) return <p className="text-sm text-slate-500">No checkout visitors in this timeframe.</p>;
  return (
    <>
      <SectionHeader icon={<ShoppingCart className="w-4 h-4 text-emerald-600" />} title="Checkout Visitors" count={agencies.length} />
      <div className="overflow-x-auto">
        <table className="w-full text-xs">
          <thead>
            <tr className="border-b border-slate-200">
              <SortableHeader label="Agency" sortKey="agency_name" currentSort={sort} onSort={onSort} />
              <SortableHeader label="State" sortKey="state_slug" currentSort={sort} onSort={onSort} />
              <SortableHeader label="Opens" sortKey="checkout_opens" align="right" currentSort={sort} onSort={onSort} />
              <SortableHeader label="Last open" sortKey="last_checkout_open" currentSort={sort} onSort={onSort} />
              <SortableHeader label="Product" sortKey="last_checkout_product" currentSort={sort} onSort={onSort} />
              <SortableHeader label="Discount" sortKey="discount_bool" currentSort={sort} onSort={onSort} />
              <SortableHeader label="Purchased?" sortKey="purchased_bool" currentSort={sort} onSort={onSort} />
              <SortableHeader label="Deepest step" sortKey="deepest_step_label" currentSort={sort} onSort={onSort} />
              <SortableHeader label="Intent" sortKey="intent_level" currentSort={sort} onSort={onSort} />
              <th className="px-2 py-2 font-semibold text-slate-600">Discount</th>
              <th className="px-2 py-2 font-semibold text-slate-600">Offer Link</th>
              <th className="px-2 py-2 font-semibold text-slate-600">Outreach</th>
              <th className="px-2 py-2"></th>
            </tr>
          </thead>
          <tbody>
            {agencies.slice(0, 50).map(a => {
              const contacted = isContacted(a);
              return (
              <tr key={a.agency_id} className={`border-b border-slate-100 ${contacted ? 'bg-emerald-50/60 hover:bg-emerald-100/50' : a.checkout_opens >= 3 ? 'bg-red-50/30 hover:bg-slate-50/50' : 'hover:bg-slate-50/50'}`}>
                <td className="px-2 py-1.5">
                  <AgencyLink agency={a} navigate={navigate} />
                  {a.checkout_opens >= 2 && (
                    <RepeatBadge
                      count={a.checkout_opens}
                      label={a.checkout_opens >= 4 ? 'Very High Intent' : a.purchases === 0 ? `Abandoned ${a.checkout_opens}x` : `${a.checkout_opens}x`}
                    />
                  )}
                </td>
                <td className="px-2 py-1.5 text-slate-600">{formatState(a.state_slug)}</td>
                <td className="px-2 py-1.5 text-right font-semibold text-slate-900">{a.checkout_opens}</td>
                <td className="px-2 py-1.5 text-slate-600">{relativeTime(a.last_checkout_open)}</td>
                <td className="px-2 py-1.5 text-slate-700">{a.last_checkout_product || '-'}</td>
                <td className="px-2 py-1.5 text-slate-600">{a.discount_token ? 'Yes' : '-'}</td>
                <td className="px-2 py-1.5">{a.purchases > 0 ? <span className="text-emerald-700 font-semibold">Yes</span> : <span className="text-red-600 font-medium">No</span>}</td>
                <td className="px-2 py-1.5 text-slate-700">{a.deepest_step_label}</td>
                <td className="px-2 py-1.5"><IntentBadge level={a.intent_level} /></td>
                <td className="px-2 py-1.5"><CopyDiscountBtn url={a.offer_15_url} agencyId={a.agency_id} stateSlug={a.state_slug} /></td>
                <td className="px-2 py-1.5"><CopyOfferLinkBtn url={a.offer_15_url} agencyId={a.agency_id} stateSlug={a.state_slug} agencyName={a.agency_name} /></td>
                <td className="px-2 py-1.5"><OutreachCheckbox contacted={contacted} contactedAt={getContactedAt(a)} onToggle={() => toggleContacted(a)} /></td>
                <td className="px-2 py-1.5"><OpenAdminBtn agency={a} navigate={navigate} /></td>
              </tr>
              );
            })}
          </tbody>
        </table>
      </div>
    </>
  );
}
