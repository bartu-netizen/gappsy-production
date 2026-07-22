import type { GroupComparisonContent } from './types';

const jellyfinVsKodiVsPlexContent: GroupComparisonContent = {
  "verdict": "Jellyfin, Kodi, and Plex are three of the most commonly compared options for building a self-hosted home media setup, but they sit at different points on the openness-versus-polish spectrum. Jellyfin and Kodi are both fully open source with no paid tier, while Plex is a commercial company whose free core server is paired with an increasingly expensive Plex Pass subscription and a bonus ad-supported streaming catalog. Kodi further stands apart architecturally as an on-device player rather than a client-server system. The right pick depends on whether cost, openness, or polish and bonus content matters most.",
  "bestFor": {
    "jellyfin": "Self-hosters who want a fully free, open-source, client-server media server with every feature unlocked and no mandatory account or telemetry",
    "kodi": "Home theater PC and set-top-box enthusiasts who want maximum on-device customization through Kodi's deep add-on and skin ecosystem",
    "plex": "Users who want the most consumer-polished apps plus a free, ad-supported streaming catalog layered on top of their own personal library"
  },
  "highlights": [
    {
      "title": "Plex's lifetime price jumped sharply in 2026",
      "description": "Plex Pass Lifetime rose to roughly $749.99 in mid-2026, while Jellyfin and Kodi remain entirely free with no paid tier at any price point.",
      "toolSlugs": [
        "plex",
        "jellyfin",
        "kodi"
      ]
    },
    {
      "title": "Plex uniquely bundles free licensed streaming content",
      "description": "Alongside personal library streaming, Plex offers a separate free, ad-supported catalog of licensed movies and TV shows from studios like Warner Bros. and Lionsgate, something Jellyfin and Kodi don't offer since neither licenses commercial content.",
      "toolSlugs": [
        "plex"
      ]
    },
    {
      "title": "Kodi is architecturally the odd one out",
      "description": "Jellyfin and Plex both use a client-server model streaming a library to many devices. Kodi is traditionally installed and run directly on the playback device itself, though add-ons can connect it to network shares or an existing Plex or Jellyfin server.",
      "toolSlugs": [
        "jellyfin",
        "plex",
        "kodi"
      ]
    },
    {
      "title": "Openness and governance differ sharply",
      "description": "Jellyfin and Kodi are fully open source and community-governed with no company or mandatory account behind them. Plex is a commercial company (Plex Inc., Campbell, California) with account-based cloud features and a subscription business model.",
      "toolSlugs": [
        "jellyfin",
        "kodi",
        "plex"
      ]
    },
    {
      "title": "Kodi's add-on ecosystem is the deepest for customization",
      "description": "Kodi's add-on repository covers skins, video and audio plugins, and PVR backends at a depth neither Jellyfin's plugin architecture nor Plex's more limited third-party add-ons match.",
      "toolSlugs": [
        "kodi"
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
            "jellyfin": "available",
            "kodi": "limited",
            "plex": "available"
          },
          "note": "Kodi traditionally runs on the playback device itself rather than acting as a central streaming server."
        },
        {
          "feature": "Hardware-accelerated transcoding",
          "statuses": {
            "jellyfin": "available",
            "kodi": "not-documented",
            "plex": "limited"
          },
          "note": "Plex requires a Plex Pass subscription for hardware-accelerated transcoding; Jellyfin includes it free."
        },
        {
          "feature": "Live TV and DVR",
          "statuses": {
            "jellyfin": "available",
            "kodi": "available",
            "plex": "available"
          },
          "note": "Kodi requires PVR add-ons connected to tuner hardware; Jellyfin and Plex include Live TV/DVR natively."
        }
      ]
    },
    {
      "group": "Cost and Access",
      "rows": [
        {
          "feature": "Free core functionality",
          "statuses": {
            "jellyfin": "available",
            "kodi": "available",
            "plex": "available"
          }
        },
        {
          "feature": "Paid premium tier",
          "statuses": {
            "jellyfin": "unavailable",
            "kodi": "unavailable",
            "plex": "available"
          },
          "note": "Plex Pass unlocks hardware transcoding, offline sync, and advanced parental controls."
        },
        {
          "feature": "Free licensed streaming catalog",
          "statuses": {
            "jellyfin": "unavailable",
            "kodi": "unavailable",
            "plex": "available"
          }
        }
      ]
    },
    {
      "group": "Openness and Extensibility",
      "rows": [
        {
          "feature": "Open-source codebase",
          "statuses": {
            "jellyfin": "available",
            "kodi": "available",
            "plex": "unavailable"
          }
        },
        {
          "feature": "Plugin/add-on ecosystem",
          "statuses": {
            "jellyfin": "available",
            "kodi": "available",
            "plex": "limited"
          },
          "note": "Kodi's add-on repository is notably broader than Jellyfin's plugin architecture or Plex's more limited third-party add-ons."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Jellyfin a good free replacement for Plex?",
      "answer": "For many users, yes. Jellyfin covers the same core client-server streaming, metadata scraping, and Live TV/DVR functionality as Plex but is fully open source with no paid tier, so features gated behind Plex Pass, like hardware transcoding, are free in Jellyfin."
    },
    {
      "question": "How much does Plex Pass Lifetime cost now?",
      "answer": "Plex raised its Plex Pass Lifetime price sharply to roughly $749.99 in mid-2026, alongside introducing a new 5-year plan option. Jellyfin and Kodi have no equivalent cost since both are entirely free."
    },
    {
      "question": "Does Kodi work the same way as Plex?",
      "answer": "No. Plex uses a client-server model where a central Plex Media Server streams to remote devices. Kodi is traditionally installed and run directly on the playback device itself, though add-ons can let it browse network shares or connect to an existing Plex or Jellyfin server."
    },
    {
      "question": "Can I watch free movies and TV shows on Plex without paying?",
      "answer": "Yes. Plex offers a separate free, ad-supported streaming catalog of licensed movies and TV shows from studios like Warner Bros., MGM, and Lionsgate, in addition to streaming your own personal media library. Jellyfin and Kodi don't offer licensed streaming content."
    },
    {
      "question": "Which of these three is fully open source?",
      "answer": "Jellyfin and Kodi are both fully open source with community governance and no company behind them. Plex is closed-source and developed by the commercial company Plex Inc."
    },
    {
      "question": "Do all three support Live TV and DVR?",
      "answer": "Yes, all three support Live TV and DVR. Jellyfin and Plex include it as a built-in feature, while Kodi requires installing PVR add-ons connected to tuner hardware or IPTV sources."
    }
  ]
};

export default jellyfinVsKodiVsPlexContent;
