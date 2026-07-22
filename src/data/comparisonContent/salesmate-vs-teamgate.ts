import type { ToolComparisonContent } from './types';

const salesmateVsTeamgateContent: ToolComparisonContent = {
  "verdict": "Salesmate and Teamgate both track deals through a pipeline, but Salesmate bundles marketing automation, helpdesk/support, and an AI co-pilot (Sandy AI) into one platform with no free plan, while Teamgate keeps things focused on sales pipeline and calling with a built-in SmartDialer and a genuine free Starter plan, but no documented AI features.",
  "bestForToolA": "Teams that want marketing automation, customer support (ticketing, SLAs, live chat), and an AI co-pilot for call transcription and email drafting bundled with the CRM, and don't need a permanent free tier.",
  "bestForToolB": "Small teams that want to start on a genuine free plan (2 users, 500 contacts) and get built-in calling (SmartDialer) at the entry paid tier, without needing marketing automation or helpdesk features.",
  "whoNeedsBoth": "A business with distinct sales and marketing/support functions might run Teamgate for a small outbound sales team on the free plan while using Salesmate's fuller suite (marketing automation, helpdesk, AI co-pilot) for a customer-facing team.",
  "keyDifferences": [
    {
      "title": "Free (non-trial) plan",
      "toolA": "Has no free plan — only a 15-day free trial with unlimited feature access.",
      "toolB": "Offers a free Starter plan for up to 2 users with 500 contacts.",
      "whyItMatters": "Teams wanting to run a CRM indefinitely at no cost can do so on Teamgate but not Salesmate.",
      "benefitsWho": "Very small teams or solo users on a tight budget."
    },
    {
      "title": "AI co-pilot",
      "toolA": "Includes Sandy AI, providing call transcription, conversation summaries, and automated email composition, available from the Pro plan up.",
      "toolB": "Does not document AI features; cons note there is no stated free/paid plan for AI capabilities.",
      "whyItMatters": "Teams wanting built-in AI for calls and email drafting get that from Salesmate but not Teamgate.",
      "benefitsWho": "Sales teams that want automated call summaries and email drafting."
    },
    {
      "title": "Marketing automation and customer support",
      "toolA": "Includes marketing automation (audience segments, nurture journeys, campaigns) and customer support (ticketing, SLAs, live chat, social media support) as core modules.",
      "toolB": "Does not document marketing automation or a helpdesk module.",
      "whyItMatters": "Teams wanting a single platform for sales, marketing, and support get that breadth from Salesmate; Teamgate stays focused on sales pipeline management.",
      "benefitsWho": "Small businesses wanting one tool instead of three."
    },
    {
      "title": "Built-in calling tier placement",
      "toolA": "Power dialer and voicemail drop are reserved for the Business plan ($63/user/month).",
      "toolB": "SmartDialer is included as a core feature, with in-app dialing available on the Team plan ($39.90/user/month).",
      "whyItMatters": "Teams that call prospects heavily get dialer access at a lower price point with Teamgate than with Salesmate.",
      "benefitsWho": "Outbound sales teams that call frequently."
    },
    {
      "title": "Open API access",
      "toolA": "Documents API access as a core capability (tag).",
      "toolB": "Restricts open API access to the Growth plan (top tier).",
      "whyItMatters": "Teams needing to integrate the CRM with other systems from an entry-level plan should check whether API access requires an upgrade.",
      "benefitsWho": "Technical teams building custom integrations."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Features",
      "rows": [
        {
          "feature": "Marketing automation (segments/nurture/campaigns)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Customer support / helpdesk (ticketing, SLA, live chat)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Built-in calling/dialer",
          "toolA": "limited",
          "toolB": "available",
          "note": "Salesmate's power dialer is on the Business tier ($63/mo); Teamgate's SmartDialer is core, with in-app dialing on the Team tier ($39.90/mo)."
        },
        {
          "feature": "Sales analytics/dashboards",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "AI & Automation",
      "rows": [
        {
          "feature": "AI co-pilot (transcription, summaries, email drafting)",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Salesmate's Sandy AI is available from the Pro plan up."
        },
        {
          "feature": "Lead scoring",
          "toolA": "not-documented",
          "toolB": "limited",
          "note": "Teamgate restricts lead scoring to the Growth plan."
        },
        {
          "feature": "Workflow automation credits",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Salesmate: 5K-15K smart flow credits/user/month by tier."
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Free (non-trial) plan",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Teamgate Starter: 2 users, 500 contacts."
        },
        {
          "feature": "Entry paid price",
          "toolA": "available",
          "toolB": "available",
          "note": "Salesmate: $23/user/mo (Basic). Teamgate: $39.90/user/mo (Team)."
        },
        {
          "feature": "Open API",
          "toolA": "available",
          "toolB": "limited",
          "note": "Teamgate's open API requires the Growth plan."
        },
        {
          "feature": "Free trial",
          "toolA": "available",
          "toolB": "available",
          "note": "Salesmate: 15-day, unlimited features. Teamgate: 14-day."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Salesmate offer a free trial?",
      "answer": "Yes, a 15-day free trial with unlimited feature access."
    },
    {
      "question": "Does Teamgate have a free plan?",
      "answer": "Yes, the Starter plan is free for up to 2 users with 500 contacts."
    },
    {
      "question": "What is Sandy AI?",
      "answer": "Salesmate's built-in AI co-pilot, offering call transcription, conversation summaries, and email composition, available from the Pro plan up."
    },
    {
      "question": "How much does Teamgate cost?",
      "answer": "Paid plans start at $39.90/user/month (Team) up to $59.90/user/month (Growth), with a 20% discount for annual billing."
    },
    {
      "question": "Does Salesmate have customer support tools?",
      "answer": "Yes, it handles ticket management, SLAs, live chat, and social media support."
    },
    {
      "question": "Does Teamgate have an open API?",
      "answer": "Yes, but open API access is limited to the Growth plan."
    }
  ]
};

export default salesmateVsTeamgateContent;
