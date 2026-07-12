import { useMemo, useState } from 'react';
import { useParams, Link } from 'react-router-dom';
import { Check, X, Pencil, RotateCcw, ExternalLink, AlertTriangle, CheckSquare, Square, Zap } from 'lucide-react';
import WpAdminLayout from '../components/wpadmin/WpAdminLayout';
import { useAdminFetch, useAdminMutation } from '../hooks/useAdminFetch';
import { AdminErrorBanner, AdminLoadingState } from '../components/admin/AdminErrorBanner';
import { enrichmentFieldLabel, currentValueOf } from '../lib/enrichmentFields';
import { confidenceBand, enrichmentJobStatusBadgeClass, enrichmentJobStatusLabel, suggestionStatusBadgeClass, suggestionStatusLabel } from '../utils/enrichmentStatus';

interface Suggestion {
  id: string;
  enrichment_job_id: string;
  field_key: string;
  generated_value: unknown;
  confidence: number;
  reason: string | null;
  source_urls: string[];
  supporting_evidence: string | null;
  classification: 'factual' | 'editorial';
  unsupported: boolean;
  warnings: string[];
  review_status: 'pending' | 'approved' | 'rejected' | 'edited' | 'unsupported';
  approved_value: unknown;
  applied_to_tool: boolean;
}

interface JobDetail {
  id: string;
  tool_id: string;
  status: string;
  generation_version: number;
  tools: { id: string; name: string; slug: string; status: string } | null;
}

interface JobGetResponse {
  ok: boolean;
  data: { job: JobDetail; suggestions: Suggestion[] };
}

interface ToolGetResponse {
  ok: boolean;
  data: Record<string, unknown>;
}

interface ApplyOutcome {
  applied_field_keys: string[];
  conflicts: { field_key: string; current_value: unknown; new_value: unknown }[];
  skipped: { field_key: string; reason: string }[];
}

function renderValue(value: unknown): string {
  if (value === null || value === undefined || value === '') return '—';
  if (typeof value === 'string') return value;
  if (Array.isArray(value)) {
    if (value.length === 0) return '—';
    return value.map((v) => (typeof v === 'string' ? `• ${v}` : `• ${JSON.stringify(v)}`)).join('\n');
  }
  return JSON.stringify(value, null, 2);
}

