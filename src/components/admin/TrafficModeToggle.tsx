import { Bot, Users, Shield } from 'lucide-react';

export type TrafficMode = 'all' | 'likely_human' | 'verified_only';

const MODE_CONFIG: Record<TrafficMode, { label: string; icon: typeof Bot; activeStyle: string; description: string }> = {
  all: {
    label: 'All Traffic',
    icon: Bot,
    activeStyle: 'bg-slate-800 text-white',
    description: 'Includes scanners, bots, and all traffic',
  },
  likely_human: {
    label: 'Likely Human',
    icon: Users,
    activeStyle: 'bg-amber-500 text-white',
    description: 'Excluding scanner-flagged sessions',
  },
  verified_only: {
    label: 'Verified Human',
    icon: Shield,
    activeStyle: 'bg-emerald-600 text-white',
    description: 'Only high-confidence verified humans',
  },
};

interface TrafficModeToggleProps {
  value: TrafficMode;
  onChange: (mode: TrafficMode) => void;
  compact?: boolean;
}

export function TrafficModeToggle({ value, onChange, compact }: TrafficModeToggleProps) {
  return (
    <div className="flex items-center gap-2 bg-white border border-slate-200 rounded-xl px-4 py-3 shadow-sm flex-wrap">
      <span className="text-xs font-semibold text-slate-500 uppercase tracking-wider mr-1">Traffic mode:</span>
      {(['all', 'likely_human', 'verified_only'] as TrafficMode[]).map((mode) => {
        const cfg = MODE_CONFIG[mode];
        const Icon = cfg.icon;
        const isActive = value === mode;
        return (
          <button
            key={mode}
            onClick={() => onChange(mode)}
            className={`px-3 py-1.5 text-xs font-semibold rounded-lg transition-colors ${
              isActive ? cfg.activeStyle : 'bg-slate-100 text-slate-600 hover:bg-slate-200'
            }`}
          >
            <Icon className="w-3 h-3 inline mr-1" />
            {cfg.label}
          </button>
        );
      })}
      {!compact && value !== 'all' && (
        <span className="ml-2 text-xs text-slate-400 italic">
          {MODE_CONFIG[value].description}
        </span>
      )}
    </div>
  );
}

export function trafficModeToApiParam(mode: TrafficMode): string | undefined {
  if (mode === 'all') return undefined;
  return mode;
}

export function ConfidenceBreakdown({ raw, likelyHuman, verified, scanner }: {
  raw: number;
  likelyHuman: number;
  verified: number;
  scanner: number;
}) {
  const verifiedPct = raw > 0 ? ((verified / raw) * 100).toFixed(1) : '0.0';
  const scannerPct = raw > 0 ? ((scanner / raw) * 100).toFixed(1) : '0.0';
  return (
    <div className="grid grid-cols-2 sm:grid-cols-5 gap-2 text-xs">
      <div className="bg-slate-50 rounded-lg p-2 text-center">
        <p className="text-slate-400 font-medium">Raw</p>
        <p className="text-slate-900 font-bold text-sm">{raw.toLocaleString()}</p>
      </div>
      <div className="bg-amber-50 rounded-lg p-2 text-center">
        <p className="text-amber-600 font-medium">Likely Human</p>
        <p className="text-amber-900 font-bold text-sm">{likelyHuman.toLocaleString()}</p>
      </div>
      <div className="bg-emerald-50 rounded-lg p-2 text-center">
        <p className="text-emerald-600 font-medium">Verified</p>
        <p className="text-emerald-900 font-bold text-sm">{verified.toLocaleString()}</p>
      </div>
      <div className="bg-slate-100 rounded-lg p-2 text-center">
        <p className="text-slate-500 font-medium">Scanner</p>
        <p className="text-slate-800 font-bold text-sm">{scanner.toLocaleString()}</p>
      </div>
      <div className="bg-white border border-slate-200 rounded-lg p-2 text-center">
        <p className="text-slate-400 font-medium">Verified %</p>
        <p className="text-slate-900 font-bold text-sm">{verifiedPct}%</p>
        <p className="text-slate-400 mt-0.5">Scanner: {scannerPct}%</p>
      </div>
    </div>
  );
}
