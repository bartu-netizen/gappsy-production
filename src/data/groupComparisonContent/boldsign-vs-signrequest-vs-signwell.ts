import type { GroupComparisonContent } from './types';

const boldsignVsSignrequestVsSignwellContent: GroupComparisonContent = {
  "verdict": "BoldSign, SignRequest, and SignWell all offer a genuinely free tier and affordable paid plans for legally binding e-signatures, but they differ in who they're really built for. BoldSign leans hardest into developer-first, embeddable signing with strong compliance coverage, SignRequest is a simple standalone tool now living under Box's ownership with an uncertain long-term roadmap, and SignWell offers the most transparent flat per-sender pricing with no long-term contracts. For most small businesses evaluating on price and simplicity alone, SignWell and BoldSign's free tiers are the strongest starting points; SignRequest is worth a look mainly for teams already in the Box ecosystem.",
  "bestFor": {
    "boldsign": "Software companies and developers who want to embed e-signing directly into their own product via API, plus teams that need HIPAA, SOC 2, or GDPR compliance.",
    "signrequest": "Freelancers and small teams that want a simple, affordable signing tool and may already use or plan to use Box for content storage.",
    "signwell": "Individuals and small businesses that want a genuinely free tier and transparent, contract-free pricing without per-seat complexity."
  },
  "highlights": [
    {
      "title": "BoldSign is the most developer-oriented of the three",
      "description": "BoldSign offers a dedicated Enterprise API priced per envelope with SDKs and webhook support built for embedding signing directly into other software products, a use case SignRequest and SignWell support less explicitly.",
      "toolSlugs": [
        "boldsign"
      ]
    },
    {
      "title": "SignRequest's roadmap is tied to Box Sign",
      "description": "Since Box's 2021 acquisition, Box has stopped building new API integrations under the SignRequest name and is steering developers toward the Box Sign API instead, making SignRequest's long-term standalone future less certain than BoldSign's or SignWell's.",
      "toolSlugs": [
        "signrequest"
      ]
    },
    {
      "title": "SignWell has the most transparent low-cost pricing",
      "description": "SignWell's Free plan offers real usage (3 documents/month) with no credit card, and its Light plan at $10/month removes the document cap with no long-term contracts or cancellation fees on any plan.",
      "toolSlugs": [
        "signwell"
      ]
    },
    {
      "title": "BoldSign covers the deepest compliance ground",
      "description": "BoldSign is SOC 2, GDPR, HIPAA, and PCI DSS compliant in addition to ESIGN and eIDAS support, giving it an edge for healthcare and finance use cases over SignRequest and SignWell, which are documented as ESIGN/eIDAS compliant but not HIPAA-certified.",
      "toolSlugs": [
        "boldsign"
      ]
    },
    {
      "title": "All three gate their strongest features behind paid tiers",
      "description": "BoldSign requires its Business tier for unlimited envelopes and SSO, SignRequest requires Business for advanced team management and bulk send, and SignWell caps senders and templates until the Business or Enterprise plan.",
      "toolSlugs": [
        "boldsign",
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
          "feature": "Genuinely usable free plan",
          "statuses": {
            "boldsign": "available",
            "signrequest": "available",
            "signwell": "available"
          },
          "note": "BoldSign's Essential plan allows 25 envelopes/month; SignRequest's free plan allows limited documents for 1 user; SignWell's free plan allows 3 documents/month."
        },
        {
          "feature": "Standalone e-signature API pricing",
          "statuses": {
            "boldsign": "available",
            "signrequest": "limited",
            "signwell": "available"
          },
          "note": "SignRequest's own API integrations are being deprioritized in favor of Box Sign's API."
        }
      ]
    },
    {
      "group": "Sending and templates",
      "rows": [
        {
          "feature": "Reusable templates",
          "statuses": {
            "boldsign": "available",
            "signrequest": "available",
            "signwell": "available"
          }
        },
        {
          "feature": "Bulk sending",
          "statuses": {
            "boldsign": "available",
            "signrequest": "limited",
            "signwell": "available"
          },
          "note": "SignRequest's bulk send is documented on its Business tier."
        },
        {
          "feature": "Custom branding",
          "statuses": {
            "boldsign": "available",
            "signrequest": "not-documented",
            "signwell": "available"
          }
        }
      ]
    },
    {
      "group": "Compliance and administration",
      "rows": [
        {
          "feature": "HIPAA compliance",
          "statuses": {
            "boldsign": "available",
            "signrequest": "not-documented",
            "signwell": "not-documented"
          },
          "note": "BoldSign's HIPAA compliance is on its Business tier and above."
        },
        {
          "feature": "Single sign-on (SSO)",
          "statuses": {
            "boldsign": "available",
            "signrequest": "not-documented",
            "signwell": "not-documented"
          }
        },
        {
          "feature": "Audit trail on every plan",
          "statuses": {
            "boldsign": "available",
            "signrequest": "available",
            "signwell": "available"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three e-signature tools has the best free plan?",
      "answer": "BoldSign's free Essential plan allows up to 25 envelopes per month with 2 templates, which is the most generous documented free allowance of the three; SignWell's free plan is capped at 3 documents per month, and SignRequest's free plan is limited to 1 user with a smaller document allowance."
    },
    {
      "question": "Is SignRequest still being actively developed?",
      "answer": "SignRequest continues to offer standalone plans, but since Box acquired it in 2021, Box has stated it is no longer building new API integrations under the SignRequest name and is directing developers to the Box Sign API instead, so its long-term standalone roadmap is less certain than BoldSign's or SignWell's."
    },
    {
      "question": "Which tool is best for embedding e-signing into my own software product?",
      "answer": "BoldSign is the most explicitly developer-first option, with a REST API, SDKs, webhook support, and a dedicated Enterprise API priced per envelope built specifically for embedding signing into other applications."
    },
    {
      "question": "Which of these three is HIPAA compliant?",
      "answer": "BoldSign documents HIPAA compliance (on its Business tier and above) alongside SOC 2, GDPR, and PCI DSS coverage. SignRequest and SignWell document ESIGN Act and eIDAS legal compliance but do not document HIPAA compliance."
    },
    {
      "question": "Do any of these charge cancellation or long-term contract fees?",
      "answer": "SignWell explicitly states it has no long-term contracts or cancellation fees on any plan. BoldSign and SignRequest offer both monthly and annual billing options but don't document the same explicit no-cancellation-fee policy as SignWell."
    },
    {
      "question": "Which tool offers the lowest per-user paid pricing?",
      "answer": "BoldSign's Growth plan starts at $5 per user per month billed annually, the lowest paid per-user entry point of the three, followed by SignWell's Light plan at $10 per month and SignRequest's Professional plan at $9 per user per month."
    }
  ]
};

export default boldsignVsSignrequestVsSignwellContent;
