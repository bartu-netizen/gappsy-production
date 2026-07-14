import { Eye, Users, Link2, Megaphone, ArrowUpCircle, Gauge, ClipboardCheck } from 'lucide-react';
import ScrollReveal from './ScrollReveal';

const BENEFITS = [
  { icon: Eye, title: 'Higher visibility', body: 'Priority placement across category, comparison, and search surfaces instead of the standard queue.' },
  { icon: Users, title: 'Qualified traffic', body: 'Clicks from people already comparing software in your category — not cold, undirected impressions.' },
  { icon: Link2, title: 'Better backlinks', body: 'A verified listing on an indexed, growing directory — a durable link, not a one-time mention.' },
  { icon: Megaphone, title: 'Brand awareness', body: 'Consistent exposure everywhere buyers research, from category pages to head-to-head comparisons.' },
  { icon: ArrowUpCircle, title: 'Priority placement', body: 'Featured styling and ranking ahead of unfeatured listings in the same category.' },
  { icon: Gauge, title: 'Faster indexing', body: 'Your listing is live and searchable immediately — no waiting on a crawl cycle.' },
  { icon: ClipboardCheck, title: 'Editorial review', body: 'A real review of your pricing and positioning, so your listing is accurate and credible, not just self-reported.' },
];

export default function BenefitsSection() {
  return (
    <section id="benefits" className="py-20 sm:py-28 scroll-mt-24">
      <div className="max-w-6xl mx-auto px-6 sm:px-8">
        <ScrollReveal className="max-w-2xl mx-auto text-center mb-14">
          <h2 className="text-3xl sm:text-4xl font-bold tracking-tight text-[#0B1221]">
            What a featured listing gets you
          </h2>
          <p className="mt-4 text-lg text-slate-500">
            Everything you'd want from a software marketing channel — without the ad-buying overhead.
          </p>
        </ScrollReveal>

        <div className="grid sm:grid-cols-2 lg:grid-cols-4 gap-5">
          {BENEFITS.map((b, i) => (
            <ScrollReveal key={b.title} delayMs={(i % 4) * 70}>
              <div className="h-full rounded-2xl border border-[#eef0f3] p-5 transition-all duration-200 hover:-translate-y-0.5 hover:shadow-[0_12px_28px_rgba(15,23,42,0.08)]">
                <b.icon className="w-5 h-5 text-[#4F46E5]" aria-hidden="true" />
                <h3 className="mt-3 text-[15px] font-semibold text-[#0B1221]">{b.title}</h3>
                <p className="mt-1.5 text-[13.5px] leading-relaxed text-slate-500">{b.body}</p>
              </div>
            </ScrollReveal>
          ))}
        </div>
      </div>
    </section>
  );
}
