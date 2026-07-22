import type { GroupComparisonContent } from './types';

const oneflowVsSignrequestVsSignwellContent: GroupComparisonContent = {
  "verdict": "Oneflow, SignRequest, and SignWell all offer a free way to sign basic documents, but Oneflow operates a level above the other two: it's a full contract lifecycle management platform with live collaborative editing and CRM integrations, while SignRequest and SignWell are lighter, simpler e-signature tools focused on getting a document signed quickly and affordably. Teams that only need straightforward signing will likely find SignWell's transparent pricing or SignRequest's simplicity sufficient, while teams managing contract negotiation, renewals, and CRM-linked data at scale will get more from Oneflow.",
  "bestFor": {
    "oneflow": "Sales, legal, HR, and procurement teams that want to negotiate and manage the full contract lifecycle, not just collect a signature, with native CRM integrations.",
    "signrequest": "Freelancers and small teams that want simple, affordable signing and may already use or plan to use Box for content storage.",
    "signwell": "Individuals and small businesses that want a genuinely free tier and transparent, contract-free pricing without per-seat complexity."
  },
  "highlights": [
    {
      "title": "Oneflow is the only true contract lifecycle management platform",
      "description": "Oneflow treats contracts as structured, editable data with live collaborative editing, approval workflows, renewal reminders, and contract analytics, going far beyond the send-and-sign workflow of SignRequest and SignWell.",
      "toolSlugs": [
        "oneflow"
      ]
    },
    {
      "title": "Oneflow has the deepest CRM integrations",
      "description": "Oneflow natively integrates with Salesforce, HubSpot, and Microsoft Dynamics to keep contract data in sync with the sales stack, a level of integration not documented for SignRequest or SignWell.",
      "toolSlugs": [
        "oneflow"
      ]
    },
    {
      "title": "SignWell offers the most transparent, contract-free pricing",
      "description": "SignWell's plans include no long-term contracts or cancellation fees, with unlimited free signers on every tier, making costs predictable for smaller teams.",
      "toolSlugs": [
        "signwell"
      ]
    },
    {
      "title": "SignRequest's roadmap now runs through Box Sign",
      "description": "Since Box's 2021 acquisition, new API development is being directed to the Box Sign API rather than SignRequest itself, which is a consideration for teams evaluating SignRequest's long-term standalone future against Oneflow's and SignWell's more independent roadmaps.",
      "toolSlugs": [
        "signrequest"
      ]
    },
    {
      "title": "All three offer a genuinely free starting point",
      "description": "Oneflow's Free plan covers basic PDF signing, SignRequest's Free plan covers limited documents for one user, and SignWell's Free plan covers 3 documents per month, giving buyers a no-cost way to test each before committing.",
      "toolSlugs": [
        "oneflow",
        "signrequest",
        "signwell"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Free tier and pricing",
      "rows": [
        {
          "feature": "Free plan available",
          "statuses": {
            "oneflow": "available",
            "signrequest": "available",
            "signwell": "available"
          }
        },
        {
          "feature": "Contract-free, no-cancellation-fee pricing",
          "statuses": {
            "oneflow": "not-documented",
            "signrequest": "not-documented",
            "signwell": "available"
          }
        }
      ]
    },
    {
      "group": "Contract capability",
      "rows": [
        {
          "feature": "Live collaborative contract editing",
          "statuses": {
            "oneflow": "available",
            "signrequest": "unavailable",
            "signwell": "unavailable"
          }
        },
        {
          "feature": "Contract analytics and dashboards",
          "statuses": {
            "oneflow": "available",
            "signrequest": "unavailable",
            "signwell": "unavailable"
          }
        },
        {
          "feature": "Reusable templates",
          "statuses": {
            "oneflow": "available",
            "signrequest": "available",
            "signwell": "available"
          }
        },
        {
          "feature": "Bulk sending",
          "statuses": {
            "oneflow": "not-documented",
            "signrequest": "limited",
            "signwell": "available"
          },
          "note": "SignRequest's bulk send is documented on its Business tier."
        }
      ]
    },
    {
      "group": "Integrations and administration",
      "rows": [
        {
          "feature": "Native CRM integrations (Salesforce, HubSpot)",
          "statuses": {
            "oneflow": "available",
            "signrequest": "limited",
            "signwell": "not-documented"
          },
          "note": "SignRequest integrates with Salesforce on its Business tier but does not document HubSpot integration."
        },
        {
          "feature": "Advanced e-signature compliance levels (qualified/advanced eIDAS)",
          "statuses": {
            "oneflow": "available",
            "signrequest": "limited",
            "signwell": "not-documented"
          },
          "note": "SignRequest documents standard eIDAS and ESIGN Act compliance rather than advanced/qualified signature levels."
        },
        {
          "feature": "Developer API",
          "statuses": {
            "oneflow": "available",
            "signrequest": "limited",
            "signwell": "available"
          },
          "note": "SignRequest's own API is being deprioritized in favor of the Box Sign API; Oneflow's API access is on its Enterprise tier."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "What's the main difference between Oneflow and the other two tools?",
      "answer": "Oneflow is a full contract lifecycle management platform that supports live collaborative editing, approval workflows, contract analytics, and renewal tracking, while SignRequest and SignWell are lighter e-signature tools focused mainly on sending a document and collecting a signature."
    },
    {
      "question": "Which of these three is cheapest for a small team that just needs basic signing?",
      "answer": "SignWell's Light plan starts at $10/month with no per-seat pricing complexity, and SignRequest's Professional plan starts at $9 per user per month; Oneflow's paid tiers start higher, around EUR17 per user per month for its Essentials plan, reflecting its broader contract-management scope."
    },
    {
      "question": "Does Oneflow integrate with my CRM?",
      "answer": "Yes. Oneflow has native integrations with Salesforce, HubSpot, and Microsoft Dynamics to keep contract data synced with the sales stack, which is more extensive than the CRM integration documented for SignRequest or SignWell."
    },
    {
      "question": "Is SignRequest a safe long-term choice given the Box acquisition?",
      "answer": "SignRequest still offers standalone plans, but Box has stopped building new API integrations under the SignRequest name and is directing developers to the Box Sign API instead, so teams planning for the long term should weigh that against Oneflow's and SignWell's more independently developed roadmaps."
    },
    {
      "question": "Which tool is best if I need signatures to meet advanced EU legal requirements?",
      "answer": "Oneflow explicitly supports advanced and qualified e-signature levels for EU compliance, while SignRequest and SignWell document standard eIDAS and ESIGN Act compliance without specifying advanced or qualified signature support."
    },
    {
      "question": "Can I try all three without paying anything?",
      "answer": "Yes. Oneflow's Free plan covers sending and signing basic PDF contracts, SignRequest's Free plan supports one user with limited documents, and SignWell's Free plan allows one sender, one template, and 3 documents per month."
    }
  ]
};

export default oneflowVsSignrequestVsSignwellContent;
