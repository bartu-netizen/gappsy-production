import type { ToolComparisonContent } from './types';

const artboardStudioVsKittlContent: ToolComparisonContent = {
  "verdict": "Artboard Studio and Kittl both use AI to speed up visual asset creation, but they serve different jobs: Artboard Studio is a focused mockup generator for devices, apparel, and packaging, while Kittl is a broader AI creative suite covering image, vector, and video generation for full branding projects. Neither is a straightforward replacement for the other since their core outputs differ.",
  "bestForToolA": "Users who specifically need product mockups (devices, apparel, packaging, print) generated from photos or AI prompts, plus direct Figma and Adobe Express plugin integration into an existing design workflow.",
  "bestForToolB": "Users building complete branding or merchandise projects who need AI image, vector, and video generation from multiple third-party AI models (ByteDance, Ideogram, Google, OpenAI, Black Forest Labs) in one editor with real-time collaboration.",
  "whoNeedsBoth": "A brand or e-commerce team might generate logos, vectors, and promotional video in Kittl, then apply the finished artwork to realistic product mockups in Artboard Studio for marketing and sales materials.",
  "keyDifferences": [
    {
      "title": "Core purpose",
      "toolA": "Artboard Studio's library of 5,000+ mockups covers devices, apparel, packaging, and print, applying user images or video to those surfaces.",
      "toolB": "Kittl generates original image, vector, and video content, plus background removal, upscaling, and raster-to-vector conversion.",
      "whyItMatters": "Mockup generation and original asset generation are different jobs; picking the wrong one means recreating an entire workflow elsewhere.",
      "benefitsWho": "Product marketers who just need mockups versus brand designers who need original artwork."
    },
    {
      "title": "AI credit model",
      "toolA": "Artboard Studio has an AI mockup generator, but no specific recurring credit figures are documented.",
      "toolB": "Kittl's free plan gives 200 one-time AI tokens, while Pro ($19/month) and Expert ($45/month) plans cap daily AI credits at 30 and 80 respectively.",
      "whyItMatters": "Recurring daily AI credit caps affect how much AI generation a team can do before hitting a limit each month.",
      "benefitsWho": "Heavy AI-generation users who need to estimate monthly output capacity."
    },
    {
      "title": "Plugin integrations",
      "toolA": "Artboard Studio documents direct Figma and Adobe Express plugins.",
      "toolB": "Not documented for Kittl.",
      "whyItMatters": "Native plugins reduce export/import friction for teams already working in Figma or Adobe tools.",
      "benefitsWho": "Design teams with an established Figma-based workflow."
    },
    {
      "title": "Named AI model providers",
      "toolA": "Not documented for Artboard Studio.",
      "toolB": "Kittl integrates AI models from ByteDance, Ideogram, Google, OpenAI, and Black Forest Labs.",
      "whyItMatters": "Knowing which underlying AI models power a tool can matter for output style and quality expectations.",
      "benefitsWho": "Users who have preferences among specific AI image/video models."
    },
    {
      "title": "Pricing structure and one-time options",
      "toolA": "Artboard Studio offers a $129 one-time Lifetime Mockup plan in addition to $9/month Lite and $19/month Pro tiers.",
      "toolB": "Kittl's paid plans are $19/month Pro (or $14/month billed annually) and $45/month Expert, with no lifetime option documented.",
      "whyItMatters": "A one-time lifetime payment option changes the total cost of ownership calculation for long-term users.",
      "benefitsWho": "Freelancers or small studios wanting to avoid ongoing subscription costs."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Generation Features",
      "rows": [
        {
          "feature": "Mockup library",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Artboard Studio: 5,000+ mockups"
        },
        {
          "feature": "AI image generation",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "AI vector generation",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "AI video generation",
          "toolA": "available",
          "toolB": "available",
          "note": "Artboard Studio: video mockups; Kittl: AI video generation"
        }
      ]
    },
    {
      "group": "Editing Tools",
      "rows": [
        {
          "feature": "Background removal / upscaling",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Vectorization (raster-to-vector)",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Real-time collaboration",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Integrations & Export",
      "rows": [
        {
          "feature": "Figma plugin",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Adobe Express plugin",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Video file export",
          "toolA": "available",
          "toolB": "available",
          "note": "Artboard Studio: MP4/WEBM"
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Entry-level paid plan",
          "toolA": "available",
          "toolB": "available",
          "note": "Artboard Studio Lite $9/mo; Kittl Pro $19/mo (or $14/mo annual)"
        },
        {
          "feature": "One-time lifetime plan",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Artboard Studio: $129 one-time"
        },
        {
          "feature": "Daily/recurring AI credit caps",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Kittl: 30/day Pro, 80/day Expert"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "What's the main difference between Artboard Studio and Kittl?",
      "answer": "Artboard Studio focuses on generating product mockups (devices, apparel, packaging) from your own images; Kittl is a broader AI suite for generating original image, vector, and video content."
    },
    {
      "question": "Does either tool offer a one-time payment option?",
      "answer": "Yes, Artboard Studio offers a $129 one-time Lifetime Mockup plan. No equivalent lifetime option is documented for Kittl."
    },
    {
      "question": "How do AI credits work on Kittl?",
      "answer": "Kittl's free plan gives 200 one-time AI tokens; paid plans switch to daily recurring credits — 30/day on Pro and 80/day on Expert."
    },
    {
      "question": "Can I use these tools with Figma?",
      "answer": "Artboard Studio has a direct Figma plugin. No Figma integration is documented for Kittl."
    },
    {
      "question": "Which AI models power Kittl's generation tools?",
      "answer": "Kittl integrates models from ByteDance, Ideogram, Google, OpenAI, and Black Forest Labs."
    }
  ]
};

export default artboardStudioVsKittlContent;
