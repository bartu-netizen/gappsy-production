import { useState } from 'react';
import { Link } from 'react-router-dom';
import { ArrowLeft, ChevronLeft, ChevronRight, GitMerge, ExternalLink, Check, X, Loader2 } from 'lucide-react';
import WpAdminLayout from '../components/wpadmin/WpAdminLayout';
import { useAdminFetch, useAdminMutation } from '../hooks/useAdminFetch';
import { AdminErrorBanner, AdminLoadingState, AdminEmptyState } from '../components/admin/AdminErrorBanner';
import { scoreBadgeClass } from '../utils/discoveryStatus';

interface DuplicateRow {
  id: string;
  name: string;
  official_website: string;
  duplicate_score: number | null;
  created_at: string;
  duplicate_of_tool: { id: string; name: string; slug: string; website: string | null } | null;
  duplicate_of_discovery: { id: string; name: string; official_website: string } | null;
}

interface ListResponse { ok: boolean; data: DuplicateRow[]; total: number; }
interface ResolveResponse { ok: boolean; }

const PER_PAGE = 25;

// Every candidate currently flagged status='duplicate' — either an exact
// hostname match against a published tool, or a slug/hostname match against
// another pending candidate. An admin either confirms it (rejects the
// candidate outright) or overrides a false positive back into review.
export default function WpAdminDiscoveryDuplicatesPage() {
  const [page, setPage] = useState(1);
  const [busyId, setBusyId] = useState<string | null>(null);

  const listPath = () => `admin-discovery-duplicates?page=${page}&per_page=${PER_PAGE}`;
  const { data, isLoading, isError, error, refetch } = useAdminFetch<ListResponse>(listPath);
  const { mutate: resolve } = useAdminMutation<ResolveResponse, Record<string, unknown>>('admin-discovery-duplicates', 'POST');

  const rows = data?.data || [];
  const total = data?.total || 0;
  const totalPages = Math.max(1, Math.ceil(total / PER_PAGE));

  async function handleResolve(id: string, resolution: 'confirm' | 'not_a_duplicate') {
    setBusyId(id);
    await resolve({ action: 'resolve', id, resolution });
    setBusyId(null);
    refetch();
  }

  return (
    <WpAdminLayout title="Duplicate Manager" subtitle="Candidates flagged as likely duplicates of existing or pending tools">
      <div className="max-w-6xl mx-auto">
        <Link to="/wp-admin/discovery" className="inline-flex items-center gap-1.5 text-sm text-gray-500 hover:text-gray-700 mb-4">
          <ArrowLeft className="w-4 h-4" />
          Back to Discovery Dashboard
        </Link>

        <div className="mb-6">
          <h1 className="text-2xl font-bold text-gray-900">Duplicate Manager</h1>
          <p className="text-gray-500 mt-1 text-sm">{total.toLocaleString()} flagged candidate{total === 1 ? '' : 's'}</p>
        </div>

        {isError && error && <AdminErrorBanner error={error} onRetry={refetch} className="mb-6" />}
        {isLoading && <AdminLoadingState message="Loading duplicates..." />}

        {!isLoading && !isError && rows.length === 0 && (
          <AdminEmptyState icon={GitMerge} title="No duplicates flagged" message="Candidates matched against existing or pending tools will show up here." />
        )}

        {!isLoading && rows.length > 0 && (
          <>
            <div className="space-y-3">
              {rows.map((row) => {
                const matchedTool = row.duplicate_of_tool;
                const matchedCandidate = row.duplicate_of_discovery;
                const isBusy = busyId === row.id;
                return (
                  <div key={row.id} className="bg-white border border-gray-200 rounded-lg p-4">
                    <div className="flex flex-wrap items-start justify-between gap-3">
                      <div className="min-w-0">
                        <div className="flex items-center gap-2">
                          <p className="font-semibold text-gray-900 text-sm">{row.name}</p>
                          <span className={`inline-flex items-center px-2 py-0.5 rounded text-xs font-medium ${scoreBadgeClass(row.duplicate_score)}`}>
                            {row.duplicate_score ?? '—'}% match
                          </span>
                        </div>
                        <a href={row.official_website} target="_blank" rel="noopener noreferrer" className="inline-flex items-center gap-1 text-xs text-blue-600 hover:underline">
                          {row.official_website} <ExternalLink className="w-3 h-3 shrink-0" />
                        </a>
                        <p className="text-xs text-gray-500 mt-2">
                          Matched against: {matchedTool ? (
                            <span className="font-medium text-gray-700">{matchedTool.name} (published tool)</span>
                          ) : matchedCandidate ? (
                            <span className="font-medium text-gray-700">{matchedCandidate.name} (pending candidate)</span>
                          ) : (
                            <span className="text-gray-400">unknown</span>
                          )}
                        </p>
                      </div>
                      <div className="flex items-center gap-2 shrink-0">
                        <button
                          onClick={() => handleResolve(row.id, 'not_a_duplicate')}
                          disabled={isBusy}
                          className="inline-flex items-center gap-1 text-xs font-medium px-2.5 py-1.5 rounded-lg bg-white border border-blue-200 text-blue-700 hover:bg-blue-50 disabled:opacity-50"
                        >
                          {isBusy ? <Loader2 className="w-3.5 h-3.5 animate-spin" /> : <X className="w-3.5 h-3.5" />}
                          Not a Duplicate
                        </button>
                        <button
                          onClick={() => handleResolve(row.id, 'confirm')}
                          disabled={isBusy}
                          className="inline-flex items-center gap-1 text-xs font-medium px-2.5 py-1.5 rounded-lg bg-white border border-red-200 text-red-600 hover:bg-red-50 disabled:opacity-50"
                        >
                          {isBusy ? <Loader2 className="w-3.5 h-3.5 animate-spin" /> : <Check className="w-3.5 h-3.5" />}
                          Confirm &amp; Reject
                        </button>
                      </div>
                    </div>
                  </div>
                );
              })}
            </div>

            <div className="flex items-center justify-between mt-4">
              <p className="text-sm text-gray-500">Page {page} of {totalPages} &middot; {total.toLocaleString()} flagged</p>
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
