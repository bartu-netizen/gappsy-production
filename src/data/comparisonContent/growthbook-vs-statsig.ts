import type { ToolComparisonContent } from './types';

const growthbookVsStatsigContent: ToolComparisonContent = {
  "verdict": "GrowthBook and Statsig both combine feature flags, experimentation, and product analytics on a warehouse-native architecture, and the core capability overlap is real. The difference is mostly in pricing model and feature depth: GrowthBook's Pro tier is billed per seat with a fully free open-source self-hosted option, while Statsig's Pro tier is a flat monthly baseline with event-based overages and built-in session replay from the free tier up.",
  "bestForToolA": "Teams that want a free, unlimited-user open-source self-hosted option, or that prefer per-seat pricing and want AI-assisted experiment building via GrowthBook's AI Visual Editor and AI Data Analyst.",
  "bestForToolB": "Teams that want session replay bundled in from the free Developer tier, unlimited seats even on paid plans, and a flat monthly baseline rather than per-seat billing — useful for larger teams with many collaborators.",
  "whoNeedsBoth": "Organizations evaluating experimentation platforms during a migration, or that want deeper session-replay-linked analysis alongside their existing flagging setup, might pilot both since session replay is a native Statsig feature not documented for GrowthBook.",
  "keyDifferences": [
    {
      "title": "Pricing structure",
      "toolA": "GrowthBook Pro is billed per seat at $40/seat/month for up to 50 users.",
      "toolB": "Statsig Pro is a flat $150/month baseline (covering 5M events) with overages billed per additional event.",
      "whyItMatters": "Per-seat pricing scales with headcount while flat-plus-overage pricing scales with usage volume — teams with many users but modest event volume, or vice versa, will see very different costs.",
      "benefitsWho": "Larger teams with many light users may prefer Statsig's model; smaller teams with heavy usage may prefer GrowthBook's."
    },
    {
      "title": "Self-hosting",
      "toolA": "GrowthBook offers a free open-source self-hosted version with unlimited users, plus a self-hosted Enterprise tier.",
      "toolB": "Statsig's facts don't document a self-hosted or open-source option.",
      "whyItMatters": "A free self-hosted option removes both per-seat and usage costs entirely for teams willing to operate their own infrastructure.",
      "benefitsWho": "Engineering-heavy teams wanting to avoid recurring SaaS fees or keep experimentation data fully in-house."
    },
    {
      "title": "Session replay",
      "toolA": "GrowthBook's facts don't document session replay as a feature.",
      "toolB": "Statsig includes session replay (50,000 replays/month on the free Developer tier, 100,000 on Pro) linked to experiments and feature flags.",
      "whyItMatters": "Session replay tied to experiment results helps teams see exactly how users experienced a given variant.",
      "benefitsWho": "Product teams debugging why a specific experiment variant under- or over-performed."
    },
    {
      "title": "Free tier limits",
      "toolA": "GrowthBook's free Starter plan covers up to 3 users with unlimited feature flags and experiments.",
      "toolB": "Statsig's free Developer tier covers unlimited seats with 2M events/month and unlimited flag/config checks.",
      "whyItMatters": "GrowthBook's free tier caps by user count while Statsig's caps by event volume, so the right free tier depends on team size versus traffic volume.",
      "benefitsWho": "Small teams with high traffic may prefer Statsig's unlimited-seats free tier; larger teams with capped usage needs may prefer GrowthBook's unlimited flags/experiments."
    },
    {
      "title": "AI tooling",
      "toolA": "GrowthBook includes an AI Visual Editor for building experiments and an AI Data Analyst for querying product analytics data.",
      "toolB": "Statsig's facts don't document equivalent AI-assisted authoring or analysis tools.",
      "whyItMatters": "AI-assisted experiment building and querying can reduce the technical lift needed to design tests or explore data.",
      "benefitsWho": "Non-engineering product managers who want to build or analyze experiments without writing queries."
    }
  ],
  "featureMatrix": [
    {
      "group": "Experimentation & Flags",
      "rows": [
        {
          "feature": "A/B testing",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Feature flags",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Warehouse-native architecture",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Multi-arm bandits",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "GrowthBook lists multi-arm bandits on its Pro plan."
        }
      ]
    },
    {
      "group": "Analytics & Replay",
      "rows": [
        {
          "feature": "Product analytics",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Session replay",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "AI-assisted analytics/authoring",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Pricing & Hosting",
      "rows": [
        {
          "feature": "Free self-hosted open-source version",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Free cloud tier",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "SSO/SCIM (Enterprise)",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is GrowthBook or Statsig free?",
      "answer": "Both offer free tiers: GrowthBook's Starter plan is free for up to 3 users (plus a fully free open-source self-hosted version), and Statsig's Developer tier is free with 2M events/month and unlimited seats."
    },
    {
      "question": "Which tool includes session replay?",
      "answer": "Statsig includes session replay linked to experiments and feature flags; this isn't documented as a GrowthBook feature."
    },
    {
      "question": "Can GrowthBook be self-hosted for free?",
      "answer": "Yes, GrowthBook offers a free open-source self-hosted version with unlimited users, in addition to its cloud plans."
    },
    {
      "question": "How is Pro pricing structured for each?",
      "answer": "GrowthBook Pro is $40 per seat per month for up to 50 users; Statsig Pro is a flat $150/month baseline covering 5M events, with additional events billed at $0.05 per 1,000."
    },
    {
      "question": "Which companies use these platforms?",
      "answer": "GrowthBook cites 3,000+ companies as users; Statsig cites customers including OpenAI, Brex, and Notion."
    }
  ]
};

export default growthbookVsStatsigContent;
