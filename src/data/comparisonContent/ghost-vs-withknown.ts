import type { ToolComparisonContent } from './types';

const ghostVsWithknownContent: ToolComparisonContent = {
  "verdict": "Ghost is a paid publishing platform, starting at $15/month on the Starter plan (billed yearly), built specifically for newsletter and paid-subscription publishing, with a wide integration library (Mailchimp, Discourse, Buffer, Pinterest, Geckoboard, Unsplash) and a choice of self-hosting or Ghost's own managed hosting. Known (withknown) is a free, open-source, IndieWeb-aligned CMS built for individuals who want to publish content on their own domain and syndicate it out to social networks, with no built-in monetization tooling documented. They target different publishing goals: Ghost monetizes an audience directly, Known is about owning and distributing personal content.",
  "bestForToolA": "Publishers and writers who want built-in memberships and paid subscriptions (charging readers directly) plus integrations like Mailchimp and Buffer, starting at $15/month.",
  "bestForToolB": "Individuals who want a free, self-hosted, IndieWeb-aligned publishing tool for owning their content on their own domain and syndicating it to social networks, without needing monetization features.",
  "whoNeedsBoth": "There's little practical scenario for running both on the same site since they're both primary publishing platforms; a more realistic combination is using Known for personal IndieWeb posting and syndication while running a separate, monetized Ghost newsletter for premium long-form content — though no direct integration between the two is documented.",
  "keyDifferences": [
    {
      "title": "Pricing Model",
      "toolA": "Ghost is a paid product starting at $15/month on the Starter plan, billed yearly.",
      "toolB": "Known is free and open source, with no pricing plans documented.",
      "whyItMatters": "A recurring subscription cost changes the calculus for hobbyists versus publishers expecting to monetize their audience.",
      "benefitsWho": "Budget-conscious individual publishers benefit from Known's free model; publishers planning to monetize benefit from paying for Ghost's built-in tools."
    },
    {
      "title": "Built-In Monetization",
      "toolA": "Ghost includes built-in memberships and paid subscriptions, letting publishers charge readers directly without a separate payments integration.",
      "toolB": "Known has no monetization features documented — its focus is on ownership and syndication of content.",
      "whyItMatters": "Publishers who want to charge for content need this built in rather than bolted on with a third-party tool.",
      "benefitsWho": "Newsletter writers and independent publishers trying to generate subscription revenue."
    },
    {
      "title": "Integration Library",
      "toolA": "Ghost documents a wide integration library spanning email marketing, community, and analytics tools: Mailchimp, Discourse, Buffer, Pinterest, Geckoboard, and Unsplash.",
      "toolB": "Known does not document a comparable third-party integration library.",
      "whyItMatters": "A wide integration library reduces the need for custom development to connect marketing and analytics tools.",
      "benefitsWho": "Publishers who already use tools like Mailchimp or Buffer and want them connected out of the box."
    },
    {
      "title": "Hosting Model",
      "toolA": "At its core, Ghost's codebase is open source, giving users the choice to self-host it or instead run it on Ghost's own managed hosting service.",
      "toolB": "Known is open source and self-hostable, with no managed-hosting option documented.",
      "whyItMatters": "A managed hosting option removes server-maintenance burden for publishers who don't want to run their own infrastructure.",
      "benefitsWho": "Non-technical publishers benefit from Ghost's managed hosting option; technically comfortable individuals benefit from self-hosting either tool."
    },
    {
      "title": "Content Philosophy & Governance",
      "toolA": "Ghost's documented cons note a narrower feature set than a general-purpose CMS — it is not built for non-publishing sites.",
      "toolB": "Known publishes a formal DMCA takedown policy, signaling real production use with a documented copyright process, and is explicitly IndieWeb-aligned around owning your own content.",
      "whyItMatters": "The presence of a formal legal/takedown process suggests a platform has handled real-world content disputes at scale.",
      "benefitsWho": "Individuals prioritizing content ownership and IndieWeb principles benefit from Known's documented governance."
    }
  ],
  "featureMatrix": [
    {
      "group": "Publishing & Monetization",
      "rows": [
        {
          "feature": "Built-in paid subscriptions/memberships",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Publish on your own domain",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Social network syndication",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Per Known's short description"
        }
      ]
    },
    {
      "group": "Integrations & Hosting",
      "rows": [
        {
          "feature": "Email marketing integrations (e.g. Mailchimp)",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Self-hosting option",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Managed hosting option",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Ghost's own managed hosting"
        }
      ]
    },
    {
      "group": "Pricing & Governance",
      "rows": [
        {
          "feature": "Starting price",
          "toolA": "available",
          "toolB": "available",
          "note": "Ghost $15/month (Starter, billed yearly) vs Known $0 (free/open source)"
        },
        {
          "feature": "Formal DMCA/takedown policy published",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Open-source codebase",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Ghost free?",
      "answer": "No perpetual free plan is documented — pricing starts at $15/month on the Starter plan billed yearly, though Ghost's core is open source and can be self-hosted."
    },
    {
      "question": "Is Known free?",
      "answer": "Yes, Known is free and open source."
    },
    {
      "question": "Does Ghost support paid newsletters or subscriptions?",
      "answer": "Yes — Ghost has built-in memberships and paid subscriptions so publishers can charge readers directly."
    },
    {
      "question": "Does Known support monetization?",
      "answer": "No monetization features are documented for Known — its focus is on IndieWeb-aligned publishing and syndication."
    },
    {
      "question": "Which tool integrates with email marketing platforms?",
      "answer": "Ghost documents integrations with Mailchimp and several other email/marketing tools; no comparable integrations are documented for Known."
    },
    {
      "question": "Which tool is IndieWeb-aligned?",
      "answer": "Known is explicitly described as IndieWeb-aligned publishing, focused on owning your content on your own domain and syndicating it out."
    }
  ]
};

export default ghostVsWithknownContent;
