import { Link } from 'react-router-dom';
import { Check } from 'lucide-react';
import ScrollReveal from './ScrollReveal';

const INCLUDED = [
  'Featured placement across category, comparison, and alternative pages',
  'Homepage spotlight rotation',
  'Priority ranking ahead of unfeatured listings',
  'Editorial review of your listing before it goes live',
  'Verified badge and editor\'s-pick styling on your tool page',
  'Instant search indexing — no crawl delay',
  'Cancel anytime, no contracts',
];

export default function FmpPricingSection() {
  return (
    <section id="pricing" className="py-20 sm:py-28 scroll-mt-24">
      <div className="max-w-3xl mx-auto px-6 sm:px-8">
        <ScrollReveal className="text-center mb-12">
          <h2 className="text-3xl sm:text-4xl font-bold tracking-tight text-[#0B1221]">Simple, transparent pricing</h2>
          <p className="mt-4 text-lg text-slate-500">One plan. Everything included. Cancel whenever you want.</p>
        </ScrollReveal>

        <ScrollReveal>
          <div className="relative rounded-3xl border-2 border-[#4F47E6] bg-white p-8 sm:p-10 shadow-[0_20px_48px_rgba(79,71,230,0.14)]">
            <span className="absolute -top-3 left-1/2 -translate-x-1/2 bg-[#4F47E6] text-white text-[11px] font-semibold uppercase tracking-wide px-3 py-1 rounded-full">
              Launch pricing
            </span>

            <div className="text-center">
              <h3 className="text-lg font-semibold text-[#0B1221]">Featured Listing</h3>
              <div className="mt-3 flex items-end justify-center gap-2">
                <span className="text-2xl font-medium text-slate-300 line-through">$67</span>
                <span className="text-5xl font-bold text-[#0B1221]">$37</span>
                <span className="text-base font-medium text-slate-400 mb-1">/month</span>
              </div>
              <p className="mt-2 text-sm text-slate-400">Billed monthly. Cancel anytime.</p>
            </div>

            <ul className="mt-8 space-y-3">
              {INCLUDED.map((item) => (
                <li key={item} className="flex items-start gap-3 text-[15px] text-slate-600">
                  <Check className="w-5 h-5 text-[#4F47E6] shrink-0 mt-0.5" aria-hidden="true" />
                  <span>{item}</span>
                </li>
              ))}
            </ul>

            <Link
              to="/feature-my-product/onboarding"
              className="mt-8 flex items-center justify-center w-full px-6 py-3.5 rounded-xl text-[15px] font-semibold text-white bg-[#4F47E6] hover:opacity-90 transition-opacity active:scale-[0.99]"
            >
              Get featured — $37/mo
            </Link>
            <p className="mt-3 text-center text-xs text-slate-400">No setup fees. No long-term contract.</p>
          </div>
        </ScrollReveal>
      </div>
    </section>
  );
}
