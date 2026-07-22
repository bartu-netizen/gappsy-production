import { useEffect, useMemo, useState } from 'react';
import { useNavigate, useSearchParams } from 'react-router-dom';
import { Search, Zap, CheckSquare, Square, ChevronLeft, ChevronRight } from 'lucide-react';
import WpAdminLayout from '../components/wpadmin/WpAdminLayout';
import { useAdminFetch, useAdminMutation } from '../hooks/useAdminFetch';
import { AdminErrorBanner, AdminLoadingState, AdminEmptyState } from '../components/admin/AdminErrorBanner';
import { ALL_ENRICHMENT_FIELD_KEYS, BATCH_SIZE_PRESETS, ENRICHMENT_FIELDS } from '../lib/enrichmentFields';
import { enrichmentJobStatusBadgeClass, enrichmentJobStatusLabel } from '../utils/enrichmentStatus';
import { TOOL_STATUSES, toolStatusBadgeClass } from '../utils/toolStatus';

interface QueueTool {
  id: string;
  name: string;
  slug: string;
  status: string;
  short_description: string | null;
  latest_enrichment_job: { id: string; status: string; generation_version: number } | null;
}

interface QueueResponse {
  ok: boolean;
  data: QueueTool[];
  total: number;
}

const PER_PAGE = 25;

interface CreateBatchResponse {
  ok: boolean;
  data: { batch: { id: string } };
  error?: string;
  error_code?: string;
  blocked_tool_ids?: string[];
}

