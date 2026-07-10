import { useState } from 'react';
import { Link } from 'react-router-dom';
import { ShieldCheck, Star, ExternalLink, Bookmark, Share2, GitCompareArrows, Flame, Sparkles } from 'lucide-react';
import { Badge } from '../../Badge';
import { useBookmarkedTool } from '../../../hooks/useBookmarkedTools';
import type { TaxonomyRef } from './types';

interface ToolHeroProps {
  slug: string;
  name: string;
  logo: string | null;
  shortDescription: string | null;
  verified: boolean;
  featured: boolean;
  trending: boolean;
  hasAI: boolean;
  rating: number;
  reviewCount: number;
  pricingModel: string | null;
  startingPrice: string | null;
  primaryCategory: TaxonomyRef | null;
  updatedAt: string | null;
  websiteUrl: string | null;
  affiliateUrl: string | null;
}

function formatUpdatedDate(iso: string | null): string | null {
  if (!iso) return null;
  try {
    return new Date(iso).toLocaleDateString('en-US', { year: 'numeric', month: 'long', day: 'numeric' });
  } catch {
    return null;
  }
}

export default function ToolHero({
  slug,
  name,
  logo,
  shortDescription,
  verified,
  featured,
  trending,
  hasAI,
  rating,
  reviewCount,
  pricingModel,
  startingPrice,
  primaryCategory,
  updatedAt,
  websiteUrl,
  affiliateUrl,
}: ToolHeroProps) {
  const { bookmarked, toggle: toggleBookmark } = useBookmarkedTool(slug);
  const [compareAdded, setCompareAdded] = useState(false);
  const [shareState, setShareState] = useState<'idle' | 'copied'>('idle');

  const cta = affiliateUrl || websiteUrl;
  const updatedLabel = formatUpdatedDate(updatedAt);

  async function handleShare() {
    const url = window.location.href;
    if (navigator.share) {
      try {
        await navigator.share({ title: name, url });
        return;
      } catch {
        // user cancelled the native share sheet — fall through to clipboard
      }
    }
    try {
      await navigator.clipboard.writeText(url);
      setShareState('copied');
      setTimeout(() => setShareState('idle'), 2000);
    } catch {
      // clipboard unavailable — nothing more we can do silently
    }
  }

  return (
    <section className="max-w-6xl mx-auto px-4 sm:px-6 pt-6 sm:pt-10 pb-8 relative overflow-hidden">
      <div
        className="absolute inset-x-0 top-0 h-64 -z-10 opacity-60"
        style={{ background: 'radial-gradient(60% 100% at 50% 0%, rgba(79,70,229,0.08), transparent)' }}
        aria-hidden="true"
      />

      <div className="flex flex-col sm:flex-row sm:items-start gap-6">
        {logo ? (
          <img src={logo} alt={name} className="w-20 h-20 sm:w-24 sm:h-24 rounded-2xl object-contain border border-slate-100 bg-white shadow-sm shrink-0" />
        ) : (
          <div className="w-20 h-20 sm:w-24 sm:h-24 rounded-2xl bg-indigo-50 flex items-center justify-center text-indigo-400 font-bold text-3xl shrink-0">
            {name.charAt(0)}
          </div>
        )}

        <div className="flex-1 min-w-0">
          <div className="flex items-center gap-2 flex-wrap mb-1">
            <h1 className="text-3xl sm:text-[40px] font-bold text-[#0B1221] leading-tight tracking-tight">{name}</h1>
            {verified && <ShieldCheck className="w-6 h-6 text-indigo-500 shrink-0" aria-label="Verified" />}
          </div>

          <div className="flex items-center gap-2 flex-wrap mb-3">
            {featured && <Badge className="bg-amber-100 text-amber-700">Featured</Badge>}
            {trending && (
              <Badge className="bg-rose-50 text-rose-600">
                <Flame className="w-3 h-3 mr-1 inline -mt-0.5" />
                Trending
              </Badge>
            )}
            {hasAI && (
              <Badge className="bg-violet-50 text-violet-600">
                <Sparkles className="w-3 h-3 mr-1 inline -mt-0.5" />
                AI-Powered
              </Badge>
            )}
            {primaryCategory && (
              <Link
                to={`/tool-categories/${primaryCategory.slug}`}
                className="inline-flex items-center text-xs font-medium bg-indigo-50 text-indigo-700 px-2.5 py-1 rounded-full hover:bg-indigo-100 transition-colors"
              >
                {primaryCategory.name}
              </Link>
            )}
          </div>

          {shortDescription && (
            <p className="text-slate-600 text-[15px] sm:text-lg leading-relaxed max-w-2xl mb-3">{shortDescription}</p>
          )}

          <div className="flex items-center gap-4 flex-wrap text-sm">
            {rating > 0 && (
              <span className="inline-flex items-center gap-1 text-slate-600">
                <Star className="w-4 h-4 text-amber-500 fill-amber-500" />
                <span className="font-semibold text-[#0B1221]">{rating.toFixed(1)}</span>
                {reviewCount > 0 ? (
                  <span className="text-slate-400">({reviewCount.toLocaleString()} reviews)</span>
                ) : (
                  <span className="text-slate-400">editorial rating</span>
                )}
              </span>
            )}
            {(pricingModel || startingPrice) && (
              <span className="text-slate-500">
                {pricingModel}
                {pricingModel && startingPrice ? ' · ' : ''}
                {startingPrice && <span className="font-medium text-slate-700">From {startingPrice}</span>}
              </span>
            )}
            {updatedLabel && <span className="text-slate-400">Updated {updatedLabel}</span>}
          </div>
        </div>

        <div className="flex flex-col gap-2 sm:items-end shrink-0 w-full sm:w-auto">
          {cta && (
            <a
              href={cta}
              target="_blank"
              rel="noopener noreferrer nofollow"
              className="inline-flex items-center justify-center gap-1.5 bg-[#4F46E5] hover:bg-[#4338CA] text-white px-6 py-3 rounded-full font-semibold transition-colors text-sm w-full sm:w-auto"
            >
              Visit Website
              <ExternalLink className="w-3.5 h-3.5" />
            </a>
          )}
          {websiteUrl && affiliateUrl && websiteUrl !== affiliateUrl && (
            <a
              href={websiteUrl}
              target="_blank"
              rel="noopener noreferrer nofollow"
              className="inline-flex items-center justify-center gap-1.5 text-indigo-600 hover:text-indigo-700 px-6 py-2 rounded-full font-medium transition-colors text-xs w-full sm:w-auto"
            >
              Official Website
            </a>
          )}

          <div className="flex items-center gap-1.5 mt-1 self-end">
            <button
              type="button"
              onClick={toggleBookmark}
              aria-pressed={bookmarked}
              aria-label={bookmarked ? 'Remove bookmark' : 'Bookmark this tool'}
              className={`p-2 rounded-full border transition-colors ${bookmarked ? 'bg-indigo-50 border-indigo-200 text-indigo-600' : 'border-slate-200 text-slate-400 hover:text-slate-600 hover:border-slate-300'}`}
            >
              <Bookmark className={`w-4 h-4 ${bookmarked ? 'fill-indigo-600' : ''}`} />
            </button>
            <button
              type="button"
              onClick={handleShare}
              aria-label="Share this tool"
              className="p-2 rounded-full border border-slate-200 text-slate-400 hover:text-slate-600 hover:border-slate-300 transition-colors relative"
            >
              <Share2 className="w-4 h-4" />
              {shareState === 'copied' && (
                <span className="absolute -bottom-7 right-0 text-[11px] font-medium text-white bg-slate-800 px-2 py-1 rounded-md whitespace-nowrap">
                  Link copied
                </span>
              )}
            </button>
            <button
              type="button"
              onClick={() => setCompareAdded((v) => !v)}
              aria-pressed={compareAdded}
              aria-label={compareAdded ? 'Remove from comparison' : 'Add to comparison'}
              className={`p-2 rounded-full border transition-colors ${compareAdded ? 'bg-indigo-50 border-indigo-200 text-indigo-600' : 'border-slate-200 text-slate-400 hover:text-slate-600 hover:border-slate-300'}`}
            >
              <GitCompareArrows className="w-4 h-4" />
            </button>
          </div>
        </div>
      </div>
    </section>
  );
}
