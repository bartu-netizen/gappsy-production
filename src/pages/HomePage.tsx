import { useEffect, useState, useRef } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import { Search, MapPin } from 'lucide-react';
import HomeStickyHeader from '../components/HomeStickyHeader';
import FooterWrapper from '../components/FooterWrapper';
import ThreeColumnLayout from '../components/ThreeColumnLayout';
import TrustPill from '../components/ui/TrustPill';
import { RecentFeaturedAgencies } from '../components/RecentFeaturedAgencies';
import { findState, searchStates, USState } from '../lib/usStates';
import { TopAdRail, BottomAdRail } from '../components/home/MobileAdRails';

export default function HomePage() {
  const navigate = useNavigate();
  const [searchQuery, setSearchQuery] = useState('');
  const [suggestions, setSuggestions] = useState<USState[]>([]);
  const [showSuggestions, setShowSuggestions] = useState(false);
  const [error, setError] = useState('');
  const inputRef = useRef<HTMLInputElement>(null);

  useEffect(() => {
    document.title = 'Gappsy - Find the best tools & marketing agencies to grow your business';
    const metaDescription = document.querySelector('meta[name="description"]');
    if (metaDescription) {
      metaDescription.setAttribute('content', 'Discover the best tools and agencies to grow and scale your business.');
    }

    document.body.style.backgroundColor = '#f7f8fa';
    document.documentElement.style.backgroundColor = '#f7f8fa';

    return () => {
      document.body.style.backgroundColor = '#ffffff';
      document.documentElement.style.backgroundColor = '#ffffff';
    };
  }, []);

  const handleSearchChange = (value: string) => {
    setSearchQuery(value);
    setError('');

    if (value.trim()) {
      const results = searchStates(value);
      setSuggestions(results);
      setShowSuggestions(results.length > 0);
    } else {
      setSuggestions([]);
      setShowSuggestions(false);
    }
  };

  const handleStateSelect = (state: USState) => {
    navigate(`/marketing-agencies-in-${state.slug}-united-states/`);
  };

  const handleKeyDown = (e: React.KeyboardEvent<HTMLInputElement>) => {
    if (e.key === 'Enter') {
      const state = findState(searchQuery);
      if (state) {
        handleStateSelect(state);
      } else {
        setError('Please enter a U.S. state (e.g. Texas).');
        setShowSuggestions(false);
      }
    }
  };

  const handleBlur = () => {
    // Delay to allow click on suggestion
    setTimeout(() => {
      setShowSuggestions(false);
    }, 200);
  };

  const centerContent = (
    <>
      <HomeStickyHeader searchAnchorId="find-agency-search" />

      <div className="text-center mb-8">
        <h1 className="homepage-hero-title text-2xl sm:text-[32px] lg:text-[36px] font-bold mx-auto" style={{ lineHeight: '1.1', fontWeight: '700', color: '#0B1221', maxWidth: '900px', marginBottom: '12px' }}>
          Find the best tools & agencies<br />
          to grow your business
        </h1>
        <div className="flex items-center justify-center mb-3 sm:mb-5">
          <TrustPill />
        </div>

        <div id="find-agency-search" className="relative max-w-2xl mx-auto scroll-mt-28">
          <div className="flex items-center w-full h-14 rounded-full bg-white text-gray-900 border border-gray-200 shadow-sm focus-within:ring-2 focus-within:ring-[#0A1735]">
            <Search className="ml-5 h-5 w-5 text-slate-400" strokeWidth={2} aria-hidden="true" />
            <input
              ref={inputRef}
              type="text"
              placeholder="Type a U.S. state (e.g. New Jersey)…"
              value={searchQuery}
              onChange={(e) => handleSearchChange(e.target.value)}
              onKeyDown={handleKeyDown}
              onBlur={handleBlur}
              onFocus={() => searchQuery && setShowSuggestions(suggestions.length > 0)}
              className="flex-1 h-full bg-transparent outline-none px-4 text-gray-900 placeholder-gray-500"
            />
          </div>

          {showSuggestions && suggestions.length > 0 && (
            <div className="absolute top-full mt-2 w-full bg-white rounded-lg shadow-lg border border-gray-200 overflow-hidden z-50">
              {suggestions.map((state) => (
                <button
                  key={state.slug}
                  onClick={() => handleStateSelect(state)}
                  className="w-full px-4 py-3 text-left hover:bg-gray-50 transition-colors flex items-center justify-between"
                >
                  <span className="text-sm font-medium text-gray-900">{state.name}</span>
                  <span className="text-xs text-gray-500">{state.abbr}</span>
                </button>
              ))}
            </div>
          )}

          <div className="text-center mt-2">
            <p className="text-xs text-gray-500">
              We'll take you to the Top 25 marketing agencies in that state.
            </p>
            {error && <p className="text-xs text-red-600 mt-1">{error}</p>}
          </div>
        </div>
      </div>

      <RecentFeaturedAgencies />

      <section className="recent-tools mb-10" style={{ maxWidth: '1300px', margin: '40px auto', padding: '0 20px' }}>
        <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'baseline', marginBottom: '14px' }}>
          <h2 style={{ fontSize: '18px', fontWeight: '600', color: '#0A0F1B', margin: 0 }}>
            Recently Featured Tools
          </h2>
          <a
            href="#"
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
          </a>
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
          <a
            href="https://mediaboost.ai/"
            className="tool-card bg-white rounded-[14px] p-3 border border-[#eef0f3] flex items-center gap-2 hover:shadow-md transition-shadow"
            style={{
              flex: '0 0 210px',
              textDecoration: 'none'
            }}
            target="_blank"
            rel="noopener noreferrer"
          >
            <span className="card-click-arrow">→</span>
            <div className="ad-card-logo flex-shrink-0">
              <img src="https://jczdgzhnsyzvbpfqueyy.supabase.co/storage/v1/object/public/agency-logos/sidebar/favicons--2--1765843177050.webp" alt="Mediaboost" width={32} height={32} loading="lazy" decoding="async" />
            </div>
            <div className="flex-1 min-w-0">
              <div className="text-xs font-bold text-gray-800 leading-tight mb-0.5">Mediaboost</div>
              <div className="text-[11px] text-gray-600 leading-[1.35] line-clamp-2">Guaranteed Feature in Top Global Media</div>
            </div>
          </a>

          <a
            href="https://newsletters.ai/"
            className="tool-card bg-white rounded-[14px] p-3 border border-[#eef0f3] flex items-center gap-2 hover:shadow-md transition-shadow"
            style={{
              flex: '0 0 210px',
              textDecoration: 'none'
            }}
            target="_blank"
            rel="noopener noreferrer"
          >
            <span className="card-click-arrow">→</span>
            <div className="ad-card-logo flex-shrink-0">
              <img src="https://jczdgzhnsyzvbpfqueyy.supabase.co/storage/v1/object/public/agency-logos/sidebar/favicons--3--1765843590667.webp" alt="Newsletters.ai" width={32} height={32} loading="lazy" decoding="async" />
            </div>
            <div className="flex-1 min-w-0">
              <div className="text-xs font-bold text-gray-800 leading-tight mb-0.5">Newsletters.ai</div>
              <div className="text-[11px] text-gray-600 leading-[1.35] line-clamp-2">Weekly AI Catchup for lazy readers</div>
            </div>
          </a>

          <a
            href="https://guidejar.com/"
            className="tool-card bg-white rounded-[14px] p-3 border border-[#eef0f3] flex items-center gap-2 hover:shadow-md transition-shadow"
            style={{
              flex: '0 0 210px',
              textDecoration: 'none'
            }}
            target="_blank"
            rel="noopener noreferrer"
          >
            <span className="card-click-arrow">→</span>
            <div className="ad-card-logo flex-shrink-0">
              <img src="https://jczdgzhnsyzvbpfqueyy.supabase.co/storage/v1/object/public/agency-logos/sidebar/favicons--4--1765843301590.webp" alt="Guidejar" width={32} height={32} loading="lazy" decoding="async" />
            </div>
            <div className="flex-1 min-w-0">
              <div className="text-xs font-bold text-gray-800 leading-tight mb-0.5">Guidejar</div>
              <div className="text-[11px] text-gray-600 leading-[1.35] line-clamp-2">Convert more customers with interactive demos</div>
            </div>
          </a>

          <a
            href="https://chargeback.io/"
            className="tool-card bg-white rounded-[14px] p-3 border border-[#eef0f3] flex items-center gap-2 hover:shadow-md transition-shadow"
            style={{
              flex: '0 0 210px',
              textDecoration: 'none'
            }}
            target="_blank"
            rel="noopener noreferrer"
          >
            <span className="card-click-arrow">→</span>
            <div className="ad-card-logo flex-shrink-0">
              <img src="https://jczdgzhnsyzvbpfqueyy.supabase.co/storage/v1/object/public/agency-logos/sidebar/favicons-1765842395903.png" alt="Chargeback.io" width={32} height={32} loading="lazy" decoding="async" />
            </div>
            <div className="flex-1 min-w-0">
              <div className="text-xs font-bold text-gray-800 leading-tight mb-0.5">Chargeback.io</div>
              <div className="text-[11px] text-gray-600 leading-[1.35] line-clamp-2">Prevent chargebacks on autopilot</div>
            </div>
          </a>

          <a
            href="https://waitforit.app/"
            className="tool-card bg-white rounded-[14px] p-3 border border-[#eef0f3] flex items-center gap-2 hover:shadow-md transition-shadow"
            style={{
              flex: '0 0 210px',
              textDecoration: 'none'
            }}
            target="_blank"
            rel="noopener noreferrer"
          >
            <span className="card-click-arrow">→</span>
            <div className="ad-card-logo flex-shrink-0">
              <img src="https://jczdgzhnsyzvbpfqueyy.supabase.co/storage/v1/object/public/agency-logos/sidebar/favicons-1765842505817.webp" alt="WaitforIt" width={32} height={32} loading="lazy" decoding="async" />
            </div>
            <div className="flex-1 min-w-0">
              <div className="text-xs font-bold text-gray-800 leading-tight mb-0.5">WaitforIt</div>
              <div className="text-[11px] text-gray-600 leading-[1.35] line-clamp-2">Build a waitlist for your idea in 3 minutes</div>
            </div>
          </a>
        </div>
      </section>

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

        <HomeStickyHeader searchAnchorId="find-agency-search-mobile" />

        <div className="text-center mb-6 sm:mb-8 mt-2">
          <h1 className="homepage-hero-title text-2xl sm:text-[32px] font-bold mb-2 mx-auto" style={{ lineHeight: '1.1', fontWeight: '700', color: '#0B1221', maxWidth: '900px' }}>
            Find the best tools & agencies<br />
            to grow your business
          </h1>
          <div className="flex justify-center mb-2 sm:mb-5">
            <TrustPill />
          </div>
          <div id="find-agency-search-mobile" className="relative max-w-[390px] sm:max-w-2xl mx-auto mb-4 sm:mb-8 scroll-mt-24">
            <div className="flex items-center h-8 sm:h-14 px-1.5 sm:px-4 gap-1 sm:gap-3 rounded-full bg-white border border-gray-200 shadow-sm focus-within:ring-2 focus-within:ring-[#0A1735]">
              <div className="flex items-center justify-center flex-shrink-0">
                <Search className="h-3.5 w-3.5 sm:h-5 sm:w-5 text-slate-400 opacity-80" />
              </div>
              <input
                type="text"
                placeholder="Type a U.S. state to see the Top 25 agencies"
                value={searchQuery}
                onChange={(e) => handleSearchChange(e.target.value)}
                onKeyDown={handleKeyDown}
                onBlur={handleBlur}
                onFocus={() => searchQuery && setShowSuggestions(suggestions.length > 0)}
                className="flex-1 bg-transparent text-[10px] sm:text-base font-normal leading-none text-gray-900 placeholder-gray-500 focus:outline-none overflow-hidden whitespace-nowrap"
                style={{ textOverflow: 'clip' }}
              />
            </div>

            {showSuggestions && suggestions.length > 0 && (
              <div className="absolute top-full mt-2 w-full bg-white rounded-lg shadow-lg border border-gray-200 overflow-hidden z-50">
                {suggestions.map((state) => (
                  <button
                    key={state.slug}
                    onClick={() => handleStateSelect(state)}
                    className="w-full px-4 py-3 text-left hover:bg-gray-50 transition-colors flex items-center justify-between"
                  >
                    <span className="text-sm font-medium text-gray-900">{state.name}</span>
                    <span className="text-xs text-gray-500">{state.abbr}</span>
                  </button>
                ))}
              </div>
            )}

            <div className="text-center mt-1 sm:mt-2 hidden sm:block">
              <p className="text-xs sm:text-xs leading-snug text-gray-500">
                We'll take you to the Top 25 marketing agencies in that state.
              </p>
            </div>
            {error && (
              <p className="text-xs sm:text-xs leading-snug text-red-600 mt-1 text-center">{error}</p>
            )}
          </div>
        </div>

        <RecentFeaturedAgencies isMobile={true} />

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
              <a
                href="https://mediaboost.ai/"
                className="bg-white rounded-[14px] p-3.5 border border-[#eef0f3] flex items-center gap-2 hover:shadow-md transition-shadow flex-shrink-0 w-[209px] min-w-[209px] max-w-[209px] md:w-[260px] snap-start relative"
                target="_blank"
                rel="noopener noreferrer"
              >
                <span className="card-click-arrow">→</span>
                <div className="ad-card-logo flex-shrink-0">
                  <img src="https://jczdgzhnsyzvbpfqueyy.supabase.co/storage/v1/object/public/agency-logos/sidebar/favicons--2--1765843177050.webp" alt="Mediaboost" width={32} height={32} loading="lazy" decoding="async" />
                </div>
                <div className="flex-1 min-w-0">
                  <div className="text-xs font-bold text-gray-800 leading-tight mb-0.5">Mediaboost</div>
                  <div className="text-[11px] text-gray-600 leading-[1.35] line-clamp-2">Guaranteed Feature in Top Global Media</div>
                </div>
              </a>

              <a
                href="https://newsletters.ai/"
                className="bg-white rounded-[14px] p-3.5 border border-[#eef0f3] flex items-center gap-2 hover:shadow-md transition-shadow flex-shrink-0 w-[209px] min-w-[209px] max-w-[209px] md:w-[260px] snap-start relative"
                target="_blank"
                rel="noopener noreferrer"
              >
                <span className="card-click-arrow">→</span>
                <div className="ad-card-logo flex-shrink-0">
                  <img src="https://jczdgzhnsyzvbpfqueyy.supabase.co/storage/v1/object/public/agency-logos/sidebar/favicons--3--1765843590667.webp" alt="Newsletters.ai" width={32} height={32} loading="lazy" decoding="async" />
                </div>
                <div className="flex-1 min-w-0">
                  <div className="text-xs font-bold text-gray-800 leading-tight mb-0.5">Newsletters.ai</div>
                  <div className="text-[11px] text-gray-600 leading-[1.35] line-clamp-2">Weekly AI Catchup for lazy readers</div>
                </div>
              </a>

              <a
                href="https://guidejar.com/"
                className="bg-white rounded-[14px] p-3.5 border border-[#eef0f3] flex items-center gap-2 hover:shadow-md transition-shadow flex-shrink-0 w-[209px] min-w-[209px] max-w-[209px] md:w-[260px] snap-start relative"
                target="_blank"
                rel="noopener noreferrer"
              >
                <span className="card-click-arrow">→</span>
                <div className="ad-card-logo flex-shrink-0">
                  <img src="https://jczdgzhnsyzvbpfqueyy.supabase.co/storage/v1/object/public/agency-logos/sidebar/favicons--4--1765843301590.webp" alt="Guidejar" width={32} height={32} loading="lazy" decoding="async" />
                </div>
                <div className="flex-1 min-w-0">
                  <div className="text-xs font-bold text-gray-800 leading-tight mb-0.5">Guidejar</div>
                  <div className="text-[11px] text-gray-600 leading-[1.35] line-clamp-2">Convert more customers with interactive demos</div>
                </div>
              </a>

              <a
                href="https://chargeback.io/"
                className="bg-white rounded-[14px] p-3.5 border border-[#eef0f3] flex items-center gap-2 hover:shadow-md transition-shadow flex-shrink-0 w-[209px] min-w-[209px] max-w-[209px] md:w-[260px] snap-start relative"
                target="_blank"
                rel="noopener noreferrer"
              >
                <span className="card-click-arrow">→</span>
                <div className="ad-card-logo flex-shrink-0">
                  <img src="https://jczdgzhnsyzvbpfqueyy.supabase.co/storage/v1/object/public/agency-logos/sidebar/favicons-1765842395903.png" alt="Chargeback.io" width={32} height={32} loading="lazy" decoding="async" />
                </div>
                <div className="flex-1 min-w-0">
                  <div className="text-xs font-bold text-gray-800 leading-tight mb-0.5">Chargeback.io</div>
                  <div className="text-[11px] text-gray-600 leading-[1.35] line-clamp-2">Prevent chargebacks on autopilot</div>
                </div>
              </a>

              <a
                href="https://waitforit.app/"
                className="bg-white rounded-[14px] p-3.5 border border-[#eef0f3] flex items-center gap-2 hover:shadow-md transition-shadow flex-shrink-0 w-[209px] min-w-[209px] max-w-[209px] md:w-[260px] snap-start relative"
                target="_blank"
                rel="noopener noreferrer"
              >
                <span className="card-click-arrow">→</span>
                <div className="ad-card-logo flex-shrink-0">
                  <img src="https://jczdgzhnsyzvbpfqueyy.supabase.co/storage/v1/object/public/agency-logos/sidebar/favicons-1765842505817.webp" alt="WaitforIt" width={32} height={32} loading="lazy" decoding="async" />
                </div>
                <div className="flex-1 min-w-0">
                  <div className="text-xs font-bold text-gray-800 leading-tight mb-0.5">WaitforIt</div>
                  <div className="text-[11px] text-gray-600 leading-[1.35] line-clamp-2">Build a waitlist for your idea in 3 minutes</div>
                </div>
              </a>
            </div>
          </div>
        </section>

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
