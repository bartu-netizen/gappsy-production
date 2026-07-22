import type { GroupComparisonContent } from './types';

const formstackVsMicrosoftFormsVsPaperformContent: GroupComparisonContent = {
  "verdict": "These three form builders serve very different buyers: Formstack is the compliance- and workflow-heavy choice for regulated organizations, Microsoft Forms is the free, no-extra-cost option baked into any Microsoft 365 subscription, and Paperform is the flexible, document-style builder for businesses that want forms which double as landing or order pages. There is no single winner, since the right tool depends heavily on whether compliance, ecosystem fit, or editor flexibility matters most.",
  "bestFor": {
    "formstack": "Regulated enterprises, such as healthcare, finance, or government, that need HIPAA- and PCI-compliant forms bundled with document generation and e-signature workflows.",
    "microsoft-forms": "Organizations already on Microsoft 365 that want free surveys and quizzes tightly integrated with Excel, Teams, SharePoint, and Power Automate.",
    "paperform": "Small businesses and creators who want a flexible, document-style form builder that can double as a landing page, product page, or payment-enabled order form."
  },
  "highlights": [
    {
      "title": "Compliance and workflow depth favors Formstack",
      "description": "Formstack offers HIPAA- and PCI-compliant form configurations plus bundled document generation and e-signatures through Formstack Documents and Formstack Sign, features neither Microsoft Forms nor Paperform document.",
      "toolSlugs": [
        "formstack"
      ]
    },
    {
      "title": "Microsoft Forms costs nothing extra inside Microsoft 365",
      "description": "Microsoft Forms is included with any Microsoft 365 or Office 365 subscription and integrates natively with Excel, Teams assignments, SharePoint, and Power Automate, though its free personal plan caps at 200 responses per form.",
      "toolSlugs": [
        "microsoft-forms"
      ]
    },
    {
      "title": "Paperform's editor behaves like a document, not a grid",
      "description": "Paperform lets users build forms as flowing documents with inline images, video, and payment blocks, and includes a calculation engine for quotes and pricing, a design paradigm neither Formstack nor Microsoft Forms offers.",
      "toolSlugs": [
        "paperform"
      ]
    },
    {
      "title": "Free access differs sharply across the three",
      "description": "Microsoft Forms and Paperform both offer free ways to get started (free with a Microsoft account, or a 30-submission/month free plan), while Formstack has no permanent free plan, only a 14-day trial of its Forms product.",
      "toolSlugs": [
        "microsoft-forms",
        "paperform",
        "formstack"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Form Building",
      "rows": [
        {
          "feature": "Conditional branching logic",
          "statuses": {
            "formstack": "available",
            "microsoft-forms": "available",
            "paperform": "available"
          }
        },
        {
          "feature": "Document-style, word-processor editor",
          "statuses": {
            "formstack": "unavailable",
            "microsoft-forms": "unavailable",
            "paperform": "available"
          }
        }
      ]
    },
    {
      "group": "Specialized Capabilities",
      "rows": [
        {
          "feature": "Automatic quiz grading",
          "statuses": {
            "formstack": "not-documented",
            "microsoft-forms": "available",
            "paperform": "not-documented"
          }
        },
        {
          "feature": "Built-in payment collection",
          "statuses": {
            "formstack": "available",
            "microsoft-forms": "unavailable",
            "paperform": "available"
          },
          "note": "Formstack supports Stripe and PayPal; Paperform supports five payment gateways on all paid plans."
        }
      ]
    },
    {
      "group": "Compliance and Enterprise",
      "rows": [
        {
          "feature": "HIPAA- and PCI-compliant configurations",
          "statuses": {
            "formstack": "available",
            "microsoft-forms": "unavailable",
            "paperform": "unavailable"
          }
        },
        {
          "feature": "Native Salesforce integration",
          "statuses": {
            "formstack": "available",
            "microsoft-forms": "unavailable",
            "paperform": "unavailable"
          }
        }
      ]
    },
    {
      "group": "Access and Ecosystem",
      "rows": [
        {
          "feature": "Permanent free plan",
          "statuses": {
            "formstack": "unavailable",
            "microsoft-forms": "available",
            "paperform": "available"
          }
        },
        {
          "feature": "Native Microsoft 365 ecosystem integration",
          "statuses": {
            "formstack": "unavailable",
            "microsoft-forms": "available",
            "paperform": "unavailable"
          },
          "note": "Microsoft Forms ties directly into Excel, Teams, SharePoint, and Power Automate at no extra cost."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three form builders is completely free?",
      "answer": "Microsoft Forms is free with any Microsoft account (with higher response caps for Microsoft 365 subscribers), and Paperform offers a free plan limited to 30 submissions per month. Formstack has no permanent free plan, only a 14-day free trial of its Forms product."
    },
    {
      "question": "Which is best for HIPAA-compliant data collection?",
      "answer": "Formstack, since it explicitly offers HIPAA- and PCI-compliant form configurations. Neither Microsoft Forms nor Paperform documents HIPAA compliance."
    },
    {
      "question": "Can Microsoft Forms handle document generation and e-signatures like Formstack?",
      "answer": "No. Microsoft Forms can trigger downstream workflows through Power Automate, but it does not include native document generation or e-signature tools, both of which Formstack bundles in via Formstack Documents and Formstack Sign."
    },
    {
      "question": "Which tool is best if I want the form to double as a landing or order page?",
      "answer": "Paperform, thanks to its document-style editor that lets you mix form fields with images, video, and payment blocks in a single flowing page."
    },
    {
      "question": "Do any of these integrate with Salesforce?",
      "answer": "Formstack has native, purpose-built Salesforce integration, including progressive data capture and dynamic prefill. Microsoft Forms and Paperform do not document Salesforce integration."
    }
  ]
};

export default formstackVsMicrosoftFormsVsPaperformContent;
