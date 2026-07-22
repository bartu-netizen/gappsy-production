import type { ToolComparisonContent } from './types';

const kongVsSqdContent: ToolComparisonContent = {
  "verdict": "Kong is an API and AI connectivity platform built around the open-source Kong Gateway plus the paid Kong Konnect cloud platform, Kong AI Gateway for managing LLM/agent traffic, Kong Event Gateway, Kong Mesh, and Kong Insomnia, founded in 2009 and headquartered in San Francisco. SQD (formerly Subsquid) provides real-time and historical blockchain data across more than 225 networks via a free public API and dedicated enterprise data portals. Kong is infrastructure for managing and securing API/AI traffic between your own services; SQD is a data source providing blockchain data itself — different layers of a stack that could plausibly connect rather than compete.",
  "bestForToolA": "Organizations managing API and AI/LLM traffic at scale, including large enterprises like United Airlines, HSBC, BMW, Wayfair, and PayPal per the vendor, that need gateway, service mesh, and AI traffic management (token budgeting, semantic caching) under one product family.",
  "bestForToolB": "Developers and teams building blockchain-data-dependent applications, such as crypto analytics, indexing, or on-chain data dashboards, who need real-time or historical data across 225+ networks, starting with a free public API.",
  "whoNeedsBoth": "A blockchain data application could use Kong (or Kong AI Gateway) to manage, secure, and rate-limit API traffic to its own backend services, while sourcing the underlying blockchain data itself from SQD's public API or enterprise data portals — a realistic pairing where Kong sits in front of an app that consumes SQD's data.",
  "keyDifferences": [
    {
      "title": "Product Category",
      "toolA": "Kong is an API gateway and AI connectivity platform for managing, securing, and routing traffic between services.",
      "toolB": "SQD is a blockchain data provider delivering real-time and historical data across 225+ networks.",
      "whyItMatters": "One is infrastructure tooling for traffic management, the other is a data source — they're not substitutes for each other.",
      "benefitsWho": "Teams building API infrastructure need Kong; teams needing blockchain data need SQD."
    },
    {
      "title": "Pricing Transparency",
      "toolA": "Kong Konnect offers a 30-day free trial with no credit card required, then Konnect Plus is priced per gateway/month plus $200/month per additional 1M requests, with custom annual Enterprise pricing.",
      "toolB": "SQD's starting price is not documented, though its FAQ confirms a free public API exists alongside dedicated enterprise data portals for larger deployments.",
      "whyItMatters": "Kong publishes more granular pricing mechanics than SQD, which only confirms a free tier exists without detailing paid tier costs.",
      "benefitsWho": "Budget planners get more concrete numbers to model from Kong's published Konnect Plus structure than from SQD's undocumented pricing."
    },
    {
      "title": "AI/LLM-Specific Capability",
      "toolA": "Kong AI Gateway is purpose-built for managing AI/LLM traffic and agent orchestration, including token budgeting, semantic caching, and context window management.",
      "toolB": "SQD has no documented AI-specific capability — it is focused on blockchain data delivery.",
      "whyItMatters": "Teams building AI agents that call external APIs need traffic-management tooling like Kong AI Gateway, which SQD doesn't provide.",
      "benefitsWho": "Teams operating AI agents or LLM applications that need governed API access benefit specifically from Kong AI Gateway."
    },
    {
      "title": "Company Track Record",
      "toolA": "Kong was founded in 2009 and is headquartered in San Francisco, California, making it one of the longest-established open-source API gateways per its documented pros.",
      "toolB": "SQD's founding year and headquarters are not documented.",
      "whyItMatters": "Kong's documented 15+ year history and named enterprise customers offer more due-diligence signal than SQD's undocumented company details.",
      "benefitsWho": "Risk-averse enterprise buyers can more easily vet Kong's track record than SQD's."
    },
    {
      "title": "Scope of Product Family",
      "toolA": "Kong spans multiple products (Gateway, Konnect, AI Gateway, Event Gateway, Mesh, and the separately-priced Insomnia API testing tool), per its documented cons, meaning the full feature set is spread across several products rather than one bundle.",
      "toolB": "SQD's documented scope is narrower and singular: blockchain data access via API and data portals.",
      "whyItMatters": "Kong's broader product family may require piecing together multiple products for a complete solution, while SQD's scope is simpler to evaluate.",
      "benefitsWho": "Teams needing only blockchain data benefit from SQD's simpler, single-purpose scope; teams needing broad API/AI/mesh/event infrastructure benefit from Kong's product family breadth, at the cost of more products to evaluate."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Purpose",
      "rows": [
        {
          "feature": "API gateway / traffic management",
          "toolA": "available",
          "toolB": "unavailable",
          "note": null
        },
        {
          "feature": "Blockchain data access",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "225+ networks"
        },
        {
          "feature": "AI/LLM traffic management",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Kong AI Gateway"
        },
        {
          "feature": "Service mesh",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Kong Mesh"
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Free tier/trial",
          "toolA": "available",
          "toolB": "available",
          "note": "Kong 30-day Konnect free trial, no credit card; SQD free public API"
        },
        {
          "feature": "Published entry paid price",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Konnect Plus: per gateway + $200/month per extra 1M requests"
        },
        {
          "feature": "Enterprise/custom tier",
          "toolA": "available",
          "toolB": "available",
          "note": "Kong custom annual contract; SQD dedicated enterprise data portals"
        }
      ]
    },
    {
      "group": "Company Profile",
      "rows": [
        {
          "feature": "Founding year documented",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Kong founded 2009"
        },
        {
          "feature": "Headquarters documented",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "San Francisco, CA"
        },
        {
          "feature": "Named enterprise customers",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "United Airlines, HSBC, BMW, Wayfair, PayPal"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Do Kong and SQD compete with each other?",
      "answer": "No — Kong is an API gateway and AI traffic management platform, while SQD is a blockchain data provider. They operate at different layers and could plausibly be used together, with Kong managing API traffic to an app that consumes SQD's data."
    },
    {
      "question": "Is Kong free to use?",
      "answer": "Kong Gateway (the open-source core) is free and self-hostable. Kong Konnect, the managed cloud platform, is a separate paid product with a 30-day free trial and no credit card required."
    },
    {
      "question": "Is SQD's blockchain data free?",
      "answer": "Yes, SQD offers a free public API, alongside dedicated enterprise data portals for larger deployments, per its documented FAQ."
    },
    {
      "question": "Does Kong handle AI/LLM traffic specifically?",
      "answer": "Yes, Kong AI Gateway is purpose-built for managing AI/LLM traffic and agent orchestration, including token budgeting, semantic caching, and context window management. SQD has no documented AI-specific traffic management capability."
    },
    {
      "question": "How many blockchain networks does SQD cover?",
      "answer": "More than 225 networks, with both real-time and historical data."
    },
    {
      "question": "Which company has a longer documented track record?",
      "answer": "Kong, founded in 2009 and headquartered in San Francisco, is documented as one of the longest-established open-source API gateways. SQD's founding year and headquarters are not publicly documented."
    }
  ]
};

export default kongVsSqdContent;
