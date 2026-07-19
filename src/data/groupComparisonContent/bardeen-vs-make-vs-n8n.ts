import type { GroupComparisonContent } from './types';

const bardeenVsMakeVsN8nContent: GroupComparisonContent = {
  "verdict": "Bardeen, Make, and n8n each tackle automation from a different starting point: Bardeen focuses on browser-based tasks through an AI-assisted extension, Make offers a highly visual, flowchart-style scenario builder for connecting more than 3,000 apps, and n8n combines a node-based canvas with full custom code and self-hosting for technical teams. Teams doing lightweight web research or prospecting will likely prefer Bardeen, while those building complex, branching automations across many apps will lean toward Make or n8n depending on whether they want a hosted visual tool or a self-hostable, code-friendly platform.",
  "bestFor": {
    "bardeen": "Sales, marketing, and ops professionals automating repetitive browser tasks like data entry, scraping, and prospecting.",
    "make": "Teams that need a powerful visual, flowchart-based builder for complex, multi-branch automations across 3,000-plus apps without writing code.",
    "n8n": "Developers and technical teams who want self-hosting, custom code nodes, and AI agent building inside their automations."
  },
  "highlights": [
    {
      "title": "Browser-first automation, not general workflow building",
      "description": "Bardeen runs as a browser extension scoped to web-page tasks like scraping and CRM entry, a narrower focus than the server-side, multi-app scenarios Make and n8n are built for.",
      "toolSlugs": [
        "bardeen"
      ]
    },
    {
      "title": "Visual branching logic at scale",
      "description": "Make's routers, filters, and more than 3,000 app connectors give it flowchart-style power for complex, multi-path scenarios that Bardeen's playbook model does not attempt to match.",
      "toolSlugs": [
        "make"
      ]
    },
    {
      "title": "Self-hosted and code-first",
      "description": "n8n is the only one of the three offering a free, self-hostable Community Edition with unlimited executions and native JavaScript or Python code nodes for advanced logic.",
      "toolSlugs": [
        "n8n"
      ]
    },
    {
      "title": "Both Make and n8n are building AI orchestration into workflows",
      "description": "Make supports AI agent orchestration and large language model calls inside scenarios, and n8n has native AI agent building, positioning both as more than pure business-process automation tools.",
      "toolSlugs": [
        "make",
        "n8n"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Automation Building",
      "rows": [
        {
          "feature": "Browser-based web scraping and playbooks",
          "statuses": {
            "bardeen": "available",
            "make": "unavailable",
            "n8n": "limited"
          },
          "note": "n8n can reach browser-adjacent tasks through HTTP requests and custom code nodes rather than a native browser extension."
        },
        {
          "feature": "Custom JavaScript or Python code steps",
          "statuses": {
            "bardeen": "limited",
            "make": "limited",
            "n8n": "available"
          },
          "note": "Make offers custom functions on its Enterprise tier; Bardeen's code-level customization is limited to building your own scrapers."
        },
        {
          "feature": "Visual flowchart-style branching logic",
          "statuses": {
            "bardeen": "limited",
            "make": "available",
            "n8n": "available"
          }
        },
        {
          "feature": "AI agent orchestration within workflows",
          "statuses": {
            "bardeen": "available",
            "make": "available",
            "n8n": "available"
          }
        }
      ]
    },
    {
      "group": "Deployment and Scale",
      "rows": [
        {
          "feature": "Self-hosting option",
          "statuses": {
            "bardeen": "unavailable",
            "make": "unavailable",
            "n8n": "available"
          }
        },
        {
          "feature": "App integration breadth (3,000-plus documented)",
          "statuses": {
            "bardeen": "limited",
            "make": "available",
            "n8n": "available"
          }
        },
        {
          "feature": "Usable free plan",
          "statuses": {
            "bardeen": "available",
            "make": "available",
            "n8n": "available"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is easiest to learn, Bardeen, Make, or n8n?",
      "answer": "Bardeen is generally the fastest to pick up since its Playbooks run directly in the browser with minimal setup. Make's flowchart-style scenario builder has a steeper learning curve than simple linear tools, and n8n's learning curve is steepest for non-technical users, especially when using its custom code nodes."
    },
    {
      "question": "Can I self-host Bardeen, Make, or n8n?",
      "answer": "Only n8n offers a free, self-hostable Community Edition with unlimited workflow executions. Bardeen and Make are both cloud-hosted services without a self-hosting option in the provided data."
    },
    {
      "question": "Which tool connects to the most apps?",
      "answer": "Make lists more than 3,000 app and API integrations, the largest documented count among the three. n8n also maintains a large library of pre-built integration nodes, while Bardeen's integrations are concentrated around common sales and marketing tools like Google Sheets, Notion, HubSpot, and Salesforce."
    },
    {
      "question": "Do Bardeen, Make, and n8n support AI agents?",
      "answer": "Bardeen AI can generate automations from natural-language prompts, Make supports AI agent orchestration and large language model calls within scenarios, and n8n has native support for building AI agents that call models and tools as part of a workflow."
    },
    {
      "question": "Which is the most affordable option?",
      "answer": "Make's Core plan starts at 9 dollars per month for 10,000 operations, Bardeen's Basic plan starts at 10 dollars per month for 100 credits, and n8n's Cloud Starter plan starts at 20 euros per month, though n8n's self-hosted Community Edition is free with unlimited executions."
    }
  ]
};

export default bardeenVsMakeVsN8nContent;
