import type { ToolComparisonContent } from './types';

const airflowVsHugoContent: ToolComparisonContent = {
  "verdict": "Airflow schedules and orchestrates data/task pipelines; Hugo generates static websites from content and templates. They're unrelated categories — one is a job scheduler, the other a site-building tool — but both are free, open-source, code-first developer tools with a documented learning curve.",
  "bestForToolA": "Data/engineering teams needing to author, schedule, and monitor multi-step pipelines as Python DAGs with automatic retries.",
  "bestForToolB": "Developers and content teams wanting to build fast static websites, such as blogs, docs, or marketing sites, with multilingual support and no database or server runtime required.",
  "whoNeedsBoth": "A team could use Airflow to run a scheduled pipeline that pulls fresh content, such as from a CMS or API, and triggers a Hugo rebuild and deploy of a static site whenever new content is published.",
  "keyDifferences": [
    {
      "title": "Core Function",
      "toolA": "Authors, schedules, and monitors workflows as Python DAGs.",
      "toolB": "Generates static HTML sites from Markdown content and templates, with no database or server runtime required.",
      "whyItMatters": "Entirely different jobs — pipeline execution versus site generation.",
      "benefitsWho": "Data engineers rely on Airflow; web developers and content publishers rely on Hugo."
    },
    {
      "title": "Language & Runtime",
      "toolA": "Pipelines are written in Python.",
      "toolB": "Written in Go, known specifically for very fast site builds, rendering large sites in seconds per the project's own performance claims.",
      "whyItMatters": "Language choice affects team skill requirements and each tool's core performance characteristic.",
      "benefitsWho": "Python-fluent data teams benefit from Airflow; teams wanting build speed for large static sites benefit from Hugo."
    },
    {
      "title": "Output Type",
      "toolA": "Produces no direct output artifact of its own — it triggers and monitors tasks against external systems.",
      "toolB": "Outputs static files (HTML, assets) that require no database or server-side runtime once built.",
      "whyItMatters": "Hugo's output can be hosted on any static file host, while Airflow requires ongoing infrastructure to run its scheduler and workers.",
      "benefitsWho": "Teams wanting minimal hosting complexity for a website benefit from Hugo."
    },
    {
      "title": "Content Authoring / Learning Curve",
      "toolA": "Has a steeper learning curve than drag-and-drop workflow builders since pipelines are defined in Python code.",
      "toolB": "Has no built-in visual editor — content is authored via templates, Markdown, and the command line, and its templating language has a steeper learning curve than simpler generators.",
      "whyItMatters": "Both tools trade ease-of-entry for developer-level control and power.",
      "benefitsWho": "Technical teams comfortable with code-first tooling over both pipelines and content."
    },
    {
      "title": "Ecosystem Size",
      "toolA": "Facts note a large community with regular in-person meetups but don't give a specific star count.",
      "toolB": "Has 89,000+ GitHub stars with an active community.",
      "whyItMatters": "Community size and activity affect how easy it is to find help, plugins, and long-term support.",
      "benefitsWho": "Teams weighing ecosystem maturity before adopting either tool."
    }
  ],
  "featureMatrix": [
    {
      "group": "Licensing & Output",
      "rows": [
        {
          "feature": "Open source",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Free to use",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Managed/hosted offering",
          "toolA": "not-documented",
          "toolB": "unavailable",
          "note": "Hugo requires self-hosting or a static hosting provider"
        },
        {
          "feature": "Output requires no database/server runtime",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Workflow Orchestration",
      "rows": [
        {
          "feature": "DAG-based pipeline authoring",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Automatic retries & failure alerting",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Scheduled/triggered execution",
          "toolA": "available",
          "toolB": "unavailable"
        }
      ]
    },
    {
      "group": "Site Generation & Content",
      "rows": [
        {
          "feature": "Static site generation",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Built-in asset pipeline (images, JS bundling, Sass/Tailwind)",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Multilingual site support",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Built-in local dev server with live preview",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Taxonomy system (categories/tags)",
          "toolA": "unavailable",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Hugo a workflow tool like Airflow?",
      "answer": "No — Hugo is a static site generator that builds websites from Markdown and templates; Airflow is a workflow orchestration engine for scheduling and monitoring pipelines. They don't overlap in function."
    },
    {
      "question": "Are both tools free?",
      "answer": "Yes — Airflow is a free Apache Software Foundation project, and Hugo is free and open source under the Apache 2.0 license."
    },
    {
      "question": "What language is each written in?",
      "answer": "Airflow pipelines are written in Python; Hugo itself is written in Go, which the project credits for its fast build performance."
    },
    {
      "question": "Does Hugo require a database?",
      "answer": "No — Hugo generates static files with no database or server-side runtime required."
    },
    {
      "question": "Could Airflow trigger a Hugo site rebuild?",
      "answer": "The facts don't document a specific built-in integration, but since Airflow can run arbitrary Python tasks against external systems and Hugo is a command-line-driven build tool, using Airflow to schedule a Hugo build is architecturally plausible even though it isn't described as an official pairing."
    },
    {
      "question": "Does Hugo include a visual content editor?",
      "answer": "No — per its documented cons, there's no built-in visual editor; content is authored via templates, Markdown, and the command line."
    }
  ]
};

export default airflowVsHugoContent;
