import type { GroupComparisonContent } from './types';

const adobeFireflyVsClipdropVsLeonardoAiContent: GroupComparisonContent = {
  "verdict": "All three generate AI images, but they specialize differently. Adobe Firefly is the deepest choice for teams already living inside Creative Cloud who want generative fill, text effects, and even AI video without leaving Photoshop or Illustrator. Clipdrop is the leanest, most utility-focused option, built around fast single-purpose edits like background removal, relighting, and upscaling rather than an end-to-end creative platform. Leonardo AI is the strongest pick for teams that need fine-tunable, consistent, on-brand or on-character output at volume, thanks to its custom LoRA training and Consistent Character Engine. Workflow fit and budget, not raw image quality alone, should drive the choice.",
  "bestFor": {
    "adobe-firefly": "Creative Cloud users and marketing or design teams who want generative image, text-effect, and video tools built directly into Photoshop, Illustrator, and Express with Adobe's commercial-safe training claims.",
    "clipdrop": "Users who need fast, focused photo edits such as background removal, relighting, cleanup, and upscaling via web, mobile, a Photoshop plugin, or a cheap metered API, without needing a full creative suite.",
    "leonardo-ai": "Game studios, brand teams, and creators who need consistent characters or custom-trained, on-style image generation at scale via LoRA training and a real-time editing canvas."
  },
  "highlights": [
    {
      "title": "Clipdrop's Relight feature is a distinctive capability the other two don't document",
      "description": "Clipdrop lets users add, move, and adjust virtual light sources on a portrait or product photo after it was taken, a feature not documented for Adobe Firefly or Leonardo AI.",
      "toolSlugs": [
        "clipdrop"
      ]
    },
    {
      "title": "Leonardo AI is the only one with consistent-character and custom model training",
      "description": "Leonardo AI's Consistent Character Engine and custom LoRA model training let users generate on-brand or on-character output repeatedly, capabilities not documented for Adobe Firefly or Clipdrop.",
      "toolSlugs": [
        "leonardo-ai"
      ]
    },
    {
      "title": "Adobe Firefly is the only one natively built into a major creative suite, with video generation",
      "description": "Firefly powers generative features directly inside Photoshop and Illustrator and also supports generative video output, unlike Clipdrop or Leonardo AI, whose documented capabilities are image-focused.",
      "toolSlugs": [
        "adobe-firefly"
      ]
    },
    {
      "title": "All three have been absorbed into a larger parent company",
      "description": "Firefly is Adobe's own product, Clipdrop moved from Stability AI to Jasper in 2024, and Leonardo AI was acquired by Canva in 2024, so all three now operate with the backing and distribution of a larger business.",
      "toolSlugs": [
        "adobe-firefly",
        "clipdrop",
        "leonardo-ai"
      ]
    },
    {
      "title": "Leonardo AI's game-asset roots give it a niche strength",
      "description": "Leonardo AI documents 3D texture generation originally built for video game art production, a use case not documented for Adobe Firefly or Clipdrop.",
      "toolSlugs": [
        "leonardo-ai"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Generation Capabilities",
      "rows": [
        {
          "feature": "Text-to-image generation",
          "statuses": {
            "adobe-firefly": "available",
            "clipdrop": "available",
            "leonardo-ai": "available"
          }
        },
        {
          "feature": "Video generation",
          "statuses": {
            "adobe-firefly": "available",
            "clipdrop": "not-documented",
            "leonardo-ai": "not-documented"
          }
        },
        {
          "feature": "Background removal and object cleanup",
          "statuses": {
            "adobe-firefly": "not-documented",
            "clipdrop": "available",
            "leonardo-ai": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Editing and Customization",
      "rows": [
        {
          "feature": "Generative fill, expand, or canvas-based editing",
          "statuses": {
            "adobe-firefly": "available",
            "clipdrop": "available",
            "leonardo-ai": "available"
          },
          "note": "Firefly offers Generative Fill and Expand, Clipdrop offers Uncrop, and Leonardo AI offers a real-time AI Canvas for inpainting and outpainting."
        },
        {
          "feature": "Custom or fine-tuned model training",
          "statuses": {
            "adobe-firefly": "not-documented",
            "clipdrop": "not-documented",
            "leonardo-ai": "available"
          },
          "note": "Leonardo AI supports training custom LoRA models on a user's own reference images."
        },
        {
          "feature": "Consistent character generation across images",
          "statuses": {
            "adobe-firefly": "not-documented",
            "clipdrop": "not-documented",
            "leonardo-ai": "available"
          }
        }
      ]
    },
    {
      "group": "Access and Pricing",
      "rows": [
        {
          "feature": "Free tier available",
          "statuses": {
            "adobe-firefly": "available",
            "clipdrop": "available",
            "leonardo-ai": "available"
          }
        },
        {
          "feature": "Developer API",
          "statuses": {
            "adobe-firefly": "not-documented",
            "clipdrop": "available",
            "leonardo-ai": "available"
          },
          "note": "Clipdrop's API is usage-based per call; Leonardo AI's API access is gated behind the Artisan tier or higher."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three can generate video, not just images?",
      "answer": "Only Adobe Firefly documents generative video output, including via third-party models like Google's Veo. Clipdrop's and Leonardo AI's documented capabilities are image-focused."
    },
    {
      "question": "Which is best for consistent characters across multiple images?",
      "answer": "Leonardo AI's Consistent Character Engine is purpose-built for this. Adobe Firefly and Clipdrop don't document an equivalent feature."
    },
    {
      "question": "Can I remove backgrounds or relight a photo with any of these?",
      "answer": "Clipdrop is the one built specifically for this, with dedicated Background Removal and Relight tools. Adobe Firefly's and Leonardo AI's documented feature sets don't include a comparable relighting tool."
    },
    {
      "question": "Which offers a developer API?",
      "answer": "Both Clipdrop and Leonardo AI document metered or paid API access, Clipdrop's is usage-based per call and Leonardo AI's is gated behind the Artisan tier or higher. Adobe Firefly's provided data doesn't document a standalone developer API."
    },
    {
      "question": "Do all three have a free plan?",
      "answer": "Yes. Adobe Firefly offers limited monthly credits for free, Clipdrop offers about 15 watermarked images per month for free, and Leonardo AI offers 150 tokens per day for free."
    },
    {
      "question": "Are any of these independent companies, or are they owned by a larger business?",
      "answer": "All three are now owned by larger companies: Adobe Firefly is native to Adobe, Clipdrop is owned by Jasper after previously being owned by Stability AI, and Leonardo AI is owned by Canva."
    }
  ]
};

export default adobeFireflyVsClipdropVsLeonardoAiContent;
