import { useEffect, useState, useCallback, useRef } from 'react';
import {
  Bell, Save, Send, RefreshCw, CheckCircle, AlertTriangle, Mail,
  ChevronDown, ChevronUp, X, Eye, Code,
  Plus, Copy, Check, Info, Clock,
} from 'lucide-react';
import WpAdminLayout from '../components/wpadmin/WpAdminLayout';
import { adminFetch, type AdminFetchOptions } from '../utils/adminFetch';
import EnhancedToggle from '../components/admin/EnhancedToggle';

// ── Types ─────────────────────────────────────────────────────────────────────

interface NotificationSetting {
  notification_type: string;
  is_enabled: boolean;
  recipient_emails: string;
  subject_template: string;
  body_html: string;
  body_text?: string;
  updated_at?: string;
}

interface NotificationLog {
  id: string;
  created_at: string;
  notification_type: string;
  is_test: boolean;
  to_emails: string;
  subject: string;
  status: 'sent' | 'failed' | 'queued';
  provider_message_id?: string;
  error_message?: string;
  payload?: Record<string, string>;
}

// ── Constants ─────────────────────────────────────────────────────────────────

const NOTIFICATION_TYPES: Record<string, { label: string; description: string; color: string }> = {
  get_matched: {
    label: 'Get Matched',
    description: 'Fires when a visitor submits the "Get Matched with an Agency" form',
    color: 'bg-sky-100 text-sky-700 border-sky-200',
  },
  sponsored_spotlight: {
    label: 'Sponsored Spotlight',
    description: 'Fires when an agency applies for a Featured Spotlight placement',
    color: 'bg-amber-100 text-amber-700 border-amber-200',
  },
  top25_submission: {
    label: 'Top 25 Submission',
    description: 'Fires when an agency submits to appear in the Top-25 directory',
    color: 'bg-emerald-100 text-emerald-700 border-emerald-200',
  },
  availability_check: {
    label: 'Availability Check',
    description: 'Fires when a client checks agency availability via the modal',
    color: 'bg-orange-100 text-orange-700 border-orange-200',
  },
  confirm_connection: {
    label: 'Confirm Connection',
    description: 'Fires when an agency owner completes the verification flow',
    color: 'bg-rose-100 text-rose-700 border-rose-200',
  },
  your_agency_profile_click: {
    label: '/your-agency Profile Click',
    description: 'Fires when a visitor searches and clicks an agency profile from the /your-agency searchbar',
    color: 'bg-teal-100 text-teal-700 border-teal-200',
  },
  stripe_sale: {
    label: 'Stripe Sale',
    description: 'Fires when a successful payment is received via Stripe (one-time or first subscription invoice)',
    color: 'bg-green-100 text-green-700 border-green-200',
  },
  activation_page_viewed: {
    label: 'Activation Page Viewed',
    description: 'Fires when a user reaches the activation step (drop-off signal — must precede checkout_opened)',
    color: 'bg-rose-100 text-rose-700 border-rose-200',
  },
  activation_option_selected: {
    label: 'Activation Option Selected',
    description: 'Fires when an agency owner selects an activation option (Standard, Top 25, or discounted) before checkout',
    color: 'bg-yellow-100 text-yellow-700 border-yellow-200',
  },
  stripe_checkout_opened: {
    label: 'Stripe Checkout Opened',
    description: 'Fires when a Stripe Checkout Session is successfully created and the visitor enters the payment stage',
    color: 'bg-sky-100 text-sky-700 border-sky-200',
  },
  manage_funnel_opened: {
    label: 'Manage Funnel Opened',
    description: 'Fires when an agency owner opens the manage listing page',
    color: 'bg-blue-100 text-blue-700 border-blue-200',
  },
  manage_remove_started: {
    label: 'Removal Intent',
    description: 'Fires when an agency owner starts the listing removal process',
    color: 'bg-red-100 text-red-700 border-red-200',
  },
  manage_recovered: {
    label: 'Recovery from Removal',
    description: 'Fires when an agency owner recovers from the removal funnel and keeps their listing',
    color: 'bg-emerald-100 text-emerald-700 border-emerald-200',
  },
  manage_remove_confirmed: {
    label: 'Listing Removed',
    description: 'Fires when an agency owner confirms removal of their listing',
    color: 'bg-slate-100 text-slate-700 border-slate-200',
  },
  replay_opened: {
    label: 'Replay Opened',
    description: 'Fires when an agency owner opens the Request Replay funnel for the first time in a session',
    color: 'bg-cyan-100 text-cyan-700 border-cyan-200',
  },
  replay_cta_click: {
    label: 'Replay CTA Clicked',
    description: 'Fires when an agency owner clicks the activation CTA inside the request replay funnel',
    color: 'bg-orange-100 text-orange-700 border-orange-200',
  },
  replay_completed: {
    label: 'Replay Completed',
    description: 'Fires when an agency owner watches the entire request replay sequence to completion',
    color: 'bg-emerald-100 text-emerald-700 border-emerald-200',
  },
};

const NOTIFICATION_TYPE_KEYS = Object.keys(NOTIFICATION_TYPES);

