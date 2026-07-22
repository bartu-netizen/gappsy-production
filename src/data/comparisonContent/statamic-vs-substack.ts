import type { ToolComparisonContent } from './types';

const statamicVsSubstackContent: ToolComparisonContent = {
  "verdict": "Statamic is a general-purpose, self-hosted Laravel CMS for building any kind of website, with a free Core edition and a $349/site Pro license for teams that need multi-user editing or headless API access. Substack is a free, fully hosted platform purpose-built for paid newsletters, podcasts, and video, where writers keep 90% of subscription revenue and benefit from Substack's built-in reader network. One is a flexible website-building tool you own and operate; the other is a turnkey publishing and monetization platform tied to Substack's infrastructure and audience network.",
  "bestForToolA": "Developers and agencies who want full control over a self-hosted website — with flat-file or database storage, custom fieldtypes via Blueprints, and no per-transaction revenue cut — fit Statamic best.",
  "bestForToolB": "Independent writers who want to launch a paid newsletter, podcast, or video publication with zero setup and tap into Substack's built-in reader network for subscriber discovery fit Substack best.",
  "whoNeedsBoth": "A publisher could run their main brand/marketing website on Statamic (for full design control and SEO structure) while operating their paid subscription newsletter on Substack, cross-linking the two so each does what it's built for.",
  "keyDifferences": [
    {
      "title": "Core Purpose",
      "toolA": "Statamic is a general-purpose CMS for building any type of website using Blueprints, 40+ fieldtypes, and the Bard block editor.",
      "toolB": "Substack is purpose-built specifically for newsletter, podcast, video, and live-video publishing — not general website design.",
      "whyItMatters": "A general CMS gives structural freedom but requires more setup; a purpose-built platform is faster to launch but narrower in scope.",
      "benefitsWho": "Businesses needing a full marketing site benefit from Statamic; writers who just want to publish and monetize content benefit from Substack's focus."
    },
    {
      "title": "Built-In Monetization",
      "toolA": "Statamic has no documented native paid-subscription or monetization feature — a subscription business would need custom development.",
      "toolB": "Substack has built-in paid subscriptions: writers set a price and readers pay directly through Substack, with writers keeping 90% of that revenue.",
      "whyItMatters": "This determines whether launching a paid content business requires custom engineering or is available out of the box.",
      "benefitsWho": "Writers wanting to monetize immediately without building payment infrastructure benefit from Substack."
    },
    {
      "title": "Hosting & Technical Requirements",
      "toolA": "Statamic is self-hosted and requires PHP/Laravel hosting and development knowledge to deploy and maintain.",
      "toolB": "Substack is fully hosted with no setup, contract, or platform fee required to start publishing.",
      "whyItMatters": "Technical requirements determine whether a solo writer can launch alone or needs developer help.",
      "benefitsWho": "Non-technical writers benefit from Substack's zero-setup model; teams with developer resources benefit from Statamic's flexibility."
    },
    {
      "title": "Audience Discovery",
      "toolA": "Statamic has no built-in reader network or discovery mechanism — traffic depends entirely on the site owner's own SEO and marketing.",
      "toolB": "More than half of new Substack subscribers come from Substack's built-in network and recommendations rather than outside promotion.",
      "whyItMatters": "Built-in discovery can meaningfully accelerate audience growth compared to starting from zero on an independent site.",
      "benefitsWho": "New writers without an existing audience benefit most from Substack's built-in network."
    },
    {
      "title": "Cost Structure at Scale",
      "toolA": "Statamic Pro is a fixed cost — $349 for the first site-license year, then $99/year to renew — regardless of traffic or revenue.",
      "toolB": "Substack is free to use but takes a 10% cut of paid subscription revenue on top of separate payment-processing fees, so cost scales with success.",
      "whyItMatters": "A fixed license cost becomes cheaper at high revenue, while a revenue-share cost grows in step with success.",
      "benefitsWho": "High-revenue publishers may save money long-term with Statamic's flat fee; new or uncertain-revenue writers benefit from Substack's zero-upfront-cost model."
    }
  ],
  "featureMatrix": [
    {
      "group": "Content & Publishing",
      "rows": [
        {
          "feature": "General website building",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Substack is built around post/newsletter publishing, not general site design"
        },
        {
          "feature": "Podcast/video publishing",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Custom content modeling (fieldtypes)",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Statamic: 40+ fieldtypes via Blueprints"
        },
        {
          "feature": "Live preview before publishing",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Monetization & Growth",
      "rows": [
        {
          "feature": "Built-in paid subscriptions",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Substack: writer keeps 90% of revenue"
        },
        {
          "feature": "Built-in reader/discovery network",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Revenue share / platform cut",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Substack takes 10% of subscription revenue"
        }
      ]
    },
    {
      "group": "Ownership & Technical Requirements",
      "rows": [
        {
          "feature": "Self-hosted",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Requires developer/PHP skills",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "REST API / GraphQL access",
          "toolA": "limited",
          "toolB": "not-documented",
          "note": "Statamic requires Pro license ($349/site)"
        },
        {
          "feature": "Full ownership of subscriber list & payments",
          "toolA": "available",
          "toolB": "available",
          "note": "Statamic via self-hosting; Substack per its stated writer-ownership policy"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Can I monetize a newsletter on Statamic the way I can on Substack?",
      "answer": "Not out of the box — Statamic has no documented built-in paid-subscription feature. Substack has native paid subscriptions where writers keep 90% of revenue."
    },
    {
      "question": "Does Substack require any coding to get started?",
      "answer": "No. Substack is a free, fully hosted platform with no upfront fee or contract to sign, unlike Statamic which requires PHP/Laravel hosting knowledge."
    },
    {
      "question": "Is Statamic suitable for a blog or newsletter-style site?",
      "answer": "Yes, via its Bard editor and content collections, but it's a general-purpose CMS rather than a newsletter-specific platform like Substack."
    },
    {
      "question": "Who owns the content and subscriber data?",
      "answer": "With Statamic (self-hosted), the site owner has full infrastructure control. Substack states writers retain ownership of their intellectual property, mailing list, and subscriber payments, even though the platform hosts it."
    },
    {
      "question": "Is Statamic free?",
      "answer": "The Core edition is free forever. The Pro tier costs $349/site for the first year, then $99/year to renew, and is required for multi-user accounts and API access."
    },
    {
      "question": "Which costs more as a publication grows?",
      "answer": "Substack's cost scales with revenue since it takes a 10% cut of subscriptions. Statamic Pro's cost is fixed at $99/year after the first year, regardless of traffic or revenue."
    }
  ]
};

export default statamicVsSubstackContent;
