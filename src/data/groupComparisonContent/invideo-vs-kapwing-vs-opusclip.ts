import type { GroupComparisonContent } from './types';

const invideoVsKapwingVsOpusclipContent: GroupComparisonContent = {
  "verdict": "InVideo, Kapwing, and OpusClip are all AI-powered video tools built for fast social and marketing content, but they solve different parts of the workflow. InVideo leans hardest into full prompt-to-video generation, even bundling access to frontier models like Sora 2 and Veo 3.1. Kapwing is built around a real-time collaborative browser editor with a growing AI toolkit layered on top, while OpusClip is purpose-built for turning existing long-form video into short, ranked clips. None of the three is a strict upgrade over the others -- the right pick depends on whether you are generating video from scratch, editing collaboratively, or repurposing footage you already have.",
  "bestFor": {
    "invideo": "Creators and marketers who want to generate a full first-draft video from a text prompt, script, or blog post, including access to Sora 2 and Veo 3.1 in one subscription",
    "kapwing": "Teams that need real-time, multi-person collaborative editing in the browser alongside AI subtitles, dubbing, and voice cloning",
    "opusclip": "Podcasters, creators, and agencies repurposing long-form video into short, AI-ranked clips for TikTok, YouTube Shorts, and Instagram Reels"
  },
  "highlights": [
    {
      "title": "Prompt-to-video generation with frontier AI models",
      "description": "InVideo AI generates a full edited video from a single prompt, script, or URL, and bundles third-party models including OpenAI's Sora 2 and Google's Veo 3.1 inside one subscription rather than requiring separate accounts.",
      "toolSlugs": [
        "invideo"
      ]
    },
    {
      "title": "AI-driven long-form to short-form repurposing",
      "description": "OpusClip's ClipAnything uses multimodal AI to find specific moments in long recordings via natural-language prompts and scores each generated clip for predicted virality, a workflow neither InVideo nor Kapwing is built around.",
      "toolSlugs": [
        "opusclip"
      ]
    },
    {
      "title": "Real-time collaborative browser editing",
      "description": "Kapwing runs entirely in the browser and supports multiple people editing the same project simultaneously, closer to a Google Docs experience than InVideo's or OpusClip's more individual, automation-first workflows.",
      "toolSlugs": [
        "kapwing"
      ]
    },
    {
      "title": "Every free plan is watermarked and capped",
      "description": "All three offer a free tier to try AI features, but each limits usable output differently: InVideo caps AI generation minutes and adds watermarks, Kapwing limits exports to one minute at 720p, and OpusClip's free exports expire after three days.",
      "toolSlugs": [
        "invideo",
        "kapwing",
        "opusclip"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "AI Video Creation",
      "rows": [
        {
          "feature": "AI text-to-video generation from a prompt or script",
          "statuses": {
            "invideo": "available",
            "kapwing": "unavailable",
            "opusclip": "unavailable"
          },
          "note": "Kapwing and OpusClip focus on editing and repurposing existing footage rather than generating a video from a written prompt."
        },
        {
          "feature": "Long-form to short-clip repurposing with AI virality scoring",
          "statuses": {
            "invideo": "not-documented",
            "kapwing": "not-documented",
            "opusclip": "available"
          }
        },
        {
          "feature": "AI voice cloning",
          "statuses": {
            "invideo": "available",
            "kapwing": "available",
            "opusclip": "limited"
          },
          "note": "OpusClip offers AI voice-over generation but its documented feature set does not describe custom voice cloning specifically."
        },
        {
          "feature": "Multi-language translation and dubbing",
          "statuses": {
            "invideo": "available",
            "kapwing": "available",
            "opusclip": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Editing and Collaboration",
      "rows": [
        {
          "feature": "Real-time multi-user collaborative editing",
          "statuses": {
            "invideo": "not-documented",
            "kapwing": "available",
            "opusclip": "not-documented"
          }
        },
        {
          "feature": "Manual timeline-based editing controls",
          "statuses": {
            "invideo": "available",
            "kapwing": "available",
            "opusclip": "not-documented"
          },
          "note": "OpusClip is built around automated clip generation rather than a full manual editing timeline."
        }
      ]
    },
    {
      "group": "Access and Publishing",
      "rows": [
        {
          "feature": "Direct one-click publishing to social platforms",
          "statuses": {
            "invideo": "not-documented",
            "kapwing": "not-documented",
            "opusclip": "available"
          }
        },
        {
          "feature": "Free plan available",
          "statuses": {
            "invideo": "available",
            "kapwing": "available",
            "opusclip": "available"
          },
          "note": "All three free plans carry watermarks or hard limits on export quality, length, or retention window."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which tool is best for turning a podcast or webinar into short clips?",
      "answer": "OpusClip is purpose-built for this: its ClipAnything feature analyzes visual, audio, and emotional cues in long-form footage and automatically extracts and ranks the moments most likely to perform well as short clips, with one-click publishing to TikTok, YouTube Shorts, and Instagram."
    },
    {
      "question": "Which of the three is best for a team editing videos together?",
      "answer": "Kapwing is the strongest fit for collaboration since it runs entirely in the browser and supports real-time, multi-person editing on the same project, similar to collaborative document editing."
    },
    {
      "question": "Can I generate a video just from a text prompt with any of these tools?",
      "answer": "InVideo is the one built around this workflow: it can generate a full edited video, including script, voiceover, and stock footage, from a single prompt, script, or blog post URL, and it also bundles access to Sora 2 and Veo 3.1."
    },
    {
      "question": "Do InVideo, Kapwing, and OpusClip all have a free plan?",
      "answer": "Yes, all three offer a free tier to test their AI features, but each has meaningful limits: InVideo and Kapwing watermark exports and cap resolution or length, and OpusClip's free exports are only available for three days after generation."
    },
    {
      "question": "Which tool has the lowest-cost paid plan?",
      "answer": "Based on published pricing, OpusClip's Starter plan at $15 per month and Kapwing's Pro plan at $16 per month (billed annually) undercut InVideo's Plus plan, which starts at roughly $20 per month billed annually."
    },
    {
      "question": "Do any of these tools require video editing experience?",
      "answer": "InVideo and OpusClip are designed to minimize manual editing through AI automation, while Kapwing still expects some hands-on timeline editing, though its AI subtitle, dubbing, and voice-cloning tools reduce the amount of manual work needed."
    }
  ]
};

export default invideoVsKapwingVsOpusclipContent;
