import type { GroupComparisonContent } from './types';

const formstackVsPaperformVsZohoFormsContent: GroupComparisonContent = {
  "verdict": "Formstack, Paperform, and Zoho Forms all cover core no-code form building, but they diverge on compliance depth, editor style, and budget. Formstack leads on bundled compliance and document/e-signature workflows, Paperform leads on flexible, document-style form design with payments built in, and Zoho Forms stands out for its free-forever plan and offline mobile data collection. Choosing between them comes down to whether compliance, editor flexibility, or field-data collection at low cost matters most.",
  "bestFor": {
    "formstack": "Enterprises needing HIPAA- and PCI-compliant forms bundled with document generation and e-signature workflows.",
    "paperform": "Creators and small businesses wanting a flexible, document-style form editor that doubles as a landing page with built-in payments and quote calculations.",
    "zoho-forms": "Budget-conscious teams, especially those already using other Zoho apps, that want a free-forever plan plus offline mobile data collection and approval workflows."
  },
  "highlights": [
    {
      "title": "Compliance depth is uneven across the three",
      "description": "Formstack bakes HIPAA and PCI compliance into its core plans, while Zoho Forms only offers HIPAA compliance on its top-tier Premium plan at $90/month, and Paperform does not document HIPAA support at all.",
      "toolSlugs": [
        "formstack",
        "zoho-forms",
        "paperform"
      ]
    },
    {
      "title": "Zoho Forms uniquely supports offline field data collection",
      "description": "Zoho Forms includes offline mobile data collection with geolocation and QR code scanning, a field-work capability neither Formstack nor Paperform documents.",
      "toolSlugs": [
        "zoho-forms"
      ]
    },
    {
      "title": "Paperform's document-style editor stands apart",
      "description": "Paperform lets forms flow like a document with inline media and payment blocks, plus a calculation engine for quotes and pricing, a design approach neither Formstack nor Zoho Forms takes.",
      "toolSlugs": [
        "paperform"
      ]
    },
    {
      "title": "Free-plan accessibility favors Paperform and Zoho Forms",
      "description": "Both Paperform and Zoho Forms offer permanent free tiers to get started, while Formstack has no free plan, only a 14-day trial of its core Forms product.",
      "toolSlugs": [
        "paperform",
        "zoho-forms",
        "formstack"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Building",
      "rows": [
        {
          "feature": "Document-style, word-processor editor",
          "statuses": {
            "formstack": "unavailable",
            "paperform": "available",
            "zoho-forms": "unavailable"
          }
        },
        {
          "feature": "Built-in calculation or quote engine",
          "statuses": {
            "formstack": "not-documented",
            "paperform": "available",
            "zoho-forms": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Compliance and Enterprise",
      "rows": [
        {
          "feature": "HIPAA-compliant configuration",
          "statuses": {
            "formstack": "available",
            "paperform": "unavailable",
            "zoho-forms": "limited"
          },
          "note": "Zoho Forms restricts HIPAA compliance to its $90/month Premium plan."
        },
        {
          "feature": "PCI-compliant configuration",
          "statuses": {
            "formstack": "available",
            "paperform": "unavailable",
            "zoho-forms": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Automation and Mobile",
      "rows": [
        {
          "feature": "Workflow and approval automation",
          "statuses": {
            "formstack": "available",
            "paperform": "unavailable",
            "zoho-forms": "available"
          },
          "note": "Zoho Forms gates approval workflows behind its Standard tier and above."
        },
        {
          "feature": "Offline mobile data collection",
          "statuses": {
            "formstack": "unavailable",
            "paperform": "unavailable",
            "zoho-forms": "available"
          }
        }
      ]
    },
    {
      "group": "Payments and Access",
      "rows": [
        {
          "feature": "Built-in payment collection",
          "statuses": {
            "formstack": "available",
            "paperform": "available",
            "zoho-forms": "available"
          }
        },
        {
          "feature": "Permanent free plan",
          "statuses": {
            "formstack": "unavailable",
            "paperform": "available",
            "zoho-forms": "available"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which tool offers offline data collection for field work?",
      "answer": "Zoho Forms, with offline mobile data collection that supports geolocation and QR code scanning. Neither Formstack nor Paperform documents an offline collection mode."
    },
    {
      "question": "Which is the most compliance-ready for healthcare use?",
      "answer": "Formstack bakes HIPAA and PCI compliance into its core plans. Zoho Forms only offers HIPAA compliance on its top-tier Premium plan at $90/month, and Paperform does not document HIPAA support."
    },
    {
      "question": "Which is cheapest to start with?",
      "answer": "Paperform and Zoho Forms both offer permanent free plans. Formstack has no free plan, only a 14-day free trial of its core Forms product."
    },
    {
      "question": "Which tool is best for building a form that looks and feels like a webpage or order form?",
      "answer": "Paperform, thanks to its document-style editor that blends form fields with rich content, images, and payment blocks."
    },
    {
      "question": "Do any of these integrate with a broader software suite?",
      "answer": "Zoho Forms integrates naturally with the wider Zoho apps ecosystem, and Formstack offers deep native integration with Salesforce. Paperform's integrations, via Zapier and direct connections like Google Sheets and Slack, are comparatively narrower."
    }
  ]
};

export default formstackVsPaperformVsZohoFormsContent;
