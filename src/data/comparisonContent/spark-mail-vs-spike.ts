import type { ToolComparisonContent } from './types';

const sparkMailVsSpikeContent: ToolComparisonContent = {
  "verdict": "Spark Mail and Spike are both freemium AI-assisted email clients with native cross-platform apps, but they take different approaches to the inbox itself. Spark Mail keeps a traditional inbox enhanced by a Smart Inbox that prioritizes messages, gives unlimited email accounts on its free plan, and discloses a 2007 founding year. Spike reformats email into a messenger-style conversational inbox, bundles built-in video calls, and runs a separate per-member Teamspace pricing track ($0-$8/member/month) alongside its individual email plans, but limits its free plan to a single connected email address.",
  "bestForToolA": "Individuals wanting unlimited connected email accounts even on the free plan, an AI assistant for summarizing/drafting within a traditional inbox layout, and one continuous pricing progression from Free through Enterprise.",
  "bestForToolB": "People who want a messenger-style conversational email experience, built-in video calls without a separate app, and a distinct low-cost per-member Teamspace track for team collaboration alongside individual email plans.",
  "whoNeedsBoth": "A small team evaluating email clients might trial both at no cost, since Spike's free Teamspace (up to 3 members) and Spark Mail's free unlimited-account plan both cost nothing, before settling on either the conversational or traditional inbox style.",
  "keyDifferences": [
    {
      "title": "Inbox interaction style",
      "toolA": "Keeps a traditional inbox format enhanced by a Smart Inbox that automatically surfaces priority messages first.",
      "toolB": "Displays email threads as messenger-style conversations (Conversational email) while keeping standard email formatting for external recipients.",
      "whyItMatters": "The two products present the same underlying email data in fundamentally different visual/interaction models.",
      "benefitsWho": "Users who prefer chat-style threads (Spike) versus a familiar prioritized inbox (Spark Mail)."
    },
    {
      "title": "Built-in video calling",
      "toolA": "No video calling feature is documented.",
      "toolB": "Includes built-in video calls, from 1:1 up to 10-person depending on plan.",
      "whyItMatters": "Spike bundles a meeting tool directly into the email app; Spark Mail users would need a separate video tool.",
      "benefitsWho": "Teams wanting to consolidate email and video meetings into one app (Spike)."
    },
    {
      "title": "Free-tier email account limits",
      "toolA": "Free plan supports unlimited email accounts alongside the Smart Inbox and calendar.",
      "toolB": "Free (Email) plan limits users to a single connected email address (up to 3 on Pro, unlimited on Ultimate).",
      "whyItMatters": "Users managing multiple email addresses get more value from Spark Mail's free tier than Spike's.",
      "benefitsWho": "People juggling several email accounts who want to stay on a free plan."
    },
    {
      "title": "Team pricing structure",
      "toolA": "Team collaboration is a feature unlocked within its individual Plus/Pro/Enterprise plan tiers, not a separate product line.",
      "toolB": "Runs a distinct Teamspace pricing track (Starter/Team/Business, $0-$8/member/month) separate from its individual email plans.",
      "whyItMatters": "Spike offers a dedicated low-cost per-member path for teams; Spark Mail's team features are bundled into its general plan tiers.",
      "benefitsWho": "Small teams wanting the cheapest possible per-member collaboration pricing (Spike's Teamspace)."
    }
  ],
  "featureMatrix": [
    {
      "group": "Inbox Experience",
      "rows": [
        {
          "feature": "Conversational/messenger-style inbox",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Smart/priority inbox sorting",
          "toolA": "available",
          "toolB": "available",
          "note": "Spark Mail: Smart Inbox. Spike: Smart inbox sorting."
        },
        {
          "feature": "Sender screening/blocking",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Spark Mail's Gatekeeper."
        },
        {
          "feature": "Built-in video calls",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Built-in docs/channels",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "AI Features",
      "rows": [
        {
          "feature": "AI email summaries",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "AI writing assistant",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Spark +AI writing assistant."
        },
        {
          "feature": "Translation",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Free plan email accounts",
          "toolA": "available",
          "toolB": "limited",
          "note": "Spark Mail: unlimited free accounts. Spike: 1 free account, more on paid tiers."
        },
        {
          "feature": "Entry paid tier price",
          "toolA": "available",
          "toolB": "available",
          "note": "€10/month (Spark Plus) vs $6/user/month (Spike Pro, billed annually)."
        },
        {
          "feature": "Dedicated per-member team pricing track",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Spike's Teamspace: $0-$8/member/month."
        }
      ]
    },
    {
      "group": "Company",
      "rows": [
        {
          "feature": "Founded year disclosed",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Spark Mail: 2007."
        },
        {
          "feature": "Headquarters disclosed",
          "toolA": "not-documented",
          "toolB": "not-documented"
        },
        {
          "feature": "Supported interface languages",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Spark Mail explicitly supports 9 interface languages."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Spark Mail have a free plan?",
      "answer": "Yes, the Free plan includes the Smart Inbox, unlimited email accounts, smart notifications, and calendar at no cost."
    },
    {
      "question": "What does Spark's AI assistant do?",
      "answer": "It can find, summarize, and take action on messages in the inbox, and help draft replies."
    },
    {
      "question": "How much does Spark Mail's Plus plan cost?",
      "answer": "€10/month billed monthly, or €8.25/month (€99/year) billed annually."
    },
    {
      "question": "Is Spike free to use?",
      "answer": "Yes, Spike offers a Free plan for a single email address as well as a free Starter teamspace for up to 3 members."
    },
    {
      "question": "Does Spike work with Gmail and Outlook?",
      "answer": "Yes, Spike connects to existing Gmail, Outlook, and other email accounts."
    },
    {
      "question": "What does Spike's AI do?",
      "answer": "It provides smart inbox sorting, AI summaries of unread email, and contextual draft replies."
    }
  ]
};

export default sparkMailVsSpikeContent;
