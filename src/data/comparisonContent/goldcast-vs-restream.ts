import type { ToolComparisonContent } from './types';

const goldcastVsRestreamContent: ToolComparisonContent = {
  "verdict": "Goldcast is a custom/enterprise-priced, AI-first B2B platform built specifically for hosting webinars and virtual events and then repurposing that footage into clips, blogs, and social posts via its Content Lab, with native CRM/marketing integrations (Marketo, HubSpot, Eloqua, Salesforce). Restream is a freemium multistreaming platform built for broadcasting one live stream simultaneously to many destinations (YouTube, Twitch, Facebook, LinkedIn, TikTok), with a free plan for up to 2 channels and paid plans from $16/month for higher quality, more channels, and guest features. Goldcast targets B2B marketing teams running gated webinar programs, while Restream targets creators and streamers distributing live content across social platforms.",
  "bestForToolA": "B2B marketing teams running webinar and virtual-event programs who need native integrations with Marketo, HubSpot, Eloqua, or Salesforce and want AI-driven repurposing of event footage into clips and blogs via Content Lab.",
  "bestForToolB": "Creators and streamers who want to broadcast one live feed to multiple platforms at once, starting free with 2 channels and scaling to Restream's $16-$199/month paid tiers for more channels and features.",
  "whoNeedsBoth": "A B2B company could host a webinar in Goldcast for CRM-integrated lead capture and Content Lab repurposing, while separately using Restream to simultaneously multistream a related live event to YouTube, Twitch, or LinkedIn — the two solve different distribution problems: gated webinar hosting versus open multiplatform streaming.",
  "keyDifferences": [
    {
      "title": "Pricing Transparency",
      "toolA": "Goldcast requires a demo or sales conversation, with no public pricing listed for any plan.",
      "toolB": "Restream publishes a free plan and transparent paid tiers from $16/month (Standard, billed annually) up to $199/month (Business).",
      "whyItMatters": "Transparent, self-serve pricing lets buyers evaluate cost quickly, while sales-gated pricing suits larger negotiated deals.",
      "benefitsWho": "Individual creators and small teams benefit from Restream's transparent pricing; enterprise buyers accustomed to sales-led procurement may prefer Goldcast's model."
    },
    {
      "title": "CRM/Marketing Integration",
      "toolA": "Goldcast documents native integrations with Marketo, HubSpot, Eloqua, and Salesforce.",
      "toolB": "Restream does not document CRM or marketing automation integrations.",
      "whyItMatters": "Native CRM integration is essential for B2B teams tracking webinar leads through a marketing funnel.",
      "benefitsWho": "B2B marketing and demand-generation teams that need webinar data flowing into their CRM."
    },
    {
      "title": "Distribution Model",
      "toolA": "Goldcast is built around hosting webinars and virtual events with a polished, Netflix-style presentation experience.",
      "toolB": "Restream sends one live video source to dozens of destinations simultaneously, including YouTube, Twitch, Facebook, LinkedIn, and TikTok.",
      "whyItMatters": "Gated event hosting and open multiplatform broadcasting are fundamentally different distribution strategies for reaching an audience.",
      "benefitsWho": "Marketing teams running lead-gated events need Goldcast's model; creators building public reach across platforms need Restream's."
    },
    {
      "title": "Content Repurposing",
      "toolA": "Goldcast's Content Lab uses AI agents to automatically transform long-form event and recording footage into clips, blogs, and social posts.",
      "toolB": "Restream's AI-assisted clip generation is documented as a separate paid add-on rather than included by default.",
      "whyItMatters": "Built-in repurposing versus an add-on affects total cost and workflow simplicity for turning long recordings into shareable content.",
      "benefitsWho": "Content and marketing teams that need repurposing at scale benefit from Goldcast's included Content Lab."
    },
    {
      "title": "Free Plan Availability",
      "toolA": "Goldcast has no free plan or public pricing documented at all.",
      "toolB": "Restream offers a forever-free plan supporting 2 simultaneous channels, though it includes Restream branding.",
      "whyItMatters": "A free plan lets smaller users try the product before committing budget, which Goldcast does not offer.",
      "benefitsWho": "Solo creators and small teams testing multistreaming before paying benefit from Restream's free plan."
    }
  ],
  "featureMatrix": [
    {
      "group": "Event & Streaming Features",
      "rows": [
        {
          "feature": "Live webinar/virtual event hosting",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Simultaneous multiplatform broadcasting",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "On-demand video library hosting",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Goldcast Video Hubs"
        },
        {
          "feature": "Browser-based studio (no download)",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Restream Studio"
        },
        {
          "feature": "Unified chat/comment aggregation",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Restream Chat"
        }
      ]
    },
    {
      "group": "AI & Content Repurposing",
      "rows": [
        {
          "feature": "AI-driven repurposing into clips/blogs/social posts",
          "toolA": "available",
          "toolB": "limited",
          "note": "Restream's AI clip generation is a separate paid add-on"
        },
        {
          "feature": "AI search across video content",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Cloud recording",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Pricing & Integrations",
      "rows": [
        {
          "feature": "Publicly published pricing",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Goldcast requires a demo/sales contact"
        },
        {
          "feature": "Free plan",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Restream free plan: 2 channels, with branding"
        },
        {
          "feature": "Native CRM/marketing automation integrations",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Marketo, HubSpot, Eloqua, Salesforce"
        },
        {
          "feature": "Public API",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Goldcast pricing public?",
      "answer": "No — Goldcast's pricing page outlines plan categories but requires contacting sales or requesting a demo for actual costs."
    },
    {
      "question": "Does Restream have a free plan?",
      "answer": "Yes, supporting multistreaming to 2 channels at once, though it includes Restream branding."
    },
    {
      "question": "Does Goldcast integrate with CRM tools?",
      "answer": "Yes, natively with Marketo, HubSpot, Eloqua, and Salesforce."
    },
    {
      "question": "Can Restream be used with OBS or vMix?",
      "answer": "Yes, it accepts incoming RTMP or SRT streams from external encoders like OBS or vMix."
    },
    {
      "question": "Does either tool use AI to repurpose video content?",
      "answer": "Yes — Goldcast's Content Lab automatically repurposes long-form footage into clips, blogs, and social posts, while Restream offers AI-assisted clip generation as a separate paid add-on."
    },
    {
      "question": "What's the core difference between Goldcast and Restream?",
      "answer": "Goldcast is built for hosting gated B2B webinars and virtual events with CRM integration, while Restream is built for broadcasting one live stream simultaneously to public social platforms like YouTube and Twitch."
    }
  ]
};

export default goldcastVsRestreamContent;
