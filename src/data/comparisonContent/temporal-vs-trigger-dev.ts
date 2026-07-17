import type { ToolComparisonContent } from './types';

const temporalVsTriggerDevContent: ToolComparisonContent = {
  "verdict": "Temporal is a general-purpose durable execution platform with 7-language SDK support, open-source self-hosting, and production use cited at Uber, DoorDash, and Cloudflare, but its managed cloud starts at $100/month. Trigger.dev is a TypeScript-first platform purpose-built for background jobs and AI agent tasks (with human-in-the-loop approval and realtime LLM streaming), offering a free tier and a $10/month Hobby plan, but without a documented self-hosted option or the same multi-language breadth. Language ecosystem and workload type — not one tool simply being 'better' — should drive the choice.",
  "bestForToolA": "Teams needing durable workflow execution across multiple languages (Python, Go, TypeScript, Ruby, C#, Java, PHP), or that want the option to self-host an open-source, MIT-licensed platform instead of paying for managed cloud.",
  "bestForToolB": "TypeScript/JavaScript teams building AI agent workflows with tool-calling, human-in-the-loop approval, and realtime response streaming, who want to start on a free tier or a $10/month plan before scaling usage-based compute.",
  "whoNeedsBoth": "Organizations with polyglot backend services may run Temporal for core durable business workflows while using Trigger.dev specifically for TypeScript-based AI agent tasks that need realtime streaming to a frontend.",
  "keyDifferences": [
    {
      "title": "Language support",
      "toolA": "Provides SDKs for Python, Go, TypeScript, Ruby, C#, Java, and PHP.",
      "toolB": "Built for TypeScript/JavaScript, with Python support available only via a build extension.",
      "whyItMatters": "Broader native language support matters for organizations with polyglot services; a TypeScript-first tool is a natural fit for JS/TS-centric teams.",
      "benefitsWho": "Polyglot engineering organizations (Temporal) versus TypeScript/JavaScript-focused teams (Trigger.dev)."
    },
    {
      "title": "Entry pricing",
      "toolA": "Managed Temporal Cloud starts at $100/month (Essentials plan, including 1M actions and 1GB active storage).",
      "toolB": "Has a Free plan ($0/month with $5/month in credits) and a Hobby plan at $10/month, both with usage-based compute charged per second of execution.",
      "whyItMatters": "A much lower (or free) entry price lowers the barrier for smaller teams or side projects to start using the platform.",
      "benefitsWho": "Individual developers and small teams evaluating background job infrastructure on a limited budget."
    },
    {
      "title": "AI agent-specific tooling",
      "toolA": "No AI-agent-specific feature is documented; the platform focuses on general durable workflow and activity execution.",
      "toolB": "Explicitly supports building tool-calling AI agents with human-in-the-loop approval steps, plus realtime streaming of LLM responses and task status to frontends.",
      "whyItMatters": "Purpose-built AI agent features (approval steps, realtime streaming) reduce the custom code needed to build agent-driven products.",
      "benefitsWho": "Teams building user-facing AI agent products that need approval workflows and live status updates."
    },
    {
      "title": "Self-hosting",
      "toolA": "Open source (MIT-licensed) with a self-hosted option available for free with community support, in addition to managed cloud.",
      "toolB": "No self-hosted option is documented in the facts reviewed.",
      "whyItMatters": "Self-hosting avoids per-action cloud billing and gives full infrastructure control, at the cost of operating the system yourself.",
      "benefitsWho": "Teams with the operational capacity to run their own infrastructure and a preference for avoiding vendor lock-in."
    },
    {
      "title": "Production-scale validation",
      "toolA": "Cited as used in production by large engineering organizations including Uber, DoorDash, and Cloudflare.",
      "toolB": "Cited as working across many frameworks (Next.js, Remix, Bun, SvelteKit, Astro, and more) rather than naming large-scale production users.",
      "whyItMatters": "Named large-scale production users can serve as a proof point for reliability at high volume.",
      "benefitsWho": "Enterprise buyers looking for evidence of at-scale production reliability."
    }
  ],
  "featureMatrix": [
    {
      "group": "Workflow Execution",
      "rows": [
        {
          "feature": "Automatic retries",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Durable, long-running execution",
          "toolA": "available",
          "toolB": "available",
          "note": "Trigger.dev: durable cron scheduling without timeout limits."
        },
        {
          "feature": "Replay and recovery of workflow state",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Human-in-the-loop AI agent approval steps",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Languages & Extensibility",
      "rows": [
        {
          "feature": "Multi-language SDKs",
          "toolA": "available",
          "toolB": "limited",
          "note": "Temporal: 7 languages. Trigger.dev: TypeScript/JavaScript native, Python via extension."
        },
        {
          "feature": "Build/framework extensions (Python, Puppeteer, FFmpeg, etc.)",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Deployment & Pricing",
      "rows": [
        {
          "feature": "Self-hosted option",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Free managed tier",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Trigger.dev Free plan: $5/month credits, 20 concurrent runs."
        },
        {
          "feature": "Entry managed cloud price",
          "toolA": "available",
          "toolB": "available",
          "note": "Temporal: $100/month. Trigger.dev: $0-$10/month."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Temporal open source?",
      "answer": "Yes, Temporal is MIT-licensed and open source, and can be self-hosted for free with community support."
    },
    {
      "question": "What is Temporal Cloud's starting price?",
      "answer": "The Essentials plan starts at $100/month, including 1M actions and 1GB of active storage."
    },
    {
      "question": "Does Trigger.dev have a free plan?",
      "answer": "Yes, the Free plan includes $5/month in credits, 20 concurrent runs, and unlimited tasks."
    },
    {
      "question": "How is Trigger.dev priced?",
      "answer": "Plans start at $10/month (Hobby) and $50/month (Pro), plus usage-based compute charged per second of execution."
    },
    {
      "question": "Can Trigger.dev build AI agents?",
      "answer": "Yes, it supports tool-calling AI agents with human-in-the-loop approval and realtime streaming of responses."
    },
    {
      "question": "What programming languages does each platform support?",
      "answer": "Temporal provides SDKs for Python, Go, TypeScript, Ruby, C#, Java, and PHP. Trigger.dev is built for TypeScript/JavaScript, with Python available via a build extension."
    }
  ]
};

export default temporalVsTriggerDevContent;
