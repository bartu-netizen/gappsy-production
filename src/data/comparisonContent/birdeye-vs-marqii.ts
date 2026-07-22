import type { ToolComparisonContent } from './types';

const birdeyeVsMarqiiContent: ToolComparisonContent = {
  "verdict": "Birdeye is a broad, agentic AI marketing platform for multi-location brands across industries, managing reviews across 200+ sites, listings across 50+ platforms, and visibility on AI search tools like ChatGPT and Perplexity, with integrations into 3,000+ apps including industry-specific PMS, EHR, POS, and DMS systems. Marqii is a restaurant-specific platform used by 15,000+ locations that automates listings across 70+ platforms, generates AI review responses, and — uniquely — syncs POS-integrated menu data across listing sites. Both cover reviews, listings, and local visibility, but Birdeye is vertical-agnostic at enterprise scale while Marqii is purpose-built for restaurant operations.",
  "bestForToolA": "Multi-location healthcare, retail, or franchise brands (Birdeye names Aspen Dental, Cracker Barrel, and Smile Brands as customers) needing industry-specific system integrations like PMS, EHR, POS, and DMS alongside broad review and listing management.",
  "bestForToolB": "Restaurant groups that need POS-integrated menu syncing across delivery and listing platforms alongside review management and SEO/GEO-optimized location pages, as used by named brands like Tacodeli and Insomnia Cookies.",
  "whoNeedsBoth": "This isn't a realistic pairing — both cover the same core job of managing reviews, listings, and local visibility, so a multi-location business would pick one based on its industry (restaurant-specific needs favor Marqii; broader industry-agnostic needs favor Birdeye) rather than running both.",
  "keyDifferences": [
    {
      "title": "Industry Specialization",
      "toolA": "Birdeye is built to serve multiple verticals, integrating with industry-specific PMS, EHR, POS, and DMS platforms across 3,000+ total app integrations.",
      "toolB": "Marqii is purpose-built for restaurants, with Menu Management that integrates directly with POS systems to keep menus current across listings — a feature Birdeye does not document.",
      "whyItMatters": "A restaurant-specific tool can offer deeper category features (like automated menu syncing) that a general-purpose platform doesn't need to build.",
      "benefitsWho": "Restaurant operators managing frequently changing menus across many delivery and listing platforms."
    },
    {
      "title": "Review and Listing Coverage",
      "toolA": "Birdeye manages reviews across 200+ sites and listings across 50+ platforms.",
      "toolB": "Marqii automates listing updates across 70+ platforms including Google, Yelp, Apple Maps, and Facebook.",
      "whyItMatters": "The raw platform counts differ by category — Birdeye's review coverage is broader while Marqii's listing coverage is broader — which matters depending on whether review monitoring or listing accuracy is the bigger priority.",
      "benefitsWho": "Marketing teams prioritizing either comprehensive review monitoring or comprehensive listing accuracy."
    },
    {
      "title": "AI Search Visibility",
      "toolA": "Birdeye's Search AI explicitly manages brand visibility on AI search tools like ChatGPT and Perplexity, as well as Google.",
      "toolB": "Marqii addresses AI search through its Host feature (SEO/GEO-optimized location pages with schema markup) and FAQ Widgets built for AI search.",
      "whyItMatters": "As AI search tools grow, both vendors are building for discoverability there, but through different mechanisms — a dedicated visibility product versus optimized page content.",
      "benefitsWho": "Marketing teams trying to future-proof local visibility beyond traditional Google search."
    },
    {
      "title": "Pricing Access",
      "toolA": "Birdeye uses outcome-based, custom pricing via a location-based pricing configurator or by contacting sales; no free plan exists, only a free brand scan/demo.",
      "toolB": "Marqii's pricing is not published on its homepage and requires scheduling a demo; a free AI Visibility Scan is offered instead of a trial.",
      "whyItMatters": "Neither platform publishes pricing, so buyers from either category must budget time for a sales process before knowing cost.",
      "benefitsWho": "Procurement teams that need to plan for a sales-driven purchasing process regardless of which tool they choose."
    },
    {
      "title": "Scale and Customer Base",
      "toolA": "Birdeye cites large enterprise multi-location brands by name, including Aspen Dental, Cracker Barrel, and Smile Brands.",
      "toolB": "Marqii states it serves 15,000+ restaurant locations, including named brands like Tacodeli, Insomnia Cookies, Deschutes Brewery, and Cooper's Hawk.",
      "whyItMatters": "Named enterprise references versus a large volume of restaurant-specific customers signal different kinds of social proof for buyers.",
      "benefitsWho": "Buyers evaluating vendor credibility within their specific industry segment."
    }
  ],
  "featureMatrix": [
    {
      "group": "Listings & Reviews",
      "rows": [
        {
          "feature": "Review monitoring across sites",
          "toolA": "available",
          "toolB": "available",
          "note": "Birdeye 200+ sites vs Marqii's AI review responses"
        },
        {
          "feature": "Business listings management",
          "toolA": "available",
          "toolB": "available",
          "note": "Birdeye 50+ platforms vs Marqii 70+ platforms"
        },
        {
          "feature": "POS-integrated menu management",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Social media content scheduling",
          "toolA": "available",
          "toolB": "available",
          "note": "Birdeye's Social AI vs Marqii's Social Management"
        },
        {
          "feature": "Industry-specific system integrations (PMS/EHR/POS/DMS)",
          "toolA": "available",
          "toolB": "limited",
          "note": "Marqii's POS integration is menu-specific, not broader PMS/EHR"
        }
      ]
    },
    {
      "group": "AI Capabilities",
      "rows": [
        {
          "feature": "AI search visibility (ChatGPT, Perplexity)",
          "toolA": "available",
          "toolB": "limited",
          "note": "Marqii's FAQ Widgets are AI-search optimized but not a dedicated visibility product"
        },
        {
          "feature": "AI-generated review responses",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "SEO/GEO-optimized location pages with schema",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Marqii's Host feature"
        },
        {
          "feature": "AI marketing automation (email/SMS by location)",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Scale & Access",
      "rows": [
        {
          "feature": "Total app integrations",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Birdeye states 3,000+"
        },
        {
          "feature": "Free plan or trial",
          "toolA": "unavailable",
          "toolB": "unavailable",
          "note": "Both offer only a free scan/demo, not a trial"
        },
        {
          "feature": "Published pricing",
          "toolA": "unavailable",
          "toolB": "unavailable"
        },
        {
          "feature": "Named enterprise customers cited",
          "toolA": "available",
          "toolB": "available",
          "note": "Different industries: multi-vertical vs restaurant-specific"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Birdeye or Marqii better for restaurants?",
      "answer": "Marqii is purpose-built for restaurants, with POS-integrated Menu Management that keeps menus synced across listing platforms — a feature Birdeye doesn't document. Birdeye is broader and industry-agnostic, integrating with PMS, EHR, POS, and DMS systems across multiple verticals."
    },
    {
      "question": "Do either of these tools offer a free trial?",
      "answer": "Neither offers a traditional free trial. Birdeye offers a free brand scan/demo, and Marqii offers a free AI Visibility Scan, but both require a sales conversation for actual pricing."
    },
    {
      "question": "How many review sites does each platform cover?",
      "answer": "Birdeye's Reviews AI covers 200+ review sites. Marqii doesn't state a specific review-site count, but automates listing updates (which includes review-relevant platforms like Google and Yelp) across 70+ platforms."
    },
    {
      "question": "Do these tools help with AI search visibility like ChatGPT?",
      "answer": "Birdeye's Search AI explicitly manages brand visibility on AI tools like ChatGPT and Perplexity alongside Google. Marqii addresses this indirectly through AI-search-optimized FAQ Widgets and SEO/GEO-optimized location pages."
    },
    {
      "question": "How many locations use Marqii versus Birdeye?",
      "answer": "Marqii states it's used by more than 15,000 restaurant locations. Birdeye doesn't publish a specific customer count in the facts, but names major multi-location brands like Aspen Dental, Cracker Barrel, and Smile Brands as customers."
    },
    {
      "question": "Is pricing published for either platform?",
      "answer": "No. Both Birdeye and Marqii require scheduling a demo or contacting sales to get pricing; neither publishes rate cards."
    }
  ]
};

export default birdeyeVsMarqiiContent;
