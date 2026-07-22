import type { GroupComparisonContent } from './types';

const formsortVsJotformVsTallyContent: GroupComparisonContent = {
  "verdict": "Formsort, Jotform, and Tally all build web forms, but they solve different problems. Formsort is a low-code platform purpose-built for long, branching, regulated flows like healthcare intake and eligibility screening, with HIPAA compliance available at its Enterprise tier. Jotform is the broadest all-in-one option, bundling payments, e-signatures, approval workflows, and AI agents into a single product. Tally is the leanest choice, offering unlimited forms and submissions on a genuinely free plan for teams that just need a fast, modern form builder.",
  "bestFor": {
    "formsort": "Healthcare, insurtech, and fintech teams building complex multi-step eligibility or intake flows that need HIPAA compliance and real-time calculations.",
    "jotform": "Businesses that want one platform covering forms, payments, e-signatures, approval workflows, and AI agents instead of piecing together multiple tools.",
    "tally": "Startups, indie developers, and small teams who want a free, unlimited-submission form builder with a fast, document-style editor."
  },
  "highlights": [
    {
      "title": "Built for Regulated, Branching Flows",
      "description": "Formsort's advanced conditional logic and real-time calculations are designed for long qualification flows like clinical trial screening, with HIPAA compliance available at the Enterprise tier.",
      "toolSlugs": [
        "formsort"
      ]
    },
    {
      "title": "Most Feature-Rich All-in-One",
      "description": "Jotform bundles a drag-and-drop builder, payments, e-signatures, approval workflows, data tables, and AI agents into a single product.",
      "toolSlugs": [
        "jotform"
      ]
    },
    {
      "title": "Most Generous Free Tier",
      "description": "Tally's free plan includes unlimited forms and submissions, along with payments, signatures, and conditional logic, a rarity among form builders.",
      "toolSlugs": [
        "tally"
      ]
    },
    {
      "title": "HIPAA Compliance Available on Two of Three",
      "description": "Formsort and Jotform both offer HIPAA-compliant configurations at their higher tiers, while Tally does not document HIPAA support.",
      "toolSlugs": [
        "formsort",
        "jotform"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Form Building",
      "rows": [
        {
          "feature": "Conditional branching logic",
          "statuses": {
            "formsort": "available",
            "jotform": "available",
            "tally": "available"
          }
        },
        {
          "feature": "Multi-language support",
          "statuses": {
            "formsort": "not-documented",
            "jotform": "not-documented",
            "tally": "available"
          },
          "note": "Tally documents support for 45+ languages including right-to-left scripts."
        }
      ]
    },
    {
      "group": "Compliance and Payments",
      "rows": [
        {
          "feature": "HIPAA-compliant configuration",
          "statuses": {
            "formsort": "available",
            "jotform": "available",
            "tally": "not-documented"
          },
          "note": "Available at Formsort Enterprise and Jotform Gold/Enterprise tiers."
        },
        {
          "feature": "Native payment collection",
          "statuses": {
            "formsort": "available",
            "jotform": "available",
            "tally": "available"
          }
        },
        {
          "feature": "E-signature collection",
          "statuses": {
            "formsort": "not-documented",
            "jotform": "available",
            "tally": "available"
          }
        }
      ]
    },
    {
      "group": "Free Tier and Automation",
      "rows": [
        {
          "feature": "Free plan usage limits",
          "statuses": {
            "formsort": "limited",
            "jotform": "limited",
            "tally": "available"
          },
          "note": "Formsort caps at 100 flow starts/month, Jotform at 100 submissions/month, Tally is unlimited on fair use."
        },
        {
          "feature": "Conversational AI agents",
          "statuses": {
            "formsort": "not-documented",
            "jotform": "available",
            "tally": "not-documented"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of Formsort, Jotform, and Tally is HIPAA compliant?",
      "answer": "Both Formsort and Jotform offer HIPAA-compliant configurations, though only at their higher tiers: Formsort's Enterprise plan and Jotform's Gold or Enterprise plans. Tally does not document HIPAA support."
    },
    {
      "question": "Which has the most generous free plan?",
      "answer": "Tally's free plan stands out because it allows unlimited forms and unlimited submissions along with payments, signatures, and conditional logic. Formsort's free plan caps at 100 flow starts per month, and Jotform's free Starter plan caps at 100 submissions per month."
    },
    {
      "question": "Is Formsort a good fit for simple contact forms?",
      "answer": "Not really. Formsort is purpose-built for long, multi-step, conditionally branching flows like eligibility screening, so its flow-start based pricing and low-code setup are better suited to complex qualification flows than a basic one-page contact form."
    },
    {
      "question": "Does Tally support payments and e-signatures on the free plan?",
      "answer": "Yes, Tally's free plan includes payment collection, e-signatures, and file uploads alongside unlimited forms and submissions."
    },
    {
      "question": "Which platform is best for a team that wants everything in one product?",
      "answer": "Jotform is the broadest option, combining form building, payments, e-signatures, approval workflows, data tables, reporting, and AI agents in a single platform."
    },
    {
      "question": "Can Formsort's Salesforce integration replace a manual sales handoff?",
      "answer": "Formsort's Salesforce integration pushes qualified leads or completed applications directly into Salesforce, which can reduce manual handoff work, though it is only available from the Pro tier upward."
    }
  ]
};

export default formsortVsJotformVsTallyContent;
