import type { ToolComparisonContent } from './types';

const outreachVsPersistiqContent: ToolComparisonContent = {
  "verdict": "Outreach is a broad, agentic AI revenue orchestration platform positioned toward larger revenue teams, with AI sales agents, Outreach Omni, and Agent Studio, used by enterprises like Zoom, Snowflake, ServiceNow, and Okta. PersistIQ is a focused sales engagement tool explicitly built for small teams, with a Chrome extension for LinkedIn prospecting, native bi-directional Salesforce and Copper sync, and a 14-day free trial. The two serve very different scales of sales organization rather than competing for the same buyer.",
  "bestForToolA": "Larger revenue teams that want deep agentic AI across the sales cycle - prospecting, deal management, forecasting, and coaching - and are prepared for a sales-led buying process.",
  "bestForToolB": "Small sales teams that want to prospect directly from LinkedIn via a Chrome extension, sync natively with Salesforce or Copper, and start with a 14-day free trial.",
  "whoNeedsBoth": "The facts don't document a scenario for running both together; a growing company might start on PersistIQ as a small team and later migrate to Outreach as it scales into a larger revenue organization, but the two are not typically used simultaneously.",
  "keyDifferences": [
    {
      "title": "Target Team Size",
      "toolA": "Outreach is positioned toward larger revenue teams and used by large enterprises like Zoom, Snowflake, ServiceNow, and Okta.",
      "toolB": "PersistIQ is explicitly built for small teams to prospect, automate outreach, and sync with a CRM.",
      "whyItMatters": "Platform complexity and pricing structure typically scale with the size of team it's built for.",
      "benefitsWho": "Small sales teams (PersistIQ) versus large enterprise revenue organizations (Outreach)."
    },
    {
      "title": "AI Agent Sophistication",
      "toolA": "Outreach ships a suite of agentic AI tools: AI sales agents that work every deal and account, Outreach Omni (a universal conversational agent), Agent Studio, and a Meeting Prep Agent.",
      "toolB": "PersistIQ's AI capability is limited to a single documented Sales Email AI tool for generating email content.",
      "whyItMatters": "The depth of agentic automation differs substantially between a full agent suite and a single AI writing tool.",
      "benefitsWho": "Teams wanting deep agentic automation (Outreach) versus those needing simple AI-assisted email writing (PersistIQ)."
    },
    {
      "title": "CRM Sync Depth",
      "toolA": "Outreach's CRM connectivity isn't itemized by name in the facts beyond its knowledge base and MCP for broader GTM stack connectivity.",
      "toolB": "PersistIQ documents native bi-directional sync specifically with Salesforce and Copper.",
      "whyItMatters": "Named, native CRM sync gives buyers certainty about exact compatibility before purchase.",
      "benefitsWho": "Teams on Salesforce or Copper wanting confirmed native bi-directional sync."
    },
    {
      "title": "Prospecting Method",
      "toolA": "Outreach's documented prospecting capability centers on AI sales agents and a Meeting Prep Agent rather than a named browser-extension prospecting tool.",
      "toolB": "PersistIQ includes a Chrome extension for pulling prospects directly from LinkedIn and LinkedIn Sales Navigator, with automatic campaign addition.",
      "whyItMatters": "A browser-extension workflow suits reps who manually source leads from LinkedIn day-to-day.",
      "benefitsWho": "Reps who prospect manually from LinkedIn and want one-click campaign addition."
    },
    {
      "title": "Trial and Pricing Access",
      "toolA": "Outreach requires contacting sales, with no free trial or public pricing documented.",
      "toolB": "PersistIQ offers a 14-day free trial, though exact pricing isn't published either.",
      "whyItMatters": "A self-serve trial lowers the barrier to hands-on evaluation compared to a required sales conversation.",
      "benefitsWho": "Small teams and individual reps wanting to self-serve test the product before committing."
    }
  ],
  "featureMatrix": [
    {
      "group": "Prospecting & Outreach",
      "rows": [
        {
          "feature": "Browser Extension Prospecting",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Chrome extension, LinkedIn/Sales Navigator"
        },
        {
          "feature": "Automated Email/Call/Task Campaigns",
          "toolA": "available",
          "toolB": "available",
          "note": "PersistIQ includes A/B testing"
        },
        {
          "feature": "AI-Generated Email Content",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "PersistIQ's Sales Email AI"
        }
      ]
    },
    {
      "group": "AI Agent Sophistication",
      "rows": [
        {
          "feature": "Deal-Working AI Agents",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Conversational Agent Across Accounts",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Outreach Omni"
        },
        {
          "feature": "Custom Agent Workflow Builder",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Outreach's Agent Studio"
        }
      ]
    },
    {
      "group": "CRM & Buying Experience",
      "rows": [
        {
          "feature": "Named Native CRM Sync",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Salesforce and Copper"
        },
        {
          "feature": "Free Trial",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "14 days"
        },
        {
          "feature": "Published Pricing",
          "toolA": "unavailable",
          "toolB": "unavailable"
        },
        {
          "feature": "Built for Small Teams",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Outreach is positioned toward larger revenue teams"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is PersistIQ a good fit for a small sales team versus Outreach?",
      "answer": "Yes. PersistIQ is explicitly built for small teams to prospect and automate outreach, while Outreach is positioned toward larger revenue teams and used by enterprises like Zoom, Snowflake, ServiceNow, and Okta."
    },
    {
      "question": "Does PersistIQ offer a free trial?",
      "answer": "Yes, PersistIQ offers a 14-day free trial. Outreach's facts don't document a free trial; pricing requires contacting sales."
    },
    {
      "question": "Which CRMs does each tool sync with?",
      "answer": "PersistIQ documents native bi-directional sync specifically with Salesforce and Copper. Outreach's facts don't itemize a named CRM list, focusing instead on its knowledge base and MCP for broader GTM stack connectivity."
    },
    {
      "question": "How does prospecting work in PersistIQ?",
      "answer": "PersistIQ includes a Chrome extension that builds prospect lists from LinkedIn and LinkedIn Sales Navigator, with email finding and automatic addition to campaigns."
    },
    {
      "question": "How much more AI capability does Outreach have than PersistIQ?",
      "answer": "Considerably more, per the documented facts. Outreach includes AI sales agents working every deal, a universal conversational agent (Outreach Omni), Agent Studio for custom workflows, and a Meeting Prep Agent. PersistIQ's AI capability is limited to a single Sales Email AI tool for generating email content."
    },
    {
      "question": "Is PersistIQ an independent company?",
      "answer": "No, PersistIQ operates as a subsidiary of Wishpond. Outreach's facts don't indicate it operates under a parent company."
    }
  ]
};

export default outreachVsPersistiqContent;
