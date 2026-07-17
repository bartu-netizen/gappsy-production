import type { ToolComparisonContent } from './types';

const saleorVsVendureContent: ToolComparisonContent = {
  "verdict": "Saleor and Vendure are both open-source headless commerce platforms with paid commercial tiers, but they differ in maturity of their cloud offering and licensing: Saleor Cloud is generally available today starting at $1,599/month, with SOC 2 Type II, GDPR, and PCI-DSS compliance and proven scale (1B+ requests, 400k orders/month), while Vendure's Cloud tier is still in a design-partner stage with general availability targeted for Q4 2026, and its Platform tier requires contacting sales for pricing. Vendure is GPLv3-licensed and built on NestJS/GraphQL with a strong B2B feature set (quote-to-cash, contract pricing), while Saleor is BSD-licensed and GraphQL-native with a heavier enterprise compliance and scale story.",
  "bestForToolA": "Saleor fits enterprise merchants needing a production-ready, compliance-certified managed cloud today, particularly those with high order volume who can absorb the $1,599/month-plus Select tier cost and its GMV overage fees.",
  "bestForToolB": "Vendure fits B2B-focused commerce teams that want deep quote-to-cash workflows, contract pricing, and governance tooling (SSO, audit trails, row-level permissions) and are comfortable self-hosting the free GPLv3 Core while Vendure Cloud remains in its design-partner phase.",
  "whoNeedsBoth": "There's no practical combined use case — both are alternative headless commerce backends, so the decision comes down to whether a team needs Saleor's compliance-certified managed cloud now versus Vendure's deeper native B2B tooling while self-hosting.",
  "keyDifferences": [
    {
      "title": "License Type",
      "toolA": "Saleor's core is licensed under BSD-3-Clause.",
      "toolB": "Vendure Core is licensed under GPLv3.",
      "whyItMatters": "GPLv3 imposes copyleft obligations that BSD does not, which can affect how a company can modify and redistribute the code in commercial products.",
      "benefitsWho": "Legal and engineering teams evaluating license compatibility with their own commercial software plans."
    },
    {
      "title": "Cloud Availability",
      "toolA": "Saleor Cloud is generally available now, with published pricing tiers (Select at $1,599/month, Volume at $3,999/month, custom Enterprise).",
      "toolB": "Vendure Cloud is available only to design partners, with general availability targeted for Q4 2026; pricing is not disclosed.",
      "whyItMatters": "Teams needing a managed hosting option immediately cannot yet fully rely on Vendure Cloud, since it isn't generally available.",
      "benefitsWho": "Teams on a near-term launch timeline that need a proven managed cloud option today favor Saleor."
    },
    {
      "title": "B2B Feature Depth",
      "toolA": "Saleor's documented features focus on omnichannel processing, dynamic product modeling, and a GraphQL-native API rather than named B2B workflows.",
      "toolB": "Vendure documents explicit B2B workflows: quote-to-cash flows, bulk SKU entry, saved requisition lists, repeat-order flows, and customer-specific/contract pricing.",
      "whyItMatters": "Buyers building B2B wholesale or account-based commerce get more purpose-built tooling out of Vendure's documented feature set.",
      "benefitsWho": "B2B and wholesale commerce teams needing quote-to-cash and contract pricing workflows."
    },
    {
      "title": "Governance and Compliance",
      "toolA": "Saleor documents formal SOC 2 Type II, GDPR, and PCI-DSS compliance.",
      "toolB": "Vendure documents governance tools like SSO, audit trails, row-level permissions, and content versioning, but does not list formal third-party compliance certifications.",
      "whyItMatters": "Formal compliance certifications (Saleor) versus built-in governance controls (Vendure) serve different procurement checklists.",
      "benefitsWho": "Enterprise security/compliance teams requiring named certifications lean toward Saleor; teams needing fine-grained internal access control lean toward Vendure."
    },
    {
      "title": "Pricing Transparency",
      "toolA": "Saleor publishes specific tier pricing: Select at $1,599/month and Volume at $3,999/month, with GMV overage fees clearly listed.",
      "toolB": "Vendure's Platform tier is priced as \"Custom (contact sales)\" with no published figures, and Cloud pricing is undisclosed pending GA.",
      "whyItMatters": "Published tier pricing lets buyers budget without a sales call, which Vendure's current pricing structure does not support.",
      "benefitsWho": "Procurement teams that prefer to self-serve pricing information before engaging sales."
    }
  ],
  "featureMatrix": [
    {
      "group": "Licensing & Availability",
      "rows": [
        {
          "feature": "Open-source license",
          "toolA": "available",
          "toolB": "available",
          "note": "Saleor: BSD-3-Clause; Vendure: GPLv3"
        },
        {
          "feature": "Free tier / core",
          "toolA": "available",
          "toolB": "available",
          "note": "Saleor Sandboxes (non-commercial); Vendure Core (free forever)"
        },
        {
          "feature": "Managed cloud generally available",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Vendure Cloud targeted GA Q4 2026"
        }
      ]
    },
    {
      "group": "Commerce & B2B",
      "rows": [
        {
          "feature": "GraphQL API",
          "toolA": "available",
          "toolB": "available",
          "note": "Both GraphQL-native"
        },
        {
          "feature": "B2B quote-to-cash workflows",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Contract / customer-specific pricing",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Enterprise storefront included",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Vendure Platform includes Next.js storefront"
        }
      ]
    },
    {
      "group": "Compliance & Governance",
      "rows": [
        {
          "feature": "SOC 2 Type II / PCI-DSS / GDPR certification",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "SSO and audit trails",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Published cloud pricing tiers",
          "toolA": "available",
          "toolB": "unavailable"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which platform has a generally available managed cloud today?",
      "answer": "Saleor Cloud is generally available now with published pricing (Select at $1,599/month, Volume at $3,999/month). Vendure Cloud is currently in a design-partner stage, with general availability targeted for Q4 2026."
    },
    {
      "question": "What license does each platform use?",
      "answer": "Saleor's core is BSD-3-Clause licensed. Vendure Core is GPLv3 licensed, which carries copyleft obligations that BSD does not."
    },
    {
      "question": "Which platform is better suited to B2B commerce?",
      "answer": "Vendure documents deeper native B2B tooling, including quote-to-cash flows, bulk SKU entry, saved requisition lists, and contract pricing. Saleor's documented features emphasize omnichannel and dynamic product modeling rather than named B2B workflows."
    },
    {
      "question": "Is Saleor or Vendure free to self-host?",
      "answer": "Both have free, open-source cores that can be self-hosted: Saleor's BSD-licensed core and Vendure's GPLv3-licensed Core, which Vendure describes as free forever."
    },
    {
      "question": "Which platform has formal compliance certifications?",
      "answer": "Saleor documents SOC 2 Type II, GDPR, and PCI-DSS compliance. Vendure's data does not list formal third-party compliance certifications, though it documents governance features like SSO and audit trails."
    },
    {
      "question": "Does Vendure's paid tier include a storefront?",
      "answer": "Yes, Vendure Platform includes a production-ready Next.js storefront with company accounts and multi-step checkout, along with 20+ enterprise plugins and AI tooling, on top of Core."
    }
  ]
};

export default saleorVsVendureContent;
