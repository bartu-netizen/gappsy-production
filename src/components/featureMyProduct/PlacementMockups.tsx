import { Search, ShieldCheck, Sparkles, Flame, Mail } from 'lucide-react';

export type PlacementType =
  | 'homepage'
  | 'category'
  | 'comparison'
  | 'search'
  | 'related'
  | 'alternatives'
  | 'toolPage'
  | 'ai'
  | 'trending'
  | 'newsletter';

interface PlacementMockupProps {
  type: PlacementType;
}

const AVATAR = 'w-7 h-7 rounded-lg bg-slate-100 flex items-center justify-center text-[11px] font-bold text-slate-400 shrink-0';
const FEATURED_AVATAR = 'w-7 h-7 rounded-lg bg-[#4F47E6] flex items-center justify-center text-[11px] font-bold text-white shrink-0';
const FEATURED_BADGE = 'inline-flex items-center text-[9px] font-semibold uppercase tracking-wide text-white bg-[#4F47E6] rounded-full px-1.5 py-0.5';
const SOON_BADGE = 'inline-flex items-center text-[9px] font-semibold uppercase tracking-wide text-slate-400 bg-slate-100 rounded-full px-1.5 py-0.5';

function Frame({ children }: { children: React.ReactNode }) {
  return (
    <div className="rounded-2xl border border-[#eef0f3] bg-white shadow-[0_12px_28px_rgba(15,23,42,0.06)] overflow-hidden">
      <div className="flex items-center gap-1.5 px-3.5 py-2.5 border-b border-[#f1f3f5] bg-slate-50/60">
        <span className="w-2 h-2 rounded-full bg-slate-200" />
        <span className="w-2 h-2 rounded-full bg-slate-200" />
        <span className="w-2 h-2 rounded-full bg-slate-200" />
      </div>
      <div className="p-4">{children}</div>
    </div>
  );
}

function Row({ label, sub, featured }: { label: string; sub: string; featured?: boolean }) {
  return (
    <div className={`flex items-center gap-2.5 rounded-xl px-2.5 py-2 ${featured ? 'bg-[#EEF0FE]/70 ring-1 ring-[#4F47E6]/20' : ''}`}>
      <div className={featured ? FEATURED_AVATAR : AVATAR}>{label.charAt(0)}</div>
      <div className="min-w-0 flex-1">
        <div className="flex items-center gap-1.5">
          <span className="text-[12px] font-semibold text-slate-700 truncate">{label}</span>
          {featured && <span className={FEATURED_BADGE}>Featured</span>}
        </div>
        <div className="text-[10px] text-slate-400 truncate">{sub}</div>
      </div>
    </div>
  );
}

