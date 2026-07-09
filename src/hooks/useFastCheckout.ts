import { useState, useRef, useCallback } from 'react';

const SUPABASE_URL = import.meta.env.VITE_SUPABASE_URL as string | undefined;
const ANON_KEY = import.meta.env.VITE_SUPABASE_ANON_KEY as string | undefined;
const CHECKOUT_URL = SUPABASE_URL ? `${SUPABASE_URL}/functions/v1/top25-checkout` : '';

export interface FastCheckoutTrackingPayload {
  funnel_name: string;
  event_name: string;
  step_number: number;
  state_slug?: string;
  agency_name?: string;
  agency_id?: string;
  is_demo?: boolean;
  metadata?: Record<string, unknown>;
}

async function readErrorBody(res: Response): Promise<{ text: string; parsed: unknown }> {
  let text = '';
  try {
    text = await res.text();
  } catch {
    text = '';
  }
  let parsed: unknown = null;
  if (text) {
    try {
      parsed = JSON.parse(text);
    } catch {
      parsed = null;
    }
  }
  return { text, parsed };
}

export function useFastCheckout() {
  const [isProcessing, setIsProcessing] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const inFlightRef = useRef(false);

  const launch = useCallback(async (
    buildPayload: () => Record<string, unknown>,
    _opts?: {
      trackingPayload?: FastCheckoutTrackingPayload;
    }
  ) => {
    if (inFlightRef.current) return;
    inFlightRef.current = true;
    setIsProcessing(true);
    setError(null);

    const finish = (userMessage: string, diag?: Record<string, unknown>) => {
      if (diag) {
        console.error('[useFastCheckout] checkout failed', diag);
      }
      setError(userMessage);
      setIsProcessing(false);
      inFlightRef.current = false;
    };

    if (!SUPABASE_URL || !ANON_KEY) {
      finish('Checkout is not configured. Please contact support.', {
        reason: 'missing_env',
        hasUrl: !!SUPABASE_URL,
        hasAnonKey: !!ANON_KEY,
      });
      return;
    }

    let payload: Record<string, unknown>;
    try {
      payload = buildPayload();
    } catch (err) {
      finish('Unable to start secure checkout. Please try again.', {
        reason: 'payload_build_failed',
        error: err instanceof Error ? err.message : String(err),
      });
      return;
    }

    let res: Response;
    try {
      res = await fetch(CHECKOUT_URL, {
        method: 'POST',
        headers: {
          'Authorization': `Bearer ${ANON_KEY}`,
          'apikey': ANON_KEY,
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(payload),
      });
    } catch (err) {
      finish('Network error. Please check your connection and try again.', {
        reason: 'network_error',
        error: err instanceof Error ? err.message : String(err),
      });
      return;
    }

    if (!res.ok) {
      const { text, parsed } = await readErrorBody(res);
      const serverMessage =
        (parsed && typeof parsed === 'object' && 'error' in (parsed as Record<string, unknown>)
          ? String((parsed as Record<string, unknown>).error)
          : null) ||
        (parsed && typeof parsed === 'object' && 'message' in (parsed as Record<string, unknown>)
          ? String((parsed as Record<string, unknown>).message)
          : null);
      finish('Unable to start secure checkout. Please try again.', {
        reason: 'non_ok_response',
        status: res.status,
        statusText: res.statusText,
        serverMessage,
        body: text?.slice(0, 2000),
      });
      return;
    }

    let data: { url?: string } & Record<string, unknown>;
    try {
      data = await res.json();
    } catch (err) {
      finish('Unable to start secure checkout. Please try again.', {
        reason: 'parse_error',
        error: err instanceof Error ? err.message : String(err),
      });
      return;
    }

    if (data && data.ok === false && data.reason === 'not_available') {
      console.warn('[useFastCheckout] slot not available — redirecting to offer page', { data });
      try {
        const here = new URL(window.location.href);
        here.searchParams.set('position_unavailable', '1');
        const stateSlug = (data as Record<string, unknown>).state_slug;
        if (typeof stateSlug === 'string' && stateSlug) {
          here.searchParams.set('state_slug', stateSlug);
        }
        const rank = (data as Record<string, unknown>).rank;
        if (typeof rank === 'number') {
          here.searchParams.set('rank', String(rank));
        }
        inFlightRef.current = false;
        setIsProcessing(false);
        setError(null);
        window.location.replace(here.toString());
      } catch (err) {
        finish('That position is no longer available. Here are the currently available positions.', {
          reason: 'slot_not_available_redirect_failed',
          error: err instanceof Error ? err.message : String(err),
          data,
        });
      }
      return;
    }

    if (!data?.url || typeof data.url !== 'string') {
      finish('Unable to start secure checkout. Please try again.', {
        reason: 'missing_checkout_url',
        data,
      });
      return;
    }

    try {
      window.location.replace(data.url);
    } catch (err) {
      finish('Unable to open secure checkout. Please try again.', {
        reason: 'redirect_failed',
        error: err instanceof Error ? err.message : String(err),
      });
    }
  }, []);

  return { isProcessing, error, setError, launch };
}
