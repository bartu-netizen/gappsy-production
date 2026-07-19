import type { GroupComparisonContent } from './types';

const litlyxVsMedamaAnalyticsVsOpenWebAnalyticsContent: GroupComparisonContent = {
  "verdict": "Litlyx, Medama Analytics, and Open Web Analytics are all self-hostable, privacy-oriented alternatives to Google Analytics, but they differ in maturity and how much is included beyond basic pageview tracking. Litlyx is the newest and only one with an official managed cloud option plus AI-generated reporting, Medama is the most minimal and deliberately lightweight self-hosted binary, and Open Web Analytics is the most established of the three, dating to 2006, with built-in heatmaps and session visualization that neither newer tool documents. Teams choosing between them are really choosing between AI-augmented convenience, minimalist self-hosting, and long-running feature depth.",
  "bestFor": {
    "litlyx": "Agencies and freelancers who want AI-generated client reports, multi-workspace management, and the flexibility of either a hosted cloud plan or self-hosting",
    "medama-analytics": "Developers who want an extremely lightweight, dependency-free self-hosted analytics binary with a fully documented REST API and minimal server requirements",
    "open-web-analytics": "Organizations that want a mature, entirely free, self-hosted PHP and MySQL analytics platform with built-in heatmaps and session visualization, and no cloud dependency at all"
  },
  "highlights": [
    {
      "title": "Only Litlyx offers a managed cloud plan",
      "description": "Litlyx sells hosted cloud tiers starting at EUR 8.99 per month alongside a free self-hosted option, while Medama Analytics and Open Web Analytics are documented as self-hosted only, with no official SaaS product to fall back on.",
      "toolSlugs": [
        "litlyx"
      ]
    },
    {
      "title": "Medama is built to be the lightest possible self-hosted install",
      "description": "Medama ships as a single dependency-free binary that the project states can run on virtual machines with as little as 256 MB of memory, with a tracker script kept under 1 KB to minimize page-load impact.",
      "toolSlugs": [
        "medama-analytics"
      ]
    },
    {
      "title": "Open Web Analytics brings the deepest visual feature set",
      "description": "OWA includes heatmap generation and a session-replay-style DOMstream feature that neither Litlyx nor Medama documents, reflecting nearly two decades of development since its original 2006 release.",
      "toolSlugs": [
        "open-web-analytics"
      ]
    },
    {
      "title": "AI-generated reporting is unique to Litlyx",
      "description": "Litlyx layers one-click AI-generated summaries of web, product, SEO, and marketing performance on top of standard analytics, a capability not present in Medama's or OWA's documented feature sets.",
      "toolSlugs": [
        "litlyx"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Deployment and Hosting",
      "rows": [
        {
          "feature": "Official hosted or cloud SaaS option",
          "statuses": {
            "litlyx": "available",
            "medama-analytics": "unavailable",
            "open-web-analytics": "unavailable"
          }
        },
        {
          "feature": "Free self-hosting option",
          "statuses": {
            "litlyx": "available",
            "medama-analytics": "available",
            "open-web-analytics": "available"
          }
        }
      ]
    },
    {
      "group": "Privacy and Tracking",
      "rows": [
        {
          "feature": "Cookie-free tracking by design",
          "statuses": {
            "litlyx": "available",
            "medama-analytics": "available",
            "open-web-analytics": "not-documented"
          }
        },
        {
          "feature": "Funnel or multi-step conversion tracking",
          "statuses": {
            "litlyx": "available",
            "medama-analytics": "not-documented",
            "open-web-analytics": "limited"
          },
          "note": "OWA documents configurable custom event and action tracking but not a dedicated multi-step funnel feature."
        }
      ]
    },
    {
      "group": "Visualization and Reporting",
      "rows": [
        {
          "feature": "Heatmaps or session-replay-style visualization",
          "statuses": {
            "litlyx": "not-documented",
            "medama-analytics": "not-documented",
            "open-web-analytics": "available"
          }
        },
        {
          "feature": "AI-generated report summaries",
          "statuses": {
            "litlyx": "available",
            "medama-analytics": "unavailable",
            "open-web-analytics": "unavailable"
          }
        }
      ]
    },
    {
      "group": "Integration and Scale",
      "rows": [
        {
          "feature": "Documented REST API for custom integrations",
          "statuses": {
            "litlyx": "not-documented",
            "medama-analytics": "available",
            "open-web-analytics": "available"
          }
        },
        {
          "feature": "Multi-site management from a single install or account",
          "statuses": {
            "litlyx": "available",
            "medama-analytics": "not-documented",
            "open-web-analytics": "available"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Do any of these tools require a cookie consent banner?",
      "answer": "Litlyx and Medama Analytics are both explicitly designed to be cookie-free and avoid personally identifying data, which is intended to let sites skip a consent banner for analytics. Open Web Analytics does not document a cookie-free tracking approach, so its consent requirements may depend on how it is configured."
    },
    {
      "question": "Which of these offers a managed cloud version so I don't have to run my own server?",
      "answer": "Litlyx is the only one with an official hosted cloud product, with paid tiers starting at EUR 8.99 per month; Medama Analytics and Open Web Analytics are both self-hosted only with no official SaaS offering."
    },
    {
      "question": "Which tool has heatmaps?",
      "answer": "Open Web Analytics is the only one of the three that documents heatmap generation, along with a session-visualization feature called DOMstream. Neither Litlyx nor Medama Analytics documents heatmap functionality."
    },
    {
      "question": "Which is the most lightweight to self-host?",
      "answer": "Medama Analytics is built specifically for this: it ships as a single dependency-free binary with a tracker script under 1 KB and can reportedly run on a virtual machine with as little as 256 MB of memory."
    },
    {
      "question": "Can I get AI-generated summaries of my analytics data with any of these?",
      "answer": "Yes, but only with Litlyx, which offers one-click AI-generated reports summarizing web, product, SEO, and marketing performance. This is not a documented feature of Medama Analytics or Open Web Analytics."
    },
    {
      "question": "Which is best for an agency managing several client websites?",
      "answer": "Litlyx supports multi-domain workspaces and shareable branded client reports, while Open Web Analytics can monitor an effectively unlimited number of websites from a single self-hosted instance. Medama Analytics does not document multi-site management features."
    }
  ]
};

export default litlyxVsMedamaAnalyticsVsOpenWebAnalyticsContent;
