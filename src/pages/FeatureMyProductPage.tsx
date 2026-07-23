import { useState } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import { ArrowRight, Globe, ShieldCheck, PenLine, MessageSquare, ExternalLink, Users, X } from 'lucide-react';
import EntitySEOTags from '../components/EntitySEOTags';

const BENEFITS = [
  { icon: ShieldCheck, title: 'Verified badge', body: 'Buyers can tell this is the real product owner, not a guess.' },
  { icon: PenLine, title: 'Self-serve editing', body: 'Fix outdated info yourself — no waiting on us.' },
  { icon: MessageSquare, title: 'Reply to reviews', body: 'Answer directly from your own dashboard.' },
  { icon: ExternalLink, title: 'Link to your site', body: 'Send interested buyers straight to your website.' },
];

const CANONICAL_BASE = 'https://gappsy.com/list-your-product';

// No FAQPage node here — the FAQ content used to back it (fmpFaqData.ts)
// isn't visibly rendered on this page (see the app-like, single-screen
// redesign below, matching the onboarding wizard's own shell), and
// structured data should only describe content actually on the page. The
// Service/Offer node describes the product itself, not page content, so
// it stays.
const JSON_LD = [
  {
    '@type': 'Service',
    '@id': `${CANONICAL_BASE}/#service`,
    name: 'Gappsy Product Listing',
    serviceType: 'Software directory listing and ownership verification',
    description: 'List your product on Gappsy\'s software directory for a one-time fee — get a verified badge, self-serve editing, and the ability to reply to reviews. Already listed? We\'ll help you claim it instead.',
    provider: { '@type': 'Organization', name: 'Gappsy', url: 'https://gappsy.com' },
    areaServed: 'Worldwide',
    audience: { '@type': 'Audience', audienceType: 'SaaS founders and software marketing teams' },
    offers: {
      '@type': 'Offer',
      name: 'List Your Product',
      price: '29',
      priceCurrency: 'USD',
      availability: 'https://schema.org/InStock',
      url: `${CANONICAL_BASE}/`,
    },
  },
];

