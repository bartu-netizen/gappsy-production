import { useState, useEffect } from 'react';
import { Upload, AlertCircle, CheckCircle, Loader, RefreshCw, ExternalLink } from 'lucide-react';
import EmailModuleLayout from '../components/wpadmin/EmailModuleLayout';
import { useAdminSession } from '../contexts/AdminSessionContext';
import { formatStateName } from '../utils/formatLocation';

const SUPABASE_URL = import.meta.env.VITE_SUPABASE_URL as string;
const SUPABASE_ANON_KEY = import.meta.env.VITE_SUPABASE_ANON_KEY as string;

const states = [
  'alabama', 'alaska', 'arizona', 'arkansas', 'california', 'colorado', 'connecticut',
  'delaware', 'district-of-columbia', 'florida', 'georgia', 'hawaii', 'idaho',
  'illinois', 'indiana', 'iowa', 'kansas', 'kentucky', 'louisiana', 'maine',
  'maryland', 'massachusetts', 'michigan', 'minnesota', 'mississippi', 'missouri',
  'montana', 'nebraska', 'nevada', 'new-hampshire', 'new-jersey', 'new-mexico',
  'new-york', 'north-carolina', 'north-dakota', 'ohio', 'oklahoma', 'oregon',
  'pennsylvania', 'puerto-rico', 'rhode-island', 'south-carolina', 'south-dakota',
  'tennessee', 'texas', 'utah', 'vermont', 'virginia', 'washington',
  'west-virginia', 'wisconsin', 'wyoming'
];

interface ImportJob {
  id: string;
  state_slug: string;
  source_filename: string;
  status: string;
  source_rows_total: number;
  source_rows_processed: number;
  chunks_total: number;
  chunks_processed: number;
  progress_percent: number;
  listclean_auto_kick_started: boolean;
  listclean_auto_kick_error?: string;
  created_at: string;
}