export default function WpAdminAiEnrichmentReviewPage() {
  const { id: jobId } = useParams<{ id: string }>();
  const { data, isLoading, isError, error, refetch } = useAdminFetch<JobGetResponse>(() => (jobId ? `admin-enrichment-jobs?id=${jobId}` : null));
  const job = data?.data.job;
  const suggestions = useMemo(() => data?.data.suggestions || [], [data]);

  const { data: toolData, refetch: refetchTool } = useAdminFetch<ToolGetResponse>(() => (job ? `admin-tools?id=${job.tool_id}` : null), { enabled: !!job, deps: [job?.tool_id] });
  const currentTool = toolData?.data;

  const { mutate: mutateReview } = useAdminMutation('admin-enrichment-review');
  const [busyId, setBusyId] = useState<string | null>(null);
  const [editingId, setEditingId] = useState<string | null>(null);
  const [editValue, setEditValue] = useState('');
  const [selected, setSelected] = useState<Set<string>>(new Set());
  const [applyOutcome, setApplyOutcome] = useState<ApplyOutcome | null>(null);
  const [applyError, setApplyError] = useState<string | null>(null);
  const [applying, setApplying] = useState(false);

  const refresh = async () => {
    await refetch();
    await refetchTool();
  };

  const runAction = async (id: string, payload: Record<string, unknown>) => {
    setBusyId(id);
    await mutateReview(payload);
    await refresh();
    setBusyId(null);
  };

  const handleApprove = (s: Suggestion) => runAction(s.id, { action: 'approve', suggestion_id: s.id });
  const handleReject = (s: Suggestion) => runAction(s.id, { action: 'reject', suggestion_id: s.id });
  const startEdit = (s: Suggestion) => {
    setEditingId(s.id);
    setEditValue(typeof s.generated_value === 'string' ? s.generated_value : JSON.stringify(s.generated_value, null, 2));
  };
  const submitEdit = async (s: Suggestion) => {
    let newValue: unknown = editValue;
    if (Array.isArray(s.generated_value)) {
      try { newValue = JSON.parse(editValue); } catch { /* keep as raw string, backend stores as-is */ }
    }
    await runAction(s.id, { action: 'edit', suggestion_id: s.id, new_value: newValue });
    setEditingId(null);
  };
  const handleRegenerateField = (s: Suggestion) => runAction(s.id, { action: 'regenerate', job_id: s.enrichment_job_id, field_key: s.field_key });
  const handleRegenerateJob = () => job && runAction(job.id, { action: 'regenerate', job_id: job.id });

  const toggleSelect = (id: string) => setSelected((prev) => {
    const next = new Set(prev);
    if (next.has(id)) next.delete(id); else next.add(id);
    return next;
  });

  const bulkApprove = async () => {
    if (selected.size === 0) return;
    await mutateReview({ action: 'bulk-approve', suggestion_ids: [...selected] });
    setSelected(new Set());
    await refresh();
  };
  const bulkReject = async () => {
    if (selected.size === 0) return;
    await mutateReview({ action: 'bulk-reject', suggestion_ids: [...selected] });
    setSelected(new Set());
    await refresh();
  };
  const approveAllEligible = async () => {
    if (!job) return;
    await mutateReview({ action: 'approve-all-eligible', job_id: job.id });
    await refresh();
  };

  const handleApply = async (confirmOverwriteFieldKeys: string[] = []) => {
    if (!job) return;
    setApplying(true);
    setApplyError(null);
    const result = await mutateReview({ action: 'apply', tool_id: job.tool_id, confirm_overwrite_field_keys: confirmOverwriteFieldKeys });
    setApplying(false);
    if (!result.ok) {
      setApplyError(result.error?.message || 'Failed to apply.');
      return;
    }
    const outcome = (result.data as { data: ApplyOutcome })?.data;
    setApplyOutcome(outcome || null);
    await refresh();
  };

  const approvedCount = suggestions.filter((s) => (s.review_status === 'approved' || s.review_status === 'edited') && !s.applied_to_tool).length;

  return (
    <WpAdminLayout title="Enrichment Review" subtitle={job?.tools?.name || ''}>
      <div className="max-w-5xl mx-auto pb-24">
        {isError && error && <AdminErrorBanner error={error} onRetry={refetch} className="mb-4" />}
        {isLoading && <AdminLoadingState message="Loading job..." />}

        {job && (
          <>
            <div className="flex flex-wrap items-center justify-between gap-3 mb-4">
              <div>
                <h1 className="text-xl font-bold text-gray-900">{job.tools?.name}</h1>
                <p className="text-sm text-gray-500">Generation v{job.generation_version} · Tool status: {job.tools?.status}</p>
              </div>
              <div className="flex items-center gap-2">
                <span className={`text-xs px-3 py-1 rounded-full font-semibold ${enrichmentJobStatusBadgeClass(job.status)}`}>{enrichmentJobStatusLabel(job.status)}</span>
                {job.tools?.slug && (
                  <Link to={`/wp-admin/tools/${job.tool_id}/edit`} target="_blank" className="inline-flex items-center gap-1 text-xs font-semibold text-blue-600 hover:underline">
                    Open Tool Editor <ExternalLink className="w-3 h-3" />
                  </Link>
                )}
                <button onClick={handleRegenerateJob} className="inline-flex items-center gap-1.5 px-3 py-1.5 border border-gray-200 rounded-lg text-xs font-semibold text-gray-700 hover:bg-gray-50">
                  <RotateCcw className="w-3.5 h-3.5" /> Regenerate all
                </button>
              </div>
            </div>

            <div className="flex flex-wrap items-center gap-2 mb-4">
              <button onClick={bulkApprove} disabled={selected.size === 0} className="px-3 py-1.5 border border-gray-200 rounded-lg text-xs font-semibold text-gray-700 hover:bg-gray-50 disabled:opacity-40">
                Approve selected ({selected.size})
              </button>
              <button onClick={bulkReject} disabled={selected.size === 0} className="px-3 py-1.5 border border-gray-200 rounded-lg text-xs font-semibold text-gray-700 hover:bg-gray-50 disabled:opacity-40">
                Reject selected
              </button>
              <button onClick={approveAllEligible} className="px-3 py-1.5 bg-gray-900 text-white rounded-lg text-xs font-semibold hover:bg-gray-800">
                Approve all eligible high-confidence
              </button>
            </div>

            {applyError && <AdminErrorBanner error={{ code: 'server_error', message: applyError, retryable: true }} className="mb-4" />}

            {applyOutcome && applyOutcome.conflicts.length > 0 && (
              <div className="bg-amber-50 border border-amber-200 rounded-lg p-4 mb-4">
                <div className="flex items-start gap-2 mb-2">
                  <AlertTriangle className="w-4 h-4 text-amber-600 mt-0.5 shrink-0" />
                  <p className="text-sm font-semibold text-amber-800">{applyOutcome.conflicts.length} field(s) already have a different value — confirm to overwrite</p>
                </div>
                <ul className="text-xs text-amber-700 space-y-2 mb-3">
                  {applyOutcome.conflicts.map((c) => (
                    <li key={c.field_key}>
                      <strong>{enrichmentFieldLabel(c.field_key)}</strong>: current "{renderValue(c.current_value).slice(0, 80)}" → suggested "{renderValue(c.new_value).slice(0, 80)}"
                    </li>
                  ))}
                </ul>
                <button
                  onClick={() => handleApply(applyOutcome.conflicts.map((c) => c.field_key))}
                  className="px-3 py-1.5 bg-amber-600 text-white rounded-lg text-xs font-semibold hover:bg-amber-700"
                >
                  Confirm overwrite for these fields
                </button>
              </div>
            )}

            <div className="space-y-3">
              {suggestions.map((s) => {
                const band = confidenceBand(s.confidence);
                const current = currentValueOf(currentTool, s.field_key);
                return (
                  <div key={s.id} className="bg-white border border-gray-200 rounded-lg p-4">
                    <div className="flex items-start gap-3">
                      <button onClick={() => toggleSelect(s.id)} className="mt-0.5 shrink-0" aria-label="Select">
                        {selected.has(s.id) ? <CheckSquare className="w-4 h-4 text-gray-900" /> : <Square className="w-4 h-4 text-gray-300" />}
                      </button>
                      <div className="min-w-0 flex-1">
                        <div className="flex flex-wrap items-center gap-2 mb-2">
                          <span className="font-semibold text-gray-900 text-sm">{enrichmentFieldLabel(s.field_key)}</span>
                          <span className={`text-[10px] px-2 py-0.5 rounded-full font-semibold ${band.className}`}>{band.label} ({s.confidence})</span>
                          <span className="text-[10px] px-2 py-0.5 rounded-full bg-gray-100 text-gray-600">{s.classification}</span>
                          <span className={`text-[10px] px-2 py-0.5 rounded-full ${suggestionStatusBadgeClass(s.review_status)}`}>{suggestionStatusLabel(s.review_status)}</span>
                          {s.applied_to_tool && <span className="text-[10px] px-2 py-0.5 rounded-full bg-emerald-100 text-emerald-700">Applied</span>}
                        </div>

                        <div className="grid grid-cols-1 sm:grid-cols-2 gap-3 mb-2">
                          <div>
                            <p className="text-[10px] font-semibold uppercase tracking-wide text-gray-400 mb-1">Current Tool Draft value</p>
                            <pre className="text-xs text-gray-600 whitespace-pre-wrap bg-gray-50 border border-gray-100 rounded p-2">{renderValue(current)}</pre>
                          </div>
                          <div>
                            <p className="text-[10px] font-semibold uppercase tracking-wide text-gray-400 mb-1">AI suggestion</p>
                            {editingId === s.id ? (
                              <textarea value={editValue} onChange={(e) => setEditValue(e.target.value)} rows={4} className="w-full text-xs border border-gray-200 rounded p-2 font-mono" />
                            ) : (
                              <pre className="text-xs text-gray-900 whitespace-pre-wrap bg-blue-50 border border-blue-100 rounded p-2">{s.unsupported ? '(unsupported — no evidence)' : renderValue(s.review_status === 'edited' ? s.approved_value : s.generated_value)}</pre>
                            )}
                          </div>
                        </div>

                        {s.reason && <p className="text-xs text-gray-500 mb-1"><strong>Reason:</strong> {s.reason}</p>}
                        {s.supporting_evidence && <p className="text-xs text-gray-500 mb-1"><strong>Evidence:</strong> "{s.supporting_evidence}"</p>}
                        {s.source_urls.length > 0 && (
                          <div className="flex flex-wrap gap-2 mb-1">
                            {s.source_urls.map((u) => (
                              <a key={u} href={u} target="_blank" rel="noreferrer" className="text-xs text-blue-600 hover:underline truncate max-w-xs">{u}</a>
                            ))}
                          </div>
                        )}
                        {s.warnings.length > 0 && (
                          <p className="text-xs text-amber-600 mb-1">⚠ {s.warnings.join('; ')}</p>
                        )}

                        <div className="flex flex-wrap gap-2 mt-2">
                          {editingId === s.id ? (
                            <>
                              <button onClick={() => submitEdit(s)} className="inline-flex items-center gap-1 px-2.5 py-1 bg-gray-900 text-white rounded text-xs font-semibold">Save</button>
                              <button onClick={() => setEditingId(null)} className="inline-flex items-center gap-1 px-2.5 py-1 border border-gray-200 rounded text-xs font-semibold">Cancel</button>
                            </>
                          ) : (
                            <>
                              <button onClick={() => handleApprove(s)} disabled={busyId === s.id || s.review_status === 'approved'} className="inline-flex items-center gap-1 px-2.5 py-1 border border-emerald-200 text-emerald-700 rounded text-xs font-semibold hover:bg-emerald-50 disabled:opacity-40">
                                <Check className="w-3 h-3" /> Approve
                              </button>
                              <button onClick={() => handleReject(s)} disabled={busyId === s.id || s.review_status === 'rejected'} className="inline-flex items-center gap-1 px-2.5 py-1 border border-red-200 text-red-700 rounded text-xs font-semibold hover:bg-red-50 disabled:opacity-40">
                                <X className="w-3 h-3" /> Reject
                              </button>
                              <button onClick={() => startEdit(s)} className="inline-flex items-center gap-1 px-2.5 py-1 border border-gray-200 rounded text-xs font-semibold hover:bg-gray-50">
                                <Pencil className="w-3 h-3" /> Edit
                              </button>
                              <button onClick={() => handleRegenerateField(s)} disabled={busyId === s.id} className="inline-flex items-center gap-1 px-2.5 py-1 border border-gray-200 rounded text-xs font-semibold hover:bg-gray-50 disabled:opacity-40">
                                <RotateCcw className="w-3 h-3" /> Regenerate
                              </button>
                            </>
                          )}
                        </div>
                      </div>
                    </div>
                  </div>
                );
              })}
            </div>
          </>
        )}
      </div>

      {job && approvedCount > 0 && (
        <div className="fixed bottom-0 left-0 right-0 bg-white border-t border-gray-200 p-4 flex justify-end lg:pl-72">
          <button onClick={() => handleApply()} disabled={applying} className="inline-flex items-center gap-2 bg-gray-900 text-white px-5 py-2.5 rounded-lg font-semibold hover:bg-gray-800 transition text-sm disabled:opacity-40 shadow-lg">
            <Zap className="w-4 h-4" />
            {applying ? 'Applying…' : `Apply ${approvedCount} approved field(s) to Tool Draft`}
          </button>
        </div>
      )}
    </WpAdminLayout>
  );
}
