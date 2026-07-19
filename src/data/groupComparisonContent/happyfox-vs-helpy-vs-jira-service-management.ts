import type { GroupComparisonContent } from './types';

const happyfoxVsHelpyVsJiraServiceManagementContent: GroupComparisonContent = {
  "verdict": "HappyFox, Helpy, and Jira Service Management all offer ticket-based support, but they sit at different points on the buy-versus-self-host and support-versus-ITSM spectrum. Helpy is the only one with a genuinely free, MIT-licensed self-hosted edition, appealing to teams that want full control or have a tight budget; HappyFox is a polished, bootstrapped SaaS platform that spans customer support, IT, and HR ticketing with an AI Copilot suite; Jira Service Management is the deepest fit for IT and DevOps teams that need ITIL-aligned incident, change, and on-call workflows tied into an existing Atlassian stack. The right pick depends more on self-hosting appetite and how IT-heavy the workload is than on raw feature counts.",
  "bestFor": {
    "happyfox": "Teams that want one polished SaaS ticketing platform covering customer support, IT, and HR with AI-assisted triage.",
    "helpy": "Budget-conscious or privacy-focused teams that want a genuinely free, open-source helpdesk they can self-host, with an optional AI agent.",
    "jira-service-management": "IT and DevOps organizations already on Atlassian tools that need ITIL-grade incident, change, and on-call management."
  },
  "highlights": [
    {
      "title": "The only fully free, self-hosted option in the group",
      "description": "Helpy's Community Edition is a free, MIT-licensed, self-hosted helpdesk with no artificial feature caps, unlike HappyFox's trial-only free access or JSM's small-team-only free tier.",
      "toolSlugs": [
        "helpy"
      ]
    },
    {
      "title": "One ticketing backbone across support, IT, and HR",
      "description": "HappyFox natively spans a customer support Help Desk and an ITIL-style Service Desk module on a shared data model, letting multiple departments run on one system.",
      "toolSlugs": [
        "happyfox"
      ]
    },
    {
      "title": "ITIL-grade incident and on-call tooling",
      "description": "Jira Service Management includes automated risk assessment, multi-stage change approvals, and Opsgenie-derived on-call scheduling that neither HappyFox nor Helpy match in depth.",
      "toolSlugs": [
        "jira-service-management"
      ]
    },
    {
      "title": "All three now ship an AI agent, at different depths",
      "description": "HappyFox's AI Copilot suggests replies and prioritizes urgency, Helpy's Carin agent aims to autonomously resolve up to 90 percent of tier-one questions, and JSM's AI features are reserved for its Premium tier and above.",
      "toolSlugs": [
        "happyfox",
        "helpy",
        "jira-service-management"
      ]
    },
    {
      "title": "Community forums are built into Helpy",
      "description": "Helpy ships embeddable community forums where customers and agents can post and vote on threads, a self-service layer that HappyFox and JSM do not document as a native feature.",
      "toolSlugs": [
        "helpy"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Deployment and Cost",
      "rows": [
        {
          "feature": "Free self-hosted or free-tier option",
          "statuses": {
            "happyfox": "unavailable",
            "helpy": "available",
            "jira-service-management": "available"
          },
          "note": "Helpy's free tier is a fully self-hosted open-source edition; JSM's free tier is cloud-only and capped at 3 agents."
        },
        {
          "feature": "Self-hosted deployment option",
          "statuses": {
            "happyfox": "unavailable",
            "helpy": "available",
            "jira-service-management": "unavailable"
          }
        }
      ]
    },
    {
      "group": "Core Ticketing",
      "rows": [
        {
          "feature": "Omnichannel inbox (email, chat, phone, social)",
          "statuses": {
            "happyfox": "available",
            "helpy": "limited",
            "jira-service-management": "limited"
          },
          "note": "Helpy covers email and a support widget but does not document phone or social channels; JSM is oriented around its service portal and on-call notifications."
        },
        {
          "feature": "Self-service knowledge base",
          "statuses": {
            "happyfox": "available",
            "helpy": "available",
            "jira-service-management": "available"
          }
        },
        {
          "feature": "Workflow automation",
          "statuses": {
            "happyfox": "available",
            "helpy": "not-documented",
            "jira-service-management": "available"
          }
        }
      ]
    },
    {
      "group": "AI and Community",
      "rows": [
        {
          "feature": "AI-assisted responses",
          "statuses": {
            "happyfox": "available",
            "helpy": "available",
            "jira-service-management": "limited"
          },
          "note": "JSM's AI features are gated to the Premium tier and above."
        },
        {
          "feature": "Built-in community/discussion forums",
          "statuses": {
            "happyfox": "not-documented",
            "helpy": "available",
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
            "happyfox": "available",
            "helpy": "unavailable",
            "jira-service-management": "available"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these can I self-host for free?",
      "answer": "Helpy, through its MIT-licensed Community Edition, which can be deployed on your own infrastructure with no licensing fees and no artificial feature caps."
    },
    {
      "question": "Is Jira Service Management only for internal IT teams?",
      "answer": "It is mainly built around ITIL incident, change, and problem management for IT and DevOps, though it does include a customer portal for external service requests."
    },
    {
      "question": "Does HappyFox include IT service management, or is that only Jira Service Management's job?",
      "answer": "HappyFox has its own ITIL-style Service Desk module alongside its core Help Desk, so it can cover basic IT ticketing without needing a separate ITSM product."
    },
    {
      "question": "Which has the most mature AI support agent?",
      "answer": "It depends on what you need: HappyFox's AI Copilot focuses on response drafting and urgency prioritization for human agents, Helpy's Carin agent aims to autonomously resolve routine tier-one questions, and JSM's AI is reserved for Premium-tier IT workflows."
    },
    {
      "question": "What's the cheapest way to get a working helpdesk today?",
      "answer": "Helpy's free Community Edition if you're willing to self-host, or Jira Service Management's free cloud tier if your team is 3 agents or fewer and doesn't need self-hosting."
    },
    {
      "question": "Can I run community or self-service forums alongside ticketing?",
      "answer": "Helpy is the only one of the three with embeddable community forums built in, letting customers and agents post and vote on threads alongside standard tickets."
    }
  ]
};

export default happyfoxVsHelpyVsJiraServiceManagementContent;
