import ScrollReveal from './ScrollReveal';
import PlacementMockup, { type PlacementType } from './PlacementMockups';

const PLACEMENTS: { type: PlacementType; title: string; body: string; soon?: boolean }[] = [
  { type: 'homepage', title: 'Homepage', body: 'Rotating spotlight placement on the page discovery traffic lands on first.' },
  { type: 'category', title: 'Category pages', body: 'Ranked visibility on every category your product belongs to.' },
  { type: 'alternatives', title: 'Alternative pages', body: 'Listed when buyers are actively looking to switch away from a competitor.' },
  { type: 'comparison', title: 'Comparison pages', body: 'Shown as an option on head-to-head "X vs Y" pages buyers use to decide.' },
  { type: 'search', title: 'Search', body: 'Instantly searchable — no indexing delay once your listing goes live.' },
  { type: 'related', title: 'Related software', body: 'Surfaced as a recommendation on relevant tool pages across the directory.' },
  { type: 'ai', title: 'AI recommendations', body: 'Structured for citation as AI-assisted software discovery rolls out.', soon: true },
  { type: 'trending', title: 'Trending', body: 'Visibility in what\'s gaining attention across the directory.', soon: true },
  { type: 'newsletter', title: 'Newsletter', body: 'A featured pick in Gappsy\'s upcoming software roundup email.', soon: true },
];

export default function PlacementsSection() {
  return (
    <section id="placements" className="py-20 sm:py-28 bg-slate-50/40 border-y border-[#f1f3f5] scroll-mt-24">
      <div className="max-w-6xl mx-auto px-6 sm:px-8">
        <ScrollReveal className="max-w-2xl mx-auto text-center mb-14">
          <h2 className="text-3xl sm:text-4xl font-bold tracking-tight text-[#0B1221]">
            Where your software actually appears
          </h2>
          <p className="mt-4 text-lg text-slate-500">
            One featured listing, distributed across every surface buyers use to find and compare software.
          </p>
        </ScrollReveal>

        <div className="grid sm:grid-cols-2 lg:grid-cols-3 gap-6">
          {PLACEMENTS.map((p, i) => (
            <ScrollReveal key={p.type} delayMs={(i % 3) * 80}>
              <div className="h-full flex flex-col rounded-2xl border border-[#eef0f3] bg-white p-5 transition-all duration-200 hover:-translate-y-0.5 hover:shadow-[0_12px_28px_rgba(15,23,42,0.08)]">
                <PlacementMockup type={p.type} />
                <h3 className="mt-4 text-[16px] font-semibold text-[#0B1221]">{p.title}</h3>
                <p className="mt-1.5 text-[14px] leading-relaxed text-slate-500">{p.body}</p>
              </div>
            </ScrollReveal>
          ))}
        </div>
      </div>
    </section>
  );
}
