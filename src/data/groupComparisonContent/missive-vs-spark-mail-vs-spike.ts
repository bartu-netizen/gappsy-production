import type { GroupComparisonContent } from './types';

const missiveVsSparkMailVsSpikeContent: GroupComparisonContent = {
  "verdict": "Missive is built for teams collaborating on a shared inbox with in-thread internal chat, which sets it apart from the other two, which are primarily personal email clients with team features layered on. Spark Mail leans on its AI writing assistant and quota-based AI meeting notes, while Spike reimagines email as a chat-like conversation and bundles docs, team chat, and video calls into the same app. Which wins depends on whether the buying need is a true shared inbox, AI-assisted personal email, or an all-in-one conversational workspace.",
  "bestFor": {
    "missive": "Support, sales, and ops teams that need multiple people collaborating on a shared email, SMS, or social inbox with built-in internal chat, not just a personal inbox.",
    "spark-mail": "Individuals and small teams who want an AI writing assistant and AI meeting notes layered onto a familiar threaded email client across every major platform.",
    "spike": "Professionals and remote-first teams who want email reimagined as a chat-like conversation, bundled with docs, team chat, and video calls in one app."
  },
  "highlights": [
    {
      "title": "Shared inbox vs personal inbox",
      "description": "Missive is purpose-built for teams collaborating on a shared address (support@, sales@) with in-thread internal chat and shared draft visibility, while Spark Mail and Spike are primarily personal email clients with team collaboration features layered on top.",
      "toolSlugs": [
        "missive",
        "spark-mail",
        "spike"
      ]
    },
    {
      "title": "Multi-channel reach",
      "description": "Missive uniquely extends its shared inbox to SMS and social/messaging accounts, not just email, letting one team manage multiple channels from a single app.",
      "toolSlugs": [
        "missive"
      ]
    },
    {
      "title": "Conversational UI",
      "description": "Spike's core differentiator is displaying email as a chat-style conversation rather than a threaded list, paired with built-in collaborative docs, team chat, and video calls in the same app.",
      "toolSlugs": [
        "spike"
      ]
    },
    {
      "title": "AI meeting notes",
      "description": "Spark Mail bundles AI-generated meeting notes (quota-limited by plan, unlimited on Pro) alongside its AI writing assistant, a feature Missive and Spike don't document.",
      "toolSlugs": [
        "spark-mail"
      ]
    },
    {
      "title": "Entry-level pricing",
      "description": "Spike is the cheapest paid entry point at $8/user/month, followed by Spark Mail's Plus tier at roughly EUR10/user/month and Missive's Starter at $14/user/month, with all three also offering a free tier for very small setups.",
      "toolSlugs": [
        "spike",
        "spark-mail",
        "missive"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Team Collaboration",
      "rows": [
        {
          "feature": "Shared team inbox",
          "statuses": {
            "missive": "available",
            "spark-mail": "available",
            "spike": "limited"
          },
          "note": "Missive's shared inbox is its core product; Spark Mail supports shared drafts, delegation, and comments; Spike's Teamspace product offers a custom domain but is less inbox-centric."
        },
        {
          "feature": "Internal team chat",
          "statuses": {
            "missive": "available",
            "spark-mail": "not-documented",
            "spike": "available"
          }
        },
        {
          "feature": "Usable free plan for a small team",
          "statuses": {
            "missive": "available",
            "spark-mail": "available",
            "spike": "available"
          },
          "note": "Missive's free plan covers up to 3 users; Spark Mail's free plan supports unlimited accounts but is individual-focused; Spike's free plan covers a single email account."
        }
      ]
    },
    {
      "group": "AI Features",
      "rows": [
        {
          "feature": "AI writing assistant",
          "statuses": {
            "missive": "available",
            "spark-mail": "available",
            "spike": "available"
          }
        },
        {
          "feature": "AI meeting notes",
          "statuses": {
            "missive": "not-documented",
            "spark-mail": "available",
            "spike": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Multi-Channel and Extras",
      "rows": [
        {
          "feature": "SMS or social channel support",
          "statuses": {
            "missive": "available",
            "spark-mail": "not-documented",
            "spike": "not-documented"
          }
        },
        {
          "feature": "Built-in video calls",
          "statuses": {
            "missive": "not-documented",
            "spark-mail": "not-documented",
            "spike": "available"
          },
          "note": "Spike's Business plan supports video calls with up to 10 participants."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is best for a shared support or sales inbox?",
      "answer": "Missive is purpose-built for teams collaborating on one shared email address, with in-thread internal chat and shared draft visibility so multiple people can work the same inbox without stepping on each other."
    },
    {
      "question": "Which has the most unique interface?",
      "answer": "Spike stands out by displaying email as a chat-like conversation instead of a traditional thread, and bundles team chat, docs, and video calls into the same app."
    },
    {
      "question": "Which offers AI meeting notes?",
      "answer": "Spark Mail includes AI-generated meeting notes as a named feature (40 per month on Plus, unlimited on Pro); Missive and Spike don't document a comparable meeting-notes feature."
    },
    {
      "question": "Can any of these handle SMS or social messages, not just email?",
      "answer": "Missive is the only one of the three that extends its shared inbox to SMS and social/messaging accounts alongside email."
    },
    {
      "question": "Which is cheapest to start paying?",
      "answer": "Spike's Pro plan starts at $8/user/month, the lowest paid entry point, compared to Missive's Starter at $14/user/month and Spark Mail's Plus at roughly EUR10/user/month."
    },
    {
      "question": "Do all three offer a free plan?",
      "answer": "Yes - Missive's free plan supports up to 3 users, Spark Mail's free plan supports unlimited accounts with core Smart Inbox features, and Spike's free plan covers a single email account."
    }
  ]
};

export default missiveVsSparkMailVsSpikeContent;
