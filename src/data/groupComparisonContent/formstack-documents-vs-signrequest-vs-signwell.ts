import type { GroupComparisonContent } from './types';

const formstackDocumentsVsSignrequestVsSignwellContent: GroupComparisonContent = {
  "verdict": "Formstack Documents solves a different half of the paperwork problem than SignRequest and SignWell: it generates finished documents from data rather than collecting signatures on them, and its own competitor list names DocuSign and PandaDoc, so it is a fair three-way comparison for buyers evaluating a full data-to-signed-document workflow. Between the two e-signature tools, SignWell offers a more transparent, self-serve free-to-paid path, while SignRequest carries the backing (and roadmap uncertainty) of being a Box subsidiary. The right combination depends on whether you need to auto-generate documents from data, simply collect signatures, or both.",
  "bestFor": {
    "formstack-documents": "Operations, legal or HR teams that need to auto-generate contracts, invoices or reports from CRM or form data at volume, typically pairing it with a separate e-signature tool for the signing step.",
    "signrequest": "Existing Box customers or teams that want a low-cost, simple e-signature tool backed by an established company, while accepting that new development is shifting toward Box Sign.",
    "signwell": "Budget-conscious freelancers and small teams that want a genuinely free e-signature tier plus a transparent, low-cost paid plan with unlimited free signers."
  },
  "highlights": [
    {
      "title": "Formstack Documents generates documents; it doesn't collect signatures itself",
      "description": "Formstack Documents merges data from forms, CRMs or databases into finished DOCX, PDF, PPTX or CSV files with conditional logic, a document-generation job that is distinct from SignRequest and SignWell's core e-signature workflow.",
      "toolSlugs": [
        "formstack-documents"
      ]
    },
    {
      "title": "SignWell undercuts SignRequest on plan transparency",
      "description": "SignWell publishes a Free plan, a $10/month Light plan and pay-as-you-go API pricing with no long-term contracts, while SignRequest's technology is increasingly being folded into Box Sign, which creates more roadmap uncertainty.",
      "toolSlugs": [
        "signwell",
        "signrequest"
      ]
    },
    {
      "title": "SignRequest's future runs through Box Sign",
      "description": "Since Box acquired SignRequest in 2021, Box has said it is no longer building new API integrations under the SignRequest name and points developers to the Box Sign API instead.",
      "toolSlugs": [
        "signrequest"
      ]
    },
    {
      "title": "Both e-signature tools offer real free plans; Formstack Documents starts at $110/month",
      "description": "SignRequest and SignWell both let individuals sign documents for free, while Formstack Documents has no ongoing free tier, only a free trial, and its entry Starter plan is priced at $110 per month.",
      "toolSlugs": [
        "signrequest",
        "signwell",
        "formstack-documents"
      ]
    },
    {
      "title": "Formstack Documents is the only one with true conditional document logic pulling from CRMs",
      "description": "Formstack Documents can show, hide or change document sections dynamically based on incoming CRM or database data, a document-assembly capability neither SignRequest nor SignWell is documented as offering.",
      "toolSlugs": [
        "formstack-documents"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Function",
      "rows": [
        {
          "feature": "Document generation and merge from external data sources (forms, CRM, database)",
          "statuses": {
            "formstack-documents": "available",
            "signrequest": "unavailable",
            "signwell": "unavailable"
          }
        },
        {
          "feature": "Legally binding e-signature collection",
          "statuses": {
            "formstack-documents": "not-documented",
            "signrequest": "available",
            "signwell": "available"
          }
        }
      ]
    },
    {
      "group": "Templates and Workflow",
      "rows": [
        {
          "feature": "Reusable, prebuilt document templates",
          "statuses": {
            "formstack-documents": "available",
            "signrequest": "available",
            "signwell": "available"
          }
        },
        {
          "feature": "Bulk sending to many recipients at once",
          "statuses": {
            "formstack-documents": "not-documented",
            "signrequest": "available",
            "signwell": "available"
          }
        }
      ]
    },
    {
      "group": "Compliance and Developer Access",
      "rows": [
        {
          "feature": "Developer API for programmatic document creation or sending",
          "statuses": {
            "formstack-documents": "available",
            "signrequest": "not-documented",
            "signwell": "available"
          },
          "note": "SignWell's API is billed pay-as-you-go at $0.85 per document after 25 free documents per month; Formstack Documents' API is included within its subscription tiers."
        },
        {
          "feature": "HIPAA-compliant plan option",
          "statuses": {
            "formstack-documents": "available",
            "signrequest": "not-documented",
            "signwell": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Pricing",
      "rows": [
        {
          "feature": "Ongoing free plan, not just a time-limited trial",
          "statuses": {
            "formstack-documents": "unavailable",
            "signrequest": "available",
            "signwell": "available"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Can Formstack Documents send documents out for signature on its own?",
      "answer": "Based on the available data, Formstack Documents generates and routes documents for approval or cloud storage, but native e-signature collection isn't documented as part of its feature set the way it is for SignRequest and SignWell."
    },
    {
      "question": "Which e-signature tool has a genuinely free plan?",
      "answer": "Both SignRequest and SignWell offer free plans. SignWell's Free plan is capped at one sender, one template and three documents per month, while SignRequest's Free plan limits documents per month for a single user."
    },
    {
      "question": "Is SignRequest still being actively developed?",
      "answer": "Box, which acquired SignRequest in 2021, has said it is no longer building new API integrations under the SignRequest name and is steering new development toward Box Sign instead."
    },
    {
      "question": "Do any of these charge per document through an API?",
      "answer": "SignWell has pay-as-you-go API pricing at $0.85 per document after 25 free documents per month. Formstack Documents' API access is included in its subscription tiers rather than billed per call. Detailed API terms are not documented for SignRequest in the available data."
    },
    {
      "question": "Which one supports HIPAA-compliant document handling?",
      "answer": "Formstack Documents offers a custom-priced Enterprise tier with HIPAA-compliant document handling. HIPAA support is not documented for SignRequest or SignWell."
    },
    {
      "question": "Why would someone compare a document-generation tool against two e-signature tools?",
      "answer": "Formstack Documents itself lists e-signature platforms among its competitors because generating a document and getting it signed are two halves of the same contract workflow; many buyers evaluate a document-automation tool like Formstack Documents alongside a dedicated e-signature tool like SignRequest or SignWell to cover both steps."
    }
  ]
};

export default formstackDocumentsVsSignrequestVsSignwellContent;
