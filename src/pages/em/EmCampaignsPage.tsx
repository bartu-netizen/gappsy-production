import { useEffect, useState } from 'react';
import { Plus, Send, Eye, Trash2, X, ChevronRight, ChevronLeft, AlertCircle, CheckCircle, Clock, Users, BarChart2, Mail, RefreshCw } from 'lucide-react';
import EmailModuleLayout from '../../components/wpadmin/EmailModuleLayout';
import { emApi, EmCampaign, EmTemplate, EmSegment, STATUS_COLORS } from '../../hooks/useEmailMarketing';

const STEPS = ['Name & Type', 'Audience', 'Template', 'From / Subject', 'Review & Send'];

function StatusBadge({ status }: { status: string }) {
  return <span className={`inline-flex items-center px-2 py-0.5 rounded-full text-xs font-medium ${STATUS_COLORS[status] ?? 'bg-slate-100 text-slate-600'}`}>{status}</span>;
}

function StepIndicator({ current, total }: { current: number; total: number }) {
  return (
    <div className="flex items-center gap-1">
      {STEPS.map((label, i) => (
        <div key={i} className="flex items-center gap-1">
          <div className={`w-6 h-6 rounded-full flex items-center justify-center text-xs font-semibold transition-colors ${i < current ? 'bg-emerald-500 text-white' : i === current ? 'bg-slate-900 text-white' : 'bg-slate-100 text-slate-400'}`}>
            {i < current ? <CheckCircle className="w-3.5 h-3.5" /> : i + 1}
          </div>
          {i < total - 1 && <div className={`w-6 h-0.5 ${i < current ? 'bg-emerald-400' : 'bg-slate-200'}`} />}
        </div>
      ))}
    </div>
  );
}

