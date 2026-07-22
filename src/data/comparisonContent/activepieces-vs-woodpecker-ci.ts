import type { ToolComparisonContent } from './types';

const activepiecesVsWoodpeckerCiContent: ToolComparisonContent = {
  "verdict": "activepieces and Woodpecker CI solve different problems - activepieces is a workflow-automation platform for connecting apps and building automations across HR, finance, marketing, and sales, while Woodpecker CI is a Docker-native continuous integration and delivery engine for running build and deployment pipelines defined in YAML. Both support self-hosting, but they serve entirely different teams: operations and business users versus software engineering teams running build pipelines.",
  "bestForToolA": "Non-engineering teams (HR, finance, marketing, sales) and IT teams building cross-app automations, with usage-based pricing at $5 per active flow/month and a large 'pieces' integration library including Gmail.",
  "bestForToolB": "Engineering teams needing a free-forever, Apache 2.0-licensed CI/CD engine that runs each pipeline step in an isolated Docker container, defined via YAML files in a .woodpecker/ directory.",
  "whoNeedsBoth": "A software company might use Woodpecker CI to run its build, test, and deploy pipelines on every code push, while its operations team separately uses activepieces to automate business processes like routing new-hire paperwork or syncing CRM leads - two unrelated automation needs within the same organization.",
  "keyDifferences": [
    {
      "title": "Core Use Case",
      "toolA": "General workflow and business-process automation across departments via prebuilt integrations ('pieces') like Gmail.",
      "toolB": "Software build and deploy pipeline automation, running steps as isolated Docker containers triggered by events like code pushes.",
      "whyItMatters": "Choosing the wrong category tool means missing purpose-built functionality entirely; neither substitutes for the other.",
      "benefitsWho": "Benefits buyers who need to correctly identify whether their need is business-process automation or CI/CD."
    },
    {
      "title": "Pricing Model",
      "toolA": "Usage-based at $5 per active flow/month on the Standard plan (or a custom Ultimate annual contract), with '$0 per execution' once a flow is active.",
      "toolB": "Entirely free, Apache 2.0 licensed, self-hosted only, with no paid tier documented.",
      "whyItMatters": "activepieces has an ongoing cost tied to active flows, while Woodpecker has zero licensing cost by design.",
      "benefitsWho": "Benefits budget-conscious engineering teams choosing Woodpecker's free model versus teams needing activepieces' managed cloud convenience."
    },
    {
      "title": "Hosting Options",
      "toolA": "Offers both cloud-hosted and self-hosted deployment.",
      "toolB": "Self-hosted only, with no official hosted or cloud offering documented.",
      "whyItMatters": "Teams that don't want to manage their own infrastructure need a vendor-hosted option, which only activepieces provides.",
      "benefitsWho": "Benefits teams without dedicated DevOps capacity who prefer activepieces' cloud option."
    },
    {
      "title": "Configuration Method",
      "toolA": "Built around prebuilt integrations and pieces for connecting apps to automations.",
      "toolB": "Pipelines are explicitly defined as YAML files with steps, Docker images, commands, and event triggers.",
      "whyItMatters": "YAML-based configuration suits engineers comfortable with code-as-config, while integration-based building suits non-technical automation builders.",
      "benefitsWho": "Benefits developers with Woodpecker's YAML approach versus operations and business users with activepieces' integration approach."
    },
    {
      "title": "Governance for Larger Organizations",
      "toolA": "Includes documented enterprise governance controls for larger organizations.",
      "toolB": "No enterprise governance features are documented; it's a lightweight, community-driven open-source project.",
      "whyItMatters": "Large organizations needing centralized admin controls over automations need this built in.",
      "benefitsWho": "Benefits enterprise IT teams managing many automations across an organization."
    }
  ],
  "featureMatrix": [
    {
      "group": "Deployment",
      "rows": [
        {
          "feature": "Self-hosted deployment",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Vendor-hosted cloud option",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Docker-native step execution",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Each pipeline step runs in a container"
        }
      ]
    },
    {
      "group": "Automation & Configuration",
      "rows": [
        {
          "feature": "Prebuilt app integrations / plugins",
          "toolA": "available",
          "toolB": "available",
          "note": "activepieces 'pieces' e.g. Gmail; Woodpecker plugins as Docker images e.g. woodpeckerci/plugin-s3"
        },
        {
          "feature": "YAML-based pipeline configuration",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Multiple dependent workflows",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Secret injection/management",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "from_secret in step settings"
        }
      ]
    },
    {
      "group": "Pricing & Licensing",
      "rows": [
        {
          "feature": "Free-forever tier",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "activepieces starts at $5/active flow/month"
        },
        {
          "feature": "Custom enterprise pricing tier",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "activepieces Ultimate plan"
        },
        {
          "feature": "Enterprise governance controls",
          "toolA": "available",
          "toolB": "unavailable"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Are activepieces and Woodpecker CI direct competitors?",
      "answer": "No - activepieces is a business-process workflow automation platform, while Woodpecker CI is a software CI/CD pipeline engine; they serve different jobs and are often used by different teams within the same company."
    },
    {
      "question": "Is Woodpecker CI free?",
      "answer": "Yes, Woodpecker CI is fully open source under Apache 2.0 and the project states it will remain free forever; there is no paid tier."
    },
    {
      "question": "Does activepieces have a free plan?",
      "answer": "A usage-based Standard plan at $5 per active flow/month and a custom Ultimate plan are documented; no free tier is documented."
    },
    {
      "question": "Can Woodpecker CI be used in the cloud?",
      "answer": "No official hosted cloud offering is documented - Woodpecker is designed to be self-hosted, unlike activepieces, which offers both cloud-hosted and self-hosted deployment."
    },
    {
      "question": "Which tool uses YAML configuration?",
      "answer": "Woodpecker CI pipelines are defined as YAML files in a .woodpecker/ directory; activepieces is positioned around prebuilt integrations rather than YAML pipelines."
    }
  ]
};

export default activepiecesVsWoodpeckerCiContent;
