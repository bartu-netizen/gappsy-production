import type { ToolComparisonContent } from './types';

const growthbookVsGrowthloopContent: ToolComparisonContent = {
  "verdict": "GrowthBook is a warehouse-native platform for running A/B tests, managing feature flags, and product analytics, freemium starting free for up to 3 users with Pro at $40/seat/month; GrowthLoop is an agentic, composable customer data platform for activating cloud warehouses into AI-driven marketing campaigns, sold at custom enterprise pricing with no free tier. Both connect directly to a data warehouse, but GrowthBook is built for product and engineering experimentation while GrowthLoop is built for marketing campaign orchestration.",
  "bestForToolA": "GrowthBook fits product and engineering teams that want to run A/B tests and manage feature flags directly against their own warehouse, with a free Starter plan for up to 3 users or a fully free open-source self-hosted option with unlimited users.",
  "bestForToolB": "GrowthLoop fits enterprise marketing and data teams -- in industries like retail, finance, media, telecom, and commerce -- that want to build AI-driven, natural-language campaigns from warehouse data using BigQuery, Snowflake, Databricks, or Redshift, without needing SQL expertise.",
  "whoNeedsBoth": "An enterprise data team could use GrowthBook to run and analyze product experiments against the warehouse, while GrowthLoop's AI Studio activates the resulting audience and behavioral insights into outbound marketing campaigns across 50+ ad, CRM, and customer success destinations.",
  "keyDifferences": [
    {
      "title": "Primary Use Case",
      "toolA": "GrowthBook focuses on A/B testing, feature flags with auto-rollbacks and gradual ramp schedules, and product analytics.",
      "toolB": "GrowthLoop focuses on customer data activation and AI-driven marketing campaign orchestration via its Universal Journeys and AI Studio.",
      "whyItMatters": "These solve different problems -- product experimentation versus marketing campaign activation -- despite both being warehouse-native.",
      "benefitsWho": "Product and engineering teams benefit from GrowthBook; marketing and growth teams benefit from GrowthLoop."
    },
    {
      "title": "Pricing Transparency",
      "toolA": "GrowthBook publishes tiers: Starter is free for up to 3 users, Pro is $40/seat/month for up to 50 users, and a fully free Open Source self-hosted plan exists.",
      "toolB": "GrowthLoop's pricing isn't publicly listed and requires a sales demo.",
      "whyItMatters": "Buyers can self-serve and budget instantly with GrowthBook but must go through a sales cycle for GrowthLoop.",
      "benefitsWho": "Smaller teams and self-serve buyers favor GrowthBook; enterprise procurement teams are set up for GrowthLoop's process."
    },
    {
      "title": "AI Capabilities",
      "toolA": "GrowthBook offers an AI Data Analyst for asking questions about analytics data and an AI Visual Editor for building experiments.",
      "toolB": "GrowthLoop's AI Studio lets marketers describe campaign goals in natural language instead of writing SQL, with AI-generated audience segment suggestions.",
      "whyItMatters": "Both use AI, but for different jobs -- analyzing experiment data versus generating marketing campaigns.",
      "benefitsWho": "Analysts wanting faster experiment insight use GrowthBook; marketers wanting to skip SQL for campaigns use GrowthLoop."
    },
    {
      "title": "Self-Hosting & Open Source",
      "toolA": "GrowthBook has a free, open-source self-hosted version with unlimited users, plus a self-hosted Enterprise tier.",
      "toolB": "Not documented -- no open-source or self-hosting option is listed for GrowthLoop.",
      "whyItMatters": "Teams wanting full data control or avoiding vendor lock-in have that option only with GrowthBook.",
      "benefitsWho": "Engineering-led organizations wanting to self-host and avoid per-seat licensing costs."
    },
    {
      "title": "Scale & Maturity Signals",
      "toolA": "GrowthBook cites usage by 3,000+ companies.",
      "toolB": "GrowthLoop, founded in 2015, was named a 2025 Google Cloud Partner of the Year and integrates with 50+ advertising, CRM, and customer success destinations.",
      "whyItMatters": "These signal different kinds of validation -- broad self-serve adoption versus enterprise partnership credentials.",
      "benefitsWho": "Buyers weighing community traction against enterprise-grade partnership signals."
    }
  ],
  "featureMatrix": [
    {
      "group": "Experimentation & Flags",
      "rows": [
        {
          "feature": "A/B testing / experimentation",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Feature flags with rollout controls",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Multi-arm bandits",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Pro plan"
        }
      ]
    },
    {
      "group": "Data & AI",
      "rows": [
        {
          "feature": "Warehouse-native architecture",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "AI-assisted campaign/analytics building",
          "toolA": "available",
          "toolB": "available",
          "note": "AI Data Analyst / AI Visual Editor vs AI Studio"
        },
        {
          "feature": "Natural-language campaign building",
          "toolA": "unavailable",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Marketing Activation",
      "rows": [
        {
          "feature": "Customer data platform / audience segmentation for marketing",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Multi-channel campaign orchestration",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Universal Journeys"
        },
        {
          "feature": "Ad/CRM/customer-success destination integrations",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "50+ destinations"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is GrowthBook free?",
      "answer": "Yes, GrowthBook has a free Starter cloud plan for up to 3 users and a fully free open-source self-hosted version with unlimited users; GrowthLoop has no free tier and requires a custom quote."
    },
    {
      "question": "Does GrowthLoop replace GrowthBook's A/B testing?",
      "answer": "No -- A/B testing, feature flags, and product analytics are GrowthBook's documented focus; GrowthLoop's features center on audience segmentation and marketing campaign orchestration, not product experimentation."
    },
    {
      "question": "What data warehouses does each tool connect to?",
      "answer": "GrowthBook queries metrics directly from an existing warehouse rather than a separate store; GrowthLoop connects directly to Google BigQuery, Snowflake, Databricks, and Amazon Redshift."
    },
    {
      "question": "How much does GrowthBook's Pro plan cost?",
      "answer": "$40 per seat per month for up to 50 users; GrowthLoop's pricing is not published and requires a sales demo."
    },
    {
      "question": "Can GrowthLoop be self-hosted like GrowthBook?",
      "answer": "This isn't documented for GrowthLoop. GrowthBook explicitly offers a free open-source self-hosted version and a self-hosted Enterprise tier."
    },
    {
      "question": "Who is GrowthLoop built for?",
      "answer": "Enterprise marketing and data teams across industries like retail, finance, media, telecom, and commerce, per its own FAQ -- a narrower target than GrowthBook's broader product and engineering audience."
    }
  ]
};

export default growthbookVsGrowthloopContent;
