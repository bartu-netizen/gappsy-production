import type { GroupComparisonContent } from './types';

const carrdVsDorikVsLeadpagesContent: GroupComparisonContent = {
  "verdict": "Carrd, Dorik and Leadpages overlap around simple, fast page publishing, but they are built for different jobs. Carrd is the cheapest and most minimal, purpose-built for single-page sites rather than marketing campaigns. Leadpages is the most conversion-focused of the three, with built-in A/B testing, heatmaps and Smart Traffic AI routing aimed at marketers who need to measure and improve landing page performance. Dorik sits in between as a fuller multi-page website builder with AI generation and a white-label option for agencies, making it the closest fit for anyone who needs more than a single page but does not need Leadpages' testing depth.",
  "bestFor": {
    "carrd": "Individuals who need one simple, extremely cheap page, such as a portfolio or link-in-bio page, live in minutes.",
    "dorik": "Freelancers and agencies who want a full multi-page site with AI generation, a CMS and white-label reselling.",
    "leadpages": "Marketers who need conversion-focused landing pages with built-in A/B testing, heatmaps and AI traffic routing."
  },
  "highlights": [
    {
      "title": "Cheapest entry point",
      "description": "Carrd's Pro plans start at $9/year, far below Dorik's $29/month and Leadpages' $49-99/month.",
      "toolSlugs": [
        "carrd"
      ]
    },
    {
      "title": "Built for conversion optimization",
      "description": "Leadpages bundles A/B split testing, click and scroll heatmaps, and Smart Traffic AI routing to automatically send visitors to the best-converting page variant.",
      "toolSlugs": [
        "leadpages"
      ]
    },
    {
      "title": "Full multi-page sites with a CMS",
      "description": "Dorik supports unlimited pages and blog posts on its higher tiers, plus a built-in CMS, going well beyond Carrd's single-page format.",
      "toolSlugs": [
        "dorik"
      ]
    },
    {
      "title": "Agency-friendly white-labeling",
      "description": "Dorik's white-label dashboard and unlimited-site Agency plan let agencies manage many client sites under their own brand.",
      "toolSlugs": [
        "dorik"
      ]
    },
    {
      "title": "Lead enrichment for qualified leads",
      "description": "Leadpages appends firmographic data to form submissions so leads arrive pre-qualified, a capability neither Carrd nor Dorik documents.",
      "toolSlugs": [
        "leadpages"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Page Scope",
      "rows": [
        {
          "feature": "Multi-page website support",
          "statuses": {
            "carrd": "unavailable",
            "dorik": "available",
            "leadpages": "limited"
          },
          "note": "Leadpages allows unlimited individual landing pages but is not built as a cohesive, navigable multi-page site."
        },
        {
          "feature": "Free published-site plan",
          "statuses": {
            "carrd": "available",
            "dorik": "available",
            "leadpages": "unavailable"
          }
        }
      ]
    },
    {
      "group": "Conversion and Testing Tools",
      "rows": [
        {
          "feature": "A/B split testing",
          "statuses": {
            "carrd": "unavailable",
            "dorik": "not-documented",
            "leadpages": "available"
          }
        },
        {
          "feature": "Click and scroll heatmaps",
          "statuses": {
            "carrd": "unavailable",
            "dorik": "not-documented",
            "leadpages": "available"
          }
        },
        {
          "feature": "Lead enrichment with firmographic data",
          "statuses": {
            "carrd": "unavailable",
            "dorik": "unavailable",
            "leadpages": "available"
          }
        }
      ]
    },
    {
      "group": "AI and Growth Tools",
      "rows": [
        {
          "feature": "AI page or content generation",
          "statuses": {
            "carrd": "unavailable",
            "dorik": "available",
            "leadpages": "available"
          }
        },
        {
          "feature": "AI-powered traffic personalization",
          "statuses": {
            "carrd": "unavailable",
            "dorik": "unavailable",
            "leadpages": "available"
          },
          "note": "Leadpages' Smart Traffic feature is available on its Optimize tier and above."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is cheapest for a single simple page?",
      "answer": "Carrd, with paid plans starting at just $9/year."
    },
    {
      "question": "Which is built specifically for marketing conversion optimization?",
      "answer": "Leadpages, with A/B testing, heatmaps and Smart Traffic AI routing baked into its hosting layer."
    },
    {
      "question": "Which supports a full multi-page site with a CMS?",
      "answer": "Dorik, which supports unlimited pages and blog posts on its higher tiers alongside a built-in CMS."
    },
    {
      "question": "Does any of these have a genuinely free plan?",
      "answer": "Carrd and Dorik both offer usable free tiers with a live published site. Leadpages only offers a free trial, not a permanent free plan."
    },
    {
      "question": "Which is best for agencies managing many client sites?",
      "answer": "Dorik, through its white-label dashboard and unlimited-site Agency plan."
    },
    {
      "question": "Which one automatically routes visitors to the best-converting page variant?",
      "answer": "Leadpages' Smart Traffic feature, available on its Optimize tier and above."
    }
  ]
};

export default carrdVsDorikVsLeadpagesContent;
