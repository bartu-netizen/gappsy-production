import type { ToolComparisonContent } from './types';

const chorusAiVsOutreachContent: ToolComparisonContent = {
  "verdict": "Chorus.ai is a focused conversation intelligence tool, backed by 14 technology patents and now sold only as part of ZoomInfo's platform, centered on call transcription, deal intelligence, and win/loss analysis. Outreach is a much broader agentic AI revenue orchestration platform founded in 2014, spanning prospecting, deal management, forecasting, and coaching through tools like Outreach Omni and Agent Studio, used by enterprises including Zoom, Snowflake, ServiceNow, and Okta. The comparison is really depth-of-focus versus breadth-of-platform.",
  "bestForToolA": "Teams that specifically want patent-backed conversation intelligence tied to ZoomInfo's B2B contact and company database, and are comfortable buying into the ZoomInfo platform.",
  "bestForToolB": "Larger revenue teams wanting one platform covering prospecting, deal management, forecasting, and coaching with agentic AI tools like Outreach Omni and Agent Studio.",
  "whoNeedsBoth": "The facts don't describe a natural combined-use case since both include conversation-intelligence-style coaching; a revenue team would typically choose the broader platform (Outreach) or the focused tool (Chorus) rather than both.",
  "keyDifferences": [
    {
      "title": "Platform Breadth",
      "toolA": "Chorus.ai is centered specifically on call transcription, coaching, and deal/win-loss intelligence, without a documented prospecting or forecasting module.",
      "toolB": "Outreach spans prospecting, deal management, forecasting, and coaching in one system, with dedicated modules like Outreach Omni and Meeting Prep Agent.",
      "whyItMatters": "The decision is whether you need one platform for the whole revenue cycle or a focused conversation-intelligence tool.",
      "benefitsWho": "RevOps leaders consolidating tools (Outreach) versus those needing best-of-breed call analysis (Chorus.ai)."
    },
    {
      "title": "Agent Customization and GTM Connectivity",
      "toolA": "Chorus.ai doesn't document a comparable agent-building or MCP-style integration capability.",
      "toolB": "Outreach's Agent Studio provides a visual canvas for configuring workflow automation, and Outreach MCP connects information and actions across a broader go-to-market tech stack.",
      "whyItMatters": "Custom agent-building and cross-tool connectivity determine how much automated workflow customization is possible.",
      "benefitsWho": "Technical RevOps teams wanting to build custom automated workflows across their GTM stack."
    },
    {
      "title": "Founding Transparency and Track Record",
      "toolA": "Chorus.ai's founding year isn't published, and its current identity is as part of ZoomInfo's platform rather than a standalone company with its own reported usage metrics.",
      "toolB": "Outreach discloses a 2014 founding year and reports helping sellers close over 2 million opportunities every month.",
      "whyItMatters": "Founding transparency and reported usage scale help buyers gauge vendor maturity and longevity.",
      "benefitsWho": "Buyers evaluating vendor maturity and track record as part of due diligence."
    },
    {
      "title": "Data Enrichment Source",
      "toolA": "Chorus.ai connects directly to ZoomInfo's B2B contact and company database for enrichment.",
      "toolB": "Outreach's documented integrations focus on its own knowledge base (uploaded case studies, battlecards) and MCP connectivity rather than a named third-party contact database.",
      "whyItMatters": "Direct access to a large firmographic database changes how much enrichment work is needed outside the platform.",
      "benefitsWho": "Teams that specifically want ZoomInfo-sourced firmographic data tied to call insights."
    },
    {
      "title": "Named Customer Base",
      "toolA": "Chorus.ai's validation centers on G2 awards ('Easiest Admin - SMB,' 'Best Results - MM') and 14 ML patents, rather than named enterprise logos.",
      "toolB": "Outreach cites large enterprise customers including Zoom, Snowflake, ServiceNow, and Okta.",
      "whyItMatters": "Named enterprise references versus award/patent validation are different forms of social proof.",
      "benefitsWho": "Buyers who weigh recognizable brand-name customer references against technical and usability award validation."
    }
  ],
  "featureMatrix": [
    {
      "group": "Conversation & Coaching",
      "rows": [
        {
          "feature": "Call Transcription & Analysis",
          "toolA": "available",
          "toolB": "available",
          "note": "Outreach's conversation intelligence"
        },
        {
          "feature": "Deal / Win-Loss Intelligence",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Coaching from Recorded Calls",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Revenue Cycle Coverage",
      "rows": [
        {
          "feature": "Prospecting Automation",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "AI sales agents, Meeting Prep Agent"
        },
        {
          "feature": "Forecasting",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Custom Agent Workflow Builder",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Outreach's Agent Studio"
        },
        {
          "feature": "GTM Stack Connectivity",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Outreach MCP"
        }
      ]
    },
    {
      "group": "Company & Validation",
      "rows": [
        {
          "feature": "Standalone Product Availability",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Chorus sold only within ZoomInfo's platform"
        },
        {
          "feature": "Named Enterprise Customers",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Zoom, Snowflake, ServiceNow, Okta"
        },
        {
          "feature": "Third-Party Data Enrichment",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "ZoomInfo database"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Chorus.ai broader or narrower than Outreach?",
      "answer": "Narrower. Chorus.ai focuses on call transcription, coaching, and deal/win-loss intelligence, while Outreach spans prospecting, deal management, forecasting, and coaching in one agentic AI platform."
    },
    {
      "question": "When was Outreach founded?",
      "answer": "Outreach was founded in 2014. Chorus.ai's founding year is not published on its current product page."
    },
    {
      "question": "Does Chorus.ai include prospecting tools like Outreach?",
      "answer": "Prospecting automation is not documented as a Chorus.ai feature. Outreach includes AI sales agents and a Meeting Prep Agent as part of its prospecting and deal-management capability."
    },
    {
      "question": "Can I build custom AI workflows in either platform?",
      "answer": "Outreach's Agent Studio provides a visual canvas for configuring workflow automation, plus Outreach MCP for connecting to a broader GTM stack. A comparable agent-building capability is not documented for Chorus.ai."
    },
    {
      "question": "Which enterprise customers use each platform?",
      "answer": "Outreach cites customers including Zoom, Snowflake, ServiceNow, and Okta. Chorus.ai's facts don't list named enterprise customers, focusing instead on G2 awards and its patent portfolio."
    },
    {
      "question": "Does Chorus.ai connect to ZoomInfo's data?",
      "answer": "Yes, Chorus.ai connects conversation data with ZoomInfo's B2B contact and company database. This kind of named third-party data enrichment integration isn't documented for Outreach."
    }
  ]
};

export default chorusAiVsOutreachContent;
