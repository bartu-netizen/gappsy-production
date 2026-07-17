import type { ToolComparisonContent } from './types';

const dealhubCpqVsLetterdropContent: ToolComparisonContent = {
  "verdict": "DealHub CPQ and Letterdrop address different stages of a sales motion. Letterdrop surfaces named contacts actively in competitor sales cycles to help reps prioritize outreach, while DealHub CPQ takes a deal from configured quote through contract, eSign, and subscription billing once a prospect is already engaged.",
  "bestForToolA": "DealHub CPQ suits revenue teams that need to automate complex quoting, contract lifecycle management, and subscription billing with governed AI (DealHub AI) and integrations across NetSuite, Salesforce, HubSpot, and Microsoft Dynamics 365 — companies like Intuit, HP, Braze, and Zapier are cited users.",
  "bestForToolB": "Letterdrop suits outbound-focused sales teams at companies with 50+ employees that want daily, named-contact signals about who is actively evaluating 3-5 named competitors, delivered directly into Salesforce, HubSpot, Apollo, Outreach, or Clay within about 10 days of setup.",
  "whoNeedsBoth": "A sales org could use Letterdrop to surface which named contacts are in active competitor sales cycles and route that signal to reps, then use DealHub CPQ to configure the quote, contract, and subscription billing once one of those prospects becomes a live opportunity.",
  "keyDifferences": [
    {
      "title": "Sales-Cycle Stage",
      "toolA": "DealHub CPQ operates at the configure/quote/contract/billing stage of a deal, via CPQ, CLM, DealRoom, and subscription billing.",
      "toolB": "Letterdrop operates earlier, at the prospecting/pipeline-generation stage, surfacing named contacts in active competitor sales cycles before a vendor is chosen.",
      "whyItMatters": "Buying the wrong tool for the stage means missing the actual workflow gap.",
      "benefitsWho": "Revenue operations teams closing deals need DealHub CPQ; SDR/AE teams building pipeline need Letterdrop."
    },
    {
      "title": "AI Application",
      "toolA": "DealHub AI uses governed execution with conditional logic to automate deal-flow decisions within the quoting and contracting workflow.",
      "toolB": "Letterdrop connects via Model Context Protocol (MCP) so AI assistants like ChatGPT and Claude can query its data and take actions, and it delivers a recommended outreach play alongside each signal.",
      "whyItMatters": "The two platforms apply AI to different problems: deal-flow automation versus signal delivery and AI-assistant access.",
      "benefitsWho": "Teams standardizing approval logic benefit from DealHub AI; teams already using ChatGPT/Claude in their workflow benefit from Letterdrop's MCP integration."
    },
    {
      "title": "Time to Value",
      "toolA": "DealHub CPQ's facts don't document an onboarding timeline, and it offers no free trial or free plan per its own site.",
      "toolB": "Letterdrop documents first signals arriving within 10 days, with no implementation project required.",
      "whyItMatters": "Teams needing to move fast without a lengthy rollout should weigh Letterdrop's documented 10-day timeline against DealHub's undocumented, presumably longer CPQ implementation.",
      "benefitsWho": "Sales teams wanting rapid time-to-value benefit from Letterdrop's stated onboarding speed."
    },
    {
      "title": "Signal Accuracy vs. Deal Certainty",
      "toolA": "DealHub CPQ works on deals already in motion (quotes, contracts) rather than probabilistic signals, so its facts don't include an accuracy metric.",
      "toolB": "Letterdrop states its competitor-signal accuracy is around 30% on average, up to about 1 in 2 in some verticals, meaning not every surfaced contact converts.",
      "whyItMatters": "Letterdrop is a prioritization tool with known noise in its signal, while DealHub CPQ acts on deals that are already real.",
      "benefitsWho": "Teams comfortable acting on probabilistic signals to prioritize outreach benefit from Letterdrop; teams needing a system of record for confirmed deals benefit from DealHub CPQ."
    },
    {
      "title": "Compliance & Certifications",
      "toolA": "DealHub CPQ holds ISO 27001, ISO 27701, ISO 22301, and ISO 42001 certifications, along with SOC 1 Type II and SOC 2 Type II, and is GDPR/CCPA compliant.",
      "toolB": "Letterdrop is documented as SOC 2 compliant and states customer data is not used to train its models.",
      "whyItMatters": "DealHub documents a broader compliance certification stack, which may matter more for enterprise procurement/security reviews.",
      "benefitsWho": "Security-conscious enterprise buyers evaluating vendor risk benefit from DealHub's wider certification list."
    }
  ],
  "featureMatrix": [
    {
      "group": "Sales Workflow Coverage",
      "rows": [
        {
          "feature": "Quote configuration (CPQ)",
          "toolA": "available",
          "toolB": "unavailable",
          "note": ""
        },
        {
          "feature": "Contract lifecycle management",
          "toolA": "available",
          "toolB": "unavailable",
          "note": ""
        },
        {
          "feature": "Subscription billing",
          "toolA": "available",
          "toolB": "unavailable",
          "note": ""
        },
        {
          "feature": "Competitor sales-cycle monitoring",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Tracks 3-5 named competitors"
        },
        {
          "feature": "Named-contact signal delivery",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Daily, with a confidence score"
        }
      ]
    },
    {
      "group": "AI & Integrations",
      "rows": [
        {
          "feature": "AI-driven deal-flow automation",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "DealHub AI"
        },
        {
          "feature": "MCP integration with ChatGPT/Claude",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "CRM integrations",
          "toolA": "available",
          "toolB": "available",
          "note": "DealHub: Salesforce, HubSpot, MS Dynamics 365; Letterdrop: Salesforce, HubSpot, plus Slack, Apollo, Outreach, Clay"
        },
        {
          "feature": "ERP integration",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "DealHub: NetSuite"
        }
      ]
    },
    {
      "group": "Access & Trust",
      "rows": [
        {
          "feature": "Published self-serve pricing",
          "toolA": "unavailable",
          "toolB": "unavailable",
          "note": "Both require a sales conversation or demo"
        },
        {
          "feature": "Free trial",
          "toolA": "unavailable",
          "toolB": "not-documented",
          "note": "DealHub explicitly offers none"
        },
        {
          "feature": "SOC 2 compliance",
          "toolA": "available",
          "toolB": "available",
          "note": "DealHub: SOC 2 Type II"
        },
        {
          "feature": "Documented onboarding timeline",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Letterdrop: first signals within 10 days"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Do DealHub CPQ and Letterdrop do the same thing?",
      "answer": "No. DealHub CPQ automates quoting, contracts, and billing for deals already in motion, while Letterdrop surfaces named contacts actively engaging with named competitors earlier in the pipeline."
    },
    {
      "question": "How fast can I see results from Letterdrop?",
      "answer": "Letterdrop states first signals arrive within 10 days, with no implementation project required."
    },
    {
      "question": "Does DealHub CPQ offer a free trial?",
      "answer": "No, DealHub's website does not mention a free trial or free plan; pricing requires contacting sales for a custom quote."
    },
    {
      "question": "How accurate is Letterdrop's competitor monitoring?",
      "answer": "Letterdrop identifies contacts at roughly 30% accuracy on average for active competitor sales cycles, and up to about 1 in 2 in some verticals."
    },
    {
      "question": "Which tool has more compliance certifications documented?",
      "answer": "DealHub CPQ documents a broader set — ISO 27001, ISO 27701, ISO 22301, ISO 42001, SOC 1 Type II, and SOC 2 Type II, plus GDPR/CCPA compliance. Letterdrop documents SOC 2 compliance and states it doesn't train models on customer data."
    },
    {
      "question": "Can either tool connect to ChatGPT or Claude?",
      "answer": "Letterdrop documents an MCP integration so AI assistants like ChatGPT and Claude can query its data and take actions. No equivalent integration is documented for DealHub CPQ."
    }
  ]
};

export default dealhubCpqVsLetterdropContent;
