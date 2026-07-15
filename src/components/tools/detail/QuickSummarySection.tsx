import { Target, Wallet, MonitorSmartphone, Sparkle } from 'lucide-react';
import { categoryToolsPhrase } from '../../../utils/categoryPhrasing';

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
  fullValue?: string;
}

// The full platforms list (up to 8 for a tool like Canva) reads fine as
// wrapped chips in the sidebar/At-a-Glance grid, but this strip's cells are
// narrow — showing all of it wraps to 4+ lines and looks broken next to the
// other 3, shorter facts. Cap it the same way "+N more" badges work
// elsewhere: show the first few, count the rest.
function compactPlatforms(label: string, maxItems = 3): string {
  const items = label.split(',').map((s) => s.trim()).filter(Boolean);
  if (items.length <= maxItems) return label;
  const shown = items.slice(0, maxItems).join(', ');
  return `${shown} +${items.length - maxItems} more`;
}

// "Scan in 5 seconds" stat strip, placed right after the Hero. A 2x2 grid
// rather than a single 4-across row — this section lives in the narrower
// content column (a sidebar takes the rest of the width from lg upward), so
// 4-across left almost no room per cell and clipped even short values (see
// git history: was `truncate` + flex-row, cut "Teams evaluating design
// tools" down to "Teams e..."). Two per row gives real width to wrap into
// instead of relying on ellipsis. Degrades to just the facts that exist in
// the `tools` row for tools without a hand-authored `extendedContent`
// overlay (standoutFeature).
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
    facts.push({ icon: Target, label: 'Best for', value: `Teams evaluating ${categoryToolsPhrase(categoryName)}` });
  }
  if (pricingModel || startingPrice) {
    facts.push({
      icon: Wallet,
      label: 'Pricing',
      value: [pricingModel, startingPrice ? `From ${startingPrice}` : null].filter(Boolean).join(' · '),
    });
  }
  if (platformsLabel) {
    facts.push({ icon: MonitorSmartphone, label: 'Platforms', value: compactPlatforms(platformsLabel), fullValue: platformsLabel });
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
      className="grid grid-cols-1 sm:grid-cols-2 gap-px bg-slate-200 rounded-2xl border border-slate-200 overflow-hidden"
    >
      {facts.map((fact) => (
        <div key={fact.label} className="flex items-start gap-2.5 px-5 py-4 min-w-0 bg-white">
          <fact.icon className="w-4 h-4 text-[#0A1735] shrink-0 mt-0.5" />
          <div className="min-w-0">
            <p className="text-[11px] font-semibold uppercase tracking-[0.06em] text-slate-400">{fact.label}</p>
            <p className="text-[13.5px] text-[#0B1221] font-medium leading-snug" title={fact.fullValue ?? fact.value}>{fact.value}</p>
          </div>
        </div>
      ))}
    </section>
  );
}
