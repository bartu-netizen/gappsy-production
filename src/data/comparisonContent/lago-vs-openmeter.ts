import type { ToolComparisonContent } from './types';

const lagoVsOpenmeterContent: ToolComparisonContent = {
  "verdict": "Lago and OpenMeter are both open-source, Apache/permissive-licensed billing infrastructure tools, but their scope differs: Lago is a full billing platform covering usage metering, invoicing, entitlements, dunning, and revenue analytics, while OpenMeter is more narrowly focused on real-time usage metering and usage-based product catalog/gating, now operating as part of Kong, Inc. Lago tries to own the whole billing lifecycle; OpenMeter is closer to a metering and gating layer that pairs with a separate billing system like Stripe.",
  "bestForToolA": "Lago fits teams that want one open-source system to handle metering, invoicing, credit notes, entitlements, and dunning together, and that need broad integrations with payment providers (Stripe, Adyen, GoCardless), accounting (NetSuite, Xero), and tax software (Avalara, Anrok).",
  "bestForToolB": "OpenMeter fits teams that need extremely high-throughput, real-time event processing (millions of events per second) with low-latency usage gating at the edge, and that are comfortable pairing it with a separate invoicing/billing system such as Stripe.",
  "whoNeedsBoth": "There is no realistic scenario for running both together productively — they overlap directly on usage metering, and a team would typically choose one as its metering and billing backbone rather than run two competing open-source metering engines in parallel.",
  "keyDifferences": [
    {
      "title": "Scope: Full Billing vs. Metering-Centric",
      "toolA": "Lago covers usage metering, invoicing, credit notes, progressive billing, entitlements, coupons, custom contracts, dunning, and revenue analytics dashboards.",
      "toolB": "OpenMeter centers on real-time metering, usage limits/gating, and a flexible product catalog (plans, credits, commitments), with revenue insights and CRM integration layered on top.",
      "whyItMatters": "Teams need to know whether the tool will replace their invoicing system entirely or just feed usage data into one.",
      "benefitsWho": "Teams wanting an all-in-one open-source billing stack benefit from Lago's broader scope; teams that already have Stripe or another biller and just need metering benefit from OpenMeter's narrower focus."
    },
    {
      "title": "Corporate Ownership",
      "toolA": "Lago operates independently with its own open-source repository and Lago Premium/Cloud offering.",
      "toolB": "OpenMeter was acquired by Kong, Inc. in September 2025, and its pricing page now routes signups through Kong Metering & Billing, per its facts.",
      "whyItMatters": "Recent acquisitions can signal roadmap or pricing changes for a standalone open-source product.",
      "benefitsWho": "Teams already invested in the Kong ecosystem may benefit from OpenMeter's integration into Kong Metering & Billing; teams wanting an independent roadmap may prefer Lago."
    },
    {
      "title": "Throughput Claims",
      "toolA": "Lago reports processing 1M events per second and $829M in invoices monthly, as of October 2025.",
      "toolB": "OpenMeter is built for high-throughput, real-time event processing described as millions of events per second.",
      "whyItMatters": "High-volume usage-based products (API metering, AI token billing) need metering infrastructure that won't buckle under event volume.",
      "benefitsWho": "High-scale, high-event-volume products benefit from either tool's throughput claims, though OpenMeter's figure (millions per second) is stated at a higher order of magnitude than Lago's 1M/sec."
    },
    {
      "title": "Free / Self-Hosted Path",
      "toolA": "Lago's Open Source (self-hosted) plan is free and includes core billing and usage metering functionality on your own infrastructure.",
      "toolB": "OpenMeter is also free to self-host under Apache 2.0, and additionally offers a free tier on its managed Cloud product.",
      "whyItMatters": "A managed free tier lowers the barrier to trying the product versus requiring infrastructure setup first.",
      "benefitsWho": "Teams that don't want to manage infrastructure benefit from OpenMeter's Cloud Free Tier; teams that prefer full control benefit from either tool's self-hosted option."
    },
    {
      "title": "Compliance Certification",
      "toolA": "Lago is SOC 2 Type II certified with regular third-party penetration testing, and supports SSO (including Okta), RBAC, and audit logs.",
      "toolB": "OpenMeter's cloud deployments are described as SOC2-compliant with RBAC and SSO, though the specific SOC 2 type (I vs. II) is not stated in its facts.",
      "whyItMatters": "The distinction between SOC 2 Type I and Type II matters to enterprise security reviewers, since Type II reflects sustained operating effectiveness over time.",
      "benefitsWho": "Compliance-focused buyers can cite Lago's explicitly stated Type II status in procurement; OpenMeter buyers may need to request clarification on SOC 2 type."
    }
  ],
  "featureMatrix": [
    {
      "group": "Metering & Gating",
      "rows": [
        {
          "feature": "Real-time usage metering",
          "toolA": "available",
          "toolB": "available",
          "note": "OpenMeter: millions of events/sec; Lago: 1M events/sec"
        },
        {
          "feature": "Usage limits and gating",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "OpenMeter: low-latency edge checks"
        },
        {
          "feature": "Flexible product catalog (plans, credits, commitments)",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Billing & Invoicing",
      "rows": [
        {
          "feature": "Invoice generation & credit notes",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Progressive billing",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Lago: paid add-on"
        },
        {
          "feature": "Dunning workflows",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Lago: paid add-on"
        },
        {
          "feature": "Entitlements and prepaid credits",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Access, Deployment & Compliance",
      "rows": [
        {
          "feature": "Open-source self-hosting",
          "toolA": "available",
          "toolB": "available",
          "note": "Lago and OpenMeter both Apache-style OSS"
        },
        {
          "feature": "Managed cloud free tier",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "OpenMeter Cloud Free Tier"
        },
        {
          "feature": "SOC 2 certification",
          "toolA": "available",
          "toolB": "available",
          "note": "Lago: SOC 2 Type II explicitly stated"
        },
        {
          "feature": "CRM integration",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Are Lago and OpenMeter both open source?",
      "answer": "Yes. Lago is open source with a public GitHub repository (10,223+ stars) and can be self-hosted, and OpenMeter is available on GitHub under the Apache 2.0 license for self-hosted deployments."
    },
    {
      "question": "What's the difference in scope between Lago and OpenMeter?",
      "answer": "Lago covers the full billing lifecycle: metering, invoicing, credit notes, entitlements, dunning, and analytics. OpenMeter is more centered on real-time metering, usage gating, and a flexible product catalog, and is often paired with a separate invoicing system."
    },
    {
      "question": "Did OpenMeter get acquired?",
      "answer": "Yes, as of September 2025, OpenMeter was acquired by Kong, Inc. Its pricing page now routes signups through Kong Metering & Billing, which may signal future changes to the standalone product."
    },
    {
      "question": "Which handles more usage events?",
      "answer": "OpenMeter's facts describe processing 'millions of events per second,' while Lago's facts cite 1M events per second and $829M in monthly invoices as of October 2025. Both are built for high-throughput usage-based billing."
    },
    {
      "question": "Does either tool have a free tier without self-hosting?",
      "answer": "OpenMeter offers a Cloud Free Tier for its managed offering. Lago's free option, per its facts, is limited to the self-hosted open-source edition, which requires infrastructure to run."
    },
    {
      "question": "Which one is SOC 2 certified?",
      "answer": "Lago explicitly states SOC 2 Type II certification with regular third-party penetration testing. OpenMeter's cloud deployments are described only as 'SOC2-compliant' without specifying the type."
    }
  ]
};

export default lagoVsOpenmeterContent;
