import { Fragment, useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import { ExternalLink, Search, ChevronLeft, ChevronRight, ChevronDown, ChevronUp, History, PencilLine } from 'lucide-react';
import WpAdminLayout from '../components/wpadmin/WpAdminLayout';
import { useAdminFetch } from '../hooks/useAdminFetch';
import { AdminErrorBanner, AdminLoadingState, AdminEmptyState } from '../components/admin/AdminErrorBanner';

type ImportStatus =
  | 'pending' | 'success' | 'failed'
  | 'queued' | 'fetching' | 'extracting' | 'review_required' | 'ready' | 'published' | 'cancelled';

interface ImportHistoryRow {
  id: string;
  tool_id: string | null;
  source: string;
  source_url: string | null;
  status: ImportStatus;
  progress: number;
  pages_processed: number;
  created_by: string | null;
  imported_sections: string[];
  errors: string[];
  credits_used: number;
  started_at: string;
  completed_at: string | null;
  created_at: string;
  tools: { id: string; slug: string; name: string; logo: string | null; status: string } | null;
}

interface ListResponse { ok: boolean; data: ImportHistoryRow[]; total: number; page: number; per_page: number; }

const PER_PAGE = 25;
const DEBOUNCE_MS = 300;

const SOURCE_LABELS: Record<string, string> = { wizard: 'New Software Wizard', bulk: 'Bulk Import', api: 'API' };

const STATUS_LABELS: Record<ImportStatus, string> = {
  pending: 'Pending', success: 'Success', failed: 'Failed',
  queued: 'Queued', fetching: 'Fetching', extracting: 'Extracting',
  review_required: 'Review Required', ready: 'Ready', published: 'Published', cancelled: 'Cancelled',
};

const STATUS_FILTERS: { value: string; label: string }[] = [
  { value: 'all', label: 'All Statuses' },
  ...(Object.keys(STATUS_LABELS) as ImportStatus[]).map((value) => ({ value, label: STATUS_LABELS[value] })),
];

// Import-job status — distinct from a tool's publishing stage, which lives
// in utils/toolStatus. 'pending'/'success' are legacy values from before
// this lifecycle vocabulary existed; still handled for old rows.
function importStatusBadgeClass(status: ImportStatus): string {
  switch (status) {
    case 'success':
    case 'ready':
    case 'published': return 'bg-emerald-100 text-emerald-700';
    case 'failed': return 'bg-red-100 text-red-700';
    case 'cancelled': return 'bg-gray-200 text-gray-600';
    case 'pending':
    case 'queued': return 'bg-amber-100 text-amber-700';
    case 'fetching':
    case 'extracting': return 'bg-blue-100 text-blue-700';
    case 'review_required': return 'bg-violet-100 text-violet-700';
    default: return 'bg-gray-100 text-gray-600';
  }
}

function formatDuration(startedAt: string, completedAt: string | null): string {
  if (!completedAt) return '—';
  const ms = new Date(completedAt).getTime() - new Date(startedAt).getTime();
  if (!Number.isFinite(ms) || ms < 0) return '—';
  const totalSeconds = Math.round(ms / 1000);
  if (totalSeconds < 60) return `${totalSeconds}s`;
  const minutes = Math.floor(totalSeconds / 60);
  const seconds = totalSeconds % 60;
  return `${minutes}m ${seconds}s`;
}

// One row per import attempt (not per tool), sourced from tool_import_history
// via the admin-import-history edge function. Tools created through the
// wizard, bulk import, or a future public API all land in this same log.
export default function WpAdminImportHistoryPage() {
  const [searchInput, setSearchInput] = useState('');
  const [search, setSearch] = useState('');
  const [statusFilter, setStatusFilter] = useState('all');
  const [page, setPage] = useState(1);
  const [expandedId, setExpandedId] = useState<string | null>(null);

  useEffect(() => {
    const timer = setTimeout(() => setSearch(searchInput.trim()), DEBOUNCE_MS);
    return () => clearTimeout(timer);
  }, [searchInput]);

  useEffect(() => { setPage(1); }, [search, statusFilter]);

  const listPath = () => {
    const params = new URLSearchParams();
    params.set('page', String(page));
    params.set('per_page', String(PER_PAGE));
    params.set('sort', 'created_at');
    params.set('dir', 'desc');
    if (search) params.set('q', search);
    if (statusFilter !== 'all') params.set('status', statusFilter);
    return `admin-import-history?${params.toString()}`;
  };

  const { data, isLoading, isError, error, refetch } = useAdminFetch<ListResponse>(listPath);
  const imports = data?.data || [];
  const total = data?.total || 0;
  const totalPages = Math.max(1, Math.ceil(total / PER_PAGE));

  function toggleExpanded(id: string) {
    setExpandedId((prev) => (prev === id ? null : id));
  }

  return (
    <WpAdminLayout title="Import History" subtitle="Every import attempt from the wizard, bulk import, or API">
      <div className="max-w-7xl mx-auto">
        <div className="mb-6">
          <h1 className="text-2xl font-bold text-gray-900">Import History</h1>
          <p className="text-gray-500 mt-1 text-sm">{total.toLocaleString()} import{total === 1 ? '' : 's'}</p>
        </div>

        <div className="bg-white border border-gray-200 rounded-lg p-4 mb-6 flex flex-wrap gap-3">
          <div className="flex-1 min-w-[200px] relative">
            <Search className="w-4 h-4 text-gray-400 absolute left-3 top-1/2 -translate-y-1/2" />
            <input
              type="text"
              value={searchInput}
              onChange={(e) => setSearchInput(e.target.value)}
              placeholder="Search by tool name or slug..."
              className="w-full pl-9 pr-3 py-2 text-sm border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
            />
          </div>
          <select
            value={statusFilter}
            onChange={(e) => setStatusFilter(e.target.value)}
            className="px-3 py-2 text-sm border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
          >
            {STATUS_FILTERS.map((s) => <option key={s.value} value={s.value}>{s.label}</option>)}
          </select>
        </div>

        {isError && error && <AdminErrorBanner error={error} onRetry={refetch} className="mb-6" />}
        {isLoading && <AdminLoadingState message="Loading import history..." />}

        {!isLoading && !isError && imports.length === 0 && (
          <AdminEmptyState icon={History} title="No imports yet" message="Tools created through the New Software wizard, bulk import, or API will show up here." />
        )}

        {!isLoading && imports.length > 0 && (
          <>
            <div className="bg-white border border-gray-200 rounded-lg overflow-hidden overflow-x-auto">
              <table className="w-full">
                <thead className="bg-gray-50 border-b border-gray-200">
                  <tr>
                    <th className="text-left px-5 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">Tool</th>
                    <th className="text-left px-5 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">URL</th>
                    <th className="text-left px-5 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">Date</th>
                    <th className="text-left px-5 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">Duration</th>
                    <th className="text-left px-5 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">Status</th>
                    <th className="text-left px-5 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">Pages</th>
                    <th className="text-left px-5 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">Editor</th>
                    <th className="text-left px-5 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">Credits</th>
                    <th className="text-left px-5 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">Sections</th>
                    <th className="text-left px-5 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">Errors</th>
                    <th className="text-right px-5 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">Actions</th>
                  </tr>
                </thead>
                <tbody className="divide-y divide-gray-100">
                  {imports.map((record) => {
                    const isExpanded = expandedId === record.id;
                    return (
                      <Fragment key={record.id}>
                        <tr className="hover:bg-gray-50 transition-colors">
                          <td className="px-5 py-3.5">
                            {record.tools ? (
                              <>
                                <p className="font-semibold text-gray-900 text-sm">{record.tools.name}</p>
                                <p className="text-xs text-gray-400">{record.tools.slug}</p>
                              </>
                            ) : (
                              <p className="text-sm text-gray-400 italic">— (deleted)</p>
                            )}
                          </td>
                          <td className="px-5 py-3.5 text-sm">
                            {record.source_url ? (
                              <a href={record.source_url} target="_blank" rel="noopener noreferrer" className="inline-flex items-center gap-1 text-blue-600 hover:underline truncate max-w-xs">
                                {record.source_url.replace(/^https?:\/\//, '')} <ExternalLink className="w-3 h-3 shrink-0" />
                              </a>
                            ) : (
                              <span className="text-gray-300">—</span>
                            )}
                          </td>
                          <td className="px-5 py-3.5 text-sm text-gray-500">
                            {new Date(record.created_at).toLocaleDateString('en-US', { month: 'short', day: 'numeric', year: 'numeric' })}
                          </td>
                          <td className="px-5 py-3.5 text-sm text-gray-500">{formatDuration(record.started_at, record.completed_at)}</td>
                          <td className="px-5 py-3.5">
                            <span className={`inline-flex items-center px-2 py-0.5 rounded text-xs font-medium ${importStatusBadgeClass(record.status)}`}>
                              {STATUS_LABELS[record.status] || record.status}
                            </span>
                          </td>
                          <td className="px-5 py-3.5 text-sm text-gray-500 tabular-nums">{record.pages_processed}</td>
                          <td className="px-5 py-3.5 text-sm text-gray-500 truncate max-w-[160px]">{record.created_by || '—'}</td>
                          <td className="px-5 py-3.5 text-sm text-gray-500 tabular-nums">{record.credits_used}</td>
                          <td className="px-5 py-3.5">
                            {record.imported_sections.length > 0 ? (
                              <div className="flex flex-wrap gap-1 max-w-[220px]">
                                {record.imported_sections.map((section) => (
                                  <span key={section} className="inline-flex items-center px-1.5 py-0.5 rounded bg-gray-100 text-gray-600 text-[11px] font-medium">
                                    {section}
                                  </span>
                                ))}
                              </div>
                            ) : (
                              <span className="text-gray-300 text-sm">—</span>
                            )}
                          </td>
                          <td className="px-5 py-3.5">
                            {record.errors.length > 0 ? (
                              <span className="inline-flex items-center px-2 py-0.5 rounded text-xs font-medium bg-red-100 text-red-700">
                                {record.errors.length} error{record.errors.length === 1 ? '' : 's'}
                              </span>
                            ) : (
                              <span className="text-gray-300 text-sm">—</span>
                            )}
                          </td>
                          <td className="px-5 py-3.5">
                            <div className="flex items-center justify-end gap-1">
                              <button
                                onClick={() => toggleExpanded(record.id)}
                                className="inline-flex items-center gap-1 p-1.5 text-gray-500 hover:text-blue-600 hover:bg-blue-50 rounded transition"
                                title="View details"
                              >
                                {isExpanded ? <ChevronUp className="w-4 h-4" /> : <ChevronDown className="w-4 h-4" />}
                              </button>
                              {record.tool_id ? (
                                <Link
                                  to={`/wp-admin/tools/${record.tool_id}/edit`}
                                  className="p-1.5 text-gray-500 hover:text-blue-600 hover:bg-blue-50 rounded transition"
                                  title="Reopen"
                                >
                                  <PencilLine className="w-4 h-4" />
                                </Link>
                              ) : (
                                <span className="p-1.5 text-gray-200" title="Tool no longer exists">
                                  <PencilLine className="w-4 h-4" />
                                </span>
                              )}
                            </div>
                          </td>
                        </tr>
                        {isExpanded && (
                          <tr className="bg-gray-50">
                            <td colSpan={11} className="px-5 py-4">
                              <div className="grid sm:grid-cols-2 gap-4">
                                <div>
                                  <p className="text-xs font-semibold text-gray-600 uppercase tracking-wide mb-1.5">Imported sections</p>
                                  {record.imported_sections.length > 0 ? (
                                    <ul className="text-sm text-gray-700 space-y-1">
                                      {record.imported_sections.map((section) => (
                                        <li key={section} className="flex items-center gap-1.5">
                                          <span className="w-1.5 h-1.5 rounded-full bg-emerald-500 shrink-0" />
                                          {section}
                                        </li>
                                      ))}
                                    </ul>
                                  ) : (
                                    <p className="text-sm text-gray-400">No sections recorded.</p>
                                  )}
                                </div>
                                <div>
                                  <p className="text-xs font-semibold text-gray-600 uppercase tracking-wide mb-1.5">Errors</p>
                                  {record.errors.length > 0 ? (
                                    <ul className="text-sm text-red-700 space-y-1">
                                      {record.errors.map((err, idx) => (
                                        <li key={idx} className="flex items-start gap-1.5">
                                          <span className="w-1.5 h-1.5 rounded-full bg-red-500 shrink-0 mt-1.5" />
                                          <span>{err}</span>
                                        </li>
                                      ))}
                                    </ul>
                                  ) : (
                                    <p className="text-sm text-emerald-600">No errors.</p>
                                  )}
                                </div>
                              </div>
                              <p className="text-xs text-gray-400 mt-3">
                                Source: {SOURCE_LABELS[record.source] || record.source}
                              </p>
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
              <p className="text-sm text-gray-500">Page {page} of {totalPages} &middot; {total.toLocaleString()} import{total === 1 ? '' : 's'}</p>
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
