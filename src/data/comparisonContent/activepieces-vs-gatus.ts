import type { ToolComparisonContent } from './types';

const activepiecesVsGatusContent: ToolComparisonContent = {
  "verdict": "Activepieces automates business workflows across SaaS apps for operations teams, priced per active flow. Gatus is a free, open-source health-check and status-page dashboard for monitoring HTTP, ICMP, TCP, and DNS endpoints, with an optional paid hosted version at Gatus.io. These address different domains — business process automation versus uptime/service health monitoring — so they're rarely direct alternatives.",
  "bestForToolA": "Business teams wanting to automate SaaS-app workflows, paying per active flow starting at $5/month.",
  "bestForToolB": "Developers and SRE teams wanting a free, lightweight, configuration-file-driven uptime dashboard with 30+ alerting integrations including Slack, Teams, PagerDuty, Discord, and Opsgenie, licensed under Apache 2.0 with 11.5k GitHub stars.",
  "whoNeedsBoth": "A team could run Gatus to monitor uptime for the SaaS apps and internal services it depends on, then use Activepieces' Gmail-based \"pieces\" integration for a separate business notification workflow when something needs escalating — though no native Gatus-to-Activepieces integration is documented.",
  "keyDifferences": [
    {
      "title": "Category",
      "toolA": "Business workflow automation.",
      "toolB": "Health-check and uptime monitoring dashboard.",
      "whyItMatters": "These solve unrelated operational problems for different audiences.",
      "benefitsWho": "Clarifies category fit for buyers researching either tool."
    },
    {
      "title": "Pricing",
      "toolA": "Paid from $5/active flow/month (Standard), with a custom-priced Ultimate plan.",
      "toolB": "Self-hosted Gatus is free (Apache 2.0); a separate paid hosted Gatus.io plan exists but its pricing isn't fully published.",
      "whyItMatters": "Gatus lets self-hosting teams start at zero cost, unlike Activepieces.",
      "benefitsWho": "Budget-limited SRE/dev teams benefit from Gatus's free self-hosted tier."
    },
    {
      "title": "Alerting Breadth",
      "toolA": "Integrates via its \"pieces\" library, such as Gmail, for workflow steps rather than incident alerting specifically.",
      "toolB": "Documents 30+ named alerting integrations, including Slack, Teams, PagerDuty, Discord, Opsgenie, and custom webhooks.",
      "whyItMatters": "Teams needing rapid incident alerting depend on Gatus's dedicated, broad alerting integration list.",
      "benefitsWho": "On-call engineering teams benefit from Gatus's extensive alerting integration coverage."
    },
    {
      "title": "Configuration Model",
      "toolA": "No configuration-file-driven model is documented; Activepieces appears to be UI-centric based on the facts available.",
      "toolB": "Documented as \"primarily configuration-file driven, which may require YAML familiarity,\" per its listed cons.",
      "whyItMatters": "Config-file-driven tools favor engineers comfortable with YAML over business users needing a visual builder.",
      "benefitsWho": "Engineering-led teams comfortable with YAML benefit from Gatus's config-driven approach."
    },
    {
      "title": "Resource Footprint",
      "toolA": "No resource-footprint characteristics are documented in the facts available.",
      "toolB": "Explicitly designed for \"low resource usage\" when self-hosted.",
      "whyItMatters": "Teams running on constrained infrastructure (edge devices, small VMs) care about a tool's resource footprint.",
      "benefitsWho": "Teams self-hosting on minimal infrastructure benefit from Gatus's low-resource design."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Purpose",
      "rows": [
        {
          "feature": "Business/SaaS workflow automation",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Uptime/health-check monitoring",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Status page generation",
          "toolA": "unavailable",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Pricing & Licensing",
      "rows": [
        {
          "feature": "Free self-hosted tier",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Apache 2.0"
        },
        {
          "feature": "Published entry pricing",
          "toolA": "available",
          "toolB": "limited",
          "note": "Gatus.io hosted pricing not fully published"
        },
        {
          "feature": "Managed/hosted option",
          "toolA": "available",
          "toolB": "available",
          "note": "Gatus.io"
        }
      ]
    },
    {
      "group": "Alerting & Deployment",
      "rows": [
        {
          "feature": "Alerting integrations",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "30+, including Slack, PagerDuty, Discord"
        },
        {
          "feature": "Docker/Kubernetes deployment",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Docker, Helm chart"
        },
        {
          "feature": "Prebuilt SaaS app integrations",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "\"pieces\" e.g. Gmail"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Gatus free?",
      "answer": "Yes, self-hosted Gatus is free and open source under Apache 2.0; a paid hosted version is also available at Gatus.io."
    },
    {
      "question": "Is Activepieces free?",
      "answer": "No, it's paid starting at $5 per active flow/month."
    },
    {
      "question": "What alerting integrations does Gatus support?",
      "answer": "30+ providers including Slack, Teams, PagerDuty, Discord, Opsgenie, and custom webhooks."
    },
    {
      "question": "How is Gatus deployed?",
      "answer": "Via Docker, Kubernetes with Helm, or as a standalone binary when self-hosting."
    },
    {
      "question": "Can Gatus be used for status pages?",
      "answer": "Yes, it functions as a developer-oriented status page and health dashboard."
    },
    {
      "question": "Does Activepieces monitor uptime like Gatus?",
      "answer": "No — the facts don't document any health-check or uptime-monitoring capability for Activepieces; it's a SaaS workflow automation tool."
    }
  ]
};

export default activepiecesVsGatusContent;
