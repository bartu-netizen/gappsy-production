import { useEffect, useState } from 'react';
import { Quote } from 'lucide-react';
import { supabase } from '../../lib/supabase';
import ScrollReveal from './ScrollReveal';

// Real, published tools already in the directory — confirmed to have a real
// crawled logo (tools.logo), not every well-known slug does (e.g. Canva and
// Figma's logo crawl was blocked, so they're deliberately excluded from this
// specific strip even though they're published elsewhere on the site).
const LISTED_SLUGS = ['notion', 'slack', 'stripe', 'hubspot', 'zoom', 'asana', 'airtable', 'github', 'shopify'];

interface ListedTool {
  slug: string;
  name: string;
  logo: string | null;
}

// Placeholder copy — swap for real founder quotes once the first cohort of
// claimed listings has run for a few weeks.
const TESTIMONIALS = [
  {
    quote: 'Verification took about five minutes — one meta tag and we were done.',
    role: 'Founder, project management SaaS',
  },
  {
    quote: 'The editorial review actually improved our listing — it wasn’t just a form we filled in and forgot about.',
    role: 'Marketing lead, dev tools startup',
  },
  {
    quote: 'A one-time fee to stop a stale description from just sitting there. Now we can fix it ourselves in two minutes.',
    role: 'Co-founder, no-code platform',
  },
];

const METRICS = [
  { value: '141+', label: 'software tools already listed' },
  { value: '61', label: 'categories to be discovered in' },
  { value: '$29', label: 'one-time, no subscription' },
];

function LogoTile({ tool }: { tool: ListedTool }) {
  const [failed, setFailed] = useState(false);
  const showLogo = tool.logo && !failed;

  return (
    <div className="flex items-center gap-2.5">
      {showLogo ? (
        <img
          src={tool.logo!}
          alt=""
          aria-hidden="true"
          className="w-6 h-6 rounded-md object-contain shrink-0"
          onError={() => setFailed(true)}
        />
      ) : (
        <span className="w-6 h-6 rounded-md bg-slate-100 flex items-center justify-center text-[10px] font-bold text-slate-400 shrink-0">
          {tool.name.charAt(0)}
        </span>
      )}
      <span className="text-sm font-medium text-slate-600">{tool.name}</span>
    </div>
  );
}

export default function TrustSection() {
  const [tools, setTools] = useState<ListedTool[] | null>(null);

  useEffect(() => {
    let cancelled = false;
    supabase
      .from('tools')
      .select('slug, name, logo')
      .in('slug', LISTED_SLUGS)
      .eq('status', 'published')
      .then(({ data }) => {
        if (cancelled || !data) return;
        const bySlug = new Map(data.map((t) => [t.slug, t as ListedTool]));
        setTools(LISTED_SLUGS.map((slug) => bySlug.get(slug)).filter((t): t is ListedTool => Boolean(t)));
      });
    return () => { cancelled = true; };
  }, []);

  return (
    <section className="py-16 sm:py-20 border-y border-[#f1f3f5] bg-slate-50/40">
      <div className="max-w-6xl mx-auto px-6 sm:px-8">
        <ScrollReveal>
          <p className="text-center text-[13px] font-semibold uppercase tracking-wide text-slate-400 mb-7">
            Listed alongside software buyers already trust
          </p>
          <div className="flex flex-wrap items-center justify-center gap-x-9 gap-y-4 min-h-[24px]">
            {(tools ?? LISTED_SLUGS.map((slug) => ({ slug, name: slug, logo: null }))).map((tool) => (
              <LogoTile key={tool.slug} tool={tool} />
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
                <Quote className="w-5 h-5 text-[#4F47E6]/30 mb-3" aria-hidden="true" fill="currentColor" strokeWidth={0} />
                <blockquote className="text-[15px] leading-relaxed text-slate-600">{t.quote}</blockquote>
                <figcaption className="mt-4 text-[13px] font-medium text-slate-400">{t.role}</figcaption>
              </figure>
            </ScrollReveal>
          ))}
        </div>
      </div>
    </section>
  );
}
