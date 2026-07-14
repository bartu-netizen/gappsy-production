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

const CANONICAL_BASE = 'https://www.gappsy.com/feature-my-product';

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
    serviceType: 'Software directory featured placement',
    description: 'Editorially reviewed, priority-placed software listing across category pages, comparison pages, alternative pages, search, and the homepage on the Gappsy software directory.',
    provider: { '@type': 'Organization', name: 'Gappsy', url: 'https://www.gappsy.com' },
    areaServed: 'Worldwide',
    audience: { '@type': 'Audience', audienceType: 'SaaS founders and software marketing teams' },
    offers: {
      '@type': 'Offer',
      price: '37',
      priceCurrency: 'USD',
      availability: 'https://schema.org/InStock',
      url: `${CANONICAL_BASE}/`,
      priceSpecification: {
        '@type': 'UnitPriceSpecification',
        price: '37',
        priceCurrency: 'USD',
        unitText: 'MONTH',
      },
    },
  },
];

export default function FeatureMyProductPage() {
  return (
    <div className="min-h-screen flex flex-col bg-white">
      <EntitySEOTags
        title="Feature My Product — Software Directory Listing & Promotion | Gappsy"
        description="Feature your software on Gappsy's software directory. Get in front of buyers actively comparing tools — on category pages, comparison pages, search, and more. $37/mo, cancel anytime."
        path="/feature-my-product"
        breadcrumbs={[{ name: 'Feature My Product', path: '/feature-my-product' }]}
        jsonLd={JSON_LD}
      />
      <SoftwareHeader variant="premium" />

      <main className="flex-1 pb-24 md:pb-0">
        {/* Hero */}
        <section className="relative overflow-hidden">
          <div
            className="absolute inset-0 -z-10 bg-gradient-to-b from-indigo-50/60 via-white to-white"
            aria-hidden="true"
          />
          <div className="max-w-6xl mx-auto px-6 sm:px-8 pt-16 sm:pt-24 pb-16 sm:pb-20 grid lg:grid-cols-2 gap-12 lg:gap-16 items-center">
            <ScrollReveal>
              <span className="inline-flex items-center gap-1.5 text-[13px] font-semibold text-[#4F46E5] bg-indigo-50 rounded-full px-3 py-1.5">
                <ShieldCheck className="w-3.5 h-3.5" aria-hidden="true" />
                Featured Listings
              </span>
              <h1 className="mt-5 text-4xl sm:text-5xl lg:text-[3.25rem] font-bold tracking-tight text-[#0B1221] leading-[1.1]">
                Feature your software where buyers are already comparing products.
              </h1>
              <p className="mt-6 text-lg sm:text-xl text-slate-500 leading-relaxed max-w-xl">
                Gappsy is a software directory built around buyer intent. A featured listing puts your
                product in front of people actively researching and comparing tools like yours — on
                category pages, comparison pages, search, and more.
              </p>
              <div className="mt-8 flex flex-col sm:flex-row gap-3">
                <Link
                  to="/feature-my-product/onboarding"
                  className="inline-flex items-center justify-center gap-1.5 px-6 py-3.5 rounded-xl text-[15px] font-semibold text-white bg-gradient-to-br from-[#4F46E5] to-[#7C3AED] hover:opacity-90 transition-opacity active:scale-[0.99]"
                >
                  Get featured — $37/mo
                  <ArrowRight className="w-4 h-4" aria-hidden="true" />
                </Link>
                <a
                  href="#placements"
                  className="inline-flex items-center justify-center px-6 py-3.5 rounded-xl text-[15px] font-semibold text-slate-600 border border-slate-200 hover:bg-slate-50 transition-colors"
                >
                  See placements
                </a>
              </div>
              <p className="mt-4 text-sm text-slate-400">No contracts. Cancel anytime.</p>
            </ScrollReveal>

            <ScrollReveal delayMs={120}>
              <div className="max-w-sm mx-auto lg:max-w-none">
                <PlacementMockup type="toolPage" />
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
                  className="absolute inset-0 -z-0 bg-gradient-to-br from-[#4F46E5]/20 to-[#7C3AED]/20"
                  aria-hidden="true"
                />
                <div className="relative">
                  <h2 className="text-3xl sm:text-4xl font-bold tracking-tight text-white">
                    Put your software in front of buyers comparing tools right now.
                  </h2>
                  <p className="mt-4 text-lg text-slate-300 max-w-xl mx-auto">
                    Featured listings start at $37/month. No contracts, cancel anytime.
                  </p>
                  <div className="mt-8">
                    <Link
                      to="/feature-my-product/onboarding"
                      className="inline-flex items-center justify-center gap-1.5 px-7 py-3.5 rounded-xl text-[15px] font-semibold text-[#0B1221] bg-white hover:bg-slate-100 transition-colors active:scale-[0.99]"
                    >
                      Get featured — $37/mo
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
          className="flex items-center justify-center w-full px-5 py-3 rounded-xl text-[15px] font-semibold text-white bg-gradient-to-br from-[#4F46E5] to-[#7C3AED] active:scale-[0.99] transition-transform"
        >
          Get featured — $37/mo
        </Link>
      </div>

      <FooterWrapper />
    </div>
  );
}
