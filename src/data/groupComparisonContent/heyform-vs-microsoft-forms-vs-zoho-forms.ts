import type { GroupComparisonContent } from './types';

const heyformVsMicrosoftFormsVsZohoFormsContent: GroupComparisonContent = {
  "verdict": "Microsoft Forms is the default pick for teams already inside Microsoft 365 who want quick surveys and auto-graded quizzes tied to Excel and Teams, though it cannot collect payments. Zoho Forms is the stronger choice for organizations that need workflow automation, offline mobile data collection, and deep third-party integrations. HeyForm stands apart as the only open-source, self-hostable, and low-cost conversational form builder of the three.",
  "bestFor": {
    "heyform": "Budget-conscious teams and developers wanting an open-source, self-hostable conversational form builder.",
    "microsoft-forms": "Organizations on Microsoft 365 wanting forms and quizzes tied into Excel, Teams, and SharePoint.",
    "zoho-forms": "Teams needing workflow automation, offline mobile data collection, and a wide integration ecosystem."
  },
  "highlights": [
    {
      "title": "Open source and self-hostable",
      "description": "HeyForm is the only one of the three built as an open-source project, letting technical teams self-host via Docker for full data ownership instead of relying on a vendor's hosted infrastructure.",
      "toolSlugs": [
        "heyform"
      ]
    },
    {
      "title": "Native Microsoft 365 integration and quiz grading",
      "description": "Microsoft Forms is bundled free with Microsoft 365 and offers automatic quiz grading plus direct Excel, Teams, and SharePoint integration, features neither HeyForm nor Zoho Forms match.",
      "toolSlugs": [
        "microsoft-forms"
      ]
    },
    {
      "title": "Zoho Forms covers offline and integration breadth",
      "description": "Zoho Forms supports offline mobile data collection with geolocation and QR scanning plus more than 150 integrations, giving it the widest operational reach of the three.",
      "toolSlugs": [
        "zoho-forms"
      ]
    },
    {
      "title": "Payment collection splits the group",
      "description": "HeyForm and Zoho Forms both support collecting payments directly through forms, while Microsoft Forms does not support payment collection at all.",
      "toolSlugs": [
        "heyform",
        "zoho-forms",
        "microsoft-forms"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Building",
      "rows": [
        {
          "feature": "Conversational, one-question-at-a-time format",
          "statuses": {
            "heyform": "available",
            "microsoft-forms": "unavailable",
            "zoho-forms": "unavailable"
          }
        },
        {
          "feature": "Automatic quiz grading",
          "statuses": {
            "heyform": "not-documented",
            "microsoft-forms": "available",
            "zoho-forms": "not-documented"
          }
        },
        {
          "feature": "Payment collection",
          "statuses": {
            "heyform": "available",
            "microsoft-forms": "unavailable",
            "zoho-forms": "available"
          }
        }
      ]
    },
    {
      "group": "Deployment and Compliance",
      "rows": [
        {
          "feature": "Self-hosting option",
          "statuses": {
            "heyform": "available",
            "microsoft-forms": "unavailable",
            "zoho-forms": "unavailable"
          }
        },
        {
          "feature": "Offline mobile data collection",
          "statuses": {
            "heyform": "not-documented",
            "microsoft-forms": "not-documented",
            "zoho-forms": "available"
          }
        },
        {
          "feature": "HIPAA-compliant configuration",
          "statuses": {
            "heyform": "not-documented",
            "microsoft-forms": "not-documented",
            "zoho-forms": "available"
          },
          "note": "Available on Zoho Forms' Premium plan."
        }
      ]
    },
    {
      "group": "Access and Integrations",
      "rows": [
        {
          "feature": "Permanent free plan",
          "statuses": {
            "heyform": "available",
            "microsoft-forms": "available",
            "zoho-forms": "available"
          },
          "note": "Microsoft Forms' Free Personal tier caps at 200 responses per form."
        },
        {
          "feature": "Third-party integration breadth",
          "statuses": {
            "heyform": "limited",
            "microsoft-forms": "limited",
            "zoho-forms": "available"
          },
          "note": "Zoho Forms advertises 150+ integrations, well beyond HeyForm's smaller native integration set or Microsoft Forms' Microsoft-ecosystem focus."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three is open source?",
      "answer": "HeyForm is the only genuinely open-source, self-hostable option among the three."
    },
    {
      "question": "Which supports quiz grading for schools?",
      "answer": "Microsoft Forms, with automatic quiz grading built in, which is a common reason schools already on Microsoft 365 pick it."
    },
    {
      "question": "Can I accept payments through these forms?",
      "answer": "Yes, on HeyForm and Zoho Forms. Microsoft Forms does not support payment collection."
    },
    {
      "question": "Which has the widest integration ecosystem?",
      "answer": "Zoho Forms, with more than 150 integrations, including Salesforce and Google Sheets."
    },
    {
      "question": "Which is cheapest to start on a paid plan?",
      "answer": "HeyForm's Basic plan starts at $15/month, the lowest paid entry point among the three."
    },
    {
      "question": "Is HIPAA compliance available on any of these?",
      "answer": "Yes, on Zoho Forms' Premium plan. HIPAA compliance is not documented for HeyForm or Microsoft Forms."
    }
  ]
};

export default heyformVsMicrosoftFormsVsZohoFormsContent;
