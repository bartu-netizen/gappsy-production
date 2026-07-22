import type { GroupComparisonContent } from './types';

const ardourVsAudacityVsTenacityContent: GroupComparisonContent = {
  "verdict": "Ardour, Audacity, and Tenacity are all free, open-source, cross-platform audio editors, but they serve different levels of ambition. Ardour is a full professional DAW with MIDI recording, flexible routing, and video sync built for serious music production, while Audacity remains the default, most widely used free audio editor with the biggest plugin ecosystem and optional AI-assisted effects. Tenacity is essentially Audacity's workflow rebuilt by a volunteer community that split off specifically to avoid Muse Group's ownership and telemetry concerns, trading some feature velocity for a smaller, privacy-focused governance model.",
  "bestFor": {
    "ardour": "Musicians, composers, and audio engineers who need a full multi-track DAW with MIDI recording, any-to-any routing, plugin depth, and video timeline sync for professional recording and mixing.",
    "audacity": "Podcasters, voice-over artists, and hobbyists who want the most established free audio editor, with the widest plugin support and optional AI-assisted effects through Muse Hub.",
    "tenacity": "Privacy-conscious users who want an Audacity-style editing workflow without Muse Group's corporate ownership or built-in telemetry concerns."
  },
  "highlights": [
    {
      "title": "Professional DAW depth",
      "description": "Ardour is the only one of the three built as a full digital audio workstation, adding MIDI recording, any-to-any signal routing, video timeline integration, and sample-accurate sync to MIDI timecode and LTC for professional production work.",
      "toolSlugs": [
        "ardour"
      ]
    },
    {
      "title": "The default free audio editor",
      "description": "Audacity has the largest install base and plugin ecosystem of the three, plus optional AI-assisted effects like music separation and transcription through its companion Muse Hub app.",
      "toolSlugs": [
        "audacity"
      ]
    },
    {
      "title": "A privacy-first Audacity fork",
      "description": "Tenacity split from Audacity in 2021 specifically over concerns about Muse Group's privacy policy and telemetry, and it is built with no data collection by design while keeping a familiar Audacity-like workflow.",
      "toolSlugs": [
        "tenacity"
      ]
    },
    {
      "title": "All fully free and open source",
      "description": "Every tool here can be downloaded and used at no cost under an open-source license, with no required account or subscription to access core editing features.",
      "toolSlugs": [
        "ardour",
        "audacity",
        "tenacity"
      ]
    },
    {
      "title": "Optional paid path for Ardour binaries only",
      "description": "Ardour is the only one of the three that offers a pay-what-you-want subscription (from $1/month) for prebuilt, ready-to-run binaries, while Audacity and Tenacity are free with no paid tier at all.",
      "toolSlugs": [
        "ardour"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Recording and Editing",
      "rows": [
        {
          "feature": "Multi-track audio recording",
          "statuses": {
            "ardour": "available",
            "audacity": "available",
            "tenacity": "available"
          }
        },
        {
          "feature": "MIDI recording",
          "statuses": {
            "ardour": "available",
            "audacity": "unavailable",
            "tenacity": "unavailable"
          },
          "note": "Audacity and Tenacity are audio-only editors; Ardour is a full DAW with native MIDI tracks."
        },
        {
          "feature": "32-bit float audio processing",
          "statuses": {
            "ardour": "not-documented",
            "audacity": "not-documented",
            "tenacity": "available"
          }
        }
      ]
    },
    {
      "group": "Plugins and Extensibility",
      "rows": [
        {
          "feature": "VST plugin support",
          "statuses": {
            "ardour": "available",
            "audacity": "available",
            "tenacity": "available"
          },
          "note": "Ardour supports VST2 and VST3; Audacity supports VST3; Tenacity supports VST2."
        },
        {
          "feature": "Nyquist scripting",
          "statuses": {
            "ardour": "not-documented",
            "audacity": "available",
            "tenacity": "available"
          }
        }
      ]
    },
    {
      "group": "Platform and Workflow",
      "rows": [
        {
          "feature": "Video timeline sync for scoring",
          "statuses": {
            "ardour": "available",
            "audacity": "not-documented",
            "tenacity": "not-documented"
          }
        },
        {
          "feature": "Native Windows, macOS, and Linux builds",
          "statuses": {
            "ardour": "available",
            "audacity": "available",
            "tenacity": "available"
          }
        }
      ]
    },
    {
      "group": "Pricing",
      "rows": [
        {
          "feature": "Paid subscription tier for prebuilt binaries",
          "statuses": {
            "ardour": "available",
            "audacity": "unavailable",
            "tenacity": "unavailable"
          },
          "note": "Ardour's pay-what-you-want subscription only covers ready-to-run binaries; the source code itself is always free for all three tools."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "What is the main difference between Ardour and Audacity?",
      "answer": "Ardour is a full digital audio workstation with MIDI recording, flexible signal routing, and video sync aimed at professional music production, while Audacity is a simpler multi-track audio editor and recorder focused on recording, editing, and restoring audio rather than full DAW-style mixing and MIDI work."
    },
    {
      "question": "Why was Tenacity created as a fork of Audacity?",
      "answer": "Tenacity began in 2021 after Audacity's new owner, Muse Group, drew criticism over a privacy policy that raised telemetry concerns and a contributor license agreement some saw as conflicting with Audacity's GPL license. Tenacity rolled back to a pre-controversy Audacity codebase and continued as an independent, volunteer-run, telemetry-free project."
    },
    {
      "question": "Which of these three supports MIDI recording?",
      "answer": "Only Ardour supports MIDI recording natively, since it is built as a full DAW. Audacity and Tenacity are audio-focused editors and do not offer MIDI recording."
    },
    {
      "question": "Is Ardour completely free to use?",
      "answer": "Ardour's full source code is always free to download and compile under the GPLv2. For users who do not want to compile it themselves, Ardour offers a free but interrupted demo binary, or a pay-what-you-want subscription starting at $1/month for prebuilt, uninterrupted binaries and updates."
    },
    {
      "question": "Does Tenacity get new features as fast as Audacity?",
      "answer": "No. Tenacity has a smaller contributor base than Audacity and has gone through periods of reduced activity and maintainer turnover since its 2021 fork, so it can lag behind Audacity's newer features even though it shares much of the same original workflow."
    },
    {
      "question": "Which tool is best for podcasting?",
      "answer": "Audacity is the most common choice for podcasting thanks to its large plugin ecosystem, built-in noise reduction and compression tools, and long track record, though Tenacity offers a very similar workflow for users who specifically want to avoid Muse Group's ownership and telemetry, and Ardour suits podcasters who also need multi-track mixing closer to a full DAW."
    }
  ]
};

export default ardourVsAudacityVsTenacityContent;
