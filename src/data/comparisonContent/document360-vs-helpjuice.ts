import type { ToolComparisonContent } from './types';

const document360VsHelpjuiceContent: ToolComparisonContent = {
  "verdict": "Document360 and Helpjuice are both AI-powered knowledge base platforms, but they differ sharply in pricing transparency and where AI sits in the plan structure. Document360 publishes no pricing at all — every plan requires a questionnaire and sales conversation — while Helpjuice lists exact monthly prices ($249, $449, $799) but explicitly excludes its full AI Suite from the entry $249/month tier. Helpjuice also discloses a 2011 founding year and U.S. headquarters, information Document360 does not provide.",
  "bestForToolA": "Teams that want AI search, an AI chatbot, and an AI writing agent described as built into the product from the start, plus direct MCP connectivity to ChatGPT, Claude, or Copilot, and that are comfortable requesting a custom quote.",
  "bestForToolB": "Teams that want to see exact pricing upfront and are comfortable starting on the $249/month Knowledge Base plan without AI, upgrading to the $449/month AI-Knowledge Base plan only once they need the full AI Suite, or that value Helpjuice's named migration tooling from Zendesk, Confluence, or HelpScout.",
  "whoNeedsBoth": "Buyers running a formal RFP for a knowledge base platform will likely need quotes from both, since Document360 has no public numbers to compare against Helpjuice's published tiers without going through its questionnaire process.",
  "keyDifferences": [
    {
      "title": "Pricing transparency",
      "toolA": "Document360 uses custom pricing based on team accounts, workspaces, languages, security needs, and AI usage, requiring a questionnaire and sales conversation.",
      "toolB": "Helpjuice publishes exact monthly prices: $249 (Knowledge Base), $449 (AI-Knowledge Base), and $799 (Unlimited AI-Knowledge Base).",
      "whyItMatters": "Published pricing lets a team estimate cost immediately, while custom pricing requires a sales process before any number is known.",
      "benefitsWho": "Budget-conscious buyers and smaller teams wanting a quick cost estimate."
    },
    {
      "title": "AI Suite bundling",
      "toolA": "Document360 states its AI features (search, chatbot, writing agent) are built into the product rather than bolted on, though plan-by-plan AI inclusion isn't itemized in the facts.",
      "toolB": "Helpjuice's entry $249/month Knowledge Base plan explicitly excludes the full AI Suite, which is only included starting on the $449/month AI-Knowledge Base plan.",
      "whyItMatters": "Teams evaluating entry-level cost need to know whether AI features come standard or require an upgrade.",
      "benefitsWho": "Teams budgeting for AI features specifically, not just base documentation hosting."
    },
    {
      "title": "Company history disclosure",
      "toolA": "Founding year, headquarters, and company size are not disclosed on the Document360 site.",
      "toolB": "Helpjuice discloses it was founded in 2011 and is headquartered in the United States.",
      "whyItMatters": "A verifiable operating history can be a factor in vendor risk assessments.",
      "benefitsWho": "Procurement and vendor-risk teams doing due diligence."
    },
    {
      "title": "AI assistant ecosystem connectivity",
      "toolA": "Document360's MCP Server integration explicitly connects its knowledge base to ChatGPT, Claude, and Copilot.",
      "toolB": "Helpjuice's facts don't mention MCP or third-party AI assistant connectivity.",
      "whyItMatters": "Teams that want their knowledge base surfaced inside external AI assistants need this kind of protocol-level connection.",
      "benefitsWho": "Teams already using ChatGPT, Claude, or Copilot as a front end for internal knowledge."
    },
    {
      "title": "Legacy platform migration support",
      "toolA": "Document360 supports importing from PDF and Word documents and exporting articles back to PDF, without naming specific source-platform migration tooling.",
      "toolB": "Helpjuice offers 24-hour migration support for moving content from platforms like Zendesk, Confluence, and HelpScout.",
      "whyItMatters": "Named migration support from specific competitor platforms reduces switching friction for teams already using those tools.",
      "benefitsWho": "Teams migrating off Zendesk, Confluence, or HelpScout specifically."
    }
  ],
  "featureMatrix": [
    {
      "group": "AI Features",
      "rows": [
        {
          "feature": "AI-powered search",
          "toolA": "available",
          "toolB": "available",
          "note": "Document360: cites sources. Helpjuice: contextual, intent-based."
        },
        {
          "feature": "AI chatbot",
          "toolA": "available",
          "toolB": "available",
          "note": "Helpjuice: Swifty AI Chatbot, included from the AI-Knowledge Base plan."
        },
        {
          "feature": "AI writing/content generation",
          "toolA": "available",
          "toolB": "available",
          "note": "Document360: AI Writing Agent, from video/files. Helpjuice: AI Writer, from Slack/tickets/emails, AI-KB plan and above."
        },
        {
          "feature": "MCP / AI assistant connectivity (ChatGPT, Claude, Copilot)",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Published flat-rate pricing",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Entry plan includes full AI suite",
          "toolA": "not-documented",
          "toolB": "unavailable",
          "note": "Helpjuice's $249/month entry plan excludes the AI Suite."
        },
        {
          "feature": "Free trial",
          "toolA": "available",
          "toolB": "available",
          "note": "Document360: 14-day, full features. Helpjuice: 14-day, no credit card, money-back guarantee."
        }
      ]
    },
    {
      "group": "Company & Support",
      "rows": [
        {
          "feature": "Founding year disclosed",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Helpjuice: 2011."
        },
        {
          "feature": "Headquarters disclosed",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Helpjuice: United States."
        },
        {
          "feature": "Named migration tooling from other platforms",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Helpjuice: Zendesk, Confluence, HelpScout."
        },
        {
          "feature": "Integration count",
          "toolA": "available",
          "toolB": "available",
          "note": "Document360: 60+. Helpjuice: 100+."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Document360 pricing public?",
      "answer": "No, Document360 uses custom pricing based on team accounts, workspaces, languages, security needs, and AI usage, requiring a questionnaire and sales conversation."
    },
    {
      "question": "How much does Helpjuice cost?",
      "answer": "Plans start at $249/month for Knowledge Base (no AI Suite), with AI-enabled plans at $449/month and $799/month for unlimited users."
    },
    {
      "question": "Does Document360 connect to AI assistants like ChatGPT or Claude?",
      "answer": "Yes, via its MCP Server integration, Document360 connects its knowledge base to ChatGPT, Claude, and Copilot."
    },
    {
      "question": "When was Helpjuice founded?",
      "answer": "Helpjuice was founded in 2011."
    },
    {
      "question": "Does Helpjuice include AI features on its entry plan?",
      "answer": "No, the entry Knowledge Base plan ($249/month) does not include the AI Suite; it's added starting at $449/month."
    },
    {
      "question": "Does Document360 offer a free trial?",
      "answer": "Yes, a 14-day free trial with access to all features before requiring a plan selection."
    }
  ]
};

export default document360VsHelpjuiceContent;