export default function PlacementMockup({ type }: PlacementMockupProps) {
  switch (type) {
    case 'homepage':
      return (
        <Frame>
          <div className="text-[10px] font-semibold uppercase tracking-wide text-slate-400 mb-2">Recently featured</div>
          <div className="grid grid-cols-2 gap-2">
            <Row label="Notchly" sub="Analytics" />
            <Row label="Your Product" sub="Featured spotlight" featured />
            <Row label="Flowbase" sub="Automation" />
            <Row label="Acme CRM" sub="Sales" />
          </div>
        </Frame>
      );
    case 'category':
      return (
        <Frame>
          <div className="text-[10px] font-semibold uppercase tracking-wide text-slate-400 mb-2">Project Management</div>
          <div className="space-y-1.5">
            <Row label="Your Product" sub="Ranked in category" featured />
            <Row label="Taskly" sub="Team boards" />
            <Row label="Plandeck" sub="Roadmapping" />
          </div>
        </Frame>
      );
    case 'comparison':
      return (
        <Frame>
          <div className="flex items-center justify-between gap-2">
            <div className="flex-1 rounded-xl bg-[#EEF0FE]/70 ring-1 ring-[#4F47E6]/20 p-2.5">
              <div className={`${FEATURED_AVATAR} mb-1.5`}>Y</div>
              <div className="text-[11px] font-semibold text-slate-700">Your Product</div>
              <span className={`${FEATURED_BADGE} mt-1`}>Featured</span>
            </div>
            <span className="text-[10px] font-bold text-slate-300 shrink-0">VS</span>
            <div className="flex-1 rounded-xl border border-[#f1f3f5] p-2.5">
              <div className={`${AVATAR} mb-1.5`}>C</div>
              <div className="text-[11px] font-semibold text-slate-500">Competitor</div>
            </div>
          </div>
        </Frame>
      );
    case 'search':
      return (
        <Frame>
          <div className="flex items-center gap-2 h-8 rounded-full bg-slate-50 border border-slate-200 px-3 mb-2.5">
            <Search className="w-3 h-3 text-slate-400" />
            <span className="text-[11px] text-slate-400">project management...</span>
          </div>
          <div className="space-y-1.5">
            <Row label="Your Product" sub="Listed & searchable" featured />
            <Row label="Taskly" sub="Team boards" />
          </div>
        </Frame>
      );
    case 'related':
      return (
        <Frame>
          <div className="text-[10px] font-semibold uppercase tracking-wide text-slate-400 mb-2">You might also like</div>
          <div className="grid grid-cols-3 gap-1.5">
            <div className="rounded-lg border border-[#f1f3f5] p-1.5 text-center">
              <div className={`${AVATAR} mx-auto mb-1`}>T</div>
              <div className="text-[9px] text-slate-400 truncate">Taskly</div>
            </div>
            <div className="rounded-lg border border-[#f1f3f5] p-1.5 text-center">
              <div className={`${AVATAR} mx-auto mb-1`}>P</div>
              <div className="text-[9px] text-slate-400 truncate">Plandeck</div>
            </div>
            <div className="rounded-lg bg-[#EEF0FE]/70 ring-1 ring-[#4F47E6]/20 p-1.5 text-center">
              <div className={`${FEATURED_AVATAR} mx-auto mb-1`}>Y</div>
              <div className="text-[9px] font-semibold text-slate-700 truncate">Your Product</div>
            </div>
          </div>
        </Frame>
      );
    case 'alternatives':
      return (
        <Frame>
          <div className="text-[10px] font-semibold uppercase tracking-wide text-slate-400 mb-2">Best alternatives</div>
          <div className="space-y-1.5">
            <Row label="Your Product" sub="#1 recommended alternative" featured />
            <Row label="Notchly" sub="Alternative" />
            <Row label="Flowbase" sub="Alternative" />
          </div>
        </Frame>
      );
    case 'toolPage':
      return (
        <Frame>
          <div className="flex items-start gap-2.5">
            <div className={`${FEATURED_AVATAR} w-10 h-10 rounded-xl text-sm`}>Y</div>
            <div className="min-w-0">
              <div className="flex items-center gap-1">
                <span className="text-[13px] font-bold text-slate-800">Your Product</span>
                <ShieldCheck className="w-3 h-3 text-[#4F47E6]" />
              </div>
              <div className="flex items-center gap-1 mt-1">
                <span className={FEATURED_BADGE}>Editor's Pick</span>
              </div>
            </div>
          </div>
          <div className="mt-2.5 h-1.5 w-full rounded-full bg-slate-100" />
          <div className="mt-1.5 h-1.5 w-2/3 rounded-full bg-slate-100" />
        </Frame>
      );
    case 'ai':
      return (
        <Frame>
          <div className="flex items-center gap-1.5 mb-2">
            <Sparkles className="w-3.5 h-3.5 text-[#4F47E6]" />
            <span className="text-[10px] font-semibold uppercase tracking-wide text-slate-400">AI recommendation</span>
            <span className={SOON_BADGE}>Soon</span>
          </div>
          <div className="rounded-xl bg-slate-50 border border-[#f1f3f5] px-3 py-2.5 text-[11px] text-slate-400 italic">
            "For your team size, Your Product is a strong fit — here's why..."
          </div>
        </Frame>
      );
    case 'trending':
      return (
        <Frame>
          <div className="flex items-center gap-1.5 mb-2">
            <Flame className="w-3.5 h-3.5 text-orange-400" />
            <span className="text-[10px] font-semibold uppercase tracking-wide text-slate-400">Trending this week</span>
            <span className={SOON_BADGE}>Soon</span>
          </div>
          <div className="space-y-1.5 opacity-70">
            <Row label="Your Product" sub="Rising in views" />
            <Row label="Notchly" sub="Rising in views" />
          </div>
        </Frame>
      );
    case 'newsletter':
      return (
        <Frame>
          <div className="flex items-center gap-1.5 mb-2">
            <Mail className="w-3.5 h-3.5 text-slate-400" />
            <span className="text-[10px] font-semibold uppercase tracking-wide text-slate-400">Gappsy Weekly</span>
            <span className={SOON_BADGE}>Soon</span>
          </div>
          <div className="rounded-xl bg-slate-50 border border-[#f1f3f5] px-3 py-2.5 opacity-70">
            <div className="h-1.5 w-1/2 rounded-full bg-slate-200 mb-1.5" />
            <div className="text-[11px] text-slate-400">This week's featured pick: <span className="font-semibold">Your Product</span></div>
          </div>
        </Frame>
      );
    default:
      return null;
  }
}
