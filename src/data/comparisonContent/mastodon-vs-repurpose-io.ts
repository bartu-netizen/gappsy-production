import type { ToolComparisonContent } from './types';

const mastodonVsRepurposeIoContent: ToolComparisonContent = {
  "verdict": "Mastodon and Repurpose.io are not substitutes: Mastodon is a free, open-source, decentralized social network itself, while Repurpose.io is a paid automation tool that reformats and cross-posts existing video/audio content to other platforms. Mastodon is where you publish and build community; Repurpose.io is what takes content you already made elsewhere and redistributes it. Notably, Mastodon is not among Repurpose.io's documented destination platforms, so the two don't directly plug into each other today.",
  "bestForToolA": "Mastodon fits individuals, communities, and organizations that want an ad-free, algorithm-free microblogging presence they can self-host and fully control, interoperating with the wider ActivityPub fediverse.",
  "bestForToolB": "Repurpose.io fits video and audio creators who publish long-form content on one platform and want it automatically resized, de-watermarked, and cross-posted to 15+ destinations like YouTube, TikTok, Instagram, and LinkedIn without manual re-uploading.",
  "whoNeedsBoth": "A creator could run a self-hosted Mastodon instance for direct community engagement while separately using Repurpose.io to auto-distribute their long-form video content across other networks — though since Mastodon isn't listed among Repurpose.io's documented destination platforms, that specific leg would still require manual posting.",
  "keyDifferences": [
    {
      "title": "What The Product Actually Is",
      "toolA": "Mastodon is a federated microblogging network itself (built on ActivityPub), where users post directly and follow others.",
      "toolB": "Repurpose.io is a distribution/automation tool that detects new content on a source platform and republishes it to other destination platforms.",
      "whyItMatters": "Comparing them only makes sense as two pieces of a content workflow, not as competing products for the same job.",
      "benefitsWho": "Buyers trying to scope exactly what each tool replaces before purchasing."
    },
    {
      "title": "Pricing",
      "toolA": "Mastodon is entirely free and open-source, sustained by donations and sponsors rather than paid tiers.",
      "toolB": "Repurpose.io starts at $35/month (Starter, 3 account connections per network, 5,000 published videos/month) and scales to $79/month (Pro) and $179/month (Agency, 25 account connections), with a 14-day free trial requiring no credit card.",
      "whyItMatters": "Repurpose.io is a recurring operating cost tied to volume and client count, while Mastodon has no licensing cost at all.",
      "benefitsWho": "Budget-conscious solo creators (Mastodon) versus agencies managing multiple client accounts who can justify Repurpose.io's tiered pricing."
    },
    {
      "title": "Self-Hosting",
      "toolA": "Mastodon can be fully self-hosted, giving the operator complete control over data and moderation, though this requires server administration skills.",
      "toolB": "Repurpose.io is not documented as self-hostable; it is a hosted SaaS automation service.",
      "whyItMatters": "Organizations with data-sovereignty requirements have a documented self-hosting path only with Mastodon.",
      "benefitsWho": "Privacy-focused communities and organizations that want to own their social infrastructure."
    },
    {
      "title": "Destination Platform Coverage",
      "toolA": "Mastodon interoperates with other ActivityPub fediverse platforms, but is not documented as cross-posting to closed platforms like TikTok or Instagram.",
      "toolB": "Repurpose.io connects to YouTube, TikTok, Instagram, Facebook, Snapchat, Pinterest, LinkedIn, X, Twitch, Google Drive, and Dropbox — 15+ destinations documented — but Mastodon is not listed among them.",
      "whyItMatters": "Creators wanting Mastodon included in an automated cross-posting pipeline will need a workaround, since it isn't a documented Repurpose.io destination.",
      "benefitsWho": "Multi-platform creators mapping out exactly which networks an automation tool will and won't reach."
    },
    {
      "title": "Content Handling",
      "toolA": "Mastodon supports posting rich media (images, video, audio, polls) directly with content warnings and alt-text accessibility tools, but does not reformat or resize content for other platforms.",
      "toolB": "Repurpose.io auto-resizes video dimensions per destination platform, removes source watermarks, and can turn long-form video into short clips for distribution.",
      "whyItMatters": "Only Repurpose.io does the technical reformatting work needed to make one video look native on many different platforms.",
      "benefitsWho": "Video creators repurposing long-form content (podcasts, streams, YouTube videos) into short-form clips for multiple networks."
    }
  ],
  "featureMatrix": [
    {
      "group": "Publishing Model",
      "rows": [
        {
          "feature": "Original posting / social network",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Repurpose.io redistributes existing content; it isn't a network."
        },
        {
          "feature": "Automated cross-posting to other platforms",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Auto-resize video per destination",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Watermark removal",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Long-to-short video clipping",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Access & Cost",
      "rows": [
        {
          "feature": "Free to use",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Repurpose.io starts at $35/month after a 14-day trial."
        },
        {
          "feature": "Self-hosted deployment",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Free trial",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "14 days, no credit card required."
        }
      ]
    },
    {
      "group": "Community & Reach",
      "rows": [
        {
          "feature": "Federated / ActivityPub interoperability",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "15+ destination platform connections",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Official mobile apps",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Mastodon: official iOS and Android apps."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Mastodon a competitor to Repurpose.io?",
      "answer": "No. Mastodon is a social network people post to directly, while Repurpose.io is an automation tool that redistributes existing video/audio content to other platforms. They address different steps of a content workflow."
    },
    {
      "question": "Can Repurpose.io post content to Mastodon?",
      "answer": "This is not documented. Repurpose.io's listed destination platforms include YouTube, TikTok, Instagram, Facebook, Snapchat, Pinterest, LinkedIn, X, and Twitch, but Mastodon is not among them."
    },
    {
      "question": "Is Mastodon really free?",
      "answer": "Yes. Mastodon is entirely free and open-source software, sustained by donations rather than paid subscription tiers."
    },
    {
      "question": "How much does Repurpose.io cost?",
      "answer": "Plans start at $35/month (Starter) and go up to $179/month (Agency) on monthly billing, with roughly 17% savings on annual billing, plus a 14-day free trial that requires no credit card."
    },
    {
      "question": "Can I self-host Mastodon?",
      "answer": "Yes. Anyone can self-host their own Mastodon instance for full control over data and moderation, or join an existing public server such as mastodon.social."
    },
    {
      "question": "Does Repurpose.io require manual work once set up?",
      "answer": "No. It monitors the source platform and automatically republishes new content to connected destinations without manual action once configured."
    }
  ]
};

export default mastodonVsRepurposeIoContent;
