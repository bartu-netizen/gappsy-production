import { useState } from 'react';
import { useParams, Link } from 'react-router-dom';
import {
  ArrowLeft, Check, X, Pencil, Sparkles, AlertTriangle, ExternalLink,
  Loader2, FileCheck, Fingerprint, Building2, DollarSign, Wrench, MessageCircleQuestion, Image as ImageIcon, Globe2,
} from 'lucide-react';
import WpAdminLayout from '../components/wpadmin/WpAdminLayout';
import { useAdminFetch, useAdminMutation } from '../hooks/useAdminFetch';
import { AdminErrorBanner, AdminLoadingState } from '../components/admin/AdminErrorBanner';
import { crawlJobStatusLabel, crawlJobStatusBadgeClass } from '../utils/crawlJobStatus';

interface ProvenanceField {
  value: string | null;
  source_url: string | null;
  evidence: string | null;
  confidence: number;
  review_status: 'pending' | 'approved' | 'rejected' | 'edited';
}
type ReviewState = Record<string, { status: 'approved' | 'rejected' | 'edited'; edited_value?: unknown }>;

interface ExtractionData {
  identity: Record<string, ProvenanceField | ProvenanceField[]>;
  company: Record<string, ProvenanceField | ProvenanceField[]>;
  pricing: Record<string, ProvenanceField | ProvenanceField[]>;
  product: Record<string, ProvenanceField | ProvenanceField[]>;
  content: { faq_candidates: Array<{ question: string; answer: string; source_url: string; confidence: number }>; important_headings: ProvenanceField[]; source_summaries: Array<{ url: string; summary: string }> };
  assets: Record<string, ProvenanceField[]>;
  crawl_sources: Array<{ url: string; status_code: number | null; title: string | null }>;
  warnings: string[];
}
interface JobDetail {
  id: string;
  status: string;
  requested_url: string;
  crawl4ai_version: string | null;
  crawled_pages: number;
  discovered_pages: number;
  duration_ms: number | null;
  created_draft_tool_id: string | null;
  discovered_tools: { id: string; name: string; official_website: string } | null;
}
interface GetResponse { ok: boolean; data: { job: JobDetail; extraction: ExtractionData; review_state: ReviewState } }
interface MutateResponse { ok: boolean; data?: { tool?: { id: string } }; error?: string }

function scoreColor(confidence: number): string {
  if (confidence >= 70) return 'text-emerald-600 bg-emerald-50';
  if (confidence >= 40) return 'text-amber-600 bg-amber-50';
  return 'text-gray-400 bg-gray-50';
}

