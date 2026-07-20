import { useEffect } from 'react';
import { Link } from 'react-router-dom';
import HomeStickyHeader from '../components/HomeStickyHeader';
import FooterWrapper from '../components/FooterWrapper';
import ThreeColumnLayout from '../components/ThreeColumnLayout';
import TrustPill from '../components/ui/TrustPill';
import { RecentFeaturedAgencies } from '../components/RecentFeaturedAgencies';
import SmartSearchBox from '../components/search/SmartSearchBox';
import { TopAdRail, BottomAdRail } from '../components/home/MobileAdRails';

// Real, published Gappsy tools with tools.featured = true — same tools the
// on-page "Featured" ad slots (FeaturedToolPromo.tsx) draw from, so this
// homepage rail and the rest of the site stay in sync as new tools get
// featured. Taglines are hand-written short blurbs (not short_description,
// which runs 150-200 chars — too long for this card's 2-line clamp).
const RECENTLY_FEATURED_TOOLS = [
  { slug: 'canva', name: 'Canva', logo: 'https://www.google.com/s2/favicons?domain=www.canva.com&sz=256', tagline: 'Design anything, no experience needed' },
  { slug: 'figma', name: 'Figma', logo: 'https://www.google.com/s2/favicons?domain=www.figma.com&sz=256', tagline: 'Design and prototype together in real time' },
  { slug: 'photoshop', name: 'Adobe Photoshop', logo: 'https://www.google.com/s2/favicons?domain=www.adobe.com&sz=256', tagline: 'The industry standard for photo editing' },
  { slug: 'notion', name: 'Notion', logo: 'https://www.google.com/s2/favicons?domain=www.notion.com&sz=256', tagline: 'One workspace for notes, docs, and projects' },
  { slug: 'miro', name: 'Miro', logo: 'https://www.google.com/s2/favicons?domain=miro.com&sz=256', tagline: 'Visual whiteboard for team collaboration' },
  { slug: 'webflow', name: 'Webflow', logo: 'https://www.google.com/s2/favicons?domain=webflow.com&sz=256', tagline: 'Design and launch sites without writing code' },
];

