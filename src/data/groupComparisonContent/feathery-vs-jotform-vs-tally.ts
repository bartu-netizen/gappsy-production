import type { GroupComparisonContent } from './types';

const featheryVsJotformVsTallyContent: GroupComparisonContent = {
  "verdict": "Feathery, Jotform, and Tally each occupy a distinct niche in the form-builder market. Tally is the simplest and most generous free option, with unlimited forms and submissions for startups and indie creators. Jotform is the broadest all-in-one platform, bundling payments, e-signatures, approval workflows, and AI agents behind a large template library. Feathery is the most developer-oriented, with a React SDK and native identity, authentication, and payment integrations, though its product direction has shifted heavily toward financial services and insurance use cases in its more recent history.",
  "bestFor": {
    "feathery": "Product and engineering teams building embeddable, brand-controlled forms with advanced logic and identity or payment integrations",
    "jotform": "Businesses that want one platform for forms, payments, e-signatures, approval workflows, and AI agents with a generous free tier",
    "tally": "Startups, indie developers, and small businesses that want unlimited free forms and submissions with a simple, document-style editor"
  },
  "highlights": [
    {
      "title": "Tally's free plan has no submission limit",
      "description": "Tally offers unlimited forms and unlimited submissions on its free plan, including payments, signatures, and conditional logic, a more generous free tier than Feathery's 500-submission cap or Jotform's 100-submission Starter plan.",
      "toolSlugs": [
        "tally"
      ]
    },
    {
      "title": "Jotform bundles the broadest feature set",
      "description": "Jotform combines a drag-and-drop builder, 30-plus payment gateways, e-signatures via Jotform Sign, spreadsheet-style Jotform Tables, approval workflows, and AI agents in one product, a wider bundle than Feathery or Tally document.",
      "toolSlugs": [
        "jotform"
      ]
    },
    {
      "title": "Feathery offers the deepest developer SDK",
      "description": "Feathery's React and JavaScript SDK and custom JavaScript editor let engineers embed forms directly into apps with programmatic control, a capability not documented for Jotform or Tally.",
      "toolSlugs": [
        "feathery"
      ]
    },
    {
      "title": "Tally has the lowest-cost paid tier",
      "description": "Tally's Pro plan is EUR 20 per month, undercutting Jotform's $39/month Bronze plan and Feathery's custom-quoted Growth tier for teams that outgrow the free plan but don't need enterprise features.",
      "toolSlugs": [
        "tally"
      ]
    },
    {
      "title": "Identity and compliance depth favors Feathery",
      "description": "Feathery natively integrates identity and fraud providers like Plaid, Alloy, and LexisNexis and includes SOC 2 coverage even on its free tier, integrations not documented for Jotform or Tally.",
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
          "feature": "Conditional logic and branching",
          "statuses": {
            "feathery": "available",
            "jotform": "available",
            "tally": "available"
          }
        },
        {
          "feature": "Free permanent tier",
          "statuses": {
            "feathery": "available",
            "jotform": "available",
            "tally": "available"
          },
          "note": "Tally's free tier has no submission cap; Feathery caps at 500 submissions/month and Jotform's Starter plan caps at 100 submissions/month."
        }
      ]
    },
    {
      "group": "Payments and workflows",
      "rows": [
        {
          "feature": "Native payment collection",
          "statuses": {
            "feathery": "available",
            "jotform": "available",
            "tally": "available"
          }
        },
        {
          "feature": "E-signature collection",
          "statuses": {
            "feathery": "not-documented",
            "jotform": "available",
            "tally": "available"
          }
        },
        {
          "feature": "Multi-step approval workflows",
          "statuses": {
            "feathery": "not-documented",
            "jotform": "available",
            "tally": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Developer tools and compliance",
      "rows": [
        {
          "feature": "React or JavaScript SDK for embedding",
          "statuses": {
            "feathery": "available",
            "jotform": "not-documented",
            "tally": "not-documented"
          }
        },
        {
          "feature": "HIPAA-compliant tier",
          "statuses": {
            "feathery": "available",
            "jotform": "available",
            "tally": "not-documented"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of Feathery, Jotform, and Tally has the most generous free plan?",
      "answer": "Tally's free plan includes unlimited forms and unlimited submissions, more generous than Feathery's 500-submission cap or Jotform's 100-submission Starter plan."
    },
    {
      "question": "Which tool offers the broadest feature set beyond basic forms?",
      "answer": "Jotform bundles the most functionality, including payments, e-signatures via Jotform Sign, spreadsheet-style data tables, approval workflows, and AI agents in a single product."
    },
    {
      "question": "Can I embed forms directly into my own website or app with these tools?",
      "answer": "Feathery is the strongest option for developer embedding, with a React and JavaScript SDK for setting styles and logic programmatically; Jotform and Tally are typically embedded via iframe."
    },
    {
      "question": "Which is the most affordable paid plan among the three?",
      "answer": "Tally's Pro plan at EUR 20 per month is the cheapest paid tier, compared to Jotform's $39/month Bronze plan and Feathery's custom-quoted Growth tier."
    },
    {
      "question": "Which of these tools supports HIPAA-compliant forms?",
      "answer": "Feathery's Growth tier and Jotform's Gold and Enterprise tiers both support HIPAA compliance; Tally does not document HIPAA compliance as a feature."
    }
  ]
};

export default featheryVsJotformVsTallyContent;