function FieldRow({ path, field, state, onApprove, onReject, onEdit }: {
  path: string; field: ProvenanceField; state: ReviewState[string] | undefined;
  onApprove: (path: string) => void; onReject: (path: string) => void; onEdit: (path: string, value: string) => void;
}) {
  const [editing, setEditing] = useState(false);
  const [editValue, setEditValue] = useState(field.value || '');

  if (field.value === null && !state) {
    return (
      <div className="flex items-center gap-3 py-2 text-sm text-gray-400">
        <span className="w-32 shrink-0 capitalize">{path.split('.').pop()?.replace(/_/g, ' ')}</span>
        <span className="italic">Not found</span>
      </div>
    );
  }

  const currentStatus = state?.status || 'pending';
  const displayValue = state?.status === 'edited' ? String(state.edited_value) : field.value;

  return (
    <div className={`py-2.5 px-3 rounded-lg ${currentStatus === 'approved' ? 'bg-emerald-50/50' : currentStatus === 'rejected' ? 'bg-red-50/50 opacity-60' : currentStatus === 'edited' ? 'bg-blue-50/50' : ''}`}>
      <div className="flex items-start gap-3">
        <span className="w-36 shrink-0 text-xs font-medium text-gray-500 capitalize pt-1">{path.split('.').pop()?.replace(/_/g, ' ')}</span>
        <div className="flex-1 min-w-0">
          {editing ? (
            <div className="flex items-center gap-2">
              <input value={editValue} onChange={(e) => setEditValue(e.target.value)} className="flex-1 px-2 py-1 text-sm border border-blue-300 rounded focus:ring-2 focus:ring-blue-500" autoFocus />
              <button onClick={() => { onEdit(path, editValue); setEditing(false); }} className="text-xs font-medium text-blue-700 px-2 py-1 rounded hover:bg-blue-100">Save</button>
              <button onClick={() => setEditing(false)} className="text-xs text-gray-500 px-2 py-1">Cancel</button>
            </div>
          ) : (
            <p className="text-sm text-gray-900 break-words">{displayValue || <span className="italic text-gray-400">empty</span>}</p>
          )}
          {field.evidence && !editing && <p className="text-xs text-gray-400 mt-0.5 italic truncate">"{field.evidence}"</p>}
          {field.source_url && !editing && (
            <a href={field.source_url} target="_blank" rel="noopener noreferrer" className="inline-flex items-center gap-1 text-xs text-blue-500 hover:underline mt-0.5">
              {field.source_url.replace(/^https?:\/\//, '').slice(0, 50)} <ExternalLink className="w-2.5 h-2.5" />
            </a>
          )}
        </div>
        <span className={`shrink-0 text-xs font-medium px-1.5 py-0.5 rounded ${scoreColor(field.confidence)}`}>{field.confidence}%</span>
        {!editing && (
          <div className="flex items-center gap-1 shrink-0">
            <button onClick={() => onApprove(path)} title="Approve" className={`p-1 rounded ${currentStatus === 'approved' ? 'bg-emerald-200 text-emerald-800' : 'text-gray-400 hover:bg-emerald-100 hover:text-emerald-700'}`}><Check className="w-3.5 h-3.5" /></button>
            <button onClick={() => onReject(path)} title="Reject" className={`p-1 rounded ${currentStatus === 'rejected' ? 'bg-red-200 text-red-800' : 'text-gray-400 hover:bg-red-100 hover:text-red-700'}`}><X className="w-3.5 h-3.5" /></button>
            <button onClick={() => setEditing(true)} title="Edit" className="p-1 rounded text-gray-400 hover:bg-blue-100 hover:text-blue-700"><Pencil className="w-3.5 h-3.5" /></button>
          </div>
        )}
      </div>
    </div>
  );
}

function Section({ title, icon: Icon, children }: { title: string; icon: typeof Fingerprint; children: React.ReactNode }) {
  return (
    <div className="bg-white border border-gray-200 rounded-lg p-4 mb-4">
      <div className="flex items-center gap-2 mb-2">
        <Icon className="w-4 h-4 text-gray-400" />
        <h2 className="text-xs font-semibold text-gray-600 uppercase tracking-wide">{title}</h2>
      </div>
      <div className="divide-y divide-gray-50">{children}</div>
    </div>
  );
}

export default function WpAdminCrawlReviewPage() {
  const { jobId } = useParams<{ jobId: string }>();
  const [createBusy, setCreateBusy] = useState(false);
  const [createMessage, setCreateMessage] = useState<string | null>(null);

  const { data, isLoading, isError, error, refetch } = useAdminFetch<GetResponse>(() => (jobId ? `admin-crawl-extraction?job_id=${jobId}` : null));
  const { mutate: fieldAction } = useAdminMutation<MutateResponse, Record<string, unknown>>('admin-crawl-extraction', 'POST');
  const { mutate: createDraft } = useAdminMutation<MutateResponse, Record<string, unknown>>('admin-crawl-extraction', 'POST');

  const job = data?.data?.job;
  const extraction = data?.data?.extraction;
  const reviewState = data?.data?.review_state || {};

  async function handleApprove(path: string) {
    await fieldAction({ job_id: jobId, action: 'approve-field', field_path: path });
    refetch();
  }
  async function handleReject(path: string) {
    await fieldAction({ job_id: jobId, action: 'reject-field', field_path: path });
    refetch();
  }
  async function handleEdit(path: string, value: string) {
    await fieldAction({ job_id: jobId, action: 'edit-field', field_path: path, value });
    refetch();
  }
  async function handleApproveAllHighConfidence() {
    await fieldAction({ job_id: jobId, action: 'approve-all-high-confidence', threshold: 70 });
    refetch();
  }
  async function handleCreateDraft() {
    setCreateBusy(true);
    setCreateMessage(null);
    const result = await createDraft({ job_id: jobId, action: 'create-draft' });
    setCreateBusy(false);
    if (result.ok) {
      setCreateMessage('Draft created — opening in Tool Editor is available below.');
      refetch();
    } else {
      setCreateMessage(result.error?.message || 'Failed to create draft.');
    }
  }

  function fieldGroup(group: Record<string, ProvenanceField | ProvenanceField[]>, groupName: string, keys: string[]) {
    return keys.map((key) => {
      const value = group[key];
      if (Array.isArray(value)) {
        return value.length === 0 ? null : (
          <div key={key} className="py-2">
            <p className="text-xs font-medium text-gray-500 capitalize mb-1">{key.replace(/_/g, ' ')}</p>
            {value.map((item, idx) => (
              <FieldRow key={idx} path={`${groupName}.${key}[${idx}]`} field={item} state={reviewState[`${groupName}.${key}[${idx}]`]} onApprove={handleApprove} onReject={handleReject} onEdit={handleEdit} />
            ))}
          </div>
        );
      }
      return <FieldRow key={key} path={`${groupName}.${key}`} field={value} state={reviewState[`${groupName}.${key}`]} onApprove={handleApprove} onReject={handleReject} onEdit={handleEdit} />;
    });
  }

  return (
    <WpAdminLayout title="Review Extraction" subtitle="Every fact is a candidate — nothing here is verified until you approve it">
      <div className="max-w-5xl mx-auto">
        <Link to="/wp-admin/discovery/queue" className="inline-flex items-center gap-1.5 text-sm text-gray-500 hover:text-gray-700 mb-4">
          <ArrowLeft className="w-4 h-4" /> Back to Discovery Queue
        </Link>

        {isError && error && <AdminErrorBanner error={error} onRetry={refetch} className="mb-6" />}
        {isLoading && <AdminLoadingState message="Loading extraction..." />}

        {job && extraction && (
          <>
            <div className="mb-6 flex flex-wrap items-center justify-between gap-3">
              <div>
                <h1 className="text-2xl font-bold text-gray-900">{job.discovered_tools?.name || 'Extraction Review'}</h1>
                <div className="flex items-center gap-2 mt-1 text-sm text-gray-500">
                  <span className={`inline-flex items-center px-2 py-0.5 rounded text-xs font-medium ${crawlJobStatusBadgeClass(job.status)}`}>{crawlJobStatusLabel(job.status)}</span>
                  <span>{job.crawled_pages} of {job.discovered_pages} pages crawled</span>
                  {job.crawl4ai_version && <span>· Crawl4AI {job.crawl4ai_version}</span>}
                </div>
              </div>
              <div className="flex items-center gap-2">
                <button onClick={handleApproveAllHighConfidence} className="inline-flex items-center gap-1.5 px-3 py-2 text-sm font-medium bg-white border border-gray-200 rounded-lg hover:bg-gray-50">
                  <Sparkles className="w-4 h-4" /> Approve High-Confidence
                </button>
                {job.created_draft_tool_id ? (
                  <Link to={`/wp-admin/tools/${job.created_draft_tool_id}/edit`} className="inline-flex items-center gap-1.5 px-3 py-2 text-sm font-medium bg-gray-900 text-white rounded-lg hover:bg-gray-800">
                    <FileCheck className="w-4 h-4" /> Open in Tool Editor
                  </Link>
                ) : (
                  <button onClick={handleCreateDraft} disabled={createBusy} className="inline-flex items-center gap-1.5 px-3 py-2 text-sm font-medium bg-gray-900 text-white rounded-lg hover:bg-gray-800 disabled:opacity-50">
                    {createBusy ? <Loader2 className="w-4 h-4 animate-spin" /> : <FileCheck className="w-4 h-4" />} Create Draft
                  </button>
                )}
              </div>
            </div>

            {createMessage && <div className="bg-gray-50 border border-gray-200 rounded-lg p-3 mb-4 text-sm text-gray-700">{createMessage}</div>}

            {extraction.warnings.length > 0 && (
              <div className="bg-amber-50 border border-amber-200 rounded-lg p-3 mb-6">
                <div className="flex items-center gap-2 mb-1.5"><AlertTriangle className="w-4 h-4 text-amber-600" /><p className="text-xs font-semibold text-amber-800 uppercase tracking-wide">Warnings</p></div>
                <ul className="text-sm text-amber-800 space-y-0.5">{extraction.warnings.map((w, i) => <li key={i}>{w}</li>)}</ul>
              </div>
            )}

            <Section title="Identity" icon={Fingerprint}>{fieldGroup(extraction.identity, 'identity', ['tool_name_candidate', 'canonical_website', 'title', 'meta_description', 'og_title', 'og_description', 'favicon_candidates', 'logo_candidates'])}</Section>
            <Section title="Company" icon={Building2}>{fieldGroup(extraction.company, 'company', ['company_name', 'about_text', 'founded_year_candidate', 'headquarters_candidate', 'company_size_candidate', 'social_links'])}</Section>
            <Section title="Pricing" icon={DollarSign}>{fieldGroup(extraction.pricing, 'pricing', ['pricing_page_url', 'pricing_model_candidate', 'starting_price_candidate', 'free_plan_evidence', 'free_trial_evidence', 'plan_candidates', 'raw_pricing_evidence'])}</Section>
            <Section title="Features &amp; Integrations" icon={Wrench}>{fieldGroup(extraction.product, 'product', ['feature_candidates', 'integrations', 'docs_api_indicators'])}</Section>

            <Section title="FAQ" icon={MessageCircleQuestion}>
              {extraction.content.faq_candidates.length === 0 ? (
                <p className="text-sm text-gray-400 italic py-2">No FAQ candidates found.</p>
              ) : (
                extraction.content.faq_candidates.map((faq, idx) => (
                  <div key={idx} className="py-2">
                    <p className="text-sm font-medium text-gray-900">{faq.question}</p>
                    <p className="text-sm text-gray-600 mt-0.5">{faq.answer}</p>
                    <span className={`inline-block mt-1 text-xs font-medium px-1.5 py-0.5 rounded ${scoreColor(faq.confidence)}`}>{faq.confidence}%</span>
                  </div>
                ))
              )}
            </Section>

            <Section title="Assets" icon={ImageIcon}>
              {extraction.assets.image_candidates.length === 0 ? (
                <p className="text-sm text-gray-400 italic py-2">No images found.</p>
              ) : (
                <div className="grid grid-cols-6 gap-2 py-2">
                  {extraction.assets.image_candidates.slice(0, 12).map((img, idx) => (
                    <a key={idx} href={img.source_url || undefined} target="_blank" rel="noopener noreferrer" className="block aspect-square rounded border border-gray-100 overflow-hidden bg-gray-50">
                      <img src={img.value || ''} alt="" className="w-full h-full object-contain" />
                    </a>
                  ))}
                </div>
              )}
            </Section>

            <Section title="Crawl Sources" icon={Globe2}>
              <ul className="text-sm text-gray-700 space-y-1 py-1">
                {extraction.crawl_sources.map((s, idx) => (
                  <li key={idx} className="flex items-center gap-2">
                    <span className={`w-1.5 h-1.5 rounded-full shrink-0 ${s.status_code && s.status_code < 400 ? 'bg-emerald-500' : 'bg-red-500'}`} />
                    <a href={s.url} target="_blank" rel="noopener noreferrer" className="text-blue-600 hover:underline truncate">{s.url}</a>
                    <span className="text-xs text-gray-400 shrink-0">{s.status_code ?? '—'}</span>
                  </li>
                ))}
              </ul>
            </Section>
          </>
        )}
      </div>
    </WpAdminLayout>
  );
}
