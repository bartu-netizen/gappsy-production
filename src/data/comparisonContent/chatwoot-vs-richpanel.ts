import type { ToolComparisonContent } from './types';

const chatwootVsRichpanelContent: ToolComparisonContent = {
  "verdict": "Chatwoot and Richpanel both lean on AI to cut ticket volume, but they solve different problems. Chatwoot is an open-source, self-hostable inbox with a free tier for teams that want data ownership and predictable flat pricing, while Richpanel is a SaaS-only, ecommerce-specific helpdesk that backs its AI with a 50%-resolution-in-30-days guarantee and usage-based billing. Neither is a blanket winner: the right pick depends on whether self-hosting and fixed cost or a guaranteed AI outcome for an online store matters more.",
  "bestForToolA": "Teams that want to self-host for full data ownership, start free on a 2-agent plan, or need SOC 2 Type II compliance without paying per AI conversation.",
  "bestForToolB": "Ecommerce brands that want an AI resolution guarantee (50% of tickets resolved within 30 days or a refund) plus commerce-specific integrations like Shopify, Recharge, Loop Returns, and AfterShip.",
  "whoNeedsBoth": "A DTC brand with strict data-residency requirements for internal team chat but that also wants a dedicated AI-guaranteed storefront support layer could run Chatwoot self-hosted internally while using Richpanel as the customer-facing ecommerce helpdesk, since the two differ sharply in ecommerce-specific depth.",
  "keyDifferences": [
    {
      "title": "Deployment model",
      "toolA": "Offers a self-hosted, open-source deployment option for full data ownership, alongside a hosted plan.",
      "toolB": "Delivered as SaaS; no self-hosting option is documented.",
      "whyItMatters": "Data residency and infrastructure control requirements rule out SaaS-only tools for some organizations.",
      "benefitsWho": "Compliance-sensitive or infrastructure-conscious teams."
    },
    {
      "title": "Pricing structure",
      "toolA": "Flat per-agent tiers from $0 to $99/agent/month, with Captain AI credits capped per plan and paid add-ons if exceeded.",
      "toolB": "$99/agent/month plus roughly $0.20 per AI-handled conversation, with a $200/month minimum.",
      "whyItMatters": "Fixed pricing is easier to budget; usage-based AI pricing scales with resolution volume but is less predictable as support volume grows.",
      "benefitsWho": "Budget-constrained teams vs. teams that want AI cost tied directly to usage."
    },
    {
      "title": "Free entry point",
      "toolA": "Free Hacker plan for up to 2 agents and 500 conversations/month, live chat only.",
      "toolB": "No published free or flat tier; costs start at $99/agent/month plus AI usage fees.",
      "whyItMatters": "A free tier lowers the barrier to trying the product before committing budget.",
      "benefitsWho": "Small teams and startups evaluating a helpdesk before paying."
    },
    {
      "title": "AI resolution guarantee",
      "toolA": "Captain AI agent automates conversations, but usage is capped by plan with paid add-ons beyond that; no resolution guarantee is stated.",
      "toolB": "Guarantees 50% of tickets resolved by AI within 30 days, or a refund.",
      "whyItMatters": "A stated, refund-backed guarantee gives ops leaders a concrete performance commitment to plan around.",
      "benefitsWho": "Ecommerce operations teams that need to justify AI spend to leadership."
    },
    {
      "title": "Ecommerce-specific depth",
      "toolA": "General omnichannel inbox (website chat, WhatsApp, Facebook, Instagram, Telegram) with a knowledge base; no ecommerce-specific integrations listed.",
      "toolB": "40+ integrations including Shopify, Recharge, Loop Returns, and AfterShip, plus a self-service portal for orders, returns, and subscriptions.",
      "whyItMatters": "Native commerce integrations reduce manual order lookups and let customers self-serve returns and tracking.",
      "benefitsWho": "DTC and ecommerce support teams handling order-related tickets."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Support Features",
      "rows": [
        {
          "feature": "Omnichannel inbox",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "AI ticket automation",
          "toolA": "available",
          "toolB": "available",
          "note": "Chatwoot's Captain AI credits are capped per plan; Richpanel bills AI usage separately."
        },
        {
          "feature": "Self-service customer portal",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Self-hosted deployment",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Knowledge base",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Multi-brand management",
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
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Usage-based AI billing",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Voice channel",
          "toolA": "limited",
          "toolB": "available",
          "note": "Chatwoot voice requires the top Enterprise plan ($99/agent/month)."
        },
        {
          "feature": "SSO/SAML",
          "toolA": "limited",
          "toolB": "not-documented",
          "note": "Chatwoot SSO/SAML is Enterprise-tier only."
        }
      ]
    },
    {
      "group": "Trust & Compliance",
      "rows": [
        {
          "feature": "SOC 2 Type II",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "HIPAA compliance",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "GDPR compliance",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Chatwoot have a free plan?",
      "answer": "Yes, the Hacker plan is free for up to 2 agents and 500 conversations/month, live chat only."
    },
    {
      "question": "Can I self-host Chatwoot?",
      "answer": "Yes, a self-hosted option is available for organizations wanting full data sovereignty; Richpanel does not document a self-hosting option."
    },
    {
      "question": "Does Richpanel offer a free plan?",
      "answer": "No, Richpanel has no published flat or free tier; pricing starts at $99/agent/month plus AI usage fees, with a $200/month minimum."
    },
    {
      "question": "What is Richpanel's AI resolution guarantee?",
      "answer": "Richpanel guarantees 50% of tickets resolved by AI within 30 days, or a refund."
    },
    {
      "question": "Which channels does Richpanel support?",
      "answer": "Email, chat, Instagram, WhatsApp, SMS, and voice, all in one inbox."
    },
    {
      "question": "Is Chatwoot open source?",
      "answer": "Yes, it is an open-source platform with a self-hosted deployment option, unlike the SaaS-only Richpanel."
    }
  ]
};

export default chatwootVsRichpanelContent;
