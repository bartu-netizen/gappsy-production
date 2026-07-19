import type { GroupComparisonContent } from './types';

const cognitoFormsVsHeyformVsPaperformContent: GroupComparisonContent = {
  "verdict": "Cognito Forms suits organizations that want conditional logic, calculations, and payment collection on a genuinely unlimited free plan. Paperform stands out for its document-style editor that lets a form double as a landing page, proposal, or product page, backed by a built-in calculation engine. HeyForm is the pick for teams that want a conversational, one-question-at-a-time format with the added option to self-host for full data control.",
  "bestFor": {
    "cognito-forms": "Organizations needing conditional logic, calculations, and payment collection with unlimited free forms.",
    "heyform": "Teams wanting a self-hostable, open-source conversational form builder at low cost.",
    "paperform": "Creators and businesses that want forms to double as landing pages, proposals, or order pages using a document-style editor."
  },
  "highlights": [
    {
      "title": "A document, not just a form",
      "description": "Paperform's editor behaves like a word processor, letting users mix rich content, images, and payment blocks inline so a single form can serve as a landing page or product page instead of a plain data-collection grid.",
      "toolSlugs": [
        "paperform"
      ]
    },
    {
      "title": "Self-hosting for full control",
      "description": "HeyForm is the only one of the three that is open source and can be self-hosted via Docker, an option neither Cognito Forms nor Paperform offers.",
      "toolSlugs": [
        "heyform"
      ]
    },
    {
      "title": "All three have a real free tier",
      "description": "Cognito Forms, HeyForm, and Paperform each offer a permanent free plan, though the usage caps differ sharply: Paperform's free plan is capped at 30 submissions per month, HeyForm's at 250 responses per month, and Cognito Forms' at 100 entries per month.",
      "toolSlugs": [
        "cognito-forms",
        "heyform",
        "paperform"
      ]
    },
    {
      "title": "Built for calculations and quoting",
      "description": "Cognito Forms and Paperform both include logic for automated cost calculations, useful for quote forms and order forms with variable pricing; this is not documented as a HeyForm capability.",
      "toolSlugs": [
        "cognito-forms",
        "paperform"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Building and Logic",
      "rows": [
        {
          "feature": "Conditional logic",
          "statuses": {
            "cognito-forms": "available",
            "heyform": "available",
            "paperform": "available"
          }
        },
        {
          "feature": "Built-in calculation or pricing engine",
          "statuses": {
            "cognito-forms": "available",
            "heyform": "not-documented",
            "paperform": "available"
          }
        },
        {
          "feature": "Document-style rich content editor",
          "statuses": {
            "cognito-forms": "unavailable",
            "heyform": "unavailable",
            "paperform": "available"
          }
        }
      ]
    },
    {
      "group": "Payments and Monetization",
      "rows": [
        {
          "feature": "Payment collection",
          "statuses": {
            "cognito-forms": "available",
            "heyform": "available",
            "paperform": "available"
          }
        },
        {
          "feature": "Multiple payment gateways on paid plans",
          "statuses": {
            "cognito-forms": "available",
            "heyform": "limited",
            "paperform": "available"
          },
          "note": "Cognito Forms supports Stripe, PayPal, and Square; Paperform includes multiple gateways on all paid plans; HeyForm charges a payment commission that decreases as customers move up plan tiers."
        }
      ]
    },
    {
      "group": "Plans and Access",
      "rows": [
        {
          "feature": "Permanent free plan",
          "statuses": {
            "cognito-forms": "available",
            "heyform": "available",
            "paperform": "available"
          }
        },
        {
          "feature": "Self-hosting option",
          "statuses": {
            "cognito-forms": "unavailable",
            "heyform": "available",
            "paperform": "unavailable"
          }
        },
        {
          "feature": "Custom domain support",
          "statuses": {
            "cognito-forms": "not-documented",
            "heyform": "available",
            "paperform": "available"
          },
          "note": "Available on HeyForm's Premium plan and above, and on Paperform's Business plan and above."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three has the lowest free-plan submission cap?",
      "answer": "Paperform's free plan caps out at 30 submissions per month, the lowest of the three. HeyForm allows 250 responses per month free, and Cognito Forms allows 100 entries per month free."
    },
    {
      "question": "Which tool lets a form double as a landing page?",
      "answer": "Paperform, thanks to its word-processor-style editor that mixes form fields with rich content, images, and payment blocks."
    },
    {
      "question": "Can I self-host any of these form builders?",
      "answer": "Only HeyForm is open source and self-hostable via Docker. Cognito Forms and Paperform are closed, hosted SaaS products."
    },
    {
      "question": "Which is best for building complex pricing or quote forms?",
      "answer": "Paperform's built-in calculation engine and Cognito Forms' automated cost calculations both handle variable pricing logic; HeyForm does not document a comparable calculation feature."
    },
    {
      "question": "Which is the cheapest to start with a paid plan?",
      "answer": "HeyForm's Basic plan starts at $15/month, followed by Cognito Forms Pro at $19.20/month billed annually, then Paperform Essentials at $24/month."
    },
    {
      "question": "Do all three support conditional logic?",
      "answer": "Yes, Cognito Forms, HeyForm, and Paperform all support conditional logic that shows, hides, or requires fields based on prior answers."
    }
  ]
};

export default cognitoFormsVsHeyformVsPaperformContent;
