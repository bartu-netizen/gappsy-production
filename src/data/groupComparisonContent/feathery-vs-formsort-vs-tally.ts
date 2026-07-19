import type { GroupComparisonContent } from './types';

const featheryVsFormsortVsTallyContent: GroupComparisonContent = {
  "verdict": "Feathery, Formsort, and Tally all build multi-step forms but serve very different buyers. Tally is a free, document-style form builder aimed at startups, indie developers, and small businesses that want unlimited forms and submissions without cost or complexity. Formsort is a specialized, low-code platform for complex branching intake and eligibility flows, with HIPAA compliance available for healthcare and clinical-trial use cases. Feathery sits between them as a developer-first, low-code platform with a React SDK and deep identity, payment, and authentication integrations, though its recent product direction has shifted heavily toward financial services and insurance rather than general-purpose form building.",
  "bestFor": {
    "feathery": "Product and engineering teams building brand-controlled, embeddable forms with advanced conditional logic and identity or payment integrations",
    "formsort": "Healthcare, insurtech, and fintech teams building complex, multi-step branching intake or eligibility flows, especially where HIPAA compliance is required",
    "tally": "Startups, indie developers, and small businesses that want unlimited free forms and submissions with a simple, document-style editor"
  },
  "highlights": [
    {
      "title": "Tally's free tier has no submission cap",
      "description": "Tally's free plan includes unlimited forms and unlimited submissions along with payments, signatures, and conditional logic, a rare combination compared to Feathery's 500-submission free tier and Formsort's 100-flow-start free tier.",
      "toolSlugs": [
        "tally"
      ]
    },
    {
      "title": "Formsort specializes in branching eligibility flows",
      "description": "Formsort's real-time calculations and advanced conditional branching are purpose-built for healthcare intake, insurance eligibility, and clinical trial screening, with HIPAA compliance available at its Enterprise tier.",
      "toolSlugs": [
        "formsort"
      ]
    },
    {
      "title": "Feathery offers the deepest developer SDK",
      "description": "Feathery's React and JavaScript SDK lets engineers embed forms directly into web and mobile applications with programmatic styling and logic, a level of embeddability not documented for Formsort or Tally.",
      "toolSlugs": [
        "feathery"
      ]
    },
    {
      "title": "Feathery's pricing has moved to custom quotes",
      "description": "Feathery's Growth and Business tiers are now sold on a custom-quote basis rather than fixed pricing, unlike Formsort's published $279/month Pro tier or Tally's fixed EUR 20/month Pro plan.",
      "toolSlugs": [
        "feathery"
      ]
    },
    {
      "title": "Identity and payment integrations favor Feathery",
      "description": "Feathery natively integrates identity and fraud providers like Plaid, Alloy, and LexisNexis alongside Stripe payments, integrations not documented for Formsort or Tally beyond Formsort's own native Stripe support.",
      "toolSlugs": [
        "feathery"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core form building",
      "rows": [
        {
          "feature": "Conditional branching logic",
          "statuses": {
            "feathery": "available",
            "formsort": "available",
            "tally": "available"
          }
        },
        {
          "feature": "Free permanent tier",
          "statuses": {
            "feathery": "available",
            "formsort": "available",
            "tally": "available"
          },
          "note": "Tally's free tier has no submission cap; Feathery and Formsort cap free usage at 500 submissions and 100 flow starts per month respectively."
        }
      ]
    },
    {
      "group": "Developer and design control",
      "rows": [
        {
          "feature": "React or JavaScript SDK for embedding",
          "statuses": {
            "feathery": "available",
            "formsort": "not-documented",
            "tally": "not-documented"
          }
        },
        {
          "feature": "Custom CSS and custom domain",
          "statuses": {
            "feathery": "available",
            "formsort": "available",
            "tally": "available"
          },
          "note": "Available on paid tiers for all three."
        }
      ]
    },
    {
      "group": "Payments, identity, and compliance",
      "rows": [
        {
          "feature": "Native Stripe payment collection",
          "statuses": {
            "feathery": "available",
            "formsort": "available",
            "tally": "available"
          }
        },
        {
          "feature": "Identity or fraud verification integrations (e.g. Plaid, Alloy)",
          "statuses": {
            "feathery": "available",
            "formsort": "not-documented",
            "tally": "not-documented"
          }
        },
        {
          "feature": "HIPAA-compliant tier",
          "statuses": {
            "feathery": "available",
            "formsort": "available",
            "tally": "not-documented"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of Feathery, Formsort, and Tally is completely free to use?",
      "answer": "Tally comes closest, with a free plan that includes unlimited forms and unlimited submissions; Feathery and Formsort both offer free tiers but cap usage at 500 monthly submissions and 100 monthly flow starts respectively."
    },
    {
      "question": "Which tool is best for healthcare intake or clinical trial screening forms?",
      "answer": "Formsort is purpose-built for this use case, with real-time eligibility calculations, advanced branching logic, and HIPAA compliance available at its Enterprise tier."
    },
    {
      "question": "Can I embed these forms directly into my own web or mobile app?",
      "answer": "Feathery is the strongest option for this, offering a React and JavaScript SDK for embedding forms with programmatic styling and logic; Formsort and Tally do not document a comparable SDK."
    },
    {
      "question": "Is Feathery still a good fit for general-purpose forms, not just fintech or insurance?",
      "answer": "Feathery's free tier and core form-building features remain usable for general-purpose cases, but its recent product investment has concentrated on financial services and insurance, so general SaaS onboarding use cases may see less ongoing feature focus."
    },
    {
      "question": "How does Tally's pricing compare to Feathery and Formsort?",
      "answer": "Tally is the most affordable paid option, with a Pro plan at EUR 20 per month, compared to Formsort's Pro plan at roughly $279 per month and Feathery's Growth and Business tiers, which require a custom quote."
    }
  ]
};

export default featheryVsFormsortVsTallyContent;
