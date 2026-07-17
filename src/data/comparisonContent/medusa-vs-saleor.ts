import type { ToolComparisonContent } from './types';

const medusaVsSaleorContent: ToolComparisonContent = {
  "verdict": "Medusa and Saleor are both open-source, headless commerce platforms, but they sit at very different price points and maturity levels: Medusa is a Node.js/TypeScript platform with Medusa Cloud starting at $29/month on infrastructure-based pricing, while Saleor is a GraphQL-native platform with Saleor Cloud starting at $1,599/month for its Select tier, plus GMV overage fees. Saleor documents enterprise-grade compliance (SOC 2 Type II, GDPR, PCI-DSS) and scale (1B+ requests, 400k orders processed monthly), while Medusa emphasizes modular architecture and native AI/agent tooling via Model Context Protocol.",
  "bestForToolA": "Medusa fits teams that want a low-cost entry point into managed headless commerce ($29/month starting) and want built-in AI/agent tooling via MCP for agent-driven development workflows.",
  "bestForToolB": "Saleor fits larger, compliance-conscious organizations processing significant order volume that need SOC 2 Type II, GDPR, and PCI-DSS compliance out of the box, and are prepared to pay from $1,599/month for the Select Cloud tier.",
  "whoNeedsBoth": "There's no realistic case for running both together on one store — they're alternative headless commerce backends, so the decision comes down to budget tier and compliance requirements rather than feature complementarity.",
  "keyDifferences": [
    {
      "title": "Cloud Pricing Tier",
      "toolA": "Medusa Cloud starts at $29/month, priced on infrastructure usage with no GMV-based fees.",
      "toolB": "Saleor Cloud starts at $1,599/month for the Select tier (up to $200,000 GMV, 0.8% overage), rising to $3,999/month for Volume (up to $1,000,000 GMV, 0.4% overage).",
      "whyItMatters": "The roughly 55x gap in entry price makes these platforms fit very different budget stages, from early-stage startups to established, high-volume merchants.",
      "benefitsWho": "Bootstrapped or early-stage teams benefit from Medusa's lower entry cost; large-volume enterprise merchants may accept Saleor's cost for its compliance and scale credentials."
    },
    {
      "title": "API Architecture",
      "toolA": "Medusa's admin dashboard is customizable and extensible, with modular commerce logic.",
      "toolB": "Saleor is GraphQL-native with 160+ webhooks for integrations and 45+ dashboard mount points for custom UI.",
      "whyItMatters": "Saleor's GraphQL-first design and extensive webhook count are aimed squarely at complex, high-integration enterprise architectures.",
      "benefitsWho": "Integration-heavy enterprise teams building many connected systems benefit from Saleor's webhook depth."
    },
    {
      "title": "Compliance Certifications",
      "toolA": "Medusa's documented pros and cons do not mention formal compliance certifications.",
      "toolB": "Saleor is SOC 2 Type II, GDPR, and PCI-DSS compliant.",
      "whyItMatters": "Formal compliance certifications are often a hard requirement for enterprise procurement and regulated industries.",
      "benefitsWho": "Enterprise buyers and regulated industries (finance, healthcare-adjacent retail) with formal vendor security requirements."
    },
    {
      "title": "Proven Scale",
      "toolA": "Medusa's proof points center on GitHub adoption (35k+ stars) rather than documented transaction volume.",
      "toolB": "Saleor reports handling 1B+ requests and 400k orders processed monthly at scale, with 23.1k+ GitHub stars.",
      "whyItMatters": "Documented production-scale numbers give buyers more confidence the platform can handle high-traffic, high-order-volume operations.",
      "benefitsWho": "High-traffic retailers wanting evidence of proven scale before committing engineering resources."
    },
    {
      "title": "AI/Agent Tooling",
      "toolA": "Medusa has built-in Model Context Protocol (MCP) support, a Cloud CLI, and a Development Agent for AI/agent-driven development.",
      "toolB": "Saleor's documented features do not mention AI/agent-specific tooling, though it does support agentic sales channels under its omnichannel processing.",
      "whyItMatters": "Medusa's explicit MCP support is a more direct fit for teams building AI-agent-integrated development workflows today.",
      "benefitsWho": "Teams building AI-agent-driven storefront or backend automation."
    }
  ],
  "featureMatrix": [
    {
      "group": "Licensing & Pricing",
      "rows": [
        {
          "feature": "Open-source core",
          "toolA": "available",
          "toolB": "available",
          "note": "Medusa: MIT; Saleor: BSD-3-Clause"
        },
        {
          "feature": "Free tier for prototyping",
          "toolA": "available",
          "toolB": "available",
          "note": "Medusa: self-hosted free; Saleor: Sandboxes tier, non-commercial"
        },
        {
          "feature": "Managed cloud starting price",
          "toolA": "available",
          "toolB": "available",
          "note": "Medusa $29/mo vs Saleor $1,599/mo"
        }
      ]
    },
    {
      "group": "API & Architecture",
      "rows": [
        {
          "feature": "GraphQL-native API",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Webhook count",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Saleor: 160+ webhooks"
        },
        {
          "feature": "Extensible admin dashboard",
          "toolA": "available",
          "toolB": "available",
          "note": "Saleor: 45+ mount points"
        },
        {
          "feature": "OpenTelemetry observability",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Compliance & Scale",
      "rows": [
        {
          "feature": "SOC 2 / GDPR / PCI-DSS compliance",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "AI/agent (MCP) support",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Documented production scale",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "1B+ requests, 400k orders/month"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "How much cheaper is Medusa than Saleor?",
      "answer": "Medusa Cloud starts at $29/month while Saleor Cloud starts at $1,599/month for its Select tier — roughly a 55x difference at the entry point, reflecting their different target markets."
    },
    {
      "question": "Which platform is more compliance-ready for enterprise?",
      "answer": "Saleor documents SOC 2 Type II, GDPR, and PCI-DSS compliance. Medusa's available data does not list formal compliance certifications."
    },
    {
      "question": "Does either platform charge based on order volume (GMV)?",
      "answer": "Saleor Cloud charges GMV-based overage fees (0.8% on Select, 0.4% on Volume, as low as 0.2% on Enterprise) beyond each plan's limit. Medusa Cloud explicitly avoids GMV-based fees, pricing on infrastructure usage instead."
    },
    {
      "question": "Which platform supports AI agents?",
      "answer": "Medusa has built-in Model Context Protocol (MCP) support plus a Cloud CLI and Development Agent for AI/agent-driven development. Saleor's documented features do not specifically mention MCP or agent tooling, though its omnichannel processing supports agentic sales channels."
    },
    {
      "question": "Are both platforms open source?",
      "answer": "Yes. Medusa's core is MIT-licensed with 35k+ GitHub stars. Saleor's core is BSD-3-Clause licensed with 23.1k+ GitHub stars."
    },
    {
      "question": "What free options does each platform offer?",
      "answer": "Medusa's self-hosted core is free under MIT. Saleor offers a free Sandboxes tier on Saleor Cloud for non-commercial prototyping and testing, in addition to its free open-source core."
    }
  ]
};

export default medusaVsSaleorContent;
