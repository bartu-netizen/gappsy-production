import type { ToolComparisonContent } from './types';

const inngestVsMockoonContent: ToolComparisonContent = {
  "verdict": "Inngest and Mockoon solve different problems in the backend development lifecycle: Inngest is a durable execution platform for running reliable background jobs, workflows, and AI agents inside application code, while Mockoon is a free, open-source desktop tool for designing and running mock REST APIs to develop and test against before a real backend exists. They aren't direct competitors; the comparison mainly matters for teams evaluating their broader toolchain of developer infrastructure products.",
  "bestForToolA": "Developers building reliable background jobs, event-driven workflows, or AI agent pipelines who want step-level tracing and replay, starting free with 50k executions/month on the Hobby plan and scaling to the $99/month Pro plan.",
  "bestForToolB": "Frontend and API developers who need to design, run, and iterate on mock REST APIs locally without any backend or cloud account, using the free open-source desktop app, CLI, or Docker image.",
  "whoNeedsBoth": "A team building a new product could use Mockoon to mock out REST API endpoints while the frontend is developed in parallel, then use Inngest to power the actual backend's durable background jobs and AI agent workflows once the real API is built, making the two tools complementary at sequential stages of the same project rather than competitors.",
  "keyDifferences": [
    {
      "title": "Core Function",
      "toolA": "Inngest is a durable execution platform for running reliable background jobs, event-driven workflows, and AI agents embedded in application code.",
      "toolB": "Mockoon is a desktop tool for designing and running mock REST APIs locally for frontend and API development and testing.",
      "whyItMatters": "These solve fundamentally different problems, so the right choice depends entirely on whether the need is backend job execution or API mocking.",
      "benefitsWho": "Backend engineers building workflows benefit from Inngest; frontend and QA engineers testing against unbuilt APIs benefit from Mockoon."
    },
    {
      "title": "Integration Model",
      "toolA": "Inngest embeds via SDK into existing app code (Next.js, Node.js, Python) and runs as a managed execution layer.",
      "toolB": "Mockoon runs as a standalone desktop app for Windows, macOS, and Linux with no required account, plus CLI and Docker support for headless use.",
      "whyItMatters": "SDK-embedded tools require code integration, while standalone apps can be adopted without touching the production codebase.",
      "benefitsWho": "Teams wanting to add durable execution without new infrastructure benefit from Inngest's SDK model; teams wanting a zero-integration local tool benefit from Mockoon's desktop app."
    },
    {
      "title": "Pricing Structure",
      "toolA": "Inngest's paid Pro plan ($99/month) scales with usage: executions, concurrency, and data ingested.",
      "toolB": "Mockoon's paid Team plan ($100/month billed annually) is a flat price for cloud deployment and team collaboration rather than usage-based.",
      "whyItMatters": "Usage-based pricing can grow with scale, while flat team pricing is more predictable regardless of usage volume.",
      "benefitsWho": "Teams with variable, growing execution volume should budget for Inngest's usage-based scaling; teams wanting predictable costs benefit from Mockoon's flat Team pricing."
    },
    {
      "title": "Free Tier Depth",
      "toolA": "Inngest's free Hobby plan includes 50k executions and 500k events ingested per month with no credit card required.",
      "toolB": "Mockoon's entire core product, desktop app, CLI, and Docker, is free and open source with no account required, with only cloud collaboration behind a paywall.",
      "whyItMatters": "The scope of what's free differs: Inngest's free tier has usage caps, while Mockoon's core functionality has no caps at all.",
      "benefitsWho": "Solo developers and small teams get more unrestricted free usage from Mockoon's fully free core app."
    },
    {
      "title": "Compliance and Enterprise Readiness",
      "toolA": "Inngest is SOC 2 Type II compliant with a HIPAA BAA available for regulated industries.",
      "toolB": "Mockoon's compliance posture isn't documented beyond its privacy-friendly, offline-first design; its Enterprise tier offers a 99.9% availability SLA and custom payment options.",
      "whyItMatters": "Regulated industries (healthcare, finance) often require documented compliance certifications before adopting a tool for production workflows.",
      "benefitsWho": "Healthcare and regulated-industry teams needing HIPAA compliance benefit from Inngest's documented BAA availability."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Capability",
      "rows": [
        {
          "feature": "Durable workflow/job execution",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "AI agent observability (tracing/replay)",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Mock REST API design & running",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Request recording (capture live API traffic)",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "OpenAPI import/export",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Collaboration & Deployment",
      "rows": [
        {
          "feature": "SDK-based code integration",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Inngest: Next.js, Node.js, Python"
        },
        {
          "feature": "CLI/Docker support",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Cloud team collaboration",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Mockoon Cloud Team plan: $100/month"
        },
        {
          "feature": "No account required to start",
          "toolA": "available",
          "toolB": "available",
          "note": "Both offer no-card-required free entry points"
        }
      ]
    },
    {
      "group": "Pricing & Compliance",
      "rows": [
        {
          "feature": "Free tier",
          "toolA": "available",
          "toolB": "available",
          "note": "Inngest: 50k executions/500k events; Mockoon: full free open-source app"
        },
        {
          "feature": "Paid starting price",
          "toolA": "available",
          "toolB": "available",
          "note": "Inngest Pro: $99/month; Mockoon Team: $100/month billed annually"
        },
        {
          "feature": "SOC 2 Type II compliance",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "HIPAA BAA available",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "What is Inngest actually used for?",
      "answer": "Inngest is a durable execution platform for building reliable workflows, AI agents, and background jobs directly in application code, with step-level retries and observability."
    },
    {
      "question": "What is Mockoon used for?",
      "answer": "Mockoon is a free, open-source desktop app for designing and running mock REST APIs locally, useful for frontend development and API testing before a real backend exists."
    },
    {
      "question": "Are both tools free to start?",
      "answer": "Yes. Inngest's Hobby plan offers 50k executions and 500k events per month with no credit card required, and Mockoon's entire desktop app, CLI, and Docker image are free and open source with no account needed."
    },
    {
      "question": "How does paid pricing compare?",
      "answer": "Inngest's Pro plan starts at $99/month and scales with usage (executions, concurrency, data ingested). Mockoon's Team plan is a flat $100/month billed annually for cloud collaboration."
    },
    {
      "question": "Is Inngest compliant with healthcare regulations?",
      "answer": "Yes, Inngest is SOC 2 Type II compliant with a HIPAA BAA available. This isn't documented for Mockoon."
    },
    {
      "question": "Can Mockoon record real API traffic to build mocks?",
      "answer": "Yes, Mockoon's Requests Recording feature captures real HTTP requests from a live API and replays them to quickly build mocks."
    }
  ]
};

export default inngestVsMockoonContent;
