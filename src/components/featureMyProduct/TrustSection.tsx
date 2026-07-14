import ScrollReveal from './ScrollReveal';

// Real tools already published in the directory (see ToolDetailPage) — used
// as a "you'd be listed alongside" trust strip. Deliberately using the same
// initial-letter avatar treatment as ToolCard/ToolHero rather than hotlinking
// third-party logo assets on a page that's pitching other vendors on paid
// placement — avoids any implied endorsement from a specific company's logo.
const LISTED_TOOLS = ['Canva', 'Notion', 'Slack', 'Figma', 'Stripe', 'HubSpot', 'Zoom', 'Asana', 'Airtable', 'GitHub'];

// Placeholder copy — swap for real founder quotes once the first cohort of
// featured listings has run for a few weeks.
const TESTIMONIALS = [
  {
    quote: 'We went live in two days and started showing up in comparison pages against tools we’d never ranked next to before.',
    role: 'Founder, project management SaaS',
  },
  {
    quote: 'The editorial review actually improved our listing — it wasn’t just a form we filled in and forgot about.',
    role: 'Head of Growth, dev tools startup',
  },
  {
    quote: 'Cancel-anytime made it an easy yes. We kept it because it kept sending qualified clicks, not because we were locked in.',
    role: 'Co-founder, no-code platform',
  },
];

const METRICS = [
  { value: '141+', label: 'software tools already listed' },
  { value: '61', label: 'categories to be discovered in' },
  { value: '9', label: 'placement surfaces per listing' },
];

export default function TrustSection() {
  return (
    <section className="py-16 sm:py-20 border-y border-[#f1f3f5] bg-slate-50/40">
      <div className="max-w-6xl mx-auto px-6 sm:px-8">
        <ScrollReveal>
          <p className="text-center text-[13px] font-semibold uppercase tracking-wide text-slate-400 mb-6">
            Listed alongside software buyers already trust
          </p>
          <div className="flex flex-wrap items-center justify-center gap-x-8 gap-y-4">
            {LISTED_TOOLS.map((name) => (
              <div key={name} className="flex items-center gap-2 text-slate-400">
                <span className="w-7 h-7 rounded-lg bg-slate-100 flex items-center justify-center text-[11px] font-bold text-slate-400">
                  {name.charAt(0)}
                </span>
                <span className="text-sm font-medium text-slate-500">{name}</span>
              </div>
            ))}
          </div>
        </ScrollReveal>

        <div className="grid sm:grid-cols-3 gap-6 mt-14">
          {METRICS.map((m, i) => (
            <ScrollReveal key={m.label} delayMs={i * 80}>
              <div className="text-center rounded-2xl bg-white border border-[#eef0f3] px-6 py-8">
                <div className="text-3xl font-bold text-[#0B1221]">{m.value}</div>
                <div className="text-sm text-slate-500 mt-1">{m.label}</div>
              </div>
            </ScrollReveal>
          ))}
        </div>

        <div className="grid md:grid-cols-3 gap-5 mt-8">
          {TESTIMONIALS.map((t, i) => (
            <ScrollReveal key={t.role} delayMs={i * 100}>
              <figure className="h-full rounded-2xl bg-white border border-[#eef0f3] p-6">
                <blockquote className="text-[15px] leading-relaxed text-slate-600">"{t.quote}"</blockquote>
                <figcaption className="mt-4 text-[13px] font-medium text-slate-400">{t.role}</figcaption>
              </figure>
            </ScrollReveal>
          ))}
        </div>
      </div>
    </section>
  );
}