export default function HomePage() {
  useEffect(() => {
    document.title = 'Gappsy - Find the Best Software Tools for Your Business';
    const metaDescription = document.querySelector('meta[name="description"]');
    if (metaDescription) {
      metaDescription.setAttribute('content', 'Discover and compare the best software tools for your business, plus top-rated marketing agencies — all in one directory.');
    }

    document.body.style.backgroundColor = '#f7f8fa';
    document.documentElement.style.backgroundColor = '#f7f8fa';

    return () => {
      document.body.style.backgroundColor = '#ffffff';
      document.documentElement.style.backgroundColor = '#ffffff';
    };
  }, []);

  // WebSite + SearchAction structured data — lets Google offer a sitelinks
  // search box straight in results. Points at /tools?q={search_term_string}
  // (a real, working GET search-results page — see ToolsIndexPage.tsx)
  // rather than the homepage's own chat-style smart search, since
  // SearchAction requires a plain URL-template target, not a POST endpoint.
  // Isolated from the title/meta-description effect above on purpose — this
  // only ever touches its own <script data-homepage-jsonld> tag, so it can
  // never clobber or race with existing SEO-critical meta tags.
  useEffect(() => {
    const script = document.createElement('script');
    script.type = 'application/ld+json';
    script.setAttribute('data-homepage-jsonld', 'true');
    script.textContent = JSON.stringify({
      '@context': 'https://schema.org',
      '@type': 'WebSite',
      url: 'https://www.gappsy.com/',
      name: 'Gappsy',
      potentialAction: {
        '@type': 'SearchAction',
        target: {
          '@type': 'EntryPoint',
          urlTemplate: 'https://www.gappsy.com/tools?q={search_term_string}',
        },
        'query-input': 'required name=search_term_string',
      },
    });
    document.head.appendChild(script);

    return () => {
      script.remove();
    };
  }, []);

  const centerContent = (
    <>
      <HomeStickyHeader />

      <div className="text-center mb-8">
        <h1 className="homepage-hero-title text-2xl sm:text-[32px] lg:text-[36px] font-bold mx-auto" style={{ lineHeight: '1.1', fontWeight: '700', color: '#0B1221', maxWidth: '900px', marginBottom: '8px' }}>
          Find the best software tools<br />
          to grow your business
        </h1>
        <p className="text-sm sm:text-base text-slate-500 mb-4" style={{ marginBottom: '16px' }}>
          Plus top-rated marketing agencies, all in one directory.
        </p>

        <SmartSearchBox id="find-agency-search" className="mb-3" />

        <div className="flex items-center justify-center">
          <TrustPill />
        </div>
      </div>

      <section className="recent-tools mb-10" style={{ maxWidth: '1300px', margin: '40px auto', padding: '0 20px' }}>
        <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'baseline', marginBottom: '14px' }}>
          <h2 style={{ fontSize: '18px', fontWeight: '600', color: '#0A0F1B', margin: 0 }}>
            Recently Featured Tools
          </h2>
          <Link
            to="/tools"
            style={{
              fontSize: '12px',
              fontWeight: '500',
              color: '#94A3B8',
              textDecoration: 'none',
              display: 'flex',
              alignItems: 'center',
              gap: '4px'
            }}
            onMouseOver={(e) => e.currentTarget.style.color = '#64748B'}
            onMouseOut={(e) => e.currentTarget.style.color = '#94A3B8'}
          >
            View all →
          </Link>
        </div>

        <div
          className="horizontal-scroll-container"
          style={{
            display: 'flex',
            gap: '20px',
            overflowX: 'auto',
            scrollBehavior: 'smooth',
            paddingBottom: '10px',
            scrollbarWidth: 'thin',
            scrollbarColor: '#E5E7EB #F9FAFB'
          }}
        >
          {RECENTLY_FEATURED_TOOLS.map((tool) => (
            <Link
              key={tool.slug}
              to={`/tools/${tool.slug}`}
              className="tool-card bg-white rounded-[14px] p-3 border border-[#eef0f3] flex items-center gap-2 hover:shadow-md transition-shadow"
              style={{
                flex: '0 0 210px',
                textDecoration: 'none'
              }}
            >
              <span className="card-click-arrow">→</span>
              <div className="ad-card-logo flex-shrink-0">
                <img src={tool.logo} alt={tool.name} width={32} height={32} loading="lazy" decoding="async" />
              </div>
              <div className="flex-1 min-w-0">
                <div className="text-xs font-bold text-gray-800 leading-tight mb-0.5">{tool.name}</div>
                <div className="text-[11px] text-gray-600 leading-[1.35] line-clamp-2">{tool.tagline}</div>
              </div>
            </Link>
          ))}
        </div>
      </section>

      <RecentFeaturedAgencies />

      <section className="recent-tools mb-10" style={{ maxWidth: '1300px', margin: '40px auto', padding: '0 20px' }}>
        <h2 style={{ fontSize: '18px', fontWeight: '600', color: '#0A0F1B', marginBottom: '14px' }}>
          Gappsy Tools
        </h2>

        <div className="tools-grid flex flex-wrap gap-5">
          <Link
            to="/appbuilder"
            className="tool-card bg-white rounded-[14px] p-3 border border-[#eef0f3] flex items-center gap-2 hover:shadow-md transition-shadow"
            style={{ flex: '0 0 210px' }}
          >
            <span className="card-click-arrow">→</span>
            <div className="ad-card-logo flex-shrink-0">
              <img src="/logos/gappsy_-_white_-_logo_-_small.png" alt="Gappsy" width={32} height={32} loading="lazy" decoding="async" />
            </div>
            <div className="flex-1 min-w-0">
              <div className="text-xs font-bold text-gray-800 leading-tight mb-0.5">Gappsy Appbuilder</div>
              <div className="text-[11px] text-gray-600 leading-[1.35] line-clamp-2">Build iOS & Android apps without coding</div>
            </div>
          </Link>

          <Link
            to="/proof"
            className="tool-card bg-white rounded-[14px] p-3 border border-[#eef0f3] flex items-center gap-2 hover:shadow-md transition-shadow"
            style={{ flex: '0 0 210px' }}
          >
            <span className="card-click-arrow">→</span>
            <div className="ad-card-logo flex-shrink-0">
              <img src="/logos/gappsy_-_white_-_logo_-_small.png" alt="Gappsy" width={32} height={32} loading="lazy" decoding="async" />
            </div>
            <div className="flex-1 min-w-0">
              <div className="text-xs font-bold text-gray-800 leading-tight mb-0.5">Gappsy Proof</div>
              <div className="text-[11px] text-gray-600 leading-[1.35] line-clamp-2">Increase conversions with social proof</div>
            </div>
          </Link>

          <Link
            to="/analytics"
            className="tool-card bg-white rounded-[14px] p-3 border border-[#eef0f3] flex items-center gap-2 hover:shadow-md transition-shadow"
            style={{ flex: '0 0 210px' }}
          >
            <span className="card-click-arrow">→</span>
            <div className="ad-card-logo flex-shrink-0">
              <img src="/logos/gappsy_-_white_-_logo_-_small.png" alt="Gappsy" width={32} height={32} loading="lazy" decoding="async" />
            </div>
            <div className="flex-1 min-w-0">
              <div className="text-xs font-bold text-gray-800 leading-tight mb-0.5">Gappsy Analytics</div>
              <div className="text-[11px] text-gray-600 leading-[1.35] line-clamp-2">Track performance & user insights</div>
            </div>
          </Link>
        </div>
      </section>

      <FooterWrapper isHomepage={true} />
    </>
  );

  return (
    <div className="min-h-screen bg-[#f7f8fa]">
      <div className="hidden xl:block">
        <ThreeColumnLayout>
          {centerContent}
        </ThreeColumnLayout>
      </div>

      <div className="xl:hidden px-4 pt-0 pb-[110px]">
        {/* Top Ad Rail - Mobile Only - Sticky at top */}
        <div className="-mx-4 md:hidden sticky top-0 z-[70] bg-[#f7f8fa]">
          <TopAdRail />
        </div>

        <HomeStickyHeader />

        <div className="text-center mb-6 sm:mb-8 mt-2">
          <h1 className="homepage-hero-title text-2xl sm:text-[32px] font-bold mb-1.5 mx-auto" style={{ lineHeight: '1.1', fontWeight: '700', color: '#0B1221', maxWidth: '900px' }}>
            Find the best software tools<br />
            to grow your business
          </h1>
          <p className="text-xs sm:text-sm text-slate-500 mb-3">
            Plus top-rated marketing agencies, all in one directory.
          </p>
          <SmartSearchBox id="find-agency-search-mobile" className="mb-3 sm:mb-8" />

          <div className="flex justify-center">
            <TrustPill />
          </div>
        </div>

        {/* Recently Featured Tools - Mobile */}
        <section className="mb-5">
          <div className="flex items-center justify-between mb-1.5">
            <h2 className="font-bold text-[#0B1221] leading-tight" style={{ fontSize: '14.04px' }}>Recently Featured Tools</h2>
            <span className="text-gray-500 flex items-center gap-1 leading-tight" style={{ fontSize: '10.92px' }}>
              Swipe to explore →
            </span>
          </div>
          <div className="-mx-4 overflow-x-auto overflow-y-hidden snap-x snap-mandatory scroll-smooth scrollbar-hide" style={{ scrollPaddingLeft: 16, scrollPaddingRight: 16 }}>
            <div className="flex gap-4 px-4 pb-2">
              {RECENTLY_FEATURED_TOOLS.map((tool) => (
                <Link
                  key={tool.slug}
                  to={`/tools/${tool.slug}`}
                  className="bg-white rounded-[14px] p-3.5 border border-[#eef0f3] flex items-center gap-2 hover:shadow-md transition-shadow flex-shrink-0 w-[209px] min-w-[209px] max-w-[209px] md:w-[260px] snap-start relative"
                >
                  <span className="card-click-arrow">→</span>
                  <div className="ad-card-logo flex-shrink-0">
                    <img src={tool.logo} alt={tool.name} width={32} height={32} loading="lazy" decoding="async" />
                  </div>
                  <div className="flex-1 min-w-0">
                    <div className="text-xs font-bold text-gray-800 leading-tight mb-0.5">{tool.name}</div>
                    <div className="text-[11px] text-gray-600 leading-[1.35] line-clamp-2">{tool.tagline}</div>
                  </div>
                </Link>
              ))}
            </div>
          </div>
        </section>

        <RecentFeaturedAgencies isMobile={true} />

        {/* Gappsy Tools - Mobile */}
        <section className="mb-5">
          <div className="flex items-center justify-between mb-1.5">
            <h2 className="font-bold text-[#0B1221] leading-tight" style={{ fontSize: '14.04px' }}>Gappsy Tools</h2>
            <span className="text-gray-500 flex items-center gap-1 leading-tight" style={{ fontSize: '10.92px' }}>
              Swipe to explore →
            </span>
          </div>
          <div className="-mx-4 overflow-x-auto overflow-y-hidden snap-x snap-mandatory scroll-smooth scrollbar-hide" style={{ scrollPaddingLeft: 16, scrollPaddingRight: 16 }}>
            <div className="flex gap-4 px-4 pb-2">
              <Link
                to="/appbuilder"
                className="bg-white rounded-[14px] p-3.5 border border-[#eef0f3] flex items-center gap-2 hover:shadow-md transition-shadow flex-shrink-0 w-[209px] min-w-[209px] max-w-[209px] md:w-[260px] snap-start relative"
              >
                <span className="card-click-arrow">→</span>
                <div className="ad-card-logo flex-shrink-0">
                  <img src="/logos/gappsy_-_white_-_logo_-_small.png" alt="Gappsy" width={32} height={32} loading="lazy" decoding="async" />
                </div>
                <div className="flex-1 min-w-0">
                  <div className="text-xs font-bold text-gray-800 leading-tight mb-0.5">Gappsy Appbuilder</div>
                  <div className="text-[11px] text-gray-600 leading-[1.35] line-clamp-2">Build iOS & Android apps without coding</div>
                </div>
              </Link>

              <Link
                to="/proof"
                className="bg-white rounded-[14px] p-3.5 border border-[#eef0f3] flex items-center gap-2 hover:shadow-md transition-shadow flex-shrink-0 w-[209px] min-w-[209px] max-w-[209px] md:w-[260px] snap-start relative"
              >
                <span className="card-click-arrow">→</span>
                <div className="ad-card-logo flex-shrink-0">
                  <img src="/logos/gappsy_-_white_-_logo_-_small.png" alt="Gappsy" width={32} height={32} loading="lazy" decoding="async" />
                </div>
                <div className="flex-1 min-w-0">
                  <div className="text-xs font-bold text-gray-800 leading-tight mb-0.5">Gappsy Proof</div>
                  <div className="text-[11px] text-gray-600 leading-[1.35] line-clamp-2">Increase conversions with social proof</div>
                </div>
              </Link>

              <Link
                to="/analytics"
                className="bg-white rounded-[14px] p-3.5 border border-[#eef0f3] flex items-center gap-2 hover:shadow-md transition-shadow flex-shrink-0 w-[209px] min-w-[209px] max-w-[209px] md:w-[260px] snap-start relative"
              >
                <span className="card-click-arrow">→</span>
                <div className="ad-card-logo flex-shrink-0">
                  <img src="/logos/gappsy_-_white_-_logo_-_small.png" alt="Gappsy" width={32} height={32} loading="lazy" decoding="async" />
                </div>
                <div className="flex-1 min-w-0">
                  <div className="text-xs font-bold text-gray-800 leading-tight mb-0.5">Gappsy Analytics</div>
                  <div className="text-[11px] text-gray-600 leading-[1.35] line-clamp-2">Track performance & user insights</div>
                </div>
              </Link>
            </div>
          </div>
        </section>

        <FooterWrapper isHomepage={true} />

        {/* Bottom Ad Rail - Mobile Only */}
        <div className="md:hidden">
          <BottomAdRail />
        </div>
      </div>
    </div>
  );
}
