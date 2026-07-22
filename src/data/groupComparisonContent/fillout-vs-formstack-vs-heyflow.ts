import type { GroupComparisonContent } from './types';

const filloutVsFormstackVsHeyflowContent: GroupComparisonContent = {
  "verdict": "Fillout, Formstack, and Heyflow are all no-code form builders, but they're tuned for different jobs. Fillout leans on a generous free plan, unlimited seats on every tier, and native two-way sync into Notion and Airtable. Formstack goes deeper into regulated, document-heavy workflows, pairing forms with document generation, e-signatures, and HIPAA/PCI-compliant configurations, but skips a permanent free plan entirely. Heyflow is purpose-built for multi-step, ad-driven lead funnels rather than general-purpose forms, with lead validation and native Meta and Google Ads integrations that the other two don't offer.",
  "bestFor": {
    "fillout": "Teams that want a generous free tier, unlimited seats, and native two-way sync into Notion or Airtable without added automation tools.",
    "formstack": "Regulated organizations needing HIPAA- or PCI-compliant forms bundled with document generation, e-signatures, and deep Salesforce integration.",
    "heyflow": "Marketing teams running paid acquisition campaigns who need high-converting, multi-step lead funnels with built-in ad tracking and lead validation."
  },
  "highlights": [
    {
      "title": "Fillout includes unlimited seats on every plan",
      "description": "Every Fillout tier, including the free plan, includes unlimited team seats and unlimited forms, removing the per-user cost penalty common in Formstack's and other form builders' pricing.",
      "toolSlugs": [
        "fillout"
      ]
    },
    {
      "title": "Formstack bundles documents and e-signatures with compliance",
      "description": "Formstack pairs its form builder with Formstack Documents and Formstack Sign, plus HIPAA- and PCI-compliant configurations, going further into regulated document workflows than Fillout or Heyflow.",
      "toolSlugs": [
        "formstack"
      ]
    },
    {
      "title": "Heyflow is built for conversion funnels, not general forms",
      "description": "Heyflow centers on multi-step, ad-driven lead funnels with phone and OTP lead validation plus native Meta and Google Ads integrations, a focus distinct from Fillout's and Formstack's broader form-building use cases.",
      "toolSlugs": [
        "heyflow"
      ]
    },
    {
      "title": "Only Formstack lacks a permanent free plan",
      "description": "Fillout and Heyflow both offer free-forever plans with response limits, while Formstack offers only a 14-day free trial of its core Forms product.",
      "toolSlugs": [
        "formstack",
        "fillout",
        "heyflow"
      ]
    },
    {
      "title": "Pricing models scale differently",
      "description": "Fillout and Heyflow both price primarily by monthly response volume, while Formstack prices primarily by the number of builder seats, which changes how cost grows as a team or campaign scales.",
      "toolSlugs": [
        "fillout",
        "formstack",
        "heyflow"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Free Tier and Pricing Model",
      "rows": [
        {
          "feature": "Permanent free plan",
          "statuses": {
            "fillout": "available",
            "formstack": "unavailable",
            "heyflow": "available"
          },
          "note": "Fillout's free plan allows 1,000 responses per month; Heyflow's free plan allows 10; Formstack offers only a 14-day trial."
        },
        {
          "feature": "Unlimited seats included on paid plans",
          "statuses": {
            "fillout": "available",
            "formstack": "limited",
            "heyflow": "not-documented"
          },
          "note": "Formstack's Forms plan includes just 1 builder user, scaling up on higher tiers."
        }
      ]
    },
    {
      "group": "Builder Capabilities",
      "rows": [
        {
          "feature": "Native two-way database sync (Notion, Airtable)",
          "statuses": {
            "fillout": "available",
            "formstack": "not-documented",
            "heyflow": "not-documented"
          }
        },
        {
          "feature": "Document generation and e-signatures",
          "statuses": {
            "fillout": "available",
            "formstack": "available",
            "heyflow": "unavailable"
          }
        },
        {
          "feature": "Multi-step, ad-driven conversion funnel builder",
          "statuses": {
            "fillout": "limited",
            "formstack": "limited",
            "heyflow": "available"
          },
          "note": "Fillout and Formstack support multi-step, conditional-logic forms, but Heyflow is purpose-built around funnel conversion for paid acquisition."
        },
        {
          "feature": "Native Meta and Google Ads integrations",
          "statuses": {
            "fillout": "not-documented",
            "formstack": "not-documented",
            "heyflow": "available"
          }
        }
      ]
    },
    {
      "group": "Enterprise and Compliance",
      "rows": [
        {
          "feature": "HIPAA- and PCI-compliant form configurations",
          "statuses": {
            "fillout": "not-documented",
            "formstack": "available",
            "heyflow": "not-documented"
          }
        },
        {
          "feature": "Enterprise SSO",
          "statuses": {
            "fillout": "available",
            "formstack": "available",
            "heyflow": "not-documented"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which has the best free plan?",
      "answer": "Fillout, with 1,000 responses per month plus unlimited forms and seats on its free plan. Heyflow's free plan is limited to 10 responses per month, and Formstack offers only a 14-day free trial rather than a permanent free tier."
    },
    {
      "question": "Which is best for paid-acquisition lead funnels?",
      "answer": "Heyflow, since it's purpose-built for multi-step, ad-driven conversion funnels with phone and OTP lead validation plus native Meta and Google Ads integrations that Fillout and Formstack don't offer."
    },
    {
      "question": "Which supports HIPAA or PCI compliance requirements?",
      "answer": "Formstack, which documents HIPAA- and PCI-compliant form configurations for healthcare and payment-data use cases. Neither Fillout nor Heyflow documents equivalent compliance certifications."
    },
    {
      "question": "Which syncs natively with Notion or Airtable?",
      "answer": "Fillout, through native two-way sync that creates or updates database records the instant a form is submitted, without needing Zapier or other middleware."
    },
    {
      "question": "Do any of these include document generation and e-signatures?",
      "answer": "Both Fillout and Formstack do. Fillout bundles e-signatures and PDF generation directly into its plans, while Formstack pairs its form builder with the separate Formstack Documents and Formstack Sign products for more compliance-heavy document workflows."
    },
    {
      "question": "Which is priced by team seats versus response volume?",
      "answer": "Formstack prices primarily by the number of builder seats, starting with just one on its entry Forms plan. Fillout and Heyflow instead price primarily by monthly response volume, with Fillout including unlimited seats on every tier."
    }
  ]
};

export default filloutVsFormstackVsHeyflowContent;
