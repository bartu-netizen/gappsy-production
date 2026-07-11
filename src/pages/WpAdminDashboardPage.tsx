import { useState } from 'react';
import { Link } from 'react-router-dom';
import {
  Search, FileEdit, CheckCircle2, Rocket, Archive, AlertTriangle, Download, Clock,
  LayoutGrid, Tags, GitCompare, TrendingUp, Edit3, ListTodo, Plus,
} from 'lucide-react';
import WpAdminLayout from '../components/wpadmin/WpAdminLayout';
import AdminToolCard from '../components/wpadmin/AdminToolCard';
import AdminCommandPalette from '../components/wpadmin/AdminCommandPalette';
import { ADMIN_TOOLS, TOOL_GROUPS } from '../components/wpadmin/adminTools';
import { useAdminFetch } from '../hooks/useAdminFetch';
import { toolStatusBadgeClass, toolStatusLabel } from '../utils/toolStatus';

interface PublishingStatsResponse {
  ok: boolean;
  data: {
    counts: {
      draft: number;
      needs_review: number;
      ready_to_publish: number;
      published: number;
      archived: number;
    };
    last_imports: Array<{
      id: string;
      source: string;
      source_url: string | null;
      status: 'pending' | 'success' | 'failed';
      created_at: string;
      tools: { id: string; slug: string; name: string; logo: string | null } | null;
    }>;
    last_published: Array<{ id: string; slug: string; name: string; logo: string | null; updated_at: string }>;
    recently_edited: Array<{ id: string; slug: string; name: string; logo: string | null; status: string; updated_at: string }>;
    incomplete_tools: Array<{ id: string; slug: string; name: string; logo: string | null; status: string; percent: number }>;
    failed_imports_count: number;
    total_imports_count: number;
    imports_today_count: number;
    total_software_count: number;
    categories_count: number;
    tags_count: number;
    comparisons_count: number;
  };
}

// Same threshold coloring used for completeness bars elsewhere in this admin.
function completenessBarClass(percent: number): string {
  if (percent >= 80) return 'bg-emerald-500';
  if (percent >= 50) return 'bg-amber-500';
  return 'bg-rose-400';
}

// Import-attempt status (pending/success/failed) — distinct from a tool's
// publishing stage. Mirrors the badge colors used on the Import History page.
function importStatusBadgeClass(status: 'pending' | 'success' | 'failed'): string {
  switch (status) {
    case 'success': return 'bg-emerald-100 text-emerald-700';
    case 'failed': return 'bg-red-100 text-red-700';
    case 'pending': return 'bg-amber-100 text-amber-700';
    default: return 'bg-slate-100 text-slate-600';
  }
}

function formatShortDate(iso: string): string {
  return new Date(iso).toLocaleDateString('en-US', { month: 'short', day: 'numeric' });
}

