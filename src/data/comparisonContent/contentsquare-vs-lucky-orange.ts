import type { ToolComparisonContent } from './types';

const contentsquareVsLuckyOrangeContent: ToolComparisonContent = {
  "verdict": "Contentsquare is an enterprise experience-intelligence platform unifying Experience Analytics, Product Analytics, Voice of Customer, and Conversation Intelligence under a contextual Sense AI Agent, serving 3,000+ enterprise and mid-market brands, with genuine free plans (200,000 sessions for Experience Analytics, 100 responses for Voice of Customer) and Growth tiers from $49/month. Lucky Orange is a more focused toolset — heatmaps, session recordings, funnels, surveys, and live chat plus Discovery AI — that bundles its full feature set into every tier rather than gating by capability, priced from $32/month for 3,500 monthly sessions with a 7-day free trial. The decision largely comes down to whether a team needs Contentsquare's broader multi-product suite or Lucky Orange's simpler, ungated feature set.",
  "bestForToolA": "Enterprise and mid-market brands wanting a unified experience-intelligence suite spanning behavioral analytics, product analytics, and voice-of-customer feedback, with AI-driven recommendations from the Sense AI Agent.",
  "bestForToolB": "Small to mid-sized site owners wanting one affordable tool that bundles heatmaps, session recordings, funnels, surveys, and live chat into every plan without feature gating between tiers.",
  "whoNeedsBoth": "Unlikely in practice — both cover the same core job (heatmaps, session replay, funnels) for understanding visitor behavior, so a team would typically choose the one that matches its scale, budget, and need for a broader product-analytics/voice-of-customer suite rather than running both in parallel.",
  "keyDifferences": [
    {
      "title": "Free Plan Structure",
      "toolA": "Contentsquare offers standalone free plans: Experience Analytics Free (200,000 monthly sessions, 1 project, basic surveys) and Voice of Customer Free (100 monthly responses, 3 surveys) at $0.",
      "toolB": "Lucky Orange has no permanent free plan, only a 7-day free trial with full feature access and no credit card required before paid billing starts at $32/month.",
      "whyItMatters": "A permanent free tier lets teams use core analytics indefinitely at no cost, while a trial requires a purchase decision within a week.",
      "benefitsWho": "Smaller sites or teams wanting to evaluate or use behavioral analytics long-term without a budget commitment."
    },
    {
      "title": "Feature Gating by Tier",
      "toolA": "Contentsquare gates specific capabilities by tier — zone-based heatmaps, journey analysis, and AI summaries require the $49/month Growth plan rather than the free tier.",
      "toolB": "Lucky Orange includes its full feature set (heatmaps, recordings, funnels, surveys, live chat) on every paid tier, gating only by monthly tracked session volume.",
      "whyItMatters": "Teams need to know whether upgrading unlocks new capabilities or simply more usage headroom for the same capabilities.",
      "benefitsWho": "Teams that want predictable, full-featured access from day one (Lucky Orange) versus teams willing to start smaller and add capabilities later (Contentsquare)."
    },
    {
      "title": "Product Breadth",
      "toolA": "Contentsquare unifies four distinct products — Experience Analytics, Product Analytics, Voice of Customer, and Conversation Intelligence — plus the Sense AI Agent and Mobile App Analytics.",
      "toolB": "Lucky Orange is a single, more focused toolset centered on heatmaps, session recordings, funnels, surveys, and live chat, plus Discovery AI.",
      "whyItMatters": "Enterprise teams needing account-level product analytics and voice-of-customer survey data alongside behavioral analytics have documented options only with Contentsquare.",
      "benefitsWho": "Enterprise teams that want one vendor covering multiple analytics disciplines versus smaller teams that just need core heatmap/recording tools."
    },
    {
      "title": "Entry-Level Paid Pricing",
      "toolA": "Contentsquare's Experience Analytics Growth plan starts at $49/month (from 7,000 monthly sessions), and Voice of Customer Growth starts at $99/month (from 500 monthly responses).",
      "toolB": "Lucky Orange's entry paid tier, Build, is $32/month for 3,500 monthly tracked sessions, rising to Scale at $839/month for 300,000+ sessions.",
      "whyItMatters": "Lucky Orange is cheaper to start paying for, but Contentsquare's free plan covers far more sessions (200,000) before any payment is required at all.",
      "benefitsWho": "High-traffic sites that can stay on Contentsquare's free tier longer, versus lower-traffic sites wanting the cheapest entry paid price."
    },
    {
      "title": "Live Chat and Surveys",
      "toolA": "Contentsquare packages surveys under its separately priced Voice of Customer product line rather than bundling them into Experience Analytics.",
      "toolB": "Lucky Orange bundles built-in surveys and live chat into every plan at no extra charge alongside heatmaps and recordings.",
      "whyItMatters": "Teams wanting visitor communication tools (chat, surveys) without buying a separate product line get that included with one platform but not the other by default.",
      "benefitsWho": "Smaller teams that want live chat and surveys included without purchasing an additional product tier."
    }
  ],
  "featureMatrix": [
    {
      "group": "Behavioral Analytics",
      "rows": [
        {
          "feature": "Session replay",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Heatmaps",
          "toolA": "available",
          "toolB": "available",
          "note": "Contentsquare adds zone-based heatmaps on Growth; Lucky Orange includes dynamic heatmaps on every tier"
        },
        {
          "feature": "Conversion funnels",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Live visitor view (real-time)",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Mobile app analytics",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "AI Capabilities",
      "rows": [
        {
          "feature": "Contextual AI assistant for recommendations",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Contentsquare's Sense AI Agent"
        },
        {
          "feature": "AI-powered behavior Q&A with evidence links",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Lucky Orange's Discovery AI"
        },
        {
          "feature": "AI-powered survey response analysis",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Contentsquare's Voice of Customer"
        },
        {
          "feature": "AI summaries in journey analysis",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Pricing & Plan Structure",
      "rows": [
        {
          "feature": "Permanent free plan",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Lucky Orange offers a 7-day trial instead"
        },
        {
          "feature": "Full feature set on every paid tier",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Contentsquare gates some features to Growth and above"
        },
        {
          "feature": "Built-in live chat and surveys",
          "toolA": "limited",
          "toolB": "available",
          "note": "Contentsquare's surveys are part of the separate Voice of Customer product"
        },
        {
          "feature": "Additional website/site pricing",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Lucky Orange charges $5 per extra site"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Contentsquare or Lucky Orange have a free plan?",
      "answer": "Contentsquare offers standalone free plans for Experience Analytics (200,000 monthly sessions) and Voice of Customer (100 monthly responses). Lucky Orange has no permanent free plan, only a 7-day free trial with full feature access before paid billing begins at $32/month."
    },
    {
      "question": "Which is cheaper for a small site?",
      "answer": "Lucky Orange's entry paid tier is $32/month for 3,500 monthly sessions. Contentsquare's Experience Analytics Growth plan starts at $49/month from 7,000 sessions, though its free tier covers up to 200,000 sessions before any payment is needed."
    },
    {
      "question": "Does either platform include live chat?",
      "answer": "Lucky Orange includes built-in live chat and surveys on every plan at no extra charge. Contentsquare offers surveys through its separately priced Voice of Customer product line rather than bundling them into every plan."
    },
    {
      "question": "What is Discovery AI versus Sense?",
      "answer": "Lucky Orange's Discovery AI analyzes live visitor behavior and answers specific questions about site performance with a direct link to supporting evidence. Contentsquare's Sense is a contextual AI agent that surfaces recommendations from behavioral data across its broader product suite."
    },
    {
      "question": "Does Contentsquare offer more than heatmaps and session recordings?",
      "answer": "Yes. Beyond Experience Analytics (session replay, heatmaps, funnels), Contentsquare also includes Product Analytics, Voice of Customer surveys, Conversation Intelligence, and Mobile App Analytics as separate but unified products."
    },
    {
      "question": "Is there a free trial for Contentsquare?",
      "answer": "Yes, new accounts get a 15-day trial of the Growth plan with no payment required, in addition to its separate permanent free plans for Experience Analytics and Voice of Customer."
    }
  ]
};

export default contentsquareVsLuckyOrangeContent;
