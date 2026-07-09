import { useState, useEffect, useCallback, useRef } from 'react';
import { useNavigate } from 'react-router-dom';
import { Search, ChevronDown, ChevronRight, ExternalLink, Copy, Globe, CheckCircle, XCircle, AlertTriangle, CreditCard as Edit3, Save, X, RefreshCw, Tag, ToggleLeft, ToggleRight, ChevronLeft, ChevronRight as ChevronRightIcon, Building2, Filter, Layers, Shield, MapPin, Trash2, Check, Plus } from 'lucide-react';
import WpAdminLayout from '../components/wpadmin/WpAdminLayout';
import { useAdminSession } from '../contexts/AdminSessionContext';
import { US_STATES } from '../lib/usStates';
import { formatStateName } from '../utils/formatLocation';

const SUPABASE_URL = import.meta.env.VITE_SUPABASE_URL as string;
const SUPABASE_ANON_KEY = import.meta.env.VITE_SUPABASE_ANON_KEY as string;
const API = `${SUPABASE_URL}/functions/v1/other-agencies-manager-api`;

const COMMON_SERVICES = [
  'SEO', 'PPC', 'Social Media', 'Content Marketing', 'Email Marketing',
  'Web Design', 'Web Development', 'Branding', 'Video Production', 'Photography',
  'Copywriting', 'PR', 'Influencer Marketing', 'E-commerce', 'Analytics',
  'Marketing Strategy', 'Lead Generation', 'Mobile Marketing', 'Affiliate Marketing',
  'Display Advertising', 'Conversion Optimization', 'App Development', 'Graphic Design',
  'Events', 'Market Research',
];

type FilterType =
  | 'all' | 'paid' | 'unpaid' | 'active' | 'inactive'
  | 'missing_website' | 'has_badges' | 'no_badges' | 'overridden'
  | 'showcase_pinned' | 'showcase_not_pinned';

interface OtherAgency {
  id: string;
  name: string;
  slug: string | null;
  state_slug: string;
  email: string | null;
  website_url: string | null;
  is_paid_listing: boolean;
  paid_listing_type: string | null;
  is_active: boolean;
  services: string[] | null;
  paid_override_active: boolean;
  paid_override_value: boolean | null;
  paid_override_reason: string | null;
  paid_override_updated_at: string | null;
  paid_override_updated_by: string | null;
  has_card_visual_upgrade: boolean;
  city: string | null;
  maps_url: string | null;
  updated_at: string | null;
  created_at: string | null;
  standard_paid_active: boolean;
  has_confirmed_stripe_order: boolean;
  paid_source_reason?: string;
  showcase_pinned: boolean;
  showcase_position: number | null;
  showcase_updated_at: string | null;
  showcase_updated_by: string | null;
  activity_score?: number | null;
  deepest_step?: number | null;
}

interface SummaryStats {
  state_slug: string;
  total: number;
  paid: number;
  unpaid: number;
  missing_website: number;
  with_badges: number;
  active: number;
  inactive: number;
}

interface RankedAgency {
  id: string;
  name: string;
  slug: string | null;
  city: string | null;
  state_slug: string;
  is_paid_listing: boolean;
  website_url: string | null;
  showcase_pinned: boolean;
  showcase_position: number | null;
  _selection_reason?: string;
  _activity_score?: number | null;
  _deepest_step?: number | null;
  _last_activity_at?: string | null;
}

function effectivePaid(a: OtherAgency): boolean {
  return a.paid_override_active
    ? (a.paid_override_value ?? false)
    : ((a.is_paid_listing && a.has_confirmed_stripe_order) || a.standard_paid_active);
}

function paidSource(a: OtherAgency): 'override' | 'stripe' | 'stripe_unverified' | 'activated' | 'none' {
  if (a.paid_override_active) return 'override';
  if (a.is_paid_listing && a.has_confirmed_stripe_order) return 'stripe';
  if (a.is_paid_listing && !a.has_confirmed_stripe_order) return 'stripe_unverified';
  if (a.standard_paid_active) return 'activated';
  return 'none';
}

function isBadUrl(url: string | null): boolean {
  if (!url) return false;
  return (
    url.includes('google.com/maps') ||
    url.includes('maps.google') ||
    url.includes('goo.gl/maps') ||
    url.includes('facebook.com') ||
    url.includes('yelp.com') ||
    url.includes('yellowpages')
  );
}

function formatUrl(url: string | null): string {
  if (!url) return '';
  try {
    const u = new URL(url);
    return u.hostname.replace(/^www\./, '');
  } catch {
    return url.length > 30 ? url.slice(0, 30) + '…' : url;
  }
}


function useDebounce<T>(value: T, delay = 350): T {
  const [debounced, setDebounced] = useState(value);
  useEffect(() => {
    const t = setTimeout(() => setDebounced(value), delay);
    return () => clearTimeout(t);
  }, [value, delay]);
  return debounced;
}

// ── Sub-components ────────────────────────────────────────────────────────────

function SummaryCard({
  label, value, color, onClick, active,
}: {
  label: string; value: number | string; color: string;
  onClick?: () => void; active?: boolean;
}) {
  return (
    <button
      type="button"
      onClick={onClick}
      className={`
        bg-white rounded-xl border p-4 text-left transition-all
        ${active ? 'border-blue-500 ring-2 ring-blue-100 shadow-sm' : 'border-slate-200 hover:border-slate-300 hover:shadow-sm'}
        ${onClick ? 'cursor-pointer' : 'cursor-default'}
      `}
    >
      <div className={`text-2xl font-bold ${color}`}>{value}</div>
      <div className="text-xs text-slate-500 mt-1 font-medium">{label}</div>
    </button>
  );
}

function PaidStatusBadge({ agency }: { agency: OtherAgency }) {
  const paid = effectivePaid(agency);
  const source = paidSource(agency);

  if (source === 'override') {
    return (
      <span className={`inline-flex items-center gap-1 px-2 py-0.5 rounded-full text-xs font-semibold ${paid ? 'bg-blue-100 text-blue-800 border border-blue-200' : 'bg-slate-100 text-slate-600 border border-slate-200'}`}>
        <Shield size={10} />
        {paid ? 'Override: Paid' : 'Override: Free'}
      </span>
    );
  }

  if (source === 'stripe') {
    return (
      <span className="inline-flex items-center gap-1 px-2 py-0.5 rounded-full text-xs font-semibold bg-emerald-100 text-emerald-700 border border-emerald-200">
        <CheckCircle size={10} />
        Paid (Stripe)
      </span>
    );
  }

  if (source === 'stripe_unverified') {
    return (
      <span className="inline-flex items-center gap-1 px-2 py-0.5 rounded-full text-xs font-semibold bg-amber-100 text-amber-700 border border-amber-200">
        <AlertTriangle size={10} />
        Webhook (unverified)
      </span>
    );
  }

  if (source === 'activated') {
    return (
      <span className="inline-flex items-center gap-1 px-2 py-0.5 rounded-full text-xs font-semibold bg-amber-100 text-amber-700 border border-amber-200">
        <AlertTriangle size={10} />
        Activated (no Stripe)
      </span>
    );
  }

  return (
    <span className="inline-flex items-center gap-1 px-2 py-0.5 rounded-full text-xs font-medium bg-slate-100 text-slate-500 border border-slate-200">
      Free
    </span>
  );
}

function ActiveBadge({ active }: { active: boolean }) {
  return active ? (
    <span className="inline-flex items-center gap-1 px-2 py-0.5 rounded-full text-xs font-medium bg-green-50 text-green-700 border border-green-200">
      <div className="w-1.5 h-1.5 rounded-full bg-green-500" />
      Active
    </span>
  ) : (
    <span className="inline-flex items-center gap-1 px-2 py-0.5 rounded-full text-xs font-medium bg-red-50 text-red-600 border border-red-200">
      <div className="w-1.5 h-1.5 rounded-full bg-red-400" />
      Inactive
    </span>
  );
}

// ── Expanded Row Panel ────────────────────────────────────────────────────────

