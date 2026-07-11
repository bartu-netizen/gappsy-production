import { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import { Edit2, ExternalLink, Search, ChevronLeft, ChevronRight, History } from 'lucide-react';
import WpAdminLayout from '../components/wpadmin/WpAdminLayout';
import { useAdminFetch } from '../hooks/useAdminFetch';
import { AdminErrorBanner, AdminLoadingState, AdminEmptyState } from '../components/admin/AdminErrorBanner';
import { toolStatusBadgeClass, toolStatusLabel } from '../utils/toolStatus';

interface ToolRow {
  id: string;
  slug: string;
  name: string;
  status: string;
  source: string;
  source_url: string | null;
  created_at: string;
}

interface ListResponse { ok: boolean; data: ToolRow[]; total: number; page: number; per_page: number; }

const PER_PAGE = 25;
const DEBOUNCE_MS = 300;

const SOURCE_LABELS: Record<string, string> = { wizard: 'New Software Wizard', bulk: 'Bulk Import', api: 'API' };

// Every tool that entered the system through anything other than manual
// creation — today that's only the wizard, but this same filtered view
// (source != 'manual') is what a future bulk importer or public API will
// also show up in, with zero changes to this page.
export default function WpAdminImportHistoryPage() {
  const [searchInput, setSearchInput] = useState('');
  const [search, setSearch] = useState('');
  const [page, setPage] = useState(1);

  useEffect(() => {
    const timer = setTimeout(() => setSearch(searchInput.trim()), DEBOUNCE_MS);
    return () => clearTimeout(timer);
  }, [searchInput]);

  useEffect(() => { setPage(1); }, [search]);

  const listPath = () => {
    const params = new URLSearchParams();
    params.set('page', String(page));
    params.set('per_page', String(PER_PAGE));
    params.set('sort', 'created_at');
    params.set('dir', 'desc');
    params.set('source', 'imported');
    if (search) params.set('q', search);
    return `admin-tools?${params.toString()}`;
  };

  const { data, isLoading, isError, error, refetch } = useAdminFetch<ListResponse>(listPath);
  const tools = data?.data || [];
  const total = data?.total || 0;
  const totalPages = Math.max(1, Math.ceil(total / PER_PAGE));

  return (
    <WpAdminLayout title="Import History" subtitle="Every tool that entered the system via the wizard, bulk import, or API">
      <div className="max-w-7xl mx-auto">
        <div className="mb-6">
          <h1 className="text-2xl font-bold text-gray-900">Import History</h1>
          <p className="text-gray-500 mt-1 text-sm">{total.toLocaleString()} imported tool{total === 1 ? '' : 's'}</p>
        </div>

        <div className="bg-white border border-gray-200 rounded-lg p-4 mb-6">
          <div className="relative max-w-sm">
            <Search className="w-4 h-4 text-gray-400 absolute left-3 top-1/2 -translate-y-1/2" />
            <input
              type="text"
              value={searchInput}
              onChange={(e) => setSearchInput(e.target.value)}
              placeholder="Search by name or slug..."
              className="w-full pl-9 pr-3 py-2 text-sm border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
            />
          </div>
        </div>

        {isError && error && <AdminErrorBanner error={error} onRetry={refetch} className="mb-6" />}
        {isLoading && <AdminLoadingState message="Loading import history..." />}

        {!isLoading && !isError && tools.length === 0 && (
          <AdminEmptyState icon={History} title="No imports yet" message="Tools created through the New Software wizard, bulk import, or API will show up here." />
        )}

        {!isLoading && tools.length > 0 && (
          <>
            <div className="bg-white border border-gray-200 rounded-lg overflow-hidden overflow-x-auto">
              <table className="w-full">
                <thead className="bg-gray-50 border-b border-gray-200">
                  <tr>
                    <th className="text-left px-5 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">Tool</th>
                    <th className="text-left px-5 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">Source</th>
                    <th className="text-left px-5 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">Source URL</th>
                    <th className="text-left px-5 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">Stage</th>
                    <th className="text-left px-5 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">Imported</th>
                    <th className="text-right px-5 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">Actions</th>
                  </tr>
                </thead>
                <tbody className="divide-y divide-gray-100">
                  {tools.map((tool) => (
                    <tr key={tool.id} className="hover:bg-gray-50 transition-colors">
                      <td className="px-5 py-3.5">
                        <p className="font-semibold text-gray-900 text-sm">{tool.name}</p>
                        <p className="text-xs text-gray-400">{tool.slug}</p>
                      </td>
                      <td className="px-5 py-3.5 text-sm text-violet-600 font-medium">{SOURCE_LABELS[tool.source] || tool.source}</td>
                      <td className="px-5 py-3.5 text-sm">
                        {tool.source_url ? (
                          <a href={tool.source_url} target="_blank" rel="noopener noreferrer" className="inline-flex items-center gap-1 text-blue-600 hover:underline truncate max-w-xs">
                            {tool.source_url.replace(/^https?:\/\//, '')} <ExternalLink className="w-3 h-3 shrink-0" />
                          </a>
                        ) : (
                          <span className="text-gray-300">—</span>
                        )}
                      </td>
                      <td className="px-5 py-3.5">
                        <span className={`inline-flex items-center px-2 py-0.5 rounded text-xs font-medium ${toolStatusBadgeClass(tool.status)}`}>
                          {toolStatusLabel(tool.status)}
                        </span>
                      </td>
                      <td className="px-5 py-3.5 text-sm text-gray-500">
                        {new Date(tool.created_at).toLocaleDateString('en-US', { month: 'short', day: 'numeric', year: 'numeric' })}
                      </td>
                      <td className="px-5 py-3.5">
                        <div className="flex items-center justify-end">
                          <Link to={`/wp-admin/tools/${tool.id}/edit`} className="p-1.5 text-gray-500 hover:text-blue-600 hover:bg-blue-50 rounded transition" title="Edit">
                            <Edit2 className="w-4 h-4" />
                          </Link>
                        </div>
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>

            <div className="flex items-center justify-between mt-4">
              <p className="text-sm text-gray-500">Page {page} of {totalPages} &middot; {total.toLocaleString()} tool{total === 1 ? '' : 's'}</p>
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
