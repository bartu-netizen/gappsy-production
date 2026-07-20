import { useState, useEffect } from 'react';
import { Search, Eye, ExternalLink, Image, FileText } from 'lucide-react';
import { supabase } from '../lib/supabase';
import WpAdminLayout from '../components/wpadmin/WpAdminLayout';

const DOMAIN = 'https://gappsy.com';
const CURRENT_YEAR = new Date().getFullYear();

interface StateOption {
  state_slug: string;
  state_name: string;
}

interface SEOData {
  title: string;
  metaDescription: string;
  canonicalUrl: string;
  ogTitle: string;
  ogDescription: string;
  ogImage: string;
  ogImageWidth: string;
  ogImageHeight: string;
  twitterTitle: string;
  twitterDescription: string;
  twitterImage: string;
}

function truncateDescription(text: string, maxLength = 155): string {
  if (!text || text.length <= maxLength) return text;

  const truncated = text.substring(0, maxLength);
  const lastSpace = truncated.lastIndexOf(' ');

  if (lastSpace > maxLength - 20) {
    return truncated.substring(0, lastSpace) + '...';
  }

  return truncated + '...';
}

function generateFallbackDescription(stateName: string, stateIntro?: string): string {
  if (stateIntro && stateIntro.length > 50) {
    return truncateDescription(stateIntro, 155);
  }

  return `Discover the top 25 marketing agencies in ${stateName}. Expert rankings of digital marketing, SEO, branding, and advertising agencies serving ${stateName} businesses.`;
}

function generateSEOData(stateSlug: string, stateName: string, stateData: any): SEOData {
  const jsonSeo = stateData.jsonSeo || {};
  const stateIntro = stateData.state_intro_short || stateData.hero_intro_short;

  const title = jsonSeo.title ||
    `Top 25 Marketing Agencies in ${stateName} (${CURRENT_YEAR}) | Gappsy`;

  const metaDescription = jsonSeo.meta_description ||
    generateFallbackDescription(stateName, stateIntro);

  const canonicalUrl = `${DOMAIN}/marketing-agencies-in-${stateSlug}-united-states/`;

  const ogTitle = jsonSeo.og_title ||
    `Top 25 Marketing Agencies in ${stateName} (${CURRENT_YEAR})`;

  const ogDescription = jsonSeo.og_description || metaDescription;

  const ogImage = jsonSeo.og_image ||
    `${DOMAIN}/og/marketing-agencies-in-${stateSlug}-united-states.svg`;

  const twitterTitle = jsonSeo.twitter_title || ogTitle;
  const twitterDescription = jsonSeo.twitter_description || ogDescription;
  const twitterImage = jsonSeo.twitter_image || ogImage;

  return {
    title,
    metaDescription,
    canonicalUrl,
    ogTitle,
    ogDescription,
    ogImage,
    ogImageWidth: '1200',
    ogImageHeight: '630',
    twitterTitle,
    twitterDescription,
    twitterImage
  };
}

