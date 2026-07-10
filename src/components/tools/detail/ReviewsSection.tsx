import { Star, Quote } from 'lucide-react';
import Card from './Card';
import ToolsSectionHeader from '../ToolsSectionHeader';
import type { ReviewItem } from './types';

const AVATAR_COLORS = ['bg-indigo-100 text-indigo-600', 'bg-violet-100 text-violet-600', 'bg-emerald-100 text-emerald-600', 'bg-amber-100 text-amber-700', 'bg-rose-100 text-rose-600'];

function initialsOf(name: string): string {
  const parts = name.trim().split(/\s+/);
  return ((parts[0]?.[0] || '') + (parts[1]?.[0] || '')).toUpperCase();
}

function colorFor(name: string): string {
  const sum = name.split('').reduce((acc, ch) => acc + ch.charCodeAt(0), 0);
  return AVATAR_COLORS[sum % AVATAR_COLORS.length];
}

export default function ReviewsSection({ toolName, reviews }: { toolName: string; reviews: ReviewItem[] }) {
  if (reviews.length === 0) return null;

  const average = reviews.reduce((sum, r) => sum + r.rating, 0) / reviews.length;
  const distribution = [5, 4, 3, 2, 1].map((star) => ({
    star,
    count: reviews.filter((r) => Math.round(r.rating) === star).length,
  }));
  const maxCount = Math.max(...distribution.map((d) => d.count), 1);

  return (
    <section id="reviews" className="scroll-mt-24">
      <ToolsSectionHeader
        eyebrow="Reviews"
        title={`What people are saying about ${toolName}`}
        subtitle={`${average.toFixed(1)} average across ${reviews.length} review${reviews.length === 1 ? '' : 's'}.`}
      />

      {reviews.length > 1 && (
        <div className="flex flex-col sm:flex-row sm:items-center gap-6 bg-slate-50 rounded-2xl p-5 mb-5">
          <div className="text-center sm:text-left shrink-0">
            <p className="text-3xl font-bold text-[#0B1221] tabular-nums">{average.toFixed(1)}</p>
            <div className="flex items-center gap-0.5 justify-center sm:justify-start mt-1">
              {Array.from({ length: 5 }).map((_, i) => (
                <Star key={i} className={`w-3.5 h-3.5 ${i < Math.round(average) ? 'text-amber-500 fill-amber-500' : 'text-slate-200 fill-slate-200'}`} />
              ))}
            </div>
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
        </div>
      )}

      <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
        {reviews.map((review) => (
          <Card key={review.id} hoverLift className="p-5 flex flex-col border-l-4 border-l-amber-300 overflow-hidden">
            <Quote className="absolute -top-1 right-3 w-14 h-14 text-amber-50" aria-hidden="true" />
            <p className="relative text-[14.5px] text-slate-700 leading-relaxed italic mb-4">&ldquo;{review.quote}&rdquo;</p>
            <div className="mt-auto flex items-center justify-between gap-3 pt-3 border-t border-slate-100">
              <div className="flex items-center gap-2.5 min-w-0">
                <span className={`w-8 h-8 rounded-full flex items-center justify-center text-[11px] font-semibold shrink-0 ${colorFor(review.author_name)}`}>
                  {initialsOf(review.author_name)}
                </span>
                <div className="min-w-0">
                  <p className="text-[13px] font-semibold text-[#0B1221] truncate">{review.author_name}</p>
                  {(review.author_title || review.source) && (
                    <p className="text-[12px] text-slate-400 truncate">
                      {[review.author_title, review.source].filter(Boolean).join(' · ')}
                    </p>
                  )}
                </div>
              </div>
              <div className="inline-flex items-center gap-0.5 shrink-0" aria-label={`Rated ${review.rating} out of 5`}>
                {Array.from({ length: 5 }).map((_, i) => (
                  <Star key={i} className={`w-3.5 h-3.5 ${i < Math.round(review.rating) ? 'text-amber-500 fill-amber-500' : 'text-slate-200 fill-slate-200'}`} />
                ))}
              </div>
            </div>
          </Card>
        ))}
      </div>
    </section>
  );
}
