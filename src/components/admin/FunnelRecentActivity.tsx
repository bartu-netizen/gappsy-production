import { useEffect, useState } from 'react';
import { Activity, Zap } from 'lucide-react';
import { adminApiFetch } from '../../lib/adminApiFetch';
import { AdminTimestamp } from './AdminTimestamp';
import { useTimestampRefresh } from '../../hooks/useTimestampRefresh';

interface ActivityItem {
  id: string;
  agency_name: string;
  agency_slug: string;
  fsid: string;
  stage: string;
  step_number: number | null;
  step_label: string;
  last_event_at: string | null;
  created_at: string;
  purchased_product: string | null;
  purchased_amount: number | null;
}

const STAGE_COLORS: Record<string, { dot: string; text: string }> = {
  paid: { dot: 'bg-emerald-500', text: 'text-emerald-700' },
  checkout_started: { dot: 'bg-amber-500', text: 'text-amber-700' },
  submitted: { dot: 'bg-sky-500', text: 'text-sky-700' },
  opened: { dot: 'bg-slate-400', text: 'text-slate-600' },
};

export function FunnelRecentActivity({
  apiQueryString,
  token,
  onSelectAgency,
}: {
  apiQueryString: string;
  token: string;
  onSelectAgency: (slug: string, name: string) => void;
}) {
  useTimestampRefresh();
  const [items, setItems] = useState<ActivityItem[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    (async () => {
      setLoading(true);
      const res = await adminApiFetch<{ activity: ActivityItem[] }>(
        `agency-funnel-analytics?action=recent_activity&${apiQueryString}&limit=30`,
        { headers: { 'x-admin-token': token } }
      );
      if (res.ok && res.data) {
        setItems(res.data.activity);
      }
      setLoading(false);
    })();
  }, [apiQueryString, token]);

  if (loading) {
    return (
      <div className="bg-white border border-slate-200 rounded-xl p-6">
        <div className="flex items-center gap-2 mb-4">
          <Activity className="w-4 h-4 text-slate-400" />
          <span className="text-sm font-semibold text-slate-700">Recent Activity</span>
        </div>
        <div className="space-y-3">
          {[1, 2, 3, 4, 5].map((i) => (
            <div key={i} className="flex items-center gap-3 animate-pulse">
              <div className="w-2 h-2 rounded-full bg-slate-200" />
              <div className="flex-1 h-4 bg-slate-100 rounded" />
              <div className="w-24 h-3 bg-slate-100 rounded" />
            </div>
          ))}
        </div>
      </div>
    );
  }

  if (items.length === 0) {
    return (
      <div className="bg-white border border-slate-200 rounded-xl p-6">
        <div className="flex items-center gap-2 mb-3">
          <Activity className="w-4 h-4 text-slate-400" />
          <span className="text-sm font-semibold text-slate-700">Recent Activity</span>
        </div>
        <p className="text-xs text-slate-400 text-center py-4">No funnel activity in this period</p>
      </div>
    );
  }

  return (
    <div className="bg-white border border-slate-200 rounded-xl overflow-hidden">
      <div className="px-4 py-3 border-b border-slate-100 flex items-center gap-2">
        <Activity className="w-4 h-4 text-slate-400" />
        <span className="text-sm font-semibold text-slate-700">Recent Activity</span>
        <span className="ml-auto text-[10px] text-slate-400">{items.length} sessions</span>
      </div>

      <div className="divide-y divide-slate-50 max-h-[400px] overflow-y-auto">
        {items.map((item) => {
          const colors = STAGE_COLORS[item.stage] ?? STAGE_COLORS.opened;
          const ts = item.last_event_at ?? item.created_at;
          return (
            <button
              key={item.id}
              onClick={() => onSelectAgency(item.agency_slug, item.agency_name)}
              className="w-full px-4 py-2.5 flex items-center gap-3 hover:bg-slate-50/50 transition-colors text-left"
            >
              <span className={`w-2 h-2 rounded-full flex-shrink-0 ${colors.dot}`} />
              <div className="flex-1 min-w-0">
                <div className="flex items-center gap-1.5">
                  <span className="text-xs font-medium text-slate-900 truncate max-w-[160px]">
                    {item.agency_name}
                  </span>
                  <span className="text-slate-300">&mdash;</span>
                  <span className={`text-[11px] ${colors.text} truncate`}>
                    {item.step_label}
                  </span>
                  {item.stage === 'paid' && (
                    <Zap className="w-3 h-3 text-emerald-500 flex-shrink-0" />
                  )}
                </div>
                {item.stage === 'paid' && item.purchased_product && (
                  <span className="text-[10px] text-emerald-600">
                    {item.purchased_product}
                    {item.purchased_amount ? ` ($${(item.purchased_amount / 100).toFixed(0)})` : ''}
                  </span>
                )}
              </div>
              <div className="flex-shrink-0 text-right">
                <AdminTimestamp iso={ts} className="text-[10px] text-slate-400" />
              </div>
            </button>
          );
        })}
      </div>
    </div>
  );
}
