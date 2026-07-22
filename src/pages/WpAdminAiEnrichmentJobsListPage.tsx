import { useLocation, Link } from 'react-router-dom';
import { ShieldAlert, CheckCircle2, XCircle, History, ArrowRight } from 'lucide-react';
import WpAdminLayout from '../components/wpadmin/WpAdminLayout';
import { useAdminFetch } from '../hooks/useAdminFetch';
import { AdminErrorBanner, AdminLoadingState, AdminEmptyState } from '../components/admin/AdminErrorBanner';
import { enrichmentJobStatusBadgeClass, enrichmentJobStatusLabel } from '../utils/enrichmentStatus';

interface JobRow {
  id: string;
  tool_id: string;
  batch_id: string;
  status: string;
  generation_version: number;
  error_message: string | null;
  created_at: string;
  completed_at: string | null;
  tools: { id: string; name: string; slug: string } | null;
}

interface JobsResponse {
  ok: boolean;
  data: JobRow[];
  total: number;
}

const STAGE_PRESETS: Record<string, { title: string; subtitle: string; status: string | null; icon: typeof ShieldAlert; empty: string }> = {
  '/wp-admin/ai-enrichment/needs-review': {
    title: 'Needs Review', subtitle: 'Enrichment jobs with suggestions awaiting a decision', status: 'needs_review', icon: ShieldAlert,
    empty: 'Nothing needs review right now.',
  },
  '/wp-admin/ai-enrichment/completed': {
    title: 'Completed', subtitle: 'Jobs whose approved fields were applied to the Tool Draft', status: 'applied', icon: CheckCircle2,
    empty: 'No applied jobs yet.',
  },
  '/wp-admin/ai-enrichment/failed': {
    title: 'Failed', subtitle: 'Export, import, or validation failures', status: 'failed', icon: XCircle,
    empty: 'No failures — nice.',
  },
  '/wp-admin/ai-enrichment/history': {
    title: 'Generation History', subtitle: 'Every enrichment job, across every tool and regeneration', status: null, icon: History,
    empty: 'No enrichment jobs yet.',
  },
};

export default function WpAdminAiEnrichmentJobsListPage() {
  const location = useLocation();
  const preset = STAGE_PRESETS[location.pathname] || STAGE_PRESETS['/wp-admin/ai-enrichment/history'];

  const { data, isLoading, isError, error, refetch } = useAdminFetch<JobsResponse>(
    `admin-enrichment-jobs${preset.status ? `?status=${preset.status}` : ''}`,
  );
  const jobs = data?.data || [];

  return (
    <WpAdminLayout title={preset.title} subtitle={preset.subtitle}>
      <div className="max-w-5xl mx-auto">
        {isError && error && <AdminErrorBanner error={error} onRetry={refetch} className="mb-4" />}
        {isLoading && <AdminLoadingState message="Loading jobs..." />}
        {!isLoading && !isError && jobs.length === 0 && <AdminEmptyState icon={preset.icon} title="All clear" message={preset.empty} />}

        {!isLoading && !isError && jobs.length > 0 && (
          <div className="bg-white border border-gray-200 rounded-lg divide-y divide-gray-100">
            {jobs.map((j) => (
              <div key={j.id} className="flex items-center justify-between gap-3 p-3">
                <div className="min-w-0">
                  <div className="flex items-center gap-2">
                    <p className="text-sm font-medium text-gray-900 truncate">{j.tools?.name || j.tool_id}</p>
                    <span className="text-xs text-gray-400">v{j.generation_version}</span>
                  </div>
                  {j.error_message && <p className="text-xs text-red-600 mt-0.5 truncate">{j.error_message}</p>}
                  <p className="text-xs text-gray-400 mt-0.5">{new Date(j.created_at).toLocaleString()}</p>
                </div>
                <div className="flex items-center gap-2 shrink-0">
                  <span className={`text-xs px-2 py-0.5 rounded-full ${enrichmentJobStatusBadgeClass(j.status)}`}>{enrichmentJobStatusLabel(j.status)}</span>
                  <Link
                    to={j.status === 'needs_review' ? `/wp-admin/ai-enrichment/jobs/${j.id}` : `/wp-admin/ai-enrichment/batches/${j.batch_id}`}
                    className="inline-flex items-center gap-1 text-xs font-semibold text-blue-600 hover:underline"
                  >
                    {j.status === 'needs_review' ? 'Review' : 'View'} <ArrowRight className="w-3 h-3" />
                  </Link>
                </div>
              </div>
            ))}
          </div>
        )}
      </div>
    </WpAdminLayout>
  );
}
