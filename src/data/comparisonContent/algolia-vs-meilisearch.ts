import type { ToolComparisonContent } from './types';

const algoliaVsMeilisearchContent: ToolComparisonContent = {
  "verdict": "Algolia is a heavily enterprise-proven AI search platform (18,000+ customers, a three-time Gartner Magic Quadrant Leader, and broad compliance certifications) whose more advanced AI ranking features sit behind its pricier Grow Plus and Elevate tiers, while Meilisearch is a fully open-source engine that can be self-hosted for free or run on a published-price Cloud plan, with its most advanced merchandising and personalization features reserved for a custom Enterprise tier. Neither is a strict upgrade over the other — it depends on whether you need Algolia's enterprise track record and integrations or Meilisearch's open-source flexibility.",
  "bestForToolA": "Teams already operating at scale who need a search vendor with established enterprise credentials (SOC 2 Type 2, ISO 27001, GDPR, CCPA), pre-built integrations with platforms like Shopify, Salesforce, Adobe, and AWS, and are comfortable with usage-based pricing that scales with request and record volume.",
  "bestForToolB": "Teams that want to self-host their search infrastructure for free, need multimodal search across images, video, and audio alongside full-text and semantic search, or want SDK coverage across 15+ languages plus React, Vue, and Angular integrations without committing to an annual enterprise contract.",
  "whoNeedsBoth": "Organizations evaluating search vendors as part of a migration or vendor-diversification strategy — for example running Meilisearch self-hosted in a lower environment while keeping Algolia in production for its enterprise SLAs and compliance certifications — should expect to compare both directly rather than treat one as a drop-in default.",
  "keyDifferences": [
    {
      "title": "Open-source availability",
      "toolA": "Algolia is not offered as an open-source, self-hostable product — its Build plan is free but still runs on Algolia's hosted infrastructure.",
      "toolB": "Meilisearch is fully open source and self-hostable at no cost, with 58,600+ GitHub stars.",
      "whyItMatters": "Determines whether a team can run the engine on its own infrastructure or must rely on the vendor's hosted service.",
      "benefitsWho": "Engineering teams with data residency requirements or a preference for owning their infrastructure."
    },
    {
      "title": "Where advanced AI ranking sits in the pricing tiers",
      "toolA": "NeuralSearch, AI Synonyms, and AI Ranking are gated behind the pricier Grow Plus plan, not included in the base Grow plan.",
      "toolB": "Semantic/hybrid search and vector storage for RAG are part of the core product rather than a separate paid tier (advanced merchandising and personalization are reserved for Enterprise).",
      "whyItMatters": "Budgeting for AI-powered search requires knowing which tier unlocks the features you actually need.",
      "benefitsWho": "Teams evaluating total cost of ownership before committing to a plan."
    },
    {
      "title": "Compliance and market validation",
      "toolA": "Holds SOC 2 Type 2, ISO 27001, GDPR, and CCPA certifications, serves 18,000+ customers in 150+ countries, and has been named a Gartner Magic Quadrant Leader for Search and Product Discovery for three consecutive years.",
      "toolB": "Compliance (SOC 2, SSO SAML) is documented only on the Enterprise tier; broad customer-count and analyst-recognition figures are not documented in Meilisearch's facts.",
      "whyItMatters": "Compliance-sensitive buyers such as finance, healthcare, or large enterprise often require documented certifications before procurement.",
      "benefitsWho": "Enterprise buyers and procurement/security teams."
    },
    {
      "title": "Multimodal and federated search",
      "toolA": "Offers AI search & retrieval, personalization, and generative (RAG) experiences within the search UI, plus an Agent Studio for building AI agents on indexed data.",
      "toolB": "Adds multimodal search across images, video, and audio, and federated search across multiple data sources, alongside vector storage for RAG.",
      "whyItMatters": "Determines which non-text content types and cross-source query patterns are supported natively.",
      "benefitsWho": "Product teams building search across mixed media, such as marketplaces or media libraries."
    },
    {
      "title": "Trial and pricing transparency",
      "toolA": "Grow and Grow Plus plans require no annual contract and publish per-1,000-request pricing; Elevate requires an annual contract with custom pricing.",
      "toolB": "Cloud offers a 14-day free trial with no credit card required, with published pay-as-you-go pricing starting at $20/month; Enterprise is custom/quote-only.",
      "whyItMatters": "Affects how easily a team can budget before committing.",
      "benefitsWho": "Smaller teams and solo developers evaluating search vendors before committing budget."
    }
  ],
  "featureMatrix": [
    {
      "group": "Search Capabilities",
      "rows": [
        {
          "feature": "AI / semantic search",
          "toolA": "available",
          "toolB": "available",
          "note": "Algolia's NeuralSearch/AI Ranking require the Grow Plus plan"
        },
        {
          "feature": "Multimodal search (image, video, audio)",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Federated / multi-source search",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Personalization & merchandising",
          "toolA": "available",
          "toolB": "limited",
          "note": "Meilisearch reserves merchandising/personalization for its Enterprise tier"
        }
      ]
    },
    {
      "group": "Deployment & Pricing",
      "rows": [
        {
          "feature": "Self-hosted / open-source option",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Free forever tier",
          "toolA": "available",
          "toolB": "limited",
          "note": "Algolia's Build plan is free forever; Meilisearch Cloud offers only a 14-day free trial (self-hosting is free indefinitely)"
        },
        {
          "feature": "Published starting price",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "$20/month Cloud pay-as-you-go"
        },
        {
          "feature": "Enterprise / custom tier",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Compliance & Enterprise Trust",
      "rows": [
        {
          "feature": "SOC 2 certification",
          "toolA": "available",
          "toolB": "limited",
          "note": "Documented only for Meilisearch's Enterprise tier"
        },
        {
          "feature": "ISO 27001 / GDPR / CCPA",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Analyst recognition (e.g. Gartner)",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Algolia open source?",
      "answer": "No — Algolia's facts don't describe an open-source or self-hosted option; it's a hosted platform with a free Build plan (10K search requests/month, 1M records, no credit card required)."
    },
    {
      "question": "Is Meilisearch open source?",
      "answer": "Yes, Meilisearch is fully open source and self-hostable, with 58,600+ GitHub stars."
    },
    {
      "question": "Which one has a free plan?",
      "answer": "Both offer a way to start for free — Algolia's Build plan is free forever with no credit card, while Meilisearch can be self-hosted for free or trialed on Cloud for 14 days without a credit card."
    },
    {
      "question": "Does either platform support AI/semantic search?",
      "answer": "Yes — Algolia's NeuralSearch and AI Ranking are available starting on the Grow Plus plan, while Meilisearch includes semantic, hybrid, and vector search for RAG as part of its core feature set."
    },
    {
      "question": "Which has more documented compliance certifications?",
      "answer": "Algolia documents SOC 2 Type 2, ISO 27001, GDPR, and CCPA certifications plus Gartner Magic Quadrant Leader recognition; Meilisearch documents SOC 2 and SSO SAML only on its Enterprise tier."
    },
    {
      "question": "Does Meilisearch support multimodal search?",
      "answer": "Yes, Meilisearch supports search across images, video, and audio content in addition to full-text and semantic search; this isn't documented for Algolia."
    }
  ]
};

export default algoliaVsMeilisearchContent;
