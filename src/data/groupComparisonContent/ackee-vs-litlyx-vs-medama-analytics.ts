import type { GroupComparisonContent } from './types';

const ackeeVsLitlyxVsMedamaAnalyticsContent: GroupComparisonContent = {
  "verdict": "Ackee, Litlyx, and Medama Analytics are all cookieless, privacy-first alternatives to Google Analytics built for developers who want to self-host and own their data, but they sit at different points on the maturity and convenience spectrum. Ackee and Medama Analytics are purely open-source, self-hosted projects with no company or managed cloud behind them, while Litlyx is a young, venture-backed startup that pairs a free self-hosted option with a polished hosted SaaS plan and AI-generated reporting. Teams that want zero cost and full control should look at Ackee or Medama Analytics, while agencies and small businesses that want a managed product with AI reporting and support will lean toward Litlyx.",
  "bestFor": {
    "ackee": "Developers who already run Node.js and MongoDB infrastructure and want a free, cookie-free multi-site dashboard with a GraphQL API for custom integrations.",
    "litlyx": "Agencies, freelancers, and small businesses that want a fast-to-set-up, GDPR-compliant analytics tool with AI-generated client reports and the option to self-host for free.",
    "medama-analytics": "Developers and small-to-medium site operators who want the lightest possible self-hosted footprint, running as a single dependency-free binary with minimal server resources."
  },
  "highlights": [
    {
      "title": "Free and open source at the core",
      "description": "All three tools offer a fully free, self-hosted path with no vendor subscription required, appealing to teams that want to avoid recurring analytics costs entirely.",
      "toolSlugs": [
        "ackee",
        "litlyx",
        "medama-analytics"
      ]
    },
    {
      "title": "Cookieless by design",
      "description": "Each tool avoids cookies and personal identifiers, which means sites can typically skip a cookie-consent banner for analytics purposes and stay closer to GDPR compliance out of the box.",
      "toolSlugs": [
        "ackee",
        "litlyx",
        "medama-analytics"
      ]
    },
    {
      "title": "Only Litlyx offers a managed cloud plan",
      "description": "Litlyx is the only one of the three with an official hosted SaaS tier, starting at EUR 8.99 per month, so teams that do not want to manage their own servers have a supported option.",
      "toolSlugs": [
        "litlyx"
      ]
    },
    {
      "title": "AI-generated reporting sets Litlyx apart",
      "description": "Litlyx layers AI-powered, one-click reports and conversion funnel analysis on top of standard traffic metrics, a feature neither Ackee nor Medama Analytics offers.",
      "toolSlugs": [
        "litlyx"
      ]
    },
    {
      "title": "Minimal infrastructure footprint",
      "description": "Medama Analytics ships as a single dependency-free binary that the project says can run on as little as 256MB of memory, making it the lightest self-hosting option of the three.",
      "toolSlugs": [
        "medama-analytics"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Tracking",
      "rows": [
        {
          "feature": "Cookie-free tracking",
          "statuses": {
            "ackee": "available",
            "litlyx": "available",
            "medama-analytics": "available"
          }
        },
        {
          "feature": "Custom event tracking",
          "statuses": {
            "ackee": "available",
            "litlyx": "available",
            "medama-analytics": "not-documented"
          }
        },
        {
          "feature": "Conversion funnel analysis",
          "statuses": {
            "ackee": "unavailable",
            "litlyx": "available",
            "medama-analytics": "unavailable"
          }
        }
      ]
    },
    {
      "group": "Deployment and Access",
      "rows": [
        {
          "feature": "Self-hosted deployment",
          "statuses": {
            "ackee": "available",
            "litlyx": "available",
            "medama-analytics": "available"
          },
          "note": "Ackee and Medama Analytics are self-hosted only; Litlyx offers self-hosting alongside a hosted cloud option"
        },
        {
          "feature": "Managed hosted (SaaS) plan",
          "statuses": {
            "ackee": "unavailable",
            "litlyx": "available",
            "medama-analytics": "unavailable"
          }
        },
        {
          "feature": "Documented API for integrations",
          "statuses": {
            "ackee": "available",
            "litlyx": "not-documented",
            "medama-analytics": "available"
          },
          "note": "Ackee exposes a GraphQL API; Medama Analytics exposes an OpenAPI-documented REST API"
        }
      ]
    },
    {
      "group": "Reporting and Collaboration",
      "rows": [
        {
          "feature": "AI-generated reports",
          "statuses": {
            "ackee": "unavailable",
            "litlyx": "available",
            "medama-analytics": "unavailable"
          }
        },
        {
          "feature": "Multi-site or multi-workspace dashboard",
          "statuses": {
            "ackee": "available",
            "litlyx": "available",
            "medama-analytics": "not-documented"
          }
        },
        {
          "feature": "Shareable client-facing reports",
          "statuses": {
            "ackee": "unavailable",
            "litlyx": "available",
            "medama-analytics": "unavailable"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Are Ackee, Litlyx, and Medama Analytics really free to use?",
      "answer": "Yes, all three can be used entirely free if self-hosted. Ackee and Medama Analytics only exist as free, open-source, self-hosted software with no official paid tier. Litlyx also offers a free self-hosted option, but additionally sells a hosted cloud plan starting at EUR 8.99 per month for teams that prefer not to manage their own servers."
    },
    {
      "question": "Which of these tools requires the least server maintenance?",
      "answer": "Litlyx's hosted cloud plans require no server maintenance at all since Litlyx runs the infrastructure. Among the self-hosted-only options, Medama Analytics is designed to be the lightest to run, shipping as a single dependency-free binary that the project says can operate on as little as 256MB of memory, compared to Ackee which requires running and maintaining a MongoDB database."
    },
    {
      "question": "Do any of these tools require a cookie consent banner?",
      "answer": "No. Ackee, Litlyx, and Medama Analytics are all designed to track visitors without cookies or persistent identifiers, which is intended to let site owners avoid a cookie-consent banner for analytics purposes and align more easily with regulations like GDPR."
    },
    {
      "question": "Which tool is best for an agency managing multiple client websites?",
      "answer": "Litlyx is the most purpose-built for agencies, offering multi-domain workspaces and shareable, branded client reports along with AI-generated summaries. Ackee also supports monitoring multiple sites from one dashboard, though without the AI reporting or client-facing report templates that Litlyx provides."
    },
    {
      "question": "Does any of these tools offer AI-powered analytics reports?",
      "answer": "Litlyx is the only one of the three with AI-generated reporting, offering one-click summaries of web, product, SEO, and marketing performance on its paid plans. Neither Ackee nor Medama Analytics documents any AI reporting features."
    },
    {
      "question": "How mature are these projects compared to established alternatives like Google Analytics?",
      "answer": "All three are smaller, newer projects than Google Analytics. Litlyx was founded in 2024 and is an early-stage startup backed by an accelerator program, while Ackee and Medama Analytics are community-maintained open-source projects without a company behind them, so buyers should weigh their lighter feature sets and smaller support ecosystems against their lower cost and stronger data privacy."
    }
  ]
};

export default ackeeVsLitlyxVsMedamaAnalyticsContent;
