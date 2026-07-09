import { useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import {
  Mail, RefreshCw, Send, CheckCircle, XCircle, AlertCircle,
  Clock, RotateCcw, LogIn, ChevronDown, ChevronUp, Info,
  Wifi, WifiOff, Copy, Check,
} from 'lucide-react';
import EmailModuleLayout from '../../components/wpadmin/EmailModuleLayout';
import { adminFetch } from '../../utils/adminFetch';
import { supabase } from '../../lib/supabase';

const SUPABASE_URL = import.meta.env.VITE_SUPABASE_URL as string;

interface SmtpVars {
  SMTP_HOST: boolean;
  SMTP_PORT: boolean;
  SMTP_USERNAME: boolean;
  SMTP_PASSWORD: boolean;
  SMTP_FROM_SUPPORT: boolean;
  SMTP_INTERNAL_EMAIL: boolean;
}

interface SmtpDetails {
  host: string | null;
  hostFull: string | null;
  portNumber: number | null;
  fromSupport: string | null;
  internalEmail: string | null;
}

interface StatusResponse {
  ok: boolean;
  action: string;
  vars: SmtpVars;
  details: SmtpDetails;
  configured: boolean;
  missing: string[];
  present?: string[];
  error?: string;
  message?: string;
  hint?: string | null;
  request_id?: string;
}

interface CheckResponse {
  ok: boolean;
  action: string;
  stage: string;
  error_code: string | null;
  error_message: string | null;
  host: string | null;
  port: number | null;
  encryption: string | null;
  auth: string | null;
  starttls: boolean | null;
  request_id?: string;
  hint?: string | null;
}

interface SendTestResponse {
  ok: boolean;
  error?: string;
  message?: string;
  request_id?: string;
}

interface SendLog {
  id: string;
  created_at: string;
  to_email: string;
  template_id: string;
  subject: string;
  status: 'sent' | 'failed';
  error_code: string | null;
  error_message: string | null;
  request_id: string | null;
}

interface FetchError {
  type: 'network' | 'http' | 'auth';
  message: string;
  detail?: string;
  status?: number;
  url?: string;
}

const LOCAL_TEMPLATES = [
  { key: 'basic', label: 'Basic Test Email', description: 'Simple test message' },
  { key: 'welcome', label: 'Welcome Email', description: 'Welcome message for new users' },
  { key: 'notification', label: 'Notification', description: 'Generic notification template' },
];

export default function EmSmtpPage() {
  const navigate = useNavigate();
  const [loading, setLoading] = useState(false);
  const [checking, setChecking] = useState(false);
  const [status, setStatus] = useState<StatusResponse | null>(null);
  const [checkResult, setCheckResult] = useState<CheckResponse | null>(null);
  const [fetchError, setFetchError] = useState<FetchError | null>(null);
  const [showErrorDetail, setShowErrorDetail] = useState(false);
  const [selectedTemplate, setSelectedTemplate] = useState('basic');
  const [testEmail, setTestEmail] = useState('bartu@gappsy.com');
  const [alert, setAlert] = useState<{ type: 'success' | 'error'; message: string; requestId?: string; detail?: string } | null>(null);
  const [showAlertDetail, setShowAlertDetail] = useState(false);
  const [logs, setLogs] = useState<SendLog[]>([]);
  const [logsLoading, setLogsLoading] = useState(false);
  const [copied, setCopied] = useState(false);

  const FUNCTION_URL = `${SUPABASE_URL}/functions/v1/smtp-test`;

  const fetchStatus = async () => {
    setLoading(true);
    setAlert(null);
    setFetchError(null);
    setShowErrorDetail(false);
    setCheckResult(null);
    try {
      let response: Response;
      try {
        response = await adminFetch('smtp-test', {
          method: 'POST',
          body: JSON.stringify({ action: 'status' }),
        });
      } catch (networkErr: unknown) {
        const msg = networkErr instanceof Error ? networkErr.message : String(networkErr);
        setFetchError({
          type: 'network',
          message: 'Network error — could not reach the SMTP edge function.',
          detail: msg,
          url: FUNCTION_URL,
        });
        return;
      }

      let data: StatusResponse;
      try {
        data = await response.json();
      } catch {
        const raw = await response.text().catch(() => '(could not read body)');
        setFetchError({
          type: 'http',
          message: `HTTP ${response.status} — server returned non-JSON response.`,
          detail: raw,
          status: response.status,
          url: FUNCTION_URL,
        });
        return;
      }

      if (response.status === 401 || response.status === 403) {
        setFetchError({
          type: 'auth',
          message: data.message ?? 'Not authorized. Your admin session may have expired.',
          detail: data.hint ?? undefined,
          status: response.status,
          url: FUNCTION_URL,
        });
        return;
      }

      if (!response.ok) {
        setFetchError({
          type: 'http',
          message: `HTTP ${response.status} — ${data.message ?? data.error ?? 'Unknown server error'}`,
          detail: data.hint ?? JSON.stringify(data),
          status: response.status,
          url: FUNCTION_URL,
        });
        return;
      }

      setStatus(data);
    } finally {
      setLoading(false);
    }
  };

  const runConnectivityCheck = async () => {
    setChecking(true);
    setCheckResult(null);
    setAlert(null);
    try {
      let response: Response;
      try {
        response = await adminFetch('smtp-test', {
          method: 'POST',
          body: JSON.stringify({ action: 'check' }),
        });
      } catch (networkErr: unknown) {
        const msg = networkErr instanceof Error ? networkErr.message : String(networkErr);
        setAlert({ type: 'error', message: `Network error: ${msg}`, detail: `URL: ${FUNCTION_URL}` });
        return;
      }

      const data: CheckResponse = await response.json();
      setCheckResult(data);
    } catch (e: unknown) {
      const msg = e instanceof Error ? e.message : String(e);
      setAlert({ type: 'error', message: msg });
    } finally {
      setChecking(false);
    }
  };

  const loadLogs = async () => {
    setLogsLoading(true);
    try {
      const { data } = await supabase
        .from('email_send_logs')
        .select('*')
        .order('created_at', { ascending: false })
        .limit(10);
      if (data) setLogs(data as SendLog[]);
    } catch {
      // non-critical
    } finally {
      setLogsLoading(false);
    }
  };

  const handleSendTest = async () => {
    if (!testEmail || !testEmail.includes('@')) {
      setAlert({ type: 'error', message: 'Please enter a valid email address' });
      return;
    }
    setLoading(true);
    setAlert(null);
    setShowAlertDetail(false);
    try {
      const template = LOCAL_TEMPLATES.find(t => t.key === selectedTemplate);
      const subject = template ? `Gappsy SMTP Test - ${template.label}` : 'Gappsy SMTP Test';

      let response: Response;
      try {
        response = await adminFetch('smtp-test', {
          method: 'POST',
          body: JSON.stringify({
            action: 'sendTest',
            to: testEmail,
            subject,
            templateId: selectedTemplate,
            text: `This is a test email from Gappsy Email Center.\n\nTemplate: ${template?.label || 'Basic'}\nSent at: ${new Date().toLocaleString()}`,
            html: `<div style="font-family: Arial, sans-serif; max-width: 600px; margin: 0 auto; padding: 20px;"><h2 style="color: #1e293b;">Gappsy SMTP Test</h2><p style="color: #374151;">Your SMTP configuration is working. Template: <strong>${template?.label || 'Basic'}</strong>. Sent at: ${new Date().toLocaleString()}</p></div>`,
          }),
        });
      } catch (networkErr: unknown) {
        const msg = networkErr instanceof Error ? networkErr.message : String(networkErr);
        setAlert({ type: 'error', message: `Network error: ${msg}`, detail: `URL: ${FUNCTION_URL}` });
        return;
      }

      const data: SendTestResponse = await response.json();

      if (response.status === 401 || response.status === 403) {
        setAlert({
          type: 'error',
          message: 'Not authorized — session expired.',
          detail: data.message,
        });
        return;
      }

      if (data.ok) {
        setAlert({
          type: 'success',
          message: `Test email sent to ${testEmail}`,
          requestId: data.request_id,
        });
        await loadLogs();
      } else {
        setAlert({
          type: 'error',
          message: data.message ?? data.error ?? 'Send failed',
          requestId: data.request_id,
        });
        await loadLogs();
      }
    } catch (e: unknown) {
      const msg = e instanceof Error ? e.message : String(e);
      setAlert({ type: 'error', message: msg });
    } finally {
      setLoading(false);
    }
  };

  const copyDiagnostics = () => {
    const lines: string[] = [
      `=== SMTP Diagnostics ===`,
      `Timestamp: ${new Date().toISOString()}`,
    ];

    if (status) {
      lines.push(`Status request_id: ${status.request_id ?? 'n/a'}`);
      lines.push(`Configured: ${status.configured}`);
      lines.push(`Missing vars: ${status.missing?.join(', ') || 'none'}`);
      if (status.details?.hostFull) lines.push(`Host: ${status.details.hostFull}`);
      if (status.details?.portNumber) lines.push(`Port: ${status.details.portNumber}`);
    }

    if (checkResult) {
      lines.push(`--- Connectivity Check ---`);
      lines.push(`Check request_id: ${checkResult.request_id ?? 'n/a'}`);
      lines.push(`Connected: ${checkResult.ok}`);
      lines.push(`Host: ${checkResult.host ?? 'n/a'}:${checkResult.port ?? 'n/a'}`);
      lines.push(`Stage: ${checkResult.stage ?? 'n/a'}`);
      if (checkResult.error_code) lines.push(`Error code: ${checkResult.error_code}`);
      if (checkResult.error_message) lines.push(`Error: ${checkResult.error_message}`);
    }

    navigator.clipboard.writeText(lines.join('\n')).then(() => {
      setCopied(true);
      setTimeout(() => setCopied(false), 2000);
    });
  };

  useEffect(() => {
    fetchStatus();
    loadLogs();
  }, []);

  const isFullyConfigured = status?.configured ?? false;
  const hostDisplay = status?.details?.hostFull
    ? `${status.details.hostFull}:${status.details.portNumber ?? '?'}`
    : null;

  return (
    <EmailModuleLayout title="Email Marketing" subtitle="SMTP Configuration">
      <div className="space-y-5 max-w-3xl">

        {fetchError && (
          <div className="bg-red-50 border border-red-200 rounded-xl overflow-hidden">
            <div className="flex items-start gap-3 px-4 py-3">
              <AlertCircle className="w-4 h-4 shrink-0 mt-0.5 text-red-500" />
              <div className="flex-1 min-w-0">
                <p className="text-sm font-semibold text-red-800">
                  {fetchError.type === 'network' ? 'Network error — could not reach function' :
                   fetchError.type === 'auth' ? 'Authentication failed' :
                   'Server error'}
                </p>
                <p className="text-sm text-red-700 mt-0.5 break-words">{fetchError.message}</p>
                {fetchError.url && (
                  <p className="mt-1 font-mono text-xs text-red-500 break-all">
                    URL: {fetchError.url}
                  </p>
                )}
                {fetchError.status && (
                  <span className="mt-1 inline-block font-mono text-xs bg-red-100 text-red-600 px-1.5 py-0.5 rounded">
                    HTTP {fetchError.status}
                  </span>
                )}
                {fetchError.detail && (
                  <button
                    onClick={() => setShowErrorDetail(v => !v)}
                    className="mt-1.5 flex items-center gap-1 text-xs text-red-500 hover:text-red-700"
                  >
                    {showErrorDetail ? <ChevronUp className="w-3 h-3" /> : <ChevronDown className="w-3 h-3" />}
                    {showErrorDetail ? 'Hide details' : 'Show details'}
                  </button>
                )}
                {showErrorDetail && fetchError.detail && (
                  <pre className="mt-2 text-xs bg-red-100 text-red-700 rounded p-2 overflow-x-auto whitespace-pre-wrap break-all">
                    {fetchError.detail}
                  </pre>
                )}
              </div>
              <div className="flex flex-col items-end gap-2 shrink-0">
                <button
                  onClick={fetchStatus}
                  disabled={loading}
                  className="flex items-center gap-1 text-xs text-red-600 hover:text-red-800 font-medium disabled:opacity-50"
                >
                  <RotateCcw className="w-3 h-3" />
                  Retry
                </button>
                {fetchError.type === 'auth' && (
                  <button
                    onClick={() => navigate('/wp-admin')}
                    className="flex items-center gap-1 text-xs text-slate-600 hover:text-slate-800 font-medium"
                  >
                    <LogIn className="w-3 h-3" />
                    Re-login
                  </button>
                )}
              </div>
            </div>
            {fetchError.type === 'auth' && (
              <div className="px-4 py-2.5 bg-amber-50 border-t border-amber-200 flex items-start gap-2">
                <Info className="w-3.5 h-3.5 text-amber-600 shrink-0 mt-0.5" />
                <p className="text-xs text-amber-700">
                  Your admin session has expired. Click <strong>Re-login</strong> to sign back in.
                  Your admin token is stored in localStorage as <code className="bg-amber-100 px-1 rounded">gappsy_admin_token</code>.
                </p>
              </div>
            )}
          </div>
        )}

        {alert && (
          <div className={`rounded-xl border overflow-hidden ${alert.type === 'success' ? 'bg-emerald-50 border-emerald-200' : 'bg-red-50 border-red-200'}`}>
            <div className={`flex items-start gap-3 px-4 py-3 text-sm ${alert.type === 'success' ? 'text-emerald-800' : 'text-red-700'}`}>
              {alert.type === 'success'
                ? <CheckCircle className="w-4 h-4 shrink-0 mt-0.5" />
                : <XCircle className="w-4 h-4 shrink-0 mt-0.5" />}
              <div className="flex-1 min-w-0">
                <p>{alert.message}</p>
                {alert.requestId && (
                  <p className="mt-1 font-mono text-xs opacity-60">request_id: {alert.requestId}</p>
                )}
                {alert.detail && (
                  <>
                    <button
                      onClick={() => setShowAlertDetail(v => !v)}
                      className="mt-1 flex items-center gap-1 text-xs opacity-60 hover:opacity-100"
                    >
                      {showAlertDetail ? <ChevronUp className="w-3 h-3" /> : <ChevronDown className="w-3 h-3" />}
                      {showAlertDetail ? 'Hide details' : 'Show details'}
                    </button>
                    {showAlertDetail && (
                      <pre className="mt-2 text-xs bg-black/5 rounded p-2 overflow-x-auto whitespace-pre-wrap">{alert.detail}</pre>
                    )}
                  </>
                )}
              </div>
            </div>
          </div>
        )}

        <div className="bg-white rounded-xl border border-slate-200 overflow-hidden">
          <div className="flex items-center justify-between px-5 py-4 border-b border-slate-100 bg-slate-50">
            <div className="flex items-center gap-2">
              <Mail className="w-4 h-4 text-slate-400" />
              <h2 className="text-sm font-semibold text-slate-800">SMTP Configuration Status</h2>
            </div>
            <div className="flex items-center gap-2">
              <button
                onClick={copyDiagnostics}
                disabled={!status && !checkResult}
                className="flex items-center gap-1.5 px-3 py-1.5 text-sm text-slate-600 border border-slate-200 rounded-lg hover:border-slate-300 hover:bg-slate-50 disabled:opacity-40 transition-colors"
                title="Copy diagnostics to clipboard"
              >
                {copied ? <Check className="w-3.5 h-3.5 text-emerald-600" /> : <Copy className="w-3.5 h-3.5" />}
                {copied ? 'Copied' : 'Copy diagnostics'}
              </button>
              <button
                onClick={fetchStatus}
                disabled={loading}
                className="flex items-center gap-1.5 px-3 py-1.5 text-sm text-slate-600 border border-slate-200 rounded-lg hover:border-slate-300 hover:bg-slate-50 disabled:opacity-50 transition-colors"
              >
                <RefreshCw className={`w-3.5 h-3.5 ${loading ? 'animate-spin' : ''}`} />
                Refresh
              </button>
            </div>
          </div>

          <div className="p-5">
            {!status && !fetchError ? (
              <div className="grid grid-cols-2 md:grid-cols-3 gap-3">
                {[...Array(6)].map((_, i) => <div key={i} className="h-9 bg-slate-100 rounded-lg animate-pulse" />)}
              </div>
            ) : status ? (
              <div className="space-y-4">
                <div className={`flex items-start gap-3 p-4 rounded-xl border-2 ${isFullyConfigured ? 'bg-slate-50 border-slate-200' : 'bg-amber-50 border-amber-200'}`}>
                  {isFullyConfigured ? (
                    <>
                      <Info className="w-5 h-5 text-slate-400 shrink-0 mt-0.5" />
                      <div className="flex-1">
                        <p className="text-sm font-semibold text-slate-800">All SMTP secrets are set</p>
                        <p className="text-xs text-slate-500 mt-0.5">Variables are present — run the connectivity check below to verify the server is reachable.</p>
                        {hostDisplay && (
                          <p className="mt-1.5 text-xs font-mono text-slate-600 bg-white border border-slate-200 rounded px-2 py-1 inline-block">
                            Using host: {hostDisplay}
                          </p>
                        )}
                      </div>
                    </>
                  ) : (
                    <>
                      <XCircle className="w-5 h-5 text-amber-600 shrink-0 mt-0.5" />
                      <div>
                        <p className="text-sm font-semibold text-amber-900">SMTP Incomplete</p>
                        <p className="text-xs text-amber-700 mt-0.5">
                          Missing: <span className="font-mono font-semibold">{status.missing?.join(', ') || 'some variables'}</span>
                        </p>
                        {status.hint && (
                          <p className="text-xs text-amber-600 mt-1 flex items-start gap-1">
                            <Info className="w-3 h-3 shrink-0 mt-0.5" />
                            {status.hint}
                          </p>
                        )}
                      </div>
                    </>
                  )}
                </div>

                <div className="grid grid-cols-2 md:grid-cols-3 gap-2">
                  {([
                    { label: 'SMTP_HOST', value: status.vars.SMTP_HOST },
                    { label: 'SMTP_PORT', value: status.vars.SMTP_PORT },
                    { label: 'SMTP_USERNAME', value: status.vars.SMTP_USERNAME },
                    { label: 'SMTP_PASSWORD', value: status.vars.SMTP_PASSWORD },
                    { label: 'SMTP_FROM_SUPPORT', value: status.vars.SMTP_FROM_SUPPORT },
                    { label: 'SMTP_INTERNAL_EMAIL', value: status.vars.SMTP_INTERNAL_EMAIL },
                  ] as const).map(item => (
                    <div key={item.label} className={`flex items-center gap-2 px-3 py-2 rounded-lg text-xs font-medium ${item.value ? 'bg-emerald-50 text-emerald-700' : 'bg-red-50 text-red-700'}`}>
                      {item.value ? <CheckCircle className="w-3.5 h-3.5 shrink-0" /> : <XCircle className="w-3.5 h-3.5 shrink-0" />}
                      {item.label}
                    </div>
                  ))}
                </div>

                {(status.details.fromSupport || status.details.internalEmail || status.details.portNumber) && (
                  <div className="pt-3 border-t border-slate-100 grid md:grid-cols-3 gap-3 text-sm">
                    {status.details.portNumber && <div><span className="text-xs font-semibold text-slate-500 uppercase tracking-wide">Port</span><p className="text-slate-800 mt-0.5">{status.details.portNumber}</p></div>}
                    {status.details.fromSupport && <div><span className="text-xs font-semibold text-slate-500 uppercase tracking-wide">From</span><p className="text-slate-800 mt-0.5">{status.details.fromSupport}</p></div>}
                    {status.details.internalEmail && <div><span className="text-xs font-semibold text-slate-500 uppercase tracking-wide">Internal</span><p className="text-slate-800 mt-0.5">{status.details.internalEmail}</p></div>}
                  </div>
                )}

                {status.request_id && (
                  <p className="text-[10px] text-slate-300 font-mono">req: {status.request_id}</p>
                )}
              </div>
            ) : null}
          </div>
        </div>

        {isFullyConfigured && (
          <div className="bg-white rounded-xl border border-slate-200 overflow-hidden">
            <div className="flex items-center justify-between px-5 py-4 border-b border-slate-100 bg-slate-50">
              <div className="flex items-center gap-2">
                <Wifi className="w-4 h-4 text-slate-400" />
                <h2 className="text-sm font-semibold text-slate-800">Connectivity Check</h2>
                <span className="text-xs text-slate-400">— real TCP connection test</span>
              </div>
            </div>
            <div className="p-5 space-y-4">
              {checkResult && (
                <div className={`flex items-start gap-3 p-4 rounded-xl border-2 ${checkResult.ok ? 'bg-emerald-50 border-emerald-200' : 'bg-red-50 border-red-200'}`}>
                  {checkResult.ok ? (
                    <>
                      <CheckCircle className="w-5 h-5 text-emerald-600 shrink-0 mt-0.5" />
                      <div className="flex-1">
                        <p className="text-sm font-semibold text-emerald-900">SMTP Verified</p>
                        <p className="text-xs text-emerald-700 mt-0.5">
                          TCP connection to <span className="font-mono font-semibold">{checkResult.host}:{checkResult.port}</span> succeeded.
                        </p>
                        <div className="flex items-center gap-2 mt-2 flex-wrap">
                          <span className="inline-flex items-center gap-1 text-xs font-mono px-2 py-0.5 rounded-full border bg-white border-emerald-200 text-emerald-700">
                            Encryption: {checkResult.encryption === 'ssl_tls' ? 'SSL/TLS' : checkResult.encryption === 'off' ? 'OFF' : checkResult.encryption ?? 'off'}
                          </span>
                          <span className="inline-flex items-center gap-1 text-xs font-mono px-2 py-0.5 rounded-full border bg-white border-emerald-200 text-emerald-700">
                            Auth: {checkResult.auth ?? 'on'}
                          </span>
                          {checkResult.starttls === false && checkResult.encryption !== 'ssl_tls' && (
                            <span className="inline-flex items-center gap-1 text-xs font-mono px-2 py-0.5 rounded-full border bg-white border-slate-200 text-slate-500">
                              STARTTLS: off
                            </span>
                          )}
                        </div>
                        {checkResult.request_id && (
                          <p className="mt-1.5 font-mono text-[10px] text-emerald-600 opacity-60">req: {checkResult.request_id}</p>
                        )}
                      </div>
                    </>
                  ) : (
                    <>
                      <WifiOff className="w-5 h-5 text-red-500 shrink-0 mt-0.5" />
                      <div className="flex-1">
                        <p className="text-sm font-semibold text-red-900">Connection Failed</p>
                        {checkResult.host && (
                          <p className="text-xs text-red-700 mt-0.5 font-mono">
                            {checkResult.host}:{checkResult.port}
                          </p>
                        )}
                        <div className="mt-1.5 flex items-center gap-2 flex-wrap">
                          {checkResult.error_code && (
                            <span className="font-mono text-xs bg-red-100 text-red-700 px-2 py-0.5 rounded font-semibold">
                              {checkResult.error_code}
                            </span>
                          )}
                          {checkResult.stage && (
                            <span className="text-xs text-red-500">stage: {checkResult.stage}</span>
                          )}
                        </div>
                        {checkResult.error_message && (
                          <p className="text-xs text-red-700 mt-1.5">{checkResult.error_message}</p>
                        )}
                        {checkResult.hint && (
                          <p className="text-xs text-red-600 mt-1.5 flex items-start gap-1">
                            <Info className="w-3 h-3 shrink-0 mt-0.5" />
                            {checkResult.hint}
                          </p>
                        )}
                        {checkResult.request_id && (
                          <p className="mt-1.5 font-mono text-[10px] text-red-400">req: {checkResult.request_id}</p>
                        )}
                      </div>
                    </>
                  )}
                </div>
              )}

              <button
                onClick={runConnectivityCheck}
                disabled={checking}
                className="flex items-center gap-2 px-5 py-2.5 bg-slate-900 text-white text-sm font-medium rounded-lg hover:bg-slate-800 disabled:opacity-50 disabled:cursor-not-allowed transition-colors"
              >
                {checking
                  ? <RefreshCw className="w-3.5 h-3.5 animate-spin" />
                  : <Wifi className="w-3.5 h-3.5" />}
                {checking ? 'Checking connection...' : checkResult ? 'Re-check connectivity' : 'Check connectivity'}
              </button>

              {hostDisplay && !checkResult && (
                <p className="text-xs text-slate-400 flex items-center gap-1.5">
                  <Info className="w-3.5 h-3.5" />
                  Will test TCP connection to <span className="font-mono">{hostDisplay}</span>
                </p>
              )}
            </div>
          </div>
        )}

        <div className="bg-white rounded-xl border border-slate-200 overflow-hidden">
          <div className="flex items-center gap-2 px-5 py-4 border-b border-slate-100 bg-slate-50">
            <Send className="w-4 h-4 text-slate-400" />
            <h2 className="text-sm font-semibold text-slate-800">Send Test Email</h2>
          </div>
          <div className="p-5 space-y-4">
            <div className="grid sm:grid-cols-2 gap-4">
              <div>
                <label className="text-xs font-semibold text-slate-500 uppercase tracking-wide">Template</label>
                <select
                  value={selectedTemplate}
                  onChange={e => setSelectedTemplate(e.target.value)}
                  className="mt-1.5 w-full text-sm border border-slate-200 rounded-lg px-3 py-2 focus:ring-2 focus:ring-sky-500 focus:border-transparent"
                >
                  {LOCAL_TEMPLATES.map(t => (
                    <option key={t.key} value={t.key}>{t.label} — {t.description}</option>
                  ))}
                </select>
              </div>
              <div>
                <label className="text-xs font-semibold text-slate-500 uppercase tracking-wide">Recipient Email</label>
                <input
                  type="email"
                  value={testEmail}
                  onChange={e => setTestEmail(e.target.value)}
                  placeholder="your-email@example.com"
                  className="mt-1.5 w-full text-sm border border-slate-200 rounded-lg px-3 py-2 focus:ring-2 focus:ring-sky-500 focus:border-transparent"
                />
              </div>
            </div>
            <div className="flex items-center gap-3 flex-wrap">
              <button
                onClick={handleSendTest}
                disabled={loading || !testEmail || !isFullyConfigured}
                className="flex items-center gap-2 px-5 py-2.5 bg-slate-900 text-white text-sm font-medium rounded-lg hover:bg-slate-800 disabled:opacity-50 disabled:cursor-not-allowed transition-colors"
              >
                <Send className="w-3.5 h-3.5" />
                {loading ? 'Sending...' : 'Send Test Email'}
              </button>
              <button
                onClick={() => { setTestEmail('support@gappsy.com'); }}
                className="text-xs text-slate-500 hover:text-slate-700 underline"
              >
                Use support@gappsy.com
              </button>
              <button
                onClick={() => { setTestEmail('bartu@gappsy.com'); }}
                className="text-xs text-slate-500 hover:text-slate-700 underline"
              >
                Use bartu@gappsy.com
              </button>
            </div>
            {status && !isFullyConfigured && (
              <p className="text-xs text-slate-500 flex items-center gap-1.5">
                <AlertCircle className="w-3.5 h-3.5 text-amber-500" />
                Configure all SMTP variables before sending.
              </p>
            )}
            {isFullyConfigured && checkResult && !checkResult.ok && (
              <p className="text-xs text-red-500 flex items-center gap-1.5">
                <AlertCircle className="w-3.5 h-3.5" />
                Connectivity check failed ({checkResult.error_code}). Sending may fail.
              </p>
            )}
          </div>
        </div>

        <div className="bg-white rounded-xl border border-slate-200 overflow-hidden">
          <div className="flex items-center justify-between px-5 py-4 border-b border-slate-100 bg-slate-50">
            <div className="flex items-center gap-2">
              <Clock className="w-4 h-4 text-slate-400" />
              <h2 className="text-sm font-semibold text-slate-800">Recent Send Attempts</h2>
            </div>
            <button
              onClick={loadLogs}
              disabled={logsLoading}
              className="flex items-center gap-1.5 px-3 py-1.5 text-sm text-slate-600 border border-slate-200 rounded-lg hover:border-slate-300 hover:bg-slate-50 disabled:opacity-50 transition-colors"
            >
              <RefreshCw className={`w-3.5 h-3.5 ${logsLoading ? 'animate-spin' : ''}`} />
              Refresh
            </button>
          </div>
          <div className="divide-y divide-slate-100">
            {logsLoading ? (
              <div className="p-5 space-y-2">
                {[...Array(3)].map((_, i) => <div key={i} className="h-8 bg-slate-100 rounded animate-pulse" />)}
              </div>
            ) : logs.length === 0 ? (
              <div className="p-5 text-sm text-slate-400 text-center">No send attempts yet.</div>
            ) : (
              logs.map(log => (
                <div key={log.id} className="px-5 py-3 flex items-start gap-3 text-sm">
                  <div className={`mt-0.5 shrink-0 w-2 h-2 rounded-full ${log.status === 'sent' ? 'bg-emerald-500' : 'bg-red-500'}`} />
                  <div className="flex-1 min-w-0">
                    <div className="flex items-center gap-2 flex-wrap">
                      <span className="font-medium text-slate-800 truncate">{log.to_email}</span>
                      <span className={`text-xs font-semibold px-1.5 py-0.5 rounded-full ${log.status === 'sent' ? 'bg-emerald-100 text-emerald-700' : 'bg-red-100 text-red-700'}`}>
                        {log.status === 'sent' ? 'Sent' : 'Failed'}
                      </span>
                      {log.error_code && (
                        <span className="font-mono text-xs text-red-500 bg-red-50 px-1.5 py-0.5 rounded">{log.error_code}</span>
                      )}
                    </div>
                    <p className="text-xs text-slate-500 mt-0.5 truncate">{log.subject}</p>
                    {log.error_message && (
                      <p className="text-xs text-red-500 mt-0.5 truncate">{log.error_message}</p>
                    )}
                    {log.request_id && (
                      <p className="font-mono text-[10px] text-slate-400 mt-0.5">id: {log.request_id}</p>
                    )}
                  </div>
                  <span className="shrink-0 text-xs text-slate-400 whitespace-nowrap">
                    {new Date(log.created_at).toLocaleTimeString()}
                  </span>
                </div>
              ))
            )}
          </div>
        </div>

        <div className="bg-slate-50 rounded-xl border border-slate-200 p-5 space-y-4">
          <h3 className="text-sm font-semibold text-slate-800">How to Configure SMTP</h3>
          <ol className="space-y-2 text-sm text-slate-600">
            <li className="flex gap-2.5"><span className="font-semibold text-sky-600 shrink-0">1.</span>Go to <strong>Supabase Dashboard</strong> → Project Settings → <strong>Edge Functions</strong> → <strong>Secrets</strong></li>
            <li className="flex gap-2.5"><span className="font-semibold text-sky-600 shrink-0">2.</span>Add the following secrets (one per row):</li>
          </ol>
          <div className="bg-white border border-slate-200 rounded-lg p-3.5 font-mono text-xs text-slate-700 space-y-1">
            {[
              'SMTP_HOST = send.smtp.com',
              'SMTP_PORT = 2525',
              'SMTP_USERNAME = your-smtp.com-username',
              'SMTP_PASSWORD = your-smtp.com-api-key',
              'SMTP_FROM_SUPPORT = support@gappsy.com',
              'SMTP_INTERNAL_EMAIL = support@gappsy.com',
            ].map(line => (
              <div key={line}>{line}</div>
            ))}
          </div>

          <div className="bg-sky-50 border border-sky-200 rounded-lg p-3.5 flex gap-2.5">
            <Info className="w-4 h-4 text-sky-600 shrink-0 mt-0.5" />
            <div className="text-xs text-sky-800 space-y-1.5">
              <p className="font-semibold">SMTP.com — Port 2525 Settings (required)</p>
              <ul className="space-y-1 list-disc list-inside">
                <li>Host: <code className="bg-sky-100 px-1 rounded">send.smtp.com</code></li>
                <li>Port: <code className="bg-sky-100 px-1 rounded">2525</code></li>
                <li>Encryption: <strong>OFF</strong> — do not enable SSL/TLS or STARTTLS for port 2525</li>
                <li>Authentication: <strong>ON</strong> — username + password/API key required</li>
              </ul>
              <p className="text-sky-700">The server automatically uses <code className="bg-sky-100 px-1 rounded">ignoreTLS: true</code> for any port that is not 465, ensuring no STARTTLS upgrade is attempted.</p>
            </div>
          </div>

          <div className="bg-amber-50 border border-amber-200 rounded-lg p-3.5 flex gap-2.5">
            <Info className="w-4 h-4 text-amber-600 shrink-0 mt-0.5" />
            <div className="text-xs text-amber-800 space-y-1">
              <p><strong>Important:</strong> Secrets must be added in <strong>Supabase Edge Functions Secrets</strong>, NOT in the Bolt/Vite environment (.env file). The <code className="bg-amber-100 px-1 rounded">.env</code> file only applies to the frontend.</p>
              <p>After adding secrets, click <strong>Refresh</strong> above — no redeployment is needed.</p>
            </div>
          </div>
          <ol start={3} className="space-y-2 text-sm text-slate-600">
            <li className="flex gap-2.5"><span className="font-semibold text-sky-600 shrink-0">3.</span>Click <strong>Refresh</strong> to verify all variables are detected</li>
            <li className="flex gap-2.5"><span className="font-semibold text-sky-600 shrink-0">4.</span>Run <strong>Check connectivity</strong> — confirm it shows <strong>Encryption: OFF, Auth: on, STARTTLS: off</strong></li>
            <li className="flex gap-2.5"><span className="font-semibold text-sky-600 shrink-0">5.</span>Send a test email to confirm end-to-end delivery</li>
          </ol>
        </div>
      </div>
    </EmailModuleLayout>
  );
}