function ExpandedPanel({
  agency,
  onUpdate,
  onDisplace,
  onClose,
  token,
}: {
  agency: OtherAgency;
  onUpdate: (updated: OtherAgency) => void;
  onDisplace?: (displaced: { id: string; name: string; previous_slot: number }) => void;
  onClose: () => void;
  token: string;
}) {
  const [websiteUrl, setWebsiteUrl] = useState(agency.website_url || '');
  const [services, setServices] = useState<string[]>(agency.services || []);
  const [isActive, setIsActive] = useState(agency.is_active);
  const [customBadge, setCustomBadge] = useState('');
  const [overrideActive, setOverrideActive] = useState(agency.paid_override_active);
  const [overrideValue, setOverrideValue] = useState<boolean>(agency.paid_override_value ?? false);
  const [overrideReason, setOverrideReason] = useState(agency.paid_override_reason || '');
  const [showcasePinned, setShowcasePinned] = useState(agency.showcase_pinned || false);
  const [showcasePosition, setShowcasePosition] = useState<number | null>(agency.showcase_position || null);
  const [saving, setSaving] = useState(false);
  const [saveMsg, setSaveMsg] = useState('');
  const [activeTab, setActiveTab] = useState<'details' | 'badges' | 'paid' | 'showcase'>('details');

  const isDirty =
    websiteUrl !== (agency.website_url || '') ||
    JSON.stringify(services) !== JSON.stringify(agency.services || []) ||
    isActive !== agency.is_active ||
    overrideActive !== agency.paid_override_active ||
    overrideValue !== (agency.paid_override_value ?? false) ||
    overrideReason !== (agency.paid_override_reason || '') ||
    showcasePinned !== (agency.showcase_pinned || false) ||
    showcasePosition !== (agency.showcase_position || null);

  const urlWarning = isBadUrl(websiteUrl);

  const handleSave = async () => {
    setSaving(true);
    setSaveMsg('');
    try {
      const payload: Record<string, unknown> = { id: agency.id };

      if (websiteUrl !== (agency.website_url || '')) payload.website_url = websiteUrl || null;
      if (JSON.stringify(services) !== JSON.stringify(agency.services || [])) payload.services = services;
      if (isActive !== agency.is_active) payload.is_active = isActive;

      const overrideChanged =
        overrideActive !== agency.paid_override_active ||
        overrideValue !== (agency.paid_override_value ?? false) ||
        overrideReason !== (agency.paid_override_reason || '');

      if (overrideChanged) {
        payload.paid_override_active = overrideActive;
        payload.paid_override_value = overrideActive ? overrideValue : null;
        payload.paid_override_reason = overrideActive ? (overrideReason || 'admin_manual') : null;
        payload.paid_override_updated_by = 'admin_manager';
      }

      const showcaseChanged =
        showcasePinned !== (agency.showcase_pinned || false) ||
        showcasePosition !== (agency.showcase_position || null);

      if (showcaseChanged) {
        payload.showcase_pinned = showcasePinned;
        payload.showcase_position = showcasePinned ? showcasePosition : null;
        payload.showcase_updated_by = 'admin_manager';
      }

      const res = await fetch(API, {
        method: 'PATCH',
        headers: {
          'Content-Type': 'application/json',
          Authorization: `Bearer ${SUPABASE_ANON_KEY}`,
          'x-admin-token': token,
        },
        body: JSON.stringify(payload),
      });

      const data = await res.json();
      if (!res.ok || !data.ok) throw new Error(data.error || 'Save failed');

      setSaveMsg('Saved');
      onUpdate(data.agency ?? {
        ...agency,
        website_url: (payload.website_url as string | null) ?? agency.website_url,
        services: (payload.services as string[]) ?? agency.services,
        is_active: isActive,
        paid_override_active: overrideActive,
        paid_override_value: overrideActive ? overrideValue : null,
        paid_override_reason: (payload.paid_override_reason as string) ?? agency.paid_override_reason,
        showcase_pinned: showcasePinned,
        showcase_position: showcasePinned ? showcasePosition : null,
        showcase_updated_at: showcaseChanged ? new Date().toISOString() : agency.showcase_updated_at,
        showcase_updated_by: showcaseChanged ? 'admin_manager' : agency.showcase_updated_by,
        updated_at: new Date().toISOString(),
      });
      if (data.displaced) {
        onDisplace?.(data.displaced as { id: string; name: string; previous_slot: number });
      }
      setTimeout(() => setSaveMsg(''), 2500);
    } catch (e) {
      setSaveMsg((e as Error).message || 'Error saving');
    } finally {
      setSaving(false);
    }
  };

  const toggleBadge = (badge: string) => {
    setServices(prev =>
      prev.includes(badge) ? prev.filter(s => s !== badge) : [...prev, badge],
    );
  };

  const addCustomBadge = () => {
    const trimmed = customBadge.trim();
    if (trimmed && !services.includes(trimmed)) {
      setServices(prev => [...prev, trimmed]);
    }
    setCustomBadge('');
  };

  return (
    <div className="border-t border-slate-100 bg-slate-50">
      <div className="p-4 max-w-4xl">
        {/* Tabs */}
        <div className="flex gap-1 mb-4 bg-white border border-slate-200 rounded-lg p-1 w-fit">
          {(['details', 'badges', 'paid', 'showcase'] as const).map(tab => (
            <button
              key={tab}
              type="button"
              onClick={() => setActiveTab(tab)}
              className={`px-3 py-1.5 rounded-md text-xs font-semibold transition-colors capitalize
                ${activeTab === tab ? 'bg-blue-600 text-white' : 'text-slate-600 hover:bg-slate-100'}`}
            >
              {tab === 'paid' ? 'Paid Status' : tab}
            </button>
          ))}
        </div>

        {/* Details Tab */}
        {activeTab === 'details' && (
          <div className="space-y-4">
            <div>
              <label className="text-xs font-semibold text-slate-500 uppercase tracking-wide mb-1.5 block">
                Website URL
              </label>
              <div className="flex gap-2 items-start">
                <div className="flex-1">
                  <input
                    type="url"
                    value={websiteUrl}
                    onChange={e => setWebsiteUrl(e.target.value)}
                    placeholder="https://example.com"
                    className={`w-full px-3 py-2 border rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-blue-500
                      ${urlWarning ? 'border-amber-400 bg-amber-50' : 'border-slate-200 bg-white'}`}
                  />
                  {urlWarning && (
                    <p className="text-amber-600 text-xs mt-1 flex items-center gap-1">
                      <AlertTriangle size={11} />
                      Looks like a maps/social URL — may not be the agency website
                    </p>
                  )}
                </div>
                {websiteUrl && (
                  <a
                    href={websiteUrl}
                    target="_blank"
                    rel="noopener noreferrer"
                    className="p-2 border border-slate-200 rounded-lg hover:bg-white transition-colors text-slate-500"
                    title="Open in new tab"
                  >
                    <ExternalLink size={14} />
                  </a>
                )}
              </div>
            </div>

            <div>
              <label className="text-xs font-semibold text-slate-500 uppercase tracking-wide mb-1.5 block">
                Visibility
              </label>
              <button
                type="button"
                onClick={() => setIsActive(!isActive)}
                className={`flex items-center gap-2 px-3 py-2 rounded-lg border text-sm font-medium transition-colors
                  ${isActive ? 'border-green-200 bg-green-50 text-green-700' : 'border-red-200 bg-red-50 text-red-600'}`}
              >
                {isActive ? <ToggleRight size={16} /> : <ToggleLeft size={16} />}
                {isActive ? 'Active — visible on state page' : 'Inactive — hidden from state page'}
              </button>
            </div>

            <div className="bg-slate-100 rounded-lg p-3 text-xs text-slate-500 space-y-1">
              <div><span className="font-medium">Agency ID:</span> {agency.id}</div>
              <div><span className="font-medium">Slug:</span> {agency.slug || '—'}</div>
              <div><span className="font-medium">City:</span> {agency.city || '—'}</div>
              {agency.maps_url && (
                <div>
                  <a href={agency.maps_url} target="_blank" rel="noopener noreferrer"
                    className="text-blue-500 hover:underline flex items-center gap-1">
                    <MapPin size={10} /> View on Maps
                  </a>
                </div>
              )}
              <div><span className="font-medium">Updated:</span> {agency.updated_at ? new Date(agency.updated_at).toLocaleDateString() : '—'}</div>
              <div><span className="font-medium">Email:</span> {agency.email || '—'}</div>
            </div>
          </div>
        )}

        {/* Badges Tab */}
        {activeTab === 'badges' && (
          <div className="space-y-4">
            <div>
              <label className="text-xs font-semibold text-slate-500 uppercase tracking-wide mb-2 block">
                Active Badges ({services.length})
              </label>
              {services.length > 0 ? (
                <div className="flex flex-wrap gap-1.5 mb-3">
                  {services.map(s => (
                    <span
                      key={s}
                      className="inline-flex items-center gap-1.5 px-2.5 py-1 bg-blue-600 text-white rounded-full text-xs font-medium"
                    >
                      {s}
                      <button
                        type="button"
                        onClick={() => setServices(prev => prev.filter(x => x !== s))}
                        className="hover:bg-blue-500 rounded-full p-0.5 transition-colors"
                      >
                        <X size={9} />
                      </button>
                    </span>
                  ))}
                </div>
              ) : (
                <p className="text-sm text-slate-400 mb-3">No badges set</p>
              )}
            </div>

            <div>
              <label className="text-xs font-semibold text-slate-500 uppercase tracking-wide mb-2 block">
                Common Services
              </label>
              <div className="flex flex-wrap gap-1.5">
                {COMMON_SERVICES.map(s => (
                  <button
                    key={s}
                    type="button"
                    onClick={() => toggleBadge(s)}
                    className={`px-2.5 py-1 rounded-full text-xs font-medium border transition-all
                      ${services.includes(s)
                        ? 'bg-blue-600 text-white border-blue-600'
                        : 'bg-white text-slate-600 border-slate-300 hover:border-blue-400 hover:text-blue-600'
                      }`}
                  >
                    {services.includes(s) && <span className="mr-1">✓</span>}
                    {s}
                  </button>
                ))}
              </div>
            </div>

            <div>
              <label className="text-xs font-semibold text-slate-500 uppercase tracking-wide mb-1.5 block">
                Custom Badge
              </label>
              <div className="flex gap-2">
                <input
                  type="text"
                  value={customBadge}
                  onChange={e => setCustomBadge(e.target.value)}
                  onKeyDown={e => e.key === 'Enter' && addCustomBadge()}
                  placeholder="Enter custom service..."
                  className="flex-1 px-3 py-2 border border-slate-200 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
                />
                <button
                  type="button"
                  onClick={addCustomBadge}
                  disabled={!customBadge.trim()}
                  className="px-3 py-2 bg-blue-600 text-white rounded-lg text-sm font-medium hover:bg-blue-700 disabled:opacity-40 transition-colors"
                >
                  <Plus size={14} />
                </button>
              </div>
            </div>
          </div>
        )}

        {/* Paid Status Tab */}
        {activeTab === 'paid' && (
          <div className="space-y-4">
            <div className="bg-white border border-slate-200 rounded-lg p-4">
              <div className="text-xs font-semibold text-slate-500 uppercase tracking-wide mb-3">
                Stripe Source of Truth (read-only)
              </div>
              <div className="flex items-center gap-3">
                {agency.is_paid_listing ? (
                  <span className="inline-flex items-center gap-1.5 px-3 py-1.5 bg-emerald-100 text-emerald-700 rounded-full text-sm font-semibold border border-emerald-200">
                    <CheckCircle size={13} /> Paid
                  </span>
                ) : (
                  <span className="inline-flex items-center gap-1.5 px-3 py-1.5 bg-slate-100 text-slate-600 rounded-full text-sm font-medium border border-slate-200">
                    Free
                  </span>
                )}
                {agency.paid_listing_type && (
                  <span className="text-xs text-slate-400">Type: {agency.paid_listing_type}</span>
                )}
              </div>
              <p className="text-xs text-slate-400 mt-2">
                This field is managed by Stripe webhooks and cannot be edited here.
              </p>
            </div>

            <div className={`border rounded-lg p-4 transition-colors
              ${overrideActive ? 'border-amber-300 bg-amber-50' : 'border-slate-200 bg-white'}`}>
              <div className="flex items-center justify-between mb-3">
                <div className="text-xs font-semibold text-slate-700 uppercase tracking-wide flex items-center gap-1.5">
                  <Shield size={12} />
                  Admin Override
                </div>
                <button
                  type="button"
                  onClick={() => setOverrideActive(!overrideActive)}
                  className={`relative inline-flex h-5 w-9 items-center rounded-full transition-colors
                    ${overrideActive ? 'bg-amber-500' : 'bg-slate-300'}`}
                >
                  <span className={`inline-block h-3.5 w-3.5 rounded-full bg-white shadow transition-transform
                    ${overrideActive ? 'translate-x-4.5' : 'translate-x-0.5'}`} />
                </button>
              </div>

              {overrideActive ? (
                <div className="space-y-3">
                  <div>
                    <label className="text-xs font-medium text-slate-600 mb-1.5 block">
                      Override Value
                    </label>
                    <div className="flex gap-2">
                      <button
                        type="button"
                        onClick={() => setOverrideValue(true)}
                        className={`flex-1 py-2 rounded-lg border text-sm font-medium transition-colors
                          ${overrideValue ? 'bg-emerald-600 text-white border-emerald-600' : 'bg-white text-slate-600 border-slate-300 hover:border-emerald-400'}`}
                      >
                        Paid
                      </button>
                      <button
                        type="button"
                        onClick={() => setOverrideValue(false)}
                        className={`flex-1 py-2 rounded-lg border text-sm font-medium transition-colors
                          ${!overrideValue ? 'bg-slate-600 text-white border-slate-600' : 'bg-white text-slate-600 border-slate-300 hover:border-slate-400'}`}
                      >
                        Free
                      </button>
                    </div>
                  </div>

                  <div>
                    <label className="text-xs font-medium text-slate-600 mb-1.5 block">
                      Reason (required)
                    </label>
                    <input
                      type="text"
                      value={overrideReason}
                      onChange={e => setOverrideReason(e.target.value)}
                      placeholder="e.g. Payment dispute resolved, testing, etc."
                      className="w-full px-3 py-2 border border-amber-300 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-amber-400 bg-white"
                    />
                  </div>

                  {agency.paid_override_updated_at && (
                    <p className="text-xs text-amber-700">
                      Last set: {new Date(agency.paid_override_updated_at).toLocaleString()}
                      {agency.paid_override_updated_by && ` by ${agency.paid_override_updated_by}`}
                    </p>
                  )}
                </div>
              ) : (
                <p className="text-xs text-slate-500">
                  Enable override to manually set paid status, independent of Stripe.
                  The override will be visible in the admin manager with an amber indicator.
                </p>
              )}
            </div>

            {agency.paid_override_active && !overrideActive && (
              <div className="bg-blue-50 border border-blue-200 rounded-lg p-3 text-xs text-blue-700">
                Disabling the override will revert to the Stripe-derived value
                ({agency.is_paid_listing ? 'Paid' : 'Free'}).
              </div>
            )}
          </div>
        )}

        {/* Showcase Tab */}
        {activeTab === 'showcase' && (
          <div className="space-y-4">
            <div className="bg-blue-50 border border-blue-200 rounded-lg p-4">
              <div className="text-xs font-semibold text-blue-700 uppercase tracking-wide mb-2 flex items-center gap-1.5">
                <Layers size={12} />
                Showcase System (First 12 Other Agencies)
              </div>
              <p className="text-xs text-blue-600 leading-relaxed">
                The first 12 Other Agencies are showcased on the state page. Use manual pinning to control which agencies appear in these showcase positions and in what order.
              </p>
            </div>

            <div className="bg-white border border-slate-200 rounded-lg p-4">
              <div className="text-xs font-semibold text-slate-500 uppercase tracking-wide mb-3">
                Current Effective Status
              </div>
              <div className="flex items-center gap-3 mb-2">
                <PaidStatusBadge agency={agency} />
                {showcasePinned && (
                  <span className="inline-flex items-center gap-1 px-2 py-0.5 rounded-full text-xs font-semibold bg-purple-100 text-purple-700 border border-purple-200">
                    <Layers size={10} />
                    Showcase Pinned
                  </span>
                )}
              </div>
              <p className="text-xs text-slate-500">
                Priority: {effectivePaid(agency) ? 'Paid agencies' : 'Non-paid agencies'} {showcasePinned ? '(manually pinned)' : '(auto-fill)'}
              </p>
            </div>

            <div className={`border rounded-lg p-4 transition-colors
              ${showcasePinned ? 'border-purple-300 bg-purple-50' : 'border-slate-200 bg-white'}`}>
              <div className="flex items-center justify-between mb-3">
                <div className="text-xs font-semibold text-slate-700 uppercase tracking-wide flex items-center gap-1.5">
                  <Layers size={12} />
                  Pin in Showcase
                </div>
                <button
                  type="button"
                  onClick={() => {
                    const next = !showcasePinned;
                    setShowcasePinned(next);
                    if (!next) {
                      setShowcasePosition(null);
                    }
                  }}
                  className={`relative inline-flex h-5 w-9 items-center rounded-full transition-colors
                    ${showcasePinned ? 'bg-purple-500' : 'bg-slate-300'}`}
                >
                  <span className={`inline-block h-3.5 w-3.5 rounded-full bg-white shadow transition-transform
                    ${showcasePinned ? 'translate-x-4.5' : 'translate-x-0.5'}`} />
                </button>
              </div>

              {showcasePinned ? (
                <div className="space-y-3">
                  <div>
                    <label className="text-xs font-medium text-slate-600 mb-1.5 block">
                      Showcase Position (optional)
                    </label>
                    <p className="text-xs text-slate-500 mb-2">
                      Specify any position ≥ 1 to pin this agency to a specific slot in the showcase. Leave empty to auto-fill within the pinned priority group.
                    </p>
                    <div className="flex items-center gap-2">
                      <input
                        type="number"
                        min="1"
                        placeholder="Any position (e.g. 1, 13, 25…)"
                        value={showcasePosition ?? ''}
                        onChange={(e) => {
                          const v = e.target.value;
                          setShowcasePosition(v === '' ? null : Math.max(1, parseInt(v) || 1));
                        }}
                        className="flex-1 px-3 py-2 border border-purple-300 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-purple-400 bg-white"
                      />
                      {showcasePosition && (
                        <button
                          type="button"
                          onClick={() => setShowcasePosition(null)}
                          className="p-2 text-slate-500 hover:text-slate-700 transition-colors"
                          title="Clear position"
                        >
                          <X size={14} />
                        </button>
                      )}
                    </div>
                  </div>

                  <div className="bg-purple-100 border border-purple-200 rounded-lg p-3 text-xs text-purple-700 space-y-1">
                    <div className="font-semibold">Priority Algorithm:</div>
                    <div>1. Manually pinned paid agencies (by position)</div>
                    <div>2. Remaining paid agencies (DB order)</div>
                    <div>3. Manually pinned non-paid agencies (by position)</div>
                    <div>4. Remaining non-paid agencies (DB order)</div>
                  </div>

                  {agency.showcase_updated_at && (
                    <p className="text-xs text-purple-700">
                      Last updated: {new Date(agency.showcase_updated_at).toLocaleString()}
                      {agency.showcase_updated_by && ` by ${agency.showcase_updated_by}`}
                    </p>
                  )}
                </div>
              ) : (
                <p className="text-xs text-slate-500">
                  Enable pinning to manually place this agency in the first 12 showcased Other Agencies on the state page.
                  Pinned agencies will be prioritized based on their paid status and position.
                </p>
              )}
            </div>

          </div>
        )}

        {/* Footer Actions */}
        <div className="flex items-center justify-between mt-5 pt-4 border-t border-slate-200">
          <button
            type="button"
            onClick={onClose}
            className="px-3 py-1.5 text-slate-500 text-sm hover:text-slate-700 transition-colors"
          >
            Close
          </button>
          <div className="flex items-center gap-3">
            {saveMsg && (
              <span className={`text-xs font-medium ${saveMsg === 'Saved' ? 'text-emerald-600' : 'text-red-500'}`}>
                {saveMsg}
              </span>
            )}
            <button
              type="button"
              onClick={handleSave}
              disabled={saving || !isDirty}
              className="flex items-center gap-1.5 px-4 py-1.5 bg-blue-600 text-white rounded-lg text-sm font-medium
                hover:bg-blue-700 disabled:opacity-40 disabled:cursor-not-allowed transition-colors"
            >
              {saving ? <RefreshCw size={13} className="animate-spin" /> : <Save size={13} />}
              {saving ? 'Saving…' : 'Save Changes'}
            </button>
          </div>
        </div>
      </div>
    </div>
  );
}

