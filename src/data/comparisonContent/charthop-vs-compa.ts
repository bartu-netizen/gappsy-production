import type { ToolComparisonContent } from './types';

const charthopVsCompaContent: ToolComparisonContent = {
  "verdict": "ChartHop and Compa both touch compensation but serve different jobs: ChartHop is a modular people-analytics and HRIS platform priced per employee (starting at $5/employee/month) that happens to include a Compensation module, while Compa is a compensation-specific intelligence platform priced as a flat enterprise contract (from $35,000/year) built around live market data and AI agents. A buyer shopping for a full HR data backbone with org charts, headcount planning, and performance modules should look at ChartHop; a buyer focused purely on defensible, real-time pay benchmarking and offer decisions should look at Compa.",
  "bestForToolA": "ChartHop fits HR, finance, and people teams that want one modular platform for org charts, headcount planning, HRIS, compensation, performance, and engagement, starting at $5/employee/month for Core with add-on modules priced separately.",
  "bestForToolB": "Compa fits enterprise total rewards teams that specifically need live, granular market data (9M+ observations, 1.2M+ offers) and AI agents for compensation decisions, delivered through channels like Slack, ChatGPT, and Copilot via Compa Connect.",
  "whoNeedsBoth": "A company already running ChartHop as its HRIS and org-chart system of record could layer Compa on top specifically for its Analyst Agent and live offer-level market data when making external hiring or retention offers that ChartHop's Compensation module alone doesn't source data for.",
  "keyDifferences": [
    {
      "title": "Pricing Model",
      "toolA": "ChartHop Core starts at $5/employee/month, with add-on modules like HRIS, Headcount Planning, and Compensation priced at $3-$4/employee/month each, billed annually.",
      "toolB": "Compa's Market Data plan starts at $35,000/year as a flat enterprise price, with the Agents plan requiring a custom quote.",
      "whyItMatters": "Per-employee pricing scales with headcount and can start cheap for small teams, while a flat enterprise floor price suits larger, budget-committed organizations from day one.",
      "benefitsWho": "Smaller or mid-size companies watching per-seat cost will prefer ChartHop's transparent per-employee model."
    },
    {
      "title": "Product Scope",
      "toolA": "ChartHop covers Headcount Planning, HRIS, Compensation, Performance, Engagement, and Goals as distinct modules built on a shared org-chart core.",
      "toolB": "Compa is narrowly focused on compensation intelligence: Market Data and AI-driven Analyst/Partner Agents, without broader HRIS, performance, or engagement features documented.",
      "whyItMatters": "A single broad platform reduces vendor sprawl, while a narrow specialist tool can go deeper on one problem.",
      "benefitsWho": "People operations teams consolidating multiple point tools benefit from ChartHop's breadth; total rewards specialists benefit from Compa's depth."
    },
    {
      "title": "AI Capabilities",
      "toolA": "ChartHop AI (Ask ChartHop) is conversational AI that answers questions, fills forms, models org changes, and automates repeatable tasks using people and business data, billed pay-as-you-go as ChartHop AI Pro.",
      "toolB": "Compa's Analyst Agent automates internal compensation analysis and its Partner Agent guides external-facing compensation decisions, both delivered via Compa Connect into Slack, Claude, ChatGPT, Copilot, and Gemini.",
      "whyItMatters": "Both use AI, but ChartHop's AI spans general org and HR questions while Compa's AI is purpose-built for pay decisions specifically.",
      "benefitsWho": "HR generalists benefit from ChartHop's broad AI assistant; comp analysts benefit from Compa's specialized agents."
    },
    {
      "title": "Market Data Depth",
      "toolA": "ChartHop's Compensation module manages pay cycles with budget-aware workflows but does not document a live external market-data benchmark dataset.",
      "toolB": "Compa tracks 9M+ live observations including 1.2M+ offers, 4.8M+ employees, and 1.2M+ stock grants across 42+ countries.",
      "whyItMatters": "Managing internal pay cycles is different from benchmarking against live external market data — teams that need both will likely need two tools.",
      "benefitsWho": "Compensation teams that must justify offers against current external market rates need Compa's dataset; ChartHop alone won't cover that."
    },
    {
      "title": "Integration Breadth",
      "toolA": "ChartHop connects with 100+ HRIS, ATS, and FP&A tools including ADP, Workday, Greenhouse, and BambooHR.",
      "toolB": "Compa integrates with specific ATS and stock systems: Workday, Oracle, Greenhouse, Carta, and E*TRADE.",
      "whyItMatters": "Broader integration counts reduce the chance of needing custom connectors for existing HR tech stacks.",
      "benefitsWho": "IT and HRIS admins managing a large existing tool stack benefit from ChartHop's wider documented integration count."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Platform",
      "rows": [
        {
          "feature": "Org chart / headcount planning",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "ChartHop Headcount Planning module"
        },
        {
          "feature": "HRIS (employee data system of record)",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "ChartHop HRIS add-on module"
        },
        {
          "feature": "Performance review cycles",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "ChartHop Performance module"
        },
        {
          "feature": "Engagement/pulse surveys",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "ChartHop Engagement module"
        }
      ]
    },
    {
      "group": "Compensation Intelligence",
      "rows": [
        {
          "feature": "Pay cycle / budget management",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "ChartHop Compensation module"
        },
        {
          "feature": "Live external market data",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Compa: 9M+ observations, 42+ countries"
        },
        {
          "feature": "Stock grant tracking",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Compa: 1.2M+ stock grants"
        }
      ]
    },
    {
      "group": "AI & Pricing",
      "rows": [
        {
          "feature": "Conversational AI assistant",
          "toolA": "available",
          "toolB": "available",
          "note": "ChartHop AI Pro (pay-as-you-go); Compa Analyst/Partner Agents"
        },
        {
          "feature": "Published starting price",
          "toolA": "available",
          "toolB": "available",
          "note": "ChartHop: $5/employee/month; Compa: $35,000/year"
        },
        {
          "feature": "Chat-tool (Slack/ChatGPT) integration",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Compa Connect"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is ChartHop or Compa cheaper?",
      "answer": "It depends on headcount. ChartHop starts at $5/employee/month for Core, so a 50-person company could pay roughly $250/month for the base plan before add-ons. Compa's Market Data plan starts at a flat $35,000/year regardless of headcount, which is aimed at larger enterprise budgets."
    },
    {
      "question": "Does ChartHop replace the need for Compa's market data?",
      "answer": "Not based on documented features. ChartHop's Compensation module manages internal pay cycles and budgets, but it does not document access to a live external benchmark dataset the way Compa's 9M+ observation Market Data plan does."
    },
    {
      "question": "Which tool has AI features?",
      "answer": "Both do. ChartHop AI (Ask ChartHop) answers questions, fills forms, models org changes, and automates tasks, billed pay-as-you-go. Compa offers an Analyst Agent and Partner Agent specifically for compensation analysis and decisions, accessible via Slack, ChatGPT, Copilot, Claude, and Gemini through Compa Connect."
    },
    {
      "question": "Can ChartHop and Compa integrate with the same HR systems?",
      "answer": "There is overlap: both list Workday and Greenhouse as integrations. ChartHop documents a broader set of 100+ HRIS, ATS, and FP&A integrations, while Compa's documented integrations focus specifically on ATS and stock platforms like Oracle, Carta, and E*TRADE."
    },
    {
      "question": "Is ChartHop or Compa better for a startup?",
      "answer": "ChartHop's per-employee pricing starting at $5/employee/month is more accessible for smaller headcounts. Compa's $35,000/year floor price for Market Data is structured around enterprise budgets."
    },
    {
      "question": "Does ChartHop have a free plan?",
      "answer": "No free plan is documented for ChartHop; its Core plan starts at $5/employee/month. Compa also does not document a free plan, with Market Data starting at $35,000/year."
    }
  ]
};

export default charthopVsCompaContent;
