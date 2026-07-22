import type { GroupComparisonContent } from './types';

const cognitoFormsVsFormstackVsHeyformContent: GroupComparisonContent = {
  "verdict": "Cognito Forms is the strongest fit for small businesses and nonprofits that want a genuinely free, no-code form builder with conditional logic and payment collection. Formstack is built for larger, compliance-heavy organizations that need forms bundled with document generation, e-signatures, and Salesforce-native workflows. HeyForm stands apart as the only open-source, self-hostable option, appealing to cost-conscious teams and developers who want full data ownership over a conversational form format.",
  "bestFor": {
    "cognito-forms": "Small businesses and nonprofits that need a genuinely free, no-code form builder with conditional logic and built-in payment collection.",
    "formstack": "Mid-market and enterprise teams that need forms bundled with document generation, e-signatures, and HIPAA/PCI compliance.",
    "heyform": "Budget-conscious teams, indie makers, and developers who want a self-hostable, open-source conversational form builder."
  },
  "highlights": [
    {
      "title": "Only genuinely open-source option",
      "description": "HeyForm is the only one of the three built as an open-source project that teams can self-host via Docker for full control over their form data, an option Cognito Forms and Formstack do not offer.",
      "toolSlugs": [
        "heyform"
      ]
    },
    {
      "title": "Free plan that actually works",
      "description": "Cognito Forms and HeyForm both offer a permanent free tier with unlimited forms; Formstack has no free plan at all, only a 14-day trial of its core Forms product.",
      "toolSlugs": [
        "cognito-forms",
        "heyform",
        "formstack"
      ]
    },
    {
      "title": "Documents and e-signatures bundled in",
      "description": "Formstack extends beyond form building into document generation via Formstack Documents and e-signature collection via Formstack Sign, plus a dedicated Salesforce Solutions package, none of which Cognito Forms or HeyForm offer.",
      "toolSlugs": [
        "formstack"
      ]
    },
    {
      "title": "Compliance for regulated data",
      "description": "Both Cognito Forms (on its Enterprise plan) and Formstack support HIPAA-compliant configurations for healthcare and sensitive-data use cases; HeyForm does not document HIPAA support.",
      "toolSlugs": [
        "cognito-forms",
        "formstack"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Form Building",
      "rows": [
        {
          "feature": "Conditional logic",
          "statuses": {
            "cognito-forms": "available",
            "formstack": "available",
            "heyform": "available"
          }
        },
        {
          "feature": "Permanent free plan",
          "statuses": {
            "cognito-forms": "available",
            "formstack": "unavailable",
            "heyform": "available"
          },
          "note": "Formstack offers only a 14-day free trial of its Forms product."
        },
        {
          "feature": "Payment collection",
          "statuses": {
            "cognito-forms": "available",
            "formstack": "available",
            "heyform": "available"
          }
        }
      ]
    },
    {
      "group": "Compliance and Document Workflow",
      "rows": [
        {
          "feature": "HIPAA-compliant configuration",
          "statuses": {
            "cognito-forms": "available",
            "formstack": "available",
            "heyform": "not-documented"
          },
          "note": "Available on Cognito Forms Enterprise and across Formstack's compliance-focused plans."
        },
        {
          "feature": "Electronic signatures",
          "statuses": {
            "cognito-forms": "limited",
            "formstack": "available",
            "heyform": "unavailable"
          },
          "note": "Cognito Forms includes e-signatures from its Pro tier up; Formstack bundles unlimited e-signatures via Formstack Sign on its Suite plan."
        },
        {
          "feature": "Document generation (merge data into contracts or invoices)",
          "statuses": {
            "cognito-forms": "unavailable",
            "formstack": "available",
            "heyform": "unavailable"
          }
        }
      ]
    },
    {
      "group": "Deployment and Integrations",
      "rows": [
        {
          "feature": "Self-hosting option",
          "statuses": {
            "cognito-forms": "unavailable",
            "formstack": "unavailable",
            "heyform": "available"
          }
        },
        {
          "feature": "Salesforce-native integration",
          "statuses": {
            "cognito-forms": "unavailable",
            "formstack": "available",
            "heyform": "unavailable"
          }
        },
        {
          "feature": "Zapier or webhook integrations",
          "statuses": {
            "cognito-forms": "available",
            "formstack": "available",
            "heyform": "not-documented"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three has a genuinely free plan?",
      "answer": "Cognito Forms and HeyForm both offer a permanent free tier with unlimited forms. Formstack has no free plan, only a 14-day free trial of its core Forms product."
    },
    {
      "question": "Which is best for HIPAA-compliant healthcare forms?",
      "answer": "Cognito Forms (on its Enterprise plan) and Formstack both offer HIPAA-compliant configurations. HeyForm does not document HIPAA compliance support."
    },
    {
      "question": "Can I self-host any of these tools?",
      "answer": "Only HeyForm is open source and self-hostable via Docker. Cognito Forms and Formstack are closed, hosted SaaS products."
    },
    {
      "question": "Which tool bundles document generation and e-signatures with forms?",
      "answer": "Formstack, through its Formstack Documents and Formstack Sign products, which merge form data into contracts and invoices and collect legally binding signatures."
    },
    {
      "question": "Which is the cheapest option for a solo user just starting out?",
      "answer": "HeyForm's free tier or Cognito Forms' free Individual plan are the lowest-cost entry points; Formstack starts at $83/month billed annually with no free tier."
    },
    {
      "question": "Does any of the three integrate natively with Salesforce?",
      "answer": "Formstack does, through a dedicated Salesforce Solutions package with progressive data capture and Salesforce Shield compatibility. Cognito Forms and HeyForm do not offer native Salesforce integration."
    }
  ]
};

export default cognitoFormsVsFormstackVsHeyformContent;
