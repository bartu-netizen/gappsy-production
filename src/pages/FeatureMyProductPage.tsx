import { Link } from 'react-router-dom';
import { ArrowRight, ShieldCheck } from 'lucide-react';
import SoftwareHeader from '../components/SoftwareHeader';
import FooterWrapper from '../components/FooterWrapper';
import EntitySEOTags from '../components/EntitySEOTags';
import ScrollReveal from '../components/featureMyProduct/ScrollReveal';
import PlacementMockup from '../components/featureMyProduct/PlacementMockups';
import TrustSection from '../components/featureMyProduct/TrustSection';
import WhyFeatureSection from '../components/featureMyProduct/WhyFeatureSection';
import PlacementsSection from '../components/featureMyProduct/PlacementsSection';
import BenefitsSection from '../components/featureMyProduct/BenefitsSection';
import HowItWorksSection from '../components/featureMyProduct/HowItWorksSection';
import FmpPricingSection from '../components/featureMyProduct/FmpPricingSection';
import FmpFaqSection from '../components/featureMyProduct/FmpFaqSection';
import { FMP_FAQS } from '../components/featureMyProduct/fmpFaqData';

const CANONICAL_BASE = 'https://gappsy.com/feature-my-product';

// Same construction style as buildToolJsonLd (src/utils/toolJsonLd.ts) —
// FAQPage built from the same FMP_FAQS array the visible accordion renders,
// plus a Service/Offer graph node describing the paid offering itself for
// SEO/LLM retrieval (schema.org has no dedicated "directory listing" type).
const JSON_LD = [
  {
    '@type': 'FAQPage',
    '@id': `${CANONICAL_BASE}/#faq`,
    mainEntity: FMP_FAQS.map((faq) => ({
      '@type': 'Question',
      name: faq.question,
      acceptedAnswer: { '@type': 'Answer', text: faq.answer },
    })),
  },
  {
    '@type': 'Service',
    '@id': `${CANONICAL_BASE}/#service`,
    name: 'Gappsy Featured Listing',
    serviceType: 'Software directory listing claim and featured placement',
    description: 'Claim and verify your software listing on the Gappsy directory for a one-time fee, then optionally upgrade to Growth for priority placement across category pages, comparison pages, alternative pages, search, and the homepage.',
    provider: { '@type': 'Organization', name: 'Gappsy', url: 'https://gappsy.com' },
    areaServed: 'Worldwide',
    audience: { '@type': 'Audience', audienceType: 'SaaS founders and software marketing teams' },
    offers: [
      {
        '@type': 'Offer',
        name: 'Claim & Verify',
        price: '29',
        priceCurrency: 'USD',
        availability: 'https://schema.org/InStock',
        url: `${CANONICAL_BASE}/`,
      },
      {
        '@type': 'Offer',
        name: 'Growth (Monthly)',
        price: '89',
        priceCurrency: 'USD',
        availability: 'https://schema.org/InStock',
        url: `${CANONICAL_BASE}/`,
        priceSpecification: { '@type': 'UnitPriceSpecification', price: '89', priceCurrency: 'USD', unitText: 'MONTH' },
      },
      {
        '@type': 'Offer',
        name: 'Growth (Yearly)',
        price: '890',
        priceCurrency: 'USD',
        availability: 'https://schema.org/InStock',
        url: `${CANONICAL_BASE}/`,
        priceSpecification: { '@type': 'UnitPriceSpecification', price: '890', priceCurrency: 'USD', unitText: 'YEAR' },
      },
    ],
  },
];

