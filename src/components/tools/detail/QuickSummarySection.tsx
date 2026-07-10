import { Target, Wallet, MonitorSmartphone, Sparkle } from 'lucide-react';

interface QuickSummarySectionProps {
  toolName: string;
  categoryName: string | null;
  pricingModel: string | null;
  startingPrice: string | null;
  platformsLabel: string | null;
  standoutFeature: { title: string; description: string } | null;
}

interface Fact {
  icon: typeof Target;
  label: string;
  value: string;
}

// "Scan in 5 seconds" stat strip, placed right after the Hero. Deliberately a
// different visual shape (horizontal, hairline-divided) from the card grids
// used throughout the rest of the page, for rhythm — while degrading to just
// the facts that exist in the `tools` row for the 49,999 tools that don't
// have a hand-authored `extendedContent` overlay (standoutFeature).
export default function QuickSummarySection({
  toolName,
  categoryName,
  pricingModel,
  startingPrice,
  platformsLabel,
  standoutFeature,
}: QuickSummarySectionProps) {
  const facts: Fact[] = [];

  if (categoryName) {
    facts.push({ icon: Target, label: 'Best for', value: `Teams evaluating ${categoryName.toLowerCase()} tools` });
  }
  if (pricingModel || startingPrice) {
    facts.push({
      icon: Wallet,
      label: 'Pricing',
      value: [pricingModel, startingPrice ? `From ${startingPrice}` : null].filter(Boolean).join(' · '),
    });
  }
  if (platformsLabel) {
    facts.push({ icon: MonitorSmartphone, label: 'Platforms', value: platformsLabel });
  }
  if (standoutFeature) {
    facts.push({ icon: Sparkle, label: 'Standout feature', value: standoutFeature.title });
  }

  // Below 2 facts, a single-cell "strip" reads as sparse/orphaned rather than
  // a scannable summary — better to omit it than show a half-empty box.
  if (facts.length < 2) return null;

  return (
    <section
      aria-label={`${toolName} at a glance`}
      className="flex flex-col sm:flex-row divide-y sm:divide-y-0 sm:divide-x divide-slate-200 rounded-2xl border border-slate-200 bg-white overflow-hidden"
    >
      {facts.map((fact) => (
        <div key={fact.label} className="flex-1 flex items-start gap-2.5 px-5 py-4 min-w-0">
          <fact.icon className="w-4 h-4 text-indigo-500 shrink-0 mt-0.5" />
          <div className="min-w-0">
            <p className="text-[11px] font-semibold uppercase tracking-[0.06em] text-slate-400">{fact.label}</p>
            <p className="text-[13.5px] text-[#0B1221] font-medium leading-snug truncate" title={fact.value}>{fact.value}</p>
          </div>
        </div>
      ))}
    </section>
  );
}
