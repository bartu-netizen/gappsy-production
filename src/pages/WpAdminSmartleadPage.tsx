import { useState, useEffect } from 'react';
import {
  RefreshCw, AlertTriangle, AlertCircle, CheckCircle, Loader,
  Download, Search, Users, Mail, BarChart2, Zap, ArrowRight, ChevronDown, Database,
} from 'lucide-react';
import EmailModuleLayout from '../components/wpadmin/EmailModuleLayout';
import ListCleanVerificationDiagnostic from '../components/admin/ListCleanVerificationDiagnostic';
import { useAdminSession } from '../contexts/AdminSessionContext';
import { adminFetch } from '../utils/adminFetch';
import { formatStateName } from '../utils/formatLocation';

const states = [
  'alabama','alaska','arizona','arkansas','california','colorado','connecticut',
  'delaware','district-of-columbia','florida','georgia','hawaii','idaho',
  'illinois','indiana','iowa','kansas','kentucky','louisiana','maine',
  'maryland','massachusetts','michigan','minnesota','mississippi','missouri',
  'montana','nebraska','nevada','new-hampshire','new-jersey','new-mexico',
  'new-york','north-carolina','north-dakota','ohio','oklahoma','oregon',
  'pennsylvania','puerto-rico','rhode-island','south-carolina','south-dakota',
  'tennessee','texas','utah','vermont','virginia','washington',
  'west-virginia','wisconsin','wyoming',
];

interface Stats {
  ok: boolean;
  filters: { state?: string; campaign_id?: string; include_inactive_agencies?: boolean };
  raw_valid_inventory: {
    total_valid_emails: number;
    valid_on_active_agencies: number;
    valid_on_inactive_agencies: number;
    unique_valid_emails: number;
    unique_agencies_with_valid: number;
  };
  exclusion_breakdown: {
    excluded_inactive_agency: number;
    excluded_identity_contaminated: number;
    excluded_opted_out: number;
    excluded_blocked: number;
    total_excluded: number;
  };
  final_sendable: {
    sendable_email_rows: number;
    sendable_with_inactive: number;
    unique_agencies: number;
    unique_identities: number;
  };
  inventory: {
    total_email_rows: number;
    clean_email_rows: number;
    ready_email_rows: number;
    invalid_email_rows: number;
    pending_email_rows: number;
    retry_email_rows: number;
    failed_email_rows: number;
    risky_email_rows: number;
    catch_all_email_rows: number;
    contaminated_email_rows?: number;
  };
  agency_inventory: {
    total_unique_agencies: number;
    active_agencies: number;
    inactive_agencies: number;
    unique_agencies_with_clean_email: number;
    unique_agencies_with_ready_email: number;
    agencies_with_1_clean_email: number;
    agencies_with_2_clean_emails: number;
    agencies_with_3plus_clean_emails: number;
    avg_clean_emails_per_clean_agency: number;
  };
  campaign_performance_email_level: {
    synced_email_rows: number;
    opened_email_rows: number;
    clicked_email_rows: number;
    replied_email_rows: number;
    bounced_email_rows: number;
    unsubscribed_email_rows: number;
  };
  campaign_performance_agency_level: {
    synced_unique_agencies: number;
    opened_unique_agencies: number;
    clicked_unique_agencies: number;
    replied_unique_agencies: number;
    bounced_unique_agencies: number;
    unsubscribed_unique_agencies: number;
  };
  role_based_split: {
    clean_role_based: number;
    clean_personal: number;
    ready_role_based: number;
    ready_personal: number;
  };
  distortion: {
    avg_synced_emails_per_contacted_agency: number | null;
    contacted_agencies_with_1_email: number;
    contacted_agencies_with_2_emails: number;
    contacted_agencies_with_3plus_emails: number;
  };
  send_mode_comparison: {
    all_clean_emails: { email_rows: number; unique_agencies: number };
    one_per_agency: { email_rows: number; unique_agencies: number };
  };
  health: any;
  warnings: string[];
  recent_sync_runs: Array<Record<string, any>>;
  recent_webhook_events: Array<Record<string, any>>;
  sync_health: Array<Record<string, any>>;
}

interface PreviewRow {
  agency_id: string;
  agency_name: string;
  agency_slug: string;
  state_slug: string;
  selected_email: string;
  is_primary: boolean;
  is_role_based: boolean;
  total_clean_emails_for_agency: number;
  total_ready_emails_for_agency: number;
  selection_reason: string;
}

interface SyncResult {
  ok: boolean;
  campaign_id: string;
  state?: string;
  send_mode: string;
  dry_run: boolean;
  selected_email_rows: number;
  selected_unique_agencies: number;
  attempted_to_sync: number;
  synced_success: number;
  skipped_duplicates: number;
  failed: number;
  errors: string[];
  preview_rows?: PreviewRow[];
}

interface ContactActivity {
  other_agency_email_id: string;
  agency_id: string;
  agency_name: string;
  state_slug: string;
  email_normalized: string;
  validation_status: string;
  outreach_status: string;
  outreach_count: number;
  last_outreach_at: string | null;
  events_summary: {
    opens: number; clicks: number; replies: number;
    bounces: number; unsubscribed: number;
    last_event_type: string | null; last_event_at: string | null;
  };
}

function emptyStats(): Stats {
  return {
    ok: false, filters: {},
    raw_valid_inventory: { total_valid_emails:0, valid_on_active_agencies:0, valid_on_inactive_agencies:0, unique_valid_emails:0, unique_agencies_with_valid:0 },
    exclusion_breakdown: { excluded_inactive_agency:0, excluded_identity_contaminated:0, excluded_opted_out:0, excluded_blocked:0, total_excluded:0 },
    final_sendable: { sendable_email_rows:0, sendable_with_inactive:0, unique_agencies:0, unique_identities:0 },
    inventory: { total_email_rows:0, clean_email_rows:0, ready_email_rows:0, invalid_email_rows:0, pending_email_rows:0, retry_email_rows:0, failed_email_rows:0, risky_email_rows:0, catch_all_email_rows:0, contaminated_email_rows:0 },
    agency_inventory: { total_unique_agencies:0, active_agencies:0, inactive_agencies:0, unique_agencies_with_clean_email:0, unique_agencies_with_ready_email:0, agencies_with_1_clean_email:0, agencies_with_2_clean_emails:0, agencies_with_3plus_clean_emails:0, avg_clean_emails_per_clean_agency:0 },
    campaign_performance_email_level: { synced_email_rows:0, opened_email_rows:0, clicked_email_rows:0, replied_email_rows:0, bounced_email_rows:0, unsubscribed_email_rows:0 },
    campaign_performance_agency_level: { synced_unique_agencies:0, opened_unique_agencies:0, clicked_unique_agencies:0, replied_unique_agencies:0, bounced_unique_agencies:0, unsubscribed_unique_agencies:0 },
    role_based_split: { clean_role_based:0, clean_personal:0, ready_role_based:0, ready_personal:0 },
    distortion: { avg_synced_emails_per_contacted_agency:null, contacted_agencies_with_1_email:0, contacted_agencies_with_2_emails:0, contacted_agencies_with_3plus_emails:0 },
    send_mode_comparison: { all_clean_emails:{ email_rows:0, unique_agencies:0 }, one_per_agency:{ email_rows:0, unique_agencies:0 } },
    health: {}, warnings: [], recent_sync_runs: [], recent_webhook_events: [], sync_health: [],
  };
}