export default function FeatureMyProductPage() {
  return (
    <div className="min-h-screen flex flex-col bg-white">
      <EntitySEOTags
        title="Feature My Product — Claim Your Software Listing | Gappsy"
        description="Claim your software listing on Gappsy's software directory for a one-time $29 fee, then optionally upgrade to Growth for featured placement in front of buyers actively comparing tools. Cancel anytime."
        path="/feature-my-product"
        breadcrumbs={[{ name: 'Feature My Product', path: '/feature-my-product' }]}
        jsonLd={JSON_LD}
      />
      <SoftwareHeader variant="premium" />

      <main className="flex-1 pb-24 md:pb-0">
        {/* Hero */}
        <section className="relative overflow-hidden">
          <div
            className="absolute inset-0 -z-10 bg-gradient-to-b from-[#EEF0FE]/60 via-white to-white"
            aria-hidden="true"
          />
          <div className="max-w-6xl mx-auto px-6 sm:px-8 pt-16 sm:pt-24 pb-16 sm:pb-20 grid lg:grid-cols-2 gap-12 lg:gap-16 items-center">
            <ScrollReveal>
              <span className="inline-flex items-center gap-1.5 text-[13px] font-semibold text-[#4F47E6] bg-[#EEF0FE] rounded-full px-3 py-1.5">
                <ShieldCheck className="w-3.5 h-3.5" aria-hidden="true" />
                Featured Listings
              </span>
              <h1 className="mt-5 text-4xl sm:text-5xl lg:text-[3.25rem] font-bold tracking-tight text-[#0B1221] leading-[1.1]">
                Claim your listing, then feature it where buyers are already comparing products.
              </h1>
              <p className="mt-6 text-lg sm:text-xl text-slate-500 leading-relaxed max-w-xl">
                Start with a one-time $29 claim to verify ownership and unlock self-serve editing. When
                you're ready, upgrade to Growth for priority placement across category pages, comparison
                pages, search, and more — Yearly adds a produced video review, a newsletter feature, and
                an ad-free listing.
              </p>
              <div className="mt-8 flex flex-col sm:flex-row gap-3">
                <Link
                  to="/feature-my-product/onboarding"
                  className="inline-flex items-center justify-center gap-1.5 px-6 py-3.5 rounded-xl text-[15px] font-semibold text-white bg-[#4F47E6] hover:opacity-90 transition-opacity active:scale-[0.99]"
                >
                  Claim your listing — $29
                  <ArrowRight className="w-4 h-4" aria-hidden="true" />
                </Link>
                <a
                  href="#placements"
                  className="inline-flex items-center justify-center px-6 py-3.5 rounded-xl text-[15px] font-semibold text-slate-600 border border-slate-200 hover:bg-slate-50 transition-colors"
                >
                  See placements
                </a>
              </div>
              <p className="mt-4 text-sm text-slate-400">One-time claim fee. Growth is optional, cancel anytime.</p>
            </ScrollReveal>

            <ScrollReveal delayMs={120}>
              <div className="relative max-w-sm mx-auto lg:max-w-none">
                <div
                  className="absolute -inset-8 -z-10 rounded-[40px] bg-[#4F47E6]/10 blur-2xl"
                  aria-hidden="true"
                />
                <div className="drop-shadow-[0_30px_60px_rgba(79,71,230,0.15)]">
                  <PlacementMockup type="toolPage" />
                </div>
                <div className="hidden sm:flex absolute -bottom-5 -left-6 items-center gap-2 rounded-2xl bg-white border border-[#eef0f3] shadow-[0_12px_28px_rgba(15,23,42,0.10)] px-4 py-3">
                  <span className="w-8 h-8 rounded-full bg-emerald-50 flex items-center justify-center text-emerald-600 text-xs font-bold shrink-0">↑</span>
                  <div>
                    <div className="text-[13px] font-semibold text-[#0B1221] leading-none">Priority ranking</div>
                    <div className="text-[11px] text-slate-400 mt-1">in your category</div>
                  </div>
                </div>
              </div>
            </ScrollReveal>
          </div>
        </section>

        <TrustSection />
        <WhyFeatureSection />
        <PlacementsSection />
        <BenefitsSection />
        <HowItWorksSection />
        <FmpPricingSection />
        <FmpFaqSection />

        {/* Final CTA */}
        <section className="py-20 sm:py-28">
          <div className="max-w-4xl mx-auto px-6 sm:px-8">
            <ScrollReveal>
              <div className="relative overflow-hidden rounded-3xl bg-gradient-to-br from-[#0B1221] to-[#1e2440] px-6 sm:px-16 py-14 sm:py-16 text-center">
                <div
                  className="absolute inset-0 -z-0 bg-[#4F47E6]/20"
                  aria-hidden="true"
                />
                <div className="relative">
                  <h2 className="text-3xl sm:text-4xl font-bold tracking-tight text-white">
                    Put your software in front of buyers comparing tools right now.
                  </h2>
                  <p className="mt-4 text-lg text-slate-300 max-w-xl mx-auto">
                    Claim your listing for a one-time $29 fee, then upgrade to Growth whenever you're ready. No contracts.
                  </p>
                  <div className="mt-8">
                    <Link
                      to="/feature-my-product/onboarding"
                      className="inline-flex items-center justify-center gap-1.5 px-7 py-3.5 rounded-xl text-[15px] font-semibold text-[#0B1221] bg-white hover:bg-slate-100 transition-colors active:scale-[0.99]"
                    >
                      Claim your listing — $29
                      <ArrowRight className="w-4 h-4" aria-hidden="true" />
                    </Link>
                  </div>
                </div>
              </div>
            </ScrollReveal>
          </div>
        </section>
      </main>

      {/* Sticky mobile CTA */}
      <div className="md:hidden fixed bottom-0 inset-x-0 z-30 bg-white/95 backdrop-blur-md border-t border-[#f1f3f5] px-4 py-3 pb-[calc(0.75rem+env(safe-area-inset-bottom))]">
        <Link
          to="/feature-my-product/onboarding"
          className="flex items-center justify-center w-full px-5 py-3 rounded-xl text-[15px] font-semibold text-white bg-[#4F47E6] active:scale-[0.99] transition-transform"
        >
          Claim your listing — $29
        </Link>
      </div>

      <FooterWrapper />
    </div>
  );
}
