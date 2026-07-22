import { Link } from 'react-router-dom';
import { Info, ShieldCheck, PencilLine } from 'lucide-react';
import WpAdminLayout from '../components/wpadmin/WpAdminLayout';
import { useAdminFetch } from '../hooks/useAdminFetch';
import { AdminErrorBanner, AdminLoadingState, AdminEmptyState } from '../components/admin/AdminErrorBanner';

interface SeoHealthTotals {
  missing_meta_title: number;
  missing_meta_description: number;
  missing_canonical: number;
  missing_schema: number;
  missing_screenshots: number;
  missing_faqs: number;
  missing_alternatives: number;
  not_sitemap_eligible: number;
}

interface SeoHealthOffender {
  id: string;
  slug: string;
  name: string;
  missing: string[];
  updated_at: string;
}

interface SeoHealthResponse {
  ok: boolean;
  data: {
    published_count: number;
    totals: SeoHealthTotals;
    worst_offenders: SeoHealthOffender[];
  };
}

// Order + labels for the stat-card grid. Keys must match `totals` from the
// admin-seo-health edge function exactly.
const TOTAL_CARDS: Array<{ key: keyof SeoHealthTotals; label: string }> = [
  { key: 'missing_meta_title', label: 'Missing Meta Title' },
  { key: 'missing_meta_description', label: 'Missing Meta Description' },
  { key: 'missing_canonical', label: 'Missing Canonical' },
  { key: 'missing_schema', label: 'Missing Schema' },
  { key: 'missing_screenshots', label: 'Missing Screenshots' },
  { key: 'missing_faqs', label: 'Missing FAQs' },
  { key: 'missing_alternatives', label: 'Missing Alternatives' },
  { key: 'not_sitemap_eligible', label: 'Not Sitemap-Eligible' },
];

function formatDate(iso: string): string {
  return new Date(iso).toLocaleDateString('en-US', { month: 'short', day: 'numeric', year: 'numeric' });
}

