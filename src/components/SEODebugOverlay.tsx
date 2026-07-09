import { useState, useEffect } from 'react';

interface SEODebugOverlayProps {
  enabled: boolean;
}

function SEODebugOverlay({ enabled }: SEODebugOverlayProps) {
  const [seoData, setSeoData] = useState<any>({});
  const [isMinimized, setIsMinimized] = useState(false);

  useEffect(() => {
    if (!enabled) return;

    const updateSeoData = () => {
      const getMetaContent = (selector: string) => {
        const element = document.querySelector(selector) as HTMLMetaElement;
        return element?.content || 'Not set';
      };

      const canonical = (document.querySelector('link[rel="canonical"]') as HTMLLinkElement)?.href || 'Not set';

      setSeoData({
        title: document.title,
        description: getMetaContent('meta[name="description"]'),
        canonical: canonical,
        ogTitle: getMetaContent('meta[property="og:title"]'),
        ogDescription: getMetaContent('meta[property="og:description"]'),
        ogImage: getMetaContent('meta[property="og:image"]'),
        ogUrl: getMetaContent('meta[property="og:url"]'),
        twitterTitle: getMetaContent('meta[name="twitter:title"]'),
        twitterDescription: getMetaContent('meta[name="twitter:description"]'),
        twitterImage: getMetaContent('meta[name="twitter:image"]'),
        robots: getMetaContent('meta[name="robots"]')
      });
    };

    updateSeoData();

    const observer = new MutationObserver(() => {
      updateSeoData();
    });

    observer.observe(document.head, {
      childList: true,
      subtree: true,
      attributes: true,
      attributeFilter: ['content', 'href']
    });

    return () => {
      observer.disconnect();
    };
  }, [enabled]);

  if (!enabled) return null;

  return (
    <div
      className="fixed bottom-4 right-4 z-[9999] bg-black/95 text-white rounded-lg shadow-2xl border border-blue-500/50 overflow-hidden"
      style={{
        maxWidth: isMinimized ? '200px' : '600px',
        maxHeight: isMinimized ? '50px' : '80vh'
      }}
    >
      {/* Header */}
      <div
        className="flex items-center justify-between bg-blue-600 px-4 py-2 cursor-pointer"
        onClick={() => setIsMinimized(!isMinimized)}
      >
        <div className="flex items-center gap-2">
          <div className="w-2 h-2 bg-green-400 rounded-full animate-pulse"></div>
          <span className="font-bold text-sm">SEO Debug Monitor</span>
        </div>
        <button
          className="text-white hover:text-blue-200"
          onClick={(e) => {
            e.stopPropagation();
            setIsMinimized(!isMinimized);
          }}
        >
          {isMinimized ? '▲' : '▼'}
        </button>
      </div>

      {/* Content */}
      {!isMinimized && (
        <div className="p-4 overflow-y-auto" style={{ maxHeight: 'calc(80vh - 50px)' }}>
          <div className="space-y-3 text-xs font-mono">
            {/* Title */}
            <div className="border-b border-gray-700 pb-2">
              <div className="text-blue-400 font-bold mb-1">&lt;title&gt;</div>
              <div className="text-green-300 break-all pl-2">{seoData.title}</div>
            </div>

            {/* Meta Description */}
            <div className="border-b border-gray-700 pb-2">
              <div className="text-blue-400 font-bold mb-1">meta[name="description"]</div>
              <div className="text-green-300 break-all pl-2">{seoData.description}</div>
            </div>

            {/* Canonical */}
            <div className="border-b border-gray-700 pb-2">
              <div className="text-blue-400 font-bold mb-1">link[rel="canonical"]</div>
              <div className="text-green-300 break-all pl-2">{seoData.canonical}</div>
            </div>

            {/* Robots */}
            <div className="border-b border-gray-700 pb-2">
              <div className="text-blue-400 font-bold mb-1">meta[name="robots"]</div>
              <div className="text-green-300 break-all pl-2">{seoData.robots}</div>
            </div>

            {/* Open Graph */}
            <div className="border-b border-gray-700 pb-2">
              <div className="text-yellow-400 font-bold mb-2">OPEN GRAPH</div>
              <div className="space-y-1 pl-2">
                <div>
                  <span className="text-blue-400">og:title:</span>
                  <span className="text-green-300 ml-2">{seoData.ogTitle}</span>
                </div>
                <div>
                  <span className="text-blue-400">og:description:</span>
                  <span className="text-green-300 ml-2 break-all">{seoData.ogDescription}</span>
                </div>
                <div>
                  <span className="text-blue-400">og:url:</span>
                  <span className="text-green-300 ml-2 break-all">{seoData.ogUrl}</span>
                </div>
                <div>
                  <span className="text-blue-400">og:image:</span>
                  <span className="text-green-300 ml-2 break-all">{seoData.ogImage}</span>
                </div>
              </div>
            </div>

            {/* Twitter Card */}
            <div>
              <div className="text-yellow-400 font-bold mb-2">TWITTER CARD</div>
              <div className="space-y-1 pl-2">
                <div>
                  <span className="text-blue-400">twitter:title:</span>
                  <span className="text-green-300 ml-2">{seoData.twitterTitle}</span>
                </div>
                <div>
                  <span className="text-blue-400">twitter:description:</span>
                  <span className="text-green-300 ml-2 break-all">{seoData.twitterDescription}</span>
                </div>
                <div>
                  <span className="text-blue-400">twitter:image:</span>
                  <span className="text-green-300 ml-2 break-all">{seoData.twitterImage}</span>
                </div>
              </div>
            </div>
          </div>

          {/* Instructions */}
          <div className="mt-4 pt-3 border-t border-gray-700 text-xs text-gray-400">
            <div className="font-bold mb-1">Verification:</div>
            <ul className="list-disc list-inside space-y-1 text-[10px]">
              <li>Open DevTools → Elements → &lt;head&gt;</li>
              <li>Search for state name (e.g., "Alabama")</li>
              <li>Verify no mentions of wrong state</li>
              <li>Navigate between states to test updates</li>
            </ul>
            <div className="mt-2 text-[10px]">
              <span className="text-yellow-400">Note:</span> View Source will show generic shell (Bolt SPA).
              Use DevTools Elements for verification.
            </div>
          </div>
        </div>
      )}
    </div>
  );
}

export default SEODebugOverlay;
