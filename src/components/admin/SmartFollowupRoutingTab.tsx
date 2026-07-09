import { useState, useEffect } from 'react';
import { RefreshCw, Copy, ExternalLink, Filter, X, Search, AlertCircle, Gift, TrendingUp } from 'lucide-react';
import { useAdminFetch } from '../../hooks/useAdminFetch';

interface LeadFunnelState {
  id: string;
  agency_id: string;
  agency_slug: string;
  agency_name: string | null;
  state_slug: string | null;
  lead_email: string | null;
  lead_key: string;
  campaign_id: string | null;
  campaign_name: string | null;
  sequence_name: string | null;
  your_agency_raw_clicks: number;
  your_agency_qualified_views_count: number;
  has_seen_loss_step: boolean;
  has_seen_offer_page: boolean;
  has_started_checkout: boolean;
  has_completed_payment: boolean;
  has_standard_paid: boolean;
  is_top25_upgrade_eligible: boolean;
  best_next_step: string;
  best_next_reason: string;
  active_discount_url: string | null;
  active_upgrade_offer_url: string | null;
  has_manual_override: boolean;
  override_step: string | null;
  override_reason: string | null;
  override_expires_at: string | null;
  override_set_by: string | null;
  last_activity_at: string;
}

interface RoutingStats {
  your_agency: number;
  loss_step: number;
  direct_offer: number;
  checkout_resume: number;
  discount_checkout: number;
  top25_upgrade_offer: number;
  paid_no_sales_flow: number;
}

