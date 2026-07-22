import type { GroupComparisonContent } from './types';

const alituVsBoomcasterVsRiversideContent: GroupComparisonContent = {
  "verdict": "Alitu is built for podcasters who want recording, AI-assisted editing, hosting, and publishing bundled into one low-friction subscription without deep audio-editing skills. Boomcaster and Riverside are dedicated remote-recording platforms that capture each participant locally for broadcast-quality output, with Riverside going furthest into an all-in-one content suite that includes a free tier, AI clips, and webinars, while Boomcaster leans harder into live multistreaming for creators simulcasting to several platforms at once.",
  "bestFor": {
    "alitu": "Solo or small podcasters who want recording, AI editing, hosting, and publishing bundled into one subscription without assembling separate tools.",
    "boomcaster": "Podcasters and creators who need dependable local recording plus simultaneous live multistreaming to platforms like YouTube, Facebook, and Twitch.",
    "riverside": "Podcasters, video creators, and marketing teams who want a free-to-start, all-in-one production suite spanning recording, AI editing, hosting, and webinars."
  },
  "highlights": [
    {
      "title": "All-in-One Podcast Pipeline",
      "description": "Alitu bundles a built-in recorder, transcript-based AI editing with Magic Filters, hosting, and one-click publishing into a single subscription aimed at non-technical creators.",
      "toolSlugs": [
        "alitu"
      ]
    },
    {
      "title": "Local Per-Participant Recording",
      "description": "Boomcaster and Riverside both record each participant's audio and video locally on their own device before uploading, protecting the final recording from dropped connections or bandwidth spikes.",
      "toolSlugs": [
        "boomcaster",
        "riverside"
      ]
    },
    {
      "title": "Free Plan Entry Point",
      "description": "Riverside is the only one of the three offering a genuinely free tier, with 2 hours of one-off multi-track recording, before requiring a paid subscription.",
      "toolSlugs": [
        "riverside"
      ]
    },
    {
      "title": "Live Multistreaming",
      "description": "Boomcaster and Riverside both support simulcasting a live session to multiple destinations at once, including YouTube, Facebook, LinkedIn, and Twitch.",
      "toolSlugs": [
        "boomcaster",
        "riverside"
      ]
    },
    {
      "title": "Built-In Hosting and Publishing",
      "description": "Alitu and Riverside both include podcast or video hosting with direct publishing to major platforms, while Boomcaster focuses on recording and streaming rather than hosting episodes.",
      "toolSlugs": [
        "alitu",
        "riverside"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Recording",
      "rows": [
        {
          "feature": "Local per-participant recording",
          "statuses": {
            "alitu": "not-documented",
            "boomcaster": "available",
            "riverside": "available"
          },
          "note": "Boomcaster and Riverside record each guest locally to protect against connection drops; Alitu's recorder is not documented as working this way."
        },
        {
          "feature": "Built-in recorder or file upload",
          "statuses": {
            "alitu": "available",
            "boomcaster": "available",
            "riverside": "available"
          }
        }
      ]
    },
    {
      "group": "Editing and AI",
      "rows": [
        {
          "feature": "Transcript-based or AI-assisted editing",
          "statuses": {
            "alitu": "available",
            "boomcaster": "available",
            "riverside": "available"
          }
        }
      ]
    },
    {
      "group": "Distribution and Pricing",
      "rows": [
        {
          "feature": "Live multistreaming to multiple platforms",
          "statuses": {
            "alitu": "unavailable",
            "boomcaster": "available",
            "riverside": "available"
          },
          "note": "Riverside's multistreaming is available from the Grow plan and above."
        },
        {
          "feature": "Built-in podcast or video hosting",
          "statuses": {
            "alitu": "available",
            "boomcaster": "not-documented",
            "riverside": "available"
          }
        },
        {
          "feature": "Webinar hosting",
          "statuses": {
            "alitu": "unavailable",
            "boomcaster": "unavailable",
            "riverside": "available"
          },
          "note": "Riverside's Webinar plan supports up to 100 registrants."
        },
        {
          "feature": "Free plan (no credit card, ongoing)",
          "statuses": {
            "alitu": "unavailable",
            "boomcaster": "unavailable",
            "riverside": "available"
          },
          "note": "Alitu and Boomcaster only offer free trials, not an ongoing free plan."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Alitu, Boomcaster, or Riverside better for solo podcasters?",
      "answer": "Alitu is the most purpose-built for solo podcasters, since it bundles recording, AI editing, hosting, and publishing into one $38/month subscription designed for non-technical creators. Boomcaster and Riverside are also usable solo, but they are built around remote guest recording and are stronger picks once interviews or co-hosts enter the picture."
    },
    {
      "question": "Which of these tools offers a free plan?",
      "answer": "Riverside is the only one of the three with an ongoing free plan, offering 2 hours of one-off multi-track recording at up to 720p with a watermark. Alitu and Boomcaster only offer free trials before requiring a paid subscription."
    },
    {
      "question": "Can I livestream to multiple platforms at once with these tools?",
      "answer": "Boomcaster and Riverside both support live multistreaming to destinations like YouTube, Facebook, LinkedIn, and Twitch simultaneously. Alitu is focused on podcast production and publishing rather than live streaming, so it does not offer this capability."
    },
    {
      "question": "Do Boomcaster and Riverside record locally to protect against bad internet connections?",
      "answer": "Yes. Both platforms record each participant's audio and video locally on their own device and upload the files afterward, which avoids the compression artifacts and dropped frames common with live video-call recording."
    },
    {
      "question": "Which tool includes built-in podcast or video hosting?",
      "answer": "Alitu includes free hosting for up to 1,000 downloads per month (with paid add-ons for more), and Riverside includes podcast and video hosting with analytics on its paid plans. Boomcaster's core product is recording and livestreaming rather than hosting."
    },
    {
      "question": "How does pricing compare across Alitu, Boomcaster, and Riverside?",
      "answer": "Alitu starts at $38/month for its Standard plan. Boomcaster starts at $20/month for 5 hours of recording or livestreaming, with hourly overage charges beyond that. Riverside starts free and its paid Pro plan begins at $24/month billed annually, making it the only one with a no-cost way to try the platform long-term."
    }
  ]
};

export default alituVsBoomcasterVsRiversideContent;
