import type { ToolComparisonContent } from './types';

const appointletVsSetmoreContent: ToolComparisonContent = {
  "verdict": "Appointlet and Setmore are both freemium scheduling tools with similar core features, but Setmore's free plan includes payment acceptance and native mobile/desktop apps, while Appointlet gates payment collection and Zapier integration behind its Premium plan, though Appointlet's Premium price sits close to Setmore's Pro price per user.",
  "bestForToolA": "Teams that want unlimited meetings on a free plan, capped at 5 members and 25 meetings/month, with web-conference integration built in, and that qualify for Appointlet's 25% nonprofit/education discount.",
  "bestForToolB": "Businesses that want payment acceptance via Stripe, Square, or PayPal, and native mobile and desktop apps for iOS, Android, Windows, and macOS, available even on the free plan with up to 4 users and 200 appointments per month.",
  "whoNeedsBoth": "Based on the documented facts, both cover the same core use case of branded booking pages, calendar sync, and reminders, so there's no clear reason a team would need both simultaneously, the choice comes down to whether payments-on-free-tier and native apps (Setmore) or web-conferencing-on-free-tier and nonprofit discounts (Appointlet) matter more.",
  "keyDifferences": [
    {
      "title": "Payment acceptance on the free plan",
      "toolA": "Appointlet's free plan does not include payment collection; that requires the paid Premium plan.",
      "toolB": "Setmore's free plan includes payment acceptance through Stripe, Square, or PayPal.",
      "whyItMatters": "A business wanting to charge for bookings from day one avoids an upgrade with Setmore but not Appointlet.",
      "benefitsWho": "Small businesses or freelancers that need to charge for appointments immediately."
    },
    {
      "title": "Native mobile and desktop apps",
      "toolA": "Appointlet's facts do not mention native mobile or desktop apps.",
      "toolB": "Setmore offers native apps for iOS, Android, Windows, and macOS in addition to its web dashboard.",
      "whyItMatters": "Teams that manage bookings on the go need documented native app support, which is confirmed for Setmore.",
      "benefitsWho": "Mobile-first users like independent service providers managing their own schedule."
    },
    {
      "title": "Free-plan volume limits",
      "toolA": "Appointlet's free plan allows up to 5 members and 25 meetings per month total, with 1 scheduling page.",
      "toolB": "Setmore's free plan allows up to 4 users and 200 appointments per month.",
      "whyItMatters": "Setmore's free-tier appointment cap is substantially higher, which matters for busier solo operators or small teams staying on a free plan.",
      "benefitsWho": "Higher-volume businesses trying to avoid paying while still on a free tier."
    },
    {
      "title": "Compliance for regulated bookings",
      "toolA": "Appointlet's facts do not mention HIPAA or similar compliance.",
      "toolB": "Setmore's Pro plan explicitly offers HIPAA compliance with a signed BAA.",
      "whyItMatters": "Healthcare or other regulated providers need documented compliance support, which only Setmore confirms.",
      "benefitsWho": "Healthcare practices and other HIPAA-regulated service providers."
    },
    {
      "title": "Paid-tier pricing and structure",
      "toolA": "Appointlet's Premium plan is $9/member/month, billed annually, and unlocks unlimited members/meetings, payment collection, and Zapier/webhooks.",
      "toolB": "Setmore's Pro plan is $5/user/month, billed annually, and unlocks unlimited users/appointments, 2-way calendar sync, SMS reminders, and API access.",
      "whyItMatters": "Setmore's published per-user Pro price is lower, though the two plans unlock different feature sets, such as Zapier versus API access.",
      "benefitsWho": "Cost-sensitive teams comparing per-seat pricing directly."
    }
  ],
  "featureMatrix": [
    {
      "group": "Free Plan Capabilities",
      "rows": [
        {
          "feature": "Payment acceptance",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Native mobile/desktop apps",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Monthly meeting/appointment cap",
          "toolA": "limited",
          "toolB": "limited",
          "note": "Appointlet: 25/month, 5 members; Setmore: 200/month, 4 users"
        },
        {
          "feature": "Web conferencing integration",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Paid Plan Features",
      "rows": [
        {
          "feature": "Zapier/webhook integration",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "API access",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "SMS reminders",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "2-way calendar sync",
          "toolA": "available",
          "toolB": "available",
          "note": "Setmore: 2-way sync specified on Pro plan"
        }
      ]
    },
    {
      "group": "Compliance & Support",
      "rows": [
        {
          "feature": "HIPAA compliance",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Nonprofit/education discount",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Money-back guarantee",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Priority support",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Appointlet: Enterprise plan"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which free plan includes payment acceptance?",
      "answer": "Setmore's free plan includes payment acceptance through Stripe, Square, or PayPal. Appointlet requires the paid Premium plan for payment collection."
    },
    {
      "question": "Does either tool have native mobile apps?",
      "answer": "Setmore offers native apps for iOS, Android, Windows, and macOS. Appointlet's facts do not mention native mobile or desktop apps."
    },
    {
      "question": "What are the free-plan limits for each?",
      "answer": "Appointlet's free plan allows up to 5 members and 25 meetings per month with 1 scheduling page. Setmore's free plan allows up to 4 users and 200 appointments per month."
    },
    {
      "question": "How much do the paid plans cost?",
      "answer": "Appointlet's Premium plan is $9/member/month billed annually. Setmore's Pro plan is $5/user/month billed annually."
    },
    {
      "question": "Is either tool HIPAA compliant?",
      "answer": "Setmore's Pro plan explicitly offers HIPAA compliance with a signed BAA. Appointlet's facts do not mention HIPAA compliance."
    },
    {
      "question": "Does Appointlet offer any special discounts?",
      "answer": "Yes, Appointlet's site states a 25% discount for accredited educational institutions and nonprofits. No equivalent discount is documented for Setmore."
    }
  ]
};

export default appointletVsSetmoreContent;
