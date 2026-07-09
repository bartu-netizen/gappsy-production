import { useState, useCallback, useEffect } from 'react';
import { Tag, Copy, Check, ExternalLink, RefreshCw, Loader2, AlertCircle, Percent, DollarSign, Zap, Brain } from 'lucide-react';
import { getDiscountPercentage, DEFAULT_DISCOUNT_PERCENTAGE } from '../../utils/discountTiers';

const SUPABASE_URL = import.meta.env.VITE_SUPABASE_URL as string;
const SUPABASE_ANON_KEY = import.meta.env.VITE_SUPABASE_ANON_KEY as string;

interface CreatedOffer {
  id: string;
  token: string;
  url: string;
  discount_type: 'percentage' | 'fixed';
  discount_value: number;
  allowed_products: string[];
  expires_at: string | null;
  max_uses: number;
}

interface DiscountLinkPanelProps {
  agencyId: string;
  agencyName: string;
  agencySlug: string | null;
  stateSlug: string;
  intentScore?: number | null;
  tierUrl15?: string | null;
  tierUrl20?: string | null;
  tierUrl25?: string | null;
  activationDirectLink?: string | null;
}

const PRODUCT_OPTIONS = [
  { value: 'all', label: 'Entire funnel', description: 'All products' },
  { value: 'top25', label: 'Top 25 listing', description: 'Paid placement' },
  { value: 'spotlight', label: 'Spotlight', description: 'Featured spot' },
  { value: 'activation', label: 'Activation only', description: 'Profile activation' },
];

