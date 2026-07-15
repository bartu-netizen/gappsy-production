import { useState } from 'react';
import { Star, MessageSquarePlus } from 'lucide-react';
import Card from './Card';
import ToolsSectionHeader from '../ToolsSectionHeader';
import WriteToolReviewForm from './WriteToolReviewForm';
import { formatLastUpdated } from '../../../utils/formatLastUpdated';
import type { ReviewItem } from './types';

const AVATAR_COLORS = ['bg-[#DEE3EF] text-[#0A1735]', 'bg-violet-100 text-violet-600', 'bg-emerald-100 text-emerald-600', 'bg-amber-100 text-amber-700', 'bg-rose-100 text-rose-600'];

function initialsOf(name: string): string {
  const parts = name.trim().split(/\s+/);
  return ((parts[0]?.[0] || '') + (parts[1]?.[0] || '')).toUpperCase();
}

function colorFor(name: string): string {
  const sum = name.split('').reduce((acc, ch) => acc + ch.charCodeAt(0), 0);
  return AVATAR_COLORS[sum % AVATAR_COLORS.length];
}

// Real, publicly-submitted reviews (tool_user_reviews_public — approved
// only) rendered Trustpilot-style: aggregate score + star-distribution
// bars, then individual cards. Unlike most sections on this page, an empty
// state is NOT "render nothing" — a review section that only ever appears
// once populated can never bootstrap itself, so a 0-review tool instead
// shows an invitation to be the first.
export default function ReviewsSection({ toolId, toolName, reviews }: { toolId: string; toolName: string; reviews: ReviewItem[] }) {
  const [writing, setWriting] = useState(false);
  const average = reviews.length > 0 ? reviews.reduce((sum, r) => sum + r.rating, 0) / reviews.length : 0;
  const distribution = [5, 4, 3, 2, 1].map((star) => ({
    star,
    count: reviews.filter((r) => Math.round(r.rating) === star).length,
  }));
  const maxCount = Math.max(...distribution.map((d) => d.count), 1);

  return (
    <section>
      <ToolsSectionHeader
        eyebrow="Reviews"
        title={`What people are saying about ${toolName}`}
        subtitle={
          reviews.length > 0
            ? `${average.toFixed(1)} average across ${reviews.length} review${reviews.length === 1 ? '' : 's'}.`
            : `No reviews yet — be the first to share your experience.`
        }
      />

      {reviews.length > 0 && (
        <div className="flex flex-col sm:flex-row sm:items-center gap-6 bg-slate-50 rounded-2xl p-5 mb-5">
          <div className="text-center sm:text-left shrink-0">
            <p className="text-3xl font-bold text-[#0B1221] tabular-nums">{average.toFixed(1)}</p>
            <div className="flex items-center gap-0.5 justify-center sm:justify-start mt-1">
              {Array.from({ length: 5 }).map((_, i) => (
                <Star key={i} className={`w-3.5 h-3.5 ${i < Math.round(average) ? 'text-amber-500 fill-amber-500' : 'text-slate-200 fill-slate-200'}`} />
              ))}
            </div>
            <p className="text-xs text-slate-400 mt-1">{reviews.length} review{reviews.length === 1 ? '' : 's'}</p>
          </div>
          <div className="flex-1 space-y-1.5 min-w-0">
            {distribution.map(({ star, count }) => (
              <div key={star} className="flex items-center gap-2 text-xs text-slate-500">
                <span className="w-8 shrink-0 tabular-nums">{star}★</span>
                <div className="flex-1 h-1.5 rounded-full bg-slate-200 overflow-hidden">
                  <div className="h-full bg-amber-400 rounded-full" style={{ width: `${(count / maxCount) * 100}%` }} />
                </div>
                <span className="w-5 shrink-0 text-right tabular-nums">{count}</span>
              </div>
            ))}
          </div>
          <button
            type="button"
            onClick={() => setWriting(true)}
            className="inline-flex items-center justify-center gap-1.5 px-4 py-2.5 rounded-xl text-sm font-semibold text-white bg-[#2952CC] hover:bg-[#1F3FA3] transition-colors shrink-0 focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-[#0A1735] focus-visible:ring-offset-2"
          >
            <MessageSquarePlus className="w-4 h-4" aria-hidden="true" />
            Write a review
          </button>
        </div>
      )}

      {writing && (
        <div className="mb-5">
          <WriteToolReviewForm toolId={toolId} toolName={toolName} onClose={() => setWriting(false)} />
        </div>
      )}

      {reviews.length === 0 && !writing && (
        <div className="rounded-2xl border border-dashed border-slate-200 bg-slate-50/60 p-8 text-center">
          <p className="text-slate-500 text-sm mb-4">Nobody has reviewed {toolName} yet.</p>
          <button
            type="button"
            onClick={() => setWriting(true)}
            className="inline-flex items-center justify-center gap-1.5 px-5 py-2.5 rounded-xl text-sm font-semibold text-white bg-[#2952CC] hover:bg-[#1F3FA3] transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-[#0A1735] focus-visible:ring-offset-2"
          >
            <MessageSquarePlus className="w-4 h-4" aria-hidden="true" />
            Be the first to review it
          </button>
        </div>
      )}

      {reviews.length > 0 && (
        <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
          {reviews.map((review) => (
            <Card key={review.id} className="p-5 flex flex-col">
              <div className="flex items-center justify-between gap-3 mb-3">
                <div className="flex items-center gap-2.5 min-w-0">
                  <span className={`w-8 h-8 rounded-full flex items-center justify-center text-[11px] font-semibold shrink-0 ${colorFor(review.reviewer_name)}`}>
                    {initialsOf(review.reviewer_name)}
                  </span>
                  <div className="min-w-0">
                    <p className="text-[13px] font-semibold text-[#0B1221] truncate">{review.reviewer_name}</p>
                    {review.created_at && <p className="text-[11.5px] text-slate-400">{formatLastUpdated(review.created_at)}</p>}
                  </div>
                </div>
                <div className="inline-flex items-center gap-0.5 shrink-0" aria-label={`Rated ${review.rating} out of 5`}>
                  {Array.from({ length: 5 }).map((_, i) => (
                    <Star key={i} className={`w-3.5 h-3.5 ${i < review.rating ? 'text-amber-500 fill-amber-500' : 'text-slate-200 fill-slate-200'}`} />
                  ))}
                </div>
              </div>
              {review.title && <p className="font-semibold text-[#0B1221] text-[14px] mb-1">{review.title}</p>}
              <p className="text-[14px] text-slate-600 leading-relaxed">{review.body}</p>
            </Card>
          ))}
        </div>
      )}
    </section>
  );
}
