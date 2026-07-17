import type { ToolComparisonContent } from './types';

const hypotenuseAiVsTypefaceContent: ToolComparisonContent = {
  "verdict": "Hypotenuse AI and Typeface are both enterprise-oriented AI content platforms with custom pricing, but they serve different content domains: Hypotenuse AI focuses on ecommerce product data and imagery at the catalog level, while Typeface orchestrates broader brand marketing campaigns across channels.",
  "bestForToolA": "Ecommerce and retail teams that need to enrich, describe, tag, and photograph large product catalogs, especially those already selling on Amazon, Walmart, Target, Shopify, or NetSuite.",
  "bestForToolB": "Enterprise marketing teams that need brand-grounded campaign content across planning, creation, approval, and publishing stages, with the option to build custom agents via Arc Forge.",
  "whoNeedsBoth": "A retail enterprise that manages product catalogs with Hypotenuse AI while also running brand marketing campaigns across channels with Typeface could use both for their distinct content domains.",
  "keyDifferences": [
    {
      "title": "Primary Content Domain",
      "toolA": "Focuses specifically on ecommerce product data: enrichment, descriptions, imagery, and marketplace listings.",
      "toolB": "Focuses on brand marketing campaign content and orchestration across channels via Arc Agents.",
      "whyItMatters": "Ecommerce catalog management is a different job than brand campaign orchestration, even though both use AI agents and content generation.",
      "benefitsWho": "Ecommerce and retail teams managing product catalogs (Hypotenuse AI) versus enterprise marketing teams running brand campaigns (Typeface)."
    },
    {
      "title": "Free Trial Availability",
      "toolA": "Offers a free trial with no credit card required.",
      "toolB": "No free plan or free trial is documented; requires direct sales contact.",
      "whyItMatters": "The ability to test the product before a sales conversation differs.",
      "benefitsWho": "Smaller merchants or teams wanting to self-evaluate before engaging sales."
    },
    {
      "title": "Marketplace & Platform Integrations",
      "toolA": "Integrates with named marketplaces (Amazon, Walmart, Target) and PIM/commerce platforms (Shopify, Salsify, NetSuite, Akeneo, BigCommerce, WooCommerce).",
      "toolB": "Integration approach is via Arc Forge's MCP/API support for building custom agents, without naming specific commerce marketplaces.",
      "whyItMatters": "Direct, named integrations reduce implementation work compared to building custom connections.",
      "benefitsWho": "Ecommerce teams already on specific marketplaces or PIM systems (Hypotenuse AI); technical teams building custom workflows (Typeface via Arc Forge)."
    },
    {
      "title": "Image & Photography Capabilities",
      "toolA": "Includes AI Image Enhancement and AI Product Photography to generate and standardize product imagery.",
      "toolB": "Documented features focus on text and campaign content grounded in brand guidelines (Arc Graph) rather than product photography.",
      "whyItMatters": "Visual asset generation matters specifically for ecommerce product listings.",
      "benefitsWho": "Ecommerce merchandisers needing product photos without a physical photoshoot."
    },
    {
      "title": "Disclosed Customer Base",
      "toolA": "States a claimed user count (500,000+) and Y Combinator backing rather than named enterprise logos.",
      "toolB": "Names specific enterprise customers: Asics, Johnson Controls, Medibank, and Sally Beauty.",
      "whyItMatters": "Named enterprise references versus aggregate user counts offer different kinds of social proof for buyers.",
      "benefitsWho": "Enterprise buyers who want to see comparable named customers."
    }
  ],
  "featureMatrix": [
    {
      "group": "Content & Data Capabilities",
      "rows": [
        {
          "feature": "Product data enrichment",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Brand guideline grounding",
          "toolA": "available",
          "toolB": "available",
          "note": "Hypotenuse: Brand Voice Enforcement; Typeface: Arc Graph"
        },
        {
          "feature": "AI image/photography generation",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Multi-channel campaign orchestration",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Arc Agents"
        },
        {
          "feature": "Approval/publishing workflows",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Arc Spaces"
        }
      ]
    },
    {
      "group": "Integrations",
      "rows": [
        {
          "feature": "Marketplace integrations (Amazon/Walmart/Target)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "PIM/commerce platform integrations",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Hypotenuse: Shopify, Salsify, NetSuite, Akeneo, BigCommerce, WooCommerce"
        },
        {
          "feature": "Custom agent building via API/MCP",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Arc Forge"
        },
        {
          "feature": "Multi-language support",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "40+ languages"
        }
      ]
    },
    {
      "group": "Pricing, Trust & Compliance",
      "rows": [
        {
          "feature": "Free trial",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "No credit card required"
        },
        {
          "feature": "Public pricing",
          "toolA": "unavailable",
          "toolB": "unavailable"
        },
        {
          "feature": "SOC 2 compliance",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Named enterprise customers disclosed",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Asics, Johnson Controls, Medibank, Sally Beauty"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Hypotenuse AI or Typeface publish pricing?",
      "answer": "Neither publishes public pricing. Both Hypotenuse AI's Basic and Ecommerce Enterprise plans, and Typeface's platform, require contacting sales for a custom quote."
    },
    {
      "question": "Which tool is better for ecommerce product catalogs?",
      "answer": "Hypotenuse AI is purpose-built for this, with product data enrichment, AI product descriptions, image enhancement, and integrations with marketplaces like Amazon, Walmart, and Target, plus platforms like Shopify and NetSuite."
    },
    {
      "question": "Which tool is used by large enterprises?",
      "answer": "Typeface names enterprise customers including Asics, Johnson Controls, Medibank, and Sally Beauty. Hypotenuse AI is Y Combinator-backed with a claimed 500,000+ users, though it doesn't name specific enterprise customers."
    },
    {
      "question": "Can either tool generate product images?",
      "answer": "Yes, Hypotenuse AI's AI Image Enhancement and AI Product Photography features can standardize, edit, and generate product imagery. Typeface's documented features focus on brand-grounded text and campaign content rather than product photography."
    },
    {
      "question": "Is there a free trial for either tool?",
      "answer": "Hypotenuse AI offers a free trial with no credit card required. Typeface does not mention a free plan or free trial."
    },
    {
      "question": "What is Arc Forge?",
      "answer": "Arc Forge converts marketing workflows into custom agents with MCP, API, and integration support."
    }
  ]
};

export default hypotenuseAiVsTypefaceContent;
