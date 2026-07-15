import { useEffect, useState, useRef } from 'react';
import { useNavigate, useSearchParams } from 'react-router-dom';
import { supabase } from '../lib/supabase';
import { useOwnerListingEdit } from '../contexts/OwnerListingEditContext';
import { RETAINER_OPTIONS, formatRetainerLabel, getRetainerAmountWithFallback } from '../utils/retainerUtils';
import { getStateContextFromSearchParams } from '../utils/stateContext';
import { formatStateName } from '../utils/formatLocation';
import CompactLogoUploadField from '../components/CompactLogoUploadField';

interface Agency {
  id: string;
  name: string;
  state_name: string;
  location: string;
  intro: string;
  services: string[];
  average_retainer_range?: string | null;
  average_retainer_amount?: number | null;
  slug?: string;
  website_url?: string;
  contact_name?: string;
  contact_email?: string;
}

const MOCK_OTHER_AGENCIES: Agency[] = [
  {
    id: "0a13b250-b119-45fc-84ce-d3848dcff951",
    name: "Garden State Digital",
    state_name: "",
    location: "",
    intro: "Full-service digital marketing agency helping local businesses grow through data-driven campaigns and conversion-focused websites.",
    services: ["SEO", "PPC", "Web Design", "Content Marketing"],
    average_retainer_range: "$2,500 - $5,000/mo"
  },
  {
    id: "e748c792-3bc0-4c05-8eaa-33320f2d97e1",
    name: "Shoreline Marketing Co.",
    state_name: "",
    location: "",
    intro: "Specialized in performance marketing for startups and ecommerce brands, with a strong focus on ROI and lead generation.",
    services: ["Paid Social", "Email Marketing", "Conversion Optimization", "Analytics"],
    average_retainer_range: "$3,000 - $7,500/mo"
  },
  {
    id: "0076a8ed-86da-461a-a3f0-8b0041fac8c2",
    name: "Hudson River Creative",
    state_name: "",
    location: "",
    intro: "Branding and creative studio that builds modern digital experiences, from strategy and design to launch.",
    services: ["Branding", "Web Development", "UX/UI Design", "Content Creation"],
    average_retainer_range: "$5,000 - $10,000/mo"
  },
  {
    id: "431c15ac-0039-431b-b4e1-56aef27cd281",
    name: "Pinecone Performance Agency",
    state_name: "",
    location: "",
    intro: "Performance-driven agency helping B2B and local service companies generate high-quality leads online.",
    services: ["Lead Generation", "Local SEO", "Google Ads", "Marketing Strategy"],
    average_retainer_range: "$2,000 - $5,000/mo"
  }
];

const SERVICE_OPTIONS = [
  'SEO',
  'Web Design',
  'PPC',
  'Social Media Marketing',
  'Branding',
  'Content Marketing',
  'CRO',
  'Email Marketing',
  'Performance Marketing'
];

