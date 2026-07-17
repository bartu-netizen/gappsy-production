import type { ToolComparisonContent } from './types';

const highlightIoVsLogrocketContent: ToolComparisonContent = {
  "verdict": "Highlight.io is an open-source, self-hostable stack combining session replay, error monitoring, logging, and tracing with a free tier and low-cost paid plans, while LogRocket is a proprietary SaaS built around Galileo AI for automated session prioritization and hundreds of third-party integrations, but with no free plan and pricing that scales with session volume.",
  "bestForToolA": "Teams that want to self-host or need combined error, log, and tracing observability with a generous free tier (500 sessions, 15 seats) built on OpenTelemetry.",
  "bestForToolB": "Teams that want Galileo AI to automatically watch sessions and surface impactful issues, and that need hundreds of pre-built integrations, and are willing to start at $176/month with no free plan.",
  "whoNeedsBoth": "Organizations that self-host Highlight.io for internal engineering error, log, and tracing observability while a separate product or UX team uses LogRocket's AI-driven session analysis for customer-facing behavior.",
  "keyDifferences": [
    {
      "title": "Open source and self-hosting",
      "toolA": "Open source with a Docker-based self-hosted deployment option in addition to its cloud free plan.",
      "toolB": "Proprietary SaaS; self-hosted deployment is only available on the custom-priced Enterprise plan.",
      "whyItMatters": "Data residency, vendor lock-in, and long-term cost control differ sharply between a self-hostable tool and one where self-hosting requires an enterprise contract.",
      "benefitsWho": "Engineering teams with data-residency or compliance requirements that need infrastructure control."
    },
    {
      "title": "Free plan availability",
      "toolA": "Free forever plan covering 500 monthly sessions and up to 15 seats.",
      "toolB": "No free plan; only a 14-day free trial with full feature access before billing starts at $176/month.",
      "whyItMatters": "Teams evaluating tooling on a small budget or side project can't get ongoing production use out of LogRocket without paying.",
      "benefitsWho": "Small teams, early-stage startups, and individual developers testing observability tooling."
    },
    {
      "title": "AI-driven insight depth and cost",
      "toolA": "Free plan already includes AI error grouping.",
      "toolB": "Galileo AI auto-watches sessions and prioritizes issues, but the full AI feature set is billed as an add-on cost on the Pro plan below 100,000 sessions/month.",
      "whyItMatters": "The cost of getting full AI functionality differs: it's bundled at Highlight.io's entry tier versus gated behind usage thresholds or add-on pricing at LogRocket.",
      "benefitsWho": "Budget-conscious teams that want AI-assisted triage without separate line-item costs."
    },
    {
      "title": "Where SSO sits in the pricing tiers",
      "toolA": "SAML/SSO, RBAC, and audit logs are reserved for the top Enterprise tier only.",
      "toolB": "SSO is included on the $176/month Core plan.",
      "whyItMatters": "Teams needing SSO for compliance reasons may need to jump straight to Highlight.io's custom Enterprise pricing, while LogRocket includes it at its entry paid tier.",
      "benefitsWho": "Mid-sized teams with SSO requirements but without enterprise-scale budgets."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Features",
      "rows": [
        {
          "feature": "Session replay",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Error tracking",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Product analytics / dashboards",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Distributed tracing",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Log search and management",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Pricing & Access",
      "rows": [
        {
          "feature": "Free plan",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "LogRocket offers only a 14-day trial, no ongoing free tier."
        },
        {
          "feature": "Self-hosting",
          "toolA": "available",
          "toolB": "limited",
          "note": "LogRocket self-hosting is Enterprise-only."
        },
        {
          "feature": "SSO",
          "toolA": "limited",
          "toolB": "available",
          "note": "Highlight.io reserves SSO for Enterprise; LogRocket includes it on Core."
        }
      ]
    },
    {
      "group": "AI Capabilities",
      "rows": [
        {
          "feature": "AI-driven issue detection/grouping",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Full AI feature set at entry price",
          "toolA": "not-documented",
          "toolB": "limited",
          "note": "LogRocket's full AI set is an add-on cost below 100K sessions/month."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Highlight.io have a free plan?",
      "answer": "Yes, it's free forever for 500 monthly sessions with up to 15 seats."
    },
    {
      "question": "Is Highlight.io open source?",
      "answer": "Yes, it's open source with a GitHub repository and a Docker-based self-hosted deployment option."
    },
    {
      "question": "How much does LogRocket cost?",
      "answer": "The Core plan starts at $176/month, with pricing scaling based on session capture volume; Enterprise is custom-priced."
    },
    {
      "question": "What does Galileo AI do?",
      "answer": "Galileo AI watches every session, analyzes severity across real sessions, and delivers reproduction steps so teams can act on issues quickly."
    },
    {
      "question": "Does LogRocket offer a free trial?",
      "answer": "Yes, a 14-day free trial with full feature access is available."
    },
    {
      "question": "Can LogRocket be self-hosted?",
      "answer": "Yes, a self-hosted deployment option is available, but only on the Enterprise plan."
    }
  ]
};

export default highlightIoVsLogrocketContent;
