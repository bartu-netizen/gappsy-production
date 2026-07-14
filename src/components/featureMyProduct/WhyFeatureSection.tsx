import { GitCompare, LayoutGrid, Search, Sparkles, Layers, Target } from 'lucide-react';
import ScrollReveal from './ScrollReveal';

const REASONS = [
  {
    icon: Target,
    title: 'Buyer intent, not browsing',
    body: 'Someone on a comparison or category page has already decided they need software like yours. They\'re evaluating, not scrolling for entertainment.',
  },
  {
    icon: GitCompare,
    title: 'Comparison traffic converts',
    body: 'Visitors reading "X vs Y" pages are choosing between a short list of finalists. Being one of the options they see is worth far more than generic ad impressions.',
  },
  {
    icon: Layers,
    title: 'Alternative-page visibility',
    body: 'When buyers search "alternatives to [competitor]", your product can be the answer — right on the page they land on to switch.',
  },
  {
    icon: LayoutGrid,
    title: 'Category pages that already rank',
    body: 'Gappsy\'s category pages are built and indexed for search. A featured spot puts you in front of everyone who lands there.',
  },
  {
    icon: Sparkles,
    title: 'Built for AI recommendations',
    body: 'As AI assistants start recommending software directly, structured, editorially-reviewed listings are what gets cited. We\'re building for that shift.',
  },
  {
    icon: Search,
    title: 'Findable the moment you\'re live',
    body: 'Internal search indexes your listing immediately — no waiting for a crawler to notice you exist.',
  },
];

export default function WhyFeatureSection() {
  return (
    <section id="why-feature" className="py-20 sm:py-28 scroll-mt-24">
      <div className="max-w-6xl mx-auto px-6 sm:px-8">
        <ScrollReveal className="max-w-2xl mx-auto text-center mb-14">
          <h2 className="text-3xl sm:text-4xl font-bold tracking-tight text-[#0B1221]">
            Why feature your software on a directory built around buyer intent
          </h2>
          <p className="mt-4 text-lg text-slate-500">
            Most software promotion pays for attention. Gappsy puts you in front of people who already showed up looking to compare.
          </p>
        </ScrollReveal>

        <div className="grid sm:grid-cols-2 lg:grid-cols-3 gap-6">
          {REASONS.map((r, i) => (
            <ScrollReveal key={r.title} delayMs={(i % 3) * 80}>
              <div className="h-full rounded-2xl border border-[#eef0f3] p-6 transition-all duration-200 hover:-translate-y-0.5 hover:shadow-[0_12px_28px_rgba(15,23,42,0.08)] hover:border-slate-200">
                <div className="w-10 h-10 rounded-xl bg-indigo-50 flex items-center justify-center mb-4">
                  <r.icon className="w-5 h-5 text-[#4F46E5]" aria-hidden="true" />
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
