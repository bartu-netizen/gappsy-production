import type { ToolComparisonContent } from './types';

const jimdoVsStrikinglyContent: ToolComparisonContent = {
  "verdict": "Jimdo and Strikingly are both freemium no-code site builders with e-commerce built in, but they differ in flexibility and extras. Jimdo, operating since 2007 out of Hamburg with over 32 million sites created, offers both a simple editor and a code-customizable Creator editor plus business tools like online booking and Jimdo Local business-listing management. Strikingly is purely no-code and click-to-edit, adding an AI Site Builder, AI Logo Maker, a built-in blog, and a dedicated iPhone app. Neither publishes a detailed pricing table, so the choice comes down to whether code-level customization and booking tools matter more than AI-assisted setup and mobile editing.",
  "bestForToolA": "Businesses that want appointment booking and Google/Facebook business-listing management built in, or that may eventually want a code-customizable editor for more advanced layouts.",
  "bestForToolB": "Non-technical users who want an AI-assisted starting point (site and logo generation), a built-in blog, and the ability to edit their site from a dedicated iPhone app.",
  "whoNeedsBoth": "An agency serving different client types might use Jimdo's Creator editor for clients needing custom code and booking tools, while pointing simpler blog- or store-only clients toward Strikingly's AI-assisted, click-to-edit workflow.",
  "keyDifferences": [
    {
      "title": "Editor flexibility",
      "toolA": "Offers two editors: a simple Website Builder and a code-customizable Creator editor for advanced navigation, stores, and design elements.",
      "toolB": "A purely no-code, click-to-edit builder aimed at users with no coding or design background; a code-level option isn't documented.",
      "whyItMatters": "Teams that anticipate needing custom code eventually should weigh Jimdo's Creator option upfront.",
      "benefitsWho": "Developers or agencies wanting more design control versus first-time site builders wanting simplicity."
    },
    {
      "title": "AI-assisted site building",
      "toolA": "Not documented as a feature.",
      "toolB": "Includes an AI Site Builder and AI Logo Maker for generating a starting site and logo.",
      "whyItMatters": "Users wanting a faster, AI-generated starting point benefit from Strikingly's tooling.",
      "benefitsWho": "Solo entrepreneurs and creatives without design experience who want a quick starting point."
    },
    {
      "title": "Booking and local business listings",
      "toolA": "Includes built-in online booking and Jimdo Local business-listing management across Google, Facebook, and other platforms.",
      "toolB": "Not documented as a feature.",
      "whyItMatters": "Service businesses that take appointments and manage multi-platform listings need tools Jimdo documents explicitly.",
      "benefitsWho": "Local service businesses like salons, consultants, or clinics."
    },
    {
      "title": "Company track record",
      "toolA": "Founded in 2007, headquartered in Hamburg, Germany, with over 32 million websites created.",
      "toolB": "Founding year and headquarters are not documented.",
      "whyItMatters": "Buyers weighing platform longevity and stability have more documented history for Jimdo.",
      "benefitsWho": "Businesses prioritizing platform stability and long-term support."
    },
    {
      "title": "Mobile app support",
      "toolA": "Not documented as a feature.",
      "toolB": "Offers a dedicated iPhone app for building and editing sites (no Android app mentioned).",
      "whyItMatters": "Users wanting to manage a site from a phone benefit from Strikingly's documented mobile app.",
      "benefitsWho": "Users who prefer editing on the go from an iPhone."
    }
  ],
  "featureMatrix": [
    {
      "group": "Editor & Design",
      "rows": [
        {
          "feature": "No-code visual editor",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Code-customization option (advanced editor)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "AI site/logo generation",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Template-based design",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Business Tools",
      "rows": [
        {
          "feature": "Online store / e-commerce",
          "toolA": "available",
          "toolB": "available",
          "note": "Jimdo has a dedicated Online Store Builder; Strikingly's Simple Store connects to PayPal or Stripe."
        },
        {
          "feature": "Online booking",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Business listings management (Google/Facebook)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Built-in blog",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Company & Platform",
      "rows": [
        {
          "feature": "Founded year / headquarters documented",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Jimdo: founded 2007, Hamburg, Germany."
        },
        {
          "feature": "Free plan",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Dedicated mobile app",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Strikingly's app is iPhone-only."
        },
        {
          "feature": "Free HTTPS",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "What's the biggest structural difference between Jimdo and Strikingly?",
      "answer": "Jimdo offers two editors — a simple builder and a code-customizable Creator editor — while Strikingly is a purely no-code, click-to-edit builder with no coding option documented."
    },
    {
      "question": "Does either use AI to build a site?",
      "answer": "Strikingly includes an AI Site Builder and AI Logo Maker; no AI features are documented for Jimdo."
    },
    {
      "question": "Can I take bookings through the site?",
      "answer": "Jimdo has built-in online booking tools; this isn't documented as a Strikingly feature."
    },
    {
      "question": "Which company has a longer track record?",
      "answer": "Jimdo was founded in 2007 in Hamburg, Germany, and reports over 32 million websites created; founding year and headquarters aren't documented for Strikingly."
    },
    {
      "question": "Is there a mobile app?",
      "answer": "Strikingly offers a dedicated iPhone app for building and editing sites; a mobile app isn't documented for Jimdo."
    },
    {
      "question": "Do both include e-commerce?",
      "answer": "Yes — Jimdo has a dedicated Online Store Builder, and Strikingly's Simple Store connects to PayPal or Stripe with coupon, shipping, and digital goods support."
    }
  ]
};

export default jimdoVsStrikinglyContent;
