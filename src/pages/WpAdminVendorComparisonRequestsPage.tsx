import { useCallback, useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import { ArrowLeftRight, Check, X, ExternalLink } from 'lucide-react';
import WpAdminLayout from '../components/wpadmin/WpAdminLayout';
import { adminApiFetch, getErrorMessage } from '../lib/adminApiFetch';

interface ToolRef { slug: string; name: string; logo: string | null }
interface ComparisonRequestRow {
  id: string;
  status: string;
  admin_notes: string | null;
  created_at: string;
  tool: ToolRef | null;
  requested_tool: ToolRef | null;
}

// Queue for Featured vendors' "compare me against X" requests (see
// vendor-dashboard/index.ts's request_comparison action). Approving/
// rejecting here only updates the request's own status — the actual
// tool_comparisons row still needs to be created by hand at
// /wp-admin/tool-comparisons/new (that editor's own open-source-pair
// guard and canonical-slug logic stay the single source of truth for
// what a real comparison page requires).
export default function WpAdminVendorComparisonRequestsPage() {
  const [requests, setRequests] = useState<ComparisonRequestRow[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [actingId, setActingId] = useState<string | null>(null);
  const [showResolved, setShowResolved] = useState(false);

  const fetchRequests = useCallback(async () => {
    setLoading(true);
    setError(null);
    const result = await adminApiFetch<{ ok: boolean; requests: ComparisonRequestRow[]; error?: string }>('admin-vendor-comparison-requests');
    if (result.ok && result.data?.ok) {
      setRequests(result.data.requests);
    } else {
      setError(result.data?.error || (result.error ? getErrorMessage(result.error) : 'Failed to load requests'));
    }
    setLoading(false);
  }, []);

  useEffect(() => {
    fetchRequests();
  }, [fetchRequests]);

  async function handleAction(id: string, action: 'approve' | 'reject') {
    setActingId(id);
    const result = await adminApiFetch<{ ok: boolean; request: ComparisonRequestRow; error?: string }>('admin-vendor-comparison-requests', {
      method: 'POST',
      body: { action, id },
    });
    if (result.ok && result.data?.ok) {
      setRequests((prev) => prev.map((r) => (r.id === id ? result.data!.request : r)));
    } else {
      setError(result.data?.error || (result.error ? getErrorMessage(result.error) : 'Failed to update request'));
    }
    setActingId(null);
  }

  const visible = requests.filter((r) => showResolved || r.status === 'pending');
  const pendingCount = requests.filter((r) => r.status === 'pending').length;

  return (
    <WpAdminLayout title="Comparison Requests" subtitle="Featured vendors' requests to be compared against a specific competitor">
      <div className="p-6 max-w-4xl mx-auto space-y-5">
        <div className="flex items-center justify-between">
          <p className="text-sm text-slate-500">{pendingCount} pending request{pendingCount === 1 ? '' : 's'}</p>
          <label className="flex items-center gap-2 text-sm text-slate-500">
            <input type="checkbox" checked={showResolved} onChange={(e) => setShowResolved(e.target.checked)} />
            Show approved/rejected
          </label>
        </div>

        {error && <p className="text-sm text-rose-600 bg-rose-50 border border-rose-100 rounded-lg px-4 py-2.5">{error}</p>}

        {loading ? (
          <p className="text-sm text-slate-400">Loading…</p>
        ) : visible.length === 0 ? (
          <p className="text-sm text-slate-400 bg-white border border-slate-200 rounded-xl p-8 text-center">
            {showResolved ? 'No requests yet.' : 'No pending requests.'}
          </p>
        ) : (
          <div className="space-y-3">
            {visible.map((r) => (
              <div key={r.id} className="bg-white border border-slate-200 rounded-xl p-4 flex items-center gap-4">
                <div className="flex items-center gap-2 min-w-0 flex-1">
                  <ToolChip tool={r.tool} />
                  <ArrowLeftRight className="w-3.5 h-3.5 text-slate-300 shrink-0" />
                  <ToolChip tool={r.requested_tool} />
                </div>
                <p className="text-xs text-slate-400 shrink-0">{new Date(r.created_at).toLocaleDateString()}</p>
                {r.status === 'pending' ? (
                  <div className="flex items-center gap-1.5 shrink-0">
                    <Link
                      to="/wp-admin/tool-comparisons/new"
                      target="_blank"
                      rel="noopener noreferrer"
                      title="Open the comparison editor"
                      className="w-9 h-9 rounded-full bg-slate-50 text-slate-500 hover:bg-slate-100 flex items-center justify-center transition-colors"
                    >
                      <ExternalLink className="w-4 h-4" />
                    </Link>
                    <button
                      type="button"
                      disabled={actingId === r.id}
                      onClick={() => handleAction(r.id, 'approve')}
                      title="Approve"
                      className="w-9 h-9 rounded-full bg-emerald-50 text-emerald-600 hover:bg-emerald-100 flex items-center justify-center transition-colors disabled:opacity-50"
                    >
                      <Check className="w-4 h-4" />
                    </button>
                    <button
                      type="button"
                      disabled={actingId === r.id}
                      onClick={() => handleAction(r.id, 'reject')}
                      title="Reject"
                      className="w-9 h-9 rounded-full bg-rose-50 text-rose-600 hover:bg-rose-100 flex items-center justify-center transition-colors disabled:opacity-50"
                    >
                      <X className="w-4 h-4" />
                    </button>
                  </div>
                ) : (
                  <span className={`shrink-0 text-[11px] font-semibold uppercase tracking-wide px-2.5 py-1 rounded-full ${
                    r.status === 'approved' ? 'bg-emerald-50 text-emerald-700' : 'bg-slate-100 text-slate-500'
                  }`}>
                    {r.status}
                  </span>
                )}
              </div>
            ))}
          </div>
        )}
      </div>
    </WpAdminLayout>
  );
}

function ToolChip({ tool }: { tool: ToolRef | null }) {
  if (!tool) return <span className="text-sm text-slate-400 italic">Unknown tool</span>;
  return (
    <span className="flex items-center gap-1.5 min-w-0">
      {tool.logo ? (
        <img src={tool.logo} alt="" className="w-6 h-6 rounded-md object-contain border border-slate-100 shrink-0" />
      ) : (
        <span className="w-6 h-6 rounded-md bg-slate-100 flex items-center justify-center text-slate-400 font-semibold text-[10px] shrink-0">{tool.name.charAt(0)}</span>
      )}
      <span className="text-sm font-medium text-[#0B1221] truncate">{tool.name}</span>
    </span>
  );
}
