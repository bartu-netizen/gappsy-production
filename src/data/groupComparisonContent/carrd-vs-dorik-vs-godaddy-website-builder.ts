import type { GroupComparisonContent } from './types';

const carrdVsDorikVsGodaddyWebsiteBuilderContent: GroupComparisonContent = {
  "verdict": "Carrd, Dorik and GoDaddy Website Builder all promise a fast path to a live website without code, but they solve different problems. Carrd is the cheapest and simplest option, purpose-built for single-page sites like portfolios and link-in-bio pages rather than full websites. Dorik and GoDaddy Website Builder both support multi-page sites with AI-assisted generation, but Dorik leans toward freelancers and agencies with code export and white-label reselling, while GoDaddy Website Builder bundles hosting, marketing and ecommerce into one managed subscription backed by large-scale customer support.",
  "bestFor": {
    "carrd": "Solo creators and indie developers who need a single, fast, ultra-affordable landing or portfolio page.",
    "dorik": "Freelancers and agencies who want a full multi-page site with AI generation, a built-in CMS and white-label reselling.",
    "godaddy-website-builder": "Small business owners who want hosting, domain, marketing and ecommerce bundled with 24/7 support in one subscription."
  },
  "highlights": [
    {
      "title": "Cheapest way to get a page live",
      "description": "Carrd's Free tier and $9/year Pro Lite plan undercut both Dorik's and GoDaddy Website Builder's paid tiers by a wide margin.",
      "toolSlugs": [
        "carrd"
      ]
    },
    {
      "title": "AI generation plus agency reselling",
      "description": "Dorik pairs AI website generation with a white-label dashboard and unlimited-site Agency plan, letting agencies resell sites under their own brand.",
      "toolSlugs": [
        "dorik"
      ]
    },
    {
      "title": "Marketing and ecommerce bundled in",
      "description": "GoDaddy Website Builder combines hosting, email and social marketing, SEO tools and a full ecommerce tier in one subscription.",
      "toolSlugs": [
        "godaddy-website-builder"
      ]
    },
    {
      "title": "Code export sets Dorik apart",
      "description": "Dorik lets users export the underlying HTML/CSS on paid plans, while Carrd and GoDaddy Website Builder keep sites locked to their own platforms.",
      "toolSlugs": [
        "dorik"
      ]
    },
    {
      "title": "Only one has no permanent free plan",
      "description": "Carrd and Dorik both offer usable free tiers with a live published site; GoDaddy Website Builder only offers a free trial before requiring payment.",
      "toolSlugs": [
        "carrd",
        "dorik",
        "godaddy-website-builder"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Site Scope and Access",
      "rows": [
        {
          "feature": "Multi-page website support",
          "statuses": {
            "carrd": "unavailable",
            "dorik": "available",
            "godaddy-website-builder": "available"
          },
          "note": "Carrd is deliberately built only for single-page sites."
        },
        {
          "feature": "Free published-site plan",
          "statuses": {
            "carrd": "available",
            "dorik": "available",
            "godaddy-website-builder": "unavailable"
          },
          "note": "GoDaddy Website Builder offers only a free trial, not a permanently free published plan."
        },
        {
          "feature": "Code export or data portability",
          "statuses": {
            "carrd": "unavailable",
            "dorik": "available",
            "godaddy-website-builder": "unavailable"
          }
        }
      ]
    },
    {
      "group": "AI and Content Tools",
      "rows": [
        {
          "feature": "AI site or content generation",
          "statuses": {
            "carrd": "unavailable",
            "dorik": "available",
            "godaddy-website-builder": "available"
          },
          "note": "Dorik's AI generates layouts, copy and images; GoDaddy uses its Airo AI layer."
        },
        {
          "feature": "Built-in CMS or blogging",
          "statuses": {
            "carrd": "unavailable",
            "dorik": "available",
            "godaddy-website-builder": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Business and Growth Tools",
      "rows": [
        {
          "feature": "White-label or agency reselling",
          "statuses": {
            "carrd": "unavailable",
            "dorik": "available",
            "godaddy-website-builder": "unavailable"
          }
        },
        {
          "feature": "Ecommerce and marketplace tools",
          "statuses": {
            "carrd": "limited",
            "dorik": "not-documented",
            "godaddy-website-builder": "available"
          },
          "note": "Carrd supports Stripe/PayPal payment embeds but has no native product catalog or storefront."
        },
        {
          "feature": "Built-in SEO tools",
          "statuses": {
            "carrd": "not-documented",
            "dorik": "not-documented",
            "godaddy-website-builder": "available"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three builders is cheapest to get a live site?",
      "answer": "Carrd, with a genuinely usable free tier and paid plans starting at just $9/year."
    },
    {
      "question": "Which one supports full multi-page websites rather than a single page?",
      "answer": "Dorik and GoDaddy Website Builder both support many pages, while Carrd is deliberately built only for one-page sites."
    },
    {
      "question": "Which tool is best suited for agencies managing multiple client sites?",
      "answer": "Dorik, thanks to its white-label dashboard and unlimited-site Agency plan."
    },
    {
      "question": "Which one includes ecommerce out of the box?",
      "answer": "GoDaddy Website Builder's top Ecommerce tier adds product listings, payments, shipping configuration and marketplace sync to Amazon, eBay and Etsy."
    },
    {
      "question": "Can I export my site's code if I want to leave the platform?",
      "answer": "Dorik supports code export on paid plans. Carrd and GoDaddy Website Builder do not offer code export or self-hosting."
    },
    {
      "question": "Which is best for someone who already owns a domain and wants everything bundled?",
      "answer": "GoDaddy Website Builder, since it bundles hosting, domain, marketing and ecommerce into one subscription with 24/7 customer support."
    }
  ]
};

export default carrdVsDorikVsGodaddyWebsiteBuilderContent;
