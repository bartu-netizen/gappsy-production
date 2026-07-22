import type { ToolComparisonContent } from './types';

const googleAnalyticsVsPosthogContent: ToolComparisonContent = {
  "verdict": "Google Analytics and PostHog solve different jobs, even though both get called 'analytics.' Google Analytics is a free, event-based platform built for understanding website and app traffic, acquisition channels, and marketing performance — its Explorations, BigQuery export, and native Google Ads integration make it the default choice for marketing and SEO teams who need to know where visitors come from and whether campaigns convert. PostHog is a product analytics platform built for engineering and product teams shipping features — it bundles event tracking with feature flags, session replay, and A/B testing so a team can watch how users actually use a product and test changes safely, all in one tool. If your core question is 'where is our traffic coming from and is our marketing working,' Google Analytics is the natural fit and costs nothing to start. If your core question is 'how do users behave inside our product, and how do we safely test and roll out changes,' PostHog's combined toolset removes the need to stitch together separate analytics, flagging, and replay tools. Many teams — especially SaaS companies — end up running both: Google Analytics for top-of-funnel marketing and SEO reporting, PostHog for in-product behavior, experimentation, and release management. Choosing between them should be based on which job is more central to your team, not on which is 'better' in the abstract.",
  "bestForToolA": "Google Analytics is the better fit for marketing, SEO, and growth teams who need free, event-based web and app traffic reporting with deep Google Ads and BigQuery integration for attribution and custom analysis.",
  "bestForToolB": "PostHog is the better fit for product and engineering teams that want event tracking, feature flags, session replay, and A/B testing combined in a single platform to understand and iterate on in-product user behavior.",
  "whoNeedsBoth": "Teams that run marketing campaigns and SEO while also actively developing and experimenting on their own product would reasonably use both: Google Analytics for acquisition and campaign reporting, PostHog for in-app behavior, feature rollout, and experimentation.",
  "keyDifferences": [
    {
      "title": "Core use case",
      "toolA": "Event-based platform for tracking website/app traffic, conversions, and marketing performance",
      "toolB": "All-in-one product analytics platform combining event tracking, feature flags, session replay, and A/B testing",
      "whyItMatters": "The two tools are optimized for fundamentally different questions — marketing attribution versus in-product user behavior and experimentation",
      "benefitsWho": "Marketing/SEO teams benefit from Google Analytics' focus; product/engineering teams benefit from PostHog's combined toolset"
    },
    {
      "title": "Pricing model",
      "toolA": "Free GA4 Standard tier with all core reporting, plus a custom-priced Google Analytics 360 enterprise tier",
      "toolB": "Freemium pricing model, though specific plan tiers and pricing are not documented here",
      "whyItMatters": "Buyers need to know if there's a genuinely free tier and what upgrading costs before committing to a tool",
      "benefitsWho": "Cost-sensitive teams benefit from GA4's fully free standard tier with a clear, documented upgrade path"
    },
    {
      "title": "Feature flags",
      "toolA": "Not documented as a Google Analytics capability",
      "toolB": "Native feature flags to toggle features for specific users or segments",
      "whyItMatters": "Feature flags let engineering teams roll out and control features safely without a separate flagging tool",
      "benefitsWho": "Product/engineering teams shipping incremental features benefit from PostHog's built-in flags"
    },
    {
      "title": "Session replay",
      "toolA": "Not documented as a Google Analytics capability",
      "toolB": "Session replay to watch recordings of real user sessions",
      "whyItMatters": "Session replay shows exactly how users interact with a product, which aggregate reports can't reveal",
      "benefitsWho": "UX researchers and product teams debugging usability issues benefit from PostHog's session replay"
    },
    {
      "title": "A/B testing / experimentation",
      "toolA": "Not documented as a dedicated A/B testing feature; GA offers audience building for remarketing and segmentation instead",
      "toolB": "Built-in A/B testing to run and measure experiments",
      "whyItMatters": "Native experimentation tooling lets teams validate product changes with real user data without a separate testing platform",
      "benefitsWho": "Product teams running feature experiments benefit from PostHog's integrated A/B testing"
    },
    {
      "title": "Data export and warehousing",
      "toolA": "BigQuery Export links a property to BigQuery for raw, unsampled event-level data and custom SQL analysis",
      "toolB": "Not documented",
      "whyItMatters": "Raw data export matters for teams that need long-term retention or custom analysis beyond a tool's default dashboards",
      "benefitsWho": "Data teams and analysts benefit from Google Analytics' documented BigQuery integration"
    },
    {
      "title": "Ads and marketing integration",
      "toolA": "Google Ads Integration connects conversion data and audiences directly to Google Ads for attribution and remarketing",
      "toolB": "Not documented",
      "whyItMatters": "Direct ad-platform integration is essential for closing the loop between marketing spend and conversions",
      "benefitsWho": "Performance marketers benefit from Google Analytics' native Google Ads connection"
    },
    {
      "title": "AI and predictive features",
      "toolA": "Predictive Metrics and AI Insights surface machine-learning-based metrics like purchase and churn probability",
      "toolB": "Not documented",
      "whyItMatters": "Predictive signals can help teams prioritize retention and revenue efforts before problems become visible in standard reports",
      "benefitsWho": "Growth and lifecycle marketing teams benefit from Google Analytics' documented predictive metrics"
    },
    {
      "title": "Cross-platform measurement",
      "toolA": "Combines web and mobile app data from the same business into a single GA4 property via the Firebase SDK",
      "toolB": "Not documented",
      "whyItMatters": "Unified web-and-app reporting avoids stitching together separate analytics setups for each platform",
      "benefitsWho": "Businesses with both a website and a mobile app benefit from Google Analytics' unified property model"
    },
    {
      "title": "Learning curve",
      "toolA": "Documented as having a steep learning curve for teams coming from Universal Analytics' session-based reports",
      "toolB": "Not documented",
      "whyItMatters": "A steeper learning curve affects how quickly a team can get value from a tool without dedicated analytics expertise",
      "benefitsWho": "Teams with analytics experience can absorb Google Analytics' complexity; no comparable learning-curve data is documented for PostHog"
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Analytics",
      "rows": [
        {
          "feature": "Event tracking",
          "toolA": "available",
          "toolB": "available",
          "note": "GA uses an event-based data model; PostHog's product analytics is built on event tracking"
        },
        {
          "feature": "Automatic/enhanced event capture",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "GA's Enhanced Measurement auto-tracks scrolls, clicks, downloads, video engagement"
        },
        {
          "feature": "Funnel and path analysis",
          "toolA": "available",
          "toolB": "available",
          "note": "GA via Explorations; PostHog's product analytics description includes funnels"
        }
      ]
    },
    {
      "group": "Product Experimentation",
      "rows": [
        {
          "feature": "Feature flags",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "A/B testing",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Audience/segment building",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "GA's Audience Builder targets remarketing and report segmentation"
        }
      ]
    },
    {
      "group": "Session Replay",
      "rows": [
        {
          "feature": "Session recording/replay",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Data Export & Integrations",
      "rows": [
        {
          "feature": "Raw data export (BigQuery)",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Daily export on GA4 free tier, streaming export on GA360"
        },
        {
          "feature": "Ads platform integration",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Native Google Ads integration for attribution and remarketing"
        },
        {
          "feature": "Custom dimensions, metrics, conversions",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "AI & Predictive Insights",
      "rows": [
        {
          "feature": "Predictive metrics (e.g. purchase/churn probability)",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Requires sufficient historical conversion data on the GA property"
        }
      ]
    },
    {
      "group": "Platform Coverage",
      "rows": [
        {
          "feature": "Unified web + mobile app measurement",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "GA combines web and app data via Firebase SDK into one property"
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Free tier",
          "toolA": "available",
          "toolB": "available",
          "note": "GA4 Standard is free; PostHog's pricing model is documented as Freemium"
        },
        {
          "feature": "Custom/enterprise pricing tier",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Google Analytics 360 is a custom-priced enterprise tier"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is cheaper, Google Analytics or PostHog?",
      "answer": "Google Analytics has a clearly documented free tier (GA4 Standard) covering core reporting, with a custom-priced Google Analytics 360 tier for enterprise needs; PostHog's pricing model is documented as freemium, but specific plan pricing isn't available in the data here, so a direct cost comparison beyond 'both offer a free entry point' can't be made."
    },
    {
      "question": "Does PostHog do the same thing as Google Analytics?",
      "answer": "Not exactly — PostHog is a product analytics platform that adds feature flags, session replay, and A/B testing on top of event tracking, while Google Analytics is focused on website/app traffic, marketing attribution, and conversion reporting; both track events, but they're built for different jobs."
    },
    {
      "question": "Is Google Analytics good for beginners?",
      "answer": "It has a documented steep learning curve, particularly for teams used to the older Universal Analytics' session-based reports, since GA4's event-based model changed report names, default metrics, and how funnels and conversions are set up."
    },
    {
      "question": "Can PostHog replace Google Analytics?",
      "answer": "PostHog can cover in-product event tracking and behavior analysis, but Google Analytics offers documented capabilities — like native Google Ads integration, BigQuery export, and cross-platform web/app measurement — that aren't confirmed as part of PostHog's feature set, so replacing GA entirely would leave those marketing-attribution capabilities uncovered."
    },
    {
      "question": "Which tool has feature flags and session replay?",
      "answer": "PostHog documents both feature flags (to toggle features for specific users or segments) and session replay (recordings of real user sessions) as built-in capabilities; neither is documented as part of Google Analytics."
    },
    {
      "question": "Which tool is better for marketing versus product teams?",
      "answer": "Google Analytics is built around marketing and traffic questions — acquisition, conversions, and Google Ads attribution — while PostHog is built around product questions — in-app behavior, feature rollout, and experimentation — so the better fit depends on which team and use case is driving the decision."
    }
  ]
};

export default googleAnalyticsVsPosthogContent;
