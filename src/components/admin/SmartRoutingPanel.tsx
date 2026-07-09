import { useState, useEffect } from 'react';
import { RefreshCw, Copy, ExternalLink, AlertCircle, CheckCircle, Settings } from 'lucide-react';
import { useAdminFetch } from '../../hooks/useAdminFetch';

interface LeadFunnelState {
  id: string;
  agency_id: string;
  agency_slug: string;
  state_slug: string | null;
  lead_email: string | null;
  lead_key: string;
  campaign_id: string | null;
  campaign_name: string | null;
  sequence_name: string | null;
  last_email_step: number | null;
  your_agency_raw_clicks: number;
  your_agency_qualified_views_count: number;
  has_seen_loss_step: boolean;
  has_seen_offer_page: boolean;
  has_started_checkout: boolean;
  has_completed_payment: boolean;
  has_standard_paid: boolean;
  is_top25_upgrade_eligible: boolean;
  active_discount_url: string | null;
  active_upgrade_offer_url: string | null;
  best_next_step: string;
  best_next_reason: string;
  intent_score: number;
  last_activity_at: string;
  created_at: string;
  updated_at: string;
}

interface LeadRoutingOverride {
  id: string;
  agency_id: string;
  lead_key: string;
  override_step: string;
  override_reason: string;
  expires_at: string | null;
  set_by_admin_email: string;
  created_at: string;
  updated_at: string;
}

interface SmartRoutingPanelProps {
  agencyId: string;
  leadKey: string;
}

