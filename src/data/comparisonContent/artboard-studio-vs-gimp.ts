import type { ToolComparisonContent } from './types';

const artboardStudioVsGimpContent: ToolComparisonContent = {
  "verdict": "Artboard Studio is a focused, browser-based mockup generator for turning product images or videos into realistic device, apparel, and packaging presentations, while GIMP is a general-purpose, free raster image editor for photo retouching, illustration, and graphic design from scratch. Artboard Studio automates a narrow, repetitive task with templates; GIMP is an open canvas requiring manual editing skill and offers no dedicated mockup library.",
  "bestForToolA": "Artboard Studio fits marketers, product designers, and e-commerce sellers who need to quickly place a screenshot or product photo into one of 5,000+ realistic mockups (devices, apparel, packaging) without manual compositing, including an AI mockup generator that turns a text prompt into a ready mockup.",
  "bestForToolB": "GIMP fits users who need full manual control over an image, photo retouching, original artwork, or graphic design elements, and want a free, extensible tool with Python/Scheme/C/C++ scripting, without paying for a subscription.",
  "whoNeedsBoth": "A designer could edit and retouch a product photo in GIMP first, then bring the finished image into Artboard Studio to drop it into a realistic device or packaging mockup for a marketing page - the two tools cover sequential steps (image editing, then mockup presentation) rather than overlapping functions.",
  "keyDifferences": [
    {
      "title": "Core Purpose",
      "toolA": "Artboard Studio is purpose-built for generating mockups: applying an image or video onto device, apparel, or packaging templates from a library of 5,000+ options.",
      "toolB": "GIMP is a general raster image editor for photo manipulation, original artwork, and graphic design elements, with no dedicated mockup templates.",
      "whyItMatters": "A narrow tool like Artboard Studio gets a specific output faster, while GIMP requires manual setup to achieve a similar mockup effect.",
      "benefitsWho": "Marketers and e-commerce teams needing fast mockups benefit from Artboard Studio; designers doing bespoke image editing benefit from GIMP's flexibility."
    },
    {
      "title": "Pricing",
      "toolA": "Artboard Studio is freemium, with paid tiers starting at $9/month (Lite, annual billing) and a $129 one-time Lifetime Mockup plan; unlimited exports require the $19/month Pro plan.",
      "toolB": "GIMP is completely free with no paid tier at all.",
      "whyItMatters": "Budget-constrained users get zero-cost access to GIMP's full feature set, while Artboard Studio's export limits push users toward a paid plan.",
      "benefitsWho": "Freelancers or hobbyists on a strict budget benefit from GIMP's zero cost; teams needing unlimited mockup exports may accept Artboard Studio's Pro price."
    },
    {
      "title": "AI Generation",
      "toolA": "Artboard Studio includes an AI mockup generator that turns a text prompt into a ready-to-use mockup.",
      "toolB": "GIMP's documented features don't include a text-to-image or AI mockup generation capability.",
      "whyItMatters": "AI generation can speed up producing a first draft mockup without sourcing a template manually.",
      "benefitsWho": "Users wanting a fast, prompt-driven starting point benefit from Artboard Studio's AI tools."
    },
    {
      "title": "Extensibility & Scripting",
      "toolA": "Artboard Studio's documented extensibility is limited to Figma and Adobe Express plugin integrations for bringing designs in and out.",
      "toolB": "GIMP is extensible via C, C++, Python, and Scheme scripting, enabling custom automation of image manipulation tasks.",
      "whyItMatters": "Deep scripting support lets technical users automate repetitive editing tasks at scale in ways a template-based tool doesn't support.",
      "benefitsWho": "Developers and power users who want to script batch image processing benefit from GIMP."
    },
    {
      "title": "Platform Availability",
      "toolA": "Artboard Studio is browser-based with no installation required; the available facts note no dedicated mobile or desktop app.",
      "toolB": "GIMP is a native desktop application available on Linux, macOS, and Windows, with active development (version 3.2.4 released April 2026) but no official mobile app.",
      "whyItMatters": "A browser-only tool is easier to access from any device without installation, while a native desktop app can offer deeper OS-level integration and offline use.",
      "benefitsWho": "Users who move between computers benefit from Artboard Studio's browser access; users wanting a robust offline desktop editor benefit from GIMP."
    }
  ],
  "featureMatrix": [
    {
      "group": "Design & Editing Capabilities",
      "rows": [
        {
          "feature": "Mockup template library",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "5,000+ mockups on Artboard Studio"
        },
        {
          "feature": "Photo retouching/manipulation",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Original artwork creation",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Video mockup support",
          "toolA": "available",
          "toolB": "unavailable"
        }
      ]
    },
    {
      "group": "AI & Automation",
      "rows": [
        {
          "feature": "AI-generated mockups from text prompt",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Scripting/automation",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Python, Scheme, C/C++"
        },
        {
          "feature": "Figma plugin",
          "toolA": "available",
          "toolB": "unavailable"
        }
      ]
    },
    {
      "group": "Access & Pricing",
      "rows": [
        {
          "feature": "Free tier/full free use",
          "toolA": "limited",
          "toolB": "available",
          "note": "Artboard Studio exports limited until Pro plan; GIMP entirely free"
        },
        {
          "feature": "Browser-based access",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Desktop app",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Linux, macOS, Windows"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Can GIMP create product mockups like Artboard Studio?",
      "answer": "GIMP doesn't include a dedicated mockup template library or AI mockup generator the way Artboard Studio does; producing a similar mockup in GIMP would require manually compositing images, which is more time-consuming."
    },
    {
      "question": "Is Artboard Studio free?",
      "answer": "Artboard Studio offers a freemium plan; paid tiers start at $9/month (Lite, billed annually), with unlimited exports requiring the $19/month Pro plan, and a $129 one-time Lifetime Mockup option."
    },
    {
      "question": "Is GIMP really free with no hidden costs?",
      "answer": "Yes, GIMP is completely free and open source under the GPLv3 license, with no paid tier documented."
    },
    {
      "question": "Does Artboard Studio integrate with design tools?",
      "answer": "Yes, it has both a Figma plugin and an Adobe Express plugin for bringing mockup work into existing design workflows."
    },
    {
      "question": "Which tool is better for editing a photo before making a mockup?",
      "answer": "GIMP is built for photo manipulation and retouching, while Artboard Studio is built for placing a finished image onto a mockup template - many workflows would use GIMP to edit the source image first, then Artboard Studio to present it."
    },
    {
      "question": "Does Artboard Studio support video, not just static mockups?",
      "answer": "Yes, it supports applying videos to mockup surfaces and exporting as MP4 or WEBM files, in addition to PNG, JPEG, and WEBP image exports."
    }
  ]
};

export default artboardStudioVsGimpContent;
