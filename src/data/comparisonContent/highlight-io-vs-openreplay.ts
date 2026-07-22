import type { ToolComparisonContent } from './types';

const highlightIoVsOpenreplayContent: ToolComparisonContent = {
  "verdict": "Both are open-source, self-hostable observability tools, but Highlight.io offers a free cloud tier plus broader stated compliance (SOC2, HIPAA, ISO) and distributed tracing, while OpenReplay adds product analytics and live co-browsing yet has no free cloud tier — its cheapest managed plan starts at $199/month.",
  "bestForToolA": "Teams wanting a free cloud tier (500 sessions, 15 seats), distributed tracing, and SOC2/HIPAA/ISO certification without needing to self-host.",
  "bestForToolB": "Teams that specifically need live co-browsing with remote control and video calling for real-time customer support, and are comfortable either self-hosting for free or paying $199/month for managed cloud.",
  "whoNeedsBoth": "Engineering teams that self-host Highlight.io for internal error, log, and tracing observability while running OpenReplay's managed cloud for customer-support co-browsing sessions.",
  "keyDifferences": [
    {
      "title": "Free tier structure",
      "toolA": "Free cloud plan covering 500 monthly sessions and up to 15 seats.",
      "toolB": "No free cloud tier; the free option is the self-hosted open-source version, with the cheapest managed cloud plan starting at $199/month ($0.276/hr).",
      "whyItMatters": "Teams that don't want to manage infrastructure but still want a no-cost entry point can get one with Highlight.io but not with OpenReplay's cloud offering.",
      "benefitsWho": "Teams without the DevOps capacity to self-host but wanting a free evaluation option."
    },
    {
      "title": "Co-browsing",
      "toolA": "No co-browsing feature is documented.",
      "toolB": "Offers real-time collaborative browsing with remote control, annotations, and video calling.",
      "whyItMatters": "Teams needing to jump into a live customer session to troubleshoot in real time have a documented feature with OpenReplay that Highlight.io doesn't list.",
      "benefitsWho": "Customer support and success teams handling live troubleshooting sessions."
    },
    {
      "title": "Stated compliance certifications",
      "toolA": "SOC2, HIPAA, and ISO certified.",
      "toolB": "SOC2 Type II compliant on the managed cloud offering; HIPAA and ISO are not mentioned.",
      "whyItMatters": "Teams in healthcare or other regulated industries have broader documented compliance coverage with Highlight.io.",
      "benefitsWho": "Regulated industries requiring HIPAA or ISO documentation."
    },
    {
      "title": "AI feature maturity",
      "toolA": "Free plan already includes AI error grouping.",
      "toolB": "AI agent features are explicitly listed as in development, not yet available.",
      "whyItMatters": "Teams wanting AI assistance today have a shipped feature with Highlight.io, while OpenReplay's AI capability isn't yet usable.",
      "benefitsWho": "Teams that want AI-assisted triage now rather than on a future roadmap."
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
          "feature": "Error monitoring",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Product analytics",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Co-browsing",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Distributed tracing",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Mobile analytics",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Open Source & Hosting",
      "rows": [
        {
          "feature": "Open source",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Self-hosting",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Free cloud tier",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "OpenReplay's only free option is self-hosting; managed cloud starts at $199/month."
        }
      ]
    },
    {
      "group": "Compliance & AI",
      "rows": [
        {
          "feature": "SOC2 / HIPAA / ISO certification",
          "toolA": "available",
          "toolB": "limited",
          "note": "OpenReplay states SOC2 Type II on managed cloud only."
        },
        {
          "feature": "AI capabilities available today",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "OpenReplay's AI agent features are in development."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Highlight.io have a free plan?",
      "answer": "Yes, free forever for 500 monthly sessions with up to 15 seats."
    },
    {
      "question": "Is Highlight.io open source?",
      "answer": "Yes, it's open source with a GitHub repository and a self-hosted deployment option."
    },
    {
      "question": "Is OpenReplay free?",
      "answer": "Yes, the self-hosted open-source version is free to run on your own infrastructure."
    },
    {
      "question": "How much does managed OpenReplay cost?",
      "answer": "The Dedicated cloud plan starts at $199/month ($0.276/hr)."
    },
    {
      "question": "Does OpenReplay offer a free trial?",
      "answer": "Yes, a 7-day free trial of the Dedicated plan with no credit card required."
    },
    {
      "question": "Is OpenReplay SOC 2 compliant?",
      "answer": "Yes, its managed cloud offering is SOC 2 Type II compliant."
    }
  ]
};

export default highlightIoVsOpenreplayContent;