// ── Bulk Action Bar ────────────────────────────────────────────────────────────

function BulkActionBar({
  count,
  onClear,
  onAction,
}: {
  count: number;
  onClear: () => void;
  onAction: (op: { type: string; [k: string]: unknown }) => void;
}) {
  const [badgeInput, setBadgeInput] = useState('');
  const [showBadgePicker, setShowBadgePicker] = useState(false);

  return (
    <div className="fixed bottom-6 left-1/2 -translate-x-1/2 z-50 bg-slate-900 text-white rounded-2xl shadow-2xl px-4 py-3 flex items-center gap-3 text-sm">
      <span className="font-semibold text-slate-300">{count} selected</span>
      <div className="w-px h-4 bg-slate-700" />

      <button
        type="button"
        onClick={() => onAction({ type: 'set_active' })}
        className="px-2.5 py-1 bg-green-600 hover:bg-green-500 rounded-lg text-xs font-medium transition-colors"
      >
        Mark Active
      </button>
      <button
        type="button"
        onClick={() => onAction({ type: 'set_inactive' })}
        className="px-2.5 py-1 bg-red-600 hover:bg-red-500 rounded-lg text-xs font-medium transition-colors"
      >
        Mark Inactive
      </button>

      <div className="relative">
        <button
          type="button"
          onClick={() => setShowBadgePicker(!showBadgePicker)}
          className="px-2.5 py-1 bg-blue-600 hover:bg-blue-500 rounded-lg text-xs font-medium transition-colors flex items-center gap-1"
        >
          <Tag size={11} /> Add Badge
        </button>
        {showBadgePicker && (
          <div className="absolute bottom-full mb-2 left-0 bg-white text-slate-800 rounded-xl shadow-xl border border-slate-200 p-3 w-64 z-10">
            <div className="flex gap-1.5 mb-2">
              <input
                type="text"
                placeholder="Badge name…"
                value={badgeInput}
                onChange={e => setBadgeInput(e.target.value)}
                onKeyDown={e => {
                  if (e.key === 'Enter' && badgeInput.trim()) {
                    onAction({ type: 'add_badge', badge: badgeInput.trim() });
                    setBadgeInput('');
                    setShowBadgePicker(false);
                  }
                }}
                className="flex-1 px-2 py-1.5 text-xs border border-slate-200 rounded-lg focus:outline-none focus:ring-1 focus:ring-blue-500"
              />
              <button
                type="button"
                onClick={() => {
                  if (badgeInput.trim()) {
                    onAction({ type: 'add_badge', badge: badgeInput.trim() });
                    setBadgeInput('');
                    setShowBadgePicker(false);
                  }
                }}
                className="px-2 py-1.5 bg-blue-600 text-white rounded-lg text-xs hover:bg-blue-700"
              >
                Add
              </button>
            </div>
            <div className="flex flex-wrap gap-1">
              {COMMON_SERVICES.slice(0, 12).map(s => (
                <button
                  key={s}
                  type="button"
                  onClick={() => {
                    onAction({ type: 'add_badge', badge: s });
                    setShowBadgePicker(false);
                  }}
                  className="px-2 py-0.5 bg-slate-100 hover:bg-blue-100 hover:text-blue-700 rounded text-xs transition-colors"
                >
                  {s}
                </button>
              ))}
            </div>
          </div>
        )}
      </div>

      <button
        type="button"
        onClick={() => onAction({ type: 'clear_paid_override' })}
        className="px-2.5 py-1 bg-slate-700 hover:bg-slate-600 rounded-lg text-xs font-medium transition-colors"
      >
        Clear Overrides
      </button>

      <div className="w-px h-4 bg-slate-700" />
      <button
        type="button"
        onClick={onClear}
        className="text-slate-400 hover:text-white transition-colors"
        title="Deselect all"
      >
        <X size={14} />
      </button>
    </div>
  );
}

