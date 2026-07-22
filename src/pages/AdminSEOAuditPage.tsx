import { useState, useEffect } from 'react';
import { Search, CheckCircle, XCircle, Download, RefreshCw, AlertCircle } from 'lucide-react';
import { supabase } from '../lib/supabase';
import WpAdminLayout from '../components/wpadmin/WpAdminLayout';

interface StateAuditResult {
  stateSlug: string;
  stateName: string;
  url: string;
  status: 'pending' | 'testing' | 'pass' | 'fail' | 'error';
  checks: {
    titleHasState: boolean | null;
    metaDescriptionExists: boolean | null;
    metaDescriptionLength: number | null;
    canonicalCorrect: boolean | null;
    ogTitleExists: boolean | null;
    ogDescriptionExists: boolean | null;
    ogImageExists: boolean | null;
    twitterCardExists: boolean | null;
    ogImageReachable: boolean | null;
  };
  errors: string[];
  testedAt: Date | null;
}

export default function AdminSEOAuditPage() {
  const [states, setStates] = useState<StateAuditResult[]>([]);
  const [loading, setLoading] = useState(false);
  const [progress, setProgress] = useState({ current: 0, total: 0 });
  const [filter, setFilter] = useState<'all' | 'pass' | 'fail'>('all');

  useEffect(() => {
    loadStates();
  }, []);

  const loadStates = async () => {
    try {
      const { data, error } = await supabase
        .from('state_pages')
        .select('state_slug, state_name')
        .eq('is_active', true)
        .order('state_name');

      if (error) throw error;

      const stateResults: StateAuditResult[] = (data || []).map(state => ({
        stateSlug: state.state_slug,
        stateName: state.state_name,
        url: `https://gappsy.com/marketing-agencies-in-${state.state_slug}-united-states/`,
        status: 'pending',
        checks: {
          titleHasState: null,
          metaDescriptionExists: null,
          metaDescriptionLength: null,
          canonicalCorrect: null,
          ogTitleExists: null,
          ogDescriptionExists: null,
          ogImageExists: null,
          twitterCardExists: null,
          ogImageReachable: null
        },
        errors: [],
        testedAt: null
      }));

      setStates(stateResults);
    } catch (err) {
      console.error('Error loading states:', err);
    }
  };

  const auditState = async (state: StateAuditResult): Promise<StateAuditResult> => {
    const result = { ...state, status: 'testing' as const, errors: [] as string[] };

    try {
      const response = await fetch(state.url, {
        method: 'GET',
        headers: {
          'Accept': 'text/html',
          'User-Agent': 'Mozilla/5.0 (compatible; SEO-Audit/1.0)'
        },
        cache: 'no-store'
      });

      if (!response.ok) {
        result.errors.push(`HTTP ${response.status}`);
        result.status = 'error';
        return result;
      }

      const html = await response.text();

      const titleMatch = html.match(/<title[^>]*>(.*?)<\/title>/i);
      const title = titleMatch ? titleMatch[1] : '';
      result.checks.titleHasState = title.toLowerCase().includes(state.stateName.toLowerCase());

      const metaDescMatch = html.match(/<meta\s+name=["']description["']\s+content=["']([^"']*)["']/i);
      const metaDesc = metaDescMatch ? metaDescMatch[1] : '';
      result.checks.metaDescriptionExists = metaDesc.length > 0;
      result.checks.metaDescriptionLength = metaDesc.length;

      if (metaDesc.length > 160) {
        result.errors.push(`Meta description too long (${metaDesc.length} chars)`);
      }

      const canonicalMatch = html.match(/<link\s+rel=["']canonical["']\s+href=["']([^"']*)["']/i);
      const canonical = canonicalMatch ? canonicalMatch[1] : '';
      const expectedCanonical = state.url;
      result.checks.canonicalCorrect = canonical === expectedCanonical || canonical === expectedCanonical.replace(/\/$/, '');

      result.checks.ogTitleExists = /<meta\s+property=["']og:title["']/i.test(html);
      result.checks.ogDescriptionExists = /<meta\s+property=["']og:description["']/i.test(html);
      result.checks.ogImageExists = /<meta\s+property=["']og:image["']/i.test(html);
      result.checks.twitterCardExists = /<meta\s+name=["']twitter:card["']\s+content=["']summary_large_image["']/i.test(html);

      const ogImageMatch = html.match(/<meta\s+property=["']og:image["']\s+content=["']([^"']*)["']/i);
      if (ogImageMatch) {
        const ogImageUrl = ogImageMatch[1];
        try {
          const imgResponse = await fetch(ogImageUrl, { method: 'HEAD' });
          result.checks.ogImageReachable = imgResponse.ok;
          if (!imgResponse.ok) {
            result.errors.push(`OG image returns HTTP ${imgResponse.status}`);
          }
        } catch {
          result.checks.ogImageReachable = false;
          result.errors.push('OG image unreachable');
        }
      } else {
        result.checks.ogImageReachable = false;
      }

      const allChecksPassed = Object.values(result.checks).every(v => v === true);
      result.status = allChecksPassed && result.errors.length === 0 ? 'pass' : 'fail';
      result.testedAt = new Date();

    } catch (error) {
      result.errors.push(error instanceof Error ? error.message : 'Unknown error');
      result.status = 'error';
    }

    return result;
  };

  const runFullAudit = async () => {
    setLoading(true);
    setProgress({ current: 0, total: states.length });

    const updatedStates = [...states];

    for (let i = 0; i < updatedStates.length; i++) {
      setProgress({ current: i + 1, total: states.length });

      const result = await auditState(updatedStates[i]);
      updatedStates[i] = result;

      setStates([...updatedStates]);

      await new Promise(resolve => setTimeout(resolve, 500));
    }

    setLoading(false);
  };

  const exportToCSV = () => {
    const headers = [
      'State',
      'URL',
      'Status',
      'Title Has State',
      'Meta Desc Exists',
      'Meta Desc Length',
      'Canonical Correct',
      'OG Title',
      'OG Description',
      'OG Image',
      'Twitter Card',
      'OG Image Reachable',
      'Errors'
    ];

    const rows = states.map(s => [
      s.stateName,
      s.url,
      s.status,
      s.checks.titleHasState ?? 'N/A',
      s.checks.metaDescriptionExists ?? 'N/A',
      s.checks.metaDescriptionLength ?? 'N/A',
      s.checks.canonicalCorrect ?? 'N/A',
      s.checks.ogTitleExists ?? 'N/A',
      s.checks.ogDescriptionExists ?? 'N/A',
      s.checks.ogImageExists ?? 'N/A',
      s.checks.twitterCardExists ?? 'N/A',
      s.checks.ogImageReachable ?? 'N/A',
      s.errors.join('; ')
    ]);

    const csv = [
      headers.join(','),
      ...rows.map(row => row.map(cell => `"${cell}"`).join(','))
    ].join('\n');

    const blob = new Blob([csv], { type: 'text/csv' });
    const url = URL.createObjectURL(blob);
    const a = document.createElement('a');
    a.href = url;
    a.download = `seo-audit-${new Date().toISOString().split('T')[0]}.csv`;
    a.click();
    URL.revokeObjectURL(url);
  };

  const filteredStates = states.filter(s => {
    if (filter === 'all') return true;
    return s.status === filter;
  });

  const stats = {
    total: states.length,
    pass: states.filter(s => s.status === 'pass').length,
    fail: states.filter(s => s.status === 'fail').length,
    error: states.filter(s => s.status === 'error').length,
    pending: states.filter(s => s.status === 'pending').length
  };

  return (
    <WpAdminLayout title="SEO Audit — All States" subtitle="Comprehensive validation of SEO tags across all state pages">
      <div className="space-y-6">
        <div className="flex justify-end gap-2">
          <button
            onClick={runFullAudit}
            disabled={loading}
            className="flex items-center gap-2 px-4 py-2 bg-slate-900 hover:bg-slate-800 disabled:bg-slate-300 disabled:cursor-not-allowed text-white rounded-lg transition-colors text-sm font-medium"
          >
            <RefreshCw className={`w-4 h-4 ${loading ? 'animate-spin' : ''}`} />
            {loading ? 'Running...' : 'Run Full Audit'}
          </button>
          {states.some(s => s.status !== 'pending') && (
            <button
              onClick={exportToCSV}
              className="flex items-center gap-2 px-4 py-2 bg-white border border-slate-200 hover:bg-slate-50 text-slate-700 rounded-lg transition-colors text-sm font-medium"
            >
              <Download className="w-4 h-4" />
              Export CSV
            </button>
          )}
        </div>
            {loading && (
              <div className="bg-blue-50 border border-blue-200 rounded-lg p-4">
                <div className="flex items-center gap-3">
                  <RefreshCw className="w-5 h-5 text-blue-600 animate-spin" />
                  <div className="flex-1">
                    <p className="text-sm font-semibold text-blue-900">
                      Auditing... {progress.current} of {progress.total}
                    </p>
                    <div className="w-full bg-blue-200 rounded-full h-2 mt-2">
                      <div
                        className="bg-blue-600 h-2 rounded-full transition-all"
                        style={{ width: `${(progress.current / progress.total) * 100}%` }}
                      />
                    </div>
                  </div>
                </div>
              </div>
            )}

            <div className="grid grid-cols-2 md:grid-cols-5 gap-4">
              <div className="bg-gray-100 rounded-lg p-4">
                <p className="text-sm text-gray-600">Total States</p>
                <p className="text-2xl font-bold text-gray-900">{stats.total}</p>
              </div>
              <div className="bg-green-100 rounded-lg p-4">
                <p className="text-sm text-green-700">Passed</p>
                <p className="text-2xl font-bold text-green-900">{stats.pass}</p>
              </div>
              <div className="bg-red-100 rounded-lg p-4">
                <p className="text-sm text-red-700">Failed</p>
                <p className="text-2xl font-bold text-red-900">{stats.fail}</p>
              </div>
              <div className="bg-orange-100 rounded-lg p-4">
                <p className="text-sm text-orange-700">Errors</p>
                <p className="text-2xl font-bold text-orange-900">{stats.error}</p>
              </div>
              <div className="bg-blue-100 rounded-lg p-4">
                <p className="text-sm text-blue-700">Pending</p>
                <p className="text-2xl font-bold text-blue-900">{stats.pending}</p>
              </div>
            </div>

            <div className="flex gap-2">
              <button
                onClick={() => setFilter('all')}
                className={`px-4 py-2 rounded-lg font-medium transition-colors ${
                  filter === 'all'
                    ? 'bg-gray-900 text-white'
                    : 'bg-gray-100 text-gray-700 hover:bg-gray-200'
                }`}
              >
                All ({stats.total})
              </button>
              <button
                onClick={() => setFilter('pass')}
                className={`px-4 py-2 rounded-lg font-medium transition-colors ${
                  filter === 'pass'
                    ? 'bg-green-600 text-white'
                    : 'bg-gray-100 text-gray-700 hover:bg-gray-200'
                }`}
              >
                Pass ({stats.pass})
              </button>
              <button
                onClick={() => setFilter('fail')}
                className={`px-4 py-2 rounded-lg font-medium transition-colors ${
                  filter === 'fail'
                    ? 'bg-red-600 text-white'
                    : 'bg-gray-100 text-gray-700 hover:bg-gray-200'
                }`}
              >
                Fail ({stats.fail})
              </button>
            </div>

            <div className="space-y-3">
              {filteredStates.map((state) => (
                <div
                  key={state.stateSlug}
                  className={`border rounded-lg p-4 ${
                    state.status === 'pass'
                      ? 'bg-green-50 border-green-200'
                      : state.status === 'fail'
                      ? 'bg-red-50 border-red-200'
                      : state.status === 'error'
                      ? 'bg-orange-50 border-orange-200'
                      : state.status === 'testing'
                      ? 'bg-blue-50 border-blue-200'
                      : 'bg-gray-50 border-gray-200'
                  }`}
                >
                  <div className="flex items-start justify-between">
                    <div className="flex-1">
                      <div className="flex items-center gap-2">
                        {state.status === 'pass' && <CheckCircle className="w-5 h-5 text-green-600" />}
                        {state.status === 'fail' && <XCircle className="w-5 h-5 text-red-600" />}
                        {state.status === 'error' && <AlertCircle className="w-5 h-5 text-orange-600" />}
                        {state.status === 'testing' && <RefreshCw className="w-5 h-5 text-blue-600 animate-spin" />}
                        <h3 className="font-bold text-lg">{state.stateName}</h3>
                      </div>
                      <p className="text-sm text-gray-600 font-mono mt-1">{state.url}</p>
                    </div>
                    <div className="text-right">
                      <span
                        className={`inline-block px-3 py-1 rounded-full text-xs font-bold uppercase ${
                          state.status === 'pass'
                            ? 'bg-green-200 text-green-800'
                            : state.status === 'fail'
                            ? 'bg-red-200 text-red-800'
                            : state.status === 'error'
                            ? 'bg-orange-200 text-orange-800'
                            : 'bg-gray-200 text-gray-800'
                        }`}
                      >
                        {state.status}
                      </span>
                    </div>
                  </div>

                  {state.status !== 'pending' && (
                    <div className="mt-3 grid grid-cols-3 md:grid-cols-5 gap-2 text-xs">
                      <div className={`p-2 rounded ${state.checks.titleHasState ? 'bg-green-100' : 'bg-red-100'}`}>
                        {state.checks.titleHasState ? '✓' : '✗'} Title
                      </div>
                      <div className={`p-2 rounded ${state.checks.metaDescriptionExists ? 'bg-green-100' : 'bg-red-100'}`}>
                        {state.checks.metaDescriptionExists ? '✓' : '✗'} Desc
                        {state.checks.metaDescriptionLength && ` (${state.checks.metaDescriptionLength})`}
                      </div>
                      <div className={`p-2 rounded ${state.checks.canonicalCorrect ? 'bg-green-100' : 'bg-red-100'}`}>
                        {state.checks.canonicalCorrect ? '✓' : '✗'} Canonical
                      </div>
                      <div className={`p-2 rounded ${state.checks.ogTitleExists ? 'bg-green-100' : 'bg-red-100'}`}>
                        {state.checks.ogTitleExists ? '✓' : '✗'} OG Title
                      </div>
                      <div className={`p-2 rounded ${state.checks.ogDescriptionExists ? 'bg-green-100' : 'bg-red-100'}`}>
                        {state.checks.ogDescriptionExists ? '✓' : '✗'} OG Desc
                      </div>
                      <div className={`p-2 rounded ${state.checks.ogImageExists ? 'bg-green-100' : 'bg-red-100'}`}>
                        {state.checks.ogImageExists ? '✓' : '✗'} OG Image
                      </div>
                      <div className={`p-2 rounded ${state.checks.twitterCardExists ? 'bg-green-100' : 'bg-red-100'}`}>
                        {state.checks.twitterCardExists ? '✓' : '✗'} Twitter
                      </div>
                      <div className={`p-2 rounded ${state.checks.ogImageReachable ? 'bg-green-100' : 'bg-red-100'}`}>
                        {state.checks.ogImageReachable ? '✓' : '✗'} Image OK
                      </div>
                    </div>
                  )}

                  {state.errors.length > 0 && (
                    <div className="mt-2 text-xs text-red-800">
                      <strong>Errors:</strong> {state.errors.join(', ')}
                    </div>
                  )}
                </div>
              ))}
            </div>

            {filteredStates.length === 0 && (
              <div className="text-center py-12">
                <Search className="w-16 h-16 text-gray-300 mx-auto mb-4" />
                <p className="text-gray-500">No states match the current filter</p>
              </div>
            )}
      </div>
    </WpAdminLayout>
  );
}
