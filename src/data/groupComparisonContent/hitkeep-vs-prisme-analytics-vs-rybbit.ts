import type { GroupComparisonContent } from './types';

const hitkeepVsPrismeAnalyticsVsRybbitContent: GroupComparisonContent = {
  "verdict": "These three take different approaches to self-hosted, privacy-first analytics. HitKeep packs the most business-facing extras, including ecommerce revenue tracking, conversion funnels, AI-crawler detection, and Google Search Console integration, into a single dependency-free binary, with paid cloud tiers built for agencies managing many client sites. Prisme Analytics leans into infrastructure transparency, running on ClickHouse and Grafana for real-time, never-deleted data with a single flat-rate hosted plan. Rybbit is the youngest of the three but keeps its free self-hosted build fully feature-complete, including session replay and funnels that many competitors reserve for paid tiers.",
  "bestFor": {
    "hitkeep": "Agencies and ecommerce site owners who want funnels, revenue tracking, AI-crawler detection, and Search Console data together, plus a paid cloud tier for managing many client sites.",
    "prisme-analytics": "Teams that want real-time, unlimited-retention analytics on transparent ClickHouse and Grafana infrastructure with one flat-rate hosted plan.",
    "rybbit": "Teams that want a genuinely feature-complete free self-hosted build, or an affordable EU-hosted cloud option with a generous free tier."
  },
  "highlights": [
    {
      "title": "Built for agencies",
      "description": "HitKeep's Business cloud tier supports up to 50 sites and 20 team members with multi-client reporting, Rybbit's Pro plan removes site and team caps entirely, and Prisme Analytics bundles unlimited sites into its single flat-rate plan.",
      "toolSlugs": [
        "hitkeep",
        "prisme-analytics",
        "rybbit"
      ]
    },
    {
      "title": "No external database required",
      "description": "HitKeep runs as a single binary with embedded DuckDB and NSQ, while Prisme Analytics requires operating ClickHouse and Grafana yourself as separate infrastructure.",
      "toolSlugs": [
        "hitkeep",
        "prisme-analytics"
      ]
    },
    {
      "title": "Ecommerce and SEO-specific tracking",
      "description": "HitKeep is the only one of the three that natively tracks ecommerce transaction revenue, pulls in Google Search Console data, and distinguishes AI-crawler traffic from human visitors.",
      "toolSlugs": [
        "hitkeep"
      ]
    },
    {
      "title": "Data retention philosophy",
      "description": "Prisme Analytics never auto-deletes data, HitKeep applies tiered retention caps from 60 days on its free cloud plan up to 3 years on Business, and Rybbit caps retention at 5 years on its Pro plan.",
      "toolSlugs": [
        "hitkeep",
        "prisme-analytics",
        "rybbit"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Deployment",
      "rows": [
        {
          "feature": "Free self-hosted tier",
          "statuses": {
            "hitkeep": "available",
            "prisme-analytics": "available",
            "rybbit": "available"
          }
        },
        {
          "feature": "No external database dependency",
          "statuses": {
            "hitkeep": "available",
            "prisme-analytics": "unavailable",
            "rybbit": "not-documented"
          },
          "note": "HitKeep embeds DuckDB and NSQ in a single binary; Prisme Analytics requires operating ClickHouse and Grafana separately."
        }
      ]
    },
    {
      "group": "Analytics Depth",
      "rows": [
        {
          "feature": "Ecommerce transaction tracking",
          "statuses": {
            "hitkeep": "available",
            "prisme-analytics": "unavailable",
            "rybbit": "unavailable"
          }
        },
        {
          "feature": "Funnel analysis",
          "statuses": {
            "hitkeep": "available",
            "prisme-analytics": "unavailable",
            "rybbit": "available"
          }
        },
        {
          "feature": "Session replay",
          "statuses": {
            "hitkeep": "unavailable",
            "prisme-analytics": "unavailable",
            "rybbit": "available"
          }
        }
      ]
    },
    {
      "group": "AI and Agency Tools",
      "rows": [
        {
          "feature": "AI-powered features",
          "statuses": {
            "hitkeep": "available",
            "prisme-analytics": "unavailable",
            "rybbit": "unavailable"
          },
          "note": "HitKeep: AI crawler and bot detection."
        },
        {
          "feature": "Multi-client agency reporting",
          "statuses": {
            "hitkeep": "available",
            "prisme-analytics": "not-documented",
            "rybbit": "available"
          }
        }
      ]
    },
    {
      "group": "Data Retention",
      "rows": [
        {
          "feature": "Unlimited or long-term data retention",
          "statuses": {
            "hitkeep": "limited",
            "prisme-analytics": "available",
            "rybbit": "limited"
          },
          "note": "Prisme Analytics never auto-deletes data. HitKeep's retention ranges 60 days to 3 years by plan; Rybbit caps at 5 years on Pro."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which one needs the least infrastructure to self-host?",
      "answer": "HitKeep needs the least, since it runs as a single binary with embedded DuckDB and NSQ, unlike Prisme Analytics, which requires operating ClickHouse and Grafana yourself."
    },
    {
      "question": "Which tracks ecommerce revenue?",
      "answer": "Only HitKeep among these three natively tracks ecommerce transaction revenue."
    },
    {
      "question": "Which keeps data forever?",
      "answer": "Prisme Analytics explicitly never auto-deletes visitor data; HitKeep and Rybbit apply retention caps that vary by plan, with HitKeep ranging from 60 days to 3 years and Rybbit capping at 5 years on its Pro plan."
    },
    {
      "question": "Which is best for an agency managing many client sites?",
      "answer": "HitKeep's Business cloud tier supports up to 50 sites and 20 team members with dedicated multi-client reporting, Rybbit's Pro plan removes site and team caps entirely, and Prisme Analytics' single hosted plan already includes unlimited websites."
    },
    {
      "question": "Which has session replay?",
      "answer": "Rybbit includes session replay on its Pro cloud plan and in its self-hosted build; HitKeep and Prisme Analytics do not document session replay."
    }
  ]
};

export default hitkeepVsPrismeAnalyticsVsRybbitContent;