function normalizeStats(raw: any): Stats {
  if (!raw || typeof raw !== 'object') return emptyStats();
  const d = emptyStats();
  return {
    ok: raw.ok === true,
    filters: raw.filters || {},
    raw_valid_inventory: { ...d.raw_valid_inventory, ...(raw.raw_valid_inventory || {}) },
    exclusion_breakdown: { ...d.exclusion_breakdown, ...(raw.exclusion_breakdown || {}) },
    final_sendable: { ...d.final_sendable, ...(raw.final_sendable || {}) },
    inventory: { ...d.inventory, ...(raw.inventory || {}) },
    agency_inventory: { ...d.agency_inventory, ...(raw.agency_inventory || {}) },
    campaign_performance_email_level: { ...d.campaign_performance_email_level, ...(raw.campaign_performance_email_level || {}) },
    campaign_performance_agency_level: { ...d.campaign_performance_agency_level, ...(raw.campaign_performance_agency_level || {}) },
    role_based_split: { ...d.role_based_split, ...(raw.role_based_split || {}) },
    distortion: { ...d.distortion, ...(raw.distortion || {}) },
    send_mode_comparison: {
      all_clean_emails: raw.send_mode_comparison?.all_clean_emails || { email_rows:0, unique_agencies:0 },
      one_per_agency: raw.send_mode_comparison?.one_per_agency || { email_rows:0, unique_agencies:0 },
    },
    health: raw.health || {},
    warnings: Array.isArray(raw.warnings) ? raw.warnings : [],
    recent_sync_runs: Array.isArray(raw.recent_sync_runs) ? raw.recent_sync_runs : [],
    recent_webhook_events: Array.isArray(raw.recent_webhook_events) ? raw.recent_webhook_events : [],
    sync_health: Array.isArray(raw.sync_health) ? raw.sync_health : [],
  };
}

function parseErrorMessage(data: any, httpStatus?: number): string {
  if (data && typeof data === 'object') {
    if (typeof data.message === 'string' && data.message) return data.message;
    if (typeof data.error === 'string' && data.error) return data.error;
  }
  if (httpStatus) return `HTTP ${httpStatus}`;
  return 'Request failed';
}

function rate(n: number, d: number): string {
  if (!d) return '—';
  return `${((n / d) * 100).toFixed(1)}%`;
}

function Stat({ label, value, sub, color = 'gray' }: { label: string; value: string | number; sub?: string; color?: string }) {
  const colorMap: Record<string, string> = {
    gray: 'bg-gray-50 border-gray-200 text-gray-900',
    blue: 'bg-blue-50 border-blue-200 text-blue-900',
    green: 'bg-green-50 border-green-200 text-green-900',
    amber: 'bg-amber-50 border-amber-200 text-amber-900',
    red: 'bg-red-50 border-red-200 text-red-900',
    slate: 'bg-slate-50 border-slate-200 text-slate-900',
    teal: 'bg-teal-50 border-teal-200 text-teal-900',
    rose: 'bg-rose-50 border-rose-200 text-rose-900',
  };
  const cls = colorMap[color] || colorMap.gray;
  const textCls = cls.split(' ').find(c => c.startsWith('text-')) || 'text-gray-900';
  const labelCls = textCls.replace('900', '600').replace('800', '600');
  return (
    <div className={`p-4 rounded-xl border ${cls}`}>
      <div className={`text-xs font-semibold uppercase tracking-wide mb-1 ${labelCls}`}>{label}</div>
      <div className={`text-2xl font-bold ${textCls}`}>{value}</div>
      {sub && <div className={`text-xs mt-1 ${labelCls}`}>{sub}</div>}
    </div>
  );
}

function SectionHeader({ icon: Icon, title, subtitle }: { icon: any; title: string; subtitle?: string }) {
  return (
    <div className="flex items-center gap-3 mb-4">
      <div className="flex items-center justify-center w-9 h-9 rounded-lg bg-gray-100">
        <Icon className="w-5 h-5 text-gray-600" />
      </div>
      <div>
        <h2 className="text-base font-semibold text-gray-900">{title}</h2>
        {subtitle && <p className="text-xs text-gray-500 mt-0.5">{subtitle}</p>}
      </div>
    </div>
  );
}

