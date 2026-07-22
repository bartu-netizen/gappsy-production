import type { GroupComparisonContent } from './types';

const dochubVsJotformSignVsOneflowContent: GroupComparisonContent = {
  "verdict": "DocHub, Jotform Sign, and Oneflow all let teams start signing documents for free, but they represent three different depths of investment. DocHub is a browser PDF editor with light signing, Jotform Sign is a free signing layer bundled into Jotform's broader forms and workflow platform, and Oneflow is a full contract lifecycle management platform built around live, structured contracts and CRM integration. The right choice depends on whether the priority is a PDF editor, a free forms ecosystem, or genuine contract lifecycle management.",
  "bestFor": {
    "dochub": "Users who want free, no-install PDF editing and light e-signing tied to Gmail and Google Drive",
    "jotform-sign": "Teams already using Jotform forms and tables who want free signing with a large template library and multi-step approvals",
    "oneflow": "Sales, legal, and HR teams who want contracts to be live, structured, negotiable documents with CRM integration rather than static signed PDFs"
  },
  "highlights": [
    {
      "title": "Jotform Sign bundles signing into a broader platform",
      "description": "Jotform Sign includes over 1,000 signable templates and multi-step approval routing, and is free to use within a Jotform account rather than sold as a separate subscription.",
      "toolSlugs": [
        "jotform-sign"
      ]
    },
    {
      "title": "Oneflow makes contracts live and data-driven",
      "description": "Oneflow lets both parties edit and comment on contract content in a shared digital document, with every field captured as structured data feeding CRM systems like Salesforce and HubSpot.",
      "toolSlugs": [
        "oneflow"
      ]
    },
    {
      "title": "DocHub is Google Workspace-native",
      "description": "DocHub integrates directly with Gmail, Google Drive, Google Classroom, and Dropbox, letting users edit and sign PDF attachments in place.",
      "toolSlugs": [
        "dochub"
      ]
    },
    {
      "title": "Pricing models diverge sharply",
      "description": "DocHub and Oneflow use per-seat freemium pricing (DocHub from about $8/user/month, Oneflow from about EUR 17/user/month), while Jotform Sign has no standalone price and scales with a user's existing Jotform plan.",
      "toolSlugs": [
        "dochub",
        "jotform-sign",
        "oneflow"
      ]
    },
    {
      "title": "Business-tool integration depth varies",
      "description": "Oneflow integrates natively with CRMs like Salesforce and HubSpot, and Jotform Sign feeds data into Jotform Tables and Report Builder, while DocHub's integrations focus on Google Workspace and Dropbox rather than CRM or reporting tools.",
      "toolSlugs": [
        "oneflow",
        "jotform-sign"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Signing and Templates",
      "rows": [
        {
          "feature": "Free plan available",
          "statuses": {
            "dochub": "available",
            "jotform-sign": "available",
            "oneflow": "available"
          }
        },
        {
          "feature": "Reusable templates",
          "statuses": {
            "dochub": "available",
            "jotform-sign": "available",
            "oneflow": "available"
          },
          "note": "Jotform Sign includes 1,000+ prebuilt templates"
        },
        {
          "feature": "Multi-step approval workflow",
          "statuses": {
            "dochub": "not-documented",
            "jotform-sign": "available",
            "oneflow": "available"
          }
        }
      ]
    },
    {
      "group": "Document Depth",
      "rows": [
        {
          "feature": "Full PDF editing",
          "statuses": {
            "dochub": "available",
            "jotform-sign": "limited",
            "oneflow": "unavailable"
          },
          "note": "Jotform Sign converts PDFs into signable forms but is not a general PDF editor"
        },
        {
          "feature": "Live, collaborative contract editing",
          "statuses": {
            "dochub": "unavailable",
            "jotform-sign": "unavailable",
            "oneflow": "available"
          }
        }
      ]
    },
    {
      "group": "Integrations and Compliance",
      "rows": [
        {
          "feature": "Native CRM/business-data integration",
          "statuses": {
            "dochub": "not-documented",
            "jotform-sign": "limited",
            "oneflow": "available"
          },
          "note": "Jotform Sign feeds Jotform Tables and Report Builder rather than a dedicated CRM"
        },
        {
          "feature": "HIPAA compliance option",
          "statuses": {
            "dochub": "available",
            "jotform-sign": "available",
            "oneflow": "not-documented"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three tools is completely free to use?",
      "answer": "Jotform Sign is bundled free into a Jotform account with no separate pricing page. DocHub and Oneflow both offer genuine free tiers, but with usage limits (DocHub caps monthly e-signature requests and folders; Oneflow's free tier covers only basic PDF signing)."
    },
    {
      "question": "What is the difference between e-signature tools and Oneflow's CLM approach?",
      "answer": "DocHub and Jotform Sign focus on getting a document signed, while Oneflow is a contract lifecycle management platform that treats contracts as structured, live data supporting negotiation, renewal tracking, and CRM sync alongside signing."
    },
    {
      "question": "Which is best for teams already using Jotform for forms?",
      "answer": "Jotform Sign, since it shares Jotform's account, data tables, and Report Builder, letting signature data flow directly into the same workspace as a team's existing forms."
    },
    {
      "question": "Can Oneflow integrate with my CRM?",
      "answer": "Yes, Oneflow offers native integrations with Salesforce, HubSpot, and Microsoft Dynamics, which is a core part of its data-driven contract model."
    },
    {
      "question": "Which tool has the deepest general PDF editing capability?",
      "answer": "DocHub, which functions as a full in-browser PDF editor with annotation, fillable form fields, and document certification, beyond just collecting signatures."
    },
    {
      "question": "Do any of these offer HIPAA-compliant signing?",
      "answer": "DocHub (on its custom-priced Site License tier) and Jotform Sign (on its Gold or Enterprise plan) both document HIPAA compliance support. Oneflow's provided data does not document HIPAA support."
    }
  ]
};

export default dochubVsJotformSignVsOneflowContent;
