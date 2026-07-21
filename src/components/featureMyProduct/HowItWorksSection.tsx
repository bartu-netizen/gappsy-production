import { Fragment } from 'react';
import { FileText, ShieldCheck, LayoutDashboard, ArrowRight, ArrowDown } from 'lucide-react';
import ScrollReveal from './ScrollReveal';

const STEPS = [
  { icon: FileText, title: 'Submit', body: 'Tell us your product\'s website — we\'ll check if it\'s already in the Gappsy directory.' },
  { icon: ShieldCheck, title: 'Verify', body: 'Prove ownership with a meta tag, DNS record, or hosted file — takes a couple of minutes.' },
  { icon: LayoutDashboard, title: 'Manage it yourself', body: 'Verified badge goes live, and you get self-serve access to edit your listing and reply to reviews.' },
];

export default function HowItWorksSection() {
  return (
    <section id="how-it-works" className="py-20 sm:py-28 bg-slate-50/40 border-y border-[#f1f3f5] scroll-mt-24">
      <div className="max-w-5xl mx-auto px-6 sm:px-8">
        <ScrollReveal className="max-w-2xl mx-auto text-center mb-14">
          <h2 className="text-3xl sm:text-4xl font-bold tracking-tight text-[#0B1221]">How it works</h2>
          <p className="mt-4 text-lg text-slate-500">Submit, verify, done — usually just a few minutes.</p>
        </ScrollReveal>

        <div className="flex flex-col md:flex-row items-stretch gap-4 md:gap-3">
          {STEPS.map((s, i) => (
            <Fragment key={s.title}>
              <ScrollReveal delayMs={i * 100} className="flex-1">
                <div className="h-full rounded-2xl bg-white border border-[#eef0f3] p-6 text-center">
                  <div className="w-11 h-11 rounded-xl bg-[#EEF0FE] flex items-center justify-center mx-auto mb-4">
                    <s.icon className="w-5 h-5 text-[#4F47E6]" aria-hidden="true" />
                  </div>
                  <div className="text-[12px] font-semibold uppercase tracking-wide text-[#4F47E6]">Step {i + 1}</div>
                  <h3 className="mt-1 text-[17px] font-semibold text-[#0B1221]">{s.title}</h3>
                  <p className="mt-2 text-[14px] leading-relaxed text-slate-500">{s.body}</p>
                </div>
              </ScrollReveal>
              {i < STEPS.length - 1 && (
                <div className="flex items-center justify-center py-1 md:py-0" aria-hidden="true">
                  <ArrowDown className="w-4 h-4 text-slate-300 md:hidden" />
                  <ArrowRight className="w-4 h-4 text-slate-300 hidden md:block" />
                </div>
              )}
            </Fragment>
          ))}
        </div>
      </div>
    </section>
  );
}
