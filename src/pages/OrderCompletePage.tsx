import { useState, useEffect, useCallback, useRef } from "react";
import { useSearchParams, useNavigate } from "react-router-dom";
import { CheckCircle, AlertCircle, Loader2, BarChart2 } from "lucide-react";
import ListingPreviewCard, { type FinalizationListingType } from "../components/ListingPreviewCard";
import PostPaymentEditor from "../components/PostPaymentEditor";
import { logFunnelEvent, getFsid, FUNNEL_EVENTS } from "../utils/yourAgencyFunnel";
import { hasSmartRoutingContext, getSmartRoutingContext } from "../utils/smartRoutingContext";
import { useNoindex } from '../components/NoindexMeta';

const SUPABASE_URL = import.meta.env.VITE_SUPABASE_URL as string;
const SUPABASE_ANON_KEY = import.meta.env.VITE_SUPABASE_ANON_KEY as string;

interface OrderSummary {
  agencyId: string | null;
  agencyName: string;
  agencySlug: string | null;
  stateName: string;
  stateSlug: string;
  listingType: string;
  rankNumber: number | null;
  top25SlotId: string | null;
  hasCardVisualUpgrade: boolean;
  website: string;
  description: string;
  services: string[];
  logoUrl: string | null;
  logoUploadStatus: string;
  sessionId: string;
  paymentStatus: string;
  orderStatus: string;
  isPaymentConfirmed: boolean;
  amountTotal: number | null;
}

interface EditState {
  intro: string;
  services: string[];
  websiteUrl: string;
  logoUrl: string | null;
}

function completeness(state: EditState): number {
  let score = 0;
  if (state.intro.trim().length > 10) score += 25;
  if (state.services.length > 0) score += 25;
  if (state.websiteUrl.trim().length > 5) score += 25;
  if (state.logoUrl) score += 25;
  return score;
}