export default function AdminOtherAgenciesImportAsyncPage() {
  const { token } = useAdminSession();

  const [selectedState, setSelectedState] = useState('new-jersey');
  const [file, setFile] = useState<File | null>(null);
  const [importing, setImporting] = useState(false);
  const [currentJob, setCurrentJob] = useState<ImportJob | null>(null);
  const [error, setError] = useState('');
  const [successMessage, setSuccessMessage] = useState('');
  const [pollingActive, setPollingActive] = useState(false);

  // Poll job status
  useEffect(() => {
    if (!pollingActive || !currentJob) return;

    const interval = setInterval(async () => {
      try {
        const response = await fetch(`${SUPABASE_URL}/functions/v1/other-agencies-import-orchestrator`, {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
            'Authorization': `Bearer ${SUPABASE_ANON_KEY}`,
            'x-admin-token': token,
            'x-admin-secret': localStorage.getItem('admin_secret') || '',
          },
          body: JSON.stringify({
            action: 'get_status',
            job_id: currentJob.id,
          }),
        });

        if (!response.ok) return;

        const data = await response.json();
        if (data.ok) {
          setCurrentJob(prev => prev ? { ...prev, ...data } : null);

          if (data.status === 'completed' || data.status === 'partial_success') {
            setPollingActive(false);
            setSuccessMessage(`Import completed! ${data.chunks_processed}/${data.chunks_total} chunks processed.`);
          }
        }
      } catch (err) {
        console.error('Polling error:', err);
      }
    }, 5000); // Poll every 5 seconds

    return () => clearInterval(interval);
  }, [pollingActive, currentJob, token]);

  const parseCSV = (text: string): any[] => {
    const lines = text.trim().split('\n');
    if (lines.length < 2) return [];

    const headers = lines[0].split(',').map(h => h.trim().toLowerCase());
    const rows: any[] = [];

    for (let i = 1; i < lines.length; i++) {
      const values = lines[i].split(',').map(v => v.trim());
      const row: any = {};
      headers.forEach((header, index) => {
        row[header] = values[index] || '';
      });
      rows.push(row);
    }

    return rows;
  };

  const handleFileChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    if (e.target.files?.[0]) {
      setFile(e.target.files[0]);
      setError('');
    }
  };

  const handleStartImport = async () => {
    if (!file) {
      setError('Please select a file');
      return;
    }

    setImporting(true);
    setError('');
    setSuccessMessage('');

    try {
      let importData: any = null;
      let mode: 'csv' | 'json' | 'xlsx' = 'csv';

      if (file.name.endsWith('.csv')) {
        const fileContent = await file.text();
        importData = fileContent;
        mode = 'csv';
      } else if (file.name.endsWith('.json')) {
        const fileContent = await file.text();
        importData = fileContent;
        mode = 'json';
      } else if (file.name.endsWith('.xlsx') || file.name.endsWith('.xls')) {
        const arrayBuffer = await file.arrayBuffer();
        importData = arrayBuffer;
        mode = 'xlsx';
      } else {
        throw new Error('Unsupported file format. Use CSV, JSON, or XLSX.');
      }

      if (!importData) {
        throw new Error('File is empty');
      }

      const response = await fetch(`${SUPABASE_URL}/functions/v1/other-agencies-import-orchestrator`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'Authorization': `Bearer ${SUPABASE_ANON_KEY}`,
          'x-admin-token': token,
          'x-admin-secret': localStorage.getItem('admin_secret') || '',
        },
        body: JSON.stringify({
          action: 'start_job',
          state_slug: selectedState,
          source_filename: file.name,
          source_data: importData,
          import_mode: mode,
        }),
      });

      if (!response.ok) {
        const errorData = await response.json();
        throw new Error(errorData.error || 'Failed to start import');
      }

      const data = await response.json();
      if (data.ok) {
        setCurrentJob(data);
        setPollingActive(true);
        setSuccessMessage(`Import job started. Processing ${sourceData.length} rows in ${data.chunks_total} chunks.`);
        setFile(null);
      }
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Import failed');
    } finally {
      setImporting(false);
    }
  };

  const getStatusColor = (status: string) => {
    switch (status) {
      case 'completed':
      case 'partial_success':
        return 'bg-green-50 border-green-200 text-green-900';
      case 'processing':
        return 'bg-blue-50 border-blue-200 text-blue-900';
      case 'failed':
        return 'bg-red-50 border-red-200 text-red-900';
      default:
        return 'bg-gray-50 border-gray-200 text-gray-900';
    }
  };

  const getStatusIcon = (status: string) => {
    switch (status) {
      case 'completed':
      case 'partial_success':
        return <CheckCircle className="w-5 h-5 text-green-600" />;
      case 'processing':
        return <Loader className="w-5 h-5 text-blue-600 animate-spin" />;
      case 'failed':
        return <AlertCircle className="w-5 h-5 text-red-600" />;
      default:
        return <RefreshCw className="w-5 h-5 text-gray-600" />;
    }
  };

  return (
    <EmailModuleLayout>
      <div className="space-y-6">
        <div className="bg-white rounded-lg border border-gray-200 p-6 shadow-sm">
          <h1 className="text-4xl font-bold text-gray-900 mb-2">Bulk Import Other Agencies</h1>
          <p className="text-sm text-gray-600">
            Upload a large CSV or JSON file to import agencies. Processing runs server-side and continues even if you close the browser.
          </p>
        </div>

        {error && (
          <div className="bg-red-50 border border-red-200 rounded-lg p-4 flex gap-3">
            <AlertCircle className="w-5 h-5 text-red-600 flex-shrink-0 mt-0.5" />
            <div>
              <h3 className="font-semibold text-red-900">Error</h3>
              <p className="text-sm text-red-700">{error}</p>
            </div>
          </div>
        )}

        {successMessage && (
          <div className="bg-green-50 border border-green-200 rounded-lg p-4 flex gap-3">
            <CheckCircle className="w-5 h-5 text-green-600 flex-shrink-0 mt-0.5" />
            <div>
              <h3 className="font-semibold text-green-900">Success</h3>
              <p className="text-sm text-green-700">{successMessage}</p>
            </div>
          </div>
        )}

        {!currentJob && (
          <div className="bg-white rounded-lg border border-gray-200 p-6 shadow-sm space-y-4">
            <div>
              <label className="block text-sm font-semibold text-gray-900 mb-2">State</label>
              <select
                value={selectedState}
                onChange={e => setSelectedState(e.target.value)}
                className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
              >
                {states.map(state => (
                  <option key={state} value={state}>
                    {formatStateName(state)}
                  </option>
                ))}
              </select>
            </div>

            <div>
              <label className="block text-sm font-semibold text-gray-900 mb-2">Select File (CSV, JSON, or XLSX)</label>
              <div className="border-2 border-dashed border-gray-300 rounded-lg p-6 text-center">
                <Upload className="w-8 h-8 text-gray-400 mx-auto mb-2" />
                <input
                  type="file"
                  accept=".csv,.json,.xlsx,.xls"
                  onChange={handleFileChange}
                  className="hidden"
                  id="file-input"
                />
                <label htmlFor="file-input" className="cursor-pointer">
                  <span className="text-sm font-medium text-blue-600 hover:text-blue-700">Click to select</span>
                </label>
                <p className="text-xs text-gray-600 mt-2">or drag and drop (CSV, JSON, or XLSX, max 5000 rows)</p>
                {file && <p className="text-sm text-gray-900 font-medium mt-2">{file.name}</p>}
              </div>
            </div>

            <button
              onClick={handleStartImport}
              disabled={importing || !file}
              className="w-full px-4 py-2 bg-blue-600 text-white font-medium rounded-lg hover:bg-blue-700 disabled:bg-gray-400 disabled:cursor-not-allowed"
            >
              {importing ? 'Starting import...' : 'Start Import'}
            </button>

            <div className="bg-blue-50 border border-blue-200 rounded-lg p-4">
              <p className="text-xs text-blue-900">
                <strong>Note:</strong> This import runs completely server-side. Your import job will continue processing even if you close this page or close your browser. Come back to check status at any time.
              </p>
            </div>
          </div>
        )}

        {currentJob && (
          <div className="bg-white rounded-lg border border-gray-200 p-6 shadow-sm space-y-6">
            <div className={`border rounded-lg p-4 ${getStatusColor(currentJob.status)}`}>
              <div className="flex items-center gap-3 mb-2">
                {getStatusIcon(currentJob.status)}
                <span className="font-semibold capitalize">{currentJob.status}</span>
              </div>
              <p className="text-sm">
                Job ID: <code className="bg-gray-100 px-2 py-1 rounded text-xs">{currentJob.id}</code>
              </p>
            </div>

            <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
              <div className="p-4 bg-gray-50 rounded-lg border border-gray-200">
                <div className="text-xs text-gray-700 font-medium mb-2">Total Rows</div>
                <div className="text-2xl font-bold text-gray-900">{currentJob.source_rows_total}</div>
              </div>
              <div className="p-4 bg-blue-50 rounded-lg border border-blue-200">
                <div className="text-xs text-blue-700 font-medium mb-2">Rows Processed</div>
                <div className="text-2xl font-bold text-blue-700">{currentJob.source_rows_processed}</div>
              </div>
              <div className="p-4 bg-purple-50 rounded-lg border border-purple-200">
                <div className="text-xs text-purple-700 font-medium mb-2">Chunks Progress</div>
                <div className="text-2xl font-bold text-purple-700">{currentJob.chunks_processed}/{currentJob.chunks_total}</div>
              </div>
              <div className="p-4 bg-green-50 rounded-lg border border-green-200">
                <div className="text-xs text-green-700 font-medium mb-2">Progress</div>
                <div className="text-2xl font-bold text-green-700">{currentJob.progress_percent}%</div>
              </div>
            </div>

            <div className="w-full bg-gray-200 rounded-full h-3">
              <div
                className="bg-blue-600 h-3 rounded-full transition-all duration-500"
                style={{ width: `${currentJob.progress_percent}%` }}
              />
            </div>

            {((currentJob as any).parser_diagnostics) && (
              <div className="bg-gray-50 border border-gray-300 rounded-lg p-4 space-y-3">
                <h4 className="font-semibold text-gray-900">Import Diagnostics</h4>
                <div className="grid grid-cols-2 md:grid-cols-3 gap-3 text-xs">
                  {(currentJob as any).parser_diagnostics.detected_sheet_name && (
                    <div>
                      <div className="text-gray-600 font-medium">Sheet</div>
                      <div className="text-gray-900">{(currentJob as any).parser_diagnostics.detected_sheet_name}</div>
                    </div>
                  )}
                  {(currentJob as any).parser_diagnostics.rows_total !== undefined && (
                    <div>
                      <div className="text-gray-600 font-medium">Total Rows</div>
                      <div className="text-gray-900">{(currentJob as any).parser_diagnostics.rows_total}</div>
                    </div>
                  )}
                  {(currentJob as any).parser_diagnostics.rows_with_email_cell_present !== undefined && (
                    <div>
                      <div className="text-gray-600 font-medium">Rows with Email</div>
                      <div className="text-gray-900">{(currentJob as any).parser_diagnostics.rows_with_email_cell_present}</div>
                    </div>
                  )}
                  {(currentJob as any).parser_diagnostics.rows_with_extracted_emails !== undefined && (
                    <div>
                      <div className="text-gray-600 font-medium">Emails Extracted</div>
                      <div className="text-gray-900">{(currentJob as any).parser_diagnostics.rows_with_extracted_emails}</div>
                    </div>
                  )}
                  {(currentJob as any).parser_diagnostics.total_emails_extracted_before_dedupe !== undefined && (
                    <div>
                      <div className="text-gray-600 font-medium">Emails (Before Dedupe)</div>
                      <div className="text-gray-900">{(currentJob as any).parser_diagnostics.total_emails_extracted_before_dedupe}</div>
                    </div>
                  )}
                  {(currentJob as any).parser_diagnostics.total_emails_inserted !== undefined && (
                    <div>
                      <div className="text-gray-600 font-medium">Emails Inserted</div>
                      <div className="text-gray-900 font-semibold text-green-700">{(currentJob as any).parser_diagnostics.total_emails_inserted}</div>
                    </div>
                  )}
                </div>
                {(currentJob as any).parser_diagnostics.detected_headers && (
                  <div>
                    <div className="text-xs text-gray-600 font-medium mb-1">Headers Detected</div>
                    <div className="flex flex-wrap gap-1">
                      {(currentJob as any).parser_diagnostics.detected_headers.slice(0, 8).map((h: string, i: number) => (
                        <span key={i} className="text-xs bg-white border border-gray-300 px-2 py-1 rounded">
                          {h}
                        </span>
                      ))}
                      {(currentJob as any).parser_diagnostics.detected_headers.length > 8 && (
                        <span className="text-xs text-gray-600 px-2 py-1">+{(currentJob as any).parser_diagnostics.detected_headers.length - 8} more</span>
                      )}
                    </div>
                  </div>
                )}
              </div>
            )}

            {currentJob.status === 'completed' || currentJob.status === 'partial_success' ? (
              <div className="bg-green-50 border border-green-200 rounded-lg p-4 space-y-2">
                <h3 className="font-semibold text-green-900 flex items-center gap-2">
                  <CheckCircle className="w-5 h-5" />
                  Import Complete
                </h3>
                <p className="text-sm text-green-700">
                  {currentJob.listclean_auto_kick_started
                    ? 'ListClean queue processing started automatically. Emails are now being verified.'
                    : currentJob.listclean_auto_kick_error
                    ? `Auto-kick failed: ${currentJob.listclean_auto_kick_error}. You can manually trigger verification from the dashboard.`
                    : 'Import completed. ListClean auto-kick status pending.'}
                </p>
                {(currentJob as any).agencies_created > 0 && (currentJob as any).emails_created === 0 && (
                  <div className="mt-3 pt-3 border-t border-green-300">
                    <p className="text-sm text-amber-800 bg-amber-50 px-3 py-2 rounded">
                      <strong>Note:</strong> Agencies were created but no emails were extracted. Check the diagnostics below.
                    </p>
                  </div>
                )}
                <div className="pt-2">
                  <a
                    href={`/wp-admin/other-agencies/state-stats?state=${currentJob.state_slug}`}
                    className="text-sm text-green-700 font-medium hover:text-green-800 flex items-center gap-1"
                  >
                    View state stats <ExternalLink className="w-4 h-4" />
                  </a>
                </div>
              </div>
            ) : (
              <div className="bg-blue-50 border border-blue-200 rounded-lg p-4">
                <p className="text-sm text-blue-900">
                  <strong>Processing in progress.</strong> This page auto-refreshes every 5 seconds. You can safely close this page and check back later.
                </p>
              </div>
            )}

            {(currentJob.status === 'completed' || currentJob.status === 'partial_success') && (
              <button
                onClick={() => {
                  setCurrentJob(null);
                  setFile(null);
                  setSuccessMessage('');
                }}
                className="w-full px-4 py-2 bg-gray-600 text-white font-medium rounded-lg hover:bg-gray-700"
              >
                Import Another File
              </button>
            )}
          </div>
        )}
      </div>
    </EmailModuleLayout>
  );
}