export default function WpAdminSeoHealthPage() {
  const { data, isLoading, isError, error, refetch } = useAdminFetch<SeoHealthResponse>('admin-seo-health');
  const health = data?.data;
  const publishedCount = health?.published_count ?? 0;
  const offenders = health?.worst_offenders ?? [];
  const isHealthy = !!health && publishedCount > 0 && offenders.length === 0;
  const noPublishedTools = !!health && publishedCount === 0;

  return (
    <WpAdminLayout title="SEO Health" subtitle="Database-level completeness checks across every published tool">
      <div className="max-w-7xl mx-auto">
        <div className="mb-6">
          <h1 className="text-2xl font-bold text-gray-900">SEO Health</h1>
          <p className="text-gray-500 mt-1 text-sm">
            Database-level completeness checks across every published tool
          </p>
        </div>

        <div className="rounded-xl bg-blue-50 border border-blue-200 p-4 mb-6">
          <div className="flex items-start gap-3">
            <Info className="w-5 h-5 text-blue-500 shrink-0 mt-0.5" />
            <div className="text-sm text-blue-900">
              <p className="font-medium">These checks only look at database records.</p>
              <p className="mt-1 text-blue-800">
                Screenshots, FAQ, and Alternatives checks look at the <code className="px-1 py-0.5 rounded bg-blue-100 text-blue-900 text-xs">tool_screenshots</code>,{' '}
                <code className="px-1 py-0.5 rounded bg-blue-100 text-blue-900 text-xs">tool_faqs</code>, and{' '}
                <code className="px-1 py-0.5 rounded bg-blue-100 text-blue-900 text-xs">tool_alternatives</code> tables only. Tools with hand-authored
                file-based content — most notably <strong>Canva</strong> and <strong>Figma</strong>, published before this CMS existed — may show as
                missing these even though their live page renders FAQ and Alternatives sections from{' '}
                <code className="px-1 py-0.5 rounded bg-blue-100 text-blue-900 text-xs">src/data/toolContent/</code> and works fine for visitors and
                crawlers. This is not a bug — it's an artifact of the DB-first, file-fallback content model this codebase supports. Verify on the
                public page before treating a flag on those tools as a real content gap.
              </p>
            </div>
          </div>
        </div>

        {isError && error && <AdminErrorBanner error={error} onRetry={refetch} className="mb-6" />}
        {isLoading && <AdminLoadingState message="Loading SEO health..." />}

        {!isLoading && !isError && health && (
          <div className="space-y-8">
            <div>
              <div className="flex items-center justify-between mb-3">
                <h2 className="text-xs font-semibold text-gray-500 uppercase tracking-wide">Summary</h2>
                <p className="text-xs text-gray-400">{publishedCount.toLocaleString()} published tool{publishedCount === 1 ? '' : 's'}</p>
              </div>
              <div className="grid grid-cols-2 sm:grid-cols-4 gap-3">
                {TOTAL_CARDS.map((card) => {
                  const count = health.totals[card.key];
                  const hasIssue = count > 0;
                  const pct = publishedCount > 0 ? Math.round((count / publishedCount) * 100) : null;
                  return (
                    <div
                      key={card.key}
                      className={`p-4 rounded-lg border ${
                        hasIssue ? 'bg-amber-50 border-amber-200' : 'bg-emerald-50 border-emerald-200'
                      }`}
                    >
                      <div className={`text-xl font-bold leading-none ${hasIssue ? 'text-amber-800' : 'text-emerald-800'}`}>
                        {count.toLocaleString()}
                      </div>
                      <div className={`text-xs mt-1.5 ${hasIssue ? 'text-amber-700' : 'text-emerald-700'}`}>{card.label}</div>
                      {pct !== null && (
                        <div className={`text-[11px] mt-1 ${hasIssue ? 'text-amber-500' : 'text-emerald-500'}`}>
                          {pct}% of published
                        </div>
                      )}
                    </div>
                  );
                })}
              </div>
            </div>

            <div>
              <h2 className="text-xs font-semibold text-gray-500 uppercase tracking-wide mb-3">Worst Offenders</h2>

              {noPublishedTools && (
                <AdminEmptyState
                  icon={ShieldCheck}
                  title="Nothing published yet"
                  message="SEO health will be measured once tools are published to the public site."
                />
              )}

              {isHealthy && (
                <AdminEmptyState
                  icon={ShieldCheck}
                  title="Every published tool is fully healthy"
                  message="No missing meta titles, descriptions, canonicals, schema, screenshots, FAQs, alternatives, or sitemap eligibility issues found."
                />
              )}

              {!noPublishedTools && offenders.length > 0 && (
                <div className="bg-white border border-gray-200 rounded-lg overflow-hidden overflow-x-auto">
                  <table className="w-full">
                    <thead className="bg-gray-50 border-b border-gray-200">
                      <tr>
                        <th className="text-left px-5 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">Tool</th>
                        <th className="text-left px-5 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">Missing</th>
                        <th className="text-left px-5 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">Updated</th>
                        <th className="text-right px-5 py-3 text-xs font-semibold text-gray-600 uppercase tracking-wide">Actions</th>
                      </tr>
                    </thead>
                    <tbody className="divide-y divide-gray-100">
                      {offenders.map((offender) => (
                        <tr key={offender.id} className="hover:bg-gray-50 transition-colors">
                          <td className="px-5 py-3.5">
                            <p className="font-semibold text-gray-900 text-sm">{offender.name}</p>
                            <p className="text-xs text-gray-400">{offender.slug}</p>
                          </td>
                          <td className="px-5 py-3.5">
                            <div className="flex flex-wrap gap-1 max-w-md">
                              {offender.missing.map((item) => (
                                <span
                                  key={item}
                                  className="inline-flex items-center px-1.5 py-0.5 rounded bg-amber-50 text-amber-700 text-[11px] font-medium"
                                >
                                  {item}
                                </span>
                              ))}
                            </div>
                          </td>
                          <td className="px-5 py-3.5 text-sm text-gray-500 whitespace-nowrap">{formatDate(offender.updated_at)}</td>
                          <td className="px-5 py-3.5">
                            <div className="flex items-center justify-end">
                              <Link
                                to={`/wp-admin/tools/${offender.id}/edit`}
                                className="inline-flex items-center gap-1 p-1.5 text-gray-500 hover:text-blue-600 hover:bg-blue-50 rounded transition"
                                title="Edit tool"
                              >
                                <PencilLine className="w-4 h-4" />
                              </Link>
                            </div>
                          </td>
                        </tr>
                      ))}
                    </tbody>
                  </table>
                </div>
              )}
            </div>
          </div>
        )}
      </div>
    </WpAdminLayout>
  );
}
