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

interface RoundupMember {
  sort_order: number;
  best_for: string | null;
  tool: ToolRef | null;
}

interface ToolRoundup {
  id: string;
  slug: string;
  title: string;
  status: 'draft' | 'published';
  members: RoundupMember[];
}

interface ListResponse {
  ok: boolean;
  data: ToolRoundup[];
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

export default function WpAdminToolRoundupsPage() {
  const { data, isLoading, isError, error, refetch } = useAdminFetch<ListResponse>('admin-tool-roundups');
  const [deleteConfirm, setDeleteConfirm] = useState<string | null>(null);
  const [search, setSearch] = useState('');
  const { mutate: deleteRoundup } = useAdminMutation<{ ok: boolean }, string>(
    (roundupId) => `admin-tool-roundups?id=${roundupId}`,
    'DELETE'
  );

  const allRoundups = useMemo(() => data?.data || [], [data]);
  const roundups = useMemo(() => {
    const q = search.trim().toLowerCase();
    if (!q) return allRoundups;
    return allRoundups.filter(
      (r) =>
        r.slug.toLowerCase().includes(q) ||
        r.title.toLowerCase().includes(q) ||
        r.members.some((m) => (m.tool?.name || '').toLowerCase().includes(q))
    );
  }, [allRoundups, search]);

  async function handleDelete(id: string, label: string) {
    if (deleteConfirm !== id) {
      setDeleteConfirm(id);
      setTimeout(() => setDeleteConfirm(null), 5000);
      return;
    }
    if (!window.confirm(`Delete roundup "${label}"? This cannot be undone.`)) {
      setDeleteConfirm(null);
      return;
    }
    const result = await deleteRoundup(id);
    if (!result.ok) {
      alert(result.error?.message || 'Failed to delete roundup');
    } else {
      refetch();
    }
    setDeleteConfirm(null);
  }

  return (
    <WpAdminLayout title="Tool Roundups" subtitle="Manage approved /roundup (3+ tool) pages">
      <div className="max-w-5xl mx-auto">
        <div className="flex items-center justify-between mb-6">
          <div>
            <h1 className="text-2xl font-bold text-gray-900">Tool Roundups</h1>
            <p className="text-gray-500 mt-1 text-sm">
              Only published rows with 3 or more member tools appear on /roundup and get sitemap/prerender coverage. Never publish a roundup without real editorial content.
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
              to="/wp-admin/tool-roundups/new"
              className="inline-flex items-center gap-2 bg-gray-900 text-white px-4 py-2 rounded-lg font-semibold hover:bg-gray-800 transition text-sm"
            >
              <Plus className="w-4 h-4" />
              New Roundup
            </Link>
          </div>
        </div>

        {!isLoading && !isError && allRoundups.length > 0 && (
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
        {isLoading && <AdminLoadingState message="Loading roundups..." />}

        {!isLoading && !isError && allRoundups.length === 0 && (
          <AdminEmptyState icon={Layers} title="No roundups yet" message="Approve your first 3-tool set to start building /roundup." />
        )}

        {!isLoading && !isError && allRoundups.length > 0 && roundups.length === 0 && (
          <AdminEmptyState icon={Search} title="No matches" message={`No roundups match "${search}".`} />
        )}

        {!isLoading && roundups.length > 0 && (
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
                {roundups.map((roundup) => (
                  <tr key={roundup.id} className="hover:bg-gray-50 transition-colors">
                    <td className="px-5 py-3.5 font-medium text-gray-900 text-sm">{roundup.title}</td>
                    <td className="px-5 py-3.5 text-sm text-gray-500">{roundup.members.length}</td>
                    <td className="px-5 py-3.5 text-sm text-gray-500 font-mono">{roundup.slug}</td>
                    <td className="px-5 py-3.5"><StatusBadge status={roundup.status} /></td>
                    <td className="px-5 py-3.5">
                      <div className="flex items-center justify-end gap-1">
                        <Link
                          to={`/roundup/${roundup.slug}`}
                          target="_blank"
                          className="p-1.5 text-gray-500 hover:text-blue-600 hover:bg-blue-50 rounded transition"
                          title="View public page"
                        >
                          <Eye className="w-4 h-4" />
                        </Link>
                        <Link
                          to={`/wp-admin/tool-roundups/${roundup.id}/edit`}
                          className="p-1.5 text-gray-500 hover:text-blue-600 hover:bg-blue-50 rounded transition"
                          title="Edit"
                        >
                          <Edit2 className="w-4 h-4" />
                        </Link>
                        <button
                          onClick={() => handleDelete(roundup.id, roundup.title)}
                          className={`p-1.5 rounded transition ${
                            deleteConfirm === roundup.id ? 'bg-red-600 text-white' : 'text-gray-500 hover:text-red-600 hover:bg-red-50'
                          }`}
                          title={deleteConfirm === roundup.id ? 'Click again to confirm delete' : 'Delete'}
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
