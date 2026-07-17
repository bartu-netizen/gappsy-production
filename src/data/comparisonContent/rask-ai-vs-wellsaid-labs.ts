import type { ToolComparisonContent } from './types';

const raskAiVsWellsaidLabsContent: ToolComparisonContent = {
  "verdict": "Rask AI and WellSaid Labs both generate synthetic voice, but they solve different problems: Rask AI is built for translating and dubbing video into 130+ languages with lip-sync, while WellSaid is a single-workflow TTS studio built on licensed voice-actor recordings with commercial rights baked into every paid plan. Rask AI wins on language breadth and video localization; WellSaid wins on voice provenance, pronunciation control, and Adobe workflow integration. Which is the better fit depends on whether the job is multilingual video dubbing or polished, commercially-safe narration.",
  "bestForToolA": "Teams localizing video content into many languages — Rask AI's 130+ language translation, 32-language voice cloning, lip-sync, and multi-speaker translation support are aimed squarely at video dubbing and localization workflows.",
  "bestForToolB": "Teams producing English-language (plus German/French) voiceover who need commercial usage rights and precise pronunciation control — WellSaid's AI Director, Oxford Dictionary pronunciation library, and Adobe Express/Premiere Pro integrations support a polished single-language production pipeline.",
  "whoNeedsBoth": "A content team could record and edit English narration in WellSaid (with its Adobe Premiere Pro integration and commercial rights) and then use Rask AI to translate and dub that same video into additional languages for international markets, since WellSaid does not document video translation or dubbing capabilities.",
  "keyDifferences": [
    {
      "title": "Core use case: video dubbing vs. voiceover studio",
      "toolA": "Rask AI translates and dubs videos into 130+ languages with lip-sync and multi-speaker support.",
      "toolB": "WellSaid is a text-to-speech studio with 120+ voices built from licensed voice-actor recordings, without video translation or dubbing features.",
      "whyItMatters": "Buyers needing to localize existing video into other languages need Rask AI's dubbing pipeline; buyers needing narration for a single production language are better served by WellSaid's voice quality and control tools.",
      "benefitsWho": "Video localization teams (Rask AI) vs. e-learning, marketing, and IVR script producers (WellSaid)."
    },
    {
      "title": "Language coverage",
      "toolA": "Video translation covers 130+ languages and voice cloning covers 32 languages.",
      "toolB": "Non-English languages beyond German and French require the Enterprise plan.",
      "whyItMatters": "Rask AI documents far broader language support at lower tiers, while WellSaid's non-English support is gated to its top custom-priced tier.",
      "benefitsWho": "Global/multilingual content teams need Rask AI's breadth; teams focused on English (or English/German/French) markets can use WellSaid's lower tiers."
    },
    {
      "title": "Lip-sync and video-specific tooling",
      "toolA": "Creator Pro and above include lip-sync to preserve speaker identity in dubbed video, plus a built-in editor for reviewing translated output.",
      "toolB": "WellSaid does not document lip-sync or video editing features; it instead integrates with Adobe Express and Adobe Premiere Pro for video workflows.",
      "whyItMatters": "Only Rask AI documents lip-sync, which matters specifically for dubbed video where mouth movement needs to match new audio.",
      "benefitsWho": "Video producers dubbing on-camera speakers."
    },
    {
      "title": "Commercial usage rights",
      "toolA": "Rask AI's facts do not explicitly document commercial usage rights terms.",
      "toolB": "All WellSaid paid plans include full commercial rights to generated audio; the free trial does not include commercial rights.",
      "whyItMatters": "WellSaid is explicit about commercial licensing on every paid tier, which matters for teams needing legal clarity before publishing generated voiceover commercially.",
      "benefitsWho": "Marketing, advertising, and commercial content teams needing documented licensing terms."
    },
    {
      "title": "Voice sourcing",
      "toolA": "Rask AI's facts do not describe how its voices or cloning models were sourced or trained.",
      "toolB": "WellSaid's voices are built from licensed voice-actor recordings rather than scraped audio.",
      "whyItMatters": "WellSaid explicitly markets voice provenance as a differentiator, which can matter for ethical/legal sourcing concerns; Rask AI does not make an equivalent claim.",
      "benefitsWho": "Brands and legal teams concerned about the sourcing of AI voice training data."
    }
  ],
  "featureMatrix": [
    {
      "group": "Language & Translation",
      "rows": [
        {
          "feature": "Multi-language video translation & dubbing",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Rask AI covers 130+ languages; WellSaid does not offer video translation."
        },
        {
          "feature": "Voice cloning",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Rask AI clones in 32 languages; WellSaid uses pre-built licensed voices rather than cloning."
        },
        {
          "feature": "Non-English language support",
          "toolA": "available",
          "toolB": "limited",
          "note": "WellSaid: German and French included; other languages require Enterprise."
        },
        {
          "feature": "Lip-sync",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Available on Rask AI's Creator Pro plan and above."
        }
      ]
    },
    {
      "group": "Voice Quality & Rights",
      "rows": [
        {
          "feature": "Licensed voice-actor recordings",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Pronunciation/tone controls (AI Director / dictionary)",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "WellSaid includes Oxford Dictionary integration."
        },
        {
          "feature": "Commercial usage rights on paid plans",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Workflow & Integrations",
      "rows": [
        {
          "feature": "Built-in editor for reviewing output",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Adobe Express / Premiere Pro integration",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Developer API",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Team collaboration",
          "toolA": "available",
          "toolB": "available",
          "note": "Rask AI: Business plan. WellSaid: team workspaces with shared projects and commenting."
        }
      ]
    },
    {
      "group": "Pricing & Trial",
      "rows": [
        {
          "feature": "Free tier",
          "toolA": "available",
          "toolB": "limited",
          "note": "Rask AI: 3 minutes, no card. WellSaid: 10 minutes generation/3 downloaded minutes, no commercial rights."
        },
        {
          "feature": "Entry paid plan price",
          "toolA": "available",
          "toolB": "available",
          "note": "Rask AI Creator: $33/month annual. WellSaid Starter: $10/month annual."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "How many languages does Rask AI support?",
      "answer": "Video translation covers 130+ languages, and voice cloning covers 32 languages."
    },
    {
      "question": "Does Rask AI support lip-syncing translated video?",
      "answer": "Yes, Creator Pro and above include lip-sync to preserve speaker identity in dubbed video."
    },
    {
      "question": "Are WellSaid's voices licensed?",
      "answer": "Yes, WellSaid's voices are built from licensed voice-actor recordings rather than scraped audio."
    },
    {
      "question": "Do WellSaid's paid plans include commercial usage rights?",
      "answer": "Yes, all paid plans include full commercial rights to generated audio; the free trial does not."
    },
    {
      "question": "How much do these tools cost to start?",
      "answer": "Rask AI's Creator plan starts at $33/month billed annually ($60/month monthly); WellSaid's Starter plan starts at $10/month billed annually ($19/month monthly)."
    },
    {
      "question": "Does WellSaid integrate with video editing tools?",
      "answer": "Yes, WellSaid integrates with Adobe Express and Adobe Premiere Pro, plus a developer API."
    }
  ]
};

export default raskAiVsWellsaidLabsContent;
