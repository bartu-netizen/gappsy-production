import { useCallback, useEffect, useState } from 'react';
import { Star, Check, X, Trash2, RefreshCw } from 'lucide-react';
import WpAdminLayout from '../components/wpadmin/WpAdminLayout';
import { useAdminSession } from '../contexts/AdminSessionContext';

const SUPABASE_URL = import.meta.env.VITE_SUPABASE_URL as string;
const SUPABASE_ANON_KEY = import.meta.env.VITE_SUPABASE_ANON_KEY as string;

interface ToolReviewRow {
  id: string;
  tool_id: string;
  reviewer_name: string;
  reviewer_email: string | null;
  rating: number;
  title: string | null;
  body: string;
  status: 'pending' | 'approved' | 'rejected';
  reviewed_by: string | null;
  reviewed_at: string | null;
  created_at: string;
  tools: { name: string; slug: string } | null;
}

type StatusFilter = 'pending' | 'approved' | 'rejected';

const STATUS_TABS: { value: StatusFilter; label: string }[] = [
  { value: 'pending', label: 'Pending' },
  { value: 'approved', label: 'Approved' },
  { value: 'rejected', label: 'Rejected' },
];

// Moderation queue for tool_user_reviews (real, publicly-submitted tool
// reviews). Nothing here writes directly to Supabase — the base table has
// no RLS policy for admin reads/writes at all, so every action goes
// through admin-tool-reviews (service-role key, requireAdminSession).
export default function WpAdminToolReviewsPage() {
  const { token } = useAdminSession();
  const [status, setStatus] = useState<StatusFilter>('pending');
  const [reviews, setReviews] = useState<ToolReviewRow[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [actingId, setActingId] = useState<string | null>(null);

  const fetchReviews = useCallback(async () => {
    if (!token) return;
    setLoading(true);
    setError(null);
    try {
      const res = await fetch(`${SUPABASE_URL}/functions/v1/admin-tool-reviews?status=${status}`, {
        headers: { Authorization: `Bearer ${SUPABASE_ANON_KEY}`, 'x-admin-token': token },
      });
      const json = await res.json();
      if (!json.ok) throw new Error(json.error || 'Failed to load reviews');
      setReviews(json.data || []);
    } catch (e) {
      setError(e instanceof Error ? e.message : 'Failed to load reviews');
    } finally {
      setLoading(false);
    }
  }, [token, status]);

  useEffect(() => {
    fetchReviews();
  }, [fetchReviews]);

  async function act(reviewId: string, action: 'approve' | 'reject' | 'delete') {
    if (!token) return;
    setActingId(reviewId);
    try {
      const res = await fetch(`${SUPABASE_URL}/functions/v1/admin-tool-reviews`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json', Authorization: `Bearer ${SUPABASE_ANON_KEY}`, 'x-admin-token': token },
        body: JSON.stringify({ action, review_id: reviewId }),
      });
      const json = await res.json();
      if (!json.ok) throw new Error(json.error || 'Action failed');
      setReviews((prev) => prev.filter((r) => r.id !== reviewId));
    } catch (e) {
      setError(e instanceof Error ? e.message : 'Action failed');
    } finally {
      setActingId(null);
    }
  }

  return (
    <WpAdminLayout title="Tool Reviews" subtitle="Moderate publicly-submitted tool reviews">
      <div className="p-6 max-w-5xl mx-auto space-y-5">
        <div className="flex items-center justify-between">
          <div className="inline-flex items-center gap-1 bg-white border border-slate-200 rounded-full p-1">
            {STATUS_TABS.map((tab) => (
              <button
                key={tab.value}
                type="button"
                onClick={() => setStatus(tab.value)}
                className={`px-4 py-1.5 rounded-full text-sm font-medium transition-colors ${
                  status === tab.value ? 'bg-[#4F46E5] text-white' : 'text-slate-500 hover:text-slate-700'
                }`}
              >
                {tab.label}
              </button>
            ))}
          </div>
          <button
            type="button"
            onClick={fetchReviews}
            className="inline-flex items-center gap-1.5 text-sm text-slate-500 hover:text-slate-700 px-3 py-1.5 rounded-lg hover:bg-white transition-colors"
          >
            <RefreshCw className="w-3.5 h-3.5" />
            Refresh
          </button>
        </div>

        {error && <p className="text-sm text-rose-600 bg-rose-50 border border-rose-100 rounded-lg px-4 py-2.5">{error}</p>}

        {loading ? (
          <p className="text-sm text-slate-400">Loading…</p>
        ) : reviews.length === 0 ? (
          <p className="text-sm text-slate-400 bg-white border border-slate-200 rounded-xl p-8 text-center">No {status} reviews.</p>
        ) : (
          <div className="space-y-3">
            {reviews.map((review) => (
              <div key={review.id} className="bg-white border border-slate-200 rounded-xl p-5">
                <div className="flex items-start justify-between gap-4">
                  <div className="min-w-0">
                    <div className="flex items-center gap-2 flex-wrap mb-1">
                      <span className="font-semibold text-[#0B1221] text-sm">{review.reviewer_name}</span>
                      {review.reviewer_email && <span className="text-xs text-slate-400">{review.reviewer_email}</span>}
                      <span className="inline-flex items-center gap-0.5">
                        {Array.from({ length: 5 }).map((_, i) => (
                          <Star key={i} className={`w-3.5 h-3.5 ${i < review.rating ? 'text-amber-500 fill-amber-500' : 'text-slate-200 fill-slate-200'}`} />
                        ))}
                      </span>
                    </div>
                    <p className="text-xs text-slate-400 mb-2">
                      on{' '}
                      {review.tools ? (
                        <a href={`/tools/${review.tools.slug}`} target="_blank" rel="noreferrer" className="text-indigo-600 hover:underline">
                          {review.tools.name}
                        </a>
                      ) : (
                        'unknown tool'
                      )}
                      {' · '}
                      {new Date(review.created_at).toLocaleDateString()}
                    </p>
                    {review.title && <p className="font-medium text-[#0B1221] text-sm mb-1">{review.title}</p>}
                    <p className="text-sm text-slate-600 leading-relaxed">{review.body}</p>
                  </div>
                  <div className="flex items-center gap-2 shrink-0">
                    {status === 'pending' && (
                      <>
                        <button
                          type="button"
                          disabled={actingId === review.id}
                          onClick={() => act(review.id, 'approve')}
                          aria-label="Approve"
                          className="w-9 h-9 rounded-full bg-emerald-50 text-emerald-600 hover:bg-emerald-100 flex items-center justify-center transition-colors disabled:opacity-50"
                        >
                          <Check className="w-4 h-4" />
                        </button>
                        <button
                          type="button"
                          disabled={actingId === review.id}
                          onClick={() => act(review.id, 'reject')}
                          aria-label="Reject"
                          className="w-9 h-9 rounded-full bg-amber-50 text-amber-600 hover:bg-amber-100 flex items-center justify-center transition-colors disabled:opacity-50"
                        >
                          <X className="w-4 h-4" />
                        </button>
                      </>
                    )}
                    <button
                      type="button"
                      disabled={actingId === review.id}
                      onClick={() => act(review.id, 'delete')}
                      aria-label="Delete"
                      className="w-9 h-9 rounded-full bg-rose-50 text-rose-600 hover:bg-rose-100 flex items-center justify-center transition-colors disabled:opacity-50"
                    >
                      <Trash2 className="w-4 h-4" />
                    </button>
                  </div>
                </div>
              </div>
            ))}
          </div>
        )}
      </div>
    </WpAdminLayout>
  );
}
