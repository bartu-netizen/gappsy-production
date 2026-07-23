import { Link } from 'react-router-dom';
import { Check } from 'lucide-react';
import ScrollReveal from './ScrollReveal';

const CLAIM_INCLUDED = [
  'Verified badge on your listing',
  'Self-serve editing of your listing',
  'Reply to reviews from your dashboard',
];

export default function FmpPricingSection() {
  return (
    <section id="pricing" className="py-20 sm:py-28 scroll-mt-24">
      <div className="max-w-md mx-auto px-6 sm:px-8">
        <ScrollReveal className="text-center mb-12">
          <h2 className="text-3xl sm:text-4xl font-bold tracking-tight text-[#0B1221]">Simple, one-time pricing</h2>
          <p className="mt-4 text-lg text-slate-500">No subscription. No recurring charge.</p>
        </ScrollReveal>

        <ScrollReveal>
          <div className="relative rounded-3xl border-2 border-[#4F47E6] bg-white p-7 sm:p-8 shadow-[0_20px_48px_rgba(79,71,230,0.14)]">
            <div className="text-center">
              <h3 className="text-lg font-semibold text-[#0B1221]">List Your Product</h3>
              <div className="mt-3 flex items-end justify-center gap-2">
                <span className="text-5xl font-bold text-[#0B1221]">$29</span>
                <span className="text-base font-medium text-slate-400 mb-1">one-time</span>
              </div>
              <p className="mt-2 text-sm text-slate-400">No recurring charge.</p>
            </div>

            <ul className="mt-8 space-y-3">
              {CLAIM_INCLUDED.map((item) => (
                <li key={item} className="flex items-start gap-3 text-[15px] text-slate-600">
                  <Check className="w-5 h-5 text-[#4F47E6] shrink-0 mt-0.5" aria-hidden="true" />
                  <span>{item}</span>
                </li>
              ))}
            </ul>

            <Link
              to="/list-your-product/onboarding"
              className="mt-8 flex items-center justify-center w-full px-6 py-3.5 rounded-xl text-[15px] font-semibold text-white bg-[#4F47E6] hover:opacity-90 transition-opacity active:scale-[0.99]"
            >
              List your product — $29
            </Link>
            <p className="mt-3 text-center text-xs text-slate-400">No setup fees. No contract.</p>
          </div>
        </ScrollReveal>
      </div>
    </section>
  );
}
