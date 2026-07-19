import type { GroupComparisonContent } from './types';

const featheryVsFormsortVsJotformContent: GroupComparisonContent = {
  "verdict": "Jotform is the broadest, most affordable generalist here, packing templates, payments, e-signatures, tables and AI agents into one no-code product for almost any use case. Feathery and Formsort both target technical product teams building complex, conditional multi-step flows rather than simple contact forms, but Feathery leans toward developer-embeddable forms with deep identity, authentication and payment integrations for fintech and insurance, while Formsort specializes narrowly in HIPAA-eligible healthcare and clinical eligibility screening funnels. Neither Feathery nor Formsort publishes fixed pricing past their free tiers, so budget-conscious teams should expect a sales conversation once they outgrow the free plan.",
  "bestFor": {
    "feathery": "Product and engineering teams that need pixel-perfect, white-labeled forms embeddable via a React or JavaScript SDK, with native Stripe, Salesforce, Plaid and Alloy integrations for fintech or insurance workflows.",
    "formsort": "Healthcare, insurtech and clinical operations teams building long, branching eligibility or intake flows that require HIPAA compliance and real-time score or cost calculations.",
    "jotform": "Small businesses, freelancers and general teams that want an affordable, template-rich, no-code form builder covering payments, e-signatures, approvals and AI agents in one product."
  },
  "highlights": [
    {
      "title": "Jotform wins on breadth and price",
      "description": "Jotform bundles a 10,000-plus template library, 30-plus payment gateways, e-signatures, spreadsheet-style tables, approval workflows and AI agents into tiers starting free and topping out at $129 a month, far below what Feathery or Formsort charge once you need paid features.",
      "toolSlugs": [
        "jotform"
      ]
    },
    {
      "title": "Feathery is built for developer embedding",
      "description": "Feathery's React and JavaScript SDK, natural-language Rule Builder and raw JavaScript editor let engineering teams embed pixel-perfect forms directly into their own products, backed by native Plaid, Alloy, LexisNexis and Stripe integrations aimed at identity-sensitive signup flows.",
      "toolSlugs": [
        "feathery"
      ]
    },
    {
      "title": "Formsort specializes in regulated, branching intake",
      "description": "Formsort's real-time calculations and advanced conditional branching turn a form into a decision tree, and its Enterprise tier adds HIPAA compliance and external-only data storage, making it the most purpose-built of the three for clinical trial screening or insurance eligibility flows.",
      "toolSlugs": [
        "formsort"
      ]
    },
    {
      "title": "All three offer a usable free tier",
      "description": "Feathery's free plan allows 500 monthly submissions and five live forms with SOC 2 coverage included, Formsort's free plan allows 100 flow starts a month, and Jotform's free Starter plan allows 100 monthly submissions across five forms, giving every tool a real way to test the product before paying.",
      "toolSlugs": [
        "feathery",
        "formsort",
        "jotform"
      ]
    },
    {
      "title": "Pricing transparency differs sharply past the free tier",
      "description": "Jotform publishes fixed monthly prices up to its Gold plan, Formsort publishes a fixed $279-a-month Pro tier before Enterprise pricing goes custom, and Feathery's Growth and Business tiers are both custom-quoted with no published price at all.",
      "toolSlugs": [
        "jotform",
        "formsort",
        "feathery"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Form Building and Logic",
      "rows": [
        {
          "feature": "Conditional branching logic",
          "statuses": {
            "feathery": "available",
            "formsort": "available",
            "jotform": "available"
          }
        },
        {
          "feature": "Developer SDK for embedding forms",
          "statuses": {
            "feathery": "available",
            "formsort": "not-documented",
            "jotform": "not-documented"
          },
          "note": "Feathery offers a dedicated React and JavaScript SDK; Formsort and Jotform forms are typically embedded via iframe or script rather than a developer SDK."
        },
        {
          "feature": "Real-time in-form calculations",
          "statuses": {
            "feathery": "not-documented",
            "formsort": "available",
            "jotform": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Payments, Signatures and Integrations",
      "rows": [
        {
          "feature": "Native payment collection",
          "statuses": {
            "feathery": "available",
            "formsort": "available",
            "jotform": "available"
          }
        },
        {
          "feature": "Built-in e-signature collection",
          "statuses": {
            "feathery": "not-documented",
            "formsort": "not-documented",
            "jotform": "available"
          },
          "note": "Jotform Sign provides native e-signature collection; Feathery and Formsort do not document a dedicated e-signature product."
        }
      ]
    },
    {
      "group": "Compliance and AI",
      "rows": [
        {
          "feature": "HIPAA compliance option",
          "statuses": {
            "feathery": "available",
            "formsort": "available",
            "jotform": "available"
          },
          "note": "Feathery offers HIPAA on its Growth tier and above, Formsort on its Enterprise tier, and Jotform on its Gold and Enterprise tiers."
        },
        {
          "feature": "AI assistant or agent features",
          "statuses": {
            "feathery": "available",
            "formsort": "unavailable",
            "jotform": "available"
          },
          "note": "Feathery's Robin assistant and document intelligence and Jotform's AI Agents are documented; Formsort does not document AI-assisted features."
        }
      ]
    },
    {
      "group": "Pricing",
      "rows": [
        {
          "feature": "Fixed, published pricing above the free tier",
          "statuses": {
            "feathery": "unavailable",
            "formsort": "limited",
            "jotform": "available"
          },
          "note": "Jotform publishes fixed prices through Gold; Formsort publishes a fixed Pro price but Enterprise is custom; Feathery's paid tiers are entirely custom-quoted."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three form builders has the most generous free plan?",
      "answer": "Feathery's free plan allows 500 monthly submissions and five live forms with SOC 2 coverage, which is more headroom than Formsort's 100 flow starts a month or Jotform's 100 monthly submissions, though Jotform's free plan includes a broader feature set like AI agents and file storage."
    },
    {
      "question": "Is Formsort HIPAA compliant?",
      "answer": "Formsort offers HIPAA compliance on its Enterprise tier, along with the option to store submission data entirely outside Formsort's own systems, which is why it is widely used for clinical trial screening and healthcare intake."
    },
    {
      "question": "Can I embed these forms directly into my own web or mobile app?",
      "answer": "Feathery is the strongest fit here, with a dedicated React and JavaScript SDK for embedding forms into an existing product and setting styles or logic at runtime. Formsort and Jotform forms are typically added to a site via iframe or script embed rather than a native SDK."
    },
    {
      "question": "Which tool is best for a small business just collecting simple leads or feedback?",
      "answer": "Jotform is the most accessible option for straightforward use cases, with a large template library, a usable free tier and affordable paid plans starting at $39 a month, without the developer setup that Feathery and Formsort assume."
    },
    {
      "question": "Do all three support taking payments through a form?",
      "answer": "Yes. Feathery and Formsort both offer native Stripe payment collection, and Jotform supports more than 30 payment gateways including Stripe, PayPal and Square."
    },
    {
      "question": "How does pricing compare once you outgrow the free plan?",
      "answer": "Jotform's paid tiers are fixed and published, ranging from $39 to $129 a month. Formsort's Pro plan is a fixed $279 a month before Enterprise pricing becomes custom. Feathery publishes no price at all above its free tier, requiring a sales conversation for both its Growth and Business plans."
    }
  ]
};

export default featheryVsFormsortVsJotformContent;
