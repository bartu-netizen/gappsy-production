import type { RoundupContent } from './types';

const creatioVsMondaySalesCrmVsNimbleContent: RoundupContent = {
  "verdict": "The right pick depends heavily on company size and budget structure rather than raw feature count. Creatio pairs CRM with a genuine no-code business-process platform but requires a roughly $10,000 annual minimum commitment, making sense only for mid-market and enterprise buyers. Monday Sales CRM offers the most visual, drag-and-drop flexibility for building custom pipelines, with a free plan and a low three-seat minimum for paid tiers. Nimble is the lightest-weight option, built around deep Microsoft 365 and Google Workspace integration and modular add-on pricing that suits small businesses and solopreneurs who want to pay only for what they use.",
  "bestFor": {
    "creatio": "Mid-market and enterprise organizations, such as financial services, insurance, or manufacturing firms, that need CRM plus a true no-code application-development platform and can commit to the roughly $10,000/year minimum spend.",
    "monday-sales-crm": "Sales teams at small-to-midsize businesses or departments within larger companies that want a highly visual, freely reconfigurable pipeline built on monday.com's no-code automation engine.",
    "nimble": "Small businesses and solopreneurs already working inside Microsoft 365 or Google Workspace who want a lightweight, relationship-first CRM with social enrichment and pay-as-you-grow add-ons rather than rigid tiers."
  },
  "highlights": [
    {
      "title": "Creatio requires a five-figure annual commitment before you even get started",
      "description": "Creatio enforces a minimum purchase commitment of roughly $10,000 per year regardless of team size, a barrier that neither Monday Sales CRM's three-seat minimum nor Nimble's per-seat pricing with no stated minimum imposes.",
      "toolSlugs": [
        "creatio",
        "monday-sales-crm",
        "nimble"
      ]
    },
    {
      "title": "Only Creatio offers a full BPMN-based no-code process designer",
      "description": "Creatio's visual, BPMN-based process designer and Freedom UI page builder let organizations model custom business applications beyond CRM, a depth of no-code process automation that Monday Sales CRM's board-based automations and Nimble's simpler configuration do not match.",
      "toolSlugs": [
        "creatio"
      ]
    },
    {
      "title": "Nimble is the only one built around native Microsoft 365 and Google Workspace integration",
      "description": "Nimble's Prospector browser extension and deep sync with Microsoft 365 and Google Workspace let it layer directly on top of a small business's existing email and calendar workflows, a specific integration depth not documented for Creatio or Monday Sales CRM.",
      "toolSlugs": [
        "nimble"
      ]
    },
    {
      "title": "Pricing structures differ sharply: tiered versus modular",
      "description": "Creatio and Monday Sales CRM both use tiered per-seat plans with features gated by tier (and add-on modules for Creatio), while Nimble uses a single core plan plus a la carte add-ons for email marketing, extra contacts, storage, and messaging volume.",
      "toolSlugs": [
        "creatio",
        "monday-sales-crm",
        "nimble"
      ]
    },
    {
      "title": "Monday Sales CRM is the only one with a permanent free plan",
      "description": "Monday Sales CRM offers a Free plan for up to two seats with basic contact and lead tracking. Creatio has no free tier and a large minimum commitment, and Nimble offers only a 14-day free trial.",
      "toolSlugs": [
        "monday-sales-crm",
        "creatio",
        "nimble"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core CRM and customization",
      "rows": [
        {
          "feature": "No-code business-process or workflow builder",
          "statuses": {
            "creatio": "available",
            "monday-sales-crm": "available",
            "nimble": "not-documented"
          },
          "note": "Creatio's BPMN process designer and Monday Sales CRM's board automation engine both support custom no-code workflows; Nimble documents pipeline tracking but not a dedicated process builder."
        },
        {
          "feature": "AI-assisted lead scoring or enrichment",
          "statuses": {
            "creatio": "available",
            "monday-sales-crm": "available",
            "nimble": "available"
          }
        },
        {
          "feature": "Built-in quote and invoice generation",
          "statuses": {
            "creatio": "not-documented",
            "monday-sales-crm": "available",
            "nimble": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Integrations",
      "rows": [
        {
          "feature": "Native Microsoft 365 and Google Workspace integration",
          "statuses": {
            "creatio": "not-documented",
            "monday-sales-crm": "not-documented",
            "nimble": "available"
          }
        }
      ]
    },
    {
      "group": "Pricing and commitment",
      "rows": [
        {
          "feature": "Permanent free plan",
          "statuses": {
            "creatio": "unavailable",
            "monday-sales-crm": "available",
            "nimble": "unavailable"
          }
        },
        {
          "feature": "No minimum seat or annual spend commitment",
          "statuses": {
            "creatio": "unavailable",
            "monday-sales-crm": "unavailable",
            "nimble": "available"
          },
          "note": "Creatio requires a roughly $10,000/year minimum; Monday Sales CRM paid plans require a minimum of three seats; Nimble's documented pricing has no stated minimum."
        },
        {
          "feature": "Modular a la carte add-on pricing",
          "statuses": {
            "creatio": "unavailable",
            "monday-sales-crm": "unavailable",
            "nimble": "available"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which CRM is cheapest to get started with?",
      "answer": "Monday Sales CRM has a free plan for up to two seats and paid tiers from about $12/seat/month with a three-seat minimum. Nimble starts at $24.90/seat/month with a 14-day free trial. Creatio has no free tier and requires a roughly $10,000/year minimum commitment regardless of team size."
    },
    {
      "question": "Which is best for a small business already using Microsoft 365 or Google Workspace?",
      "answer": "Nimble, which is built specifically around deep Microsoft 365 and Google Workspace integration, including a browser extension that captures contact and company data from any web page or inbox."
    },
    {
      "question": "Which CRM has the strongest no-code automation capabilities?",
      "answer": "Creatio, whose BPMN-based process designer and Freedom UI page builder go beyond CRM customization into full no-code application development. Monday Sales CRM also has a capable no-code automation engine inherited from the broader monday.com Work OS, but it is board-based rather than full BPM."
    },
    {
      "question": "What is the minimum spend required for each platform?",
      "answer": "Creatio requires a minimum commitment of roughly $10,000 per year. Monday Sales CRM paid plans require a minimum of three seats, at roughly $12 to $28 per seat per month. Nimble's published pricing has no stated minimum beyond paying per seat."
    },
    {
      "question": "Which tool is most flexible for building a custom sales pipeline visually?",
      "answer": "Monday Sales CRM, built on monday.com's drag-and-drop board-and-column engine, lets sales teams reshape pipelines, fields, and automations freely, whereas Nimble offers a more fixed pipeline structure and Creatio's flexibility comes with a steeper learning curve and BPM-style setup."
    },
    {
      "question": "Do all three include AI features?",
      "answer": "Yes. Creatio.ai scores leads, drafts content, and recommends next-best actions across sales, marketing, and service. Monday Sales CRM uses AI for email generation and lead data enrichment. Nimble uses AI to draft outreach emails and summarize relationship history."
    }
  ]
};

export default creatioVsMondaySalesCrmVsNimbleContent;
