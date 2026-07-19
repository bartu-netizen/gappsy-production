import type { GroupComparisonContent } from './types';

const alituVsHindenburgVsRiversideContent: GroupComparisonContent = {
  "verdict": "Alitu, Hindenburg, and Riverside all serve podcast creators but solve different parts of the production workflow: Alitu bundles recording, AI-assisted editing, and hosting into one beginner-friendly subscription, Hindenburg is a focused spoken-word audio editor prized for automated leveling and noise cleanup, and Riverside is a remote multi-track recording and video production platform with AI clip tools. Teams recording remote video interviews lean toward Riverside, solo audio-first podcasters who want hands-off simplicity lean toward Alitu, and those who want precise manual control over spoken-word editing lean toward Hindenburg. There is no single best choice across all three; the right one depends on whether recording, editing precision, or video is the priority.",
  "bestFor": {
    "alitu": "Beginner podcasters who want recording, AI-assisted editing, hosting, and publishing bundled into one simple subscription",
    "hindenburg": "Podcasters, journalists, and audiobook narrators who want a focused spoken-word audio editor with automated leveling and noise tools",
    "riverside": "Podcasters and video creators recording remote interviews who need high-quality local multi-track recording plus AI editing and hosting"
  },
  "highlights": [
    {
      "title": "Alitu is built for hands-off, all-in-one production",
      "description": "Alitu combines a built-in recorder, AI-assisted editing with Magic Filters, one-click publishing, and free hosting in a single $38/month subscription aimed at podcasters who want minimal technical setup.",
      "toolSlugs": [
        "alitu"
      ]
    },
    {
      "title": "Hindenburg specializes in spoken-word audio quality",
      "description": "Hindenburg's Auto Leveler, speech-optimized waveform, and noise reduction and Auto EQ tools are purpose-built for interview and narration editing rather than generic music production, and it offers both subscription and one-time perpetual license pricing.",
      "toolSlugs": [
        "hindenburg"
      ]
    },
    {
      "title": "Riverside adds remote video production and AI clips",
      "description": "Riverside records local high-quality multi-track audio and video even over unstable remote connections, then uses AI editing and Magic Clips to help creators repurpose content, backed by live streaming and webinar hosting features the other two do not offer.",
      "toolSlugs": [
        "riverside"
      ]
    },
    {
      "title": "Entry pricing and free tiers differ meaningfully",
      "description": "Hindenburg offers a free Field Recorder Lite mobile app and a PRO subscription from $12/month, Riverside has a generous free plan before paid tiers starting at $24/month, while Alitu has no permanently free tier and starts at $38/month.",
      "toolSlugs": [
        "alitu",
        "hindenburg",
        "riverside"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Recording",
      "rows": [
        {
          "feature": "Built-in recorder",
          "statuses": {
            "alitu": "available",
            "hindenburg": "available",
            "riverside": "available"
          }
        },
        {
          "feature": "Remote multi-track recording",
          "statuses": {
            "alitu": "not-documented",
            "hindenburg": "available",
            "riverside": "available"
          },
          "note": "Hindenburg supports multi-track and X/Y recording; Riverside is specifically built around local high-quality remote recording."
        },
        {
          "feature": "Video recording and production",
          "statuses": {
            "alitu": "unavailable",
            "hindenburg": "unavailable",
            "riverside": "available"
          }
        }
      ]
    },
    {
      "group": "Editing",
      "rows": [
        {
          "feature": "AI-assisted editing",
          "statuses": {
            "alitu": "available",
            "hindenburg": "unavailable",
            "riverside": "available"
          }
        },
        {
          "feature": "Automated leveling / noise reduction",
          "statuses": {
            "alitu": "available",
            "hindenburg": "available",
            "riverside": "not-documented"
          },
          "note": "Alitu offers Magic Filters; Hindenburg's Auto Leveler and Auto EQ are core, dedicated tools."
        }
      ]
    },
    {
      "group": "Publishing and Distribution",
      "rows": [
        {
          "feature": "Hosting and one-click publishing",
          "statuses": {
            "alitu": "available",
            "hindenburg": "limited",
            "riverside": "available"
          },
          "note": "Hindenburg includes chapter markers and publishing support but is not primarily a hosting platform."
        },
        {
          "feature": "Live streaming / multistreaming",
          "statuses": {
            "alitu": "unavailable",
            "hindenburg": "unavailable",
            "riverside": "available"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three tools is best for recording remote video interviews?",
      "answer": "Riverside is purpose-built for this, offering local high-quality multi-track recording for both audio and video even over unstable connections, plus live streaming and webinar hosting that neither Alitu nor Hindenburg provide."
    },
    {
      "question": "Which tool is easiest for a complete beginner?",
      "answer": "Alitu is designed specifically for beginners, bundling recording, AI-assisted editing, hosting, and a podcast website into one guided workflow with minimal technical setup required."
    },
    {
      "question": "Is there a free way to try any of these tools?",
      "answer": "Hindenburg offers a free Field Recorder Lite mobile app, and Riverside has a free plan (limited to 2 one-off hours of multi-track recording) before paid tiers begin. Alitu does not have a permanently free tier but offers a 30-day money-back guarantee."
    },
    {
      "question": "Which tool is best for spoken-word editing precision like interviews or audiobooks?",
      "answer": "Hindenburg is purpose-built for spoken-word editing, with a speech-optimized waveform, Auto Leveler, and noise reduction tools tailored to podcasters, journalists, and audiobook narrators rather than generic music production."
    },
    {
      "question": "Do any of these tools handle podcast hosting and publishing directly?",
      "answer": "Alitu includes free hosting and a podcast website as part of its subscription, and Riverside also offers podcast and video hosting alongside recording and editing. Hindenburg focuses on the editing stage and includes chapter markers and publishing metadata rather than functioning as a full hosting platform."
    },
    {
      "question": "Which tool offers a one-time purchase instead of a subscription?",
      "answer": "Hindenburg is the only one of the three offering a one-time perpetual license option (around $95) in addition to its $12/month PRO subscription. Alitu and Riverside are both subscription-only."
    }
  ]
};

export default alituVsHindenburgVsRiversideContent;
