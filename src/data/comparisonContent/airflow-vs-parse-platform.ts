import type { ToolComparisonContent } from './types';

const airflowVsParsePlatformContent: ToolComparisonContent = {
  "verdict": "Airflow orchestrates and schedules data/workflow pipelines defined as Python code; Parse Platform is a backend-as-a-service for building applications, with data storage, APIs, auth, and push notifications. One runs scheduled jobs, the other serves an app's runtime backend, so they occupy different layers of a typical stack.",
  "bestForToolA": "Data/engineering teams needing to programmatically author, schedule, and monitor multi-step pipelines with automatic retries and failure alerting, defined as Python DAGs.",
  "bestForToolB": "App developers who need a ready-made backend — auto-generated REST/GraphQL APIs, real-time Live Queries, user auth, and push notifications — without writing pipeline orchestration code.",
  "whoNeedsBoth": "A team could use Airflow to run nightly ETL jobs that populate the MongoDB or PostgreSQL database backing a Parse Server app, keeping the app's data fresh via scheduled pipelines.",
  "keyDifferences": [
    {
      "title": "Primary Function",
      "toolA": "Authors, schedules, and monitors workflows/pipelines defined as Python DAGs.",
      "toolB": "Serves application data via auto-generated REST/GraphQL APIs.",
      "whyItMatters": "Determines whether you need a job scheduler or an app backend.",
      "benefitsWho": "Data engineers rely on Airflow; app developers rely on Parse Platform."
    },
    {
      "title": "Governance & Backing",
      "toolA": "Backed by the Apache Software Foundation's dedicated security team and sponsorship program, with a large community holding regular in-person meetups.",
      "toolB": "Governed by the parse-community organization, with 21.4k+ GitHub stars and 4.8k forks, relying on community and Open Collective sponsorship.",
      "whyItMatters": "Signals the long-term maintenance model and support channels behind each project.",
      "benefitsWho": "Enterprises vetting project governance and security posture."
    },
    {
      "title": "Learning Curve",
      "toolA": "Steeper learning curve since pipelines are defined in Python code as DAGs.",
      "toolB": "APIs are auto-generated from data classes, requiring less custom coding to get a backend running.",
      "whyItMatters": "Affects time-to-productivity for teams without dedicated data engineers.",
      "benefitsWho": "Small teams or solo developers wanting a fast backend benefit from Parse; data teams comfortable writing Python pipelines benefit from Airflow."
    },
    {
      "title": "Real-Time Capability",
      "toolA": "Designed for scheduled/triggered batch workflow execution, not documented as providing real-time client data sync.",
      "toolB": "Offers Live Queries for real-time data synchronization to connected clients.",
      "whyItMatters": "Real-time app features like chat or live dashboards need Parse-style live queries, not a batch scheduler.",
      "benefitsWho": "Teams building real-time-facing apps."
    },
    {
      "title": "Deployment Targets",
      "toolA": "Facts don't document a specific list of supported deployment targets beyond being open source and Python-based.",
      "toolB": "Documents deployment to Docker, Heroku, AWS Elastic Beanstalk, Google App Engine, Azure, and DigitalOcean.",
      "whyItMatters": "Parse Platform gives explicit portability guidance for hosting, useful when comparing deployment options.",
      "benefitsWho": "Teams evaluating where they can host their backend without additional research."
    }
  ],
  "featureMatrix": [
    {
      "group": "Licensing & Deployment",
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
          "feature": "Self-hosted deployment",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Documented cloud deployment targets",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Docker, Heroku, AWS EB, GCP App Engine, Azure, DigitalOcean"
        }
      ]
    },
    {
      "group": "Workflow & Pipeline Orchestration",
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
          "feature": "Custom backend logic execution",
          "toolA": "available",
          "toolB": "available",
          "note": "Airflow: Python tasks; Parse: Cloud Code"
        },
        {
          "feature": "Scheduled/triggered job execution",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Application Backend Services",
      "rows": [
        {
          "feature": "Auto-generated REST/GraphQL APIs",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Real-time data sync (Live Queries)",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Built-in user authentication",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Push notifications",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Pluggable file storage",
          "toolA": "unavailable",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Airflow a replacement for Parse Platform?",
      "answer": "No — Airflow schedules and orchestrates workflows/pipelines, while Parse Platform is an application backend with APIs, real-time queries, and auth; they solve different problems."
    },
    {
      "question": "Are both tools free?",
      "answer": "Yes — Airflow is a free, open-source Apache Software Foundation project, and Parse Platform is free and open source under the Apache-2.0 license."
    },
    {
      "question": "Which tool has real-time data sync?",
      "answer": "Parse Platform, via its Live Queries feature that pushes real-time updates to connected clients. Airflow's documented features focus on scheduled pipeline execution rather than real-time client sync."
    },
    {
      "question": "How are workflows defined in each tool?",
      "answer": "Airflow pipelines are written as Python code structured into Directed Acyclic Graphs (DAGs) with explicit task dependencies. Parse Platform's backend logic runs through Cloud Code rather than DAG-based pipelines."
    },
    {
      "question": "What database options does Parse Platform support that Airflow doesn't provide?",
      "answer": "Parse Platform supports MongoDB and PostgreSQL (with PostGIS) as its backing application database; Airflow does not document a built-in application database of its own."
    },
    {
      "question": "Which has a steeper learning curve?",
      "answer": "Airflow, according to its own documented cons, since pipelines require writing Python DAG code rather than using auto-generated APIs."
    }
  ]
};

export default airflowVsParsePlatformContent;