export default function AvailabilityOwnerEditListingPage() {
  const navigate = useNavigate();
  const [searchParams] = useSearchParams();
  const agencyId = searchParams.get('agencyId');
  const isPlaceholder = searchParams.get('placeholder') === '1';
  const isDemo = isPlaceholder || searchParams.get('demo') === '1';
  const { stateSlug, stateName } = getStateContextFromSearchParams(searchParams);
  const mode = searchParams.get('mode');
  const { editedData, setEditedData } = useOwnerListingEdit();

  const [agency, setAgency] = useState<Agency | null>(null);
  const [loading, setLoading] = useState(true);
  const [saveError, setSaveError] = useState<string | null>(null);
  const [isSaving, setIsSaving] = useState(false);
  const [usedFallback, setUsedFallback] = useState(false);
  const [intro, setIntro] = useState('');
  const [selectedServices, setSelectedServices] = useState<string[]>([]);
  const [retainerAmount, setRetainerAmount] = useState<number | null>(null);
  const [retainerError, setRetainerError] = useState<string>('');
  const [charCount, setCharCount] = useState(0);
  const [hasSubmitted, setHasSubmitted] = useState(false);
  const [logoUrl, setLogoUrl] = useState<string | null>(null);
  const MAX_CHARS = 600;
  const mountedRef = useRef(true);

  useEffect(() => {
    mountedRef.current = true;
    return () => { mountedRef.current = false; };
  }, []);

  useEffect(() => {
    document.title = 'Review & Update Your Listing | Gappsy';
  }, []);

  useEffect(() => {
    async function loadAgency() {
      if (!agencyId || !stateSlug) {
        // Use first fallback agency for missing params
        const fallbackAgency = MOCK_OTHER_AGENCIES[0];
        setAgency({ ...fallbackAgency, state_name: stateName, location: '' });
        setIntro(fallbackAgency.intro || '');
        setCharCount((fallbackAgency.intro || '').length);
        setSelectedServices(fallbackAgency.services || []);
        const amount = getRetainerAmountWithFallback(
          fallbackAgency.average_retainer_amount,
          fallbackAgency.average_retainer_range
        );
        setRetainerAmount(amount);
        setUsedFallback(true);
        setLoading(false);
        return;
      }

      try {
        const { data, error } = await supabase
          .from('other_agencies')
          .select('id, name, state_name, location, intro, services, average_retainer_range, average_retainer_amount')
          .eq('id', agencyId)
          .maybeSingle();

        if (!mountedRef.current) return;

        // In demo mode, silently fall back on any DB error — never surface RLS errors
        if (error) {
          if (!isDemo) {
            if (import.meta.env.DEV) console.error('[EditListing] DB error:', error);
          }
          throw error;
        }

        if (data) {
          const agencyData = isDemo
            ? { ...data, state_name: stateName, location: '' }
            : data;
          setAgency(agencyData);
          setIntro(data.intro || '');
          setCharCount((data.intro || '').length);
          setSelectedServices(data.services || []);
          const amount = getRetainerAmountWithFallback(
            data.average_retainer_amount,
            data.average_retainer_range
          );
          setRetainerAmount(amount);
          setUsedFallback(false);
        } else {
          const fallbackAgency = MOCK_OTHER_AGENCIES.find(a => a.id === agencyId) || MOCK_OTHER_AGENCIES[0];
          setAgency({ ...fallbackAgency, state_name: stateName, location: '' });
          setIntro(fallbackAgency.intro || '');
          setCharCount((fallbackAgency.intro || '').length);
          setSelectedServices(fallbackAgency.services || []);
          const amount = getRetainerAmountWithFallback(
            fallbackAgency.average_retainer_amount,
            fallbackAgency.average_retainer_range
          );
          setRetainerAmount(amount);
          setUsedFallback(true);
        }
      } catch {
        if (!mountedRef.current) return;
        const fallbackAgency = MOCK_OTHER_AGENCIES.find(a => a.id === agencyId) || MOCK_OTHER_AGENCIES[0];
        setAgency({ ...fallbackAgency, state_name: stateName, location: '' });
        setIntro(fallbackAgency.intro || '');
        setCharCount((fallbackAgency.intro || '').length);
        setSelectedServices(fallbackAgency.services || []);
        const amount = getRetainerAmountWithFallback(
          fallbackAgency.average_retainer_amount,
          fallbackAgency.average_retainer_range
        );
        setRetainerAmount(amount);
        setUsedFallback(true);
      } finally {
        if (mountedRef.current) setLoading(false);
      }
    }

    loadAgency();
  }, [agencyId, stateSlug]);

  const handleIntroChange = (e: React.ChangeEvent<HTMLTextAreaElement>) => {
    const value = e.target.value;
    if (value.length <= MAX_CHARS) {
      setIntro(value);
      setCharCount(value.length);
    }
  };

  const handleServiceToggle = (service: string) => {
    setSelectedServices(prev =>
      prev.includes(service)
        ? prev.filter(s => s !== service)
        : [...prev, service]
    );
  };

  const sanitizeIntro = (text: string): string => {
    if (!text) return text;
    text = text.replace(/<a\s[^>]*>(.*?)<\/a>/gi, '$1');
    text = text.replace(/\bhttps?:\/\/\S+|\bwww\.\S+/gi, '');
    text = text.replace(/\b[a-z0-9.-]+\.[a-z]{2,}\/?\S*/gi, '');
    return text.replace(/\s{2,}/g, ' ').trim();
  };

  const handleSaveAndContinue = async () => {
    setHasSubmitted(true);

    if (!agencyId || !stateSlug) {
      if (!isDemo) {
        setSaveError('Missing required parameters. Please try again.');
      }
      return;
    }

    if (!retainerAmount || retainerAmount <= 0) {
      setRetainerError('Please select a monthly retainer.');
      return;
    }

    setSaveError(null);
    setRetainerError('');
    setIsSaving(true);

    const sanitizedIntro = sanitizeIntro(intro || '');

    if (isDemo) {
      // Demo mode: skip all DB writes, simulate success locally
      setEditedData({
        intro: sanitizedIntro,
        services: selectedServices
      });

      const placeholderParam = isPlaceholder ? '&placeholder=1' : '';
      const logoParam = logoUrl ? `&agencyLogoUrl=${encodeURIComponent(logoUrl)}` : '';
      if (mode === 'activate') {
        const stateNameParam = stateName ? `&stateName=${encodeURIComponent(stateName)}` : '';
        navigate(`/availability/owner-preview?agencyId=${agencyId}&state=${stateSlug}${stateNameParam}${placeholderParam}${logoParam}`);
      } else {
        navigate(`/availability/owner-demo?agencyId=${agencyId}&state=${stateSlug}${mode ? `&mode=${mode}` : ''}${placeholderParam}&edited=1${logoParam}&autostart=1`);
      }
      return;
    }

    // Real mode: attempt DB upsert
    try {
      const upsertPayload = {
        id: agencyId,
        name: agency?.name || 'Agency',
        slug: agency?.slug || (agency?.name?.toLowerCase().replace(/\s+/g, '-')) || 'agency',
        state_slug: stateSlug,
        state_name: agency?.state_name || formatStateName(stateSlug),
        location: agency?.location || '',
        website_url: editedData?.websiteUrl || agency?.website_url || agency?.location || '',
        intro: sanitizedIntro || null,
        services: selectedServices || [],
        average_retainer_amount: retainerAmount ?? null,
        average_retainer_range: null
      };

      const { error } = await supabase
        .from('other_agencies')
        .upsert(upsertPayload, { onConflict: 'id' })
        .select();

      if (error) {
        const isRLSError = error.message.includes('row level security') ||
                          error.message.includes('row-level security') ||
                          error.message.includes('permission denied') ||
                          error.code === '42501';

        if (isRLSError) {
          // RLS: continue without blocking — listing submission still proceeds
        } else {
          setSaveError(`Failed to save: ${error.message}`);
          setIsSaving(false);
          return;
        }
      }

      // Log submission (non-blocking)
      try {
        const supabaseUrl = import.meta.env.VITE_SUPABASE_URL;
        const supabaseAnonKey = import.meta.env.VITE_SUPABASE_ANON_KEY;
        if (supabaseUrl && supabaseAnonKey) {
          await fetch(`${supabaseUrl}/functions/v1/other-listing-application`, {
            method: 'POST',
            headers: {
              'Content-Type': 'application/json',
              'Authorization': `Bearer ${supabaseAnonKey}`,
            },
            body: JSON.stringify({
              agency_id: agencyId,
              state_name: agency?.state_name || formatStateName(stateSlug),
              state_slug: stateSlug,
              agency_name: agency?.name || 'Agency',
              contact_name: agency?.contact_name || null,
              contact_email: editedData?.contactEmail || agency?.contact_email || null,
              website_url: editedData?.websiteUrl || agency?.website_url || agency?.location || '',
              intro: sanitizedIntro,
              services: selectedServices,
              average_retainer_amount: retainerAmount,
              source: 'other_listing_form',
              submission_type: 'edit'
            }),
          });
        }
      } catch {
        // Non-blocking: swallow silently
      }
    } catch (err) {
      const errorMessage = err instanceof Error ? err.message : 'Unknown error';
      setSaveError(`Failed to save: ${errorMessage}`);
      setIsSaving(false);
      return;
    }

    setIsSaving(false);

    setEditedData({
      intro: sanitizedIntro,
      services: selectedServices
    });

    const placeholderParam = isPlaceholder ? '&placeholder=1' : '';
    const logoParam = logoUrl ? `&agencyLogoUrl=${encodeURIComponent(logoUrl)}` : '';
    if (mode === 'activate') {
      const stateNameParam = stateName ? `&stateName=${encodeURIComponent(stateName)}` : '';
      navigate(`/availability/owner-preview?agencyId=${agencyId}&state=${stateSlug}${stateNameParam}${placeholderParam}${logoParam}`);
    } else {
      navigate(`/availability/owner-demo?agencyId=${agencyId}&state=${stateSlug}${mode ? `&mode=${mode}` : ''}${placeholderParam}&edited=1${logoParam}&autostart=1`);
    }
  };

  if (loading) {
    return (
      <div className="min-h-screen flex items-center justify-center bg-gradient-to-br from-slate-50 to-slate-100">
        <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-indigo-600" />
      </div>
    );
  }

  if (!agency) {
    return null;
  }

  return (
    <div className="min-h-screen bg-slate-50">
      <div className="max-w-3xl mx-auto px-4 sm:px-6 pt-3 pb-4 sm:py-8">
        <div className="bg-white rounded-2xl shadow-sm border border-slate-100 px-4 py-4 sm:px-8 sm:py-7 space-y-4 sm:space-y-8">

          {import.meta.env.DEV && usedFallback && (
            <div className="bg-amber-50 border border-amber-200 rounded-lg p-3 text-xs text-amber-700">
              [DEV] No agency found for this id, using fallback mock agency.
            </div>
          )}

          {/* Only show save errors in real (non-demo) mode */}
          {saveError && !isDemo && (
            <div className="bg-red-50 border border-red-200 rounded-lg p-4">
              <p className="text-sm font-medium text-red-900">Error saving changes</p>
              <p className="text-xs text-red-700 mt-1">{saveError}</p>
            </div>
          )}

          {/* Demo mode notice */}
          {isDemo && (
            <div className="bg-blue-50 border border-blue-100 rounded-lg px-4 py-2.5 flex items-center gap-2">
              <span className="text-[11px] font-semibold uppercase tracking-wide text-blue-600">Demo</span>
              <span className="text-xs text-blue-700">You're previewing this form. Updates are preview-only and won't be saved.</span>
            </div>
          )}

          <div>
            <h1 className="text-lg sm:text-xl md:text-3xl font-semibold tracking-tight text-slate-900">
              Review & Update Your Listing
            </h1>
            <p className="mt-1 text-sm sm:text-base text-slate-600 max-w-2xl">
              <span className="hidden sm:inline">You're updating the listing for {agency?.name || "your agency"}. We've pre-filled this page using publicly available data — please make sure everything looks correct before continuing.</span>
              <span className="sm:hidden">Please make sure everything looks correct before continuing.</span>
            </p>
          </div>

          <div>
            <label htmlFor="intro" className="block text-sm font-medium text-slate-800 mb-1">
              Intro for {agency?.name || "your agency"}
            </label>
            <div className="relative">
              <textarea
                id="intro"
                value={intro}
                onChange={handleIntroChange}
                maxLength={MAX_CHARS}
                className="w-full rounded-lg border border-slate-200 bg-slate-50 px-3 py-2 text-sm sm:text-base text-slate-900 placeholder:text-slate-400 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500 min-h-[112px] sm:min-h-[128px] resize-none leading-relaxed"
                placeholder="Short intro about your agency and services (this appears on your public listing)…"
              />
              <div className="absolute bottom-2 right-3 text-xs text-slate-400 font-medium">
                {charCount} / {MAX_CHARS}
              </div>
            </div>
          </div>

          <CompactLogoUploadField
            agencyId={agencyId}
            stateSlug={stateSlug}
            onUpload={(url) => setLogoUrl(url)}
          />

          <div>
            <h3 className="text-sm font-medium text-slate-800 mb-1.5 sm:mb-2">
              Services Offered
            </h3>
            <div className="grid grid-cols-2 gap-x-4 gap-y-2 md:gap-x-6 md:gap-y-3">
              {SERVICE_OPTIONS.map((service) => (
                <label
                  key={service}
                  className="flex items-center gap-2 cursor-pointer group"
                >
                  <input
                    type="checkbox"
                    checked={selectedServices.includes(service)}
                    onChange={() => handleServiceToggle(service)}
                    className="w-4 h-4 rounded border-slate-300 text-indigo-600 focus:ring-indigo-500 focus:ring-offset-0 cursor-pointer flex-shrink-0"
                  />
                  <span className="text-sm sm:text-base text-slate-700 group-hover:text-slate-900 leading-tight">
                    {service}
                  </span>
                </label>
              ))}
            </div>
            <p className="mt-1.5 text-xs text-slate-500 hidden sm:block">
              Select the services you want displayed on your public listing.
            </p>
          </div>

          <div>
            <label htmlFor="retainerAmount" className="block text-sm font-medium text-slate-800 mb-1">
              Typical monthly retainer per client <span className="text-red-500">*</span>
            </label>
            <select
              id="retainerAmount"
              value={retainerAmount || ''}
              onChange={(e) => {
                const value = e.target.value;
                setRetainerAmount(value ? Number(value) : null);
                setRetainerError('');
              }}
              className={`w-full rounded-lg border bg-slate-50 px-3 py-2.5 text-sm sm:text-base text-slate-900 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500 ${
                retainerError && hasSubmitted ? 'border-red-300' : 'border-slate-200'
              }`}
            >
              <option value="">Select an amount...</option>
              {RETAINER_OPTIONS.map((amount) => (
                <option key={amount} value={amount}>
                  {formatRetainerLabel(amount)}
                </option>
              ))}
            </select>
            {retainerError && hasSubmitted && (
              <p className="mt-1 text-xs text-red-600 font-medium">
                {retainerError}
              </p>
            )}
            {!(retainerError && hasSubmitted) && (
              <p className="mt-1 text-xs sm:text-sm text-slate-500 hidden sm:block">
                We'll use this amount to estimate the value of clients who click "Check Availability" on your listing.
              </p>
            )}
          </div>

          <div>
            <button
              onClick={handleSaveAndContinue}
              disabled={isSaving}
              className="w-full rounded-xl py-3 text-sm sm:text-base font-semibold bg-indigo-600 text-white shadow-sm hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2 disabled:opacity-50 disabled:cursor-not-allowed"
            >
              {isSaving ? 'Saving...' : 'Save & Continue'}
            </button>
            {isDemo ? (
              <p className="mt-2 text-xs text-slate-400 text-center">
                Demo mode: updates are preview-only.
              </p>
            ) : (
              <p className="mt-2 text-xs sm:text-sm text-slate-500 text-center hidden sm:block">
                Your updates will immediately appear in your public listing preview.
              </p>
            )}
          </div>
        </div>

        <div className="mt-2 sm:mt-4 text-center">
          <button
            onClick={() => navigate(-1)}
            className="text-sm text-slate-500 hover:text-slate-700 transition-colors"
          >
            ← Go back
          </button>
        </div>
      </div>
    </div>
  );
}
