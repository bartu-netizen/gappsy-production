import type { GroupComparisonContent } from './types';

const boldsignVsOneflowVsSignrequestContent: GroupComparisonContent = {
  "verdict": "There is no universal winner among BoldSign, Oneflow, and SignRequest because each is really built for a different job: BoldSign is the strongest pick when you want to embed signing directly into your own product via API and need HIPAA or SOC 2 coverage, Oneflow is the strongest pick when your team wants to negotiate and co-edit a contract as a live document rather than just sign a static PDF, and SignRequest is the simplest and cheapest choice for straightforward signing today, though buyers should note Box has shifted new development toward Box Sign. Match the tool to whether you need developer embedding, contract collaboration, or basic low-cost signing.",
  "bestFor": {
    "boldsign": "Software teams and regulated businesses in healthcare or finance that want to embed e-signing directly into their own product via API while also getting HIPAA and SOC 2 compliance.",
    "oneflow": "Sales, legal, and procurement teams, especially in Europe, who want to negotiate and co-edit contracts as live documents rather than sign static PDFs, and who value CRM-integrated contract data.",
    "signrequest": "Freelancers and small teams that want dead-simple, low-cost e-signing today, while being aware that Box is steering long-term development toward Box Sign."
  },
  "highlights": [
    {
      "title": "BoldSign is the only API-first, developer-embeddable option",
      "description": "BoldSign ships a REST API and SDKs built specifically for embedding signing into other applications, plus a dedicated Enterprise API priced per envelope, something neither Oneflow nor SignRequest documents as a standalone developer offering.",
      "toolSlugs": [
        "boldsign"
      ]
    },
    {
      "title": "Oneflow treats contracts as live, editable data instead of static PDFs",
      "description": "Oneflow's core differentiator is letting both parties negotiate and edit contract content inside a shared digital document before signing, with every field trackable as structured data, unlike BoldSign and SignRequest which center on signing a fixed document.",
      "toolSlugs": [
        "oneflow"
      ]
    },
    {
      "title": "SignRequest's long-term product direction is tied to Box Sign",
      "description": "Since Box acquired SignRequest in 2021, Box has stated it is no longer building new API integrations under the SignRequest name and points developers to the Box Sign API instead, making SignRequest's roadmap less certain than the other two.",
      "toolSlugs": [
        "signrequest"
      ]
    },
    {
      "title": "All three offer a genuinely free entry tier",
      "description": "BoldSign's free Essential plan covers 25 envelopes a month, Oneflow's free plan covers basic PDF signing, and SignRequest offers a limited free tier for occasional signers, so cost is not the deciding factor for light usage.",
      "toolSlugs": [
        "boldsign",
        "oneflow",
        "signrequest"
      ]
    },
    {
      "title": "BoldSign has the deepest documented compliance coverage",
      "description": "BoldSign explicitly lists ESIGN, eIDAS, SOC 2, GDPR, HIPAA, and PCI DSS compliance on its higher tiers, a broader documented compliance set than what is stated for Oneflow or SignRequest.",
      "toolSlugs": [
        "boldsign"
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
            "oneflow": "available",
            "signrequest": "available"
          }
        },
        {
          "feature": "Reusable templates",
          "statuses": {
            "boldsign": "available",
            "oneflow": "available",
            "signrequest": "available"
          }
        },
        {
          "feature": "Bulk sending",
          "statuses": {
            "boldsign": "available",
            "oneflow": "not-documented",
            "signrequest": "available"
          }
        }
      ]
    },
    {
      "group": "Compliance and Security",
      "rows": [
        {
          "feature": "HIPAA compliance",
          "statuses": {
            "boldsign": "available",
            "oneflow": "not-documented",
            "signrequest": "not-documented"
          },
          "note": "BoldSign gates HIPAA behind its Business and Premium tiers"
        },
        {
          "feature": "Single sign-on (SSO)",
          "statuses": {
            "boldsign": "available",
            "oneflow": "not-documented",
            "signrequest": "not-documented"
          },
          "note": "Available on BoldSign's Business plan and above"
        }
      ]
    },
    {
      "group": "Developer and CRM Integration",
      "rows": [
        {
          "feature": "Embeddable API and SDKs",
          "statuses": {
            "boldsign": "available",
            "oneflow": "not-documented",
            "signrequest": "limited"
          },
          "note": "Box has deprioritized new API integrations under the SignRequest name"
        },
        {
          "feature": "CRM integration (Salesforce, HubSpot, etc.)",
          "statuses": {
            "boldsign": "available",
            "oneflow": "available",
            "signrequest": "available"
          },
          "note": "BoldSign's Salesforce integration is on its Business plan; Oneflow adds Salesforce, HubSpot, and Dynamics"
        }
      ]
    },
    {
      "group": "Contract Lifecycle",
      "rows": [
        {
          "feature": "Live collaborative contract editing before signing",
          "statuses": {
            "boldsign": "unavailable",
            "oneflow": "available",
            "signrequest": "unavailable"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three is cheapest for light, occasional use?",
      "answer": "BoldSign's free Essential plan allows up to 25 envelopes a month, which is more generous than Oneflow's free tier (basic PDF signing only) or SignRequest's limited free tier."
    },
    {
      "question": "Is SignRequest still being actively developed?",
      "answer": "SignRequest remains available as a standalone product, but since Box's 2021 acquisition, Box has redirected new API integration work toward Box Sign, so buyers should treat Box Sign as the actively developed successor."
    },
    {
      "question": "Which tool is best for embedding e-signing into my own SaaS product?",
      "answer": "BoldSign, since it was purpose-built as an embeddable API and SDK with dedicated per-envelope Enterprise API pricing."
    },
    {
      "question": "Which tool is best if my team wants to negotiate and edit a contract together before signing rather than just sign a fixed PDF?",
      "answer": "Oneflow, whose core product treats the contract as a live, editable document that both parties can comment on and revise."
    },
    {
      "question": "Do any of these support HIPAA compliance for healthcare use?",
      "answer": "Only BoldSign explicitly documents HIPAA compliance, available on its Business and Premium tiers; HIPAA is not documented for Oneflow or SignRequest."
    },
    {
      "question": "Which has the strongest track record for European contract compliance?",
      "answer": "Oneflow, a Swedish, publicly traded company that supports advanced and qualified e-signature levels for EU eIDAS compliance and has a strong Nordic and broader European presence."
    }
  ]
};

export default boldsignVsOneflowVsSignrequestContent;
