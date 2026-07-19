import type { GroupComparisonContent } from './types';

const bigmarkerVsBizzaboVsEventmobiContent: GroupComparisonContent = {
  "verdict": "BigMarker, Bizzabo, and EventMobi are all established event management platforms, but they diverge sharply on scale and pricing model. BigMarker centers on no-download browser webinars and can scale to as many as 500,000 attendees, though every tier is sales-gated with no published price. Bizzabo is a premium, hardware-enabled Event Experience OS starting near $18,000 per year, built for large B2B in-person conferences. EventMobi is the most accessible of the three on price transparency, offering published per-event and annual rates for organizers who don't need enterprise-scale infrastructure.",
  "bestFor": {
    "bigmarker": "Organizations running massive webinars or virtual broadcasts that need a no-download browser experience and the ability to scale into the hundreds of thousands of attendees.",
    "bizzabo": "Large enterprise B2B conference organizers who want an end-to-end Event Experience OS plus Klik SmartBadge hardware for big in-person events.",
    "eventmobi": "Organizers who want publicly listed per-event or annual pricing and a simpler, modular toolkit for conferences without a mandatory sales call."
  },
  "highlights": [
    {
      "title": "BigMarker scales furthest for massive webinars",
      "description": "BigMarker's Enterprise+ tier supports up to 500,000 live attendees, well beyond the published capacity of Bizzabo or EventMobi.",
      "toolSlugs": [
        "bigmarker"
      ]
    },
    {
      "title": "Bizzabo differentiates with SmartBadge hardware",
      "description": "Bizzabo's Klik SmartBadges enable click-to-connect networking, lead capture, and gamification, a hardware-driven feature not offered by BigMarker or EventMobi.",
      "toolSlugs": [
        "bizzabo"
      ]
    },
    {
      "title": "EventMobi is the only one with fully published starting prices",
      "description": "EventMobi lists starting prices of $3,000 per event or $8,900 per year with no sales call required, while BigMarker requires contacting sales at every tier.",
      "toolSlugs": [
        "eventmobi"
      ]
    },
    {
      "title": "No-download browser webinars lower the barrier to attend",
      "description": "BigMarker's webinars run entirely in the browser with no software install required for attendees.",
      "toolSlugs": [
        "bigmarker"
      ]
    },
    {
      "title": "All three support hybrid events alongside their core format",
      "description": "BigMarker, Bizzabo, and EventMobi each support hybrid events that combine in-person and virtual attendance.",
      "toolSlugs": [
        "bigmarker",
        "bizzabo",
        "eventmobi"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Webinar and Streaming",
      "rows": [
        {
          "feature": "No-download browser attendance",
          "statuses": {
            "bigmarker": "available",
            "bizzabo": "not-documented",
            "eventmobi": "not-documented"
          }
        },
        {
          "feature": "HD live streaming or broadcast studio",
          "statuses": {
            "bigmarker": "available",
            "bizzabo": "not-documented",
            "eventmobi": "available"
          }
        }
      ]
    },
    {
      "group": "In-Person and Hybrid Tools",
      "rows": [
        {
          "feature": "Onsite check-in and badge tools",
          "statuses": {
            "bigmarker": "not-documented",
            "bizzabo": "available",
            "eventmobi": "available"
          },
          "note": "Bizzabo uses Klik SmartBadge hardware; EventMobi offers onsite check-in and badge printing as an add-on module."
        },
        {
          "feature": "Top-tier attendee capacity",
          "statuses": {
            "bigmarker": "available",
            "bizzabo": "not-documented",
            "eventmobi": "available"
          },
          "note": "BigMarker's Enterprise+ tier supports up to 500,000 attendees; EventMobi's Enterprise tier targets 10,000-plus."
        }
      ]
    },
    {
      "group": "Pricing and Integrations",
      "rows": [
        {
          "feature": "Published starting price without a sales call",
          "statuses": {
            "bigmarker": "unavailable",
            "bizzabo": "available",
            "eventmobi": "available"
          },
          "note": "Bizzabo publishes its Event Experience OS starting price at $17,999/year; every BigMarker tier requires contacting sales."
        },
        {
          "feature": "API and third-party integrations",
          "statuses": {
            "bigmarker": "available",
            "bizzabo": "not-documented",
            "eventmobi": "available"
          },
          "note": "BigMarker's API access is locked behind its Enterprise tier; EventMobi offers a free API and Zapier integration."
        },
        {
          "feature": "Native mobile apps (iOS and Android)",
          "statuses": {
            "bigmarker": "available",
            "bizzabo": "available",
            "eventmobi": "available"
          },
          "note": "BigMarker's mobile SDK is available at its Enterprise+ tier."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which platform is most affordable for a single mid-size conference?",
      "answer": "EventMobi is the most transparent option, with a published per-event starting price of $3,000 that scales with attendee count and selected modules. BigMarker and Bizzabo both require a sales conversation to get a quote, and Bizzabo's Event Experience OS starts near $17,999 per year."
    },
    {
      "question": "Which tool handles the largest webinar audiences?",
      "answer": "BigMarker is built for scale, with its Enterprise+ tier supporting up to 500,000 live attendees and a no-download browser experience, well beyond what EventMobi or Bizzabo publish for capacity."
    },
    {
      "question": "Do any of these platforms offer free or self-serve signup?",
      "answer": "None of the three publishes a free self-serve plan; BigMarker requires contacting sales for every tier, Bizzabo starts at $17,999 per year with a 3-user minimum, and EventMobi publishes starting prices but still routes larger or enterprise needs through a sales conversation."
    },
    {
      "question": "Which is best for large in-person conferences with badge and check-in needs?",
      "answer": "Bizzabo stands out with its Klik SmartBadge hardware for click-to-connect networking and lead capture at large events, while EventMobi also offers onsite check-in and badge printing as a selectable add-on module. BigMarker does not document onsite badge or check-in tooling."
    },
    {
      "question": "Do these platforms integrate with CRM and marketing tools?",
      "answer": "BigMarker offers CRM and marketing integrations plus API and Zapier access at its Enterprise tier, and EventMobi provides a free API and Zapier integration. Bizzabo's integration capabilities are not documented in detail."
    },
    {
      "question": "Which platform is the most enterprise-focused with dedicated support?",
      "answer": "Bizzabo positions itself as an end-to-end Event Experience OS for large B2B conferences with 24/7 support on its published plan. BigMarker's highest tier adds SSO, MFA, and white-labeled domains for enterprise buyers, while EventMobi offers a dedicated Event Success Manager on its annual unlimited-events plan."
    }
  ]
};

export default bigmarkerVsBizzaboVsEventmobiContent;