function CampaignWizard({ campaign, templates, segments, onClose, onSaved }: {
  campaign?: EmCampaign | null;
  templates: EmTemplate[];
  segments: EmSegment[];
  onClose: () => void;
  onSaved: () => void;
}) {
  const [step, setStep] = useState(0);
  const [name, setName] = useState(campaign?.name ?? '');
  const [sendMode, setSendMode] = useState(campaign?.send_mode ?? 'immediate');
  const [segmentId, setSegmentId] = useState(campaign?.segment_id ?? '');
  const [templateId, setTemplateId] = useState(campaign?.template_id ?? '');
  const [fromName, setFromName] = useState(campaign?.from_name ?? 'Gappsy');
  const [fromEmail, setFromEmail] = useState(campaign?.from_email ?? '');
  const [replyTo, setReplyTo] = useState(campaign?.reply_to ?? '');
  const [subjectOverride, setSubjectOverride] = useState(campaign?.subject_override ?? '');
  const [scheduledFor, setScheduledFor] = useState(campaign?.scheduled_for ?? '');
  const [saving, setSaving] = useState(false);
  const [sending, setSending] = useState(false);
  const [testEmail, setTestEmail] = useState('');
  const [testSending, setTestSending] = useState(false);

  const selectedSegment = segments.find(s => s.id === segmentId);
  const selectedTemplate = templates.find(t => t.id === templateId);

  const canNext = () => {
    if (step === 0) return !!name;
    if (step === 1) return !!segmentId;
    if (step === 2) return !!templateId;
    if (step === 3) return !!fromName && !!fromEmail;
    return true;
  };

  const getPayload = () => ({
    name, send_mode: sendMode, segment_id: segmentId || null,
    template_id: templateId || null, from_name: fromName,
    from_email: fromEmail, reply_to: replyTo || null,
    subject_override: subjectOverride || null,
    scheduled_for: sendMode === 'scheduled' && scheduledFor ? new Date(scheduledFor).toISOString() : null,
  });

  const handleSaveDraft = async () => {
    if (!name) return;
    setSaving(true);
    try {
      if (campaign?.id) await emApi.put(`campaigns/${campaign.id}`, getPayload());
      else await emApi.post('campaigns', getPayload());
      onSaved(); onClose();
    } catch (e: any) { alert(e.message); } finally { setSaving(false); }
  };

  const handleSend = async () => {
    setSending(true);
    try {
      let id = campaign?.id;
      if (!id) {
        const res = await emApi.post('campaigns', getPayload());
        id = res.campaign?.id;
      } else {
        await emApi.put(`campaigns/${id}`, getPayload());
      }
      await emApi.post(`campaigns/${id}/send`, {});
      onSaved(); onClose();
    } catch (e: any) { alert(e.message); } finally { setSending(false); }
  };

  const handleTestSend = async () => {
    if (!testEmail || !templateId) return;
    setTestSending(true);
    try {
      let id = campaign?.id;
      if (!id) {
        const res = await emApi.post('campaigns', getPayload());
        id = res.campaign?.id;
      }
      await emApi.post(`campaigns/${id}/test-send`, { to_email: testEmail });
      alert('Test email sent!');
    } catch (e: any) { alert(e.message); } finally { setTestSending(false); }
  };

  const inputCls = 'w-full text-sm border border-slate-200 rounded-lg px-3 py-2.5 focus:ring-2 focus:ring-sky-500 focus:border-transparent';

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center p-4">
      <div className="absolute inset-0 bg-black/40 backdrop-blur-sm" onClick={onClose} />
      <div className="relative bg-white rounded-2xl shadow-2xl w-full max-w-xl flex flex-col max-h-[90vh]">
        <div className="flex items-center justify-between px-6 py-4 border-b border-slate-100">
          <div>
            <h3 className="text-base font-semibold text-slate-900">{campaign ? 'Edit Campaign' : 'New Campaign'}</h3>
            <p className="text-xs text-slate-400 mt-0.5">{STEPS[step]}</p>
          </div>
          <div className="flex items-center gap-3">
            <StepIndicator current={step} total={STEPS.length} />
            <button onClick={onClose} className="p-2 rounded-lg hover:bg-slate-100 text-slate-400"><X className="w-4 h-4" /></button>
          </div>
        </div>

        <div className="flex-1 overflow-y-auto p-6">
          {step === 0 && (
            <div className="space-y-4">
              <div>
                <label className="text-xs font-semibold text-slate-500 uppercase tracking-wide">Campaign Name *</label>
                <input value={name} onChange={e => setName(e.target.value)} className={`mt-1 ${inputCls}`} placeholder="e.g. New Jersey Agency Outreach" />
              </div>
              <div>
                <label className="text-xs font-semibold text-slate-500 uppercase tracking-wide mb-2 block">Send Mode</label>
                <div className="grid grid-cols-2 gap-3">
                  {[{ value: 'immediate', label: 'Send Immediately', desc: 'Send as soon as launched' }, { value: 'scheduled', label: 'Schedule', desc: 'Set a specific date & time' }].map(opt => (
                    <button key={opt.value} onClick={() => setSendMode(opt.value)} className={`p-3 rounded-xl border-2 text-left transition-colors ${sendMode === opt.value ? 'border-sky-400 bg-sky-50' : 'border-slate-200 hover:border-slate-300'}`}>
                      <p className="text-sm font-semibold text-slate-800">{opt.label}</p>
                      <p className="text-xs text-slate-400 mt-0.5">{opt.desc}</p>
                    </button>
                  ))}
                </div>
              </div>
              {sendMode === 'scheduled' && (
                <div>
                  <label className="text-xs font-semibold text-slate-500 uppercase tracking-wide">Schedule Date & Time</label>
                  <input type="datetime-local" value={scheduledFor} onChange={e => setScheduledFor(e.target.value)} className={`mt-1 ${inputCls}`} />
                </div>
              )}
            </div>
          )}

          {step === 1 && (
            <div className="space-y-3">
              <p className="text-xs font-semibold text-slate-500 uppercase tracking-wide mb-1">Select Audience Segment *</p>
              {!segments.length && <p className="text-sm text-slate-400">No segments found. Create a segment first.</p>}
              {segments.map(s => (
                <button key={s.id} onClick={() => setSegmentId(s.id)} className={`w-full text-left p-4 rounded-xl border-2 transition-colors ${segmentId === s.id ? 'border-sky-400 bg-sky-50' : 'border-slate-200 hover:border-slate-300'}`}>
                  <div className="flex items-center justify-between">
                    <p className="text-sm font-semibold text-slate-800">{s.name}</p>
                    <span className="text-xs text-slate-500 flex items-center gap-1"><Users className="w-3.5 h-3.5" />{(s.estimated_count ?? 0).toLocaleString()}</span>
                  </div>
                  {s.description && <p className="text-xs text-slate-400 mt-0.5">{s.description}</p>}
                </button>
              ))}
            </div>
          )}

          {step === 2 && (
            <div className="space-y-3">
              <p className="text-xs font-semibold text-slate-500 uppercase tracking-wide mb-1">Select Template *</p>
              {!templates.length && <p className="text-sm text-slate-400">No templates found. Create a template first.</p>}
              {templates.map(t => (
                <button key={t.id} onClick={() => setTemplateId(t.id)} className={`w-full text-left p-4 rounded-xl border-2 transition-colors ${templateId === t.id ? 'border-sky-400 bg-sky-50' : 'border-slate-200 hover:border-slate-300'}`}>
                  <p className="text-sm font-semibold text-slate-800">{t.name}</p>
                  <p className="text-xs text-slate-400 mt-0.5">{t.subject_template}</p>
                </button>
              ))}
            </div>
          )}

          {step === 3 && (
            <div className="space-y-4">
              <div className="grid grid-cols-2 gap-3">
                <div>
                  <label className="text-xs font-semibold text-slate-500 uppercase tracking-wide">From Name *</label>
                  <input value={fromName} onChange={e => setFromName(e.target.value)} className={`mt-1 ${inputCls}`} />
                </div>
                <div>
                  <label className="text-xs font-semibold text-slate-500 uppercase tracking-wide">From Email *</label>
                  <input type="email" value={fromEmail} onChange={e => setFromEmail(e.target.value)} className={`mt-1 ${inputCls}`} />
                </div>
              </div>
              <div>
                <label className="text-xs font-semibold text-slate-500 uppercase tracking-wide">Reply-To (optional)</label>
                <input type="email" value={replyTo} onChange={e => setReplyTo(e.target.value)} className={`mt-1 ${inputCls}`} />
              </div>
              <div>
                <label className="text-xs font-semibold text-slate-500 uppercase tracking-wide">Subject Override (optional)</label>
                <input value={subjectOverride} onChange={e => setSubjectOverride(e.target.value)} className={`mt-1 ${inputCls}`} placeholder="Leave blank to use template subject" />
              </div>
              <div className="border-t border-slate-100 pt-4">
                <label className="text-xs font-semibold text-slate-500 uppercase tracking-wide">Send Test Email</label>
                <div className="flex gap-2 mt-1">
                  <input type="email" value={testEmail} onChange={e => setTestEmail(e.target.value)} className={inputCls} placeholder="your@email.com" />
                  <button onClick={handleTestSend} disabled={testSending || !testEmail || !templateId} className="px-3 py-2 bg-slate-100 text-slate-700 text-sm font-medium rounded-lg hover:bg-slate-200 disabled:opacity-50 whitespace-nowrap">
                    {testSending ? '...' : 'Send Test'}
                  </button>
                </div>
              </div>
            </div>
          )}

          {step === 4 && (
            <div className="space-y-4">
              <div className="bg-slate-50 rounded-xl p-4 space-y-3">
                <ReviewRow label="Name" value={name} />
                <ReviewRow label="Mode" value={sendMode === 'scheduled' ? `Scheduled: ${scheduledFor}` : 'Send immediately'} />
                <ReviewRow label="Audience" value={selectedSegment?.name ?? '—'} sub={`~${(selectedSegment?.estimated_count ?? 0).toLocaleString()} contacts`} />
                <ReviewRow label="Template" value={selectedTemplate?.name ?? '—'} sub={subjectOverride || selectedTemplate?.subject_template} />
                <ReviewRow label="From" value={`${fromName} <${fromEmail}>`} />
                {replyTo && <ReviewRow label="Reply-To" value={replyTo} />}
              </div>
              <div className="bg-amber-50 border border-amber-200 rounded-xl p-4 flex gap-2">
                <AlertCircle className="w-4 h-4 text-amber-500 shrink-0 mt-0.5" />
                <p className="text-xs text-amber-700">Sending is irreversible. Make sure the template, audience, and from details are correct before launching.</p>
              </div>
            </div>
          )}
        </div>

        <div className="flex items-center gap-2 px-6 py-4 border-t border-slate-100">
          {step > 0 && <button onClick={() => setStep(s => s - 1)} className="flex items-center gap-1 px-4 py-2.5 text-sm text-slate-600 border border-slate-200 rounded-lg hover:bg-slate-50"><ChevronLeft className="w-3.5 h-3.5" /> Back</button>}
          <button onClick={handleSaveDraft} disabled={saving || !name} className="px-4 py-2.5 text-sm text-slate-600 border border-slate-200 rounded-lg hover:bg-slate-50 disabled:opacity-50">
            {saving ? 'Saving...' : 'Save Draft'}
          </button>
          <div className="flex-1" />
          {step < STEPS.length - 1 ? (
            <button onClick={() => setStep(s => s + 1)} disabled={!canNext()} className="flex items-center gap-1.5 px-4 py-2.5 bg-slate-900 text-white text-sm font-medium rounded-lg hover:bg-slate-800 disabled:opacity-50">
              Next <ChevronRight className="w-3.5 h-3.5" />
            </button>
          ) : (
            <button onClick={handleSend} disabled={sending} className="flex items-center gap-1.5 px-5 py-2.5 bg-sky-600 text-white text-sm font-medium rounded-lg hover:bg-sky-700 disabled:opacity-50">
              <Send className="w-3.5 h-3.5" />{sending ? 'Launching...' : 'Launch Campaign'}
            </button>
          )}
        </div>
      </div>
    </div>
  );
}

