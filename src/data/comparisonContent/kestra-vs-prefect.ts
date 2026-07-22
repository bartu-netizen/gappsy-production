import type { ToolComparisonContent } from './types';

const kestraVsPrefectContent: ToolComparisonContent = {
  "verdict": "Kestra takes a declarative, YAML-based approach to workflow orchestration, avoiding the need for a full programming SDK, but the facts available document very little beyond that core positioning — no pricing plans, community metrics, or deployment details are available. Prefect is Python-native, turning existing functions into orchestrated workflows via a @flow decorator, with a documented free Hobby tier, a large open-source following (40,000+ GitHub stars), and multiple deployment targets. The decision largely comes down to YAML-first versus Python-first workflow definition, and the fact that Prefect's documentation is simply more complete.",
  "bestForToolA": "Teams that prefer defining workflows declaratively in YAML rather than writing orchestration code, and that don't need a documented pricing plan before adopting.",
  "bestForToolB": "Python teams that want to add orchestration to existing functions with a decorator, deploy across Prefect Cloud, their own VPC, Kubernetes, ECS, or serverless, and want a large, active open-source community.",
  "whoNeedsBoth": "Data platform teams standardizing on Python pipelines with Prefect may still use a YAML-based tool like Kestra for simpler, config-driven scheduled or event-driven jobs that don't warrant custom Python code.",
  "keyDifferences": [
    {
      "title": "Workflow definition language",
      "toolA": "Workflows are defined declaratively in YAML rather than a full programming SDK.",
      "toolB": "Uses a @flow decorator to turn existing Python functions into orchestrated workflows, without requiring a new DSL.",
      "whyItMatters": "YAML-based configuration lowers the barrier for non-programmers to define workflows, while a Python decorator keeps everything in familiar application code.",
      "benefitsWho": "Ops-oriented teams that prefer configuration (Kestra) versus Python engineering teams that want orchestration embedded in their codebase (Prefect)."
    },
    {
      "title": "Documented pricing",
      "toolA": "No pricing plans are documented in the facts reviewed.",
      "toolB": "Documents a free Hobby tier on Prefect Cloud (2 users, 1 workspace, 5 deployments, 500 serverless credits/month); pricing for Starter, Team, and Pro Cloud tiers is not published.",
      "whyItMatters": "Even partial documented pricing (a free tier with specific limits) gives buyers a starting point to evaluate cost, which is entirely absent for Kestra in these facts.",
      "benefitsWho": "Teams trying to scope budget before an initial evaluation."
    },
    {
      "title": "Open-source community signal",
      "toolA": "No community or GitHub metrics are documented in the facts reviewed.",
      "toolB": "The open-source core (Apache 2.0 licensed) has 40,000+ GitHub stars.",
      "whyItMatters": "Community size can indicate the availability of community support, plugins, and long-term project health.",
      "benefitsWho": "Teams evaluating open-source project maturity and community support availability."
    },
    {
      "title": "Deployment targets",
      "toolA": "No specific deployment targets are documented beyond the built-in monitoring UI.",
      "toolB": "Explicitly deployable on Prefect Cloud, a team's own VPC, Kubernetes, ECS, or serverless.",
      "whyItMatters": "Documented deployment flexibility signals how easily the tool fits into an existing infrastructure stack.",
      "benefitsWho": "Platform teams that need orchestration to run within a specific existing infrastructure environment."
    }
  ],
  "featureMatrix": [
    {
      "group": "Workflow Model",
      "rows": [
        {
          "feature": "Declarative YAML workflow definitions",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Prefect uses a Python decorator, not YAML."
        },
        {
          "feature": "Python-native decorator API",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Event-driven and scheduled triggers",
          "toolA": "available",
          "toolB": "available",
          "note": "Prefect additionally documents automatic backfills and SLA monitoring."
        },
        {
          "feature": "Built-in workflow monitoring UI",
          "toolA": "available",
          "toolB": "available",
          "note": "Prefect's is described as an observability dashboard."
        }
      ]
    },
    {
      "group": "Pricing & Community",
      "rows": [
        {
          "feature": "Documented free tier",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Prefect Hobby: 2 users, 1 workspace, 5 deployments."
        },
        {
          "feature": "Published paid-tier pricing",
          "toolA": "not-documented",
          "toolB": "not-documented",
          "note": "Prefect explicitly states Starter/Team/Pro pricing isn't published."
        },
        {
          "feature": "Open-source core",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Apache 2.0, 40,000+ GitHub stars."
        }
      ]
    },
    {
      "group": "Deployment",
      "rows": [
        {
          "feature": "Documented multi-target deployment (VPC/K8s/ECS/serverless)",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Are Kestra workflows defined in code?",
      "answer": "No, Kestra workflows are defined declaratively in YAML rather than a full programming SDK."
    },
    {
      "question": "Does Prefect require learning a new workflow language?",
      "answer": "No, Prefect adds orchestration to existing Python functions via a @flow decorator rather than a new DSL."
    },
    {
      "question": "Is Prefect free to use?",
      "answer": "The core Prefect framework is open source, and Prefect Cloud has a free Hobby tier with 2 users, 1 workspace, 5 deployments, and 500 serverless credits per month."
    },
    {
      "question": "Does Kestra publish its pricing plans?",
      "answer": "No pricing plans are documented in the facts reviewed for Kestra."
    },
    {
      "question": "How large is Prefect's open-source community?",
      "answer": "The Prefect framework has 40,000+ GitHub stars and is licensed under Apache 2.0."
    },
    {
      "question": "Has Prefect made any notable acquisitions?",
      "answer": "Per Prefect's own site, Prefect acquired Dagster Labs in July 2026."
    }
  ]
};

export default kestraVsPrefectContent;
