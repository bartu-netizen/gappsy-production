import type { RoundupContent } from './types';

const brazeVsHubspotVsIterableContent: RoundupContent = {
  "verdict": "There is no single winner here because these three tools solve different problems at different budgets. HubSpot is the only one of the three with a genuinely free, self-serve entry point and a unified CRM, so it fits teams that want marketing, sales, and service on one shared database without a six-figure contract. Braze and Iterable are both enterprise, quote-only, cross-channel engagement platforms built for high-volume behavioral messaging, with Iterable marketed as more marketer-friendly to implement and Braze leaning on a longer public-company track record and its Currents data-streaming pipeline. The right pick depends on whether you need an all-in-one CRM stack (HubSpot) or a dedicated real-time engagement engine for a consumer app or e-commerce brand (Braze or Iterable).",
  "bestFor": {
    "braze": "Venture-backed or public consumer brands with dedicated engineering and growth resources that need mature, event-triggered cross-channel messaging and a Currents pipeline into an existing data warehouse or CDP.",
    "hubspot": "Small businesses through mid-market teams that want a genuinely free CRM to start with, then grow into unified marketing, sales, and service automation without stitching together separate tools.",
    "iterable": "Marketing teams that want sophisticated cross-channel journey orchestration and AI-driven personalization (Nova Agent, Brand Affinity, Predictive Goals) without needing heavy engineering support to run it."
  },
  "highlights": [
    {
      "title": "Only HubSpot has public, self-serve pricing",
      "description": "Braze and Iterable both require a custom sales quote with no published list pricing, while HubSpot publishes per-seat pricing for every tier starting from a permanently free CRM.",
      "toolSlugs": [
        "braze",
        "hubspot",
        "iterable"
      ]
    },
    {
      "title": "HubSpot unifies marketing, sales, and service; Braze and Iterable are engagement specialists",
      "description": "HubSpot's Hubs share one CRM record across marketing, sales, and support, whereas Braze and Iterable are purpose-built messaging and journey-orchestration layers meant to sit alongside a company's existing CRM or CDP.",
      "toolSlugs": [
        "hubspot"
      ]
    },
    {
      "title": "Iterable positions itself as easier to run without engineering",
      "description": "Iterable's own positioning emphasizes marketer-controlled segmentation and journey building without heavy engineering support, contrasting with Braze's requirement for SDK integration and data engineering resources.",
      "toolSlugs": [
        "braze",
        "iterable"
      ]
    },
    {
      "title": "All three have invested heavily in generative AI, but with different focuses",
      "description": "Braze offers Sage AI decisioning and content assistance, Iterable's Nova Agent can autonomously build and optimize campaigns, and HubSpot's Breeze AI spans content generation, chatbots, and predictive lead scoring across Hubs.",
      "toolSlugs": [
        "braze",
        "hubspot",
        "iterable"
      ]
    },
    {
      "title": "Braze's Currents feature is built for teams with existing data infrastructure",
      "description": "Currents streams engagement data out to a company's own warehouse (Snowflake, BigQuery) or CDP, a capability aimed squarely at organizations that already run their own analytics stack.",
      "toolSlugs": [
        "braze"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core capabilities",
      "rows": [
        {
          "feature": "Visual journey or workflow builder",
          "statuses": {
            "braze": "available",
            "hubspot": "available",
            "iterable": "available"
          },
          "note": "Braze uses Canvas, Iterable uses Studio, and HubSpot's workflow builder is available on Marketing Hub Professional and above."
        },
        {
          "feature": "Cross-channel messaging (email, push, SMS, in-app)",
          "statuses": {
            "braze": "available",
            "hubspot": "limited",
            "iterable": "available"
          },
          "note": "HubSpot's engagement channels center on email, forms, and chat rather than native push and SMS orchestration."
        },
        {
          "feature": "Unified CRM with sales and service records",
          "statuses": {
            "braze": "unavailable",
            "hubspot": "available",
            "iterable": "unavailable"
          }
        }
      ]
    },
    {
      "group": "AI and personalization",
      "rows": [
        {
          "feature": "AI-assisted content or campaign generation",
          "statuses": {
            "braze": "available",
            "hubspot": "available",
            "iterable": "available"
          }
        },
        {
          "feature": "Predictive per-user scoring (churn, conversion, or lead)",
          "statuses": {
            "braze": "limited",
            "hubspot": "limited",
            "iterable": "available"
          },
          "note": "Iterable's Predictive Goals explicitly forecasts churn risk and conversion likelihood; Braze offers predictive segmentation and HubSpot offers predictive lead scoring, both narrower in scope."
        }
      ]
    },
    {
      "group": "Pricing and access",
      "rows": [
        {
          "feature": "Free or low-cost self-serve entry tier",
          "statuses": {
            "braze": "unavailable",
            "hubspot": "available",
            "iterable": "unavailable"
          }
        },
        {
          "feature": "Published list pricing",
          "statuses": {
            "braze": "unavailable",
            "hubspot": "available",
            "iterable": "unavailable"
          }
        }
      ]
    },
    {
      "group": "Data and integrations",
      "rows": [
        {
          "feature": "Data warehouse streaming or export pipeline",
          "statuses": {
            "braze": "available",
            "hubspot": "not-documented",
            "iterable": "available"
          },
          "note": "Braze's Currents and Iterable's data platform integrations both explicitly support syncing to warehouses like Snowflake; this isn't documented as a core HubSpot capability."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three tools has a free plan?",
      "answer": "Only HubSpot does. Its Free CRM tier supports unlimited users with contact and deal records, email tracking, live chat, and basic reporting. Braze and Iterable have no self-serve free tier and require a custom enterprise quote."
    },
    {
      "question": "Do Braze and Iterable publish their pricing?",
      "answer": "No. Both are sold through enterprise sales with usage-based pricing tied primarily to monthly active users or contacts. Third-party trackers estimate Braze's entry tier around $30,000 to $60,000 per year and Iterable's Growth tier around $36,000 to $72,000 per year, but neither company publishes exact rates."
    },
    {
      "question": "Which platform is easiest to implement without dedicated engineering support?",
      "answer": "HubSpot is designed for marketers to set up without engineering help. Between the two enterprise platforms, Iterable positions itself around marketer-controlled segmentation and journey building, while Braze explicitly requires SDK integration into mobile apps and websites plus data pipeline setup."
    },
    {
      "question": "Which tool fits a B2B SaaS or services business versus a consumer app?",
      "answer": "HubSpot's customer base skews toward B2B SaaS, agencies, and services businesses using inbound marketing and a unified CRM. Braze and Iterable both target consumer-facing brands in e-commerce, media, fintech, and on-demand services that need always-on, event-triggered lifecycle messaging."
    },
    {
      "question": "Which of these can stream engagement data into my own data warehouse?",
      "answer": "Braze offers Currents for streaming engagement data to Snowflake, BigQuery, or a CDP, and Iterable syncs with data warehouses and CRMs like Salesforce as part of its data platform integrations. This kind of warehouse-streaming pipeline is not documented as a core HubSpot feature."
    }
  ]
};

export default brazeVsHubspotVsIterableContent;
