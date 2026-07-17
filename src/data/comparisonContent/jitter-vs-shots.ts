import type { ToolComparisonContent } from './types';

const jitterVsShotsContent: ToolComparisonContent = {
  "verdict": "Jitter and Shots both help creative teams turn static assets into more dynamic content, but they serve different steps in that process. Jitter is a motion design tool for building original animations — with AI animation generation, image-to-video, a pen tool, and batch export to video, GIF, and Lottie — backed by 400+ templates and 1,500+ fonts. Shots instead focuses on presenting existing static designs, dropping them into a free device mockup library (iPhone, Android, iPad, desktop) with animated presets, Magic Backgrounds, and custom watermarking. Neither publishes full pricing for its higher tiers, so the decision mostly comes down to whether the need is creating original motion graphics or presenting finished designs in device mockups.",
  "bestForToolA": "Teams that need to design original animated graphics — social posts, product demos, or Lottie animations — and want AI-assisted generation, a pen tool for custom shapes, and batch export across formats.",
  "bestForToolB": "Designers who need to quickly present static screenshots or mockups in realistic device frames with animated zoom effects and auto-generated backgrounds, without building animation from scratch.",
  "whoNeedsBoth": "A product marketing team might design an app's motion graphics and social animations in Jitter, then use Shots to package static screenshots of the same product into device mockups for a landing page or app store listing.",
  "keyDifferences": [
    {
      "title": "Core purpose",
      "toolA": "A motion design tool for creating original animations from scratch or via AI, with a pen tool, gradients, and blend modes.",
      "toolB": "A device mockup and presentation tool that turns existing static designs into animated mockups and short videos.",
      "whyItMatters": "One tool builds motion graphics; the other packages finished designs for presentation — they solve adjacent but different problems.",
      "benefitsWho": "Motion designers need Jitter's creation tools; product/marketing teams presenting screenshots need Shots' mockup library."
    },
    {
      "title": "AI-assisted generation",
      "toolA": "Includes AI animation generation from text prompts and AI image-to-video conversion.",
      "toolB": "Not documented as a feature.",
      "whyItMatters": "Teams wanting to generate animation content quickly from prompts need Jitter's AI tooling.",
      "benefitsWho": "Small teams without dedicated motion designers who want to generate animations faster."
    },
    {
      "title": "Export formats and batch capability",
      "toolA": "Batch exports to video, GIF, and Lottie formats.",
      "toolB": "Exports with social media frame presets and shareable links; Lottie and batch export aren't documented.",
      "whyItMatters": "Teams that need Lottie files for app or web use, or bulk export of many variants, need Jitter's export pipeline.",
      "benefitsWho": "Developers and designers embedding lightweight vector animations in products."
    },
    {
      "title": "Template and asset library scale",
      "toolA": "Documents 400+ templates and 1,500+ free fonts.",
      "toolB": "Offers a free device mockup library covering iPhone, Android, iPad, and desktop, without a quantified template count.",
      "whyItMatters": "Teams wanting a large starting library of animation templates should weigh Jitter's documented scale.",
      "benefitsWho": "Teams producing high volumes of branded animated content."
    },
    {
      "title": "Pricing transparency",
      "toolA": "Publishes free-tier limits and paid tier names (Pro, Max, Ultra, Enterprise), but not their exact prices without creating an account.",
      "toolB": "Does not publish any pricing plan details for premium features.",
      "whyItMatters": "Buyers comparing cost upfront have more information from Jitter than from Shots.",
      "benefitsWho": "Budget-conscious buyers evaluating cost before signing up."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Capabilities",
      "rows": [
        {
          "feature": "AI-assisted animation/content generation",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Freeform vector drawing tools (pen tool/morphing)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Device mockup library",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Magic Backgrounds (auto-generated background variations)",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Export & Output",
      "rows": [
        {
          "feature": "Batch export",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Lottie export",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Social media frame export presets",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Custom watermarking",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Free plan",
          "toolA": "available",
          "toolB": "available",
          "note": "Jitter's free plan caps at 3 workspace files and 720p/30fps export; Shots' free tier is its mockup library."
        },
        {
          "feature": "Published paid-tier pricing",
          "toolA": "limited",
          "toolB": "not-documented",
          "note": "Jitter names Pro/Max/Ultra tiers but doesn't publish prices without an account; Shots doesn't publish premium pricing at all."
        },
        {
          "feature": "Enterprise / custom tier",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "What's the core difference between Jitter and Shots?",
      "answer": "Jitter is a motion design tool for creating original animations (with AI generation, a pen tool, and batch export to video, GIF, and Lottie); Shots turns static designs into device mockups and animated presentations using a mockup library and effects."
    },
    {
      "question": "Does either use AI?",
      "answer": "Jitter documents AI animation generation from text prompts and AI image-to-video conversion; no AI feature is documented for Shots."
    },
    {
      "question": "Can I export to Lottie format?",
      "answer": "Jitter supports batch export to video, GIF, and Lottie; this isn't documented for Shots."
    },
    {
      "question": "Are pricing details published for both?",
      "answer": "Jitter publishes free-tier limits and paid tier names (Pro, Max, Ultra, Enterprise) but not their exact prices, which require an account to view. Shots doesn't publish any premium pricing details."
    },
    {
      "question": "Does Shots offer device mockups?",
      "answer": "Yes, its free mockup library includes iPhone, Android, iPad, and desktop templates; this isn't a feature of Jitter."
    },
    {
      "question": "Can I add a watermark to protect my designs?",
      "answer": "Shots includes custom watermarking as a feature; this isn't documented for Jitter."
    }
  ]
};

export default jitterVsShotsContent;
