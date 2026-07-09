import { useState, useRef, useCallback } from 'react';
import { X, Send, AlertCircle, Info, Copy, CheckCircle } from 'lucide-react';

interface QuickSendOneToOneModalProps {
  isOpen: boolean;
  onClose: () => void;
  onSuccess?: (messageId: string) => void;
  templates?: Array<{ id: string; name: string; html_body: string; text_body?: string }>;
}

interface DebugInfo {
  requestUrl: string;
  requestMethod: string;
  headersPresent: string[];
  credentialsMode: string;
  fetchMode: string;
  responseStatus?: number;
  responseText?: string;
  exceptionName?: string;
  exceptionMessage?: string;
  exceptionStack?: string;
  phase: 'ping' | 'send' | 'idle';
  pingOk?: boolean;
  timestamp: string;
}

const SEND_URL = '/api/admin/email/quick-sends/send';
const PING_URL = '/api/admin/email/ping';

function getAdminToken(): string {
  return localStorage.getItem('gappsy_admin_token') ?? '';
}

function buildDebugText(d: DebugInfo): string {
  return [
    `[QS_SEND_DEBUG] timestamp: ${d.timestamp}`,
    `[QS_SEND_DEBUG] phase: ${d.phase}`,
    `[QS_SEND_DEBUG] url: ${d.requestUrl}`,
    `[QS_SEND_DEBUG] method: ${d.requestMethod}`,
    `[QS_SEND_DEBUG] headers_present: ${d.headersPresent.join(', ')}`,
    `[QS_SEND_DEBUG] credentials: ${d.credentialsMode}`,
    `[QS_SEND_DEBUG] mode: ${d.fetchMode}`,
    d.pingOk !== undefined ? `[QS_SEND_DEBUG] ping_ok: ${d.pingOk}` : null,
    d.responseStatus !== undefined ? `[QS_SEND_DEBUG] response_status: ${d.responseStatus}` : null,
    d.responseText ? `[QS_SEND_DEBUG] response_body: ${d.responseText.substring(0, 500)}` : null,
    d.exceptionName ? `[QS_SEND_DEBUG] exception: ${d.exceptionName}: ${d.exceptionMessage}` : null,
    d.exceptionStack ? `[QS_SEND_DEBUG] stack: ${d.exceptionStack.substring(0, 800)}` : null,
  ]
    .filter(Boolean)
    .join('\n');
}

