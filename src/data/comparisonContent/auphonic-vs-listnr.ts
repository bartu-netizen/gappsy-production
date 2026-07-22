import type { ToolComparisonContent } from './types';

const auphonicVsListnrContent: ToolComparisonContent = {
  "verdict": "Auphonic and Listnr both sit in the AI audio space but do fundamentally different jobs: Auphonic is an automated post-production service that cleans and masters existing recordings, while Listnr generates brand-new synthetic voice audio from text. Neither replaces the other — Auphonic has nothing to say about generating voices, and Listnr doesn't document any audio-cleanup or leveling capability. The right pick depends on whether the starting point is a raw recording that needs polishing or a script that needs a voice.",
  "bestForToolA": "Podcasters and video creators who already have raw recorded audio and need automatic leveling, noise/reverb reduction, filler-word removal, and loudness normalization before publishing to platforms like YouTube, Libsyn, Podbean, or SoundCloud.",
  "bestForToolB": "Creators who need to generate narration from a script — Listnr's 1,000+ voices across 142+ languages, voice cloning, and SSML controls are built for producing new voiceover, podcast, or video audio rather than cleaning existing recordings.",
  "whoNeedsBoth": "A podcast or video production pipeline that generates narration with Listnr and then runs the resulting audio through Auphonic for leveling, noise reduction, and loudness normalization before publishing would use both tools for different stages of the same workflow.",
  "keyDifferences": [
    {
      "title": "Core function: audio cleanup vs. voice generation",
      "toolA": "Auphonic automatically levels, cleans, and normalizes existing podcast/video audio, including noise/reverb reduction and filler-word removal.",
      "toolB": "Listnr generates new synthetic voice audio from text using a library of 1,000+ voices across 142+ languages.",
      "whyItMatters": "These are complementary rather than competing functions — one processes audio you already have, the other creates audio you don't yet have.",
      "benefitsWho": "Podcast/video editors who record their own voice (Auphonic) vs. creators who need a voice generated for them (Listnr)."
    },
    {
      "title": "Multitrack and video finishing tools",
      "toolA": "Auphonic applies ducking and noise gates across multiple speaker tracks and can process video files to generate chapters and audiograms.",
      "toolB": "Listnr's video-related capability is capped by plan (50/150/250 videos per month) rather than documented as a post-production finishing feature.",
      "whyItMatters": "Auphonic is documented specifically for finishing multi-speaker recordings and turning them into publish-ready audio/video assets; Listnr's video allowance is about output volume, not audio cleanup.",
      "benefitsWho": "Multi-host podcast producers needing consistent mastering across tracks."
    },
    {
      "title": "Publishing integrations",
      "toolA": "Auphonic connects directly to YouTube, Libsyn, Podbean, and SoundCloud, plus Zapier, API, and CLI access.",
      "toolB": "Listnr connects via Zapier and Pabbly Connect plus API access; direct podcast-host publishing is not documented.",
      "whyItMatters": "Auphonic documents a more direct path from processed audio to a published episode on major podcast platforms.",
      "benefitsWho": "Podcast producers who want automated publishing after processing."
    },
    {
      "title": "Pricing structure",
      "toolA": "Auphonic's subscription and credit prices are rendered dynamically by currency/region rather than shown as static figures, though one-time credit packages don't expire.",
      "toolB": "Listnr's plans are billed annually upfront at fixed published prices: $190/year (Individual), $390/year (Solo), $990/year (Agency).",
      "whyItMatters": "Listnr gives buyers a fixed, comparable annual price up front, while Auphonic's pricing must be checked live on the site and doesn't commit to monthly billing flexibility documented elsewhere.",
      "benefitsWho": "Budget planners who want to know exact costs before signing up (Listnr) vs. infrequent users who prefer non-expiring one-time credits (Auphonic)."
    },
    {
      "title": "Free tier limits",
      "toolA": "The free tier processes 2 hours of audio per month but adds an Auphonic watermark jingle, excludes speech recognition/show notes, and caps multitrack productions under 20 minutes.",
      "toolB": "The free tier includes 1,000 words of text-to-speech generation with no credit card required.",
      "whyItMatters": "Auphonic's free tier is usage-capped by audio duration with feature restrictions, while Listnr's is capped by word count for generation — different constraints for evaluating each tool at no cost.",
      "benefitsWho": "Anyone trialing either tool before committing to a paid plan."
    }
  ],
  "featureMatrix": [
    {
      "group": "Audio Processing",
      "rows": [
        {
          "feature": "Automatic leveling & noise/reverb reduction",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Filler word & silence removal",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Loudness normalization to broadcast specs",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Multitrack processing (ducking, noise gates)",
          "toolA": "available",
          "toolB": "unavailable"
        }
      ]
    },
    {
      "group": "Voice Generation",
      "rows": [
        {
          "feature": "Text-to-speech voice library",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Listnr offers 1,000+ voices across 142+ languages."
        },
        {
          "feature": "Voice cloning",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "SSML & pronunciation controls",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Multi-voice conversations in one file",
          "toolA": "unavailable",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Publishing & Video",
      "rows": [
        {
          "feature": "Direct podcast host publishing (YouTube/Libsyn/Podbean/SoundCloud)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Video processing/output",
          "toolA": "available",
          "toolB": "available",
          "note": "Auphonic generates chapters/audiograms from uploaded video; Listnr generates video content capped per plan (50-250/month)."
        },
        {
          "feature": "CLI access",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "API & Zapier integration",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Pricing & Access",
      "rows": [
        {
          "feature": "Free tier",
          "toolA": "available",
          "toolB": "available",
          "note": "Auphonic: 2 hrs/month with watermark. Listnr: 1,000 words, no credit card."
        },
        {
          "feature": "Non-expiring pay-as-you-go credits",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Fixed published pricing",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Listnr publishes $190/$390/$990 per year; Auphonic's pricing is rendered dynamically by region."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Auphonic free?",
      "answer": "Yes, a free tier processes 2 hours of audio per month, though it adds an Auphonic jingle and excludes speech recognition and show notes."
    },
    {
      "question": "Is Listnr free?",
      "answer": "Yes, new users get 1,000 words of text-to-speech generation for free with no credit card required."
    },
    {
      "question": "What's the difference between what Auphonic and Listnr actually do?",
      "answer": "Auphonic automatically cleans, levels, and normalizes existing recorded audio; Listnr generates brand-new synthetic voice audio from text."
    },
    {
      "question": "Does Auphonic support video?",
      "answer": "Yes, it can process video files and generate chapters and audiograms."
    },
    {
      "question": "How many voices and languages does Listnr support?",
      "answer": "Over 1,000 voices across more than 142 languages and accents."
    },
    {
      "question": "Can I use Auphonic without a subscription?",
      "answer": "Yes, one-time credit packages are available from 5 hours up to 3000+ hours, and unused credits don't expire."
    }
  ]
};

export default auphonicVsListnrContent;
