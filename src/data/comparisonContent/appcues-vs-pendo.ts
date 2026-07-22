import type { ToolComparisonContent } from './types';

const appcuesVsPendoContent: ToolComparisonContent = {
  "verdict": "Appcues and Pendo both build in-app guidance, but Pendo documents a much deeper and more transparent product: a genuine free tier up to 500 MAUs, named AI features (Agent Analytics, Predict, Leo), session replay, and scale figures like 14,000+ teams and 1 billion tracked users. Appcues counters with a small-team-focused Spark tier and AI-assisted experience building baked into every plan from day one, but all of its pricing is quote-only with no published free option. Neither dominates — Appcues is positioned as a leaner guidance-first tool, Pendo as a broader analytics-plus-guidance platform.",
  "bestForToolA": "Small teams (Spark plan, under 25 people) shipping their first in-app onboarding experiences who want AI-assisted campaign building and behavioral insights included from day one, without needing session replay or churn prediction.",
  "bestForToolB": "Teams that want to start on a genuine free plan (up to 500 MAUs, no credit card) and later access deeper analytics like session replay, churn prediction (Predict), and natural-language querying (Leo), especially those already using AI agents like Claude or ChatGPT that Pendo documents integrating with.",
  "whoNeedsBoth": "Organizations comparing an onboarding-guidance specialist against a broader analytics-plus-guidance platform may trial Appcues' Spark tier for quick first-experience builds while separately piloting Pendo's free tier for deeper usage analytics, since neither tool's facts document the other's more specialized capabilities (Appcues' Ranger-style governance equivalent is not documented for either, but Pendo's Predict and Leo are unique to Pendo, and Appcues' small-team Spark tier is unique to Appcues).",
  "keyDifferences": [
    {
      "title": "Free plan availability",
      "toolA": "No free tier is documented; every Appcues plan (including the small-team Spark tier) requires booking a call for a quote.",
      "toolB": "Pendo has a documented free plan for up to 500 monthly active users with no credit card required.",
      "whyItMatters": "Teams wanting to try the product without a sales conversation have a clear path with Pendo but not with Appcues.",
      "benefitsWho": "Small teams and solo product managers evaluating tools before committing budget."
    },
    {
      "title": "Depth of AI-powered features",
      "toolA": "Appcues documents one general AI capability: AI-Assisted Experience Building for recommendations on building and optimizing campaigns.",
      "toolB": "Pendo documents several distinct AI features: Agent Analytics (measuring AI agent adoption), Predict (churn risk detection), Leo (natural-language Q&A over product data), and the beta Novus (continuous monitoring with AI-generated PRs).",
      "whyItMatters": "Pendo's facts show a broader, more specific set of named AI capabilities across different use cases, while Appcues documents a single general-purpose AI assistant for campaign building.",
      "benefitsWho": "Product teams wanting AI help with churn prediction or natural-language data queries specifically will find more documented options in Pendo."
    },
    {
      "title": "Session replay and churn prediction",
      "toolA": "Not documented as a feature of Appcues.",
      "toolB": "Session Replay is available from the Core plan and above, and Predict identifies churn risk before it happens.",
      "whyItMatters": "Teams that need to watch real user sessions or get proactive churn warnings have a documented path in Pendo that isn't described for Appcues.",
      "benefitsWho": "Customer success and retention teams."
    },
    {
      "title": "Scale and social proof",
      "toolA": "No usage scale figures (customer count, tracked users, event volume) are documented.",
      "toolB": "Pendo cites 14,000+ teams, over 1 billion tracked users, and 35 trillion collected events, plus integration with 50,000+ agents and apps including Claude and ChatGPT.",
      "whyItMatters": "Buyers weighing vendor maturity and scale have concrete figures to reference for Pendo but not for Appcues in these facts.",
      "benefitsWho": "Enterprise buyers doing vendor due diligence."
    },
    {
      "title": "Small-team-specific plan",
      "toolA": "Appcues offers a dedicated Spark plan built for small teams (under 25 people) shipping their first in-app experiences.",
      "toolB": "No equivalent small-team-specific plan is documented; Pendo's tiers scale from a Free plan (500 MAUs) directly into custom Base/Core/Ultimate tiers.",
      "whyItMatters": "Appcues explicitly tailors an entry offering to very small teams, which isn't mirrored in Pendo's documented plan structure.",
      "benefitsWho": "Very small product teams shipping their first guided experience."
    }
  ],
  "featureMatrix": [
    {
      "group": "In-App Guidance",
      "rows": [
        {
          "feature": "Tours, flows, and walkthroughs",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Reusable content library (surveys, offers, guides)",
          "toolA": "available",
          "toolB": "limited",
          "note": "Pendo's free plan includes Pendo-branded roadmaps and NPS surveys."
        },
        {
          "feature": "User segmentation/targeting",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "AI-assisted experience building",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Pendo's AI features (Leo, Predict, Agent Analytics) serve different purposes than campaign building."
        }
      ]
    },
    {
      "group": "Analytics & Intelligence",
      "rows": [
        {
          "feature": "Product/behavioral analytics",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Session replay",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Pendo: Core plan and above."
        },
        {
          "feature": "Churn prediction",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Pendo's Predict feature."
        },
        {
          "feature": "Natural-language querying over product data",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Pendo's Leo feature."
        },
        {
          "feature": "AI agent adoption tracking",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Pendo's Agent Analytics add-on."
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Free plan",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Pendo: up to 500 MAUs, no credit card."
        },
        {
          "feature": "Published pricing",
          "toolA": "unavailable",
          "toolB": "limited",
          "note": "Appcues: all plans quote-only. Pendo: Free tier published; Base/Core/Ultimate are custom."
        },
        {
          "feature": "Small-team-focused tier",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Appcues' Spark plan targets teams under 25 people."
        },
        {
          "feature": "External data sync",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Pendo's Data Sync integrates usage data across systems."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Appcues publish its pricing?",
      "answer": "No. Appcues pricing is based on monthly active users (MAUs) and requires booking a call; specific dollar amounts are not published on the site."
    },
    {
      "question": "Does Pendo have a free plan?",
      "answer": "Yes, a free plan supports up to 500 monthly active users with product analytics, in-app guides, and Pendo-branded roadmaps/NPS surveys, no credit card required."
    },
    {
      "question": "What is Appcues' Spark plan for?",
      "answer": "Spark is built for small teams (under 25 people) shipping their first in-app experiences."
    },
    {
      "question": "What is Pendo's Leo?",
      "answer": "Leo is Pendo's natural-language question-answering feature over product data."
    },
    {
      "question": "Does every Appcues plan include AI features?",
      "answer": "Yes, according to Appcues, all plans include experience building, user targeting, analytics, and AI capabilities from day one."
    },
    {
      "question": "Does Pendo integrate with AI assistants like Claude or ChatGPT?",
      "answer": "Yes, Pendo's integrations include Claude and ChatGPT among its 50,000+ supported agents and apps."
    }
  ]
};

export default appcuesVsPendoContent;
