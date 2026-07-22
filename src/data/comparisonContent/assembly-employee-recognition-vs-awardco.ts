import type { ToolComparisonContent } from './types';

const assemblyEmployeeRecognitionVsAwardcoContent: ToolComparisonContent = {
  "verdict": "Assembly is a transparently priced ($3/user/month) recognition platform with a disclosed Omaha, Nebraska headquarters and an AI-powered Dora Hub, currently in the process of joining Quantum Workplace. Awardco is an enterprise recognition platform with a much larger disclosed rewards network - 300 million options across 135 countries - plus a built-in benefits/perks feature and survey tool, sold entirely through custom quotes.",
  "bestForToolA": "Budget-conscious teams that want published per-user pricing and can evaluate cost upfront without a sales call.",
  "bestForToolB": "Larger global enterprises at the scale of Okta, ClickUp, or Zillow needing a massive multi-country, multi-currency reward catalog plus integrated benefits/perks and survey tools.",
  "whoNeedsBoth": "There's no realistic scenario for running both - they serve the identical peer recognition and rewards use case, so this is a direct either/or vendor decision rather than a complementary pairing.",
  "keyDifferences": [
    {
      "title": "Pricing Transparency",
      "toolA": "Assembly publishes its Empower plan at $3/user/month billed yearly, with a custom Enterprise tier.",
      "toolB": "Awardco has no public pricing at all; the site requires contacting sales.",
      "whyItMatters": "Published pricing lets buyers do initial cost comparisons without engaging sales.",
      "benefitsWho": "Smaller teams or procurement processes that want upfront cost visibility."
    },
    {
      "title": "Rewards Network Scale",
      "toolA": "Assembly's Rewards Program is points-based, redeemable for gift cards or charity donations, without a stated options count or country/currency breadth.",
      "toolB": "Awardco offers a configurable reward network spanning 300 million options across 135 countries and 163 currencies.",
      "whyItMatters": "Global organizations need reward catalogs that work across many currencies and local markets.",
      "benefitsWho": "Multinational companies needing localized reward options for a globally distributed workforce."
    },
    {
      "title": "Employee Benefits & Perks",
      "toolA": "Assembly's feature list does not include benefits or perks administration.",
      "toolB": "Awardco includes a dedicated Benefits & Perks feature offering personalized employee benefits.",
      "whyItMatters": "Bundling recognition with benefits/perks can consolidate vendor relationships for HR teams.",
      "benefitsWho": "HR teams wanting to consolidate recognition and benefits perks in one vendor."
    },
    {
      "title": "AI Feature Focus",
      "toolA": "Assembly's Dora Hub delivers AI-powered culture insights, nudges, and trend data, plus AI-suggested prompts for managers.",
      "toolB": "Awardco Intelligence is described generally as AI-enhanced recognition capabilities, without further public detail.",
      "whyItMatters": "The depth of documented AI functionality can signal how mature and specific the AI features actually are.",
      "benefitsWho": "Teams wanting more specifically described AI culture analytics (Assembly) versus general AI-enhanced recognition (Awardco)."
    },
    {
      "title": "Company Transparency",
      "toolA": "Assembly discloses an Omaha, Nebraska headquarters but not a founding year.",
      "toolB": "Awardco discloses a 2015 founding year but not a headquarters location.",
      "whyItMatters": "Different transparency gaps mean buyers must weigh which disclosed facts matter more for their due diligence.",
      "benefitsWho": "Procurement teams doing vendor background checks."
    }
  ],
  "featureMatrix": [
    {
      "group": "Recognition & Rewards",
      "rows": [
        {
          "feature": "Peer-to-peer recognition",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Rewards network scale",
          "toolA": "available",
          "toolB": "available",
          "note": "Awardco: 300M options, 135 countries, 163 currencies"
        },
        {
          "feature": "Custom incentive programs",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Milestone/anniversary celebrations",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Employee benefits & perks",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "AI & Engagement",
      "rows": [
        {
          "feature": "AI-powered culture/recognition insights",
          "toolA": "available",
          "toolB": "available",
          "note": "Assembly: Dora Hub; Awardco: Awardco Intelligence"
        },
        {
          "feature": "Employee survey/feedback tool",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Awardco Engage"
        },
        {
          "feature": "Real-time reporting dashboards",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Manager enablement/AI prompts",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Pricing & Company Info",
      "rows": [
        {
          "feature": "Published pricing",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Assembly: $3/user/month"
        },
        {
          "feature": "Founding year disclosed",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Awardco: 2015"
        },
        {
          "feature": "Headquarters disclosed",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Assembly: Omaha, NE"
        },
        {
          "feature": "G2 rating disclosed",
          "toolA": "available",
          "toolB": "available",
          "note": "Both 4.9/5; Assembly 3,000+ reviews, Awardco 6,000+ reviews"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "How does pricing compare?",
      "answer": "Assembly publishes its Empower plan at $3/user/month billed yearly with custom Enterprise pricing. Awardco publishes no pricing at all and requires contacting sales."
    },
    {
      "question": "How big is each rewards network?",
      "answer": "Awardco states a configurable network of 300 million reward options across 135 countries and 163 currencies. Assembly describes points redeemable for gift cards or charity donations without a stated options count."
    },
    {
      "question": "Does Awardco include employee benefits administration?",
      "answer": "Yes, Benefits & Perks is a listed Awardco feature. Assembly's feature list does not include benefits administration."
    },
    {
      "question": "What AI features does each have?",
      "answer": "Assembly has Dora Hub for culture insights and AI-suggested manager prompts. Awardco has Awardco Intelligence, described only generally as AI-enhanced recognition capabilities."
    },
    {
      "question": "Which has more G2 reviews?",
      "answer": "Awardco reports 4.9/5 from 6,000+ reviews as the top-rated platform overall. Assembly reports 4.9/5 from 3,000+ reviews, ranked #1 specifically for Employee Recognition & Rewards Platform."
    },
    {
      "question": "When was each company founded?",
      "answer": "Awardco was founded in 2015, per its FAQ. Assembly's founding year is not disclosed on its site."
    }
  ]
};

export default assemblyEmployeeRecognitionVsAwardcoContent;