function ReviewRow({ label, value, sub }: { label: string; value: string; sub?: string }) {
  return (
    <div className="flex items-start gap-3">
      <span className="text-xs font-semibold text-slate-400 uppercase tracking-wide w-20 shrink-0 mt-0.5">{label}</span>
      <div>
        <span className="text-sm text-slate-800">{value}</span>
        {sub && <p className="text-xs text-slate-400 mt-0.5">{sub}</p>}
      </div>
    </div>
  );
}

export default function EmCampaignsPage() {
  const [campaigns, setCampaigns] = useState<EmCampaign[]>([]);
  const [templates, setTemplates] = useState<EmTemplate[]>([]);
  const [segments, setSegments] = useState<EmSegment[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [modal, setModal] = useState<'create' | EmCampaign | null>(null);
  const [deleteId, setDeleteId] = useState<string | null>(null);

  const load = async () => {
    setLoading(true); setError(null);
    try {
      const [cRes, tRes, sRes] = await Promise.all([emApi.get('campaigns'), emApi.get('templates'), emApi.get('segments')]);
      setCampaigns(cRes.campaigns ?? []);
      setTemplates(tRes.templates ?? []);
      setSegments(sRes.segments ?? []);
    } catch (e: any) { setError(e.message); } finally { setLoading(false); }
  };

  useEffect(() => { load(); }, []);

  const handleDelete = async (id: string) => {
    try { await emApi.delete(`campaigns/${id}`); setDeleteId(null); load(); }
    catch (e: any) { alert(e.message); }
  };

  return (
    <EmailModuleLayout title="Email Marketing" subtitle="Campaigns">
      {modal && <CampaignWizard campaign={modal === 'create' ? null : modal} templates={templates} segments={segments} onClose={() => setModal(null)} onSaved={load} />}

      {deleteId && (
        <div className="fixed inset-0 z-50 flex items-center justify-center">
          <div className="absolute inset-0 bg-black/40 backdrop-blur-sm" onClick={() => setDeleteId(null)} />
          <div className="relative bg-white rounded-2xl p-6 shadow-2xl w-full max-w-sm">
            <h3 className="font-semibold text-slate-900 mb-2">Delete campaign?</h3>
            <p className="text-sm text-slate-500 mb-4">Send logs for this campaign will be preserved.</p>
            <div className="flex gap-2">
              <button onClick={() => handleDelete(deleteId)} className="flex-1 py-2 bg-red-600 text-white text-sm font-medium rounded-lg hover:bg-red-700">Delete</button>
              <button onClick={() => setDeleteId(null)} className="px-4 py-2 text-sm text-slate-600 border border-slate-200 rounded-lg hover:bg-slate-50">Cancel</button>
            </div>
          </div>
        </div>
      )}

      <div className="space-y-4">
        <div className="flex items-center justify-between">
          <div />
          <div className="flex items-center gap-2">
            <button onClick={load} className="p-2 rounded-lg border border-slate-200 text-slate-500 hover:bg-slate-50"><RefreshCw className="w-4 h-4" /></button>
            <button onClick={() => setModal('create')} className="flex items-center gap-1.5 px-3 py-2 bg-slate-900 text-white text-sm font-medium rounded-lg hover:bg-slate-800">
              <Plus className="w-3.5 h-3.5" /> New Campaign
            </button>
          </div>
        </div>

        {error && <div className="flex items-center gap-2 px-4 py-3 bg-red-50 border border-red-200 rounded-lg text-sm text-red-700"><AlertCircle className="w-4 h-4 shrink-0" />{error}</div>}

        {loading ? (
          <div className="space-y-3">{[...Array(4)].map((_, i) => <div key={i} className="h-24 bg-white border border-slate-200 rounded-xl animate-pulse" />)}</div>
        ) : !campaigns.length ? (
          <div className="text-center py-16 bg-white rounded-xl border border-slate-200">
            <Send className="w-8 h-8 mx-auto mb-2 text-slate-300" />
            <p className="text-sm font-medium text-slate-600 mb-1">No campaigns yet</p>
            <p className="text-xs text-slate-400 mb-4">Create and send broadcast emails to your audience</p>
            <button onClick={() => setModal('create')} className="px-4 py-2 bg-slate-900 text-white text-sm font-medium rounded-lg hover:bg-slate-800">Create First Campaign</button>
          </div>
        ) : (
          <div className="bg-white rounded-xl border border-slate-200 overflow-hidden">
            <table className="w-full text-sm">
              <thead className="bg-slate-50 border-b border-slate-100">
                <tr>
                  <th className="text-left px-5 py-3 text-xs font-semibold text-slate-500 uppercase tracking-wide">Campaign</th>
                  <th className="text-left px-4 py-3 text-xs font-semibold text-slate-500 uppercase tracking-wide">Status</th>
                  <th className="text-right px-4 py-3 text-xs font-semibold text-slate-500 uppercase tracking-wide">Sent</th>
                  <th className="text-right px-4 py-3 text-xs font-semibold text-slate-500 uppercase tracking-wide hidden md:table-cell">Opens</th>
                  <th className="text-right px-4 py-3 text-xs font-semibold text-slate-500 uppercase tracking-wide hidden lg:table-cell">Clicks</th>
                  <th className="text-right px-4 py-3 text-xs font-semibold text-slate-500 uppercase tracking-wide">Created</th>
                  <th className="px-4 py-3" />
                </tr>
              </thead>
              <tbody className="divide-y divide-slate-50">
                {campaigns.map(c => (
                  <tr key={c.id} className="hover:bg-slate-50 transition-colors group">
                    <td className="px-5 py-4">
                      <p className="font-medium text-slate-900">{c.name}</p>
                      {c.from_email && <p className="text-xs text-slate-400 mt-0.5">{c.from_name} &lt;{c.from_email}&gt;</p>}
                    </td>
                    <td className="px-4 py-4"><StatusBadge status={c.status} /></td>
                    <td className="px-4 py-4 text-right text-slate-600">{c.sent_count.toLocaleString()}<span className="text-slate-300 text-xs">/{c.total_recipients.toLocaleString()}</span></td>
                    <td className="px-4 py-4 text-right text-slate-600 hidden md:table-cell">
                      {c.sent_count > 0 ? `${Math.round((c.open_count / c.sent_count) * 100)}%` : '—'}
                    </td>
                    <td className="px-4 py-4 text-right text-slate-600 hidden lg:table-cell">
                      {c.sent_count > 0 ? `${Math.round((c.click_count / c.sent_count) * 100)}%` : '—'}
                    </td>
                    <td className="px-4 py-4 text-right text-xs text-slate-400">{new Date(c.created_at).toLocaleDateString()}</td>
                    <td className="px-4 py-4">
                      <div className="flex items-center gap-1 opacity-0 group-hover:opacity-100 transition-opacity justify-end">
                        {c.status === 'draft' && <button onClick={() => setModal(c)} className="p-1.5 rounded-lg hover:bg-slate-100 text-slate-400 hover:text-slate-600"><Eye className="w-3.5 h-3.5" /></button>}
                        <button onClick={() => setDeleteId(c.id)} className="p-1.5 rounded-lg hover:bg-red-50 text-slate-400 hover:text-red-500"><Trash2 className="w-3.5 h-3.5" /></button>
                      </div>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        )}
      </div>
    </EmailModuleLayout>
  );
}
