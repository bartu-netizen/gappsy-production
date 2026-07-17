import type { ToolComparisonContent } from './types';

const activepiecesVsHuginnContent: ToolComparisonContent = {
  "verdict": "Activepieces is a commercially maintained workflow-automation platform priced per active flow (starting at $5/month), offering a large prebuilt \"pieces\" integration library and enterprise governance controls across cloud or self-hosted deployment. Huginn is a fully free, open-source agent framework with no pricing plans at all, where automations are built by chaining simple, individually-testable agents together on infrastructure you control. One is a paid product optimized for breadth of integrations and governance; the other is a zero-cost, developer-oriented composition engine.",
  "bestForToolA": "Teams that want a maintained, paid automation product with a large \"pieces\" integration catalog (including Gmail) and enterprise governance controls, and are comfortable with usage-based pricing starting at $5 per active flow/month.",
  "bestForToolB": "Developers who want a completely free, self-hosted automation tool and are comfortable building automations by chaining individually-testable agents together rather than using prebuilt connectors.",
  "whoNeedsBoth": "A technical team could prototype simple monitoring or chaining logic in self-hosted Huginn at zero cost, then move business-critical workflows that need prebuilt \"pieces\" integrations and enterprise governance controls into paid Activepieces once they need a supported platform.",
  "keyDifferences": [
    {
      "title": "Pricing Model",
      "toolA": "Activepieces is a paid product priced per active flow, starting at $5/month on the Standard plan, with a custom-priced Ultimate tier billed on an annual contract.",
      "toolB": "Huginn is free and open source with no pricing plans documented at all — there is no paid tier to move into.",
      "whyItMatters": "Usage-based pricing can scale unpredictably as flow count grows, while a zero-cost open-source tool carries no billing risk but also no vendor pricing tiers to unlock more support.",
      "benefitsWho": "Cost-sensitive technical teams or hobbyists who want to avoid any subscription cost."
    },
    {
      "title": "Integration Library",
      "toolA": "Activepieces documents a large integrations library referred to as \"pieces,\" including prebuilt connections such as Gmail.",
      "toolB": "Huginn's documented strength is chainable agents — one agent's output triggering another — rather than a catalogued library of prebuilt third-party integrations.",
      "whyItMatters": "A large prebuilt integration catalog reduces custom-coding effort for common SaaS connections, while a chaining model favors building novel logic from simpler primitives.",
      "benefitsWho": "Ops and marketing teams who need to connect many SaaS tools without custom code benefit from Activepieces' pieces; developers building bespoke monitoring or scraping automations benefit from Huginn's chaining model."
    },
    {
      "title": "Deployment Options",
      "toolA": "Activepieces explicitly supports both cloud-hosted and self-hosted deployment.",
      "toolB": "Huginn's own FAQ describes it running \"entirely on infrastructure you control,\" with no cloud-hosted option documented.",
      "whyItMatters": "Teams that don't want to manage servers need a cloud option, which Huginn does not document.",
      "benefitsWho": "IT-constrained teams that want a managed cloud option benefit from Activepieces; teams that specifically want full infrastructure control benefit from Huginn."
    },
    {
      "title": "Enterprise Governance",
      "toolA": "Activepieces lists enterprise governance controls as a dedicated feature, aimed at larger organizations, alongside its custom-priced Ultimate plan.",
      "toolB": "Huginn has no documented enterprise governance or admin-control features.",
      "whyItMatters": "Larger organizations often need centralized governance and account management that a bare open-source agent framework doesn't provide out of the box.",
      "benefitsWho": "Mid-size to large organizations that need governance controls around who can build and run automations."
    },
    {
      "title": "Cost Predictability at Scale",
      "toolA": "Activepieces' own documented con is that usage-based pricing per active flow \"can be harder to predict at scale than a flat per-seat fee.\"",
      "toolB": "Huginn has no billing at all, so there is no per-flow or per-seat cost to predict.",
      "whyItMatters": "Budget-conscious teams running many automations need to know whether costs will spike as usage grows.",
      "benefitsWho": "Finance-conscious teams running a high volume of automations who want to avoid the pricing unpredictability the vendor itself acknowledges."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Automation Features",
      "rows": [
        {
          "feature": "Prebuilt integration library (\"pieces\")",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Activepieces documents integrations such as Gmail"
        },
        {
          "feature": "Chainable/composable automation building",
          "toolA": "available",
          "toolB": "available",
          "note": "Huginn's core feature is chainable agents"
        },
        {
          "feature": "AI-driven workflow assistance",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Activepieces positions itself around a \"self-driven AI culture\""
        }
      ]
    },
    {
      "group": "Deployment & Hosting",
      "rows": [
        {
          "feature": "Self-hosted deployment",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Cloud-hosted deployment",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Enterprise governance controls",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Free to use",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Huginn's pricing model is Free/Open Source"
        },
        {
          "feature": "Usage-based pricing",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "$5 per active flow/month, Standard plan"
        },
        {
          "feature": "Custom enterprise contract",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Ultimate plan, custom pricing, annual contract"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Activepieces free to use?",
      "answer": "No free plan is documented — Activepieces pricing starts at $5/month per active flow on the Standard plan, with a custom-priced Ultimate tier for larger organizations."
    },
    {
      "question": "Is Huginn free to use?",
      "answer": "Yes, Huginn is free and open source with no pricing plans at all."
    },
    {
      "question": "Can both Activepieces and Huginn be self-hosted?",
      "answer": "Yes — Activepieces supports both self-hosted and cloud deployment, while Huginn's documentation describes it running entirely on infrastructure you control."
    },
    {
      "question": "Which tool has a bigger prebuilt integration library?",
      "answer": "Activepieces documents a large \"pieces\" integration library including connections like Gmail; Huginn's documented strength is chaining its own agents together rather than a cataloged third-party integration library."
    },
    {
      "question": "Does either tool offer enterprise governance controls?",
      "answer": "Activepieces documents enterprise governance controls and a custom-priced Ultimate plan; Huginn has no documented enterprise or governance tier."
    },
    {
      "question": "How does pricing scale for high-volume automation?",
      "answer": "Activepieces charges per active flow starting at $5/month, which its own documentation notes can be harder to predict at scale than a flat fee; Huginn has no usage-based billing since it's free and open source."
    }
  ]
};

export default activepiecesVsHuginnContent;