export function SmartRoutingPanel({ agencyId, leadKey }: SmartRoutingPanelProps) {
  const adminFetch = useAdminFetch();
  const [state, setState] = useState<LeadFunnelState | null>(null);
  const [override, setOverride] = useState<LeadRoutingOverride | null>(null);
  const [smartNextUrl, setSmartNextUrl] = useState<string | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [showOverrideForm, setShowOverrideForm] = useState(false);
  const [overrideStep, setOverrideStep] = useState('your_agency');
  const [overrideReason, setOverrideReason] = useState('');
  const [actionLoading, setActionLoading] = useState(false);

  const loadState = async () => {
    setLoading(true);
    setError(null);

    try {
      const response = await adminFetch(
        `/functions/v1/lead-funnel-state-get?agency_id=${agencyId}&lead_key=${encodeURIComponent(leadKey)}`
      );

      if (!response.ok) {
        throw new Error('Failed to load funnel state');
      }

      const data = await response.json();
      setState(data.state);
      setOverride(data.override);
      setSmartNextUrl(data.smart_next_url);
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Failed to load state');
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    loadState();
  }, [agencyId, leadKey]);

  const copyToClipboard = async (text: string, label: string) => {
    try {
      await navigator.clipboard.writeText(text);
      alert(`Copied ${label} to clipboard`);
    } catch (err) {
      alert('Failed to copy to clipboard');
    }
  };

  const openUrl = (url: string) => {
    window.open(url, '_blank', 'noopener,noreferrer');
  };

  const handleSetOverride = async () => {
    if (!overrideReason.trim()) {
      alert('Please provide a reason for the override');
      return;
    }

    setActionLoading(true);
    try {
      const response = await adminFetch('/functions/v1/lead-routing-override-set', {
        method: 'POST',
        body: JSON.stringify({
          agency_id: agencyId,
          lead_key: leadKey,
          override_step: overrideStep,
          override_reason: overrideReason,
          expires_in_hours: 72,
        }),
      });

      if (!response.ok) {
        throw new Error('Failed to set override');
      }

      setShowOverrideForm(false);
      setOverrideReason('');
      await loadState();
      alert('Override set successfully');
    } catch (err) {
      alert(err instanceof Error ? err.message : 'Failed to set override');
    } finally {
      setActionLoading(false);
    }
  };

  const handleClearOverride = async () => {
    if (!confirm('Clear routing override for this lead?')) {
      return;
    }

    setActionLoading(true);
    try {
      const response = await adminFetch('/functions/v1/lead-routing-override-clear', {
        method: 'POST',
        body: JSON.stringify({
          agency_id: agencyId,
          lead_key: leadKey,
        }),
      });

      if (!response.ok) {
        throw new Error('Failed to clear override');
      }

      await loadState();
      alert('Override cleared successfully');
    } catch (err) {
      alert(err instanceof Error ? err.message : 'Failed to clear override');
    } finally {
      setActionLoading(false);
    }
  };

  if (loading) {
    return (
      <div className="bg-white rounded-lg shadow p-6">
        <div className="flex items-center gap-2 text-sm text-slate-600">
          <RefreshCw className="w-4 h-4 animate-spin" />
          Loading smart routing state...
        </div>
      </div>
    );
  }

  if (error) {
    return (
      <div className="bg-white rounded-lg shadow p-6">
        <div className="flex items-center gap-2 text-sm text-red-600">
          <AlertCircle className="w-4 h-4" />
          {error}
        </div>
        <button
          onClick={loadState}
          className="mt-3 text-sm text-blue-600 hover:text-blue-700"
        >
          Retry
        </button>
      </div>
    );
  }

  if (!state) {
    return (
      <div className="bg-white rounded-lg shadow p-6">
        <div className="text-sm text-slate-600">
          No funnel state found for this lead.
        </div>
      </div>
    );
  }

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

  return (
    <div className="bg-white rounded-lg shadow">
      <div className="p-6 border-b border-slate-200">
        <div className="flex items-center justify-between">
          <h3 className="text-lg font-semibold text-slate-900">Smart Routing State</h3>
          <button
            onClick={loadState}
            disabled={loading}
            className="p-2 text-slate-600 hover:text-slate-900 hover:bg-slate-100 rounded-lg transition-colors"
          >
            <RefreshCw className={`w-4 h-4 ${loading ? 'animate-spin' : ''}`} />
          </button>
        </div>
      </div>

      <div className="p-6 space-y-6">
        {/* Override Alert */}
        {override && (
          <div className="bg-yellow-50 border border-yellow-200 rounded-lg p-4">
            <div className="flex items-start gap-3">
              <AlertCircle className="w-5 h-5 text-yellow-600 flex-shrink-0 mt-0.5" />
              <div className="flex-1">
                <div className="font-medium text-yellow-900">Manual Override Active</div>
                <div className="text-sm text-yellow-700 mt-1">
                  Routing to: <span className="font-mono">{override.override_step}</span>
                </div>
                <div className="text-sm text-yellow-600 mt-1">{override.override_reason}</div>
                <div className="text-xs text-yellow-600 mt-1">
                  Set by {override.set_by_admin_email}
                  {override.expires_at && ` • Expires ${new Date(override.expires_at).toLocaleString()}`}
                </div>
                <button
                  onClick={handleClearOverride}
                  disabled={actionLoading}
                  className="mt-2 text-sm text-yellow-700 hover:text-yellow-900 font-medium"
                >
                  Clear Override
                </button>
              </div>
            </div>
          </div>
        )}

        {/* Best Next Step */}
        <div>
          <label className="text-sm font-medium text-slate-700 block mb-2">Best Next Step</label>
          <div className="flex items-center gap-3">
            <span className={`px-3 py-1.5 rounded-lg font-medium text-sm ${getStepColor(state.best_next_step)}`}>
              {state.best_next_step}
            </span>
            <span className="text-sm text-slate-600 flex-1">{state.best_next_reason}</span>
          </div>
        </div>

        {/* Smart Next URL */}
        {smartNextUrl && (
          <div>
            <label className="text-sm font-medium text-slate-700 block mb-2">Smart Next URL</label>
            <div className="flex items-center gap-2">
              <input
                type="text"
                value={smartNextUrl}
                readOnly
                className="flex-1 px-3 py-2 bg-slate-50 border border-slate-200 rounded-lg text-sm font-mono"
              />
              <button
                onClick={() => copyToClipboard(smartNextUrl, 'smart next URL')}
                className="p-2 text-slate-600 hover:text-slate-900 hover:bg-slate-100 rounded-lg"
                title="Copy URL"
              >
                <Copy className="w-4 h-4" />
              </button>
              <button
                onClick={() => openUrl(smartNextUrl)}
                className="p-2 text-slate-600 hover:text-slate-900 hover:bg-slate-100 rounded-lg"
                title="Open URL"
              >
                <ExternalLink className="w-4 h-4" />
              </button>
            </div>
          </div>
        )}

        {/* Engagement Metrics */}
        <div className="grid grid-cols-2 gap-4">
          <div>
            <label className="text-xs font-medium text-slate-600 block mb-1">Raw Clicks</label>
            <div className="text-2xl font-bold text-slate-900">{state.your_agency_raw_clicks}</div>
          </div>
          <div>
            <label className="text-xs font-medium text-slate-600 block mb-1">Qualified Views</label>
            <div className="text-2xl font-bold text-slate-900">{state.your_agency_qualified_views_count}</div>
          </div>
          <div>
            <label className="text-xs font-medium text-slate-600 block mb-1">Intent Score</label>
            <div className="text-2xl font-bold text-slate-900">{state.intent_score}</div>
          </div>
          <div>
            <label className="text-xs font-medium text-slate-600 block mb-1">Last Activity</label>
            <div className="text-sm font-medium text-slate-700">
              {new Date(state.last_activity_at).toLocaleDateString()}
            </div>
          </div>
        </div>

        {/* Funnel Progress */}
        <div>
          <label className="text-sm font-medium text-slate-700 block mb-3">Funnel Progress</label>
          <div className="space-y-2">
            <FunnelCheckbox label="Seen Loss Step" checked={state.has_seen_loss_step} />
            <FunnelCheckbox label="Seen Offer Page" checked={state.has_seen_offer_page} />
            <FunnelCheckbox label="Started Checkout" checked={state.has_started_checkout} />
            <FunnelCheckbox label="Completed Payment" checked={state.has_completed_payment} />
            <FunnelCheckbox label="Has Standard Paid" checked={state.has_standard_paid} />
            <FunnelCheckbox label="Top 25 Upgrade Eligible" checked={state.is_top25_upgrade_eligible} />
          </div>
        </div>

        {/* Active URLs */}
        {(state.active_discount_url || state.active_upgrade_offer_url) && (
          <div className="space-y-3">
            {state.active_discount_url && (
              <div>
                <label className="text-sm font-medium text-slate-700 block mb-2">Active Discount URL</label>
                <div className="flex items-center gap-2">
                  <input
                    type="text"
                    value={state.active_discount_url}
                    readOnly
                    className="flex-1 px-3 py-2 bg-slate-50 border border-slate-200 rounded-lg text-sm font-mono"
                  />
                  <button
                    onClick={() => copyToClipboard(state.active_discount_url!, 'discount URL')}
                    className="p-2 text-slate-600 hover:text-slate-900 hover:bg-slate-100 rounded-lg"
                  >
                    <Copy className="w-4 h-4" />
                  </button>
                </div>
              </div>
            )}
            {state.active_upgrade_offer_url && (
              <div>
                <label className="text-sm font-medium text-slate-700 block mb-2">Active Upgrade Offer URL</label>
                <div className="flex items-center gap-2">
                  <input
                    type="text"
                    value={state.active_upgrade_offer_url}
                    readOnly
                    className="flex-1 px-3 py-2 bg-slate-50 border border-slate-200 rounded-lg text-sm font-mono"
                  />
                  <button
                    onClick={() => copyToClipboard(state.active_upgrade_offer_url!, 'upgrade URL')}
                    className="p-2 text-slate-600 hover:text-slate-900 hover:bg-slate-100 rounded-lg"
                  >
                    <Copy className="w-4 h-4" />
                  </button>
                </div>
              </div>
            )}
          </div>
        )}

        {/* Manual Override Section */}
        <div className="pt-4 border-t border-slate-200">
          {!showOverrideForm ? (
            <button
              onClick={() => setShowOverrideForm(true)}
              className="flex items-center gap-2 text-sm font-medium text-blue-600 hover:text-blue-700"
            >
              <Settings className="w-4 h-4" />
              Set Manual Override
            </button>
          ) : (
            <div className="space-y-3">
              <label className="text-sm font-medium text-slate-700 block">Override Routing Step</label>
              <select
                value={overrideStep}
                onChange={(e) => setOverrideStep(e.target.value)}
                className="w-full px-3 py-2 border border-slate-300 rounded-lg text-sm"
              >
                <option value="your_agency">Your Agency</option>
                <option value="loss_step">Loss Step</option>
                <option value="direct_offer">Direct Offer</option>
                <option value="checkout_resume">Checkout Resume</option>
                <option value="discount_checkout">Discount Checkout</option>
                <option value="top25_upgrade_offer">Top 25 Upgrade Offer</option>
              </select>
              <textarea
                value={overrideReason}
                onChange={(e) => setOverrideReason(e.target.value)}
                placeholder="Reason for override..."
                rows={3}
                className="w-full px-3 py-2 border border-slate-300 rounded-lg text-sm"
              />
              <div className="flex gap-2">
                <button
                  onClick={handleSetOverride}
                  disabled={actionLoading}
                  className="px-4 py-2 bg-blue-600 text-white rounded-lg text-sm font-medium hover:bg-blue-700 disabled:opacity-50"
                >
                  {actionLoading ? 'Setting...' : 'Set Override'}
                </button>
                <button
                  onClick={() => {
                    setShowOverrideForm(false);
                    setOverrideReason('');
                  }}
                  className="px-4 py-2 bg-slate-100 text-slate-700 rounded-lg text-sm font-medium hover:bg-slate-200"
                >
                  Cancel
                </button>
              </div>
            </div>
          )}
        </div>
      </div>
    </div>
  );
}

function FunnelCheckbox({ label, checked }: { label: string; checked: boolean }) {
  return (
    <div className="flex items-center gap-2">
      {checked ? (
        <CheckCircle className="w-5 h-5 text-green-600" />
      ) : (
        <div className="w-5 h-5 rounded-full border-2 border-slate-300" />
      )}
      <span className={`text-sm ${checked ? 'text-slate-900' : 'text-slate-500'}`}>
        {label}
      </span>
    </div>
  );
}
