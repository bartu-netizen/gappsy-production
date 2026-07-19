import { useMemo, useState } from 'react';
import { Link } from 'react-router-dom';
import { Plus, Edit2, Trash2, Eye, Layers, Search } from 'lucide-react';
import WpAdminLayout from '../components/wpadmin/WpAdminLayout';
import { useAdminFetch, useAdminMutation } from '../hooks/useAdminFetch';
import { AdminErrorBanner, AdminLoadingState, AdminEmptyState } from '../components/admin/AdminErrorBanner';

interface ToolRef {
  id: string;
  slug: string;
  name: string;
  status: string;
}

interface GroupComparisonMember {
  sort_order: number;
  best_for: string | null;
  tool: ToolRef | null;
}

interface ToolGroupComparison {
  id: string;
  slug: string;
  title: string;
  status: 'draft' | 'published';
  members: GroupComparisonMember[];
}

interface ListResponse {
  ok: boolean;
  data: ToolGroupComparison[];
}

function StatusBadge({ status }: { status: string }) {
  const styles: Record<string, string> = {
    published: 'bg-green-100 text-green-800',
    draft: 'bg-gray-100 text-gray-600',
  };
  return (
    <span className={`inline-flex items-center px-2 py-0.5 rounded text-xs font-medium ${styles[status] || styles.draft}`}>
      {status}
    </span>
  );
}

export default function WpAdminToolComparisons3Page() {
  const { data, isLoading, isError, error, refetch } = useAdminFetch<ListResponse>('admin-tool-comparisons-3');
  const [deleteConfirm, setDeleteConfirm] = useState<string | null>(null);
  const [search, setSearch] = useState('');
  const { mutate: deleteGroupComparison } = useAdminMutation<{ ok: boolean }, string>(
    (groupComparisonId) => `admin-tool-comparisons-3?id=${groupComparisonId}`,
    'DELETE'
  );

  const allGroupComparisons = useMemo(() => data?.data || [], [data]);
  const groupComparisons = useMemo(() => {
    const q = search.trim().toLowerCase();
    if (!q) return allGroupComparisons;
    return allGroupComparisons.filter(
      (r) =>
        r.slug.toLowerCase().includes(q) ||
        r.title.toLowerCase().includes(q) ||
        r.members.some((m) => (m.tool?.name || '').toLowerCase().includes(q))
    );
  }, [allGroupComparisons, search]);

  async function handleDelete(id: string, label: string) {
    if (deleteConfirm !== id) {
      setDeleteConfirm(id);
      setTimeout(() => setDeleteConfirm(null), 5000);
      return;
    }
    if (!window.confirm(`Delete comparison "${label}"? This cannot be undone.`)) {
      setDeleteConfirm(null);
      return;
    }
    const result = await deleteGroupComparison(id);
    if (!result.ok) {
      alert(result.error?.message || 'Failed to delete comparison');
    } else {
      refetch();
    }
    setDeleteConfirm(null);
  }

  return (
    <WpAdminLayout title="3-Tool Comparisons" subtitle="Manage approved /compare/roundup (3+ tool) pages">
      <div className="max-w-5xl mx-auto">
        <div className="flex items-center justify-between mb-6">
          <div>
            <h1 className="text-2xl font-bold text-gray-900">3-Tool Comparisons</h1>
            <p className="text-gray-500 mt-1 text-sm">
              Only published rows with 3 or more member tools appear on /compare/roundup and get sitemap/prerender coverage. Never publish a comparison without real editorial content.
            </p>
          </div>
          <div className="flex gap-2">
            <Link
              to="/wp-admin/tools"
              className="inline-flex items-center gap-2 bg-gray-100 text-gray-700 px-4 py-2 rounded-lg font-medium hover:bg-gray-200 transition text-sm"
            >
              Back to Tools
            </Link>
            <Link
              to="/wp-admin/tool-comparisons-3/new"
              className="inline-flex items-center gap-2 bg-gray-900 text-white px-4 py-2 rounded-lg font-semibold hover:bg-gray-800 transition text-sm"
            >
              <Plus className="w-4 h-4" />
              New Comparison
            </Link>
          </div>
        </div>

        {!isLoading && !isError && allGroupComparisons.length > 0 && (
          <div className="bg-white border border-gray-200 rounded-lg p-4 mb-4">
            <div className="relative max-w-sm">
              <Search className="w-4 h-4 text-gray-400 absolute left-3 top-1/2 -translate-y-1/2" />
              <input
                type="text"
                value={search}
                onChange={(e) => setSearch(e.target.value)}
                placeholder="Search by title, slug, or tool name..."
                className="w-full pl-9 pr-3 py-2 text-sm border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
              />
            </div>
          </div>
        )}

        {isError && error && <AdminErrorBanner error={error} onRetry={refetch} className="mb-6" />}
        {isLoading && <AdminLoadingState message="Loading comparisons..." />}

        {!isLoading && !isError && allGroupComparisons.length === 0 && (
          <AdminEmptyState icon={Layers} title="No comparisons yet" message="Approve your first 3-tool set to start building /compare/roundup." />
        )}

        {!isLoading && !isError && allGroupComparisons.length > 0 && groupComparisons.length === 0 && (
          <AdminEmptyState icon={Search} title="No matches" message={`No comparisons match "${search}".`} />
        )}

        {!isLoading && groupComparisons.length > 0 && (
          <div className="bg-white border border-gray-200 rounded-lg overflow-hidden">
            <table className="w-full">
              <thead className="bg-gray-50 border-b border-gray-200">
                <tr>
                  <th className="text-left px-5 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">Title</th>
                  <th className="text-left px-5 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">Tools</th>
                  <th className="text-left px-5 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">Slug</th>
                  <th className="text-left px-5 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">Status</th>
                  <th className="text-right px-5 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">Actions</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-gray-100">
                {groupComparisons.map((gc) => (
                  <tr key={gc.id} className="hover:bg-gray-50 transition-colors">
                    <td className="px-5 py-3.5 font-medium text-gray-900 text-sm">{gc.title}</td>
                    <td className="px-5 py-3.5 text-sm text-gray-500">{gc.members.length}</td>
                    <td className="px-5 py-3.5 text-sm text-gray-500 font-mono">{gc.slug}</td>
                    <td className="px-5 py-3.5"><StatusBadge status={gc.status} /></td>
                    <td className="px-5 py-3.5">
                      <div className="flex items-center justify-end gap-1">
                        <Link
                          to={`/compare/roundup/${gc.slug}`}
                          target="_blank"
                          className="p-1.5 text-gray-500 hover:text-blue-600 hover:bg-blue-50 rounded transition"
                          title="View public page"
                        >
                          <Eye className="w-4 h-4" />
                        </Link>
                        <Link
                          to={`/wp-admin/tool-comparisons-3/${gc.id}/edit`}
                          className="p-1.5 text-gray-500 hover:text-blue-600 hover:bg-blue-50 rounded transition"
                          title="Edit"
                        >
                          <Edit2 className="w-4 h-4" />
                        </Link>
                        <button
                          onClick={() => handleDelete(gc.id, gc.title)}
                          className={`p-1.5 rounded transition ${
                            deleteConfirm === gc.id ? 'bg-red-600 text-white' : 'text-gray-500 hover:text-red-600 hover:bg-red-50'
                          }`}
                          title={deleteConfirm === gc.id ? 'Click again to confirm delete' : 'Delete'}
                        >
                          <Trash2 className="w-4 h-4" />
                        </button>
                      </div>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        )}
      </div>
    </WpAdminLayout>
  );
}
