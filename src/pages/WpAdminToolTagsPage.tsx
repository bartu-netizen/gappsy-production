import { useState } from 'react';
import { Link } from 'react-router-dom';
import { Plus, Edit2, Trash2, Eye, Tag as TagIcon } from 'lucide-react';
import WpAdminLayout from '../components/wpadmin/WpAdminLayout';
import { useAdminFetch, useAdminMutation } from '../hooks/useAdminFetch';
import { AdminErrorBanner, AdminLoadingState, AdminEmptyState } from '../components/admin/AdminErrorBanner';

interface ToolTag {
  id: string;
  slug: string;
  name: string;
  description: string | null;
}

interface ListResponse {
  ok: boolean;
  data: ToolTag[];
}

export default function WpAdminToolTagsPage() {
  const { data, isLoading, isError, error, refetch } = useAdminFetch<ListResponse>('admin-tool-tags');
  const [deleteConfirm, setDeleteConfirm] = useState<string | null>(null);
  const { mutate: deleteTag } = useAdminMutation<{ ok: boolean }, string>(
    (tagId) => `admin-tool-tags?id=${tagId}`,
    'DELETE'
  );

  const tags = data?.data || [];

  async function handleDelete(id: string, name: string) {
    if (deleteConfirm !== id) {
      setDeleteConfirm(id);
      setTimeout(() => setDeleteConfirm(null), 5000);
      return;
    }
    if (!window.confirm(`Delete tag "${name}"? Tools keep their other tags.`)) {
      setDeleteConfirm(null);
      return;
    }
    const result = await deleteTag(id);
    if (!result.ok) {
      alert(result.error?.message || 'Failed to delete tag');
    } else {
      refetch();
    }
    setDeleteConfirm(null);
  }

  return (
    <WpAdminLayout title="Tool Tags" subtitle="Manage the Tools free-form taxonomy">
      <div className="max-w-5xl mx-auto">
        <div className="flex items-center justify-between mb-6">
          <div>
            <h1 className="text-2xl font-bold text-gray-900">Tool Tags</h1>
            <p className="text-gray-500 mt-1 text-sm">Used at /tool-tags/:slug</p>
          </div>
          <div className="flex gap-2">
            <Link
              to="/wp-admin/tools"
              className="inline-flex items-center gap-2 bg-gray-100 text-gray-700 px-4 py-2 rounded-lg font-medium hover:bg-gray-200 transition text-sm"
            >
              Back to Tools
            </Link>
            <Link
              to="/wp-admin/tools/tags/new"
              className="inline-flex items-center gap-2 bg-gray-900 text-white px-4 py-2 rounded-lg font-semibold hover:bg-gray-800 transition text-sm"
            >
              <Plus className="w-4 h-4" />
              New Tag
            </Link>
          </div>
        </div>

        {isError && error && <AdminErrorBanner error={error} onRetry={refetch} className="mb-6" />}
        {isLoading && <AdminLoadingState message="Loading tags..." />}

        {!isLoading && !isError && tags.length === 0 && (
          <AdminEmptyState icon={TagIcon} title="No tags yet" message="Create your first tool tag." />
        )}

        {!isLoading && tags.length > 0 && (
          <div className="bg-white border border-gray-200 rounded-lg overflow-hidden">
            <table className="w-full">
              <thead className="bg-gray-50 border-b border-gray-200">
                <tr>
                  <th className="text-left px-5 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">Name</th>
                  <th className="text-left px-5 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">Slug</th>
                  <th className="text-right px-5 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">Actions</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-gray-100">
                {tags.map((tag) => (
                  <tr key={tag.id} className="hover:bg-gray-50 transition-colors">
                    <td className="px-5 py-3.5 font-medium text-gray-900 text-sm">{tag.name}</td>
                    <td className="px-5 py-3.5 text-sm text-gray-500 font-mono">{tag.slug}</td>
                    <td className="px-5 py-3.5">
                      <div className="flex items-center justify-end gap-1">
                        <Link
                          to={`/tool-tags/${tag.slug}`}
                          target="_blank"
                          className="p-1.5 text-gray-500 hover:text-blue-600 hover:bg-blue-50 rounded transition"
                          title="View public page"
                        >
                          <Eye className="w-4 h-4" />
                        </Link>
                        <Link
                          to={`/wp-admin/tools/tags/${tag.id}/edit`}
                          className="p-1.5 text-gray-500 hover:text-blue-600 hover:bg-blue-50 rounded transition"
                          title="Edit"
                        >
                          <Edit2 className="w-4 h-4" />
                        </Link>
                        <button
                          onClick={() => handleDelete(tag.id, tag.name)}
                          className={`p-1.5 rounded transition ${
                            deleteConfirm === tag.id ? 'bg-red-600 text-white' : 'text-gray-500 hover:text-red-600 hover:bg-red-50'
                          }`}
                          title={deleteConfirm === tag.id ? 'Click again to confirm delete' : 'Delete'}
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