export default function WpAdminDashboardPage() {
  const [paletteOpen, setPaletteOpen] = useState(false);
  const { data: statsData, isLoading: statsLoading, isError: statsError } = useAdminFetch<PublishingStatsResponse>('admin-publishing-stats');
  const stats = statsData?.data;

  return (
    <WpAdminLayout title="Dashboard" subtitle="Quick access to all admin tools">
      <AdminCommandPalette open={paletteOpen} onClose={() => setPaletteOpen(false)} />

      <div className="space-y-8">
        {/* Publishing overview */}
        <div>
          <div className="flex items-center gap-3 mb-4">
            <h2 className="text-xs font-bold text-slate-400 uppercase tracking-widest">Publishing</h2>
            <div className="flex-1 h-px bg-slate-100" />
          </div>

          {statsLoading && (
            <div className="grid grid-cols-2 sm:grid-cols-3 xl:grid-cols-5 gap-3">
              {Array.from({ length: 10 }).map((_, i) => (
                <div key={i} className="h-20 bg-slate-100 rounded-xl animate-pulse" />
              ))}
            </div>
          )}

          {!statsLoading && !statsError && stats && (
            <div className="space-y-6">
              {/* Fleet overview */}
              <div className="grid grid-cols-2 sm:grid-cols-3 xl:grid-cols-5 gap-3">
                <Link
                  to="/wp-admin/tools"
                  className="flex items-center gap-3 p-4 bg-white border border-slate-200 rounded-xl hover:border-blue-300 hover:shadow-sm transition-all"
                >
                  <LayoutGrid className="w-5 h-5 text-slate-400 shrink-0" />
                  <div className="min-w-0">
                    <div className="text-xl font-bold text-slate-800 leading-none">{stats.total_software_count.toLocaleString()}</div>
                    <div className="text-xs text-slate-400 mt-1">Total Software</div>
                  </div>
                </Link>
                <Link
                  to="/wp-admin/tools/categories"
                  className="flex items-center gap-3 p-4 bg-white border border-slate-200 rounded-xl hover:border-blue-300 hover:shadow-sm transition-all"
                >
                  <Tags className="w-5 h-5 text-slate-400 shrink-0" />
                  <div className="min-w-0">
                    <div className="text-xl font-bold text-slate-800 leading-none">{stats.categories_count.toLocaleString()}</div>
                    <div className="text-xs text-slate-400 mt-1">Categories</div>
                  </div>
                </Link>
                <Link
                  to="/wp-admin/tool-comparisons"
                  className="flex items-center gap-3 p-4 bg-white border border-slate-200 rounded-xl hover:border-blue-300 hover:shadow-sm transition-all"
                >
                  <GitCompare className="w-5 h-5 text-slate-400 shrink-0" />
                  <div className="min-w-0">
                    <div className="text-xl font-bold text-slate-800 leading-none">{stats.comparisons_count.toLocaleString()}</div>
                    <div className="text-xs text-slate-400 mt-1">Comparisons</div>
                  </div>
                </Link>
                <Link
                  to="/wp-admin/publishing/imports"
                  className="flex items-center gap-3 p-4 bg-white border border-slate-200 rounded-xl hover:border-blue-300 hover:shadow-sm transition-all"
                >
                  <Download className="w-5 h-5 text-slate-400 shrink-0" />
                  <div className="min-w-0">
                    <div className="text-xl font-bold text-slate-800 leading-none">{stats.total_imports_count.toLocaleString()}</div>
                    <div className="text-xs text-slate-400 mt-1">Total Imports</div>
                  </div>
                </Link>
                <Link
                  to="/wp-admin/publishing/imports"
                  className="flex items-center gap-3 p-4 bg-white border border-slate-200 rounded-xl hover:border-blue-300 hover:shadow-sm transition-all"
                >
                  <Clock className="w-5 h-5 text-slate-400 shrink-0" />
                  <div className="min-w-0">
                    <div className="text-xl font-bold text-slate-800 leading-none">{stats.imports_today_count.toLocaleString()}</div>
                    <div className="text-xs text-slate-400 mt-1">Imports Today</div>
                  </div>
                </Link>
              </div>

              {/* Stat cards */}
              <div className="grid grid-cols-2 sm:grid-cols-3 xl:grid-cols-5 gap-3">
                <Link
                  to="/wp-admin/publishing/drafts"
                  className="flex items-center gap-3 p-4 bg-white border border-slate-200 rounded-xl hover:border-blue-300 hover:shadow-sm transition-all"
                >
                  <FileEdit className="w-5 h-5 text-slate-400 shrink-0" />
                  <div className="min-w-0">
                    <div className="text-xl font-bold text-slate-800 leading-none">{stats.counts.draft}</div>
                    <div className="text-xs text-slate-400 mt-1">Drafts</div>
                  </div>
                </Link>
                <Link
                  to="/wp-admin/publishing/queue"
                  className="flex items-center gap-3 p-4 bg-white border border-slate-200 rounded-xl hover:border-blue-300 hover:shadow-sm transition-all"
                >
                  <Rocket className="w-5 h-5 text-sky-400 shrink-0" />
                  <div className="min-w-0">
                    <div className="text-xl font-bold text-slate-800 leading-none">{stats.counts.ready_to_publish}</div>
                    <div className="text-xs text-slate-400 mt-1">Ready to Publish</div>
                  </div>
                </Link>
                <Link
                  to="/wp-admin/publishing/queue"
                  className="flex items-center gap-3 p-4 bg-white border border-slate-200 rounded-xl hover:border-blue-300 hover:shadow-sm transition-all"
                >
                  <CheckCircle2 className="w-5 h-5 text-emerald-400 shrink-0" />
                  <div className="min-w-0">
                    <div className="text-xl font-bold text-slate-800 leading-none">{stats.counts.published}</div>
                    <div className="text-xs text-slate-400 mt-1">Published</div>
                  </div>
                </Link>
                <Link
                  to="/wp-admin/publishing/queue"
                  className="flex items-center gap-3 p-4 bg-white border border-slate-200 rounded-xl hover:border-blue-300 hover:shadow-sm transition-all"
                >
                  <Archive className="w-5 h-5 text-slate-400 shrink-0" />
                  <div className="min-w-0">
                    <div className="text-xl font-bold text-slate-800 leading-none">{stats.counts.archived}</div>
                    <div className="text-xs text-slate-400 mt-1">Archived</div>
                  </div>
                </Link>
                <Link
                  to="/wp-admin/publishing/imports"
                  className={`flex items-center gap-3 p-4 rounded-xl border transition-all hover:shadow-sm ${
                    stats.failed_imports_count > 0
                      ? 'bg-amber-50 border-amber-200 hover:border-amber-300'
                      : 'bg-white border-slate-200 hover:border-blue-300'
                  }`}
                >
                  <AlertTriangle className={`w-5 h-5 shrink-0 ${stats.failed_imports_count > 0 ? 'text-amber-500' : 'text-slate-400'}`} />
                  <div className="min-w-0">
                    <div className={`text-xl font-bold leading-none ${stats.failed_imports_count > 0 ? 'text-amber-800' : 'text-slate-800'}`}>
                      {stats.failed_imports_count}
                    </div>
                    <div className={`text-xs mt-1 ${stats.failed_imports_count > 0 ? 'text-amber-600' : 'text-slate-400'}`}>Failed Imports</div>
                  </div>
                </Link>
              </div>

              {/* Publishing health + quick actions */}
              <div className="grid grid-cols-1 lg:grid-cols-2 gap-4">
                <div className="flex items-center gap-3 p-4 bg-white border border-slate-200 rounded-xl">
                  <TrendingUp className="w-5 h-5 text-slate-400 shrink-0" />
                  <p className="text-sm text-slate-600">
                    {stats.total_software_count > 0 ? (
                      <>
                        <span className="font-semibold text-slate-800">
                          {Math.round((stats.counts.published / stats.total_software_count) * 100)}%
                        </span>{' '}
                        of software is published ({stats.counts.published.toLocaleString()} of{' '}
                        {stats.total_software_count.toLocaleString()}), with{' '}
                        <span className="font-semibold text-slate-800">{stats.counts.draft.toLocaleString()}</span> still in draft.
                      </>
                    ) : (
                      'No software in the catalog yet.'
                    )}
                  </p>
                </div>

                <div className="bg-white border border-slate-200 rounded-xl p-4">
                  <p className="text-xs font-semibold text-slate-400 uppercase tracking-wide mb-2">Quick Actions</p>
                  <div className="flex flex-wrap items-center gap-2">
                    <Link
                      to="/wp-admin/publishing/new"
                      className="inline-flex items-center gap-1.5 bg-gray-900 text-white px-3 py-1.5 rounded-lg text-xs font-semibold hover:bg-gray-800 transition"
                    >
                      <Plus className="w-3.5 h-3.5" />
                      New Software
                    </Link>
                    <Link
                      to="/wp-admin/publishing/drafts"
                      className="inline-flex items-center px-3 py-1.5 rounded-lg text-xs font-semibold text-slate-600 bg-slate-100 hover:bg-slate-200 transition"
                    >
                      View Drafts
                    </Link>
                    <Link
                      to="/wp-admin/publishing/queue"
                      className="inline-flex items-center px-3 py-1.5 rounded-lg text-xs font-semibold text-slate-600 bg-slate-100 hover:bg-slate-200 transition"
                    >
                      Publishing Queue
                    </Link>
                    <Link
                      to="/wp-admin/tools/categories/new"
                      className="inline-flex items-center px-3 py-1.5 rounded-lg text-xs font-semibold text-slate-600 bg-slate-100 hover:bg-slate-200 transition"
                    >
                      New Category
                    </Link>
                    <Link
                      to="/wp-admin/tool-comparisons/new"
                      className="inline-flex items-center px-3 py-1.5 rounded-lg text-xs font-semibold text-slate-600 bg-slate-100 hover:bg-slate-200 transition"
                    >
                      New Comparison
                    </Link>
                  </div>
                </div>
              </div>

              {/* Mini lists */}
              <div className="grid grid-cols-1 lg:grid-cols-2 gap-4">
                <div className="bg-white border border-slate-200 rounded-xl p-4">
                  <div className="flex items-center gap-2 mb-3">
                    <Download className="w-4 h-4 text-slate-400" />
                    <h3 className="text-xs font-bold text-slate-400 uppercase tracking-widest">Last Imports</h3>
                  </div>
                  {stats.last_imports.length === 0 ? (
                    <p className="text-sm text-slate-400 py-2">No imports yet.</p>
                  ) : (
                    <ul className="divide-y divide-slate-100">
                      {stats.last_imports.map(item => (
                        <li key={item.id}>
                          <Link
                            to={item.tools ? `/wp-admin/tools/${item.tools.id}/edit` : '/wp-admin/publishing/imports'}
                            className="flex items-center gap-3 py-2 hover:bg-slate-50 -mx-1 px-1 rounded-lg transition-colors"
                          >
                            <span className="flex-1 min-w-0 text-sm text-slate-700 truncate">
                              {item.tools?.name || '—'}
                            </span>
                            <span className={`text-xs px-2 py-0.5 rounded font-medium shrink-0 ${importStatusBadgeClass(item.status)}`}>
                              {item.status}
                            </span>
                            <span className="text-xs text-slate-400 shrink-0">{formatShortDate(item.created_at)}</span>
                          </Link>
                        </li>
                      ))}
                    </ul>
                  )}
                </div>

                <div className="bg-white border border-slate-200 rounded-xl p-4">
                  <div className="flex items-center gap-2 mb-3">
                    <Clock className="w-4 h-4 text-slate-400" />
                    <h3 className="text-xs font-bold text-slate-400 uppercase tracking-widest">Last Published</h3>
                  </div>
                  {stats.last_published.length === 0 ? (
                    <p className="text-sm text-slate-400 py-2">No published tools yet.</p>
                  ) : (
                    <ul className="divide-y divide-slate-100">
                      {stats.last_published.map(item => (
                        <li key={item.id}>
                          <Link
                            to={`/wp-admin/tools/${item.id}/edit`}
                            className="flex items-center gap-3 py-2 hover:bg-slate-50 -mx-1 px-1 rounded-lg transition-colors"
                          >
                            {item.logo ? (
                              <img src={item.logo} alt="" className="w-5 h-5 rounded shrink-0 object-contain bg-slate-50" />
                            ) : (
                              <div className="w-5 h-5 rounded bg-slate-100 shrink-0" />
                            )}
                            <span className="flex-1 min-w-0 text-sm text-slate-700 truncate">{item.name}</span>
                            <span className="text-xs text-slate-400 shrink-0">{formatShortDate(item.updated_at)}</span>
                          </Link>
                        </li>
                      ))}
                    </ul>
                  )}
                </div>

                <div className="bg-white border border-slate-200 rounded-xl p-4">
                  <div className="flex items-center gap-2 mb-3">
                    <Edit3 className="w-4 h-4 text-slate-400" />
                    <h3 className="text-xs font-bold text-slate-400 uppercase tracking-widest">Recently Edited</h3>
                  </div>
                  {stats.recently_edited.length === 0 ? (
                    <p className="text-sm text-slate-400 py-2">No recent edits.</p>
                  ) : (
                    <ul className="divide-y divide-slate-100">
                      {stats.recently_edited.map(item => (
                        <li key={item.id}>
                          <Link
                            to={`/wp-admin/tools/${item.id}/edit`}
                            className="flex items-center gap-3 py-2 hover:bg-slate-50 -mx-1 px-1 rounded-lg transition-colors"
                          >
                            {item.logo ? (
                              <img src={item.logo} alt="" className="w-5 h-5 rounded shrink-0 object-contain bg-slate-50" />
                            ) : (
                              <div className="w-5 h-5 rounded bg-slate-100 shrink-0" />
                            )}
                            <span className="flex-1 min-w-0 text-sm text-slate-700 truncate">{item.name}</span>
                            <span className={`text-xs px-2 py-0.5 rounded font-medium shrink-0 ${toolStatusBadgeClass(item.status)}`}>
                              {toolStatusLabel(item.status)}
                            </span>
                            <span className="text-xs text-slate-400 shrink-0">{formatShortDate(item.updated_at)}</span>
                          </Link>
                        </li>
                      ))}
                    </ul>
                  )}
                </div>

                <div className="bg-white border border-slate-200 rounded-xl p-4">
                  <div className="flex items-center gap-2 mb-3">
                    <ListTodo className="w-4 h-4 text-slate-400" />
                    <h3 className="text-xs font-bold text-slate-400 uppercase tracking-widest">Incomplete Tools</h3>
                  </div>
                  {stats.incomplete_tools.length === 0 ? (
                    <p className="text-sm text-slate-500 py-2">Nothing in progress right now — every draft is complete.</p>
                  ) : (
                    <ul className="divide-y divide-slate-100">
                      {stats.incomplete_tools.map(item => (
                        <li key={item.id}>
                          <Link
                            to={`/wp-admin/tools/${item.id}/edit`}
                            className="flex items-center gap-3 py-2 hover:bg-slate-50 -mx-1 px-1 rounded-lg transition-colors"
                          >
                            {item.logo ? (
                              <img src={item.logo} alt="" className="w-5 h-5 rounded shrink-0 object-contain bg-slate-50" />
                            ) : (
                              <div className="w-5 h-5 rounded bg-slate-100 shrink-0" />
                            )}
                            <span className="flex-1 min-w-0 text-sm text-slate-700 truncate">{item.name}</span>
                            <span className={`text-xs px-2 py-0.5 rounded font-medium shrink-0 ${toolStatusBadgeClass(item.status)}`}>
                              {toolStatusLabel(item.status)}
                            </span>
                            <div className="flex items-center gap-1.5 shrink-0 w-20">
                              <div className="flex-1 h-1.5 bg-slate-100 rounded-full overflow-hidden">
                                <div
                                  className={`h-full rounded-full ${completenessBarClass(item.percent)}`}
                                  style={{ width: `${Math.min(100, Math.max(0, item.percent))}%` }}
                                />
                              </div>
                              <span className="text-xs text-slate-400 shrink-0">{item.percent}%</span>
                            </div>
                          </Link>
                        </li>
                      ))}
                    </ul>
                  )}
                </div>
              </div>
            </div>
          )}
        </div>

        {/* Search bar */}
        <button
          onClick={() => setPaletteOpen(true)}
          className="w-full flex items-center gap-3 px-4 py-3 bg-white border border-slate-200 rounded-xl text-slate-400 hover:border-blue-300 hover:shadow-sm transition-all text-sm group"
        >
          <Search className="w-4 h-4 group-hover:text-blue-500 transition-colors" />
          <span className="flex-1 text-left group-hover:text-slate-500">Search tools by name or keyword...</span>
          <div className="hidden sm:flex items-center gap-1">
            <kbd className="text-xs px-1.5 py-0.5 bg-slate-100 rounded border border-slate-200 text-slate-400">⌘</kbd>
            <kbd className="text-xs px-1.5 py-0.5 bg-slate-100 rounded border border-slate-200 text-slate-400">K</kbd>
          </div>
        </button>

        {/* Tool groups */}
        {TOOL_GROUPS.map(group => (
          <div key={group}>
            <div className="flex items-center gap-3 mb-4">
              <h2 className="text-xs font-bold text-slate-400 uppercase tracking-widest">{group}</h2>
              <div className="flex-1 h-px bg-slate-100" />
            </div>
            <div className="grid grid-cols-1 sm:grid-cols-2 xl:grid-cols-3 gap-3">
              {ADMIN_TOOLS.filter(t => t.group === group).map(tool => (
                <AdminToolCard key={tool.id} tool={tool} />
              ))}
            </div>
          </div>
        ))}
      </div>
    </WpAdminLayout>
  );
}
