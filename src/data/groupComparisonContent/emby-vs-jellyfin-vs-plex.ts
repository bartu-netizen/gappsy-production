import type { GroupComparisonContent } from './types';

const embyVsJellyfinVsPlexContent: GroupComparisonContent = {
  "verdict": "Emby, Jellyfin, and Plex are the three most-compared personal media server platforms, and the right pick hinges on how much you value cost versus openness versus polish. Jellyfin is the only one of the three with zero paywalled features, making it the natural fit for privacy-conscious self-hosters who want everything free forever. Emby and Plex both run a freemium model with a paid unlock for hardware transcoding, Live TV/DVR, and offline sync, but Emby's one-time lifetime price is dramatically cheaper than Plex's after Plex's steep 2026 lifetime price increase, while Plex uniquely adds a free ad-supported streaming catalog on top of your own library. No single tool wins on every axis, so the decision comes down to whether openness, price, or day-one polish matters most to you.",
  "bestFor": {
    "emby": "Households that want premium features like hardware transcoding and Live TV/DVR but prefer a low-cost, one-time lifetime purchase ($119) over an ongoing subscription and are not committed to using only open-source software.",
    "jellyfin": "Privacy-conscious self-hosters and home-lab enthusiasts who want every feature, including hardware transcoding and Live TV/DVR, included free forever with no account, telemetry, or paywall.",
    "plex": "Users who want the most polished, consistent cross-device experience and also want free ad-supported movies and TV shows layered on top of their own personal media library."
  },
  "highlights": [
    {
      "title": "Jellyfin is the only fully free option with no paid tier at all",
      "description": "Jellyfin ships as a single free, open-source edition under GPLv2 with no Premiere or Pass equivalent, so features like hardware-accelerated transcoding and Live TV/DVR that Emby and Plex gate behind a paid subscription are included for every Jellyfin user at no cost.",
      "toolSlugs": [
        "jellyfin"
      ]
    },
    {
      "title": "Plex is the only one with free licensed streaming content",
      "description": "Beyond streaming your own personal library, Plex layers on a free, ad-supported catalog of licensed movies and TV shows from studios like Warner Bros., MGM, and Lionsgate, a feature Emby and Jellyfin do not offer.",
      "toolSlugs": [
        "plex"
      ]
    },
    {
      "title": "Emby's lifetime price is far below Plex's 2026 lifetime price",
      "description": "Emby Premiere offers a one-time lifetime purchase at $119, while Plex Pass Lifetime was raised sharply to roughly $749.99 in 2026, making Emby's one-time option a much cheaper path to permanent premium features.",
      "toolSlugs": [
        "emby",
        "plex"
      ]
    },
    {
      "title": "Both Emby and Plex gate hardware transcoding and Live TV behind a subscription",
      "description": "Emby requires Emby Premiere and Plex requires Plex Pass to unlock hardware-accelerated transcoding and Live TV/DVR, while Jellyfin includes both in its always-free edition.",
      "toolSlugs": [
        "emby",
        "plex",
        "jellyfin"
      ]
    },
    {
      "title": "Plex and Emby offer broader native client coverage out of the box",
      "description": "Emby lists native apps spanning Apple TV, Roku, Fire TV, Chromecast, PlayStation, Xbox, and smart TVs, and Plex's pros highlight consistent apps across smart TVs, mobile, web, and consoles, while Jellyfin's documented client list centers on Android TV, Fire TV, Roku, and tvOS alongside its desktop and mobile apps.",
      "toolSlugs": [
        "emby",
        "plex",
        "jellyfin"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Licensing and Cost Model",
      "rows": [
        {
          "feature": "Completely free with no paid tier",
          "statuses": {
            "emby": "unavailable",
            "jellyfin": "available",
            "plex": "unavailable"
          },
          "note": "Emby and Plex both reserve some features for a paid Premiere or Pass subscription; Jellyfin has only one free edition."
        },
        {
          "feature": "Fully open-source codebase",
          "statuses": {
            "emby": "unavailable",
            "jellyfin": "available",
            "plex": "unavailable"
          },
          "note": "Emby moved to closed-source licensing in 2018; Plex has always been proprietary; Jellyfin is released under GPLv2."
        },
        {
          "feature": "One-time lifetime purchase option",
          "statuses": {
            "emby": "available",
            "jellyfin": "unavailable",
            "plex": "available"
          },
          "note": "Emby's lifetime tier is $119 versus Plex's $749.99; Jellyfin has no paid tier to purchase a lifetime unlock for."
        }
      ]
    },
    {
      "group": "Streaming and Playback Features",
      "rows": [
        {
          "feature": "Hardware-accelerated transcoding",
          "statuses": {
            "emby": "limited",
            "jellyfin": "available",
            "plex": "limited"
          },
          "note": "Gated behind Emby Premiere and Plex Pass; included free in Jellyfin."
        },
        {
          "feature": "Live TV and DVR",
          "statuses": {
            "emby": "limited",
            "jellyfin": "available",
            "plex": "limited"
          },
          "note": "A Premiere/Pass feature for Emby and Plex; free in Jellyfin."
        },
        {
          "feature": "Offline mobile sync for downloads",
          "statuses": {
            "emby": "limited",
            "jellyfin": "not-documented",
            "plex": "limited"
          },
          "note": "Listed as a paid-tier feature for Emby Premiere and Plex Pass; not confirmed one way or the other for Jellyfin in the provided data."
        },
        {
          "feature": "Free ad-supported licensed streaming catalog",
          "statuses": {
            "emby": "unavailable",
            "jellyfin": "unavailable",
            "plex": "available"
          },
          "note": "Unique to Plex; Emby and Jellyfin only stream a user's own personal media library."
        }
      ]
    },
    {
      "group": "Platform and Ecosystem",
      "rows": [
        {
          "feature": "Wide native client apps (smart TVs, consoles, mobile, web)",
          "statuses": {
            "emby": "available",
            "jellyfin": "available",
            "plex": "available"
          },
          "note": "All three ship native apps across most major platforms, though the specific device lists differ slightly."
        },
        {
          "feature": "Community plugin architecture",
          "statuses": {
            "emby": "not-documented",
            "jellyfin": "available",
            "plex": "not-documented"
          },
          "note": "Jellyfin explicitly documents a plugin system for subtitles and metadata providers; this is not confirmed for Emby or Plex in the provided data."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of Emby, Jellyfin, and Plex is completely free with no paid tier?",
      "answer": "Jellyfin is the only one of the three with no paid subscription or premium tier at all; every feature, including hardware transcoding and Live TV/DVR, is included free."
    },
    {
      "question": "Do I need to pay to use Plex or Emby at all?",
      "answer": "No, both Plex and Emby offer a free core tier for personal media streaming. You only need Plex Pass or Emby Premiere to unlock extras like hardware-accelerated transcoding, Live TV/DVR, and offline mobile sync."
    },
    {
      "question": "How does Emby's lifetime pricing compare to Plex's?",
      "answer": "Emby Premiere offers a one-time lifetime purchase for $119, while Plex Pass Lifetime was raised to roughly $749.99 in 2026, making Emby's lifetime option considerably cheaper for buyers who want permanent access without a subscription."
    },
    {
      "question": "Can I watch movies and shows I don't already own on any of these?",
      "answer": "Only Plex offers this, through its free, ad-supported catalog of licensed movies and TV shows. Emby and Jellyfin are strictly for streaming your own personal media library."
    },
    {
      "question": "Which option is best for someone who cares about open-source software and privacy?",
      "answer": "Jellyfin is the clear choice here since it is fully open source under GPLv2, requires no mandatory account, and collects no telemetry, unlike the closed-source Emby and proprietary Plex."
    },
    {
      "question": "Do all three require me to run my own server?",
      "answer": "Yes, Emby, Jellyfin, and Plex are all self-hosted media servers that need to run on your own computer, NAS, or dedicated hardware; none of them store or host your media in the cloud for you."
    }
  ]
};

export default embyVsJellyfinVsPlexContent;
