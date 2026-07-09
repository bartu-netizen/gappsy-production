import { useState } from 'react';
import { AlertTriangle, CheckCircle, Loader, RotateCcw } from 'lucide-react';

const SUPABASE_URL = import.meta.env.VITE_SUPABASE_URL as string;
const SUPABASE_ANON_KEY = import.meta.env.VITE_SUPABASE_ANON_KEY as string;

interface DiagnosticEmailRow {
  id: string;
  email_normalized: string;
  agency_id: string | null;
  agency_name: string | null;
  state_slug: string;
  validation_status: string;
  verification_external_status: string | null;
  verification_external_reason: string | null;
  verification_bucket_source: string | null;
  verification_state: string;
  verification_attempt_count: number;
  verification_next_retry_at: string | null;
  validation_checked_at: string | null;
  updated_at: string;
}

interface DiagnosticData {
  total_retry_count: number;
  total_failed_count: number;
  sample_count: number;
  samples: DiagnosticEmailRow[];
  analysis: {
    retry_with_scheduled_next: number;
    failed_max_retries: number;
    has_clean_bucket_source: number;
    high_retry_count: number;
  };
}

interface BeforeAfterRow {
  id: string;
  email_normalized: string;
  before: {
    validation_status: string;
    verification_external_status: string | null;
    verification_bucket_source: string | null;
    verification_attempt_count: number;
  };
  after: {
    validation_status: string;
    verification_external_status: string | null;
    verification_bucket_source: string | null;
    verification_attempt_count: number;
  };
}

interface ListCleanVerificationDiagnosticProps {
  state: string;
  token: string;
}

