import type { GroupComparisonContent } from './types';

const carrdVsGodaddyWebsiteBuilderVsLeadpagesContent: GroupComparisonContent = {
  "verdict": "Carrd, GoDaddy Website Builder and Leadpages all let non-technical users publish a page quickly, but they serve different needs. Carrd is the simplest and cheapest, limited to single-page sites but ideal for portfolios and link-in-bio pages. GoDaddy Website Builder is the most complete small-business bundle, combining hosting, AI-assisted setup, marketing and ecommerce with 24/7 support in one subscription. Leadpages is the most specialized, built around A/B testing, heatmaps and AI-driven traffic routing for marketers who need to measure and improve landing page conversion rather than run a full storefront or content site.",
  "bestFor": {
    "carrd": "Solo creators who want one ultra-cheap, ultra-simple page live in minutes.",
    "godaddy-website-builder": "Small businesses that want hosting, marketing, ecommerce and support bundled into one managed subscription.",
    "leadpages": "Marketers focused on testing and optimizing landing pages for lead capture and sales."
  },
  "highlights": [
    {
      "title": "Cheapest and simplest option",
      "description": "Carrd's Pro Lite plan costs $9/year, well below GoDaddy Website Builder's $9.99/month and Leadpages' $49-99/month.",
      "toolSlugs": [
        "carrd"
      ]
    },
    {
      "title": "All-in-one small business bundle",
      "description": "GoDaddy Website Builder combines hosting, AI-assisted site generation, email and social marketing, SEO tools and ecommerce in a single subscription.",
      "toolSlugs": [
        "godaddy-website-builder"
      ]
    },
    {
      "title": "Purpose-built conversion optimization",
      "description": "Leadpages offers A/B split testing, click and scroll heatmaps, and Smart Traffic AI routing that GoDaddy Website Builder and Carrd do not document.",
      "toolSlugs": [
        "leadpages"
      ]
    },
    {
      "title": "Ecommerce depth favors GoDaddy",
      "description": "GoDaddy Website Builder's top tier adds unlimited product listings, flexible payments and marketplace sync to Amazon, eBay and Etsy.",
      "toolSlugs": [
        "godaddy-website-builder"
      ]
    },
    {
      "title": "AI-assisted setup on two of the three",
      "description": "GoDaddy Website Builder's Airo and Leadpages' AI page creation both speed up initial setup, while Carrd relies on manual drag-and-drop editing.",
      "toolSlugs": [
        "godaddy-website-builder",
        "leadpages"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Page Scope and Pricing",
      "rows": [
        {
          "feature": "Multi-page website support",
          "statuses": {
            "carrd": "unavailable",
            "godaddy-website-builder": "available",
            "leadpages": "limited"
          },
          "note": "Leadpages allows unlimited individual landing pages but is not built as a cohesive, navigable multi-page site."
        },
        {
          "feature": "Free published-site plan",
          "statuses": {
            "carrd": "available",
            "godaddy-website-builder": "unavailable",
            "leadpages": "unavailable"
          }
        }
      ]
    },
    {
      "group": "Marketing and Conversion Tools",
      "rows": [
        {
          "feature": "AI-assisted page generation",
          "statuses": {
            "carrd": "unavailable",
            "godaddy-website-builder": "available",
            "leadpages": "available"
          }
        },
        {
          "feature": "A/B split testing",
          "statuses": {
            "carrd": "unavailable",
            "godaddy-website-builder": "not-documented",
            "leadpages": "available"
          }
        },
        {
          "feature": "Built-in SEO tools",
          "statuses": {
            "carrd": "not-documented",
            "godaddy-website-builder": "available",
            "leadpages": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Business Tools",
      "rows": [
        {
          "feature": "Ecommerce and marketplace tools",
          "statuses": {
            "carrd": "limited",
            "godaddy-website-builder": "available",
            "leadpages": "unavailable"
          },
          "note": "Carrd supports Stripe/PayPal payment embeds but has no native product catalog or storefront."
        },
        {
          "feature": "24/7 customer support",
          "statuses": {
            "carrd": "not-documented",
            "godaddy-website-builder": "available",
            "leadpages": "not-documented"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is the most affordable?",
      "answer": "Carrd, at $9/year for Pro Lite versus GoDaddy Website Builder's $9.99/month and Leadpages' $49-99/month."
    },
    {
      "question": "Which bundles hosting, marketing and ecommerce together?",
      "answer": "GoDaddy Website Builder, which combines hosting, AI-assisted setup, marketing and a full ecommerce tier in one subscription."
    },
    {
      "question": "Which is purpose-built for testing and optimizing landing pages?",
      "answer": "Leadpages, with A/B testing, heatmaps and Smart Traffic AI routing built into its hosting layer."
    },
    {
      "question": "Which supports full multi-page websites with SEO tools?",
      "answer": "GoDaddy Website Builder, which includes built-in SEO tools alongside multi-page site support."
    },
    {
      "question": "Which one offers 24/7 customer support?",
      "answer": "GoDaddy Website Builder, backed by GoDaddy's large-scale support operation."
    },
    {
      "question": "Is there a genuinely free plan among these three?",
      "answer": "Carrd offers a genuinely free tier with a live published site. GoDaddy Website Builder and Leadpages only offer free trials before requiring payment."
    }
  ]
};

export default carrdVsGodaddyWebsiteBuilderVsLeadpagesContent;
