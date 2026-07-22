import type { GroupComparisonContent } from './types';

const claudeVsDeepseekVsGrokContent: GroupComparisonContent = {
  "verdict": "Claude, DeepSeek, and Grok take three distinct approaches to general-purpose AI assistance: Claude emphasizes safety-focused development, strong coding and agentic workflows through Claude Code, and enterprise-grade compliance; DeepSeek delivers competitive reasoning performance at dramatically lower API cost with open-weight models; and Grok layers real-time X data and rapid model iteration onto a more irreverent assistant. The right pick depends on whether coding depth and enterprise controls, price-to-performance, or real-time social context matters most.",
  "bestFor": {
    "claude": "Developers and enterprises that need strong coding and agentic capabilities (via Claude Code) alongside enterprise compliance features like SSO, SCIM, and audit logs.",
    "deepseek": "Cost-sensitive developers and teams that want frontier-level reasoning and coding performance at a fraction of the price, with the option to self-host open-weight models.",
    "grok": "Users who want an AI assistant with live access to X's real-time conversation feed and a faster-moving model release cadence."
  },
  "highlights": [
    {
      "title": "Purpose-built coding agent",
      "description": "Claude Code gives Claude a dedicated agentic coding tool that can read, edit, and run code across a codebase from a terminal or IDE, a capability DeepSeek and Grok do not offer as a named product.",
      "toolSlugs": [
        "claude"
      ]
    },
    {
      "title": "Lowest-cost path to capable models",
      "description": "DeepSeek-V3 and DeepSeek-R1 are priced well below Claude and Grok on a per-token basis and ship as open weights, letting teams self-host instead of paying per-seat subscriptions.",
      "toolSlugs": [
        "deepseek"
      ]
    },
    {
      "title": "Live access to public conversation",
      "description": "Grok's native integration with X's post feed gives it real-time awareness of breaking news and trending discussion that Claude and DeepSeek must retrieve through separate web search tools.",
      "toolSlugs": [
        "grok"
      ]
    },
    {
      "title": "Enterprise compliance depth",
      "description": "Claude's Enterprise plan adds SCIM provisioning, audit logs, role-based access control, configurable data retention, and HIPAA-ready options, a compliance stack more built-out than what DeepSeek or Grok document.",
      "toolSlugs": [
        "claude"
      ]
    },
    {
      "title": "Rapid model release cadence",
      "description": "Grok has shipped multiple flagship model generations (Grok 3, Grok 4, Grok 4.5) in quick succession, funded by some of the largest capital raises in AI industry history.",
      "toolSlugs": [
        "grok"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core assistant capabilities",
      "rows": [
        {
          "feature": "Conversational chat assistant",
          "statuses": {
            "claude": "available",
            "deepseek": "available",
            "grok": "available"
          }
        },
        {
          "feature": "Persistent memory across sessions",
          "statuses": {
            "claude": "available",
            "deepseek": "not-documented",
            "grok": "not-documented"
          }
        },
        {
          "feature": "Web search integration",
          "statuses": {
            "claude": "available",
            "deepseek": "available",
            "grok": "not-documented"
          },
          "note": "Grok's differentiator is live X data rather than a documented general web search feature."
        }
      ]
    },
    {
      "group": "Development and openness",
      "rows": [
        {
          "feature": "Dedicated agentic coding tool",
          "statuses": {
            "claude": "available",
            "deepseek": "unavailable",
            "grok": "unavailable"
          }
        },
        {
          "feature": "Open-weight / self-hostable models",
          "statuses": {
            "claude": "unavailable",
            "deepseek": "available",
            "grok": "unavailable"
          }
        },
        {
          "feature": "Developer API",
          "statuses": {
            "claude": "available",
            "deepseek": "available",
            "grok": "available"
          }
        }
      ]
    },
    {
      "group": "Enterprise and access",
      "rows": [
        {
          "feature": "SSO / SCIM enterprise administration",
          "statuses": {
            "claude": "available",
            "deepseek": "not-documented",
            "grok": "not-documented"
          }
        },
        {
          "feature": "Mobile apps (iOS and Android)",
          "statuses": {
            "claude": "available",
            "deepseek": "available",
            "grok": "available"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is cheaper, Claude, DeepSeek, or Grok?",
      "answer": "DeepSeek is by far the cheapest, with a free chat app and API pricing well under a cent per thousand tokens. Claude's Pro plan starts at $17/month billed annually, and Grok's standalone SuperGrok Lite starts at $10/month, with X Premium bundling in basic Grok access from $8/month."
    },
    {
      "question": "Which tool is best for software development?",
      "answer": "Claude stands out for coding through Claude Code, a dedicated agentic tool that reads, edits, and runs code across a codebase from a terminal or IDE. DeepSeek also benchmarks strongly on coding relative to its low cost, while Grok offers general-purpose code writing and debugging without a named coding-agent product."
    },
    {
      "question": "Can I self-host any of these models instead of using the hosted chat app?",
      "answer": "DeepSeek releases DeepSeek-V3 and DeepSeek-R1 with open weights, so they can be downloaded and run on private infrastructure. Claude and Grok are closed, hosted-only products with no self-hosting option."
    },
    {
      "question": "Does Claude offer stronger enterprise controls than DeepSeek or Grok?",
      "answer": "Yes. Claude's Enterprise plan documents SCIM provisioning, audit logs, role-based access control, configurable data retention, and HIPAA-ready options. DeepSeek and Grok do not publish a comparable enterprise compliance feature set."
    },
    {
      "question": "What makes Grok different from Claude and DeepSeek?",
      "answer": "Grok's native integration with X's live post feed gives it real-time visibility into breaking news and public conversation, plus a faster, more irreverent conversational style, differentiators that come from its tight integration with the X platform rather than from raw model benchmarks."
    }
  ]
};

export default claudeVsDeepseekVsGrokContent;
