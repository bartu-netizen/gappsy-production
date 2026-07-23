import { Link } from 'react-router-dom';
import { ArrowRight, Sparkles, Check, Minus, BarChart3, Bot, ShieldOff } from 'lucide-react';
import SoftwareHeader from '../components/SoftwareHeader';
import FooterWrapper from '../components/FooterWrapper';
import EntitySEOTags from '../components/EntitySEOTags';
import ScrollReveal from '../components/featureMyProduct/ScrollReveal';
import AskGappsyChat from '../components/askGappsy/AskGappsyChat';
import FmpFaqSection from '../components/featureMyProduct/FmpFaqSection';
import type { FmpFaqItem } from '../components/featureMyProduct/fmpFaqData';

const CANONICAL_BASE = 'https://gappsy.com/feature-my-product';

const GROWTH_MONTHLY_FEATURES = [
  { icon: Sparkles, text: 'Featured placement across category, comparison, and search' },
  { icon: BarChart3, text: 'Priority ranking ahead of unfeatured listings' },
  { icon: BarChart3, text: 'Listing analytics — views and click-throughs, in your dashboard' },
  { icon: Bot, text: 'Priority placement in AI/LLM answer engines (ChatGPT, Perplexity, Claude)' },
  { icon: ShieldOff, text: 'Remove or hide reviews from your listing, not just reply to them' },
];

const GROWTH_YEARLY_ONLY_FEATURES = [
  'A produced video review, posted on our socials',
  'A featured spot in the Gappsy newsletter',
  'No competitor ads shown on your own listing',
  'Faster editorial review of listing updates',
  'Priority support',
  'Early access to new placement types',
];

const GROWTH_FAQS: FmpFaqItem[] = [
  {
    question: 'Do I need to list my product first?',
    answer: 'Yes — Growth is an upgrade to an existing Gappsy listing, not a standalone purchase. If your product isn\'t listed and verified yet, that\'s a one-time $29 fee first. Already listed and verified? We\'ll skip straight to Growth.',
  },
  {
    question: 'How much does Growth cost?',
    answer: '$89/month, cancel anytime — or $699/year, which works out to roughly 4 months free compared to paying monthly.',
  },
  {
    question: 'What do I get with Growth?',
    answer: 'Featured placement across category, comparison, and search pages, priority ranking ahead of unfeatured listings, listing analytics, priority placement in AI answer engines like ChatGPT and Perplexity, and the ability to remove reviews (not just reply). The Yearly plan adds a produced video review, a newsletter feature, no competitor ads on your own listing, faster editorial review, priority support, and early access to new placement types.',
  },
  {
    question: 'Can I cancel?',
    answer: 'Yes, anytime. Cancelling stops the recurring charge and removes featured placement, but you keep everything from your base listing — verified badge, self-serve editing, and the ability to reply to reviews.',
  },
  {
    question: 'How does billing work?',
    answer: 'Growth is a real recurring Stripe subscription, manageable from your vendor dashboard billing portal — switch between Monthly and Yearly, or cancel, whenever you like.',
  },
];

const JSON_LD = [
  {
    '@type': 'FAQPage',
    '@id': `${CANONICAL_BASE}/#faq`,
    mainEntity: GROWTH_FAQS.map((faq) => ({
      '@type': 'Question',
      name: faq.question,
      acceptedAnswer: { '@type': 'Answer', text: faq.answer },
    })),
  },
  {
    '@type': 'Service',
    '@id': `${CANONICAL_BASE}/#service`,
    name: 'Gappsy Growth',
    serviceType: 'Featured software placement subscription',
    description: 'Growth is a recurring upgrade for products already listed on Gappsy\'s software directory — featured placement across category, comparison, and search pages, listing analytics, and AI answer engine visibility.',
    provider: { '@type': 'Organization', name: 'Gappsy', url: 'https://gappsy.com' },
    areaServed: 'Worldwide',
    audience: { '@type': 'Audience', audienceType: 'SaaS founders and software marketing teams' },
    offers: [
      {
        '@type': 'Offer',
        name: 'Growth Monthly',
        price: '89',
        priceCurrency: 'USD',
        availability: 'https://schema.org/InStock',
        url: `${CANONICAL_BASE}/`,
      },
      {
        '@type': 'Offer',
        name: 'Growth Yearly',
        price: '699',
        priceCurrency: 'USD',
        availability: 'https://schema.org/InStock',
        url: `${CANONICAL_BASE}/`,
      },
    ],
  },
];

