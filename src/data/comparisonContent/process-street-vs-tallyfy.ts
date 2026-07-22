import type { ToolComparisonContent } from './types';

const processStreetVsTallyfyContent: ToolComparisonContent = {
  "verdict": "Process Street and Tallyfy both use AI to build and run workflows, but they're documented very differently on pricing and execution model. Tallyfy publishes exact per-seat pricing ($10-$30/month) and routes workflow steps to people, AI agents, or connected apps via its Multi-actor Execution feature, with an MCP server and Claude/ChatGPT integrations. Process Street's Pro and Startup plan prices aren't published, but it documents dedicated tooling for industry compliance standards (ISO 9001, SOC 2, SOX, FDA) via its Docs feature and an AI compliance/risk agent called Cora.",
  "bestForToolA": "Teams that need built-in document and policy control mapped to specific compliance standards (ISO 9001, SOC 2, SOX, FDA) and an AI agent (Cora) that monitors regulations and flags risks, and that are comfortable with quote-based pricing on the Pro and Startup tiers.",
  "bestForToolB": "Teams that want transparent, published per-seat pricing, free SSO and unlimited guests on every plan, workflow steps that can be routed to AI agents as executors (not just assistants), and native integrations with Claude and ChatGPT via an MCP server.",
  "whoNeedsBoth": "A regulated business could use Process Street's Docs feature to maintain ISO 9001/SOC 2/SOX/FDA-aligned policy documentation while using Tallyfy to run the day-to-day operational workflows that route tasks to staff, AI agents, and connected apps — the two target documented, distinct halves of a compliance-plus-execution program.",
  "keyDifferences": [
    {
      "title": "Pricing transparency",
      "toolA": "Process Street's Pro and Startup plan prices are not published on the site; both require contacting sales for a quote.",
      "toolB": "Tallyfy publishes exact per-seat pricing: $30/month ($300/year) for a Full Seat, $10/month ($100/year) for a Light Seat.",
      "whyItMatters": "Published per-seat pricing lets a team estimate total cost immediately, while quote-only pricing requires a sales conversation before budgeting.",
      "benefitsWho": "Small and mid-sized teams that want to self-serve a cost estimate before committing time to an evaluation."
    },
    {
      "title": "Routing steps to AI agents as executors",
      "toolA": "Process Street's Cora is an AI compliance and risk agent that monitors regulations and flags risks; Process AI generates workflows from a description.",
      "toolB": "Tallyfy's Multi-actor Execution explicitly routes workflow steps to people, AI agents, or connected apps, backed by an MCP server and Claude/ChatGPT integrations.",
      "whyItMatters": "Routing a workflow step directly to an AI agent as the executor is a different capability than an AI agent that monitors or generates workflows for a human to run.",
      "benefitsWho": "Operations teams looking to automate execution of individual workflow steps with AI, not just workflow creation."
    },
    {
      "title": "Compliance framing: standards support vs. vendor certifications",
      "toolA": "Process Street's Docs feature is built for document/policy control aligned to ISO 9001, SOC 2, SOX, and FDA standards, and the vendor itself is ISO 27001, SOC 2 Type II, HIPAA, and GDPR compliant.",
      "toolB": "Tallyfy is SOC 2 Type II, GDPR, and EU-U.S. DPF certified as a vendor, and integrates with enterprise identity providers (Microsoft Entra ID, Google Workspace, Okta, OneLogin).",
      "whyItMatters": "Process Street's product actively helps customers manage compliance documentation for external standards, while Tallyfy's certifications and IdP integrations speak to its own security posture and enterprise access management.",
      "benefitsWho": "Compliance teams needing document control (Process Street) versus IT teams needing enterprise SSO integration (Tallyfy)."
    },
    {
      "title": "Access model: guests and SSO",
      "toolA": "Guest access and SSO terms are not documented in the facts available for Process Street.",
      "toolB": "Tallyfy includes free SSO and unlimited guests on all plans, plus client-facing access that lets external participants complete steps without logging in.",
      "whyItMatters": "Free SSO and unlimited guests on every plan (rather than gated to higher tiers) affects how easily external stakeholders can participate without added licensing cost.",
      "benefitsWho": "Teams that regularly involve external clients or contractors in workflows."
    },
    {
      "title": "Platform availability",
      "toolA": "Platform availability beyond web is not documented in the facts for Process Street.",
      "toolB": "Tallyfy is documented as available on web, iOS, and Android.",
      "whyItMatters": "Confirmed native mobile apps matter for field or on-the-go task completion.",
      "benefitsWho": "Distributed or field teams that need mobile access to workflows."
    }
  ],
  "featureMatrix": [
    {
      "group": "Pricing & Trials",
      "rows": [
        {
          "feature": "Published per-seat pricing",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Free trial",
          "toolA": "available",
          "toolB": "available",
          "note": "Both offer a 14-day trial."
        },
        {
          "feature": "Discounted plan for small business",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Process Street: Startup plan for companies under 15 employees and $2M revenue."
        }
      ]
    },
    {
      "group": "AI Features",
      "rows": [
        {
          "feature": "AI-generated workflows from a description",
          "toolA": "available",
          "toolB": "available",
          "note": "Process Street: Process AI. Tallyfy: AI-assisted process documentation."
        },
        {
          "feature": "Dedicated AI compliance/risk agent",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Process Street: Cora."
        },
        {
          "feature": "Routes workflow steps to AI agents as executors",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Tallyfy: Multi-actor Execution."
        },
        {
          "feature": "MCP server / Claude / ChatGPT integration",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Access, Compliance & Platforms",
      "rows": [
        {
          "feature": "Free SSO and unlimited guests on all plans",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Enterprise identity provider integrations",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Tallyfy: Entra ID, Google Workspace, Okta, OneLogin."
        },
        {
          "feature": "Document control for ISO 9001 / SOC 2 / SOX / FDA",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Native mobile apps (iOS/Android)",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "How much does Tallyfy cost?",
      "answer": "A Full Seat costs $300/year ($30/month), and a Light Seat costs $100/year ($10/month)."
    },
    {
      "question": "Does Process Street publish its Pro plan pricing?",
      "answer": "No. Pro and Startup plan pricing are not published; both require contacting the sales team for a quote."
    },
    {
      "question": "Does Tallyfy integrate with AI tools?",
      "answer": "Yes. It offers an MCP server and integrations with Claude and ChatGPT."
    },
    {
      "question": "What is Cora?",
      "answer": "Cora is Process Street's AI compliance and risk agent that monitors regulations and flags risks."
    },
    {
      "question": "What compliance standards does Process Street help customers manage?",
      "answer": "ISO 9001, SOC 2, SOX, and FDA requirements, via its Docs feature."
    },
    {
      "question": "When was Tallyfy founded?",
      "answer": "Tallyfy was founded in 2014."
    }
  ]
};

export default processStreetVsTallyfyContent;
