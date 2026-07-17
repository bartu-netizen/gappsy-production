import type { ToolComparisonContent } from './types';

const billsbyVsMetronomeContent: ToolComparisonContent = {
  "verdict": "Billsby and Metronome both handle subscription monetization but for different billing paradigms: Billsby is built around traditional fixed-plan recurring billing with a free tier and flat monthly fees, while Metronome is built around real-time usage metering and consumption-based billing for products like AI/SaaS platforms with variable usage, and its Starter pricing is structured around included billing volume and event counts rather than a flat monthly fee.",
  "bestForToolA": "Billsby fits subscription businesses with more traditional recurring billing needs -- unlimited products/plans/cycles, automated dunning, and tax compliance -- that want to start on a free plan and scale into flat $45/month or $135/month tiers as revenue grows.",
  "bestForToolB": "Metronome fits companies with consumption-based or hybrid pricing models -- especially AI/SaaS platforms needing real-time usage metering, rate cards, spend controls, and in-product billing dashboards -- that can work within Starter-tier pricing built around $100,000 of included billing volume and 10M included events.",
  "whoNeedsBoth": "A company transitioning from flat subscription plans to usage-based pricing might start on Billsby's flat-fee model and later adopt Metronome as it introduces metered pricing, but the facts don't describe a case for running both concurrently for the same billing flow.",
  "keyDifferences": [
    {
      "title": "Billing paradigm",
      "toolA": "Built around fixed subscription products, plans, and billing cycles with automated dunning.",
      "toolB": "Built around real-time usage metering with rate cards and support for usage-based, seat-based, subscription, and hybrid pricing models.",
      "whyItMatters": "Usage-based products (e.g., API/AI platforms) need per-event metering that fixed-plan billing tools aren't designed for.",
      "benefitsWho": "SaaS companies with variable/metered usage (like AI or API products) need Metronome-style metering; companies with flat recurring plans are well served by Billsby."
    },
    {
      "title": "Free tier availability",
      "toolA": "Offers a free plan with unlimited testing and no time limit before going live.",
      "toolB": "No free trial or free plan is mentioned.",
      "whyItMatters": "A free tier lowers the barrier to testing a billing platform before committing to revenue-share or overage fees.",
      "benefitsWho": "Early-stage or smaller companies wanting to test billing setup without upfront cost."
    },
    {
      "title": "Pricing overage structure",
      "toolA": "Flat monthly fee ($45 Core / $135 Pro) plus a percentage (0.4%-0.5%) on revenue above a monthly threshold ($15,000 / $30,000).",
      "toolB": "Starter plan includes $100,000 in billing volume (0.8% overage after) and 10M events ($0.04 per 1,000 events after).",
      "whyItMatters": "The two overage models scale differently -- Billsby's is revenue-percentage-based, Metronome's is billing-volume- and event-count-based -- which matters for cost forecasting at different usage patterns.",
      "benefitsWho": "Finance teams forecasting billing-platform costs based on their own revenue or event volume patterns."
    },
    {
      "title": "Stripe integration and ownership",
      "toolA": "Not documented as integrating natively with Stripe or being owned by Stripe.",
      "toolB": "Native Stripe integration, and Metronome is now part of Stripe, combining both companies' monetization capabilities.",
      "whyItMatters": "Native Stripe ownership/integration can simplify payment processing for companies already on Stripe.",
      "benefitsWho": "Companies already using Stripe for payments wanting tighter native integration."
    },
    {
      "title": "Customer-facing usage dashboards",
      "toolA": "Not documented as offering embeddable, customer-facing usage dashboards.",
      "toolB": "Provides embeddable in-product billing dashboards giving customers visibility into their own usage and spend.",
      "whyItMatters": "Customer-facing usage visibility reduces support tickets and billing disputes for usage-based products.",
      "benefitsWho": "Product teams building self-service usage/spend visibility into their own app for end customers."
    }
  ],
  "featureMatrix": [
    {
      "group": "Billing Model & Core Features",
      "rows": [
        {
          "feature": "Recurring/subscription plan billing",
          "toolA": "available",
          "toolB": "available",
          "note": "Metronome supports subscription pricing alongside usage-based and hybrid models."
        },
        {
          "feature": "Real-time usage metering",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Multiple payment gateways",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Billsby's Pro plan."
        },
        {
          "feature": "Automated dunning",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Rate cards / pricing experimentation",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Tax compliance",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Billsby's Pro plan."
        }
      ]
    },
    {
      "group": "Pricing",
      "rows": [
        {
          "feature": "Free plan",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Published starting price",
          "toolA": "available",
          "toolB": "available",
          "note": "Billsby Core: $45/month. Metronome Starter: $100,000 billing volume included."
        },
        {
          "feature": "Revenue/volume-based overage fee",
          "toolA": "available",
          "toolB": "available",
          "note": "Billsby: 0.4%-0.5% on revenue over threshold. Metronome: 0.8% on billing volume over $100k, or $0.04/1k events over 10M."
        },
        {
          "feature": "Full API access",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Billsby's Pro plan explicitly includes full API access."
        }
      ]
    },
    {
      "group": "Analytics & Integrations",
      "rows": [
        {
          "feature": "Stripe integration",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "In-product customer-facing billing dashboards",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Usage/revenue analytics reporting",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Named enterprise customers cited",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Metronome cites OpenAI, Cribl, and Fly.io; Billsby cites a G2 rating instead."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "What's the core difference between Billsby and Metronome?",
      "answer": "Billsby is built for traditional fixed-plan subscription billing with products, plans, and cycles. Metronome is built for real-time usage metering and supports usage-based, seat-based, subscription, and hybrid pricing models."
    },
    {
      "question": "Does either have a free plan?",
      "answer": "Billsby offers a free plan with unlimited testing and no time limit. Metronome doesn't mention a free trial or free plan."
    },
    {
      "question": "How is each platform priced?",
      "answer": "Billsby's Core plan is $45/month plus 0.4% on revenue over $15,000/month. Metronome's Starter plan includes $100,000 in billing volume (0.8% overage after) and 10M events ($0.04 per 1,000 events after)."
    },
    {
      "question": "Is Metronome still an independent company?",
      "answer": "No, Metronome is now part of Stripe, combining both companies' monetization capabilities, and it has a native Stripe integration."
    },
    {
      "question": "Who uses Metronome?",
      "answer": "Companies including OpenAI, Cribl, and Fly.io are cited as Metronome customers."
    },
    {
      "question": "What does Billsby's Pro plan add over Core?",
      "answer": "The Pro plan adds user permissions, multiple payment gateways, ACH processing, multiple tax regions, FreeAgent/TaxJar integrations, advanced reporting, multi-language support, and full API access, for $135/month plus 0.5% on revenue over $30,000/month."
    }
  ]
};

export default billsbyVsMetronomeContent;
