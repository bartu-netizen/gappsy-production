import type { ToolComparisonContent } from './types';

const featurebaseVsProdpadContent: ToolComparisonContent = {
  "verdict": "Featurebase combines an omnichannel support inbox, the Fibi AI support agent, and feedback/roadmap tools in one product, with a genuine free plan and per-seat pricing starting at $29/seat/month plus $0.49 per AI resolution. ProdPad is a dedicated product management tool built around the Now-Next-Later roadmap framework its founders invented, with idea management, OKR tracking, and the ProdPad CoPilot AI assistant, but it publishes no seat pricing and instead offers a free trial and unlimited free Reviewer accounts. The two solve adjacent but different jobs: Featurebase is customer-support-and-feedback-facing, while ProdPad is an internal product-planning tool.",
  "bestForToolA": "Support and product teams that want a unified inbox across in-app, Slack, Discord, and email plus an AI support agent and public feedback/roadmap voting, especially early-stage startups eligible for Featurebase's 86% discount program.",
  "bestForToolB": "Product managers who want a structured internal roadmapping practice using the Now-Next-Later framework, OKR tracking tied to roadmap initiatives, and unlimited free 'Reviewer' seats for stakeholders to comment without a paid license.",
  "whoNeedsBoth": "A product organization could run ProdPad internally for roadmap and OKR planning while using Featurebase as the external-facing support and feedback channel that surfaces customer requests to feed into ProdPad's idea backlog — different audiences (internal planning versus customer support) within the same company.",
  "keyDifferences": [
    {
      "title": "Free Plan Depth",
      "toolA": "Featurebase has a persistent Free plan for 1 seat with live chat, a unified inbox, and mobile app access, though without AI support.",
      "toolB": "ProdPad has no permanent free plan for editors; instead it offers unlimited free 'Reviewer' accounts with limited viewing/commenting permissions and a minimum 7-day free trial with full feature access.",
      "whyItMatters": "Teams wanting to use core functionality indefinitely without paying need to know whether a free tier is permanent or trial-based.",
      "benefitsWho": "Solo founders and very small teams wanting to start using the product at no cost long-term (Featurebase) versus teams that mainly need stakeholders to view/comment for free (ProdPad)."
    },
    {
      "title": "AI Pricing Model",
      "toolA": "Featurebase bills AI usage per resolution ($0.49 each) on top of per-seat pricing ($29, $59, or $99/seat/month depending on tier).",
      "toolB": "ProdPad CoPilot is built into the product to assist with writing, prioritization, and feedback synthesis, without a stated per-use AI charge in the facts.",
      "whyItMatters": "Usage-based AI billing can make costs harder to predict at scale compared to a flat, bundled AI feature.",
      "benefitsWho": "Finance and ops teams forecasting software spend, especially support teams with high AI resolution volume."
    },
    {
      "title": "Roadmap Methodology",
      "toolA": "Featurebase's roadmap functionality centers on a feedback hub with voting and a public roadmap/changelog, tied to its support inbox.",
      "toolB": "ProdPad uses the Now-Next-Later framework, a named methodology invented by its founders for building lean, timeline-free roadmaps.",
      "whyItMatters": "Teams that want a specific, structured planning methodology versus a public-facing voting board have different underlying needs.",
      "benefitsWho": "Product managers who want a defined internal planning framework (ProdPad) versus teams that mainly need to publish a customer-facing roadmap (Featurebase)."
    },
    {
      "title": "Pricing Transparency",
      "toolA": "Featurebase publishes exact per-seat prices: Growth at $29/seat/month, Professional at $59/seat/month, and Enterprise at $99/seat/month (all billed yearly).",
      "toolB": "ProdPad does not publish seat pricing at all; the site states you must start a trial or contact sales to see pricing.",
      "whyItMatters": "Published pricing lets buyers budget without a sales conversation, which matters for smaller teams evaluating multiple tools quickly.",
      "benefitsWho": "Self-serve buyers and smaller teams that prefer to evaluate cost without a sales call."
    },
    {
      "title": "Support Channel Coverage",
      "toolA": "Featurebase's omnichannel inbox unifies in-app, Slack, Discord, and email conversations, with Slack support specifically gated to the Professional plan or above.",
      "toolB": "ProdPad's integrations focus on delivery and collaboration tools (Jira, Azure DevOps, GitHub, Trello, Slack, Salesforce, Intercom, Linear, Confluence, Microsoft Teams) rather than a support inbox.",
      "whyItMatters": "Teams need to know whether a tool is meant to handle live customer conversations or to connect product planning to delivery tools.",
      "benefitsWho": "Customer support teams (Featurebase) versus product teams coordinating with engineering delivery tools (ProdPad)."
    }
  ],
  "featureMatrix": [
    {
      "group": "Feedback & Roadmapping",
      "rows": [
        {
          "feature": "Public roadmap and feedback voting",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Featurebase's Feedback hub"
        },
        {
          "feature": "Now-Next-Later roadmap framework",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "OKR tracking tied to roadmap",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Idea backlog management",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Public changelog",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Support & Communication",
      "rows": [
        {
          "feature": "Omnichannel support inbox (Slack/Discord/email)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Live chat",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "SLA management",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Featurebase Professional tier and above"
        },
        {
          "feature": "Delivery tool integrations (Jira, Azure DevOps, GitHub)",
          "toolA": "limited",
          "toolB": "available",
          "note": "Featurebase lists Jira; ProdPad documents a broader delivery-tool set"
        }
      ]
    },
    {
      "group": "AI & Pricing",
      "rows": [
        {
          "feature": "AI support agent",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Featurebase's Fibi, gated to paid tiers"
        },
        {
          "feature": "AI feedback synthesis",
          "toolA": "available",
          "toolB": "available",
          "note": "Featurebase AI prioritization vs ProdPad CoPilot"
        },
        {
          "feature": "Persistent free plan",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "ProdPad offers a trial and free Reviewer seats instead"
        },
        {
          "feature": "Published per-seat pricing",
          "toolA": "available",
          "toolB": "unavailable"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Featurebase or ProdPad free?",
      "answer": "Featurebase has a permanent Free plan for 1 seat with live chat and a unified inbox (no AI support). ProdPad has no permanent free tier for editors, but offers a minimum 7-day free trial with no credit card required, plus unlimited free 'Reviewer' accounts."
    },
    {
      "question": "Which tool is better for customer support?",
      "answer": "Featurebase is purpose-built for support, with an omnichannel inbox unifying in-app, Slack, Discord, and email conversations plus the Fibi AI agent. ProdPad's facts don't document support inbox functionality."
    },
    {
      "question": "Does ProdPad have AI features?",
      "answer": "Yes. ProdPad CoPilot is built into the product to help write roadmap content, prioritize ideas, and summarize customer feedback."
    },
    {
      "question": "How does Featurebase charge for AI?",
      "answer": "Featurebase charges $0.49 per AI resolution in addition to its per-seat monthly pricing on paid plans (Growth, Professional, Enterprise)."
    },
    {
      "question": "What is the Now-Next-Later roadmap?",
      "answer": "It's a roadmap framework invented by ProdPad's founders that organizes work into Now, Next, and Later horizons instead of fixed dates, rather than a traditional timeline-based roadmap."
    },
    {
      "question": "Does either tool offer startup pricing?",
      "answer": "Featurebase offers a startup program with an 86% discount on Professional features plus a year of free Fibi AI for companies under 2 years old with fewer than 6 employees. No equivalent startup discount is documented for ProdPad."
    }
  ]
};

export default featurebaseVsProdpadContent;
