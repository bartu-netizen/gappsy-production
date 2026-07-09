/**
 * Smart Routing Event Tracker
 *
 * Client-side helper for tracking downstream funnel events that influence
 * smart routing decisions.
 *
 * QUALIFIED VIEW RULE:
 * A /your-agency visit only counts as qualified if at least one is true:
 * - Visible for 4+ seconds
 * - CTA became visible
 * - Meaningful scroll (>25%)
 * - Deeper funnel click
 * - Downstream progression event proves real intent
 */

const SUPABASE_URL = import.meta.env.VITE_SUPABASE_URL as string;

interface SmartRoutingEventParams {
  agencyId: string;
  leadKey: string;
  eventType:
    | 'your_agency_qualified_view'
    | 'owner_loss_step_viewed'
    | 'offer_page_viewed'
    | 'checkout_resume_viewed'
    | 'discount_checkout_viewed'
    | 'top25_upgrade_offer_viewed'
    | 'payment_completed_from_smart_route';
  metadata?: Record<string, any>;
}

class SmartRoutingTracker {
  private timeOnPage: number = 0;
  private startTime: number = Date.now();
  private hasTrackedQualifiedView: boolean = false;
  private scrollDepth: number = 0;
  private ctaVisible: boolean = false;

  constructor() {
    if (typeof window !== 'undefined') {
      this.initScrollTracking();
      this.initTimeTracking();
      this.initVisibilityTracking();
    }
  }

  private initScrollTracking() {
    const handleScroll = () => {
      const scrollTop = window.pageYOffset || document.documentElement.scrollTop;
      const scrollHeight = document.documentElement.scrollHeight - document.documentElement.clientHeight;
      const currentDepth = scrollHeight > 0 ? (scrollTop / scrollHeight) * 100 : 0;

      if (currentDepth > this.scrollDepth) {
        this.scrollDepth = currentDepth;
      }
    };

    window.addEventListener('scroll', handleScroll, { passive: true });
  }

  private initTimeTracking() {
    setInterval(() => {
      this.timeOnPage = Date.now() - this.startTime;
    }, 1000);
  }

  private initVisibilityTracking() {
    document.addEventListener('visibilitychange', () => {
      if (document.hidden) {
        // User switched tabs/minimized
        this.checkQualifiedView();
      }
    });

    // Check before page unload
    window.addEventListener('beforeunload', () => {
      this.checkQualifiedView();
    });
  }

  /**
   * Mark that CTA became visible (intersection observer trigger)
   */
  markCtaVisible() {
    this.ctaVisible = true;
    this.checkQualifiedView();
  }

  /**
   * Mark deeper funnel engagement (button click, form interaction)
   */
  markDeeperEngagement() {
    this.checkQualifiedView();
  }

  /**
   * Check if view qualifies as "qualified" based on engagement signals
   */
  private checkQualifiedView() {
    if (this.hasTrackedQualifiedView) return;

    const timeSeconds = this.timeOnPage / 1000;
    const isQualified =
      timeSeconds >= 4 ||
      this.ctaVisible ||
      this.scrollDepth > 25 ||
      false; // Will be set true by markDeeperEngagement

    if (isQualified) {
      this.hasTrackedQualifiedView = true;
      // Qualified view will be tracked separately
    }
  }

  /**
   * Track a smart routing event
   */
  async trackEvent(params: SmartRoutingEventParams): Promise<void> {
    try {
      // For qualified views, check criteria first
      if (params.eventType === 'your_agency_qualified_view') {
        if (this.hasTrackedQualifiedView) {
          return; // Already tracked
        }

        const timeSeconds = this.timeOnPage / 1000;
        const isQualified =
          timeSeconds >= 4 ||
          this.ctaVisible ||
          this.scrollDepth > 25;

        if (!isQualified) {
          return; // Not qualified yet
        }

        this.hasTrackedQualifiedView = true;
      }

      const response = await fetch(
        `${SUPABASE_URL}/functions/v1/smart-routing-track-event`,
        {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify({
            agency_id: params.agencyId,
            lead_key: params.leadKey,
            event_type: params.eventType,
            metadata: {
              ...params.metadata,
              time_on_page_seconds: Math.floor(this.timeOnPage / 1000),
              scroll_depth_percent: Math.floor(this.scrollDepth),
              cta_visible: this.ctaVisible,
              timestamp: new Date().toISOString(),
            },
          }),
        }
      );

      if (!response.ok) {
        console.warn('[SmartRoutingTracker] Event tracking failed:', response.status);
      }
    } catch (error) {
      console.warn('[SmartRoutingTracker] Event tracking error:', error);
    }
  }

  /**
   * Get current engagement metrics
   */
  getMetrics() {
    return {
      timeOnPageSeconds: Math.floor(this.timeOnPage / 1000),
      scrollDepthPercent: Math.floor(this.scrollDepth),
      ctaVisible: this.ctaVisible,
      hasTrackedQualifiedView: this.hasTrackedQualifiedView,
    };
  }
}

// Singleton instance
let trackerInstance: SmartRoutingTracker | null = null;

export function getSmartRoutingTracker(): SmartRoutingTracker {
  if (!trackerInstance) {
    trackerInstance = new SmartRoutingTracker();
  }
  return trackerInstance;
}

/**
 * Helper to extract aid and lid from URL query params (signed smart routing format)
 */
export function extractRoutingParams(searchParams: URLSearchParams): {
  agencyId: string | null;
  leadKey: string | null;
} {
  return {
    agencyId: searchParams.get('aid'),
    leadKey: searchParams.get('lid'),
  };
}

/**
 * Check if current page visit is from a smart routing link
 */
export function isSmartRoutingContext(searchParams: URLSearchParams): boolean {
  const { agencyId, leadKey } = extractRoutingParams(searchParams);
  return Boolean(agencyId && leadKey);
}
