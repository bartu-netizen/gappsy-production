import { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import {
  Plus, Edit2, Trash2, Eye, Copy, Wrench, Search, Star, ShieldCheck, Award,
  FolderTree, Tag as TagIcon, ChevronLeft, ChevronRight, ArrowUpDown, ExternalLink,
} from 'lucide-react';
import WpAdminLayout from '../components/wpadmin/WpAdminLayout';
import { useAdminFetch, useAdminMutation } from '../hooks/useAdminFetch';
import { AdminErrorBanner, AdminLoadingState, AdminEmptyState } from '../components/admin/AdminErrorBanner';
import { TOOL_STATUSES, toolStatusLabel, toolStatusBadgeClass } from '../utils/toolStatus';

interface ToolCategoryRef {
  id: string;
  slug: string;
  name: string;
  primary_category: boolean;
}

interface CompletenessSummary {
  percent: number;
  requiredMet: boolean;
}

interface ToolRow {
  id: string;
  slug: string;
  name: string;
  logo: string | null;
  status: 'draft' | 'published' | 'archived';
  verified: boolean;
  featured: boolean;
  is_editors_pick: boolean;
  pricing_model: string | null;
  starting_price: string | null;
  updated_at: string;
  created_at: string;
  categories: ToolCategoryRef[];
  completeness: CompletenessSummary;
}

interface ListResponse {
  ok: boolean;
  data: ToolRow[];
  total: number;
  page: number;
  per_page: number;
}

interface CategoryOption {
  id: string;
  slug: string;
  name: string;
}
interface CategoriesListResponse {
  ok: boolean;
  data: CategoryOption[];
}

const PER_PAGE = 25;
const DEBOUNCE_MS = 300;

function StatusBadge({ status }: { status: string }) {
  return (
    <span className={`inline-flex items-center px-2 py-0.5 rounded text-xs font-medium ${toolStatusBadgeClass(status)}`}>
      {toolStatusLabel(status)}
    </span>
  );
}

function CompletenessBar({ completeness }: { completeness: CompletenessSummary }) {
  const color = completeness.percent >= 80 ? 'bg-emerald-500' : completeness.percent >= 50 ? 'bg-amber-500' : 'bg-rose-400';
  return (
    <div className="flex items-center gap-2 w-24">
      <div className="flex-1 h-1.5 bg-gray-100 rounded-full overflow-hidden">
        <div className={`h-full ${color}`} style={{ width: `${completeness.percent}%` }} />
      </div>
      <span className="text-xs text-gray-500 tabular-nums w-8 text-right">{completeness.percent}%</span>
    </div>
  );
}

function SortableHeader({
  label, column, activeSort, activeDir, onSort,
}: {
  label: string;
  column: string;
  activeSort: string;
  activeDir: 'asc' | 'desc';
  onSort: (col: string) => void;
}) {
  const isActive = activeSort === column;
  return (
    <button
      onClick={() => onSort(column)}
      className={`inline-flex items-center gap-1 text-xs font-semibold uppercase tracking-wide transition ${isActive ? 'text-gray-900' : 'text-gray-500 hover:text-gray-700'}`}
    >
      {label}
      <ArrowUpDown className={`w-3 h-3 ${isActive ? 'text-gray-700' : 'text-gray-300'}`} />
      {isActive && <span className="text-[10px]">{activeDir === 'asc' ? '↑' : '↓'}</span>}
    </button>
  );
}

export default function WpAdminToolsPage() {
  const [searchInput, setSearchInput] = useState('');
  const [search, setSearch] = useState('');
  const [statusFilter, setStatusFilter] = useState<'all' | 'draft' | 'published' | 'archived'>('all');
  const [categoryFilter, setCategoryFilter] = useState('');
  const [sortColumn, setSortColumn] = useState('updated_at');
  const [sortDir, setSortDir] = useState<'asc' | 'desc'>('desc');
  const [page, setPage] = useState(1);
  const [deleteConfirm, setDeleteConfirm] = useState<string | null>(null);

  useEffect(() => {
    const timer = setTimeout(() => setSearch(searchInput.trim()), DEBOUNCE_MS);
    return () => clearTimeout(timer);
  }, [searchInput]);

  useEffect(() => {
    setPage(1);
  }, [search, statusFilter, categoryFilter, sortColumn, sortDir]);

  const { data: categoriesData } = useAdminFetch<CategoriesListResponse>('admin-tool-categories');
  const categories = categoriesData?.data || [];

  const listPath = () => {
    const params = new URLSearchParams();
    params.set('page', String(page));
    params.set('per_page', String(PER_PAGE));
    params.set('sort', sortColumn);
    params.set('dir', sortDir);
    if (search) params.set('q', search);
    if (statusFilter !== 'all') params.set('status', statusFilter);
    if (categoryFilter) params.set('category', categoryFilter);
    return `admin-tools?${params.toString()}`;
  };

  const { data, isLoading, isError, error, refetch } = useAdminFetch<ListResponse>(listPath);

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

  const tools = data?.data || [];
  const total = data?.total || 0;
  const totalPages = Math.max(1, Math.ceil(total / PER_PAGE));

  function handleSort(column: string) {
    if (sortColumn === column) {
      setSortDir((d) => (d === 'asc' ? 'desc' : 'asc'));
    } else {
      setSortColumn(column);
      setSortDir(column === 'name' ? 'asc' : 'desc');
    }
  }

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
            <p className="text-gray-500 mt-1 text-sm">{total.toLocaleString()} total tool{total === 1 ? '' : 's'}</p>
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
                value={searchInput}
                onChange={(e) => setSearchInput(e.target.value)}
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
            {TOOL_STATUSES.map((s) => <option key={s.value} value={s.value}>{s.label}</option>)}
          </select>
          <select
            value={categoryFilter}
            onChange={(e) => setCategoryFilter(e.target.value)}
            className="px-3 py-2 text-sm border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
          >
            <option value="">All Categories</option>
            {categories.map((c) => (
              <option key={c.id} value={c.id}>{c.name}</option>
            ))}
          </select>
        </div>

        {isError && error && <AdminErrorBanner error={error} onRetry={refetch} className="mb-6" />}
        {isLoading && <AdminLoadingState message="Loading tools..." />}

        {!isLoading && !isError && tools.length === 0 && (
          <AdminEmptyState icon={Wrench} title="No tools found" message="Create your first tool to get started." />
        )}

        {!isLoading && tools.length > 0 && (
          <>
            <div className="bg-white border border-gray-200 rounded-lg overflow-hidden overflow-x-auto">
              <table className="w-full">
                <thead className="bg-gray-50 border-b border-gray-200">
                  <tr>
                    <th className="text-left px-5 py-3"><SortableHeader label="Tool" column="name" activeSort={sortColumn} activeDir={sortDir} onSort={handleSort} /></th>
                    <th className="text-left px-5 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">Category</th>
                    <th className="text-left px-5 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">Pricing</th>
                    <th className="text-left px-5 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">Status</th>
                    <th className="text-left px-5 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">Completeness</th>
                    <th className="text-left px-5 py-3"><SortableHeader label="Updated" column="updated_at" activeSort={sortColumn} activeDir={sortDir} onSort={handleSort} /></th>
                    <th className="text-right px-5 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">Actions</th>
                  </tr>
                </thead>
                <tbody className="divide-y divide-gray-100">
                  {tools.map((tool) => {
                    const primaryCategory = tool.categories.find((c) => c.primary_category) || tool.categories[0];
                    return (
                      <tr key={tool.id} className="hover:bg-gray-50 transition-colors">
                        <td className="px-5 py-3.5">
                          <div className="flex items-center gap-3">
                            {tool.logo ? (
                              <img src={tool.logo} alt="" className="w-9 h-9 rounded-lg object-contain border border-gray-100 bg-white shrink-0" />
                            ) : (
                              <div className="w-9 h-9 rounded-lg bg-gray-100 flex items-center justify-center text-gray-400 font-semibold text-xs shrink-0">
                                {tool.name.charAt(0)}
                              </div>
                            )}
                            <div className="min-w-0">
                              <div className="flex items-center gap-1.5">
                                <p className="font-semibold text-gray-900 text-sm truncate">{tool.name}</p>
                                {tool.verified && <ShieldCheck className="w-3.5 h-3.5 text-blue-500 shrink-0" aria-label="Verified" />}
                                {tool.featured && <Star className="w-3.5 h-3.5 text-amber-500 shrink-0" aria-label="Featured" />}
                                {tool.is_editors_pick && <Award className="w-3.5 h-3.5 text-violet-500 shrink-0" aria-label="Editor's Pick" />}
                              </div>
                              <p className="text-xs text-gray-400 mt-0.5 truncate">{tool.slug}</p>
                            </div>
                          </div>
                        </td>
                        <td className="px-5 py-3.5 text-sm text-gray-600">{primaryCategory?.name || <span className="text-gray-300">—</span>}</td>
                        <td className="px-5 py-3.5 text-sm text-gray-600">
                          {tool.pricing_model || <span className="text-gray-300">—</span>}
                          {tool.starting_price && <span className="text-gray-400"> · {tool.starting_price}</span>}
                        </td>
                        <td className="px-5 py-3.5">
                          <select
                            value={tool.status}
                            onChange={(e) => handleStatusChange(tool.id, e.target.value)}
                            className="text-xs border border-gray-200 rounded px-1.5 py-1 bg-white"
                          >
                            {TOOL_STATUSES.map((s) => <option key={s.value} value={s.value}>{s.label}</option>)}
                          </select>
                          <div className="mt-1"><StatusBadge status={tool.status} /></div>
                        </td>
                        <td className="px-5 py-3.5">
                          <CompletenessBar completeness={tool.completeness} />
                        </td>
                        <td className="px-5 py-3.5 text-sm text-gray-500">
                          {new Date(tool.updated_at).toLocaleDateString('en-US', { month: 'short', day: 'numeric', year: 'numeric' })}
                        </td>
                        <td className="px-5 py-3.5">
                          <div className="flex items-center justify-end gap-1">
                            <Link
                              to={`/wp-admin/tools/${tool.id}/preview`}
                              className="p-1.5 text-gray-500 hover:text-blue-600 hover:bg-blue-50 rounded transition"
                              title="Preview (admin only)"
                            >
                              <Eye className="w-4 h-4" />
                            </Link>
                            {tool.status === 'published' && (
                              <Link
                                to={`/tools/${tool.slug}`}
                                target="_blank"
                                className="p-1.5 text-gray-500 hover:text-blue-600 hover:bg-blue-50 rounded transition"
                                title="View public page"
                              >
                                <ExternalLink className="w-4 h-4" />
                              </Link>
                            )}
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
                    );
                  })}
                </tbody>
              </table>
            </div>

            <div className="flex items-center justify-between mt-4">
              <p className="text-sm text-gray-500">
                Page {page} of {totalPages} &middot; {total.toLocaleString()} tool{total === 1 ? '' : 's'}
              </p>
              <div className="flex items-center gap-2">
                <button
                  onClick={() => setPage((p) => Math.max(1, p - 1))}
                  disabled={page <= 1}
                  className="inline-flex items-center gap-1 px-3 py-1.5 text-sm border border-gray-200 rounded-lg text-gray-600 hover:bg-gray-50 disabled:opacity-40 disabled:cursor-not-allowed transition"
                >
                  <ChevronLeft className="w-4 h-4" />
                  Prev
                </button>
                <button
                  onClick={() => setPage((p) => Math.min(totalPages, p + 1))}
                  disabled={page >= totalPages}
                  className="inline-flex items-center gap-1 px-3 py-1.5 text-sm border border-gray-200 rounded-lg text-gray-600 hover:bg-gray-50 disabled:opacity-40 disabled:cursor-not-allowed transition"
                >
                  Next
                  <ChevronRight className="w-4 h-4" />
                </button>
              </div>
            </div>
          </>
        )}
      </div>
    </WpAdminLayout>
  );
}
