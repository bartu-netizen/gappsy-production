import type { ToolComparisonContent } from './types';

const castopodVsGhostContent: ToolComparisonContent = {
  "verdict": "Castopod is a free, open-source, self-hosted platform purpose-built for podcast hosting under Podcasting 2.0 standards; Ghost is a paid publishing platform starting at $15/month built for blogs, newsletters, and paid subscriptions, with both self-hosted and managed-hosting options. They overlap only at the edges -- Castopod for audio feeds, Ghost for written and newsletter content -- and creators often need both.",
  "bestForToolA": "Castopod fits podcasters who want free, self-hosted, standards-based (Podcasting 2.0) hosting and are willing to manage their own infrastructure.",
  "bestForToolB": "Ghost fits publishers building a newsletter or membership business who want built-in paid subscriptions and memberships without stitching together a separate payments integration, starting at $15/month on the Starter plan.",
  "whoNeedsBoth": "A creator running a podcast could self-host episodes on Castopod while using Ghost's built-in memberships and newsletter tools to sell paid subscriptions and publish written show notes or articles tied to the podcast.",
  "keyDifferences": [
    {
      "title": "Pricing Model",
      "toolA": "Castopod is entirely free and open source.",
      "toolB": "Ghost is a paid product starting at $15/month (Starter plan, billed yearly) with self-hosted and managed-hosting options.",
      "whyItMatters": "This determines whether there is any recurring cost at all for running the platform.",
      "benefitsWho": "Budget-constrained independent podcasters versus publishers who want a supported managed product."
    },
    {
      "title": "Content Format Focus",
      "toolA": "Castopod is built specifically for podcast/audio hosting under Podcasting 2.0 standards.",
      "toolB": "Ghost is built for written publishing -- blogs and email newsletters -- with a narrower feature set than a general-purpose CMS like WordPress, per its own documented con.",
      "whyItMatters": "The two tools target fundamentally different media formats, so picking the wrong one means rebuilding on another platform later.",
      "benefitsWho": "Audio-first creators need Castopod; text and newsletter-first publishers need Ghost."
    },
    {
      "title": "Monetization",
      "toolA": "Not documented -- no built-in payments or membership features are listed for Castopod.",
      "toolB": "Ghost has built-in memberships and paid subscriptions, letting creators charge readers directly without a separate payments integration.",
      "whyItMatters": "Creators who want to charge for content need this natively rather than bolting on a third-party payments tool.",
      "benefitsWho": "Newsletter and blog creators monetizing directly through Ghost."
    },
    {
      "title": "Hosting Flexibility",
      "toolA": "Castopod requires self-hosting; there is no official managed hosting option from the Castopod team.",
      "toolB": "Ghost can be self-hosted or run on Ghost's own managed hosting.",
      "whyItMatters": "Buyers who don't want to run servers have an out with Ghost but not with Castopod.",
      "benefitsWho": "Non-technical publishers who want managed hosting benefit from Ghost; technically capable teams can self-host either."
    },
    {
      "title": "Integration Ecosystem",
      "toolA": "Not documented beyond Castopod's open, auditable source code.",
      "toolB": "Ghost integrates with Mailchimp, Discourse, Buffer, Pinterest, Geckoboard, Unsplash, and more.",
      "whyItMatters": "A wide integration library reduces the need for custom glue code when connecting marketing and community tools.",
      "benefitsWho": "Publishers already using tools like Mailchimp or Discourse who want native Ghost integrations."
    }
  ],
  "featureMatrix": [
    {
      "group": "Publishing & Content",
      "rows": [
        {
          "feature": "Podcast/audio hosting",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Blog/newsletter publishing",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Podcasting 2.0 standards support",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Monetization & Growth",
      "rows": [
        {
          "feature": "Paid memberships/subscriptions",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Built-in on Ghost"
        },
        {
          "feature": "Third-party integrations (email/marketing/community)",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Mailchimp, Discourse, Buffer, Pinterest, Geckoboard, Unsplash"
        },
        {
          "feature": "Recurring SaaS hosting fees avoided",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Castopod is free/OSS; Ghost starts at $15/mo"
        }
      ]
    },
    {
      "group": "Deployment & Cost",
      "rows": [
        {
          "feature": "Free to use",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Ghost starts at $15/mo"
        },
        {
          "feature": "Self-hosting",
          "toolA": "available",
          "toolB": "available",
          "note": "Required for Castopod, optional for Ghost"
        },
        {
          "feature": "Managed hosting",
          "toolA": "unavailable",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Castopod free while Ghost is not?",
      "answer": "Yes -- Castopod is free and open source with no listed pricing, while Ghost starts at $15/month on its Starter plan (billed yearly)."
    },
    {
      "question": "Can I run a podcast on Ghost instead of Castopod?",
      "answer": "Ghost's documented features focus on blogs, newsletters, and paid subscriptions rather than podcast/audio hosting or Podcasting 2.0 standards, which are Castopod's specialty."
    },
    {
      "question": "Does Castopod support paid subscriptions like Ghost does?",
      "answer": "This isn't documented for Castopod; Ghost is the one with built-in memberships and paid subscriptions."
    },
    {
      "question": "Do both tools support self-hosting?",
      "answer": "Yes, both can be self-hosted, but Castopod requires it since there's no official managed hosting, while Ghost also offers managed hosting as an alternative."
    },
    {
      "question": "Which tool has more third-party integrations?",
      "answer": "Ghost documents a wider integration library, including Mailchimp, Discourse, Buffer, Pinterest, Geckoboard, and Unsplash; no comparable integration list is documented for Castopod."
    }
  ]
};

export default castopodVsGhostContent;
