import ToolsSectionHeader from '../ToolsSectionHeader';

interface KeyFactsSectionProps {
  toolName: string;
  shortDescription: string | null;
  categoryName: string | null;
  pricingModel: string | null;
  startingPrice: string | null;
  platformsLabel: string | null;
  hasFreePlan: boolean;
  hasApi: boolean;
  verified: boolean;
  updatedLabel: string | null;
}

// The "AI Summary" module: one plain-language definition sentence followed by
// a semantic <dl> of facts. Deliberately built from real <dl>/<dt>/<dd>
// elements (not styled divs) so LLM answer engines (ChatGPT/Claude/Gemini/
// Perplexity) and traditional crawlers alike can extract clean key/value
// facts without guessing at visual structure. Visible heading reads
// naturally for a human reader.
export default function KeyFactsSection({
  toolName,
  shortDescription,
  categoryName,
  pricingModel,
  startingPrice,
  platformsLabel,
  hasFreePlan,
  hasApi,
  verified,
  updatedLabel,
}: KeyFactsSectionProps) {
  const facts: [string, string][] = [];
  if (categoryName) facts.push(['Category', categoryName]);
  if (pricingModel || startingPrice) {
    facts.push(['Pricing', [pricingModel, startingPrice ? `from ${startingPrice}` : null].filter(Boolean).join(', ')]);
  }
  if (platformsLabel) facts.push(['Platforms', platformsLabel]);
  facts.push(['Free plan', hasFreePlan ? 'Yes' : 'No']);
  facts.push(['API access', hasApi ? 'Yes' : 'No']);
  facts.push(['Verified listing', verified ? 'Yes' : 'Not yet']);
  if (updatedLabel) facts.push(['Last updated', updatedLabel]);

  const definition = `${toolName} is a${categoryName ? ` ${categoryName.toLowerCase()}` : ''} software tool${
    pricingModel ? ` offered on a ${pricingModel.toLowerCase()} basis` : ''
  }.`;

  return (
    <section id="at-a-glance" className="scroll-mt-24" aria-labelledby="at-a-glance-heading">
      <div id="at-a-glance-heading">
        <ToolsSectionHeader eyebrow="At a Glance" title={`What is ${toolName}?`} />
      </div>
      <p className="text-[11px] text-slate-400 mb-3">
        Researched and fact-checked by the Gappsy editorial team{updatedLabel ? ` · Updated ${updatedLabel}` : ''}
      </p>
      <p className="text-[15px] text-slate-700 leading-relaxed mb-4">
        {definition}
        {shortDescription ? ` ${shortDescription}` : ''}
      </p>
      <dl className="grid grid-cols-2 sm:grid-cols-3 gap-x-6 gap-y-3 bg-slate-50 rounded-2xl p-5">
        {facts.map(([term, value]) => (
          <div key={term}>
            <dt className="text-[11px] font-semibold uppercase tracking-[0.06em] text-slate-400">{term}</dt>
            <dd className="text-[13.5px] font-medium text-[#0B1221] mt-0.5">{value}</dd>
          </div>
        ))}
      </dl>
    </section>
  );
}
