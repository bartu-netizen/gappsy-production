import { useMemo, useState } from 'react';
import { Link } from 'react-router-dom';
import { Plus, Edit2, Trash2, Eye, Copy, Wrench, Search, Star, ShieldCheck, FolderTree, Tag as TagIcon } from 'lucide-react';
import WpAdminLayout from '../components/wpadmin/WpAdminLayout';
import { useAdminFetch, useAdminMutation } from '../hooks/useAdminFetch';
import { AdminErrorBanner, AdminLoadingState, AdminEmptyState } from '../components/admin/AdminErrorBanner';

interface ToolCategoryRef {
  id: string;
  slug: string;
  name: string;
  primary_category: boolean;
}

interface ToolRow {
  id: string;
  slug: string;
  name: string;
  status: 'draft' | 'published' | 'archived';
  verified: boolean;
  featured: boolean;
  rating: number;
  review_count: number;
  categories: ToolCategoryRef[];
}

interface ListResponse {
  ok: boolean;
  data: ToolRow[];
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

export default function WpAdminToolsPage() {
  const { data, isLoading, isError, error, refetch } = useAdminFetch<ListResponse>('admin-tools');
  const [search, setSearch] = useState('');
  const [statusFilter, setStatusFilter] = useState<'all' | 'draft' | 'published' | 'archived'>('all');
  const [deleteConfirm, setDeleteConfirm] = useState<string | null>(null);

  const { mutate: updateStatus } = useAdminMutation<{ ok: boolean }, { id: string; status: string }>(
    (v) => `admin-tools?id=${v.id}`,
    'PUT'
  );
  const { mutate: deleteTool } = useAdminMutation<{ ok: boolean }, string>(
    (toolId) => `admin-tools?id=${toolId}`,
    'DELETE'
  );
  const { mutate: duplicateTool } = useAdminMutation<{ ok: boolean; data: { id: string } }, { action: string; id: string }>(
    'admin-tools',
    'POST'
  );

  const tools = useMemo(() => data?.data || [], [data]);

  const filtered = useMemo(() => {
    const q = search.trim().toLowerCase();
    return tools.filter((t) => {
      if (statusFilter !== 'all' && t.status !== statusFilter) return false;
      if (q && !t.name.toLowerCase().includes(q) && !t.slug.toLowerCase().includes(q)) return false;
      return true;
    });
  }, [tools, search, statusFilter]);

  async function handleStatusChange(id: string, status: string) {
    const result = await updateStatus({ id, status });
    if (!result.ok) {
      alert(result.error?.message || 'Failed to update status');
    } else {
      refetch();
    }
  }

  async function handleDuplicate(id: string) {
    const result = await duplicateTool({ action: 'duplicate', id });
    if (!result.ok) {
      alert(result.error?.message || 'Failed to duplicate tool');
    } else {
      refetch();
    }
  }

  async function handleDelete(id: string, name: string) {
    if (deleteConfirm !== id) {
      setDeleteConfirm(id);
      setTimeout(() => setDeleteConfirm(null), 5000);
      return;
    }
    if (!window.confirm(`PERMANENT DELETE: "${name}"\n\nThis cannot be undone. Continue?`)) {
      setDeleteConfirm(null);
      return;
    }
    const result = await deleteTool(id);
    if (!result.ok) {
      alert(result.error?.message || 'Failed to delete tool');
    } else {
      refetch();
    }
    setDeleteConfirm(null);
  }

  return (
    <WpAdminLayout title="Tools" subtitle="Manage the Tools directory">
      <div className="max-w-7xl mx-auto">
        <div className="flex flex-wrap items-center justify-between gap-3 mb-6">
          <div>
            <h1 className="text-2xl font-bold text-gray-900">Tools</h1>
            <p className="text-gray-500 mt-1 text-sm">{tools.length} total tools</p>
          </div>
          <div className="flex gap-2">
            <Link
              to="/wp-admin/tools/categories"
              className="inline-flex items-center gap-2 bg-gray-100 text-gray-700 px-4 py-2 rounded-lg font-medium hover:bg-gray-200 transition text-sm"
            >
              <FolderTree className="w-4 h-4" />
              Categories
            </Link>
            <Link
              to="/wp-admin/tools/tags"
              className="inline-flex items-center gap-2 bg-gray-100 text-gray-700 px-4 py-2 rounded-lg font-medium hover:bg-gray-200 transition text-sm"
            >
              <TagIcon className="w-4 h-4" />
              Tags
            </Link>
            <Link
              to="/wp-admin/tools/new"
              className="inline-flex items-center gap-2 bg-gray-900 text-white px-4 py-2 rounded-lg font-semibold hover:bg-gray-800 transition text-sm"
            >
              <Plus className="w-4 h-4" />
              New Tool
            </Link>
          </div>
        </div>

        <div className="bg-white border border-gray-200 rounded-lg p-4 mb-6 flex flex-wrap gap-3">
          <div className="flex-1 min-w-[200px]">
            <div className="relative">
              <Search className="w-4 h-4 text-gray-400 absolute left-3 top-1/2 -translate-y-1/2" />
              <input
                type="text"
                value={search}
                onChange={(e) => setSearch(e.target.value)}
                placeholder="Search by name or slug..."
                className="w-full pl-9 pr-3 py-2 text-sm border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
              />
            </div>
          </div>
          <select
            value={statusFilter}
            onChange={(e) => setStatusFilter(e.target.value as typeof statusFilter)}
            className="px-3 py-2 text-sm border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
          >
            <option value="all">All Status</option>
            <option value="draft">Draft</option>
            <option value="published">Published</option>
            <option value="archived">Archived</option>
          </select>
        </div>

        {isError && error && <AdminErrorBanner error={error} onRetry={refetch} className="mb-6" />}
        {isLoading && <AdminLoadingState message="Loading tools..." />}

        {!isLoading && !isError && filtered.length === 0 && (
          <AdminEmptyState icon={Wrench} title="No tools found" message="Create your first tool to get started." />
        )}

        {!isLoading && filtered.length > 0 && (
          <div className="bg-white border border-gray-200 rounded-lg overflow-hidden overflow-x-auto">
            <table className="w-full">
              <thead className="bg-gray-50 border-b border-gray-200">
                <tr>
                  <th className="text-left px-5 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">Tool</th>
                  <th className="text-left px-5 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">Categories</th>
                  <th className="text-left px-5 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">Status</th>
                  <th className="text-left px-5 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">Rating</th>
                  <th className="text-right px-5 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">Actions</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-gray-100">
                {filtered.map((tool) => (
                  <tr key={tool.id} className="hover:bg-gray-50 transition-colors">
                    <td className="px-5 py-3.5">
                      <div className="flex items-center gap-1.5">
                        <p className="font-semibold text-gray-900 text-sm">{tool.name}</p>
                        {tool.verified && <ShieldCheck className="w-3.5 h-3.5 text-blue-500" aria-label="Verified" />}
                        {tool.featured && <Star className="w-3.5 h-3.5 text-amber-500" aria-label="Featured" />}
                      </div>
                      <p className="text-xs text-gray-400 mt-0.5">{tool.slug}</p>
                    </td>
                    <td className="px-5 py-3.5">
                      <div className="flex flex-wrap gap-1">
                        {tool.categories.length === 0 && <span className="text-xs text-gray-400">—</span>}
                        {tool.categories.map((c) => (
                          <span
                            key={c.id}
                            className={`text-xs px-1.5 py-0.5 rounded ${c.primary_category ? 'bg-blue-100 text-blue-700' : 'bg-gray-100 text-gray-600'}`}
                          >
                            {c.name}
                          </span>
                        ))}
                      </div>
                    </td>
                    <td className="px-5 py-3.5">
                      <select
                        value={tool.status}
                        onChange={(e) => handleStatusChange(tool.id, e.target.value)}
                        className="text-xs border border-gray-200 rounded px-1.5 py-1 bg-white"
                      >
                        <option value="draft">Draft</option>
                        <option value="published">Published</option>
                        <option value="archived">Archived</option>
                      </select>
                      <div className="mt-1"><StatusBadge status={tool.status} /></div>
                    </td>
                    <td className="px-5 py-3.5 text-sm text-gray-600">
                      {tool.rating > 0 ? `${tool.rating.toFixed(1)} (${tool.review_count})` : '—'}
                    </td>
                    <td className="px-5 py-3.5">
                      <div className="flex items-center justify-end gap-1">
                        <Link
                          to={`/tools/${tool.slug}`}
                          target="_blank"
                          className="p-1.5 text-gray-500 hover:text-blue-600 hover:bg-blue-50 rounded transition"
                          title="View public page"
                        >
                          <Eye className="w-4 h-4" />
                        </Link>
                        <Link
                          to={`/wp-admin/tools/${tool.id}/edit`}
                          className="p-1.5 text-gray-500 hover:text-blue-600 hover:bg-blue-50 rounded transition"
                          title="Edit"
                        >
                          <Edit2 className="w-4 h-4" />
                        </Link>
                        <button
                          onClick={() => handleDuplicate(tool.id)}
                          className="p-1.5 text-gray-500 hover:text-blue-600 hover:bg-blue-50 rounded transition"
                          title="Duplicate"
                        >
                          <Copy className="w-4 h-4" />
                        </button>
                        <button
                          onClick={() => handleDelete(tool.id, tool.name)}
                          className={`p-1.5 rounded transition ${
                            deleteConfirm === tool.id ? 'bg-red-600 text-white' : 'text-gray-500 hover:text-red-600 hover:bg-red-50'
                          }`}
                          title={deleteConfirm === tool.id ? 'Click again to confirm delete' : 'Delete'}
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