const VARIABLES = [
  { token: '{{company}}', description: 'Company or business name' },
  { token: '{{contact_name}}', description: 'Contact person\'s name' },
  { token: '{{agency}}', description: 'Agency name' },
  { token: '{{state}}', description: 'U.S. state' },
  { token: '{{email}}', description: 'Submitter email address' },
  { token: '{{phone}}', description: 'Phone number' },
  { token: '{{budget}}', description: 'Monthly budget' },
  { token: '{{timeline}}', description: 'Project timeline' },
  { token: '{{service_needed}}', description: 'Services requested' },
  { token: '{{submission_url}}', description: 'Link to admin submissions' },
  { token: '{{page_url}}', description: 'Page where form was submitted' },
  { token: '{{agency_slug}}', description: 'Agency slug (for /your-agency clicks)' },
  { token: '{{profile_url}}', description: 'Agency profile URL (for /your-agency clicks)' },
  { token: '{{search_query}}', description: 'Search query used (for /your-agency clicks)' },
  { token: '{{imported_agency_email_count}}', description: 'Number of imported emails found' },
  { token: '{{product}}', description: 'Product name (Stripe sales)' },
  { token: '{{listing_type}}', description: 'Listing type slug (Stripe sales)' },
  { token: '{{amount}}', description: 'Payment amount (Stripe sales)' },
  { token: '{{currency}}', description: 'Payment currency (Stripe sales)' },
  { token: '{{customer_email}}', description: 'Customer email (Stripe sales)' },
  { token: '{{customer_name}}', description: 'Customer name (Stripe sales)' },
  { token: '{{checkout_mode}}', description: 'Payment or subscription (Stripe sales)' },
  { token: '{{stripe_event_id}}', description: 'Stripe event ID (Stripe sales)' },
  { token: '{{agency_name}}', description: 'Agency name (checkout opened)' },
  { token: '{{state_name}}', description: 'State name (checkout opened)' },
  { token: '{{checkout_session_id}}', description: 'Stripe checkout session ID (checkout opened)' },
  { token: '{{position}}', description: 'Selected position e.g. Top 25 #2 (checkout opened)' },
  { token: '{{upsell_summary}}', description: 'Upsells selected summary (checkout opened)' },
  { token: '{{upsell_count}}', description: 'Number of upsells selected (checkout opened)' },
  { token: '{{offer_applied}}', description: 'Whether a discount offer was applied (checkout opened)' },
  { token: '{{discount_type}}', description: 'Discount type: percentage or fixed (checkout opened)' },
  { token: '{{discount_value}}', description: 'Discount value (checkout opened)' },
  { token: '{{offer_token}}', description: 'Offer/discount token (checkout opened)' },
  { token: '{{funnel_session_id}}', description: 'Funnel session ID (checkout opened)' },
  { token: '{{entry_path}}', description: 'Entry path / funnel source (checkout opened)' },
  { token: '{{basket_summary}}', description: 'Human-readable basket summary e.g. Premium Listing $297 + Card Visual $37 (checkout opened)' },
  { token: '{{subtotal}}', description: 'Basket subtotal before discount (checkout opened)' },
  { token: '{{discount_amount}}', description: 'Discount amount applied (checkout opened)' },
  { token: '{{total}}', description: 'Final total after discount (checkout opened)' },
  { token: '{{recurring_total}}', description: 'Recurring amount per 6 months (checkout opened)' },
  { token: '{{likelihood}}', description: 'Conversion likelihood: HIGH / MEDIUM / LOW (checkout opened)' },
  { token: '{{agency_email}}', description: 'Agency contact email address if available (checkout opened)' },
  { token: '{{selected_option}}', description: 'Human-readable selected option with price e.g. Top 25 #2 ($297) (option selected)' },
  { token: '{{selected_option_type}}', description: 'Option type: standard, top25, or standard_discounted (option selected)' },
  { token: '{{selected_rank}}', description: 'Top 25 rank selected e.g. 2 (option selected, top25 only)' },
  { token: '{{selected_price}}', description: 'Price of selected option e.g. $297 (option selected)' },
  { token: '{{discount_percent}}', description: 'Discount percentage applied e.g. 15 (option selected, discounted only)' },
  { token: '{{next_destination}}', description: 'Where the user is headed: Spotlight Confirm Page, Top 25 Confirm Page, etc. (option selected)' },
  { token: '{{your_agency_url}}', description: 'Agency profile URL on /your-agency (option selected)' },
  { token: '{{request_replay_url}}', description: 'Direct link to the Request Replay funnel for this agency (option selected)' },
  { token: '{{activation_url}}', description: 'URL of the activation page where option was selected (option selected)' },
  { token: '{{requests_30d}}', description: 'Total canonical requests in the last 30 days including admin overrides (option selected)' },
  { token: '{{most_recent_request}}', description: 'Human-readable timestamp of the most recent canonical request (option selected)' },
];

