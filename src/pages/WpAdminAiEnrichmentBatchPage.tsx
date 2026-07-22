import { useState } from 'react';
import { useParams, Link } from 'react-router-dom';
import { Copy, Download, Check, ArrowRight, Zap } from 'lucide-react';
import WpAdminLayout from '../components/wpadmin/WpAdminLayout';
import { useAdminFetch, useAdminMutation } from '../hooks/useAdminFetch';
import { AdminErrorBanner, AdminLoadingState } from '../components/admin/AdminErrorBanner';
import { enrichmentBatchStatusBadgeClass, enrichmentBatchStatusLabel, enrichmentJobStatusBadgeClass, enrichmentJobStatusLabel } from '../utils/enrichmentStatus';

interface ExportPackage {
  master_prompt: string;
  combined_markdown: string;
}

interface BatchDetail {
  id: string;
  status: string;
  tool_ids: string[];
  export_package: ExportPackage | null;
  import_warnings: { tool_id: string | null; field_key: string | null; reason: string }[] | null;
  created_at: string;
}

interface JobRow {
  id: string;
  tool_id: string;
  status: string;
  error_message: string | null;
  tools: { id: string; name: string; slug: string } | null;
}

interface BatchGetResponse {
  ok: boolean;
  data: { batch: BatchDetail; jobs: JobRow[] };
}

