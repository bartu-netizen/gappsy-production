import type { GroupComparisonContent } from './types';

const embyVsKodiVsPlexContent: GroupComparisonContent = {
  "verdict": "Kodi, Emby, and Plex all organize and play a personal media library, but they represent three different philosophies. Kodi is a completely free, fully open-source, deeply customizable media center built by volunteers, with no built-in remote streaming and a steeper setup curve. Emby and Plex are both freemium client-server platforms with polished remote streaming built in, gating extras like hardware transcoding and Live TV/DVR behind a paid Premiere or Pass tier. The choice depends on whether you want maximum customization and zero cost (Kodi), a cheap one-time lifetime unlock (Emby), or the most consumer-ready experience with active ongoing development (Plex).",
  "bestFor": {
    "emby": "Users who want a client-server media server with built-in remote streaming and are willing to pay a low, one-time lifetime fee ($119) for extras like Live TV/DVR and hardware transcoding.",
    "kodi": "Technically confident home theater enthusiasts who want a completely free, fully open-source, heavily customizable media center and don't mind configuring add-ons for features like remote access.",
    "plex": "Users who want the most polished, ready-to-use interface with reliable built-in remote streaming and don't mind paying for a Plex Pass to unlock hardware transcoding and Live TV/DVR."
  },
  "highlights": [
    {
      "title": "Kodi is the only fully free, open-source option with no paid tier",
      "description": "Kodi has a single free edition under the GPL with no premium subscription, developed entirely by volunteers under the nonprofit XBMC Foundation, while Emby and Plex both reserve some features for a paid Premiere or Pass tier.",
      "toolSlugs": [
        "kodi"
      ]
    },
    {
      "title": "Emby and Plex include built-in remote streaming; Kodi needs add-ons for it",
      "description": "Emby and Plex are architected as client-server platforms designed to stream a personal library to any device out of the box, while Kodi's own documented cons note there is no official remote-streaming or cloud access without third-party add-ons.",
      "toolSlugs": [
        "emby",
        "plex",
        "kodi"
      ]
    },
    {
      "title": "Kodi offers the deepest customization through its add-on and skin ecosystem",
      "description": "Kodi supports a massive, community-built library of add-ons, skins, and PVR backends that let users reshape the entire interface and add functionality, a level of extensibility not documented for Emby or Plex.",
      "toolSlugs": [
        "kodi"
      ]
    },
    {
      "title": "Emby's lifetime purchase is far cheaper than Plex's 2026 lifetime price",
      "description": "Emby Premiere's one-time lifetime purchase is $119, while Plex Pass Lifetime rose sharply to roughly $749.99 in 2026, making Emby the cheaper path to a permanent premium unlock between the two paid options.",
      "toolSlugs": [
        "emby",
        "plex"
      ]
    },
    {
      "title": "Plex offers the most actively developed, consumer-polished experience",
      "description": "Plex's pros highlight active development with regular new features and polished, consistent apps across smart TVs, mobile, web, and consoles, a level of day-one polish that Kodi's community-run, more utilitarian interface does not target.",
      "toolSlugs": [
        "plex"
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
            "kodi": "available",
            "plex": "unavailable"
          },
          "note": "Kodi has no premium tier at all; Emby and Plex both gate some features behind a paid subscription."
        },
        {
          "feature": "Fully open-source codebase",
          "statuses": {
            "emby": "unavailable",
            "kodi": "available",
            "plex": "unavailable"
          },
          "note": "Kodi is GPL-licensed and governed by the nonprofit XBMC Foundation; Emby went closed-source in 2018 and Plex is proprietary."
        },
        {
          "feature": "One-time lifetime purchase for premium features",
          "statuses": {
            "emby": "available",
            "kodi": "unavailable",
            "plex": "available"
          },
          "note": "Kodi has no paid tier to purchase a lifetime unlock for, since all functionality is already free."
        }
      ]
    },
    {
      "group": "Streaming and Live TV",
      "rows": [
        {
          "feature": "Built-in remote/internet streaming without third-party add-ons",
          "statuses": {
            "emby": "available",
            "kodi": "limited",
            "plex": "available"
          },
          "note": "Kodi's own documented cons state it has no official remote-streaming or cloud access without third-party add-ons."
        },
        {
          "feature": "Live TV and DVR support",
          "statuses": {
            "emby": "limited",
            "kodi": "available",
            "plex": "limited"
          },
          "note": "Free via PVR add-ons in Kodi; gated behind a paid Premiere or Pass subscription in Emby and Plex."
        },
        {
          "feature": "Hardware-accelerated transcoding",
          "statuses": {
            "emby": "limited",
            "kodi": "not-documented",
            "plex": "limited"
          },
          "note": "A paid-tier feature for Emby and Plex; not confirmed one way or the other for Kodi in the provided data."
        }
      ]
    },
    {
      "group": "Customization and Platform Reach",
      "rows": [
        {
          "feature": "Extensive add-on and skin ecosystem",
          "statuses": {
            "emby": "not-documented",
            "kodi": "available",
            "plex": "not-documented"
          },
          "note": "Kodi's pros specifically cite a massive add-on ecosystem for deep customization; this is not documented as a feature for Emby or Plex."
        },
        {
          "feature": "Wide native client platform coverage",
          "statuses": {
            "emby": "available",
            "kodi": "available",
            "plex": "available"
          },
          "note": "All three run across desktop, mobile, and TV-oriented platforms, though the exact device lists differ."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of Emby, Kodi, and Plex is completely free?",
      "answer": "Kodi is the only one of the three with no paid tier whatsoever; Emby and Plex are both freemium, with a paid Premiere or Pass subscription unlocking extras like Live TV/DVR and hardware transcoding."
    },
    {
      "question": "Can I stream my Kodi library remotely over the internet like I can with Plex or Emby?",
      "answer": "Not out of the box. Kodi's documented cons note that it has no official remote-streaming or cloud access without relying on third-party add-ons, while Emby and Plex both support remote streaming as a core, built-in feature."
    },
    {
      "question": "How does Emby's lifetime pricing compare to Plex's?",
      "answer": "Emby Premiere offers a one-time lifetime purchase for $119, while Plex Pass Lifetime was raised to roughly $749.99 in 2026, making Emby considerably cheaper for a permanent unlock. Kodi has no paid tier to compare since everything is free."
    },
    {
      "question": "Is Kodi harder to set up than Emby or Plex?",
      "answer": "Based on its documented cons, Kodi has a steeper learning curve than consumer apps like Plex and can feel dated compared to modern streaming apps, whereas Emby and Plex are built as more turnkey client-server platforms."
    },
    {
      "question": "Which option offers the most customization?",
      "answer": "Kodi, through its extensive add-on and skin ecosystem, which lets users change themes, add video and audio plugins, and extend functionality well beyond what is documented for Emby or Plex."
    },
    {
      "question": "Do all three support Live TV and DVR?",
      "answer": "Yes, but the cost differs: Kodi supports Live TV and DVR for free through PVR add-ons, while Emby and Plex both restrict this feature to their paid Premiere or Pass subscriptions."
    }
  ]
};

export default embyVsKodiVsPlexContent;
