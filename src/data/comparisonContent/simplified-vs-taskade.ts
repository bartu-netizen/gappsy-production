import type { ToolComparisonContent } from './types';

const simplifiedVsTaskadeContent: ToolComparisonContent = {
  "verdict": "Simplified and Taskade both use AI agents to automate work, but they target different jobs: Simplified is purpose-built for planning, creating, and publishing marketing campaigns across social and ad channels, while Taskade is a general AI-native workspace for tasks, notes, apps, and automation.",
  "bestForToolA": "Marketing teams that need native publishing to 10+ social and ad channels (TikTok Ads, Meta Ads, LinkedIn, Instagram, YouTube), brand kit management, and approval workflows for campaign content.",
  "bestForToolB": "Teams that want a free, ongoing workspace to build AI-generated apps, dashboards, and automations, with multi-model AI access and multi-seat collaboration starting at a low monthly price.",
  "whoNeedsBoth": "A marketing-led organization that runs paid social campaigns through Simplified could also use Taskade separately for internal task management, dashboards, and general workflow automation.",
  "keyDifferences": [
    {
      "title": "Core Purpose",
      "toolA": "Purpose-built for marketing campaign creation and social/ad publishing via the Riley AI agent.",
      "toolB": "A general AI-native workspace for tasks, notes, AI-generated apps, agents, and automation.",
      "whyItMatters": "Different primary jobs-to-be-done despite both using AI agents.",
      "benefitsWho": "Marketing teams need Simplified's channel publishing; ops and productivity teams need Taskade's app-building and task management."
    },
    {
      "title": "Free Access",
      "toolA": "No ongoing free plan; only a free trial of the Starter plan (5 campaigns, 100K AI words, 100 AI designs, no credit card required).",
      "toolB": "Has a genuine free plan ($0/month, no time limit, 3 deployable apps, 3,000 one-time AI credits).",
      "whyItMatters": "Ongoing no-cost usage versus a time/feature-limited trial changes long-term affordability for small teams.",
      "benefitsWho": "Solo users or small teams wanting to use a tool indefinitely at no cost."
    },
    {
      "title": "Social & Ad Channel Publishing",
      "toolA": "Publishes natively to 10+ social and ad channels, including TikTok Ads, Meta Ads, LinkedIn, Instagram, and YouTube.",
      "toolB": "Integrations (100+) are automation-focused; native social/ad publishing is not documented.",
      "whyItMatters": "Direct ad-channel publishing matters for marketing execution, distinct from general workflow integrations.",
      "benefitsWho": "Social media managers and paid-ads marketers."
    },
    {
      "title": "Multi-Seat Collaboration Entry Point",
      "toolA": "Multi-seat collaboration only becomes available starting on the Pro plan ($119/month billed monthly, $99/month billed annually).",
      "toolB": "Includes 3 team members starting on its $6/month Starter plan.",
      "whyItMatters": "The cost of adding teammates differs significantly between the two.",
      "benefitsWho": "Small teams that need multiple seats early without a big price jump."
    },
    {
      "title": "Developer / API Access",
      "toolA": "Explicit developer access via an MCP server, CLI, REST API/webhooks, and OAuth2.",
      "toolB": "Tagged as offering API access, but no dedicated developer/API feature is described among its listed features.",
      "whyItMatters": "Teams building custom integrations need clearly documented API surfaces.",
      "benefitsWho": "Developers and technical teams building custom workflows on top of the platform."
    }
  ],
  "featureMatrix": [
    {
      "group": "AI Agents & Automation",
      "rows": [
        {
          "feature": "AI agent for end-to-end task execution",
          "toolA": "available",
          "toolB": "available",
          "note": "Simplified: Riley; Taskade: Deployable AI agents"
        },
        {
          "feature": "Automation workflows (branching/looping)",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "AI-generated apps/dashboards",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Multi-model AI access (GPT/Claude/Gemini)",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "15+ frontier models"
        }
      ]
    },
    {
      "group": "Marketing & Publishing",
      "rows": [
        {
          "feature": "Native social/ad channel publishing",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Brand kit / guidelines storage",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Approval workflows",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Free plan (no time limit)",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Free trial",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Simplified Starter trial, no credit card"
        },
        {
          "feature": "Entry paid tier price",
          "toolA": "available",
          "toolB": "available",
          "note": "Simplified $59/mo monthly; Taskade $6/mo annual (Starter)"
        },
        {
          "feature": "Multi-seat collaboration entry point",
          "toolA": "available",
          "toolB": "available",
          "note": "Simplified: starts on Pro ($119/mo); Taskade: 3 members from $6/mo Starter"
        },
        {
          "feature": "API / developer access",
          "toolA": "available",
          "toolB": "limited",
          "note": "Simplified: MCP server, CLI, REST, OAuth2; Taskade is tagged 'api' but not detailed in feature descriptions"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Simplified or Taskade have a free plan?",
      "answer": "Taskade has a genuine free plan ($0/month, 1 user, 3 apps, 3,000 one-time AI credits). Simplified offers only a free trial of its Starter plan (5 campaigns, 100K AI words, 100 AI designs), not an ongoing free tier."
    },
    {
      "question": "Which tool is better for publishing to social and ad channels?",
      "answer": "Simplified is purpose-built for this, publishing natively to 10+ channels including TikTok Ads, Meta Ads, LinkedIn, Instagram, and YouTube. Taskade's integrations are automation-focused and don't document native ad-channel publishing."
    },
    {
      "question": "How much does each tool cost to add team members?",
      "answer": "Taskade includes 3 team members starting on its $6/month Starter plan. Simplified doesn't enable multi-seat collaboration until its Pro plan ($119/month billed monthly, $99/month billed annually)."
    },
    {
      "question": "What does the Riley AI agent in Simplified do?",
      "answer": "Riley plans, creates, and publishes marketing campaigns end-to-end, adjusting output based on approvals and feedback."
    },
    {
      "question": "Can Taskade build apps without code?",
      "answer": "Yes, Taskade can generate dashboards, CRMs, and trackers from a single prompt without engineering resources."
    }
  ]
};

export default simplifiedVsTaskadeContent;
