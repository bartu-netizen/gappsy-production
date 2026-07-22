import type { ToolComparisonContent } from './types';

const apolloIoVsDealhubCpqContent: ToolComparisonContent = {
  "verdict": "Apollo.io and DealHub CPQ cover different halves of a sales motion. Apollo.io finds prospects, automates outreach, and supports deal execution with a 230M+ contact database, while DealHub CPQ takes an already-qualified opportunity through quoting, contracting, eSign, and subscription billing.",
  "bestForToolA": "Apollo.io suits sales teams needing a large B2B contact database (230M+ contacts, 30M+ companies), AI-powered multichannel outbound campaigns, and inbound lead routing, with a free-forever Starter plan to start.",
  "bestForToolB": "DealHub CPQ suits revenue teams needing to automate complex, configurable quoting, contract lifecycle management, and subscription billing with governed AI and native NetSuite/Salesforce/HubSpot/Dynamics 365 integrations — used by companies like Intuit, HP, Braze, and Zapier.",
  "whoNeedsBoth": "A sales team could use Apollo.io to source and engage 230M+ contacts through multichannel outreach and manage the deal in its pipeline boards, then hand off closed-won opportunities to DealHub CPQ to generate the formal quote, contract, and eSign package.",
  "keyDifferences": [
    {
      "title": "Sales-Cycle Stage",
      "toolA": "Apollo.io covers prospecting, outbound/inbound lead generation, and deal execution (pipeline boards, AI call summaries, conversation intelligence).",
      "toolB": "DealHub CPQ covers the configure-quote-contract-billing stage once an opportunity is ready to close.",
      "whyItMatters": "They solve adjacent but distinct workflow gaps: pipeline generation versus deal finalization.",
      "benefitsWho": "SDR/BDR and AE teams sourcing pipeline need Apollo.io; deal desk and revenue operations teams need DealHub CPQ."
    },
    {
      "title": "Pricing Model & Transparency",
      "toolA": "Apollo.io is Freemium with a free-forever Starter plan after the trial, though exact paid plan names and prices aren't published on its pricing page.",
      "toolB": "DealHub CPQ is Custom/Enterprise with no published pricing at all — a custom quote is required.",
      "whyItMatters": "Apollo.io gives buyers a no-cost way to start immediately, while DealHub CPQ requires a sales conversation before any pricing is known.",
      "benefitsWho": "Budget-constrained teams or individual reps benefit from Apollo's free Starter plan; enterprise buyers expecting a tailored quote are unaffected by DealHub's lack of public pricing."
    },
    {
      "title": "Data & Database Depth",
      "toolA": "Apollo.io provides access to 230M+ contacts and 30M+ company profiles with verified contact information as a core feature.",
      "toolB": "DealHub CPQ has no contact-database or enrichment feature documented — its focus is the quote/contract/billing workflow, not prospect data.",
      "whyItMatters": "Teams needing to build outbound lists need database depth that only Apollo documents.",
      "benefitsWho": "Outbound-heavy sales teams benefit from Apollo's large contact database."
    },
    {
      "title": "AI Application",
      "toolA": "Apollo.io applies AI to outbound campaigns (deliverability safeguards) and deal execution (AI call summaries, conversation intelligence).",
      "toolB": "DealHub AI applies governed execution with conditional logic to automate deal-flow decisions within quoting and contracting.",
      "whyItMatters": "The AI in each tool solves a different problem: engagement/insight generation versus workflow/approval automation.",
      "benefitsWho": "Reps wanting AI-summarized calls and coaching benefit from Apollo; deal desks wanting automated approval logic benefit from DealHub AI."
    },
    {
      "title": "Platform Access",
      "toolA": "Apollo.io's facts mention no native iOS/Android app, only a Chrome extension.",
      "toolB": "DealHub CPQ's facts don't document a mobile app or browser extension either way.",
      "whyItMatters": "Reps working primarily from a browser will find Apollo's Chrome extension relevant; neither tool documents dedicated mobile apps for reps in the field.",
      "benefitsWho": "Desk-based sales reps using Chrome are the primary fit for Apollo's extension-based workflow."
    }
  ],
  "featureMatrix": [
    {
      "group": "Prospecting & Data",
      "rows": [
        {
          "feature": "B2B contact database",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Apollo: 230M+ contacts, 30M+ companies"
        },
        {
          "feature": "Multichannel outbound automation",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "AI-powered"
        },
        {
          "feature": "Inbound lead management",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Visitor ID, form enrichment, routing"
        },
        {
          "feature": "Conversation intelligence / AI call summaries",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        }
      ]
    },
    {
      "group": "Quoting & Contracting",
      "rows": [
        {
          "feature": "CPQ (configure price quote)",
          "toolA": "unavailable",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Contract lifecycle management",
          "toolA": "unavailable",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Subscription billing",
          "toolA": "unavailable",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "eSignature",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Buyer collaboration portal",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "DealHub's DealRoom"
        }
      ]
    },
    {
      "group": "Pricing & Compliance",
      "rows": [
        {
          "feature": "Free plan",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Apollo: free-forever Starter plan"
        },
        {
          "feature": "Published pricing",
          "toolA": "limited",
          "toolB": "unavailable",
          "note": "Apollo: plan names/prices not published beyond the free tier"
        },
        {
          "feature": "SOC 2 compliance",
          "toolA": "available",
          "toolB": "available",
          "note": "DealHub: SOC 2 Type II"
        },
        {
          "feature": "CRM integrations",
          "toolA": "available",
          "toolB": "available",
          "note": "Apollo: Salesforce, HubSpot, Outreach, SalesLoft; DealHub: Salesforce, HubSpot, MS Dynamics 365"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Are Apollo.io and DealHub CPQ used at the same stage of the sales process?",
      "answer": "No. Apollo.io is used earlier for prospecting, outreach, and deal execution, while DealHub CPQ is used later to generate quotes, contracts, and subscription billing for deals ready to close."
    },
    {
      "question": "Does Apollo.io have a free plan?",
      "answer": "Yes, Apollo offers a free-forever Starter plan once the trial expires."
    },
    {
      "question": "Does DealHub CPQ offer a free trial?",
      "answer": "No, DealHub's website does not mention a free trial or free plan; pricing requires contacting sales for a custom quote."
    },
    {
      "question": "How large is Apollo's contact database?",
      "answer": "Over 230 million contacts and 30 million company profiles."
    },
    {
      "question": "What CRMs does each tool integrate with?",
      "answer": "Apollo.io integrates with Salesforce, HubSpot, Outreach, and SalesLoft; DealHub CPQ integrates with Salesforce, HubSpot, and Microsoft Dynamics 365, plus NetSuite ERP."
    },
    {
      "question": "Does either tool include AI features?",
      "answer": "Yes, both do but for different purposes. Apollo.io uses AI for multichannel outbound campaigns and AI call summaries/conversation intelligence, while DealHub AI uses governed execution with conditional logic to automate deal-flow decisions in quoting and contracting."
    }
  ]
};

export default apolloIoVsDealhubCpqContent;
