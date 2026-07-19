import type { GroupComparisonContent } from './types';

const embyVsJellyfinVsKodiContent: GroupComparisonContent = {
  "verdict": "Emby, Jellyfin, and Kodi are all long-standing, commonly compared options for self-hosting a personal movie, TV, and music library, but they represent three different design philosophies. Jellyfin was directly forked from Emby's codebase in 2018 and stayed fully free and open source, while Emby kept a closed-source, freemium model with a paid Premiere tier. Kodi differs architecturally from both, traditionally running on the playback device itself with a massive add-on ecosystem rather than acting as a central streaming server. The best choice depends on whether someone wants a polished client-server experience, a fully free client-server alternative, or maximum on-device customization.",
  "bestFor": {
    "emby": "Users who want a polished, commercially developed media server with optional Live TV/DVR and hardware transcoding, including a one-time lifetime purchase option for Premiere",
    "jellyfin": "Privacy-conscious self-hosters who want a fully free, open-source, client-server media server with every feature unlocked and no mandatory account",
    "kodi": "Home theater PC and set-top-box enthusiasts who want a highly customizable, on-device media center with the deepest add-on and skin ecosystem of the three"
  },
  "highlights": [
    {
      "title": "Jellyfin was forked directly from Emby",
      "description": "Jellyfin began in December 2018 as a fork of Emby's 3.5.2 codebase, created in direct response to Emby moving its upcoming release closed-source, and it has remained fully open source ever since.",
      "toolSlugs": [
        "emby",
        "jellyfin"
      ]
    },
    {
      "title": "Different architectures for reaching devices",
      "description": "Emby and Jellyfin use a client-server model where a central server streams to many remote devices. Kodi is traditionally installed and run directly on the playback device itself, though it can browse network shares or connect to an existing Plex or Jellyfin server via add-ons.",
      "toolSlugs": [
        "emby",
        "jellyfin",
        "kodi"
      ]
    },
    {
      "title": "Only Emby has a paid tier",
      "description": "Jellyfin and Kodi are both fully open source with no paid tier of any kind. Emby remains closed-source since 2018 and gates features like Live TV/DVR, hardware transcoding, and mobile sync behind its Emby Premiere subscription.",
      "toolSlugs": [
        "emby",
        "jellyfin",
        "kodi"
      ]
    },
    {
      "title": "Kodi's add-on ecosystem is the deepest of the three",
      "description": "Kodi's add-on repository lets users install skins, video and audio plugins, and PVR backends, giving it a level of customization depth that neither Emby's nor Jellyfin's plugin systems match.",
      "toolSlugs": [
        "kodi"
      ]
    },
    {
      "title": "Emby offers a lifetime purchase option",
      "description": "Emby Premiere can be bought as a $119 one-time lifetime purchase in addition to monthly and annual billing, an option that isn't relevant to Jellyfin or Kodi since both are entirely free with no premium tier to unlock.",
      "toolSlugs": [
        "emby"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Server and Streaming",
      "rows": [
        {
          "feature": "Client-server remote streaming to many devices",
          "statuses": {
            "emby": "available",
            "jellyfin": "available",
            "kodi": "limited"
          },
          "note": "Kodi traditionally runs on the playback device itself rather than acting as a central streaming server, though add-ons can bridge to network shares or other servers."
        },
        {
          "feature": "Hardware-accelerated transcoding",
          "statuses": {
            "emby": "limited",
            "jellyfin": "available",
            "kodi": "not-documented"
          },
          "note": "Emby requires an Emby Premiere subscription for hardware-accelerated transcoding; Jellyfin includes it free."
        },
        {
          "feature": "Live TV and DVR",
          "statuses": {
            "emby": "limited",
            "jellyfin": "available",
            "kodi": "available"
          },
          "note": "Emby requires Premiere for Live TV/DVR; Jellyfin includes it free; Kodi supports it via PVR add-ons connected to tuner hardware."
        }
      ]
    },
    {
      "group": "Cost and Licensing",
      "rows": [
        {
          "feature": "Free core functionality",
          "statuses": {
            "emby": "available",
            "jellyfin": "available",
            "kodi": "available"
          }
        },
        {
          "feature": "Paid premium tier",
          "statuses": {
            "emby": "available",
            "jellyfin": "unavailable",
            "kodi": "unavailable"
          }
        },
        {
          "feature": "Open-source codebase",
          "statuses": {
            "emby": "unavailable",
            "jellyfin": "available",
            "kodi": "available"
          },
          "note": "Emby moved from open-source to closed-source licensing in 2018."
        }
      ]
    },
    {
      "group": "Customization and Clients",
      "rows": [
        {
          "feature": "Native mobile and TV apps",
          "statuses": {
            "emby": "available",
            "jellyfin": "available",
            "kodi": "available"
          }
        },
        {
          "feature": "Plugin/add-on ecosystem",
          "statuses": {
            "emby": "limited",
            "jellyfin": "available",
            "kodi": "available"
          },
          "note": "Kodi's add-on repository is notably broader, covering skins, PVR backends, and third-party video/audio plugins."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Jellyfin really free with no hidden paid tier?",
      "answer": "Yes. Jellyfin is fully open source under the GPLv2 license with no company behind it, no subscription, and no paywalled features; every capability, including hardware transcoding and Live TV/DVR, is available for free."
    },
    {
      "question": "What's the main architectural difference between Kodi and Emby or Jellyfin?",
      "answer": "Emby and Jellyfin use a client-server model where a central server streams a library to many remote devices. Kodi is traditionally installed and run directly on the playback device itself, though add-ons let it browse network shares or connect to an existing Plex or Jellyfin server."
    },
    {
      "question": "Why does Jellyfin exist as a separate project from Emby?",
      "answer": "Jellyfin was created in December 2018 when a group of users forked Emby's codebase after Emby announced its upcoming 4.x release would go closed-source, combined with prior licensing concerns and a desire for a fully open, community-governed alternative."
    },
    {
      "question": "Does Kodi support Live TV like Emby and Jellyfin do?",
      "answer": "Yes. Kodi supports live TV and DVR functionality through PVR add-ons connected to tuner hardware, similar in capability to Jellyfin's built-in Live TV/DVR support and Emby's Premiere-gated Live TV/DVR feature."
    },
    {
      "question": "Which of these three offers a one-time lifetime purchase?",
      "answer": "Emby is the only one with a lifetime purchase option, a $119 one-time payment for Emby Premiere. Jellyfin and Kodi have no premium tier to buy since both are entirely free."
    },
    {
      "question": "Can Kodi connect to a Plex or Jellyfin server instead of playing local files?",
      "answer": "Yes. While Kodi is traditionally used as an on-device player for local or network media, add-ons exist that let it browse and stream from an existing Plex or Jellyfin server."
    }
  ]
};

export default embyVsJellyfinVsKodiContent;