const DEFAULT_BODY_HTML = `<!DOCTYPE html>
<html>
<body style="font-family:sans-serif;background:#f8fafc;padding:32px;margin:0">
<div style="max-width:560px;margin:0 auto;background:#fff;border-radius:12px;border:1px solid #e2e8f0;overflow:hidden">
  <div style="background:#0f172a;padding:24px 28px">
    <h1 style="margin:0;font-size:20px;font-weight:700;color:#fff">New Submission</h1>
  </div>
  <div style="padding:24px 28px">
    <p style="margin:0 0 16px;font-size:15px;color:#111827">Hello,</p>
    <p style="margin:0 0 16px;font-size:15px;color:#374151">
      You have a new submission from <strong>{{company}}</strong> ({{contact_name}}).
    </p>
    <table width="100%" cellpadding="0" cellspacing="0" style="border-collapse:collapse;margin:20px 0">
      <tr><td style="padding:8px 12px;font-size:13px;color:#6b7280;width:140px">State</td><td style="padding:8px 12px;font-size:14px;color:#111827">{{state}}</td></tr>
      <tr style="background:#f9fafb"><td style="padding:8px 12px;font-size:13px;color:#6b7280">Email</td><td style="padding:8px 12px;font-size:14px;color:#111827">{{email}}</td></tr>
      <tr><td style="padding:8px 12px;font-size:13px;color:#6b7280">Phone</td><td style="padding:8px 12px;font-size:14px;color:#111827">{{phone}}</td></tr>
      <tr style="background:#f9fafb"><td style="padding:8px 12px;font-size:13px;color:#6b7280">Service</td><td style="padding:8px 12px;font-size:14px;color:#111827">{{service_needed}}</td></tr>
    </table>
    <a href="{{submission_url}}" style="background:#1d4ed8;color:#fff;padding:10px 20px;border-radius:8px;text-decoration:none;font-size:14px;font-weight:600;display:inline-block">View in Admin</a>
  </div>
</div>
</body>
</html>`;

// ── Helpers ───────────────────────────────────────────────────────────────────

function formatDate(iso: string) {
  if (!iso) return '—';
  return new Date(iso).toLocaleString('en-US', {
    month: 'short', day: 'numeric', hour: '2-digit', minute: '2-digit',
  });
}

function apiFetch(path: string, options: AdminFetchOptions = {}) {
  return adminFetch(`notification-settings-api/${path}`, options);
}

// ── Sub-components ────────────────────────────────────────────────────────────

function StatusBadge({ status, isTest }: { status: string; isTest?: boolean }) {
  const base = 'inline-flex items-center gap-1 text-xs font-semibold px-2 py-0.5 rounded-full';
  return (
    <span className="flex items-center gap-1.5">
      {status === 'sent' && (
        <span className={`${base} bg-emerald-100 text-emerald-700`}><CheckCircle className="w-3 h-3" />Sent</span>
      )}
      {status === 'failed' && (
        <span className={`${base} bg-red-100 text-red-600`}><AlertTriangle className="w-3 h-3" />Failed</span>
      )}
      {status === 'queued' && (
        <span className={`${base} bg-amber-100 text-amber-700`}><Clock className="w-3 h-3" />Queued</span>
      )}
      {isTest && <span className={`${base} bg-gray-100 text-gray-500`}>Test</span>}
    </span>
  );
}

function CopyButton({ text }: { text: string }) {
  const [copied, setCopied] = useState(false);
  const handleCopy = async () => {
    await navigator.clipboard.writeText(text);
    setCopied(true);
    setTimeout(() => setCopied(false), 1500);
  };
  return (
    <button onClick={handleCopy} className="p-1 rounded hover:bg-gray-100 transition-colors text-gray-400 hover:text-gray-600" title="Copy">
      {copied ? <Check className="w-3.5 h-3.5 text-emerald-500" /> : <Copy className="w-3.5 h-3.5" />}
    </button>
  );
}

// ── Email Editor Modal ────────────────────────────────────────────────────────

interface EditorModalProps {
  notifType: string;
  setting: NotificationSetting;
  onSave: (updated: Partial<NotificationSetting>) => void;
  onClose: () => void;
}

