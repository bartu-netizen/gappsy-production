import type { GroupComparisonContent } from './types';

const cognitoFormsVsFormstackVsPaperformContent: GroupComparisonContent = {
  "verdict": "Cognito Forms, Formstack, and Paperform all compete as no-code form builders, but they target different budgets and buyers. Cognito Forms stands out for a genuinely usable free plan that includes unlimited forms and payment collection, Formstack pushes upmarket into document generation, e-signatures, and native Salesforce workflows for compliance-heavy enterprises, and Paperform differentiates with a flexible document-style editor and calculation engine suited to quotes, orders, and landing-page-style forms. Which one wins depends on whether free access, enterprise depth, or design flexibility matters most to the buyer.",
  "bestFor": {
    "cognito-forms": "Budget-conscious teams and small organizations that want unlimited forms, payment collection, and HIPAA-compliant configuration without paying for a plan.",
    "formstack": "Enterprises already standardized on Salesforce that need document generation, electronic signatures, and HIPAA/PCI-compliant workflows and can justify premium pricing.",
    "paperform": "Creators and marketers who want forms that double as branded landing pages or quizzes and need a built-in calculation engine for pricing or quoting logic."
  },
  "highlights": [
    {
      "title": "Cognito Forms is the only one with a fully free unlimited plan",
      "description": "Cognito Forms offers an Individual plan with unlimited forms and payment acceptance at no cost, while Formstack has no permanent free tier (only a 14-day trial) and Paperform's free plan caps out at 30 submissions per month.",
      "toolSlugs": [
        "cognito-forms",
        "formstack",
        "paperform"
      ]
    },
    {
      "title": "Formstack is built for enterprise and Salesforce-native workflows",
      "description": "Formstack's document generation integration, electronic signatures, and native Salesforce integration make it the deepest option for compliance-heavy enterprise processes, reflected in its higher starting price of $83/month billed annually.",
      "toolSlugs": [
        "formstack"
      ]
    },
    {
      "title": "Paperform's calculation engine and document-style editor suit quoting and order forms",
      "description": "Paperform's built-in calculation engine and flexible, word-processor-style editor let forms double as landing pages or product pages, a capability not documented for Formstack or Cognito Forms.",
      "toolSlugs": [
        "paperform"
      ]
    },
    {
      "title": "Cognito Forms offers HIPAA-compliant configuration on a free-to-start product",
      "description": "Both Cognito Forms and Formstack support HIPAA-compliant configuration, but Cognito Forms makes it available starting from its free plan rather than requiring an enterprise contract.",
      "toolSlugs": [
        "cognito-forms",
        "formstack"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Pricing and Plans",
      "rows": [
        {
          "feature": "Free plan availability",
          "statuses": {
            "cognito-forms": "available",
            "formstack": "unavailable",
            "paperform": "available"
          },
          "note": "Formstack offers only a 14-day free trial; Paperform's free plan caps submissions at 30 per month."
        }
      ]
    },
    {
      "group": "Form Building and Logic",
      "rows": [
        {
          "feature": "Conditional logic",
          "statuses": {
            "cognito-forms": "available",
            "formstack": "not-documented",
            "paperform": "available"
          }
        },
        {
          "feature": "Calculation engine",
          "statuses": {
            "cognito-forms": "available",
            "formstack": "not-documented",
            "paperform": "available"
          }
        }
      ]
    },
    {
      "group": "Payments and Compliance",
      "rows": [
        {
          "feature": "Built-in payment collection",
          "statuses": {
            "cognito-forms": "available",
            "formstack": "available",
            "paperform": "available"
          }
        },
        {
          "feature": "HIPAA-compliant configuration",
          "statuses": {
            "cognito-forms": "available",
            "formstack": "available",
            "paperform": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Enterprise and Integrations",
      "rows": [
        {
          "feature": "Electronic signatures",
          "statuses": {
            "cognito-forms": "available",
            "formstack": "available",
            "paperform": "not-documented"
          }
        },
        {
          "feature": "Native Salesforce integration",
          "statuses": {
            "cognito-forms": "not-documented",
            "formstack": "available",
            "paperform": "not-documented"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of Cognito Forms, Formstack, and Paperform has a genuinely free plan?",
      "answer": "Cognito Forms and Paperform both offer free plans. Cognito Forms' free Individual plan supports unlimited forms and payment acceptance, while Paperform's free plan caps submissions at 30 per month. Formstack has no permanent free plan, only a 14-day trial of its core Forms product."
    },
    {
      "question": "Which is the most affordable paid plan?",
      "answer": "Cognito Forms Pro starts at $19.20 per month billed annually, Paperform Essentials starts at $24 per month billed annually, and Formstack's entry-level Forms plan starts at $83 per month billed annually, making Cognito Forms the cheapest paid tier of the three."
    },
    {
      "question": "Which tool integrates natively with Salesforce?",
      "answer": "Formstack offers a dedicated Salesforce Solutions plan with native Salesforce integration. Neither Cognito Forms nor Paperform document a native Salesforce integration."
    },
    {
      "question": "Which of these supports electronic signatures?",
      "answer": "Cognito Forms and Formstack both list electronic signatures as a feature. Paperform does not document electronic signature support."
    },
    {
      "question": "Which is best for forms with complex pricing or quoting logic?",
      "answer": "Paperform includes a built-in calculation engine designed for pricing and quoting logic, and Cognito Forms also supports calculations alongside its conditional logic. Formstack does not document a comparable calculation feature."
    },
    {
      "question": "Which tools are HIPAA-compliant?",
      "answer": "Both Cognito Forms and Formstack offer HIPAA-compliant configuration options, making either suitable for healthcare or other sensitive-data use cases. Paperform does not document HIPAA compliance."
    }
  ]
};

export default cognitoFormsVsFormstackVsPaperformContent;
