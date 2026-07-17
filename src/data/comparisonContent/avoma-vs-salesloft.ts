import type { ToolComparisonContent } from './types';

const avomaVsSalesloftContent: ToolComparisonContent = {
  "verdict": "Avoma and Salesloft both include conversation intelligence but are built around different centers of gravity. Avoma, founded in 2017 in Palo Alto, is primarily an AI meeting assistant and revenue intelligence tool with transparent pricing starting at $19/user/month, a 14-day free trial, and over 1,000 integrations. Salesloft, headquartered in Atlanta and used by 4,000+ customers including IBM, Stripe, Siemens, and 3M, is a revenue orchestration platform built around cadence automation, a next-best-action engine called Rhythm, and AI agents for email and website chat, priced only via custom quote. Avoma is the meeting and coaching layer; Salesloft is the outbound pipeline-generation and orchestration layer.",
  "bestForToolA": "Sales and customer-facing teams that want affordable, published per-user pricing for recording, transcribing, and coaching on meetings, plus revenue intelligence like deal risk alerts and win-loss analysis -- Avoma starts at $19/user/month with a 14-day free trial.",
  "bestForToolB": "Enterprise go-to-market teams that need automated outbound cadences, an action-recommendation engine (Rhythm), AI chat and email agents, and predictive sales forecasting -- Salesloft serves 4,000+ customers including IBM and 3M.",
  "whoNeedsBoth": "A sales org could run Salesloft to automate outbound cadences, prioritize next actions via Rhythm, and manage pipeline, while using Avoma to record, transcribe, and analyze the actual sales calls those cadences generate -- Salesloft does not document call recording or transcription, and Avoma does not document cadence or sequence automation, so together they could cover prospecting through the meeting itself.",
  "keyDifferences": [
    {
      "title": "Pricing Transparency",
      "toolA": "Avoma publishes pricing: $19/user/month for AI Meeting Assistant, $29/user/month with Conversation Intelligence added, billed annually.",
      "toolB": "Salesloft does not publish pricing; a sales conversation is required to get a quote.",
      "whyItMatters": "Teams wanting to budget precisely before a sales call can do so with Avoma but not Salesloft.",
      "benefitsWho": "Small and mid-size sales teams comparing exact costs upfront (Avoma) versus enterprises expecting a custom enterprise quote (Salesloft)."
    },
    {
      "title": "Outbound Cadence Automation",
      "toolA": "Avoma does not document sequence or cadence automation for outbound outreach.",
      "toolB": "Salesloft's Cadence automation builds and nurtures pipeline through automated multi-step outreach sequences, supported by Rhythm, an action-recommendation engine that prioritizes what reps should do next.",
      "whyItMatters": "Teams needing to systematize outbound prospecting sequences need Salesloft's cadence engine, which is not part of Avoma's feature set.",
      "benefitsWho": "SDR and outbound sales teams running structured, multi-touch prospecting sequences."
    },
    {
      "title": "AI Agents for Pipeline Generation",
      "toolA": "Avoma does not document AI agents for outreach or website engagement.",
      "toolB": "Salesloft includes AI chat agents that convert website visitors into pipeline and AI agents for email that automate repetitive outreach tasks.",
      "whyItMatters": "Teams wanting AI to actively generate and qualify pipeline (not just analyze meetings) need Salesloft's agent capabilities.",
      "benefitsWho": "Demand generation and SDR teams wanting AI to handle top-of-funnel engagement."
    },
    {
      "title": "Meeting Recording and Transcription",
      "toolA": "Avoma auto-records and transcribes meetings in real time, supporting 40+ languages, with AI-generated notes, summaries, and an AI copilot (Ask Avoma) for querying deal history.",
      "toolB": "Salesloft does not document call recording or transcription as a feature, though it does include conversation intelligence that surfaces insights from sales conversations.",
      "whyItMatters": "Teams whose core need is capturing and coaching on the content of calls will find Avoma's recording/transcription feature set more explicitly built for that job.",
      "benefitsWho": "Sales enablement and coaching teams focused on reviewing what was actually said on calls."
    },
    {
      "title": "Forecasting and Deal Management",
      "toolA": "Avoma's revenue intelligence surfaces deal risk alerts, pipeline visibility, win-loss analysis, and churn prediction, but does not explicitly document predictive forecasting.",
      "toolB": "Salesloft includes dedicated deals management and predictive sales forecasting built on pipeline and activity data.",
      "whyItMatters": "Revenue leaders needing formal forecast numbers for the business will find Salesloft's forecasting feature more directly built for that purpose.",
      "benefitsWho": "Sales leadership and RevOps teams responsible for pipeline forecasting accuracy."
    }
  ],
  "featureMatrix": [
    {
      "group": "Meeting & Conversation Intelligence",
      "rows": [
        {
          "feature": "Call recording and transcription",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Avoma: 40+ languages"
        },
        {
          "feature": "Conversation intelligence / call insights",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "AI meeting notes and summaries",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "AI copilot for deal history Q&A",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Ask Avoma"
        }
      ]
    },
    {
      "group": "Outreach & Pipeline Orchestration",
      "rows": [
        {
          "feature": "Cadence / sequence automation",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Next-best-action recommendation engine",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Salesloft: Rhythm"
        },
        {
          "feature": "AI chat agents for website visitors",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "AI email automation agents",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Predictive sales forecasting",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Deal risk / pipeline visibility",
          "toolA": "available",
          "toolB": "available",
          "note": "Avoma: revenue intelligence; Salesloft: deals management"
        }
      ]
    },
    {
      "group": "Access & Pricing",
      "rows": [
        {
          "feature": "Published pricing",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Avoma: $19-$29/user/month"
        },
        {
          "feature": "Free trial",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Avoma: 14 days, no credit card"
        },
        {
          "feature": "Free / no-cost seats",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Avoma: free view-only seats"
        },
        {
          "feature": "Integrations marketplace",
          "toolA": "available",
          "toolB": "available",
          "note": "Avoma: 1,000+ integrations; Salesloft: marketplace.salesloft.com"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Do Avoma and Salesloft both offer conversation intelligence?",
      "answer": "Yes. Avoma includes call scoring and talk pattern coaching through its Conversation Intelligence tier ($29/user/month). Salesloft also lists conversation intelligence as a feature that surfaces insights about buyer and seller behavior from recorded calls."
    },
    {
      "question": "Which tool is cheaper?",
      "answer": "Avoma publishes transparent pricing starting at $19/user/month. Salesloft does not publish pricing and requires contacting sales for a quote."
    },
    {
      "question": "Does Avoma automate outbound sales sequences?",
      "answer": "No, cadence or sequence automation is not documented as an Avoma feature. This is a core Salesloft capability via its Cadence automation and Rhythm action-recommendation engine."
    },
    {
      "question": "Does Salesloft record and transcribe sales calls?",
      "answer": "Call recording and transcription are not documented as Salesloft features in this data, though it does include conversation intelligence. Avoma explicitly documents auto-recording and transcription in 40+ languages."
    },
    {
      "question": "Can I try Salesloft for free?",
      "answer": "A free trial is not documented for Salesloft. Avoma offers a 14-day free trial with no credit card required, plus free view-only seats."
    },
    {
      "question": "Who are typical Salesloft customers?",
      "answer": "Salesloft reports 4,000+ customers including IBM, Stripe, Siemens, and 3M. Avoma does not publish a comparable customer count in this data."
    }
  ]
};

export default avomaVsSalesloftContent;
