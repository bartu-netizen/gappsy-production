import type { ToolComparisonContent } from './types';

const fullstoryVsMouseflowContent: ToolComparisonContent = {
  "verdict": "FullStory's free plan allows a much larger session volume (30,000/month) and adds StoryAI-driven analysis, but every paid tier requires a custom quote; Mouseflow publishes exact pricing through its Premium tier and adds dedicated form analytics and friction detection, though its own free plan is capped at just 500 sessions/month.",
  "bestForToolA": "Teams that want a large free-tier session allowance (30,000 sessions/month, 12-month retention) and StoryAI-driven behavioral insights, and don't mind requesting a quote once they need to upgrade.",
  "bestForToolB": "Teams that want transparent, published pricing at every paid tier plus dedicated form analytics and friction detection, and can work within a smaller free-plan session allowance.",
  "whoNeedsBoth": "Conversion-optimization teams that use FullStory's larger free-tier volume for high-traffic marketing pages while relying on Mouseflow's form analytics and friction detection specifically on checkout or signup flows.",
  "keyDifferences": [
    {
      "title": "Free plan session volume and retention",
      "toolA": "FullstoryFree offers 30,000 monthly sessions with 12 months of retention for up to 10 users, no credit card required.",
      "toolB": "Free forever plan limited to 500 sessions/month with only 1-month retention.",
      "whyItMatters": "Sites with meaningful traffic will exhaust Mouseflow's free tier quickly but can operate much longer on FullStory's free allowance.",
      "benefitsWho": "Higher-traffic sites and teams wanting longer historical session retention on a free plan."
    },
    {
      "title": "Paid pricing transparency",
      "toolA": "Business, Advanced, and Enterprise plans are all custom, contact-sales pricing with no published rate.",
      "toolB": "Essential ($25/month), Advanced ($109/month), and Premium ($319/month) are all published with exact session, project, and retention limits.",
      "whyItMatters": "Budget planning is far more predictable with Mouseflow's published tiers than with FullStory's quote-only model.",
      "benefitsWho": "Smaller teams and budget-constrained buyers who want to self-serve pricing decisions."
    },
    {
      "title": "Form analytics and friction detection",
      "toolA": "No dedicated form-analytics or friction-detection feature is listed.",
      "toolB": "Includes dedicated form analytics (reveals why users abandon forms) and friction detection (flags moments where users struggle).",
      "whyItMatters": "Teams focused on form/checkout abandonment get a purpose-built feature with Mouseflow that isn't documented for FullStory.",
      "benefitsWho": "E-commerce and lead-gen teams optimizing signup or checkout forms."
    },
    {
      "title": "AI insight approach",
      "toolA": "StoryAI turns behavioral data into insights teams can query directly.",
      "toolB": "Mina AI offers real-time guidance on sessions and heatmaps, plus an MCP server letting AI assistants query behavior data directly.",
      "whyItMatters": "Both offer AI-assisted analysis, but Mouseflow additionally exposes an MCP server for external AI assistant integration, which isn't mentioned for FullStory.",
      "benefitsWho": "Teams wanting to connect behavioral data to AI coding or analysis assistants via MCP."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Features",
      "rows": [
        {
          "feature": "Session replay",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Heatmaps",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Conversion funnels",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Form analytics",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Mobile analytics",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Free plan",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Published paid-tier pricing",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "FullStory's paid tiers are all custom/contact-sales."
        }
      ]
    },
    {
      "group": "AI Capabilities",
      "rows": [
        {
          "feature": "AI-driven behavioral insights",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "MCP server for AI assistants",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does FullStory have a free plan?",
      "answer": "Yes, FullstoryFree offers 30,000 monthly sessions and 12 months of retention for up to 10 users, no credit card required."
    },
    {
      "question": "How much do FullStory's paid plans cost?",
      "answer": "Pricing is custom; you need to request pricing and a demo from FullStory."
    },
    {
      "question": "What is StoryAI?",
      "answer": "FullStory's AI feature that transforms behavioral data into insights teams can query in natural language."
    },
    {
      "question": "Does Mouseflow have a free plan?",
      "answer": "Yes, free forever for 500 sessions/month with 1-month retention."
    },
    {
      "question": "What's the cheapest paid Mouseflow plan?",
      "answer": "The Essential plan starts at $25/month."
    },
    {
      "question": "Does Mouseflow have AI features?",
      "answer": "Yes, Mina AI provides real-time guidance on sessions and heatmaps."
    }
  ]
};

export default fullstoryVsMouseflowContent;
