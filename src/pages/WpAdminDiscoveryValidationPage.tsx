import { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import { ArrowLeft, ChevronLeft, ChevronRight, ShieldCheck, Check, X, RefreshCw, Loader2 } from 'lucide-react';
import WpAdminLayout from '../components/wpadmin/WpAdminLayout';
import { useAdminFetch, useAdminMutation } from '../hooks/useAdminFetch';
import { AdminErrorBanner, AdminLoadingState, AdminEmptyState } from '../components/admin/AdminErrorBanner';

interface ValidationRow {
  id: string;
  name: string;
  hostname: string | null;
  quality_score: number | null;
  validation_notes: {
    https?: boolean; reachable?: boolean; robots_txt?: boolean | null;
    sitemap_xml?: boolean | null; favicon?: boolean | null; dead_domain?: boolean; parked_domain?: boolean;
  };
}

interface ListResponse { ok: boolean; data: ValidationRow[]; total: number; }
interface RevalidateResponse { ok: boolean; }

const PER_PAGE = 25;

function Flag({ ok }: { ok: boolean | null | undefined }) {
  if (ok === null || ok === undefined) return <span className="text-gray-300 text-xs">—</span>;
  return ok ? <Check className="w-4 h-4 text-emerald-500" /> : <X className="w-4 h-4 text-red-400" />;
}

// Fleet-wide validation rollup across every discovered candidate — which
// checks passed/failed, at a glance, with a re-check action. Complements
// the per-candidate detail already available in the Discovery Queue's
// expandable rows.
export default function WpAdminDiscoveryValidationPage() {
  const [page, setPage] = useState(1);
  const [issuesOnly, setIssuesOnly] = useState(false);
  const [revalidatingId, setRevalidatingId] = useState<string | null>(null);

  useEffect(() => { setPage(1); }, [issuesOnly]);

  const listPath = () => `admin-discovery-queue?page=${page}&per_page=${PER_PAGE}${issuesOnly ? '' : ''}`;
  const { data, isLoading, isError, error, refetch } = useAdminFetch<ListResponse>(listPath);
  const { mutate: revalidate } = useAdminMutation<RevalidateResponse, Record<string, unknown>>('admin-discovery-queue', 'POST');

  const allRows = data?.data || [];
  const rows = issuesOnly
    ? allRows.filter((r) => {
        const n = r.validation_notes || {};
        return !n.https || !n.reachable || n.dead_domain || n.parked_domain;
      })
    : allRows;
  const total = data?.total || 0;
  const totalPages = Math.max(1, Math.ceil(total / PER_PAGE));

  async function handleRecheck(id: string) {
    setRevalidatingId(id);
    await revalidate({ action: 'revalidate', ids: [id] });
    setRevalidatingId(null);
    refetch();
  }

  return (
    <WpAdminLayout title="Validation Results" subtitle="Reachability, HTTPS, robots.txt, sitemap, and domain-health checks">
      <div className="max-w-6xl mx-auto">
        <Link to="/wp-admin/discovery" className="inline-flex items-center gap-1.5 text-sm text-gray-500 hover:text-gray-700 mb-4">
          <ArrowLeft className="w-4 h-4" />
          Back to Discovery Dashboard
        </Link>

        <div className="mb-6 flex items-center justify-between flex-wrap gap-3">
          <div>
            <h1 className="text-2xl font-bold text-gray-900">Validation Results</h1>
            <p className="text-gray-500 mt-1 text-sm">{total.toLocaleString()} candidate{total === 1 ? '' : 's'} checked</p>
          </div>
          <label className="inline-flex items-center gap-2 text-sm text-gray-600">
            <input type="checkbox" checked={issuesOnly} onChange={(e) => setIssuesOnly(e.target.checked)} className="rounded border-gray-300" />
            Show only issues
          </label>
        </div>

        {isError && error && <AdminErrorBanner error={error} onRetry={refetch} className="mb-6" />}
        {isLoading && <AdminLoadingState message="Loading validation results..." />}

        {!isLoading && !isError && rows.length === 0 && (
          <AdminEmptyState icon={ShieldCheck} title={issuesOnly ? 'No issues found' : 'No candidates yet'} message={issuesOnly ? 'Every checked candidate on this page passed.' : 'Validation results will appear once candidates are discovered.'} />
        )}

        {!isLoading && rows.length > 0 && (
          <>
            <div className="bg-white border border-gray-200 rounded-lg overflow-hidden overflow-x-auto">
              <table className="w-full">
                <thead className="bg-gray-50 border-b border-gray-200">
                  <tr>
                    <th className="text-left px-5 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">Candidate</th>
                    <th className="text-center px-3 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">HTTPS</th>
                    <th className="text-center px-3 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">Reachable</th>
                    <th className="text-center px-3 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">Robots</th>
                    <th className="text-center px-3 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">Sitemap</th>
                    <th className="text-center px-3 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">Favicon</th>
                    <th className="text-center px-3 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">Dead</th>
                    <th className="text-center px-3 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">Parked</th>
                    <th className="text-right px-5 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">Recheck</th>
                  </tr>
                </thead>
                <tbody className="divide-y divide-gray-100">
                  {rows.map((row) => {
                    const n = row.validation_notes || {};
                    return (
                      <tr key={row.id} className="hover:bg-gray-50 transition-colors">
                        <td className="px-5 py-3 text-sm">
                          <p className="font-medium text-gray-900">{row.name}</p>
                          <p className="text-xs text-gray-400">{row.hostname || '—'}</p>
                        </td>
                        <td className="text-center px-3 py-3"><Flag ok={n.https} /></td>
                        <td className="text-center px-3 py-3"><Flag ok={n.reachable} /></td>
                        <td className="text-center px-3 py-3"><Flag ok={n.robots_txt} /></td>
                        <td className="text-center px-3 py-3"><Flag ok={n.sitemap_xml} /></td>
                        <td className="text-center px-3 py-3"><Flag ok={n.favicon} /></td>
                        <td className="text-center px-3 py-3"><Flag ok={!n.dead_domain} /></td>
                        <td className="text-center px-3 py-3"><Flag ok={!n.parked_domain} /></td>
                        <td className="px-5 py-3 text-right">
                          <button
                            onClick={() => handleRecheck(row.id)}
                            disabled={revalidatingId === row.id}
                            className="inline-flex items-center gap-1 px-2 py-1 text-xs font-medium text-blue-700 bg-blue-50 hover:bg-blue-100 rounded transition disabled:opacity-50"
                          >
                            {revalidatingId === row.id ? <Loader2 className="w-3.5 h-3.5 animate-spin" /> : <RefreshCw className="w-3.5 h-3.5" />}
                          </button>
                        </td>
                      </tr>
                    );
                  })}
                </tbody>
              </table>
            </div>

            <div className="flex items-center justify-between mt-4">
              <p className="text-sm text-gray-500">Page {page} of {totalPages}</p>
              <div className="flex items-center gap-2">
                <button onClick={() => setPage((p) => Math.max(1, p - 1))} disabled={page <= 1} className="inline-flex items-center gap-1 px-3 py-1.5 text-sm border border-gray-200 rounded-lg text-gray-600 hover:bg-gray-50 disabled:opacity-40 disabled:cursor-not-allowed transition">
                  <ChevronLeft className="w-4 h-4" /> Prev
                </button>
                <button onClick={() => setPage((p) => Math.min(totalPages, p + 1))} disabled={page >= totalPages} className="inline-flex items-center gap-1 px-3 py-1.5 text-sm border border-gray-200 rounded-lg text-gray-600 hover:bg-gray-50 disabled:opacity-40 disabled:cursor-not-allowed transition">
                  Next <ChevronRight className="w-4 h-4" />
                </button>
              </div>
            </div>
          </>
        )}
      </div>
    </WpAdminLayout>
  );
}
