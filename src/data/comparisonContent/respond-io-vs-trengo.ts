import type { ToolComparisonContent } from './types';

const respondIoVsTrengoContent: ToolComparisonContent = {
  "verdict": "Respond.io and Trengo both unify messaging channels behind AI agents, but they sit at very different price points and channel coverage. Respond.io starts at $79/month and adds TikTok and VoIP-based WhatsApp/Messenger calls to its channel mix, while Trengo's entry Boost plan starts at €299/month for up to 10 users and claims AI Agents can resolve up to 80% of routine conversations. Neither is a clear overall winner: the decision comes down to entry budget, need for TikTok/voice-calling support, and tolerance for per-conversation overage fees on both platforms.",
  "bestForToolA": "Teams that want a lower entry price ($79/month), need TikTok as a supported channel, or want VoIP-based WhatsApp Business Calls and Messenger Calls alongside chat.",
  "bestForToolB": "Larger teams from the outset (10+ users included on the entry Boost plan) that want AI Agents specifically marketed at resolving up to 80% of routine conversations and AI Voice Agents for phone interactions.",
  "whoNeedsBoth": "A brand running region-specific messaging strategies might use Respond.io for its TikTok and Meta-call-heavy markets while adopting Trengo where its established Shopify, HubSpot, and Salesforce integrations already anchor an existing workflow — but for most teams the overlap in core omnichannel inbox functionality means picking one rather than running both.",
  "keyDifferences": [
    {
      "title": "Entry price and included users",
      "toolA": "Starter plan is $79/month with 5 users included.",
      "toolB": "Boost plan is €299/month with 10 users included.",
      "whyItMatters": "The roughly 3-4x price gap at entry level matters significantly for smaller teams or those just starting with conversational commerce.",
      "benefitsWho": "Budget-constrained small teams (Respond.io) vs. teams needing more seats from day one (Trengo)."
    },
    {
      "title": "Channel coverage",
      "toolA": "Unifies WhatsApp, TikTok, Instagram, and Facebook, plus VoIP-based WhatsApp Business Calls and Messenger Calls.",
      "toolB": "Unifies WhatsApp, email, Instagram, Facebook, and voice.",
      "whyItMatters": "TikTok support and native VoIP calling within chat channels are specific capabilities not both platforms share per the facts.",
      "benefitsWho": "Brands running TikTok-based customer acquisition or wanting voice calls inside the same inbox as chat."
    },
    {
      "title": "Company transparency",
      "toolA": "Founded in 2017, headquartered in Kuala Lumpur, Malaysia.",
      "toolB": "Founding year and headquarters are not disclosed in the available facts.",
      "whyItMatters": "Company background can factor into vendor due diligence and long-term viability assessment.",
      "benefitsWho": "Procurement and security teams performing vendor evaluation."
    },
    {
      "title": "Overage and add-on billing",
      "toolA": "Additional users cost extra on every tier ($12-$24/month per user); workflow automation and AI agents require the Growth plan ($159/month) and above.",
      "toolB": "Conversation volume beyond the plan cap (500/month on Boost) costs €18 per 100; AI-enhanced conversations are billed separately at €0.30 each.",
      "whyItMatters": "Both platforms have overage mechanics, but they apply to different usage dimensions (extra users vs. extra conversations/AI usage), which changes which growth pattern gets expensive faster.",
      "benefitsWho": "Teams that need to model total cost of ownership as they scale headcount or conversation volume."
    },
    {
      "title": "Trial and onboarding",
      "toolA": "7-day free trial with no credit card required; reports 99.999% uptime and a 4.8/5 G2 rating from 500+ reviews.",
      "toolB": "Directs new users to a trial signup from its homepage, though trial length and terms are not detailed on the pricing page.",
      "whyItMatters": "A clearly stated trial length and terms reduce friction and uncertainty when evaluating a new tool.",
      "benefitsWho": "Teams that want to evaluate before committing budget."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Features",
      "rows": [
        {
          "feature": "Unified team inbox",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "AI agents for automated resolution",
          "toolA": "available",
          "toolB": "available",
          "note": "Gated behind Respond.io's Growth plan ($159/month) and above."
        },
        {
          "feature": "TikTok channel",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Voice channel",
          "toolA": "available",
          "toolB": "available",
          "note": "Respond.io offers VoIP-based WhatsApp/Messenger Calls; Trengo offers AI Voice Agents."
        },
        {
          "feature": "Developer API",
          "toolA": "limited",
          "toolB": "not-documented",
          "note": "Respond.io's API is included from the Growth plan up."
        },
        {
          "feature": "CRM/business integrations (Shopify, HubSpot, Salesforce)",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Permanent free tier",
          "toolA": "unavailable",
          "toolB": "unavailable"
        },
        {
          "feature": "SSO",
          "toolA": "limited",
          "toolB": "not-documented",
          "note": "Respond.io SSO requires the Advanced plan ($279/month)."
        },
        {
          "feature": "Custom channels",
          "toolA": "limited",
          "toolB": "not-documented",
          "note": "Respond.io custom channels require the Advanced plan."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "When was Respond.io founded?",
      "answer": "Respond.io was founded on February 17, 2017, and is headquartered in Kuala Lumpur, Malaysia; Trengo does not disclose founding year or headquarters."
    },
    {
      "question": "Does Trengo have a free plan?",
      "answer": "No published free-forever plan; pricing starts at the Boost plan (€299/month for up to 10 users)."
    },
    {
      "question": "How much does Respond.io cost?",
      "answer": "Plans start at $79/month (Starter) and go up to $279/month (Advanced), plus custom Enterprise pricing."
    },
    {
      "question": "How much do extra conversations cost on Trengo?",
      "answer": "Additional conversations beyond a plan's included volume cost €18 per 100, and AI-enhanced conversations cost €0.30 each."
    },
    {
      "question": "Does Respond.io offer a free plan?",
      "answer": "No; it offers a 7-day free trial with no credit card required, not a free-forever tier."
    },
    {
      "question": "What channels does Trengo support?",
      "answer": "WhatsApp, email, Instagram, Facebook, and voice, unified into one inbox."
    }
  ]
};

export default respondIoVsTrengoContent;
