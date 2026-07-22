import { useMemo, useState } from 'react';
import { Link } from 'react-router-dom';
import { Plus, Edit2, Trash2, Eye, GitCompareArrows, Archive, Search } from 'lucide-react';
import WpAdminLayout from '../components/wpadmin/WpAdminLayout';
import { useAdminFetch, useAdminMutation } from '../hooks/useAdminFetch';
import { AdminErrorBanner, AdminLoadingState, AdminEmptyState } from '../components/admin/AdminErrorBanner';

interface ToolRef {
  id: string;
  slug: string;
  name: string;
  status: string;
}

interface ToolComparison {
  id: string;
  slug: string;
  status: 'draft' | 'published' | 'archived';
  tool_a: ToolRef | null;
  tool_b: ToolRef | null;
}

interface ListResponse {
  ok: boolean;
  data: ToolComparison[];
}

function StatusBadge({ status }: { status: string }) {
  const styles: Record<string, string> = {
    published: 'bg-green-100 text-green-800',
    draft: 'bg-gray-100 text-gray-600',
    archived: 'bg-slate-200 text-slate-600',
  };
  return (
    <span className={`inline-flex items-center px-2 py-0.5 rounded text-xs font-medium ${styles[status] || styles.draft}`}>
      {status}
    </span>
  );
}

