import type { ToolComparisonContent } from './types';

const meilisearchVsTypesenseContent: ToolComparisonContent = {
  "verdict": "Both are open-source, self-hostable search engines with typo-tolerant and vector/hybrid search, so the decision often comes down to community size and pricing transparency — Meilisearch has a larger open-source community (58,600+ GitHub stars) and a published Cloud starting price, while Typesense has a smaller community (25,000 GitHub stars, by its own account) and Cloud pricing that is usage-based without a published flat starting price.",
  "bestForToolA": "Teams that want multimodal search across images, video, and audio alongside full-text and semantic search, plus a documented Cloud starting price of $20/month and a 14-day free trial with no credit card.",
  "bestForToolB": "Teams that need multi-tenant API keys to scope search access per customer or tenant, or want to fully self-host and manage infrastructure themselves without being tied to a specific hosted pricing tier.",
  "whoNeedsBoth": "Teams building a search proof-of-concept who want to benchmark both open-source engines side by side before choosing a production home should expect to self-host trial instances of each, since both are free and open source to run locally.",
  "keyDifferences": [
    {
      "title": "Community size and ecosystem maturity",
      "toolA": "58,600+ GitHub stars.",
      "toolB": "25,000 GitHub stars, explicitly noted in its own cons as smaller than incumbents like Algolia or Elasticsearch.",
      "whyItMatters": "Community size can correlate with plugin availability, community support responsiveness, and long-term project momentum.",
      "benefitsWho": "Teams weighing long-term platform risk before standardizing on an open-source search engine."
    },
    {
      "title": "Multimodal search support",
      "toolA": "Supports multimodal search across images, video, and audio content.",
      "toolB": "Not documented — Typesense's facts describe keyword, vector, and hybrid text search but no multimodal capability.",
      "whyItMatters": "Determines whether the engine can index and search non-text media natively.",
      "benefitsWho": "Teams building search over media libraries or marketplaces with image or video content."
    },
    {
      "title": "Multi-tenant API key scoping",
      "toolA": "Not documented as a distinct feature.",
      "toolB": "Offers multi-tenant API keys to scope search access per tenant or customer.",
      "whyItMatters": "Important for SaaS products that need to isolate search access by customer account.",
      "benefitsWho": "Multi-tenant SaaS builders."
    },
    {
      "title": "Cloud pricing transparency",
      "toolA": "Publishes a Cloud starting price of $20/month (pay-as-you-go) with a 14-day free trial, no credit card required.",
      "toolB": "Typesense Cloud pricing is usage-based with no published flat starting price, per its own cons.",
      "whyItMatters": "Affects how easily a team can budget before committing.",
      "benefitsWho": "Smaller teams evaluating hosted options without wanting to request a custom quote."
    },
    {
      "title": "SDK and language coverage",
      "toolA": "SDKs for 15+ programming languages plus framework integrations for React, Vue, and Angular.",
      "toolB": "Official SDKs for ten-plus languages including JS, Python, PHP, Ruby, and Go.",
      "whyItMatters": "Broader SDK coverage reduces integration friction for teams on less common language stacks.",
      "benefitsWho": "Engineering teams with polyglot stacks."
    }
  ],
  "featureMatrix": [
    {
      "group": "Search Capabilities",
      "rows": [
        {
          "feature": "Typo tolerance",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Semantic / vector search",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Multimodal search",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Federated search",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Multi-tenant API keys",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Faceting, filtering, geo-search",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Deployment & Pricing",
      "rows": [
        {
          "feature": "Self-hosted / open source",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Published Cloud starting price",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Meilisearch publishes $20/month; Typesense Cloud is usage-based with no flat published price"
        },
        {
          "feature": "Free trial (no credit card)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Named Enterprise/custom tier",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "SDKs & Community",
      "rows": [
        {
          "feature": "Language SDK coverage",
          "toolA": "available",
          "toolB": "available",
          "note": "Meilisearch: 15+ languages + React/Vue/Angular; Typesense: ten-plus languages including JS, Python, PHP, Ruby, Go"
        },
        {
          "feature": "GitHub community size",
          "toolA": "available",
          "toolB": "available",
          "note": "Meilisearch: 58.6k+ stars; Typesense: 25k stars"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Are both Meilisearch and Typesense open source?",
      "answer": "Yes, both are fully open source and can be self-hosted for free."
    },
    {
      "question": "Which has a bigger open-source community?",
      "answer": "Meilisearch, with 58,600+ GitHub stars compared to Typesense's 25,000 stars."
    },
    {
      "question": "Does either support multimodal (image/video) search?",
      "answer": "Meilisearch documents multimodal search across images, video, and audio; this isn't documented for Typesense."
    },
    {
      "question": "Which one publishes a flat Cloud starting price?",
      "answer": "Meilisearch publishes a Cloud starting price of $20/month; Typesense Cloud pricing is usage-based with no published flat starting price."
    },
    {
      "question": "Does Typesense support multi-tenancy?",
      "answer": "Yes, Typesense offers multi-tenant API keys to scope search access per tenant or customer."
    },
    {
      "question": "What languages have official SDKs?",
      "answer": "Meilisearch supports 15+ languages plus React, Vue, and Angular integrations; Typesense supports ten-plus languages including JS, Python, PHP, Ruby, and Go."
    }
  ]
};

export default meilisearchVsTypesenseContent;
