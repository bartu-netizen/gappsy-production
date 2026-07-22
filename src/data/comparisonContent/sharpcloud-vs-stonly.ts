import type { ToolComparisonContent } from './types';

const sharpcloudVsStonlyContent: ToolComparisonContent = {
  "verdict": "SharpCloud is an enterprise strategic portfolio management platform that connects existing data sources like Excel, SharePoint, Microsoft Project, Azure DevOps, and Jira into interactive visual decision views such as timelines, grids, and dependency maps for large organizations. Stonly is a knowledge management and customer self-service platform built around interactive step-by-step guides, a conversational AI bot, and an Agent Assist tool for support teams. They serve fundamentally different needs, portfolio and project decision-making at enterprise scale versus customer-facing and support-agent knowledge delivery, so the comparison is more about product category fit than a head-to-head choice.",
  "bestForToolA": "SharpCloud fits enterprise and government organizations like Network Rail or the UK Ministry of Defence that need to visualize interconnected portfolio, project, and risk data pulled from systems like Excel, SharePoint, Azure DevOps, and Jira.",
  "bestForToolB": "Stonly fits support and customer-success teams that want interactive step-by-step guides plus an AI bot with a reported 92% response accuracy and Agent Assist to reduce ticket volume, integrating with help desks like Zendesk and Freshdesk.",
  "whoNeedsBoth": "A large enterprise could use SharpCloud internally to visualize and manage its strategic project and risk portfolio while its customer support organization separately uses Stonly to power self-service guides and agent assistance — different departments solving unrelated problems within the same company.",
  "keyDifferences": [
    {
      "title": "Product Category",
      "toolA": "SharpCloud is a strategic portfolio management platform for visualizing project, risk, and initiative data.",
      "toolB": "Stonly is a knowledge management platform for interactive customer guides and support-agent assistance.",
      "whyItMatters": "These solve different jobs, so the right choice depends entirely on whether the need is portfolio visualization or customer/support knowledge delivery.",
      "benefitsWho": "Strategy and PMO teams benefit from SharpCloud; support and CX teams benefit from Stonly."
    },
    {
      "title": "Pricing Accessibility",
      "toolA": "SharpCloud's Creator, Collaborator, and Read-Only license tiers all require contacting sales, with minimum license counts such as a minimum of 50 Read-Only licenses.",
      "toolB": "Stonly offers a free Basic plan with 400 monthly guide views, 5 guides, and 1 team member, accessible after a 14-day Small Business trial without ongoing payment.",
      "whyItMatters": "A free entry tier lets small teams start immediately, while enterprise-only licensing requires a sales process regardless of team size.",
      "benefitsWho": "Small teams and individual evaluators benefit from Stonly's free Basic plan; large organizations with existing procurement processes are unaffected by SharpCloud's sales-only model."
    },
    {
      "title": "AI Features",
      "toolA": "SharpCloud's product page does not disclose any AI-specific features.",
      "toolB": "Stonly includes a Conversational AI Bot with a reported 92% response accuracy and an Agent Assist tool that summarizes tickets and drafts responses for support agents.",
      "whyItMatters": "AI-driven self-service can materially cut support ticket volume and resolution time.",
      "benefitsWho": "Support teams wanting to automate first-line responses benefit from Stonly's AI bot and Agent Assist."
    },
    {
      "title": "Deployment Flexibility",
      "toolA": "SharpCloud is available as SaaS on Microsoft Azure across US, UK, EU, and government cloud regions, or on-premises/private cloud on Windows or Linux/Docker.",
      "toolB": "Stonly's deployment model is not documented beyond being a hosted platform.",
      "whyItMatters": "On-premises deployment matters for organizations with strict data-residency or government compliance requirements.",
      "benefitsWho": "Government and regulated-industry customers benefit from SharpCloud's on-premises and government-cloud options."
    },
    {
      "title": "Integration Targets",
      "toolA": "SharpCloud syncs with enterprise systems like Excel, SharePoint, Microsoft Project, Azure DevOps, and Jira.",
      "toolB": "Stonly integrates with help desk and support platforms including Zendesk, Freshdesk, Salesforce, and ServiceNow.",
      "whyItMatters": "Each tool's integrations reflect its category: internal project data sources versus customer support platforms.",
      "benefitsWho": "PMO teams benefit from SharpCloud's project-tool integrations; support teams benefit from Stonly's help-desk integrations."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Purpose",
      "rows": [
        {
          "feature": "Portfolio/project visualization",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Interactive customer guides",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Dependency/risk mapping",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Scenario/what-if modeling",
          "toolA": "available",
          "toolB": "unavailable"
        }
      ]
    },
    {
      "group": "AI & Automation",
      "rows": [
        {
          "feature": "Conversational AI bot",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "92% reported response accuracy"
        },
        {
          "feature": "Support agent assist AI",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Automated data sync from source systems",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Excel, SharePoint, MS Project, Azure DevOps, Jira"
        }
      ]
    },
    {
      "group": "Deployment & Access",
      "rows": [
        {
          "feature": "On-premises/private cloud deployment",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Free entry tier",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Stonly Basic plan: 400 views, 5 guides"
        },
        {
          "feature": "SSO",
          "toolA": "available",
          "toolB": "available",
          "note": "SharpCloud: SAML 2.0 with Azure AD/Okta; Stonly: Enterprise tier only"
        },
        {
          "feature": "Help desk integrations",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Zendesk, Freshdesk, Salesforce, ServiceNow"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "What license tiers does SharpCloud offer?",
      "answer": "SharpCloud offers Creator (minimum 2 licenses), Collaborator (minimum 5 licenses), and Read-Only (minimum 50 licenses) tiers, all billed annually with pricing available only by contacting sales."
    },
    {
      "question": "Does Stonly have a free plan?",
      "answer": "Yes. After the 14-day Small Business trial ends, accounts can move to a free Basic plan with 400 monthly guide views, 5 published guides, and 1 team member."
    },
    {
      "question": "Does SharpCloud include AI features?",
      "answer": "No AI-specific features are disclosed on SharpCloud's product page."
    },
    {
      "question": "What AI features does Stonly include?",
      "answer": "A conversational AI bot for customer-facing answers (92% reported accuracy) and an Agent Assist tool that summarizes tickets and drafts responses for support agents."
    },
    {
      "question": "Is SharpCloud available on-premises?",
      "answer": "Yes, SharpCloud can be deployed on-premises or in a private cloud on Windows or Linux/Docker, in addition to SaaS on Microsoft Azure."
    },
    {
      "question": "What integrations does Stonly support?",
      "answer": "Stonly integrates with Zendesk, Freshdesk, Salesforce, and ServiceNow, among other platforms."
    }
  ]
};

export default sharpcloudVsStonlyContent;