// ── Main Page ─────────────────────────────────────────────────────────────────

const FILTERS: { key: FilterType; label: string }[] = [
  { key: 'all', label: 'All' },
  { key: 'paid', label: 'Standard Paid ($97)' },
  { key: 'unpaid', label: 'Unpaid' },
  { key: 'active', label: 'Active' },
  { key: 'inactive', label: 'Inactive' },
  { key: 'missing_website', label: 'No Website' },
  { key: 'has_badges', label: 'Has Badges' },
  { key: 'no_badges', label: 'No Badges' },
  { key: 'overridden', label: 'Override Active' },
  { key: 'showcase_pinned', label: '📌 Pinned' },
  { key: 'showcase_not_pinned', label: 'Not Pinned' },
];

export default function WpAdminOtherAgenciesManagerPage() {
  const { token } = useAdminSession();
  const navigate = useNavigate();

  const [selectedState, setSelectedState] = useState('');
  const [searchRaw, setSearchRaw] = useState('');
  const search = useDebounce(searchRaw, 350);
  const [filter, setFilter] = useState<FilterType>('all');
  const [page, setPage] = useState(0);
  const PAGE_SIZE = 25;

  const [agencies, setAgencies] = useState<OtherAgency[]>([]);
  const [total, setTotal] = useState(0);
  const [totalPages, setTotalPages] = useState(0);
  const [summary, setSummary] = useState<SummaryStats | null>(null);
  const [loading, setLoading] = useState(false);
  const [summaryLoading, setSummaryLoading] = useState(false);
  const [error, setError] = useState('');
  const [pinPopover, setPinPopover] = useState<{
    id: string;
    mode: 'menu' | 'unpin_confirm' | 'move_slot';
    moveInput: string;
  } | null>(null);

  const [expandedId, setExpandedId] = useState<string | null>(null);
  const [selectedIds, setSelectedIds] = useState<Set<string>>(new Set());
  const [showcaseBlock, setShowcaseBlock] = useState(0);
  const [showcaseRange, setShowcaseRange] = useState<RankedAgency[]>([]);
  const [showcaseTotal, setShowcaseTotal] = useState<number | null>(null);
  const [showcaseLoading, setShowcaseLoading] = useState(false);

  // Controlled slot-number inputs: maps agency.id → raw text the user has typed
  const [slotDraft, setSlotDraft] = useState<Record<string, string>>({});
  // Displacement notice: shown when saving a slot that was already occupied
  const [displacedNotice, setDisplacedNotice] = useState<{ name: string; slot: number } | null>(null);

  const authHeaders = {
    'Content-Type': 'application/json',
    Authorization: `Bearer ${SUPABASE_ANON_KEY}`,
    'x-admin-token': token,
  };

  const fetchSummary = useCallback(async (stateSlug: string, searchVal = '', filterVal: FilterType = 'all') => {
    setSummaryLoading(true);
    try {
      const params = new URLSearchParams({ action: 'summary', state_slug: stateSlug });
      if (searchVal.trim()) params.set('search', searchVal.trim());
      if (filterVal !== 'all') params.set('filter', filterVal);
      const res = await fetch(`${API}?${params}`, { headers: authHeaders });
      const data = await res.json();
      if (res.ok) {
        setSummary(data);
      } else {
        console.error('[other-agencies-manager] summary fetch failed', res.status, data);
      }
    } catch (err) {
      console.error('[other-agencies-manager] summary fetch threw', err);
    }
    setSummaryLoading(false);
  }, [token]);

  const fetchShowcaseRange = useCallback(async (stateSlug: string, block: number) => {
    setShowcaseLoading(true);
    try {
      const offset = block * 12;
      const url = `${SUPABASE_URL}/functions/v1/other-agencies-list?state=${encodeURIComponent(stateSlug)}&limit=12&offset=${offset}&_debug=1&_ts=${Date.now()}`;
      const res = await fetch(url, {
        headers: {
          Authorization: `Bearer ${SUPABASE_ANON_KEY}`,
          'x-admin-secret': token,
          'Content-Type': 'application/json',
        },
        cache: 'no-store',
      });
      const data = await res.json();
      if (res.ok && data.agencies) {
        setShowcaseRange(data.agencies as RankedAgency[]);
        if (typeof data.total === 'number') setShowcaseTotal(data.total);
      }
    } catch {}
    setShowcaseLoading(false);
  }, [token]);

  const fetchAgencies = useCallback(async (
    stateSlug: string,
    searchVal: string,
    filterVal: FilterType,
    pageVal: number,
  ) => {
    setLoading(true);
    setError('');
    try {
      const params = new URLSearchParams({
        action: 'list',
        page: String(pageVal),
        page_size: String(PAGE_SIZE),
      });
      // Only add state_slug if provided (global mode if empty)
      if (stateSlug) {
        params.set('state_slug', stateSlug);
      }
      if (searchVal.trim()) params.set('search', searchVal.trim());
      if (filterVal !== 'all') params.set('filter', filterVal);

      const res = await fetch(`${API}?${params}`, { headers: authHeaders });
      const data = await res.json();
      if (!res.ok) throw new Error(data.error || 'Failed to load');
      const loaded: OtherAgency[] = data.agencies || [];
      setAgencies(loaded);
      setTotal(data.total || 0);
      setTotalPages(data.total_pages || 0);
      // Sync controlled slot inputs — use existing draft if present, otherwise DB value
      setSlotDraft(prev => {
        const next = { ...prev };
        for (const a of loaded) {
          if (!(a.id in next)) {
            next[a.id] = a.showcase_position != null ? String(a.showcase_position) : '';
          }
        }
        return next;
      });
    } catch (e) {
      setError((e as Error).message || 'Load failed');
    }
    setLoading(false);
  }, [token]);

  // Fetch on state change
  useEffect(() => {
    if (!selectedState) {
      setAgencies([]);
      setTotal(0);
      setTotalPages(0);
      setSummary(null);
      setShowcaseRange([]);
      setShowcaseTotal(null);
      setShowcaseBlock(0);
      if (search.trim()) {
        setPage(0);
        setSelectedIds(new Set());
        fetchAgencies('', search, filter, 0);
      }
      return;
    }
    setPage(0);
    setSelectedIds(new Set());
    setShowcaseBlock(0);
    fetchSummary(selectedState, search, filter);
    fetchShowcaseRange(selectedState, 0);
    fetchAgencies(selectedState, search, filter, 0);
  }, [selectedState]);

  // Fetch showcase when block changes
  useEffect(() => {
    if (selectedState) {
      fetchShowcaseRange(selectedState, showcaseBlock);
    }
  }, [showcaseBlock]);

  // Fetch on search/filter change
  useEffect(() => {
    setPage(0);
    setSelectedIds(new Set());
    // Global mode if no state selected
    const stateForFetch = selectedState || '';
    // Only fetch if state selected OR search entered (global mode)
    if (selectedState || search.trim()) {
      fetchAgencies(stateForFetch, search, filter, 0);
    } else {
      // No state, no search: show empty state
      setAgencies([]);
      setTotal(0);
      setTotalPages(0);
    }
    // Re-fetch summary with new search/filter context (state-scoped only)
    if (selectedState) {
      fetchSummary(selectedState, search, filter);
    }
  }, [search, filter]);

  // Close pin popover when clicking outside a [data-pin-popover] element
  useEffect(() => {
    if (!pinPopover) return;
    const close = (e: MouseEvent) => {
      if (!(e.target as Element)?.closest?.('[data-pin-popover]')) {
        setPinPopover(null);
      }
    };
    document.addEventListener('mousedown', close);
    return () => document.removeEventListener('mousedown', close);
  }, [pinPopover]);

  // Fetch on page change
  useEffect(() => {
    // Only fetch if state selected OR search entered (global mode)
    if (selectedState || search.trim()) {
      const stateForFetch = selectedState || '';
      fetchAgencies(stateForFetch, search, filter, page);
    }
  }, [page]);

  const handleUpdate = (updated: OtherAgency) => {
    setAgencies(prev => prev.map(a => (a.id === updated.id ? updated : a)));
    if (selectedState) {
      fetchSummary(selectedState, search, filter);
      fetchShowcaseRange(selectedState, showcaseBlock);
    }
  };

  const handleInlineShowcaseUpdate = async (
    agencyId: string,
    showcasePinned: boolean,
    showcasePosition: number | null,
  ) => {
    setError('');
    try {
      const res = await fetch(API, {
        method: 'PATCH',
        headers: authHeaders,
        body: JSON.stringify({
          id: agencyId,
          showcase_pinned: showcasePinned,
          showcase_position: showcasePinned ? showcasePosition : null,
          showcase_updated_by: 'admin_manager',
        }),
      });

      const data = await res.json();
      if (!res.ok) throw new Error(data.error || 'Update failed');

      // Update the saved agency with authoritative DB values
      if (data.agency) {
        setAgencies(prev => prev.map(a => (a.id === agencyId ? data.agency : a)));
        const pos = (data.agency as OtherAgency).showcase_position;
        setSlotDraft(prev => ({
          ...prev,
          [agencyId]: pos != null ? String(pos) : '',
        }));
      }

      // If another agency was displaced from this slot, clear its local state
      if (data.displaced) {
        const dis = data.displaced as { id: string; name: string; previous_slot: number };
        setAgencies(prev =>
          prev.map(a =>
            a.id === dis.id
              ? { ...a, showcase_pinned: false, showcase_position: null }
              : a,
          ),
        );
        setSlotDraft(prev => ({ ...prev, [dis.id]: '' }));
        setDisplacedNotice({ name: dis.name, slot: dis.previous_slot });
        // Auto-dismiss after 6 seconds
        setTimeout(() => setDisplacedNotice(null), 6000);
      } else {
        setDisplacedNotice(null);
      }

      if (selectedState) {
        await fetchShowcaseRange(selectedState, showcaseBlock);
      }
    } catch (e) {
      setError((e as Error).message || 'Showcase update failed');
    }
  };

  const toggleSelect = (id: string) => {
    setSelectedIds(prev => {
      const next = new Set(prev);
      next.has(id) ? next.delete(id) : next.add(id);
      return next;
    });
  };

  const toggleSelectAll = () => {
    if (selectedIds.size === agencies.length) {
      setSelectedIds(new Set());
    } else {
      setSelectedIds(new Set(agencies.map(a => a.id)));
    }
  };

  const handleBulkAction = async (operation: { type: string; [k: string]: unknown }) => {
    if (!selectedIds.size) return;
    try {
      const res = await fetch(API, {
        method: 'POST',
        headers: authHeaders,
        body: JSON.stringify({
          action: 'bulk',
          ids: Array.from(selectedIds),
          operation,
        }),
      });
      const data = await res.json();
      if (!res.ok) throw new Error(data.error || 'Bulk action failed');
      const stateForFetch = selectedState || '';
      fetchAgencies(stateForFetch, search, filter, page);
      if (selectedState) {
        fetchSummary(selectedState, search, filter);
      }
      setSelectedIds(new Set());
    } catch (e) {
      setError((e as Error).message || 'Bulk action failed');
    }
  };

  const copyToClipboard = (text: string) => {
    navigator.clipboard.writeText(text).catch(() => {});
  };

  return (
    <WpAdminLayout activeTool="other-agencies-manager">
      <div className="p-6 max-w-full">
        {/* Header */}
        <div className="flex items-start justify-between mb-6">
          <div>
            <h1 className="text-2xl font-bold text-slate-900 flex items-center gap-2">
              <Building2 size={22} className="text-blue-600" />
              Other Agencies Manager
            </h1>
            <p className="text-sm text-slate-500 mt-1">
              Manage bulk agency listings — badges, website URLs, visibility, and paid status.
              This is separate from Top 25 slot inventory.
            </p>
          </div>
        </div>

        {/* State + Search + Filter Bar */}
        <div className="flex flex-wrap gap-3 mb-5">
          <div className="relative">
            <select
              value={selectedState}
              onChange={e => setSelectedState(e.target.value)}
              className="pl-3 pr-8 py-2 border border-slate-200 rounded-xl bg-white text-sm font-medium text-slate-700 focus:outline-none focus:ring-2 focus:ring-blue-500 appearance-none min-w-[180px]"
            >
              <option value="">Select a state…</option>
              {US_STATES.map(s => (
                <option key={s.slug} value={s.slug}>
                  {s.name}
                </option>
              ))}
            </select>
            <ChevronDown size={14} className="absolute right-2.5 top-1/2 -translate-y-1/2 text-slate-400 pointer-events-none" />
          </div>

          <div className="relative flex-1 min-w-[200px] max-w-md">
            <div className="mb-1 text-xs font-medium text-slate-600">
              {!selectedState ? (
                <span className="flex items-center gap-1">
                  <Globe size={12} className="text-blue-600" />
                  Global search across all states
                </span>
              ) : (
                <span className="flex items-center gap-1">
                  <MapPin size={12} className="text-emerald-600" />
                  Search within {US_STATES.find(s => s.slug === selectedState)?.name || selectedState}
                </span>
              )}
            </div>
            <div className="relative">
              <Search size={14} className="absolute left-3 top-1/2 -translate-y-1/2 text-slate-400" />
              <input
                type="text"
                placeholder={!selectedState ? "Search by email, name, or website…" : "Search name, email, website…"}
                value={searchRaw}
                onChange={e => setSearchRaw(e.target.value)}
                className="w-full pl-8 pr-3 py-2 border border-slate-200 rounded-xl bg-white text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
              />
            </div>
          </div>

          <div className="flex gap-1.5 flex-wrap">
            {FILTERS.map(f => (
              <button
                key={f.key}
                type="button"
                onClick={() => setFilter(f.key)}
                className={`px-3 py-1.5 rounded-full text-xs font-semibold border transition-colors
                  ${filter === f.key
                    ? 'bg-blue-600 text-white border-blue-600'
                    : 'bg-white text-slate-600 border-slate-200 hover:border-slate-400'
                  }`}
              >
                {f.label}
              </button>
            ))}
          </div>
        </div>

        {/* Summary Cards */}
        {selectedState && (
          <div className="grid grid-cols-2 sm:grid-cols-4 lg:grid-cols-8 gap-3 mb-5">
            <SummaryCard
              label="Total"
              value={summaryLoading ? '…' : (summary?.total ?? 0)}
              color="text-slate-900"
              onClick={() => setFilter('all')}
              active={filter === 'all'}
            />
            <SummaryCard
              label="Active"
              value={summaryLoading ? '…' : (summary?.active ?? 0)}
              color="text-green-600"
              onClick={() => setFilter('active')}
              active={filter === 'active'}
            />
            <SummaryCard
              label="Inactive"
              value={summaryLoading ? '…' : (summary?.inactive ?? 0)}
              color="text-red-500"
              onClick={() => setFilter('inactive')}
              active={filter === 'inactive'}
            />
            <SummaryCard
              label="Standard Paid ($97)"
              value={summaryLoading ? '…' : (summary?.paid ?? 0)}
              color="text-emerald-600"
              onClick={() => setFilter('paid')}
              active={filter === 'paid'}
            />
            <SummaryCard
              label="Free"
              value={summaryLoading ? '…' : (summary?.unpaid ?? 0)}
              color="text-slate-500"
              onClick={() => setFilter('unpaid')}
              active={filter === 'unpaid'}
            />
            <SummaryCard
              label="No Website"
              value={summaryLoading ? '…' : (summary?.missing_website ?? 0)}
              color="text-amber-600"
              onClick={() => setFilter('missing_website')}
              active={filter === 'missing_website'}
            />
            <SummaryCard
              label="With Badges"
              value={summaryLoading ? '…' : (summary?.with_badges ?? 0)}
              color="text-blue-600"
              onClick={() => setFilter('has_badges')}
              active={filter === 'has_badges'}
            />
            <SummaryCard
              label="No Badges"
              value={summaryLoading ? '…' : ((summary?.total ?? 0) - (summary?.with_badges ?? 0))}
              color="text-slate-400"
              onClick={() => setFilter('no_badges')}
              active={filter === 'no_badges'}
            />
          </div>
        )}

        {/* Displacement notice */}
        {displacedNotice && (
          <div className="flex items-start gap-3 bg-amber-50 border border-amber-300 rounded-xl px-4 py-3 mb-4 text-sm">
            <AlertTriangle size={16} className="text-amber-600 flex-shrink-0 mt-0.5" />
            <div className="flex-1">
              <span className="font-semibold text-amber-800">Slot reassigned: </span>
              <span className="text-amber-700">
                <span className="font-medium">"{displacedNotice.name}"</span> was removed from slot {displacedNotice.slot} to make room for the new owner.
              </span>
            </div>
            <button
              type="button"
              onClick={() => setDisplacedNotice(null)}
              className="text-amber-500 hover:text-amber-700 flex-shrink-0"
            >
              <X size={14} />
            </button>
          </div>
        )}

        {/* Showcase Positions — Paginated Range Viewer */}
        {selectedState && (() => {
          const blockStart = showcaseBlock * 12 + 1;
          const blockEnd = showcaseBlock * 12 + 12;
          const maxBlock = showcaseTotal != null ? Math.max(0, Math.ceil(showcaseTotal / 12) - 1) : showcaseBlock;
          const totalBlocks = maxBlock + 1;

          const reasonLabel = (r?: string) => {
            switch (r) {
              case 'manual_slot_owner':        return { label: 'PIN', cls: 'bg-blue-600 text-white' };
              case 'paid_standard_activation': return { label: 'Paid', cls: 'bg-emerald-600 text-white' };
              case 'high_intent':              return { label: 'Intent', cls: 'bg-orange-500 text-white' };
              case 'fallback':                 return { label: 'Auto', cls: 'bg-slate-400 text-white' };
              default:                         return { label: 'Auto', cls: 'bg-slate-300 text-slate-700' };
            }
          };

          return (
            <div className="bg-gradient-to-r from-blue-50 to-slate-50 border border-blue-200 rounded-2xl p-5 mb-5">
              {/* Header row */}
              <div className="flex items-center justify-between mb-3 gap-3 flex-wrap">
                <div>
                  <h3 className="text-sm font-bold text-slate-900 flex items-center gap-2">
                    <Layers size={15} className="text-blue-600" />
                    Showcase Positions {blockStart}–{blockEnd}
                  </h3>
                  <p className="text-xs text-slate-500 mt-0.5">
                    Live ranking preview — not affected by table filters
                    {showcaseTotal != null && (
                      <span className="ml-1 text-slate-400">· {showcaseTotal.toLocaleString()} total agencies</span>
                    )}
                  </p>
                </div>

                <div className="flex items-center gap-2 flex-wrap">
                  {/* Jump dropdown */}
                  {totalBlocks > 1 && (
                    <select
                      value={showcaseBlock}
                      onChange={e => setShowcaseBlock(Number(e.target.value))}
                      className="text-xs border border-slate-200 rounded-lg px-2 py-1.5 bg-white text-slate-700 focus:outline-none focus:ring-2 focus:ring-blue-400"
                    >
                      {Array.from({ length: totalBlocks }, (_, i) => (
                        <option key={i} value={i}>
                          {i * 12 + 1}–{i * 12 + 12}
                        </option>
                      ))}
                    </select>
                  )}

                  {/* Prev / Next */}
                  <div className="flex items-center gap-1">
                    <button
                      type="button"
                      disabled={showcaseBlock === 0}
                      onClick={() => setShowcaseBlock(b => Math.max(0, b - 1))}
                      className="p-1.5 rounded-lg border border-slate-200 bg-white text-slate-600 hover:border-blue-300 hover:text-blue-600 disabled:opacity-30 disabled:cursor-not-allowed transition-colors"
                      title="Previous block"
                    >
                      <ChevronLeft size={14} />
                    </button>
                    <button
                      type="button"
                      disabled={showcaseBlock >= maxBlock && showcaseTotal != null}
                      onClick={() => setShowcaseBlock(b => b + 1)}
                      className="p-1.5 rounded-lg border border-slate-200 bg-white text-slate-600 hover:border-blue-300 hover:text-blue-600 disabled:opacity-30 disabled:cursor-not-allowed transition-colors"
                      title="Next block"
                    >
                      <ChevronRightIcon size={14} />
                    </button>
                  </div>

                  {showcaseLoading && <RefreshCw size={14} className="animate-spin text-blue-600" />}
                  <button
                    type="button"
                    onClick={() => fetchShowcaseRange(selectedState, showcaseBlock)}
                    className="text-blue-600 hover:text-blue-700 text-xs font-medium flex items-center gap-1 px-2 py-1.5 rounded-lg hover:bg-blue-50 transition-colors"
                  >
                    <RefreshCw size={11} />
                    Refresh
                  </button>
                </div>
              </div>

              {/* Slot grid */}
              {showcaseRange.length > 0 ? (
                <div className="grid grid-cols-2 sm:grid-cols-3 lg:grid-cols-4 xl:grid-cols-6 gap-1.5">
                  {showcaseRange.map((agency, idx) => {
                    const pos = showcaseBlock * 12 + idx + 1;
                    const isPinned = agency.showcase_pinned && agency._selection_reason === 'manual_slot_owner';
                    const reason = reasonLabel(agency._selection_reason);
                    const popoverOpen = isPinned && pinPopover?.id === agency.id;
                    return (
                      <div
                        key={agency.id}
                        data-pin-popover={popoverOpen ? 'true' : undefined}
                        className={`relative rounded-lg p-2 text-xs flex flex-col gap-1 border transition-colors
                          ${isPinned
                            ? 'bg-blue-50 border-blue-300 ring-1 ring-blue-200'
                            : 'bg-white border-slate-200'
                          }`}
                      >
                        <div className="flex items-center justify-between gap-1">
                          <span className={`font-bold text-xs px-1.5 py-0.5 rounded shrink-0
                            ${isPinned ? 'bg-blue-600 text-white' : 'bg-slate-200 text-slate-600'}`}>
                            #{pos}
                          </span>
                          {isPinned ? (
                            <button
                              type="button"
                              data-pin-popover="true"
                              onClick={(e) => {
                                e.stopPropagation();
                                setPinPopover(prev =>
                                  prev?.id === agency.id
                                    ? null
                                    : { id: agency.id, mode: 'menu', moveInput: '' }
                                );
                              }}
                              className={`text-xs px-1.5 py-0.5 rounded font-semibold ${reason.cls} hover:opacity-75 cursor-pointer transition-opacity`}
                              title="Click to manage this pinned slot"
                            >
                              PIN ▾
                            </button>
                          ) : (
                            <span className={`text-xs px-1.5 py-0.5 rounded font-semibold ${reason.cls}`}>
                              {reason.label}
                            </span>
                          )}
                        </div>
                        <div className="font-medium text-slate-900 leading-tight line-clamp-2" title={agency.name}>
                          {agency.name}
                        </div>
                        {agency.city && (
                          <div className="text-xs text-slate-400 truncate">{agency.city}</div>
                        )}
                        {agency._activity_score != null && agency._activity_score > 0 && (
                          <div className="text-xs text-orange-600 font-medium">
                            score {agency._activity_score}
                          </div>
                        )}
                        {isPinned && !popoverOpen && (
                          <div className="text-xs text-blue-600 font-medium">
                            Pinned → slot {agency.showcase_position}
                          </div>
                        )}
                        {agency.is_paid_listing && !isPinned && (
                          <div className="text-xs text-emerald-600 font-medium">Paid</div>
                        )}

                        {/* ── Pin action popover ── */}
                        {popoverOpen && (
                          <div
                            data-pin-popover="true"
                            className="absolute inset-x-0 top-0 z-30 bg-white border border-blue-300 rounded-lg shadow-xl p-2 flex flex-col gap-1.5"
                          >
                            <div className="flex items-center justify-between mb-0.5">
                              <span className="text-xs font-semibold text-slate-800 truncate mr-1 leading-tight">{agency.name}</span>
                              <button
                                type="button"
                                data-pin-popover="true"
                                onClick={() => setPinPopover(null)}
                                className="text-slate-400 hover:text-slate-700 shrink-0 transition-colors"
                              >
                                <X size={12} />
                              </button>
                            </div>

                            {pinPopover!.mode === 'menu' && (
                              <>
                                <button
                                  type="button"
                                  data-pin-popover="true"
                                  onClick={() => setPinPopover(p => p ? { ...p, mode: 'unpin_confirm' } : null)}
                                  className="text-left text-xs text-red-600 hover:text-red-700 hover:bg-red-50 rounded px-2 py-1.5 transition-colors flex items-center gap-1.5 font-medium"
                                >
                                  <X size={11} />
                                  Unpin from slot #{agency.showcase_position ?? pos}
                                </button>
                                <button
                                  type="button"
                                  data-pin-popover="true"
                                  onClick={() => setPinPopover(p => p ? { ...p, mode: 'move_slot', moveInput: String(agency.showcase_position ?? pos) } : null)}
                                  className="text-left text-xs text-blue-600 hover:text-blue-700 hover:bg-blue-50 rounded px-2 py-1.5 transition-colors flex items-center gap-1.5 font-medium"
                                >
                                  <MapPin size={11} />
                                  Move to another slot…
                                </button>
                                <a
                                  href={`/wp-admin/email/agency-lookup?prefill_agency_id=${agency.id}`}
                                  target="_blank"
                                  rel="noreferrer"
                                  data-pin-popover="true"
                                  className="text-left text-xs text-slate-600 hover:text-slate-800 hover:bg-slate-50 rounded px-2 py-1.5 transition-colors flex items-center gap-1.5"
                                  onClick={() => setPinPopover(null)}
                                >
                                  <ExternalLink size={11} />
                                  Open agency details
                                </a>
                              </>
                            )}

                            {pinPopover!.mode === 'unpin_confirm' && (
                              <div className="flex flex-col gap-2">
                                <div className="text-xs text-slate-700 leading-snug">
                                  Unpin <strong className="text-slate-900">{agency.name}</strong> from slot <strong>#{agency.showcase_position ?? pos}</strong>?
                                </div>
                                <div className="flex gap-1.5">
                                  <button
                                    type="button"
                                    data-pin-popover="true"
                                    onClick={async () => {
                                      setPinPopover(null);
                                      await handleInlineShowcaseUpdate(agency.id, false, null);
                                    }}
                                    className="flex-1 text-xs bg-red-600 text-white rounded px-2 py-1.5 hover:bg-red-700 transition-colors font-medium"
                                  >
                                    Yes, unpin
                                  </button>
                                  <button
                                    type="button"
                                    data-pin-popover="true"
                                    onClick={() => setPinPopover(p => p ? { ...p, mode: 'menu' } : null)}
                                    className="flex-1 text-xs bg-slate-100 text-slate-700 rounded px-2 py-1.5 hover:bg-slate-200 transition-colors"
                                  >
                                    Cancel
                                  </button>
                                </div>
                              </div>
                            )}

                            {pinPopover!.mode === 'move_slot' && (
                              <div className="flex flex-col gap-2">
                                <div className="text-xs text-slate-600">Move to slot number:</div>
                                <input
                                  type="number"
                                  min="1"
                                  autoFocus
                                  data-pin-popover="true"
                                  value={pinPopover!.moveInput}
                                  onChange={e => setPinPopover(p => p ? { ...p, moveInput: e.target.value } : null)}
                                  onKeyDown={e => {
                                    if (e.key === 'Escape') setPinPopover(p => p ? { ...p, mode: 'menu' } : null);
                                    if (e.key === 'Enter') {
                                      const newPos = parseInt(pinPopover!.moveInput, 10);
                                      if (newPos >= 1) {
                                        setPinPopover(null);
                                        handleInlineShowcaseUpdate(agency.id, true, newPos);
                                      }
                                    }
                                  }}
                                  className="w-full px-2 py-1.5 border border-blue-300 rounded text-xs focus:outline-none focus:ring-2 focus:ring-blue-400 text-center"
                                  placeholder="e.g. 3"
                                />
                                <div className="flex gap-1.5">
                                  <button
                                    type="button"
                                    data-pin-popover="true"
                                    onClick={() => {
                                      const newPos = parseInt(pinPopover!.moveInput, 10);
                                      if (newPos >= 1) {
                                        setPinPopover(null);
                                        handleInlineShowcaseUpdate(agency.id, true, newPos);
                                      }
                                    }}
                                    disabled={!pinPopover!.moveInput || parseInt(pinPopover!.moveInput, 10) < 1}
                                    className="flex-1 text-xs bg-blue-600 text-white rounded px-2 py-1.5 hover:bg-blue-700 transition-colors font-medium disabled:opacity-40"
                                  >
                                    Move
                                  </button>
                                  <button
                                    type="button"
                                    data-pin-popover="true"
                                    onClick={() => setPinPopover(p => p ? { ...p, mode: 'menu' } : null)}
                                    className="flex-1 text-xs bg-slate-100 text-slate-700 rounded px-2 py-1.5 hover:bg-slate-200 transition-colors"
                                  >
                                    Cancel
                                  </button>
                                </div>
                              </div>
                            )}
                          </div>
                        )}
                      </div>
                    );
                  })}
                </div>
              ) : (
                <div className="text-center py-8 text-slate-400 text-sm">
                  {showcaseLoading ? 'Loading…' : 'No agencies in this range'}
                </div>
              )}

              {/* Legend */}
              <div className="mt-3 pt-3 border-t border-blue-200 flex items-center gap-4 flex-wrap text-xs text-slate-500">
                <span className="flex items-center gap-1.5">
                  <span className="inline-block w-6 h-4 rounded bg-blue-600 shrink-0" />
                  Manually pinned
                </span>
                <span className="flex items-center gap-1.5">
                  <span className="inline-block w-8 h-4 rounded bg-emerald-600 shrink-0" />
                  Paid standard
                </span>
                <span className="flex items-center gap-1.5">
                  <span className="inline-block w-8 h-4 rounded bg-orange-500 shrink-0" />
                  High intent
                </span>
                <span className="flex items-center gap-1.5">
                  <span className="inline-block w-6 h-4 rounded bg-slate-400 shrink-0" />
                  Auto-fill
                </span>
              </div>
            </div>
          );
        })()}

        {/* Error */}
        {error && (
          <div className="mb-4 p-3 bg-red-50 border border-red-200 rounded-xl text-sm text-red-700 flex items-center gap-2">
            <AlertTriangle size={14} />
            {error}
            <button onClick={() => setError('')} className="ml-auto text-red-400 hover:text-red-600">
              <X size={14} />
            </button>
          </div>
        )}

        {/* Empty state — no state selected */}
        {/* Empty State: No state + No search */}
        {!selectedState && !search.trim() && (
          <div className="text-center py-16 text-slate-400">
            <div className="bg-gradient-to-br from-blue-50 to-slate-50 rounded-2xl border border-slate-200 p-12 max-w-2xl mx-auto">
              <div className="flex items-center justify-center gap-3 mb-4">
                <Globe size={40} className="text-blue-400" />
                <span className="text-2xl text-slate-300">/</span>
                <MapPin size={40} className="text-emerald-400" />
              </div>
              <p className="font-bold text-lg text-slate-700 mb-2">Dual-Mode Agency Manager</p>
              <p className="text-sm text-slate-500 max-w-md mx-auto leading-relaxed">
                <strong className="text-slate-600">Search by agency email or agency name</strong> to manage showcase placement across all states,
                <br />
                or <strong className="text-slate-600">select a state</strong> to browse its listings.
              </p>
            </div>
          </div>
        )}

        {/* Table */}
        {(selectedState || search.trim()) && (
          <div className="bg-white rounded-2xl border border-slate-200 overflow-hidden shadow-sm">
            {/* Table Header */}
            <div className="flex items-center justify-between px-4 py-3 border-b border-slate-100 bg-slate-50">
              <div className="text-xs text-slate-500 font-medium">
                {loading ? 'Loading…' : `${total.toLocaleString()} agencies`}
                {selectedState && (
                  <span className="ml-2 text-slate-400">in {formatStateName(selectedState)}</span>
                )}
              </div>
              <button
                type="button"
                onClick={() => fetchAgencies(selectedState, search, filter, page)}
                className="p-1.5 text-slate-400 hover:text-slate-700 hover:bg-white rounded-lg transition-colors"
                title="Refresh"
              >
                <RefreshCw size={13} className={loading ? 'animate-spin' : ''} />
              </button>
            </div>

            {/* Table */}
            <div className="overflow-x-auto">
              <table className="w-full text-sm">
                <thead>
                  <tr className="border-b border-slate-100 text-xs text-slate-500 font-semibold uppercase tracking-wide">
                    <th className="pl-4 pr-2 py-2.5 text-left w-8">
                      <input
                        type="checkbox"
                        checked={agencies.length > 0 && selectedIds.size === agencies.length}
                        onChange={toggleSelectAll}
                        className="rounded border-slate-300 text-blue-600 focus:ring-blue-500"
                      />
                    </th>
                    <th className="px-3 py-2.5 text-left">Agency</th>
                    {!selectedState && <th className="px-3 py-2.5 text-left">State</th>}
                    <th className="px-3 py-2.5 text-left">Email</th>
                    <th className="px-3 py-2.5 text-left">Website</th>
                    <th className="px-3 py-2.5 text-left">Status</th>
                    <th className="px-3 py-2.5 text-left">Paid</th>
                    <th className="px-3 py-2.5 text-left">Badges</th>
                    <th className="px-3 py-2.5 text-left">Showcase</th>
                    {selectedState && <th className="px-3 py-2.5 text-right" title="Canonical ranking score (compute_agency_intent_scores v1) — same source used by the live state page">Score</th>}
                    <th className="px-3 py-2.5 text-right pr-4">Actions</th>
                  </tr>
                </thead>
                <tbody className="divide-y divide-slate-50">
                  {loading && agencies.length === 0 ? (
                    <tr>
                      <td colSpan={10} className="py-12 text-center text-slate-400">
                        <RefreshCw size={20} className="animate-spin mx-auto mb-2 opacity-40" />
                        Loading agencies…
                      </td>
                    </tr>
                  ) : agencies.length === 0 ? (
                    <tr>
                      <td colSpan={10} className="py-12 text-center text-slate-400">
                        No agencies found
                      </td>
                    </tr>
                  ) : (
                    agencies.map(agency => (
                      <>
                        <tr
                          key={agency.id}
                          className={`hover:bg-slate-50 transition-colors ${selectedIds.has(agency.id) ? 'bg-blue-50' : ''}`}
                        >
                          <td className="pl-4 pr-2 py-2.5">
                            <input
                              type="checkbox"
                              checked={selectedIds.has(agency.id)}
                              onChange={() => toggleSelect(agency.id)}
                              className="rounded border-slate-300 text-blue-600 focus:ring-blue-500"
                            />
                          </td>

                          <td className="px-3 py-2.5">
                            <div className="font-medium text-slate-900 leading-tight flex items-center gap-1.5">
                              <button
                                onClick={() => {
                                  const dest = agency.email
                                    ? `/wp-admin/email/agency-lookup?prefill_email=${encodeURIComponent(agency.email)}`
                                    : `/wp-admin/email/agency-lookup?prefill_agency_id=${agency.id}`;
                                  navigate(dest);
                                }}
                                className="text-left hover:text-blue-600 hover:underline underline-offset-2 transition-colors"
                                title="Open in Agency Lookup"
                              >{agency.name}</button>
                              {(() => {
                                const ranked = showcaseRange.find(a => a.id === agency.id);
                                if (!ranked) return null;
                                const pos = showcaseBlock * 12 + showcaseRange.indexOf(ranked) + 1;
                                return (
                                  <span className="inline-flex items-center px-1.5 py-0.5 rounded text-xs font-bold bg-blue-100 text-blue-700 border border-blue-300">
                                    #{pos}
                                  </span>
                                );
                              })()}
                            </div>
                            {agency.city && (
                              <div className="text-xs text-slate-400 mt-0.5">{agency.city}</div>
                            )}
                          </td>

                          {!selectedState && (
                            <td className="px-3 py-2.5">
                              <div className="flex items-center gap-1.5">
                                <span className="text-xs font-medium text-slate-700">
                                  {US_STATES.find(s => s.slug === agency.state_slug)?.name || agency.state_slug}
                                </span>
                                <button
                                  type="button"
                                  onClick={() => {
                                    setSelectedState(agency.state_slug);
                                    // Scroll to top after state change
                                    window.scrollTo({ top: 0, behavior: 'smooth' });
                                  }}
                                  className="p-1 text-blue-600 hover:bg-blue-50 rounded transition-colors"
                                  title="Open state view"
                                >
                                  <ExternalLink size={12} />
                                </button>
                              </div>
                            </td>
                          )}

                          <td className="px-3 py-2.5">
                            {agency.email ? (
                              <span className="text-xs text-slate-600 font-mono bg-slate-100 px-1.5 py-0.5 rounded">
                                {agency.email.length > 28
                                  ? agency.email.slice(0, 25) + '…'
                                  : agency.email}
                              </span>
                            ) : (
                              <span className="text-xs text-slate-300">—</span>
                            )}
                          </td>

                          <td className="px-3 py-2.5">
                            {agency.website_url ? (
                              <div className="flex items-center gap-1.5">
                                <a
                                  href={agency.website_url}
                                  target="_blank"
                                  rel="noopener noreferrer"
                                  className={`text-xs hover:underline flex items-center gap-1
                                    ${isBadUrl(agency.website_url) ? 'text-amber-600' : 'text-blue-600'}`}
                                  title={agency.website_url}
                                >
                                  <Globe size={10} />
                                  {formatUrl(agency.website_url)}
                                </a>
                                {isBadUrl(agency.website_url) && (
                                  <AlertTriangle size={10} className="text-amber-500 flex-shrink-0" title="Suspicious URL" />
                                )}
                              </div>
                            ) : (
                              <span className="text-xs text-amber-500 flex items-center gap-1">
                                <AlertTriangle size={10} />
                                Missing
                              </span>
                            )}
                          </td>

                          <td className="px-3 py-2.5">
                            <ActiveBadge active={agency.is_active !== false} />
                          </td>

                          <td className="px-3 py-2.5">
                            <PaidStatusBadge agency={agency} />
                          </td>

                          <td className="px-3 py-2.5">
                            {agency.services && agency.services.length > 0 ? (
                              <div className="flex items-center gap-1.5">
                                <span className="text-xs text-slate-600 bg-slate-100 px-1.5 py-0.5 rounded font-medium">
                                  {agency.services[0]}
                                </span>
                                {agency.services.length > 1 && (
                                  <span className="text-xs text-slate-400">
                                    +{agency.services.length - 1}
                                  </span>
                                )}
                              </div>
                            ) : (
                              <span className="text-xs text-slate-300">—</span>
                            )}
                          </td>

                          <td className="px-3 py-2.5">
                            <div className="flex items-center gap-2">
                              <label className="relative inline-flex items-center cursor-pointer">
                                <input
                                  type="checkbox"
                                  checked={agency.showcase_pinned || false}
                                  onChange={(e) => {
                                    const pinned = e.target.checked;
                                    const pos = pinned
                                      ? (slotDraft[agency.id]
                                          ? parseInt(slotDraft[agency.id], 10) || null
                                          : agency.showcase_position ?? null)
                                      : null;
                                    handleInlineShowcaseUpdate(agency.id, pinned, pos);
                                  }}
                                  className="sr-only peer"
                                />
                                <div className="w-7 h-4 bg-slate-200 peer-focus:outline-none peer-focus:ring-2 peer-focus:ring-blue-300 rounded-full peer peer-checked:after:translate-x-3 after:content-[''] after:absolute after:top-[2px] after:left-[2px] after:bg-white after:rounded-full after:h-3 after:w-3 after:transition-all peer-checked:bg-blue-600"></div>
                              </label>
                              {agency.showcase_pinned && (
                                <input
                                  type="number"
                                  min="1"
                                  placeholder="1+"
                                  value={slotDraft[agency.id] ?? (agency.showcase_position != null ? String(agency.showcase_position) : '')}
                                  onChange={(e) => {
                                    setSlotDraft(prev => ({ ...prev, [agency.id]: e.target.value }));
                                  }}
                                  onBlur={(e) => {
                                    const raw = e.target.value.trim();
                                    const pos = raw ? parseInt(raw, 10) : null;
                                    if (pos === null || pos >= 1) {
                                      handleInlineShowcaseUpdate(agency.id, true, pos);
                                    } else {
                                      setSlotDraft(prev => ({
                                        ...prev,
                                        [agency.id]: agency.showcase_position != null ? String(agency.showcase_position) : '',
                                      }));
                                    }
                                  }}
                                  onKeyDown={(e) => {
                                    if (e.key === 'Enter') {
                                      const raw = (e.target as HTMLInputElement).value.trim();
                                      const pos = raw ? parseInt(raw, 10) : null;
                                      if (pos === null || pos >= 1) {
                                        handleInlineShowcaseUpdate(agency.id, true, pos);
                                        (e.target as HTMLInputElement).blur();
                                      }
                                    } else if (e.key === 'Escape') {
                                      setSlotDraft(prev => ({
                                        ...prev,
                                        [agency.id]: agency.showcase_position != null ? String(agency.showcase_position) : '',
                                      }));
                                      (e.target as HTMLInputElement).blur();
                                    }
                                  }}
                                  className="w-14 px-1.5 py-0.5 text-xs border border-blue-400 rounded focus:outline-none focus:ring-2 focus:ring-blue-500 text-center font-medium bg-blue-50"
                                  title="Showcase position 1+ (Enter to save)"
                                />
                              )}
                              {agency.showcase_pinned && agency.showcase_position != null && (
                                <span className="text-xs font-bold text-blue-700 bg-blue-100 px-1.5 py-0.5 rounded">
                                  #{agency.showcase_position}
                                </span>
                              )}
                            </div>
                          </td>

                          {selectedState && (
                            <td className="px-3 py-2.5 text-right">
                              {agency.activity_score != null && agency.activity_score > 0 ? (
                                <span className="text-xs font-mono font-semibold text-slate-700 bg-slate-100 px-1.5 py-0.5 rounded" title={`Ranking score (deepest step: ${agency.deepest_step ?? 0})`}>
                                  {agency.activity_score}
                                </span>
                              ) : (
                                <span className="text-xs text-slate-300">—</span>
                              )}
                            </td>
                          )}

                          <td className="px-3 py-2.5 pr-4 text-right">
                            <div className="flex items-center gap-1 justify-end">
                              {agency.slug && (
                                <a
                                  href={`/your-agency/${agency.slug}`}
                                  target="_blank"
                                  rel="noopener noreferrer"
                                  className="p-1.5 text-slate-400 hover:text-blue-600 hover:bg-blue-50 rounded-lg transition-colors"
                                  title="View /your-agency page"
                                >
                                  <ExternalLink size={13} />
                                </a>
                              )}
                              <button
                                type="button"
                                onClick={() => copyToClipboard(agency.id)}
                                className="p-1.5 text-slate-400 hover:text-slate-700 hover:bg-slate-100 rounded-lg transition-colors"
                                title="Copy agency ID"
                              >
                                <Copy size={13} />
                              </button>
                              <button
                                type="button"
                                onClick={() =>
                                  setExpandedId(expandedId === agency.id ? null : agency.id)
                                }
                                className={`p-1.5 rounded-lg transition-colors
                                  ${expandedId === agency.id
                                    ? 'bg-blue-100 text-blue-700'
                                    : 'text-slate-400 hover:text-blue-600 hover:bg-blue-50'
                                  }`}
                                title="Edit agency"
                              >
                                {expandedId === agency.id ? <ChevronDown size={13} /> : <Edit3 size={13} />}
                              </button>
                            </div>
                          </td>
                        </tr>

                        {expandedId === agency.id && (
                          <tr key={`${agency.id}-expanded`}>
                            <td colSpan={10} className="p-0">
                              <ExpandedPanel
                                agency={agency}
                                onUpdate={handleUpdate}
                                onDisplace={(dis) => {
                                  setAgencies(prev =>
                                    prev.map(a =>
                                      a.id === dis.id
                                        ? { ...a, showcase_pinned: false, showcase_position: null }
                                        : a,
                                    ),
                                  );
                                  setSlotDraft(prev => ({ ...prev, [dis.id]: '' }));
                                  setDisplacedNotice({ name: dis.name, slot: dis.previous_slot });
                                  setTimeout(() => setDisplacedNotice(null), 6000);
                                }}
                                onClose={() => setExpandedId(null)}
                                token={token}
                              />
                            </td>
                          </tr>
                        )}
                      </>
                    ))
                  )}
                </tbody>
              </table>
            </div>

            {/* Pagination */}
            {totalPages > 1 && (
              <div className="flex items-center justify-between px-4 py-3 border-t border-slate-100 bg-slate-50">
                <span className="text-xs text-slate-500">
                  Page {page + 1} of {totalPages} · {total.toLocaleString()} total
                </span>
                <div className="flex items-center gap-1">
                  <button
                    type="button"
                    onClick={() => setPage(p => Math.max(0, p - 1))}
                    disabled={page === 0}
                    className="p-1.5 text-slate-500 hover:text-slate-900 hover:bg-white rounded-lg border border-transparent hover:border-slate-200 disabled:opacity-30 transition-colors"
                  >
                    <ChevronLeft size={14} />
                  </button>
                  {Array.from({ length: Math.min(totalPages, 7) }, (_, i) => {
                    const p = totalPages <= 7 ? i : Math.max(0, Math.min(page - 3, totalPages - 7)) + i;
                    return (
                      <button
                        key={p}
                        type="button"
                        onClick={() => setPage(p)}
                        className={`px-2.5 py-1 rounded-lg text-xs font-medium transition-colors
                          ${p === page ? 'bg-blue-600 text-white' : 'text-slate-600 hover:bg-white hover:border hover:border-slate-200'}`}
                      >
                        {p + 1}
                      </button>
                    );
                  })}
                  <button
                    type="button"
                    onClick={() => setPage(p => Math.min(totalPages - 1, p + 1))}
                    disabled={page >= totalPages - 1}
                    className="p-1.5 text-slate-500 hover:text-slate-900 hover:bg-white rounded-lg border border-transparent hover:border-slate-200 disabled:opacity-30 transition-colors"
                  >
                    <ChevronRightIcon size={14} />
                  </button>
                </div>
              </div>
            )}
          </div>
        )}
      </div>

      {/* Bulk Action Bar */}
      {selectedIds.size > 0 && (
        <BulkActionBar
          count={selectedIds.size}
          onClear={() => setSelectedIds(new Set())}
          onAction={handleBulkAction}
        />
      )}
    </WpAdminLayout>
  );
}
