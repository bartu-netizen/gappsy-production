import { useState, useEffect } from 'react';
import { Upload, Trash2, AlertCircle, Loader, CheckCircle } from 'lucide-react';
import { supabase } from '../lib/supabase';
import { getLegacyStateData } from '../lib/legacyStateData';
import WpAdminLayout from '../components/wpadmin/WpAdminLayout';

function getSessionToken(): string {
  return localStorage.getItem('gappsy_admin_token') ?? '';
}

interface LogoFile {
  id: string;
  file: File;
  agencyName: string;
  stateSlug: string;
  matchedAgencyRank?: number;
  matchedAgencyName?: string;
  matchConfidence?: 'high' | 'medium' | 'low';
  hasStateMismatch?: boolean;
}

interface UploadResult {
  filename: string;
  success: boolean;
  logoUrl?: string;
  error?: string;
}

interface Agency {
  rank: number;
  name: string;
}

interface StateOption {
  slug: string;
  name: string;
}

interface LoadDebugInfo {
  stateSlug: string;
  source: 'legacy' | 'database' | null;
  jsonFetchUrl?: string;
  jsonStatus?: number;
  jsonKeys?: string[];
  dbAgenciesCount?: number;
  validAgencies?: number;
  error?: string;
  lastError?: any;
}

