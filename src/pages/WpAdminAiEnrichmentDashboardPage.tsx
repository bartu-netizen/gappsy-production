import { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import { Zap, ListChecks, ShieldAlert, CheckCircle2, XCircle, History, SlidersHorizontal, FileEdit } from 'lucide-react';
import WpAdminLayout from '../components/wpadmin/WpAdminLayout';
import { useAdminFetch } from '../hooks/useAdminFetch';
import { AdminErrorBanner, AdminLoadingState } from '../components/admin/AdminErrorBanner';
import { adminApiFetch } from '../lib/adminApiFetch';

interface JobListResponse {
  ok: boolean;
  data: unknown[];
  total: number;
}

interface BatchRow {
  id: string;
  status: string;
  tool_ids: string[];
  created_at: string;
}

const SECTIONS: Array<{ label: string; description: string; href: string; icon: typeof ListChecks }> = [
  { label: 'AI Queue', description: 'Select Tool Drafts and export a Claude Code batch', href: '/wp-admin/ai-enrichment/queue', icon: ListChecks },
  { label: 'Needs Review', description: 'Suggestions awaiting approve/reject/edit', href: '/wp-admin/ai-enrichment/needs-review', icon: ShieldAlert },
  { label: 'Completed', description: 'Applied to their Tool Draft', href: '/wp-admin/ai-enrichment/completed', icon: CheckCircle2 },
  { label: 'Failed', description: 'Export/import/apply failures', href: '/wp-admin/ai-enrichment/failed', icon: XCircle },
  { label: 'Generation History', description: 'Every job, including regenerations', href: '/wp-admin/ai-enrichment/history', icon: History },
  { label: 'Prompt Versions', description: 'Versioned templates — never overwritten', href: '/wp-admin/ai-enrichment/prompts', icon: FileEdit },
  { label: 'Model Settings', description: 'Provider, confidence threshold, batch limits', href: '/wp-admin/ai-enrichment/settings', icon: SlidersHorizontal },
];

export default function WpAdminAiEnrichmentDashboardPage() {
  const { data: batches, isLoading: batchesLoading, isError: batchesError, error, refetch } = useAdminFetch<{ ok: boolean; data: BatchRow[] }>('admin-enrichment-batches');
  const [counts, setCounts] = useState<Record<string, number> | null>(null);

  useEffect(() => {
    let cancelled = false;
    (async () => {
      const statuses = ['queued', 'exported', 'needs_review', 'applied', 'failed'];
      const results = await Promise.all(
        statuses.map((s) => adminApiFetch<JobListResponse>(`admin-enrichment-jobs?status=${s}&page_size=1`)),
      );
      if (cancelled) return;
      const next: Record<string, number> = {};
      statuses.forEach((s, i) => {
        next[s] = results[i].ok ? (results[i].data?.total || 0) : 0;
      });
      setCounts(next);
    })();
    return () => { cancelled = true; };
  }, []);

  const statCards = counts
    ? [
        { label: 'In Progress', value: (counts.queued || 0) + (counts.exported || 0), href: '/wp-admin/ai-enrichment/queue', icon: Zap },
        { label: 'Needs Review', value: counts.needs_review || 0, href: '/wp-admin/ai-enrichment/needs-review', icon: ShieldAlert },
        { label: 'Applied', value: counts.applied || 0, href: '/wp-admin/ai-enrichment/completed', icon: CheckCircle2 },
        { label: 'Failed', value: counts.failed || 0, href: '/wp-admin/ai-enrichment/failed', icon: XCircle },
      ]
    : [];

  return (
    <WpAdminLayout title="AI Enrichment Dashboard" subtitle="Claude Code Batch workflow — Tool Draft → AI Enrichment → Human Review → Publishing Queue">
      <div className="max-w-7xl mx-auto">
        <div className="flex flex-wrap items-center justify-between gap-3 mb-6">
          <div>
            <h1 className="text-2xl font-bold text-gray-900">AI Enrichment</h1>
            <p className="text-gray-500 mt-1 text-sm">
              Export a batch, run it through your own Claude Code session, paste the result back, then review field-by-field. Nothing is ever applied automatically.
            </p>
          </div>
          <Link
            to="/wp-admin/ai-enrichment/queue"
            className="inline-flex items-center gap-2 bg-gray-900 text-white px-4 py-2 rounded-lg font-semibold hover:bg-gray-800 transition text-sm"
          >
            <Zap className="w-4 h-4" />
            Start a batch
          </Link>
        </div>

        {!counts && <AdminLoadingState message="Loading dashboard..." />}
        {counts && (
          <div className="grid grid-cols-2 sm:grid-cols-4 gap-3 mb-8">
            {statCards.map((card) => (
              <Link key={card.label} to={card.href} className="bg-white border border-gray-200 rounded-lg p-4 hover:border-gray-300 transition">
                <div className="flex items-center gap-2 text-gray-500 text-xs font-semibold uppercase tracking-wide mb-1">
                  <card.icon className="w-3.5 h-3.5" />
                  {card.label}
                </div>
                <div className="text-2xl font-bold text-gray-900">{card.value}</div>
              </Link>
            ))}
          </div>
        )}

        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-3 mb-8">
          {SECTIONS.map((s) => (
            <Link key={s.href} to={s.href} className="bg-white border border-gray-200 rounded-lg p-4 hover:border-gray-300 transition flex items-start gap-3">
              <s.icon className="w-5 h-5 text-purple-500 shrink-0 mt-0.5" />
              <div>
                <div className="font-semibold text-gray-900 text-sm">{s.label}</div>
                <div className="text-gray-500 text-xs mt-0.5">{s.description}</div>
              </div>
            </Link>
          ))}
        </div>

        <div className="bg-white border border-gray-200 rounded-lg p-4">
          <h2 className="font-semibold text-gray-900 text-sm mb-3">Recent batches</h2>
          {batchesError && error && <AdminErrorBanner error={error} onRetry={refetch} compact />}
          {batchesLoading && <AdminLoadingState message="Loading batches..." />}
          {!batchesLoading && !batchesError && (batches?.data || []).length === 0 && (
            <p className="text-sm text-gray-500">No batches yet — start one from the AI Queue.</p>
          )}
          {!batchesLoading && !batchesError && (batches?.data || []).length > 0 && (
            <div className="overflow-x-auto">
              <table className="w-full text-sm">
                <tbody>
                  {(batches?.data || []).slice(0, 8).map((b) => (
                    <tr key={b.id} className="border-t border-gray-100">
                      <td className="py-2 pr-3">
                        <Link to={`/wp-admin/ai-enrichment/batches/${b.id}`} className="text-blue-600 hover:underline font-medium">
                          {b.id.slice(0, 8)}
                        </Link>
                      </td>
                      <td className="py-2 pr-3 text-gray-500">{b.tool_ids?.length || 0} tool(s)</td>
                      <td className="py-2 pr-3 text-gray-500">{b.status}</td>
                      <td className="py-2 text-gray-400">{new Date(b.created_at).toLocaleString()}</td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          )}
        </div>
      </div>
    </WpAdminLayout>
  );
}
