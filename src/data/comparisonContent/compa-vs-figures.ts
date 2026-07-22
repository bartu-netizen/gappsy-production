import type { ToolComparisonContent } from './types';

const compaVsFiguresContent: ToolComparisonContent = {
  "verdict": "Compa and Figures both sell compensation intelligence to enterprise HR and total rewards teams, but they start from different data foundations and price points. Compa leans on live, continuously refreshed offer, employee, and equity data (9M+ observations across 42+ countries) delivered through AI agents and a $35,000/year starting price for Market Data, while Figures builds its case on a large static benchmark library (3.5M+ datapoints) plus structured salary bands, compensation review cycles, and EU Pay Transparency Directive compliance tooling, with pricing kept fully custom. The choice largely comes down to whether a team wants agent-driven, real-time market intelligence or a benchmarking-plus-workflow platform built around bands, reviews, and pay equity reporting.",
  "bestForToolA": "Compa fits large enterprises that want continuously updated, granular market data (down to 1.2M+ offers and 1.2M+ stock grants) surfaced directly inside Slack, ChatGPT, Copilot, Claude, or Gemini via Compa Connect, and that are prepared to budget from $35,000/year for Market Data.",
  "bestForToolB": "Figures fits HR and comp teams that need a structured, collaborative process — salary bands as a documented source of truth, annual/off-cycle compensation review workflows with budget tracking, and built-in Pay Equity Analysis and EU Pay Transparency Directive support — and are comfortable with a custom quote after a demo.",
  "whoNeedsBoth": "A multinational company preparing for EU Pay Transparency Directive audits could use Figures for its salary bands, pay equity analysis, and review workflows, while pulling Compa's live offer and stock-grant data into Slack or Copilot to sanity-check specific competitive offers before finalizing them — the two tools cover market-truth data and internal governance from different angles.",
  "keyDifferences": [
    {
      "title": "Data Foundation",
      "toolA": "Compa's Live market data feature tracks 9M+ observations, including 1.2M+ offers, 4.8M+ employees, and 1.2M+ stock grants across 42+ countries.",
      "toolB": "Figures' Benchmark feature gives access to 3,500,000+ compensation datapoints for salary comparison.",
      "whyItMatters": "Teams that need granular, frequently refreshed offer- and equity-level data may prefer Compa's dataset scope, while teams focused on broad market salary comparison get that from Figures' benchmark library.",
      "benefitsWho": "Total rewards analysts who need to justify specific offers with current market evidence."
    },
    {
      "title": "AI Delivery Model",
      "toolA": "Compa ships an Analyst Agent and a Partner Agent that automate internal compensation analysis and guide external-facing pay decisions, plus Compa Connect embedding that intelligence into Slack, Claude, ChatGPT, Microsoft Copilot, and Gemini.",
      "toolB": "Figures does not list AI agents or chat-tool integrations among its documented features; its workflows center on Structure, Companion, and the standalone Pay Transparency module.",
      "whyItMatters": "Organizations standardizing on conversational AI workflows may value having compensation data queryable inside tools employees already use daily.",
      "benefitsWho": "Recruiting and people teams that want compensation answers surfaced inside their existing chat and AI tools rather than a separate dashboard."
    },
    {
      "title": "Pricing Transparency",
      "toolA": "Compa publishes a starting price of $35,000/year for its Market Data plan; the Agents plan requires contacting sales.",
      "toolB": "Figures publishes no starting price at all — Structure, Companion, and Pay Transparency are all listed as Custom, requiring a demo for a quote.",
      "whyItMatters": "Knowing a floor price helps buyers pre-qualify budget fit before entering a sales process.",
      "benefitsWho": "Procurement teams that want to budget-screen vendors before booking a demo."
    },
    {
      "title": "Pay Equity & Compliance Depth",
      "toolA": "Compa's documented feature set centers on market data and AI agents; pay equity or EU Pay Transparency Directive compliance tooling is not listed among its features.",
      "toolB": "Figures includes a dedicated Pay Equity Analysis feature and Compliance tools supporting the EU Pay Transparency Directive, plus an optional Pay Equity Expert add-on and a standalone Pay Transparency module.",
      "whyItMatters": "Companies with EU workforces face binding pay transparency reporting obligations that require purpose-built compliance workflows, not just market data.",
      "benefitsWho": "HR and legal teams managing EU Pay Transparency Directive compliance deadlines."
    },
    {
      "title": "HRIS & System Integrations",
      "toolA": "Compa integrates with ATS and stock systems including Workday, Oracle, Greenhouse, Carta, and E*TRADE.",
      "toolB": "Figures connects with 30+ HRIS and review systems.",
      "whyItMatters": "The breadth and type of integrations determine how much manual data reconciliation a comp team will need to do.",
      "benefitsWho": "HRIS administrators responsible for keeping compensation data in sync across systems."
    }
  ],
  "featureMatrix": [
    {
      "group": "Market Data & Benchmarking",
      "rows": [
        {
          "feature": "Live/continuously updated market data",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Compa: 9M+ observations across 42+ countries"
        },
        {
          "feature": "Benchmark datapoints",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Figures: 3.5M+ datapoints"
        },
        {
          "feature": "Equity/stock grant data",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Compa: 1.2M+ stock grants tracked"
        },
        {
          "feature": "Salary bands",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Figures Structure plan"
        }
      ]
    },
    {
      "group": "AI & Workflow Automation",
      "rows": [
        {
          "feature": "AI agents for compensation analysis",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Compa Analyst Agent and Partner Agent"
        },
        {
          "feature": "Chat-tool integrations (Slack, ChatGPT, etc.)",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Compa Connect"
        },
        {
          "feature": "Collaborative compensation review workflow",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Figures Companion plan"
        }
      ]
    },
    {
      "group": "Compliance & Governance",
      "rows": [
        {
          "feature": "Pay equity analysis",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "EU Pay Transparency Directive support",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Figures standalone Pay Transparency module"
        },
        {
          "feature": "Public starting price",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Compa: $35,000/year; Figures: Custom only"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "How much do Compa and Figures cost?",
      "answer": "Compa publishes a starting price of $35,000/year for its Market Data plan, with the Agents plan requiring a custom quote. Figures does not publish any pricing; all three of its plans (Structure, Companion, Pay Transparency) are listed as Custom and require booking a demo."
    },
    {
      "question": "Which tool has more compensation data?",
      "answer": "Both cite large but different datasets: Compa tracks 9M+ live observations including 1.2M+ offers and 1.2M+ stock grants across 42+ countries, while Figures gives access to 3,500,000+ benchmark datapoints."
    },
    {
      "question": "Does either tool support EU Pay Transparency Directive compliance?",
      "answer": "Figures explicitly documents compliance tools for the EU Pay Transparency Directive plus a standalone Pay Transparency module. Compa's documented features do not mention this compliance area."
    },
    {
      "question": "Can I use Compa or Figures inside Slack or ChatGPT?",
      "answer": "Compa Connect integrates compensation intelligence into Slack, Claude, ChatGPT, Microsoft Copilot, and Gemini. Figures does not list similar chat-tool integrations among its documented features."
    },
    {
      "question": "Which tool integrates with more HR systems?",
      "answer": "Figures documents 30+ HRIS and review system integrations. Compa documents integrations with specific ATS and stock platforms including Workday, Oracle, Greenhouse, Carta, and E*TRADE."
    },
    {
      "question": "Do Compa and Figures offer AI agents?",
      "answer": "Compa offers an Analyst Agent for internal analysis and a Partner Agent for external-facing decision guidance. Figures does not document AI agent features; its AI capabilities are not listed in the facts available."
    }
  ]
};

export default compaVsFiguresContent;
