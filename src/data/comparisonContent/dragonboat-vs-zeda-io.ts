import type { ToolComparisonContent } from './types';

const dragonboatVsZedaIoContent: ToolComparisonContent = {
  "verdict": "Dragonboat and Zeda.io both sit in the product management category but emphasize different jobs: Dragonboat is a portfolio operating system focused on connecting strategy, planning, and delivery across enterprise teams with its own Ambient Agent, while Zeda.io is built around centralizing customer feedback and using AI to turn it into revenue-prioritized roadmaps. Dragonboat's pricing is entirely custom with no published number; Zeda.io publishes a starting price of $499/month billed annually.",
  "bestForToolA": "Enterprise product organizations that need a portfolio-wide operating layer connecting OKRs, roadmaps, delivery tools (Jira, Azure DevOps, Asana, Slack), and AI agent access via a headless API and MCP server.",
  "bestForToolB": "Product teams whose main bottleneck is turning scattered customer feedback (Slack, Intercom, surveys, interviews) into an AI-analyzed, revenue-prioritized roadmap, with named clients including Microsoft, Twilio, PayPal, and Google.",
  "whoNeedsBoth": "There is no clear complementary scenario here — both tools cover feedback-to-roadmap prioritization and portfolio planning, so they compete for the same budget line rather than serving distinct stages of the same workflow.",
  "keyDifferences": [
    {
      "title": "Pricing Structure",
      "toolA": "Dragonboat publishes no pricing for either its Starter or Enterprise plan; both require contacting sales.",
      "toolB": "Zeda.io publishes a starting price of $499/month for its Standard plan, but only on an annual billing commitment with no monthly option.",
      "whyItMatters": "A published starting price, even a high one, lets a team budget without a sales cycle, while fully custom pricing requires a negotiation before evaluation can even begin.",
      "benefitsWho": "Finance and procurement teams that need a concrete number before greenlighting a pilot."
    },
    {
      "title": "AI Feedback Analysis Depth",
      "toolA": "Dragonboat centralizes customer insights to inform planning but frames its core AI value around the Ambient Agent that tracks and reports across the product development lifecycle.",
      "toolB": "Zeda.io's AI is purpose-built for feedback: automatic AI feedback analysis, an 'Ask AI' natural-language query tool for testing hypotheses against feedback data, and an Opportunity Radar that predictively surfaces emerging issues.",
      "whyItMatters": "Teams whose core problem is making sense of large volumes of unstructured feedback need feedback-specific AI, not general lifecycle tracking.",
      "benefitsWho": "Product managers drowning in scattered qualitative feedback from multiple channels."
    },
    {
      "title": "Free / Low-Cost Access",
      "toolA": "Dragonboat's Starter plan includes free read-only and requestor access for up to 100 users.",
      "toolB": "Zeda.io offers a 14-day free trial and a 90-day prorated refund guarantee, but no free tier — the entry price is $499/month.",
      "whyItMatters": "Free viewer seats versus a time-boxed trial represent different ways of de-risking adoption for a large organization.",
      "benefitsWho": "Dragonboat suits orgs needing many free viewers; Zeda.io suits teams comfortable evaluating via a short trial before committing to annual billing."
    },
    {
      "title": "Migration & Onboarding Support",
      "toolA": "Migration support from competing tools is not documented for Dragonboat.",
      "toolB": "Zeda.io explicitly offers migration support from competing tools including ProductBoard, Aha!, airfocus, UserVoice, and Canny.",
      "whyItMatters": "Explicit migration assistance reduces switching risk for teams already invested in another roadmapping tool's data.",
      "benefitsWho": "Teams currently on ProductBoard, Aha!, or Canny considering a switch."
    },
    {
      "title": "AI Agent / MCP Access",
      "toolA": "Dragonboat provides a headless API and MCP (Model Context Protocol) access specifically so AI agents can read and act on portfolio data.",
      "toolB": "Zeda.io's AI features (Ask AI, Opportunity Radar) are built into the product rather than exposed via a documented MCP server.",
      "whyItMatters": "MCP access matters specifically for teams building custom AI agents or connecting tools like Claude directly to portfolio data.",
      "benefitsWho": "Engineering-adjacent product ops teams building custom AI-agent workflows on top of their planning data."
    }
  ],
  "featureMatrix": [
    {
      "group": "Feedback & Insights",
      "rows": [
        {
          "feature": "Centralized voice-of-customer capture",
          "toolA": "available",
          "toolB": "available",
          "note": "Zeda.io pulls from Slack, Intercom, surveys, interviews"
        },
        {
          "feature": "AI feedback analysis / insight reports",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Natural-language query over feedback data",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Zeda.io's Ask AI"
        },
        {
          "feature": "Predictive issue/opportunity detection",
          "toolA": "available",
          "toolB": "available",
          "note": "Dragonboat: impact analysis; Zeda.io: Opportunity Radar"
        }
      ]
    },
    {
      "group": "Planning & Roadmapping",
      "rows": [
        {
          "feature": "OKRs linked to roadmap",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Revenue/impact-based prioritization",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "In-app feedback widgets and customer portals",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "AI-powered release notes",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Access, Pricing & Integrations",
      "rows": [
        {
          "feature": "Published starting price",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Zeda.io: $499/mo annual"
        },
        {
          "feature": "Free trial",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Zeda.io: 14 days"
        },
        {
          "feature": "Free viewer/requestor seats",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Dragonboat Starter: up to 100 users"
        },
        {
          "feature": "Headless API / MCP for AI agents",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Zapier integration breadth",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Zeda.io: 5,000+ integrations via Zapier"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "How does Dragonboat's pricing compare to Zeda.io's?",
      "answer": "Zeda.io publishes a starting price of $499/month on annual billing. Dragonboat publishes no pricing at all for its Starter or Enterprise plans, both of which require contacting sales."
    },
    {
      "question": "Does either tool offer a free trial?",
      "answer": "Zeda.io offers a 14-day free trial and a 90-day prorated refund guarantee. Dragonboat does not mention a free trial, but its Starter plan includes free read-only and requestor access for up to 100 users."
    },
    {
      "question": "Which tool is stronger for AI-driven feedback analysis?",
      "answer": "Zeda.io is purpose-built around this: it includes automatic AI feedback analysis, the Ask AI natural-language query tool, and Opportunity Radar for predicting emerging issues. Dragonboat centralizes customer insights but frames its primary AI feature, the Ambient Agent, around lifecycle tracking rather than feedback analysis specifically."
    },
    {
      "question": "Can I migrate from Canny or ProductBoard to either tool?",
      "answer": "Zeda.io explicitly offers migration support from ProductBoard, Aha!, airfocus, UserVoice, and Canny. Migration support is not documented for Dragonboat."
    },
    {
      "question": "Does Zeda.io offer monthly billing?",
      "answer": "No. Zeda.io's Standard plan requires annual billing at $499/month; there is no monthly option, which the company says is meant to align both parties toward a longer-term partnership."
    },
    {
      "question": "Which tool provides direct AI agent access to portfolio data?",
      "answer": "Dragonboat provides a headless API and MCP (Model Context Protocol) access specifically designed so AI agents can read and act on portfolio data. A comparable documented MCP server is not mentioned for Zeda.io."
    }
  ]
};

export default dragonboatVsZedaIoContent;
