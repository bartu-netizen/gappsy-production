import type { ToolComparisonContent } from './types';

const fathomAnalyticsVsSimpleAnalyticsContent: ToolComparisonContent = {
  "verdict": "Fathom Analytics and Simple Analytics are both cookieless, privacy-first alternatives to Google Analytics, and the two overlap heavily on their core promise. The practical difference comes down to plan structure and extras: Fathom offers no permanent free plan but keeps data forever and includes a rate-limited API, while Simple Analytics offers a genuinely free forever tier plus an AI assistant and GA4 compatibility for teams transitioning gradually.",
  "bestForToolA": "Teams that want permanent, un-expiring analytics history from day one and are comfortable starting on a paid plan (with a 7-day trial) rather than a free tier — Fathom is used by over one million sites including IBM and GitHub.",
  "bestForToolB": "Teams that want to try a free forever tier before paying, want to run analytics alongside an existing Google Analytics 4 install during a transition, or want an AI assistant for exploring their data.",
  "whoNeedsBoth": "Agencies evaluating privacy-first analytics vendors for different clients may reasonably trial both, since the facts show materially different plan structures (permanent free tier vs. none) that could suit different client budgets and timelines.",
  "keyDifferences": [
    {
      "title": "Free plan availability",
      "toolA": "Fathom has no permanent free plan — only a 7-day free trial.",
      "toolB": "Simple Analytics offers a forever-free tier (1 user, 5 websites, 1 month of history).",
      "whyItMatters": "Teams wanting to test long-term before paying anything have a real free option with Simple Analytics but not Fathom.",
      "benefitsWho": "Budget-conscious solo site owners or small projects not ready to commit to a paid plan."
    },
    {
      "title": "Data retention",
      "toolA": "Fathom retains analytics data forever rather than expiring it.",
      "toolB": "Simple Analytics' free tier is limited to 1 month of history.",
      "whyItMatters": "Forever retention matters for teams tracking long-term trends without needing to export data before it disappears.",
      "benefitsWho": "Teams that rely on historical trend analysis over multiple years."
    },
    {
      "title": "AI-assisted analysis",
      "toolA": "Fathom's facts don't document an AI assistant feature.",
      "toolB": "Simple Analytics includes an AI-powered assistant for exploring analytics data.",
      "whyItMatters": "An AI assistant can lower the bar for non-technical users to query traffic data without learning dashboard filters.",
      "benefitsWho": "Non-technical stakeholders who want quick answers from traffic data without learning the dashboard."
    },
    {
      "title": "Running alongside Google Analytics",
      "toolA": "Fathom's facts don't document explicit GA4 compatibility.",
      "toolB": "Simple Analytics explicitly supports running alongside an existing GA4 installation.",
      "whyItMatters": "Teams migrating away from GA4 gradually can validate numbers side-by-side before fully switching.",
      "benefitsWho": "Teams in the middle of a GA4-to-privacy-first migration who want a validation period."
    },
    {
      "title": "Company origin and founding",
      "toolA": "Fathom was founded in 2018 and is independently owned with no venture capital backing.",
      "toolB": "Simple Analytics was also founded in 2018 and is headquartered in Amsterdam, Netherlands.",
      "whyItMatters": "Both share a founding year, but Fathom's facts specifically emphasize independent, non-VC ownership, which some privacy-focused buyers weigh when picking a vendor.",
      "benefitsWho": "Buyers who factor a vendor's ownership structure into procurement decisions."
    }
  ],
  "featureMatrix": [
    {
      "group": "Privacy & Compliance",
      "rows": [
        {
          "feature": "Cookieless tracking",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "GDPR/CCPA/ePrivacy compliance",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "SOC 2 compliance",
          "toolA": "not-documented",
          "toolB": "limited",
          "note": "Simple Analytics lists SOC 2 as in progress rather than in place."
        }
      ]
    },
    {
      "group": "Data & Reporting",
      "rows": [
        {
          "feature": "Forever data retention",
          "toolA": "available",
          "toolB": "limited",
          "note": "Simple Analytics' free tier is limited to 1 month of history."
        },
        {
          "feature": "Email reports",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Analytics API",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Fathom's API is rate-limited to 600 requests/hour."
        },
        {
          "feature": "AI assistant",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Plans & Trials",
      "rows": [
        {
          "feature": "Free forever plan",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Free trial",
          "toolA": "available",
          "toolB": "available",
          "note": "Fathom offers 7 days; Simple Analytics offers 14 days with no credit card required."
        },
        {
          "feature": "GA4 compatibility",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Fathom Analytics have a free plan?",
      "answer": "No — Fathom only offers a 7-day free trial, with no permanent free tier documented."
    },
    {
      "question": "Does Simple Analytics have a free plan?",
      "answer": "Yes, a forever-free tier limited to 1 user, 5 websites, and 1 month of history."
    },
    {
      "question": "Which tool keeps data longer?",
      "answer": "Fathom explicitly retains data forever; Simple Analytics' free tier is limited to 1 month of history."
    },
    {
      "question": "Can I run Simple Analytics alongside Google Analytics?",
      "answer": "Yes, Simple Analytics is documented as GA4-compatible, so it can run alongside an existing GA4 installation."
    },
    {
      "question": "Which tool includes an AI assistant?",
      "answer": "Simple Analytics includes an AI-powered assistant for exploring analytics data; this isn't documented for Fathom."
    },
    {
      "question": "Where is each company based?",
      "answer": "Simple Analytics is headquartered in Amsterdam, Netherlands; Fathom's headquarters isn't documented in the facts, though it was founded the same year, 2018."
    }
  ]
};

export default fathomAnalyticsVsSimpleAnalyticsContent;
