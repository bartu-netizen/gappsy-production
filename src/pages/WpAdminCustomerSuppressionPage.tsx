import { useCallback, useEffect, useMemo, useState } from 'react';
import { ShieldOff, RefreshCw, Download, AlertTriangle, CheckCircle2, Filter as FilterIcon, Zap, Play, RotateCcw, FlaskConical, X } from 'lucide-react';
import WpAdminLayout from '../components/wpadmin/WpAdminLayout';
import { adminApiFetch } from '../lib/adminApiFetch';

interface PaidAgencyRecord {
  agency_id: string | null;
  agency_name: string | null;
  agency_name_canonical: string | null;
  agency_name_preserved: string | null;
  state_slug: string | null;
  listing_type: string;
  top25_rank: number | null;
  paid_at: string | null;
  source: string;
}

type PaidSourceType =
  | 'stripe_verified'
  | 'manual_top25'
  | 'manual_standard'
  | 'legacy_paid_flag'
  | 'spotlight';

interface SuppressedPaidAgency {
  agency_id: string | null;
  agency_name: string | null;
  normalized_agency_name: string | null;
  state_slug: string | null;
  state_name: string | null;
  listing_type: string;
  top25_rank: number | null;
  paid_source: string;
  paid_source_type: PaidSourceType;
  paid_at: string | null;
  confidence: 'exact' | 'high' | 'medium' | 'low';
  requires_manual_review: boolean;
  matched_email_count: number;
  protected_from_future_exports: true;
}

interface MatchedSuppressionEmail {
  email: string;
  email_normalized: string;
  company_name: string | null;
  state_slug: string | null;
  agency_id: string | null;
  paid_agency_id: string | null;
  paid_agency_name: string | null;
  listing_type: string;
  top25_rank: number | null;
  paid_source_type: PaidSourceType;
  match_method: 'agency_id' | 'name_state_slug' | 'name_state_name' | 'fuzzy_name';
  match_confidence: 'exact' | 'high' | 'medium' | 'low';
  suppression_reason: string;
}

interface SuppressionLead {
  email: string;
  email_normalized: string;
  company_name: string | null;
  state: string | null;
  state_slug: string | null;
  agency_id: string;
  paid_agency_id: string;
  paid_agency_name: string | null;
  listing_type: string;
  top25_rank: number | null;
  paid_at: string | null;
  match_method: 'agency_id' | 'name_state_slug' | 'name_state_name' | 'fuzzy_name';
  match_confidence: 'exact' | 'high' | 'medium' | 'low';
  suppression_reason: string;
}

interface SuppressionResponse {
  generated_at: string;
  filters: { stateSlug: string | null; listingType: string | null; includeFuzzy: boolean };
  summary: {
    total_paid_agencies: number;
    total_leads_suppressed: number;
    suppressed_agencies_with_zero_emails?: number;
    leads_by_match_method: Record<string, number>;
    paid_agencies_by_listing_type: Record<string, number>;
    paid_agencies_by_source_type?: Record<string, number>;
    fallback_email_source_count?: number;
    requires_manual_review_count?: number;
    future_export_protection_enabled: boolean;
    identity_layer_present?: boolean;
  };
  paid_agencies: PaidAgencyRecord[];
  leads: SuppressionLead[];
  suppressed_paid_agencies?: SuppressedPaidAgency[];
  matched_suppression_emails?: MatchedSuppressionEmail[];
  warnings?: string[];
  debug?: { excluded_reason: string };
}

interface RunnerTotals {
  total: number;
  found: number;
  not_found: number;
  already_unsubscribed: number;
  unsubscribed: number;
  would_unsubscribe: number;
  would_delete_from_campaigns: number;
  campaigns_deleted: number;
  failed: number;
  total_skipped_by_email_allowlist?: number;
}

interface RunnerPerEmail {
  email: string;
  agency_name: string | null;
  state_slug: string | null;
  smartlead_lead_id: string | null;
  status: 'found' | 'not_found' | 'already_unsubscribed' | 'unsubscribed' | 'would_unsubscribe' | 'failed';
  campaigns_deleted: number;
  campaigns_would_delete: number;
  error: string | null;
}

interface RunnerResponse {
  ok: boolean;
  run_id: string;
  dry_run: boolean;
  enable_campaign_delete: boolean;
  retry_failed_only: boolean;
  totals: RunnerTotals;
  per_email: RunnerPerEmail[];
}

type RunnerMode = 'dry' | 'live' | 'retry';

const RUNNER_STATUS_STYLES: Record<string, string> = {
  unsubscribed: 'bg-emerald-100 text-emerald-700 border-emerald-300',
  would_unsubscribe: 'bg-blue-100 text-blue-700 border-blue-300',
  already_unsubscribed: 'bg-slate-100 text-slate-600 border-slate-300',
  not_found: 'bg-amber-100 text-amber-700 border-amber-300',
  failed: 'bg-red-100 text-red-700 border-red-300',
  found: 'bg-blue-100 text-blue-700 border-blue-300',
};

const CSV_COLUMNS = [
  'email',
  'company_name',
  'state',
  'state_slug',
  'agency_id',
  'paid_agency_name',
  'listing_type',
  'top25_rank',
  'paid_at',
  'match_method',
  'match_confidence',
  'suppression_reason',
] as const;

