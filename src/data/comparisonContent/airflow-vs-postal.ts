import type { ToolComparisonContent } from './types';

const airflowVsPostalContent: ToolComparisonContent = {
  "verdict": "Airflow orchestrates scheduled data/workflow pipelines; Postal is a self-hosted transactional email delivery server built as an alternative to SendGrid or Mailgun. One runs jobs, the other sends and receives mail — different roles in an application's infrastructure.",
  "bestForToolA": "Teams needing to programmatically schedule, retry, and monitor multi-step data or business workflows as Python DAGs.",
  "bestForToolB": "Teams wanting to self-host transactional and bulk email sending and receiving on their own infrastructure as a free, MIT-licensed alternative to SendGrid or Mailgun.",
  "whoNeedsBoth": "A team could use Airflow to orchestrate a nightly pipeline that generates a report and then triggers Postal to send it via SMTP, combining scheduled data processing with self-hosted mail delivery.",
  "keyDifferences": [
    {
      "title": "Core Purpose",
      "toolA": "A workflow orchestration/scheduling engine for pipelines.",
      "toolB": "An SMTP relay and mail delivery platform for sending and receiving transactional email.",
      "whyItMatters": "These are non-competing categories addressing different infrastructure needs.",
      "benefitsWho": "Teams scoping exactly which infrastructure gap each tool fills."
    },
    {
      "title": "Licensing & Backing",
      "toolA": "Backed by the Apache Software Foundation, with a large community holding regular in-person meetups.",
      "toolB": "MIT licensed with 16.7k GitHub stars and regular releases (latest v3.3.7), but no foundation backing documented.",
      "whyItMatters": "Affects governance and long-term support expectations.",
      "benefitsWho": "Enterprises assessing project sustainability."
    },
    {
      "title": "Failure Handling",
      "toolA": "Automatically retries failed tasks and triggers alerts.",
      "toolB": "Provides webhooks that trigger events for message delivery, bounces, and other mail events for integration with other systems.",
      "whyItMatters": "Both offer failure/event visibility, but through different mechanisms — task retries versus delivery event webhooks.",
      "benefitsWho": "Ops teams building monitoring/alerting around either pipelines or mail delivery."
    },
    {
      "title": "Deployment Complexity",
      "toolA": "Pipelines are Python code, with a steeper learning curve than drag-and-drop tools.",
      "toolB": "Deployed via Docker containers, requiring self-managed server infrastructure plus Ruby, with deliverability depending on the operator's own IP reputation and DNS setup.",
      "whyItMatters": "Both require real infrastructure and technical setup, but the operational risks differ — Airflow's complexity is in pipeline code, Postal's is in mail deliverability management.",
      "benefitsWho": "Infra teams budgeting setup time for either tool."
    },
    {
      "title": "Managed Hosting",
      "toolA": "Facts don't document an official managed/hosted version.",
      "toolB": "Explicitly has \"no official first-party hosted/managed version.\"",
      "whyItMatters": "Teams wanting either capability without server management will need a different commercial product.",
      "benefitsWho": "Teams weighing self-hosting effort against buying a SaaS alternative."
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
          "feature": "Docker-based installation",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Managed/hosted version",
          "toolA": "not-documented",
          "toolB": "unavailable"
        }
      ]
    },
    {
      "group": "Workflow & Automation",
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
          "feature": "Webhooks for event integration",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Email Delivery",
      "rows": [
        {
          "feature": "SMTP relay / outbound sending",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Inbound email handling",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Web-based mail management UI",
          "toolA": "unavailable",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Postal a substitute for Airflow?",
      "answer": "No — Postal sends and receives transactional email from your own infrastructure, while Airflow schedules and orchestrates workflows; they address unrelated infrastructure needs."
    },
    {
      "question": "Are both free and open source?",
      "answer": "Yes — Airflow is a free Apache Software Foundation project, and Postal is free and open source under the MIT license."
    },
    {
      "question": "What does Postal replace?",
      "answer": "It's designed as a self-hosted alternative to commercial email services like SendGrid or Mailgun."
    },
    {
      "question": "How does each tool handle failures?",
      "answer": "Airflow automatically retries failed tasks and triggers alerts; Postal provides webhooks for delivery and bounce events so failures can be handled by other integrated systems."
    },
    {
      "question": "Does either tool offer managed hosting?",
      "answer": "No — Postal's facts explicitly note there's no official first-party hosted/managed version, and Airflow's facts don't document one either; both require self-hosting."
    },
    {
      "question": "What's required to run Postal?",
      "answer": "Self-managed server infrastructure, Docker, and Ruby, with deliverability depending on your own IP reputation and DNS configuration."
    }
  ]
};

export default airflowVsPostalContent;