export default function OrderCompletePage() {
  useNoindex();
  const [searchParams] = useSearchParams();
  const navigate = useNavigate();
  const sessionId = searchParams.get("session_id") || "";

  const [summary, setSummary] = useState<OrderSummary | null>(null);
  const [loadError, setLoadError] = useState<string | null>(null);
  const [editState, setEditState] = useState<EditState>({
    intro: "",
    services: [],
    websiteUrl: "",
    logoUrl: null,
  });
  const [agencyName, setAgencyName] = useState("");
  const [isSaving, setIsSaving] = useState(false);
  const [isSaved, setIsSaved] = useState(false);
  const [saveError, setSaveError] = useState<string | null>(null);
  const [isUploading, setIsUploading] = useState(false);

  const pollCountRef = useRef(0);
  const eventFiredRef = useRef(false);
  const smartRoutingEventFiredRef = useRef(false);

  // ── fetch + poll order-summary ────────────────────────────────────────────
  const fetchSummary = useCallback(async () => {
    if (!sessionId) {
      setLoadError("No session ID found in URL.");
      return;
    }
    try {
      const res = await fetch(
        `${SUPABASE_URL}/functions/v1/order-summary?session_id=${sessionId}`,
        {
          headers: { Authorization: `Bearer ${SUPABASE_ANON_KEY}` },
        }
      );
      if (!res.ok) throw new Error(`HTTP ${res.status}`);
      const data: OrderSummary = await res.json();
      setSummary(data);

      // Pre-fill edit state on first load
      setEditState((prev) => {
        if (prev.intro || prev.services.length > 0 || prev.websiteUrl || prev.logoUrl) {
          return prev;
        }
        return {
          intro: data.description || "",
          services: data.services || [],
          websiteUrl: data.website || "",
          logoUrl: data.logoUrl || null,
        };
      });
      setAgencyName((prev) => prev || data.agencyName || "");

      return data.isPaymentConfirmed;
    } catch (e) {
      console.error("[OrderComplete] fetchSummary error:", e);
      if (pollCountRef.current >= 9) {
        setLoadError("Could not confirm payment. Please contact support.");
      }
      return false;
    }
  }, [sessionId]);

  useEffect(() => {
    if (!sessionId) return;

    fetchSummary().then((confirmed) => {
      if (confirmed) return;

      const interval = setInterval(async () => {
        pollCountRef.current++;
        const confirmed = await fetchSummary();
        if (confirmed || pollCountRef.current >= 10) {
          clearInterval(interval);
        }
      }, 3000);

      return () => clearInterval(interval);
    });
  }, [fetchSummary, sessionId]);

  // ── fire funnel event once payment confirmed ──────────────────────────────
  useEffect(() => {
    if (summary?.isPaymentConfirmed && !eventFiredRef.current) {
      eventFiredRef.current = true;
      const fsid = getFsid(false);
      logFunnelEvent({
        ...FUNNEL_EVENTS.STRIPE_CHECKOUT_COMPLETED,
        fsid_override: fsid ?? undefined,
        checkout_session_id: summary.sessionId,
        agency_id: summary.agencyId ?? undefined,
        agency_slug: summary.agencySlug ?? undefined,
        state_slug: summary.stateSlug,
        agency_name: summary.agencyName,
        purchased_product: summary.listingType,
        purchased_amount: summary.amountTotal ?? undefined,
        metadata: {
          rank_number: summary.rankNumber,
          has_card_visual_upgrade: summary.hasCardVisualUpgrade,
          payment_source: "client",
        },
      });
    }
  }, [summary?.isPaymentConfirmed]);

  // ── fire smart routing tracking if context present ────────────────────────
  useEffect(() => {
    if (summary?.isPaymentConfirmed && !smartRoutingEventFiredRef.current) {
      const smartContext = getSmartRoutingContext(searchParams);
      if (hasSmartRoutingContext(searchParams) && smartContext.aid && smartContext.lid) {
        smartRoutingEventFiredRef.current = true;
        fetch(`${SUPABASE_URL}/functions/v1/smart-routing-track-event`, {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
            Authorization: `Bearer ${SUPABASE_ANON_KEY}`,
          },
          body: JSON.stringify({
            agency_id: smartContext.aid,
            lead_key: smartContext.lid,
            event_type: "checkout_resume_viewed",
            metadata: {
              checkout_session_id: summary.sessionId,
              state_slug: summary.stateSlug,
              listing_type: summary.listingType,
              amount: summary.amountTotal,
            },
          }),
        }).catch((err) => {
          console.error("[OrderComplete] Smart routing tracking error:", err);
        });
      }
    }
  }, [summary?.isPaymentConfirmed, searchParams]);

  // ── logo upload ───────────────────────────────────────────────────────────
  const handleLogoUpload = useCallback(async (file: File) => {
    if (!summary?.agencyId) return;
    setIsUploading(true);
    try {
      const formData = new FormData();
      formData.append("logo", file);
      formData.append("agencyId", summary.agencyId);
      formData.append("top25SlotId", summary.top25SlotId || "");
      formData.append("stateSlug", summary.stateSlug || "");
      formData.append("rank", summary.rankNumber ? String(summary.rankNumber) : "");

      const res = await fetch(`${SUPABASE_URL}/functions/v1/upload-logo`, {
        method: "POST",
        headers: { Authorization: `Bearer ${SUPABASE_ANON_KEY}` },
        body: formData,
      });
      if (!res.ok) throw new Error("Upload failed");
      const { logoUrl } = await res.json();
      setEditState((prev) => ({ ...prev, logoUrl: logoUrl || null }));
    } catch (e) {
      console.error("[OrderComplete] logo upload error:", e);
    } finally {
      setIsUploading(false);
    }
  }, [summary?.agencyId]);

  // ── save & activate ───────────────────────────────────────────────────────
  const handleSaveAndActivate = useCallback(async (data: {
    intro: string;
    services: string[];
    websiteUrl: string;
  }) => {
    if (!summary) return;
    setIsSaving(true);
    setSaveError(null);
    try {
      const res = await fetch(`${SUPABASE_URL}/functions/v1/listing-save-and-activate`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          Authorization: `Bearer ${SUPABASE_ANON_KEY}`,
        },
        body: JSON.stringify({
          sessionId: summary.sessionId,
          intro: data.intro,
          services: data.services,
          websiteUrl: data.websiteUrl,
          agencyId: summary.agencyId,
          agencyName: agencyName || summary.agencyName,
          logoUrl: editState.logoUrl ?? undefined,
        }),
      });
      if (!res.ok) {
        const err = await res.json().catch(() => ({ error: "Unknown error" }));
        throw new Error(err.error || `HTTP ${res.status}`);
      }
      setIsSaved(true);
      setTimeout(() => {
        navigate(`/marketing-agencies-in-${summary.stateSlug}-united-states/`);
      }, 3000);
    } catch (e) {
      setSaveError((e as Error).message);
    } finally {
      setIsSaving(false);
    }
  }, [summary, editState.logoUrl, navigate, agencyName]);

  // ── loading / error states ────────────────────────────────────────────────
  if (!sessionId) {
    return (
      <div className="min-h-screen flex items-center justify-center bg-gray-50">
        <div className="text-center p-8">
          <AlertCircle className="w-12 h-12 text-red-400 mx-auto mb-4" />
          <h2 className="text-xl font-semibold text-gray-800 mb-2">Missing Session</h2>
          <p className="text-gray-500">No checkout session ID found. Please return to checkout.</p>
        </div>
      </div>
    );
  }

  if (loadError) {
    return (
      <div className="min-h-screen flex items-center justify-center bg-gray-50">
        <div className="text-center p-8 max-w-md">
          <AlertCircle className="w-12 h-12 text-red-400 mx-auto mb-4" />
          <h2 className="text-xl font-semibold text-gray-800 mb-2">Could Not Load Order</h2>
          <p className="text-gray-500 mb-4">{loadError}</p>
          <a href="mailto:support@gappsy.com" className="text-blue-600 underline text-sm">
            Contact support
          </a>
        </div>
      </div>
    );
  }

  if (!summary) {
    return (
      <div className="min-h-screen flex items-center justify-center bg-gray-50">
        <div className="text-center">
          <Loader2 className="w-10 h-10 text-blue-500 animate-spin mx-auto mb-3" />
          <p className="text-gray-500 text-sm">Loading your order…</p>
        </div>
      </div>
    );
  }

  if (!summary.isPaymentConfirmed) {
    return (
      <div className="min-h-screen flex items-center justify-center bg-gray-50">
        <div className="text-center">
          <Loader2 className="w-10 h-10 text-blue-500 animate-spin mx-auto mb-3" />
          <p className="text-gray-600 font-medium">Confirming your payment…</p>
          <p className="text-gray-400 text-sm mt-1">This usually takes a few seconds.</p>
        </div>
      </div>
    );
  }

  // ── success screen ────────────────────────────────────────────────────────
  if (isSaved) {
    return (
      <div className="min-h-screen flex items-center justify-center bg-gradient-to-br from-green-50 to-blue-50">
        <div className="text-center p-8 max-w-md">
          <CheckCircle className="w-16 h-16 text-green-500 mx-auto mb-4" />
          <h1 className="text-2xl font-bold text-gray-900 mb-2">Listing Published!</h1>
          <p className="text-gray-600 mb-1">
            {agencyName || summary.agencyName} is now live on Gappsy.
          </p>
          <p className="text-gray-400 text-sm">
            Redirecting to your state page…
          </p>
        </div>
      </div>
    );
  }

  const listingType = summary.listingType as FinalizationListingType;
  const pctComplete = completeness(editState);
  const missingFields: string[] = [];
  if (!agencyName.trim()) missingFields.push("agency name");
  if (!editState.intro.trim()) missingFields.push("agency description");
  if (editState.services.length === 0) missingFields.push("services");
  if (!editState.websiteUrl.trim()) missingFields.push("website URL");
  if (!editState.logoUrl) missingFields.push("logo");
  const displayName = agencyName || summary.agencyName;

  return (
    <div className="min-h-screen bg-gray-50">
      {/* Header */}
      <div className="bg-white border-b border-gray-200 px-4 py-4">
        <div className="max-w-6xl mx-auto flex items-center gap-3">
          <CheckCircle className="w-6 h-6 text-green-500 shrink-0" />
          <div>
            <h1 className="text-lg font-semibold text-gray-900">
              Payment Confirmed — Finalize Your Listing
            </h1>
            <p className="text-sm text-gray-500">
              {agencyName || summary.agencyName} · {summary.stateName}
              {summary.amountTotal ? ` · $${summary.amountTotal.toFixed(2)} paid` : ""}
            </p>
          </div>
          {summary.amountTotal && (
            <div className="ml-auto flex items-center gap-1.5 bg-green-50 border border-green-200 rounded-full px-3 py-1">
              <BarChart2 className="w-3.5 h-3.5 text-green-600" />
              <span className="text-xs font-medium text-green-700">
                ${summary.amountTotal.toFixed(2)} received
              </span>
            </div>
          )}
        </div>
      </div>

      {/* Completeness bar */}
      <div className="bg-white border-b border-gray-100 px-4 py-2">
        <div className="max-w-6xl mx-auto flex items-center gap-3">
          <span className="text-xs text-gray-500 shrink-0">
            Profile {pctComplete}% complete
          </span>
          <div className="flex-1 h-2 bg-gray-100 rounded-full overflow-hidden">
            <div
              className="h-full rounded-full transition-all duration-500"
              style={{
                width: `${pctComplete}%`,
                backgroundColor: pctComplete >= 75 ? "#22c55e" : pctComplete >= 50 ? "#f59e0b" : "#ef4444",
              }}
            />
          </div>
          {pctComplete < 100 && (
            <span className="text-xs text-amber-600 shrink-0">
              Add {missingFields[0]} to reach {Math.min(100, pctComplete + 25)}%
            </span>
          )}
        </div>
      </div>

      {/* Missing fields banner */}
      {missingFields.length > 0 && (
        <div className="bg-amber-50 border-b border-amber-200 px-4 py-2">
          <div className="max-w-6xl mx-auto flex items-center gap-2 text-sm text-amber-700">
            <AlertCircle className="w-4 h-4 shrink-0" />
            <span>
              Missing: {missingFields.join(", ")}. Complete your profile for the best results.
            </span>
          </div>
        </div>
      )}

      {/* Two-column layout */}
      <div className="max-w-6xl mx-auto px-4 py-6 lg:py-10">
        <div className="flex flex-col lg:flex-row gap-8">
          {/* Left: live preview */}
          <div className="w-full lg:w-80 shrink-0">
            <div className="lg:sticky lg:top-6">
              <p className="text-xs font-medium text-gray-400 uppercase tracking-wider mb-3">
                Live Preview
              </p>
              <ListingPreviewCard
                type={listingType}
                name={displayName}
                logoUrl={editState.logoUrl}
                intro={editState.intro}
                services={editState.services}
                stateName={summary.stateName}
                rankNumber={summary.rankNumber}
                hasCardVisualUpgrade={summary.hasCardVisualUpgrade}
                websiteUrl={editState.websiteUrl}
              />
            </div>
          </div>

          {/* Right: editor */}
          <div className="flex-1 min-w-0">
            {saveError && (
              <div className="mb-4 p-3 bg-red-50 border border-red-200 rounded-lg flex items-center gap-2 text-sm text-red-700">
                <AlertCircle className="w-4 h-4 shrink-0" />
                {saveError}
              </div>
            )}
            <PostPaymentEditor
              agencyId={summary.agencyId || ""}
              agencyName={summary.agencyName}
              stateSlug={summary.stateSlug}
              stateName={summary.stateName}
              listingType={listingType}
              rankNumber={summary.rankNumber}
              hasCardVisualUpgrade={summary.hasCardVisualUpgrade}
              initialAgencyName={displayName}
              initialIntro={editState.intro}
              initialServices={editState.services}
              initialWebsiteUrl={editState.websiteUrl}
              logoUrl={editState.logoUrl}
              onAgencyNameChange={setAgencyName}
              onFieldChange={(fields) => {
                setEditState((prev) => ({
                  ...prev,
                  intro: fields.intro,
                  services: fields.services,
                  websiteUrl: fields.websiteUrl,
                }));
              }}
              onLogoUpload={handleLogoUpload}
              onSaveAndActivate={handleSaveAndActivate}
              isLoading={isSaving}
            />
          </div>
        </div>
      </div>
    </div>
  );
}