function escapeCsv(value: unknown): string {
  if (value === null || value === undefined) return '';
  const s = String(value);
  return /[",\n]/.test(s) ? `"${s.replace(/"/g, '""')}"` : s;
}

function buildCsv(leads: SuppressionLead[]): string {
  const lines = [CSV_COLUMNS.join(',')];
  for (const lead of leads) {
    lines.push([
      lead.email,
      lead.company_name,
      lead.state,
      lead.state_slug,
      lead.agency_id,
      lead.paid_agency_name,
      lead.listing_type,
      lead.top25_rank,
      lead.paid_at,
      lead.match_method,
      lead.match_confidence,
      lead.suppression_reason,
    ].map(escapeCsv).join(','));
  }
  return lines.join('\n');
}

function formatDate(iso: string | null): string {
  if (!iso) return '-';
  const d = new Date(iso);
  if (isNaN(d.getTime())) return '-';
  return d.toLocaleDateString('en-US', { month: 'short', day: 'numeric', year: 'numeric' });
}

const CONFIDENCE_STYLES: Record<string, string> = {
  exact: 'bg-emerald-100 text-emerald-700 border-emerald-300',
  high: 'bg-blue-100 text-blue-700 border-blue-300',
  medium: 'bg-amber-100 text-amber-700 border-amber-300',
  low: 'bg-slate-100 text-slate-600 border-slate-300',
};

export default function WpAdminCustomerSuppressionPage() {
  const [data, setData] = useState<SuppressionResponse | null>(null);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [stateFilter, setStateFilter] = useState<string>('all');
  const [listingTypeFilter, setListingTypeFilter] = useState<string>('all');
  const [confidenceFilter, setConfidenceFilter] = useState<string>('all');
  const [includeFuzzy, setIncludeFuzzy] = useState(false);
  const [enableCampaignDelete, setEnableCampaignDelete] = useState(false);
  const [emailAllowlistInput, setEmailAllowlistInput] = useState('');
  const [runnerLoading, setRunnerLoading] = useState(false);
  const [runnerError, setRunnerError] = useState<string | null>(null);
  const [runnerResult, setRunnerResult] = useState<RunnerResponse | null>(null);
  const [confirmMode, setConfirmMode] = useState<RunnerMode | null>(null);

  const runRunner = useCallback(async (mode: RunnerMode) => {
    setRunnerLoading(true);
    setRunnerError(null);
    const emailAllowlist = emailAllowlistInput
      .split(',')
      .map((e) => e.trim().toLowerCase())
      .filter((e) => e.length > 0);
    const payload = {
      dryRun: mode === 'dry',
      enableCampaignDelete,
      retryFailedOnly: mode === 'retry',
      stateSlug: stateFilter !== 'all' ? stateFilter : null,
      listingType: listingTypeFilter !== 'all' ? listingTypeFilter : null,
      emailAllowlist,
    };
    const result = await adminApiFetch<RunnerResponse>('smartlead-suppression-runner', {
      method: 'POST',
      body: payload,
      timeoutMs: 300000,
    });
    if (result.ok && result.data) {
      setRunnerResult(result.data);
    } else {
      setRunnerError(result.error?.message || 'Runner failed');
    }
    setRunnerLoading(false);
    setConfirmMode(null);
  }, [enableCampaignDelete, stateFilter, listingTypeFilter, emailAllowlistInput]);

  const load = useCallback(async () => {
    setLoading(true);
    setError(null);
    const params = new URLSearchParams();
    if (stateFilter !== 'all') params.set('state_slug', stateFilter);
    if (listingTypeFilter !== 'all') params.set('listing_type', listingTypeFilter);
    if (includeFuzzy) params.set('include_fuzzy', 'true');
    const query = params.toString();
    const path = `customer-suppression-resolver${query ? `?${query}` : ''}`;
    const result = await adminApiFetch<SuppressionResponse>(path);
    if (result.ok && result.data) {
      setData(result.data);
    } else {
      setError(result.error?.message || 'Failed to load suppression data');
    }
    setLoading(false);
  }, [stateFilter, listingTypeFilter, includeFuzzy]);

  useEffect(() => { load(); }, [load]);

  const filteredLeads = useMemo(() => {
    if (!data) return [];
    return data.leads.filter((l) => {
      if (confidenceFilter !== 'all' && l.match_confidence !== confidenceFilter) return false;
      return true;
    });
  }, [data, confidenceFilter]);

  const states = useMemo(() => {
    if (!data) return [];
    const set = new Set<string>();
    for (const a of data.paid_agencies) {
      if (a.state_slug) set.add(a.state_slug);
    }
    return Array.from(set).sort();
  }, [data]);

  const listingTypes = useMemo(() => {
    if (!data) return [];
    return Object.keys(data.summary.paid_agencies_by_listing_type).sort();
  }, [data]);

  const downloadCsv = () => {
    if (!data) return;
    const csv = buildCsv(filteredLeads);
    const blob = new Blob([csv], { type: 'text/csv; charset=utf-8' });
    const url = URL.createObjectURL(blob);
    const a = document.createElement('a');
    a.href = url;
    const stamp = new Date().toISOString().split('T')[0];
    a.download = `customer-suppression-${stamp}.csv`;
    document.body.appendChild(a);
    a.click();
    document.body.removeChild(a);
    URL.revokeObjectURL(url);
  };

  return (
    <WpAdminLayout title="Customer Suppression" icon={<ShieldOff className="w-5 h-5" />}>
      <div className="space-y-6">
        {/* Validation card */}
        <div className="bg-white border border-emerald-200 rounded-xl p-5 flex items-start gap-4">
          <div className="shrink-0 flex items-center justify-center w-10 h-10 rounded-xl bg-emerald-100 text-emerald-700">
            <CheckCircle2 className="w-5 h-5" />
          </div>
          <div className="flex-1">
            <h2 className="text-sm font-semibold text-slate-900">Future Smartlead export protection: enabled</h2>
            <p className="mt-1 text-sm text-slate-600">
              Paid customer agencies are automatically removed from new Smartlead exports.
              Excluded with reason <code className="text-xs bg-slate-100 px-1.5 py-0.5 rounded">paid_customer_agency</code>.
            </p>
            <p className="mt-2 text-sm text-slate-700">
              <span className="font-semibold">{data?.summary.total_leads_suppressed ?? 0}</span> leads currently suppressed
              across <span className="font-semibold">{data?.summary.total_paid_agencies ?? 0}</span> paid agencies.
            </p>
          </div>
        </div>

        {/* Identity Layer panel */}
        {data?.suppressed_paid_agencies && (
          <IdentityLayerPanel
            agencies={data.suppressed_paid_agencies}
            zeroEmailCount={data.summary.suppressed_agencies_with_zero_emails ?? 0}
            requiresManualReviewCount={data.summary.requires_manual_review_count ?? 0}
            fallbackEmailSourceCount={data.summary.fallback_email_source_count ?? 0}
            sourceTypeCounts={data.summary.paid_agencies_by_source_type ?? {}}
            warnings={data.warnings ?? []}
            identityLayerPresent={data.summary.identity_layer_present ?? false}
          />
        )}

        {/* Summary cards */}
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4">
          <SummaryCard label="Paid Agencies" value={data?.summary.total_paid_agencies ?? 0} tone="blue" />
          <SummaryCard label="Suppressed Leads" value={data?.summary.total_leads_suppressed ?? 0} tone="red" />
          <SummaryCard label="Exact (agency_id)" value={data?.summary.leads_by_match_method?.agency_id ?? 0} tone="emerald" />
          <SummaryCard label="Name + State" value={(data?.summary.leads_by_match_method?.name_state_slug ?? 0) + (data?.summary.leads_by_match_method?.name_state_name ?? 0)} tone="amber" />
        </div>

        {/* Filters */}
        <div className="bg-white border border-slate-200 rounded-xl p-4">
          <div className="flex items-center gap-2 mb-3 text-sm font-semibold text-slate-700">
            <FilterIcon className="w-4 h-4" /> Filters
          </div>
          <div className="grid grid-cols-1 sm:grid-cols-4 gap-3">
            <FilterSelect label="State" value={stateFilter} onChange={setStateFilter} options={[{ value: 'all', label: 'All states' }, ...states.map(s => ({ value: s, label: s }))]} />
            <FilterSelect label="Listing Type" value={listingTypeFilter} onChange={setListingTypeFilter} options={[{ value: 'all', label: 'All types' }, ...listingTypes.map(t => ({ value: t, label: t }))]} />
            <FilterSelect label="Match Confidence" value={confidenceFilter} onChange={setConfidenceFilter} options={[
              { value: 'all', label: 'All' },
              { value: 'exact', label: 'Exact' },
              { value: 'high', label: 'High' },
              { value: 'medium', label: 'Medium' },
              { value: 'low', label: 'Low' },
            ]} />
            <label className="flex items-end gap-2 text-sm text-slate-700 pb-1.5">
              <input type="checkbox" checked={includeFuzzy} onChange={(e) => setIncludeFuzzy(e.target.checked)} className="w-4 h-4 rounded border-slate-300" />
              Include fuzzy name matches
            </label>
          </div>
          <div className="flex items-center gap-2 mt-4">
            <button onClick={load} disabled={loading} className="inline-flex items-center gap-2 px-3 py-2 text-sm font-medium text-slate-700 bg-slate-100 hover:bg-slate-200 rounded-lg transition-colors disabled:opacity-50">
              <RefreshCw className={`w-4 h-4 ${loading ? 'animate-spin' : ''}`} /> Refresh
            </button>
            <button onClick={downloadCsv} disabled={!data || filteredLeads.length === 0} className="inline-flex items-center gap-2 px-3 py-2 text-sm font-semibold text-white bg-blue-600 hover:bg-blue-700 rounded-lg transition-colors disabled:opacity-50">
              <Download className="w-4 h-4" /> Export CSV ({filteredLeads.length})
            </button>
          </div>
        </div>

        {error && (
          <div className="bg-red-50 border border-red-200 rounded-xl p-4 flex items-start gap-3">
            <AlertTriangle className="w-5 h-5 text-red-600 shrink-0 mt-0.5" />
            <p className="text-sm text-red-700">{error}</p>
          </div>
        )}

        {/* Main table */}
        <div className="bg-white border border-slate-200 rounded-xl overflow-hidden">
          <div className="px-4 py-3 border-b border-slate-200 flex items-center justify-between">
            <h3 className="text-sm font-semibold text-slate-900">Suppressed Leads</h3>
            <span className="text-xs text-slate-500">{filteredLeads.length.toLocaleString()} rows</span>
          </div>
          <div className="overflow-x-auto max-h-[640px]">
            <table className="w-full text-xs">
              <thead className="bg-slate-50 sticky top-0">
                <tr className="text-left text-slate-600">
                  <Th>Email</Th>
                  <Th>Company</Th>
                  <Th>State</Th>
                  <Th>Agency ID</Th>
                  <Th>Paid Agency</Th>
                  <Th>Listing</Th>
                  <Th>Rank</Th>
                  <Th>Paid At</Th>
                  <Th>Match</Th>
                  <Th>Confidence</Th>
                  <Th>Reason</Th>
                </tr>
              </thead>
              <tbody>
                {filteredLeads.length === 0 && !loading && (
                  <tr><td colSpan={11} className="text-center py-12 text-slate-400">No suppressed leads</td></tr>
                )}
                {filteredLeads.slice(0, 500).map((lead, idx) => (
                  <tr key={`${lead.agency_id}-${lead.email_normalized}-${idx}`} className="border-t border-slate-100 hover:bg-slate-50">
                    <Td className="font-mono text-slate-700">{lead.email}</Td>
                    <Td className="text-slate-600">{lead.company_name || '-'}</Td>
                    <Td className="text-slate-600">{lead.state_slug || '-'}</Td>
                    <Td className="font-mono text-slate-500 max-w-[120px] truncate">{lead.agency_id}</Td>
                    <Td className="text-slate-700">{lead.paid_agency_name || '-'}</Td>
                    <Td className="text-slate-600">{lead.listing_type}</Td>
                    <Td className="text-slate-600">{lead.top25_rank ?? '-'}</Td>
                    <Td className="text-slate-500">{formatDate(lead.paid_at)}</Td>
                    <Td className="text-slate-600">{lead.match_method}</Td>
                    <Td>
                      <span className={`inline-block px-2 py-0.5 rounded-full border text-[10px] font-semibold uppercase ${CONFIDENCE_STYLES[lead.match_confidence] || ''}`}>
                        {lead.match_confidence}
                      </span>
                    </Td>
                    <Td className="text-slate-500 text-[10px]">{lead.suppression_reason}</Td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
          {filteredLeads.length > 500 && (
            <div className="px-4 py-2 text-xs text-slate-500 border-t border-slate-100 bg-slate-50">
              Showing first 500 rows. Export CSV to see all {filteredLeads.length.toLocaleString()}.
            </div>
          )}
        </div>

        {/* Smartlead Automation */}
        <div className="bg-white border border-slate-200 rounded-xl overflow-hidden">
          <div className="px-5 py-4 border-b border-slate-200 bg-gradient-to-r from-slate-50 to-white">
            <div className="flex items-center gap-3">
              <div className="shrink-0 flex items-center justify-center w-10 h-10 rounded-xl bg-blue-100 text-blue-700">
                <Zap className="w-5 h-5" />
              </div>
              <div>
                <h3 className="text-sm font-semibold text-slate-900">Smartlead Automation</h3>
                <p className="text-xs text-slate-600 mt-0.5">Globally unsubscribe paid-customer emails from Smartlead. Uses identity-only matches (no fuzzy).</p>
              </div>
            </div>
          </div>
          <div className="p-5 space-y-4">
            <label className="flex items-start gap-2 text-sm text-slate-700">
              <input
                type="checkbox"
                checked={enableCampaignDelete}
                onChange={(e) => setEnableCampaignDelete(e.target.checked)}
                className="mt-0.5 w-4 h-4 rounded border-slate-300"
              />
              <span>
                <span className="font-medium">Also delete leads from campaigns after global unsubscribe</span>
                <span className="block text-xs text-slate-500 mt-0.5">Off by default. Global unsubscribe is sufficient to stop sending in most cases.</span>
              </span>
            </label>

            <label className="block">
              <span className="text-sm font-medium text-slate-700">Test only these emails (optional)</span>
              <span className="block text-xs text-slate-500 mt-0.5 mb-1.5">
                Comma-separated. When set, only matched leads whose email is in this list will be processed. Leave empty for full run.
              </span>
              <textarea
                value={emailAllowlistInput}
                onChange={(e) => setEmailAllowlistInput(e.target.value)}
                rows={2}
                placeholder="lead1@agency.com, lead2@agency.com"
                className="w-full rounded-lg border border-slate-300 bg-white px-3 py-2 text-sm font-mono text-slate-800 focus:outline-none focus:ring-2 focus:ring-blue-500"
              />
            </label>

            <div className="flex flex-wrap items-center gap-2">
              <button
                onClick={() => setConfirmMode('dry')}
                disabled={runnerLoading}
                className="inline-flex items-center gap-2 px-3 py-2 text-sm font-medium text-slate-700 bg-slate-100 hover:bg-slate-200 rounded-lg transition-colors disabled:opacity-50"
              >
                <FlaskConical className="w-4 h-4" /> Dry Run
              </button>
              <button
                onClick={() => setConfirmMode('live')}
                disabled={runnerLoading}
                className="inline-flex items-center gap-2 px-3 py-2 text-sm font-semibold text-white bg-red-600 hover:bg-red-700 rounded-lg transition-colors disabled:opacity-50"
              >
                <Play className="w-4 h-4" /> Run (Live)
              </button>
              <button
                onClick={() => setConfirmMode('retry')}
                disabled={runnerLoading}
                className="inline-flex items-center gap-2 px-3 py-2 text-sm font-medium text-slate-700 bg-amber-100 hover:bg-amber-200 rounded-lg transition-colors disabled:opacity-50"
              >
                <RotateCcw className="w-4 h-4" /> Retry Failed Only
              </button>
              {runnerLoading && (
                <span className="text-xs text-slate-500 inline-flex items-center gap-1">
                  <RefreshCw className="w-3.5 h-3.5 animate-spin" /> Running...
                </span>
              )}
            </div>

            {runnerError && (
              <div className="bg-red-50 border border-red-200 rounded-lg p-3 flex items-start gap-2">
                <AlertTriangle className="w-4 h-4 text-red-600 shrink-0 mt-0.5" />
                <p className="text-sm text-red-700">{runnerError}</p>
              </div>
            )}

            {runnerResult && (
              <div className="space-y-3">
                <div className="grid grid-cols-2 sm:grid-cols-4 lg:grid-cols-7 gap-2">
                  <RunnerStat label="Processed" value={runnerResult.totals.total} />
                  <RunnerStat label="Found" value={runnerResult.totals.found} tone="blue" />
                  <RunnerStat label="Not Found" value={runnerResult.totals.not_found} tone="amber" />
                  <RunnerStat label={runnerResult.dry_run ? 'Would Unsub' : 'Unsubscribed'} value={runnerResult.dry_run ? runnerResult.totals.would_unsubscribe : runnerResult.totals.unsubscribed} tone="emerald" />
                  <RunnerStat label="Already Unsub" value={runnerResult.totals.already_unsubscribed} />
                  <RunnerStat label="Failed" value={runnerResult.totals.failed} tone="red" />
                  <RunnerStat label={runnerResult.dry_run ? 'Would Delete' : 'Campaigns Deleted'} value={runnerResult.dry_run ? runnerResult.totals.would_delete_from_campaigns : runnerResult.totals.campaigns_deleted} />
                </div>

                <div className="text-xs text-slate-600">
                  Run ID: <code className="bg-slate-100 px-1.5 py-0.5 rounded font-mono">{runnerResult.run_id}</code>
                  <span className="ml-2">Mode: <strong>{runnerResult.dry_run ? 'Dry Run' : 'Live'}</strong></span>
                  <span className="ml-2">Campaign delete: <strong>{runnerResult.enable_campaign_delete ? 'On' : 'Off'}</strong></span>
                  {(runnerResult.totals.total_skipped_by_email_allowlist ?? 0) > 0 && (
                    <span className="ml-2">
                      Skipped by email allowlist:{' '}
                      <strong>{runnerResult.totals.total_skipped_by_email_allowlist}</strong>
                    </span>
                  )}
                </div>

                <div className="border border-slate-200 rounded-lg overflow-hidden">
                  <div className="px-3 py-2 bg-slate-50 border-b border-slate-200 text-xs font-semibold text-slate-700">
                    Per-email results ({runnerResult.per_email.length})
                  </div>
                  <div className="max-h-[420px] overflow-y-auto">
                    <table className="w-full text-xs">
                      <thead className="bg-white sticky top-0 border-b border-slate-200">
                        <tr className="text-left text-slate-600">
                          <th className="px-3 py-2 font-semibold">Email</th>
                          <th className="px-3 py-2 font-semibold">Agency</th>
                          <th className="px-3 py-2 font-semibold">State</th>
                          <th className="px-3 py-2 font-semibold">Lead ID</th>
                          <th className="px-3 py-2 font-semibold">Status</th>
                          <th className="px-3 py-2 font-semibold">Campaigns</th>
                          <th className="px-3 py-2 font-semibold">Error</th>
                        </tr>
                      </thead>
                      <tbody>
                        {runnerResult.per_email.length === 0 && (
                          <tr><td colSpan={7} className="text-center py-6 text-slate-400">No rows</td></tr>
                        )}
                        {runnerResult.per_email.slice(0, 500).map((row, idx) => (
                          <tr key={`${row.email}-${idx}`} className="border-t border-slate-100">
                            <td className="px-3 py-1.5 font-mono text-slate-700">{row.email}</td>
                            <td className="px-3 py-1.5 text-slate-600">{row.agency_name || '-'}</td>
                            <td className="px-3 py-1.5 text-slate-600">{row.state_slug || '-'}</td>
                            <td className="px-3 py-1.5 font-mono text-slate-500">{row.smartlead_lead_id || '-'}</td>
                            <td className="px-3 py-1.5">
                              <span className={`inline-block px-2 py-0.5 rounded-full border text-[10px] font-semibold uppercase ${RUNNER_STATUS_STYLES[row.status] || 'bg-slate-100 text-slate-600 border-slate-300'}`}>
                                {row.status.replace(/_/g, ' ')}
                              </span>
                            </td>
                            <td className="px-3 py-1.5 text-slate-600">
                              {runnerResult.dry_run ? row.campaigns_would_delete : row.campaigns_deleted}
                            </td>
                            <td className="px-3 py-1.5 text-red-600 text-[11px]">{row.error || '-'}</td>
                          </tr>
                        ))}
                      </tbody>
                    </table>
                  </div>
                  {runnerResult.per_email.length > 500 && (
                    <div className="px-3 py-2 text-xs text-slate-500 border-t border-slate-100 bg-slate-50">
                      Showing first 500 of {runnerResult.per_email.length} rows.
                    </div>
                  )}
                </div>
              </div>
            )}
          </div>
        </div>

        {confirmMode && (
          <ConfirmRunnerModal
            mode={confirmMode}
            emailCount={data?.summary.total_leads_suppressed ?? 0}
            enableCampaignDelete={enableCampaignDelete}
            onConfirm={() => runRunner(confirmMode)}
            onCancel={() => setConfirmMode(null)}
            loading={runnerLoading}
          />
        )}

        {/* Debug section */}
        {data && (
          <div className="bg-slate-900 border border-slate-700 rounded-xl p-4">
            <h3 className="text-sm font-semibold text-slate-200 mb-3">Debug</h3>
            <dl className="grid grid-cols-2 gap-3 text-xs">
              <DebugRow label="Generated at" value={data.generated_at} />
              <DebugRow label="Filters" value={JSON.stringify(data.filters)} />
              <DebugRow label="Excluded reason tag" value={data.debug?.excluded_reason || 'paid_customer_agency'} />
              <DebugRow label="Match methods" value={JSON.stringify(data.summary.leads_by_match_method)} />
              <DebugRow label="Paid agencies by type" value={JSON.stringify(data.summary.paid_agencies_by_listing_type)} />
              <DebugRow label="Future-export protection" value={data.summary.future_export_protection_enabled ? 'enabled' : 'disabled'} />
            </dl>
          </div>
        )}
      </div>
    </WpAdminLayout>
  );
}

function SummaryCard({ label, value, tone }: { label: string; value: number; tone: 'blue' | 'red' | 'emerald' | 'amber' }) {
  const tones: Record<string, string> = {
    blue: 'bg-blue-50 text-blue-700 border-blue-200',
    red: 'bg-red-50 text-red-700 border-red-200',
    emerald: 'bg-emerald-50 text-emerald-700 border-emerald-200',
    amber: 'bg-amber-50 text-amber-700 border-amber-200',
  };
  return (
    <div className={`border rounded-xl p-4 ${tones[tone]}`}>
      <p className="text-xs font-medium uppercase tracking-wide opacity-80">{label}</p>
      <p className="mt-1 text-2xl font-bold tabular-nums">{value.toLocaleString()}</p>
    </div>
  );
}

function FilterSelect({ label, value, onChange, options }: { label: string; value: string; onChange: (v: string) => void; options: { value: string; label: string }[] }) {
  return (
    <label className="block">
      <span className="text-xs font-medium text-slate-600">{label}</span>
      <select value={value} onChange={(e) => onChange(e.target.value)} className="mt-1 w-full rounded-lg border border-slate-300 bg-white px-3 py-2 text-sm text-slate-800 focus:outline-none focus:ring-2 focus:ring-blue-500">
        {options.map((opt) => (
          <option key={opt.value} value={opt.value}>{opt.label}</option>
        ))}
      </select>
    </label>
  );
}

function Th({ children }: { children: React.ReactNode }) {
  return <th className="px-3 py-2 text-[11px] font-semibold uppercase tracking-wide whitespace-nowrap">{children}</th>;
}

function Td({ children, className = '' }: { children: React.ReactNode; className?: string }) {
  return <td className={`px-3 py-2 whitespace-nowrap ${className}`}>{children}</td>;
}

function RunnerStat({ label, value, tone = 'slate' }: { label: string; value: number; tone?: 'slate' | 'blue' | 'red' | 'emerald' | 'amber' }) {
  const tones: Record<string, string> = {
    slate: 'bg-slate-50 text-slate-700 border-slate-200',
    blue: 'bg-blue-50 text-blue-700 border-blue-200',
    red: 'bg-red-50 text-red-700 border-red-200',
    emerald: 'bg-emerald-50 text-emerald-700 border-emerald-200',
    amber: 'bg-amber-50 text-amber-700 border-amber-200',
  };
  return (
    <div className={`border rounded-lg p-2.5 ${tones[tone]}`}>
      <p className="text-[10px] font-semibold uppercase tracking-wide opacity-80">{label}</p>
      <p className="mt-0.5 text-lg font-bold tabular-nums">{value.toLocaleString()}</p>
    </div>
  );
}

function ConfirmRunnerModal({
  mode,
  emailCount,
  enableCampaignDelete,
  onConfirm,
  onCancel,
  loading,
}: {
  mode: 'dry' | 'live' | 'retry';
  emailCount: number;
  enableCampaignDelete: boolean;
  onConfirm: () => void;
  onCancel: () => void;
  loading: boolean;
}) {
  const isLive = mode === 'live';
  const title =
    mode === 'dry' ? 'Confirm Dry Run' :
    mode === 'retry' ? 'Confirm Retry Failed Only' :
    'Confirm Live Smartlead Unsubscribe';
  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/40 p-4">
      <div className="bg-white rounded-xl shadow-2xl border border-slate-200 max-w-md w-full overflow-hidden">
        <div className="px-5 py-4 border-b border-slate-200 flex items-center justify-between">
          <h4 className="text-base font-semibold text-slate-900">{title}</h4>
          <button onClick={onCancel} disabled={loading} className="text-slate-400 hover:text-slate-600">
            <X className="w-4 h-4" />
          </button>
        </div>
        <div className="px-5 py-4 space-y-3 text-sm text-slate-700">
          <p>
            Suppression list size: <strong>{emailCount.toLocaleString()}</strong> emails
            (identity-only matches, no fuzzy).
          </p>
          {mode === 'retry' && (
            <p className="text-xs text-amber-700 bg-amber-50 border border-amber-200 rounded p-2">
              Will only re-process emails that previously failed in this mode.
            </p>
          )}
          <div className="bg-slate-50 border border-slate-200 rounded p-3 space-y-1 text-xs">
            <div>Mode: <strong>{isLive ? 'Live' : 'Dry Run'}</strong></div>
            <div>Campaign delete: <strong className={enableCampaignDelete ? 'text-red-600' : ''}>{enableCampaignDelete ? 'On' : 'Off'}</strong></div>
            <div>Smartlead source: <code>server.smartlead.ai/api/v1</code></div>
          </div>
          {isLive && (
            <div className="bg-red-50 border border-red-200 rounded p-3 text-xs text-red-700">
              <strong>Warning:</strong> This will globally unsubscribe matched emails in Smartlead.
              {enableCampaignDelete && ' Leads will also be deleted from each Smartlead campaign they belong to.'}
            </div>
          )}
        </div>
        <div className="px-5 py-3 border-t border-slate-200 flex items-center justify-end gap-2 bg-slate-50">
          <button
            onClick={onCancel}
            disabled={loading}
            className="px-3 py-2 text-sm font-medium text-slate-700 bg-white border border-slate-300 rounded-lg hover:bg-slate-100 disabled:opacity-50"
          >
            Cancel
          </button>
          <button
            onClick={onConfirm}
            disabled={loading}
            className={`px-3 py-2 text-sm font-semibold text-white rounded-lg disabled:opacity-50 ${isLive ? 'bg-red-600 hover:bg-red-700' : 'bg-blue-600 hover:bg-blue-700'}`}
          >
            {loading ? 'Running...' : isLive ? 'Yes, Run Live' : 'Confirm'}
          </button>
        </div>
      </div>
    </div>
  );
}

const SOURCE_TYPE_STYLES: Record<PaidSourceType, string> = {
  stripe_verified: 'bg-emerald-100 text-emerald-700 border-emerald-300',
  manual_top25: 'bg-blue-100 text-blue-700 border-blue-300',
  manual_standard: 'bg-amber-100 text-amber-700 border-amber-300',
  legacy_paid_flag: 'bg-slate-100 text-slate-600 border-slate-300',
  spotlight: 'bg-rose-100 text-rose-700 border-rose-300',
};

const SOURCE_TYPE_LABELS: Record<PaidSourceType, string> = {
  stripe_verified: 'Stripe Verified',
  manual_top25: 'Manual Top25',
  manual_standard: 'Manual Standard',
  legacy_paid_flag: 'Legacy Paid Flag',
  spotlight: 'Spotlight',
};

function IdentityLayerPanel({
  agencies,
  zeroEmailCount,
  requiresManualReviewCount,
  fallbackEmailSourceCount,
  sourceTypeCounts,
  warnings,
  identityLayerPresent,
}: {
  agencies: SuppressedPaidAgency[];
  zeroEmailCount: number;
  requiresManualReviewCount: number;
  fallbackEmailSourceCount: number;
  sourceTypeCounts: Record<string, number>;
  warnings: string[];
  identityLayerPresent: boolean;
}) {
  const [expanded, setExpanded] = useState(false);
  const visible = expanded ? agencies : agencies.slice(0, 25);

  return (
    <div className="bg-white border border-blue-200 rounded-xl overflow-hidden">
      <div className="px-5 py-4 border-b border-slate-200 bg-gradient-to-r from-blue-50 to-white">
        <div className="flex items-center justify-between flex-wrap gap-3">
          <div>
            <h3 className="text-sm font-semibold text-slate-900">Identity Layer: Suppressed Paid Agencies</h3>
            <p className="text-xs text-slate-600 mt-0.5">
              Paid customer identities protected from future Smartlead exports — even when no emails matched.
            </p>
          </div>
          <span className={`inline-flex items-center gap-1 text-[10px] font-semibold uppercase tracking-wide px-2 py-1 rounded-full border ${identityLayerPresent ? 'bg-emerald-50 text-emerald-700 border-emerald-200' : 'bg-red-50 text-red-700 border-red-200'}`}>
            {identityLayerPresent ? 'Identity layer present' : 'Identity layer missing'}
          </span>
        </div>
      </div>

      <div className="p-5 space-y-4">
        <div className="grid grid-cols-2 sm:grid-cols-4 gap-2">
          <RunnerStat label="Paid Agencies" value={agencies.length} tone="blue" />
          <RunnerStat label="Zero-Email Protected" value={zeroEmailCount} tone="amber" />
          <RunnerStat label="Manual Review" value={requiresManualReviewCount} tone="red" />
          <RunnerStat label="Fallback Email Source" value={fallbackEmailSourceCount} />
        </div>

        {Object.keys(sourceTypeCounts).length > 0 && (
          <div className="flex flex-wrap gap-2">
            {Object.entries(sourceTypeCounts).map(([type, count]) => {
              const t = type as PaidSourceType;
              return (
                <span key={type} className={`inline-block px-2.5 py-1 rounded-full border text-[11px] font-semibold ${SOURCE_TYPE_STYLES[t] || 'bg-slate-100 text-slate-600 border-slate-300'}`}>
                  {SOURCE_TYPE_LABELS[t] || type}: {count}
                </span>
              );
            })}
          </div>
        )}

        {warnings.length > 0 && (
          <div className="bg-amber-50 border border-amber-200 rounded-lg p-3 space-y-1">
            <div className="flex items-center gap-2 text-xs font-semibold text-amber-800">
              <AlertTriangle className="w-4 h-4" /> Warnings
            </div>
            <ul className="text-xs text-amber-700 list-disc pl-5 space-y-0.5">
              {warnings.map((w, i) => <li key={i}>{w}</li>)}
            </ul>
          </div>
        )}

        <div className="border border-slate-200 rounded-lg overflow-hidden">
          <div className="px-3 py-2 bg-slate-50 border-b border-slate-200 text-xs font-semibold text-slate-700 flex items-center justify-between">
            <span>Paid customer identities ({agencies.length})</span>
            {agencies.length > 25 && (
              <button onClick={() => setExpanded(!expanded)} className="text-blue-600 hover:text-blue-800 font-medium">
                {expanded ? 'Show less' : `Show all ${agencies.length}`}
              </button>
            )}
          </div>
          <div className="overflow-x-auto max-h-[480px]">
            <table className="w-full text-xs">
              <thead className="bg-white sticky top-0 border-b border-slate-200">
                <tr className="text-left text-slate-600">
                  <th className="px-3 py-2 font-semibold">Agency</th>
                  <th className="px-3 py-2 font-semibold">State</th>
                  <th className="px-3 py-2 font-semibold">Listing</th>
                  <th className="px-3 py-2 font-semibold">Rank</th>
                  <th className="px-3 py-2 font-semibold">Source Type</th>
                  <th className="px-3 py-2 font-semibold">Confidence</th>
                  <th className="px-3 py-2 font-semibold">Emails</th>
                  <th className="px-3 py-2 font-semibold">Review</th>
                </tr>
              </thead>
              <tbody>
                {visible.length === 0 && (
                  <tr><td colSpan={8} className="text-center py-6 text-slate-400">No paid agencies</td></tr>
                )}
                {visible.map((a, idx) => (
                  <tr key={`${a.agency_id || a.normalized_agency_name}-${idx}`} className="border-t border-slate-100 hover:bg-slate-50">
                    <td className="px-3 py-1.5 text-slate-800 font-medium">{a.agency_name || '-'}</td>
                    <td className="px-3 py-1.5 text-slate-600">{a.state_slug || a.state_name || '-'}</td>
                    <td className="px-3 py-1.5 text-slate-600">{a.listing_type}</td>
                    <td className="px-3 py-1.5 text-slate-600">{a.top25_rank ?? '-'}</td>
                    <td className="px-3 py-1.5">
                      <span className={`inline-block px-2 py-0.5 rounded-full border text-[10px] font-semibold ${SOURCE_TYPE_STYLES[a.paid_source_type] || 'bg-slate-100 text-slate-600 border-slate-300'}`}>
                        {SOURCE_TYPE_LABELS[a.paid_source_type] || a.paid_source_type}
                      </span>
                    </td>
                    <td className="px-3 py-1.5">
                      <span className={`inline-block px-2 py-0.5 rounded-full border text-[10px] font-semibold uppercase ${CONFIDENCE_STYLES[a.confidence] || ''}`}>
                        {a.confidence}
                      </span>
                    </td>
                    <td className="px-3 py-1.5 text-slate-700 tabular-nums">{a.matched_email_count}</td>
                    <td className="px-3 py-1.5">
                      {a.requires_manual_review ? (
                        <span className="inline-flex items-center gap-1 text-[10px] font-semibold text-red-700 bg-red-50 border border-red-200 rounded px-1.5 py-0.5">
                          <AlertTriangle className="w-3 h-3" /> Manual
                        </span>
                      ) : (
                        <span className="text-[10px] text-slate-400">-</span>
                      )}
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  );
}

function DebugRow({ label, value }: { label: string; value: string }) {
  return (
    <div className="flex flex-col gap-0.5">
      <dt className="text-slate-500 uppercase tracking-wide text-[10px]">{label}</dt>
      <dd className="text-slate-200 font-mono break-all">{value}</dd>
    </div>
  );
}
