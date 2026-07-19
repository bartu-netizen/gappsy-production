import type { GroupComparisonContent } from './types';

const gorgiasVsHappyfoxVsJiraServiceManagementContent: GroupComparisonContent = {
  "verdict": "Gorgias, HappyFox, and Jira Service Management all sell ticket-based support software, but they solve different problems. Gorgias is built specifically for ecommerce brands and leans on live Shopify data plus a dual support-and-sales AI Agent; HappyFox is a broader, bootstrapped helpdesk that spans customer support, IT, and HR from one ticketing backbone with a flat-fee option for large teams; Jira Service Management is Atlassian's ITIL-aligned ITSM suite, strongest for IT and DevOps teams already running Jira and Confluence who need incident, change, and on-call tooling. None of the three is a drop-in replacement for the others outside its core use case.",
  "bestFor": {
    "gorgias": "Ecommerce and DTC brands, especially on Shopify, that want AI-driven support tightly wired into order and product data.",
    "happyfox": "Organizations that need one ticketing backbone spanning customer support, IT, and HR without buying three separate platforms.",
    "jira-service-management": "IT and DevOps teams already living in Jira and Confluence who need ITIL-aligned incident, change, and problem management."
  },
  "highlights": [
    {
      "title": "Built for ecommerce versus built for IT ops",
      "description": "Gorgias centers on Shopify order data and a Support-plus-Shopping AI Agent, while Jira Service Management centers on ITIL incident and change workflows for internal IT teams - opposite ends of the same broad 'ticketing' category.",
      "toolSlugs": [
        "gorgias",
        "jira-service-management"
      ]
    },
    {
      "title": "HappyFox spans customer service, IT, and HR from one system",
      "description": "HappyFox ships a core Help Desk plus a separate ITIL-style Service Desk module, letting one company run customer support and internal IT tickets on a shared data model.",
      "toolSlugs": [
        "happyfox"
      ]
    },
    {
      "title": "AI pricing is structured very differently across all three",
      "description": "Gorgias charges for AI Agent usage based on successful resolutions on top of the base plan, HappyFox bundles its AI Copilot suite into the Pro tier, and Jira Service Management gates AI features to the Premium tier and above.",
      "toolSlugs": [
        "gorgias",
        "happyfox",
        "jira-service-management"
      ]
    },
    {
      "title": "Only Jira Service Management has a truly free tier",
      "description": "JSM offers a Free plan for up to 3 agents with core service-request and knowledge-base features, while Gorgias starts at $10/month and HappyFox offers only a 14-day trial with no permanent free plan.",
      "toolSlugs": [
        "jira-service-management"
      ]
    },
    {
      "title": "HappyFox's flat unlimited-agent pricing",
      "description": "For larger teams, HappyFox offers Unlimited Agent plans billed as a flat annual fee with a fixed ticket allowance, an alternative to Gorgias's per-ticket overages and JSM's volume-tiered per-agent pricing.",
      "toolSlugs": [
        "happyfox"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Ticketing and Channels",
      "rows": [
        {
          "feature": "Omnichannel customer inbox (email, chat, social, voice, SMS)",
          "statuses": {
            "gorgias": "available",
            "happyfox": "available",
            "jira-service-management": "limited"
          },
          "note": "JSM's customer portal handles service requests and multi-channel on-call notifications, but it is not a general social/chat/voice support inbox like Gorgias or HappyFox."
        },
        {
          "feature": "Self-service knowledge base",
          "statuses": {
            "gorgias": "not-documented",
            "happyfox": "available",
            "jira-service-management": "available"
          }
        },
        {
          "feature": "Workflow automation and routing",
          "statuses": {
            "gorgias": "available",
            "happyfox": "available",
            "jira-service-management": "available"
          }
        }
      ]
    },
    {
      "group": "AI Capabilities",
      "rows": [
        {
          "feature": "AI-assisted response or resolution",
          "statuses": {
            "gorgias": "available",
            "happyfox": "available",
            "jira-service-management": "limited"
          },
          "note": "JSM's AI features are only unlocked on the Premium tier and above."
        },
        {
          "feature": "Vision (image) understanding in support conversations",
          "statuses": {
            "gorgias": "available",
            "happyfox": "not-documented",
            "jira-service-management": "not-documented"
          }
        }
      ]
    },
    {
      "group": "IT Service Management",
      "rows": [
        {
          "feature": "ITIL-aligned incident and change management",
          "statuses": {
            "gorgias": "unavailable",
            "happyfox": "available",
            "jira-service-management": "available"
          }
        },
        {
          "feature": "On-call scheduling and alerting",
          "statuses": {
            "gorgias": "unavailable",
            "happyfox": "not-documented",
            "jira-service-management": "available"
          },
          "note": "JSM's on-call tooling comes from its integrated Opsgenie capabilities."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three is best for a Shopify store?",
      "answer": "Gorgias, by a wide margin. It is purpose-built for ecommerce, with a Shopify Premier Partner integration that gives agents and its AI Agent live access to orders, inventory, and customer tags, plus a Shopping Assistant that engages pre-purchase visitors."
    },
    {
      "question": "Can HappyFox replace both a customer support helpdesk and an IT service desk?",
      "answer": "Yes. HappyFox ships a core Help Desk alongside a separate ITIL-style Service Desk module on the same unified ticketing data model, so customer support, IT, and HR teams can share one system with separate queues and permissions."
    },
    {
      "question": "Does Jira Service Management work for external customer support, not just internal IT?",
      "answer": "It has a customizable customer portal for service requests, but its feature set - change management, CMDB, on-call scheduling, CI/CD integrations - is built around internal IT and DevOps workflows rather than general customer-facing support."
    },
    {
      "question": "Which tool has a genuinely free plan?",
      "answer": "Only Jira Service Management, with a Free tier capped at 3 agents. Gorgias starts at $10/month and HappyFox offers a 14-day free trial rather than a permanent free tier."
    },
    {
      "question": "How does AI pricing differ across the three?",
      "answer": "Gorgias bills AI Agent usage per successful resolution on top of the base plan, HappyFox includes its AI Copilot suite in the Pro tier price, and Jira Service Management restricts AI features to Premium and Enterprise."
    },
    {
      "question": "Which is priced most predictably at scale?",
      "answer": "HappyFox's Unlimited Agent plans offer a flat annual fee once a team exceeds roughly 20-25 agents. Gorgias's cost can grow with ticket overages, and JSM's per-agent pricing is volume-tiered and can be harder to forecast as headcount changes."
    }
  ]
};

export default gorgiasVsHappyfoxVsJiraServiceManagementContent;
