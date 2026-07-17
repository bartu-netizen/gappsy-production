import type { ToolComparisonContent } from './types';

const jenniAiVsWordheroContent: ToolComparisonContent = {
  "verdict": "Jenni AI and WordHero both use AI to speed up writing, but they serve different audiences: Jenni is built for academic and research writing with traceable citations, while WordHero targets SEO blog and marketing content at scale, in 108 languages, with built-in AI image generation.",
  "bestForToolA": "Students, researchers, and academics who need AI-assisted drafting that cites uploaded sources and imports reference libraries from Zotero or Mendeley.",
  "bestForToolB": "Content marketers and agencies producing SEO blog posts and campaign copy who want one-click blog generation, brand voice controls, and content in 108 languages.",
  "whoNeedsBoth": "A content team that publishes both original research or reports (Jenni, for citation-backed writing) and broader SEO or marketing content (WordHero) may keep both tools for their distinct workflows.",
  "keyDifferences": [
    {
      "title": "Citation & Source Tracing",
      "toolA": "Every AI-generated claim links back to the exact page and paragraph in the source PDF, and the Reviews feature flags unverified or contradicted claims.",
      "toolB": "No citation or source-tracing feature is documented; instead it offers a built-in SEO keyword assistant aimed at ranking generated content.",
      "whyItMatters": "Academic and research writing requires verifiable sourcing, while SEO content prioritizes keyword targeting over citations.",
      "benefitsWho": "Students, researchers, and anyone whose writing must be fact-checked against sources."
    },
    {
      "title": "Free Access",
      "toolA": "Offers a free plan (10 AI autocompletes/day, 10 PDF uploads, limited edits, chat, and reviews) with no credit card required.",
      "toolB": "No free plan; only a 14-day money-back guarantee is offered on paid plans.",
      "whyItMatters": "Users who want to test the product without paying can only do so with Jenni AI.",
      "benefitsWho": "Budget-conscious individual writers and students trying the tool before committing."
    },
    {
      "title": "Language Coverage",
      "toolA": "No non-English writing support is stated on the site.",
      "toolB": "Generates written content in 108 languages.",
      "whyItMatters": "Teams producing content for international or multilingual markets need broad language support.",
      "benefitsWho": "Global marketing teams and agencies serving non-English-speaking audiences."
    },
    {
      "title": "Media Generation",
      "toolA": "No image generation feature is mentioned; the product is focused purely on text and citations.",
      "toolB": "Includes WordHero Art, which generates AI images to accompany written content.",
      "whyItMatters": "Content that needs accompanying visuals, like blog headers or social images, benefits from an integrated image tool.",
      "benefitsWho": "Marketers and bloggers who want to skip a separate design tool."
    },
    {
      "title": "Reference Library Integration",
      "toolA": "Imports existing libraries from Zotero or Mendeley, or searches over 200 million papers directly in the app.",
      "toolB": "No reference-library import feature is documented.",
      "whyItMatters": "Researchers with existing citation libraries need direct import rather than manual re-entry.",
      "benefitsWho": "Academic writers already using Zotero or Mendeley workflows."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Writing Features",
      "rows": [
        {
          "feature": "AI autocomplete / writing assistant",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Citation / source tracing",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "SEO keyword tools",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Real-time collaboration",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "AI image generation",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "WordHero Art"
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Free plan",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Entry-level paid plan",
          "toolA": "available",
          "toolB": "available",
          "note": "Jenni Plus $12/mo; WordHero Creator $49/mo ($29/mo billed annually)"
        },
        {
          "feature": "Money-back guarantee",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "14-day money-back guarantee"
        },
        {
          "feature": "Team / enterprise plan",
          "toolA": "unavailable",
          "toolB": "unavailable"
        }
      ]
    },
    {
      "group": "Language & Research Tools",
      "rows": [
        {
          "feature": "Multi-language content generation",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "108 languages"
        },
        {
          "feature": "Reference library import (Zotero/Mendeley)",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Citation style formatting",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Jenni supports 10,000+ styles including APA, Chicago, Harvard"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Jenni AI or WordHero offer a free plan?",
      "answer": "Jenni AI has a free tier (10 AI autocompletes/day, 10 PDF uploads, limited edits, chat, and reviews). WordHero has no free plan, only a 14-day money-back guarantee on paid plans."
    },
    {
      "question": "Which tool is better for academic writing with citations?",
      "answer": "Jenni AI is built specifically for this: it links every AI-generated claim to a source page and paragraph and supports 10,000+ citation styles, while WordHero has no citation feature."
    },
    {
      "question": "Which tool supports more languages?",
      "answer": "WordHero generates content in 108 languages; Jenni AI's site does not state support for non-English writing."
    },
    {
      "question": "Can either tool generate images?",
      "answer": "WordHero includes WordHero Art for AI image generation. Jenni AI does not mention an image generation feature."
    },
    {
      "question": "How much do Jenni AI and WordHero cost to start?",
      "answer": "Jenni AI's paid tiers start at $12/month (Plus), with a $29/month Pro plan for unlimited use. WordHero starts at $49/month (Creator), or $29/month billed annually."
    }
  ]
};

export default jenniAiVsWordheroContent;
