import type { ToolComparisonContent } from './types';

const albatoVsIntegratelyContent: ToolComparisonContent = {
  "verdict": "Albato and Integrately are both no-code automation platforms with free tiers and low-cost entry plans, but they emphasize different strengths: Albato leans into embeddable, white-label automation for other SaaS products and transaction-based billing, while Integrately leans into a very large library of pre-built, one-click automations (20M+ across 1,500+ apps) for users who want ready-made flows rather than building from scratch.",
  "bestForToolA": "SaaS companies wanting to embed a white-label automation builder directly inside their own product via headless API or iFrame deployment, or teams that specifically need SOC 2 Type II certification.",
  "bestForToolB": "Users who want to activate pre-built, one-click automations in three steps without configuring flows manually, especially across a very large catalog of 1,500+ supported apps.",
  "whoNeedsBoth": "A SaaS product team might embed Albato for white-labeled in-product automation for its own customers while separately using Integrately internally for its own team's one-click app automations — the two solve embedding versus internal productivity differently.",
  "keyDifferences": [
    {
      "title": "White-label / embeddable deployment",
      "toolA": "Albato offers an embeddable, white-label workflow builder with headless API and iFrame deployment for embedding inside another product's UI.",
      "toolB": "Integrately's facts don't document a white-label or embeddable offering; it's positioned as a standalone automation tool.",
      "whyItMatters": "White-labeling lets a SaaS company offer automation as a feature of its own product rather than sending users to a third-party tool.",
      "benefitsWho": "SaaS product teams wanting to build automation directly into their own customer-facing product."
    },
    {
      "title": "Pre-built automation library size",
      "toolA": "Albato's facts emphasize 1,000+ app connectors rather than a specific pre-built automation count.",
      "toolB": "Integrately offers 20M+ pre-built, one-click automations across 1,500+ apps.",
      "whyItMatters": "A larger pre-built automation library reduces setup time for common use cases versus building flows manually.",
      "benefitsWho": "Non-technical users who want a working automation activated in three steps rather than configured field-by-field."
    },
    {
      "title": "Billing model",
      "toolA": "Albato bills based on automation transaction volume, with a free plan (100 transactions/month, 5 automations) and Pro at $15/month (annual) for up to 2M transactions/month.",
      "toolB": "Integrately bills based on monthly task counts, with a free plan (100 tasks/month) and Starter at $19.99/month (annual) for 2,000 tasks/month.",
      "whyItMatters": "Both are usage-based, but the specific unit (transactions vs. tasks) and included volumes differ, affecting cost at scale.",
      "benefitsWho": "Teams should model their expected automation volume against each vendor's specific unit and included allotment."
    },
    {
      "title": "Certifications",
      "toolA": "Albato is SOC 2 Type II certified and GDPR-compliant.",
      "toolB": "Integrately's facts don't document a SOC 2 certification.",
      "whyItMatters": "SOC 2 Type II certification is often a procurement requirement for larger or more security-conscious buyers.",
      "benefitsWho": "Enterprise buyers with formal security review requirements."
    },
    {
      "title": "Multi-step and branching logic access",
      "toolA": "Albato's free plan is limited to 2 steps per automation, with unlimited automations and steps unlocked on the Pro plan.",
      "toolB": "Integrately gates multi-step automations to the Starter plan and above, and branching, iterators, and auto-retry to Professional and above.",
      "whyItMatters": "Knowing exactly which tier unlocks branching logic determines whether a free or entry-level plan can handle more complex workflows.",
      "benefitsWho": "Teams building conditional, multi-branch automations rather than simple one-step triggers."
    }
  ],
  "featureMatrix": [
    {
      "group": "Automation Building",
      "rows": [
        {
          "feature": "Large pre-built automation library",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Integrately lists 20M+ pre-built automations across 1,500+ apps."
        },
        {
          "feature": "One-click / auto-connect setup",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Integrately's SmartConnect automatically maps app accounts."
        },
        {
          "feature": "Multi-step workflows",
          "toolA": "available",
          "toolB": "limited",
          "note": "Integrately gates multi-step workflows to the Starter plan and above."
        },
        {
          "feature": "Branching/iterators/auto-retry",
          "toolA": "not-documented",
          "toolB": "limited",
          "note": "Integrately gates these to the Professional plan and above."
        }
      ]
    },
    {
      "group": "Deployment & Embedding",
      "rows": [
        {
          "feature": "White-label/embeddable builder",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "AI agents & MCP support",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Full integration lifecycle management (build, host, maintain)",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Free plan",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Entry paid plan price",
          "toolA": "available",
          "toolB": "available",
          "note": "Albato Pro is $15/month (annual); Integrately Starter is $19.99/month (annual)."
        },
        {
          "feature": "SOC 2 certification",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Albato have a free plan?",
      "answer": "Yes, it includes 100 transactions/month and 5 active automations at $0."
    },
    {
      "question": "Does Integrately have a free plan?",
      "answer": "Yes, a free plan includes 100 tasks per month with single-step automations."
    },
    {
      "question": "Can Albato be white-labeled?",
      "answer": "Yes, Albato offers an embeddable, white-label workflow builder for SaaS companies via headless API or iFrame deployment; this isn't documented for Integrately."
    },
    {
      "question": "What is SmartConnect?",
      "answer": "SmartConnect is Integrately's feature that automatically connects app accounts without manual configuration."
    },
    {
      "question": "Which platform is SOC 2 certified?",
      "answer": "Albato is SOC 2 Type II certified and GDPR-compliant; SOC 2 certification isn't documented for Integrately."
    },
    {
      "question": "How many apps does each platform support?",
      "answer": "Albato lists 1,000+ app connectors; Integrately lists ready-made automations for 1,500+ applications."
    }
  ]
};

export default albatoVsIntegratelyContent;
