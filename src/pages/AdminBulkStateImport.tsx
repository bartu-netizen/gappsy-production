import { useState } from 'react';
import { Upload, CheckCircle, AlertCircle, XCircle, Loader, Copy, Check } from 'lucide-react';
import WpAdminLayout from '../components/wpadmin/WpAdminLayout';
import {
  ImportState,
  StateJsonData,
  validateStateJson,
  importStateToDatabase,
  createDownloadLink
} from '../utils/stateJsonImport';

function getSessionToken(): string {
  return localStorage.getItem('gappsy_admin_token') ?? '';
}

export default function AdminBulkStateImport() {
  const [selectedFiles, setSelectedFiles] = useState<File[]>([]);
  const [importStates, setImportStates] = useState<ImportState[]>([]);
  const [isValidating, setIsValidating] = useState(false);
  const [isImporting, setIsImporting] = useState(false);
  const [copiedIndex, setCopiedIndex] = useState<number | null>(null);
  const [options, setOptions] = useState({
    importToDatabase: true,
    markAsPlaceholders: true,
    overrideExisting: false,
    downloadJSON: false
  });

  const handleFileSelect = async (event: React.ChangeEvent<HTMLInputElement>) => {
    const files = event.target.files;
    if (!files || files.length === 0) return;

    const jsonFiles = Array.from(files).filter(f => f.name.endsWith('.json'));
    setSelectedFiles(jsonFiles);
    await validateFiles(jsonFiles);
  };

  const handleDrop = async (event: React.DragEvent<HTMLDivElement>) => {
    event.preventDefault();
    event.stopPropagation();

    const files = event.dataTransfer.files;
    if (!files || files.length === 0) return;

    const jsonFiles = Array.from(files).filter(f => f.name.endsWith('.json'));
    setSelectedFiles(jsonFiles);
    await validateFiles(jsonFiles);
  };

  const handleDragOver = (event: React.DragEvent<HTMLDivElement>) => {
    event.preventDefault();
    event.stopPropagation();
  };

  const validateFiles = async (files: File[]) => {
    setIsValidating(true);
    const validationResults: ImportState[] = [];

    for (const file of files) {
      try {
        const content = await file.text();
        const data: StateJsonData = JSON.parse(content);

        const validation = validateStateJson(data);

        const top25Count = data.agencies?.filter(a => a.rank >= 1 && a.rank <= 25).length || 0;
        const otherCount = data.agencies?.filter(a => !a.rank || a.rank > 25).length || 0;

        validationResults.push({
          fileName: file.name,
          stateName: data.state_name || 'Unknown',
          stateSlug: data.state_slug || 'unknown',
          status: validation.isValid ? 'pending' : 'error',
          error: validation.errors.join('; '),
          agencyCount: data.agencies?.length || 0,
          faqCount: data.faqs?.length || 0,
          top25Count,
          otherCount,
          jsonData: data
        });

      } catch (err: any) {
        validationResults.push({
          fileName: file.name,
          stateName: 'Unknown',
          stateSlug: 'unknown',
          status: 'error',
          error: `JSON parse error: ${err.message}`,
          agencyCount: 0,
          faqCount: 0,
          top25Count: 0,
          otherCount: 0
        });
      }
    }

    setImportStates(validationResults);
    setIsValidating(false);
  };

  const handleBulkImport = async () => {
    setIsImporting(true);

    for (let i = 0; i < importStates.length; i++) {
      const importState = importStates[i];

      if (importState.status === 'error' || !importState.jsonData) {
        continue;
      }

      setImportStates(prev => prev.map((item, idx) =>
        idx === i ? { ...item, status: 'importing' } : item
      ));

      try {
        let dbSuccess = true;
        // REMOVED: jsonSuccess - Filesystem writes permanently disabled
        let errorMsg = '';

        if (options.importToDatabase) {
          const results = await importStateToDatabase(
            importState.jsonData,
            importState.stateSlug,
            {
              markAsPlaceholders: options.markAsPlaceholders,
              overrideExisting: options.overrideExisting
            },
            getSessionToken()
          );

          if (results.top25Errors > 0 || results.otherErrors > 0) {
            dbSuccess = false;
            errorMsg += `DB: ${results.top25Errors} Top25 errors, ${results.otherErrors} Other errors. `;

            // Store detailed error info in state
            setImportStates(prev => prev.map((item, idx) =>
              idx === i ? {
                ...item,
                dbErrorDetails: results.firstDbError,
                dbStats: {
                  top25Created: results.top25Created,
                  top25Errors: results.top25Errors,
                  otherCreated: results.otherCreated,
                  otherErrors: results.otherErrors
                }
              } : item
            ));
          }
        }

        // REMOVED: saveJSON option - Filesystem writes permanently disabled
        // All state content is stored in database only (state_content, state_faqs, top25_slots)

        if (options.downloadJSON) {
          createDownloadLink(importState.jsonData, importState.stateSlug);
        }

        if (dbSuccess) {
          setImportStates(prev => prev.map((item, idx) =>
            idx === i ? { ...item, status: 'success' } : item
          ));
        } else {
          setImportStates(prev => prev.map((item, idx) =>
            idx === i ? { ...item, status: 'error', error: errorMsg } : item
          ));
        }

      } catch (err: any) {
        setImportStates(prev => prev.map((item, idx) =>
          idx === i ? { ...item, status: 'error', error: err.message } : item
        ));
      }

      await new Promise(resolve => setTimeout(resolve, 300));
    }

    setIsImporting(false);
  };

  const validStates = importStates.filter(s => s.status !== 'error');
  const errorStates = importStates.filter(s => s.status === 'error');
  const successStates = importStates.filter(s => s.status === 'success');
  const pendingStates = importStates.filter(s => s.status === 'pending');

  const copyErrorToClipboard = async (idx: number, state: ImportState) => {
    if (!state.dbErrorDetails) return;

    const errorData = {
      state: state.stateName,
      state_slug: state.stateSlug,
      error: state.dbErrorDetails,
      stats: state.dbStats
    };

    await navigator.clipboard.writeText(JSON.stringify(errorData, null, 2));
    setCopiedIndex(idx);
    setTimeout(() => setCopiedIndex(null), 2000);
  };

  return (
    <WpAdminLayout title="Import Top-25 Agencies" subtitle="Import state JSON files to populate database and create state pages">
      <div className="max-w-6xl mx-auto">

        <div className="mb-4 flex items-center gap-2 px-4 py-3 bg-emerald-50 border border-emerald-200 rounded-lg">
          <CheckCircle className="w-4 h-4 text-emerald-600 shrink-0" />
          <p className="text-sm text-emerald-800">Authenticated via admin session — no additional secret needed.</p>
        </div>

        <div className="bg-white rounded-lg shadow p-6 mb-8">
          <h2 className="text-xl font-semibold mb-4">1. Upload State JSON Files</h2>

          <div
            onDrop={handleDrop}
            onDragOver={handleDragOver}
            className="border-2 border-dashed border-gray-300 rounded-lg p-8 text-center hover:border-indigo-600 transition-colors"
          >
            <Upload className="w-12 h-12 mx-auto mb-4 text-gray-400" />
            <p className="mb-4 text-gray-600">Drag and drop JSON files here, or</p>

            <label className="inline-block">
              <input
                type="file"
                multiple
                accept=".json"
                onChange={handleFileSelect}
                className="hidden"
              />
              <span className="inline-block px-6 py-3 bg-indigo-600 text-white rounded-lg hover:bg-indigo-700 cursor-pointer transition-colors">
                Select Files
              </span>
            </label>

            {selectedFiles.length > 0 && (
              <div className="mt-4">
                <p className="text-sm text-gray-600 flex items-center justify-center gap-2">
                  <CheckCircle className="w-4 h-4 text-green-600" />
                  {selectedFiles.length} file(s) selected
                </p>
              </div>
            )}
          </div>

          {isValidating && (
            <div className="mt-4 flex items-center justify-center gap-2 text-indigo-600">
              <Loader className="w-5 h-5 animate-spin" />
              <span>Validating files...</span>
            </div>
          )}
        </div>

        {importStates.length > 0 && (
          <div className="bg-white rounded-lg shadow p-6 mb-8">
            <h2 className="text-xl font-semibold mb-4">2. Validation Results</h2>

            <div className="mb-4 flex items-center gap-6 text-sm">
              <div className="flex items-center gap-2">
                <CheckCircle className="w-5 h-5 text-green-600" />
                <span>Valid: <strong>{validStates.length}</strong></span>
              </div>
              <div className="flex items-center gap-2">
                <XCircle className="w-5 h-5 text-red-600" />
                <span>Errors: <strong>{errorStates.length}</strong></span>
              </div>
              <div className="flex items-center gap-2">
                <Loader className="w-5 h-5 text-indigo-600" />
                <span>Ready: <strong>{pendingStates.length}</strong></span>
              </div>
              <div className="flex items-center gap-2">
                <CheckCircle className="w-5 h-5 text-green-600" />
                <span>Imported: <strong>{successStates.length}</strong></span>
              </div>
            </div>

            <div className="max-h-96 overflow-y-auto space-y-2">
              {importStates.map((state, idx) => (
                <div
                  key={idx}
                  className={`p-4 rounded border transition-colors ${
                    state.status === 'error' ? 'bg-red-50 border-red-200' :
                    state.status === 'success' ? 'bg-green-50 border-green-200' :
                    state.status === 'importing' ? 'bg-indigo-50 border-indigo-200' :
                    'bg-gray-50 border-gray-200'
                  }`}
                >
                  <div className="flex items-center justify-between">
                    <div className="flex-1">
                      <div className="flex items-center gap-2">
                        <h3 className="font-semibold">{state.stateName}</h3>
                        {state.status === 'error' && <XCircle className="w-4 h-4 text-red-600" />}
                        {state.status === 'success' && <CheckCircle className="w-4 h-4 text-green-600" />}
                        {state.status === 'importing' && <Loader className="w-4 h-4 text-indigo-600 animate-spin" />}
                      </div>
                      <p className="text-sm text-gray-600">
                        {state.agencyCount} agencies ({state.top25Count} Top 25, {state.otherCount} Other) • {state.faqCount} FAQs
                      </p>
                      {state.error && (
                        <p className="text-sm text-red-600 mt-1">{state.error}</p>
                      )}

                      {state.dbErrorDetails && (
                        <div className="mt-3 p-3 bg-red-100 rounded border border-red-300">
                          <div className="flex items-start justify-between mb-2">
                            <h4 className="font-semibold text-red-900 text-sm">DB ERROR (First Failure):</h4>
                            <button
                              onClick={() => copyErrorToClipboard(idx, state)}
                              className="flex items-center gap-1 px-2 py-1 text-xs bg-red-600 text-white rounded hover:bg-red-700 transition-colors"
                            >
                              {copiedIndex === idx ? (
                                <>
                                  <Check className="w-3 h-3" />
                                  Copied
                                </>
                              ) : (
                                <>
                                  <Copy className="w-3 h-3" />
                                  Copy
                                </>
                              )}
                            </button>
                          </div>
                          <div className="space-y-1 text-xs font-mono">
                            <div>
                              <span className="text-red-700 font-semibold">Code:</span>{' '}
                              <span className="text-red-900">{state.dbErrorDetails.code || 'N/A'}</span>
                            </div>
                            <div>
                              <span className="text-red-700 font-semibold">Message:</span>{' '}
                              <span className="text-red-900">{state.dbErrorDetails.message || 'N/A'}</span>
                            </div>
                            {state.dbErrorDetails.details && (
                              <div>
                                <span className="text-red-700 font-semibold">Details:</span>{' '}
                                <span className="text-red-900">{state.dbErrorDetails.details}</span>
                              </div>
                            )}
                            {state.dbErrorDetails.hint && (
                              <div>
                                <span className="text-red-700 font-semibold">Hint:</span>{' '}
                                <span className="text-red-900">{state.dbErrorDetails.hint}</span>
                              </div>
                            )}
                            {state.dbErrorDetails.record && (
                              <div className="mt-2 pt-2 border-t border-red-300">
                                <span className="text-red-700 font-semibold">Record:</span>{' '}
                                <span className="text-red-900">
                                  {state.dbErrorDetails.record.state_slug} #{state.dbErrorDetails.record.rank} - {state.dbErrorDetails.record.agency_name}
                                </span>
                              </div>
                            )}
                          </div>
                          {state.dbStats && (
                            <div className="mt-2 pt-2 border-t border-red-300 text-xs">
                              <span className="text-red-700 font-semibold">Stats:</span>{' '}
                              <span className="text-red-900">
                                Top25: {state.dbStats.top25Created} success, {state.dbStats.top25Errors} failed |
                                Other: {state.dbStats.otherCreated} success, {state.dbStats.otherErrors} failed
                              </span>
                            </div>
                          )}
                        </div>
                      )}
                    </div>

                    <div className="text-sm font-medium">
                      {state.status === 'error' && <span className="text-red-600">Failed</span>}
                      {state.status === 'success' && <span className="text-green-600">Success</span>}
                      {state.status === 'importing' && <span className="text-indigo-600">Importing...</span>}
                      {state.status === 'pending' && <span className="text-gray-600">Ready</span>}
                    </div>
                  </div>
                </div>
              ))}
            </div>
          </div>
        )}

        {importStates.length > 0 && validStates.length > 0 && (
          <div className="bg-white rounded-lg shadow p-6 mb-8">
            <h2 className="text-xl font-semibold mb-4">3. Import Options</h2>

            <div className="space-y-3">
              <label className="flex items-start gap-3 cursor-pointer">
                <input
                  type="checkbox"
                  checked={options.importToDatabase}
                  onChange={(e) => setOptions({...options, importToDatabase: e.target.checked})}
                  className="mt-1"
                />
                <div>
                  <div className="font-medium">Import to database</div>
                  <div className="text-sm text-gray-600">Populate top25_slots and other_agencies tables</div>
                </div>
              </label>

              <div className="bg-blue-50 border border-blue-200 rounded-lg p-4 mb-4">
                <div className="flex items-start gap-3">
                  <svg className="w-5 h-5 text-blue-600 mt-0.5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
                  </svg>
                  <div className="flex-1">
                    <div className="font-semibold text-blue-900">Database-Only Import Mode (mandatory)</div>
                    <div className="text-sm text-blue-700 mt-1">
                      All state content is imported directly into the database.
                      Filesystem writes are disabled permanently.
                    </div>
                  </div>
                </div>
              </div>

              <label className="flex items-start gap-3 cursor-pointer">
                <input
                  type="checkbox"
                  checked={options.downloadJSON}
                  onChange={(e) => setOptions({...options, downloadJSON: e.target.checked})}
                  className="mt-1"
                />
                <div>
                  <div className="font-medium">Download JSON files (Optional)</div>
                  <div className="text-sm text-gray-600">Download to your computer for backup/debugging only</div>
                </div>
              </label>

              <label className="flex items-start gap-3 cursor-pointer">
                <input
                  type="checkbox"
                  checked={options.markAsPlaceholders}
                  onChange={(e) => setOptions({...options, markAsPlaceholders: e.target.checked})}
                  className="mt-1"
                />
                <div>
                  <div className="font-medium">Mark all as placeholders (unpaid)</div>
                  <div className="text-sm text-gray-600">Set is_paid=false, is_placeholder=true</div>
                </div>
              </label>

              <label className="flex items-start gap-3 cursor-pointer">
                <input
                  type="checkbox"
                  checked={options.overrideExisting}
                  onChange={(e) => setOptions({...options, overrideExisting: e.target.checked})}
                  className="mt-1"
                />
                <div>
                  <div className="font-medium text-red-600">Override existing data</div>
                  <div className="text-sm text-red-600">Delete existing state data before import (DANGEROUS)</div>
                </div>
              </label>
            </div>
          </div>
        )}

        {importStates.length > 0 && validStates.length > 0 && (
          <div className="bg-white rounded-lg shadow p-6 mb-8">
            <button
              onClick={handleBulkImport}
              disabled={isImporting || pendingStates.length === 0}
              className="w-full bg-indigo-600 text-white py-4 rounded-lg font-semibold text-lg
                hover:bg-indigo-700 disabled:bg-gray-400 disabled:cursor-not-allowed
                transition-colors flex items-center justify-center gap-2"
            >
              {isImporting ? (
                <>
                  <Loader className="w-5 h-5 animate-spin" />
                  Importing...
                </>
              ) : (
                <>
                  <Upload className="w-5 h-5" />
                  Import {pendingStates.length} State{pendingStates.length !== 1 ? 's' : ''}
                </>
              )}
            </button>
          </div>
        )}

        {successStates.length > 0 && (
          <div className="bg-green-50 border border-green-200 rounded-lg p-6">
            <h2 className="text-xl font-semibold text-green-900 mb-4 flex items-center gap-2">
              <CheckCircle className="w-6 h-6" />
              Import Complete
            </h2>
            <div className="space-y-2">
              <p className="text-green-800">
                <strong>{successStates.length}</strong> state{successStates.length !== 1 ? 's' : ''} successfully imported
              </p>
              {errorStates.length > 0 && (
                <p className="text-red-800">
                  <strong>{errorStates.length}</strong> state{errorStates.length !== 1 ? 's' : ''} failed
                </p>
              )}
              <div className="mt-4 pt-4 border-t border-green-200">
                <p className="text-sm text-green-700 mb-2">
                  <strong>Successfully imported states:</strong>
                </p>
                <div className="flex flex-wrap gap-2">
                  {successStates.map((state, idx) => (
                    <a
                      key={idx}
                      href={`/marketing-agencies-in-${state.stateSlug}-united-states/`}
                      target="_blank"
                      rel="noopener noreferrer"
                      className="inline-block px-3 py-1 bg-green-600 text-white rounded text-sm hover:bg-green-700 transition-colors"
                    >
                      {state.stateName}
                    </a>
                  ))}
                </div>
              </div>
            </div>
          </div>
        )}

        <div className="mt-8 bg-[#F4F6FB] border border-[#E8ECFA] rounded-lg p-6">
          <h3 className="font-semibold text-blue-900 mb-2">Expected JSON Format</h3>
          <pre className="text-xs bg-white p-4 rounded border overflow-x-auto">
{`{
  "state_name": "Wyoming",
  "state_slug": "wyoming",
  "state_intro_short": "Brief intro...",
  "state_intro_full": "Full intro...",
  "seo": {
    "title": "Top 25 Marketing Agencies in Wyoming",
    "meta_description": "...",
    "focus_keyword": "Marketing Agencies in Wyoming"
  },
  "agencies": [
    {
      "rank": 1,
      "name": "Agency Name",
      "city": "Cheyenne",
      "state": "Wyoming",
      "pricing": "$5,000+",
      "websiteUrl": "https://example.com",
      "logo": {
        "localPath": "logos/wyoming/agency.webp"
      },
      "shortDescription": "...",
      "services": ["SEO", "PPC"]
    }
  ],
  "faqs": [
    {
      "question": "...",
      "answer": "..."
    }
  ]
}`}
          </pre>
        </div>
      </div>
    </WpAdminLayout>
  );
}
