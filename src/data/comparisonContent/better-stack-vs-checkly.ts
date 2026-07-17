import type { ToolComparisonContent } from './types';

const betterStackVsChecklyContent: ToolComparisonContent = {
  "verdict": "Better Stack bundles logs, metrics, tracing, uptime monitoring, and RUM into one observability platform with AI-driven root-cause analysis and post-mortem generation, but its pricing spreads across usage-based telemetry bundles and per-responder incident licenses. Checkly is narrower — synthetic, browser, and uptime monitoring defined as code via CLI, Terraform, or Pulumi — with a simpler tiered pricing ladder and startup/nonprofit discounts. The right pick depends on whether you need full-stack observability or code-native synthetic monitoring.",
  "bestForToolA": "Teams that want logs, metrics, tracing, and uptime monitoring consolidated in one platform with AI-assisted root-cause analysis and automated post-mortems, and that are comfortable with usage-based telemetry pricing.",
  "bestForToolB": "Engineering teams that manage monitoring as code (via CLI, Terraform, or Pulumi) and want a simpler, check-count-based pricing ladder, especially startups or nonprofits eligible for Checkly's discounts.",
  "whoNeedsBoth": "Teams already running a separate log/metrics pipeline may adopt Checkly specifically for infrastructure-as-code synthetic and browser checks, while relying on Better Stack (or an equivalent) for the broader logs/traces/RUM observability layer.",
  "keyDifferences": [
    {
      "title": "Monitoring as code",
      "toolA": "Not documented as a distinct capability in the facts reviewed.",
      "toolB": "Checks can be deployed via CLI, Terraform, or Pulumi using typed resources like ApiCheck and BrowserCheck.",
      "whyItMatters": "Defining monitors in version-controlled code lets teams review, test, and deploy monitoring changes the same way they manage infrastructure.",
      "benefitsWho": "Engineering teams already using Terraform/Pulumi for infrastructure who want monitoring to follow the same workflow."
    },
    {
      "title": "Observability breadth",
      "toolA": "Bundles logs, metrics, distributed tracing (with eBPF-based service maps), uptime monitoring, and real user monitoring with session replay in one platform.",
      "toolB": "Focused on uptime, browser/synthetic, and heartbeat monitoring; no log management, metrics, or tracing product is documented.",
      "whyItMatters": "A single platform covering logs, traces, and monitoring reduces the number of tools a team has to correlate during an incident.",
      "benefitsWho": "Teams wanting one observability vendor instead of stitching together separate log, tracing, and monitoring tools."
    },
    {
      "title": "AI-assisted incident response",
      "toolA": "AI SRE feature provides AI-driven root cause analysis and automated post-mortem generation.",
      "toolB": "AI root cause analysis feature helps trace the cause of detected issues.",
      "whyItMatters": "Automated post-mortem generation goes a step further than root-cause tracing by producing incident documentation, saving manual write-up time.",
      "benefitsWho": "On-call teams that want to reduce time spent on both diagnosis and post-incident documentation."
    },
    {
      "title": "Pricing structure",
      "toolA": "Scales through separate telemetry bundles (Nano $25-$105/month up to Tera $420-$1,750/month) plus per-responder incident management pricing.",
      "toolB": "Scales through check-count tiers: Hobby (free), Starter $24/month, Team $64/month, Enterprise (custom).",
      "whyItMatters": "A single-axis pricing ladder is easier to forecast than multiple usage-based add-ons across different products.",
      "benefitsWho": "Budget-conscious teams and finance stakeholders who need predictable monthly costs."
    },
    {
      "title": "Startup and nonprofit discounts",
      "toolA": "Not documented in the facts reviewed.",
      "toolB": "30% discount for startups under 2 years old and 50% for nonprofits.",
      "whyItMatters": "Explicit discount programs materially lower cost for early-stage or mission-driven organizations.",
      "benefitsWho": "Early-stage startups and nonprofit organizations with limited monitoring budgets."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Monitoring",
      "rows": [
        {
          "feature": "Uptime monitoring",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Browser/synthetic monitoring",
          "toolA": "available",
          "toolB": "available",
          "note": "Checkly uses Playwright to simulate real user flows."
        },
        {
          "feature": "Heartbeat monitoring",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Log management",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Distributed tracing",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Real user monitoring / session replay",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Monitoring as Code & AI",
      "rows": [
        {
          "feature": "CLI / Terraform / Pulumi deployment",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "AI root cause analysis",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Automated post-mortem generation",
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
          "toolB": "available",
          "note": "Better Stack: 10 monitors, 1 status page, 100k exceptions/mo. Checkly Hobby: 10 uptime monitors, 1,000 browser checks/mo."
        },
        {
          "feature": "Startup/nonprofit discounts",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Money-back guarantee",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Better Stack: 60-day guarantee."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Better Stack have a free plan?",
      "answer": "Yes, a free plan is available with 10 monitors/heartbeats, 1 status page, and 100,000 exceptions per month."
    },
    {
      "question": "Is Checkly free to start?",
      "answer": "Yes, the Hobby plan is free with 10 uptime monitors, 1,000 browser checks/month, and 10,000 API checks/month, no credit card required."
    },
    {
      "question": "Can Checkly monitoring be defined as code?",
      "answer": "Yes, via its CLI and Terraform or Pulumi providers using typed check resources like ApiCheck and BrowserCheck."
    },
    {
      "question": "Does Better Stack include logs and tracing, not just uptime checks?",
      "answer": "Yes, Better Stack's observability stack includes log management, metrics, and distributed tracing with eBPF-based service maps, in addition to uptime monitoring."
    },
    {
      "question": "Do either offer AI-assisted incident analysis?",
      "answer": "Both do. Better Stack's AI SRE provides AI-driven root cause analysis plus automated post-mortem generation; Checkly's AI feature helps trace the cause of detected issues."
    },
    {
      "question": "Are there discounts for startups or nonprofits?",
      "answer": "Checkly offers a 30% discount for startups under 2 years old and 50% for nonprofits. No equivalent discount is documented for Better Stack."
    }
  ]
};

export default betterStackVsChecklyContent;
