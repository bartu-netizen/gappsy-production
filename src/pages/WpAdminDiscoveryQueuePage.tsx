import { Fragment, useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import {
  Search, ChevronLeft, ChevronRight, ChevronDown, ChevronUp,
  ListChecks, ExternalLink, Layers, RefreshCw, Play, Loader2, FileSearch, RotateCcw, PencilLine,
} from 'lucide-react';
import WpAdminLayout from '../components/wpadmin/WpAdminLayout';
import { useAdminFetch, useAdminMutation } from '../hooks/useAdminFetch';
import { AdminErrorBanner, AdminLoadingState, AdminEmptyState } from '../components/admin/AdminErrorBanner';
import { DISCOVERY_STATUSES, discoveryStatusLabel, discoveryStatusBadgeClass, scoreBadgeClass, type DiscoveryStatus } from '../utils/discoveryStatus';
import { crawlJobStatusLabel, crawlJobStatusBadgeClass, CRAWL_ACTIVE_STATUSES, type CrawlJobStatus } from '../utils/crawlJobStatus';

interface LatestCrawlJob {
  id: string;
  status: CrawlJobStatus;
  progress: number;
  error_code: string | null;
  error_message: string | null;
  created_draft_tool_id: string | null;
}

interface DiscoveredToolRow {
  id: string;
  name: string;
  slug: string;
  official_website: string;
  hostname: string | null;
  logo_url: string | null;
  short_description: string | null;
  status: DiscoveryStatus;
  confidence_score: number | null;
  duplicate_score: number | null;
  quality_score: number | null;
  validation_notes: Record<string, unknown>;
  source_url: string | null;
  created_at: string;
  tool_categories: { id: string; name: string } | null;
  discovery_providers: { id: string; name: string } | null;
  latest_crawl_job: LatestCrawlJob | null;
}

interface ListResponse { ok: boolean; data: DiscoveredToolRow[]; total: number; page: number; per_page: number; }
interface MutateResponse { ok: boolean; data?: unknown; }

const PER_PAGE = 25;
const DEBOUNCE_MS = 300;

const STATUS_CHIPS: { value: string; label: string }[] = [
  { value: 'all', label: 'All' },
  ...DISCOVERY_STATUSES.map((s) => ({ value: s.value, label: s.label })),
];

function formatDate(iso: string): string {
  return new Date(iso).toLocaleDateString('en-US', { month: 'short', day: 'numeric', year: 'numeric' });
}

// Builds a human-readable message from an approve / bulk-approve response.
// Reads the payload defensively since the exact field names/shape may vary —
// falls back to a generic success message if counts aren't parseable.
function buildApproveMessage(data: unknown): string {
  if (!data || typeof data !== 'object') {
    return 'Approved — crawling started automatically.';
  }
  const d = data as Record<string, unknown>;
  const approved = Array.isArray(d.approved) ? d.approved.length : undefined;
  const skipped = Array.isArray(d.skipped) ? d.skipped.length : undefined;
  if (approved === undefined) {
    return 'Approved — crawling started automatically.';
  }
  let msg = `Approved ${approved} candidate${approved === 1 ? '' : 's'} — crawling started automatically.`;
  if (skipped) {
    msg += ` ${skipped} skipped (not yet validated).`;
  }
  return msg;
}

// Discovery Queue — every candidate moving through the pipeline (New ->
// Validated -> Needs Review / Duplicate / Rejected -> Approved For Crawl ->
// Crawled). Search, filters, bulk actions, and pagination live inline here,
// matching every other queue-style page in wp-admin (Publishing Queue,
// Import Queue) rather than being separate routes.
export default function WpAdminDiscoveryQueuePage() {
  const [searchInput, setSearchInput] = useState('');
  const [search, setSearch] = useState('');
  const [statusFilter, setStatusFilter] = useState('all');
  const [page, setPage] = useState(1);
  const [expandedId, setExpandedId] = useState<string | null>(null);
  const [selected, setSelected] = useState<Set<string>>(new Set());
  const [bulkBusy, setBulkBusy] = useState(false);
  const [bulkMessage, setBulkMessage] = useState<string | null>(null);

  useEffect(() => {
    const timer = setTimeout(() => setSearch(searchInput.trim()), DEBOUNCE_MS);
    return () => clearTimeout(timer);
  }, [searchInput]);

  useEffect(() => { setPage(1); setSelected(new Set()); }, [search, statusFilter]);
  useEffect(() => { setSelected(new Set()); }, [page]);

  const listPath = () => {
    const params = new URLSearchParams();
    params.set('page', String(page));
    params.set('per_page', String(PER_PAGE));
    params.set('sort', 'created_at');
    params.set('dir', 'desc');
    if (search) params.set('q', search);
    if (statusFilter !== 'all') params.set('status', statusFilter);
    return `admin-discovery-queue?${params.toString()}`;
  };

  const { data, isLoading, isError, error, refetch } = useAdminFetch<ListResponse>(listPath);
  const { mutate: bulkAction } = useAdminMutation<MutateResponse, Record<string, unknown>>('admin-discovery-queue', 'POST');
  const { mutate: approveAction } = useAdminMutation<MutateResponse, Record<string, unknown>>('admin-discovery-queue', 'POST');
  const { mutate: crawlAction } = useAdminMutation<MutateResponse, Record<string, unknown>>('admin-crawl-jobs', 'POST');
  const [crawlBusyId, setCrawlBusyId] = useState<string | null>(null);
  const [crawlMessage, setCrawlMessage] = useState<string | null>(null);
  const [approveBusyId, setApproveBusyId] = useState<string | null>(null);

  const rows = data?.data || [];
  const total = data?.total || 0;
  const totalPages = Math.max(1, Math.ceil(total / PER_PAGE));
  const allSelected = rows.length > 0 && rows.every((r) => selected.has(r.id));
  const anyActiveCrawl = rows.some((r) => r.latest_crawl_job && CRAWL_ACTIVE_STATUSES.includes(r.latest_crawl_job.status));

  async function handleStartCrawl(candidateId: string) {
    setCrawlBusyId(candidateId);
    setCrawlMessage(null);
    const result = await crawlAction({ action: 'start', discovery_candidate_id: candidateId });
    setCrawlBusyId(null);
    if (result.ok) {
      setCrawlMessage('Crawl completed — extraction ready for review.');
    } else {
      setCrawlMessage(result.error?.message || 'Failed to start crawl.');
    }
    refetch();
  }

  async function handleRetryCrawl(jobId: string, candidateId: string) {
    setCrawlBusyId(candidateId);
    setCrawlMessage(null);
    const result = await crawlAction({ action: 'retry', id: jobId });
    setCrawlBusyId(null);
    if (!result.ok) setCrawlMessage(result.error?.message || 'Failed to retry crawl.');
    refetch();
  }

  async function handleApprove(candidateId: string) {
    setApproveBusyId(candidateId);
    setCrawlMessage(null);
    const result = await approveAction({ action: 'approve', id: candidateId });
    setApproveBusyId(null);
    if (result.ok) {
      setCrawlMessage(buildApproveMessage(result.data));
    } else {
      setCrawlMessage(result.error?.message || 'Failed to approve.');
    }
    refetch();
  }

  function toggleExpanded(id: string) {
    setExpandedId((prev) => (prev === id ? null : id));
  }

  function toggleAll() {
    setSelected((prev) => {
      if (allSelected) return new Set();
      const next = new Set(prev);
      rows.forEach((r) => next.add(r.id));
      return next;
    });
  }

  function toggleOne(id: string) {
    setSelected((prev) => {
      const next = new Set(prev);
      if (next.has(id)) next.delete(id);
      else next.add(id);
      return next;
    });
  }

  async function runBulk(body: Record<string, unknown>, label: string) {
    setBulkBusy(true);
    setBulkMessage(null);
    const result = await bulkAction({ ...body, ids: Array.from(selected) });
    setBulkBusy(false);
    if (result.ok) {
      setBulkMessage(body.action === 'bulk-approve' ? buildApproveMessage(result.data) : `${label} complete.`);
      setSelected(new Set());
      refetch();
    } else {
      setBulkMessage(result.error?.message || `Failed to ${label.toLowerCase()}.`);
    }
  }

  const emptyMessage = statusFilter === 'all'
    ? 'No candidates yet — add one manually or import a CSV to get started.'
    : 'No candidates match this filter.';

  return (
    <WpAdminLayout title="Discovery Queue" subtitle="Every discovered candidate and where it stands in the pipeline">
      <div className="max-w-7xl mx-auto">
        <div className="mb-6 flex items-center justify-between">
          <div>
            <h1 className="text-2xl font-bold text-gray-900">Discovery Queue</h1>
            <p className="text-gray-500 mt-1 text-sm">{total.toLocaleString()} candidate{total === 1 ? '' : 's'}</p>
          </div>
          <Link to="/wp-admin/discovery/import" className="inline-flex items-center gap-1.5 px-3 py-2 text-sm font-medium bg-gray-900 text-white rounded-lg hover:bg-gray-800 transition">
            Discover Software
          </Link>
        </div>

        <div className="bg-white border border-gray-200 rounded-lg p-4 mb-4 flex flex-wrap gap-3">
          <div className="flex-1 min-w-[200px] relative">
            <Search className="w-4 h-4 text-gray-400 absolute left-3 top-1/2 -translate-y-1/2" />
            <input
              type="text"
              value={searchInput}
              onChange={(e) => setSearchInput(e.target.value)}
              placeholder="Search by name, hostname, or website..."
              className="w-full pl-9 pr-3 py-2 text-sm border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
            />
          </div>
          <div className="flex flex-wrap items-center gap-1.5">
            {STATUS_CHIPS.map((s) => (
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
        </div>

        {selected.size > 0 && (
          <div className="bg-blue-50 border border-blue-200 rounded-lg p-3 mb-4 flex flex-wrap items-center gap-3">
            <span className="inline-flex items-center gap-1.5 text-sm font-medium text-blue-800">
              <Layers className="w-4 h-4" />
              {selected.size} selected
            </span>
            <div className="flex flex-wrap items-center gap-2 ml-auto">
              <button
                disabled={bulkBusy}
                onClick={() => runBulk({ action: 'bulk-approve' }, 'Approve')}
                className="text-xs font-medium px-2.5 py-1.5 rounded-lg bg-white border border-emerald-200 text-emerald-700 hover:bg-emerald-50 disabled:opacity-50"
              >
                Approve For Crawl
              </button>
              <button
                disabled={bulkBusy}
                onClick={() => runBulk({ action: 'bulk-status', status: 'needs_review' }, 'Send to review')}
                className="text-xs font-medium px-2.5 py-1.5 rounded-lg bg-white border border-amber-200 text-amber-700 hover:bg-amber-50 disabled:opacity-50"
              >
                Needs Review
              </button>
              <button
                disabled={bulkBusy}
                onClick={() => runBulk({ action: 'bulk-status', status: 'rejected' }, 'Reject')}
                className="text-xs font-medium px-2.5 py-1.5 rounded-lg bg-white border border-red-200 text-red-600 hover:bg-red-50 disabled:opacity-50"
              >
                Reject
              </button>
              <button
                disabled={bulkBusy}
                onClick={() => runBulk({ action: 'revalidate' }, 'Revalidate')}
                className="inline-flex items-center gap-1 text-xs font-medium px-2.5 py-1.5 rounded-lg bg-white border border-blue-200 text-blue-700 hover:bg-blue-100 disabled:opacity-50"
              >
                <RefreshCw className="w-3.5 h-3.5" />
                Revalidate
              </button>
              <button
                disabled={bulkBusy}
                onClick={() => runBulk({ action: 'bulk-delete' }, 'Delete')}
                className="text-xs font-medium px-2.5 py-1.5 rounded-lg bg-white border border-red-200 text-red-600 hover:bg-red-50 disabled:opacity-50"
              >
                Delete
              </button>
            </div>
          </div>
        )}

        {bulkMessage && (
          <div className="bg-gray-50 border border-gray-200 rounded-lg p-3 mb-4 text-sm text-gray-700">{bulkMessage}</div>
        )}
        {crawlMessage && (
          <div className="bg-gray-50 border border-gray-200 rounded-lg p-3 mb-4 text-sm text-gray-700">{crawlMessage}</div>
        )}

        {isError && error && <AdminErrorBanner error={error} onRetry={refetch} className="mb-6" />}
        {isLoading && <AdminLoadingState message="Loading discovery queue..." />}

        {!isLoading && !isError && rows.length === 0 && (
          <AdminEmptyState icon={ListChecks} title="Nothing here" message={emptyMessage} />
        )}

        {!isLoading && rows.length > 0 && (
          <>
            <div className="bg-white border border-gray-200 rounded-lg overflow-hidden overflow-x-auto">
              <table className="w-full">
                <thead className="bg-gray-50 border-b border-gray-200">
                  <tr>
                    <th className="px-5 py-3 w-10">
                      <input type="checkbox" checked={allSelected} onChange={toggleAll} className="rounded border-gray-300" />
                    </th>
                    <th className="text-left px-5 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">Candidate</th>
                    <th className="text-left px-5 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">Source</th>
                    <th className="text-left px-5 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">Status</th>
                    <th className="text-left px-5 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">Confidence</th>
                    <th className="text-left px-5 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">Quality</th>
                    <th className="text-left px-5 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">Found</th>
                    <th className="text-left px-5 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">Crawl</th>
                    <th className="text-right px-5 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">Actions</th>
                  </tr>
                </thead>
                <tbody className="divide-y divide-gray-100">
                  {rows.map((row) => {
                    const isExpanded = expandedId === row.id;
                    const isSelected = selected.has(row.id);
                    const notes = row.validation_notes || {};
                    return (
                      <Fragment key={row.id}>
                        <tr className={`hover:bg-gray-50 transition-colors ${isSelected ? 'bg-blue-50/50' : ''}`}>
                          <td className="px-5 py-3.5">
                            <input type="checkbox" checked={isSelected} onChange={() => toggleOne(row.id)} className="rounded border-gray-300" />
                          </td>
                          <td className="px-5 py-3.5">
                            <div className="flex items-center gap-3">
                              {row.logo_url ? (
                                <img src={row.logo_url} alt="" className="w-8 h-8 rounded-lg object-contain border border-gray-100 bg-white shrink-0" />
                              ) : (
                                <div className="w-8 h-8 rounded-lg bg-gray-100 flex items-center justify-center text-gray-400 font-semibold text-xs shrink-0">
                                  {row.name.charAt(0)}
                                </div>
                              )}
                              <div className="min-w-0">
                                <p className="font-semibold text-gray-900 text-sm truncate">{row.name}</p>
                                <a href={row.official_website} target="_blank" rel="noopener noreferrer" className="inline-flex items-center gap-1 text-xs text-blue-600 hover:underline truncate max-w-xs">
                                  {row.hostname || row.official_website} <ExternalLink className="w-3 h-3 shrink-0" />
                                </a>
                              </div>
                            </div>
                          </td>
                          <td className="px-5 py-3.5 text-sm text-gray-600">
                            <p>{row.discovery_providers?.name || '—'}</p>
                            <p className="text-xs text-gray-400">{row.tool_categories?.name || 'Uncategorized'}</p>
                          </td>
                          <td className="px-5 py-3.5">
                            <span className={`inline-flex items-center px-2 py-0.5 rounded text-xs font-medium ${discoveryStatusBadgeClass(row.status)}`}>
                              {discoveryStatusLabel(row.status)}
                            </span>
                          </td>
                          <td className="px-5 py-3.5">
                            <span className={`inline-flex items-center px-2 py-0.5 rounded text-xs font-medium ${scoreBadgeClass(row.confidence_score)}`}>
                              {row.confidence_score ?? '—'}
                            </span>
                          </td>
                          <td className="px-5 py-3.5">
                            <span className={`inline-flex items-center px-2 py-0.5 rounded text-xs font-medium ${scoreBadgeClass(row.quality_score)}`}>
                              {row.quality_score ?? '—'}
                            </span>
                          </td>
                          <td className="px-5 py-3.5 text-sm text-gray-500">{formatDate(row.created_at)}</td>
                          <td className="px-5 py-3.5">
                            {(() => {
                              const job = row.latest_crawl_job;
                              const isBusy = crawlBusyId === row.id;
                              const isApproving = approveBusyId === row.id;
                              if (isApproving) {
                                return (
                                  <span className="inline-flex items-center gap-1.5 text-xs text-gray-500">
                                    <Loader2 className="w-3.5 h-3.5 animate-spin" /> Approving…
                                  </span>
                                );
                              }
                              if (isBusy) {
                                return (
                                  <span className="inline-flex items-center gap-1.5 text-xs text-gray-500">
                                    <Loader2 className="w-3.5 h-3.5 animate-spin" /> Crawling…
                                  </span>
                                );
                              }
                              if (!job) {
                                if (row.status === 'approved_for_crawl') {
                                  return (
                                    <button
                                      onClick={() => handleStartCrawl(row.id)}
                                      disabled={anyActiveCrawl}
                                      title={anyActiveCrawl ? 'Another crawl is already in progress' : 'Start crawl'}
                                      className="inline-flex items-center gap-1 text-xs font-medium px-2 py-1 rounded bg-emerald-50 text-emerald-700 hover:bg-emerald-100 disabled:opacity-50 disabled:cursor-not-allowed"
                                    >
                                      <Play className="w-3.5 h-3.5" /> Start Crawl
                                    </button>
                                  );
                                }
                                if (row.status === 'validated') {
                                  return (
                                    <button
                                      onClick={() => handleApprove(row.id)}
                                      disabled={anyActiveCrawl}
                                      title={anyActiveCrawl ? 'Another crawl is already in progress' : 'Approve — crawling starts automatically'}
                                      className="inline-flex items-center gap-1 text-xs font-medium px-2 py-1 rounded bg-emerald-50 text-emerald-700 hover:bg-emerald-100 disabled:opacity-50 disabled:cursor-not-allowed"
                                    >
                                      <Play className="w-3.5 h-3.5" /> Approve
                                    </button>
                                  );
                                }
                                return <span className="text-gray-300 text-sm">—</span>;
                              }
                              if (job.created_draft_tool_id) {
                                return (
                                  <Link to={`/wp-admin/tools/${job.created_draft_tool_id}/edit`} className="inline-flex items-center gap-1 text-xs font-medium text-blue-700 hover:underline">
                                    <PencilLine className="w-3.5 h-3.5" /> View Draft
                                  </Link>
                                );
                              }
                              if (job.status === 'needs_review') {
                                return (
                                  <Link to={`/wp-admin/discovery/crawl/${job.id}`} className="inline-flex items-center gap-1 text-xs font-medium px-2 py-1 rounded bg-violet-50 text-violet-700 hover:bg-violet-100">
                                    <FileSearch className="w-3.5 h-3.5" /> Review Extraction
                                  </Link>
                                );
                              }
                              if (job.status === 'failed') {
                                return (
                                  <div className="flex items-center gap-1.5">
                                    <span className={`inline-flex items-center px-2 py-0.5 rounded text-xs font-medium ${crawlJobStatusBadgeClass(job.status)}`}>{crawlJobStatusLabel(job.status)}</span>
                                    <button
                                      onClick={() => handleRetryCrawl(job.id, row.id)}
                                      disabled={anyActiveCrawl}
                                      title={job.error_message || 'Retry'}
                                      className="inline-flex items-center gap-1 text-xs font-medium px-1.5 py-1 rounded text-blue-700 hover:bg-blue-50 disabled:opacity-50"
                                    >
                                      <RotateCcw className="w-3.5 h-3.5" />
                                    </button>
                                  </div>
                                );
                              }
                              return (
                                <span className={`inline-flex items-center px-2 py-0.5 rounded text-xs font-medium ${crawlJobStatusBadgeClass(job.status)}`}>
                                  {crawlJobStatusLabel(job.status)}
                                </span>
                              );
                            })()}
                          </td>
                          <td className="px-5 py-3.5">
                            <div className="flex items-center justify-end gap-1">
                              <button
                                onClick={() => toggleExpanded(row.id)}
                                className="inline-flex items-center gap-1 p-1.5 text-gray-500 hover:text-blue-600 hover:bg-blue-50 rounded transition"
                                title="View validation details"
                              >
                                {isExpanded ? <ChevronUp className="w-4 h-4" /> : <ChevronDown className="w-4 h-4" />}
                              </button>
                            </div>
                          </td>
                        </tr>
                        {isExpanded && (
                          <tr className="bg-gray-50">
                            <td colSpan={9} className="px-5 py-4">
                              <div className="grid sm:grid-cols-3 gap-4">
                                <div>
                                  <p className="text-xs font-semibold text-gray-600 uppercase tracking-wide mb-1.5">Candidate info</p>
                                  <ul className="text-sm text-gray-700 space-y-1">
                                    <li>Slug: {row.slug}</li>
                                    <li>Source URL: {row.source_url || '—'}</li>
                                    <li>Duplicate score: {row.duplicate_score ?? '—'}</li>
                                    <li>Description: {row.short_description || '—'}</li>
                                  </ul>
                                </div>
                                <div>
                                  <p className="text-xs font-semibold text-gray-600 uppercase tracking-wide mb-1.5">Validation checks</p>
                                  <ul className="text-sm text-gray-700 space-y-1">
                                    {['https', 'reachable', 'robots_txt', 'sitemap_xml', 'favicon'].map((key) => (
                                      <li key={key} className="flex items-center gap-1.5">
                                        <span className={`w-1.5 h-1.5 rounded-full shrink-0 ${notes[key] ? 'bg-emerald-500' : 'bg-gray-300'}`} />
                                        {key.replace(/_/g, ' ')}: {String(notes[key] ?? 'unknown')}
                                      </li>
                                    ))}
                                  </ul>
                                </div>
                                <div>
                                  <p className="text-xs font-semibold text-gray-600 uppercase tracking-wide mb-1.5">Flags</p>
                                  <ul className="text-sm text-gray-700 space-y-1">
                                    <li className="flex items-center gap-1.5">
                                      <span className={`w-1.5 h-1.5 rounded-full shrink-0 ${notes.dead_domain ? 'bg-red-500' : 'bg-gray-300'}`} />
                                      Dead domain: {String(notes.dead_domain ?? 'unknown')}
                                    </li>
                                    <li className="flex items-center gap-1.5">
                                      <span className={`w-1.5 h-1.5 rounded-full shrink-0 ${notes.parked_domain ? 'bg-red-500' : 'bg-gray-300'}`} />
                                      Parked domain: {String(notes.parked_domain ?? 'unknown')}
                                    </li>
                                    {notes.error ? <li className="text-red-600">Error: {String(notes.error)}</li> : null}
                                  </ul>
                                </div>
                              </div>
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
              <p className="text-sm text-gray-500">Page {page} of {totalPages} &middot; {total.toLocaleString()} candidate{total === 1 ? '' : 's'}</p>
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
