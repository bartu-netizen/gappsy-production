import type { ToolComparisonContent } from './types';

const latenodeVsProcessStreetContent: ToolComparisonContent = {
  "verdict": "Latenode and Process Street both automate workflows, but they're built for different jobs. Latenode is a visual, developer-friendly automation platform with 5,500+ app integrations, 1,200+ AI models, and custom JavaScript nodes, priced from a free plan up through usage-based CPU-second billing. Process Street is a compliance operations platform built around policy document management for standards like ISO 9001, SOC 2, SOX, and FDA, paired with AI-assisted workflow automation (Cora and Process AI), used by 3,000+ companies including Salesforce, Cisco, and Slack.",
  "bestForToolA": "Latenode fits teams building general-purpose automations that need deep app integrations, custom JavaScript logic, and access to multiple AI models without managing separate API keys, especially cost-sensitive teams comparing against Zapier, Make, or n8n.",
  "bestForToolB": "Process Street fits compliance and operations teams that need audit-ready documentation, policy control mapped to standards like ISO 9001, SOC 2, SOX, or FDA, and an AI compliance agent (Cora) that monitors regulations, particularly at companies already needing SOC 2 Type II or HIPAA-compliant tooling.",
  "whoNeedsBoth": "A company could use Process Street to maintain its audit-ready SOC 2 policy documentation and compliance checklists while using Latenode to build the underlying data-integration automations (for example, syncing customer data across 5,500+ connected apps) that those compliance processes depend on but that Process Street's own automation apps don't natively provide.",
  "keyDifferences": [
    {
      "title": "Core Purpose",
      "toolA": "Latenode is a general-purpose visual workflow automation platform connecting apps, AI models, and custom code.",
      "toolB": "Process Street is a compliance operations platform combining document/policy control with workflow automation for regulated processes.",
      "whyItMatters": "A compliance-specific platform bakes in audit trails and standards mapping that a general automation tool would require custom building.",
      "benefitsWho": "Regulated businesses (finance, healthcare, manufacturing) benefit from Process Street's built-in compliance framing; teams needing broad app-to-app automation benefit from Latenode's integration breadth."
    },
    {
      "title": "Pricing Transparency",
      "toolA": "Latenode publishes concrete pricing: a free plan (10,000 CPU seconds, 5 active workflows), Pay-as-You-Go at roughly $10.80/month per 100,000 CPU seconds, and a Managed Service tier from $199/month.",
      "toolB": "Process Street does not publish exact pricing for its Pro or Startup plans; Enterprise is quote-only, and Startup eligibility is restricted to companies under 15 employees and $2M revenue.",
      "whyItMatters": "Published usage-based pricing lets teams estimate costs before signing up, while quote-only pricing requires a sales conversation to get a number.",
      "benefitsWho": "Self-service buyers who want to evaluate cost upfront benefit from Latenode's published pricing; larger organizations often expect and prefer negotiated Enterprise pricing regardless."
    },
    {
      "title": "Integration Breadth",
      "toolA": "Latenode offers 5,500+ pre-built app integrations across platforms like Salesforce, HubSpot, Slack, Notion, and Shopify, plus custom JavaScript nodes for anything not natively supported.",
      "toolB": "Process Street's documented automation is centered on its own Ops module and 'automation apps' (with plan limits like 10 automation apps and 100 automation actions/month on Startup) rather than a large external integration marketplace.",
      "whyItMatters": "Breadth of native integrations determines how much custom development is needed to connect a workflow tool to the rest of a company's software stack.",
      "benefitsWho": "Teams automating across many disparate SaaS tools benefit from Latenode's 5,500+ integrations, which is a much larger surface than Process Street's automation app limits."
    },
    {
      "title": "AI Capabilities",
      "toolA": "Latenode provides access to 1,200+ AI models and apps (including GPT-4o, Claude, and Gemini) without managing separate API keys, plus support for multi-agent AI architectures.",
      "toolB": "Process Street includes Cora, an AI compliance and risk agent that monitors regulations and flags risks, and Process AI, which generates workflows automatically from a text description.",
      "whyItMatters": "The two platforms apply AI to different problems: general-purpose model access for building workflows versus a narrowly scoped compliance-monitoring agent.",
      "benefitsWho": "Teams building AI-driven automations across many models benefit from Latenode's model access; compliance teams benefit from Process Street's purpose-built Cora agent."
    },
    {
      "title": "Enterprise Security Posture",
      "toolA": "Latenode includes SOC 2 Type II, GDPR compliance, SSO, and RBAC across all plans, not gated to top tiers.",
      "toolB": "Process Street is ISO 27001, SOC 2 Type II, HIPAA, and GDPR compliant as a company-level certification set, alongside its compliance-focused product features.",
      "whyItMatters": "Both platforms carry serious security certifications, but Latenode's inclusion of SSO/RBAC on every plan (rather than gating them to Enterprise) affects which tier a security-conscious small team needs to buy.",
      "benefitsWho": "Smaller teams needing SSO/RBAC without paying for a top-tier plan benefit from Latenode's all-plan inclusion; teams specifically needing HIPAA-compliant tooling benefit from Process Street's certification."
    }
  ],
  "featureMatrix": [
    {
      "group": "Automation Core",
      "rows": [
        {
          "feature": "Visual workflow/canvas builder",
          "toolA": "available",
          "toolB": "available",
          "note": "Process Street's Ops module"
        },
        {
          "feature": "Custom code nodes",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Latenode supports full custom JavaScript"
        },
        {
          "feature": "AI-generated workflows from description",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Process Street's Process AI"
        },
        {
          "feature": "Native app integrations",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Latenode: 5,500+ integrations"
        }
      ]
    },
    {
      "group": "Compliance & Documentation",
      "rows": [
        {
          "feature": "Policy/document management for compliance standards",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Process Street: ISO 9001, SOC 2, SOX, FDA"
        },
        {
          "feature": "AI compliance/risk monitoring agent",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Process Street's Cora agent"
        },
        {
          "feature": "SOC 2 Type II certified",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "HIPAA compliant",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Free plan",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Process Street offers a 14-day free trial on Pro instead of a free plan"
        },
        {
          "feature": "Published self-serve pricing",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Process Street's Pro/Startup pricing is not published"
        },
        {
          "feature": "Discounted small-business plan",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Process Street Startup plan for <15 employees, <$2M revenue"
        },
        {
          "feature": "Enterprise custom plan",
          "toolA": "available",
          "toolB": "available",
          "note": "Latenode Embedded iPaaS vs Process Street Enterprise"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Latenode or Process Street cheaper?",
      "answer": "Latenode publishes concrete pricing (free plan, then roughly $10.80/month per 100,000 CPU seconds), while Process Street doesn't publish Pro or Startup pricing publicly, so a direct cost comparison requires contacting Process Street's sales team."
    },
    {
      "question": "Does Process Street have as many app integrations as Latenode?",
      "answer": "The available facts don't document a large external integration marketplace for Process Street; its automation is built around its own Ops module and automation apps, with plan limits like 10 automation apps on Startup, versus Latenode's documented 5,500+ pre-built integrations."
    },
    {
      "question": "Which tool is built for compliance and audits?",
      "answer": "Process Street is purpose-built for compliance operations, with policy and document control mapped to ISO 9001, SOC 2, SOX, and FDA standards plus its Cora AI compliance agent; Latenode is a general automation platform that happens to carry SOC 2 Type II and GDPR compliance itself."
    },
    {
      "question": "Can Latenode generate workflows automatically like Process Street's Process AI?",
      "answer": "That specific capability isn't documented for Latenode; Process Street's Process AI is documented as generating workflows automatically from a text description."
    },
    {
      "question": "Does Latenode require coding knowledge?",
      "answer": "No, Latenode is a visual drag-and-drop builder, but it also supports full custom JavaScript nodes for teams that want to write code for complex logic, which isn't a documented Process Street feature."
    },
    {
      "question": "Is there a free trial for Process Street?",
      "answer": "Yes, the Pro plan includes a 14-day free trial with no credit card required, though Process Street does not offer an ongoing free plan the way Latenode does."
    }
  ]
};

export default latenodeVsProcessStreetContent;