export default function WpAdminToolComparisonsPage() {
  const { data, isLoading, isError, error, refetch } = useAdminFetch<ListResponse>('admin-tool-comparisons');
  const [deleteConfirm, setDeleteConfirm] = useState<string | null>(null);
  const [search, setSearch] = useState('');
  const { mutate: deleteComparison } = useAdminMutation<{ ok: boolean }, string>(
    (comparisonId) => `admin-tool-comparisons?id=${comparisonId}`,
    'DELETE'
  );
  const { mutate: updateComparison } = useAdminMutation<{ ok: boolean }, { id: string; status: string }>(
    (v) => `admin-tool-comparisons?id=${v.id}`,
    'PUT'
  );

  const allComparisons = useMemo(() => data?.data || [], [data]);
  const comparisons = useMemo(() => {
    const q = search.trim().toLowerCase();
    if (!q) return allComparisons;
    return allComparisons.filter((c) =>
      c.slug.toLowerCase().includes(q) ||
      (c.tool_a?.name || '').toLowerCase().includes(q) ||
      (c.tool_b?.name || '').toLowerCase().includes(q)
    );
  }, [allComparisons, search]);

  async function handleArchiveToggle(id: string, currentStatus: string) {
    const nextStatus = currentStatus === 'archived' ? 'draft' : 'archived';
    const result = await updateComparison({ id, status: nextStatus });
    if (!result.ok) {
      alert(result.error?.message || 'Failed to update comparison');
      return;
    }
    refetch();
  }

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
    const result = await deleteComparison(id);
    if (!result.ok) {
      alert(result.error?.message || 'Failed to delete comparison');
    } else {
      refetch();
    }
    setDeleteConfirm(null);
  }

  return (
    <WpAdminLayout title="Tool Comparisons" subtitle="Manage approved /compare pairs">
      <div className="max-w-5xl mx-auto">
        <div className="flex items-center justify-between mb-6">
          <div>
            <h1 className="text-2xl font-bold text-gray-900">Tool Comparisons</h1>
            <p className="text-gray-500 mt-1 text-sm">
              Only published rows here appear on /compare and get sitemap/prerender coverage. Never publish a pair without real editorial content.
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
              to="/wp-admin/tool-comparisons/new"
              className="inline-flex items-center gap-2 bg-gray-900 text-white px-4 py-2 rounded-lg font-semibold hover:bg-gray-800 transition text-sm"
            >
              <Plus className="w-4 h-4" />
              New Comparison
            </Link>
          </div>
        </div>

        {!isLoading && !isError && allComparisons.length > 0 && (
          <div className="bg-white border border-gray-200 rounded-lg p-4 mb-4">
            <div className="relative max-w-sm">
              <Search className="w-4 h-4 text-gray-400 absolute left-3 top-1/2 -translate-y-1/2" />
              <input
                type="text"
                value={search}
                onChange={(e) => setSearch(e.target.value)}
                placeholder="Search by tool name or slug..."
                className="w-full pl-9 pr-3 py-2 text-sm border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
              />
            </div>
          </div>
        )}

        {isError && error && <AdminErrorBanner error={error} onRetry={refetch} className="mb-6" />}
        {isLoading && <AdminLoadingState message="Loading comparisons..." />}

        {!isLoading && !isError && allComparisons.length === 0 && (
          <AdminEmptyState
            icon={GitCompareArrows}
            title="No comparisons yet"
            message="Approve your first tool pair to start building /compare."
          />
        )}

        {!isLoading && !isError && allComparisons.length > 0 && comparisons.length === 0 && (
          <AdminEmptyState icon={Search} title="No matches" message={`No comparisons match "${search}".`} />
        )}

        {!isLoading && comparisons.length > 0 && (
          <div className="bg-white border border-gray-200 rounded-lg overflow-hidden">
            <table className="w-full">
              <thead className="bg-gray-50 border-b border-gray-200">
                <tr>
                  <th className="text-left px-5 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">Pair</th>
                  <th className="text-left px-5 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">Slug</th>
                  <th className="text-left px-5 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">Status</th>
                  <th className="text-right px-5 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">Actions</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-gray-100">
                {comparisons.map((comparison) => {
                  const label = `${comparison.tool_a?.name || '?'} vs ${comparison.tool_b?.name || '?'}`;
                  return (
                    <tr key={comparison.id} className="hover:bg-gray-50 transition-colors">
                      <td className="px-5 py-3.5 font-medium text-gray-900 text-sm">{label}</td>
                      <td className="px-5 py-3.5 text-sm text-gray-500 font-mono">{comparison.slug}</td>
                      <td className="px-5 py-3.5"><StatusBadge status={comparison.status} /></td>
                      <td className="px-5 py-3.5">
                        <div className="flex items-center justify-end gap-1">
                          <Link
                            to={`/compare/${comparison.slug}`}
                            target="_blank"
                            className="p-1.5 text-gray-500 hover:text-blue-600 hover:bg-blue-50 rounded transition"
                            title="View public page"
                          >
                            <Eye className="w-4 h-4" />
                          </Link>
                          <Link
                            to={`/wp-admin/tool-comparisons/${comparison.id}/edit`}
                            className="p-1.5 text-gray-500 hover:text-blue-600 hover:bg-blue-50 rounded transition"
                            title="Edit"
                          >
                            <Edit2 className="w-4 h-4" />
                          </Link>
                          <button
                            onClick={() => handleArchiveToggle(comparison.id, comparison.status)}
                            className={`p-1.5 rounded transition ${comparison.status === 'archived' ? 'text-slate-600 bg-slate-100' : 'text-gray-500 hover:text-slate-700 hover:bg-slate-100'}`}
                            title={comparison.status === 'archived' ? 'Restore to draft' : 'Archive'}
                          >
                            <Archive className="w-4 h-4" />
                          </button>
                          <button
                            onClick={() => handleDelete(comparison.id, label)}
                            className={`p-1.5 rounded transition ${
                              deleteConfirm === comparison.id ? 'bg-red-600 text-white' : 'text-gray-500 hover:text-red-600 hover:bg-red-50'
                            }`}
                            title={deleteConfirm === comparison.id ? 'Click again to confirm delete' : 'Delete'}
                          >
                            <Trash2 className="w-4 h-4" />
                          </button>
                        </div>
                      </td>
                    </tr>
                  );
                })}
              </tbody>
            </table>
          </div>
        )}
      </div>
    </WpAdminLayout>
  );
}
