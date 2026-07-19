import type { GroupComparisonContent } from './types';

const buzzsproutVsCastosVsPodbeanContent: GroupComparisonContent = {
  "verdict": "The right pick depends on how you want to pay and what you want bundled in. Buzzsprout and Podbean both offer free entry tiers and reward light publishers with low starting costs, while Castos trades a free plan for flat, unlimited-download pricing with no overage risk. If WordPress publishing or private internal feeds matter to you, Castos is the clear fit; if built-in monetization across ads, memberships, and paywalled content is the priority, Podbean documents the deepest toolset; if you just want the simplest path from recording to every major directory with an easy free trial-like tier, Buzzsprout is hard to beat.",
  "bestFor": {
    "buzzsprout": "Independent podcasters who want the simplest setup, a free plan to try before paying, and the option to add video publishing to Apple Podcasts without jumping to an expensive tier.",
    "castos": "WordPress-based podcasters and agencies who want flat unlimited hosting with no per-download overage fees, plus support for private or internal podcast feeds.",
    "podbean": "Creators who want the most complete built-in monetization suite (ads, Patron memberships, premium content, and donations) bundled directly into hosting at a low starting paid price."
  },
  "highlights": [
    {
      "title": "Castos is the only flat-rate, unlimited-download option",
      "description": "Castos charges a flat monthly rate per tier with no storage caps and no per-download overage fees, while Buzzsprout bills by upload hours and Podbean caps monthly upload allowances even though total storage is unlimited on paid plans.",
      "toolSlugs": [
        "castos",
        "buzzsprout",
        "podbean"
      ]
    },
    {
      "title": "Podbean bundles the deepest monetization suite",
      "description": "Podbean documents ads, listener Patron subscriptions, premium paywalled content, and one-time donations all inside the core dashboard, going beyond Buzzsprout's ad network plus listener support and beyond what Castos publicly documents for monetization.",
      "toolSlugs": [
        "podbean",
        "buzzsprout"
      ]
    },
    {
      "title": "Castos owns the WordPress and private-feed niche",
      "description": "Castos maintains its own Seriously Simple Podcasting WordPress plugin and supports private podcast feeds for internal comms, onboarding, or gated content, neither of which is documented for Buzzsprout or Podbean.",
      "toolSlugs": [
        "castos"
      ]
    },
    {
      "title": "Video publishing is available on two of the three",
      "description": "Buzzsprout's Audio + Video plan publishes video episodes to Apple Podcasts at up to 1080p, and Castos gates video file hosting behind its Pro tier; Podbean documents video hosting allowances but notes they are notably smaller than its audio allowances.",
      "toolSlugs": [
        "buzzsprout",
        "castos",
        "podbean"
      ]
    },
    {
      "title": "Free tiers exist at two of the three hosts",
      "description": "Buzzsprout and Podbean both offer a genuinely free starting plan (2 hours/month with 90-day retention, and roughly 5 hours of storage with 100GB bandwidth, respectively), while Castos has no free plan and instead offers a 14-day trial across all paid tiers.",
      "toolSlugs": [
        "buzzsprout",
        "podbean",
        "castos"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Hosting, distribution, and pricing model",
      "rows": [
        {
          "feature": "Free forever plan",
          "statuses": {
            "buzzsprout": "available",
            "castos": "unavailable",
            "podbean": "available"
          },
          "note": "Castos offers only a 14-day free trial on paid plans, no permanent free tier."
        },
        {
          "feature": "Flat rate with no per-download overage fees",
          "statuses": {
            "buzzsprout": "unavailable",
            "castos": "available",
            "podbean": "limited"
          },
          "note": "Buzzsprout bills by upload hours; Podbean has unlimited total storage on paid plans but a capped monthly upload allowance per tier."
        },
        {
          "feature": "Automatic directory distribution (Apple Podcasts, Spotify, etc.)",
          "statuses": {
            "buzzsprout": "available",
            "castos": "available",
            "podbean": "available"
          }
        },
        {
          "feature": "Video podcast publishing",
          "statuses": {
            "buzzsprout": "available",
            "castos": "available",
            "podbean": "limited"
          },
          "note": "Buzzsprout publishes up to 1080p to Apple Podcasts on its Audio + Video plan; Castos gates video hosting to the Pro tier; Podbean's video allowances are documented as smaller than its audio allowances."
        }
      ]
    },
    {
      "group": "Monetization and AI tools",
      "rows": [
        {
          "feature": "Built-in monetization (ads, subscriptions, or donations)",
          "statuses": {
            "buzzsprout": "available",
            "castos": "not-documented",
            "podbean": "available"
          },
          "note": "Castos' provided feature list does not document a monetization suite."
        },
        {
          "feature": "AI-generated transcripts or show notes",
          "statuses": {
            "buzzsprout": "available",
            "castos": "available",
            "podbean": "available"
          },
          "note": "Buzzsprout offers AI transcripts, Castos an AI Assistant for show notes/titles/social posts/chapters, and Podbean AI show notes and transcripts via a monthly AI credit allowance."
        },
        {
          "feature": "Private or internal podcast feeds",
          "statuses": {
            "buzzsprout": "not-documented",
            "castos": "available",
            "podbean": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Platform integrations and team support",
      "rows": [
        {
          "feature": "Native WordPress publishing",
          "statuses": {
            "buzzsprout": "not-documented",
            "castos": "available",
            "podbean": "not-documented"
          }
        },
        {
          "feature": "Team collaboration or multi-user support",
          "statuses": {
            "buzzsprout": "available",
            "castos": "not-documented",
            "podbean": "available"
          },
          "note": "Podbean's Network plan documents up to 50 team members; Castos' provided feature list does not mention team collaboration."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of Buzzsprout, Castos, and Podbean has the cheapest paid plan?",
      "answer": "Podbean's Unlimited Audio plan starts at $12/month billed annually, followed by Buzzsprout's Audio plan at $15/month billed annually, and Castos' Essentials plan at $19/month. Castos' price is flat with no download overage fees, while Buzzsprout and Podbean both cap monthly upload allowances at their entry tiers."
    },
    {
      "question": "Do all three offer a free plan?",
      "answer": "Buzzsprout and Podbean both have permanent free tiers (2 hours/month with 90-day retention, and about 5 hours of storage with 100GB bandwidth, respectively). Castos does not have a free plan; it offers a 14-day free trial on all paid tiers instead."
    },
    {
      "question": "Which host is best for a podcast published through WordPress?",
      "answer": "Castos is the only one of the three that documents native WordPress publishing, through its own Seriously Simple Podcasting plugin, letting podcasters publish episodes directly from the WordPress dashboard."
    },
    {
      "question": "Which platform has the strongest built-in monetization?",
      "answer": "Podbean documents the broadest built-in monetization suite: an ad marketplace, listener Patron memberships, premium paywalled episodes, and one-time donations. Buzzsprout also offers an ad network and listener support/subscription features. Castos' provided data does not document a comparable monetization toolset."
    },
    {
      "question": "Can I publish video episodes on all three?",
      "answer": "Buzzsprout's Audio + Video plan and Castos' Pro tier both support video publishing, with Buzzsprout specifically supporting up to 1080p distribution to Apple Podcasts. Podbean documents video hosting allowances but notes they are smaller than its audio allowances."
    },
    {
      "question": "Which one charges based on usage instead of a flat rate?",
      "answer": "Buzzsprout's pricing is built around monthly and annual upload hours rather than storage. Podbean has unlimited total storage on paid plans but still caps monthly upload volume per tier. Castos is the only one of the three billed as a flat rate per tier with no download-based overage fees."
    }
  ]
};

export default buzzsproutVsCastosVsPodbeanContent;
