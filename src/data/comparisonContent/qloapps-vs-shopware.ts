import type { ToolComparisonContent } from './types';

const qloappsVsShopwareContent: ToolComparisonContent = {
  "verdict": "QloApps and Shopware are both ecommerce platforms, but they serve different industries. QloApps is free, open-source software purpose-built for hotel reservations, combining a direct booking engine with a property management system. Shopware is a general-purpose ecommerce platform for selling physical or digital products, with a free Community Edition and paid cloud plans starting at €600/month for retailers and B2B sellers.",
  "bestForToolA": "QloApps fits hotels and property managers who want a free, self-hostable booking engine and PMS combo, with an optional managed cloud hosting add-on if they don't want to run their own servers.",
  "bestForToolB": "Shopware fits retailers, wholesalers, and B2B merchants selling physical or digital products who need omnichannel storefronts, B2B components, and CMS/SEO tooling, and who can afford Rise plans starting at €600/month or are willing to self-host the free Community Edition.",
  "whoNeedsBoth": "A hospitality group that also runs a branded retail shop (for example, selling merchandise or amenity kits online alongside room bookings) could run QloApps for reservations and a separate Shopware storefront for retail sales, since neither platform's documented features cover the other's core use case.",
  "keyDifferences": [
    {
      "title": "Industry Focus",
      "toolA": "QloApps is purpose-built for multilingual, multicurrency hotel reservations, combining a booking engine with a property management system for on-desk and online bookings.",
      "toolB": "Shopware is a general commerce platform for retail and B2B goods, with CMS, SEO, and omnichannel selling tools, not a hospitality-specific system.",
      "whyItMatters": "Vertical-specific software like QloApps bakes in booking logic (rooms, dates, availability) that a general commerce platform would require custom development to replicate.",
      "benefitsWho": "Independent hotels and small property groups benefit from QloApps's ready-made booking workflow instead of adapting general ecommerce software."
    },
    {
      "title": "Pricing Model",
      "toolA": "QloApps's self-hosted edition is free and open source, with an optional managed cloud hosting service for those who don't want to self-host.",
      "toolB": "Shopware's Community Edition is also free and self-hosted, but its cloud plans start at €600/month (Rise) and rise to €2,400/month (Evolve) or custom pricing (Beyond).",
      "whyItMatters": "Both offer a free self-hosted path, but Shopware's managed hosting is priced for retail businesses at a much higher tier than QloApps's optional cloud add-on.",
      "benefitsWho": "Budget-conscious independent hotel owners benefit from QloApps's free-first pricing model, while larger retail operations may accept Shopware's higher cloud pricing for its broader feature set."
    },
    {
      "title": "Property Management vs. Retail Operations",
      "toolA": "QloApps combines the booking engine with a full property management system for managing rooms and reservations.",
      "toolB": "Shopware's operational tooling centers on Flow Builder and Rule Builder for automation and business logic around product sales, not room or inventory-by-date management.",
      "whyItMatters": "Hotels need date-based inventory (rooms per night) rather than the SKU-based inventory model most ecommerce platforms are built around.",
      "benefitsWho": "Hoteliers benefit from QloApps's PMS integration, which avoids needing to bolt a booking calendar onto a generic product catalog."
    },
    {
      "title": "B2B and Enterprise Selling",
      "toolA": "QloApps's documented features do not include B2B-specific sales tooling.",
      "toolB": "Shopware offers dedicated B2B components and digital sales rooms on its higher tiers for business-to-business transactions.",
      "whyItMatters": "B2B sellers need quoting, custom pricing, and account-based purchasing flows that hospitality booking software isn't designed to provide.",
      "benefitsWho": "Wholesalers and manufacturers benefit from Shopware's B2B tooling, which has no equivalent in QloApps."
    },
    {
      "title": "Company Backing and Documentation",
      "toolA": "QloApps publishes real customer case studies from hotels using the platform.",
      "toolB": "Shopware is a German-headquartered company named a Visionary in the 2025 Gartner Magic Quadrant for Digital Commerce, with a partner ecosystem of 1,200+ certified agencies.",
      "whyItMatters": "The scale of the vendor and its partner network affects how easy it is to find implementation help and third-party integrations.",
      "benefitsWho": "Larger retail businesses seeking outside implementation support benefit from Shopware's certified agency network; hotels seeking peer validation benefit from QloApps's published case studies."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Purpose",
      "rows": [
        {
          "feature": "Hotel booking engine",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Property management system (PMS)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "General product catalog / storefront",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "B2B commerce components",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Omnichannel multi-storefront selling",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Shopware Omnichannel connect"
        }
      ]
    },
    {
      "group": "Pricing & Hosting",
      "rows": [
        {
          "feature": "Free self-hosted edition",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Optional managed cloud hosting",
          "toolA": "available",
          "toolB": "available",
          "note": "Shopware cloud starts at €600/month (Rise)"
        },
        {
          "feature": "Custom/enterprise pricing tier",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Shopware Beyond plan"
        }
      ]
    },
    {
      "group": "Platform & Ecosystem",
      "rows": [
        {
          "feature": "Multilingual / multicurrency support",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Certified partner/agency network",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "1,200+ certified Shopware agencies"
        },
        {
          "feature": "Built-in CMS, SEO, and analytics",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "AI-assisted management tools",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Shopware Intelligence Copilot"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Can Shopware handle hotel bookings the way QloApps does?",
      "answer": "Shopware's documented features are built for general product commerce (CMS, B2B, omnichannel selling), with no room-and-date booking engine or PMS, so QloApps is the direct fit for hotel reservations."
    },
    {
      "question": "Is QloApps free like Shopware's Community Edition?",
      "answer": "Yes, both offer a free, self-hosted starting point: QloApps's self-hosted edition is free and open source, and Shopware's Community Edition is free and MIT-licensed."
    },
    {
      "question": "Does QloApps support multiple currencies for international guests?",
      "answer": "Yes, QloApps is described as multilingual and multicurrency out of the box, which is documented specifically for its hotel booking use case."
    },
    {
      "question": "How much does Shopware cost compared to QloApps's optional cloud hosting?",
      "answer": "Shopware's cheapest hosted plan, Rise, starts at €600/month; QloApps also offers optional managed cloud hosting, though its pricing isn't published in the available facts, alongside its always-free self-hosted edition."
    },
    {
      "question": "Is Shopware suitable for a hotel that also sells retail merchandise?",
      "answer": "Shopware's strength is general product commerce with B2B and omnichannel tools, so it could handle a hotel's retail merchandise sales, but it has no documented room-booking or PMS functionality, which would still require QloApps or a similar hospitality system."
    }
  ]
};

export default qloappsVsShopwareContent;