export default function ListCleanVerificationDiagnostic({ state, token }: ListCleanVerificationDiagnosticProps) {
  const [diagnosticData, setDiagnosticData] = useState<DiagnosticData | null>(null);
  const [reprocessReport, setReprocessReport] = useState<BeforeAfterRow[] | null>(null);
  const [loading, setLoading] = useState(false);
  const [reprocessing, setReprocessing] = useState(false);
  const [error, setError] = useState('');
  const [showReprocessConfirm, setShowReprocessConfirm] = useState(false);
  const [reprocessMode, setReprocessMode] = useState<'sample' | 'full_state'>('sample');

  const runDiagnostic = async () => {
    setLoading(true);
    setError('');
    setDiagnosticData(null);

    try {
      const params = new URLSearchParams({
        state_slug: state || 'new-jersey',
        limit: '50',
      });

      const response = await fetch(
        `${SUPABASE_URL}/functions/v1/listclean-unknown-diagnostic?${params}`,
        {
          headers: {
            'Authorization': `Bearer ${SUPABASE_ANON_KEY}`,
            'x-admin-token': token,
          },
        }
      );

      if (!response.ok) {
        const errorData = await response.json().catch(() => ({}));
        throw new Error(errorData.error || `HTTP ${response.status}`);
      }

      const data = await response.json();
      setDiagnosticData(data);
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Diagnostic failed');
    } finally {
      setLoading(false);
    }
  };

  const runReprocess = async () => {
    setReprocessing(true);
    setError('');
    setReprocessReport(null);
    setShowReprocessConfirm(false);

    try {
      const response = await fetch(
        `${SUPABASE_URL}/functions/v1/listclean-unknown-reprocess`,
        {
          method: 'POST',
          headers: {
            'Authorization': `Bearer ${SUPABASE_ANON_KEY}`,
            'x-admin-token': token,
            'Content-Type': 'application/json',
          },
          body: JSON.stringify({
            mode: reprocessMode,
            state_slug: state || 'new-jersey',
            sample_size: 5,
            admin_confirm: reprocessMode === 'full_state',
          }),
        }
      );

      if (!response.ok) {
        const errorData = await response.json().catch(() => ({}));
        throw new Error(errorData.error || `HTTP ${response.status}`);
      }

      const data = await response.json();

      const afterSnapshotMap = new Map((data.after_snapshots || []).map((s: any) => [s.id, s]));

      const report: BeforeAfterRow[] = (data.before_snapshots || []).map((before: any) => {
        const after = afterSnapshotMap.get(before.id) || before;
        return {
          id: before.id,
          email_normalized: before.email_normalized,
          before: {
            validation_status: before.validation_status,
            verification_external_status: before.verification_external_status,
            verification_bucket_source: before.verification_bucket_source,
            verification_attempt_count: before.verification_attempt_count,
          },
          after: {
            validation_status: after.validation_status,
            verification_external_status: after.verification_external_status,
            verification_bucket_source: after.verification_bucket_source,
            verification_attempt_count: after.verification_attempt_count,
          },
        };
      });

      (window as any).__reprocessData = {
        rows_reset: data.rows_reset,
        queue_kicked: data.queue_processor_kicked,
        queue_error: data.queue_kick_error,
      };

      setReprocessReport(report);
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Reprocess failed');
    } finally {
      setReprocessing(false);
    }
  };

  return (
    <div className="bg-white rounded-xl border border-gray-200 p-6 shadow-sm space-y-6">
      <div>
        <h2 className="text-lg font-semibold text-gray-900 mb-2 flex items-center gap-2">
          <span className="inline-flex items-center justify-center w-8 h-8 bg-amber-100 text-amber-600 rounded-lg text-sm font-bold">!</span>
          Verification Diagnostic (Retry / Failed)
        </h2>
        <p className="text-sm text-gray-600">
          Inspect retry and failed email rows. Safe reprocess tool for validation recovery.
        </p>
      </div>

      {error && (
        <div className="p-4 bg-red-50 border border-red-200 rounded-lg flex gap-3">
          <AlertTriangle className="w-5 h-5 text-red-600 shrink-0 mt-0.5" />
          <div>
            <p className="font-semibold text-red-900">Error</p>
            <p className="text-red-800 text-sm">{error}</p>
          </div>
        </div>
      )}

      <div className="space-y-3">
        <label className="block text-sm font-medium text-gray-700">Step 1: Audit Retry/Failed Rows</label>
        <button
          onClick={runDiagnostic}
          disabled={loading}
          className="w-full px-4 py-3 bg-amber-600 text-white rounded-lg hover:bg-amber-700 font-medium disabled:bg-gray-300 flex items-center justify-center gap-2"
        >
          {loading && <Loader className="w-4 h-4 animate-spin" />}
          Run Verification Diagnostic
        </button>
        <p className="text-xs text-gray-500">
          Fetches up to 50 retry/failed rows for state: <strong>{state || 'new-jersey'}</strong>.
        </p>
      </div>

      {diagnosticData && (
        <div className="bg-slate-50 border border-slate-200 rounded-lg p-4 space-y-4">
          <div className="grid grid-cols-2 md:grid-cols-4 gap-3">
            <div className="p-3 bg-white rounded border border-slate-200">
              <div className="text-xs text-gray-600 font-medium">Total Retry</div>
              <div className="text-2xl font-bold text-gray-900">{diagnosticData.total_retry_count}</div>
            </div>
            <div className="p-3 bg-white rounded border border-slate-200">
              <div className="text-xs text-gray-600 font-medium">Total Failed</div>
              <div className="text-2xl font-bold text-gray-900">{diagnosticData.total_failed_count}</div>
            </div>
            <div className="p-3 bg-white rounded border border-amber-200 bg-amber-50">
              <div className="text-xs text-amber-700 font-medium">Scheduled Next</div>
              <div className="text-2xl font-bold text-amber-900">{diagnosticData.analysis.retry_with_scheduled_next}</div>
            </div>
            <div className="p-3 bg-white rounded border border-red-200 bg-red-50">
              <div className="text-xs text-red-700 font-medium">Max Retries Hit</div>
              <div className="text-2xl font-bold text-red-900">{diagnosticData.analysis.failed_max_retries}</div>
            </div>
          </div>

          <div>
            <h3 className="text-sm font-semibold text-gray-900 mb-2">Analysis Breakdown</h3>
            <div className="grid grid-cols-1 md:grid-cols-2 gap-2 text-sm">
              <div className="p-2 bg-white border border-slate-200 rounded">
                <span className="text-gray-600">Clean bucket source:</span>
                <span className="float-right font-semibold text-gray-900">{diagnosticData.analysis.has_clean_bucket_source}</span>
              </div>
              <div className="p-2 bg-white border border-slate-200 rounded">
                <span className="text-gray-600">High retry count (&gt;3):</span>
                <span className="float-right font-semibold text-gray-900">{diagnosticData.analysis.high_retry_count}</span>
              </div>
            </div>
          </div>

          <div className="bg-white rounded border border-slate-200 p-3 max-h-60 overflow-y-auto">
            <h3 className="text-xs font-semibold text-gray-900 mb-2 sticky top-0 bg-white">Sample Emails (up to 5)</h3>
            <table className="w-full text-xs">
              <thead>
                <tr className="border-b border-slate-200">
                  <th className="text-left py-2 px-2 font-semibold">Email</th>
                  <th className="text-left py-2 px-2 font-semibold">Status</th>
                  <th className="text-left py-2 px-2 font-semibold">Bucket</th>
                  <th className="text-left py-2 px-2 font-semibold">Attempts</th>
                </tr>
              </thead>
              <tbody>
                {diagnosticData.samples.slice(0, 5).map((row) => (
                  <tr key={row.id} className="border-b border-slate-100">
                    <td className="py-2 px-2 text-gray-700 truncate max-w-xs">{row.email_normalized}</td>
                    <td className="py-2 px-2">
                      <span className={`inline-block px-2 py-1 rounded text-xs font-medium ${
                        row.validation_status === 'retry' ? 'bg-amber-100 text-amber-700' :
                        row.validation_status === 'failed' ? 'bg-red-100 text-red-700' :
                        'bg-slate-100 text-slate-700'
                      }`}>
                        {row.validation_status}
                      </span>
                    </td>
                    <td className="py-2 px-2">{row.verification_bucket_source || '\u2014'}</td>
                    <td className="py-2 px-2 font-medium">{row.verification_attempt_count}</td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>

          <div className="p-3 bg-blue-50 border border-blue-200 rounded-lg text-sm text-blue-800">
            <p className="font-medium mb-1">Interpretation Guide:</p>
            <ul className="space-y-1 text-xs list-disc list-inside">
              <li><strong>Retry:</strong> Scheduled for another verification attempt</li>
              <li><strong>Failed:</strong> Max retries reached, permanently unresolvable</li>
              <li><strong>High retry:</strong> &gt;3 attempts = stuck in retry loop</li>
            </ul>
          </div>
        </div>
      )}

      <div className="border-t border-gray-200 pt-4 space-y-3">
        <label className="block text-sm font-medium text-gray-700">Step 2: Safe Reprocess (Optional)</label>

        <div className="flex gap-2 mb-3">
          <button
            onClick={() => setReprocessMode('sample')}
            className={`flex-1 px-3 py-2 rounded-lg border font-medium text-sm ${
              reprocessMode === 'sample'
                ? 'border-blue-600 bg-blue-50 text-blue-700'
                : 'border-gray-300 bg-white text-gray-700 hover:bg-gray-50'
            }`}
          >
            Sample (5 rows)
          </button>
          <button
            onClick={() => setReprocessMode('full_state')}
            className={`flex-1 px-3 py-2 rounded-lg border font-medium text-sm ${
              reprocessMode === 'full_state'
                ? 'border-orange-600 bg-orange-50 text-orange-700'
                : 'border-gray-300 bg-white text-gray-700 hover:bg-gray-50'
            }`}
          >
            Full State (up to 10k)
          </button>
        </div>

        <button
          onClick={() => setShowReprocessConfirm(true)}
          disabled={reprocessing || !diagnosticData}
          className="w-full px-4 py-3 bg-green-600 text-white rounded-lg hover:bg-green-700 font-medium disabled:bg-gray-300 flex items-center justify-center gap-2"
        >
          {reprocessing && <Loader className="w-4 h-4 animate-spin" />}
          <RotateCcw className="w-4 h-4" />
          Reset & Reprocess Retry/Failed Rows
        </button>

        <p className="text-xs text-gray-500">
          Resets <code className="bg-gray-100 px-1 rounded">verification_next_retry_at</code> to now, kicks ListClean queue processor. No data loss.
        </p>
      </div>

      {showReprocessConfirm && (
        <div className="p-4 bg-amber-50 border border-amber-200 rounded-lg space-y-3">
          <p className="text-sm font-semibold text-amber-900">
            {reprocessMode === 'sample'
              ? 'Reset & reprocess 5 sample retry/failed rows? Rows will be queued. No data is lost.'
              : 'Reset & reprocess up to 10,000 retry/failed rows in this state? Rows will be queued. No data is lost. Requires confirmation.'}
          </p>
          <div className="flex gap-2">
            <button
              onClick={() => setShowReprocessConfirm(false)}
              className="flex-1 px-3 py-2 bg-white border border-gray-300 rounded-lg hover:bg-gray-50 text-gray-700 font-medium text-sm"
            >
              Cancel
            </button>
            <button
              onClick={runReprocess}
              disabled={reprocessing}
              className="flex-1 px-3 py-2 bg-green-600 text-white rounded-lg hover:bg-green-700 font-medium text-sm disabled:bg-gray-300 flex items-center justify-center gap-1"
            >
              {reprocessing && <Loader className="w-3 h-3 animate-spin" />}
              Confirm & Reprocess
            </button>
          </div>
        </div>
      )}

      {reprocessReport && (
        <div className={`rounded-lg p-4 space-y-3 border ${
          (window as any).__reprocessData?.queue_kicked
            ? 'bg-green-50 border-green-200'
            : 'bg-amber-50 border-amber-200'
        }`}>
          <div className="flex gap-2 items-start">
            {(window as any).__reprocessData?.queue_kicked ? (
              <CheckCircle className="w-5 h-5 text-green-600 shrink-0 mt-0.5" />
            ) : (
              <AlertTriangle className="w-5 h-5 text-amber-600 shrink-0 mt-0.5" />
            )}
            <div>
              <p className={`font-semibold ${(window as any).__reprocessData?.queue_kicked ? 'text-green-900' : 'text-amber-900'}`}>
                {(window as any).__reprocessData?.queue_kicked ? 'Reprocess Complete' : 'Reprocess Rows Reset (Queue Kick Failed)'}
              </p>
              <p className={`text-sm ${(window as any).__reprocessData?.queue_kicked ? 'text-green-800' : 'text-amber-800'}`}>
                {reprocessReport.length} rows reset.
                {(window as any).__reprocessData?.queue_kicked
                  ? ' Queue processor kicked successfully. Will reprocess within 1-2 minutes.'
                  : ` Queue processor kick failed: ${(window as any).__reprocessData?.queue_error || 'Unspecified error'}. Run queue manually or retry reprocess.`}
              </p>
            </div>
          </div>

          <div className="bg-white rounded border border-gray-200 p-3 max-h-64 overflow-y-auto">
            <h3 className="text-xs font-semibold text-gray-900 mb-2 sticky top-0 bg-white">Before/After Report (ID-Matched)</h3>
            <table className="w-full text-xs">
              <thead>
                <tr className="border-b border-gray-200">
                  <th className="text-left py-2 px-2 font-semibold">Email</th>
                  <th className="text-left py-2 px-2 font-semibold">Before</th>
                  <th className="text-left py-2 px-2 font-semibold">After</th>
                </tr>
              </thead>
              <tbody>
                {reprocessReport.map((row) => (
                  <tr key={row.id} className="border-b border-gray-100">
                    <td className="py-2 px-2 text-gray-700 truncate max-w-xs">{row.email_normalized}</td>
                    <td className="py-2 px-2">
                      <div className="text-xs">
                        <div>
                          <span className="font-medium text-gray-600">Status:</span> {row.before.validation_status}
                        </div>
                        <div>
                          <span className="font-medium text-gray-600">Attempts:</span> {row.before.verification_attempt_count}
                        </div>
                      </div>
                    </td>
                    <td className="py-2 px-2">
                      <div className="text-xs">
                        <div>
                          <span className="font-medium text-gray-600">Status:</span> {row.after.validation_status}
                        </div>
                        <div>
                          <span className="font-medium text-gray-600">Attempts:</span> {row.after.verification_attempt_count}
                        </div>
                      </div>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>

          <div className={`text-xs p-2 rounded border ${
            (window as any).__reprocessData?.queue_kicked
              ? 'bg-green-100 border-green-300 text-green-700'
              : 'bg-amber-100 border-amber-300 text-amber-700'
          }`}>
            {(window as any).__reprocessData?.queue_kicked ? (
              <>
                <strong>Queue Kicked</strong><br />
                Rows will be reprocessed within 1-2 minutes. Refresh this panel later to see results.
              </>
            ) : (
              <>
                <strong>Queue Not Kicked</strong><br />
                Rows were reset but queue processor did not start. Go to /wp-admin/email/smartlead and manually run the queue, or retry reprocess.
              </>
            )}
          </div>
        </div>
      )}
    </div>
  );
}
