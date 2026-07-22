import type { ToolComparisonContent } from './types';

const nethuntCrmVsStreakContent: ToolComparisonContent = {
  "verdict": "NetHunt CRM and Streak both run inside Gmail, but they differ in AI approach and free-tier access. NetHunt includes an MCP Server on every plan (even Basic) so tools like ChatGPT and Claude can query CRM data conversationally, and starts cheaper at $24/user/month; Streak, founded in 2011, offers free-forever email power tools (tracking, snippets, mail merge) without a paid plan and adds AI data entry with credits scaling by tier, but has no free full-CRM plan and starts at $49/user/month.",
  "bestForToolA": "Teams that want AI assistants to query CRM data conversationally from day one (MCP Server on the entry Basic plan), or that need WhatsApp/Instagram/LinkedIn communications alongside Gmail, at a lower starting price.",
  "bestForToolB": "Teams that primarily need free, permanent email power-tools (read receipts, snippets, mail merge up to 50/day) without committing to a paid CRM, or that want AI-automated data entry with natural-language queries and value a browser extension that works across Chrome, Safari, and Edge.",
  "whoNeedsBoth": "Organizations evaluating Gmail-native CRMs for different teams — one team on NetHunt's messenger-integrated pipeline, another using Streak's free email tools for lightweight tracking — could reasonably run both without conflict.",
  "keyDifferences": [
    {
      "title": "Free-forever tier",
      "toolA": "Has no free (non-trial) plan; only a 14-day trial with full features except custom SMTP.",
      "toolB": "Offers free-forever email tools (tracking, snippets, mail merge up to 50/day) without requiring a paid plan, though full CRM/pipeline functionality is paid only.",
      "whyItMatters": "Teams that just need basic email tracking and mail merge, without pipeline management, can use Streak indefinitely at no cost; NetHunt requires payment for any lasting access.",
      "benefitsWho": "Individual sales reps or very small teams who only need lightweight email tools."
    },
    {
      "title": "MCP Server / AI assistant access",
      "toolA": "Includes an MCP Server on every plan, including the entry Basic tier, letting AI tools like ChatGPT and Claude query CRM data conversationally.",
      "toolB": "Offers AI data entry and natural-language queries with AI credits included per plan (20 to 500 per user/month by tier), but does not document an MCP Server.",
      "whyItMatters": "Teams standardizing on external AI assistants for CRM lookups get that capability from NetHunt's first paid tier, while Streak's AI is built into the product itself rather than exposed to outside assistants.",
      "benefitsWho": "Teams already using ChatGPT or Claude as a daily interface who want those tools to reach into CRM data."
    },
    {
      "title": "Messaging channel integration",
      "toolA": "Integrates WhatsApp, LinkedIn, and Instagram communications alongside Gmail (WhatsApp gated to the Basic Plus tier and above).",
      "toolB": "Focuses on Gmail/email; no non-email messaging channel integration is documented.",
      "whyItMatters": "Teams that follow up with prospects over WhatsApp or Instagram, not just email, need a CRM that unifies those channels.",
      "benefitsWho": "Sales teams working leads across messaging apps in addition to email."
    },
    {
      "title": "Browser support",
      "toolA": "Runs as a Chrome extension inside Gmail; no other browser support is documented.",
      "toolB": "Available as a browser extension for Chrome, Safari, and Microsoft Edge.",
      "whyItMatters": "Teams standardized on Safari or Edge rather than Chrome have broader access with Streak.",
      "benefitsWho": "Mac-heavy or Edge-standardized teams."
    },
    {
      "title": "Entry pricing",
      "toolA": "Starts at $24/user/month (Basic, billed annually).",
      "toolB": "Starts at $49/user/month (Pro, billed monthly).",
      "whyItMatters": "The roughly 2x price gap at the entry tier matters for budget-conscious small teams comparing total seat cost.",
      "benefitsWho": "Cost-sensitive small sales teams."
    }
  ],
  "featureMatrix": [
    {
      "group": "Gmail Integration & Channels",
      "rows": [
        {
          "feature": "Native Gmail/Google Workspace integration",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Multi-browser support (Chrome/Safari/Edge)",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "WhatsApp/Instagram/LinkedIn messaging",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "NetHunt: WhatsApp requires Basic Plus tier or above."
        },
        {
          "feature": "Free-forever tier for basic use",
          "toolA": "unavailable",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "AI Features",
      "rows": [
        {
          "feature": "MCP Server for AI assistant queries",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Included on every NetHunt plan, even Basic."
        },
        {
          "feature": "AI-automated data entry / natural-language queries",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "AI credits included per plan",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "20-500 credits/user/month depending on tier."
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Entry-level monthly price",
          "toolA": "available",
          "toolB": "available",
          "note": "NetHunt Basic $24/user/mo (annual); Streak Pro $49/user/mo (monthly)."
        },
        {
          "feature": "Free trial",
          "toolA": "available",
          "toolB": "available",
          "note": "NetHunt: 14-day, full features except custom SMTP. Streak: 14-day, Pro+ plan only."
        },
        {
          "feature": "Enterprise minimum seats documented",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Streak Enterprise requires a minimum of 10 seats."
        },
        {
          "feature": "API access",
          "toolA": "limited",
          "toolB": "not-documented",
          "note": "NetHunt API access requires the Business plan or above."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does NetHunt CRM work inside Gmail?",
      "answer": "Yes, it runs as a Chrome extension that integrates directly with Gmail and Google Workspace."
    },
    {
      "question": "Is Streak free?",
      "answer": "Core email tools (tracking, snippets, mail merge up to 50/day) are free forever, but full CRM plans start at $49/user/month."
    },
    {
      "question": "Can AI tools access NetHunt CRM data?",
      "answer": "Yes, every plan includes an MCP Server that lets AI tools like ChatGPT and Claude query CRM data conversationally."
    },
    {
      "question": "Does Streak have AI features?",
      "answer": "Yes, AI data entry and natural-language queries, with AI credits included per plan (20-500 per user/month depending on tier)."
    },
    {
      "question": "How much do NetHunt CRM and Streak cost to start?",
      "answer": "NetHunt starts at $24/user/month (Basic, billed annually); Streak starts at $49/user/month (Pro, billed monthly, $59 annually)."
    },
    {
      "question": "When was Streak founded?",
      "answer": "Streak was founded in 2011 and the site cites 4,000+ companies and 750,000+ professionals using it."
    }
  ]
};

export default nethuntCrmVsStreakContent;
