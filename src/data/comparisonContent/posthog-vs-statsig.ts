import type { ToolComparisonContent } from './types';

const posthogVsStatsigContent: ToolComparisonContent = {
  "verdict": "Both PostHog and Statsig bundle product analytics, feature flags, session replay, and A/B testing into one platform rather than requiring separate tools for each. Where they diverge in the available facts is transparency: Statsig publishes a concrete free Developer tier, a $150/month Pro plan, SOC 2 Type 2 certification, and named enterprise customers, while PostHog's available details are limited to its core feature bundle without published pricing or compliance information. This isn't a case of one tool lacking those things — it's that this comparison's documentation is far thinner on the PostHog side, so buyers should verify PostHog's current pricing and certifications directly before deciding.",
  "bestForToolA": "Teams that want a single platform combining event tracking and funnels, feature flags, session replay, and A/B testing without stitching together separate tools, based on PostHog's documented core feature set.",
  "bestForToolB": "Teams that want a documented, generous free tier (2M events/month, unlimited seats) plus warehouse-native architecture, broad SDK support (18+ languages), and SOC 2 Type 2 certification before scaling into a paid or enterprise plan.",
  "whoNeedsBoth": "Teams currently evaluating an all-in-one analytics/flags/replay bundle may pilot both PostHog and Statsig side by side, since the available facts don't show a documented reason to prefer one for a specific technical capability the other lacks — the differentiators here are pricing transparency and compliance documentation rather than feature gaps.",
  "keyDifferences": [
    {
      "title": "Pricing transparency",
      "toolA": "No pricing plans or starting price are documented for PostHog.",
      "toolB": "Statsig publishes a free Developer tier and a $150/month Pro plan with clear overage rates ($0.05 per 1,000 events beyond 5M).",
      "whyItMatters": "Buyers who need to budget before a sales call have a documented number for Statsig but no equivalent figure for PostHog in these facts.",
      "benefitsWho": "Startups and finance teams doing early-stage budget planning."
    },
    {
      "title": "Session replay linkage to experiments",
      "toolA": "Session replay is listed as a standalone feature for watching recordings of real user sessions.",
      "toolB": "Session replay is explicitly linked to experiments and feature flags, so recordings can be tied to specific test variants or flag states.",
      "whyItMatters": "For teams running A/B tests, Statsig's documented linkage between replay and experiments is a specific workflow capability not described for PostHog.",
      "benefitsWho": "Growth and experimentation teams analyzing why a specific test variant behaved a certain way."
    },
    {
      "title": "Warehouse-native architecture",
      "toolA": "Not documented in the available facts.",
      "toolB": "Statsig is described as warehouse-native, integrating directly with existing data warehouses.",
      "whyItMatters": "Teams that already centralize data in a warehouse have a documented integration path with Statsig.",
      "benefitsWho": "Data/analytics engineering teams standardized on a warehouse-first stack."
    },
    {
      "title": "SDK and platform coverage",
      "toolA": "Not documented in the available facts.",
      "toolB": "Statsig provides SDKs for 18+ programming languages and frameworks.",
      "whyItMatters": "Engineering teams working across many languages have a documented SDK count to check against their stack for Statsig; PostHog's SDK breadth isn't specified here.",
      "benefitsWho": "Engineering teams integrating flags/analytics across multiple codebases and languages."
    },
    {
      "title": "Compliance and named customers",
      "toolA": "Not documented in the available facts.",
      "toolB": "Statsig is SOC 2 Type 2 certified and cites customers including OpenAI, Brex, and Notion.",
      "whyItMatters": "Enterprise buyers often need compliance attestations and reference customers as part of procurement; only Statsig documents these here.",
      "benefitsWho": "Enterprise security/procurement teams evaluating vendor risk."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Capabilities",
      "rows": [
        {
          "feature": "Product analytics (event tracking, funnels)",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Feature flags",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Session replay",
          "toolA": "available",
          "toolB": "available",
          "note": "Statsig links replay to experiments and feature flags."
        },
        {
          "feature": "A/B testing / experimentation",
          "toolA": "available",
          "toolB": "available",
          "note": "Statsig documents statistical analysis at scale."
        }
      ]
    },
    {
      "group": "Platform & Trust",
      "rows": [
        {
          "feature": "Warehouse-native integration",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "SDK language/framework coverage",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Statsig: 18+ languages/frameworks."
        },
        {
          "feature": "Compliance certification",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Statsig: SOC 2 Type 2."
        },
        {
          "feature": "Named enterprise customers disclosed",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Statsig cites OpenAI, Brex, and Notion."
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Published starting price",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Statsig Pro: $150/month."
        },
        {
          "feature": "Free tier",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Statsig Developer tier: 2M events/month, unlimited seats."
        },
        {
          "feature": "Enterprise/custom plan",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Statsig Enterprise includes warehouse-native deployment and SSO."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does PostHog include feature flags and session replay?",
      "answer": "Yes — PostHog combines product analytics, feature flags, session replay, and A/B testing in one platform."
    },
    {
      "question": "Does Statsig offer a free plan?",
      "answer": "Yes, the Developer tier is free and includes 2M events/month, unlimited flag checks, and unlimited seats."
    },
    {
      "question": "What does Statsig's Pro plan cost?",
      "answer": "Pro is $150/month, including 5M events, with additional events billed at $0.05 per 1,000."
    },
    {
      "question": "Does Statsig support session replay?",
      "answer": "Yes, session replay is included and can be linked to experiments and feature flags."
    },
    {
      "question": "How many SDKs does Statsig support?",
      "answer": "Statsig provides SDKs for 18+ programming languages and frameworks."
    },
    {
      "question": "Is pricing information available for PostHog in this comparison?",
      "answer": "No — the source facts for PostHog do not include published pricing plans or a starting price, so this should be confirmed directly with PostHog."
    }
  ]
};

export default posthogVsStatsigContent;
