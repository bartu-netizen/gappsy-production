import type { GroupComparisonContent } from './types';

const cognitoFormsVsMicrosoftFormsVsZohoFormsContent: GroupComparisonContent = {
  "verdict": "Microsoft Forms is the natural choice for organizations already paying for Microsoft 365, given its native Excel, Teams, and SharePoint integration and automatic quiz grading, but it lacks payment collection entirely. Cognito Forms and Zoho Forms both go further as standalone form builders with conditional logic, payment collection, and workflow automation, with Zoho Forms differentiating through a wider integration ecosystem and offline mobile data collection.",
  "bestFor": {
    "cognito-forms": "Small businesses needing a standalone free form builder with conditional logic, calculations, and payment collection.",
    "microsoft-forms": "Organizations already on Microsoft 365 that want forms and quizzes tightly integrated with Excel, Teams, and SharePoint.",
    "zoho-forms": "Teams wanting workflow automation, offline mobile data collection, and a wide integration ecosystem."
  },
  "highlights": [
    {
      "title": "Bundled free with Microsoft 365",
      "description": "Microsoft Forms comes at no extra cost with any Microsoft 365 or Office 365 subscription and includes automatic quiz grading, making it a strong default for schools and organizations already inside the Microsoft ecosystem.",
      "toolSlugs": [
        "microsoft-forms"
      ]
    },
    {
      "title": "No payment collection on Microsoft Forms",
      "description": "Unlike Cognito Forms and Zoho Forms, Microsoft Forms does not support collecting payments directly through a form, which rules it out for registration or order forms that need to charge respondents.",
      "toolSlugs": [
        "microsoft-forms",
        "cognito-forms",
        "zoho-forms"
      ]
    },
    {
      "title": "Zoho Forms leads on integration breadth",
      "description": "Zoho Forms supports offline mobile data collection with geolocation and QR scanning plus more than 150 integrations, ahead of both Cognito Forms and Microsoft Forms on ecosystem reach outside their respective home platforms.",
      "toolSlugs": [
        "zoho-forms"
      ]
    },
    {
      "title": "Cognito Forms keeps logic and payments in one free tier",
      "description": "Cognito Forms combines conditional logic, cost calculations, and payment acceptance in a plan that is free forever, without requiring a Microsoft 365 subscription or a Zoho ecosystem buy-in.",
      "toolSlugs": [
        "cognito-forms"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Building",
      "rows": [
        {
          "feature": "Conditional logic or branching",
          "statuses": {
            "cognito-forms": "available",
            "microsoft-forms": "available",
            "zoho-forms": "not-documented"
          }
        },
        {
          "feature": "Payment collection",
          "statuses": {
            "cognito-forms": "available",
            "microsoft-forms": "unavailable",
            "zoho-forms": "available"
          }
        },
        {
          "feature": "Automatic quiz grading",
          "statuses": {
            "cognito-forms": "not-documented",
            "microsoft-forms": "available",
            "zoho-forms": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Compliance and Data",
      "rows": [
        {
          "feature": "HIPAA-compliant configuration",
          "statuses": {
            "cognito-forms": "available",
            "microsoft-forms": "not-documented",
            "zoho-forms": "available"
          }
        },
        {
          "feature": "Offline mobile data collection",
          "statuses": {
            "cognito-forms": "not-documented",
            "microsoft-forms": "not-documented",
            "zoho-forms": "available"
          }
        }
      ]
    },
    {
      "group": "Integrations and Access",
      "rows": [
        {
          "feature": "Permanent free plan",
          "statuses": {
            "cognito-forms": "available",
            "microsoft-forms": "available",
            "zoho-forms": "available"
          },
          "note": "Microsoft Forms' Free Personal tier caps at 200 responses per form."
        },
        {
          "feature": "Native productivity-suite integration",
          "statuses": {
            "cognito-forms": "unavailable",
            "microsoft-forms": "available",
            "zoho-forms": "available"
          },
          "note": "Microsoft Forms ties into Excel, Teams, and SharePoint; Zoho Forms ties into the broader Zoho app suite."
        },
        {
          "feature": "Third-party integration breadth",
          "statuses": {
            "cognito-forms": "limited",
            "microsoft-forms": "limited",
            "zoho-forms": "available"
          },
          "note": "Zoho Forms advertises 150+ integrations, well beyond Cognito Forms' Zapier/webhook approach or Microsoft Forms' Power Automate focus."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Microsoft Forms free to use?",
      "answer": "Yes, it is included at no extra cost with any Microsoft 365 or Office 365 subscription, and it also has a limited free personal plan capped at 200 responses per form."
    },
    {
      "question": "Which of these three supports automatic quiz grading?",
      "answer": "Microsoft Forms, which is a common reason schools already on Microsoft 365 choose it for quizzes and assessments."
    },
    {
      "question": "Which has the widest integration ecosystem?",
      "answer": "Zoho Forms, with more than 150 integrations, ahead of Cognito Forms' Zapier and webhook integrations and Microsoft Forms' Power Automate and SharePoint focus."
    },
    {
      "question": "Can I collect payments through Microsoft Forms?",
      "answer": "No, Microsoft Forms does not support payment collection, unlike Cognito Forms and Zoho Forms, which both accept payments directly through forms."
    },
    {
      "question": "Which is best for collecting data offline in the field?",
      "answer": "Zoho Forms, with offline mobile data collection including geolocation and QR code scanning."
    },
    {
      "question": "Is HIPAA compliance available on any of these?",
      "answer": "Yes, on Cognito Forms Enterprise and Zoho Forms Premium. HIPAA compliance is not documented for Microsoft Forms."
    }
  ]
};

export default cognitoFormsVsMicrosoftFormsVsZohoFormsContent;