function EditorModal({ notifType, setting, onSave, onClose }: EditorModalProps) {
  const meta = NOTIFICATION_TYPES[notifType];
  const [subject, setSubject] = useState(setting.subject_template || '');
  const [bodyHtml, setBodyHtml] = useState(setting.body_html || DEFAULT_BODY_HTML);
  const [tab, setTab] = useState<'code' | 'preview'>('code');
  const [previewHtml, setPreviewHtml] = useState('');
  const [previewSubject, setPreviewSubject] = useState('');
  const [previewing, setPreviewing] = useState(false);
  const [saving, setSaving] = useState(false);
  const [saved, setSaved] = useState(false);
  const subjectRef = useRef<HTMLInputElement>(null);
  const bodyRef = useRef<HTMLTextAreaElement>(null);

  const loadPreview = useCallback(async () => {
    setPreviewing(true);
    try {
      const res = await apiFetch('preview', {
        method: 'POST',
        json: { notification_type: notifType, subject_template: subject, body_html: bodyHtml },
      });
      const data = await res.json();
      if (data.ok) {
        setPreviewHtml(data.html);
        setPreviewSubject(data.subject);
      }
    } finally {
      setPreviewing(false);
    }
  }, [notifType, subject, bodyHtml]);

  useEffect(() => {
    if (tab === 'preview') loadPreview();
  }, [tab, loadPreview]);

  const insertToken = (token: string, target: 'subject' | 'body') => {
    if (target === 'subject' && subjectRef.current) {
      const el = subjectRef.current;
      const start = el.selectionStart ?? subject.length;
      const end = el.selectionEnd ?? subject.length;
      const next = subject.slice(0, start) + token + subject.slice(end);
      setSubject(next);
      setTimeout(() => {
        el.focus();
        el.setSelectionRange(start + token.length, start + token.length);
      }, 0);
    } else if (target === 'body' && bodyRef.current) {
      const el = bodyRef.current;
      const start = el.selectionStart ?? bodyHtml.length;
      const end = el.selectionEnd ?? bodyHtml.length;
      const next = bodyHtml.slice(0, start) + token + bodyHtml.slice(end);
      setBodyHtml(next);
      setTimeout(() => {
        el.focus();
        el.setSelectionRange(start + token.length, start + token.length);
      }, 0);
    }
  };

  const handleSave = async () => {
    setSaving(true);
    try {
      await onSave({ subject_template: subject, body_html: bodyHtml });
      setSaved(true);
      setTimeout(() => setSaved(false), 2000);
    } finally {
      setSaving(false);
    }
  };

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center p-4" style={{ background: 'rgba(0,0,0,0.5)' }}>
      <div className="bg-white rounded-2xl shadow-2xl w-full max-w-5xl max-h-[92vh] flex flex-col overflow-hidden">
        {/* Header */}
        <div className="flex items-center justify-between px-6 py-4 border-b border-gray-100 shrink-0">
          <div className="flex items-center gap-3">
            <Mail className="w-5 h-5 text-blue-600" />
            <div>
              <h2 className="text-base font-semibold text-gray-900">Edit Email Template</h2>
              <p className="text-xs text-gray-500">{meta.label} — {notifType}</p>
            </div>
          </div>
          <button onClick={onClose} className="p-2 rounded-lg hover:bg-gray-100 text-gray-400 hover:text-gray-600 transition-colors">
            <X className="w-5 h-5" />
          </button>
        </div>

        <div className="flex flex-1 overflow-hidden">
          {/* Left: Editor */}
          <div className="flex-1 flex flex-col overflow-hidden border-r border-gray-100">
            {/* Subject */}
            <div className="px-6 py-4 border-b border-gray-100 shrink-0">
              <label className="block text-xs font-semibold text-gray-600 mb-1.5">Subject</label>
              <input
                ref={subjectRef}
                type="text"
                value={subject}
                onChange={e => setSubject(e.target.value)}
                placeholder="New {{form_type}} submission: {{company}}"
                className="w-full border border-gray-200 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
              />
              <div className="mt-2 flex flex-wrap gap-1.5">
                {['{{company}}', '{{contact_name}}', '{{agency}}', '{{state}}'].map(t => (
                  <button
                    key={t}
                    onClick={() => insertToken(t, 'subject')}
                    className="text-xs px-2 py-0.5 rounded-full bg-blue-50 text-blue-700 hover:bg-blue-100 border border-blue-200 font-mono transition-colors"
                  >
                    <Plus className="w-2.5 h-2.5 inline mr-0.5" />{t}
                  </button>
                ))}
              </div>
            </div>

            {/* Body tabs */}
            <div className="flex items-center gap-1 px-6 py-2 border-b border-gray-100 bg-gray-50 shrink-0">
              <button
                onClick={() => setTab('code')}
                className={`flex items-center gap-1.5 text-xs font-medium px-3 py-1.5 rounded-lg transition-colors ${tab === 'code' ? 'bg-white text-gray-900 shadow-sm border border-gray-200' : 'text-gray-500 hover:text-gray-700'}`}
              >
                <Code className="w-3.5 h-3.5" />HTML
              </button>
              <button
                onClick={() => setTab('preview')}
                className={`flex items-center gap-1.5 text-xs font-medium px-3 py-1.5 rounded-lg transition-colors ${tab === 'preview' ? 'bg-white text-gray-900 shadow-sm border border-gray-200' : 'text-gray-500 hover:text-gray-700'}`}
              >
                <Eye className="w-3.5 h-3.5" />Preview
                {previewing && <RefreshCw className="w-3 h-3 animate-spin ml-0.5" />}
              </button>
            </div>

            <div className="flex-1 overflow-hidden">
              {tab === 'code' ? (
                <textarea
                  ref={bodyRef}
                  value={bodyHtml}
                  onChange={e => setBodyHtml(e.target.value)}
                  spellCheck={false}
                  className="w-full h-full resize-none border-0 p-4 text-xs font-mono text-gray-700 focus:outline-none bg-gray-950 text-green-400 leading-relaxed"
                  style={{ minHeight: 0 }}
                />
              ) : (
                <div className="w-full h-full overflow-auto bg-gray-100 p-4">
                  {previewing ? (
                    <div className="flex items-center justify-center h-32 text-gray-400 text-sm gap-2">
                      <RefreshCw className="w-4 h-4 animate-spin" />Loading preview...
                    </div>
                  ) : (
                    <div>
                      {previewSubject && (
                        <div className="mb-3 p-3 bg-white rounded-lg border border-gray-200 text-sm">
                          <span className="text-xs text-gray-400 font-medium uppercase tracking-wide">Subject: </span>
                          <span className="text-gray-900 font-medium">{previewSubject}</span>
                        </div>
                      )}
                      <div className="bg-white rounded-xl shadow-sm overflow-hidden">
                        <iframe
                          srcDoc={previewHtml}
                          className="w-full border-0"
                          style={{ height: '480px' }}
                          title="Email preview"
                          sandbox="allow-same-origin"
                        />
                      </div>
                    </div>
                  )}
                </div>
              )}
            </div>
          </div>

          {/* Right: Variables sidebar */}
          <div className="w-64 flex flex-col overflow-hidden bg-gray-50 shrink-0">
            <div className="px-4 py-3 border-b border-gray-200">
              <p className="text-xs font-semibold text-gray-600 flex items-center gap-1.5">
                <Info className="w-3.5 h-3.5" />Variables
              </p>
              <p className="text-xs text-gray-400 mt-0.5">Click to insert at cursor</p>
            </div>
            <div className="flex-1 overflow-y-auto p-3 space-y-1.5">
              {VARIABLES.map(({ token, description }) => (
                <div key={token} className="bg-white rounded-lg border border-gray-200 p-2.5 hover:border-blue-300 transition-colors group">
                  <div className="flex items-center justify-between mb-0.5">
                    <code className="text-xs text-blue-700 font-mono">{token}</code>
                    <div className="flex gap-1 opacity-0 group-hover:opacity-100 transition-opacity">
                      <button
                        onClick={() => insertToken(token, 'subject')}
                        className="text-xs px-1.5 py-0.5 bg-blue-50 text-blue-600 rounded hover:bg-blue-100 border border-blue-200 transition-colors"
                        title="Insert in subject"
                      >
                        Subj
                      </button>
                      <button
                        onClick={() => insertToken(token, 'body')}
                        className="text-xs px-1.5 py-0.5 bg-gray-100 text-gray-600 rounded hover:bg-gray-200 border border-gray-200 transition-colors"
                        title="Insert in body"
                      >
                        Body
                      </button>
                    </div>
                  </div>
                  <p className="text-xs text-gray-400">{description}</p>
                </div>
              ))}
            </div>
          </div>
        </div>

        {/* Footer */}
        <div className="flex items-center justify-between px-6 py-4 border-t border-gray-100 bg-gray-50 shrink-0">
          <button
            onClick={onClose}
            className="text-sm text-gray-500 hover:text-gray-700 px-4 py-2 rounded-lg hover:bg-gray-100 transition-colors"
          >
            Cancel
          </button>
          <button
            onClick={handleSave}
            disabled={saving}
            className="flex items-center gap-2 bg-blue-600 hover:bg-blue-700 disabled:opacity-50 text-white text-sm font-medium px-5 py-2 rounded-lg transition-colors"
          >
            {saving ? <RefreshCw className="w-4 h-4 animate-spin" /> : saved ? <CheckCircle className="w-4 h-4" /> : <Save className="w-4 h-4" />}
            {saved ? 'Saved!' : 'Save Template'}
          </button>
        </div>
      </div>
    </div>
  );
}

