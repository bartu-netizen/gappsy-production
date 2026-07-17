import type { ToolComparisonContent } from './types';

const gongVsJiminnyContent: ToolComparisonContent = {
  "verdict": "Gong is a broad, enterprise revenue platform that combines AI sales engagement (Gong Engage), forecasting (Gong Forecast), enablement (Gong Enable), and automated workflow agents into one system backed by 5,000+ customers, including Fortune 10 accounts, and 400+ integrations via Gong Collective. Jiminny is a more focused conversation-intelligence tool centered on AI call recording, transcription, coaching insights, and automated CRM logging, with a transparent 14-day free trial and documented SOC 2 Type II, GDPR, CCPA, and HIPAA compliance. Both capture and analyze sales conversations, but Gong layers on forecasting and workflow automation while Jiminny keeps its scope tighter around recording, coaching, and CRM sync.",
  "bestForToolA": "Large enterprise sales organizations that need forecasting (Gong Forecast), enablement (Gong Enable), and automated follow-up agents in one platform, evidenced by Gong's 5,000+ customer base including Fortune 10 accounts and 400+ Gong Collective integrations.",
  "bestForToolB": "Sales teams that want to evaluate before committing to a contract: Jiminny's 14-day free trial gives full feature access with no credit card required, and its documented SOC 2 Type II and HIPAA compliance suits teams in regulated industries.",
  "whoNeedsBoth": "Realistic overlap is thin since both cover the same conversation-intelligence niche; a more plausible scenario is a growing sales team trialing Jiminny's lighter-weight recording and coaching now, then evaluating Gong's forecasting and workflow-agent layer as the org scales into enterprise deal complexity, rather than running both simultaneously on the same reps.",
  "keyDifferences": [
    {
      "title": "Platform Breadth",
      "toolA": "Gong bundles AI sales engagement (Gong Engage), revenue forecasting (Gong Forecast), enablement (Gong Enable), and automated workflow agents (Gong Agents) around a unified Revenue Graph.",
      "toolB": "Jiminny centers on AI call recording and transcription, sales coaching insights, competitive intelligence tracking, and pipeline risk detection without a dedicated forecasting module in its documented feature set.",
      "whyItMatters": "Teams needing forecasting and outreach automation alongside call analysis get more out-of-the-box from a single vendor with Gong.",
      "benefitsWho": "Enterprise revenue operations teams managing forecasting, coaching, and engagement together."
    },
    {
      "title": "Revenue Forecasting",
      "toolA": "Gong Forecast provides revenue forecasting powered by predictive analytics drawn from deal and call data.",
      "toolB": "Jiminny documents pipeline risk detection from deal conversations but does not list a dedicated forecasting module.",
      "whyItMatters": "Sales leaders relying on AI-assisted forecasts for board reporting need a tool that explicitly supports this.",
      "benefitsWho": "VPs of Sales and RevOps leaders responsible for forecast accuracy."
    },
    {
      "title": "Trial and Evaluation Access",
      "toolA": "Gong's facts show no public trial; pricing includes a platform fee plus per-user licensing quoted individually through sales.",
      "toolB": "Jiminny offers a 14-day free trial with full feature access and no credit card required.",
      "whyItMatters": "Teams that want hands-on evaluation before a sales conversation can start immediately with Jiminny.",
      "benefitsWho": "Smaller sales teams or buyers who prefer self-serve evaluation over a vendor-led sales cycle."
    },
    {
      "title": "Integration Ecosystem",
      "toolA": "Gong Collective is an ecosystem of 400+ integrations connecting Gong to other revenue tools.",
      "toolB": "Jiminny documents integrations with CRM and communication tools including HubSpot and Aircall, without a published total integration count.",
      "whyItMatters": "Organizations with many existing revenue-tech tools benefit from a wider pre-built integration catalog.",
      "benefitsWho": "Enterprises with complex, multi-tool revenue tech stacks."
    },
    {
      "title": "Compliance Documentation",
      "toolA": "Gong's facts don't list specific compliance certifications.",
      "toolB": "Jiminny is SOC 2 Type II certified and compliant with GDPR, CCPA, and HIPAA, and is hosted on AWS with a 99.9% uptime guarantee.",
      "whyItMatters": "Buyers in healthcare or other regulated industries need documented compliance before recording customer conversations.",
      "benefitsWho": "Sales teams in healthcare, finance, or other regulated sectors evaluating call-recording compliance."
    }
  ],
  "featureMatrix": [
    {
      "group": "Conversation Capture & Coaching",
      "rows": [
        {
          "feature": "AI call recording and transcription",
          "toolA": "available",
          "toolB": "available",
          "note": "Gong captures calls via its Revenue Graph; Jiminny records calls, video meetings, and emails directly."
        },
        {
          "feature": "Sales coaching insights",
          "toolA": "available",
          "toolB": "available",
          "note": "Gong Enable vs. Jiminny's coaching insights and AI notetaker."
        },
        {
          "feature": "Competitive intelligence tracking",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Jiminny flags competitor mentions across calls."
        },
        {
          "feature": "Automated CRM activity logging",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "AI notetaker for meetings",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Revenue Operations",
      "rows": [
        {
          "feature": "Revenue forecasting",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Gong Forecast is a dedicated module."
        },
        {
          "feature": "AI sales engagement/outreach",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Gong Engage."
        },
        {
          "feature": "Automated workflow agents (follow-ups, pipeline updates)",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Gong Agents."
        },
        {
          "feature": "Pipeline/deal risk detection",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Trust, Access & Integrations",
      "rows": [
        {
          "feature": "Free trial",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Jiminny: 14 days, no credit card required."
        },
        {
          "feature": "Published compliance certifications",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "SOC 2 Type II, GDPR, CCPA, HIPAA."
        },
        {
          "feature": "Integration ecosystem size",
          "toolA": "available",
          "toolB": "limited",
          "note": "Gong Collective: 400+ integrations; Jiminny names HubSpot and Aircall without a total count."
        },
        {
          "feature": "Published pricing",
          "toolA": "unavailable",
          "toolB": "unavailable",
          "note": "Both require contacting sales."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Gong or Jiminny publish pricing?",
      "answer": "Neither publishes fixed pricing. Gong quotes a platform fee plus per-user licensing individually, and Jiminny's pricing tiers are not disclosed on its site."
    },
    {
      "question": "Which offers a free trial?",
      "answer": "Jiminny offers a 14-day free trial with full feature access and no credit card required. Gong's facts don't mention a public trial."
    },
    {
      "question": "Which tool has revenue forecasting?",
      "answer": "Gong has a dedicated Gong Forecast module built on predictive analytics from deal and call data. Jiminny documents pipeline risk detection but not a full forecasting feature."
    },
    {
      "question": "Which has a bigger integration ecosystem?",
      "answer": "Gong Collective lists 400+ integrations. Jiminny documents named integrations with HubSpot and Aircall without publishing a total count."
    },
    {
      "question": "Which has documented compliance certifications?",
      "answer": "Jiminny is SOC 2 Type II certified and GDPR, CCPA, and HIPAA compliant. Gong's facts don't list equivalent certifications."
    },
    {
      "question": "Which is better for automating follow-up and workflow tasks?",
      "answer": "Gong Agents automate tasks like follow-ups, pipeline updates, and enablement workflows as part of the broader Gong platform; Jiminny's facts don't document equivalent workflow automation agents."
    }
  ]
};

export default gongVsJiminnyContent;