export default function BulkLogoUploadPage() {
  const [availableStates, setAvailableStates] = useState<StateOption[]>([]);
  const [selectedStateSlug, setSelectedStateSlug] = useState<string>('new-jersey');
  const [logos, setLogos] = useState<LogoFile[]>([]);
  const [uploading, setUploading] = useState(false);
  const [results, setResults] = useState<UploadResult[]>([]);
  const [showResults, setShowResults] = useState(false);
  const [agencies, setAgencies] = useState<Agency[]>([]);
  const [loadingAgencies, setLoadingAgencies] = useState(true);
  const [loadError, setLoadError] = useState<string | null>(null);
  const [debugInfo, setDebugInfo] = useState<LoadDebugInfo | null>(null);
  const [uploadDebug, setUploadDebug] = useState<any>(null);

  const isDebugMode = new URLSearchParams(window.location.search).get('debug') === '1';

  useEffect(() => {
    loadAvailableStates();
  }, []);

  useEffect(() => {
    loadAgencies(selectedStateSlug);
  }, [selectedStateSlug]);

  const loadAvailableStates = async () => {
    try {
      const { data, error } = await supabase
        .from('state_pages')
        .select('state_slug, state_name, is_active')
        .eq('is_active', true)
        .order('state_name');

      if (error) throw error;

      if (!data || data.length === 0) {
        console.error('❌ No active states found in state_pages table');
        setAvailableStates([]);
        return;
      }

      const stateOptions = data.map(row => ({
        slug: row.state_slug,
        name: row.state_name
      }));

      setAvailableStates(stateOptions);

      if (isDebugMode) {
        console.log('✅ Loaded states from state_pages:', {
          total: data.length,
          states: stateOptions.map(s => s.slug)
        });
      }
    } catch (err) {
      console.error('❌ Failed to load states from database:', err);
      setAvailableStates([]);
    }
  };

  const handleStateChange = (newStateSlug: string) => {
    setSelectedStateSlug(newStateSlug);
    setLogos([]);
    setResults([]);
    setShowResults(false);
  };

  const loadAgencies = async (stateSlug: string) => {
    setLoadingAgencies(true);
    setLoadError(null);
    setDebugInfo(null);

    const debug: LoadDebugInfo = { stateSlug, source: null };

    try {
      console.log('🔄 Loading agencies for:', stateSlug);

      const legacyData = await getLegacyStateData(stateSlug);

      if (legacyData) {
        console.log('🟢 Using LEGACY data for:', stateSlug);
        debug.source = 'legacy';

        const agencyList = (legacyData.agencies || [])
          .filter((a: any) => a.rank >= 1 && a.rank <= 25)
          .map((a: any) => ({
            rank: a.rank,
            name: a.name
          }))
          .sort((a, b) => a.rank - b.rank);

        debug.validAgencies = agencyList.length;
        setAgencies(agencyList);
        setDebugInfo(debug);
        setLoadingAgencies(false);
        console.log('✅ Loaded', agencyList.length, 'agencies from legacy');
        return;
      }

      console.log('🔵 Loading from DATABASE for:', stateSlug);
      debug.source = 'database';

      const { data: dbAgencies, error: dbError } = await supabase
        .from('top25_slots')
        .select('rank, agency_name')
        .eq('state_slug', stateSlug)
        .order('rank', { ascending: true });

      if (dbError) {
        console.error('Database error:', dbError);
        debug.error = dbError.message;
        debug.lastError = dbError;
        throw new Error(`Database error: ${dbError.message}`);
      }

      debug.dbAgenciesCount = dbAgencies?.length || 0;

      if (!dbAgencies || dbAgencies.length === 0) {
        const errorMsg = `No agencies found for ${stateSlug}. This state may not be imported yet.`;
        console.warn('⚠️', errorMsg);
        debug.error = errorMsg;
        setLoadError(errorMsg);
        setDebugInfo(debug);
        setLoadingAgencies(false);
        return;
      }

      let jsonMetadata: any = null;
      const jsonFetchUrl = `/data/${stateSlug}.json`;
      debug.jsonFetchUrl = jsonFetchUrl;

      try {
        const response = await fetch(jsonFetchUrl);
        debug.jsonStatus = response.status;

        if (response.ok) {
          jsonMetadata = await response.json();
          debug.jsonKeys = Object.keys(jsonMetadata);
          console.log('📄 JSON metadata loaded:', jsonFetchUrl);
        } else {
          console.log('📄 No JSON metadata (status', response.status, ')');
        }
      } catch (jsonErr) {
        console.log('📄 No JSON metadata available');
        debug.jsonStatus = 0;
      }

      const agencyList = dbAgencies
        .filter((slot: any) => slot.rank >= 1 && slot.rank <= 25)
        .map((slot: any) => {
          const jsonAgency = jsonMetadata?.agencies?.find((a: any) => a.rank === slot.rank);
          const agencyName = slot.agency_name || jsonAgency?.name || `Top 25 Slot #${slot.rank}`;

          return {
            rank: slot.rank,
            name: agencyName
          };
        })
        .sort((a, b) => a.rank - b.rank);

      debug.validAgencies = agencyList.length;

      setAgencies(agencyList);
      setDebugInfo(debug);
      console.log('✅ Loaded', agencyList.length, 'agencies from database');
    } catch (err: any) {
      console.error('❌ Failed to load agencies:', err);
      const errorMsg = err.message || 'Failed to load agencies';
      debug.error = errorMsg;
      debug.lastError = err;
      setLoadError(errorMsg);
      setDebugInfo(debug);
    } finally {
      setLoadingAgencies(false);
    }
  };

  const normalizeString = (str: string): string => {
    return str.toLowerCase().trim().replace(/[^a-z0-9]/g, '');
  };

  const slugifyStateName = (stateName: string): string => {
    return stateName
      .toLowerCase()
      .replace(/[^a-z0-9\s-]/g, '')
      .replace(/\s+/g, '-')
      .replace(/-+/g, '-')
      .trim();
  };

  const parseFilename = (filename: string): { agencyName: string; stateSlug: string } => {
    const nameWithoutExt = filename.replace(/\.[^/.]+$/, '');

    const pattern = /(.+?)-Top-25-Marketing-Agencies-in-(.+?)(?:-by-|$)/i;
    const match = nameWithoutExt.match(pattern);

    if (match) {
      const agencyPart = match[1];
      const statePart = match[2];

      const agencyName = agencyPart
        .split('-')
        .map(word => word.charAt(0).toUpperCase() + word.slice(1))
        .join(' ');

      const stateSlug = slugifyStateName(statePart);

      return { agencyName, stateSlug };
    }

    const simpleName = nameWithoutExt
      .split('-')
      .map(word => word.charAt(0).toUpperCase() + word.slice(1))
      .join(' ');

    return { agencyName: simpleName, stateSlug: selectedStateSlug };
  };

  const matchAgency = (agencyName: string): { name: string; rank: number; confidence: 'high' | 'medium' | 'low' } | null => {
    const normalized = normalizeString(agencyName);

    for (const agency of agencies) {
      const agencyNormalized = normalizeString(agency.name);
      if (agencyNormalized === normalized) {
        return { name: agency.name, rank: agency.rank, confidence: 'high' };
      }
    }

    for (const agency of agencies) {
      const agencyNormalized = normalizeString(agency.name);
      if (agencyNormalized.includes(normalized) || normalized.includes(agencyNormalized)) {
        return { name: agency.name, rank: agency.rank, confidence: 'medium' };
      }
    }

    return null;
  };

  const handleFileSelect = (e: React.ChangeEvent<HTMLInputElement>) => {
    if (!e.target.files) return;

    const newFiles = Array.from(e.target.files).map((file) => {
      const { agencyName, stateSlug } = parseFilename(file.name);
      const match = matchAgency(agencyName);
      const hasStateMismatch = stateSlug !== selectedStateSlug;

      return {
        id: crypto.randomUUID(),
        file,
        agencyName,
        stateSlug,
        matchedAgencyRank: match?.rank,
        matchedAgencyName: match?.name,
        matchConfidence: match?.confidence as 'high' | 'medium' | 'low' | undefined,
        hasStateMismatch,
      };
    });

    setLogos([...logos, ...newFiles]);
  };

  const removeLogo = (id: string) => {
    setLogos(logos.filter(logo => logo.id !== id));
  };

  const handleUpload = async () => {
    if (logos.length === 0) {
      alert('Please select logo files');
      return;
    }

    const unmatchedLogos = logos.filter(logo => !logo.matchedAgencyRank);
    if (unmatchedLogos.length > 0) {
      alert(`Could not match ${unmatchedLogos.length} file(s) with agency names. Please ensure filenames match the agency names in the JSON file.`);
      return;
    }

    const mismatchedLogos = logos.filter(logo => logo.hasStateMismatch);
    if (mismatchedLogos.length > 0) {
      const confirm = window.confirm(
        `${mismatchedLogos.length} file(s) have state mismatches. They will be uploaded to their detected state, not "${selectedStateSlug}". Continue?`
      );
      if (!confirm) return;
    }

    setUploading(true);
    setResults([]);
    setUploadDebug(null);

    const supabaseUrl = import.meta.env.VITE_SUPABASE_URL;
    const endpoint = `${supabaseUrl}/functions/v1/logo-upload`;

    const uploadDebugData: any = {
      endpoint,
      requestCount: logos.length,
      timestamp: new Date().toISOString(),
    };

    try {
      const uploadData = await Promise.all(
        logos.map(async (logo) => {
          const base64 = await new Promise<string>((resolve) => {
            const reader = new FileReader();
            reader.onload = () => {
              const result = reader.result as string;
              resolve(result.split(',')[1]);
            };
            reader.readAsDataURL(logo.file);
          });

          return {
            filename: logo.file.name,
            base64Data: base64,
            state: logo.stateSlug,
            agencyRank: logo.matchedAgencyRank,
          };
        })
      );

      // Send ONLY in header (single source of truth)
      const requestPayload = {
        logos: uploadData,
      };

      uploadDebugData.requestBodySize = JSON.stringify(requestPayload).length;
      console.log('📤 Uploading logos to:', endpoint);
      console.log('📊 Request size:', uploadDebugData.requestBodySize, 'bytes');

      const uploadResponse = await fetch(endpoint, {
        method: 'POST',
        headers: {
          'x-admin-token': getSessionToken(),
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(requestPayload),
      });

      uploadDebugData.responseStatus = uploadResponse.status;
      uploadDebugData.responseOk = uploadResponse.ok;

      const responseText = await uploadResponse.text();
      uploadDebugData.responseBodyPreview = responseText.substring(0, 300);

      console.log('📥 Response status:', uploadResponse.status);

      let uploadResult;
      try {
        uploadResult = JSON.parse(responseText);
      } catch (parseError) {
        uploadDebugData.parseError = 'Failed to parse JSON response';
        throw new Error(`Server returned invalid JSON (status ${uploadResponse.status}): ${responseText.substring(0, 100)}`);
      }

      if (!uploadResponse.ok) {
        uploadDebugData.serverError = uploadResult.error || 'Unknown server error';
        uploadDebugData.authDiagnostics = uploadResult;

        // Build detailed error message with auth diagnostics
        let errorMessage = uploadResult.error || `Server error: ${uploadResponse.status}`;

        if (uploadResult.hasHeader !== undefined) {
          const authInfo = [
            `hasHeader=${uploadResult.hasHeader}`,
            `receivedLen=${uploadResult.receivedLength}`,
            `expectedLen=${uploadResult.expectedLength}`,
          ].join(', ');
          errorMessage += ` (${authInfo})`;
        }

        throw new Error(errorMessage);
      }

      if (!uploadResult.success || !uploadResult.results) {
        uploadDebugData.logicError = uploadResult.error || 'No results returned';
        throw new Error(uploadResult.error || 'Server returned no results');
      }

      uploadDebugData.successCount = uploadResult.results.filter((r: any) => r.success).length;
      uploadDebugData.failCount = uploadResult.results.filter((r: any) => !r.success).length;

      console.log('✅ Upload complete:', uploadDebugData.successCount, 'successful,', uploadDebugData.failCount, 'failed');

      setResults(uploadResult.results);
      setShowResults(true);
      setLogos([]);
      setUploadDebug(uploadDebugData);
    } catch (error) {
      uploadDebugData.errorMessage = error instanceof Error ? error.message : 'Unknown error';
      uploadDebugData.errorType = error instanceof TypeError ? 'NetworkError' : 'ApplicationError';

      console.error('❌ Upload failed:', error);
      setUploadDebug(uploadDebugData);

      let errorMessage = 'Upload failed: ';
      if (error instanceof TypeError && error.message.includes('fetch')) {
        errorMessage += `Network error - cannot reach server at ${endpoint}. Check that the edge function is deployed.`;
      } else if (error instanceof Error) {
        errorMessage += error.message;
      } else {
        errorMessage += 'Unknown error';
      }

      alert(errorMessage);
    } finally {
      setUploading(false);
    }
  };

  const matchedCount = logos.filter(l => l.matchedAgencyRank).length;
  const unmatchedCount = logos.filter(l => !l.matchedAgencyRank).length;
  const mismatchedCount = logos.filter(l => l.hasStateMismatch).length;

  return (
    <WpAdminLayout title="Bulk Logo Upload" subtitle="Upload multiple agency logos at once for any state">
      <div className="max-w-4xl mx-auto">

        <div className="flex items-center gap-2 mb-6 px-4 py-3 bg-green-50 border border-green-200 rounded-lg text-sm text-green-800">
          <CheckCircle className="w-4 h-4 text-green-600 shrink-0" />
          <span>Authenticated via admin session</span>
        </div>

        {isDebugMode && uploadDebug && (
          <div className="bg-purple-50 border border-purple-200 rounded-lg p-4 mb-6">
            <h3 className="text-sm font-bold text-purple-900 mb-2">Upload Debug Info</h3>
            <div className="text-xs text-purple-800 space-y-1 font-mono">
              <p><strong>Endpoint:</strong> {uploadDebug.endpoint}</p>
              <p><strong>Request Count:</strong> {uploadDebug.requestCount}</p>
              <p><strong>Request Body Size:</strong> {uploadDebug.requestBodySize?.toLocaleString()} bytes</p>
              <p><strong>Has Session Token:</strong> {uploadDebug.hasSessionToken ? 'Yes' : 'No'}</p>
              {uploadDebug.responseStatus && (
                <>
                  <p><strong>Response Status:</strong> {uploadDebug.responseStatus} ({uploadDebug.responseOk ? 'OK' : 'ERROR'})</p>
                  <p><strong>Response Preview:</strong> {uploadDebug.responseBodyPreview}</p>
                </>
              )}
              {uploadDebug.successCount !== undefined && (
                <>
                  <p className="text-green-700"><strong>Successful:</strong> {uploadDebug.successCount}</p>
                  <p className="text-red-700"><strong>Failed:</strong> {uploadDebug.failCount}</p>
                </>
              )}
              {uploadDebug.errorMessage && (
                <p className="text-red-700"><strong>Error:</strong> {uploadDebug.errorMessage}</p>
              )}
              {uploadDebug.errorType && (
                <p className="text-red-700"><strong>Error Type:</strong> {uploadDebug.errorType}</p>
              )}
              <details className="mt-2">
                <summary className="cursor-pointer text-purple-700 font-bold">Full Debug Data</summary>
                <pre className="mt-1 text-xs overflow-auto bg-white p-2 rounded">{JSON.stringify(uploadDebug, null, 2)}</pre>
              </details>
            </div>
          </div>
        )}

        {!showResults ? (
          <>
            <div className="bg-white rounded-lg shadow p-6 mb-8">
              <label htmlFor="state-selector" className="block text-sm font-medium text-gray-700 mb-2">
                Select State
              </label>
              <select
                id="state-selector"
                value={selectedStateSlug}
                onChange={(e) => handleStateChange(e.target.value)}
                className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
              >
                {availableStates.map(state => (
                  <option key={state.slug} value={state.slug}>
                    {state.name}
                  </option>
                ))}
              </select>
              <p className="mt-2 text-sm text-gray-500">
                Selected state: <span className="font-medium text-gray-900">{selectedStateSlug}</span>
              </p>
            </div>

            {isDebugMode && debugInfo && (
              <div className="bg-blue-50 border border-blue-200 rounded-lg p-4 mb-6">
                <h3 className="text-sm font-bold text-blue-900 mb-2">Debug Info</h3>
                <div className="text-xs text-blue-800 space-y-1 font-mono">
                  <p><strong>Selected State:</strong> {debugInfo.stateSlug}</p>
                  <p><strong>Source:</strong> {debugInfo.source || 'none'}</p>
                  <p><strong>Agencies Loaded:</strong> {debugInfo.validAgencies || 0}</p>
                  {debugInfo.jsonFetchUrl && (
                    <>
                      <p><strong>JSON URL:</strong> {debugInfo.jsonFetchUrl}</p>
                      <p><strong>JSON Status:</strong> {debugInfo.jsonStatus || 'N/A'}</p>
                      {debugInfo.jsonKeys && (
                        <p><strong>JSON Keys:</strong> {debugInfo.jsonKeys.join(', ')}</p>
                      )}
                    </>
                  )}
                  {debugInfo.dbAgenciesCount !== undefined && (
                    <p><strong>DB Rows:</strong> {debugInfo.dbAgenciesCount}</p>
                  )}
                  {debugInfo.error && (
                    <p className="text-red-700"><strong>Error:</strong> {debugInfo.error}</p>
                  )}
                  {debugInfo.lastError && (
                    <details className="mt-2">
                      <summary className="cursor-pointer text-red-700 font-bold">Last Error Details</summary>
                      <pre className="mt-1 text-xs overflow-auto">{JSON.stringify(debugInfo.lastError, null, 2)}</pre>
                    </details>
                  )}
                </div>
              </div>
            )}

            {loadingAgencies ? (
              <div className="flex justify-center items-center py-12">
                <Loader className="animate-spin text-blue-600" size={32} />
                <span className="ml-2 text-gray-600">Loading agencies for {selectedStateSlug}...</span>
              </div>
            ) : loadError ? (
              <div className="bg-red-50 border-l-4 border-red-400 p-6 mb-8">
                <div className="flex">
                  <AlertCircle className="w-6 h-6 text-red-400 mr-3 flex-shrink-0" />
                  <div>
                    <h3 className="text-lg font-medium text-red-800 mb-2">Could not load agencies</h3>
                    <p className="text-sm text-red-700 mb-4">{loadError}</p>
                    {isDebugMode && debugInfo && (
                      <div className="text-xs text-red-700 font-mono space-y-1">
                        <p><strong>JSON Fetch URL:</strong> {debugInfo.jsonFetchUrl || 'N/A'}</p>
                        <p><strong>JSON Status:</strong> {debugInfo.jsonStatus || 'N/A'}</p>
                        <p><strong>DB Agencies Count:</strong> {debugInfo.dbAgenciesCount || 0}</p>
                      </div>
                    )}
                    <button
                      onClick={() => loadAgencies(selectedStateSlug)}
                      className="mt-4 px-4 py-2 bg-red-600 text-white rounded hover:bg-red-700 transition-colors"
                    >
                      Retry
                    </button>
                  </div>
                </div>
              </div>
            ) : (
              <>
                <div className="bg-gray-50 rounded-lg border-2 border-dashed border-gray-300 p-8 mb-8 text-center">
                  <Upload className="mx-auto h-12 w-12 text-gray-400 mb-4" />
                  <p className="text-gray-600 mb-2">Drag and drop logo files here, or</p>
                  <label className="cursor-pointer">
                    <span className="bg-blue-600 text-white px-4 py-2 rounded hover:bg-blue-700 inline-block transition-colors">
                      Select Files
                    </span>
                    <input
                      type="file"
                      multiple
                      accept="image/*"
                      onChange={handleFileSelect}
                      className="hidden"
                    />
                  </label>
                  <p className="text-sm text-gray-500 mt-4">PNG, JPG, WebP - any size</p>
                </div>

                {logos.length > 0 && (
                  <div className="bg-white rounded-lg border border-gray-200 overflow-hidden mb-8">
                    <div className="overflow-x-auto">
                      <table className="w-full">
                        <thead>
                          <tr className="bg-gray-50 border-b">
                            <th className="px-6 py-3 text-left text-sm font-semibold text-gray-900">Parsed Name</th>
                            <th className="px-6 py-3 text-left text-sm font-semibold text-gray-900">Detected State</th>
                            <th className="px-6 py-3 text-left text-sm font-semibold text-gray-900">Match Status</th>
                            <th className="px-6 py-3 text-left text-sm font-semibold text-gray-900">Matched To</th>
                            <th className="px-6 py-3 text-center text-sm font-semibold text-gray-900">Action</th>
                          </tr>
                        </thead>
                        <tbody>
                          {logos.map((logo) => (
                            <tr
                              key={logo.id}
                              className={`border-b ${
                                logo.hasStateMismatch
                                  ? 'bg-orange-50 hover:bg-orange-100'
                                  : logo.matchedAgencyRank
                                    ? 'bg-green-50 hover:bg-green-100'
                                    : 'bg-yellow-50 hover:bg-yellow-100'
                              }`}
                            >
                              <td className="px-6 py-4">
                                <div className="text-sm font-medium text-gray-900">{logo.agencyName || '—'}</div>
                                <div className="text-xs text-gray-500">{logo.file.name}</div>
                              </td>
                              <td className="px-6 py-4">
                                <div className="text-sm font-medium text-gray-900">{logo.stateSlug}</div>
                                {logo.hasStateMismatch && (
                                  <div className="text-xs text-orange-600 font-medium">Mismatch</div>
                                )}
                              </td>
                              <td className="px-6 py-4">
                                {logo.matchedAgencyRank ? (
                                  <div className="flex items-center gap-2">
                                    <span className={`inline-block w-2 h-2 rounded-full ${logo.matchConfidence === 'high' ? 'bg-green-600' : 'bg-blue-600'}`}></span>
                                    <span className={`text-xs font-medium ${logo.matchConfidence === 'high' ? 'text-green-700' : 'text-blue-600'}`}>
                                      {logo.matchConfidence === 'high' ? 'Exact' : 'Partial'}
                                    </span>
                                  </div>
                                ) : (
                                  <div className="flex items-center gap-2">
                                    <span className="inline-block w-2 h-2 rounded-full bg-yellow-600"></span>
                                    <span className="text-xs font-medium text-yellow-700">No Match</span>
                                  </div>
                                )}
                              </td>
                              <td className="px-6 py-4">
                                {logo.matchedAgencyRank ? (
                                  <div className="text-sm font-medium text-gray-900">
                                    Rank #{logo.matchedAgencyRank}: {logo.matchedAgencyName}
                                  </div>
                                ) : (
                                  <div className="text-sm text-gray-500">—</div>
                                )}
                              </td>
                              <td className="px-6 py-4 text-center">
                                <button
                                  onClick={() => removeLogo(logo.id)}
                                  className="text-red-600 hover:text-red-700"
                                >
                                  <Trash2 size={18} />
                                </button>
                              </td>
                            </tr>
                          ))}
                        </tbody>
                      </table>
                    </div>

                    <div className="bg-gray-50 px-6 py-4 border-t">
                      <div className="flex justify-between items-center mb-4">
                        <div className="text-sm text-gray-600">
                          <p className="font-medium">{logos.length} file(s) selected</p>
                          <div className="text-xs text-gray-500 mt-1 space-y-1">
                            <p>{matchedCount} matched</p>
                            <p>{unmatchedCount} unmatched</p>
                            {mismatchedCount > 0 && (
                              <p className="text-orange-600 font-medium">{mismatchedCount} state mismatch</p>
                            )}
                          </div>
                        </div>
                        <div className="flex gap-3">
                          <button
                            onClick={() => setLogos([])}
                            className="px-4 py-2 text-gray-700 border border-gray-300 rounded hover:bg-gray-100"
                          >
                            Clear All
                          </button>
                          <button
                            onClick={handleUpload}
                            disabled={uploading || matchedCount === 0}
                            className="px-6 py-2 bg-blue-600 text-white rounded hover:bg-blue-700 disabled:bg-gray-400 flex items-center gap-2 transition-colors"
                          >
                            {uploading ? (
                              <>
                                <Loader size={18} className="animate-spin" />
                                Uploading...
                              </>
                            ) : (
                              <>
                                <Upload size={18} />
                                Upload {matchedCount} Logo{matchedCount !== 1 ? 's' : ''}
                              </>
                            )}
                          </button>
                        </div>
                      </div>

                      {unmatchedCount > 0 && (
                        <div className="bg-yellow-50 border border-yellow-200 rounded p-3 text-sm text-yellow-800">
                          <strong>Note:</strong> {unmatchedCount} unmatched file(s) will be skipped during upload.
                        </div>
                      )}

                      {mismatchedCount > 0 && (
                        <div className="bg-orange-50 border border-orange-200 rounded p-3 text-sm text-orange-800 mt-2">
                          <strong>Warning:</strong> {mismatchedCount} file(s) have a different state than "{selectedStateSlug}". They will be uploaded to their detected state.
                        </div>
                      )}
                    </div>
                  </div>
                )}
              </>
            )}
          </>
        ) : (
          <div className="bg-white rounded-lg border border-gray-200 p-8">
            <h2 className="text-xl font-bold text-gray-900 mb-6">Upload Results</h2>
            <div className="space-y-3">
              {results.map((result, idx) => (
                <div
                  key={idx}
                  className={`p-4 rounded border flex items-start gap-3 ${
                    result.success
                      ? 'bg-green-50 border-green-200'
                      : 'bg-red-50 border-red-200'
                  }`}
                >
                  {result.success ? (
                    <Check className="text-green-600 flex-shrink-0 mt-0.5" size={20} />
                  ) : (
                    <AlertCircle className="text-red-600 flex-shrink-0 mt-0.5" size={20} />
                  )}
                  <div className="flex-1 min-w-0">
                    <p className={`font-medium ${result.success ? 'text-green-900' : 'text-red-900'}`}>
                      {result.filename}
                    </p>
                    {result.error && <p className="text-sm text-red-700 mt-1">{result.error}</p>}
                    {result.logoUrl && <p className="text-sm text-green-700 mt-1">Uploaded successfully</p>}
                  </div>
                </div>
              ))}
            </div>

            <div className="mt-8 flex gap-3">
              <button
                onClick={() => {
                  setShowResults(false);
                  setResults([]);
                }}
                className="px-6 py-2 bg-blue-600 text-white rounded hover:bg-blue-700 transition-colors"
              >
                Upload More
              </button>
            </div>
          </div>
        )}
      </div>
    </WpAdminLayout>
  );
}
