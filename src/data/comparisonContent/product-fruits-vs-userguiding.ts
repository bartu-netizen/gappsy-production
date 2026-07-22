import type { ToolComparisonContent } from './types';

const productFruitsVsUserguidingContent: ToolComparisonContent = {
  "verdict": "Product Fruits and UserGuiding both offer no-code product tours, checklists, tooltips, and an AI support assistant, aimed at similar product-onboarding use cases. The main difference the facts surface is plan structure: UserGuiding has a free-forever Support Essentials tier plus a 14-day trial and money-back guarantee, while Product Fruits has no free tier but includes a free trial on every paid plan and a lower list starting price.",
  "bestForToolA": "Teams wanting Product Fruits' Elvin Copilot AI assistant (claimed by the vendor to resolve 93% of support questions) and a lower Starter price point ($96/month, $72/month billed annually), with a free trial available on every plan.",
  "bestForToolB": "Teams that want to start on a genuinely free-forever plan (Support Essentials, including 50 free AI Assistant resolutions) before committing to paid onboarding tooling, or that value a 30-day money-back guarantee on paid plans.",
  "whoNeedsBoth": "Teams evaluating onboarding tools for different products in a portfolio might trial both, since Product Fruits emphasizes a specific AI-resolution claim while UserGuiding emphasizes a permanent free tier — different products or budgets could favor one over the other.",
  "keyDifferences": [
    {
      "title": "Free plan availability",
      "toolA": "Product Fruits has no free plan; free trial access is offered on every paid plan instead.",
      "toolB": "UserGuiding offers a free-forever Support Essentials plan with a Knowledge Base, Resource Center, and 50 free AI Assistant resolutions.",
      "whyItMatters": "A permanent free tier lets a team use core support/knowledge-base features indefinitely without paying, which Product Fruits' facts don't offer.",
      "benefitsWho": "Small teams or early-stage products wanting to use basic support/onboarding tooling without a budget commitment."
    },
    {
      "title": "AI assistant",
      "toolA": "Product Fruits' Elvin Copilot is claimed by the vendor to automatically resolve 93% of support questions.",
      "toolB": "UserGuiding's AI Assistant supports 24/7 multilingual in-app support, with 50 free resolutions on the free tier.",
      "whyItMatters": "Both include AI support assistants, but Product Fruits cites a specific resolution-rate claim while UserGuiding emphasizes multilingual coverage and a free resolution allotment.",
      "benefitsWho": "Support teams evaluating AI deflection rates (Product Fruits' claim) versus multilingual coverage (UserGuiding)."
    },
    {
      "title": "Entry pricing",
      "toolA": "Product Fruits starts at $96/month ($72/month billed annually).",
      "toolB": "UserGuiding starts at $174/month.",
      "whyItMatters": "Product Fruits' documented starting price is lower, which matters for budget-conscious teams comparing entry-tier cost.",
      "benefitsWho": "Smaller teams comparing sticker price for a Starter-tier plan."
    },
    {
      "title": "Trial and refund terms",
      "toolA": "Product Fruits offers a free trial on every plan.",
      "toolB": "UserGuiding offers a 14-day free trial plus a 30-day money-back guarantee on paid plans.",
      "whyItMatters": "A money-back guarantee adds a safety net after conversion to a paid plan, beyond just a pre-purchase trial.",
      "benefitsWho": "Risk-averse buyers who want a refund option even after starting a paid subscription."
    },
    {
      "title": "Feature gating by tier",
      "toolA": "Product Fruits gates automatic translations and custom events to the Pro tier and above.",
      "toolB": "UserGuiding gates A/B testing, custom CSS, and localization to the Growth plan and above.",
      "whyItMatters": "Both platforms reserve certain features for higher tiers, but the specific gated features differ.",
      "benefitsWho": "Teams that specifically need one of these gated features should check which vendor includes it at a lower tier."
    }
  ],
  "featureMatrix": [
    {
      "group": "Onboarding Content",
      "rows": [
        {
          "feature": "Product tours",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Checklists",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Tooltips/hints",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "In-app announcements/banners",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "AI & Support",
      "rows": [
        {
          "feature": "AI support assistant",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Knowledge base",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Session replay",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Free forever plan",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Free trial",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "A/B testing",
          "toolA": "not-documented",
          "toolB": "limited",
          "note": "UserGuiding gates A/B testing to the Growth plan and above."
        },
        {
          "feature": "Custom CSS",
          "toolA": "not-documented",
          "toolB": "limited",
          "note": "UserGuiding gates custom CSS to the Growth plan and above."
        },
        {
          "feature": "Automatic translations/localization",
          "toolA": "limited",
          "toolB": "limited",
          "note": "Product Fruits gates this to Pro and above; UserGuiding gates localization to Growth and above."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Product Fruits have a free plan?",
      "answer": "No — Product Fruits has no free plan, though a free trial is available on every paid plan."
    },
    {
      "question": "Does UserGuiding have a free plan?",
      "answer": "Yes, the free-forever Support Essentials plan includes a Knowledge Base, Resource Center, Product Updates, and 50 free AI Assistant resolutions."
    },
    {
      "question": "What is Elvin Copilot?",
      "answer": "Elvin Copilot is Product Fruits' AI assistant, claimed by the vendor to automatically resolve 93% of support questions."
    },
    {
      "question": "Which tool costs less to start?",
      "answer": "Product Fruits' documented starting price is $96/month ($72/month billed annually), lower than UserGuiding's $174/month."
    },
    {
      "question": "Does UserGuiding offer a refund guarantee?",
      "answer": "Yes, UserGuiding offers a 30-day money-back guarantee on paid plans, in addition to a 14-day free trial."
    },
    {
      "question": "Which features are gated to higher tiers?",
      "answer": "Product Fruits gates automatic translations and custom events to its Pro tier and above; UserGuiding gates A/B testing, custom CSS, and localization to its Growth plan and above."
    }
  ]
};

export default productFruitsVsUserguidingContent;
