import type { ToolComparisonContent } from './types';

const buttercmsVsContentfulContent: ToolComparisonContent = {
  "verdict": "ButterCMS and Contentful are both freemium headless CMS options, but they differ in scope and pricing transparency. ButterCMS publishes self-serve pricing all the way through its $359/month Professional tier and ships official SDKs for React, Next.js, Angular, Django, and Laravel plus a 14-day trial on every paid plan. Contentful is a broader composable digital experience platform with Personalization, AI Actions, and the AI-search-focused Palmata product, but only its Free plan has published limits — Lite and Enterprise pricing requires contacting sales.",
  "bestForToolA": "Teams wanting published self-serve pricing all the way to a Professional tier, official framework SDKs (Next.js, React, Angular, Django, Laravel), and an AI Assistant plus built-in SEO fields included on every plan.",
  "bestForToolB": "Organizations wanting a broader composable digital experience platform — personalization, AI Actions workflow automation, and Palmata's AI-search visibility tooling — beyond basic content management, who are willing to contact sales for paid-tier pricing.",
  "whoNeedsBoth": "An organization already on Contentful for enterprise-wide personalization and AI Actions might still spin up a ButterCMS instance for a specific marketing microsite or blog needing fast setup with published pricing and ready-made framework SDKs, without a new Contentful sales quote.",
  "keyDifferences": [
    {
      "title": "Pricing transparency above the free tier",
      "toolA": "Publishes self-serve pricing through Professional ($359/month), with only Enterprise left as a custom quote.",
      "toolB": "Only the Free plan has published self-serve limits; Lite and Enterprise plans require contacting sales, with no published pricing plans documented at all beyond Free.",
      "whyItMatters": "Buyers can fully cost out ButterCMS before talking to sales, unlike most of Contentful's paid tiers.",
      "benefitsWho": "Budget-conscious teams and procurement processes that need cost clarity upfront."
    },
    {
      "title": "Framework SDK support",
      "toolA": "Offers official SDKs and quickstart guides for Angular, Django, Laravel, Next.js, and React.",
      "toolB": "No specific framework SDKs are documented; its Marketplace covers general apps/integrations rather than named framework SDKs.",
      "whyItMatters": "ButterCMS gives developers ready-made integration paths for common stacks; Contentful's integration story in the facts is less framework-specific.",
      "benefitsWho": "Developers building on Next.js, React, Angular, Django, or Laravel who want official quickstarts."
    },
    {
      "title": "Platform scope beyond the CMS",
      "toolA": "Focused on content modeling, developer tooling, workflow/collaboration, multisite/multi-language support, built-in SEO fields, and an AI Assistant — no personalization or AI-search product documented.",
      "toolB": "Adds Personalization, AI Actions (workflow automation), Studio, and Palmata (AI discovery/search visibility) on top of the CMS.",
      "whyItMatters": "Contentful positions itself as a broader digital experience platform; ButterCMS stays focused on being an API-first CMS.",
      "benefitsWho": "Marketing/growth teams wanting personalization and AI-search tooling (Contentful) versus teams wanting a lean, developer-friendly CMS (ButterCMS)."
    },
    {
      "title": "Free trial on paid plans",
      "toolA": "Every paid plan includes a 14-day free trial in addition to a permanent Free plan.",
      "toolB": "No free trial on paid tiers is documented; only the Free plan itself is documented.",
      "whyItMatters": "ButterCMS lets teams test paid-tier features before committing to a purchase.",
      "benefitsWho": "Teams wanting to evaluate higher-tier features (like image editing or more locales) before paying."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core CMS Features",
      "rows": [
        {
          "feature": "Content modeling",
          "toolA": "available",
          "toolB": "available",
          "note": "Contentful's composable content platform vs. ButterCMS's content modeling."
        },
        {
          "feature": "AI content tooling",
          "toolA": "available",
          "toolB": "available",
          "note": "ButterCMS's AI Assistant vs. Contentful's AI Actions."
        },
        {
          "feature": "Built-in SEO metadata fields",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Multisite / multi-language support",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "ButterCMS's multi-locale support is gated to the Professional plan."
        },
        {
          "feature": "Media and asset management",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Developer Tooling",
      "rows": [
        {
          "feature": "Official framework SDKs",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "ButterCMS: Angular, Django, Laravel, Next.js, React."
        },
        {
          "feature": "APIs and webhooks",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "User roles and approval workflows",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "ButterCMS's workflow and collaboration feature."
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Free plan",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Free trial on paid plans",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Published self-serve pricing beyond free tier",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Contentful's Lite/Enterprise require contacting sales."
        }
      ]
    },
    {
      "group": "Advanced Platform Features",
      "rows": [
        {
          "feature": "Personalization tooling",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "AI-search / GEO visibility tool",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Contentful's Palmata."
        },
        {
          "feature": "App marketplace",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Do I need a credit card for ButterCMS's Free plan?",
      "answer": "No, the Free plan gives full access to core features with no credit card required."
    },
    {
      "question": "What's included in ButterCMS's Free plan?",
      "answer": "Unlimited users and components, 50K API calls/month, 100GB bandwidth/month, up to 5 pages, 50 blog posts, 50 collections, and 500 assets."
    },
    {
      "question": "Does ButterCMS offer a free trial on paid plans?",
      "answer": "Yes, every paid plan includes a 14-day free trial."
    },
    {
      "question": "Which frameworks does ButterCMS officially support?",
      "answer": "Angular, Django, Laravel, Next.js, and React have official integrations and quickstart guides."
    },
    {
      "question": "Does Contentful have a free plan?",
      "answer": "Yes, a Free plan is available and includes a Starter Space with published usage limits."
    },
    {
      "question": "Is Contentful's pricing public for paid plans?",
      "answer": "Only the Free plan has published self-serve limits; Lite and Enterprise plans require contacting sales."
    }
  ]
};

export default buttercmsVsContentfulContent;