export function SmartFollowupRoutingTab() {
  const adminFetch = useAdminFetch();
  const [states, setStates] = useState<LeadFunnelState[]>([]);
  const [stats, setStats] = useState<RoutingStats>({
    your_agency: 0,
    loss_step: 0,
    direct_offer: 0,
    checkout_resume: 0,
    discount_checkout: 0,
    top25_upgrade_offer: 0,
    paid_no_sales_flow: 0,
  });
  const [globalStats, setGlobalStats] = useState<RoutingStats>({
    your_agency: 0,
    loss_step: 0,
    direct_offer: 0,
    checkout_resume: 0,
    discount_checkout: 0,
    top25_upgrade_offer: 0,
    paid_no_sales_flow: 0,
  });
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  // Filters
  const [agencyFilter, setAgencyFilter] = useState('');
  const [stateSlugFilter, setStateSlugFilter] = useState('');
  const [campaignFilter, setCampaignFilter] = useState('');
  const [sequenceFilter, setSequenceFilter] = useState('');
  const [stepFilter, setStepFilter] = useState('');
  const [paidFilter, setPaidFilter] = useState<'all' | 'paid' | 'unpaid'>('all');
  const [upgradeFilter, setUpgradeFilter] = useState<'all' | 'eligible' | 'not_eligible'>('all');
  const [overrideFilter, setOverrideFilter] = useState<'all' | 'has_override' | 'no_override'>('all');
  const [activityHours, setActivityHours] = useState('168'); // 7 days

  const loadData = async () => {
    setLoading(true);
    setError(null);

    try {
      const params = new URLSearchParams({
        limit: '100',
        page: '1',
      });

      if (agencyFilter) params.set('agency_search', agencyFilter);
      if (stateSlugFilter) params.set('state_slug', stateSlugFilter);
      if (campaignFilter) params.set('campaign_name', campaignFilter);
      if (sequenceFilter) params.set('sequence_name', sequenceFilter);
      if (stepFilter) params.set('best_next_step', stepFilter);
      if (paidFilter === 'paid') params.set('has_standard_paid', 'true');
      if (paidFilter === 'unpaid') params.set('has_standard_paid', 'false');
      if (upgradeFilter === 'eligible') params.set('is_top25_upgrade_eligible', 'true');
      if (upgradeFilter === 'not_eligible') params.set('is_top25_upgrade_eligible', 'false');
      if (overrideFilter === 'has_override') params.set('has_manual_override', 'true');
      if (overrideFilter === 'no_override') params.set('has_manual_override', 'false');
      if (activityHours) params.set('activity_window_hours', activityHours);

      const response = await adminFetch(
        `/functions/v1/lead-funnel-state-list?${params.toString()}`
      );

      if (!response.ok) {
        throw new Error('Failed to load routing data');
      }

      const data = await response.json();
      setStates(data.states || []);
      setStats(data.stats || {});
      setGlobalStats(data.global_stats || data.stats || {});
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Failed to load data');
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    loadData();
  }, [agencyFilter, stateSlugFilter, campaignFilter, sequenceFilter, stepFilter, paidFilter, upgradeFilter, overrideFilter, activityHours]);

  const copySmartNextUrl = async (agencySlug: string, agencyId: string, leadKey: string) => {
    try {
      // Fetch signed smart link from backend
      const response = await adminFetch(
        `/functions/v1/lead-funnel-state-get?agency_id=${agencyId}&lead_key=${encodeURIComponent(leadKey)}`
      );
      if (response.ok) {
        const data = await response.json();
        if (data.smart_next_url) {
          await navigator.clipboard.writeText(data.smart_next_url);
          alert('Smart link copied to clipboard!');
          return;
        }
      }
      // If we got here, backend didn't return a valid signed link
      throw new Error('Backend did not return a signed smart link');
    } catch (err) {
      console.error('Failed to get signed smart link:', err);
      alert('Failed to generate signed smart link. Please try again or contact support.');
    }
  };

  const copyDiscountUrl = async (url: string | null) => {
    if (!url) return;
    await navigator.clipboard.writeText(url);
  };

  const copyUpgradeUrl = async (url: string | null) => {
    if (!url) return;
    await navigator.clipboard.writeText(url);
  };

  const getStepColor = (step: string) => {
    const colors: Record<string, string> = {
      your_agency: 'bg-blue-100 text-blue-700',
      loss_step: 'bg-orange-100 text-orange-700',
      direct_offer: 'bg-green-100 text-green-700',
      checkout_resume: 'bg-purple-100 text-purple-700',
      discount_checkout: 'bg-pink-100 text-pink-700',
      top25_upgrade_offer: 'bg-indigo-100 text-indigo-700',
      paid_no_sales_flow: 'bg-slate-100 text-slate-700',
    };
    return colors[step] || 'bg-slate-100 text-slate-700';
  };

  const hasActiveFilters = agencyFilter || stateSlugFilter || campaignFilter || sequenceFilter || stepFilter || paidFilter !== 'all' || upgradeFilter !== 'all' || overrideFilter !== 'all';

  return (
    <div className="space-y-6">
      {/* Stats Header */}
      {hasActiveFilters && (
        <div className="bg-blue-50 border border-blue-200 rounded-lg p-3 flex items-center gap-2">
          <Filter className="w-4 h-4 text-blue-600" />
          <span className="text-sm text-blue-900">
            Filters active: <strong>{Object.values(stats).reduce((a, b) => a + b, 0)}</strong> matching leads
            {' '} out of <strong>{Object.values(globalStats).reduce((a, b) => a + b, 0)}</strong> total
            {' '} (showing first {states.length} on this page)
          </span>
        </div>
      )}

      {/* KPI Cards - Show filtered totals across all pages */}
      <div className="grid grid-cols-2 md:grid-cols-4 lg:grid-cols-7 gap-4">
        {Object.entries(stats).map(([step, count]) => {
          const globalCount = globalStats[step as keyof RoutingStats] || 0;
          return (
            <button
              key={step}
              onClick={() => setStepFilter(stepFilter === step ? '' : step)}
              className={`p-4 rounded-lg border-2 transition-all text-left ${
                stepFilter === step
                  ? 'border-blue-500 bg-blue-50'
                  : 'border-slate-200 bg-white hover:border-slate-300'
              }`}
              title={hasActiveFilters ? `${count} filtered / ${globalCount} total` : `${globalCount} total leads`}
            >
              <div className="text-2xl font-bold text-slate-900">{count}</div>
              {hasActiveFilters && globalCount !== count && (
                <div className="text-xs text-slate-500">of {globalCount} total</div>
              )}
              <div className="text-xs text-slate-600 mt-1 capitalize">
                {step.replace(/_/g, ' ')}
              </div>
            </button>
          );
        })}
      </div>

      {/* Filters */}
      <div className="bg-white rounded-lg border border-slate-200 p-4">
        <div className="flex items-center gap-2 mb-3">
          <Filter className="w-4 h-4 text-slate-600" />
          <span className="text-sm font-medium text-slate-700">Filters</span>
        </div>
        <div className="grid grid-cols-1 md:grid-cols-4 gap-3 mb-3">
          <div>
            <label className="text-xs font-medium text-slate-600 block mb-1">Agency</label>
            <input
              type="text"
              value={agencyFilter}
              onChange={(e) => setAgencyFilter(e.target.value)}
              placeholder="Name, ID, or slug"
              className="w-full px-3 py-2 border border-slate-300 rounded-lg text-sm"
            />
          </div>
          <div>
            <label className="text-xs font-medium text-slate-600 block mb-1">State</label>
            <input
              type="text"
              value={stateSlugFilter}
              onChange={(e) => setStateSlugFilter(e.target.value)}
              placeholder="e.g. new-jersey"
              className="w-full px-3 py-2 border border-slate-300 rounded-lg text-sm"
            />
          </div>
          <div>
            <label className="text-xs font-medium text-slate-600 block mb-1">Campaign</label>
            <input
              type="text"
              value={campaignFilter}
              onChange={(e) => setCampaignFilter(e.target.value)}
              placeholder="Campaign name"
              className="w-full px-3 py-2 border border-slate-300 rounded-lg text-sm"
            />
          </div>
          <div>
            <label className="text-xs font-medium text-slate-600 block mb-1">Sequence</label>
            <input
              type="text"
              value={sequenceFilter}
              onChange={(e) => setSequenceFilter(e.target.value)}
              placeholder="Sequence name"
              className="w-full px-3 py-2 border border-slate-300 rounded-lg text-sm"
            />
          </div>
        </div>
        <div className="grid grid-cols-1 md:grid-cols-5 gap-3">
          <div>
            <label className="text-xs font-medium text-slate-600 block mb-1">Paid Status</label>
            <select
              value={paidFilter}
              onChange={(e) => setPaidFilter(e.target.value as any)}
              className="w-full px-3 py-2 border border-slate-300 rounded-lg text-sm"
            >
              <option value="all">All</option>
              <option value="paid">Paid Only</option>
              <option value="unpaid">Unpaid Only</option>
            </select>
          </div>
          <div>
            <label className="text-xs font-medium text-slate-600 block mb-1">Upgrade Eligible</label>
            <select
              value={upgradeFilter}
              onChange={(e) => setUpgradeFilter(e.target.value as any)}
              className="w-full px-3 py-2 border border-slate-300 rounded-lg text-sm"
            >
              <option value="all">All</option>
              <option value="eligible">Eligible</option>
              <option value="not_eligible">Not Eligible</option>
            </select>
          </div>
          <div>
            <label className="text-xs font-medium text-slate-600 block mb-1">Override Status</label>
            <select
              value={overrideFilter}
              onChange={(e) => setOverrideFilter(e.target.value as any)}
              className="w-full px-3 py-2 border border-slate-300 rounded-lg text-sm"
            >
              <option value="all">All</option>
              <option value="has_override">Has Override</option>
              <option value="no_override">No Override</option>
            </select>
          </div>
          <div>
            <label className="text-xs font-medium text-slate-600 block mb-1">Activity Window</label>
            <select
              value={activityHours}
              onChange={(e) => setActivityHours(e.target.value)}
              className="w-full px-3 py-2 border border-slate-300 rounded-lg text-sm"
            >
              <option value="24">Last 24h</option>
              <option value="72">Last 3 days</option>
              <option value="168">Last 7 days</option>
              <option value="720">Last 30 days</option>
              <option value="">All time</option>
            </select>
          </div>
          <div className="flex items-end">
            <button
              onClick={loadData}
              disabled={loading}
              className="w-full px-4 py-2 bg-blue-600 text-white rounded-lg text-sm font-medium hover:bg-blue-700 disabled:opacity-50 flex items-center justify-center gap-2"
            >
              <RefreshCw className={`w-4 h-4 ${loading ? 'animate-spin' : ''}`} />
              Refresh
            </button>
          </div>
        </div>
        {hasActiveFilters && (
          <button
            onClick={() => {
              setAgencyFilter('');
              setStateSlugFilter('');
              setCampaignFilter('');
              setSequenceFilter('');
              setStepFilter('');
              setPaidFilter('all');
              setUpgradeFilter('all');
              setOverrideFilter('all');
            }}
            className="mt-3 text-sm text-blue-600 hover:text-blue-700 flex items-center gap-1"
          >
            <X className="w-3 h-3" />
            Clear all filters
          </button>
        )}
      </div>

      {/* Table */}
      <div className="bg-white rounded-lg border border-slate-200 overflow-hidden">
        {loading ? (
          <div className="p-8 text-center text-slate-600 flex items-center justify-center gap-2">
            <RefreshCw className="w-4 h-4 animate-spin" />
            Loading routing data...
          </div>
        ) : error ? (
          <div className="p-8 text-center text-red-600">{error}</div>
        ) : states.length === 0 ? (
          <div className="p-8 text-center text-slate-600">
            No leads found matching current filters.
          </div>
        ) : (
          <div className="overflow-x-auto">
            <table className="w-full text-sm">
              <thead className="bg-slate-50 border-b border-slate-200">
                <tr>
                  <th className="px-4 py-3 text-left text-xs font-medium text-slate-600">Agency</th>
                  <th className="px-4 py-3 text-left text-xs font-medium text-slate-600">Lead Email</th>
                  <th className="px-4 py-3 text-left text-xs font-medium text-slate-600">Campaign</th>
                  <th className="px-4 py-3 text-center text-xs font-medium text-slate-600">Clicks</th>
                  <th className="px-4 py-3 text-center text-xs font-medium text-slate-600">Qualified</th>
                  <th className="px-4 py-3 text-center text-xs font-medium text-slate-600">Status</th>
                  <th className="px-4 py-3 text-left text-xs font-medium text-slate-600">Best Next Step</th>
                  <th className="px-4 py-3 text-left text-xs font-medium text-slate-600">Reason</th>
                  <th className="px-4 py-3 text-center text-xs font-medium text-slate-600">Override</th>
                  <th className="px-4 py-3 text-left text-xs font-medium text-slate-600">Last Activity</th>
                  <th className="px-4 py-3 text-center text-xs font-medium text-slate-600">Actions</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-slate-100">
                {states.map((state) => (
                  <tr key={state.id} className="hover:bg-slate-50">
                    <td className="px-4 py-3">
                      <div className="font-medium text-slate-900 truncate max-w-[200px]">
                        {state.agency_name || state.agency_slug || 'Unknown'}
                      </div>
                      {state.state_slug && (
                        <div className="text-xs text-slate-500">{state.state_slug}</div>
                      )}
                    </td>
                    <td className="px-4 py-3">
                      <div className="font-mono text-xs text-slate-600 truncate max-w-[180px]">
                        {state.lead_email || 'N/A'}
                      </div>
                    </td>
                    <td className="px-4 py-3">
                      <div className="text-xs text-slate-700 truncate max-w-[150px]">
                        {state.campaign_name || 'N/A'}
                      </div>
                      {state.sequence_name && (
                        <div className="text-xs text-slate-500">{state.sequence_name}</div>
                      )}
                    </td>
                    <td className="px-4 py-3 text-center">
                      <span className="text-slate-900 font-medium">
                        {state.your_agency_raw_clicks}
                      </span>
                    </td>
                    <td className="px-4 py-3 text-center">
                      <span className="text-slate-900 font-medium">
                        {state.your_agency_qualified_views_count}
                      </span>
                    </td>
                    <td className="px-4 py-3">
                      <div className="flex flex-col gap-1 items-center">
                        {state.has_completed_payment && (
                          <span className="text-xs px-2 py-0.5 rounded bg-green-100 text-green-700">Paid</span>
                        )}
                        {state.is_top25_upgrade_eligible && (
                          <span className="text-xs px-2 py-0.5 rounded bg-purple-100 text-purple-700">Eligible</span>
                        )}
                      </div>
                    </td>
                    <td className="px-4 py-3">
                      <span className={`px-2 py-1 rounded text-xs font-medium ${getStepColor(state.best_next_step)}`}>
                        {state.best_next_step}
                      </span>
                    </td>
                    <td className="px-4 py-3">
                      <div className="text-xs text-slate-600 truncate max-w-[200px]" title={state.best_next_reason}>
                        {state.best_next_reason || '-'}
                      </div>
                    </td>
                    <td className="px-4 py-3 text-center">
                      {state.has_manual_override && (
                        <div className="flex flex-col items-center gap-1">
                          <AlertCircle className="w-4 h-4 text-orange-600" />
                          {state.override_step && (
                            <span className="text-xs text-orange-600" title={state.override_reason || 'Manual override'}>
                              {state.override_step}
                            </span>
                          )}
                        </div>
                      )}
                    </td>
                    <td className="px-4 py-3 text-xs text-slate-600">
                      {new Date(state.last_activity_at).toLocaleDateString()}
                    </td>
                    <td className="px-4 py-3">
                      <div className="flex items-center gap-1 justify-center">
                        <button
                          onClick={() => copySmartNextUrl(state.agency_slug, state.agency_id, state.lead_key)}
                          className="p-1.5 text-slate-600 hover:text-slate-900 hover:bg-slate-100 rounded"
                          title="Copy Smart Next URL"
                        >
                          <Copy className="w-3.5 h-3.5" />
                        </button>
                        {state.active_discount_url && (
                          <button
                            onClick={() => copyDiscountUrl(state.active_discount_url)}
                            className="p-1.5 text-pink-600 hover:text-pink-900 hover:bg-pink-50 rounded"
                            title="Copy Discount URL"
                          >
                            <Gift className="w-3.5 h-3.5" />
                          </button>
                        )}
                        {state.active_upgrade_offer_url && (
                          <button
                            onClick={() => copyUpgradeUrl(state.active_upgrade_offer_url)}
                            className="p-1.5 text-purple-600 hover:text-purple-900 hover:bg-purple-50 rounded"
                            title="Copy Upgrade Offer URL"
                          >
                            <TrendingUp className="w-3.5 h-3.5" />
                          </button>
                        )}
                        <a
                          href={`/wp-admin/email/agency-lookup?email=${encodeURIComponent(state.lead_email || '')}`}
                          target="_blank"
                          rel="noopener noreferrer"
                          className="p-1.5 text-slate-600 hover:text-slate-900 hover:bg-slate-100 rounded"
                          title="Open in Agency Lookup"
                        >
                          <ExternalLink className="w-3.5 h-3.5" />
                        </a>
                      </div>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        )}
      </div>
    </div>
  );
}
