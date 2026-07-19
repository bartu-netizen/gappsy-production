import type { GroupComparisonContent } from './types';

const formstackVsHeyformVsPaperformContent: GroupComparisonContent = {
  "verdict": "Formstack, HeyForm, and Paperform are all no-code form builders, but they sit at different points on the price-versus-depth spectrum. HeyForm is the only genuinely open-source, self-hostable option and the cheapest to start with, Formstack is the most enterprise-oriented with Salesforce integration, e-signatures, and compliance certifications at a premium price, and Paperform offers a flexible document-style editor with a free plan for lighter, design-forward use cases. The best choice depends on whether self-hosting, enterprise integrations, or design flexibility matters most.",
  "bestFor": {
    "formstack": "Enterprises that need Salesforce-native workflows, electronic signatures, and HIPAA/PCI-compliant forms and can justify premium pricing starting at $83 per month.",
    "heyform": "Technical teams and startups that want a free, open-source, self-hostable conversational form builder with low-cost hosted plans starting at $15 per month.",
    "paperform": "Creators and marketers who want forms that double as branded landing pages or quizzes, starting from a free plan before upgrading."
  },
  "highlights": [
    {
      "title": "HeyForm is the only open-source, self-hostable option",
      "description": "HeyForm is explicitly open-source and self-hostable, a differentiator its own materials describe as uncommon among form-builder competitors, while Formstack and Paperform are closed, subscription-only SaaS products.",
      "toolSlugs": [
        "heyform",
        "formstack",
        "paperform"
      ]
    },
    {
      "title": "Formstack has the highest starting price but the deepest enterprise feature set",
      "description": "Formstack's Forms plan starts at $83 per month billed annually, well above HeyForm's $15 Basic plan and Paperform's $24 Essentials plan, but it is the only one of the three documented with native Salesforce integration and electronic signatures.",
      "toolSlugs": [
        "formstack"
      ]
    },
    {
      "title": "HeyForm and Paperform both offer a real free tier; Formstack does not",
      "description": "HeyForm's free plan caps at 250 responses per month and Paperform's free plan caps at 30 submissions per month, while Formstack offers only a 14-day trial with no permanent free plan.",
      "toolSlugs": [
        "heyform",
        "paperform",
        "formstack"
      ]
    },
    {
      "title": "Different form-building styles for different use cases",
      "description": "HeyForm uses a conversational, one-question-at-a-time format aimed at surveys and lead capture, Paperform uses a flexible document-style editor that can double as a landing page, and Formstack uses a traditional drag-and-drop builder aimed at structured data collection.",
      "toolSlugs": [
        "heyform",
        "paperform",
        "formstack"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Pricing and Access",
      "rows": [
        {
          "feature": "Free plan availability",
          "statuses": {
            "formstack": "unavailable",
            "heyform": "available",
            "paperform": "available"
          },
          "note": "Formstack offers only a 14-day trial; HeyForm's free plan caps at 250 responses per month and Paperform's at 30 submissions per month."
        },
        {
          "feature": "Self-hosting option",
          "statuses": {
            "formstack": "unavailable",
            "heyform": "available",
            "paperform": "unavailable"
          }
        }
      ]
    },
    {
      "group": "Form Building and Logic",
      "rows": [
        {
          "feature": "Conditional logic",
          "statuses": {
            "formstack": "not-documented",
            "heyform": "available",
            "paperform": "available"
          }
        },
        {
          "feature": "Form analytics",
          "statuses": {
            "formstack": "not-documented",
            "heyform": "available",
            "paperform": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Payments and Branding",
      "rows": [
        {
          "feature": "Built-in payment collection",
          "statuses": {
            "formstack": "available",
            "heyform": "available",
            "paperform": "available"
          }
        },
        {
          "feature": "Custom branding and domains",
          "statuses": {
            "formstack": "not-documented",
            "heyform": "available",
            "paperform": "available"
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
            "formstack": "available",
            "heyform": "not-documented",
            "paperform": "not-documented"
          }
        },
        {
          "feature": "Native Salesforce integration",
          "statuses": {
            "formstack": "available",
            "heyform": "not-documented",
            "paperform": "not-documented"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of Formstack, HeyForm, and Paperform can be self-hosted?",
      "answer": "HeyForm is explicitly open-source and self-hostable. Formstack and Paperform are closed, cloud-only subscription products with no self-hosting option documented."
    },
    {
      "question": "Which has the lowest-cost paid plan?",
      "answer": "HeyForm's Basic plan starts at $15 per month, Paperform's Essentials plan starts at $24 per month, and Formstack's Forms plan starts at $83 per month billed annually, making HeyForm the cheapest entry point."
    },
    {
      "question": "Which tool integrates with Salesforce?",
      "answer": "Formstack offers native Salesforce integration through its Salesforce Solutions plan. Neither HeyForm nor Paperform document a Salesforce integration."
    },
    {
      "question": "Do any of these offer a permanent free plan?",
      "answer": "HeyForm and Paperform both offer permanent free plans, capped at 250 responses per month and 30 submissions per month respectively. Formstack offers only a 14-day free trial with no permanent free tier."
    },
    {
      "question": "Which is best for HIPAA or PCI compliance needs?",
      "answer": "Formstack is documented as HIPAA and PCI compliant. HeyForm and Paperform do not document compliance certifications in this data."
    },
    {
      "question": "What style of form does each tool produce?",
      "answer": "HeyForm uses a conversational, one-question-at-a-time format geared toward surveys and lead capture, Paperform uses a flexible document-style editor that can function as a landing page, and Formstack uses a traditional structured drag-and-drop form builder."
    }
  ]
};

export default formstackVsHeyformVsPaperformContent;