// Deliberately styled as the same shell as OnboardingShell.tsx (navy
// header, centered single column, sticky bottom CTA) rather than a
// separate long-form marketing layout — this page effectively IS step
// zero of the onboarding wizard. Submitting the URL field behaves exactly
// like the wizard's own url step: it navigates straight into
// /list-your-product/onboarding with the URL pre-filled and auto-matched
// (see FeatureMyProductOnboardingPage's autostart handling), one screen
// earlier than clicking into the wizard first.
export default function FeatureMyProductPage() {
  const navigate = useNavigate();
  const [heroUrl, setHeroUrl] = useState('');
  const [showStory, setShowStory] = useState(false);

  function handleHeroSubmit() {
    const trimmed = heroUrl.trim();
    if (!trimmed) return;
    navigate(`/list-your-product/onboarding?url=${encodeURIComponent(trimmed)}&autostart=1`);
  }

  return (
    <div className="h-[100dvh] w-full flex flex-col overflow-hidden bg-white">
      <EntitySEOTags
        title="List Your Product on Gappsy | Gappsy"
        description="List your product on Gappsy's software directory — one-time $29 fee. Get a verified badge, self-serve editing, and the ability to reply to reviews. Already listed? We'll help you claim it."
        path="/list-your-product"
        breadcrumbs={[{ name: 'List Your Product', path: '/list-your-product' }]}
        jsonLd={JSON_LD}
      />

      <header className="shrink-0 flex items-center justify-center px-5 sm:px-8 h-16 sm:h-24 bg-[#0A1735] shadow-lg">
        <Link to="/" aria-label="Gappsy home" className="shrink-0 flex items-center">
          <img src="/logos/Gappsy-logo-white.webp" alt="Gappsy" className="h-9 sm:h-14 lg:h-16 w-auto" />
        </Link>
      </header>

      <main className="flex-1 min-h-0 overflow-y-auto overscroll-contain flex flex-col">
        <div className="flex-1 flex items-center w-full max-w-6xl mx-auto px-6 sm:px-10">
          <div className="grid lg:grid-cols-[1.2fr_1fr] gap-5 sm:gap-10 lg:gap-16 items-center w-full py-2 sm:py-8">
            {/* Left: heading + URL field */}
            <div>
              <h1 className="text-3xl sm:text-4xl lg:text-[2.75rem] font-bold tracking-tight text-[#0B1221] leading-[1.1] lg:whitespace-nowrap">
                List your product on Gappsy.
              </h1>

              <label htmlFor="fmp-url" className="sr-only">Your product's website</label>
              <div className="mt-5 sm:mt-8 relative">
                <Globe className="absolute left-5 top-1/2 -translate-y-1/2 w-5 h-5 text-slate-400" aria-hidden="true" />
                <input
                  id="fmp-url"
                  type="text"
                  inputMode="url"
                  autoFocus
                  autoCapitalize="off"
                  autoCorrect="off"
                  placeholder="yourwebsite.com"
                  value={heroUrl}
                  onChange={(e) => setHeroUrl(e.target.value)}
                  onKeyDown={(e) => { if (e.key === 'Enter') handleHeroSubmit(); }}
                  className="w-full h-14 sm:h-16 rounded-2xl border border-slate-200 pl-14 pr-4 text-base sm:text-lg text-[#0B1221] placeholder:text-slate-400 focus:outline-none focus:ring-2 focus:ring-[#4F47E6]/20 focus:border-slate-300"
                />
              </div>

              <button
                type="button"
                onClick={() => setShowStory(true)}
                className="mt-3 sm:mt-4 inline-flex items-center gap-1.5 text-[13px] sm:text-sm font-medium text-slate-500 hover:text-slate-700 transition-colors"
              >
                <Users className="w-3.5 h-3.5 text-[#4F47E6]" aria-hidden="true" />
                Get seen by 10,000+ business owners who use Gappsy
                <span className="underline underline-offset-2">See proof</span>
              </button>
            </div>

            {/* Right: benefits */}
            <div className="space-y-3.5 sm:space-y-6 lg:space-y-7">
              {BENEFITS.map((b) => (
                <div key={b.title} className="flex items-start gap-3 sm:gap-4">
                  <div className="w-10 h-10 sm:w-12 sm:h-12 shrink-0 rounded-2xl bg-[#EEF0FE] flex items-center justify-center">
                    <b.icon className="w-5 h-5 sm:w-6 sm:h-6 text-[#4F47E6]" aria-hidden="true" />
                  </div>
                  <div>
                    <p className="text-base sm:text-lg font-semibold text-[#0B1221]">{b.title}</p>
                    <p className="mt-0.5 text-[13.5px] sm:text-[15px] text-slate-500 leading-snug sm:leading-relaxed">{b.body}</p>
                  </div>
                </div>
              ))}
            </div>
          </div>
        </div>

        <div className="sticky bottom-0 bg-white/95 backdrop-blur-sm border-t border-[#f1f3f5] px-5 sm:px-10 py-4 pb-[calc(1rem+env(safe-area-inset-bottom))] flex justify-center">
          <button
            type="button"
            onClick={handleHeroSubmit}
            disabled={!heroUrl.trim()}
            className="w-full sm:w-auto sm:min-w-[320px] flex items-center justify-center gap-1.5 px-8 py-4 rounded-xl text-base font-semibold text-white bg-[#4F47E6] hover:opacity-90 disabled:opacity-40 disabled:cursor-not-allowed transition-opacity active:scale-[0.99]"
          >
            Get started
            <ArrowRight className="w-4 h-4" aria-hidden="true" />
          </button>
        </div>
      </main>

      {showStory && (
        <div className="fixed inset-0 z-[60] flex items-center justify-center p-4">
          <div className="absolute inset-0 bg-[#0A1735]/60 backdrop-blur-sm" onClick={() => setShowStory(false)} aria-hidden="true" />
          <div className="relative w-full max-w-md bg-white rounded-3xl p-7 shadow-[0_24px_48px_rgba(0,0,0,0.25)]">
            <button
              type="button"
              onClick={() => setShowStory(false)}
              aria-label="Close"
              className="absolute top-4 right-4 w-8 h-8 rounded-full flex items-center justify-center text-slate-400 hover:text-slate-600 hover:bg-slate-100 transition-colors"
            >
              <X className="w-4 h-4" aria-hidden="true" />
            </button>
            <div className="w-11 h-11 rounded-2xl bg-[#EEF0FE] flex items-center justify-center mb-4">
              <Users className="w-5 h-5 text-[#4F47E6]" aria-hidden="true" />
            </div>
            <h2 className="text-lg font-bold text-[#0B1221] tracking-tight">10,000+ paid users, since 2019</h2>
            <p className="mt-2.5 text-[14.5px] text-slate-600 leading-relaxed">
              Gappsy started in 2019 as a mobile app-builder for businesses. To this day, over
              10,000 paid users — not free trials — actively use our software tools. We noticed
              they were interested in trying other software too, so we built this directory to let
              them discover products like yours.
            </p>
            <button
              type="button"
              onClick={() => setShowStory(false)}
              className="mt-6 w-full flex items-center justify-center px-5 py-3 rounded-xl text-[15px] font-semibold text-white bg-[#4F47E6] hover:opacity-90 transition-opacity active:scale-[0.99]"
            >
              Got it
            </button>
          </div>
        </div>
      )}
    </div>
  );
}
