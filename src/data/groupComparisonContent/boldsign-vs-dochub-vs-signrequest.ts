import type { GroupComparisonContent } from './types';

const boldsignVsDochubVsSignrequestContent: GroupComparisonContent = {
  "verdict": "BoldSign, DocHub, and SignRequest are all affordable, template-driven e-signature tools with free entry tiers, but they differ in focus and momentum. BoldSign leans developer-first with a strong compliance story, DocHub adds full browser-based PDF editing on top of signing, and SignRequest is the simplest and cheapest per-seat option, though now a Box subsidiary whose independent product investment, including new API work, is being redirected toward Box Sign. None is clearly superior across the board; the choice depends on whether you value an API, a PDF editor, or the lowest sticker price.",
  "bestFor": {
    "boldsign": "Developers and software companies needing to embed e-signing via API with strong HIPAA and SOC 2 compliance coverage",
    "dochub": "Teams wanting free browser-based PDF editing plus e-signing built into Gmail and Google Drive",
    "signrequest": "Small businesses and freelancers who want the simplest, lowest-cost per-user e-signature tool backed by an established parent company"
  },
  "highlights": [
    {
      "title": "SignRequest is the low-cost entry point",
      "description": "SignRequest's Professional plan starts at $9 per user per month, undercutting BoldSign's Growth plan and DocHub's Basic plan on a straight per-seat basis.",
      "toolSlugs": [
        "signrequest"
      ]
    },
    {
      "title": "BoldSign is built to be embedded",
      "description": "BoldSign ships a REST API and SDKs for embedding sending, signing, and webhooks directly into another application, a capability not documented for DocHub or SignRequest.",
      "toolSlugs": [
        "boldsign"
      ]
    },
    {
      "title": "DocHub is a PDF editor first",
      "description": "DocHub combines in-browser PDF editing, annotation, and fillable forms with e-signing, tightly integrated into Gmail, Google Drive, and Dropbox.",
      "toolSlugs": [
        "dochub"
      ]
    },
    {
      "title": "SignRequest's roadmap now runs through Box Sign",
      "description": "Since being acquired by Box in 2021, SignRequest's technology powers Box Sign, and Box has stated it is no longer building new API integrations under the SignRequest name.",
      "toolSlugs": [
        "signrequest"
      ]
    },
    {
      "title": "Free plans exist on all three, with different limits",
      "description": "BoldSign, DocHub, and SignRequest each offer a free tier for occasional use, though document and user limits vary.",
      "toolSlugs": [
        "boldsign",
        "dochub",
        "signrequest"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Signing and Templates",
      "rows": [
        {
          "feature": "Free plan available",
          "statuses": {
            "boldsign": "available",
            "dochub": "available",
            "signrequest": "available"
          }
        },
        {
          "feature": "Reusable templates",
          "statuses": {
            "boldsign": "available",
            "dochub": "available",
            "signrequest": "available"
          }
        },
        {
          "feature": "Bulk sending",
          "statuses": {
            "boldsign": "available",
            "dochub": "available",
            "signrequest": "available"
          },
          "note": "Bulk send sits on paid tiers for all three (BoldSign Growth+, DocHub Pro, SignRequest Business)"
        }
      ]
    },
    {
      "group": "Developer and Integrations",
      "rows": [
        {
          "feature": "Embeddable API for developers",
          "statuses": {
            "boldsign": "available",
            "dochub": "not-documented",
            "signrequest": "limited"
          },
          "note": "SignRequest's API exists but Box has deprioritized new SignRequest integrations in favor of the Box Sign API"
        },
        {
          "feature": "Third-party app integrations",
          "statuses": {
            "boldsign": "limited",
            "dochub": "available",
            "signrequest": "available"
          },
          "note": "BoldSign's Salesforce integration is Business-tier only; DocHub and SignRequest both connect to Google Drive and Dropbox"
        }
      ]
    },
    {
      "group": "Compliance and Editing",
      "rows": [
        {
          "feature": "HIPAA compliance option",
          "statuses": {
            "boldsign": "available",
            "dochub": "available",
            "signrequest": "not-documented"
          }
        },
        {
          "feature": "Full PDF editing beyond signing",
          "statuses": {
            "boldsign": "unavailable",
            "dochub": "available",
            "signrequest": "unavailable"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Why was SignRequest acquired by Box, and does that affect the product?",
      "answer": "Box acquired SignRequest in February 2021 for 55 million US dollars and has integrated its e-signature technology into Box Sign. SignRequest still operates as a standalone product with its own plans, but Box has said it is no longer building new API integrations under the SignRequest name, pointing developers to the Box Sign API instead."
    },
    {
      "question": "Which tool offers the lowest per-user price?",
      "answer": "SignRequest's Professional plan starts at $9 per user per month, which is lower than BoldSign's Growth plan (from $5/user/month annual, but effectively $15/month monthly) at comparable feature levels and DocHub's Basic plan at about $8 per user per month."
    },
    {
      "question": "Can I embed BoldSign or SignRequest signing directly into my own app?",
      "answer": "BoldSign is explicitly built for this with a REST API, SDKs, and a per-envelope Enterprise API. SignRequest has API capability but Box is directing new integration development toward Box Sign rather than the SignRequest API, so long-term investment there is less certain."
    },
    {
      "question": "Which tool is best for basic PDF editing beyond just signing?",
      "answer": "DocHub, which functions as a full in-browser PDF editor with annotation, fillable form fields, and document certification, in addition to e-signing. Neither BoldSign nor SignRequest is positioned as a general PDF editor."
    },
    {
      "question": "Do these tools support HIPAA-regulated workflows?",
      "answer": "BoldSign (Business plan) and DocHub (custom-priced Site License) both document HIPAA compliance support. SignRequest's provided data confirms ESIGN Act and eIDAS compliance but does not document HIPAA support."
    },
    {
      "question": "Which has the most generous free plan?",
      "answer": "BoldSign's free Essential plan allows up to 25 envelopes per month with 2 templates, which is more generous in volume than DocHub's free tier (about 5 e-signature requests per month) or SignRequest's free tier (limited documents, 1 user)."
    }
  ]
};

export default boldsignVsDochubVsSignrequestContent;
