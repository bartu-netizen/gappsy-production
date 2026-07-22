import type { GroupComparisonContent } from './types';

const fuseboxVsLibsynVsSimplecastContent: GroupComparisonContent = {
  "verdict": "Libsyn wins on longevity and its own AdvertiseCast ad marketplace, Simplecast leans on SiriusXM and AdsWizz backing for detailed analytics and dynamic ad insertion, and Fusebox differentiates with a decade of refined, brandable web-player technology bundled into affordable unlimited hosting. None has a permanent full-hosting free plan, so the real choice comes down to whether player customization, monetization infrastructure, or download-based analytics matters most.",
  "bestFor": {
    "fusebox": "podcasters who want a highly customizable, brandable on-site web player alongside affordable unlimited-upload hosting",
    "libsyn": "creators and networks who want the longest operating history in podcasting, storage-forever back catalogs, and a built-in ad marketplace",
    "simplecast": "publishers who want SiriusXM/AdsWizz-backed dynamic ad insertion and deeper listener analytics"
  },
  "highlights": [
    {
      "title": "Different pricing structures",
      "description": "Fusebox charges a flat $9/month for unlimited hosting with no download caps, Libsyn prices by how much new audio is uploaded each month starting at $5/month, and Simplecast prices by monthly download volume starting at $15/month with 20,000 downloads included.",
      "toolSlugs": [
        "fusebox",
        "libsyn",
        "simplecast"
      ]
    },
    {
      "title": "Fusebox's player heritage",
      "description": "Fusebox's four brandable player formats, Single Track, Archive, Sticky, and Full-Page, trace back nearly a decade to Pat Flynn's original Smart Podcast Player, a level of embeddable-player polish neither Libsyn nor Simplecast documents.",
      "toolSlugs": [
        "fusebox"
      ]
    },
    {
      "title": "Monetization infrastructure differs sharply",
      "description": "Libsyn owns its AdvertiseCast sponsorship marketplace with dynamic ad insertion, and Simplecast offers dynamic ad insertion through SiriusXM's AdsWizz Podcast Marketplace on its Professional and Enterprise tiers, while Fusebox supports advertising, sponsorships, and subscriptions without a dedicated ad marketplace.",
      "toolSlugs": [
        "libsyn",
        "simplecast",
        "fusebox"
      ]
    },
    {
      "title": "Libsyn's track record",
      "description": "Libsyn launched in 2004 as the first dedicated podcast hosting company, is publicly traded under the ticker LSYN, and guarantees back-catalog episodes stay hosted forever with no storage cap on any plan.",
      "toolSlugs": [
        "libsyn"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Pricing and Hosting",
      "rows": [
        {
          "feature": "Permanent free plan",
          "statuses": {
            "fusebox": "limited",
            "libsyn": "unavailable",
            "simplecast": "unavailable"
          },
          "note": "Fusebox's free tier is a player-only option for podcasters who host their episodes elsewhere, not full podcast hosting."
        },
        {
          "feature": "Unlimited uploads with no volume cap",
          "statuses": {
            "fusebox": "available",
            "libsyn": "limited",
            "simplecast": "limited"
          },
          "note": "Libsyn caps new monthly upload hours per tier though the back catalog stays free forever; Simplecast caps monthly downloads per tier though storage itself is unlimited."
        }
      ]
    },
    {
      "group": "Website and Player",
      "rows": [
        {
          "feature": "Multiple brandable web player formats",
          "statuses": {
            "fusebox": "available",
            "libsyn": "not-documented",
            "simplecast": "available"
          },
          "note": "Fusebox ships four distinct player formats; Simplecast offers its Recast embeddable player for clips."
        },
        {
          "feature": "Hosted podcast website",
          "statuses": {
            "fusebox": "not-documented",
            "libsyn": "available",
            "simplecast": "available"
          }
        }
      ]
    },
    {
      "group": "Monetization and Analytics",
      "rows": [
        {
          "feature": "Built-in ad marketplace or dynamic ad insertion",
          "statuses": {
            "fusebox": "unavailable",
            "libsyn": "available",
            "simplecast": "available"
          },
          "note": "Libsyn's is AdvertiseCast; Simplecast's runs through SiriusXM's AdsWizz on Professional and Enterprise tiers."
        },
        {
          "feature": "IAB-certified download analytics",
          "statuses": {
            "fusebox": "not-documented",
            "libsyn": "available",
            "simplecast": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Access and Trial",
      "rows": [
        {
          "feature": "API access",
          "statuses": {
            "fusebox": "available",
            "libsyn": "available",
            "simplecast": "available"
          },
          "note": "Libsyn and Simplecast document API access on their higher, Enterprise-level tiers."
        },
        {
          "feature": "Free trial on paid plans",
          "statuses": {
            "fusebox": "available",
            "libsyn": "available",
            "simplecast": "available"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which podcast host has the lowest starting price?",
      "answer": "Libsyn's Basic Audio plan starts at $5/month, though it comes with a small monthly upload allowance around 3 hours; Fusebox's $9/month Starter plan has no upload or listen caps at all."
    },
    {
      "question": "Which is best for monetizing a podcast with sponsorships or ads?",
      "answer": "Libsyn's AdvertiseCast marketplace and Simplecast's AdsWizz-powered dynamic ad insertion are both built-in ad infrastructure; Fusebox supports advertising and subscriptions but does not document a dedicated ad marketplace."
    },
    {
      "question": "Does any of these offer real podcast hosting for free?",
      "answer": "Not permanently. Fusebox's free tier only covers its web player for podcasters who already host episodes elsewhere; Libsyn and Simplecast have no permanent free hosting plan."
    },
    {
      "question": "Which is best if a customizable, on-site branded player matters most?",
      "answer": "Fusebox, whose player technology was refined for nearly a decade as the standalone Smart Podcast Player before hosting was added in 2023."
    },
    {
      "question": "Which platform has the longest track record?",
      "answer": "Libsyn, which launched in 2004 as the first dedicated podcast hosting company and is now a publicly traded company (LSYN)."
    },
    {
      "question": "Which offers the most detailed listener analytics?",
      "answer": "Simplecast documents the most granular analytics of the three, including location, device, and technology breakdowns on its Essential tier and above."
    }
  ]
};

export default fuseboxVsLibsynVsSimplecastContent;
