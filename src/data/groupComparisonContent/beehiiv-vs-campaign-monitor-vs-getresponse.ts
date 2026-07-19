import type { GroupComparisonContent } from './types';

const beehiivVsCampaignMonitorVsGetresponseContent: GroupComparisonContent = {
  "verdict": "Beehiiv, Campaign Monitor and GetResponse are all genuine email marketing competitors, but they optimize for different jobs beyond sending campaigns. Beehiiv is built around newsletter publishing and creator monetization, GetResponse bundles the widest all-in-one marketing toolkit including funnels, webinars and courses, and Campaign Monitor stays closer to a focused, design-friendly email builder without those extras. The best choice depends on whether you're a newsletter creator, a small business needing straightforward campaigns, or a solo marketer who wants one platform to replace several tools.",
  "bestFor": {
    "beehiiv": "Independent writers and media creators who want to publish a newsletter, host a podcast, and monetize both through a built-in ad network and digital products without stitching together separate tools.",
    "campaign-monitor": "Small businesses, agencies managing multiple client accounts, or nonprofits that want a straightforward, design-friendly email builder from an established brand and don't need funnels, webinars, or monetization features.",
    "getresponse": "Solo creators, coaches, and e-commerce sellers who want one platform covering email, landing pages, sales funnels, abandoned-cart recovery, webinars, and course sales, and want to start on a free plan."
  },
  "highlights": [
    {
      "title": "Beehiiv is built for creators who want to monetize a newsletter and podcast in one place",
      "description": "Beehiiv includes native podcast hosting and an ad network with a 0 percent take rate on paid subscriptions on paid plans, monetization features not documented for Campaign Monitor or GetResponse.",
      "toolSlugs": [
        "beehiiv"
      ]
    },
    {
      "title": "GetResponse has the widest all-in-one feature set",
      "description": "Beyond email, GetResponse bundles landing pages, sales funnels, webinars for up to 100 attendees, and a paid course creator, a broader toolkit than either Beehiiv or Campaign Monitor is documented as offering.",
      "toolSlugs": [
        "getresponse"
      ]
    },
    {
      "title": "Campaign Monitor has no permanent free plan",
      "description": "Campaign Monitor only offers a 30-day free trial capped at 500 contacts and 500 sends, while Beehiiv's Launch plan and GetResponse's Free plan are both ongoing free tiers with no expiration.",
      "toolSlugs": [
        "campaign-monitor",
        "beehiiv",
        "getresponse"
      ]
    },
    {
      "title": "Entry paid pricing favors Campaign Monitor, but with send caps",
      "description": "Campaign Monitor's Lite plan starts around $13 per month, cheaper than GetResponse's Starter at $19 per month or Beehiiv's Scale at $43 per month, but Lite caps monthly sends while GetResponse's Starter and Beehiiv's Scale include unlimited sends.",
      "toolSlugs": [
        "campaign-monitor",
        "getresponse",
        "beehiiv"
      ]
    },
    {
      "title": "Only Beehiiv includes native podcast hosting",
      "description": "Podcast hosting is a core Beehiiv feature aimed at converting listeners into subscribers, a capability not documented for Campaign Monitor or GetResponse.",
      "toolSlugs": [
        "beehiiv"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Free Tier and Core Sending",
      "rows": [
        {
          "feature": "Genuine ongoing free plan, not just a time-limited trial",
          "statuses": {
            "beehiiv": "available",
            "campaign-monitor": "unavailable",
            "getresponse": "available"
          }
        },
        {
          "feature": "AI-assisted email writing tools",
          "statuses": {
            "beehiiv": "available",
            "campaign-monitor": "available",
            "getresponse": "available"
          }
        }
      ]
    },
    {
      "group": "Automation and Pages",
      "rows": [
        {
          "feature": "Behavior-triggered marketing automation workflows",
          "statuses": {
            "beehiiv": "available",
            "campaign-monitor": "available",
            "getresponse": "available"
          }
        },
        {
          "feature": "Landing page or website builder included",
          "statuses": {
            "beehiiv": "available",
            "campaign-monitor": "limited",
            "getresponse": "available"
          },
          "note": "Campaign Monitor's website builder is only available on its higher-priced Premier plan."
        }
      ]
    },
    {
      "group": "Monetization and Extras",
      "rows": [
        {
          "feature": "Native monetization tools (ads, digital products, or paid subscriptions)",
          "statuses": {
            "beehiiv": "available",
            "campaign-monitor": "unavailable",
            "getresponse": "limited"
          },
          "note": "GetResponse's monetization is scoped to its Creator plan, which adds a paid course creator and premium newsletter subscriptions."
        },
        {
          "feature": "Podcast hosting",
          "statuses": {
            "beehiiv": "available",
            "campaign-monitor": "unavailable",
            "getresponse": "unavailable"
          }
        },
        {
          "feature": "Webinar hosting",
          "statuses": {
            "beehiiv": "not-documented",
            "campaign-monitor": "not-documented",
            "getresponse": "available"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these has a genuinely free ongoing plan?",
      "answer": "Beehiiv's Launch plan (up to 2,500 subscribers) and GetResponse's Free plan are both ongoing free tiers. Campaign Monitor only offers a 30-day free trial capped at 500 contacts and 500 sends."
    },
    {
      "question": "Which is best for a newsletter that also has a podcast?",
      "answer": "Beehiiv, since podcast hosting is a core listed feature. Podcast hosting is not documented for Campaign Monitor or GetResponse."
    },
    {
      "question": "Which one includes webinars and online courses?",
      "answer": "GetResponse, through its Creator plan, which adds a course creator for up to about 500 students and webinar hosting for up to 100 attendees."
    },
    {
      "question": "How does entry-level paid pricing compare?",
      "answer": "Campaign Monitor's Lite plan is the cheapest entry point at around $13 per month but caps monthly sends. GetResponse's Starter plan starts around $19 per month and Beehiiv's Scale plan starts at $43 per month, both with unlimited sends included."
    },
    {
      "question": "Does any of them include a built-in ad network for monetizing content?",
      "answer": "Beehiiv does, with a native ad network offering a 0 percent take rate on paid subscriptions on paid plans. This is not documented for Campaign Monitor or GetResponse."
    },
    {
      "question": "Which platform has been around the longest?",
      "answer": "GetResponse has the longest history, founded in 1998, followed by Campaign Monitor in 2004 and Beehiiv in 2021."
    }
  ]
};

export default beehiivVsCampaignMonitorVsGetresponseContent;
