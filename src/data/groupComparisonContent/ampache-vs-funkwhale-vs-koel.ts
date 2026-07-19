import type { GroupComparisonContent } from './types';

const ampacheVsFunkwhaleVsKoelContent: GroupComparisonContent = {
  "verdict": "Ampache, Funkwhale, and Koel are all free, self-hosted alternatives to commercial music streaming, but they optimize for different things. Ampache is the most format-agnostic and broadly client-compatible of the three since it also streams video and speaks Subsonic, UPnP/DLNA, and DAAP; Funkwhale is the only one built around ActivityPub federation, letting separate installations interconnect like email; and Koel offers the most polished, dedicated mobile experience with native iOS and Android apps plus an optional one-time-purchase upgrade for multi-user setups. The right pick depends on whether you value client compatibility, federated community discovery, or a modern app-first interface more.",
  "bestFor": {
    "ampache": "Self-hosters with a mixed music and video collection who want the widest possible client compatibility through Subsonic, UPnP/DLNA, and DAAP support.",
    "funkwhale": "Communities, netlabels, or Fediverse users who want a federated music and podcast pod that can interconnect and share content with other Funkwhale installations rather than run as an isolated personal jukebox.",
    "koel": "Users who want a modern, Spotify-like interface with dedicated native iOS and Android apps, and who are open to a one-time Koel Plus purchase later if they need multi-user libraries or cloud storage."
  },
  "highlights": [
    {
      "title": "Only Funkwhale federates across servers",
      "description": "Funkwhale's ActivityPub integration lets independent installations, called pods, follow each other, share libraries, and interconnect the way Mastodon instances do, a capability neither Ampache nor Koel offers.",
      "toolSlugs": [
        "funkwhale"
      ]
    },
    {
      "title": "Ampache is the broadest client and format play",
      "description": "Ampache is the only one of the three that streams both music and video, and it supports Subsonic, UPnP/DLNA, and DAAP simultaneously, giving it the largest range of compatible third-party apps and devices.",
      "toolSlugs": [
        "ampache"
      ]
    },
    {
      "title": "Koel has the most dedicated native mobile apps",
      "description": "Koel ships its own purpose-built Koel Player apps for iOS and Android, while Ampache relies entirely on third-party Subsonic clients and Funkwhale's official mobile presence is Android-only via F-Droid.",
      "toolSlugs": [
        "koel",
        "ampache",
        "funkwhale"
      ]
    },
    {
      "title": "All three cores are free forever, but only Koel sells an upgrade",
      "description": "Ampache and Funkwhale have no paid tier at all beyond optional third-party managed hosting for Funkwhale, whereas Koel's Community edition is free but Koel Plus is available as a one-time, pay-what-you-want purchase for multi-user and cloud-storage features.",
      "toolSlugs": [
        "koel",
        "ampache",
        "funkwhale"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Client and Access Compatibility",
      "rows": [
        {
          "feature": "Subsonic/OpenSubsonic API support",
          "statuses": {
            "ampache": "available",
            "funkwhale": "not-documented",
            "koel": "available"
          },
          "note": "Ampache and Koel both expose Subsonic-compatible endpoints; Funkwhale's provided data does not mention Subsonic compatibility."
        },
        {
          "feature": "Official native mobile app",
          "statuses": {
            "ampache": "unavailable",
            "funkwhale": "limited",
            "koel": "available"
          },
          "note": "Ampache depends on third-party Subsonic clients; Funkwhale ships an official Android app only; Koel has native iOS and Android apps."
        },
        {
          "feature": "UPnP/DLNA and DAAP (iTunes) support",
          "statuses": {
            "ampache": "available",
            "funkwhale": "not-documented",
            "koel": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Content Scope",
      "rows": [
        {
          "feature": "Video streaming alongside music",
          "statuses": {
            "ampache": "available",
            "funkwhale": "unavailable",
            "koel": "unavailable"
          }
        },
        {
          "feature": "Podcast support",
          "statuses": {
            "ampache": "not-documented",
            "funkwhale": "available",
            "koel": "available"
          }
        },
        {
          "feature": "Federated cross-server content (ActivityPub)",
          "statuses": {
            "ampache": "unavailable",
            "funkwhale": "available",
            "koel": "unavailable"
          }
        }
      ]
    },
    {
      "group": "Collaboration and Growth",
      "rows": [
        {
          "feature": "Multi-user or per-user libraries",
          "statuses": {
            "ampache": "not-documented",
            "funkwhale": "not-documented",
            "koel": "limited"
          },
          "note": "Koel gates individual per-user libraries behind the paid Koel Plus tier."
        },
        {
          "feature": "External metadata enrichment (MusicBrainz, Last.fm, Spotify, YouTube)",
          "statuses": {
            "ampache": "not-documented",
            "funkwhale": "not-documented",
            "koel": "available"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Do Ampache, Funkwhale, or Koel cost anything to use?",
      "answer": "All three are free and open source at their core. Ampache and Funkwhale have no paid tier at all beyond optional infrastructure or third-party managed hosting costs. Koel's Community edition is also free, with an optional one-time-purchase Koel Plus upgrade starting from EUR 19.99 for multi-user and cloud-storage features."
    },
    {
      "question": "Which of these three supports podcasts, not just music?",
      "answer": "Funkwhale and Koel both support podcasts. Ampache's provided feature set focuses on music and video streaming and does not document podcast support."
    },
    {
      "question": "Which one has the best mobile app experience?",
      "answer": "Koel ships its own native Koel Player apps for iOS and Android. Funkwhale offers an official Android app distributed through F-Droid but no official iOS client. Ampache has no first-party mobile app and instead relies on third-party Subsonic-compatible apps like DSub or Substreamer."
    },
    {
      "question": "What does Funkwhale's federation actually mean in practice?",
      "answer": "Funkwhale integrates ActivityPub, the same protocol behind Mastodon, so separate Funkwhale installations (pods) run by different people or communities can interconnect: users can follow artists, channels, and playlists hosted on another pod and share libraries across server boundaries, similar to how email works across providers."
    },
    {
      "question": "Can I stream video, not just music, with any of these?",
      "answer": "Only Ampache supports both music and video streaming from the same self-hosted server. Funkwhale and Koel are audio-focused, covering music, radio, and podcasts."
    },
    {
      "question": "Do these tools work with existing Subsonic-compatible apps?",
      "answer": "Ampache and Koel both implement the Subsonic API, so they work with the large existing ecosystem of Subsonic-compatible mobile and desktop clients. The provided data does not document Subsonic API support for Funkwhale, whose primary interoperability model is ActivityPub federation instead."
    }
  ]
};

export default ampacheVsFunkwhaleVsKoelContent;
