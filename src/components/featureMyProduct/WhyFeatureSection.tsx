import { ShieldCheck, PenLine, MessageSquare, Lock, RefreshCw, Ban } from 'lucide-react';
import ScrollReveal from './ScrollReveal';

const REASONS = [
  {
    icon: ShieldCheck,
    title: 'Buyers trust verified listings',
    body: 'A verified badge signals this is the real product owner speaking — not a guess or a third-party description.',
  },
  {
    icon: PenLine,
    title: 'Keep your info accurate',
    body: 'Your product changes — pricing, features, screenshots. Self-serve editing means your listing keeps up without waiting on us.',
  },
  {
    icon: MessageSquare,
    title: 'Be the one who answers',
    body: 'Reply to reviews directly from your own dashboard instead of leaving the conversation one-sided.',
  },
  {
    icon: Lock,
    title: 'Protect your listing',
    body: 'Listing and verifying locks in ownership, so nobody else can manage or misrepresent your product\'s page.',
  },
  {
    icon: Ban,
    title: 'No recurring commitment',
    body: 'A single $29 fee, not a subscription you have to remember to cancel.',
  },
  {
    icon: RefreshCw,
    title: 'A few minutes, once',
    body: 'Submit your URL, verify ownership, done. No back-and-forth with an editorial team required.',
  },
];

export default function WhyFeatureSection() {
  return (
    <section id="why-feature" className="py-20 sm:py-28 scroll-mt-24">
      <div className="max-w-6xl mx-auto px-6 sm:px-8">
        <ScrollReveal className="max-w-2xl mx-auto text-center mb-14">
          <h2 className="text-3xl sm:text-4xl font-bold tracking-tight text-[#0B1221]">
            Why list your product
          </h2>
          <p className="mt-4 text-lg text-slate-500">
            If your product's already on Gappsy, its page exists whether you're in control of it or not — verifying it just means you're the one who can manage it. If it's not listed yet, this is how it gets added.
          </p>
        </ScrollReveal>

        <div className="grid sm:grid-cols-2 lg:grid-cols-3 gap-6">
          {REASONS.map((r, i) => (
            <ScrollReveal key={r.title} delayMs={(i % 3) * 80}>
              <div className="h-full rounded-2xl border border-[#eef0f3] p-6 transition-all duration-200 hover:-translate-y-0.5 hover:shadow-[0_12px_28px_rgba(15,23,42,0.08)] hover:border-slate-200">
                <div className="w-10 h-10 rounded-xl bg-[#EEF0FE] flex items-center justify-center mb-4">
                  <r.icon className="w-5 h-5 text-[#4F47E6]" aria-hidden="true" />
                </div>
                <h3 className="text-[17px] font-semibold text-[#0B1221]">{r.title}</h3>
                <p className="mt-2 text-[15px] leading-relaxed text-slate-500">{r.body}</p>
              </div>
            </ScrollReveal>
          ))}
        </div>
      </div>
    </section>
  );
}
