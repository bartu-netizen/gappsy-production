import type { ToolComparisonContent } from './types';

const freescoutVsServicenowContent: ToolComparisonContent = {
  "verdict": "FreeScout is a completely free, open-source, self-hosted help desk and shared inbox with unlimited agents, tickets, and mailboxes, built on PHP/Laravel. ServiceNow is an enterprise cloud platform spanning ITSM, IT operations, HR service delivery, customer service, and custom low-code app development, priced entirely through custom sales quotes with no published rates. These sit at opposite ends of the support-tooling market: a free, focused inbox for small teams versus a fully quoted, workflow-orchestration platform for large enterprises.",
  "bestForToolA": "Small teams or budget-conscious organizations wanting a fully free, self-hosted help desk with unlimited agents and mailboxes and no per-agent licensing, running on their own PHP/MySQL infrastructure.",
  "bestForToolB": "Large enterprises needing a single platform to run IT service management, IT operations, HR service delivery, and customer service workflows together, with embedded generative AI (Now Assist) and custom low-code application development (App Engine).",
  "whoNeedsBoth": "This pairing has little realistic combined-use scenario: they serve opposite ends of the market for the same underlying job (support ticketing), so an organization would typically choose one rather than run both for the same support function, though a very large enterprise could theoretically keep a self-hosted FreeScout inbox for one narrow internal team while the rest of the organization runs on ServiceNow.",
  "keyDifferences": [
    {
      "title": "Pricing Model",
      "toolA": "FreeScout's core software is completely free ($0) and open source under AGPL-3.0, with unlimited agents, tickets, and mailboxes.",
      "toolB": "ServiceNow publishes no pricing at all; every deployment requires a custom sales quote across its Standard, Professional, and Enterprise tiers.",
      "whyItMatters": "Free versus fully quote-based pricing represents opposite extremes of cost predictability and accessibility.",
      "benefitsWho": "Cost-sensitive small teams benefit from FreeScout's free model; large enterprises with dedicated procurement processes are the ones equipped to work through ServiceNow's custom quoting."
    },
    {
      "title": "Deployment",
      "toolA": "FreeScout is self-hosted on your own PHP/MySQL infrastructure, requiring technical setup, though third-party providers offer cloud hosting.",
      "toolB": "ServiceNow is a cloud platform; self-hosting is not documented as an option.",
      "whyItMatters": "Self-hosting requires infrastructure management but offers control, while cloud-only means less operational burden but less control.",
      "benefitsWho": "Technical teams wanting infrastructure control benefit from FreeScout; teams wanting to avoid server management benefit from ServiceNow's cloud model."
    },
    {
      "title": "Platform Scope",
      "toolA": "FreeScout is a focused help desk and shared inbox tool with optional Kanban boards and a knowledge base module.",
      "toolB": "ServiceNow spans ITSM, ITOM, HR Service Delivery, Customer Service Management, Security Operations, and custom App Engine applications on one platform.",
      "whyItMatters": "Organizations need to know whether they're buying a single-purpose support inbox or a multi-department workflow platform.",
      "benefitsWho": "Small support teams need FreeScout's focus; large enterprises coordinating IT, HR, and customer service together need ServiceNow's breadth."
    },
    {
      "title": "AI Capabilities",
      "toolA": "FreeScout does not document any AI features.",
      "toolB": "ServiceNow includes Now Assist, generative AI embedded in workflows to summarize cases, draft knowledge content, and recommend next steps.",
      "whyItMatters": "Generative AI assistance can reduce agent workload on high case volumes, a factor mainly relevant at enterprise scale.",
      "benefitsWho": "Large support and IT organizations processing high case volumes benefit most from ServiceNow's Now Assist."
    },
    {
      "title": "Free Trial Availability",
      "toolA": "FreeScout requires no trial since the core software is free forever.",
      "toolB": "ServiceNow does not offer a standard self-serve free trial; prospective customers typically request a demo or proof of concept through the sales team.",
      "whyItMatters": "The evaluation process differs significantly: instant free access versus a sales-mediated demo process.",
      "benefitsWho": "Buyers wanting to self-evaluate immediately benefit from FreeScout; enterprises expecting guided implementation support engage ServiceNow's sales-led demo process."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Support Features",
      "rows": [
        {
          "feature": "Shared inbox / ticketing",
          "toolA": "available",
          "toolB": "available",
          "note": "ServiceNow via Customer Service Management"
        },
        {
          "feature": "Unlimited agents and mailboxes",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Kanban boards / knowledge base",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "FreeScout: optional modules"
        },
        {
          "feature": "Native mobile apps (iOS/Android)",
          "toolA": "available",
          "toolB": "available",
          "note": "ServiceNow tagged iOS/Android but not detailed in feature descriptions"
        }
      ]
    },
    {
      "group": "Deployment & Pricing",
      "rows": [
        {
          "feature": "Self-hosted deployment",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Published pricing",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "FreeScout: $0; ServiceNow: contact for pricing"
        },
        {
          "feature": "Free self-serve trial",
          "toolA": "not-documented",
          "toolB": "unavailable",
          "note": "ServiceNow: demo/POC via sales only"
        }
      ]
    },
    {
      "group": "Platform Breadth & AI",
      "rows": [
        {
          "feature": "IT service management (ITSM)",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "HR service delivery",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Generative AI (case summarization, drafting)",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "ServiceNow: Now Assist"
        },
        {
          "feature": "Low-code custom app development",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "ServiceNow: App Engine"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is FreeScout really free?",
      "answer": "Yes, the core FreeScout software is free and open source under the AGPL-3.0 license, with unlimited agents, tickets, and mailboxes."
    },
    {
      "question": "Does ServiceNow offer a free trial?",
      "answer": "No, ServiceNow does not offer a standard self-serve free trial; prospective customers typically request a demo or proof of concept through the sales team."
    },
    {
      "question": "Which tool requires self-hosting?",
      "answer": "FreeScout requires self-hosting on your own PHP/MySQL infrastructure (though third-party providers offer cloud hosting). ServiceNow is a cloud platform with no self-hosting option documented."
    },
    {
      "question": "Does FreeScout include AI features like ServiceNow's Now Assist?",
      "answer": "No, this is not documented as part of FreeScout's feature set. ServiceNow's Now Assist is a generative AI capability embedded across its workflow products for summarizing records and drafting responses."
    },
    {
      "question": "How much does ServiceNow cost?",
      "answer": "ServiceNow does not publish standard pricing. Costs depend on the products, modules, and number of users or agents licensed, and are quoted through the sales team on a custom contract basis."
    },
    {
      "question": "Which tool is better suited for a small support team on a budget?",
      "answer": "FreeScout, since its core software is entirely free with unlimited agents and mailboxes, whereas ServiceNow's custom-quoted enterprise pricing and implementation scope are built for large organizations, not narrow single-purpose support needs, per its own documented cons."
    }
  ]
};

export default freescoutVsServicenowContent;
