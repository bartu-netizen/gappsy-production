import type { ToolComparisonContent } from './types';

const gongVsPlectoContent: ToolComparisonContent = {
  "verdict": "Gong is a call-capture and AI analytics platform that turns customer conversations into forecasting, coaching, and engagement insights, while Plecto is a real-time KPI dashboard and gamification tool that visualizes performance metrics to motivate teams. One analyzes conversations at the source, the other displays and gamifies the resulting metrics.",
  "bestForToolA": "Enterprise revenue teams wanting AI-driven call analysis, predictive forecasting (Gong Forecast), and sales enablement built on real call data, especially larger organizations — Gong reports 5,000+ customers including Fortune 10 accounts.",
  "bestForToolB": "Sales and service teams wanting live, gamified KPI dashboards on office TVs starting at $300/month for the Medium plan, with contests and a reward store to drive day-to-day motivation.",
  "whoNeedsBoth": "A sales organization could use Gong to capture and analyze calls for forecasting and coaching while feeding resulting performance metrics into Plecto's real-time dashboards and gamification contests — Plecto documents 150+ integrations with CRM and telephony systems, making it plausible to visualize Gong-sourced performance data on team-facing screens, though the facts don't document a specific Gong-Plecto integration.",
  "keyDifferences": [
    {
      "title": "Core Function",
      "toolA": "Gong captures and analyzes sales calls and customer interactions with AI to power forecasting, coaching, and engagement.",
      "toolB": "Plecto centralizes data from multiple sources into live KPI dashboards with gamification.",
      "whyItMatters": "Conversation intelligence and metric visualization are different jobs that typically sit in different tool categories.",
      "benefitsWho": "Revenue leaders needing call-level insight need Gong; team leads needing visible motivation tools need Plecto."
    },
    {
      "title": "Pricing Transparency",
      "toolA": "Gong's pricing includes a platform fee plus per-user pricing that is entirely quoted, with no published rate.",
      "toolB": "Plecto publishes tiered pricing: Medium at $300/month, Large at $465/month, both billed yearly for 10 licenses.",
      "whyItMatters": "Smaller teams can budget around published rates versus needing a sales conversation regardless of scale.",
      "benefitsWho": "Smaller teams can budget around Plecto's public rates; Gong requires a sales conversation regardless of company size."
    },
    {
      "title": "Scale and Validation",
      "toolA": "Gong reports 4.9/5 across more than 6,200 G2 reviews, 5,000+ customers including Fortune 10 accounts, and Forrester Wave leader recognition.",
      "toolB": "Plecto's facts don't include comparable review-volume or analyst-recognition figures.",
      "whyItMatters": "Vendor due diligence often weighs review volume and analyst recognition heavily for enterprise deals.",
      "benefitsWho": "Enterprise buyers doing vendor due diligence may weigh Gong's extensive review volume and analyst status."
    },
    {
      "title": "Integration Ecosystem",
      "toolA": "Gong Collective offers 400+ integrations connecting Gong to other revenue tools.",
      "toolB": "Plecto documents 150+ integrations with CRM, helpdesk, and telephony systems.",
      "whyItMatters": "Breadth of ecosystem connectivity affects how easily a tool fits into an existing tech stack.",
      "benefitsWho": "Enterprises with many point tools may value Gong's larger documented integration count."
    },
    {
      "title": "AI Application",
      "toolA": "Gong applies AI to conversation data for forecasting (Gong Forecast), engagement personalization (Gong Engage), enablement (Gong Enable), and automated agents for follow-ups and pipeline updates (Gong Agents).",
      "toolB": "Plecto applies AI narrowly to dashboard creation itself, using Model Context Protocol (MCP) to help build dashboards with AI assistance.",
      "whyItMatters": "The scope of AI application differs from analyzing sales conversations to accelerating dashboard building.",
      "benefitsWho": "Teams wanting AI applied to sales conversations and forecasting need Gong; teams wanting AI to speed up building their own KPI dashboards benefit from Plecto's MCP-based tool."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Purpose",
      "rows": [
        {
          "feature": "Call capture and AI conversation analysis",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Revenue forecasting",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Gong Forecast"
        },
        {
          "feature": "Real-time KPI dashboards / TV displays",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Gamification (contests, reward store)",
          "toolA": "unavailable",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Data and Integrations",
      "rows": [
        {
          "feature": "Automated AI agents for workflow tasks",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Gong Agents"
        },
        {
          "feature": "Sales enablement/coaching from call data",
          "toolA": "available",
          "toolB": "limited",
          "note": "Plecto's coaching module is a generic add-on, not built on call data"
        },
        {
          "feature": "Third-party integration ecosystem",
          "toolA": "available",
          "toolB": "available",
          "note": "Gong: 400+ via Gong Collective; Plecto: 150+"
        },
        {
          "feature": "AI-assisted dashboard building",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Via MCP"
        }
      ]
    },
    {
      "group": "Pricing and Trust",
      "rows": [
        {
          "feature": "Published starting price",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "$300/month"
        },
        {
          "feature": "Free trial",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "14 days"
        },
        {
          "feature": "Analyst recognition",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Forrester Wave leader"
        },
        {
          "feature": "G2 review volume",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "4.9/5, 6,200+ reviews"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Gong offer gamification features like Plecto?",
      "answer": "This isn't documented; Gong's facts focus on call capture, forecasting, and enablement rather than dashboard gamification."
    },
    {
      "question": "Does Plecto analyze sales calls like Gong?",
      "answer": "This isn't documented; Plecto's features center on centralizing data into dashboards, not conversation capture or analysis."
    },
    {
      "question": "Which is cheaper to start with?",
      "answer": "Plecto publishes tiered pricing starting at $300/month. Gong's pricing, a platform fee plus per-user pricing, is entirely custom-quoted."
    },
    {
      "question": "Can Gong data feed into a Plecto dashboard?",
      "answer": "This isn't explicitly documented as an integration, but Plecto's 150+ integrations with CRM and telephony systems make it plausible to visualize Gong-derived performance metrics if that data is accessible through a connected source system."
    },
    {
      "question": "Which has more third-party integrations?",
      "answer": "Gong documents 400+ integrations via Gong Collective, more than Plecto's documented 150+."
    },
    {
      "question": "Does Plecto offer a free trial?",
      "answer": "Yes, a 14-day free trial. Gong's facts don't document a free trial."
    }
  ]
};

export default gongVsPlectoContent;
