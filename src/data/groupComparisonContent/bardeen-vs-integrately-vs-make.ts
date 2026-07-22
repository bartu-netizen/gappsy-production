import type { GroupComparisonContent } from './types';

const bardeenVsIntegratelyVsMakeContent: GroupComparisonContent = {
  "verdict": "Bardeen, Integrately, and Make all fall under the no-code automation umbrella, but they solve fairly different problems: Bardeen automates actions inside the browser itself, Integrately focuses on one-click, pre-built automations at an aggressively low price, and Make provides a powerful visual, flowchart-style builder for complex multi-step workflows across thousands of apps. Make is the strongest choice for teams that need branching logic and broad integration coverage, Integrately wins on price and support for standard automation use cases, and Bardeen stands apart as the only one purpose-built for web scraping and page-level browser tasks. None of the three is a strict upgrade over the others; they're better understood as tools for different automation shapes.",
  "bestFor": {
    "bardeen": "Sales, marketing, and ops professionals who want AI-generated browser automations for scraping and data entry directly inside Chrome.",
    "integrately": "Cost-conscious small businesses that want thousands of one-click, pre-built automations and unusually high-touch customer support at a lower price than larger competitors.",
    "make": "Teams that need a powerful, visual, flowchart-style automation builder for complex, multi-branch workflows across 3,000-plus apps."
  },
  "highlights": [
    {
      "title": "Bardeen is the only one built as a browser extension for web-page automation",
      "description": "Bardeen's Playbooks scrape and act on data directly within web pages inside Chrome, a fundamentally different automation surface from Integrately's and Make's server-side app-to-app workflows.",
      "toolSlugs": [
        "bardeen"
      ]
    },
    {
      "title": "Make offers the most app integrations and the most powerful branching logic",
      "description": "Make connects to over 3,000 apps and APIs through a visual scenario builder with routers, filters, and detailed step-by-step data inspection, more integration breadth and workflow complexity than either Bardeen or Integrately document.",
      "toolSlugs": [
        "make"
      ]
    },
    {
      "title": "Integrately differentiates on price and support",
      "description": "Integrately is commonly cited as 60 to 80 percent cheaper than larger competitors for comparable usage, and its live chat support even extends to video calls to help configure automations.",
      "toolSlugs": [
        "integrately"
      ]
    },
    {
      "title": "Bardeen and Make both offer AI-assisted automation building",
      "description": "Bardeen AI generates browser automations from natural-language instructions, and Make's AI agent orchestration lets scenarios incorporate large language model calls and AI-driven decisions.",
      "toolSlugs": [
        "bardeen",
        "make"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Scope and Integrations",
      "rows": [
        {
          "feature": "Broad third-party app catalog (1,000-plus integrations)",
          "statuses": {
            "bardeen": "unavailable",
            "integrately": "available",
            "make": "available"
          },
          "note": "Bardeen connects to a smaller, named set of apps (Google Sheets, Notion, HubSpot, Salesforce, Slack, Airtable) rather than a catalog in the thousands."
        },
        {
          "feature": "Browser-based web automation and scraping",
          "statuses": {
            "bardeen": "available",
            "integrately": "not-documented",
            "make": "not-documented"
          }
        },
        {
          "feature": "Visual multi-step workflow builder",
          "statuses": {
            "bardeen": "limited",
            "integrately": "available",
            "make": "available"
          },
          "note": "Bardeen's Playbooks are more linear than Integrately's and Make's multi-step, branching builders."
        }
      ]
    },
    {
      "group": "AI and Automation Intelligence",
      "rows": [
        {
          "feature": "AI-generated automations from natural language",
          "statuses": {
            "bardeen": "available",
            "integrately": "not-documented",
            "make": "available"
          }
        },
        {
          "feature": "Conditional branching and routers",
          "statuses": {
            "bardeen": "not-documented",
            "integrately": "available",
            "make": "available"
          }
        }
      ]
    },
    {
      "group": "Pricing and Support",
      "rows": [
        {
          "feature": "Usable free plan",
          "statuses": {
            "bardeen": "available",
            "integrately": "available",
            "make": "available"
          }
        },
        {
          "feature": "Live, high-touch customer support",
          "statuses": {
            "bardeen": "not-documented",
            "integrately": "available",
            "make": "not-documented"
          },
          "note": "Integrately offers 24/5 live chat on all tiers, including live video call assistance on paid plans."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three automation tools is the cheapest?",
      "answer": "Integrately and Make both start their paid plans under $20/month (Integrately's Starter at $19.99/month, Make's Core at $9/month), while Bardeen's cheapest paid plan is $10/month for a smaller 100-credit allowance. Integrately is generally cited as the cheapest at comparable usage volume."
    },
    {
      "question": "Does Bardeen work outside the browser?",
      "answer": "Bardeen is delivered primarily as a browser extension, so its automations are centered on web-based tasks and data extraction rather than the broader server-side app-to-app connections that Integrately and Make specialize in."
    },
    {
      "question": "Which has the most app integrations?",
      "answer": "Make connects to over 3,000 apps and APIs, ahead of Integrately's 1,400-plus. Bardeen's integrations are narrower, centered on a named set of tools like Google Sheets, Notion, HubSpot, and Salesforce."
    },
    {
      "question": "Is there a free plan for all three?",
      "answer": "Yes, all three offer a free plan: Bardeen with limited monthly automation credits, Integrately with 100 tasks and 5 single-step automations, and Make with 1,000 operations and up to 2 active scenarios."
    },
    {
      "question": "Which is best for complex, multi-step workflows?",
      "answer": "Make is the strongest fit, with a visual, flowchart-style builder supporting routers, filters, and detailed data inspection at every step, purpose-built for complex, branching automation logic."
    }
  ]
};

export default bardeenVsIntegratelyVsMakeContent;
