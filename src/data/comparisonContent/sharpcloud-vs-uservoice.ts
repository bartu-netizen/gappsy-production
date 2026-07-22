import type { ToolComparisonContent } from './types';

const sharpcloudVsUservoiceContent: ToolComparisonContent = {
  "verdict": "SharpCloud and UserVoice are both enterprise decision-support platforms, but they aggregate very different inputs. SharpCloud connects portfolio, project, and risk data from systems like Excel, SharePoint, Microsoft Project, Azure DevOps, and Jira into interactive visualizations (timeline, grid, radar, kanban) for strategic portfolio management. UserVoice aggregates customer feedback from Salesforce, Zendesk, Gainsight, Gong, Slack, Jira, and Azure DevOps and uses AI to weight requests by revenue impact and churn risk. One is about visualizing project/risk portfolios; the other is about prioritizing product decisions from customer signal.",
  "bestForToolA": "SharpCloud fits enterprise and government organizations managing complex project, program, or risk portfolios who need scenario modeling and dependency mapping across systems like Microsoft Project, Azure DevOps, and SQL databases, and who can accommodate its minimum license counts (e.g., minimum 2 Creator licenses, minimum 50 Read-Only licenses).",
  "bestForToolB": "UserVoice fits product and customer success teams that want AI-driven theme detection and revenue-weighted prioritization of feedback pulled from Salesforce, Zendesk, Gainsight, and Gong, and that are comfortable going through a demo-based sales process rather than self-serve signup.",
  "whoNeedsBoth": "A large enterprise could use SharpCloud to visualize its overall project and risk portfolio (drawing on Azure DevOps and Jira data) while separately running UserVoice to prioritize which product initiatives to fund based on revenue-weighted customer feedback — SharpCloud could then visualize those prioritized initiatives as part of its broader portfolio view.",
  "keyDifferences": [
    {
      "title": "Core Use Case",
      "toolA": "SharpCloud is a strategic portfolio management platform for visualizing timelines, grids, radar, and kanban views of projects, risks, and initiatives, with scenario modeling and dependency mapping.",
      "toolB": "UserVoice is a customer intelligence platform that aggregates feedback and uses AI to weight requests by revenue impact, deal size, and retention correlation.",
      "whyItMatters": "The two tools answer different questions: SharpCloud answers 'how does our portfolio of initiatives interconnect,' while UserVoice answers 'which customer requests matter most to revenue.'",
      "benefitsWho": "PMOs and portfolio managers benefit from SharpCloud; product and CS teams benefit from UserVoice."
    },
    {
      "title": "Data Source Integrations",
      "toolA": "SharpCloud syncs from Excel, SharePoint, Microsoft Project, Azure DevOps, Jira, and SQL databases.",
      "toolB": "UserVoice connects Salesforce, Zendesk, Gainsight, Gong, Slack, Jira, and Azure DevOps.",
      "whyItMatters": "Both integrate with Jira and Azure DevOps, but SharpCloud pulls in project-management systems (Microsoft Project, SharePoint, SQL) while UserVoice pulls in CRM and CS systems (Salesforce, Zendesk, Gainsight, Gong).",
      "benefitsWho": "Teams already standardized on Microsoft Project and SharePoint benefit from SharpCloud's integration set; teams standardized on Salesforce and Gainsight benefit from UserVoice's."
    },
    {
      "title": "Deployment Flexibility",
      "toolA": "SharpCloud is available as SaaS on Microsoft Azure (US, UK, EU, and government cloud regions) or as on-premises/private cloud on Windows or Linux/Docker.",
      "toolB": "UserVoice's documented facts do not mention an on-premises or self-hosted deployment option; it appears to be a hosted, demo-onboarded platform.",
      "whyItMatters": "On-premises deployment options matter for organizations with strict data-residency or government-cloud requirements.",
      "benefitsWho": "Government and defense clients with data-sovereignty requirements benefit from SharpCloud's on-prem/private-cloud option."
    },
    {
      "title": "AI Capabilities",
      "toolA": "SharpCloud's documented cons state that no SharpCloud-specific AI features were disclosed on its product page.",
      "toolB": "UserVoice uses AI theme detection to surface trends automatically and AI-driven churn signal detection that it states can flag risk 6-12 months before a customer churns.",
      "whyItMatters": "AI-driven pattern detection changes how much manual analysis a team must do to find actionable signal in large volumes of data.",
      "benefitsWho": "Product and CS teams wanting automated trend and churn-risk surfacing benefit from UserVoice's AI features."
    },
    {
      "title": "Access Model and Pricing Transparency",
      "toolA": "SharpCloud requires contacting sales for all three license tiers (Creator, Collaborator, Read-Only), with minimum license counts per tier (e.g., minimum 50 Read-Only licenses), billed annually.",
      "toolB": "UserVoice also does not publish pricing, but offers a 30-day hands-on trial via a guided demo workspace before committing.",
      "whyItMatters": "Neither tool has self-serve pricing, but the presence or absence of a documented hands-on trial changes how much a buyer can evaluate before a sales conversation.",
      "benefitsWho": "Teams wanting to test functionality before a sales negotiation benefit from UserVoice's documented 30-day trial workspace."
    }
  ],
  "featureMatrix": [
    {
      "group": "Data Integration",
      "rows": [
        {
          "feature": "Jira integration",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Azure DevOps integration",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Microsoft Project / SharePoint sync",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Salesforce / Zendesk / Gainsight / Gong integration",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "SQL database connections",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        }
      ]
    },
    {
      "group": "Analysis & Visualization",
      "rows": [
        {
          "feature": "Timeline / grid / radar / kanban views",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Scenario modeling / what-if analysis",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Dependency mapping",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "AI theme detection",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Revenue-weighted prioritization",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Churn signal detection",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "UserVoice states 6-12 month early warning"
        }
      ]
    },
    {
      "group": "Deployment & Access",
      "rows": [
        {
          "feature": "On-premises / private cloud deployment",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Government cloud region support",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "SSO (SAML 2.0)",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "SharpCloud: Azure AD and Okta"
        },
        {
          "feature": "Published self-serve pricing",
          "toolA": "unavailable",
          "toolB": "unavailable",
          "note": "Both require contacting sales"
        },
        {
          "feature": "Documented hands-on trial",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "UserVoice: 30-day guided demo workspace"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Are SharpCloud and UserVoice direct competitors?",
      "answer": "Not really. SharpCloud is a strategic portfolio management and visualization platform for projects and risk, while UserVoice is a customer feedback intelligence platform for product prioritization. They overlap only in that both are enterprise decision-support tools that integrate with Jira and Azure DevOps."
    },
    {
      "question": "Does either tool publish its pricing?",
      "answer": "No. Both SharpCloud and UserVoice require contacting sales for pricing. SharpCloud has documented minimum license counts per tier (e.g., minimum 50 Read-Only licenses), and UserVoice's pricing is usage-based on feedback volume and integrations."
    },
    {
      "question": "Can SharpCloud or UserVoice be self-hosted?",
      "answer": "SharpCloud can be deployed on-premises or in a private cloud on Windows or Linux/Docker, in addition to SaaS on Microsoft Azure. UserVoice's documented facts do not mention an on-premises option."
    },
    {
      "question": "Which tool has AI features?",
      "answer": "UserVoice includes AI theme detection and AI-driven churn signal detection. SharpCloud's own documented cons state that no SharpCloud-specific AI features are disclosed on its product page."
    },
    {
      "question": "Can I try either product before buying?",
      "answer": "UserVoice documents a 30-day hands-on trial via a guided demo workspace. SharpCloud's documented facts do not mention a similar trial; all three license tiers require contacting sales."
    },
    {
      "question": "What industries use SharpCloud versus UserVoice?",
      "answer": "SharpCloud's stated clients span aerospace and defense, energy, manufacturing, financial services, and government, including Network Rail and the UK Ministry of Defence. UserVoice's documented integrations (Salesforce, Gong, Gainsight) point toward B2B SaaS product and customer success teams rather than government/defense portfolio management."
    }
  ]
};

export default sharpcloudVsUservoiceContent;
