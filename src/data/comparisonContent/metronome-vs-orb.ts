import type { ToolComparisonContent } from './types';

const metronomeVsOrbContent: ToolComparisonContent = {
  "verdict": "Metronome and Orb both automate usage-based billing for SaaS and AI companies, but they emerged from different lineages: Metronome is now part of Stripe and leads with a native Stripe integration and a published Starter-tier price ($100,000 billing volume included, then 0.8%, plus 10M events before $0.04/1,000 overage), while Orb keeps all three of its tiers (Core, Advanced, Enterprise) fully quote-based, built around a billings-plus-events pricing formula and pricing-simulation tooling. Neither publishes a free trial or free plan, and both require a sales conversation once volume grows, so the real choice often comes down to whether a team is already anchored to Stripe for payments or wants Orb's dedicated pricing-experimentation and finance-integration toolset.",
  "bestForToolA": "Teams already processing payments through Stripe, or those that want a published starting price point ($100,000 billing volume / 10M events included) to budget against before talking to sales — companies like OpenAI, Cribl, and Fly.io are cited as Metronome customers.",
  "bestForToolB": "Teams that want dedicated tools for designing and simulating pricing changes before rollout (Orb's Price Modeling and Experience Kit), and who are comfortable going straight to a custom quote based on billings and events — customers cited include Vercel, Supabase, Redis, LaunchDarkly, and Replit.",
  "whoNeedsBoth": "Companies exploring a billing-platform migration or running an RFP may need to evaluate both, since neither publishes full pricing across all tiers and the final cost for either depends on a sales conversation about actual billing volume and event counts.",
  "keyDifferences": [
    {
      "title": "Stripe integration and ownership",
      "toolA": "Metronome is now part of Stripe and includes a native Stripe integration for payment processing.",
      "toolB": "Orb is not described as having a Stripe-specific integration in the facts provided; it connects to finance tools like Salesforce and NetSuite on higher tiers instead.",
      "whyItMatters": "Teams already standardized on Stripe for payments may get a more direct hand-off from metering to charging without extra integration work.",
      "benefitsWho": "SaaS and AI companies whose payment processor is already Stripe."
    },
    {
      "title": "Published starting price",
      "toolA": "Metronome's Starter plan has a stated starting point: $100,000 in billing volume included (0.8% after) and 10M events included ($0.04 per 1,000 after).",
      "toolB": "Orb has no public pricing on any tier — Core, Advanced, and Enterprise all require contacting sales.",
      "whyItMatters": "A published entry price lets a team estimate early costs without a sales cycle, while Orb's approach means budgeting requires a conversation up front.",
      "benefitsWho": "Earlier-stage teams that want to self-serve a rough cost estimate before committing time to a sales process."
    },
    {
      "title": "Pricing experimentation vs. price modeling",
      "toolA": "Metronome offers cohort-based rollouts for testing new pricing models (Pricing experimentation).",
      "toolB": "Orb offers dedicated tools for designing, evolving, and simulating pricing changes before rollout (Price Modeling), plus a prebuilt Experience Kit of dashboards and checkout components.",
      "whyItMatters": "Both support iterating on pricing, but Orb's facts emphasize simulation and pre-built checkout/dashboard UI components as a distinct toolset.",
      "benefitsWho": "Revenue and pricing teams running multiple pricing experiments or needing ready-made billing UI rather than building it themselves."
    },
    {
      "title": "Finance and CRM integrations",
      "toolA": "Salesforce, NetSuite, and AWS/Azure/GCP marketplace integrations plus data warehouse and BI exports are included on Metronome's Custom plan.",
      "toolB": "Salesforce and NetSuite integrations plus data warehouse sync are included on Orb's Advanced tier (not the entry Core tier).",
      "whyItMatters": "Where these integrations sit in the plan structure affects which tier a finance-heavy organization actually needs to buy.",
      "benefitsWho": "Finance and RevOps teams that depend on CRM/ERP sync for revenue reporting."
    },
    {
      "title": "Customer base cited",
      "toolA": "Metronome cites OpenAI, Cribl, and Fly.io as users.",
      "toolB": "Orb cites Vercel, Supabase, Redis, LaunchDarkly, and Replit as users.",
      "whyItMatters": "The named customers suggest each platform's traction with different segments of infrastructure and AI companies, a useful reference point during vendor evaluation.",
      "benefitsWho": "Buyers doing reference checks against companies with a similar profile to their own."
    }
  ],
  "featureMatrix": [
    {
      "group": "Metering & Billing Core",
      "rows": [
        {
          "feature": "Real-time usage metering",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Automated invoicing",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Orb names 'Orb Invoicing' explicitly; Metronome's facts don't list a distinct invoicing feature."
        },
        {
          "feature": "Spend controls / alerts",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Configurable rate cards",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Pricing Strategy Tools",
      "rows": [
        {
          "feature": "Pricing experimentation / simulation",
          "toolA": "available",
          "toolB": "available",
          "note": "Metronome: cohort-based rollouts. Orb: Price Modeling with simulation."
        },
        {
          "feature": "Prebuilt checkout/dashboard components",
          "toolA": "limited",
          "toolB": "available",
          "note": "Metronome has embeddable billing dashboards; Orb's Experience Kit adds checkout flow components too."
        },
        {
          "feature": "Published starting price",
          "toolA": "available",
          "toolB": "unavailable"
        }
      ]
    },
    {
      "group": "Enterprise & Integrations",
      "rows": [
        {
          "feature": "Native Stripe integration",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Salesforce / NetSuite integration",
          "toolA": "available",
          "toolB": "available",
          "note": "Metronome: Custom plan. Orb: Advanced tier."
        },
        {
          "feature": "Data warehouse / BI export",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Free trial or free plan",
          "toolA": "unavailable",
          "toolB": "unavailable"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Metronome still a separate company from Stripe?",
      "answer": "No — per the facts, Metronome is now part of Stripe, combining both companies' monetization capabilities and including a native Stripe integration."
    },
    {
      "question": "Does Orb publish its pricing?",
      "answer": "No — all three Orb tiers (Core, Advanced, Enterprise) require contacting sales, with pricing based on billings and events plus a platform fee on Advanced and Enterprise."
    },
    {
      "question": "What's included in Metronome's Starter plan?",
      "answer": "$100,000 in billing volume (0.8% after) and 10M events ($0.04 per 1,000 after), along with real-time metering, rate cards, and Stripe integration."
    },
    {
      "question": "Which companies use each platform?",
      "answer": "Metronome cites OpenAI, Cribl, and Fly.io; Orb cites Vercel, Supabase, Redis, LaunchDarkly, and Replit."
    },
    {
      "question": "Do either Metronome or Orb offer a free trial?",
      "answer": "No — neither platform's facts mention a free trial or free plan."
    },
    {
      "question": "Which platform has dedicated pricing-simulation tools?",
      "answer": "Orb's Price Modeling tools are described as designing, evolving, and simulating pricing changes before rollout; Metronome offers cohort-based Pricing experimentation for testing new pricing models."
    }
  ]
};

export default metronomeVsOrbContent;
