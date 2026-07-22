import type { GroupComparisonContent } from './types';

const cognitoFormsVsHeyformVsZohoFormsContent: GroupComparisonContent = {
  "verdict": "Cognito Forms and Zoho Forms both pair a permanent free tier with workflow automation and payment collection, making either a solid standalone choice, while HeyForm differentiates itself as the only genuinely open-source and self-hostable option among the three. Zoho Forms pulls ahead on integration breadth and offline mobile data collection, which matters for field teams, while Cognito Forms keeps its free tier simpler and less tied to a wider software suite.",
  "bestFor": {
    "cognito-forms": "Small businesses wanting an unlimited free plan with conditional logic and built-in payment acceptance.",
    "heyform": "Developers and cost-conscious teams wanting an open-source, self-hostable conversational form builder.",
    "zoho-forms": "Organizations already using Zoho apps, or needing offline mobile data collection and a wide integration ecosystem."
  },
  "highlights": [
    {
      "title": "150+ integrations and offline collection",
      "description": "Zoho Forms supports offline mobile data collection with geolocation and QR code scanning plus more than 150 third-party integrations, including Salesforce and Google Sheets, giving it the widest reach of the three for field and cross-app workflows.",
      "toolSlugs": [
        "zoho-forms"
      ]
    },
    {
      "title": "Self-hosting sets HeyForm apart",
      "description": "HeyForm is the only one of the three that is open source and can be deployed on a team's own infrastructure via Docker, avoiding platform fees beyond hosting costs.",
      "toolSlugs": [
        "heyform"
      ]
    },
    {
      "title": "HIPAA compliance at the top tier",
      "description": "Both Cognito Forms (Enterprise) and Zoho Forms (Premium) offer HIPAA-compliant configurations for regulated data, though Zoho Forms reaches it at a lower price point ($90/month versus $129.60-$174/month for Cognito Forms Enterprise).",
      "toolSlugs": [
        "cognito-forms",
        "zoho-forms"
      ]
    },
    {
      "title": "Free plans with different tradeoffs",
      "description": "All three ship a permanent free plan, but Cognito Forms' free tier includes unlimited forms and payment acceptance out of the box, while HeyForm and Zoho Forms cap free-tier usage more tightly.",
      "toolSlugs": [
        "cognito-forms",
        "heyform",
        "zoho-forms"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Building and Automation",
      "rows": [
        {
          "feature": "Conditional logic",
          "statuses": {
            "cognito-forms": "available",
            "heyform": "available",
            "zoho-forms": "not-documented"
          }
        },
        {
          "feature": "Workflow automation and approvals",
          "statuses": {
            "cognito-forms": "available",
            "heyform": "unavailable",
            "zoho-forms": "available"
          },
          "note": "Cognito Forms includes this from its Team plan up; Zoho Forms requires at least its Standard plan."
        },
        {
          "feature": "Offline mobile data collection",
          "statuses": {
            "cognito-forms": "not-documented",
            "heyform": "not-documented",
            "zoho-forms": "available"
          }
        }
      ]
    },
    {
      "group": "Payments and Compliance",
      "rows": [
        {
          "feature": "Payment collection",
          "statuses": {
            "cognito-forms": "available",
            "heyform": "available",
            "zoho-forms": "available"
          }
        },
        {
          "feature": "HIPAA-compliant configuration",
          "statuses": {
            "cognito-forms": "available",
            "heyform": "not-documented",
            "zoho-forms": "available"
          },
          "note": "Cognito Forms Enterprise and Zoho Forms Premium both support HIPAA-compliant configurations."
        }
      ]
    },
    {
      "group": "Access and Integrations",
      "rows": [
        {
          "feature": "Permanent free plan",
          "statuses": {
            "cognito-forms": "available",
            "heyform": "available",
            "zoho-forms": "available"
          }
        },
        {
          "feature": "Self-hosting option",
          "statuses": {
            "cognito-forms": "unavailable",
            "heyform": "available",
            "zoho-forms": "unavailable"
          }
        },
        {
          "feature": "Third-party integration breadth",
          "statuses": {
            "cognito-forms": "limited",
            "heyform": "limited",
            "zoho-forms": "available"
          },
          "note": "Zoho Forms advertises 150+ integrations; Cognito Forms relies on Zapier, Power Automate, and webhooks; HeyForm's cons note fewer native integrations."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which offers the most third-party integrations?",
      "answer": "Zoho Forms, with more than 150 integrations including Salesforce and Google Sheets."
    },
    {
      "question": "Can any of these three be self-hosted?",
      "answer": "Only HeyForm. It is open source and can be deployed via Docker on a team's own infrastructure."
    },
    {
      "question": "Which is the cheaper route to HIPAA-compliant forms?",
      "answer": "Zoho Forms Premium at $90/month is cheaper than Cognito Forms Enterprise at $129.60-$174/month, though both support HIPAA-compliant configurations."
    },
    {
      "question": "Do all three have a free plan?",
      "answer": "Yes, all three offer a permanent free tier, though entry and response caps differ: Cognito Forms allows 100 entries/month, HeyForm allows 250 responses/month, and Zoho Forms limits monthly submissions on its Free plan."
    },
    {
      "question": "Which is best for field teams collecting data offline?",
      "answer": "Zoho Forms, which supports offline mobile data collection with geolocation and QR code scanning."
    },
    {
      "question": "Which is easiest for a developer to customize deeply?",
      "answer": "HeyForm, since it is open source and self-hostable, giving developers full access to the underlying code."
    }
  ]
};

export default cognitoFormsVsHeyformVsZohoFormsContent;