export default function WpAdminSmartleadPage() {
  const { token, status } = useAdminSession();

  const [campaignId, setCampaignId] = useState('');
  const [state, setState] = useState('');
  const [sendMode, setSendMode] = useState<'all_clean_emails' | 'one_per_agency'>('all_clean_emails');
  const [discountLinkMode, setDiscountLinkMode] = useState<'none' | 'existing' | 'auto_create'>('none');

  const [stats, setStats] = useState<Stats | null>(null);
  const [syncResult, setSyncResult] = useState<SyncResult | null>(null);
  const [loading, setLoading] = useState(false);
  const [testingConnection, setTestingConnection] = useState(false);
  const [exporting, setExporting] = useState(false);
  const [syncingIntelligence, setSyncingIntelligence] = useState(false);
  const [syncIntelligenceResult, setSyncIntelligenceResult] = useState<{ ok: boolean; message: string } | null>(null);
  const [error, setError] = useState('');
  const [successMessage, setSuccessMessage] = useState('');
  const [activeTab, setActiveTab] = useState<'overview' | 'preview' | 'history' | 'contacts' | 'diagnostic'>('overview');
  const [contacts, setContacts] = useState<ContactActivity[]>([]);
  const [contactsLoading, setContactsLoading] = useState(false);
  const [contactsPage, setContactsPage] = useState(1);
  const [contactsTotal, setContactsTotal] = useState(0);
  const [contactsSearch, setContactsSearch] = useState('');
  const [contactsStatus, setContactsStatus] = useState('');

  const refreshStats = async () => {
    if (status !== 'valid') return;
    setLoading(true);
    setError('');
    try {
      const params = new URLSearchParams();
      if (campaignId) params.set('campaign_id', campaignId);
      if (state) params.set('state', state);
      const res = await adminFetch(`smartlead-admin-stats?${params}`);
      const data = await res.json().catch(() => ({}));
      if (!res.ok) {
        throw new Error(parseErrorMessage(data, res.status));
      }
      setStats(normalizeStats(data));
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Failed to fetch stats');
    } finally {
      setLoading(false);
    }
  };

  const testConnection = async () => {
    if (status !== 'valid') return;
    setTestingConnection(true);
    setError('');
    setSuccessMessage('');
    try {
      const res = await adminFetch('smartlead-health-check?test_connectivity=true');
      const data = await res.json().catch(() => ({}));
      if (!res.ok) {
        throw new Error(parseErrorMessage(data, res.status));
      }
      if (data.health?.smartlead_api_reachable) {
        setSuccessMessage('Smartlead API connection successful!');
        setTimeout(() => setSuccessMessage(''), 3000);
      } else {
        setError(`Connection failed: ${data.health?.smartlead_api_test_error || 'API unreachable'}`);
      }
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Connection test failed');
    } finally {
      setTestingConnection(false);
    }
  };

  const handleExport = async () => {
    if (status !== 'valid') return;
    setExporting(true);
    setError('');
    try {
      const params = new URLSearchParams();
      if (state) params.set('state', state);
      if (campaignId) params.set('campaign_id', campaignId);
      params.set('send_mode', sendMode);
      if (discountLinkMode !== 'none') params.set('discount_link_mode', discountLinkMode);
      const res = await adminFetch(`smartlead-export-eligible-contacts?${params}`);
      if (!res.ok) {
        const data = await res.json().catch(() => ({}));
        throw new Error(parseErrorMessage(data, res.status));
      }
      const blob = await res.blob();
      const url = window.URL.createObjectURL(blob);
      const a = document.createElement('a');
      a.href = url;
      a.download = `smartlead-export-${new Date().toISOString().split('T')[0]}.csv`;
      document.body.appendChild(a);
      a.click();
      a.remove();
      setTimeout(() => window.URL.revokeObjectURL(url), 5000);
      setSuccessMessage('CSV exported successfully!');
      setTimeout(() => setSuccessMessage(''), 3000);
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Export failed');
    } finally {
      setExporting(false);
    }
  };

  const handleBackgroundSync = async () => {
    if (status !== 'valid') return;
    setSyncingIntelligence(true);
    setSyncIntelligenceResult(null);
    setError('');
    try {
      const res = await adminFetch('smartlead-background-sync', {
        method: 'POST',
        json: { sync_campaigns: true, compute_rollups: true },
      });
      const data = await res.json().catch(() => ({}));
      if (!res.ok) throw new Error(parseErrorMessage(data, res.status));
      const dur = data.total_duration_ms ? ` (${(data.total_duration_ms / 1000).toFixed(1)}s)` : '';
      setSyncIntelligenceResult({ ok: data.ok !== false, message: data.ok !== false ? `Sync complete${dur}` : (data.error || 'Sync failed') });
      setTimeout(() => setSyncIntelligenceResult(null), 5000);
      await refreshStats();
    } catch (err) {
      setSyncIntelligenceResult({ ok: false, message: err instanceof Error ? err.message : 'Sync failed' });
    } finally {
      setSyncingIntelligence(false);
    }
  };

  const loadContacts = async (page = 1) => {
    if (status !== 'valid') return;
    setContactsLoading(true);
    try {
      const params = new URLSearchParams();
      params.set('page', page.toString());
      params.set('page_size', '50');
      if (state) params.set('state', state);
      if (campaignId) params.set('campaign_id', campaignId);
      if (contactsSearch) params.set('q', contactsSearch);
      if (contactsStatus) params.set('status', contactsStatus);
      const res = await adminFetch(`smartlead-contact-activity?${params}`);
      const data = await res.json().catch(() => ({}));
      if (!res.ok) {
        throw new Error(parseErrorMessage(data, res.status));
      }
      if (data.ok) {
        setContacts(data.rows || []);
        setContactsTotal(data.pagination?.total || 0);
        setContactsPage(page);
      }
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Failed to load contacts');
    } finally {
      setContactsLoading(false);
    }
  };

  const handleSync = async (isDryRun: boolean) => {
    if (status !== 'valid') return;
    if (!campaignId.trim()) {
      setError('Campaign ID is required to sync to Smartlead');
      return;
    }
    setLoading(true);
    setError('');
    setSyncResult(null);
    try {
      const res = await adminFetch('smartlead-sync-eligible-contacts', {
        method: 'POST',
        json: {
          campaign_id: campaignId,
          state: state || undefined,
          send_mode: sendMode,
          dry_run: isDryRun,
        },
      });
      const data = await res.json().catch(() => ({}));
      if (!res.ok) {
        throw new Error(parseErrorMessage(data, res.status));
      }
      setSyncResult(data);
      if (!isDryRun && data.ok) {
        setTimeout(() => { refreshStats(); loadContacts(1); }, 1000);
      }
      if (isDryRun) setActiveTab('preview');
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Sync failed');
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    if (status === 'valid') {
      refreshStats();
    }
  }, [status]);

  useEffect(() => {
    if (activeTab === 'contacts' && status === 'valid') {
      loadContacts(1);
    }
  }, [activeTab, state, campaignId, status]);

  const displayStats = stats || emptyStats();
  const ep = displayStats.campaign_performance_email_level;
  const ap = displayStats.campaign_performance_agency_level;
  const inv = displayStats.inventory;
  const ai = displayStats.agency_inventory;
  const smc = displayStats.send_mode_comparison;
  const dist = displayStats.distortion;
  const rbs = displayStats.role_based_split;

  const stateLabel = state ? formatStateName(state) : 'All States';

  if (status === 'loading') {
    return (
      <EmailModuleLayout activeModule="smartlead">
        <div className="max-w-7xl mx-auto px-4 py-20 flex flex-col items-center justify-center gap-4">
          <Loader className="w-8 h-8 animate-spin text-gray-400" />
          <p className="text-gray-500 text-sm">Checking admin session...</p>
        </div>
      </EmailModuleLayout>
    );
  }

  if (status === 'invalid') {
    return (
      <EmailModuleLayout activeModule="smartlead">
        <div className="max-w-7xl mx-auto px-4 py-20 flex flex-col items-center justify-center gap-4">
          <AlertCircle className="w-10 h-10 text-amber-500" />
          <h2 className="text-xl font-bold text-gray-900">Admin session expired</h2>
          <p className="text-gray-500 text-sm">Please re-login to access this page.</p>
          <a href="/wp-admin?reason=session_expired"
            className="px-5 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 text-sm font-medium">
            Go to Login
          </a>
        </div>
      </EmailModuleLayout>
    );
  }

  return (
    <EmailModuleLayout activeModule="smartlead">
      <div className="max-w-7xl mx-auto px-4 py-8 space-y-6">

        {/* Header */}
        <div>
          <h1 className="text-3xl font-bold text-gray-900">Cold Outreach Operations</h1>
          <p className="text-gray-500 mt-1">State-correct inventory, agency-level metrics, and send-mode decision tools</p>
        </div>

        {/* API Health Banner */}
        <div className="p-4 bg-slate-50 border border-slate-200 rounded-xl flex items-start justify-between gap-4">
          <div className="flex items-start gap-3">
            {displayStats.health?.api_key_configured
              ? <CheckCircle className="w-5 h-5 text-green-600 shrink-0 mt-0.5" />
              : <AlertCircle className="w-5 h-5 text-amber-600 shrink-0 mt-0.5" />}
            <div>
              <p className="font-medium text-slate-900 text-sm">Smartlead API Key</p>
              <p className={`text-xs mt-0.5 ${displayStats.health?.api_key_configured ? 'text-green-700' : 'text-amber-700'}`}>
                {displayStats.health?.api_key_configured ? 'Configured in Edge Function runtime' : 'Not visible in Edge Function runtime — redeploy to fix'}
              </p>
            </div>
          </div>
          <button onClick={testConnection} disabled={testingConnection || status !== 'valid'}
            className="px-3 py-1.5 bg-blue-600 text-white rounded-lg hover:bg-blue-700 disabled:bg-gray-300 text-sm font-medium flex items-center gap-2 whitespace-nowrap">
            {testingConnection && <Loader className="w-3.5 h-3.5 animate-spin" />}
            Test Connection
          </button>
        </div>

        {/* Warnings */}
        {displayStats.warnings.length > 0 && (
          <div className="p-4 bg-amber-50 border border-amber-200 rounded-xl">
            <p className="font-semibold text-amber-900 text-sm mb-1">Warnings</p>
            {displayStats.warnings.map((w, i) => <p key={i} className="text-amber-800 text-xs">• {w}</p>)}
          </div>
        )}
        {error && (
          <div className="p-4 bg-red-50 border border-red-200 rounded-xl flex gap-3">
            <AlertTriangle className="w-5 h-5 text-red-600 shrink-0 mt-0.5" />
            <div>
              <p className="font-semibold text-red-900 text-sm">Error</p>
              <p className="text-red-800 text-sm">{error}</p>
            </div>
          </div>
        )}
        {successMessage && (
          <div className="p-4 bg-green-50 border border-green-200 rounded-xl flex gap-2">
            <CheckCircle className="w-5 h-5 text-green-600 shrink-0 mt-0.5" />
            <p className="text-green-800 text-sm font-medium">{successMessage}</p>
          </div>
        )}

        {/* Main layout: controls + content */}
        <div className="grid grid-cols-1 lg:grid-cols-4 gap-6">

          {/* Controls sidebar */}
          <div className="lg:col-span-1 space-y-4">
            <div className="bg-white rounded-xl border border-gray-200 p-5 shadow-sm">
              <h2 className="text-sm font-semibold text-gray-900 mb-4">Filters & Controls</h2>
              <div className="space-y-3">
                <div>
                  <label className="block text-xs font-medium text-gray-700 mb-1">State</label>
                  <select value={state} onChange={e => setState(e.target.value)}
                    className="w-full px-3 py-2 border border-gray-300 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-blue-500">
                    <option value="">All States</option>
                    {states.map(s => <option key={s} value={s}>{formatStateName(s)}</option>)}
                  </select>
                </div>
                <div>
                  <label className="block text-xs font-medium text-gray-700 mb-1">Campaign ID</label>
                  <input type="text" value={campaignId} onChange={e => setCampaignId(e.target.value)}
                    placeholder="e.g., 12345"
                    className="w-full px-3 py-2 border border-gray-300 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-blue-500" />
                </div>
                <div>
                  <label className="block text-xs font-medium text-gray-700 mb-1">Send Mode</label>
                  <select value={sendMode} onChange={e => setSendMode(e.target.value as any)}
                    className="w-full px-3 py-2 border border-gray-300 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-blue-500">
                    <option value="all_clean_emails">All Clean Emails</option>
                    <option value="one_per_agency">One Per Agency</option>
                  </select>
                </div>
                <div>
                  <label className="block text-xs font-medium text-gray-700 mb-1">Discount Link (CSV Export)</label>
                  <select value={discountLinkMode} onChange={e => setDiscountLinkMode(e.target.value as 'none' | 'existing' | 'auto_create')}
                    className="w-full px-3 py-2 border border-gray-300 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-blue-500">
                    <option value="none">No discount link</option>
                    <option value="existing">Use existing offers only</option>
                    <option value="auto_create">Auto-create per agency (20% off, 30d)</option>
                  </select>
                  {discountLinkMode === 'auto_create' && (
                    <p className="text-[10px] text-amber-600 mt-1">Creates a unique single-use activation discount offer for each agency without one. Existing valid offers are reused.</p>
                  )}
                </div>
                <button onClick={refreshStats} disabled={loading || status !== 'valid'}
                  className="w-full px-3 py-2 bg-gray-100 text-gray-700 rounded-lg hover:bg-gray-200 text-sm font-medium flex items-center justify-center gap-2 disabled:opacity-50">
                  <RefreshCw className={`w-3.5 h-3.5 ${loading ? 'animate-spin' : ''}`} />
                  Refresh Stats
                </button>
              </div>
            </div>

            <div className="bg-white rounded-xl border border-gray-200 p-5 shadow-sm">
              <h2 className="text-sm font-semibold text-gray-900 mb-4">Actions</h2>
              <div className="space-y-2">
                <button onClick={() => handleSync(true)} disabled={loading || status !== 'valid'}
                  className="w-full px-3 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 disabled:bg-gray-300 text-sm font-medium flex items-center justify-center gap-2">
                  {loading && <Loader className="w-3.5 h-3.5 animate-spin" />}
                  Preview (Dry Run)
                </button>
                <p className="text-xs text-gray-400 text-center">Shows selection, no emails sent</p>

                <button onClick={() => handleSync(false)} disabled={loading || !campaignId.trim() || status !== 'valid'}
                  className="w-full px-3 py-2 bg-green-600 text-white rounded-lg hover:bg-green-700 disabled:bg-gray-300 text-sm font-medium flex items-center justify-center gap-2">
                  {loading && <Loader className="w-3.5 h-3.5 animate-spin" />}
                  Send to Smartlead
                </button>
                <p className="text-xs text-gray-400 text-center">Requires Campaign ID</p>

                <button onClick={handleExport} disabled={exporting || status !== 'valid'}
                  className="w-full px-3 py-2 bg-slate-700 text-white rounded-lg hover:bg-slate-800 disabled:bg-gray-300 text-sm font-medium flex items-center justify-center gap-2">
                  {exporting ? <Loader className="w-3.5 h-3.5 animate-spin" /> : <Download className="w-3.5 h-3.5" />}
                  Export CSV
                </button>
              </div>
            </div>

            <div className="bg-white rounded-xl border border-gray-200 p-5 shadow-sm">
              <h2 className="text-sm font-semibold text-gray-900 mb-3">Intelligence Sync</h2>
              <p className="text-xs text-gray-500 mb-3">Sync campaign data and compute agency rollups from local DB.</p>
              <button onClick={handleBackgroundSync} disabled={syncingIntelligence || status !== 'valid'}
                className="w-full px-3 py-2 bg-teal-600 text-white rounded-lg hover:bg-teal-700 disabled:bg-gray-300 text-sm font-medium flex items-center justify-center gap-2">
                {syncingIntelligence ? <Loader className="w-3.5 h-3.5 animate-spin" /> : <Database className="w-3.5 h-3.5" />}
                {syncingIntelligence ? 'Syncing...' : 'Sync Now'}
              </button>
              {syncIntelligenceResult && (
                <div className={`mt-2 text-xs rounded-lg px-3 py-2 ${syncIntelligenceResult.ok ? 'bg-green-50 text-green-700' : 'bg-red-50 text-red-700'}`}>
                  {syncIntelligenceResult.message}
                </div>
              )}
            </div>
          </div>

          {/* Main content */}
          <div className="lg:col-span-3 space-y-5">

            {/* Loading overlay for initial load */}
            {loading && !stats && (
              <div className="flex items-center justify-center py-16">
                <Loader className="w-7 h-7 animate-spin text-gray-400" />
                <span className="ml-3 text-gray-500 text-sm">Loading inventory data...</span>
              </div>
            )}

            {/* ── BLOCK 0: OPERATIONAL STATUS OVERVIEW ────────────────────── */}
            {(stats || !loading) && (
            <div className="bg-gradient-to-r from-blue-50 to-green-50 rounded-xl border-2 border-blue-200 p-6 shadow-sm">
              <div className="flex items-center gap-3 mb-5">
                <div className="flex items-center justify-center w-10 h-10 rounded-lg bg-blue-600">
                  <Zap className="w-5 h-5 text-white" />
                </div>
                <div>
                  <h2 className="text-lg font-bold text-gray-900">Outreach Readiness</h2>
                  <p className="text-sm text-gray-600">{stateLabel} — What's sendable right now</p>
                </div>
              </div>

              {/* Primary operational cards */}
              <div className="grid grid-cols-2 md:grid-cols-5 gap-4 mb-4">
                <div className="bg-white rounded-xl border-2 border-green-300 p-4 text-center shadow-sm">
                  <p className="text-xs font-semibold text-green-700 uppercase tracking-wide mb-1">Sendable Now</p>
                  <p className="text-3xl font-bold text-green-700">{displayStats.final_sendable.sendable_email_rows.toLocaleString()}</p>
                  <p className="text-xs text-gray-500 mt-1">clean + ready to go</p>
                </div>
                <div className="bg-white rounded-xl border border-teal-200 p-4 text-center">
                  <p className="text-xs font-semibold text-teal-700 uppercase tracking-wide mb-1">Unique Agencies</p>
                  <p className="text-3xl font-bold text-teal-700">{displayStats.final_sendable.unique_agencies.toLocaleString()}</p>
                  <p className="text-xs text-gray-500 mt-1">ready to email</p>
                </div>
                <div className="bg-white rounded-xl border border-blue-200 p-4 text-center">
                  <p className="text-xs font-semibold text-blue-700 uppercase tracking-wide mb-1">Clean Emails</p>
                  <p className="text-3xl font-bold text-blue-700">{displayStats.inventory.clean_email_rows.toLocaleString()}</p>
                  <p className="text-xs text-gray-500 mt-1">verified valid</p>
                </div>
                <div className="bg-white rounded-xl border border-amber-200 p-4 text-center">
                  <p className="text-xs font-semibold text-amber-700 uppercase tracking-wide mb-1">Needs Verification</p>
                  <p className="text-3xl font-bold text-amber-700">
                    {(displayStats.inventory.pending_email_rows + displayStats.inventory.retry_email_rows).toLocaleString()}
                  </p>
                  <p className="text-xs text-gray-500 mt-1">pending + retry</p>
                </div>
                <div className="bg-white rounded-xl border border-orange-200 p-4 text-center">
                  <p className="text-xs font-semibold text-orange-700 uppercase tracking-wide mb-1">Needs Repair</p>
                  <p className="text-3xl font-bold text-orange-700">{displayStats.raw_valid_inventory.valid_on_inactive_agencies.toLocaleString()}</p>
                  <p className="text-xs text-gray-500 mt-1">clean on archived record</p>
                </div>
              </div>

              {/* Clean but excluded breakdown */}
              {displayStats.exclusion_breakdown.total_excluded > 0 && (
                <div className="bg-white rounded-xl border border-gray-200 p-4 mb-4">
                  <p className="text-xs font-semibold text-gray-600 uppercase tracking-wide mb-2">Clean but excluded from sends</p>
                  <div className="flex flex-wrap gap-4 text-sm">
                    {displayStats.exclusion_breakdown.excluded_inactive_agency > 0 && (
                      <span className="text-gray-700">
                        <span className="font-bold text-gray-900">{displayStats.exclusion_breakdown.excluded_inactive_agency.toLocaleString()}</span>
                        {' '}on archived records
                      </span>
                    )}
                    {displayStats.exclusion_breakdown.excluded_identity_contaminated > 0 && (
                      <span className="text-gray-700">
                        <span className="font-bold text-red-700">{displayStats.exclusion_breakdown.excluded_identity_contaminated.toLocaleString()}</span>
                        {' '}identity contaminated
                      </span>
                    )}
                    {displayStats.exclusion_breakdown.excluded_opted_out > 0 && (
                      <span className="text-gray-700">
                        <span className="font-bold text-gray-700">{displayStats.exclusion_breakdown.excluded_opted_out.toLocaleString()}</span>
                        {' '}opted out
                      </span>
                    )}
                    {displayStats.exclusion_breakdown.excluded_blocked > 0 && (
                      <span className="text-gray-700">
                        <span className="font-bold text-gray-700">{displayStats.exclusion_breakdown.excluded_blocked.toLocaleString()}</span>
                        {' '}blocked
                      </span>
                    )}
                  </div>
                </div>
              )}

              {/* Math check row */}
              <div className="p-3 bg-white rounded-lg border border-gray-200 flex flex-wrap items-center justify-center gap-2 text-sm">
                <span className="font-medium text-blue-700">{displayStats.raw_valid_inventory.total_valid_emails.toLocaleString()} clean</span>
                <span className="text-gray-400">−</span>
                <span className="font-medium text-amber-700">{displayStats.exclusion_breakdown.total_excluded.toLocaleString()} excluded</span>
                <span className="text-gray-400">=</span>
                <span className="font-bold text-green-700">{displayStats.final_sendable.sendable_email_rows.toLocaleString()} sendable now</span>
                <span className="text-xs text-gray-400 ml-1">({displayStats.final_sendable.unique_identities.toLocaleString()} unique identities)</span>
              </div>
            </div>
            )}

            {/* ── SYNC HEALTH ────────────────────────────────────────────── */}
            {stats && stats.sync_health.length > 0 && (
            <div className="bg-white rounded-xl border border-gray-200 p-5 shadow-sm">
              <SectionHeader icon={Database} title="Intelligence Sync Health" subtitle="Last sync timestamps per sync type" />
              <div className="grid grid-cols-1 sm:grid-cols-3 gap-3">
                {stats.sync_health.map((row: Record<string, any>) => {
                  const isOk = row.status === 'ok';
                  const isError = row.status === 'error';
                  const neverRun = row.status === 'never_run' || !row.last_run_at;
                  const lastSuccess = row.last_success_at ? new Date(row.last_success_at).toLocaleString() : null;
                  const lastRun = row.last_run_at ? new Date(row.last_run_at).toLocaleString() : null;
                  return (
                    <div key={row.sync_type} className={`rounded-xl border p-4 ${isError ? 'bg-red-50 border-red-200' : neverRun ? 'bg-gray-50 border-gray-200' : 'bg-green-50 border-green-200'}`}>
                      <div className="flex items-center justify-between mb-2">
                        <span className="text-xs font-semibold uppercase tracking-wide text-gray-600">{(row.sync_type || '').replace(/_/g, ' ')}</span>
                        <span className={`inline-flex items-center gap-1 text-xs font-semibold px-2 py-0.5 rounded-full ${isOk ? 'bg-green-100 text-green-700' : isError ? 'bg-red-100 text-red-700' : 'bg-gray-100 text-gray-500'}`}>
                          {isOk ? <CheckCircle className="w-3 h-3" /> : isError ? <AlertCircle className="w-3 h-3" /> : null}
                          {neverRun ? 'never run' : row.status}
                        </span>
                      </div>
                      {lastSuccess && <p className="text-xs text-gray-600">Last success: <span className="font-medium">{lastSuccess}</span></p>}
                      {lastRun && !lastSuccess && <p className="text-xs text-gray-500">Last run: {lastRun}</p>}
                      {row.records_processed != null && <p className="text-xs text-gray-500 mt-0.5">{row.records_processed} records processed</p>}
                      {isError && row.last_error && <p className="text-xs text-red-600 mt-1 truncate" title={row.last_error}>{row.last_error}</p>}
                    </div>
                  );
                })}
              </div>
            </div>
            )}

            {/* ── BLOCK 1: Email Inventory ───────────────────────────────── */}
            {(stats || !loading) && (
            <div className="bg-white rounded-xl border border-gray-200 p-6 shadow-sm">
              <SectionHeader icon={Mail} title="Email Inventory (Rows)" subtitle={`Individual email records — ${stateLabel}`} />
              <div className="grid grid-cols-2 md:grid-cols-3 gap-3">
                <Stat label="Total Imported (Rows)" value={inv.total_email_rows} color="gray" />
                <Stat label="Clean Emails (Rows)" value={inv.clean_email_rows} sub="ListClean verified valid" color="blue" />
                <Stat label="Ready-to-Send (Rows)" value={inv.ready_email_rows} sub="Clean + active agency + not excluded" color="green" />
                {inv.pending_email_rows > 0 && <Stat label="Pending Verification" value={inv.pending_email_rows} color="amber" />}
                {inv.retry_email_rows > 0 && <Stat label="Retry Scheduled" value={inv.retry_email_rows} color="amber" />}
                {inv.failed_email_rows > 0 && <Stat label="Failed (Max Retries)" value={inv.failed_email_rows} color="red" />}
                {inv.invalid_email_rows > 0 && <Stat label="Invalid (Rows)" value={inv.invalid_email_rows} color="red" />}
                {inv.risky_email_rows > 0 && <Stat label="Risky (Rows)" value={inv.risky_email_rows} color="amber" />}
                {inv.catch_all_email_rows > 0 && <Stat label="Catch-All (Rows)" value={inv.catch_all_email_rows} color="slate" />}
                {(inv.contaminated_email_rows || 0) > 0 && <Stat label="Identity Contaminated" value={inv.contaminated_email_rows || 0} sub="Domain mismatch" color="red" />}
              </div>

              {/* Role-based split inline */}
              {(rbs.clean_role_based > 0 || rbs.clean_personal > 0) && (
                <div className="mt-4 pt-4 border-t border-gray-100">
                  <p className="text-xs font-semibold text-gray-600 uppercase tracking-wide mb-3">Clean Email Type Split</p>
                  <div className="grid grid-cols-2 md:grid-cols-4 gap-3">
                    <Stat label="Clean — Personal" value={rbs.clean_personal} sub="Non-role-based" color="teal" />
                    <Stat label="Clean — Role-Based" value={rbs.clean_role_based} sub="info@, support@, etc." color="slate" />
                    <Stat label="Ready — Personal" value={rbs.ready_personal} color="teal" />
                    <Stat label="Ready — Role-Based" value={rbs.ready_role_based} color="slate" />
                  </div>
                </div>
              )}
            </div>
            )}

            {/* ── BLOCK 2: Agency Coverage ───────────────────────────────── */}
            {(stats || !loading) && (
            <div className="bg-white rounded-xl border border-gray-200 p-6 shadow-sm">
              <SectionHeader icon={Users} title="Agency Coverage" subtitle={`How many agencies can be reached — ${stateLabel}`} />
              <div className="grid grid-cols-2 md:grid-cols-3 gap-3">
                <Stat label="Agencies Ready to Email" value={ai.unique_agencies_with_ready_email} sub="Has ≥1 sendable email" color="green" />
                <Stat label="Agencies with Clean Email" value={ai.unique_agencies_with_clean_email} sub="Has ≥1 verified valid" color="blue" />
                <Stat label="Agencies — 1 Clean Email" value={ai.agencies_with_1_clean_email} sub="Single contact" color="gray" />
                <Stat label="Agencies — 2 Clean Emails" value={ai.agencies_with_2_clean_emails} sub="Two choices" color="gray" />
                <Stat label="Agencies — 3+ Clean Emails" value={ai.agencies_with_3plus_clean_emails} sub="High coverage" color="gray" />
                {ai.avg_clean_emails_per_clean_agency > 0 && (
                  <Stat label="Avg Clean Emails per Agency" value={ai.avg_clean_emails_per_clean_agency.toFixed(2)} sub="Higher = more choice per agency" color="blue" />
                )}
              </div>
              {/* Record quality — advanced section */}
              <details className="mt-4 pt-4 border-t border-gray-100 group">
                <summary className="cursor-pointer text-xs font-semibold text-gray-500 hover:text-gray-700 flex items-center gap-1 select-none">
                  <ChevronDown className="w-3 h-3 group-open:rotate-180 transition-transform inline" />
                  Record quality diagnostics (total records, archived duplicates)
                </summary>
                <div className="mt-3 grid grid-cols-2 md:grid-cols-3 gap-3">
                  <Stat label="Total Records" value={ai.total_unique_agencies} sub="Live + archived" color="gray" />
                  <Stat label="Live Canonical Records" value={ai.active_agencies} sub="Eligible for export/send" color="green" />
                  <Stat label="Archived Duplicate/Junk" value={ai.inactive_agencies} sub="Excluded from all sends" color="gray" />
                </div>
              </details>
            </div>
            )}

            {/* ── BLOCK 3: Send Mode Comparison ─────────────────────────── */}
            {(stats || !loading) && (
            <div className="bg-white rounded-xl border border-gray-200 p-6 shadow-sm">
              <SectionHeader icon={Zap} title="Send Mode Comparison" subtitle="Choose all_clean_emails for max sends, one_per_agency for max company coverage" />
              <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                <div className={`rounded-xl border-2 p-5 ${sendMode === 'all_clean_emails' ? 'border-blue-400 bg-blue-50' : 'border-gray-200 bg-gray-50'}`}>
                  <div className="flex items-center gap-2 mb-3">
                    <div className={`w-2 h-2 rounded-full ${sendMode === 'all_clean_emails' ? 'bg-blue-500' : 'bg-gray-400'}`} />
                    <p className="font-semibold text-sm text-gray-900">All Clean Emails</p>
                    {sendMode === 'all_clean_emails' && <span className="ml-auto text-xs bg-blue-600 text-white px-2 py-0.5 rounded-full">Selected</span>}
                  </div>
                  <div className="space-y-2">
                    <div className="flex justify-between items-center">
                      <span className="text-xs text-gray-600">Email Rows to Send</span>
                      <span className="font-bold text-gray-900">{smc.all_clean_emails.email_rows.toLocaleString()}</span>
                    </div>
                    <div className="flex justify-between items-center">
                      <span className="text-xs text-gray-600">Unique Agencies Covered</span>
                      <span className="font-bold text-gray-900">{smc.all_clean_emails.unique_agencies.toLocaleString()}</span>
                    </div>
                    <div className="flex justify-between items-center">
                      <span className="text-xs text-gray-600">Avg Emails per Agency</span>
                      <span className="font-bold text-gray-900">
                        {smc.all_clean_emails.unique_agencies > 0
                          ? (smc.all_clean_emails.email_rows / smc.all_clean_emails.unique_agencies).toFixed(2)
                          : '—'}
                      </span>
                    </div>
                  </div>
                  <p className="text-xs text-gray-500 mt-3">Sends all clean emails — maximizes total outreach volume</p>
                </div>

                <div className={`rounded-xl border-2 p-5 ${sendMode === 'one_per_agency' ? 'border-green-400 bg-green-50' : 'border-gray-200 bg-gray-50'}`}>
                  <div className="flex items-center gap-2 mb-3">
                    <div className={`w-2 h-2 rounded-full ${sendMode === 'one_per_agency' ? 'bg-green-500' : 'bg-gray-400'}`} />
                    <p className="font-semibold text-sm text-gray-900">One Per Agency</p>
                    {sendMode === 'one_per_agency' && <span className="ml-auto text-xs bg-green-600 text-white px-2 py-0.5 rounded-full">Selected</span>}
                  </div>
                  <div className="space-y-2">
                    <div className="flex justify-between items-center">
                      <span className="text-xs text-gray-600">Email Rows to Send</span>
                      <span className="font-bold text-gray-900">{smc.one_per_agency.email_rows.toLocaleString()}</span>
                    </div>
                    <div className="flex justify-between items-center">
                      <span className="text-xs text-gray-600">Unique Agencies Covered</span>
                      <span className="font-bold text-gray-900">{smc.one_per_agency.unique_agencies.toLocaleString()}</span>
                    </div>
                    <div className="flex justify-between items-center">
                      <span className="text-xs text-gray-600">Avg Emails per Agency</span>
                      <span className="font-bold text-gray-900">1.00</span>
                    </div>
                  </div>
                  <p className="text-xs text-gray-500 mt-3">Best email per agency — maximizes unique company coverage</p>
                </div>
              </div>

              {smc.all_clean_emails.email_rows > 0 && smc.one_per_agency.email_rows > 0 && (
                <div className="mt-4 p-4 bg-gray-50 rounded-lg border border-gray-200 flex items-center gap-3">
                  <ArrowRight className="w-4 h-4 text-gray-400 shrink-0" />
                  <p className="text-sm text-gray-700">
                    Switching from <strong>all_clean_emails</strong> to <strong>one_per_agency</strong> reduces sends from{' '}
                    <strong>{smc.all_clean_emails.email_rows.toLocaleString()}</strong> to{' '}
                    <strong>{smc.one_per_agency.email_rows.toLocaleString()}</strong>{' '}
                    (<strong>{smc.all_clean_emails.email_rows - smc.one_per_agency.email_rows}</strong> fewer), while covering the same{' '}
                    <strong>{smc.one_per_agency.unique_agencies.toLocaleString()}</strong> unique agencies.
                  </p>
                </div>
              )}
            </div>
            )}

            {/* ── BLOCK 4: Campaign Performance ─────────────────────────── */}
            {(stats || !loading) && (
            <div className="bg-white rounded-xl border border-gray-200 p-6 shadow-sm">
              <SectionHeader icon={BarChart2} title="Campaign Performance" subtitle={campaignId ? `Campaign ${campaignId} — ${stateLabel}` : `No campaign selected — showing all`} />

              <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                <div>
                  <p className="text-xs font-semibold text-gray-500 uppercase tracking-wide mb-3">Email-Level Counts (Rows)</p>
                  <div className="space-y-2">
                    {[
                      { label: 'Synced Emails (Rows)', value: ep.synced_email_rows, color: 'bg-blue-100 text-blue-800' },
                      { label: 'Opened Emails (Rows)', value: ep.opened_email_rows, rate: rate(ep.opened_email_rows, ep.synced_email_rows), color: 'bg-green-100 text-green-800' },
                      { label: 'Clicked Emails (Rows)', value: ep.clicked_email_rows, rate: rate(ep.clicked_email_rows, ep.synced_email_rows), color: 'bg-teal-100 text-teal-800' },
                      { label: 'Replied Emails (Rows)', value: ep.replied_email_rows, rate: rate(ep.replied_email_rows, ep.synced_email_rows), color: 'bg-rose-100 text-rose-800' },
                      { label: 'Bounced Emails (Rows)', value: ep.bounced_email_rows, rate: rate(ep.bounced_email_rows, ep.synced_email_rows), color: 'bg-red-100 text-red-800' },
                      { label: 'Unsubscribed (Rows)', value: ep.unsubscribed_email_rows, rate: rate(ep.unsubscribed_email_rows, ep.synced_email_rows), color: 'bg-gray-100 text-gray-800' },
                    ].map(({ label, value, rate: r, color }) => (
                      <div key={label} className="flex justify-between items-center p-2.5 bg-gray-50 rounded-lg border border-gray-100">
                        <span className="text-sm text-gray-700">{label}</span>
                        <div className="flex items-center gap-2">
                          {r && <span className={`text-xs px-1.5 py-0.5 rounded font-medium ${color}`}>{r}</span>}
                          <span className="font-bold text-gray-900 min-w-[2.5rem] text-right">{value.toLocaleString()}</span>
                        </div>
                      </div>
                    ))}
                  </div>
                </div>

                <div>
                  <p className="text-xs font-semibold text-gray-500 uppercase tracking-wide mb-3">Agency-Level Counts (Unique Agencies)</p>
                  <div className="space-y-2">
                    {[
                      { label: 'Synced Agencies', value: ap.synced_unique_agencies, color: 'bg-blue-100 text-blue-800' },
                      { label: 'Opened Agencies', value: ap.opened_unique_agencies, rate: rate(ap.opened_unique_agencies, ap.synced_unique_agencies), color: 'bg-green-100 text-green-800' },
                      { label: 'Clicked Agencies', value: ap.clicked_unique_agencies, rate: rate(ap.clicked_unique_agencies, ap.synced_unique_agencies), color: 'bg-teal-100 text-teal-800' },
                      { label: 'Replied Agencies', value: ap.replied_unique_agencies, rate: rate(ap.replied_unique_agencies, ap.synced_unique_agencies), color: 'bg-rose-100 text-rose-800' },
                      { label: 'Bounced Agencies', value: ap.bounced_unique_agencies, rate: rate(ap.bounced_unique_agencies, ap.synced_unique_agencies), color: 'bg-red-100 text-red-800' },
                      { label: 'Unsubscribed Agencies', value: ap.unsubscribed_unique_agencies, rate: rate(ap.unsubscribed_unique_agencies, ap.synced_unique_agencies), color: 'bg-gray-100 text-gray-800' },
                    ].map(({ label, value, rate: r, color }) => (
                      <div key={label} className="flex justify-between items-center p-2.5 bg-gray-50 rounded-lg border border-gray-100">
                        <span className="text-sm text-gray-700">{label}</span>
                        <div className="flex items-center gap-2">
                          {r && <span className={`text-xs px-1.5 py-0.5 rounded font-medium ${color}`}>{r}</span>}
                          <span className="font-bold text-gray-900 min-w-[2.5rem] text-right">{value.toLocaleString()}</span>
                        </div>
                      </div>
                    ))}
                  </div>
                </div>
              </div>
            </div>
            )}

            {/* ── BLOCK 5: Distortion / Coverage ────────────────────────── */}
            {ap.synced_unique_agencies > 0 && (
              <div className="bg-white rounded-xl border border-gray-200 p-6 shadow-sm">
                <SectionHeader icon={BarChart2} title="Distortion / Coverage Analysis" subtitle="How concentrated is the campaign on individual agencies?" />
                <div className="grid grid-cols-2 md:grid-cols-4 gap-3 mb-4">
                  <Stat
                    label="Avg Synced Emails per Contacted Agency"
                    value={dist.avg_synced_emails_per_contacted_agency !== null ? dist.avg_synced_emails_per_contacted_agency.toFixed(2) : '—'}
                    sub="1.0 = one_per_agency, >1 = multi-email"
                    color={dist.avg_synced_emails_per_contacted_agency !== null && dist.avg_synced_emails_per_contacted_agency > 1.5 ? 'amber' : 'green'}
                  />
                  <Stat label="Contacted Agencies — 1 Email" value={dist.contacted_agencies_with_1_email} color="green" />
                  <Stat label="Contacted Agencies — 2 Emails" value={dist.contacted_agencies_with_2_emails} color="amber" />
                  <Stat label="Contacted Agencies — 3+ Emails" value={dist.contacted_agencies_with_3plus_emails} color="red" />
                </div>
                {dist.contacted_agencies_with_3plus_emails > 0 && (
                  <div className="p-3 bg-amber-50 border border-amber-200 rounded-lg text-xs text-amber-800">
                    <strong>{dist.contacted_agencies_with_3plus_emails}</strong> agencies received 3+ emails in this campaign.
                    Consider switching to <strong>one_per_agency</strong> mode to reduce noise and improve agency-level reply rate accuracy.
                  </div>
                )}
              </div>
            )}
          </div>
        </div>

        {/* Tabs */}
        <div className="flex gap-1 border-b border-gray-200">
          {(['overview','preview','contacts','history','diagnostic'] as const).map(tab => (
            <button key={tab} onClick={() => setActiveTab(tab)}
              className={`px-4 py-2.5 text-sm font-medium capitalize transition-colors ${
                activeTab === tab ? 'border-b-2 border-blue-600 text-blue-600' : 'text-gray-500 hover:text-gray-900'
              }`}>
              {tab === 'diagnostic' ? 'ListClean Diagnostic' : tab === 'preview' ? 'Dry Run Preview' : tab.charAt(0).toUpperCase() + tab.slice(1)}
            </button>
          ))}
        </div>

        {/* ── TAB: Dry Run Preview ─────────────────────────────────────── */}
        {activeTab === 'preview' && (
          <div className="bg-white rounded-xl border border-gray-200 p-6">
            <h2 className="text-base font-semibold text-gray-900 mb-2">Dry Run Preview</h2>
            {syncResult && syncResult.dry_run ? (
              <div className="space-y-4">
                <div className="grid grid-cols-2 md:grid-cols-4 gap-3">
                  <Stat label="Selected Email Rows" value={syncResult.selected_email_rows} color="blue" />
                  <Stat label="Selected Unique Agencies" value={syncResult.selected_unique_agencies} color="green" />
                  <Stat label="New (To Sync)" value={syncResult.attempted_to_sync} color="teal" />
                  <Stat label="Already Synced (Skipped)" value={syncResult.skipped_duplicates} color="gray" />
                </div>

                {syncResult.preview_rows && syncResult.preview_rows.length > 0 && (
                  <div>
                    <p className="text-sm font-semibold text-gray-700 mb-2">
                      Preview rows (showing up to 50)
                    </p>
                    <div className="overflow-x-auto rounded-lg border border-gray-200">
                      <table className="w-full text-xs">
                        <thead className="bg-gray-50 border-b border-gray-200">
                          <tr>
                            <th className="px-3 py-2 text-left font-semibold text-gray-700">Agency</th>
                            <th className="px-3 py-2 text-left font-semibold text-gray-700">Selected Email</th>
                            <th className="px-3 py-2 text-left font-semibold text-gray-700">Primary</th>
                            <th className="px-3 py-2 text-left font-semibold text-gray-700">Role-Based</th>
                            <th className="px-3 py-2 text-left font-semibold text-gray-700">Clean Total</th>
                            <th className="px-3 py-2 text-left font-semibold text-gray-700">Selection Reason</th>
                          </tr>
                        </thead>
                        <tbody>
                          {syncResult.preview_rows.map((row, i) => (
                            <tr key={i} className="border-t border-gray-100 hover:bg-gray-50">
                              <td className="px-3 py-2 font-medium">{row.agency_name}</td>
                              <td className="px-3 py-2 text-gray-600">{row.selected_email}</td>
                              <td className="px-3 py-2">
                                {row.is_primary
                                  ? <span className="text-green-700 font-medium">Yes</span>
                                  : <span className="text-gray-400">No</span>}
                              </td>
                              <td className="px-3 py-2">
                                {row.is_role_based
                                  ? <span className="text-amber-700">Role</span>
                                  : <span className="text-teal-700">Personal</span>}
                              </td>
                              <td className="px-3 py-2 text-center">
                                <span className={`font-bold ${row.total_clean_emails_for_agency > 1 ? 'text-amber-700' : 'text-gray-900'}`}>
                                  {row.total_clean_emails_for_agency}
                                </span>
                              </td>
                              <td className="px-3 py-2 text-gray-500">{row.selection_reason}</td>
                            </tr>
                          ))}
                        </tbody>
                      </table>
                    </div>
                  </div>
                )}
              </div>
            ) : (
              <p className="text-gray-500 text-sm">Click "Preview (Dry Run)" to see which contacts would be selected and why.</p>
            )}
          </div>
        )}

        {/* ── TAB: Contacts ─────────────────────────────────────────────── */}
        {activeTab === 'contacts' && (
          <div className="bg-white rounded-xl border border-gray-200 p-6">
            <h2 className="text-base font-semibold text-gray-900 mb-4">Contact Activity</h2>
            <div className="mb-4 flex gap-2">
              <input type="text" placeholder="Search email or agency..." value={contactsSearch}
                onChange={e => setContactsSearch(e.target.value)}
                className="flex-1 px-3 py-2 border border-gray-300 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-blue-500" />
              <select value={contactsStatus} onChange={e => setContactsStatus(e.target.value)}
                className="px-3 py-2 border border-gray-300 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-blue-500">
                <option value="">All statuses</option>
                <option value="replied">Replied</option>
                <option value="opened">Opened</option>
                <option value="clicked">Clicked</option>
                <option value="bounced">Bounced</option>
                <option value="opted_out">Opted Out</option>
              </select>
              <button onClick={() => loadContacts(1)} disabled={contactsLoading || status !== 'valid'}
                className="px-3 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 disabled:bg-gray-300">
                <Search className="w-4 h-4" />
              </button>
            </div>

            {contactsLoading ? (
              <div className="text-center py-8"><Loader className="w-7 h-7 animate-spin mx-auto text-gray-400" /></div>
            ) : contacts.length === 0 ? (
              <p className="text-gray-500 text-sm text-center py-8">No contacts found</p>
            ) : (
              <>
                <div className="overflow-x-auto rounded-lg border border-gray-200">
                  <table className="w-full text-xs">
                    <thead className="bg-gray-50 border-b border-gray-200">
                      <tr>
                        <th className="px-3 py-2 text-left font-semibold">Agency</th>
                        <th className="px-3 py-2 text-left font-semibold">Email</th>
                        <th className="px-3 py-2 text-left font-semibold">State</th>
                        <th className="px-3 py-2 text-left font-semibold">Status</th>
                        <th className="px-3 py-2 text-left font-semibold">Opens / Clicks / Replies</th>
                        <th className="px-3 py-2 text-left font-semibold">Last Event</th>
                      </tr>
                    </thead>
                    <tbody>
                      {contacts.map(c => (
                        <tr key={c.other_agency_email_id} className="border-t border-gray-100 hover:bg-gray-50">
                          <td className="px-3 py-2 font-medium">{c.agency_name}</td>
                          <td className="px-3 py-2 text-gray-600">{c.email_normalized}</td>
                          <td className="px-3 py-2">{formatStateName(c.state_slug)}</td>
                          <td className="px-3 py-2">{c.outreach_status}</td>
                          <td className="px-3 py-2">{c.events_summary.opens}/{c.events_summary.clicks}/{c.events_summary.replies}</td>
                          <td className="px-3 py-2 text-gray-500">
                            {c.events_summary.last_event_type || '—'}
                          </td>
                        </tr>
                      ))}
                    </tbody>
                  </table>
                </div>
                <div className="mt-3 flex justify-between items-center">
                  <p className="text-xs text-gray-500">Showing {contacts.length} of {contactsTotal}</p>
                  <div className="flex gap-2">
                    <button onClick={() => loadContacts(Math.max(1, contactsPage - 1))} disabled={contactsPage === 1 || contactsLoading}
                      className="px-3 py-1 border border-gray-300 rounded text-xs hover:bg-gray-50 disabled:opacity-50">Previous</button>
                    <span className="px-2 py-1 text-xs">Page {contactsPage}</span>
                    <button onClick={() => loadContacts(contactsPage + 1)} disabled={contacts.length < 50 || contactsLoading}
                      className="px-3 py-1 border border-gray-300 rounded text-xs hover:bg-gray-50 disabled:opacity-50">Next</button>
                  </div>
                </div>
              </>
            )}
          </div>
        )}

        {/* ── TAB: History ──────────────────────────────────────────────── */}
        {activeTab === 'history' && (
          <div className="bg-white rounded-xl border border-gray-200 p-6">
            <h2 className="text-base font-semibold text-gray-900 mb-4">Recent Activity</h2>
            <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
              <div>
                <h3 className="text-sm font-semibold text-gray-700 mb-3">Sync Runs</h3>
                <div className="space-y-2">
                  {displayStats.recent_sync_runs.length > 0
                    ? displayStats.recent_sync_runs.map((run, i) => (
                      <div key={i} className="p-3 bg-gray-50 rounded-lg text-xs border border-gray-100">
                        <div className="font-semibold text-gray-800">{run.campaign_id} — {run.send_mode}</div>
                        <div className="text-gray-500 mt-0.5">{new Date(run.created_at).toLocaleString()}</div>
                        {run.synced_success > 0 && <div className="text-green-700 mt-0.5">{run.synced_success} synced</div>}
                      </div>
                    ))
                    : <p className="text-gray-400 text-sm">No sync runs yet</p>}
                </div>
              </div>
              <div>
                <h3 className="text-sm font-semibold text-gray-700 mb-3">Webhook Events</h3>
                <div className="space-y-2">
                  {displayStats.recent_webhook_events.length > 0
                    ? displayStats.recent_webhook_events.map((evt, i) => (
                      <div key={i} className="p-3 bg-gray-50 rounded-lg text-xs border border-gray-100">
                        <div className="font-semibold text-gray-800">{evt.event_type}</div>
                        <div className="text-gray-500 mt-0.5">{evt.email_normalized}</div>
                        <div className="text-gray-400 mt-0.5">{new Date(evt.received_at).toLocaleString()}</div>
                      </div>
                    ))
                    : <p className="text-gray-400 text-sm">No webhook events yet</p>}
                </div>
              </div>
            </div>
          </div>
        )}

        {/* ── TAB: ListClean Diagnostic ─────────────────────────────────── */}
        {activeTab === 'diagnostic' && (
          <ListCleanVerificationDiagnostic state={state} token={token} />
        )}
      </div>
    </EmailModuleLayout>
  );
}
