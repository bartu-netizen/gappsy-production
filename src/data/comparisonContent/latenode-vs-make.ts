import type { ToolComparisonContent } from './types';

const latenodeVsMakeContent: ToolComparisonContent = {
  "verdict": "Latenode and Make are both visual automation platforms connecting apps and data, but they differ in pricing model, integration count, and AI positioning. Latenode combines 5,500+ integrations with 1,200+ AI models and custom JavaScript nodes on usage-based CPU-second billing, explicitly positioned as lower-cost than Zapier, Make, and n8n. Make (formerly Integromat, founded 2012, acquired by Celonis in 2020) is a mature flowchart-style automation platform with thousands of integrations, routers and branching logic, and tiered plans from a free operations allowance up to $29/month Teams plans and custom Enterprise pricing.",
  "bestForToolA": "Latenode fits teams that want the largest integration count (5,500+), built-in access to 1,200+ AI models without separate API keys, and full custom JavaScript flexibility, particularly cost-sensitive teams comparing against Make on price.",
  "bestForToolB": "Make fits teams that want a mature, well-documented visual scenario builder with routers, iterators, aggregators, detailed execution logs, and a large library of scenario templates, especially teams already comparing it directly against Zapier's more linear workflow style.",
  "whoNeedsBoth": "There is no strong case for running both as primary automation platforms simultaneously, since they overlap heavily in purpose; a team might trial both on their free plans to compare execution reliability and integration coverage for their specific app stack before standardizing on one.",
  "keyDifferences": [
    {
      "title": "Pricing Structure",
      "toolA": "Latenode uses CPU-second usage billing, e.g. approximately $10.80/month per 100,000 CPU seconds on Pay-as-You-Go, positioned as lower-cost than Make.",
      "toolB": "Make uses tiered plans with monthly operations/credit allowances: Free ($0), Core (from ~$9/month), Pro (from ~$16/month), and Teams (from ~$29/month) or custom Enterprise pricing, all billed annually for the stated rates.",
      "whyItMatters": "CPU-second billing versus tiered operations-credit billing produces different cost curves depending on workflow complexity and execution frequency.",
      "benefitsWho": "Teams running lean, infrequent automations may find Latenode's usage billing cheaper; teams wanting predictable flat monthly costs may prefer Make's tiered plans."
    },
    {
      "title": "Integration Count",
      "toolA": "Latenode documents 5,500+ integrations spanning platforms like Salesforce, HubSpot, Slack, Notion, and Shopify.",
      "toolB": "Make documents 'thousands' of app integrations via pre-built modules, plus generic HTTP request and webhook modules for anything without a native connector.",
      "whyItMatters": "A larger native integration catalog reduces the need for custom HTTP/webhook workarounds when connecting niche or newer apps.",
      "benefitsWho": "Teams needing broad native app coverage benefit from Latenode's larger documented integration count."
    },
    {
      "title": "AI Model Access",
      "toolA": "Latenode bundles access to 1,200+ AI models and apps (including GPT-4o, Claude, and Gemini) directly, without requiring separate API keys, and supports multi-agent AI architectures.",
      "toolB": "Make includes AI modules and agent building blocks that incorporate LLM steps directly into automation workflows.",
      "whyItMatters": "Bundled AI model access without separate API key management simplifies billing and setup for AI-driven automations.",
      "benefitsWho": "Teams building AI-heavy workflows across multiple models benefit from Latenode's bundled model access approach."
    },
    {
      "title": "Maturity and Company Background",
      "toolA": "Latenode is legally registered as Nocode LTD with limited public company background information documented.",
      "toolB": "Make was founded in 2012 as Integromat, acquired by Celonis in 2020, and rebranded as Make in 2022, giving it a well-documented company history and longer market presence.",
      "whyItMatters": "A longer, better-documented operating history can matter for risk-averse buyers evaluating platform stability and vendor longevity.",
      "benefitsWho": "Enterprise buyers doing vendor due diligence may weigh Make's documented decade-plus history and Celonis backing more heavily than Latenode's less-documented corporate background."
    },
    {
      "title": "Enterprise Security Inclusion",
      "toolA": "Latenode includes SOC 2 Type II, GDPR compliance, SSO, and RBAC on all plans, not just top tiers.",
      "toolB": "Make's Enterprise tier specifically adds SSO, SCIM, and audit logs, implying these are not included on lower tiers like Free, Core, or Pro.",
      "whyItMatters": "Whether SSO and audit logging are available on entry-level plans or gated to Enterprise affects which tier a security-conscious small team must purchase.",
      "benefitsWho": "Smaller teams needing SSO without an Enterprise contract benefit from Latenode's all-plan security inclusion."
    }
  ],
  "featureMatrix": [
    {
      "group": "Automation Builder",
      "rows": [
        {
          "feature": "Visual drag-and-drop canvas",
          "toolA": "available",
          "toolB": "available",
          "note": "Make's flowchart-style scenario builder"
        },
        {
          "feature": "Routers / branching logic",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Custom code nodes (JavaScript)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Error handling and retries",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Scenario/workflow templates",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "AI & Integrations",
      "rows": [
        {
          "feature": "Number of app integrations",
          "toolA": "available",
          "toolB": "available",
          "note": "Latenode: 5,500+; Make: 'thousands' plus HTTP/webhook modules"
        },
        {
          "feature": "Bundled AI model access",
          "toolA": "available",
          "toolB": "available",
          "note": "Latenode: 1,200+ models without separate API keys; Make: AI modules/agents"
        },
        {
          "feature": "Custom API / webhook modules",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Pricing & Security",
      "rows": [
        {
          "feature": "Free plan",
          "toolA": "available",
          "toolB": "available",
          "note": "Latenode: 10,000 CPU seconds/5 workflows; Make: limited operations allowance"
        },
        {
          "feature": "Published entry paid pricing",
          "toolA": "available",
          "toolB": "available",
          "note": "Latenode ~$10.80/mo per 100k CPU seconds; Make Core from ~$9/mo"
        },
        {
          "feature": "SSO on all plans",
          "toolA": "available",
          "toolB": "limited",
          "note": "Make appears to gate SSO to Enterprise"
        },
        {
          "feature": "Managed implementation service",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Latenode Managed Service from $199/month"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Latenode cheaper than Make?",
      "answer": "Latenode is explicitly positioned as lower-cost than Make, using CPU-second usage billing (about $10.80/month per 100,000 CPU seconds) versus Make's tiered plans starting around $9/month for Core, but which is actually cheaper depends on your specific usage volume."
    },
    {
      "question": "Does Latenode have more integrations than Make?",
      "answer": "Latenode documents 5,500+ integrations, a specific figure, while Make's facts describe 'thousands' of integrations plus generic HTTP and webhook modules for anything without a native connector."
    },
    {
      "question": "Which platform has a longer track record?",
      "answer": "Make has the longer documented history, founded in 2012 as Integromat, acquired by Celonis in 2020, and rebranded as Make in 2022; Latenode's public company background information is more limited, registered as Nocode LTD."
    },
    {
      "question": "Do both platforms include SSO on all plans?",
      "answer": "Latenode includes SSO and RBAC on all plans, while Make appears to reserve SSO, SCIM, and audit logs for its Enterprise tier based on the documented plan features."
    },
    {
      "question": "Can I write custom code in either platform?",
      "answer": "Latenode explicitly supports full custom JavaScript code inside workflow nodes; Make's documented data tools are transformation-focused (iterators, aggregators, functions) without a documented general-purpose custom code node."
    },
    {
      "question": "Does Make include AI features like Latenode?",
      "answer": "Yes, Make includes AI modules and agent building blocks for incorporating LLM steps into workflows, similar in spirit to Latenode's 1,200+ AI models and apps, though Latenode documents a specific bundled model count and multi-agent orchestration support."
    }
  ]
};

export default latenodeVsMakeContent;
