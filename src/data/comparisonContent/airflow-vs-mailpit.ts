import type { ToolComparisonContent } from './types';

const airflowVsMailpitContent: ToolComparisonContent = {
  "verdict": "Airflow orchestrates production workflows and pipelines; Mailpit is a developer tool for capturing and inspecting outgoing email during local development and testing, explicitly not meant for production mail delivery. They operate at different phases of the software lifecycle — production orchestration versus development-time testing.",
  "bestForToolA": "Data/engineering teams needing to schedule and monitor production pipelines as Python DAGs with automatic retries.",
  "bestForToolB": "Developers who want to capture and inspect outgoing test email locally — checking HTML/CSS rendering, spam scores, and links — without accidentally sending real mail during development.",
  "whoNeedsBoth": "A team could run Airflow pipelines in a staging environment configured to route any outbound notification email through Mailpit for inspection before those pipelines are promoted to production with a real mail provider.",
  "keyDifferences": [
    {
      "title": "Intended Use Case",
      "toolA": "Built for production-grade scheduling and monitoring of data workflows.",
      "toolB": "Explicitly intended for email testing during development, not production mail delivery.",
      "whyItMatters": "Using either tool outside its intended phase — e.g., Mailpit in production — would be a misuse per the tool's own documented purpose.",
      "benefitsWho": "Dev teams benefit from Mailpit; data/platform teams running production jobs benefit from Airflow."
    },
    {
      "title": "Deployment Footprint",
      "toolA": "A Python-based platform requiring DAG authoring and infrastructure to run the scheduler/workers.",
      "toolB": "Ships as a single binary with zero external dependencies, making it simple to deploy for local or CI testing.",
      "whyItMatters": "Mailpit's low-friction setup suits ephemeral test environments, while Airflow's setup suits persistent production infrastructure.",
      "benefitsWho": "Developers wanting a quick local test tool benefit from Mailpit; platform teams standing up durable pipeline infrastructure benefit from Airflow."
    },
    {
      "title": "Quality/Failure Checks",
      "toolA": "Automatically retries failed tasks and triggers alerts for pipeline failures.",
      "toolB": "Checks captured email against HTML/CSS client-compatibility rules, validates links, generates rendering screenshots, and integrates with SpamAssassin for spam-score testing.",
      "whyItMatters": "These are different kinds of \"quality checks\" — pipeline reliability versus email rendering and deliverability quality.",
      "benefitsWho": "Data engineers benefit from Airflow's retries; developers validating email templates before launch benefit from Mailpit."
    },
    {
      "title": "API Access",
      "toolA": "Documents Python-native integrations for connecting to data sources rather than a testing-focused REST API.",
      "toolB": "Provides a REST API for programmatic access to captured messages, useful for test automation.",
      "whyItMatters": "Both support automation, but Mailpit's API is scoped to inspecting test email while Airflow's integration surface is scoped to pipeline data connectivity.",
      "benefitsWho": "QA/test-automation engineers benefit from Mailpit; data engineers wiring up pipelines benefit from Airflow."
    },
    {
      "title": "Protocol Support",
      "toolA": "Does not document any email-protocol support, since it is not a mail tool.",
      "toolB": "Exposes captured mail over POP3 in addition to its web UI and SMTP server.",
      "whyItMatters": "Mailpit's protocol breadth is specific to its email-testing niche and irrelevant to Airflow's orchestration use case.",
      "benefitsWho": "Developers needing to test POP3-based email clients specifically."
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
          "feature": "Single-binary deployment",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Official pricing/support tiers",
          "toolA": "not-documented",
          "toolB": "unavailable",
          "note": "Mailpit is community-supported only"
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
          "feature": "Python-native integrations",
          "toolA": "available",
          "toolB": "unavailable"
        }
      ]
    },
    {
      "group": "Email Testing & Inspection",
      "rows": [
        {
          "feature": "SMTP capture for local testing",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "HTML/CSS compatibility checking",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Spam-score testing (SpamAssassin)",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "REST API for captured messages",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "POP3 server access",
          "toolA": "unavailable",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Can Mailpit be used for production email delivery?",
      "answer": "No — Mailpit's own documentation states it's intended for email testing during development, not production mail delivery; a dedicated mail delivery service would be needed for that, not Mailpit."
    },
    {
      "question": "Are both tools free?",
      "answer": "Yes — Airflow is a free Apache Software Foundation project, and Mailpit is free and open source under the MIT license."
    },
    {
      "question": "What does Mailpit check besides capturing email?",
      "answer": "It checks HTML/CSS client compatibility, validates links, generates rendering screenshots, and integrates with SpamAssassin for spam-score testing."
    },
    {
      "question": "How is Mailpit deployed compared to Airflow?",
      "answer": "Mailpit ships as a single binary with zero external dependencies, while Airflow requires a Python environment and infrastructure to run its scheduler and workers."
    },
    {
      "question": "Does Mailpit offer paid support plans?",
      "answer": "No — its facts note there are no official pricing/support tiers; it's community-supported only."
    },
    {
      "question": "Can Airflow send the emails that Mailpit would test?",
      "answer": "Airflow's documented features focus on pipeline scheduling and Python-based integrations rather than being an email delivery system itself, so a separate mail tool would still be required, with Mailpit useful for testing against it during development."
    }
  ]
};

export default airflowVsMailpitContent;
