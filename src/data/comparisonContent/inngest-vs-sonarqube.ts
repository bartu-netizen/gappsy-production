import type { ToolComparisonContent } from './types';

const inngestVsSonarqubeContent: ToolComparisonContent = {
  "verdict": "Inngest and SonarQube both sit in the developer tooling space but address unrelated problems: Inngest is a durable execution platform for building reliable workflows, background jobs, and AI agents directly in application code, while SonarQube is an automated code review platform for catching bugs, security vulnerabilities, and quality issues before code merges. Inngest runs your code reliably; SonarQube checks whether your code is written safely and well.",
  "bestForToolA": "Engineering teams building asynchronous workflows, background jobs, or AI agents that need durable step-level retries, flow control, and observability, embedded via SDK into Next.js, Node.js, or Python apps — companies like Replit and ElevenLabs are cited users.",
  "bestForToolB": "Engineering teams that want automated code review integrated into CI/CD to catch bugs, security vulnerabilities, and technical debt across 40+ languages, used by organizations like Adobe, Nvidia, and NASA.",
  "whoNeedsBoth": "A team building AI agents or background job pipelines with Inngest would still want SonarQube scanning the same codebase in CI to catch security vulnerabilities and quality issues in that code — the two operate at different layers (runtime execution vs. static review) and don't overlap in function.",
  "keyDifferences": [
    {
      "title": "Core Function",
      "toolA": "Inngest provides durable execution: steps retry independently from their failure point without restarting the entire run, plus rate limiting and per-tenant concurrency controls.",
      "toolB": "SonarQube performs automated code review, detecting security vulnerabilities, bugs, and technical debt through static analysis integrated into development workflows.",
      "whyItMatters": "These solve entirely different problems — one is about runtime reliability of workflows, the other is about code quality before it ships.",
      "benefitsWho": "Teams should map their actual need (workflow reliability vs. code quality) to the right tool rather than treating them as alternatives."
    },
    {
      "title": "Free Tier Depth",
      "toolA": "Inngest's free Hobby plan includes 50k executions, 5 concurrent executions, and 500k events ingested per month with no credit card required.",
      "toolB": "SonarQube's free tier covers private projects up to 50,000 lines of code, plus a free SonarQube for IDE extension.",
      "whyItMatters": "Both offer genuinely usable free tiers, but the limiting factor differs: Inngest caps by execution volume, SonarQube caps by codebase size.",
      "benefitsWho": "Small teams and solo developers evaluating either tool can do meaningful work before hitting a paywall."
    },
    {
      "title": "AI-Specific Capabilities",
      "toolA": "Inngest includes agent observability with step-level tracing, replay functionality, and evaluation metrics specifically for AI agents and workflows.",
      "toolB": "SonarQube includes AI Code Assurance to validate AI-generated code for security and quality before merging, plus AI CodeFix for one-click LLM-suggested remediations.",
      "whyItMatters": "Both have adapted to the rise of AI-generated code and AI agents, but from opposite ends: Inngest observes AI agents while they run, SonarQube reviews AI-written code before it's merged.",
      "benefitsWho": "Teams building AI agents need Inngest's observability; teams accepting AI-generated code contributions need SonarQube's assurance layer."
    },
    {
      "title": "Compliance Certifications",
      "toolA": "Inngest is SOC 2 Type II compliant, with a HIPAA BAA available for regulated industries.",
      "toolB": "SonarQube's Enterprise plan adds compliance reporting for standards like OWASP, CWE, and PCI DSS, plus audit logs and SSO/SCIM.",
      "whyItMatters": "Both address compliance, but Inngest's certification covers its own infrastructure while SonarQube's Enterprise features help prove compliance of the code it scans.",
      "benefitsWho": "Regulated industries (healthcare via Inngest's HIPAA BAA, or finance via SonarQube's PCI DSS reporting) need to check which compliance angle applies to their use case."
    },
    {
      "title": "Pricing Model at Scale",
      "toolA": "Inngest's Pro plan starts at $99/month and scales with usage (executions, concurrency, data ingested), which can raise costs at higher volume.",
      "toolB": "SonarQube's Team plan starts at $34/month, recommended for teams under 50 developers, with Enterprise moving to custom pricing for unlimited users and projects.",
      "whyItMatters": "Inngest's usage-based scaling means costs grow with workflow volume, while SonarQube's team-based scaling means costs grow with headcount — different cost drivers to model.",
      "benefitsWho": "High-volume workflow teams should model Inngest's usage-based costs carefully; growing engineering orgs should model SonarQube's per-team pricing."
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
          "feature": "Automated static code review",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Security vulnerability detection in code",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "SDK-based embedding into app code",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Next.js, Node.js, Python"
        }
      ]
    },
    {
      "group": "AI Features",
      "rows": [
        {
          "feature": "AI agent observability/tracing",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "AI-generated code validation",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "SonarQube's AI Code Assurance"
        },
        {
          "feature": "One-click AI fix suggestions",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "SonarQube's AI CodeFix"
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
          "note": "Inngest: 50k executions/mo; SonarQube: 50k lines of code"
        },
        {
          "feature": "Entry paid price",
          "toolA": "available",
          "toolB": "available",
          "note": "Inngest Pro $99/mo; SonarQube Team $34/mo"
        },
        {
          "feature": "SOC 2 Type II",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "HIPAA BAA",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "PCI DSS / OWASP compliance reporting",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "SonarQube Enterprise"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Are Inngest and SonarQube competitors?",
      "answer": "No, they serve unrelated purposes. Inngest is a durable execution platform for running workflows, background jobs, and AI agents reliably. SonarQube is an automated code review platform for catching bugs and vulnerabilities before merge."
    },
    {
      "question": "Which tool has a better free plan?",
      "answer": "Both have genuinely usable free tiers. Inngest's free Hobby plan includes 50k executions and 500k events ingested per month with no credit card required. SonarQube's free tier covers private projects up to 50,000 lines of code plus a free IDE extension."
    },
    {
      "question": "Does either tool handle AI-generated code specifically?",
      "answer": "Yes, both do, differently. SonarQube's AI Code Assurance validates AI-generated code for security and quality before merging, and AI CodeFix suggests one-click fixes. Inngest's agent observability provides step-level tracing and replay for debugging AI agents at runtime."
    },
    {
      "question": "How much do the paid plans cost?",
      "answer": "Inngest's Pro plan starts at $99/month and scales with usage. SonarQube's Team plan starts at $34/month for teams under 50 developers. Both offer custom Enterprise pricing above that."
    },
    {
      "question": "Is Inngest or SonarQube SOC 2 compliant?",
      "answer": "Inngest is SOC 2 Type II compliant with a HIPAA BAA available for regulated industries. SonarQube's Enterprise plan instead focuses on compliance reporting (OWASP, CWE, PCI DSS) for the code it scans, rather than stating its own SOC 2 status."
    },
    {
      "question": "Would a development team need both tools?",
      "answer": "Yes, they're complementary rather than competing. A team could use Inngest to reliably run background jobs and AI agents while using SonarQube to scan the same codebase in CI/CD for security and quality issues."
    }
  ]
};

export default inngestVsSonarqubeContent;
