import { useState, useEffect } from 'react';
import { AlertCircle, CheckCircle, Loader, RefreshCw, ChevronDown } from 'lucide-react';
import EmailModuleLayout from '../components/wpadmin/EmailModuleLayout';
import { useAdminSession } from '../contexts/AdminSessionContext';
import { formatStateName } from '../utils/formatLocation';

const SUPABASE_URL = import.meta.env.VITE_SUPABASE_URL as string;
const SUPABASE_ANON_KEY = import.meta.env.VITE_SUPABASE_ANON_KEY as string;

interface StateStatsSummary {
  state_slug: string;
  unique_agencies: number;
  total_emails: number;
  pending_verification: number;
  verification_valid: number;
  clean_coverage_rate: number;
  ready_to_sync_emails: number;
  ready_agencies: number;
  last_import_at: string | null;
  import_status: string | null;
}

interface StateStatsDetail {
  state_slug: string;
  inventory: any;
  verification_pipeline: any;
  clean_coverage: any;
  send_ready: any;
  data_quality: any;
  cleaning_quality: any;
  import_status: any;
}

type SortKey = 'state_slug' | 'unique_agencies' | 'total_emails' | 'verification_valid' | 'clean_coverage_rate' | 'ready_agencies' | 'last_import_at';

export default function AdminOtherAgenciesStateStatsPage() {
  const { token } = useAdminSession();

  const [allStates, setAllStates] = useState<StateStatsSummary[]>([]);
  const [selectedState, setSelectedState] = useState<string | null>(null);
  const [stateDetail, setStateDetail] = useState<StateStatsDetail | null>(null);
  const [loading, setLoading] = useState(false);
  const [detailLoading, setDetailLoading] = useState(false);
  const [error, setError] = useState('');
  const [sortKey, setSortKey] = useState<SortKey>('last_import_at');
  const [sortDesc, setSortDesc] = useState(true);

  useEffect(() => {
    loadAllStates();
  }, []);

  const loadAllStates = async () => {
    setLoading(true);
    setError('');
    try {
      const response = await fetch(`${SUPABASE_URL}/functions/v1/other-agencies-state-stats`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'Authorization': `Bearer ${SUPABASE_ANON_KEY}`,
          'x-admin-token': token,
          'x-admin-secret': localStorage.getItem('admin_secret') || '',
        },
        body: JSON.stringify({ action: 'get_all_states' }),
      });

      if (!response.ok) throw new Error(`HTTP ${response.status}`);
      const data = await response.json();
      if (data.ok) {
        setAllStates(data.states || []);
      }
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Failed to load states');
    } finally {
      setLoading(false);
    }
  };

  const loadStateDetail = async (state_slug: string) => {
    setDetailLoading(true);
    try {
      const response = await fetch(`${SUPABASE_URL}/functions/v1/other-agencies-state-stats`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'Authorization': `Bearer ${SUPABASE_ANON_KEY}`,
          'x-admin-token': token,
          'x-admin-secret': localStorage.getItem('admin_secret') || '',
        },
        body: JSON.stringify({ action: 'get_state_detail', state_slug }),
      });

      if (!response.ok) throw new Error(`HTTP ${response.status}`);
      const data = await response.json();
      if (data.ok) {
        setStateDetail(data.data);
      }
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Failed to load state detail');
    } finally {
      setDetailLoading(false);
    }
  };

  const handleSelectState = (state_slug: string) => {
    setSelectedState(state_slug);
    loadStateDetail(state_slug);
  };

  const sortedStates = [...allStates].sort((a, b) => {
    let aVal = a[sortKey] as any;
    let bVal = b[sortKey] as any;

    if (aVal === null || aVal === undefined) aVal = 0;
    if (bVal === null || bVal === undefined) bVal = 0;

    const comparison = typeof aVal === 'number' ? aVal - bVal : String(aVal).localeCompare(String(bVal));
    return sortDesc ? -comparison : comparison;
  });

  const handleSort = (key: SortKey) => {
    if (sortKey === key) {
      setSortDesc(!sortDesc);
    } else {
      setSortKey(key);
      setSortDesc(true);
    }
  };

  const formatNumber = (num: number | null) => num ? num.toLocaleString() : '—';
  const formatPercent = (num: number | null) => num ? `${num.toFixed(1)}%` : '—';
  const formatDate = (date: string | null) => date ? new Date(date).toLocaleDateString() : '—';

  return (
    <EmailModuleLayout>
      <div className="space-y-6">
        <div className="bg-white rounded-lg border border-gray-200 p-6 shadow-sm">
          <h1 className="text-4xl font-bold text-gray-900 mb-2">Other Agencies State Analytics</h1>
          <p className="text-sm text-gray-600">
            Monitor import progress, verification pipeline, and send-readiness across all US states.
          </p>
        </div>

        {error && (
          <div className="bg-red-50 border border-red-200 rounded-lg p-4 flex gap-3">
            <AlertCircle className="w-5 h-5 text-red-600 flex-shrink-0 mt-0.5" />
            <div>
              <h3 className="font-semibold text-red-900">Error</h3>
              <p className="text-sm text-red-700">{error}</p>
            </div>
          </div>
        )}

        <div className="flex gap-2 mb-4">
          <button
            onClick={loadAllStates}
            disabled={loading}
            className="px-4 py-2 bg-blue-600 text-white font-medium rounded-lg hover:bg-blue-700 disabled:bg-gray-400 flex items-center gap-2"
          >
            <RefreshCw className="w-4 h-4" />
            Refresh
          </button>
        </div>

        <div className="bg-white rounded-lg border border-gray-200 shadow-sm overflow-hidden">
          <div className="overflow-x-auto">
            <table className="w-full text-sm">
              <thead className="bg-gray-50 border-b border-gray-200">
                <tr>
                  <th className="px-4 py-3 text-left font-semibold text-gray-900 cursor-pointer hover:bg-gray-100" onClick={() => handleSort('state_slug')}>
                    State {sortKey === 'state_slug' && (sortDesc ? '▼' : '▲')}
                  </th>
                  <th className="px-4 py-3 text-right font-semibold text-gray-900 cursor-pointer hover:bg-gray-100" onClick={() => handleSort('unique_agencies')}>
                    Agencies {sortKey === 'unique_agencies' && (sortDesc ? '▼' : '▲')}
                  </th>
                  <th className="px-4 py-3 text-right font-semibold text-gray-900 cursor-pointer hover:bg-gray-100" onClick={() => handleSort('total_emails')}>
                    Emails {sortKey === 'total_emails' && (sortDesc ? '▼' : '▲')}
                  </th>
                  <th className="px-4 py-3 text-right font-semibold text-gray-900 cursor-pointer hover:bg-gray-100" onClick={() => handleSort('pending_verification')}>
                    Pending
                  </th>
                  <th className="px-4 py-3 text-right font-semibold text-gray-900 cursor-pointer hover:bg-gray-100" onClick={() => handleSort('verification_valid')}>
                    Valid {sortKey === 'verification_valid' && (sortDesc ? '▼' : '▲')}
                  </th>
                  <th className="px-4 py-3 text-right font-semibold text-gray-900 cursor-pointer hover:bg-gray-100" onClick={() => handleSort('clean_coverage_rate')}>
                    Clean Coverage {sortKey === 'clean_coverage_rate' && (sortDesc ? '▼' : '▲')}
                  </th>
                  <th className="px-4 py-3 text-right font-semibold text-gray-900 cursor-pointer hover:bg-gray-100" onClick={() => handleSort('ready_agencies')}>
                    Ready Agencies {sortKey === 'ready_agencies' && (sortDesc ? '▼' : '▲')}
                  </th>
                  <th className="px-4 py-3 text-right font-semibold text-gray-900 cursor-pointer hover:bg-gray-100" onClick={() => handleSort('last_import_at')}>
                    Last Import {sortKey === 'last_import_at' && (sortDesc ? '▼' : '▲')}
                  </th>
                </tr>
              </thead>
              <tbody>
                {sortedStates.map(state => (
                  <tr
                    key={state.state_slug}
                    onClick={() => handleSelectState(state.state_slug)}
                    className={`border-b border-gray-200 cursor-pointer hover:bg-blue-50 ${selectedState === state.state_slug ? 'bg-blue-50' : ''}`}
                  >
                    <td className="px-4 py-3 font-medium text-gray-900">
                      {formatStateName(state.state_slug)}
                    </td>
                    <td className="px-4 py-3 text-right text-gray-700">{formatNumber(state.unique_agencies)}</td>
                    <td className="px-4 py-3 text-right text-gray-700">{formatNumber(state.total_emails)}</td>
                    <td className="px-4 py-3 text-right text-amber-700 font-medium">{formatNumber(state.pending_verification)}</td>
                    <td className="px-4 py-3 text-right text-green-700 font-medium">{formatNumber(state.verification_valid)}</td>
                    <td className="px-4 py-3 text-right text-blue-700 font-medium">{formatPercent(state.clean_coverage_rate)}</td>
                    <td className="px-4 py-3 text-right text-purple-700 font-medium">{formatNumber(state.ready_agencies)}</td>
                    <td className="px-4 py-3 text-right text-gray-700 text-xs">{formatDate(state.last_import_at)}</td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </div>

        {selectedState && stateDetail && !detailLoading && (
          <div className="space-y-6">
            <h2 className="text-2xl font-bold text-gray-900">
              {formatStateName(selectedState)} — Detailed Analytics
            </h2>

            {/* Inventory Section */}
            <div className="bg-white rounded-lg border border-gray-200 p-6 shadow-sm">
              <h3 className="text-lg font-semibold text-gray-900 mb-4">Import Inventory (Pre-Clean)</h3>
              <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
                <div className="p-4 bg-gray-50 rounded-lg border border-gray-200">
                  <div className="text-xs text-gray-700 font-medium mb-2">Total Agencies</div>
                  <div className="text-2xl font-bold text-gray-900">{formatNumber(stateDetail.inventory.unique_agencies)}</div>
                </div>
                <div className="p-4 bg-gray-50 rounded-lg border border-gray-200">
                  <div className="text-xs text-gray-700 font-medium mb-2">Total Emails</div>
                  <div className="text-2xl font-bold text-gray-900">{formatNumber(stateDetail.inventory.total_imported_emails)}</div>
                </div>
                <div className="p-4 bg-blue-50 rounded-lg border border-blue-200">
                  <div className="text-xs text-blue-700 font-medium mb-2">Avg Emails/Agency</div>
                  <div className="text-2xl font-bold text-blue-700">{stateDetail.inventory.avg_emails_per_agency || 0}</div>
                </div>
                <div className="p-4 bg-green-50 rounded-lg border border-green-200">
                  <div className="text-xs text-green-700 font-medium mb-2">With Phone</div>
                  <div className="text-2xl font-bold text-green-700">{formatNumber(stateDetail.inventory.agencies_with_phone)}</div>
                </div>
              </div>
            </div>

            {/* Verification Pipeline */}
            <div className="bg-white rounded-lg border border-gray-200 p-6 shadow-sm">
              <h3 className="text-lg font-semibold text-gray-900 mb-4">Verification Pipeline</h3>
              <div className="grid grid-cols-2 md:grid-cols-5 gap-3">
                <div className="p-3 bg-amber-50 rounded-lg border border-amber-200">
                  <div className="text-xs text-amber-700 font-medium mb-1">Pending</div>
                  <div className="text-xl font-bold text-amber-700">{formatNumber(stateDetail.verification_pipeline.pending_verification)}</div>
                </div>
                <div className="p-3 bg-blue-50 rounded-lg border border-blue-200">
                  <div className="text-xs text-blue-700 font-medium mb-1">Processing</div>
                  <div className="text-xl font-bold text-blue-700">{formatNumber(stateDetail.verification_pipeline.verification_processing)}</div>
                </div>
                <div className="p-3 bg-orange-50 rounded-lg border border-orange-200">
                  <div className="text-xs text-orange-700 font-medium mb-1">Retry Scheduled</div>
                  <div className="text-xl font-bold text-orange-700">{formatNumber(stateDetail.verification_pipeline.verification_retry)}</div>
                  <div className="text-xs text-orange-600 mt-0.5">Auto-retry in 48h</div>
                </div>
                {(stateDetail.verification_pipeline.verification_failed || 0) > 0 && (
                  <div className="p-3 bg-red-50 rounded-lg border border-red-200">
                    <div className="text-xs text-red-700 font-medium mb-1">Failed</div>
                    <div className="text-xl font-bold text-red-700">{formatNumber(stateDetail.verification_pipeline.verification_failed)}</div>
                    <div className="text-xs text-red-600 mt-0.5">Max attempts reached</div>
                  </div>
                )}
                <div className="p-3 bg-green-50 rounded-lg border border-green-200">
                  <div className="text-xs text-green-700 font-medium mb-1">Valid</div>
                  <div className="text-xl font-bold text-green-700">{formatNumber(stateDetail.verification_pipeline.verification_valid)}</div>
                </div>
                <div className="p-3 bg-red-50 rounded-lg border border-red-200">
                  <div className="text-xs text-red-700 font-medium mb-1">Invalid</div>
                  <div className="text-xl font-bold text-red-700">{formatNumber(stateDetail.verification_pipeline.verification_invalid)}</div>
                </div>
              </div>
            </div>

            {/* Clean Coverage */}
            <div className="bg-white rounded-lg border border-gray-200 p-6 shadow-sm">
              <h3 className="text-lg font-semibold text-gray-900 mb-4">Clean Email Coverage</h3>
              <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
                <div className="p-4 bg-green-50 rounded-lg border border-green-200">
                  <div className="text-xs text-green-700 font-medium mb-2">Agencies w/ ≥1 Clean</div>
                  <div className="text-2xl font-bold text-green-700">{formatNumber(stateDetail.clean_coverage.unique_agencies_clean_1plus)}</div>
                </div>
                <div className="p-4 bg-teal-50 rounded-lg border border-teal-200">
                  <div className="text-xs text-teal-700 font-medium mb-2">Clean Coverage %</div>
                  <div className="text-2xl font-bold text-teal-700">{formatPercent(stateDetail.clean_coverage.clean_coverage_rate)}</div>
                </div>
                <div className="p-4 bg-blue-50 rounded-lg border border-blue-200">
                  <div className="text-xs text-blue-700 font-medium mb-2">With 2+ Clean</div>
                  <div className="text-2xl font-bold text-blue-700">{formatNumber(stateDetail.clean_coverage.agencies_clean_2plus)}</div>
                </div>
                <div className="p-4 bg-purple-50 rounded-lg border border-purple-200">
                  <div className="text-xs text-purple-700 font-medium mb-2">With 3+ Clean</div>
                  <div className="text-2xl font-bold text-purple-700">{formatNumber(stateDetail.clean_coverage.agencies_clean_3plus)}</div>
                </div>
              </div>
            </div>

            {/* Send-Ready */}
            <div className="bg-white rounded-lg border border-gray-200 p-6 shadow-sm">
              <h3 className="text-lg font-semibold text-gray-900 mb-4">Send-Ready for Smartlead</h3>
              <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
                <div className="p-4 bg-rose-50 rounded-lg border border-rose-200">
                  <div className="text-xs text-rose-700 font-medium mb-2">Ready Agencies</div>
                  <div className="text-2xl font-bold text-rose-700">{formatNumber(stateDetail.send_ready.unique_agencies_ready_for_smartlead)}</div>
                </div>
                <div className="p-4 bg-rose-50 rounded-lg border border-rose-200">
                  <div className="text-xs text-rose-700 font-medium mb-2">Ready Emails</div>
                  <div className="text-2xl font-bold text-rose-700">{formatNumber(stateDetail.send_ready.ready_to_sync_emails)}</div>
                </div>
                <div className="p-4 bg-violet-50 rounded-lg border border-violet-200">
                  <div className="text-xs text-violet-700 font-medium mb-2">Send-Ready Coverage %</div>
                  <div className="text-2xl font-bold text-violet-700">{formatPercent(stateDetail.send_ready.send_ready_coverage_rate)}</div>
                </div>
                <div className="p-4 bg-indigo-50 rounded-lg border border-indigo-200">
                  <div className="text-xs text-indigo-700 font-medium mb-2">Role-Based Clean</div>
                  <div className="text-2xl font-bold text-indigo-700">{formatNumber(stateDetail.send_ready.role_based_clean_emails)}</div>
                </div>
              </div>
            </div>
          </div>
        )}

        {detailLoading && (
          <div className="flex justify-center items-center py-12">
            <Loader className="w-8 h-8 text-blue-600 animate-spin" />
          </div>
        )}
      </div>
    </EmailModuleLayout>
  );
}
