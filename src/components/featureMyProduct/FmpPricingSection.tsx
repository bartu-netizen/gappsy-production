import { useState } from 'react';
import { Link } from 'react-router-dom';
import { Check, Sparkles } from 'lucide-react';
import ScrollReveal from './ScrollReveal';

const CLAIM_INCLUDED = [
  'Verified badge on your listing',
  'Self-serve editing of your listing',
  'Reply to reviews from your dashboard',
];

// Shared across both Growth cadences. The yearly-only perks are rendered
// separately below so the "Yearly gets 3 more things" contrast is visible
// at a glance, not buried in one long shared list.
const GROWTH_SHARED = [
  'Featured placement across category, comparison, and search',
  'Priority ranking ahead of unfeatured listings',
  'Editorial review of your listing before it goes live',
];
const GROWTH_YEARLY_ONLY = [
  'A produced video review, posted on our socials',
  'A featured spot in the Gappsy newsletter',
  'No competitor ads shown on your own listing',
];

export default function FmpPricingSection() {
  const [interval, setInterval] = useState<'month' | 'year'>('year');

  return (
    <section id="pricing" className="py-20 sm:py-28 scroll-mt-24">
      <div className="max-w-4xl mx-auto px-6 sm:px-8">
        <ScrollReveal className="text-center mb-12">
          <h2 className="text-3xl sm:text-4xl font-bold tracking-tight text-[#0B1221]">Claim it, then grow it</h2>
          <p className="mt-4 text-lg text-slate-500">A low one-time fee to claim your listing — Growth is optional, whenever you're ready.</p>
        </ScrollReveal>

        <div className="grid sm:grid-cols-2 gap-6 items-start">
          {/* Step 1 — Claim & Verify */}
          <ScrollReveal>
            <div className="relative rounded-3xl border border-[#eef0f3] bg-white p-7 sm:p-8">
              <span className="inline-flex items-center text-[11px] font-semibold uppercase tracking-wide text-slate-400 mb-3">Step 1</span>
              <h3 className="text-lg font-semibold text-[#0B1221]">Claim &amp; Verify</h3>
              <div className="mt-3 flex items-end gap-2">
                <span className="text-4xl font-bold text-[#0B1221]">$29</span>
                <span className="text-sm font-medium text-slate-400 mb-1">one-time</span>
              </div>
              <p className="mt-2 text-sm text-slate-400">No recurring charge.</p>

              <ul className="mt-7 space-y-3">
                {CLAIM_INCLUDED.map((item) => (
                  <li key={item} className="flex items-start gap-3 text-[14px] text-slate-600">
                    <Check className="w-4.5 h-4.5 text-[#4F47E6] shrink-0 mt-0.5" aria-hidden="true" />
                    <span>{item}</span>
                  </li>
                ))}
              </ul>

              <Link
                to="/feature-my-product/onboarding"
                className="mt-8 flex items-center justify-center w-full px-6 py-3.5 rounded-xl text-[15px] font-semibold text-white bg-[#0B1221] hover:opacity-90 transition-opacity active:scale-[0.99]"
              >
                Claim your listing — $29
              </Link>
            </div>
          </ScrollReveal>

          {/* Step 2 — Growth */}
          <ScrollReveal delayMs={100}>
            <div className="relative rounded-3xl border-2 border-[#4F47E6] bg-white p-7 sm:p-8 shadow-[0_20px_48px_rgba(79,71,230,0.14)]">
              <span className="absolute -top-3 left-1/2 -translate-x-1/2 bg-[#4F47E6] text-white text-[11px] font-semibold uppercase tracking-wide px-3 py-1 rounded-full">
                Step 2 · Best value on Yearly
              </span>

              <h3 className="text-lg font-semibold text-[#0B1221] mt-1">Growth</h3>

              <div className="mt-3 flex rounded-xl bg-slate-100 p-1">
                <button
                  type="button"
                  onClick={() => setInterval('month')}
                  className={`flex-1 py-2 rounded-lg text-[13px] font-semibold transition-colors ${interval === 'month' ? 'bg-white text-[#0B1221] shadow-sm' : 'text-slate-500'}`}
                >
                  Monthly
                </button>
                <button
                  type="button"
                  onClick={() => setInterval('year')}
                  className={`flex-1 py-2 rounded-lg text-[13px] font-semibold transition-colors ${interval === 'year' ? 'bg-white text-[#0B1221] shadow-sm' : 'text-slate-500'}`}
                >
                  Yearly
                </button>
              </div>

              <div className="mt-4 flex items-end gap-2">
                <span className="text-4xl font-bold text-[#0B1221]">{interval === 'year' ? '$890' : '$89'}</span>
                <span className="text-sm font-medium text-slate-400 mb-1">/{interval === 'year' ? 'year' : 'month'}</span>
              </div>
              <p className="mt-2 text-sm text-slate-400">Requires Claim &amp; Verify first. Cancel anytime.</p>

              <ul className="mt-7 space-y-3">
                {GROWTH_SHARED.map((item) => (
                  <li key={item} className="flex items-start gap-3 text-[14px] text-slate-600">
                    <Check className="w-4.5 h-4.5 text-[#4F47E6] shrink-0 mt-0.5" aria-hidden="true" />
                    <span>{item}</span>
                  </li>
                ))}
                {GROWTH_YEARLY_ONLY.map((item) => (
                  <li key={item} className={`flex items-start gap-3 text-[14px] ${interval === 'year' ? 'text-slate-600' : 'text-slate-300'}`}>
                    <Sparkles className={`w-4.5 h-4.5 shrink-0 mt-0.5 ${interval === 'year' ? 'text-[#7C3AED]' : 'text-slate-300'}`} aria-hidden="true" />
                    <span>{item}{interval !== 'year' && <span className="ml-1.5 text-[11px] font-medium text-slate-400">(Yearly only)</span>}</span>
                  </li>
                ))}
              </ul>

              <Link
                to="/feature-my-product/onboarding"
                className="mt-8 flex items-center justify-center w-full px-6 py-3.5 rounded-xl text-[15px] font-semibold text-white bg-gradient-to-br from-[#4F47E6] to-[#7C3AED] hover:opacity-90 transition-opacity active:scale-[0.99]"
              >
                Start with Claim &amp; Verify
              </Link>
              <p className="mt-3 text-center text-xs text-slate-400">Growth unlocks right after — no separate signup.</p>
            </div>
          </ScrollReveal>
        </div>
      </div>
    </section>
  );
}
