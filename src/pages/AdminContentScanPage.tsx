import { useState } from 'react';
import { Search, AlertTriangle, Database, FileText, Filter, X } from 'lucide-react';
import WpAdminLayout from '../components/wpadmin/WpAdminLayout';

interface Match {
  source_type: 'DB' | 'FILE';
  location: string;
  identifier: string;
  context: string;
  matched_keyword: string;
  state_slug?: string;
  rank?: number;
}

interface ScanResult {
  success: boolean;
  total_matches: number;
  matches: Match[];
  summary: {
    by_keyword: Record<string, number>;
    by_source: { DB: number; FILE: number };
  };
}

function getSessionToken(): string {
  return localStorage.getItem('gappsy_admin_token') ?? '';
}

export default function AdminContentScanPage() {
  const [includeSlotKeywords, setIncludeSlotKeywords] = useState(false);
  const [isScanning, setIsScanning] = useState(false);
  const [scanResult, setScanResult] = useState<ScanResult | null>(null);
  const [error, setError] = useState('');
  const [searchFilter, setSearchFilter] = useState('');
  const [sourceFilter, setSourceFilter] = useState<'ALL' | 'DB' | 'FILE'>('ALL');

  const token = getSessionToken();

  const handleScan = async () => {
    setIsScanning(true);
    setError('');
    setScanResult(null);

    try {
      const supabaseUrl = import.meta.env.VITE_SUPABASE_URL;
      const anonKey = import.meta.env.VITE_SUPABASE_ANON_KEY;
      const endpoint = `${supabaseUrl}/functions/v1/content-scan`;

      const response = await fetch(endpoint, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'Authorization': `Bearer ${anonKey}`,
          'apikey': anonKey,
          'x-admin-token': token,
        },
        body: JSON.stringify({ includeSlotKeywords }),
      });

      if (!response.ok) {
        let errorMessage = 'Scan failed';
        try {
          const errorData = await response.json();
          errorMessage = errorData.error || errorData.message || `HTTP ${response.status}: ${response.statusText}`;
        } catch {
          errorMessage = `HTTP ${response.status}: ${response.statusText}`;
        }
        setError(errorMessage);
        return;
      }

      const result = await response.json();
      setScanResult(result);
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Network error');
    } finally {
      setIsScanning(false);
    }
  };

  const filteredMatches = scanResult?.matches.filter((match) => {
    if (sourceFilter !== 'ALL' && match.source_type !== sourceFilter) {
      return false;
    }

    if (searchFilter) {
      const search = searchFilter.toLowerCase();
      return (
        match.location.toLowerCase().includes(search) ||
        match.context.toLowerCase().includes(search) ||
        match.matched_keyword.toLowerCase().includes(search) ||
        match.state_slug?.toLowerCase().includes(search)
      );
    }

    return true;
  }) || [];

  return (
    <WpAdminLayout
      title="Content Scanner"
      subtitle="Scan database and files for casino/gambling keywords"
    >
      <div className="space-y-6">
        {!token && (
          <div className="bg-red-50 border border-red-200 rounded-lg p-4">
            <p className="text-sm font-semibold text-red-900">Authentication required</p>
            <p className="text-sm text-red-700 mt-1">Please log in to use the content scanner.</p>
          </div>
        )}

        <div className="bg-yellow-50 border border-yellow-200 rounded-lg p-4">
          <div className="flex gap-2">
            <AlertTriangle className="w-5 h-5 text-yellow-600 flex-shrink-0 mt-0.5" />
            <div className="flex-1">
              <p className="text-sm font-semibold text-yellow-900 mb-1">Read-Only Scanner</p>
              <p className="text-sm text-yellow-800">
                This tool scans for suspicious keywords but does not modify any data.
                Review results manually and take appropriate action.
              </p>
            </div>
          </div>
        </div>

        <div className="bg-white rounded-xl border border-slate-200 p-6 space-y-4">
          <div className="flex items-center gap-2">
            <input
              type="checkbox"
              id="includeSlots"
              checked={includeSlotKeywords}
              onChange={(e) => setIncludeSlotKeywords(e.target.checked)}
              className="w-4 h-4 text-red-600 border-gray-300 rounded focus:ring-red-500"
            />
            <label htmlFor="includeSlots" className="text-sm text-slate-700">
              Include slot-specific keywords (slots, slot machine, free spins)
            </label>
          </div>

          <button
            onClick={handleScan}
            disabled={isScanning || !token}
            className="flex items-center gap-2 px-6 py-2.5 bg-red-600 hover:bg-red-700 disabled:bg-slate-300 disabled:cursor-not-allowed text-white rounded-lg transition-colors text-sm font-medium"
          >
            <Search className={`w-4 h-4 ${isScanning ? 'animate-pulse' : ''}`} />
            {isScanning ? 'Scanning...' : 'Run Content Scan'}
          </button>

          {error && (
            <div className="bg-red-50 border border-red-200 rounded-lg p-4">
              <p className="text-sm text-red-800">{error}</p>
            </div>
          )}
        </div>

        {scanResult && (
          <div className="space-y-6">
            <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
              <div className="bg-blue-50 rounded-xl border border-blue-100 p-4">
                <div className="flex items-center gap-2 mb-2">
                  <AlertTriangle className="w-5 h-5 text-blue-600" />
                  <p className="text-sm font-medium text-blue-900">Total Matches</p>
                </div>
                <p className="text-3xl font-bold text-blue-600">{scanResult.total_matches}</p>
              </div>

              <div className="bg-slate-50 rounded-xl border border-slate-200 p-4">
                <div className="flex items-center gap-2 mb-2">
                  <Database className="w-5 h-5 text-slate-600" />
                  <p className="text-sm font-medium text-slate-900">Database Matches</p>
                </div>
                <p className="text-3xl font-bold text-slate-700">
                  {scanResult.summary.by_source.DB || 0}
                </p>
              </div>

              <div className="bg-green-50 rounded-xl border border-green-100 p-4">
                <div className="flex items-center gap-2 mb-2">
                  <FileText className="w-5 h-5 text-green-600" />
                  <p className="text-sm font-medium text-green-900">File Matches</p>
                </div>
                <p className="text-3xl font-bold text-green-600">
                  {scanResult.summary.by_source.FILE || 0}
                </p>
              </div>
            </div>

            <div className="bg-white rounded-xl border border-slate-200 p-4">
              <p className="text-sm font-medium text-slate-700 mb-3">Matches by Keyword</p>
              <div className="flex flex-wrap gap-2">
                {Object.entries(scanResult.summary.by_keyword).map(([keyword, count]) => (
                  <span
                    key={keyword}
                    className="px-3 py-1 bg-slate-100 border border-slate-200 rounded-full text-sm"
                  >
                    <span className="font-medium text-slate-800">{keyword}</span>
                    <span className="text-slate-500 ml-1">({count})</span>
                  </span>
                ))}
              </div>
            </div>

            <div className="bg-white rounded-xl border border-slate-200 overflow-hidden">
              <div className="p-4 border-b border-slate-100 flex items-center gap-4">
                <div className="flex-1">
                  <div className="relative">
                    <Search className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-slate-400" />
                    <input
                      type="text"
                      value={searchFilter}
                      onChange={(e) => setSearchFilter(e.target.value)}
                      placeholder="Filter results..."
                      className="w-full pl-10 pr-4 py-2 border border-slate-200 rounded-lg text-sm focus:ring-2 focus:ring-red-500 focus:border-red-500 outline-none"
                    />
                    {searchFilter && (
                      <button
                        onClick={() => setSearchFilter('')}
                        className="absolute right-3 top-1/2 -translate-y-1/2"
                      >
                        <X className="w-4 h-4 text-slate-400 hover:text-slate-600" />
                      </button>
                    )}
                  </div>
                </div>
                <div className="flex items-center gap-2">
                  <Filter className="w-4 h-4 text-slate-400" />
                  <select
                    value={sourceFilter}
                    onChange={(e) => setSourceFilter(e.target.value as 'ALL' | 'DB' | 'FILE')}
                    className="px-3 py-2 border border-slate-200 rounded-lg text-sm focus:ring-2 focus:ring-red-500 focus:border-red-500 outline-none"
                  >
                    <option value="ALL">All Sources</option>
                    <option value="DB">Database Only</option>
                    <option value="FILE">Files Only</option>
                  </select>
                </div>
              </div>

              <div className="px-4 py-2 bg-slate-50 border-b border-slate-100">
                <p className="text-xs text-slate-500">
                  Showing {filteredMatches.length} of {scanResult.total_matches} matches
                </p>
              </div>

              {filteredMatches.length === 0 ? (
                <div className="p-12 text-center">
                  <p className="text-base font-medium text-green-900">No matches found</p>
                  <p className="text-sm text-green-700 mt-1">
                    Content appears clean based on current filters
                  </p>
                </div>
              ) : (
                <div className="overflow-x-auto">
                  <table className="min-w-full divide-y divide-slate-100">
                    <thead className="bg-slate-50">
                      <tr>
                        <th className="px-4 py-3 text-left text-xs font-medium text-slate-500 uppercase tracking-wider">Source</th>
                        <th className="px-4 py-3 text-left text-xs font-medium text-slate-500 uppercase tracking-wider">Location</th>
                        <th className="px-4 py-3 text-left text-xs font-medium text-slate-500 uppercase tracking-wider">Identifier</th>
                        <th className="px-4 py-3 text-left text-xs font-medium text-slate-500 uppercase tracking-wider">Keyword</th>
                        <th className="px-4 py-3 text-left text-xs font-medium text-slate-500 uppercase tracking-wider">Context</th>
                        <th className="px-4 py-3 text-left text-xs font-medium text-slate-500 uppercase tracking-wider">State/Rank</th>
                      </tr>
                    </thead>
                    <tbody className="bg-white divide-y divide-slate-100">
                      {filteredMatches.map((match, index) => (
                        <tr key={index} className="hover:bg-slate-50">
                          <td className="px-4 py-3 whitespace-nowrap">
                            <span className={`inline-flex items-center px-2 py-1 rounded-full text-xs font-medium ${match.source_type === 'DB' ? 'bg-slate-100 text-slate-800' : 'bg-green-100 text-green-800'}`}>
                              {match.source_type === 'DB' ? (
                                <Database className="w-3 h-3 mr-1" />
                              ) : (
                                <FileText className="w-3 h-3 mr-1" />
                              )}
                              {match.source_type}
                            </span>
                          </td>
                          <td className="px-4 py-3 text-sm text-slate-900 font-mono">{match.location}</td>
                          <td className="px-4 py-3 text-sm text-slate-900 font-mono">{match.identifier}</td>
                          <td className="px-4 py-3 whitespace-nowrap">
                            <span className="inline-flex px-2 py-1 bg-red-100 text-red-800 rounded text-xs font-medium">
                              {match.matched_keyword}
                            </span>
                          </td>
                          <td className="px-4 py-3 text-sm text-slate-600 max-w-md">
                            <div className="break-words">{match.context}</div>
                          </td>
                          <td className="px-4 py-3 text-sm text-slate-500">
                            {match.state_slug && (
                              <div className="text-xs"><span className="font-medium">State:</span> {match.state_slug}</div>
                            )}
                            {match.rank && (
                              <div className="text-xs"><span className="font-medium">Rank:</span> {match.rank}</div>
                            )}
                          </td>
                        </tr>
                      ))}
                    </tbody>
                  </table>
                </div>
              )}
            </div>
          </div>
        )}
      </div>
    </WpAdminLayout>
  );
}
