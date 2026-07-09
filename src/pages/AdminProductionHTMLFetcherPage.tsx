import { useState } from 'react';
import { Search, CheckCircle, XCircle, AlertTriangle } from 'lucide-react';
import WpAdminLayout from '../components/wpadmin/WpAdminLayout';

interface FetchResult {
  url: string;
  status: number | null;
  headSnippet: string;
  checks: {
    hasStateTitle: boolean;
    hasOgTitle: boolean;
    hasOgImage: boolean;
    hasCanonical: boolean;
  };
  error?: string;
}

const TEST_URLS = [
  '/marketing-agencies-in-new-york-united-states/',
  '/marketing-agencies-in-alabama-united-states/',
  '/marketing-agencies-in-florida-united-states/',
  '/marketing-agencies-in-texas-united-states/',
  '/marketing-agencies-in-california-united-states/'
];

export default function AdminProductionHTMLFetcherPage() {
  const [results, setResults] = useState<FetchResult[]>([]);
  const [loading, setLoading] = useState(false);
  const [customUrl, setCustomUrl] = useState('');

  const fetchProductionHTML = async (urlPath: string): Promise<FetchResult> => {
    const fullUrl = `https://www.gappsy.com${urlPath}`;

    try {
      const response = await fetch(fullUrl, {
        method: 'GET',
        headers: {
          'Accept': 'text/html',
          'User-Agent': 'Mozilla/5.0 (compatible; SEO-Checker/1.0)'
        },
        cache: 'no-store'
      });

      const htmlText = await response.text();

      const headMatch = htmlText.match(/<head[^>]*>([\s\S]*?)<\/head>/i);
      const headContent = headMatch ? headMatch[1] : htmlText.substring(0, 1000);
      const headSnippet = headContent.substring(0, 500);

      const checks = {
        hasStateTitle: /<title[^>]*>Top 25 Marketing Agencies in/i.test(htmlText),
        hasOgTitle: /<meta\s+property=["']og:title["']/i.test(htmlText),
        hasOgImage: /<meta\s+property=["']og:image["']/i.test(htmlText),
        hasCanonical: /<link\s+rel=["']canonical["']/i.test(htmlText)
      };

      return {
        url: fullUrl,
        status: response.status,
        headSnippet,
        checks
      };

    } catch (error) {
      return {
        url: fullUrl,
        status: null,
        headSnippet: '',
        checks: {
          hasStateTitle: false,
          hasOgTitle: false,
          hasOgImage: false,
          hasCanonical: false
        },
        error: error instanceof Error ? error.message : 'Unknown error'
      };
    }
  };

  const runTests = async (urls: string[]) => {
    setLoading(true);
    setResults([]);

    const testResults: FetchResult[] = [];

    for (const url of urls) {
      const result = await fetchProductionHTML(url);
      testResults.push(result);
      setResults([...testResults]);
    }

    setLoading(false);
  };

  const handleTestDefault = () => {
    runTests(TEST_URLS);
  };

  const handleTestCustom = () => {
    if (!customUrl) return;
    const path = customUrl.startsWith('/') ? customUrl : `/${customUrl}`;
    runTests([path]);
  };

  const allPassed = results.length > 0 && results.every(r =>
    r.checks.hasStateTitle &&
    r.checks.hasOgTitle &&
    r.checks.hasOgImage &&
    r.checks.hasCanonical
  );

  return (
    <WpAdminLayout title="Production HTML Fetcher" subtitle="Fetch and inspect server-rendered HTML for SEO validation">
      <div className="space-y-6">
            <div className="bg-red-50 border border-red-200 rounded-lg p-4">
              <div className="flex gap-2">
                <AlertTriangle className="w-5 h-5 text-red-600 flex-shrink-0 mt-0.5" />
                <div className="flex-1">
                  <p className="text-sm font-semibold text-red-900 mb-1">
                    Production Issue Diagnosis
                  </p>
                  <p className="text-sm text-red-800">
                    This tool fetches the ACTUAL server response HTML (not browser DOM after JavaScript).
                    If SEO tags are missing, it proves the hosting platform is serving the generic SPA index.html
                    instead of pre-rendered state pages.
                  </p>
                </div>
              </div>
            </div>

            <div className="space-y-4">
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">
                  Test Default URLs (5 states)
                </label>
                <button
                  onClick={handleTestDefault}
                  disabled={loading}
                  className="flex items-center gap-2 px-6 py-3 bg-purple-600 hover:bg-purple-700 disabled:bg-gray-400 disabled:cursor-not-allowed text-white rounded-lg transition-colors font-medium"
                >
                  <Search className={`w-4 h-4 ${loading ? 'animate-pulse' : ''}`} />
                  {loading ? 'Fetching Production HTML...' : 'Test Default URLs'}
                </button>
              </div>

              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">
                  Test Custom URL
                </label>
                <div className="flex gap-2">
                  <input
                    type="text"
                    value={customUrl}
                    onChange={(e) => setCustomUrl(e.target.value)}
                    placeholder="/marketing-agencies-in-texas-united-states/"
                    className="flex-1 px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-purple-500 focus:border-purple-500"
                  />
                  <button
                    onClick={handleTestCustom}
                    disabled={loading || !customUrl}
                    className="px-6 py-2 bg-indigo-600 hover:bg-indigo-700 disabled:bg-gray-400 disabled:cursor-not-allowed text-white rounded-lg transition-colors font-medium"
                  >
                    Test
                  </button>
                </div>
              </div>
            </div>

            {results.length > 0 && (
              <div className="space-y-6 mt-8 border-t pt-6">
                <div className={`rounded-lg p-4 ${allPassed ? 'bg-green-50 border border-green-200' : 'bg-red-50 border border-red-200'}`}>
                  <div className="flex items-center gap-2">
                    {allPassed ? (
                      <>
                        <CheckCircle className="w-5 h-5 text-green-600" />
                        <p className="font-semibold text-green-900">
                          ✅ ALL TESTS PASSED - Production is serving pre-rendered HTML correctly
                        </p>
                      </>
                    ) : (
                      <>
                        <XCircle className="w-5 h-5 text-red-600" />
                        <p className="font-semibold text-red-900">
                          ❌ TESTS FAILED - Production is serving generic SPA index.html
                        </p>
                      </>
                    )}
                  </div>
                </div>

                {results.map((result, idx) => (
                  <div key={idx} className="bg-gray-50 rounded-lg p-6 space-y-4">
                    <div className="flex items-start justify-between">
                      <div>
                        <p className="text-sm font-medium text-gray-500">URL</p>
                        <p className="text-sm text-blue-600 font-mono break-all">{result.url}</p>
                      </div>
                      <div className="text-right">
                        <p className="text-sm font-medium text-gray-500">HTTP Status</p>
                        <p className={`text-lg font-bold ${result.status === 200 ? 'text-green-600' : 'text-red-600'}`}>
                          {result.status || 'ERROR'}
                        </p>
                      </div>
                    </div>

                    {result.error && (
                      <div className="bg-red-100 border border-red-300 rounded p-3">
                        <p className="text-sm text-red-800 font-medium">Error: {result.error}</p>
                      </div>
                    )}

                    <div>
                      <p className="text-sm font-medium text-gray-700 mb-2">Server Response Checks</p>
                      <div className="grid grid-cols-2 md:grid-cols-4 gap-3">
                        <div className={`p-3 rounded ${result.checks.hasStateTitle ? 'bg-green-100 border border-green-300' : 'bg-red-100 border border-red-300'}`}>
                          <div className="flex items-center gap-2">
                            {result.checks.hasStateTitle ? (
                              <CheckCircle className="w-4 h-4 text-green-600" />
                            ) : (
                              <XCircle className="w-4 h-4 text-red-600" />
                            )}
                            <span className="text-xs font-medium">State Title</span>
                          </div>
                        </div>

                        <div className={`p-3 rounded ${result.checks.hasOgTitle ? 'bg-green-100 border border-green-300' : 'bg-red-100 border border-red-300'}`}>
                          <div className="flex items-center gap-2">
                            {result.checks.hasOgTitle ? (
                              <CheckCircle className="w-4 h-4 text-green-600" />
                            ) : (
                              <XCircle className="w-4 h-4 text-red-600" />
                            )}
                            <span className="text-xs font-medium">og:title</span>
                          </div>
                        </div>

                        <div className={`p-3 rounded ${result.checks.hasOgImage ? 'bg-green-100 border border-green-300' : 'bg-red-100 border border-red-300'}`}>
                          <div className="flex items-center gap-2">
                            {result.checks.hasOgImage ? (
                              <CheckCircle className="w-4 h-4 text-green-600" />
                            ) : (
                              <XCircle className="w-4 h-4 text-red-600" />
                            )}
                            <span className="text-xs font-medium">og:image</span>
                          </div>
                        </div>

                        <div className={`p-3 rounded ${result.checks.hasCanonical ? 'bg-green-100 border border-green-300' : 'bg-red-100 border border-red-300'}`}>
                          <div className="flex items-center gap-2">
                            {result.checks.hasCanonical ? (
                              <CheckCircle className="w-4 h-4 text-green-600" />
                            ) : (
                              <XCircle className="w-4 h-4 text-red-600" />
                            )}
                            <span className="text-xs font-medium">canonical</span>
                          </div>
                        </div>
                      </div>
                    </div>

                    <div>
                      <p className="text-sm font-medium text-gray-700 mb-2">
                        First 500 chars of &lt;head&gt;
                      </p>
                      <div className="bg-gray-900 text-green-400 p-4 rounded font-mono text-xs overflow-x-auto">
                        <pre className="whitespace-pre-wrap break-words">{result.headSnippet || 'No <head> content found'}</pre>
                      </div>
                    </div>

                    {!result.checks.hasStateTitle && !result.checks.hasOgTitle && (
                      <div className="bg-yellow-50 border border-yellow-300 rounded p-3">
                        <p className="text-sm text-yellow-900 font-medium">
                          ⚠️ Diagnosis: This is likely the generic SPA index.html with no state-specific SEO tags.
                          The pre-rendered HTML files are not being served.
                        </p>
                      </div>
                    )}
                  </div>
                ))}
              </div>
            )}

            {!loading && results.length === 0 && (
              <div className="text-center py-12">
                <Search className="w-16 h-16 text-gray-300 mx-auto mb-4" />
                <p className="text-gray-500">Click a test button to fetch production HTML</p>
              </div>
            )}
      </div>
    </WpAdminLayout>
  );
}
