import { TrendingUp } from 'lucide-react';
import { normalizeDisplayedMissedCount } from '../utils/unifiedAgencyKpi';

interface AgencyAvailabilityChecksCardProps {
  missedCount: number;
  loading?: boolean;
}

export default function AgencyAvailabilityChecksCard({
  missedCount,
  loading = false,
}: AgencyAvailabilityChecksCardProps) {
  if (loading) {
    return (
      <div className="bg-slate-900 rounded-xl p-6 border border-slate-800 flex flex-col items-center justify-center min-h-[180px] animate-pulse">
        <div className="h-8 w-8 bg-slate-700 rounded-full mb-3" />
        <div className="h-4 w-32 bg-slate-700 rounded mb-2" />
        <div className="h-3 w-24 bg-slate-700 rounded mb-4" />
        <div className="h-10 w-16 bg-slate-700 rounded mb-3" />
        <div className="h-3 w-48 bg-slate-700 rounded" />
      </div>
    );
  }

  return (
    <div className="bg-gradient-to-br from-slate-900 via-slate-900 to-slate-950 rounded-xl p-6 border border-slate-800 shadow-lg flex flex-col items-center justify-center">
      <div className="flex items-center justify-center w-10 h-10 rounded-full bg-emerald-500/10 mb-3">
        <TrendingUp size={20} className="text-emerald-400" />
      </div>

      <div className="text-center mb-1">
        <div className="text-[11px] font-semibold uppercase tracking-wider text-slate-400 mb-0.5">
          Availability checks
        </div>
        <div className="text-[12px] text-slate-500">
          (last 30 days)
        </div>
      </div>

      <div className="my-3 text-4xl font-bold text-emerald-400">
        {normalizeDisplayedMissedCount(missedCount)}
      </div>

      <p className="text-[13px] text-slate-400 text-center leading-relaxed">
        Counts times businesses clicked 'Check availability' on your listing.
      </p>
    </div>
  );
}