export default function WpAdminAiEnrichmentQueuePage() {
  const navigate = useNavigate();
  const [searchParams] = useSearchParams();
  const [search, setSearch] = useState('');
  const [statusFilter, setStatusFilter] = useState<string>('all');
  const [page, setPage] = useState(1);
  const [selected, setSelected] = useState<Set<string>>(new Set());
  const [selectedFields, setSelectedFields] = useState<Set<string>>(new Set(ALL_ENRICHMENT_FIELD_KEYS));

  useEffect(() => { setPage(1); }, [search, statusFilter]);

  const { data, isLoading, isError, error, refetch } = useAdminFetch<QueueResponse>(
    () => {
      const params = new URLSearchParams();
      if (search) params.set('search', search);
      if (statusFilter !== 'all') params.set('status', statusFilter);
      params.set('page', String(page));
      params.set('page_size', String(PER_PAGE));
      const qs = params.toString();
      return `admin-enrichment-queue?${qs}`;
    },
    { deps: [search, statusFilter, page] },
  );
  const tools = useMemo(() => data?.data || [], [data]);
  const total = data?.total || 0;
  const totalPages = Math.max(1, Math.ceil(total / PER_PAGE));

  useEffect(() => {
    const single = searchParams.get('tool_id');
    const multi = searchParams.get('tool_ids');
    if (multi) setSelected(new Set(multi.split(',').filter(Boolean)));
    else if (single) setSelected(new Set([single]));
  }, [searchParams]);

  const { mutate, isLoading: isCreating, errorMessage: createError } = useAdminMutation<CreateBatchResponse, unknown>('admin-enrichment-batches');

  const toggleTool = (id: string) => {
    setSelected((prev) => {
      const next = new Set(prev);
      if (next.has(id)) next.delete(id); else next.add(id);
      return next;
    });
  };

  const selectPreset = (n: number) => {
    const eligible = tools.filter((t) => !t.latest_enrichment_job || ['applied', 'failed', 'cancelled'].includes(t.latest_enrichment_job.status));
    setSelected(new Set(eligible.slice(0, n).map((t) => t.id)));
  };

  const toggleField = (key: string) => {
    setSelectedFields((prev) => {
      const next = new Set(prev);
      if (next.has(key)) next.delete(key); else next.add(key);
      return next;
    });
  };

  const handleCreateBatch = async () => {
    if (selected.size === 0) return;
    const requestedFields = selectedFields.size === ALL_ENRICHMENT_FIELD_KEYS.length ? [] : [...selectedFields];
    const result = await mutate({ tool_ids: [...selected], requested_fields: requestedFields } as unknown);
    if (result.ok && result.data?.data?.batch?.id) {
      navigate(`/wp-admin/ai-enrichment/batches/${result.data.data.batch.id}`);
    }
  };

  return (
    <WpAdminLayout title="AI Enrichment Queue" subtitle="Works on any tool — draft or published. Select tools and export a Claude Code batch package">
      <div className="max-w-6xl mx-auto">
        <div className="flex flex-wrap items-center gap-2 mb-4">
          <button
            onClick={() => setStatusFilter('all')}
            className={`px-3 py-1.5 rounded-full text-xs font-semibold border transition ${
              statusFilter === 'all' ? 'bg-gray-900 text-white border-gray-900' : 'bg-white text-gray-600 border-gray-200 hover:bg-gray-50'
            }`}
          >
            All statuses
          </button>
          {TOOL_STATUSES.map((s) => (
            <button
              key={s.value}
              onClick={() => setStatusFilter(s.value)}
              className={`px-3 py-1.5 rounded-full text-xs font-semibold border transition ${
                statusFilter === s.value ? 'bg-gray-900 text-white border-gray-900' : 'bg-white text-gray-600 border-gray-200 hover:bg-gray-50'
              }`}
            >
              {s.label}
            </button>
          ))}
        </div>

        <div className="flex flex-wrap items-center justify-between gap-3 mb-4">
          <div className="relative w-full sm:w-80">
            <Search className="w-4 h-4 text-gray-400 absolute left-3 top-1/2 -translate-y-1/2" />
            <input
              type="text"
              value={search}
              onChange={(e) => setSearch(e.target.value)}
              placeholder="Search tools..."
              className="w-full pl-9 pr-3 py-2 border border-gray-200 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-gray-900"
            />
          </div>
          <div className="flex flex-wrap items-center gap-2">
            {BATCH_SIZE_PRESETS.map((n) => (
              <button key={n} onClick={() => selectPreset(n)} className="px-3 py-1.5 border border-gray-200 rounded-lg text-xs font-semibold text-gray-700 hover:bg-gray-50">
                {n}
              </button>
            ))}
            <button onClick={() => setSelected(new Set(tools.map((t) => t.id)))} className="px-3 py-1.5 border border-gray-200 rounded-lg text-xs font-semibold text-gray-700 hover:bg-gray-50">
              All on page
            </button>
            <button onClick={() => setSelected(new Set())} className="px-3 py-1.5 border border-gray-200 rounded-lg text-xs font-semibold text-gray-700 hover:bg-gray-50">
              Clear
            </button>
          </div>
        </div>

        <div className="bg-white border border-gray-200 rounded-lg p-4 mb-4">
          <p className="text-xs font-semibold uppercase tracking-wide text-gray-500 mb-2">Fields to generate ({selectedFields.size === ALL_ENRICHMENT_FIELD_KEYS.length ? 'all' : selectedFields.size})</p>
          <div className="flex flex-wrap gap-2">
            {ENRICHMENT_FIELDS.map((f) => (
              <button
                key={f.key}
                onClick={() => toggleField(f.key)}
                className={`px-2.5 py-1 rounded-full text-xs font-medium border transition ${
                  selectedFields.has(f.key) ? 'bg-gray-900 text-white border-gray-900' : 'bg-white text-gray-600 border-gray-200 hover:bg-gray-50'
                }`}
              >
                {f.label}
              </button>
            ))}
          </div>
        </div>

        {isError && error && <AdminErrorBanner error={error} onRetry={refetch} className="mb-4" />}
        {isLoading && <AdminLoadingState message="Loading eligible tool drafts..." />}
        {!isLoading && !isError && tools.length === 0 && (
          <AdminEmptyState icon={Zap} title="Nothing to enrich" message="No tools match this filter." />
        )}

        {!isLoading && !isError && tools.length > 0 && (
          <div className="bg-white border border-gray-200 rounded-lg divide-y divide-gray-100 mb-4">
            {tools.map((t) => (
              <label key={t.id} className="flex items-start gap-3 p-3 cursor-pointer hover:bg-gray-50">
                <button type="button" onClick={() => toggleTool(t.id)} className="mt-0.5 shrink-0">
                  {selected.has(t.id) ? <CheckSquare className="w-4 h-4 text-gray-900" /> : <Square className="w-4 h-4 text-gray-300" />}
                </button>
                <div className="min-w-0 flex-1">
                  <div className="flex flex-wrap items-center gap-2">
                    <span className="font-medium text-gray-900 text-sm truncate">{t.name}</span>
                    <span className={`text-[10px] px-2 py-0.5 rounded-full font-semibold ${toolStatusBadgeClass(t.status)}`}>{t.status}</span>
                    {t.latest_enrichment_job && (
                      <span className={`text-xs px-2 py-0.5 rounded-full ${enrichmentJobStatusBadgeClass(t.latest_enrichment_job.status)}`}>
                        {enrichmentJobStatusLabel(t.latest_enrichment_job.status)} (v{t.latest_enrichment_job.generation_version})
                      </span>
                    )}
                  </div>
                  {t.short_description && <p className="text-xs text-gray-500 mt-1 line-clamp-1">{t.short_description}</p>}
                </div>
              </label>
            ))}
          </div>
        )}

        {!isLoading && !isError && tools.length > 0 && (
          <div className="flex items-center justify-between mb-4">
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
        )}

        {createError && <AdminErrorBanner error={{ code: 'server_error', message: createError, retryable: true }} className="mb-4" />}

        <div className="sticky bottom-4 flex justify-end">
          <button
            onClick={handleCreateBatch}
            disabled={selected.size === 0 || isCreating}
            className="inline-flex items-center gap-2 bg-gray-900 text-white px-5 py-2.5 rounded-lg font-semibold hover:bg-gray-800 transition text-sm disabled:opacity-40 disabled:cursor-not-allowed shadow-lg"
          >
            <Zap className="w-4 h-4" />
            {isCreating ? 'Creating batch…' : `Create & export batch (${selected.size})`}
          </button>
        </div>
      </div>
    </WpAdminLayout>
  );
}
