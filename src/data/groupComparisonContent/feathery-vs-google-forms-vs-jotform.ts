import type { GroupComparisonContent } from './types';

const featheryVsGoogleFormsVsJotformContent: GroupComparisonContent = {
  "verdict": "Feathery, Google Forms, and Jotform span three very different levels of complexity and cost. Google Forms is free with no tier structure at all, ideal for anyone who already has a Google account and needs a simple survey or quiz. Jotform sits in the middle with a generous free plan and an unusually broad feature set, from payments and e-signatures to AI agents, that scales into paid tiers as usage grows. Feathery is the most developer-oriented of the three, offering a React SDK, native identity and payment integrations, and pixel-level design control, though its product focus has increasingly shifted toward financial services and insurance rather than general-purpose forms.",
  "bestFor": {
    "feathery": "Product and engineering teams that need embeddable, brand-controlled forms with advanced logic and identity or payment integrations",
    "google-forms": "Anyone who wants a completely free, no-frills form or quiz builder integrated with Google Sheets and Classroom",
    "jotform": "Businesses that want one platform covering forms, payments, e-signatures, approval workflows, and AI agents with a generous free tier"
  },
  "highlights": [
    {
      "title": "Google Forms has no pricing tiers at all",
      "description": "Google Forms is bundled free into every Google Account and every Google Workspace plan with no usage caps, a simpler and more predictable cost model than either Feathery's tiered plans or Jotform's submission-based pricing.",
      "toolSlugs": [
        "google-forms"
      ]
    },
    {
      "title": "Jotform bundles the widest feature set",
      "description": "Jotform combines payment collection through 30-plus gateways, e-signatures, spreadsheet-style data tables, approval workflows, and AI agents in one product, a breadth of bundled functionality that Google Forms does not offer.",
      "toolSlugs": [
        "jotform"
      ]
    },
    {
      "title": "Feathery offers the deepest developer control",
      "description": "Feathery's React and JavaScript SDK and custom JavaScript editor let engineers embed and programmatically control forms, well beyond the no-code interfaces of Google Forms and Jotform.",
      "toolSlugs": [
        "feathery"
      ]
    },
    {
      "title": "Google Forms wins on education integration",
      "description": "Google Forms' Quiz mode with auto-grading integrates directly with Google Classroom, a specific education workflow that neither Feathery nor Jotform documents.",
      "toolSlugs": [
        "google-forms"
      ]
    },
    {
      "title": "HIPAA compliance is available on Feathery and Jotform, not Google Forms",
      "description": "Both Feathery's Growth tier and Jotform's Gold tier support HIPAA-compliant data collection, while Google Forms does not document HIPAA compliance as a feature.",
      "toolSlugs": [
        "feathery",
        "jotform"
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
            "google-forms": "available",
            "jotform": "available"
          }
        },
        {
          "feature": "Free permanent tier",
          "statuses": {
            "feathery": "available",
            "google-forms": "available",
            "jotform": "available"
          },
          "note": "Google Forms is entirely free with no paid tier; Feathery and Jotform cap free usage by submissions and forms."
        }
      ]
    },
    {
      "group": "Payments, signatures, and workflows",
      "rows": [
        {
          "feature": "Native payment collection",
          "statuses": {
            "feathery": "available",
            "google-forms": "unavailable",
            "jotform": "available"
          }
        },
        {
          "feature": "E-signature collection",
          "statuses": {
            "feathery": "not-documented",
            "google-forms": "unavailable",
            "jotform": "available"
          }
        },
        {
          "feature": "Multi-step approval workflows",
          "statuses": {
            "feathery": "not-documented",
            "google-forms": "unavailable",
            "jotform": "available"
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
            "google-forms": "not-documented",
            "jotform": "not-documented"
          }
        },
        {
          "feature": "HIPAA-compliant tier",
          "statuses": {
            "feathery": "available",
            "google-forms": "not-documented",
            "jotform": "available"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of Feathery, Google Forms, and Jotform is completely free?",
      "answer": "Google Forms is entirely free with no paid tier or usage caps, while Feathery and Jotform both offer free plans that cap monthly submissions and the number of active forms."
    },
    {
      "question": "Which tool can collect payments directly on a form?",
      "answer": "Both Feathery and Jotform support native payment collection through Stripe and other gateways; Google Forms does not offer built-in payment collection without a third-party add-on."
    },
    {
      "question": "Which is best for classroom quizzes and grading?",
      "answer": "Google Forms is the strongest fit, with a dedicated Quiz mode that auto-grades submissions and integrates directly with Google Classroom."
    },
    {
      "question": "Can I embed Feathery, Google Forms, or Jotform forms into my own app?",
      "answer": "Feathery offers the deepest embedding support through its React and JavaScript SDK with programmatic styling and logic; Jotform and Google Forms are typically embedded via iframe rather than a dedicated developer SDK."
    },
    {
      "question": "Which tool supports HIPAA-compliant form collection?",
      "answer": "Feathery's Growth tier and Jotform's Gold and Enterprise tiers both support HIPAA-compliant data collection; Google Forms does not document HIPAA compliance."
    }
  ]
};

export default featheryVsGoogleFormsVsJotformContent;