export default function DiscountLinkPanel({
  agencyId,
  agencyName,
  agencySlug,
  stateSlug,
  intentScore,
  tierUrl15,
  tierUrl20,
  tierUrl25,
  activationDirectLink,
}: DiscountLinkPanelProps) {
  const [fetchedIntent, setFetchedIntent] = useState<number | null>(null);

  useEffect(() => {
    if (intentScore != null || !agencyId || !stateSlug) return;
    const adminToken = localStorage.getItem('gappsy_admin_token');
    if (!adminToken) return;
    (async () => {
      try {
        const res = await fetch(
          `${SUPABASE_URL}/functions/v1/agency-intent-scores?state_slug=${encodeURIComponent(stateSlug)}&agency_id=${encodeURIComponent(agencyId)}`,
          {
            headers: {
              'Authorization': `Bearer ${SUPABASE_ANON_KEY}`,
              'apikey': SUPABASE_ANON_KEY,
              'x-admin-token': adminToken,
            },
          }
        );
        const data = await res.json();
        if (data?.ok && Array.isArray(data.scores) && data.scores.length > 0) {
          setFetchedIntent(data.scores[0].activity_score ?? null);
        }
      } catch {}
    })();
  }, [agencyId, stateSlug, intentScore]);

  const resolvedIntent = intentScore ?? fetchedIntent;
  const suggestedDiscount = resolvedIntent != null ? getDiscountPercentage(resolvedIntent) : DEFAULT_DISCOUNT_PERCENTAGE;
  const [discountType, setDiscountType] = useState<'percentage' | 'fixed'>('percentage');
  const [discountValue, setDiscountValue] = useState('');
  const [selectedProducts, setSelectedProducts] = useState<string[]>(['all']);
  const [expiresAt, setExpiresAt] = useState('');
  const [maxUses, setMaxUses] = useState('1');
  const [internalNote, setInternalNote] = useState('');

  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [createdOffer, setCreatedOffer] = useState<CreatedOffer | null>(null);
  const [copied, setCopied] = useState(false);

  const toggleProduct = useCallback((value: string) => {
    setSelectedProducts(prev => {
      if (value === 'all') return ['all'];
      const without = prev.filter(p => p !== 'all');
      if (without.includes(value)) {
        const next = without.filter(p => p !== value);
        return next.length === 0 ? ['all'] : next;
      }
      return [...without, value];
    });
  }, []);

  const handleCreate = useCallback(async () => {
    const numVal = parseFloat(discountValue);
    if (!discountValue || isNaN(numVal) || numVal <= 0) {
      setError('Please enter a valid discount value greater than 0');
      return;
    }
    if (discountType === 'percentage' && numVal > 100) {
      setError('Percentage cannot exceed 100');
      return;
    }

    const adminToken = localStorage.getItem('gappsy_admin_token');
    if (!adminToken) {
      setError('Admin session not found. Please log in again.');
      return;
    }

    setLoading(true);
    setError(null);

    try {
      const body: Record<string, unknown> = {
        agency_id: agencyId,
        agency_slug: agencySlug,
        state_slug: stateSlug,
        discount_type: discountType,
        discount_value: numVal,
        allowed_products: selectedProducts,
        max_uses: parseInt(maxUses || '1', 10),
      };

      if (expiresAt) body.expires_at = new Date(expiresAt).toISOString();
      if (internalNote.trim()) body.internal_note = internalNote.trim();
      if (resolvedIntent != null) body.intent_score_at_creation = Math.round(resolvedIntent);

      const res = await fetch(`${SUPABASE_URL}/functions/v1/discount-offer-create`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'Authorization': `Bearer ${SUPABASE_ANON_KEY}`,
          'apikey': SUPABASE_ANON_KEY,
          'x-admin-token': adminToken,
        },
        body: JSON.stringify(body),
      });

      const data = await res.json();

      if (!res.ok || !data.ok) {
        setError(data.error || data.message || 'Failed to create discount offer');
        return;
      }

      setCreatedOffer(data.offer);
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Network error');
    } finally {
      setLoading(false);
    }
  }, [agencyId, agencySlug, stateSlug, discountType, discountValue, selectedProducts, expiresAt, maxUses, internalNote]);

  const fullUrl = createdOffer
    ? `${window.location.origin}${createdOffer.url}`
    : null;

  const handleCopy = useCallback(async () => {
    if (!fullUrl) return;
    await navigator.clipboard.writeText(fullUrl);
    setCopied(true);
    setTimeout(() => setCopied(false), 2000);
  }, [fullUrl]);

  const handleReset = useCallback(() => {
    setCreatedOffer(null);
    setError(null);
    setDiscountValue('');
    setExpiresAt('');
    setInternalNote('');
    setMaxUses('1');
    setSelectedProducts(['all']);
    setDiscountType('percentage');
  }, []);

  const [quickTier, setQuickTier] = useState<'none' | '15' | '20' | '25'>('none');
  const [quickCopied, setQuickCopied] = useState(false);

  const quickTierUrl: string | null = quickTier === 'none'
    ? (activationDirectLink ?? null)
    : quickTier === '15' ? (tierUrl15 ?? null)
    : quickTier === '20' ? (tierUrl20 ?? null)
    : (tierUrl25 ?? null);

  const handleQuickCopy = useCallback(async () => {
    if (!quickTierUrl) return;
    await navigator.clipboard.writeText(quickTierUrl);
    setQuickCopied(true);
    setTimeout(() => setQuickCopied(false), 2000);
  }, [quickTierUrl]);

  const applyActivationPreset = useCallback(() => {
    setDiscountType('percentage');
    setDiscountValue(String(suggestedDiscount));
    setSelectedProducts(['activation']);
    setMaxUses('1');
    const thirtyDays = new Date();
    thirtyDays.setDate(thirtyDays.getDate() + 30);
    setExpiresAt(thirtyDays.toISOString().split('T')[0]);
    setInternalNote(resolvedIntent != null
      ? `Intent-based discount: ${suggestedDiscount}% (score: ${Math.round(resolvedIntent)})`
      : 'Activation checkout link (v1)');
    setError(null);
  }, [suggestedDiscount, resolvedIntent]);

  return (
    <div className="bg-white rounded-2xl border border-slate-200 shadow-sm overflow-hidden">
      <div className="px-6 py-4 border-b border-slate-100">
        <div className="flex items-start justify-between gap-3">
          <div>
            <h3 className="text-sm font-semibold text-slate-800 flex items-center gap-2">
              <Tag className="w-4 h-4 text-slate-400" />
              Create Discount Link
            </h3>
            <p className="text-xs text-slate-400 mt-0.5">
              Generate a tokenized URL for <span className="font-medium text-slate-600">{agencyName}</span> — discount applies automatically at checkout.
            </p>
          </div>
        </div>
      </div>

      {createdOffer && fullUrl ? (
        <div className="p-6 space-y-5">
          <div className="flex items-center gap-4 p-4 bg-slate-50 border border-slate-100 rounded-xl">
            <div className="w-9 h-9 bg-emerald-100 rounded-lg flex items-center justify-center shrink-0">
              <Tag className="w-4 h-4 text-emerald-600" />
            </div>
            <div className="min-w-0 flex-1">
              <p className="text-sm font-semibold text-slate-800">
                {createdOffer.discount_type === 'percentage'
                  ? `${createdOffer.discount_value}% off`
                  : `$${createdOffer.discount_value} off`}
                {!createdOffer.allowed_products.includes('all') && (
                  <span className="text-slate-500 font-normal ml-1.5">— {createdOffer.allowed_products.join(', ')}</span>
                )}
              </p>
              <p className="text-xs text-slate-400 mt-0.5">
                {createdOffer.max_uses === 1 ? 'Single-use' : `Up to ${createdOffer.max_uses} uses`}
                {createdOffer.expires_at
                  ? ` · Expires ${new Date(createdOffer.expires_at).toLocaleDateString('en-US', { month: 'short', day: 'numeric', year: 'numeric' })}`
                  : ' · No expiration'}
              </p>
            </div>
            <span className="text-[10px] font-semibold text-emerald-700 bg-emerald-50 border border-emerald-200 px-2 py-1 rounded-full uppercase tracking-wide shrink-0">
              Created
            </span>
          </div>

          <div>
            <p className="text-[10px] font-semibold text-slate-400 uppercase tracking-widest mb-2">Generated link</p>
            <div className="bg-slate-50 border border-slate-100 rounded-lg px-4 py-3 mb-3">
              <code className="text-xs text-slate-500 font-mono break-all">{fullUrl}</code>
            </div>
            <div className="flex gap-2">
              <button
                onClick={handleCopy}
                className="flex-1 flex items-center justify-center gap-2 bg-slate-800 hover:bg-slate-900 text-white font-semibold py-2.5 px-4 rounded-xl transition-colors text-sm"
              >
                {copied ? (
                  <><Check className="w-4 h-4 text-emerald-400" /> Copied!</>
                ) : (
                  <><Copy className="w-4 h-4" /> Copy Link</>
                )}
              </button>
              <a
                href={fullUrl}
                target="_blank"
                rel="noopener noreferrer"
                className="flex items-center gap-2 bg-slate-50 hover:bg-slate-100 border border-slate-200 text-slate-700 font-semibold py-2.5 px-4 rounded-xl transition-colors text-sm"
              >
                <ExternalLink className="w-4 h-4" />
                Open
              </a>
              <button
                onClick={handleReset}
                className="flex items-center gap-2 bg-slate-50 hover:bg-slate-100 border border-slate-200 text-slate-600 font-semibold py-2.5 px-3 rounded-xl transition-colors text-sm"
                title="Create new offer"
              >
                <RefreshCw className="w-4 h-4" />
              </button>
            </div>
          </div>
        </div>
      ) : (
        <div className="p-6 space-y-5">
          {error && (
            <div className="flex items-center gap-2.5 bg-red-50 border border-red-200 rounded-lg px-4 py-3">
              <AlertCircle className="w-4 h-4 text-red-500 shrink-0" />
              <p className="text-sm text-red-700">{error}</p>
            </div>
          )}

          {resolvedIntent != null && (
            <div className="flex items-center gap-2.5 bg-blue-50 border border-blue-200 rounded-lg px-4 py-2.5">
              <Brain className="w-4 h-4 text-blue-500 shrink-0" />
              <p className="text-xs text-blue-800">
                Suggested discount: <span className="font-bold">{suggestedDiscount}%</span>
                <span className="text-blue-500 ml-1">(intent score: {Math.round(resolvedIntent)})</span>
              </p>
            </div>
          )}

          {/* Quick: Activation Checkout Link with tier selector */}
          <div className="bg-emerald-50 border border-emerald-200 rounded-xl p-3.5 space-y-2.5">
            <div className="flex items-center gap-2">
              <Zap className="w-3.5 h-3.5 text-emerald-700 shrink-0" />
              <span className="text-xs font-semibold text-emerald-800">Quick: Activation Checkout Link</span>
            </div>
            {!stateSlug ? (
              <p className="text-[10px] text-amber-700 italic">State missing — discount quick links disabled until state is resolved.</p>
            ) : (
              <>
                <div className="flex items-center gap-2">
                  <span className="text-[10px] font-medium text-emerald-700 shrink-0">Discount:</span>
                  <div className="flex gap-1">
                    {(['none', '15', '20', '25'] as const).map((tier) => {
                      const isActive = quickTier === tier;
                      const label = tier === 'none' ? 'No discount' : `${tier}%`;
                      return (
                        <button
                          key={tier}
                          onClick={() => setQuickTier(tier)}
                          className={`text-[10px] font-medium px-2 py-1 rounded-md border transition-colors ${
                            isActive
                              ? 'bg-emerald-700 text-white border-emerald-700'
                              : 'bg-white text-emerald-700 border-emerald-200 hover:border-emerald-300'
                          }`}
                        >
                          {label}
                        </button>
                      );
                    })}
                  </div>
                </div>
                {quickTierUrl ? (
                  <div className="space-y-1.5">
                    <p className="text-[10px] font-mono text-emerald-600 break-all leading-relaxed">{quickTierUrl}</p>
                    <div className="flex gap-1.5">
                      <button
                        onClick={handleQuickCopy}
                        className="inline-flex items-center gap-1 text-[11px] font-medium text-emerald-800 px-2.5 py-1 rounded-lg border border-emerald-200 bg-white hover:bg-emerald-50 transition-colors"
                      >
                        {quickCopied ? <Check className="w-3 h-3 text-emerald-500" /> : <Copy className="w-3 h-3" />}
                        {quickCopied ? 'Copied' : 'Copy Link'}
                      </button>
                      <a
                        href={quickTierUrl}
                        target="_blank"
                        rel="noopener noreferrer"
                        className="inline-flex items-center gap-1 text-[11px] font-medium text-emerald-800 px-2.5 py-1 rounded-lg border border-emerald-200 bg-white hover:bg-emerald-50 transition-colors"
                      >
                        <ExternalLink className="w-3 h-3" />
                        Open
                      </a>
                    </div>
                    {quickTier !== 'none' && (
                      <p className="text-[9px] text-emerald-600/70">Uses the same token as the Discount Links section.</p>
                    )}
                  </div>
                ) : (
                  <p className="text-[10px] text-emerald-600/70 italic">
                    {quickTier === 'none'
                      ? 'Activation direct link not available.'
                      : `${quickTier}% token unavailable for this agency/state.`}
                  </p>
                )}
              </>
            )}
          </div>

          <button
            type="button"
            onClick={applyActivationPreset}
            className="w-full flex items-center justify-center gap-2 bg-slate-50 hover:bg-slate-100 border border-slate-200 text-slate-600 font-medium py-2 px-4 rounded-xl transition-colors text-[11px]"
          >
            <Tag className="w-3 h-3" />
            Or create custom one-off discount link below
          </button>

          {/* Discount type + value */}
          <div className="grid grid-cols-2 gap-4">
            <div>
              <label className="block text-xs font-semibold text-slate-500 mb-2">Discount type</label>
              <div className="flex rounded-lg border border-slate-200 overflow-hidden bg-slate-50 p-0.5 gap-0.5">
                <button
                  onClick={() => setDiscountType('percentage')}
                  className={`flex-1 flex items-center justify-center gap-1.5 py-1.5 text-xs font-semibold rounded-md transition-all ${
                    discountType === 'percentage'
                      ? 'bg-white text-slate-800 shadow-sm border border-slate-200'
                      : 'text-slate-500 hover:text-slate-700'
                  }`}
                >
                  <Percent className="w-3 h-3" />
                  Percent
                </button>
                <button
                  onClick={() => setDiscountType('fixed')}
                  className={`flex-1 flex items-center justify-center gap-1.5 py-1.5 text-xs font-semibold rounded-md transition-all ${
                    discountType === 'fixed'
                      ? 'bg-white text-slate-800 shadow-sm border border-slate-200'
                      : 'text-slate-500 hover:text-slate-700'
                  }`}
                >
                  <DollarSign className="w-3 h-3" />
                  Fixed $
                </button>
              </div>
            </div>
            <div>
              <label className="block text-xs font-semibold text-slate-500 mb-2">
                Value ({discountType === 'percentage' ? '%' : 'USD'})
              </label>
              <div className="relative">
                <span className="absolute left-3 top-1/2 -translate-y-1/2 text-slate-400 text-sm font-medium pointer-events-none">
                  {discountType === 'percentage' ? '%' : '$'}
                </span>
                <input
                  type="number"
                  min="1"
                  max={discountType === 'percentage' ? '100' : undefined}
                  step="1"
                  value={discountValue}
                  onChange={(e) => setDiscountValue(e.target.value)}
                  placeholder={discountType === 'percentage' ? '20' : '50'}
                  className="w-full pl-7 pr-3 py-2 border border-slate-200 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent text-slate-800 placeholder:text-slate-300"
                />
              </div>
            </div>
          </div>

          {/* Applies to */}
          <div>
            <label className="block text-xs font-semibold text-slate-500 mb-2">Applies to</label>
            <div className="grid grid-cols-2 gap-2">
              {PRODUCT_OPTIONS.map((opt) => {
                const isSelected = selectedProducts.includes(opt.value);
                return (
                  <button
                    key={opt.value}
                    type="button"
                    onClick={() => toggleProduct(opt.value)}
                    className={`flex items-center gap-3 text-left px-3 py-2.5 rounded-lg border transition-all ${
                      isSelected
                        ? 'bg-slate-800 border-slate-800 text-white'
                        : 'bg-white border-slate-200 text-slate-700 hover:border-slate-300 hover:bg-slate-50'
                    }`}
                  >
                    <div className={`w-3.5 h-3.5 rounded border flex items-center justify-center shrink-0 transition-all ${
                      isSelected ? 'bg-white/20 border-white/40' : 'border-slate-300'
                    }`}>
                      {isSelected && <Check className="w-2.5 h-2.5 text-white" />}
                    </div>
                    <div className="min-w-0">
                      <p className={`text-xs font-semibold truncate ${isSelected ? 'text-white' : 'text-slate-700'}`}>{opt.label}</p>
                      <p className={`text-[10px] truncate ${isSelected ? 'text-white/60' : 'text-slate-400'}`}>{opt.description}</p>
                    </div>
                  </button>
                );
              })}
            </div>
          </div>

          {/* Expiration + max uses */}
          <div className="grid grid-cols-2 gap-4">
            <div>
              <label className="block text-xs font-semibold text-slate-500 mb-2">Expires (optional)</label>
              <input
                type="date"
                value={expiresAt}
                onChange={(e) => setExpiresAt(e.target.value)}
                min={new Date().toISOString().split('T')[0]}
                className="w-full px-3 py-2 border border-slate-200 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent text-slate-700"
              />
            </div>
            <div>
              <label className="block text-xs font-semibold text-slate-500 mb-2">Max uses</label>
              <input
                type="number"
                min="1"
                step="1"
                value={maxUses}
                onChange={(e) => setMaxUses(e.target.value)}
                className="w-full px-3 py-2 border border-slate-200 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent text-slate-700"
              />
            </div>
          </div>

          {/* Internal note */}
          <div>
            <label className="block text-xs font-semibold text-slate-500 mb-2">
              Internal note <span className="font-normal text-slate-400">(optional)</span>
            </label>
            <input
              type="text"
              value={internalNote}
              onChange={(e) => setInternalNote(e.target.value)}
              placeholder="e.g. Sent after Smartlead reply on 3/20"
              className="w-full px-3 py-2 border border-slate-200 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent placeholder:text-slate-300 text-slate-700"
            />
          </div>

          {/* Generate button */}
          <button
            onClick={handleCreate}
            disabled={loading || !discountValue}
            className="w-full flex items-center justify-center gap-2 bg-slate-800 hover:bg-slate-900 disabled:bg-slate-200 disabled:text-slate-400 disabled:cursor-not-allowed text-white font-semibold py-3 px-4 rounded-xl transition-colors text-sm"
          >
            {loading ? (
              <><Loader2 className="w-4 h-4 animate-spin" /> Generating...</>
            ) : (
              <><Tag className="w-4 h-4" /> Generate Discount Link</>
            )}
          </button>
        </div>
      )}
    </div>
  );
}