export default function FeatureGrowthPage() {
  return (
    <div className="min-h-screen flex flex-col bg-white">
      <EntitySEOTags
        title="Get Featured on Gappsy | Growth"
        description="Growth puts your Gappsy listing in front of buyers already comparing tools like yours — featured placement, analytics, and AI answer engine visibility. Requires a listed & verified product first."
        path="/feature-my-product"
        breadcrumbs={[{ name: 'Growth', path: '/feature-my-product' }]}
        jsonLd={JSON_LD}
      />
      <SoftwareHeader variant="premium" />

      <main className="flex-1 pb-24 md:pb-0">
        {/* Hero */}
        <section className="relative overflow-hidden">
          <div
            className="absolute inset-0 -z-10 bg-gradient-to-b from-amber-50/60 via-white to-white"
            aria-hidden="true"
          />
          <div className="max-w-6xl mx-auto px-6 sm:px-8 pt-16 sm:pt-24 pb-16 sm:pb-20 grid lg:grid-cols-2 gap-12 lg:gap-16 items-center">
            <ScrollReveal>
              <span className="inline-flex items-center gap-1.5 text-[13px] font-semibold text-amber-700 bg-amber-50 rounded-full px-3 py-1.5">
                <Sparkles className="w-3.5 h-3.5" aria-hidden="true" />
                Growth · Featured Placement
              </span>
              <h1 className="mt-5 text-4xl sm:text-5xl lg:text-[3.25rem] font-bold tracking-tight text-[#0B1221] leading-[1.1]">
                Get seen by buyers already comparing tools like yours.
              </h1>
              <p className="mt-6 text-lg sm:text-xl text-slate-500 leading-relaxed max-w-xl">
                Growth is Gappsy's recurring upgrade for featured placement across category, comparison, and
                search pages — plus listing analytics and priority visibility in AI answer engines like ChatGPT
                and Perplexity.
              </p>
              <div className="mt-5 rounded-2xl border border-amber-200 bg-amber-50/60 px-4 py-3.5 max-w-xl">
                <p className="text-[13.5px] text-amber-900 leading-relaxed">
                  <strong>Growth is an upgrade, not a starting point.</strong> You'll need a listed &amp; verified
                  product first (one-time $29). Already listed and verified? We'll take you straight to Growth.
                </p>
              </div>
              <div className="mt-8 flex flex-col sm:flex-row gap-3">
                <Link
                  to="/list-your-product/onboarding"
                  className="inline-flex items-center justify-center gap-1.5 px-6 py-3.5 rounded-xl text-[15px] font-semibold text-white bg-[#0B1221] hover:opacity-90 transition-opacity active:scale-[0.99]"
                >
                  Get started
                  <ArrowRight className="w-4 h-4" aria-hidden="true" />
                </Link>
                <a
                  href="#pricing"
                  className="inline-flex items-center justify-center px-6 py-3.5 rounded-xl text-[15px] font-semibold text-slate-600 border border-slate-200 hover:bg-slate-50 transition-colors"
                >
                  See pricing
                </a>
              </div>
              <p className="mt-4 text-sm text-slate-400">Not listed yet? The same button gets you started there too.</p>
            </ScrollReveal>

            <ScrollReveal delayMs={120}>
              <div className="relative max-w-sm mx-auto lg:max-w-none">
                <div
                  className="absolute -inset-8 -z-10 rounded-[40px] bg-amber-400/10 blur-2xl"
                  aria-hidden="true"
                />
                <div className="rounded-2xl border border-[#eef0f3] bg-white shadow-[0_30px_60px_rgba(217,119,6,0.12)] overflow-hidden">
                  <AskGappsyChat
                    page="feature_growth"
                    title="Ask Gappsy about Growth"
                    subtitle="Real answers — ask us anything before you decide"
                    placeholder="Ask anything about Growth..."
                    suggestedQuestions={[
                      'Do I need to list my product first?',
                      'What\'s the difference between Monthly and Yearly?',
                      'Can I cancel anytime?',
                    ]}
                    threadMaxHeightClass="max-h-[320px]"
                  />
                </div>
              </div>
            </ScrollReveal>
          </div>
        </section>

        {/* How it works — the two-step prerequisite flow */}
        <section className="py-20 sm:py-28 border-y border-[#f1f3f5] bg-slate-50/40">
          <div className="max-w-4xl mx-auto px-6 sm:px-8">
            <ScrollReveal className="text-center mb-14">
              <h2 className="text-3xl sm:text-4xl font-bold tracking-tight text-[#0B1221]">How it works</h2>
              <p className="mt-4 text-lg text-slate-500">Two steps — the second only applies once the first is done.</p>
            </ScrollReveal>

            <div className="grid sm:grid-cols-2 gap-6">
              <ScrollReveal>
                <div className="h-full rounded-2xl border border-[#eef0f3] bg-white p-6">
                  <span className="inline-flex items-center text-[10px] font-semibold uppercase tracking-wide text-[#4F47E6] bg-[#EEF0FE] rounded-full px-2.5 py-1">
                    Required first
                  </span>
                  <h3 className="mt-3 text-lg font-semibold text-[#0B1221]">1. List &amp; verify your product</h3>
                  <p className="mt-2 text-[15px] leading-relaxed text-slate-500">
                    A one-time $29 fee gets your product listed (or claimed, if it's already there) and verified.
                    Unlocks a verified badge, self-serve editing, and the ability to reply to reviews.
                  </p>
                </div>
              </ScrollReveal>
              <ScrollReveal delayMs={80}>
                <div className="h-full rounded-2xl border border-amber-200 bg-amber-50/40 p-6">
                  <span className="inline-flex items-center text-[10px] font-semibold uppercase tracking-wide text-amber-700 bg-amber-100 rounded-full px-2.5 py-1">
                    Then
                  </span>
                  <h3 className="mt-3 text-lg font-semibold text-[#0B1221]">2. Subscribe to Growth</h3>
                  <p className="mt-2 text-[15px] leading-relaxed text-slate-500">
                    Choose Monthly ($89/mo) or Yearly ($699/yr) for featured placement, analytics, and more.
                    Cancel anytime — your base listing stays either way.
                  </p>
                </div>
              </ScrollReveal>
            </div>

            <p className="mt-8 text-center text-[13.5px] text-slate-400">
              Already listed and verified? The button below detects that automatically and skips straight to step 2.
            </p>
          </div>
        </section>

        {/* What's included */}
        <section id="whats-included" className="py-20 sm:py-28 scroll-mt-24">
          <div className="max-w-4xl mx-auto px-6 sm:px-8">
            <ScrollReveal className="text-center mb-14">
              <h2 className="text-3xl sm:text-4xl font-bold tracking-tight text-[#0B1221]">What Growth gets you</h2>
              <p className="mt-4 text-lg text-slate-500">Included on both Monthly and Yearly plans.</p>
            </ScrollReveal>

            <div className="grid sm:grid-cols-2 gap-5">
              {GROWTH_MONTHLY_FEATURES.map((f, i) => (
                <ScrollReveal key={f.text} delayMs={(i % 3) * 80}>
                  <div className="h-full flex items-start gap-3.5 rounded-2xl border border-[#eef0f3] p-5">
                    <div className="w-9 h-9 shrink-0 rounded-xl bg-amber-50 flex items-center justify-center">
                      <f.icon className="w-4.5 h-4.5 text-amber-600" aria-hidden="true" />
                    </div>
                    <p className="text-[15px] leading-relaxed text-slate-600 pt-1.5">{f.text}</p>
                  </div>
                </ScrollReveal>
              ))}
            </div>
          </div>
        </section>

        {/* Pricing */}
        <section id="pricing" className="py-20 sm:py-28 bg-slate-50/40 border-y border-[#f1f3f5] scroll-mt-24">
          <div className="max-w-3xl mx-auto px-6 sm:px-8">
            <ScrollReveal className="text-center mb-12">
              <h2 className="text-3xl sm:text-4xl font-bold tracking-tight text-[#0B1221]">Growth pricing</h2>
              <p className="mt-4 text-lg text-slate-500">Same features either way — Yearly just costs less over time.</p>
            </ScrollReveal>

            <div className="grid sm:grid-cols-2 gap-5">
              <ScrollReveal>
                <div className="h-full rounded-3xl border border-slate-200 bg-white p-7">
                  <p className="text-sm font-semibold text-slate-500">Monthly</p>
                  <div className="mt-2 flex items-end gap-1.5">
                    <span className="text-4xl font-bold text-[#0B1221]">$89</span>
                    <span className="text-sm text-slate-400 mb-1">/mo</span>
                  </div>
                  <p className="mt-1 text-sm text-slate-400">Cancel anytime</p>
                </div>
              </ScrollReveal>
              <ScrollReveal delayMs={80}>
                <div className="h-full rounded-3xl border-2 border-amber-400 bg-amber-50/40 p-7 relative">
                  <span className="absolute -top-3 right-6 bg-amber-500 text-white text-[10px] font-semibold uppercase tracking-wide px-2.5 py-1 rounded-full">
                    Best value
                  </span>
                  <p className="text-sm font-semibold text-amber-700">Yearly</p>
                  <div className="mt-2 flex items-end gap-1.5">
                    <span className="text-4xl font-bold text-[#0B1221]">$699</span>
                    <span className="text-sm text-slate-400 mb-1">/yr</span>
                  </div>
                  <p className="mt-1 text-sm text-slate-400">≈4 months free vs. Monthly</p>
                </div>
              </ScrollReveal>
            </div>

            <div className="mt-6 rounded-2xl border border-[#eef0f3] bg-white p-6">
              <p className="text-[13px] font-semibold uppercase tracking-wide text-slate-400 mb-3">Yearly also includes</p>
              <ul className="grid sm:grid-cols-2 gap-x-6 gap-y-2">
                {GROWTH_YEARLY_ONLY_FEATURES.map((item) => (
                  <li key={item} className="flex items-start gap-2 text-[14px] text-slate-600">
                    <Check className="w-4 h-4 text-amber-600 shrink-0 mt-0.5" aria-hidden="true" />
                    <span>{item}</span>
                  </li>
                ))}
              </ul>
              <p className="mt-3 flex items-center gap-1.5 text-[12.5px] text-slate-400">
                <Minus className="w-3.5 h-3.5" aria-hidden="true" />
                Not included on Monthly
              </p>
            </div>

            <div className="mt-8 text-center">
              <Link
                to="/list-your-product/onboarding"
                className="inline-flex items-center justify-center gap-1.5 px-7 py-3.5 rounded-xl text-[15px] font-semibold text-white bg-[#0B1221] hover:opacity-90 transition-opacity active:scale-[0.99]"
              >
                Get started
                <ArrowRight className="w-4 h-4" aria-hidden="true" />
              </Link>
              <p className="mt-3 text-[13px] text-slate-400">
                You'll choose Monthly or Yearly right after your listing is confirmed.
              </p>
            </div>
          </div>
        </section>

        <FmpFaqSection faqs={GROWTH_FAQS} />

        {/* Final CTA */}
        <section className="py-20 sm:py-28">
          <div className="max-w-4xl mx-auto px-6 sm:px-8">
            <ScrollReveal>
              <div className="relative overflow-hidden rounded-3xl bg-gradient-to-br from-[#0B1221] to-[#3a2a0e] px-6 sm:px-16 py-14 sm:py-16 text-center">
                <div
                  className="absolute inset-0 -z-0 bg-amber-500/10"
                  aria-hidden="true"
                />
                <div className="relative">
                  <h2 className="text-3xl sm:text-4xl font-bold tracking-tight text-white">
                    Ready to get in front of more buyers?
                  </h2>
                  <p className="mt-4 text-lg text-slate-300 max-w-xl mx-auto">
                    Not listed yet? Start there — it's the same button, and we'll route you to Growth automatically
                    once you're verified.
                  </p>
                  <div className="mt-8">
                    <Link
                      to="/list-your-product/onboarding"
                      className="inline-flex items-center justify-center gap-1.5 px-7 py-3.5 rounded-xl text-[15px] font-semibold text-[#0B1221] bg-white hover:bg-slate-100 transition-colors active:scale-[0.99]"
                    >
                      Get started
                      <ArrowRight className="w-4 h-4" aria-hidden="true" />
                    </Link>
                  </div>
                </div>
              </div>
            </ScrollReveal>
          </div>
        </section>
      </main>

      <FooterWrapper />
    </div>
  );
}
