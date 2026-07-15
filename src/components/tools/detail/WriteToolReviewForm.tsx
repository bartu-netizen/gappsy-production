import { useState } from 'react';
import { Star, X } from 'lucide-react';
import { supabase } from '../../../lib/supabase';

interface WriteToolReviewFormProps {
  toolId: string;
  toolName: string;
  onClose: () => void;
}

// Direct anon insert, not an edge function — the tool_user_reviews INSERT
// policy forces status='pending' and validates the tool itself (see
// migration 20260715040000), so there's nothing server-side logic needs to
// add here. Deliberately never chains .select() after the insert: the
// table has no SELECT policy for anon at all (by design — reviewer_email
// must never be publicly queryable), and Postgres RLS evaluates a
// RETURNING clause against SELECT policies too, so .insert(...).select()
// would fail even for a perfectly valid pending row.
export default function WriteToolReviewForm({ toolId, toolName, onClose }: WriteToolReviewFormProps) {
  const [rating, setRating] = useState(0);
  const [hoverRating, setHoverRating] = useState(0);
  const [name, setName] = useState('');
  const [email, setEmail] = useState('');
  const [title, setTitle] = useState('');
  const [body, setBody] = useState('');
  const [submitting, setSubmitting] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [submitted, setSubmitted] = useState(false);

  async function handleSubmit(e: React.FormEvent) {
    e.preventDefault();
    if (rating === 0) {
      setError('Please choose a star rating.');
      return;
    }
    if (!name.trim() || !body.trim()) {
      setError('Please fill in your name and a review.');
      return;
    }
    setSubmitting(true);
    setError(null);
    const { error: insertError } = await supabase.from('tool_user_reviews').insert({
      tool_id: toolId,
      reviewer_name: name.trim(),
      reviewer_email: email.trim() || null,
      rating,
      title: title.trim() || null,
      body: body.trim(),
    });
    setSubmitting(false);
    if (insertError) {
      setError('Something went wrong submitting your review. Please try again.');
      return;
    }
    setSubmitted(true);
  }

  if (submitted) {
    return (
      <div className="rounded-2xl border border-emerald-100 bg-emerald-50 p-6 text-center">
        <p className="font-semibold text-emerald-800">Thanks for your review!</p>
        <p className="text-sm text-emerald-700 mt-1">
          It's been submitted for moderation and will appear here once approved.
        </p>
        <button
          type="button"
          onClick={onClose}
          className="mt-4 inline-flex items-center justify-center px-4 py-2 rounded-xl text-sm font-semibold text-white bg-emerald-600 hover:bg-emerald-700 transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-emerald-500 focus-visible:ring-offset-2"
        >
          Done
        </button>
      </div>
    );
  }

  return (
    <form onSubmit={handleSubmit} className="rounded-2xl border border-[#eef0f3] bg-white p-5 sm:p-6 space-y-4">
      <div className="flex items-center justify-between">
        <p className="font-semibold text-[#0B1221] text-[15px]">Write a review of {toolName}</p>
        <button
          type="button"
          onClick={onClose}
          aria-label="Close"
          className="w-7 h-7 rounded-full flex items-center justify-center text-slate-400 hover:text-slate-600 hover:bg-slate-100 transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-[#4F47E6]"
        >
          <X className="w-4 h-4" aria-hidden="true" />
        </button>
      </div>

      <div>
        <p className="text-[11px] font-semibold uppercase tracking-[0.08em] text-slate-400 mb-1.5">Your rating</p>
        <div className="flex items-center gap-1" onMouseLeave={() => setHoverRating(0)}>
          {Array.from({ length: 5 }).map((_, i) => {
            const value = i + 1;
            const active = value <= (hoverRating || rating);
            return (
              <button
                key={value}
                type="button"
                onClick={() => setRating(value)}
                onMouseEnter={() => setHoverRating(value)}
                aria-label={`Rate ${value} out of 5`}
                className="p-0.5 focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-[#4F47E6] rounded"
              >
                <Star className={`w-6 h-6 ${active ? 'text-amber-500 fill-amber-500' : 'text-slate-200 fill-slate-200'}`} />
              </button>
            );
          })}
        </div>
      </div>

      <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
        <div>
          <label htmlFor="review-name" className="text-[11px] font-semibold uppercase tracking-[0.08em] text-slate-400 mb-1.5 block">
            Your name
          </label>
          <input
            id="review-name"
            type="text"
            value={name}
            onChange={(e) => setName(e.target.value)}
            required
            className="w-full px-3 py-2 rounded-lg border border-slate-200 text-sm focus:outline-none focus:ring-2 focus:ring-[#4F47E6] focus:border-transparent"
            placeholder="Displayed publicly"
          />
        </div>
        <div>
          <label htmlFor="review-email" className="text-[11px] font-semibold uppercase tracking-[0.08em] text-slate-400 mb-1.5 block">
            Email <span className="normal-case font-normal text-slate-400">(private, not shown)</span>
          </label>
          <input
            id="review-email"
            type="email"
            value={email}
            onChange={(e) => setEmail(e.target.value)}
            className="w-full px-3 py-2 rounded-lg border border-slate-200 text-sm focus:outline-none focus:ring-2 focus:ring-[#4F47E6] focus:border-transparent"
            placeholder="you@example.com"
          />
        </div>
      </div>

      <div>
        <label htmlFor="review-title" className="text-[11px] font-semibold uppercase tracking-[0.08em] text-slate-400 mb-1.5 block">
          Headline <span className="normal-case font-normal text-slate-400">(optional)</span>
        </label>
        <input
          id="review-title"
          type="text"
          value={title}
          onChange={(e) => setTitle(e.target.value)}
          maxLength={120}
          className="w-full px-3 py-2 rounded-lg border border-slate-200 text-sm focus:outline-none focus:ring-2 focus:ring-[#4F47E6] focus:border-transparent"
          placeholder="Sum up your experience in a few words"
        />
      </div>

      <div>
        <label htmlFor="review-body" className="text-[11px] font-semibold uppercase tracking-[0.08em] text-slate-400 mb-1.5 block">
          Your review
        </label>
        <textarea
          id="review-body"
          value={body}
          onChange={(e) => setBody(e.target.value)}
          required
          rows={4}
          className="w-full px-3 py-2 rounded-lg border border-slate-200 text-sm focus:outline-none focus:ring-2 focus:ring-[#4F47E6] focus:border-transparent resize-none"
          placeholder="What did you use it for, and how did it go?"
        />
      </div>

      {error && <p className="text-sm text-rose-600">{error}</p>}

      <div className="flex items-center gap-3">
        <button
          type="submit"
          disabled={submitting}
          className="inline-flex items-center justify-center px-5 py-2.5 rounded-xl text-sm font-semibold text-white bg-[#4F47E6] hover:bg-[#4338CA] disabled:opacity-60 transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-[#4F47E6] focus-visible:ring-offset-2"
        >
          {submitting ? 'Submitting…' : 'Submit review'}
        </button>
        <p className="text-[11.5px] text-slate-400">Reviews are moderated before appearing publicly.</p>
      </div>
    </form>
  );
}