export default function AdminSEODebugPage() {
  const [states, setStates] = useState<StateOption[]>([]);
  const [selectedState, setSelectedState] = useState('');
  const [seoData, setSeoData] = useState<SEOData | null>(null);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState('');
  const [stateDetails, setStateDetails] = useState<any>(null);

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

      setStates(data || []);
    } catch (err) {
      console.error('Error loading states:', err);
    }
  };

  const handlePreview = async () => {
    if (!selectedState) {
      setError('Please select a state');
      return;
    }

    setLoading(true);
    setError('');
    setSeoData(null);
    setStateDetails(null);

    try {
      const { data: statePage, error: pageError } = await supabase
        .from('state_pages')
        .select('state_slug, state_name')
        .eq('state_slug', selectedState)
        .maybeSingle();

      if (pageError) throw pageError;
      if (!statePage) {
        setError('State not found');
        return;
      }

      const { data: stateContent, error: contentError } = await supabase
        .from('state_content')
        .select('hero_intro_short, state_intro_short, state_intro_full, state_description_full')
        .eq('state_slug', selectedState)
        .maybeSingle();

      if (contentError) {
        console.warn('No content found for state:', contentError);
      }

      let jsonSeo = null;
      try {
        const jsonRes = await fetch(`/data/${selectedState}.json`);
        if (jsonRes.ok) {
          const jsonData = await jsonRes.json();
          jsonSeo = jsonData.seo || null;
        }
      } catch {
        // JSON file doesn't exist, use fallback
      }

      const combinedData = {
        ...stateContent,
        jsonSeo
      };

      const seo = generateSEOData(selectedState, statePage.state_name, combinedData);
      setSeoData(seo);
      setStateDetails({
        stateName: statePage.state_name,
        stateSlug: selectedState,
        hasJsonFile: !!jsonSeo,
        hasDbContent: !!stateContent,
        contentSource: jsonSeo ? 'JSON + DB' : stateContent ? 'DB only' : 'Fallback'
      });

    } catch (err) {
      setError(err instanceof Error ? err.message : 'Failed to generate SEO data');
    } finally {
      setLoading(false);
    }
  };

  return (
    <WpAdminLayout title="SEO Debug & Validation" subtitle="Preview computed SEO tags for any state page">
      <div className="space-y-6">
            <div className="bg-blue-50 border border-blue-200 rounded-lg p-4">
              <div className="flex gap-2">
                <FileText className="w-5 h-5 text-blue-600 flex-shrink-0 mt-0.5" />
                <div className="flex-1">
                  <p className="text-sm font-semibold text-blue-900 mb-1">
                    How SEO Tags are Generated
                  </p>
                  <p className="text-sm text-blue-800">
                    1. Check JSON file (/data/[state].json) for seo object
                    <br />
                    2. Pull state intro from database (state_content table)
                    <br />
                    3. Generate smart fallbacks using state name + intro text
                    <br />
                    4. OG images are SVG files at /og/[state-slug].svg
                  </p>
                </div>
              </div>
            </div>

            <div className="space-y-4">
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">
                  Select State
                </label>
                <select
                  value={selectedState}
                  onChange={(e) => setSelectedState(e.target.value)}
                  className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
                >
                  <option value="">Choose a state...</option>
                  {states.map((state) => (
                    <option key={state.state_slug} value={state.state_slug}>
                      {state.state_name}
                    </option>
                  ))}
                </select>
              </div>

              <button
                onClick={handlePreview}
                disabled={loading || !selectedState}
                className="flex items-center gap-2 px-6 py-3 bg-blue-600 hover:bg-blue-700 disabled:bg-gray-400 disabled:cursor-not-allowed text-white rounded-lg transition-colors font-medium"
              >
                <Eye className={`w-4 h-4 ${loading ? 'animate-pulse' : ''}`} />
                {loading ? 'Generating...' : 'Preview SEO Tags'}
              </button>

              {error && (
                <div className="bg-red-50 border border-red-200 rounded-lg p-4">
                  <p className="text-sm text-red-800">{error}</p>
                </div>
              )}
            </div>

            {seoData && stateDetails && (
              <div className="space-y-6 mt-8 border-t pt-6">
                <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
                  <div className="bg-gray-50 rounded-lg p-4">
                    <p className="text-sm font-medium text-gray-700 mb-1">State Name</p>
                    <p className="text-lg font-bold text-gray-900">{stateDetails.stateName}</p>
                  </div>
                  <div className="bg-gray-50 rounded-lg p-4">
                    <p className="text-sm font-medium text-gray-700 mb-1">State Slug</p>
                    <p className="text-lg font-mono font-bold text-gray-900">{stateDetails.stateSlug}</p>
                  </div>
                  <div className="bg-gray-50 rounded-lg p-4">
                    <p className="text-sm font-medium text-gray-700 mb-1">Content Source</p>
                    <p className="text-lg font-bold text-gray-900">{stateDetails.contentSource}</p>
                  </div>
                </div>

                <div className="space-y-4">
                  <h3 className="text-lg font-bold text-gray-900">Basic SEO Tags</h3>

                  <div className="bg-gray-50 rounded-lg p-4 space-y-3">
                    <div>
                      <p className="text-xs font-medium text-gray-500 mb-1">&lt;title&gt;</p>
                      <p className="text-sm text-gray-900 font-mono break-words">{seoData.title}</p>
                      <p className="text-xs text-gray-500 mt-1">{seoData.title.length} characters</p>
                    </div>

                    <div>
                      <p className="text-xs font-medium text-gray-500 mb-1">&lt;meta name="description"&gt;</p>
                      <p className="text-sm text-gray-900 break-words">{seoData.metaDescription}</p>
                      <p className="text-xs text-gray-500 mt-1">{seoData.metaDescription.length} characters {seoData.metaDescription.length > 160 && <span className="text-orange-600 font-medium">(too long)</span>}</p>
                    </div>

                    <div>
                      <p className="text-xs font-medium text-gray-500 mb-1">&lt;link rel="canonical"&gt;</p>
                      <a href={seoData.canonicalUrl} target="_blank" rel="noopener noreferrer" className="text-sm text-blue-600 hover:underline font-mono break-all flex items-center gap-1">
                        {seoData.canonicalUrl}
                        <ExternalLink className="w-3 h-3 flex-shrink-0" />
                      </a>
                    </div>
                  </div>
                </div>

                <div className="space-y-4">
                  <h3 className="text-lg font-bold text-gray-900">Open Graph Tags</h3>

                  <div className="bg-gray-50 rounded-lg p-4 space-y-3">
                    <div>
                      <p className="text-xs font-medium text-gray-500 mb-1">og:title</p>
                      <p className="text-sm text-gray-900 break-words">{seoData.ogTitle}</p>
                    </div>

                    <div>
                      <p className="text-xs font-medium text-gray-500 mb-1">og:description</p>
                      <p className="text-sm text-gray-900 break-words">{seoData.ogDescription}</p>
                    </div>

                    <div>
                      <p className="text-xs font-medium text-gray-500 mb-1">og:url</p>
                      <p className="text-sm text-blue-600 font-mono break-all">{seoData.canonicalUrl}</p>
                    </div>

                    <div>
                      <p className="text-xs font-medium text-gray-500 mb-1">og:image</p>
                      <a href={seoData.ogImage} target="_blank" rel="noopener noreferrer" className="text-sm text-blue-600 hover:underline font-mono break-all flex items-center gap-1">
                        {seoData.ogImage}
                        <ExternalLink className="w-3 h-3 flex-shrink-0" />
                      </a>
                      <div className="flex items-center gap-2 mt-2">
                        <span className="text-xs text-gray-500">Size: {seoData.ogImageWidth}x{seoData.ogImageHeight}</span>
                      </div>
                    </div>
                  </div>
                </div>

                <div className="space-y-4">
                  <h3 className="text-lg font-bold text-gray-900">Twitter Card Tags</h3>

                  <div className="bg-gray-50 rounded-lg p-4 space-y-3">
                    <div>
                      <p className="text-xs font-medium text-gray-500 mb-1">twitter:card</p>
                      <p className="text-sm text-gray-900">summary_large_image</p>
                    </div>

                    <div>
                      <p className="text-xs font-medium text-gray-500 mb-1">twitter:title</p>
                      <p className="text-sm text-gray-900 break-words">{seoData.twitterTitle}</p>
                    </div>

                    <div>
                      <p className="text-xs font-medium text-gray-500 mb-1">twitter:description</p>
                      <p className="text-sm text-gray-900 break-words">{seoData.twitterDescription}</p>
                    </div>

                    <div>
                      <p className="text-xs font-medium text-gray-500 mb-1">twitter:image</p>
                      <p className="text-sm text-blue-600 font-mono break-all">{seoData.twitterImage}</p>
                    </div>
                  </div>
                </div>

                <div className="bg-yellow-50 border border-yellow-200 rounded-lg p-4">
                  <div className="flex gap-2">
                    <Image className="w-5 h-5 text-yellow-600 flex-shrink-0 mt-0.5" />
                    <div className="flex-1">
                      <p className="text-sm font-semibold text-yellow-900 mb-1">
                        How to Verify in Production
                      </p>
                      <p className="text-sm text-yellow-800 space-y-1">
                        1. Visit: <code className="bg-yellow-100 px-1 rounded">{seoData.canonicalUrl}</code>
                        <br />
                        2. Right-click → "View Page Source" (or Ctrl+U / Cmd+U)
                        <br />
                        3. Search for "og:title" or "og:image" in source
                        <br />
                        4. All tags should appear in &lt;head&gt; section, NOT injected by React
                      </p>
                    </div>
                  </div>
                </div>
              </div>
            )}
      </div>
    </WpAdminLayout>
  );
}
