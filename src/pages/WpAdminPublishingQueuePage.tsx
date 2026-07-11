import { useEffect, useState } from 'react';
import { Link, useLocation } from 'react-router-dom';
import { Plus, Edit2, Eye, ExternalLink, Search, ChevronLeft, ChevronRight, ArrowUpDown, Trash2, Layers, Calendar } from 'lucide-react';
import WpAdminLayout from '../components/wpadmin/WpAdminLayout';
import { useAdminFetch, useAdminMutation } from '../hooks/useAdminFetch';
import { AdminErrorBanner, AdminLoadingState, AdminEmptyState } from '../components/admin/AdminErrorBanner';
import { TOOL_STATUSES, toolStatusBadgeClass, toolStatusLabel } from '../utils/toolStatus';

interface ToolRow {
  id: string;
  slug: string;
  name: string;
  logo: string | null;
  status: string;
  source: string;
  updated_at: string;
  scheduled_publish_at: string | null;
  completeness: { percent: number; requiredMet: boolean };
}

interface ListResponse { ok: boolean; data: ToolRow[]; total: number; page: number; per_page: number; }

const PER_PAGE = 25;
const DEBOUNCE_MS = 300;

// Converts an ISO timestamp to the "YYYY-MM-DDTHH:mm" shape <input type="datetime-local">
// expects, in the admin's local timezone. Returns '' for null/unset.
function toDatetimeLocalValue(iso: string | null): string {
  if (!iso) return '';
  const d = new Date(iso);
  if (Number.isNaN(d.getTime())) return '';
  const local = new Date(d.getTime() - d.getTimezoneOffset() * 60000);
  return local.toISOString().slice(0, 16);
}

