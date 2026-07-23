import { Link } from 'react-router-dom';
import { ArrowRight, ShieldCheck } from 'lucide-react';
import SoftwareHeader from '../components/SoftwareHeader';
import FooterWrapper from '../components/FooterWrapper';
import EntitySEOTags from '../components/EntitySEOTags';
import ScrollReveal from '../components/featureMyProduct/ScrollReveal';
import AskGappsyChat from '../components/askGappsy/AskGappsyChat';
import TrustSection from '../components/featureMyProduct/TrustSection';
import WhyFeatureSection from '../components/featureMyProduct/WhyFeatureSection';
import BenefitsSection from '../components/featureMyProduct/BenefitsSection';
import HowItWorksSection from '../components/featureMyProduct/HowItWorksSection';
import FmpPricingSection from '../components/featureMyProduct/FmpPricingSection';
import FmpFaqSection from '../components/featureMyProduct/FmpFaqSection';
import { FMP_FAQS } from '../components/featureMyProduct/fmpFaqData';

const CANONICAL_BASE = 'https://gappsy.com/list-your-product';

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

export default function FeatureMyProductPage() {
  return (
    <div className="min-h-screen flex flex-col bg-white">
      <EntitySEOTags
        title="List Your Product on Gappsy | Gappsy"
        description="List your product on Gappsy's software directory — one-time $29 fee. Get a verified badge, self-serve editing, and the ability to reply to reviews. Already listed? We'll help you claim it."
        path="/list-your-product"
        breadcrumbs={[{ name: 'List Your Product', path: '/list-your-product' }]}
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
                Get Listed
              </span>
              <h1 className="mt-5 text-4xl sm:text-5xl lg:text-[3.25rem] font-bold tracking-tight text-[#0B1221] leading-[1.1]">
                List your product on Gappsy.
              </h1>
              <p className="mt-6 text-lg sm:text-xl text-slate-500 leading-relaxed max-w-xl">
                A verified badge, self-serve editing, the ability to reply to reviews, and a link back
                to your site from gappsy.com — all for a one-time $29 fee. No subscription.
              </p>
              <p className="mt-3 text-[15px] text-slate-400 max-w-xl">
                Already listed? No problem — enter your website below and we'll find your existing
                listing so you can claim it instead of creating a new one.
              </p>
              <div className="mt-8 flex flex-col sm:flex-row gap-3">
                <Link
                  to="/list-your-product/onboarding"
                  className="inline-flex items-center justify-center gap-1.5 px-6 py-3.5 rounded-xl text-[15px] font-semibold text-white bg-[#4F47E6] hover:opacity-90 transition-opacity active:scale-[0.99]"
                >
                  List your product — $29
                  <ArrowRight className="w-4 h-4" aria-hidden="true" />
                </Link>
                <a
                  href="#how-it-works"
                  className="inline-flex items-center justify-center px-6 py-3.5 rounded-xl text-[15px] font-semibold text-slate-600 border border-slate-200 hover:bg-slate-50 transition-colors"
                >
                  See how it works
                </a>
              </div>
              <p className="mt-4 text-sm text-slate-400">Billed once via Stripe. Takes about 2 minutes.</p>
            </ScrollReveal>

            <ScrollReveal delayMs={120}>
              <div className="relative max-w-sm mx-auto lg:max-w-none">
                <div
                  className="absolute -inset-8 -z-10 rounded-[40px] bg-[#4F47E6]/10 blur-2xl"
                  aria-hidden="true"
                />
                <div className="rounded-2xl border border-[#eef0f3] bg-white shadow-[0_30px_60px_rgba(79,71,230,0.15)] overflow-hidden">
                  <AskGappsyChat
                    page="feature_my_product"
                    title="Ask Gappsy about listing your product"
                    subtitle="Real answers — ask us anything before you list"
                    placeholder="Ask anything about listing your product..."
                    suggestedQuestions={[
                      'Is my product already listed?',
                      'What do I get for $29?',
                      'How does ownership verification work?',
                    ]}
                    threadMaxHeightClass="max-h-[320px]"
                  />
                </div>
              </div>
            </ScrollReveal>
          </div>
        </section>

        <TrustSection />
        <WhyFeatureSection />
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
                    Make sure your listing says what you want it to say.
                  </h2>
                  <p className="mt-4 text-lg text-slate-300 max-w-xl mx-auto">
                    List it for a one-time $29 fee, no recurring charge — already listed? We'll help you claim it instead.
                  </p>
                  <div className="mt-8">
                    <Link
                      to="/list-your-product/onboarding"
                      className="inline-flex items-center justify-center gap-1.5 px-7 py-3.5 rounded-xl text-[15px] font-semibold text-[#0B1221] bg-white hover:bg-slate-100 transition-colors active:scale-[0.99]"
                    >
                      List your product — $29
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
          to="/list-your-product/onboarding"
          className="flex items-center justify-center w-full px-5 py-3 rounded-xl text-[15px] font-semibold text-white bg-[#4F47E6] active:scale-[0.99] transition-transform"
        >
          List your product — $29
        </Link>
      </div>

      <FooterWrapper />
    </div>
  );
}
