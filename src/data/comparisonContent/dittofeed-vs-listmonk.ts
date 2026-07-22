import type { ToolComparisonContent } from './types';

const dittofeedVsListmonkContent: ToolComparisonContent = {
  "verdict": "Dittofeed is an open-source, embeddable customer engagement platform for multi-channel messaging — email, SMS, mobile push, and WhatsApp — with a drag-and-drop journey builder and low-code segmentation, freemium starting at $75 with a free self-hosting option. Listmonk is a completely free, open-source, self-hosted newsletter and mailing list manager, shipped as a single Go binary with a Postgres backend, built for high-throughput bulk email sending. Both are open-source messaging tools, but Dittofeed is built for multi-channel lifecycle automation while Listmonk is built for simple, high-volume email campaigns.",
  "bestForToolA": "Product and growth teams building multi-step, multi-channel lifecycle messaging (email, SMS, push, WhatsApp) with segmentation and journey automation — especially vertical SaaS wanting embeddable messaging UI components — fit Dittofeed best.",
  "bestForToolB": "Teams that want a completely free, simple, self-hosted mailing list manager for bulk email newsletters at high scale, deployed as a single Go binary with just a PostgreSQL dependency, fit Listmonk best.",
  "whoNeedsBoth": "A SaaS company could use Listmonk purely for its public marketing newsletter, taking advantage of its simple, free, high-throughput bulk sending, while using Dittofeed to power in-app, multi-channel lifecycle messaging (onboarding journeys via email, SMS, and push) embedded directly into the product.",
  "keyDifferences": [
    {
      "title": "Channel Breadth",
      "toolA": "Dittofeed supports email, SMS, mobile push, and WhatsApp, using Twilio for SMS and Resend for email delivery.",
      "toolB": "Listmonk is focused on email, with HTTP webhook-based 'extensible messengers' for reaching other channels, but no SMS, push, or WhatsApp support documented natively.",
      "whyItMatters": "Multi-channel messaging requirements immediately narrow the choice for teams needing SMS or push beyond email.",
      "benefitsWho": "Teams needing SMS/push/WhatsApp alongside email benefit from Dittofeed's native multi-channel support."
    },
    {
      "title": "Pricing",
      "toolA": "Dittofeed is freemium, with a paid hosted tier starting at $75 and a free self-hosting option to keep cloud costs low.",
      "toolB": "Listmonk is entirely free under the AGPLv3 license, with no paid tier at all.",
      "whyItMatters": "A zero-cost tool removes budget friction entirely, while a freemium model offers a hosted convenience option at a price.",
      "benefitsWho": "Budget-constrained teams benefit from Listmonk's fully free model; teams wanting a managed hosted option benefit from Dittofeed's paid tier."
    },
    {
      "title": "Automation Sophistication",
      "toolA": "Dittofeed offers a drag-and-drop journey builder and low-code customer segmentation for multi-step lifecycle automation.",
      "toolB": "Listmonk is built around bulk campaigns and a transactional API rather than multi-step journey automation.",
      "whyItMatters": "Multi-step, triggered lifecycle campaigns require fundamentally different tooling than one-off bulk sends.",
      "benefitsWho": "Growth/lifecycle marketing teams benefit from Dittofeed's journey builder; teams sending simple newsletters benefit from Listmonk's straightforward campaign model."
    },
    {
      "title": "Embeddability",
      "toolA": "Dittofeed provides embeddable UI components to add messaging features directly inside another application, particularly relevant for vertical SaaS.",
      "toolB": "Embeddable components are not documented for Listmonk — it functions as a standalone mailing list manager.",
      "whyItMatters": "SaaS products that want to offer messaging features natively within their own UI need embeddability specifically.",
      "benefitsWho": "Vertical SaaS companies building messaging into their own product benefit from Dittofeed's embeddable components."
    },
    {
      "title": "Deployment Simplicity",
      "toolA": "Dittofeed documents a free self-hosting option, though its infrastructure dependencies are not detailed to the same degree.",
      "toolB": "Listmonk ships as a single Go binary (or Docker image) with no external runtime dependencies beyond PostgreSQL, designed for straightforward self-hosting.",
      "whyItMatters": "Simpler deployment footprints reduce operational overhead for smaller teams self-hosting their own messaging infrastructure.",
      "benefitsWho": "Small teams or solo operators self-hosting benefit from Listmonk's minimal single-binary deployment model."
    }
  ],
  "featureMatrix": [
    {
      "group": "Channels & Messaging",
      "rows": [
        {
          "feature": "Email sending",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "SMS",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Dittofeed via Twilio"
        },
        {
          "feature": "Mobile push",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "WhatsApp",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Campaign analytics (opens/clicks/bounces)",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Pricing & Deployment",
      "rows": [
        {
          "feature": "Free self-hosting option",
          "toolA": "available",
          "toolB": "available",
          "note": "Listmonk is entirely free; Dittofeed offers free self-hosting alongside a paid hosted tier"
        },
        {
          "feature": "Paid hosted tier",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Dittofeed starts at $75"
        },
        {
          "feature": "Single-binary deployment",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Built-in SMTP sending service",
          "toolA": "not-documented",
          "toolB": "unavailable",
          "note": "Listmonk requires bringing your own SMTP/mail provider"
        }
      ]
    },
    {
      "group": "Automation & Integration",
      "rows": [
        {
          "feature": "Drag-and-drop journey builder",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Low-code customer segmentation",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Transactional messaging API",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Embeddable UI components",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Segment.io integration",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Listmonk really free?",
      "answer": "Yes, it's fully open source under the AGPLv3 license with no paid tier at all."
    },
    {
      "question": "Does Dittofeed have a free option?",
      "answer": "Yes, Dittofeed offers a free self-hosting option to keep cloud costs low, alongside a paid hosted tier starting at $75."
    },
    {
      "question": "Which tool supports SMS and WhatsApp?",
      "answer": "Dittofeed, via Twilio and other channel integrations. Listmonk is email-focused, with webhook-based extensible messengers for other channels but no native SMS/WhatsApp support documented."
    },
    {
      "question": "Does Listmonk include its own SMTP sending service?",
      "answer": "No, Listmonk has no built-in SMTP sending service — you must supply your own SMTP or mail provider."
    },
    {
      "question": "Can either tool be embedded inside another product?",
      "answer": "Dittofeed offers embeddable UI components specifically for adding messaging features into another app. This is not documented as a Listmonk feature."
    },
    {
      "question": "Which is simpler to self-host?",
      "answer": "Listmonk ships as a single Go binary requiring only a PostgreSQL database, a comparatively simple deployment footprint compared to Dittofeed's broader integration surface (Segment.io, Twilio, Resend)."
    }
  ]
};

export default dittofeedVsListmonkContent;