// ── Notification Row ──────────────────────────────────────────────────────────

interface NotificationRowProps {
  notifType: string;
  setting: NotificationSetting;
  onChange: (field: keyof NotificationSetting, value: unknown) => void;
  onSave: () => Promise<void>;
  onOpenEditor: () => void;
}

function NotificationRow({ notifType, setting, onChange, onSave, onOpenEditor }: NotificationRowProps) {
  const meta = NOTIFICATION_TYPES[notifType];
  const [expanded, setExpanded] = useState(false);
  const [saving, setSaving] = useState(false);
  const [saveState, setSaveState] = useState<'idle' | 'ok' | 'fail'>('idle');
  const [testEmail, setTestEmail] = useState('');
  const [testSending, setTestSending] = useState(false);
  const [testState, setTestState] = useState<{ ok: boolean; msg: string } | null>(null);

  const handleSave = async () => {
    setSaving(true);
    setSaveState('idle');
    try {
      await onSave();
      setSaveState('ok');
    } catch {
      setSaveState('fail');
    } finally {
      setSaving(false);
      setTimeout(() => setSaveState('idle'), 3000);
    }
  };

  const handleTestSend = async () => {
    if (!testEmail || !testEmail.includes('@')) {
      setTestState({ ok: false, msg: 'Enter a valid email address' });
      return;
    }
    setTestSending(true);
    setTestState(null);
    try {
      const res = await apiFetch('test', {
        method: 'POST',
        json: { notification_type: notifType, to: testEmail },
      });
      const data = await res.json();
      setTestState({ ok: data.ok, msg: data.ok ? 'Test email sent successfully' : (data.error || 'Send failed') });
    } catch (e) {
      setTestState({ ok: false, msg: 'Network error — check your connection' });
    } finally {
      setTestSending(false);
    }
  };

  return (
    <div className="bg-white rounded-xl border border-gray-200 overflow-hidden">
      {/* Toggle row */}
      <div className="px-4 pt-4">
        <EnhancedToggle
          title={meta.label}
          description={meta.description}
          value={setting.is_enabled}
          onChange={(next) => onChange('is_enabled', next)}
          codeBadge={notifType}
        />
      </div>

      {/* Expand/collapse row */}
      <div
        className="flex items-center justify-between px-5 py-2.5 cursor-pointer hover:bg-gray-50 transition-colors border-t border-gray-100 mt-3"
        onClick={() => setExpanded(p => !p)}
      >
        <span className="text-xs font-medium text-gray-500">
          {expanded ? 'Hide settings' : 'Configure recipients & template'}
        </span>
        <div className="flex items-center gap-2">
          {setting.recipient_emails && !expanded && (
            <span className="text-xs text-gray-400 truncate max-w-xs hidden sm:block">{setting.recipient_emails}</span>
          )}
          {expanded ? <ChevronUp className="w-3.5 h-3.5 text-gray-400" /> : <ChevronDown className="w-3.5 h-3.5 text-gray-400" />}
        </div>
      </div>

      {expanded && (
        <div className="border-t border-gray-100 px-5 py-5 space-y-4">
          {/* Recipients */}
          <div>
            <label className="block text-xs font-semibold text-gray-600 mb-1">
              Recipient Emails <span className="font-normal text-gray-400">(comma-separated)</span>
            </label>
            <input
              type="text"
              value={setting.recipient_emails}
              onChange={e => onChange('recipient_emails', e.target.value)}
              placeholder="admin@example.com, alerts@example.com"
              className="w-full border border-gray-200 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
            />
          </div>

          {/* Subject (read-only display, edit via modal) */}
          <div>
            <label className="block text-xs font-semibold text-gray-600 mb-1">
              Subject Template
            </label>
            <div className="flex gap-2">
              <input
                type="text"
                value={setting.subject_template}
                onChange={e => onChange('subject_template', e.target.value)}
                placeholder="New {{form_type}} submission: {{company}}"
                className="flex-1 border border-gray-200 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
              />
              <button
                onClick={onOpenEditor}
                className="shrink-0 flex items-center gap-1.5 text-sm font-medium px-4 py-2 rounded-lg border border-gray-200 hover:border-blue-300 hover:bg-blue-50 text-gray-600 hover:text-blue-700 transition-colors"
              >
                <Code className="w-4 h-4" />Edit Body
              </button>
            </div>
            {setting.body_html ? (
              <p className="text-xs text-emerald-600 mt-1 flex items-center gap-1">
                <CheckCircle className="w-3 h-3" />Custom body template saved
              </p>
            ) : (
              <p className="text-xs text-gray-400 mt-1 flex items-center gap-1">
                <Info className="w-3 h-3" />No custom body — default template will be used
              </p>
            )}
          </div>

          {/* Test send */}
          <div className="pt-1 border-t border-gray-100">
            <label className="block text-xs font-semibold text-gray-600 mb-1.5">
              Send Test Email
            </label>
            <div className="flex gap-2">
              <input
                type="email"
                value={testEmail}
                onChange={e => setTestEmail(e.target.value)}
                placeholder="your@email.com"
                className="flex-1 border border-gray-200 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
                onKeyDown={e => e.key === 'Enter' && handleTestSend()}
              />
              <button
                onClick={handleTestSend}
                disabled={testSending}
                className="shrink-0 flex items-center gap-1.5 bg-gray-800 hover:bg-gray-900 disabled:opacity-50 text-white text-sm font-medium px-4 py-2 rounded-lg transition-colors"
              >
                {testSending ? <RefreshCw className="w-4 h-4 animate-spin" /> : <Send className="w-4 h-4" />}
                Send Test
              </button>
            </div>
            {testState && (
              <p className={`mt-1.5 text-xs font-medium flex items-center gap-1 ${testState.ok ? 'text-emerald-600' : 'text-red-600'}`}>
                {testState.ok ? <CheckCircle className="w-3.5 h-3.5" /> : <AlertTriangle className="w-3.5 h-3.5" />}
                {testState.msg}
              </p>
            )}
          </div>

          {/* Save row */}
          <div className="flex items-center gap-3 pt-1">
            <button
              onClick={handleSave}
              disabled={saving}
              className="flex items-center gap-2 bg-blue-600 hover:bg-blue-700 disabled:opacity-50 text-white text-sm font-medium px-4 py-2 rounded-lg transition-colors"
            >
              {saving ? <RefreshCw className="w-4 h-4 animate-spin" /> : <Save className="w-4 h-4" />}
              Save Settings
            </button>
            {saveState === 'ok' && (
              <span className="text-sm font-medium text-emerald-600 flex items-center gap-1">
                <CheckCircle className="w-4 h-4" />Saved
              </span>
            )}
            {saveState === 'fail' && (
              <span className="text-sm font-medium text-red-600 flex items-center gap-1">
                <AlertTriangle className="w-4 h-4" />Save failed — please try again
              </span>
            )}
          </div>
        </div>
      )}
    </div>
  );
}

