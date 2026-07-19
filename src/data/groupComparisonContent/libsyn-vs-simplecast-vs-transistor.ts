import type { GroupComparisonContent } from './types';

const libsynVsSimplecastVsTransistorContent: GroupComparisonContent = {
  "verdict": "Libsyn is the elder statesman of podcast hosting, offering the deepest back-catalog guarantee and its own AdvertiseCast ad marketplace, while Simplecast brings SiriusXM-grade analytics and Transistor offers the simplest unlimited-shows pricing for networks and agencies. All three include a free trial and industry-aligned analytics, so the decision usually comes down to whether an established ad marketplace, granular listener data, or predictable multi-show pricing matters most to a given publisher.",
  "bestFor": {
    "libsyn": "Long-running shows and media companies that want the most established host in podcasting plus a built-in advertising marketplace through AdvertiseCast.",
    "simplecast": "Publishers and serious independent podcasters who need detailed, SiriusXM-backed listener analytics and dynamic ad insertion.",
    "transistor": "Podcast networks and agencies managing multiple shows who want unlimited podcasts under one predictable, download-based plan."
  },
  "highlights": [
    {
      "title": "Two Decades of Podcast Hosting History",
      "description": "Libsyn launched in November 2004, predating Apple's iTunes podcast support, and still guarantees free-forever hosting for a show's back catalog on every plan.",
      "toolSlugs": [
        "libsyn"
      ]
    },
    {
      "title": "A Built-In Ad Marketplace",
      "description": "Libsyn's AdvertiseCast subsidiary and Simplecast's AdsWizz-powered Podcast Marketplace both give eligible shows a path to sponsorship revenue and dynamic ad insertion that Transistor does not natively match.",
      "toolSlugs": [
        "libsyn",
        "simplecast"
      ]
    },
    {
      "title": "Unlimited Shows, Priced by Downloads",
      "description": "Transistor drops per-show fees entirely, letting agencies and networks run unlimited podcasts on every tier starting at 19 dollars a month.",
      "toolSlugs": [
        "transistor"
      ]
    },
    {
      "title": "IAB-Aligned Measurement Matters for Advertisers",
      "description": "Libsyn and Transistor both explicitly document IAB-certified download analytics, a detail that matters for shows selling sponsorships to brand advertisers.",
      "toolSlugs": [
        "libsyn",
        "transistor"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Hosting and Storage",
      "rows": [
        {
          "feature": "Unlimited monthly upload allowance",
          "statuses": {
            "libsyn": "limited",
            "simplecast": "available",
            "transistor": "available"
          },
          "note": "Libsyn prices plans by monthly upload hours, though back-catalog episodes stay hosted forever at no extra cost."
        },
        {
          "feature": "Automated distribution to podcast directories",
          "statuses": {
            "libsyn": "available",
            "simplecast": "available",
            "transistor": "available"
          }
        }
      ]
    },
    {
      "group": "Website and Player",
      "rows": [
        {
          "feature": "Built-in podcast website",
          "statuses": {
            "libsyn": "available",
            "simplecast": "available",
            "transistor": "available"
          }
        },
        {
          "feature": "Embeddable web player",
          "statuses": {
            "libsyn": "not-documented",
            "simplecast": "available",
            "transistor": "available"
          }
        }
      ]
    },
    {
      "group": "Analytics and Monetization",
      "rows": [
        {
          "feature": "IAB-certified download analytics",
          "statuses": {
            "libsyn": "available",
            "simplecast": "not-documented",
            "transistor": "available"
          }
        },
        {
          "feature": "Built-in ad marketplace or dynamic ad insertion",
          "statuses": {
            "libsyn": "available",
            "simplecast": "available",
            "transistor": "limited"
          },
          "note": "Transistor documents fewer built-in monetization or sponsorship marketplace tools than Libsyn's AdvertiseCast or Simplecast's AdsWizz integration."
        }
      ]
    },
    {
      "group": "Network and Developer Tools",
      "rows": [
        {
          "feature": "Multi-show network management",
          "statuses": {
            "libsyn": "available",
            "simplecast": "not-documented",
            "transistor": "available"
          }
        },
        {
          "feature": "API access",
          "statuses": {
            "libsyn": "available",
            "simplecast": "limited",
            "transistor": "available"
          },
          "note": "Simplecast documents API integration specifically as an Enterprise-tier feature."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is the cheapest to start, Libsyn, Simplecast, or Transistor?",
      "answer": "Libsyn has the lowest advertised entry price at 5 dollars a month for its Basic Audio plan, though that tier includes only about 3 hours of new uploads a month. Simplecast starts at 15 dollars a month and Transistor starts at 19 dollars a month, both with unlimited storage from the first tier."
    },
    {
      "question": "Which platform keeps a show's older episodes hosted the longest?",
      "answer": "Libsyn guarantees back-catalog episodes stay hosted forever on every plan regardless of upload tier, a structural policy dating back to its 2004 founding. Simplecast and Transistor both offer unlimited storage on their standard plans as well, so all three avoid forcing shows to delete old episodes."
    },
    {
      "question": "Which tool offers the most built-in advertising revenue options?",
      "answer": "Libsyn's AdvertiseCast subsidiary and Simplecast's AdsWizz-powered Podcast Marketplace both connect eligible shows with sponsors and support dynamic ad insertion. Transistor documents fewer native monetization tools by comparison."
    },
    {
      "question": "Is any of these three a good fit for a podcast network with multiple shows?",
      "answer": "Transistor and Libsyn are both built for multi-show management, Transistor through unlimited podcasts on every plan and Libsyn through network-level RSS feeds and enterprise tooling. Simplecast's plans are structured more around team seats on a smaller number of shows."
    },
    {
      "question": "Do all three provide IAB-certified analytics?",
      "answer": "Libsyn and Transistor both explicitly document IAB-certified download measurement, which matters for shows reporting audience numbers to advertisers. Simplecast advertises detailed listener analytics but does not document IAB certification specifically."
    }
  ]
};

export default libsynVsSimplecastVsTransistorContent;
