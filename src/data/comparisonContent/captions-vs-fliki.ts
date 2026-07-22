import type { ToolComparisonContent } from './types';

const captionsVsFlikiContent: ToolComparisonContent = {
  "verdict": "Captions and Fliki both use AI to produce finished videos, but they start from different inputs: Captions is built to auto-edit and enhance footage you actually filmed (auto-edit, eye contact correction, denoising), while Fliki generates a full video from text — scripts, blog posts, or slides — with a very large voice library. The better fit depends on whether you're starting from a camera or from a document.",
  "bestForToolA": "Creators who film themselves and want AI to auto-edit raw footage, fix eye contact, remove background noise, and add stylized captions, especially those who need iOS/Android mobile apps.",
  "bestForToolB": "Users who want to generate a video purely from a script, blog post, or slide deck without filming anything, and who value a very large voice library (2,000+ voices) with direct publishing to social platforms.",
  "whoNeedsBoth": "A content team could use Captions to polish filmed talking-head segments while using Fliki to turn existing blog content into separate narrated videos without any filming.",
  "keyDifferences": [
    {
      "title": "Editing filmed footage vs. generating from text",
      "toolA": "AI Edit automatically edits raw footage into a finished video, including cuts and B-roll, plus Eye Contact Correction and Denoising for camera-shot content.",
      "toolB": "Text-to-video converts scripts or prompts into complete videos with voiceover, visuals, and subtitles, plus blog-to-video and PPT-to-video conversion.",
      "whyItMatters": "The two tools assume different starting materials — actual camera footage versus written text — which determines which one fits a given production workflow.",
      "benefitsWho": "On-camera creators/vloggers benefit from Captions' footage-editing tools; writers and marketers repurposing text content benefit from Fliki's text-to-video pipeline."
    },
    {
      "title": "Mobile app availability",
      "toolA": "Available on iOS App Store and Google Play in addition to the web app.",
      "toolB": "No dedicated iOS, Android, Mac, or Windows apps mentioned — web-based only.",
      "whyItMatters": "Creators who film and edit on their phone need a mobile app rather than a web-only tool.",
      "benefitsWho": "Mobile-first creators benefit specifically from Captions' native apps."
    },
    {
      "title": "Direct social publishing",
      "toolA": "No direct publishing to social platforms is documented as a feature.",
      "toolB": "Publishes videos directly to TikTok, Instagram, and YouTube from within the app.",
      "whyItMatters": "Direct publishing removes a manual export-and-upload step from the workflow.",
      "benefitsWho": "Creators who want a one-step publish workflow benefit from Fliki's direct publishing."
    },
    {
      "title": "Free tier limits",
      "toolA": "Free version includes basic trimming, transitions, and media library assets, but generative AI features (AI Edit, avatars, translation) require the paid Max plan.",
      "toolB": "Free-forever plan with no credit card, but capped at 1-minute exports, 720p, 36 credits/month, and a Fliki watermark.",
      "whyItMatters": "Both gate their most valuable AI features behind limits, but in different ways — Captions gates by feature tier, Fliki gates by video length/credits.",
      "benefitsWho": "Users planning short clips can get more out of Fliki's free tier; users needing generative editing features will hit Captions' free-tier wall faster."
    },
    {
      "title": "Pricing transparency at scale",
      "toolA": "Published paid tiers from $24.99/month (Max) up to $279.99/month (Scale 4x), plus custom Enterprise.",
      "toolB": "Exact monthly prices for paid Standard and Premium plans are not shown as static text on the pricing page.",
      "whyItMatters": "Clearly published pricing makes it easier to budget for a team without needing to configure a calculator or contact sales.",
      "benefitsWho": "Buyers who want upfront, comparable pricing benefit from Captions' published tier structure."
    }
  ],
  "featureMatrix": [
    {
      "group": "Editing & Generation",
      "rows": [
        {
          "feature": "Auto-edit raw footage",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Eye contact correction",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Denoising/audio cleanup",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Text-to-video from script/blog/slides",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "AI avatar / digital twin",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Localization & Output",
      "rows": [
        {
          "feature": "Caption styles",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Captions offers 100+ styles"
        },
        {
          "feature": "Translation into 100+ languages",
          "toolA": "available",
          "toolB": "available",
          "note": "Fliki's coverage is stated as 80+ languages"
        },
        {
          "feature": "Voice library size",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Fliki states 2,000+ voices"
        }
      ]
    },
    {
      "group": "Platforms & Pricing",
      "rows": [
        {
          "feature": "Mobile app (iOS/Android)",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Direct publishing to social platforms",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Free plan",
          "toolA": "available",
          "toolB": "available",
          "note": "Captions' free tier lacks generative AI features; Fliki's is capped at 1-minute, watermarked exports"
        },
        {
          "feature": "Published paid tier pricing",
          "toolA": "available",
          "toolB": "unavailable"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Captions have a free plan?",
      "answer": "Yes, a free version includes basic trimming, transitions, and media library assets, though AI Edit, avatars, and translation require the paid Max plan."
    },
    {
      "question": "Is there a free plan for Fliki?",
      "answer": "Yes, Fliki has a free-forever plan with 36 credits per month, 1-minute exports, and 720p resolution, with a watermark."
    },
    {
      "question": "Is there a mobile app?",
      "answer": "Captions is available on the iOS App Store and Google Play; Fliki's facts don't mention dedicated mobile apps."
    },
    {
      "question": "Can Fliki turn a blog post into a video?",
      "answer": "Yes, its blog-to-video workflow repurposes articles into narrated videos."
    },
    {
      "question": "What's the cheapest paid plan for Captions?",
      "answer": "Max, at $24.99/month, with 500 monthly credits and full AI editing features."
    },
    {
      "question": "Does Fliki support voice cloning?",
      "answer": "Yes, paid plans include voice cloning by recording a voice sample."
    }
  ]
};

export default captionsVsFlikiContent;
