import { Fragment, useState } from 'react';
import { Link } from 'react-router-dom';
import { ArrowLeft, ChevronLeft, ChevronRight, ChevronDown, ChevronUp, History } from 'lucide-react';
import WpAdminLayout from '../components/wpadmin/WpAdminLayout';
import { useAdminFetch } from '../hooks/useAdminFetch';
import { AdminErrorBanner, AdminLoadingState, AdminEmptyState } from '../components/admin/AdminErrorBanner';

type BatchStatus = 'pending' | 'processing' | 'completed' | 'failed';

interface BatchRow {
  id: string;
  file_name: string | null;
  total_rows: number;
  processed_rows: number;
  success_count: number;
  error_count: number;
  status: BatchStatus;
  errors: Array<{ row: number; error: string }>;
  created_by: string | null;
  created_at: string;
  completed_at: string | null;
  discovery_providers: { id: string; name: string } | null;
}

interface ListResponse { ok: boolean; data: BatchRow[]; total: number; }

const PER_PAGE = 25;

function statusBadgeClass(status: BatchStatus): string {
  switch (status) {
    case 'completed': return 'bg-emerald-100 text-emerald-700';
    case 'failed': return 'bg-red-100 text-red-700';
    case 'processing': return 'bg-blue-100 text-blue-700';
    default: return 'bg-amber-100 text-amber-700';
  }
}

function formatDate(iso: string): string {
  return new Date(iso).toLocaleDateString('en-US', { month: 'short', day: 'numeric', year: 'numeric' });
}

// Every discovery import batch, ever — manual entries log as a single-row
// candidate elsewhere (Discovery Queue); this page is specifically the
// batch-level (CSV) import log, mirroring Import History on the Publishing
// side.
export default function WpAdminDiscoveryImportHistoryPage() {
  const [page, setPage] = useState(1);
  const [expandedId, setExpandedId] = useState<string | null>(null);

  const listPath = () => `admin-discovery-import?page=${page}&per_page=${PER_PAGE}`;
  const { data, isLoading, isError, error, refetch } = useAdminFetch<ListResponse>(listPath);

  const batches = data?.data || [];
  const total = data?.total || 0;
  const totalPages = Math.max(1, Math.ceil(total / PER_PAGE));

  return (
    <WpAdminLayout title="Import History" subtitle="Every CSV import batch and its results">
      <div className="max-w-6xl mx-auto">
        <Link to="/wp-admin/discovery" className="inline-flex items-center gap-1.5 text-sm text-gray-500 hover:text-gray-700 mb-4">
          <ArrowLeft className="w-4 h-4" />
          Back to Discovery Dashboard
        </Link>

        <div className="mb-6">
          <h1 className="text-2xl font-bold text-gray-900">Import History</h1>
          <p className="text-gray-500 mt-1 text-sm">{total.toLocaleString()} batch{total === 1 ? '' : 'es'}</p>
        </div>

        {isError && error && <AdminErrorBanner error={error} onRetry={refetch} className="mb-6" />}
        {isLoading && <AdminLoadingState message="Loading import history..." />}

        {!isLoading && !isError && batches.length === 0 && (
          <AdminEmptyState icon={History} title="No imports yet" message="CSV import batches will show up here." />
        )}

        {!isLoading && batches.length > 0 && (
          <>
            <div className="bg-white border border-gray-200 rounded-lg overflow-hidden overflow-x-auto">
              <table className="w-full">
                <thead className="bg-gray-50 border-b border-gray-200">
                  <tr>
                    <th className="text-left px-5 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">File</th>
                    <th className="text-left px-5 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">Provider</th>
                    <th className="text-left px-5 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">Status</th>
                    <th className="text-left px-5 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">Rows</th>
                    <th className="text-left px-5 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">Started</th>
                    <th className="text-right px-5 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">Details</th>
                  </tr>
                </thead>
                <tbody className="divide-y divide-gray-100">
                  {batches.map((batch) => {
                    const isExpanded = expandedId === batch.id;
                    return (
                      <Fragment key={batch.id}>
                        <tr className="hover:bg-gray-50 transition-colors">
                          <td className="px-5 py-3.5 text-sm text-gray-900 font-medium">{batch.file_name || '—'}</td>
                          <td className="px-5 py-3.5 text-sm text-gray-600">{batch.discovery_providers?.name || '—'}</td>
                          <td className="px-5 py-3.5">
                            <span className={`inline-flex items-center px-2 py-0.5 rounded text-xs font-medium ${statusBadgeClass(batch.status)}`}>
                              {batch.status}
                            </span>
                          </td>
                          <td className="px-5 py-3.5 text-sm text-gray-600">
                            <span className="text-emerald-600 font-medium">{batch.success_count}</span> ok
                            {batch.error_count > 0 && <span className="text-red-600 font-medium"> · {batch.error_count} failed</span>}
                            <span className="text-gray-400"> / {batch.total_rows}</span>
                          </td>
                          <td className="px-5 py-3.5 text-sm text-gray-500">{formatDate(batch.created_at)}</td>
                          <td className="px-5 py-3.5">
                            <div className="flex items-center justify-end gap-1">
                              <button
                                onClick={() => setExpandedId((prev) => (prev === batch.id ? null : batch.id))}
                                className="inline-flex items-center gap-1 p-1.5 text-gray-500 hover:text-blue-600 hover:bg-blue-50 rounded transition"
                              >
                                {isExpanded ? <ChevronUp className="w-4 h-4" /> : <ChevronDown className="w-4 h-4" />}
                              </button>
                            </div>
                          </td>
                        </tr>
                        {isExpanded && (
                          <tr className="bg-gray-50">
                            <td colSpan={6} className="px-5 py-4">
                              <p className="text-xs font-semibold text-gray-600 uppercase tracking-wide mb-1.5">Errors</p>
                              {batch.errors.length > 0 ? (
                                <ul className="text-sm text-red-700 space-y-1">
                                  {batch.errors.map((e, idx) => (
                                    <li key={idx} className="flex items-start gap-1.5">
                                      <span className="w-1.5 h-1.5 rounded-full bg-red-500 shrink-0 mt-1.5" />
                                      Row {e.row}: {e.error}
                                    </li>
                                  ))}
                                </ul>
                              ) : (
                                <p className="text-sm text-emerald-600">No errors.</p>
                              )}
                            </td>
                          </tr>
                        )}
                      </Fragment>
                    );
                  })}
                </tbody>
              </table>
            </div>

            <div className="flex items-center justify-between mt-4">
              <p className="text-sm text-gray-500">Page {page} of {totalPages} &middot; {total.toLocaleString()} batch{total === 1 ? '' : 'es'}</p>
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
