import type { ToolComparisonContent } from './types';

const camtasiaVsScreenflowContent: ToolComparisonContent = {
  "verdict": "Camtasia and ScreenFlow both combine screen recording with a full video editor, but they diverge on platform reach, licensing, and AI depth. Camtasia runs on Windows and Mac and layers an extensive AI toolset (script generation, voiceovers, avatars, translation) onto subscription tiers ranging from about €39.57 to €607.71 per year. ScreenFlow is a Mac-only app sold as a one-time $199 purchase with no AI editing features documented, but it directly records iOS device screens and includes multi-channel audio editing and ADA-compliant captions. The right choice depends on whether cross-platform reach and AI tooling matter more than a one-time license and native iOS capture.",
  "bestForToolA": "Windows or cross-platform teams that want AI-assisted script writing, voiceovers, avatar generation, and translation built into the editing workflow, and who are comfortable with an annual subscription.",
  "bestForToolB": "Mac-only creators who prefer a one-time purchase over a subscription and need to record iPhone or iPad screens directly, without requiring AI editing features.",
  "whoNeedsBoth": "A cross-platform team with both Windows and Mac editors, where some members want Camtasia's AI tooling for polished content and others want ScreenFlow's one-time license and native iOS capture for quick Mac-based recordings, might standardize on different tools per platform rather than picking one.",
  "keyDifferences": [
    {
      "title": "Licensing model: subscription vs. one-time purchase",
      "toolA": "Sold as annual subscription tiers ranging from €39.57/year (Starter) to €607.71/year (Pro).",
      "toolB": "Sold as a one-time $199 purchase, with an optional $99/year Stock Media Library add-on.",
      "whyItMatters": "Ongoing subscription cost versus a single upfront payment changes long-term total cost of ownership.",
      "benefitsWho": "Budget-conscious individual creators may prefer ScreenFlow's one-time fee; teams wanting continuous feature updates may prefer Camtasia's subscription."
    },
    {
      "title": "Platform support",
      "toolA": "Supports Windows 10/11 and macOS 14+.",
      "toolB": "macOS only.",
      "whyItMatters": "Windows-based teams can't use ScreenFlow at all, which rules it out regardless of other features.",
      "benefitsWho": "Mixed-OS organizations and Windows users specifically."
    },
    {
      "title": "AI toolset depth",
      "toolA": "Includes AI script generation, 200+ AI voiceover options, AI avatar generation (49 styles), and translation on higher tiers.",
      "toolB": "No AI-based editing features are mentioned, such as automatic transcription or text-based editing tools.",
      "whyItMatters": "Teams wanting to accelerate content production with AI-generated scripts, voices, or avatars need Camtasia's toolset.",
      "benefitsWho": "Training, marketing, and content teams producing high volumes of video who want to reduce manual scripting and voiceover work."
    },
    {
      "title": "Text-based/transcript editing",
      "toolA": "Includes Audiate, which transcribes audio so editing can be done via the text, including automatic filler-word removal (Essentials tier and above).",
      "toolB": "Not documented — editing relies on the timeline, freehand annotations, and animations rather than transcript-based tools.",
      "whyItMatters": "Editing by transcript can significantly speed up trimming compared to timeline-only editing.",
      "benefitsWho": "Solo creators and teams producing talking-head or tutorial videos who want faster edits."
    },
    {
      "title": "iOS device screen recording",
      "toolA": "Not documented as a feature.",
      "toolB": "Explicitly supports capturing iPhone or iPad screens directly.",
      "whyItMatters": "Teams that need to demo mobile apps benefit from native device capture rather than workarounds.",
      "benefitsWho": "App developers and product marketers demoing iOS apps."
    }
  ],
  "featureMatrix": [
    {
      "group": "Recording & Platforms",
      "rows": [
        {
          "feature": "Windows support",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "ScreenFlow is explicitly macOS only."
        },
        {
          "feature": "macOS support",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "iPhone/iPad screen recording",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Simultaneous multi-source recording (screen/camera/mic)",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Editing & AI",
      "rows": [
        {
          "feature": "Text-based / transcript editing",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "AI script, voiceover, and avatar generation",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "ScreenFlow's facts explicitly state no AI-based editing features are mentioned."
        },
        {
          "feature": "Closed captions",
          "toolA": "available",
          "toolB": "available",
          "note": "ScreenFlow's captions support ADA-compliance capability."
        },
        {
          "feature": "Stock media library",
          "toolA": "available",
          "toolB": "limited",
          "note": "ScreenFlow's stock library is a separate $99/year add-on; Camtasia's 100M+ asset library is included on the Pro tier."
        }
      ]
    },
    {
      "group": "Pricing & Licensing",
      "rows": [
        {
          "feature": "Free / trial version",
          "toolA": "available",
          "toolB": "available",
          "note": "Camtasia's free version is watermarked; ScreenFlow's trial has no stated time limit but also watermarks exports."
        },
        {
          "feature": "Base license model",
          "toolA": "available",
          "toolB": "available",
          "note": "Camtasia is subscription-based from €39.57/year; ScreenFlow is a one-time $199 purchase."
        },
        {
          "feature": "Watermark-free editing at entry price",
          "toolA": "limited",
          "toolB": "available",
          "note": "Camtasia's entry Starter tier is capture-only with a watermarked editor; watermark-free editing needs the Essentials tier (€182.50/year). ScreenFlow's $199 one-time purchase removes the trial watermark."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Camtasia or ScreenFlow available on Windows?",
      "answer": "Camtasia supports Windows 10/11 and macOS; ScreenFlow is Mac only."
    },
    {
      "question": "Is either a one-time purchase?",
      "answer": "ScreenFlow is sold as a one-time $199 purchase. Camtasia is subscription-based, with annual tiers starting at €39.57/year."
    },
    {
      "question": "Which has AI features?",
      "answer": "Camtasia includes AI script generation, voiceovers, avatar generation, and translation on higher tiers; ScreenFlow does not document any AI-based editing features."
    },
    {
      "question": "Can either record iPhone or iPad screens?",
      "answer": "ScreenFlow explicitly supports direct iOS screen recording; this isn't documented for Camtasia."
    },
    {
      "question": "Do both have free or trial versions?",
      "answer": "Camtasia has a free version for basic capture (watermarked exports, editing requires a paid plan); ScreenFlow offers a free trial with no stated time limit, though exports are watermarked until purchase."
    },
    {
      "question": "Does ScreenFlow include a stock media library?",
      "answer": "ScreenFlow's core app doesn't include the full stock library — it's a separate $99/year add-on. Camtasia's Pro tier includes access to 100M+ stock assets."
    }
  ]
};

export default camtasiaVsScreenflowContent;
