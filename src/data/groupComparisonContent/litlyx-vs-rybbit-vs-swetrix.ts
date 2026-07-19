import type { GroupComparisonContent } from './types';

const litlyxVsRybbitVsSwetrixContent: GroupComparisonContent = {
  "verdict": "Litlyx, Rybbit, and Swetrix are all young, cookie-free analytics platforms competing on how much they pack beyond basic pageviews. Litlyx differentiates with AI-generated, agency-ready reports and rapid setup. Rybbit stands out for keeping its free self-hosted build genuinely feature-complete, including session replay and funnels most competitors gate behind paid tiers. Swetrix goes furthest into product analytics, adding error tracking and A/B testing on top of session replay and funnels, with its richer features reserved for higher-priced cloud plans.",
  "bestFor": {
    "litlyx": "Agencies and solopreneurs who want AI-generated, client-ready performance reports and multi-workspace management for several sites.",
    "rybbit": "Teams that want a genuinely feature-complete free self-hosted build, or an affordable EU-hosted cloud option with a generous free tier.",
    "swetrix": "Teams that need web analytics plus error tracking and A/B testing in one platform, and are willing to pay for the higher tiers that unlock them."
  },
  "highlights": [
    {
      "title": "AI-generated reporting",
      "description": "Litlyx's one-click AI-generated reports summarizing web, product, SEO, and marketing performance are unique among the three.",
      "toolSlugs": [
        "litlyx"
      ]
    },
    {
      "title": "Feature-complete self-hosting",
      "description": "Rybbit's self-hosted build ships session replay and funnels for free, while Swetrix documents those same features as gated behind its paid Plus tier.",
      "toolSlugs": [
        "rybbit",
        "swetrix"
      ]
    },
    {
      "title": "Founding stage",
      "description": "Litlyx was founded in October 2024, Rybbit publicly launched in 2025, and Swetrix was founded in 2021, making Swetrix the most established of the three even though all three are still young companies.",
      "toolSlugs": [
        "litlyx",
        "rybbit",
        "swetrix"
      ]
    },
    {
      "title": "Pricing entry point",
      "description": "Rybbit's free cloud tier, covering 3,000 events per month, undercuts both Litlyx's Mini plan around EUR 8.99 per month and Swetrix's Standard plan around EUR 17 per month.",
      "toolSlugs": [
        "litlyx",
        "rybbit",
        "swetrix"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Deployment",
      "rows": [
        {
          "feature": "Free self-hosted tier",
          "statuses": {
            "litlyx": "available",
            "rybbit": "available",
            "swetrix": "available"
          }
        },
        {
          "feature": "Free managed cloud tier",
          "statuses": {
            "litlyx": "unavailable",
            "rybbit": "available",
            "swetrix": "unavailable"
          }
        }
      ]
    },
    {
      "group": "AI and Reporting",
      "rows": [
        {
          "feature": "AI-generated reports or summaries",
          "statuses": {
            "litlyx": "available",
            "rybbit": "unavailable",
            "swetrix": "unavailable"
          }
        }
      ]
    },
    {
      "group": "Product Analytics",
      "rows": [
        {
          "feature": "Session replay",
          "statuses": {
            "litlyx": "unavailable",
            "rybbit": "available",
            "swetrix": "available"
          }
        },
        {
          "feature": "Funnel analysis",
          "statuses": {
            "litlyx": "available",
            "rybbit": "available",
            "swetrix": "available"
          }
        },
        {
          "feature": "Error tracking",
          "statuses": {
            "litlyx": "unavailable",
            "rybbit": "not-documented",
            "swetrix": "available"
          }
        },
        {
          "feature": "A/B testing",
          "statuses": {
            "litlyx": "unavailable",
            "rybbit": "not-documented",
            "swetrix": "available"
          }
        }
      ]
    },
    {
      "group": "Agency Features",
      "rows": [
        {
          "feature": "Multi-workspace or agency client reporting",
          "statuses": {
            "litlyx": "available",
            "rybbit": "available",
            "swetrix": "not-documented"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which has a free managed cloud tier?",
      "answer": "Rybbit offers a free cloud tier covering 3,000 events per month on one site; Litlyx and Swetrix only offer free self-hosting, not a free managed cloud plan."
    },
    {
      "question": "Which has AI-generated reports?",
      "answer": "Litlyx is the only one of the three offering one-click AI-generated performance reports."
    },
    {
      "question": "Which self-hosted build is the most feature-complete for free?",
      "answer": "Rybbit's free self-hosted build includes session replay and funnels, which Swetrix reserves for its paid Plus tier and which Litlyx's self-hosted build does not document."
    },
    {
      "question": "Which has error tracking and A/B testing?",
      "answer": "Only Swetrix documents built-in error tracking and A/B testing with feature flags among these three."
    },
    {
      "question": "Which is best for agencies managing multiple client sites?",
      "answer": "Litlyx offers multi-domain workspaces and shareable branded client reports, Rybbit's Pro plan removes site and team member caps, and Swetrix supports up to 100 websites on its Plus plan but doesn't document a dedicated client-reporting feature."
    }
  ]
};

export default litlyxVsRybbitVsSwetrixContent;
