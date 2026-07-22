import { useEffect, useMemo, useRef, useState } from 'react';
import { useParams, Link } from 'react-router-dom';
import {
  ArrowLeft, ExternalLink, Check, X, Pencil, Save, Loader2, Fingerprint,
  Building2, MessageCircleQuestion, Zap, Radar, CheckCircle2,
} from 'lucide-react';
import WpAdminLayout from '../components/wpadmin/WpAdminLayout';
import { useAdminFetch, useAdminMutation } from '../hooks/useAdminFetch';
import { AdminErrorBanner, AdminLoadingState } from '../components/admin/AdminErrorBanner';
import { enrichmentFieldLabel, currentValueOf } from '../lib/enrichmentFields';
import { confidenceBand, suggestionStatusBadgeClass, suggestionStatusLabel } from '../utils/enrichmentStatus';
import { toolStatusBadgeClass } from '../utils/toolStatus';

interface ProvenanceField { value: unknown; source_url: string | null; evidence: string | null; confidence: number }
interface CrawlEvidence {
  crawl_job_id: string;
  discovery_candidate_id: string;
  requested_url: string;
  normalized_url: string | null;
  normalized_extraction: {
    identity?: Record<string, ProvenanceField>;
    company?: Record<string, ProvenanceField>;
    pricing?: Record<string, ProvenanceField>;
    content?: { important_headings?: ProvenanceField[]; faq_candidates?: { question: string; answer: string; source_url: string }[] };
  } | null;
  completed_at: string | null;
}
interface Suggestion {
  id: string; enrichment_job_id: string; field_key: string; generated_value: unknown;
  confidence: number; supporting_evidence: string | null; source_urls: string[];
  review_status: 'pending' | 'approved' | 'rejected' | 'edited' | 'unsupported'; approved_value: unknown;
}
interface ReviewResponse {
  ok: boolean;
  data: { crawl_evidence: CrawlEvidence | null; enrichment_job: { id: string; status: string } | null; ai_suggestions: Suggestion[] };
}
interface ToolResponse { ok: boolean; data: Record<string, unknown> }

const KEY_FIELDS = ['short_description', 'long_description', 'pricing_summary', 'features_summary', 'company_summary', 'seo_title', 'seo_meta_description'];

function renderValue(value: unknown): string {
  if (value === null || value === undefined || value === '') return '—';
  if (typeof value === 'string') return value;
  if (Array.isArray(value)) return value.length === 0 ? '—' : value.map((v) => (typeof v === 'string' ? `• ${v}` : `• ${JSON.stringify(v)}`)).join('\n');
  return JSON.stringify(value, null, 2);
}

function EvidenceGroup({ title, icon: Icon, fields }: { title: string; icon: typeof Fingerprint; fields: Record<string, ProvenanceField> | undefined }) {
  const entries = Object.entries(fields || {}).filter(([, f]) => f && f.value !== null && f.value !== undefined && f.value !== '');
  if (entries.length === 0) return null;
  return (
    <div className="mb-4">
      <p className="text-xs font-semibold uppercase tracking-wide text-gray-500 mb-2 flex items-center gap-1.5"><Icon className="w-3.5 h-3.5" /> {title}</p>
      <div className="space-y-2">
        {entries.map(([key, field]) => (
          <div key={key} className="text-sm">
            <p className="text-xs text-gray-400 capitalize">{key.replace(/_/g, ' ')}</p>
            <p className="text-gray-800 break-words">{String(field.value)}</p>
            {field.evidence && <p className="text-xs text-gray-400 italic mt-0.5 truncate">"{field.evidence}"</p>}
          </div>
        ))}
      </div>
    </div>
  );
}

