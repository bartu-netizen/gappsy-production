import { useState, useEffect } from 'react';
import { X, Send, AlertCircle, CheckCircle, RefreshCw, Eye, ChevronDown } from 'lucide-react';
import { emApi, EmContact, EmTemplate } from '../../hooks/useEmailMarketing';

const CONFIRM_THRESHOLD = 10;

interface QuickSendResult {
  sent_count: number;
  failed_count: number;
  suppressed_count: number;
  results: { email: string; status: string; error?: string }[];
}

interface Props {
  contacts: EmContact[];
  onClose: () => void;
}

function renderVars(template: string, contact: EmContact): string {
  const vars: Record<string, string> = {
    first_name: contact.first_name ?? '',
    last_name: contact.last_name ?? '',
    full_name: [contact.first_name, contact.last_name].filter(Boolean).join(' '),
    company_name: contact.company_name ?? '',
    state_name: contact.state_name ?? '',
    website: contact.website ?? '',
    email: contact.email,
  };
  return template.replace(/\{\{(\w+)\}\}/g, (_, k) => vars[k] ?? `{{${k}}}`);
}

export default function QuickSendModal({ contacts, onClose }: Props) {
  const [templates, setTemplates] = useState<EmTemplate[]>([]);
  const [selectedTemplate, setSelectedTemplate] = useState<EmTemplate | null>(null);
  const [subjectOverride, setSubjectOverride] = useState('');
  const [fromName, setFromName] = useState('Gappsy');
  const [loading, setLoading] = useState(false);
  const [templatesLoading, setTemplatesLoading] = useState(true);
  const [confirmText, setConfirmText] = useState('');
  const [result, setResult] = useState<QuickSendResult | null>(null);
  const [error, setError] = useState<string | null>(null);
  const [showPreview, setShowPreview] = useState(false);
  const [showRecipients, setShowRecipients] = useState(false);

  const isBulk = contacts.length > CONFIRM_THRESHOLD;
  const confirmRequired = isBulk;
  const canSend = selectedTemplate && (!confirmRequired || confirmText === 'CONFIRM');
  const previewContact = contacts[0];

  useEffect(() => {
    emApi.get('templates').then(res => {
      const list: EmTemplate[] = res.templates ?? [];
      setTemplates(list);
      if (list.length > 0) {
        setSelectedTemplate(list[0]);
        setSubjectOverride(list[0].subject_template);
      }
    }).catch(() => {}).finally(() => setTemplatesLoading(false));
  }, []);

  const handleTemplateChange = (id: string) => {
    const tpl = templates.find(t => t.id === id) ?? null;
    setSelectedTemplate(tpl);
    setSubjectOverride(tpl?.subject_template ?? '');
  };

  const handleSend = async () => {
    if (!selectedTemplate) return;
    setLoading(true); setError(null);
    try {
      const res = await emApi.post('send/quick', {
        contact_ids: contacts.map(c => c.id),
        template_id: selectedTemplate.id,
        subject_override: subjectOverride || undefined,
        from_name: fromName,
      });
      setResult(res);
    } catch (e: any) {
      const msg = e.message || 'Send failed';
      if (msg.includes('AUTH_REQUIRED') || msg.includes('session_expired')) {
        setError('Please log in again — your admin session has expired (AUTH_REQUIRED).');
      } else if (msg.includes('LIMIT_EXCEEDED')) {
        setError(msg);
      } else {
        setError(msg);
      }
    } finally { setLoading(false); }
  };

  if (result) {
    return (
      <div className="fixed inset-0 z-50 flex items-center justify-center p-4">
        <div className="absolute inset-0 bg-black/50 backdrop-blur-sm" onClick={onClose} />
        <div className="relative bg-white rounded-2xl shadow-2xl w-full max-w-md">
          <div className="p-6 text-center">
            <CheckCircle className="w-12 h-12 text-emerald-500 mx-auto mb-3" />
            <h3 className="text-lg font-semibold text-slate-900">Emails Sent</h3>
            <div className="grid grid-cols-3 gap-3 mt-5">
              {[
                { label: 'Sent', value: result.sent_count, color: 'text-emerald-700' },
                { label: 'Failed', value: result.failed_count, color: 'text-red-600' },
                { label: 'Suppressed', value: result.suppressed_count, color: 'text-slate-500' },
              ].map(s => (
                <div key={s.label} className="bg-slate-50 rounded-xl p-3 border border-slate-200">
                  <p className={`text-xl font-bold ${s.color}`}>{s.value}</p>
                  <p className="text-xs text-slate-500 mt-0.5">{s.label}</p>
                </div>
              ))}
            </div>
            {result.results.filter(r => r.status === 'failed').length > 0 && (
              <div className="mt-4 text-left bg-red-50 border border-red-200 rounded-xl p-3 max-h-32 overflow-y-auto">
                {result.results.filter(r => r.status === 'failed').map((r, i) => (
                  <p key={i} className="text-xs text-red-600">{r.email}: {r.error}</p>
                ))}
              </div>
            )}
            <button onClick={onClose} className="mt-5 w-full py-2.5 bg-slate-900 text-white text-sm font-medium rounded-lg hover:bg-slate-800">
              Close
            </button>
          </div>
        </div>
      </div>
    );
  }

  const handleBackdropClick = (e: React.MouseEvent<HTMLDivElement>) => {
    if (e.target === e.currentTarget) {
      e.preventDefault();
      e.stopPropagation();
    }
  };

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center p-4" onClick={handleBackdropClick}>
      <div className="absolute inset-0 bg-black/50 backdrop-blur-sm" onClick={handleBackdropClick} />
      <div className="relative bg-white rounded-2xl shadow-2xl w-full max-w-lg max-h-[92vh] flex flex-col overflow-hidden">

        <div className="flex items-center justify-between px-6 py-4 border-b border-slate-100">
          <div>
            <h2 className="text-base font-semibold text-slate-900">Quick Send Email</h2>
            <p className="text-xs text-slate-400 mt-0.5">
              {contacts.length === 1 ? `To: ${contacts[0].email}` : `To ${contacts.length} selected contacts`}
            </p>
          </div>
          <button onClick={onClose} className="p-2 rounded-lg hover:bg-slate-100 text-slate-400"><X className="w-4 h-4" /></button>
        </div>

        <div className="flex-1 overflow-y-auto p-6 space-y-5">

          {error && (
            <div className="flex items-start gap-2 px-4 py-3 bg-red-50 border border-red-200 rounded-xl text-sm text-red-700">
              <AlertCircle className="w-4 h-4 shrink-0 mt-0.5" />
              <span>{error}</span>
            </div>
          )}

          <div>
            <label className="text-xs font-semibold text-slate-500 uppercase tracking-wide">Email Template *</label>
            {templatesLoading ? (
              <div className="mt-1.5 h-10 bg-slate-100 rounded-lg animate-pulse" />
            ) : templates.length === 0 ? (
              <div className="mt-1.5 px-3 py-2.5 bg-amber-50 border border-amber-200 rounded-lg text-sm text-amber-700">
                No templates found. <a href="/wp-admin/email/templates" className="font-semibold underline">Create one first.</a>
              </div>
            ) : (
              <select
                value={selectedTemplate?.id ?? ''}
                onChange={e => handleTemplateChange(e.target.value)}
                className="mt-1.5 w-full text-sm border border-slate-200 rounded-lg px-3 py-2.5 focus:ring-2 focus:ring-sky-500 focus:border-transparent"
              >
                {templates.map(t => <option key={t.id} value={t.id}>{t.name}</option>)}
              </select>
            )}
          </div>

          <div>
            <label className="text-xs font-semibold text-slate-500 uppercase tracking-wide">Subject Line</label>
            <input
              type="text"
              value={subjectOverride}
              onChange={e => setSubjectOverride(e.target.value)}
              placeholder={selectedTemplate?.subject_template ?? 'Subject...'}
              className="mt-1.5 w-full text-sm border border-slate-200 rounded-lg px-3 py-2.5 focus:ring-2 focus:ring-sky-500 focus:border-transparent"
            />
            {previewContact && subjectOverride && (
              <p className="mt-1 text-xs text-slate-400">
                Preview: <span className="text-slate-600 italic">{renderVars(subjectOverride, previewContact)}</span>
              </p>
            )}
          </div>

          <div>
            <label className="text-xs font-semibold text-slate-500 uppercase tracking-wide">From Name</label>
            <input
              type="text"
              value={fromName}
              onChange={e => setFromName(e.target.value)}
              className="mt-1.5 w-full text-sm border border-slate-200 rounded-lg px-3 py-2.5 focus:ring-2 focus:ring-sky-500 focus:border-transparent"
            />
          </div>

          {selectedTemplate && previewContact && (
            <div className="border border-slate-200 rounded-xl overflow-hidden">
              <button
                onClick={() => setShowPreview(p => !p)}
                className="w-full flex items-center justify-between px-4 py-2.5 bg-slate-50 hover:bg-slate-100 transition-colors text-sm font-medium text-slate-700"
              >
                <div className="flex items-center gap-2"><Eye className="w-3.5 h-3.5 text-slate-400" /> Variable Preview</div>
                <ChevronDown className={`w-3.5 h-3.5 text-slate-400 transition-transform ${showPreview ? 'rotate-180' : ''}`} />
              </button>
              {showPreview && (
                <div className="p-4 bg-white border-t border-slate-100">
                  <p className="text-xs text-slate-500 mb-2">For <strong>{previewContact.first_name || previewContact.email}</strong>:</p>
                  <div className="grid grid-cols-2 gap-2 text-xs">
                    {[
                      ['{{first_name}}', previewContact.first_name || '(empty)'],
                      ['{{last_name}}', previewContact.last_name || '(empty)'],
                      ['{{company_name}}', previewContact.company_name || '(empty)'],
                      ['{{state_name}}', previewContact.state_name || '(empty)'],
                      ['{{email}}', previewContact.email],
                    ].map(([key, val]) => (
                      <div key={key} className="flex items-center gap-2">
                        <span className="font-mono text-sky-600 bg-sky-50 px-1.5 py-0.5 rounded">{key}</span>
                        <span className="text-slate-500 truncate">{val}</span>
                      </div>
                    ))}
                  </div>
                </div>
              )}
            </div>
          )}

          <div className="border border-slate-200 rounded-xl overflow-hidden">
            <button
              onClick={() => setShowRecipients(p => !p)}
              className="w-full flex items-center justify-between px-4 py-2.5 bg-slate-50 hover:bg-slate-100 transition-colors text-sm font-medium text-slate-700"
            >
              <span>{contacts.length} Recipient{contacts.length !== 1 ? 's' : ''}</span>
              <ChevronDown className={`w-3.5 h-3.5 text-slate-400 transition-transform ${showRecipients ? 'rotate-180' : ''}`} />
            </button>
            {showRecipients && (
              <div className="divide-y divide-slate-50 border-t border-slate-100 max-h-40 overflow-y-auto">
                {contacts.map(c => (
                  <div key={c.id} className="px-4 py-2 flex items-center gap-2">
                    <div className="w-6 h-6 rounded-full bg-slate-200 flex items-center justify-center text-xs font-medium text-slate-600 shrink-0">
                      {(c.first_name?.[0] || c.email[0]).toUpperCase()}
                    </div>
                    <div className="flex-1 min-w-0">
                      <p className="text-xs font-medium text-slate-700 truncate">
                        {c.first_name || c.last_name ? `${c.first_name ?? ''} ${c.last_name ?? ''}`.trim() : c.email}
                      </p>
                      <p className="text-xs text-slate-400 truncate">{c.email}</p>
                    </div>
                  </div>
                ))}
              </div>
            )}
          </div>

          {confirmRequired && (
            <div className="bg-amber-50 border border-amber-200 rounded-xl p-4">
              <p className="text-sm font-semibold text-amber-900 mb-1">Bulk Send Warning</p>
              <p className="text-xs text-amber-700 mb-3">
                You are about to send to <strong>{contacts.length} contacts</strong>. Type <strong>CONFIRM</strong> to proceed.
              </p>
              <input
                type="text"
                value={confirmText}
                onChange={e => setConfirmText(e.target.value)}
                placeholder="Type CONFIRM"
                className="w-full text-sm border border-amber-300 rounded-lg px-3 py-2 focus:ring-2 focus:ring-amber-400 focus:border-transparent bg-white"
              />
            </div>
          )}
        </div>

        <div className="flex gap-2 px-6 py-4 border-t border-slate-100">
          <button onClick={onClose} className="px-4 py-2.5 text-sm text-slate-600 border border-slate-200 rounded-lg hover:bg-slate-50">Cancel</button>
          <button
            onClick={handleSend}
            disabled={loading || !canSend}
            className="flex-1 flex items-center justify-center gap-2 py-2.5 bg-slate-900 text-white text-sm font-medium rounded-lg hover:bg-slate-800 disabled:opacity-50 disabled:cursor-not-allowed transition-colors"
          >
            {loading ? <RefreshCw className="w-3.5 h-3.5 animate-spin" /> : <Send className="w-3.5 h-3.5" />}
            {loading ? 'Sending...' : `Send to ${contacts.length} Contact${contacts.length !== 1 ? 's' : ''}`}
          </button>
        </div>
      </div>
    </div>
  );
}
