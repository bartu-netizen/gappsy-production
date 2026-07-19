import type { GroupComparisonContent } from './types';

const dudaVsGodaddyWebsiteBuilderVsLeadpagesContent: GroupComparisonContent = {
  "verdict": "Duda, GoDaddy Website Builder and Leadpages are all no-code, template-driven site builders with free trials, but they are built for different jobs. Duda is purpose-built for agencies and web professionals managing many client sites at once, with white-label and client-collaboration tools the other two lack. GoDaddy Website Builder is the simplest, cheapest path to one small-business website bundled with hosting, domain and marketing tools. Leadpages is narrower still, optimized specifically for high-converting landing pages with built-in A/B testing and AI traffic routing rather than a full multi-page business site. Which one wins depends on whether you are building one business site, many client sites, or a single high-converting campaign page.",
  "bestFor": {
    "duda": "Digital agencies and web professionals who need to build, white-label and manage many client websites from one account",
    "godaddy-website-builder": "Solo small-business owners who want the fastest, cheapest way to get one website live with hosting, domain and marketing bundled in",
    "leadpages": "Marketers and course creators who need a dedicated landing page with built-in A/B testing and conversion optimization rather than a full general-purpose website"
  },
  "highlights": [
    {
      "title": "Only Duda is built for agency-scale multi-site management",
      "description": "Duda's client-management dashboard, white-label mode and per-account, multi-site billing make it the only one of the three purpose-built to run many client sites from a single account.",
      "toolSlugs": [
        "duda"
      ]
    },
    {
      "title": "Entry pricing favors GoDaddy for a single site",
      "description": "GoDaddy's Basic plan starts at $9.99/month for one site, undercutting Duda's $19/month Basic plan, while Leadpages has no comparable low-cost single-site starter tier.",
      "toolSlugs": [
        "godaddy-website-builder",
        "duda",
        "leadpages"
      ]
    },
    {
      "title": "Leadpages specializes in conversion optimization",
      "description": "Leadpages is the only one of the three built around manual A/B split testing, Smart Traffic AI routing and click and scroll heatmaps for optimizing a single page's conversion rate.",
      "toolSlugs": [
        "leadpages"
      ]
    },
    {
      "title": "GoDaddy bundles ecommerce and marketing at accessible pricing",
      "description": "GoDaddy's Ecommerce tier includes product listings, flexible payments, shipping configuration and marketplace sync to Amazon, eBay and Etsy, none of which Duda or Leadpages match with a comparable native ecommerce suite.",
      "toolSlugs": [
        "godaddy-website-builder"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Site Building",
      "rows": [
        {
          "feature": "No-code drag-and-drop editor",
          "statuses": {
            "duda": "available",
            "godaddy-website-builder": "available",
            "leadpages": "available"
          }
        },
        {
          "feature": "AI-assisted site or page generation",
          "statuses": {
            "duda": "available",
            "godaddy-website-builder": "available",
            "leadpages": "available"
          },
          "note": "Duda's AI Website Builder, GoDaddy's Airo and Leadpages' AI page creation all generate a starting draft from a business description."
        },
        {
          "feature": "Full multi-page business website",
          "statuses": {
            "duda": "available",
            "godaddy-website-builder": "available",
            "leadpages": "limited"
          },
          "note": "Leadpages is marketed as a landing page and website builder, but its feature set is optimized for single conversion pages rather than full multi-page sites."
        }
      ]
    },
    {
      "group": "Agency and Scale",
      "rows": [
        {
          "feature": "White-label branding for clients",
          "statuses": {
            "duda": "available",
            "godaddy-website-builder": "unavailable",
            "leadpages": "unavailable"
          }
        },
        {
          "feature": "Multi-site management under one account",
          "statuses": {
            "duda": "available",
            "godaddy-website-builder": "not-documented",
            "leadpages": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Conversion and Commerce",
      "rows": [
        {
          "feature": "A/B split testing",
          "statuses": {
            "duda": "not-documented",
            "godaddy-website-builder": "not-documented",
            "leadpages": "available"
          }
        },
        {
          "feature": "Ecommerce (products, payments, shipping)",
          "statuses": {
            "duda": "not-documented",
            "godaddy-website-builder": "available",
            "leadpages": "not-documented"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three is best for an agency managing many client websites?",
      "answer": "Duda, thanks to its client-management dashboard, white-label mode and account structure built specifically for agencies handling multiple client sites at once."
    },
    {
      "question": "Which is the cheapest way to get a single small-business website live?",
      "answer": "GoDaddy Website Builder's Basic plan starts at $9.99/month, undercutting Duda's $19/month Basic plan. Leadpages has no comparable low-cost single-site starter option."
    },
    {
      "question": "Can Leadpages replace a full business website?",
      "answer": "Leadpages describes itself as a landing page and website builder, but its core features, such as A/B testing, Smart Traffic and dynamic text replacement, are built around single conversion pages rather than the multi-page, ecommerce-capable sites Duda and GoDaddy support."
    },
    {
      "question": "Does GoDaddy or Duda offer built-in ecommerce?",
      "answer": "GoDaddy's Ecommerce tier includes product listings, flexible payment options, shipping configuration and marketplace sync to Amazon, eBay and Etsy. Duda's plans do not describe a comparable native ecommerce suite."
    },
    {
      "question": "Do any of these tools offer white-label reselling?",
      "answer": "Only Duda, on its Agency and White Label tiers, lets you fully rebrand the platform for clients including a custom domain for the editor itself. GoDaddy and Leadpages do not offer white-labeling."
    }
  ]
};

export default dudaVsGodaddyWebsiteBuilderVsLeadpagesContent;
