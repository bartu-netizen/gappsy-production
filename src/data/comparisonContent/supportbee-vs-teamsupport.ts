import type { ToolComparisonContent } from './types';

const supportbeeVsTeamsupportContent: ToolComparisonContent = {
  "verdict": "SupportBee and TeamSupport both use per-seat/agent pricing but serve different scales of support operation. SupportBee is a simple, two-tier, email-style shared inbox with no AI features and a 14-day trial; TeamSupport is built specifically for B2B account-level support with proprietary AI-driven account health scoring, but has no free trial and gates live chat behind a paid add-on on every tier. The right choice depends on whether B2B account context or a simpler shared inbox is the higher priority.",
  "bestForToolA": "Small teams wanting a straightforward, email-like shared inbox with transparent per-seat pricing, no long-term contract, and a 14-day free trial to test before committing.",
  "bestForToolB": "B2B support and customer success teams that need a 360-degree account view, a proprietary Customer Distress Index to flag at-risk accounts, and structured customer playbooks — and who can work without a free trial.",
  "whoNeedsBoth": "A company with both a simple consumer-facing inbox need and a dedicated B2B account management function could use SupportBee for lightweight ticket handling and TeamSupport for accounts needing proprietary health scoring, since neither documents the other's core differentiator.",
  "keyDifferences": [
    {
      "title": "AI-driven account intelligence",
      "toolA": "Not documented for SupportBee, which advertises no AI features at all.",
      "toolB": "TeamSupport includes AI Ticket Analysis and a proprietary Customer Distress Index that flags at-risk accounts.",
      "whyItMatters": "Account health scoring lets customer success teams proactively intervene before a churn risk escalates.",
      "benefitsWho": "B2B customer success and account management teams."
    },
    {
      "title": "Free trial availability",
      "toolA": "SupportBee offers a 14-day free trial.",
      "toolB": "TeamSupport advertises no free trial or free plan.",
      "whyItMatters": "A trial period lowers the risk of committing to a new tool without hands-on testing.",
      "benefitsWho": "Buyers who want to validate fit before paying."
    },
    {
      "title": "Live chat inclusion",
      "toolA": "Not mentioned as part of SupportBee's core plans, which are ticket/email-based.",
      "toolB": "TeamSupport's live chat and messaging is a separate paid add-on at $15/agent/month on every tier.",
      "whyItMatters": "Whether live chat is bundled or a la carte affects total cost for teams that need real-time chat.",
      "benefitsWho": "Teams weighing whether they need live chat at all, or want to avoid a recurring add-on fee."
    },
    {
      "title": "User/seat caps",
      "toolA": "SupportBee's two tiers (Startup, Enterprise) don't document a maximum user cap.",
      "toolB": "TeamSupport's Starter plan caps at 5 users, while Professional and Scale include unlimited users.",
      "whyItMatters": "A hard cap on the entry tier can force an early upgrade as a team grows past 5 people.",
      "benefitsWho": "Growing teams trying to avoid a forced plan upgrade."
    },
    {
      "title": "Account structure",
      "toolA": "SupportBee is built around a shared team inbox model without account-level structuring documented.",
      "toolB": "TeamSupport's Account-Level Ticketing gives a 360-degree view built specifically for B2B support relationships.",
      "whyItMatters": "B2B support often needs to see all tickets tied to one customer organization rather than individual requesters.",
      "benefitsWho": "B2B software companies managing multiple contacts per customer account."
    }
  ],
  "featureMatrix": [
    {
      "group": "Support & Ticketing Core",
      "rows": [
        {
          "feature": "Shared/team inbox",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Knowledge base",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Customer portal",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Ticket automation",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Account-level (B2B) view",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "AI & Intelligence",
      "rows": [
        {
          "feature": "AI ticket analysis",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Account health / distress scoring",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Product analytics / bug priority scoring",
          "toolA": "unavailable",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Channels",
      "rows": [
        {
          "feature": "Live chat / messaging",
          "toolA": "unavailable",
          "toolB": "limited",
          "note": "TeamSupport: paid add-on at $15/agent/month"
        },
        {
          "feature": "Omnichannel support",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Customer satisfaction (CSAT) ratings",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "SupportBee collects CSAT ratings on resolved tickets on both plans"
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Free trial",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "SupportBee: 14 days"
        },
        {
          "feature": "Entry price",
          "toolA": "available",
          "toolB": "available",
          "note": "SupportBee $17/seat/month; TeamSupport $45/month up to 5 users"
        },
        {
          "feature": "Unlimited users included",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "TeamSupport Professional and Scale tiers"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which offers a free trial?",
      "answer": "SupportBee offers a 14-day free trial. TeamSupport does not advertise a free trial or free plan."
    },
    {
      "question": "Does either include AI features?",
      "answer": "TeamSupport includes AI Ticket Analysis and a proprietary Customer Distress Index for flagging at-risk accounts. SupportBee does not advertise any AI capabilities."
    },
    {
      "question": "Is live chat included in the price?",
      "answer": "TeamSupport charges a separate $15/agent/month add-on for live chat/messaging on every tier. SupportBee's core plans are ticket/email-based and don't document live chat."
    },
    {
      "question": "Is there a user limit on the cheapest plan?",
      "answer": "TeamSupport's Starter plan caps out at 5 users, while SupportBee's Startup plan does not document a user cap."
    },
    {
      "question": "Which is built for B2B account management specifically?",
      "answer": "TeamSupport is built around account-level ticketing with a 360-degree view for B2B support teams and includes customer playbooks. SupportBee is structured as a general shared team inbox."
    }
  ]
};

export default supportbeeVsTeamsupportContent;
