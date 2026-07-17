import type { ToolComparisonContent } from './types';

const chatwootVsVitallyContent: ToolComparisonContent = {
  "verdict": "Chatwoot and Vitally solve adjacent but distinct problems: Chatwoot is an open-source omnichannel support inbox for handling live chat, WhatsApp, email, and social messages, while Vitally is a dedicated customer success platform built around health scoring, playbooks, and proactive account management for B2B SaaS. Teams choose Chatwoot to run day-to-day conversational support at a transparent per-agent price starting at $19/agent/month (or free for small teams), while Vitally targets CSM teams who need to track account health and automate renewal/onboarding workflows, with pricing only available on request.",
  "bestForToolA": "Chatwoot fits support teams who want an affordable, self-hostable omnichannel inbox - its free Hacker plan covers up to 2 agents and 500 conversations/month, and its Captain AI agent and Copilot help smaller teams automate and speed up ticket handling.",
  "bestForToolB": "Vitally fits B2B SaaS companies with a dedicated customer success function that needs health scores, automation/playbooks, and NPS surveys to manage renewals and onboarding across a large book of accounts - it already serves 600+ B2B SaaS organizations including Zapier and Pleo.",
  "whoNeedsBoth": "A B2B SaaS company could run Chatwoot as its live chat/email support inbox for reactive tickets while using Vitally separately to track account health and trigger proactive CSM outreach - the two tools cover different parts of the customer lifecycle (reactive support vs. proactive success) rather than overlapping.",
  "keyDifferences": [
    {
      "title": "Pricing Transparency",
      "toolA": "Chatwoot publishes exact pricing: a free Hacker plan (2 agents, 500 conversations/month, live chat only), then Startups at $19/agent/month, Business at $39/agent/month, and Enterprise at $99/agent/month, all billed annually.",
      "toolB": "Vitally publishes no pricing across its three tiers (Tech-Touch, Hybrid-Touch, High-Touch); prospective customers must contact sales for a custom quote.",
      "whyItMatters": "Buyers evaluating tools on a budget can self-serve a decision with Chatwoot's published tiers but must go through a sales process to even estimate Vitally's cost.",
      "benefitsWho": "Cost-conscious support teams and startups that want to compare pricing without a sales call."
    },
    {
      "title": "Core Product Category",
      "toolA": "Chatwoot is built around an omnichannel support inbox: website chat, WhatsApp, Facebook, Instagram, Telegram, and email in one place, plus a customizable live chat widget.",
      "toolB": "Vitally is built around health scoring and customer success workflows: dynamic health scores by lifecycle stage/segment, automation and playbooks, and agile-style project tracking for onboarding milestones.",
      "whyItMatters": "The two tools solve different jobs, reactive conversational support versus proactive account management, so the choice depends on which workflow a team actually needs to run.",
      "benefitsWho": "Support leaders need Chatwoot's inbox; customer success leaders need Vitally's health-score workflows."
    },
    {
      "title": "AI Feature Depth",
      "toolA": "Chatwoot bundles Captain, an AI agent that automates conversations, and Captain Copilot, which suggests answers and surfaces conversation history, with credits capped per plan (300 on Startups, 500 on Business, 800 on Enterprise) and $20 per 1,000 extra credits beyond that.",
      "toolB": "Vitally AI generates customer summaries, follow-up tasks, and insights from conversations and unstructured customer data, but the available facts don't document a credit-based usage cap the way Chatwoot's Captain does.",
      "whyItMatters": "Teams with high support volume need to understand whether AI usage will hit a credit ceiling and incur add-on costs.",
      "benefitsWho": "High-volume support teams evaluating the total cost of AI-assisted ticket handling."
    },
    {
      "title": "Open Source and Self-Hosting",
      "toolA": "Chatwoot is open source with a self-hosted deployment option for full data ownership, backed by 25,000+ GitHub stars and 400+ contributors, and is SOC 2 Type II compliant.",
      "toolB": "Vitally's facts don't document an open-source or self-hosted option; it is offered as a hosted, custom/enterprise-priced SaaS product.",
      "whyItMatters": "Organizations with data-residency or infrastructure-control requirements may only be able to satisfy them with a self-hostable tool.",
      "benefitsWho": "Regulated companies or teams wanting to run support infrastructure on their own servers."
    },
    {
      "title": "Access Control for Larger Teams",
      "toolA": "SSO/SAML and audit logs in Chatwoot require the top Enterprise plan at $99/agent/month.",
      "toolB": "Vitally includes Single Sign-on and unlimited observer seats across all three of its plan tiers (Tech-Touch, Hybrid-Touch, High-Touch).",
      "whyItMatters": "Enterprise security requirements like SSO can significantly change the effective price of Chatwoot but are already bundled into every Vitally tier.",
      "benefitsWho": "IT/security teams enforcing SSO across every tool in the stack."
    }
  ],
  "featureMatrix": [
    {
      "group": "Communication & Support Channels",
      "rows": [
        {
          "feature": "Omnichannel inbox (chat, WhatsApp, email, social)",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Available from Startups plan and above"
        },
        {
          "feature": "Live chat widget",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Voice support",
          "toolA": "limited",
          "toolB": "not-documented",
          "note": "Chatwoot Enterprise plan only, $99/agent/month"
        },
        {
          "feature": "Knowledge base / help center",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Customer Success & Automation",
      "rows": [
        {
          "feature": "Health scoring",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Automation/playbooks",
          "toolA": "limited",
          "toolB": "available",
          "note": "Chatwoot: automation rules on Business plan+; Vitally: unlimited on all plans"
        },
        {
          "feature": "NPS / customer surveys",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Project/onboarding milestone tracking",
          "toolA": "unavailable",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "AI & Platform",
      "rows": [
        {
          "feature": "AI agent/assistant",
          "toolA": "available",
          "toolB": "available",
          "note": "Chatwoot: Captain, credit-capped; Vitally: Vitally AI"
        },
        {
          "feature": "Self-hosted deployment",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Single Sign-on",
          "toolA": "limited",
          "toolB": "available",
          "note": "Chatwoot: Enterprise plan only; Vitally: all plans"
        },
        {
          "feature": "Published pricing",
          "toolA": "available",
          "toolB": "unavailable"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Are Chatwoot and Vitally direct competitors?",
      "answer": "Not really. Chatwoot is an omnichannel support inbox for handling live chat, WhatsApp, and email conversations, while Vitally is a customer success platform focused on health scoring and account management. They serve different functions and are often used by different teams."
    },
    {
      "question": "Which tool has a free plan?",
      "answer": "Chatwoot has a free Hacker plan covering up to 2 agents and 500 conversations/month (live chat only). Vitally does not publish a free tier; all three of its plans (Tech-Touch, Hybrid-Touch, High-Touch) are custom-priced."
    },
    {
      "question": "Does either tool offer self-hosting?",
      "answer": "Chatwoot offers a self-hosted deployment option for full data ownership. Vitally's available facts don't document a self-hosted option; it is offered as hosted software."
    },
    {
      "question": "How does AI functionality compare?",
      "answer": "Chatwoot's Captain AI agent and Captain Copilot automate conversations and suggest answers, with credits capped per plan and paid add-ons at $20 per 1,000 extra credits. Vitally AI generates customer summaries, follow-up tasks, and insights, though its usage limits aren't publicly documented."
    },
    {
      "question": "Which is better for a B2B SaaS company doing both support and customer success?",
      "answer": "Many B2B SaaS companies use them for different jobs: Chatwoot for the support inbox handling incoming tickets, and Vitally for the customer success function tracking account health and running renewal/onboarding playbooks, rather than choosing one over the other."
    },
    {
      "question": "Why doesn't Vitally publish pricing?",
      "answer": "Vitally's three tiers (Tech-Touch, Hybrid-Touch, High-Touch) are all custom-quoted, which is common for enterprise customer success platforms that price based on account volume and seat count; buyers need to contact sales to get a number."
    }
  ]
};

export default chatwootVsVitallyContent;