export default function WpAdminAiEnrichmentBatchPage() {
  const { id } = useParams<{ id: string }>();
  const { data, isLoading, isError, error, refetch } = useAdminFetch<BatchGetResponse>(() => (id ? `admin-enrichment-batches?id=${id}` : null));
  const [copied, setCopied] = useState(false);
  const [rawResult, setRawResult] = useState('');

  const { mutate: mutateExport, isLoading: isExporting, errorMessage: exportError } = useAdminMutation('admin-enrichment-export');
  const { mutate: mutateImport, isLoading: isImporting, errorMessage: importError } = useAdminMutation('admin-enrichment-import');

  const batch = data?.data.batch;
  const jobs = data?.data.jobs || [];

  const handleExport = async () => {
    if (!id) return;
    const result = await mutateExport({ batch_id: id });
    if (result.ok) refetch();
  };

  const handleCopy = () => {
    if (!batch?.export_package) return;
    navigator.clipboard.writeText(batch.export_package.combined_markdown).then(() => {
      setCopied(true);
      setTimeout(() => setCopied(false), 2000);
    });
  };

  const handleDownload = () => {
    if (!batch?.export_package) return;
    const blob = new Blob([batch.export_package.combined_markdown], { type: 'text/markdown' });
    const url = URL.createObjectURL(blob);
    const a = document.createElement('a');
    a.href = url;
    a.download = `gappsy-ai-enrichment-batch-${batch.id.slice(0, 8)}.md`;
    a.click();
    URL.revokeObjectURL(url);
  };

  const handleImport = async () => {
    if (!id || !rawResult.trim()) return;
    const result = await mutateImport({ batch_id: id, raw_result: rawResult });
    if (result.ok) {
      setRawResult('');
      refetch();
    }
  };

  return (
    <WpAdminLayout title="Enrichment Batch" subtitle={id ? id.slice(0, 8) : ''}>
      <div className="max-w-5xl mx-auto">
        {isError && error && <AdminErrorBanner error={error} onRetry={refetch} className="mb-4" />}
        {isLoading && <AdminLoadingState message="Loading batch..." />}

        {batch && (
          <div className="space-y-6">
            <div className="flex flex-wrap items-center justify-between gap-3">
              <div>
                <h1 className="text-xl font-bold text-gray-900">Batch {batch.id.slice(0, 8)}</h1>
                <p className="text-sm text-gray-500">{batch.tool_ids.length} tool(s) · created {new Date(batch.created_at).toLocaleString()}</p>
              </div>
              <span className={`text-xs px-3 py-1 rounded-full font-semibold ${enrichmentBatchStatusBadgeClass(batch.status)}`}>
                {enrichmentBatchStatusLabel(batch.status)}
              </span>
            </div>

            {batch.status === 'queued' && (
              <div className="bg-white border border-gray-200 rounded-lg p-6 text-center">
                <p className="text-sm text-gray-600 mb-4">Build the Claude Code batch package for these {batch.tool_ids.length} tool(s).</p>
                {exportError && <AdminErrorBanner error={{ code: 'server_error', message: exportError, retryable: true }} className="mb-4 text-left" />}
                <button onClick={handleExport} disabled={isExporting} className="inline-flex items-center gap-2 bg-gray-900 text-white px-5 py-2.5 rounded-lg font-semibold hover:bg-gray-800 transition text-sm disabled:opacity-40">
                  <Zap className="w-4 h-4" />
                  {isExporting ? 'Building package…' : 'Build export package'}
                </button>
              </div>
            )}

            {batch.export_package && (
              <div className="bg-white border border-gray-200 rounded-lg p-4">
                <div className="flex flex-wrap items-center justify-between gap-2 mb-3">
                  <h2 className="font-semibold text-gray-900 text-sm">Claude Code batch package</h2>
                  <div className="flex gap-2">
                    <button onClick={handleCopy} className="inline-flex items-center gap-1.5 px-3 py-1.5 border border-gray-200 rounded-lg text-xs font-semibold text-gray-700 hover:bg-gray-50">
                      {copied ? <Check className="w-3.5 h-3.5 text-emerald-600" /> : <Copy className="w-3.5 h-3.5" />}
                      {copied ? 'Copied' : 'Copy'}
                    </button>
                    <button onClick={handleDownload} className="inline-flex items-center gap-1.5 px-3 py-1.5 border border-gray-200 rounded-lg text-xs font-semibold text-gray-700 hover:bg-gray-50">
                      <Download className="w-3.5 h-3.5" />
                      Download
                    </button>
                  </div>
                </div>
                <p className="text-xs text-gray-500 mb-2">Paste this whole document into a new Claude Code conversation, then paste only its JSON result below.</p>
                <pre className="bg-gray-50 border border-gray-100 rounded-lg p-3 text-xs text-gray-700 overflow-x-auto max-h-64 whitespace-pre-wrap">{batch.export_package.combined_markdown}</pre>
              </div>
            )}

            {(batch.status === 'exported' || batch.status === 'importing') && (
              <div className="bg-white border border-gray-200 rounded-lg p-4">
                <h2 className="font-semibold text-gray-900 text-sm mb-2">Import results</h2>
                <p className="text-xs text-gray-500 mb-2">Paste the JSON Claude Code returned. Malformed fields are dropped individually and reported — valid fields are still imported.</p>
                {importError && <AdminErrorBanner error={{ code: 'server_error', message: importError, retryable: true }} className="mb-3" />}
                <textarea
                  value={rawResult}
                  onChange={(e) => setRawResult(e.target.value)}
                  rows={10}
                  placeholder='{"batch_id": "...", "results": [...]}'
                  className="w-full border border-gray-200 rounded-lg p-3 text-xs font-mono focus:outline-none focus:ring-2 focus:ring-gray-900"
                />
                <div className="flex justify-end mt-3">
                  <button onClick={handleImport} disabled={isImporting || !rawResult.trim()} className="inline-flex items-center gap-2 bg-gray-900 text-white px-5 py-2.5 rounded-lg font-semibold hover:bg-gray-800 transition text-sm disabled:opacity-40">
                    {isImporting ? 'Importing…' : 'Import results'}
                  </button>
                </div>
              </div>
            )}

            {batch.import_warnings && batch.import_warnings.length > 0 && (
              <div className="bg-amber-50 border border-amber-200 rounded-lg p-4">
                <h2 className="font-semibold text-amber-800 text-sm mb-2">{batch.import_warnings.length} field(s) dropped during import</h2>
                <ul className="text-xs text-amber-700 space-y-1 max-h-40 overflow-y-auto">
                  {batch.import_warnings.map((w, i) => (
                    <li key={i}>{w.tool_id ? `${w.tool_id.slice(0, 8)} — ` : ''}{w.field_key ? `${w.field_key}: ` : ''}{w.reason}</li>
                  ))}
                </ul>
              </div>
            )}

            <div className="bg-white border border-gray-200 rounded-lg divide-y divide-gray-100">
              {jobs.map((j) => (
                <div key={j.id} className="flex items-center justify-between gap-3 p-3">
                  <div className="min-w-0">
                    <p className="text-sm font-medium text-gray-900 truncate">{j.tools?.name || j.tool_id}</p>
                    {j.error_message && <p className="text-xs text-red-600 mt-0.5">{j.error_message}</p>}
                  </div>
                  <div className="flex items-center gap-2 shrink-0">
                    <span className={`text-xs px-2 py-0.5 rounded-full ${enrichmentJobStatusBadgeClass(j.status)}`}>{enrichmentJobStatusLabel(j.status)}</span>
                    {j.status === 'needs_review' && (
                      <Link to={`/wp-admin/ai-enrichment/jobs/${j.id}`} className="inline-flex items-center gap-1 text-xs font-semibold text-blue-600 hover:underline">
                        Review <ArrowRight className="w-3 h-3" />
                      </Link>
                    )}
                  </div>
                </div>
              ))}
            </div>
          </div>
        )}
      </div>
    </WpAdminLayout>
  );
}
