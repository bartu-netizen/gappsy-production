import { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { ArrowRight, Globe, ShieldCheck, PenLine, MessageSquare, ExternalLink, Users } from 'lucide-react';
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
// zero of the onboarding wizard. Submitting the URL field hands off to
// /list-your-product/proof (the "why list on Gappsy" + real proof step),
// which carries the URL forward into the actual matching step
// (FeatureMyProductOnboardingPage's autostart handling) once the visitor
// continues from there.
export default function FeatureMyProductPage() {
  const navigate = useNavigate();
  const [heroUrl, setHeroUrl] = useState('');

  function handleHeroSubmit() {
    const trimmed = heroUrl.trim();
    if (!trimmed) return;
    navigate(`/list-your-product/proof?url=${encodeURIComponent(trimmed)}`);
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

      <header className="shrink-0 flex items-center justify-center px-5 sm:px-8 h-14 sm:h-16 bg-[#0A1735] shadow-lg">
        {/* Not a link to "/" on purpose — we don't want an easy way out of this funnel. */}
        <img src="/logos/Gappsy-logo-white.webp" alt="Gappsy" className="h-7 sm:h-8 w-auto" />
      </header>

      <main className="flex-1 min-h-0 overflow-y-auto overscroll-contain flex flex-col">
        <div className="flex-1 flex items-center w-full max-w-6xl mx-auto px-6 sm:px-10">
          <div className="grid lg:grid-cols-[1.2fr_1fr] gap-5 sm:gap-10 lg:gap-16 items-center w-full py-2 sm:py-8">
            {/* Left: heading + URL field */}
            <div>
              <h1 className="text-3xl sm:text-4xl lg:text-[2.75rem] font-bold tracking-tight text-[#0B1221] leading-[1.1] lg:whitespace-nowrap">
                List your product on Gappsy.
              </h1>

              <p className="mt-2.5 sm:mt-3 flex items-center gap-1.5 text-[13px] sm:text-sm font-medium text-slate-500">
                <Users className="w-3.5 h-3.5 text-[#4F47E6] shrink-0" aria-hidden="true" />
                Trusted by 10,000+ Gappsy users
              </p>

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
    </div>
  );
}