// ── Main Page ─────────────────────────────────────────────────────────────────

export default function WpAdminEmailNotificationsPage() {
  const [settings, setSettings] = useState<Record<string, NotificationSetting>>({});
  const [logs, setLogs] = useState<NotificationLog[]>([]);
  const [loading, setLoading] = useState(true);
  const [logsLoading, setLogsLoading] = useState(false);
  const [logFilter, setLogFilter] = useState<string>('all');
  const [logStatusFilter, setLogStatusFilter] = useState<string>('all');
  const [editorOpen, setEditorOpen] = useState<string | null>(null);
  const [expandedLog, setExpandedLog] = useState<string | null>(null);

  const fetchSettings = useCallback(async () => {
    setLoading(true);
    try {
      const res = await apiFetch('settings');
      const data = await res.json();
      const map: Record<string, NotificationSetting> = {};
      if (data.settings) {
        for (const s of data.settings as NotificationSetting[]) {
          map[s.notification_type] = s;
        }
      }
      for (const nt of NOTIFICATION_TYPE_KEYS) {
        if (!map[nt]) {
          map[nt] = { notification_type: nt, is_enabled: true, recipient_emails: '', subject_template: '', body_html: '' };
        }
      }
      setSettings(map);
    } catch {
      const defaults: Record<string, NotificationSetting> = {};
      for (const nt of NOTIFICATION_TYPE_KEYS) {
        defaults[nt] = { notification_type: nt, is_enabled: true, recipient_emails: '', subject_template: '', body_html: '' };
      }
      setSettings(defaults);
    } finally {
      setLoading(false);
    }
  }, []);

  const fetchLogs = useCallback(async () => {
    setLogsLoading(true);
    try {
      const params = new URLSearchParams({ limit: '50' });
      if (logFilter !== 'all') params.set('notification_type', logFilter);
      if (logStatusFilter !== 'all') params.set('status', logStatusFilter);
      const res = await apiFetch(`logs?${params}`);
      const data = await res.json();
      setLogs(data.logs ?? []);
    } catch {
      setLogs([]);
    } finally {
      setLogsLoading(false);
    }
  }, [logFilter, logStatusFilter]);

  useEffect(() => { fetchSettings(); }, [fetchSettings]);
  useEffect(() => { fetchLogs(); }, [fetchLogs]);

  const updateSetting = (notifType: string, field: keyof NotificationSetting, value: unknown) => {
    setSettings(prev => ({ ...prev, [notifType]: { ...prev[notifType], [field]: value } }));
  };

  const saveSetting = async (notifType: string) => {
    const s = settings[notifType];
    if (!s) throw new Error('No setting');
    const res = await apiFetch('settings', {
      method: 'POST',
      json: {
        notification_type: notifType,
        is_enabled: s.is_enabled,
        recipient_emails: s.recipient_emails,
        subject_template: s.subject_template,
        body_html: s.body_html,
        body_text: s.body_text,
      },
    });
    const data = await res.json();
    if (!data.ok) throw new Error(data.error || 'Save failed');
  };

  const handleEditorSave = async (notifType: string, updates: Partial<NotificationSetting>) => {
    setSettings(prev => ({ ...prev, [notifType]: { ...prev[notifType], ...updates } }));
    const merged = { ...settings[notifType], ...updates };
    const res = await apiFetch('settings', {
      method: 'POST',
      json: {
        notification_type: notifType,
        is_enabled: merged.is_enabled,
        recipient_emails: merged.recipient_emails,
        subject_template: merged.subject_template,
        body_html: merged.body_html,
        body_text: merged.body_text,
      },
    });
    const data = await res.json();
    if (!data.ok) throw new Error(data.error || 'Save failed');
  };

  const editorSetting = editorOpen ? settings[editorOpen] : null;

  return (
    <WpAdminLayout title="Email Notifications" icon={<Bell className="w-5 h-5" />}>
      <div className="max-w-4xl mx-auto space-y-6">

        {/* Header */}
        <div className="bg-white rounded-xl border border-gray-200 p-6">
          <div className="flex items-start gap-4">
            <div className="w-10 h-10 bg-blue-100 rounded-lg flex items-center justify-center shrink-0">
              <Bell className="w-5 h-5 text-blue-600" />
            </div>
            <div>
              <h2 className="text-lg font-semibold text-gray-900">Internal Submission Notifications</h2>
              <p className="text-sm text-gray-500 mt-1">
                Configure email alerts for each form submission type. Each notification supports a custom subject and HTML body with personalization variables.
              </p>
            </div>
          </div>
        </div>

        {/* Per-notification settings */}
        {loading ? (
          <div className="bg-white rounded-xl border border-gray-200 p-8 text-center text-gray-400 text-sm">
            <RefreshCw className="w-5 h-5 animate-spin mx-auto mb-2" />
            Loading notification settings...
          </div>
        ) : (
          <div className="space-y-3">
            {NOTIFICATION_TYPE_KEYS.map(nt => (
              <NotificationRow
                key={nt}
                notifType={nt}
                setting={settings[nt]}
                onChange={(field, value) => updateSetting(nt, field, value)}
                onSave={() => saveSetting(nt)}
                onOpenEditor={() => setEditorOpen(nt)}
              />
            ))}
          </div>
        )}

        {/* Notification Log */}
        <div className="bg-white rounded-xl border border-gray-200 overflow-hidden">
          <div className="flex items-center justify-between px-5 py-4 border-b border-gray-100">
            <h3 className="text-sm font-semibold text-gray-700 flex items-center gap-2">
              <Mail className="w-4 h-4" />Recent Notification Log
            </h3>
            <button onClick={fetchLogs} className="text-gray-400 hover:text-gray-600 transition-colors" title="Refresh">
              <RefreshCw className={`w-4 h-4 ${logsLoading ? 'animate-spin' : ''}`} />
            </button>
          </div>

          {/* Filters */}
          <div className="flex gap-3 px-5 py-3 border-b border-gray-100 bg-gray-50 flex-wrap">
            <select
              value={logFilter}
              onChange={e => setLogFilter(e.target.value)}
              className="text-xs border border-gray-200 rounded-lg px-3 py-1.5 focus:outline-none focus:ring-2 focus:ring-blue-500 bg-white"
            >
              <option value="all">All types</option>
              {NOTIFICATION_TYPE_KEYS.map(nt => (
                <option key={nt} value={nt}>{NOTIFICATION_TYPES[nt].label}</option>
              ))}
            </select>
            <select
              value={logStatusFilter}
              onChange={e => setLogStatusFilter(e.target.value)}
              className="text-xs border border-gray-200 rounded-lg px-3 py-1.5 focus:outline-none focus:ring-2 focus:ring-blue-500 bg-white"
            >
              <option value="all">All statuses</option>
              <option value="sent">Sent</option>
              <option value="failed">Failed</option>
              <option value="queued">Queued</option>
            </select>
          </div>

          {logsLoading ? (
            <div className="p-8 text-center text-gray-400 text-sm">
              <RefreshCw className="w-4 h-4 animate-spin mx-auto mb-2" />Loading...
            </div>
          ) : logs.length === 0 ? (
            <div className="p-8 text-center text-gray-400 text-sm">No notifications logged yet.</div>
          ) : (
            <div className="divide-y divide-gray-50">
              {logs.map(log => (
                <div key={log.id}>
                  <div
                    className="flex items-center gap-3 px-5 py-3 hover:bg-gray-50 transition-colors cursor-pointer"
                    onClick={() => setExpandedLog(expandedLog === log.id ? null : log.id)}
                  >
                    <StatusBadge status={log.status} isTest={log.is_test} />
                    <div className="flex-1 min-w-0">
                      <div className="flex items-center gap-2 flex-wrap">
                        <span className="text-sm font-medium text-gray-800">
                          {NOTIFICATION_TYPES[log.notification_type]?.label ?? log.notification_type}
                        </span>
                        {log.subject && (
                          <span className="text-xs text-gray-400 truncate max-w-xs">{log.subject}</span>
                        )}
                      </div>
                      {log.to_emails && (
                        <p className="text-xs text-gray-400 mt-0.5 truncate">{log.to_emails}</p>
                      )}
                      {log.error_message && (
                        <p className="text-xs text-red-500 mt-0.5 truncate">{log.error_message}</p>
                      )}
                    </div>
                    <div className="flex items-center gap-2 shrink-0">
                      <span className="text-xs text-gray-400">{formatDate(log.created_at)}</span>
                      {expandedLog === log.id
                        ? <ChevronUp className="w-3.5 h-3.5 text-gray-400" />
                        : <ChevronDown className="w-3.5 h-3.5 text-gray-400" />}
                    </div>
                  </div>

                  {expandedLog === log.id && (
                    <div className="px-5 pb-4 bg-gray-50 border-t border-gray-100">
                      <div className="mt-3 space-y-2 text-xs">
                        <div className="flex gap-2">
                          <span className="text-gray-400 w-28 shrink-0">ID</span>
                          <span className="font-mono text-gray-700 flex items-center gap-1">{log.id}<CopyButton text={log.id} /></span>
                        </div>
                        <div className="flex gap-2">
                          <span className="text-gray-400 w-28 shrink-0">Type</span>
                          <span className="text-gray-700">{log.notification_type}</span>
                        </div>
                        <div className="flex gap-2">
                          <span className="text-gray-400 w-28 shrink-0">To</span>
                          <span className="text-gray-700">{log.to_emails}</span>
                        </div>
                        <div className="flex gap-2">
                          <span className="text-gray-400 w-28 shrink-0">Subject</span>
                          <span className="text-gray-700">{log.subject}</span>
                        </div>
                        <div className="flex gap-2">
                          <span className="text-gray-400 w-28 shrink-0">Time</span>
                          <span className="text-gray-700">{new Date(log.created_at).toISOString()}</span>
                        </div>
                        {log.error_message && (
                          <div className="flex gap-2">
                            <span className="text-gray-400 w-28 shrink-0">Error</span>
                            <span className="text-red-600 font-mono">{log.error_message}</span>
                          </div>
                        )}
                        {log.payload && Object.keys(log.payload).length > 0 && (
                          <div>
                            <div className="text-gray-400 mb-1">Payload</div>
                            <pre className="bg-gray-100 rounded-lg p-3 text-gray-700 overflow-auto max-h-48 text-xs leading-relaxed">{JSON.stringify(log.payload, null, 2)}</pre>
                          </div>
                        )}
                        <button
                          onClick={() => navigator.clipboard.writeText(JSON.stringify(log, null, 2))}
                          className="flex items-center gap-1.5 text-xs text-gray-500 hover:text-gray-700 mt-1 px-2 py-1 rounded border border-gray-200 hover:bg-white transition-colors"
                        >
                          <Copy className="w-3 h-3" />Copy diagnostics
                        </button>
                      </div>
                    </div>
                  )}
                </div>
              ))}
            </div>
          )}
        </div>
      </div>

      {/* Editor Modal */}
      {editorOpen && editorSetting && (
        <EditorModal
          notifType={editorOpen}
          setting={editorSetting}
          onSave={(updates) => handleEditorSave(editorOpen, updates)}
          onClose={() => setEditorOpen(null)}
        />
      )}
    </WpAdminLayout>
  );
}
