import type { ToolComparisonContent } from './types';

const hiverVsReAmazeContent: ToolComparisonContent = {
  "verdict": "Hiver and Re:amaze both bundle AI agents into an omnichannel helpdesk, but they diverge on free access and pricing shape. Hiver has a permanently free tier and per-seat pricing that climbs to $85/user/month at the top Elite tier, while Re:amaze offers only a 14-day trial but includes a flat-rate Starter plan with unlimited team members capped at 500 conversations/month. The better fit depends on whether ongoing free access or a flat unlimited-seat option matters more to the team's cost structure.",
  "bestForToolA": "Teams that want to start on a permanently free plan, need Slack channel management, or plan to scale into Salesforce/Shopify/NetSuite integrations with 10,000+ tool connections.",
  "bestForToolB": "Small ecommerce teams with many people who need inbox access but low conversation volume, since the flat $59/month Starter plan covers unlimited team members up to 500 conversations/month, plus built-in co-browsing (Peek) and proactive messaging (Cues).",
  "whoNeedsBoth": "An ecommerce brand with a large, rotating support-adjacent staff (warehouse, ops) that occasionally needs inbox visibility could use Re:amaze's flat-rate unlimited-seat Starter plan for that broad group, while relying on Hiver for the core support team's Salesforce/Shopify-integrated workflows.",
  "keyDifferences": [
    {
      "title": "Free access model",
      "toolA": "Permanently free tier with shared inbox and ticketing across email, chat, and help center channels.",
      "toolB": "No permanent free plan, only a 14-day free trial with all Plus-plan features and no credit card required.",
      "whyItMatters": "A free-forever tier lets a team stay on the product indefinitely at zero cost; a trial only lets teams evaluate before a purchase decision.",
      "benefitsWho": "Small teams or startups that want to run support tooling without ongoing cost."
    },
    {
      "title": "Pricing structure",
      "toolA": "Strictly per-seat, from $25/user/month (Growth) up to $85/user/month (Elite), with a minimum of 2 seats.",
      "toolB": "Offers a flat-rate Starter plan at $59/month for unlimited team members, capped at 500 responded conversations/month, alongside per-user Basic/Pro/Plus tiers ($29-$69/user/month).",
      "whyItMatters": "Flat-rate unlimited-seat pricing can be far cheaper for teams with many occasional inbox users; per-seat pricing scales predictably with headcount for teams where every agent is active.",
      "benefitsWho": "Teams with many part-time or occasional agents (Re:amaze) vs. teams with a smaller, fully dedicated support staff (Hiver)."
    },
    {
      "title": "Unique engagement features",
      "toolA": "AI Help Center that auto-generates help articles from resolved tickets, plus AI Insights for quality monitoring (Elite tier).",
      "toolB": "Cues for trigger-based proactive messaging and Peek for real-time co-browsing to monitor customer behavior on-site.",
      "whyItMatters": "These are differentiated capabilities not offered by the other product, based on the facts available.",
      "benefitsWho": "Teams wanting proactive, on-site customer engagement (Re:amaze) vs. teams wanting AI-driven knowledge base automation (Hiver)."
    },
    {
      "title": "Native integrations",
      "toolA": "Connects with Salesforce, Shopify, NetSuite, and 10,000+ tools.",
      "toolB": "Integration depth is not itemized beyond channel and mobile app support in the available facts.",
      "whyItMatters": "Breadth of native integrations affects how easily a tool fits into an existing tech stack.",
      "benefitsWho": "Teams already standardized on Salesforce, Shopify, or NetSuite."
    },
    {
      "title": "Mobile apps",
      "toolA": "Not documented in the available facts.",
      "toolB": "Native iOS and Android apps with push notifications.",
      "whyItMatters": "Dedicated mobile apps let agents respond on the go rather than through a mobile browser.",
      "benefitsWho": "Distributed or field support teams needing mobile access."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Features",
      "rows": [
        {
          "feature": "Omnichannel inbox",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "AI agent for ticket handling",
          "toolA": "available",
          "toolB": "available",
          "note": "Re:amaze's AI Agent is labeled Beta."
        },
        {
          "feature": "Workflow automation",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Native mobile apps (iOS/Android)",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Proactive/trigger-based messaging",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Re:amaze's Cues feature."
        },
        {
          "feature": "Co-browsing",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Re:amaze's Peek feature."
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Permanent free tier",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Flat-rate unlimited-seat plan",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Re:amaze Starter, $59/month flat, capped at 500 conversations/month."
        },
        {
          "feature": "SSO / advanced roles",
          "toolA": "limited",
          "toolB": "not-documented",
          "note": "Hiver's SSO, HIPAA, and custom roles are Elite-tier only."
        },
        {
          "feature": "SMS/voice channels",
          "toolA": "available",
          "toolB": "limited",
          "note": "Re:amaze requires the Pro or Plus plan for SMS/voice."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Hiver have a free plan?",
      "answer": "Yes, Hiver offers a permanently free tier with shared inbox and ticketing for email, chat, and help center channels."
    },
    {
      "question": "Does Re:amaze have a free trial?",
      "answer": "Yes, a 14-day free trial with all Plus-plan features and no credit card required, but there is no permanent free plan."
    },
    {
      "question": "What is the cheapest paid Hiver plan?",
      "answer": "The Growth plan starts at $25/user/month billed annually, or $35/user/month billed monthly."
    },
    {
      "question": "What is Re:amaze's Starter plan?",
      "answer": "A $59/month flat rate for unlimited team members, capped at 500 responded conversations per month."
    },
    {
      "question": "Where is Re:amaze based?",
      "answer": "San Jose, California, United States; Hiver's headquarters is not disclosed in the available facts."
    },
    {
      "question": "What integrations does Hiver support?",
      "answer": "Hiver lists native integrations with Salesforce, Shopify, NetSuite, and over 10,000 tools."
    }
  ]
};

export default hiverVsReAmazeContent;