// The 4-column review flow (crawl evidence -> current draft -> AI
// suggestion -> final value) for ONE tool. Deliberately composes rather
// than duplicates: crawl evidence comes from admin-editorial-review (a
// thin new aggregator), the current-draft/AI-suggestion comparison reuses
// the exact same currentValueOf/enrichmentFieldLabel helpers the full AI
// Enrichment Review screen uses, and accept/reject/edit call the same
// admin-enrichment-review actions that screen calls — this is a faster,
// tool-centric entry point into the same underlying review primitives,
// not a second implementation of them. Reports time-on-screen as
// review_duration_ms on save, powering Editor Metrics' avg review time.
export default function WpAdminReviewWorkspacePage() {
  const { toolId } = useParams<{ toolId: string }>();
  const mountedAt = useRef(Date.now());

  const { data: reviewData, isLoading, isError, error, refetch } = useAdminFetch<ReviewResponse>(() => (toolId ? `admin-editorial-review?tool_id=${toolId}` : null));
  const { data: toolData, refetch: refetchTool } = useAdminFetch<ToolResponse>(() => (toolId ? `admin-tools?id=${toolId}` : null));
  const { mutate: mutateReview } = useAdminMutation<{ ok: boolean; data?: unknown; error?: string }, Record<string, unknown>>('admin-enrichment-review');
  const { mutate: mutateTool, isLoading: isSaving } = useAdminMutation<{ ok: boolean }, Record<string, unknown>>('admin-tools', 'PUT');

  const [editingId, setEditingId] = useState<string | null>(null);
  const [editValue, setEditValue] = useState('');
  const [busyId, setBusyId] = useState<string | null>(null);
  const [message, setMessage] = useState<string | null>(null);

  const tool = toolData?.data;
  const crawlEvidence = reviewData?.data.crawl_evidence || null;
  const suggestions = useMemo(() => reviewData?.data.ai_suggestions || [], [reviewData]);
  const suggestionByField = useMemo(() => {
    const map = new Map<string, Suggestion>();
    for (const s of suggestions) if (!map.has(s.field_key)) map.set(s.field_key, s);
    return map;
  }, [suggestions]);

  useEffect(() => { mountedAt.current = Date.now(); }, [toolId]);

  const refresh = async () => { await refetch(); await refetchTool(); };

  const handleApprove = async (s: Suggestion) => { setBusyId(s.id); await mutateReview({ action: 'approve', suggestion_id: s.id }); setBusyId(null); await refresh(); };
  const handleReject = async (s: Suggestion) => { setBusyId(s.id); await mutateReview({ action: 'reject', suggestion_id: s.id }); setBusyId(null); await refresh(); };
  const startEdit = (s: Suggestion) => { setEditingId(s.id); setEditValue(typeof s.generated_value === 'string' ? s.generated_value : JSON.stringify(s.generated_value, null, 2)); };
  const submitEdit = async (s: Suggestion) => {
    setBusyId(s.id);
    await mutateReview({ action: 'edit', suggestion_id: s.id, new_value: editValue });
    setEditingId(null);
    setBusyId(null);
    await refresh();
  };

  const handleMarkReviewed = async () => {
    if (!toolId) return;
    const durationMs = Date.now() - mountedAt.current;
    const result = await mutateTool({ id: toolId, review_duration_ms: durationMs });
    setMessage(result.ok ? `Marked reviewed (${Math.round(durationMs / 1000)}s).` : result.error?.message || 'Failed to save.');
    mountedAt.current = Date.now();
  };

  return (
    <WpAdminLayout title="Review Workspace" subtitle={typeof tool?.name === 'string' ? tool.name : ''}>
      <div className="max-w-7xl mx-auto pb-24">
        <Link to="/wp-admin/editorial" className="inline-flex items-center gap-1.5 text-sm text-gray-500 hover:text-gray-700 mb-4">
          <ArrowLeft className="w-4 h-4" /> Back to Editorial Dashboard
        </Link>

        {isError && error && <AdminErrorBanner error={error} onRetry={refetch} className="mb-4" />}
        {isLoading && <AdminLoadingState message="Loading review workspace..." />}

        {tool && (
          <>
            <div className="flex flex-wrap items-center justify-between gap-3 mb-5">
              <div className="flex items-center gap-3">
                <h1 className="text-xl font-bold text-gray-900">{String(tool.name)}</h1>
                <span className={`text-xs px-3 py-1 rounded-full font-semibold ${toolStatusBadgeClass(String(tool.status))}`}>{String(tool.status)}</span>
                {typeof tool.completeness_percent === 'number' && <span className="text-xs text-gray-500">{tool.completeness_percent}% complete</span>}
              </div>
              <div className="flex items-center gap-2">
                <Link to={`/wp-admin/tools/${toolId}/edit`} className="inline-flex items-center gap-1 text-xs font-semibold text-blue-600 hover:underline">
                  Open full Tool Editor <ExternalLink className="w-3 h-3" />
                </Link>
                <button
                  onClick={handleMarkReviewed}
                  disabled={isSaving}
                  className="inline-flex items-center gap-1.5 px-3 py-1.5 bg-gray-900 text-white rounded-lg text-xs font-semibold hover:bg-gray-800 disabled:opacity-50"
                >
                  {isSaving ? <Loader2 className="w-3.5 h-3.5 animate-spin" /> : <CheckCircle2 className="w-3.5 h-3.5" />}
                  Mark Reviewed
                </button>
              </div>
            </div>

            {message && <div className="bg-gray-50 border border-gray-200 rounded-lg p-3 mb-4 text-sm text-gray-700">{message}</div>}

            <div className="grid grid-cols-1 lg:grid-cols-3 gap-4">
              {/* Column 1: Crawl evidence */}
              <div className="bg-white border border-gray-200 rounded-lg p-4">
                <div className="flex items-center justify-between mb-3">
                  <h2 className="text-sm font-semibold text-gray-900 flex items-center gap-1.5"><Radar className="w-4 h-4" /> Crawl Evidence</h2>
                  {crawlEvidence && (
                    <Link to={`/wp-admin/discovery/crawl/${crawlEvidence.crawl_job_id}`} className="text-xs text-blue-600 hover:underline">Full review</Link>
                  )}
                </div>
                {!crawlEvidence && <p className="text-sm text-gray-400">This tool wasn't created via the Discovery/Crawl pipeline — no crawl evidence available.</p>}
                {crawlEvidence && (
                  <>
                    <a href={crawlEvidence.normalized_url || crawlEvidence.requested_url} target="_blank" rel="noopener noreferrer" className="inline-flex items-center gap-1 text-xs text-blue-500 hover:underline mb-3">
                      {crawlEvidence.requested_url.replace(/^https?:\/\//, '')} <ExternalLink className="w-3 h-3" />
                    </a>
                    <EvidenceGroup title="Identity" icon={Fingerprint} fields={crawlEvidence.normalized_extraction?.identity} />
                    <EvidenceGroup title="Company" icon={Building2} fields={crawlEvidence.normalized_extraction?.company} />
                    <EvidenceGroup title="Pricing" icon={Fingerprint} fields={crawlEvidence.normalized_extraction?.pricing} />
                    {(crawlEvidence.normalized_extraction?.content?.faq_candidates?.length || 0) > 0 && (
                      <div>
                        <p className="text-xs font-semibold uppercase tracking-wide text-gray-500 mb-2 flex items-center gap-1.5"><MessageCircleQuestion className="w-3.5 h-3.5" /> FAQ candidates</p>
                        {crawlEvidence.normalized_extraction!.content!.faq_candidates!.slice(0, 3).map((f, i) => (
                          <p key={i} className="text-sm text-gray-700 mb-1.5"><span className="font-medium">{f.question}</span></p>
                        ))}
                      </div>
                    )}
                  </>
                )}
              </div>

              {/* Column 2: Current draft (key fields) */}
              <div className="bg-white border border-gray-200 rounded-lg p-4">
                <h2 className="text-sm font-semibold text-gray-900 mb-3">Current Draft</h2>
                <div className="space-y-3">
                  {KEY_FIELDS.map((key) => (
                    <div key={key} className="text-sm">
                      <p className="text-xs text-gray-400">{enrichmentFieldLabel(key)}</p>
                      <p className="text-gray-800 whitespace-pre-wrap break-words">{renderValue(currentValueOf(tool, key))}</p>
                    </div>
                  ))}
                </div>
              </div>

              {/* Column 3: AI suggestions -> final value */}
              <div className="bg-white border border-gray-200 rounded-lg p-4">
                <div className="flex items-center justify-between mb-3">
                  <h2 className="text-sm font-semibold text-gray-900 flex items-center gap-1.5"><Zap className="w-4 h-4" /> AI Suggestions</h2>
                  {reviewData?.data.enrichment_job && (
                    <Link to={`/wp-admin/ai-enrichment/jobs/${reviewData.data.enrichment_job.id}`} className="text-xs text-blue-600 hover:underline">Full review</Link>
                  )}
                </div>
                {suggestions.length === 0 && (
                  <div>
                    <p className="text-sm text-gray-400 mb-3">No AI suggestions for this tool yet.</p>
                    <Link to={`/wp-admin/ai-enrichment/queue?tool_ids=${toolId}`} className="inline-flex items-center gap-1.5 text-xs font-semibold text-blue-600 hover:underline">
                      <Zap className="w-3.5 h-3.5" /> Request AI enrichment
                    </Link>
                  </div>
                )}
                <div className="space-y-3">
                  {KEY_FIELDS.filter((k) => suggestionByField.has(k)).map((key) => {
                    const s = suggestionByField.get(key)!;
                    const band = confidenceBand(s.confidence);
                    const isBusy = busyId === s.id;
                    return (
                      <div key={s.id} className="border border-gray-100 rounded-lg p-2.5">
                        <div className="flex items-center justify-between gap-2 mb-1">
                          <p className="text-xs font-medium text-gray-700">{enrichmentFieldLabel(key)}</p>
                          <div className="flex items-center gap-1.5">
                            <span className={`text-[10px] px-1.5 py-0.5 rounded font-semibold ${band.className}`}>{s.confidence}%</span>
                            <span className={`text-[10px] px-1.5 py-0.5 rounded font-semibold ${suggestionStatusBadgeClass(s.review_status)}`}>{suggestionStatusLabel(s.review_status)}</span>
                          </div>
                        </div>
                        {editingId === s.id ? (
                          <div className="space-y-1.5">
                            <textarea value={editValue} onChange={(e) => setEditValue(e.target.value)} rows={3} className="w-full text-xs border border-blue-300 rounded p-1.5" autoFocus />
                            <div className="flex gap-2">
                              <button onClick={() => submitEdit(s)} className="text-xs font-medium text-blue-700 px-2 py-1 rounded hover:bg-blue-100">Save</button>
                              <button onClick={() => setEditingId(null)} className="text-xs text-gray-500 px-2 py-1">Cancel</button>
                            </div>
                          </div>
                        ) : (
                          <>
                            <p className="text-xs text-gray-800 whitespace-pre-wrap break-words">{renderValue(s.generated_value)}</p>
                            {s.supporting_evidence && <p className="text-xs text-gray-400 italic mt-1 truncate">"{s.supporting_evidence}"</p>}
                            {s.review_status === 'pending' && (
                              <div className="flex items-center gap-1 mt-1.5">
                                {isBusy ? <Loader2 className="w-3.5 h-3.5 animate-spin text-gray-400" /> : (
                                  <>
                                    <button onClick={() => handleApprove(s)} title="Approve" className="p-1 rounded text-gray-400 hover:bg-emerald-100 hover:text-emerald-700"><Check className="w-3.5 h-3.5" /></button>
                                    <button onClick={() => handleReject(s)} title="Reject" className="p-1 rounded text-gray-400 hover:bg-red-100 hover:text-red-700"><X className="w-3.5 h-3.5" /></button>
                                    <button onClick={() => startEdit(s)} title="Edit" className="p-1 rounded text-gray-400 hover:bg-blue-100 hover:text-blue-700"><Pencil className="w-3.5 h-3.5" /></button>
                                  </>
                                )}
                              </div>
                            )}
                          </>
                        )}
                      </div>
                    );
                  })}
                </div>
                {suggestions.length > 0 && reviewData?.data.enrichment_job && (
                  <Link to={`/wp-admin/ai-enrichment/jobs/${reviewData.data.enrichment_job.id}`} className="inline-flex items-center gap-1 text-xs text-blue-600 hover:underline mt-3">
                    <Save className="w-3 h-3" /> Apply approved suggestions to draft
                  </Link>
                )}
              </div>
            </div>
          </>
        )}
      </div>
    </WpAdminLayout>
  );
}
