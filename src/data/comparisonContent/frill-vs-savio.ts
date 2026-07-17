import type { ToolComparisonContent } from './types';

const frillVsSavioContent: ToolComparisonContent = {
  "verdict": "Frill is a general-purpose feedback platform built around an ideas board, public roadmap, changelog, and surveys that any SaaS or web team can embed on their site; Savio is narrower and CRM-centric, built specifically to aggregate feature requests scattered across Slack, HubSpot, Intercom, Zendesk, and Salesforce and rank them by ARR and account value for revenue-driven prioritization. Frill suits teams that want a public-facing engagement hub; Savio suits Sales/Customer Success-heavy orgs that need feedback tied back to revenue data already living in their CRM.",
  "bestForToolA": "Frill fits teams that want a public-facing feedback and roadmap hub with surveys and a visual priority matrix, starting at $25/month for the Startup plan (50 ideas, 1 survey).",
  "bestForToolB": "Savio fits B2B SaaS companies with Sales/CS teams already using HubSpot, Salesforce, Intercom, or Zendesk who want requests automatically tied to ARR and account value; CRM integrations require the $249/month Business plan.",
  "whoNeedsBoth": "A SaaS company could use Savio internally to aggregate and rank feature requests by revenue impact for the product team, while running Frill as the customer-facing voting board and public roadmap/changelog that customers see and follow.",
  "keyDifferences": [
    {
      "title": "Revenue-Based Prioritization",
      "toolA": "Frill's priority matrix weighs ideas visually by benefit vs. cost, without tying scores to CRM revenue data.",
      "toolB": "Savio sorts requests by number of requesters, total ARR, opportunity value, and account MRR pulled from HubSpot or Salesforce.",
      "whyItMatters": "Teams sizing feature requests against revenue impact need Savio's CRM-linked scoring, not just visual weighing.",
      "benefitsWho": "Benefits Sales/CS leaders who must justify roadmap decisions with revenue data."
    },
    {
      "title": "Entry Pricing & Plan Depth",
      "toolA": "Frill's Startup plan is $25/month with 50 ideas and 1 survey.",
      "toolB": "Savio's Essential plan is $39/month with 1 paid user, and CRM integrations are reserved for the $249/month Business tier.",
      "whyItMatters": "Cost-conscious teams need to know what's gated at the entry level before committing.",
      "benefitsWho": "Benefits early-stage teams evaluating budget for feedback tooling."
    },
    {
      "title": "Public-Facing Engagement",
      "toolA": "Frill offers a public voting/ideas board, an embeddable public roadmap, a changelog, and NPS/CSAT/poll surveys.",
      "toolB": "Savio offers a public voting board, but changelog and survey tooling aren't documented; its focus is internal request routing.",
      "whyItMatters": "Companies wanting a customer-visible engagement hub vs. internal-only triage need different tools.",
      "benefitsWho": "Benefits product marketing/community teams that want customers to see and follow a roadmap."
    },
    {
      "title": "CRM & Dev-Tool Sync",
      "toolA": "Frill's integration catalog is broad (100+ integrations cited, including Jira, Slack, Zendesk, Linear) but not CRM-scoring-specific.",
      "toolB": "Savio syncs status updates from Jira, Linear, or Shortcut back into HubSpot/Salesforce, closing the loop for CRM users.",
      "whyItMatters": "Teams that live in a CRM need status updates reflected there automatically.",
      "benefitsWho": "Benefits Sales/CS teams tracking customer-specific requests."
    },
    {
      "title": "White Labeling & Branding",
      "toolA": "Frill's white labeling and custom domain are only available on the $149/month Growth tier or above.",
      "toolB": "Savio doesn't document white-labeling or custom-domain capability.",
      "whyItMatters": "Teams wanting a fully branded public feedback surface need to check tier costs vs. whether the feature exists at all.",
      "benefitsWho": "Benefits marketing teams wanting brand consistency."
    }
  ],
  "featureMatrix": [
    {
      "group": "Feedback Collection",
      "rows": [
        {
          "feature": "Public ideas/voting board",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Public roadmap",
          "toolA": "available",
          "toolB": "available",
          "note": "Savio: 1 roadmap on Essential, 5 on Professional, unlimited on Business"
        },
        {
          "feature": "Changelog/announcements",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Surveys (NPS/CSAT/polls)",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Prioritization & Data",
      "rows": [
        {
          "feature": "Revenue-based scoring (ARR/MRR)",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Savio's core differentiator"
        },
        {
          "feature": "Priority matrix (benefit vs. cost)",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "CRM data filtering (HubSpot/Salesforce)",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Business tier, $249/month"
        }
      ]
    },
    {
      "group": "Collaboration & Access",
      "rows": [
        {
          "feature": "SSO",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Frill: included on all paid tiers"
        },
        {
          "feature": "API access",
          "toolA": "available",
          "toolB": "available",
          "note": "Savio: Professional tier ($79/mo) or above"
        },
        {
          "feature": "White labeling",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Frill: Growth tier, $149/month"
        },
        {
          "feature": "Unlimited free/non-admin users",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Frill or Savio tie feature requests to revenue?",
      "answer": "Savio scores requests by ARR, MRR, and opportunity value pulled from a connected CRM; Frill's priority matrix weighs ideas by benefit vs. cost, not revenue data."
    },
    {
      "question": "Which is cheaper to start?",
      "answer": "Frill's Startup plan is $25/month vs. Savio's Essential plan at $39/month."
    },
    {
      "question": "Does either integrate with Salesforce or HubSpot?",
      "answer": "Savio does, but only on its $249/month Business plan. Frill's 100+ integrations include Jira, Slack, Zendesk, and Linear, but Salesforce/HubSpot aren't specifically documented."
    },
    {
      "question": "Do both offer free trials?",
      "answer": "Yes, both offer a 14-day free trial with no credit card required."
    },
    {
      "question": "Which offers built-in surveys?",
      "answer": "Frill includes NPS, CSAT, polls, and open feedback surveys starting at 1 survey on its Startup plan; this isn't documented for Savio."
    },
    {
      "question": "Which has unlimited free users?",
      "answer": "Both do: Frill includes unlimited teammates on all tiers, and Savio includes unlimited non-admin users on every plan."
    }
  ]
};

export default frillVsSavioContent;
