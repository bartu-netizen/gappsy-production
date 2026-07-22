import type { ToolComparisonContent } from './types';

const hostingerVsSitegroundContent: ToolComparisonContent = {
  "verdict": "Hostinger and SiteGround both bundle AI website-building tools into promotional-priced hosting that renews much higher — the real difference is SiteGround's broader AI toolkit (a chat-based app builder plus access to multiple third-party AI models) and Git-based staging, against Hostinger's dedicated AI site builder, AI email marketing, and higher raw storage at its top tier.",
  "bestForToolA": "Buyers wanting the most storage (100GB NVMe on Cloud Startup), Horizons for generating a full site from a text description, and AI-powered email marketing (Reach).",
  "bestForToolB": "Buyers wanting access to multiple third-party AI models (Gemini, Claude, ChatGPT) via AI Studio, a chat-based app builder (Coderick AI with Stripe integration), Git-based staging, and a high Trustpilot rating.",
  "whoNeedsBoth": "An agency serving many small clients might use Hostinger's cheaper high-storage plans for some sites while using SiteGround's GoGeek tier — with white-label access and Git-based staging — for higher-touch client projects.",
  "keyDifferences": [
    {
      "title": "Breadth of AI products",
      "toolA": "Offers Horizons (AI website builder) and AI-powered email marketing (Reach).",
      "toolB": "Bundles three distinct AI products: an AI-assisted Website Builder, Coderick AI (builds apps via chat with Stripe payment integration), and AI Studio (access to Gemini, Claude, and ChatGPT).",
      "whyItMatters": "Buyers wanting multi-model AI access or a chat-based app builder need a platform that offers those specific tools.",
      "benefitsWho": "Developers wanting to build apps via chat vs. marketers wanting AI-driven email campaigns."
    },
    {
      "title": "Staging environments",
      "toolA": "No staging environment feature is documented.",
      "toolB": "Offers a staging environment from the GrowBig plan up, with Git-based staging specifically on GoGeek.",
      "whyItMatters": "Developers need a safe way to test changes before pushing to production.",
      "benefitsWho": "Development teams with structured deployment workflows."
    },
    {
      "title": "Backup cadence",
      "toolA": "Entry Premium plan includes weekly backups, upgrading to daily (plus on-demand) on higher tiers.",
      "toolB": "Provides automatic daily backups on all plans, with on-demand backups from GrowBig up.",
      "whyItMatters": "More frequent backups reduce potential data loss for actively updated sites.",
      "benefitsWho": "Sites with frequent content changes needing recent recovery points."
    },
    {
      "title": "Website limits on entry plan",
      "toolA": "Entry Premium plan supports 3 websites.",
      "toolB": "Entry StartUp plan is limited to 1 website.",
      "whyItMatters": "Buyers hosting multiple small sites on the cheapest tier need higher site limits.",
      "benefitsWho": "Agencies or hobbyists managing several sites cheaply."
    },
    {
      "title": "Third-party reputation signal",
      "toolA": "No comparable third-party rating figure is documented.",
      "toolB": "Cites a 4.9/5 Trustpilot rating as a stated pro.",
      "whyItMatters": "Social proof from review platforms factors into purchase decisions.",
      "benefitsWho": "Risk-averse buyers researching reviews before purchase."
    }
  ],
  "featureMatrix": [
    {
      "group": "AI Tooling",
      "rows": [
        {
          "feature": "AI website builder",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Chat-based AI app builder",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "SiteGround's Coderick AI, with Stripe integration."
        },
        {
          "feature": "Access to multiple third-party AI models",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "AI Studio: Gemini, Claude, ChatGPT."
        },
        {
          "feature": "AI-powered email marketing",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Hostinger's Reach."
        }
      ]
    },
    {
      "group": "Hosting Features",
      "rows": [
        {
          "feature": "Staging environment",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Git-based on GoGeek tier."
        },
        {
          "feature": "Free CDN and SSL",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Included on all SiteGround plans."
        },
        {
          "feature": "Backup frequency",
          "toolA": "limited",
          "toolB": "available",
          "note": "Hostinger: weekly on entry tier, daily on higher tiers; SiteGround: daily on all plans."
        },
        {
          "feature": "Websites included on entry plan",
          "toolA": "available",
          "toolB": "limited",
          "note": "Hostinger: 3 websites; SiteGround: 1 website."
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Entry promotional price",
          "toolA": "available",
          "toolB": "available",
          "note": "Hostinger $2.99/month; SiteGround €2.99/month."
        },
        {
          "feature": "Top-tier storage",
          "toolA": "available",
          "toolB": "available",
          "note": "Hostinger: 100GB NVMe; SiteGround: 100GB."
        },
        {
          "feature": "White-label access",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "SiteGround GoGeek plan."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "What is Hostinger Horizons?",
      "answer": "It's an AI website builder that creates a site from a text description and offers a free trial with no credit card required."
    },
    {
      "question": "Does SiteGround include AI tools?",
      "answer": "Yes, SiteGround includes an AI-assisted Website Builder, Coderick AI for building apps via chat, and AI Studio for access to multiple AI models."
    },
    {
      "question": "Can I host multiple websites on SiteGround?",
      "answer": "The StartUp plan supports 1 website; GrowBig and GoGeek support unlimited websites."
    },
    {
      "question": "Does SiteGround offer a money-back guarantee?",
      "answer": "Yes, a 30-day money-back guarantee is offered on hosting plans."
    },
    {
      "question": "How much does SiteGround cost?",
      "answer": "Promotional pricing starts at €2.99/month for StartUp, rising to €8.49/month for GoGeek, all billed as 12-month prepaid terms."
    },
    {
      "question": "Does Hostinger include a free domain?",
      "answer": "Yes, hosting plans include a free domain for the first year."
    }
  ]
};

export default hostingerVsSitegroundContent;