// One shared component behind two routes — /wp-admin/publishing/queue (all
// 5 statuses) and /wp-admin/publishing/drafts (preset to draft only). This
// is the reuse the Publishing Engine architecture calls for: a future bulk
// importer or API lands rows in the exact same queue, no second page to
// maintain.
export default function WpAdminPublishingQueuePage() {
  const location = useLocation();
  const isDraftQueue = location.pathname.endsWith('/drafts');

  const [searchInput, setSearchInput] = useState('');
  const [search, setSearch] = useState('');
  const [statusFilter, setStatusFilter] = useState<string>(isDraftQueue ? 'draft' : 'all');
  const [sortColumn, setSortColumn] = useState('updated_at');
  const [sortDir, setSortDir] = useState<'asc' | 'desc'>('desc');
  const [page, setPage] = useState(1);
  const [selected, setSelected] = useState<Set<string>>(new Set());
  const [bulkBusy, setBulkBusy] = useState(false);
  const [bulkMessage, setBulkMessage] = useState<string | null>(null);

  const [schedulingId, setSchedulingId] = useState<string | null>(null);
  const [scheduleValue, setScheduleValue] = useState('');
  const [scheduleBusy, setScheduleBusy] = useState(false);

  useEffect(() => {
    setStatusFilter(isDraftQueue ? 'draft' : 'all');
    setPage(1);
    setSelected(new Set());
  }, [isDraftQueue]);

  useEffect(() => {
    const timer = setTimeout(() => setSearch(searchInput.trim()), DEBOUNCE_MS);
    return () => clearTimeout(timer);
  }, [searchInput]);

  useEffect(() => {
    setPage(1);
    setSelected(new Set());
    setBulkMessage(null);
  }, [search, statusFilter, sortColumn, sortDir]);

  const listPath = () => {
    const params = new URLSearchParams();
    params.set('page', String(page));
    params.set('per_page', String(PER_PAGE));
    params.set('sort', sortColumn);
    params.set('dir', sortDir);
    if (search) params.set('q', search);
    if (statusFilter !== 'all') params.set('status', statusFilter);
    return `admin-tools?${params.toString()}`;
  };

  const { data, isLoading, isError, error, refetch } = useAdminFetch<ListResponse>(listPath);
  const { mutate: updateStatus } = useAdminMutation<{ ok: boolean }, { id: string; status: string; force?: boolean }>((v) => `admin-tools?id=${v.id}`, 'PUT');
  const { mutate: updateSchedule } = useAdminMutation<{ ok: boolean }, { id: string; scheduled_publish_at: string | null }>((v) => `admin-tools?id=${v.id}`, 'PUT');
  const { mutate: deleteTool } = useAdminMutation<{ ok: boolean }, string>((id) => `admin-tools?id=${id}`, 'DELETE');

  const tools = data?.data || [];
  const total = data?.total || 0;
  const totalPages = Math.max(1, Math.ceil(total / PER_PAGE));
  const allSelected = tools.length > 0 && tools.every((t) => selected.has(t.id));

  function toggleAll() {
    setSelected(allSelected ? new Set() : new Set(tools.map((t) => t.id)));
  }
  function toggleOne(id: string) {
    setSelected((prev) => {
      const next = new Set(prev);
      if (next.has(id)) next.delete(id);
      else next.add(id);
      return next;
    });
  }

  function handleSort(column: string) {
    if (sortColumn === column) setSortDir((d) => (d === 'asc' ? 'desc' : 'asc'));
    else { setSortColumn(column); setSortDir('desc'); }
  }

  async function handleBulkStatus(newStatus: string) {
    if (selected.size === 0) return;
    setBulkMessage(null);
    const selectedIds = [...selected];

    // Publishing directly from Draft is guarded server-side (requires force:true).
    // Only rows we currently have loaded (this page) can be checked for status —
    // ids selected from a previously viewed page aren't visible here.
    if (newStatus === 'published') {
      const draftIds = tools.filter((t) => selected.has(t.id) && t.status === 'draft').map((t) => t.id);
      const nonDraftIds = selectedIds.filter((id) => !draftIds.includes(id));

      if (draftIds.length > 0) {
        const confirmForce = window.confirm(
          `${draftIds.length} of the ${selectedIds.length} selected tools are still in Draft. Force-publish them directly from Draft?`
        );

        setBulkBusy(true);
        const nonDraftResults = await Promise.all(nonDraftIds.map((id) => updateStatus({ id, status: 'published' })));
        const failures = nonDraftResults.filter((r) => !r.ok);

        if (confirmForce) {
          const draftResults = await Promise.all(draftIds.map((id) => updateStatus({ id, status: 'published', force: true })));
          failures.push(...draftResults.filter((r) => !r.ok));
          if (failures.length > 0) {
            setBulkMessage(`${failures.length} update(s) failed: ${failures[0].error?.message || 'Unknown error'}`);
          }
        } else {
          const skippedMsg = `Skipped ${draftIds.length} tool(s) still in Draft (force-publish not confirmed).`;
          setBulkMessage(failures.length > 0 ? `${skippedMsg} Also, ${failures.length} update(s) failed: ${failures[0].error?.message || 'Unknown error'}` : skippedMsg);
        }

        setBulkBusy(false);
        setSelected(new Set());
        refetch();
        return;
      }
    }

    setBulkBusy(true);
    const results = await Promise.all(selectedIds.map((id) => updateStatus({ id, status: newStatus })));
    const failures = results.filter((r) => !r.ok);
    setBulkBusy(false);
    setSelected(new Set());
    if (failures.length > 0) {
      setBulkMessage(`${failures.length} update(s) failed: ${failures[0].error?.message || 'Unknown error'}`);
    }
    refetch();
  }

  async function handleBulkDelete() {
    if (selected.size === 0) return;
    if (!window.confirm(`Delete ${selected.size} tool(s)? This cannot be undone.`)) return;
    setBulkBusy(true);
    await Promise.all([...selected].map((id) => deleteTool(id)));
    setBulkBusy(false);
    setSelected(new Set());
    refetch();
  }

  function openScheduler(tool: ToolRow) {
    setSchedulingId(tool.id);
    setScheduleValue(toDatetimeLocalValue(tool.scheduled_publish_at));
  }
  function closeScheduler() {
    setSchedulingId(null);
    setScheduleValue('');
  }
  async function saveSchedule(id: string) {
    if (!scheduleValue) return;
    setScheduleBusy(true);
    const iso = new Date(scheduleValue).toISOString();
    const result = await updateSchedule({ id, scheduled_publish_at: iso });
    setScheduleBusy(false);
    if (result.ok) {
      closeScheduler();
      refetch();
    } else {
      setBulkMessage(result.error?.message || 'Failed to update schedule.');
    }
  }
  async function clearSchedule(id: string) {
    setScheduleBusy(true);
    const result = await updateSchedule({ id, scheduled_publish_at: null });
    setScheduleBusy(false);
    if (result.ok) {
      closeScheduler();
      refetch();
    } else {
      setBulkMessage(result.error?.message || 'Failed to clear schedule.');
    }
  }

  const title = isDraftQueue ? 'Draft Queue' : 'Publishing Queue';
  const stageFilters = [{ value: 'all', label: 'All' }, ...TOOL_STATUSES.map((s) => ({ value: s.value, label: s.label }))];

  return (
    <WpAdminLayout title={title} subtitle={isDraftQueue ? 'Tools not yet ready for review' : 'Every tool moving through the publishing pipeline'}>
      <div className="max-w-7xl mx-auto">
        <div className="flex flex-wrap items-center justify-between gap-3 mb-6">
          <div>
            <h1 className="text-2xl font-bold text-gray-900">{title}</h1>
            <p className="text-gray-500 mt-1 text-sm">{total.toLocaleString()} tool{total === 1 ? '' : 's'}</p>
          </div>
          <Link
            to="/wp-admin/publishing/new"
            className="inline-flex items-center gap-2 bg-gray-900 text-white px-4 py-2 rounded-lg font-semibold hover:bg-gray-800 transition text-sm"
          >
            <Plus className="w-4 h-4" />
            New Software
          </Link>
        </div>

        <div className="bg-white border border-gray-200 rounded-lg p-4 mb-4 flex flex-wrap gap-3">
          <div className="flex-1 min-w-[200px] relative">
            <Search className="w-4 h-4 text-gray-400 absolute left-3 top-1/2 -translate-y-1/2" />
            <input
              type="text"
              value={searchInput}
              onChange={(e) => setSearchInput(e.target.value)}
              placeholder="Search by name or slug..."
              className="w-full pl-9 pr-3 py-2 text-sm border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
            />
          </div>
          {!isDraftQueue && (
            <div className="flex flex-wrap items-center gap-1.5">
              {stageFilters.map((s) => (
                <button
                  key={s.value}
                  onClick={() => setStatusFilter(s.value)}
                  className={`text-xs font-medium px-3 py-1.5 rounded-lg border transition ${
                    statusFilter === s.value
                      ? 'bg-gray-900 text-white border-gray-900'
                      : 'bg-white text-gray-600 border-gray-300 hover:bg-gray-50'
                  }`}
                >
                  {s.label}
                </button>
              ))}
            </div>
          )}
        </div>

        {selected.size > 0 && (
          <div className="bg-blue-50 border border-blue-200 rounded-lg p-3 mb-4 flex flex-wrap items-center gap-3">
            <span className="text-sm font-medium text-blue-800 inline-flex items-center gap-1.5">
              <Layers className="w-4 h-4" />
              {selected.size} selected
            </span>
            <div className="flex flex-wrap items-center gap-2 ml-auto">
              {TOOL_STATUSES.map((s) => (
                <button
                  key={s.value}
                  onClick={() => handleBulkStatus(s.value)}
                  disabled={bulkBusy}
                  className="text-xs font-medium px-2.5 py-1.5 rounded-lg bg-white border border-blue-200 text-blue-700 hover:bg-blue-100 disabled:opacity-50 transition"
                >
                  Move to {s.label}
                </button>
              ))}
              <button
                onClick={handleBulkDelete}
                disabled={bulkBusy}
                className="inline-flex items-center gap-1 text-xs font-medium px-2.5 py-1.5 rounded-lg bg-white border border-red-200 text-red-600 hover:bg-red-50 disabled:opacity-50 transition"
              >
                <Trash2 className="w-3.5 h-3.5" />
                Delete
              </button>
            </div>
          </div>
        )}

        {bulkMessage && (
          <div className="bg-amber-50 border border-amber-200 rounded-lg p-3 mb-4 text-sm text-amber-800">
            {bulkMessage}
          </div>
        )}

        {isError && error && <AdminErrorBanner error={error} onRetry={refetch} className="mb-6" />}
        {isLoading && <AdminLoadingState message="Loading queue..." />}

        {!isLoading && !isError && tools.length === 0 && (
          <AdminEmptyState icon={Layers} title="Nothing here" message={isDraftQueue ? 'No drafts right now.' : 'No tools match this filter.'} />
        )}

        {!isLoading && tools.length > 0 && (
          <>
            <div className="bg-white border border-gray-200 rounded-lg overflow-hidden overflow-x-auto">
              <table className="w-full">
                <thead className="bg-gray-50 border-b border-gray-200">
                  <tr>
                    <th className="px-4 py-3 w-8">
                      <input type="checkbox" checked={allSelected} onChange={toggleAll} />
                    </th>
                    <th className="text-left px-5 py-3">
                      <button onClick={() => handleSort('name')} className="inline-flex items-center gap-1 text-xs font-semibold uppercase tracking-wide text-gray-500 hover:text-gray-700">
                        Tool <ArrowUpDown className="w-3 h-3" />
                      </button>
                    </th>
                    <th className="text-left px-5 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">Stage</th>
                    <th className="text-left px-5 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">Source</th>
                    <th className="text-left px-5 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">Completeness</th>
                    <th className="text-left px-5 py-3">
                      <button onClick={() => handleSort('updated_at')} className="inline-flex items-center gap-1 text-xs font-semibold uppercase tracking-wide text-gray-500 hover:text-gray-700">
                        Updated <ArrowUpDown className="w-3 h-3" />
                      </button>
                    </th>
                    <th className="text-right px-5 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">Actions</th>
                  </tr>
                </thead>
                <tbody className="divide-y divide-gray-100">
                  {tools.map((tool) => {
                    const hasFutureSchedule = !!tool.scheduled_publish_at && new Date(tool.scheduled_publish_at).getTime() > Date.now();
                    const canSchedule = tool.status === 'ready_to_publish' || !!tool.scheduled_publish_at;
                    return (
                    <tr key={tool.id} className={`hover:bg-gray-50 transition-colors ${selected.has(tool.id) ? 'bg-blue-50/50' : ''}`}>
                      <td className="px-4 py-3.5">
                        <input type="checkbox" checked={selected.has(tool.id)} onChange={() => toggleOne(tool.id)} />
                      </td>
                      <td className="px-5 py-3.5">
                        <div className="flex items-center gap-3">
                          {tool.logo ? (
                            <img src={tool.logo} alt="" className="w-8 h-8 rounded-lg object-contain border border-gray-100 bg-white shrink-0" />
                          ) : (
                            <div className="w-8 h-8 rounded-lg bg-gray-100 flex items-center justify-center text-gray-400 font-semibold text-xs shrink-0">
                              {tool.name.charAt(0)}
                            </div>
                          )}
                          <div className="min-w-0">
                            <p className="font-semibold text-gray-900 text-sm truncate">{tool.name}</p>
                            <p className="text-xs text-gray-400 truncate">{tool.slug}</p>
                          </div>
                        </div>
                      </td>
                      <td className="px-5 py-3.5">
                        <div className="flex flex-wrap items-center gap-1.5">
                          <span className={`inline-flex items-center px-2 py-0.5 rounded text-xs font-medium ${toolStatusBadgeClass(tool.status)}`}>
                            {toolStatusLabel(tool.status)}
                          </span>
                          {hasFutureSchedule && (
                            <span className="inline-flex items-center gap-1 px-2 py-0.5 rounded text-xs font-medium bg-sky-50 text-sky-700 border border-sky-200">
                              <Calendar className="w-3 h-3" />
                              Scheduled for {new Date(tool.scheduled_publish_at as string).toLocaleDateString('en-US', { month: 'short', day: 'numeric', year: 'numeric', hour: 'numeric', minute: '2-digit' })}
                            </span>
                          )}
                        </div>
                      </td>
                      <td className="px-5 py-3.5">
                        <span className={`text-xs ${tool.source === 'manual' ? 'text-gray-400' : 'font-medium text-violet-600'}`}>
                          {tool.source === 'manual' ? '—' : tool.source}
                        </span>
                      </td>
                      <td className="px-5 py-3.5">
                        <div className="flex items-center gap-2 w-24">
                          <div className="flex-1 h-1.5 bg-gray-100 rounded-full overflow-hidden">
                            <div
                              className={`h-full ${tool.completeness.percent >= 80 ? 'bg-emerald-500' : tool.completeness.percent >= 50 ? 'bg-amber-500' : 'bg-rose-400'}`}
                              style={{ width: `${tool.completeness.percent}%` }}
                            />
                          </div>
                          <span className="text-xs text-gray-500 tabular-nums w-8 text-right">{tool.completeness.percent}%</span>
                        </div>
                      </td>
                      <td className="px-5 py-3.5 text-sm text-gray-500">
                        {new Date(tool.updated_at).toLocaleDateString('en-US', { month: 'short', day: 'numeric', year: 'numeric' })}
                      </td>
                      <td className="px-5 py-3.5">
                        <div className="relative flex items-center justify-end gap-1">
                          <Link to={`/wp-admin/tools/${tool.id}/preview`} className="p-1.5 text-gray-500 hover:text-blue-600 hover:bg-blue-50 rounded transition" title="Preview">
                            <Eye className="w-4 h-4" />
                          </Link>
                          {tool.status === 'published' && (
                            <Link to={`/tools/${tool.slug}`} target="_blank" className="p-1.5 text-gray-500 hover:text-blue-600 hover:bg-blue-50 rounded transition" title="View public page">
                              <ExternalLink className="w-4 h-4" />
                            </Link>
                          )}
                          {canSchedule && (
                            <button
                              onClick={() => (schedulingId === tool.id ? closeScheduler() : openScheduler(tool))}
                              className={`p-1.5 rounded transition ${tool.scheduled_publish_at ? 'text-sky-600 hover:bg-sky-50' : 'text-gray-500 hover:text-blue-600 hover:bg-blue-50'}`}
                              title={tool.scheduled_publish_at ? 'Edit scheduled publish date' : 'Schedule publish'}
                            >
                              <Calendar className="w-4 h-4" />
                            </button>
                          )}
                          <Link to={`/wp-admin/tools/${tool.id}/edit`} className="p-1.5 text-gray-500 hover:text-blue-600 hover:bg-blue-50 rounded transition" title="Edit">
                            <Edit2 className="w-4 h-4" />
                          </Link>

                          {schedulingId === tool.id && (
                            <div className="absolute right-0 top-full mt-1 z-20 bg-white border border-gray-200 rounded-lg shadow-lg p-3 w-64 text-left">
                              <label className="block text-xs font-medium text-gray-600 mb-1">Schedule publish</label>
                              <input
                                type="datetime-local"
                                value={scheduleValue}
                                onChange={(e) => setScheduleValue(e.target.value)}
                                className="w-full px-2 py-1.5 text-sm border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500 mb-2"
                              />
                              <p className="text-xs text-gray-400 mb-2">Recorded for reference only — nothing auto-publishes on this date yet.</p>
                              <div className="flex items-center justify-between gap-2">
                                <button
                                  onClick={() => clearSchedule(tool.id)}
                                  disabled={scheduleBusy || !tool.scheduled_publish_at}
                                  className="text-xs text-red-600 hover:underline disabled:opacity-40 disabled:cursor-not-allowed"
                                >
                                  Clear
                                </button>
                                <div className="flex items-center gap-2">
                                  <button onClick={closeScheduler} disabled={scheduleBusy} className="text-xs text-gray-500 hover:text-gray-700">
                                    Cancel
                                  </button>
                                  <button
                                    onClick={() => saveSchedule(tool.id)}
                                    disabled={scheduleBusy || !scheduleValue}
                                    className="text-xs font-medium px-2.5 py-1 rounded-lg bg-gray-900 text-white hover:bg-gray-800 disabled:opacity-50 transition"
                                  >
                                    Save
                                  </button>
                                </div>
                              </div>
                            </div>
                          )}
                        </div>
                      </td>
                    </tr>
                    );
                  })}
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
