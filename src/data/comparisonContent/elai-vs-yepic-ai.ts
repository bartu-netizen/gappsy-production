import type { ToolComparisonContent } from './types';

const elaiVsYepicAiContent: ToolComparisonContent = {
  "verdict": "Elai and Yepic AI both create AI avatar videos, but they emphasize different workflows: Elai is built around converting existing content — slide decks, articles, scripts — into presenter-led videos with a large avatar/language library, while Yepic AI leads with real-time, emotion-aware conversational avatar agents alongside standard video generation. The fit depends on whether the priority is content repurposing or live interactivity.",
  "bestForToolA": "Teams that want to turn existing PowerPoint decks or articles into narrated videos, need an ongoing (not one-time) free tier to test the platform, and want a wide avatar/language library (80+ avatars, 75+ languages).",
  "bestForToolB": "Teams building real-time, emotion-aware conversational avatar experiences for interactive customer engagement, needing 120+ language coverage and API access for custom integration.",
  "whoNeedsBoth": "A company producing training content from existing slide decks could use Elai for that library while deploying Yepic AI's real-time video agents for interactive, customer-facing conversations.",
  "keyDifferences": [
    {
      "title": "Content-conversion vs. real-time interactivity",
      "toolA": "Converts PowerPoint presentations and blog/article URLs directly into narrated avatar videos, plus multi-avatar 'avatar dialogs' for training scenarios.",
      "toolB": "Leads with real-time, LLM-powered conversational Video Agents that track facial expressions and adjust responses via Emotion Recognition.",
      "whyItMatters": "Teams repurposing existing written/slide content need conversion workflows; teams building interactive experiences need real-time conversational capability.",
      "benefitsWho": "Training and marketing teams reusing existing decks/articles benefit from Elai; product/CX teams building interactive avatar experiences benefit from Yepic AI."
    },
    {
      "title": "Free tier structure",
      "toolA": "Ongoing free plan (recurring monthly) allowing 1 minute of video with access to the avatar/language library.",
      "toolB": "Free Starter tier grants only 10 one-time credits rather than a recurring monthly allotment.",
      "whyItMatters": "A recurring free tier lets light users keep using the tool indefinitely, while one-time credits are only useful for an initial test.",
      "benefitsWho": "Users wanting ongoing free access benefit from Elai's recurring free plan."
    },
    {
      "title": "Language and accent coverage",
      "toolA": "75+ languages and 450+ accents for narration, with voice cloning across 28 languages.",
      "toolB": "120+ languages and dialects supported for avatars and dubbing.",
      "whyItMatters": "Global localization needs vary — Yepic AI's broader documented language count may matter more for very wide multilingual deployment.",
      "benefitsWho": "Global marketing/localization teams needing the widest language coverage benefit from Yepic AI's 120+ languages."
    },
    {
      "title": "Headquarters location",
      "toolA": "Based in Pittsburgh, Pennsylvania, USA.",
      "toolB": "Based in London, UK.",
      "whyItMatters": "Buyers with data residency, support-hours, or vendor-jurisdiction preferences may factor in headquarters location.",
      "benefitsWho": "Buyers with a preference for US- or UK-based vendors can use this to narrow their choice."
    },
    {
      "title": "API access and watermark-free output pricing gate",
      "toolA": "API access is listed as a general feature without a stated plan restriction.",
      "toolB": "API access and watermark-free output require at least the $79/month Creator plan; the entry $20/month Basic plan is watermarked.",
      "whyItMatters": "Knowing which tier unlocks API/watermark removal affects the real cost of a production-ready deployment.",
      "benefitsWho": "Developers integrating via API on a budget should note Yepic AI requires its second-tier plan, while Elai does not document an equivalent gate."
    }
  ],
  "featureMatrix": [
    {
      "group": "Video Creation",
      "rows": [
        {
          "feature": "PPTX-to-video / article-to-video",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Multi-avatar dialog scenarios",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Real-time conversational video agents",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Emotion recognition",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Talking photo animation",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Localization",
      "rows": [
        {
          "feature": "Languages supported",
          "toolA": "available",
          "toolB": "available",
          "note": "Elai: 75+ languages/450+ accents; Yepic AI: 120+ languages"
        },
        {
          "feature": "Voice cloning",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Elai supports voice cloning across 28 languages"
        },
        {
          "feature": "Video dubbing/translation",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Pricing & Access",
      "rows": [
        {
          "feature": "Recurring free plan",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Yepic AI's free tier is 10 one-time credits, not a recurring allowance"
        },
        {
          "feature": "API access",
          "toolA": "available",
          "toolB": "limited",
          "note": "Yepic AI requires the $79/month Creator plan or above"
        },
        {
          "feature": "Watermark-free output on entry paid plan",
          "toolA": "not-documented",
          "toolB": "unavailable",
          "note": "Yepic AI's $20/month Basic plan is watermarked"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is there a free plan for Elai and Yepic AI?",
      "answer": "Elai's Free plan allows creating 1 minute of video per month on an ongoing basis. Yepic AI's free Starter tier instead grants 10 one-time credits rather than a recurring allowance."
    },
    {
      "question": "Does Yepic AI support real-time conversations?",
      "answer": "Yes, its Video Agents use LLMs, including GPT-3.5, 4, and 4o, for real-time conversational avatars."
    },
    {
      "question": "How many languages does each platform support?",
      "answer": "Elai supports 75+ languages and 450+ accents; Yepic AI supports over 120 languages and various dialects."
    },
    {
      "question": "Can Elai convert existing content into video?",
      "answer": "Yes, Elai can convert PowerPoint presentations or blog/article URLs into narrated videos."
    },
    {
      "question": "When does Yepic AI's API access become available?",
      "answer": "API access is available starting on the $79/month Creator plan, which also removes the watermark."
    },
    {
      "question": "Where are Elai and Yepic AI based?",
      "answer": "Elai lists an address at 600 River Avenue, Suite 100, Pittsburgh, PA, USA; Yepic AI is based in London, UK."
    }
  ]
};

export default elaiVsYepicAiContent;