export function QuickSendOneToOneModal({
  isOpen,
  onClose,
  onSuccess,
  templates = [],
}: QuickSendOneToOneModalProps) {
  const [step, setStep] = useState<'form' | 'builder' | 'review'>('form');
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [debugInfo, setDebugInfo] = useState<DebugInfo | null>(null);
  const [copied, setCopied] = useState(false);

  const [toEmail, setToEmail] = useState('');
  const [toName, setToName] = useState('');
  const [subject, setSubject] = useState('');
  const [htmlBody, setHtmlBody] = useState('');
  const [textBody, setTextBody] = useState('');
  const [useTemplate, setUseTemplate] = useState<string | null>(null);

  const editorRef = useRef<HTMLDivElement>(null);
  const isDebugMode = new URLSearchParams(window.location.search).get('debug') === '1';

  const handleUseTemplate = (templateId: string) => {
    const template = templates.find((t) => t.id === templateId);
    if (template) {
      setHtmlBody(template.html_body);
      setTextBody(template.text_body || '');
      setUseTemplate(templateId);
    }
  };

  const copyDebug = useCallback(async () => {
    if (!debugInfo) return;
    try {
      await navigator.clipboard.writeText(buildDebugText(debugInfo));
      setCopied(true);
      setTimeout(() => setCopied(false), 2000);
    } catch {
      /* ignore */
    }
  }, [debugInfo]);

  const handleSend = async () => {
    if (!toEmail.trim() || !subject.trim() || !htmlBody.trim()) {
      setError('Please fill in all required fields');
      return;
    }

    setLoading(true);
    setError(null);
    setDebugInfo(null);

    const adminToken = getAdminToken();
    const timestamp = new Date().toISOString();

    const baseDebug: DebugInfo = {
      requestUrl: SEND_URL,
      requestMethod: 'POST',
      headersPresent: [
        'Content-Type',
        adminToken ? 'x-admin-token (present, masked)' : 'x-admin-token (MISSING)',
      ],
      credentialsMode: 'same-origin',
      fetchMode: 'same-origin',
      phase: 'ping',
      timestamp,
    };

    if (isDebugMode) {
      setDebugInfo({ ...baseDebug });
    }

    console.log(`[QS_SEND_DEBUG] === Quick Send started at ${timestamp} ===`);
    console.log(`[QS_SEND_DEBUG] url: ${SEND_URL}`);
    console.log(`[QS_SEND_DEBUG] admin_token_present: ${!!adminToken}`);

    let pingOk = false;
    try {
      const pingRes = await fetch(PING_URL, { method: 'GET' });
      pingOk = pingRes.status === 200;
      console.log(`[QS_SEND_DEBUG] ping ${PING_URL} → ${pingRes.status} ok=${pingOk}`);
    } catch (pingErr) {
      console.error(`[QS_SEND_DEBUG] ping failed:`, pingErr);
    }

    if (isDebugMode) {
      setDebugInfo((prev) => ({ ...(prev ?? baseDebug), pingOk, phase: 'send' }));
    }

    if (!pingOk && isDebugMode) {
      console.error(`[QS_SEND_DEBUG] PING FAILED — /api routing is broken`);
    }

    const payload = {
      toEmail: toEmail.trim(),
      toName: toName.trim() || undefined,
      subject: subject.trim(),
      htmlBody,
      textBody: textBody || undefined,
    };

    console.log(`[QS_SEND_DEBUG] calling ${SEND_URL} with payload keys: ${Object.keys(payload).join(', ')}`);

    let responseStatus: number | undefined;
    let responseText: string | undefined;

    try {
      const res = await fetch(SEND_URL, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          ...(adminToken ? { 'x-admin-token': adminToken } : {}),
        },
        body: JSON.stringify(payload),
      });

      responseStatus = res.status;
      const rawText = await res.text();
      responseText = rawText;

      console.log(`[QS_SEND_DEBUG] response status: ${responseStatus}`);
      console.log(`[QS_SEND_DEBUG] response body (first 300): ${rawText.substring(0, 300)}`);

      let data: { ok?: boolean; id?: string; error?: string; phase?: string; upstream_body?: string } = {};
      try {
        data = JSON.parse(rawText);
      } catch {
        data = {};
      }

      if (isDebugMode) {
        setDebugInfo((prev) => ({
          ...(prev ?? baseDebug),
          responseStatus,
          responseText: rawText.substring(0, 600),
          phase: 'send',
          pingOk,
        }));
      }

      if (!res.ok) {
        const msg = data.error || `Server error ${responseStatus}`;
        console.error(`[QS_SEND_DEBUG] send failed: ${msg}`);
        setError(isDebugMode ? msg : 'Send failed. Please try again.');
        setLoading(false);
        return;
      }

      console.log(`[QS_SEND_DEBUG] SUCCESS — messageId: ${data.id}`);
      onSuccess?.(data.id ?? '');
      onClose();
    } catch (err) {
      const exName = err instanceof Error ? err.name : 'UnknownError';
      const exMsg = err instanceof Error ? err.message : String(err);
      const exStack = err instanceof Error ? (err.stack ?? '') : '';

      console.error(`[QS_SEND_DEBUG] EXCEPTION ${exName}: ${exMsg}`);
      console.error(`[QS_SEND_DEBUG] stack:`, exStack);

      if (isDebugMode) {
        setDebugInfo((prev) => ({
          ...(prev ?? baseDebug),
          responseStatus,
          responseText,
          exceptionName: exName,
          exceptionMessage: exMsg,
          exceptionStack: exStack,
          phase: 'send',
          pingOk,
        }));
      }

      setError(isDebugMode ? `${exName}: ${exMsg}` : 'Send failed. Please try again.');
    } finally {
      setLoading(false);
    }
  };

  if (!isOpen) return null;

  return (
    <div className="fixed inset-0 bg-black/50 z-50 flex items-center justify-center p-4">
      <div className="bg-white rounded-lg w-full max-w-2xl max-h-[90vh] overflow-hidden flex flex-col">
        <div className="flex items-center justify-between p-6 border-b">
          <h2 className="text-xl font-semibold">
            {step === 'form' ? 'Quick Send Email' : step === 'builder' ? 'Email Body' : 'Review'}
          </h2>
          <button onClick={onClose} className="text-gray-400 hover:text-gray-600">
            <X size={24} />
          </button>
        </div>

        <div className="flex-1 overflow-y-auto p-6">
          {error && (
            <div className="mb-4 space-y-2">
              <div className="p-3 bg-red-50 border border-red-200 rounded-lg flex gap-2">
                <AlertCircle size={20} className="text-red-600 flex-shrink-0 mt-0.5" />
                <p className="text-sm text-red-700">{error}</p>
              </div>

              {isDebugMode && debugInfo && (
                <div className="p-3 bg-amber-50 border border-amber-200 rounded-lg text-xs font-mono space-y-1">
                  <div className="flex items-center justify-between mb-2">
                    <p className="text-amber-900 font-bold text-sm">Network Debug (admin only)</p>
                    <button
                      onClick={copyDebug}
                      className="flex items-center gap-1 px-2 py-1 bg-amber-100 hover:bg-amber-200 rounded text-amber-800 text-xs"
                    >
                      {copied ? <CheckCircle size={12} /> : <Copy size={12} />}
                      {copied ? 'Copied' : 'Copy Debug'}
                    </button>
                  </div>
                  <p className="text-amber-800 break-all">
                    <span className="font-semibold">URL:</span> {debugInfo.requestUrl}
                  </p>
                  <p className="text-amber-800">
                    <span className="font-semibold">Method:</span> {debugInfo.requestMethod}
                  </p>
                  <p className="text-amber-800">
                    <span className="font-semibold">Headers:</span> {debugInfo.headersPresent.join(', ')}
                  </p>
                  <p className="text-amber-800">
                    <span className="font-semibold">Credentials:</span> {debugInfo.credentialsMode}
                  </p>
                  {debugInfo.pingOk !== undefined && (
                    <p className={debugInfo.pingOk ? 'text-green-700' : 'text-red-700 font-bold'}>
                      <span className="font-semibold">Ping ({PING_URL}):</span>{' '}
                      {debugInfo.pingOk ? '✓ reachable' : '✗ UNREACHABLE — /api routing broken'}
                    </p>
                  )}
                  {debugInfo.responseStatus !== undefined && (
                    <p className="text-amber-800">
                      <span className="font-semibold">HTTP Status:</span> {debugInfo.responseStatus}
                    </p>
                  )}
                  {debugInfo.responseText && (
                    <p className="text-amber-800 break-all max-h-28 overflow-y-auto">
                      <span className="font-semibold">Response:</span>{' '}
                      {debugInfo.responseText.substring(0, 500)}
                    </p>
                  )}
                  {debugInfo.exceptionName && (
                    <p className="text-red-800 font-bold break-all">
                      <span className="font-semibold">Exception:</span> {debugInfo.exceptionName}:{' '}
                      {debugInfo.exceptionMessage}
                    </p>
                  )}
                  {debugInfo.exceptionStack && (
                    <p className="text-red-700 break-all max-h-28 overflow-y-auto whitespace-pre-wrap">
                      {debugInfo.exceptionStack.substring(0, 600)}
                    </p>
                  )}
                </div>
              )}
            </div>
          )}

          {step === 'form' && (
            <div className="space-y-4">
              <div className="p-3 bg-blue-50 border border-blue-200 rounded-lg flex gap-2">
                <Info size={16} className="text-blue-600 flex-shrink-0 mt-0.5" />
                <p className="text-xs text-blue-700">
                  Sender name and email are configured globally in Email Settings.
                </p>
              </div>

              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">To Email *</label>
                <input
                  type="email"
                  value={toEmail}
                  onChange={(e) => setToEmail(e.target.value)}
                  placeholder="recipient@example.com"
                  className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                />
              </div>

              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Recipient Name</label>
                <input
                  type="text"
                  value={toName}
                  onChange={(e) => setToName(e.target.value)}
                  placeholder="John Doe"
                  className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                />
              </div>

              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Subject *</label>
                <input
                  type="text"
                  value={subject}
                  onChange={(e) => setSubject(e.target.value)}
                  placeholder="Email subject"
                  className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                />
              </div>

              {templates.length > 0 && (
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">
                    Use Template (Optional)
                  </label>
                  <select
                    value={useTemplate || ''}
                    onChange={(e) => {
                      if (e.target.value) handleUseTemplate(e.target.value);
                    }}
                    className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                  >
                    <option value="">Start from scratch...</option>
                    {templates.map((t) => (
                      <option key={t.id} value={t.id}>
                        {t.name}
                      </option>
                    ))}
                  </select>
                </div>
              )}
            </div>
          )}

          {step === 'builder' && (
            <div className="space-y-4">
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">
                  Email Body (HTML) *
                </label>
                <textarea
                  ref={editorRef}
                  value={htmlBody}
                  onChange={(e) => setHtmlBody(e.target.value)}
                  placeholder="<h1>Hello!</h1><p>Your email content here...</p>"
                  className="w-full h-64 px-3 py-2 border border-gray-300 rounded-lg font-mono text-sm focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                />
              </div>

              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">
                  Plain Text Version (Optional)
                </label>
                <textarea
                  value={textBody}
                  onChange={(e) => setTextBody(e.target.value)}
                  placeholder="Plain text version of your email..."
                  className="w-full h-32 px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                />
              </div>

              <div className="bg-blue-50 p-3 rounded-lg border border-blue-200">
                <p className="text-sm text-blue-700">
                  Links will be automatically tracked. A tracking pixel will be added for opens.
                </p>
              </div>
            </div>
          )}

          {step === 'review' && (
            <div className="space-y-4">
              <div className="bg-gray-50 p-4 rounded-lg border border-gray-200">
                <h3 className="font-semibold text-sm mb-3">Message Preview</h3>
                <div className="space-y-2 text-sm">
                  <div>
                    <span className="text-gray-600">To:</span>{' '}
                    <span className="font-medium">
                      {toName ? `${toName} <${toEmail}>` : toEmail}
                    </span>
                  </div>
                  <div>
                    <span className="text-gray-600">Subject:</span>{' '}
                    <span className="font-medium">{subject}</span>
                  </div>
                  <div className="pt-2 border-t border-gray-200 mt-2">
                    <p className="text-xs text-gray-500">Sender identity from global Email Settings</p>
                  </div>
                </div>
              </div>

              <div>
                <h3 className="font-semibold text-sm mb-2">Body Preview</h3>
                <div
                  className="bg-white border border-gray-200 rounded-lg p-4 max-h-64 overflow-y-auto prose prose-sm max-w-none"
                  dangerouslySetInnerHTML={{ __html: htmlBody }}
                />
              </div>
            </div>
          )}
        </div>

        <div className="border-t p-6 flex gap-3 justify-end">
          {step === 'form' && (
            <>
              <button
                onClick={onClose}
                className="px-4 py-2 text-gray-700 bg-gray-100 hover:bg-gray-200 rounded-lg font-medium"
              >
                Cancel
              </button>
              <button
                onClick={() => setStep('builder')}
                className="px-4 py-2 bg-blue-600 hover:bg-blue-700 text-white rounded-lg font-medium"
              >
                Next
              </button>
            </>
          )}

          {step === 'builder' && (
            <>
              <button
                onClick={() => setStep('form')}
                className="px-4 py-2 text-gray-700 bg-gray-100 hover:bg-gray-200 rounded-lg font-medium"
              >
                Back
              </button>
              <button
                onClick={() => setStep('review')}
                className="px-4 py-2 bg-blue-600 hover:bg-blue-700 text-white rounded-lg font-medium"
              >
                Review
              </button>
            </>
          )}

          {step === 'review' && (
            <>
              <button
                onClick={() => setStep('builder')}
                className="px-4 py-2 text-gray-700 bg-gray-100 hover:bg-gray-200 rounded-lg font-medium"
              >
                Back
              </button>
              <button
                onClick={handleSend}
                disabled={loading}
                className="px-4 py-2 bg-green-600 hover:bg-green-700 disabled:bg-gray-400 text-white rounded-lg font-medium flex items-center gap-2"
              >
                <Send size={18} />
                {loading ? 'Sending...' : 'Send Now'}
              </button>
            </>
          )}
        </div>
      </div>
    </div>
  );
}
