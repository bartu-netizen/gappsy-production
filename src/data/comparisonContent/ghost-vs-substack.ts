import type { ToolComparisonContent } from './types';

const ghostVsSubstackContent: ToolComparisonContent = {
  "verdict": "Ghost and Substack both support paid subscription publishing, but the economics and structure differ. Ghost charges a flat platform fee starting at $15/month, is open source, and can be self-hosted or run on managed hosting with a wide named integration library (Mailchimp, Discourse, Buffer, and more). Substack has no upfront platform fee at all but takes a 10% cut of subscription revenue, and leans on its own built-in reader network — where more than half of new subscribers come from Substack's recommendations rather than outside promotion. The choice comes down to flat-fee-plus-integrations versus free-to-start-plus-revenue-share-and-built-in-discovery.",
  "bestForToolA": "Publishers who want self-hosting flexibility, a flat predictable monthly cost, and named integrations with existing email marketing, community, and analytics tools (Mailchimp, Discourse, Buffer, Pinterest, Geckoboard, Unsplash).",
  "bestForToolB": "Writers starting a paid publication with no upfront cost who want to tap Substack's built-in reader network for discovery and publish beyond text — podcasts, video, and live video — without managing hosting.",
  "whoNeedsBoth": "Publishers testing distribution channels may run both: a Substack newsletter to benefit from its built-in reader network for discovery, alongside a self-hosted Ghost site using integrations like Mailchimp or Buffer for owned-audience marketing — though most publications settle on one as their primary platform.",
  "keyDifferences": [
    {
      "title": "Monetization structure",
      "toolA": "Charges a flat platform subscription fee starting at $15/month (Starter plan, billed yearly); no revenue-share cut is documented.",
      "toolB": "No upfront platform fee to start, but Substack takes a 10% cut of a writer's paid subscription revenue, on top of separate payment-processing fees.",
      "whyItMatters": "Ghost's cost is fixed regardless of subscriber revenue; Substack's cost scales with how much subscription revenue a writer earns.",
      "benefitsWho": "High-revenue publications may save money on Ghost's flat fee; early-stage writers with uncertain revenue may prefer Substack's no-upfront-cost model."
    },
    {
      "title": "Built-in discovery network",
      "toolA": "No built-in reader/discovery network is documented; growth relies on the publisher's own channels and integrations.",
      "toolB": "More than half of new subscribers come from Substack's built-in network and recommendations rather than outside promotion.",
      "whyItMatters": "Substack offers a documented distribution advantage for new writers; Ghost requires publishers to drive their own traffic and use integrations like Mailchimp/Buffer for growth.",
      "benefitsWho": "New writers without an existing audience benefit most from Substack's network effect."
    },
    {
      "title": "Hosting flexibility",
      "toolA": "Open source at its core; self-hostable or run on Ghost's own managed hosting.",
      "toolB": "No self-hosting or open-source option is documented; it's a single hosted platform.",
      "whyItMatters": "Ghost gives technical publishers control over infrastructure; Substack keeps hosting entirely on its own platform.",
      "benefitsWho": "Technical teams wanting infrastructure control (Ghost) versus writers who want zero technical setup (Substack)."
    },
    {
      "title": "Named integration ecosystem",
      "toolA": "Wide integration library named explicitly: Mailchimp, Discourse, Buffer, Pinterest, Geckoboard, Unsplash, and more.",
      "toolB": "No third-party integrations are documented; the facts emphasize built-in ownership and the reader network instead.",
      "whyItMatters": "Ghost publishers can plug into existing marketing/community stacks; Substack's value proposition documented here is ownership and discovery rather than external tool integration.",
      "benefitsWho": "Publishers already using tools like Mailchimp or Discourse who want them connected to their publishing platform."
    }
  ],
  "featureMatrix": [
    {
      "group": "Publishing & Monetization",
      "rows": [
        {
          "feature": "Built-in paid subscriptions",
          "toolA": "available",
          "toolB": "available",
          "note": "Substack: writer keeps 90% of subscription revenue."
        },
        {
          "feature": "Platform revenue cut on subscriptions",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Substack takes 10%; Ghost's flat-fee model has no documented revenue cut."
        },
        {
          "feature": "Self-hosting option",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Multi-format publishing (podcast/video)",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Growth & Integrations",
      "rows": [
        {
          "feature": "Built-in reader/discovery network",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Named third-party integrations",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Ghost: Mailchimp, Discourse, Buffer, Pinterest, Geckoboard, Unsplash."
        },
        {
          "feature": "Dedicated mobile app",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "The Substack app."
        }
      ]
    },
    {
      "group": "Pricing",
      "rows": [
        {
          "feature": "No cost to start",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Published flat monthly pricing",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Substack uses a revenue-share model with no monthly tiers documented."
        },
        {
          "feature": "Writer keeps full subscription revenue",
          "toolA": "not-documented",
          "toolB": "unavailable",
          "note": "Substack's writers keep 90%, with Substack taking a 10% cut; Ghost's revenue-retention split isn't documented."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Ghost integrate with email marketing tools?",
      "answer": "Yes, Ghost integrates with Mailchimp and several other email/marketing tools."
    },
    {
      "question": "Is Substack free to use?",
      "answer": "Yes, it's free to start and free to leave, with no upfront platform fee, tiers, or contract."
    },
    {
      "question": "How does Substack make money?",
      "answer": "It takes 10% of a writer's paid subscription revenue; the remaining 90% goes to the writer."
    },
    {
      "question": "Can I publish more than text newsletters on Substack?",
      "answer": "Yes, Substack supports podcasts, video, and live video alongside written posts."
    },
    {
      "question": "Do I own my subscriber list on Substack?",
      "answer": "Yes, writers retain ownership of their intellectual property, mailing list, and subscriber payments."
    }
  ]
};

export default ghostVsSubstackContent;
