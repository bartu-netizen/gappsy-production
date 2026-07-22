import type { ToolComparisonContent } from './types';

const oncehubVsYoucanbookmeContent: ToolComparisonContent = {
  "verdict": "OnceHub and YouCanBookMe are both freemium booking-page tools, but OnceHub adds native AI phone and web-chat agents plus broad compliance certifications (HIPAA, PCI, FINRA) aimed at regulated industries, while YouCanBookMe focuses on a more traditional customizable booking page with native Stripe payment options, though its paid-tier pricing isn't published.",
  "bestForToolA": "Teams in regulated industries such as healthcare or finance that need HIPAA/PCI/FINRA-certified infrastructure, or that want native AI phone agents to convert missed calls into meetings and AI web chatbots to screen and route leads before booking.",
  "bestForToolB": "Businesses that want straightforward customizable booking pages with native Apple Pay/Google Pay/card payments via Stripe, and that are comfortable negotiating paid-tier pricing directly with sales once they outgrow the single-calendar free plan.",
  "whoNeedsBoth": "A company might use OnceHub for AI-driven inbound call/chat screening in a regulated department while other teams use YouCanBookMe's simpler booking pages for straightforward one-on-one scheduling, the AI screening layer and compliance certifications are OnceHub-specific and not documented for YouCanBookMe.",
  "keyDifferences": [
    {
      "title": "AI phone and chat agents",
      "toolA": "OnceHub includes AI phone agents that answer missed calls and convert them into scheduled meetings, plus AI web chatbots trained on your content that answer questions and route conversations 24/7, from the Engage plan ($39/seat/month).",
      "toolB": "YouCanBookMe's facts do not mention AI phone or chat features.",
      "whyItMatters": "Teams wanting automated lead screening via phone or chat before a booking happens have a documented option only with OnceHub.",
      "benefitsWho": "High-inbound-volume teams like support or sales development that want to triage leads with AI before a human is involved."
    },
    {
      "title": "Compliance certifications",
      "toolA": "OnceHub is GDPR, PCI, HIPAA, SOC2, and FINRA certified.",
      "toolB": "YouCanBookMe's facts do not mention any compliance certifications.",
      "whyItMatters": "Regulated industries like healthcare and finance typically require documented certifications such as HIPAA and FINRA before adopting a scheduling tool.",
      "benefitsWho": "Healthcare providers and financial services firms with compliance requirements."
    },
    {
      "title": "Pricing transparency for paid tiers",
      "toolA": "OnceHub publishes exact per-seat pricing for every tier: Schedule ($10/seat/month), Route ($19/seat/month), and Engage ($39/seat/month).",
      "toolB": "YouCanBookMe's Individual, Professional, and Team plans are all listed as 'Contact sales' with no published price.",
      "whyItMatters": "Buyers who want to compare cost before talking to sales can do so with OnceHub but not YouCanBookMe.",
      "benefitsWho": "Self-serve buyers and smaller teams without a procurement process."
    },
    {
      "title": "Payment method breadth",
      "toolA": "OnceHub's facts mention Stripe payments starting at the Schedule plan.",
      "toolB": "YouCanBookMe natively supports Apple Pay, Google Pay, and cards via Stripe, mentioned as a core feature available even on the Free plan.",
      "whyItMatters": "YouCanBookMe documents broader payment method support, including mobile wallets, and makes it available on its free tier.",
      "benefitsWho": "Businesses wanting mobile-wallet payment options for clients from day one."
    },
    {
      "title": "No-show and client-journey analytics",
      "toolA": "OnceHub's facts do not describe a dedicated no-show tracking feature.",
      "toolB": "YouCanBookMe includes analytics specifically on cancellations and the client journey.",
      "whyItMatters": "Teams tracking no-show rates as an operational metric have a named feature only in YouCanBookMe's facts.",
      "benefitsWho": "Operations teams monitoring booking reliability."
    }
  ],
  "featureMatrix": [
    {
      "group": "AI & Lead Screening",
      "rows": [
        {
          "feature": "AI phone agent",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "AI web chatbot",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "OnceHub: Engage plan"
        },
        {
          "feature": "Lead screening before booking",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Multi-host/concurrent meetings",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Payments & Booking Page",
      "rows": [
        {
          "feature": "Payment processing",
          "toolA": "available",
          "toolB": "available",
          "note": "OnceHub: Schedule plan+; YouCanBookMe: Free plan"
        },
        {
          "feature": "Customizable branded booking page",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "No-show/cancellation analytics",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Group/session discount codes",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Pricing & Compliance",
      "rows": [
        {
          "feature": "Free plan",
          "toolA": "available",
          "toolB": "available",
          "note": "OnceHub: 1 user/1 calendar/1 link; YouCanBookMe: 1 calendar/1 page"
        },
        {
          "feature": "Published paid-tier pricing",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "HIPAA/FINRA/PCI compliance",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Dedicated phone numbers",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "OnceHub: Schedule plan+"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does OnceHub or YouCanBookMe offer AI features?",
      "answer": "OnceHub does, with native AI phone agents that answer missed calls and AI web chatbots available from the Engage plan. YouCanBookMe's facts do not mention AI features."
    },
    {
      "question": "Which tool publishes its paid pricing?",
      "answer": "OnceHub publishes exact per-seat pricing for Schedule ($10/seat/month), Route ($19/seat/month), and Engage ($39/seat/month). YouCanBookMe's Individual, Professional, and Team plans are all 'Contact sales.'"
    },
    {
      "question": "Is either tool suited for regulated industries?",
      "answer": "OnceHub is GDPR, PCI, HIPAA, SOC2, and FINRA certified. YouCanBookMe's facts do not mention compliance certifications."
    },
    {
      "question": "What payment methods does each support?",
      "answer": "YouCanBookMe supports Apple Pay, Google Pay, and cards via Stripe as a core feature. OnceHub mentions Stripe payments starting at its Schedule plan."
    },
    {
      "question": "Do either offer a free trial on paid tiers?",
      "answer": "OnceHub offers a 14-day trial of its Engage plan without a credit card. YouCanBookMe offers a 2-week free trial with no credit card required on paid tiers."
    },
    {
      "question": "Which tool tracks no-shows?",
      "answer": "YouCanBookMe includes analytics specifically on cancellations and the client journey. OnceHub's facts do not describe an equivalent no-show tracking feature."
    }
  ]
};

export default oncehubVsYoucanbookmeContent;
