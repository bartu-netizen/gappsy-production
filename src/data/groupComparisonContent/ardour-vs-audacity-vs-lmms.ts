import type { GroupComparisonContent } from './types';

const ardourVsAudacityVsLmmsContent: GroupComparisonContent = {
  "verdict": "Ardour, Audacity, and LMMS are all completely free, open-source, cross-platform audio tools, but they answer different needs: Ardour is a professional multitrack DAW built for serious recording, mixing, routing, and video-sync work; Audacity is a lightweight waveform editor best suited to recording, cleanup, and format conversion; and LMMS is a pattern-based DAW aimed at electronic music production, built around a deep stock synth and beat-making library. Audacity is the fastest way to record and clean up a track, LMMS is the natural pick for producers building beats and arrangements from scratch, and Ardour is the tool to reach for once a project needs professional routing, plugin depth, or scoring-to-video work. All three cost nothing to run in full, though Ardour funds its ready-to-run binaries through an optional pay-what-you-want subscription.",
  "bestFor": {
    "ardour": "Musicians and audio engineers who need professional-grade multitrack recording, mixing, and video-sync work across Linux, macOS, and Windows.",
    "audacity": "Podcasters, voice-over artists, and hobbyists who want a simple, free, no-frills tool for recording, editing, and cleaning up audio.",
    "lmms": "Electronic music producers and beat-makers who want a full pattern-based DAW with a deep built-in synth and effects library at zero cost."
  },
  "highlights": [
    {
      "title": "Three different jobs, one price: free",
      "description": "Ardour, Audacity, and LMMS are all free and open source at their core, with no subscription required to use their full feature sets.",
      "toolSlugs": [
        "ardour",
        "audacity",
        "lmms"
      ]
    },
    {
      "title": "Ardour is the only true professional DAW here",
      "description": "Ardour offers any-to-any signal routing, video timeline sync for scoring, sample-accurate sync to MIDI timecode and LTC, and control surface support that neither Audacity nor LMMS provide.",
      "toolSlugs": [
        "ardour"
      ]
    },
    {
      "title": "Audacity is built for quick editing, not composition",
      "description": "Audacity is a waveform editor and recorder rather than a full DAW - it has no built-in synths, piano roll, or pattern sequencer, and instead focuses on recording, restoration, and format export.",
      "toolSlugs": [
        "audacity"
      ]
    },
    {
      "title": "LMMS bundles a full instrument library",
      "description": "LMMS ships 16 built-in synthesizers plus the ZynAddSubFx synth, a piano roll, and a Beat/Bassline editor, giving producers a complete beat-making and arrangement toolkit without buying extra plugins.",
      "toolSlugs": [
        "lmms"
      ]
    },
    {
      "title": "Only Ardour asks for money for convenience",
      "description": "Ardour's source is free, but ready-to-run binaries are funded via a $1 to $10 per month pay-what-you-want subscription or a free demo build that periodically interrupts playback; Audacity and LMMS carry no such gate.",
      "toolSlugs": [
        "ardour",
        "audacity",
        "lmms"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Workflow",
      "rows": [
        {
          "feature": "Multitrack audio recording",
          "statuses": {
            "ardour": "available",
            "audacity": "available",
            "lmms": "limited"
          },
          "note": "LMMS is composition-focused and lacks the dedicated multitrack recording depth of Ardour or Audacity."
        },
        {
          "feature": "Pattern-based beat sequencing",
          "statuses": {
            "ardour": "unavailable",
            "audacity": "unavailable",
            "lmms": "available"
          }
        },
        {
          "feature": "Built-in instrument/synth composition",
          "statuses": {
            "ardour": "unavailable",
            "audacity": "unavailable",
            "lmms": "available"
          }
        }
      ]
    },
    {
      "group": "Plugins and Extensibility",
      "rows": [
        {
          "feature": "Third-party VST plugin support",
          "statuses": {
            "ardour": "available",
            "audacity": "available",
            "lmms": "available"
          },
          "note": "Ardour supports VST2/VST3 plus AudioUnit, LV2, and LADSPA; Audacity supports VST3, LV2, and Nyquist; LMMS supports VST on relevant platforms."
        }
      ]
    },
    {
      "group": "Professional Production Features",
      "rows": [
        {
          "feature": "Video timeline sync for scoring",
          "statuses": {
            "ardour": "available",
            "audacity": "unavailable",
            "lmms": "unavailable"
          }
        },
        {
          "feature": "External control surface support (Mackie Control, OSC/MIDI Learn)",
          "statuses": {
            "ardour": "available",
            "audacity": "not-documented",
            "lmms": "not-documented"
          }
        },
        {
          "feature": "Optional AI-assisted audio effects",
          "statuses": {
            "ardour": "not-documented",
            "audacity": "available",
            "lmms": "not-documented"
          },
          "note": "Audacity's AI effects (music separation, noise suppression, transcription) require installing the separate Muse Hub app."
        }
      ]
    },
    {
      "group": "Pricing and Access",
      "rows": [
        {
          "feature": "Fully free with no paid gate on ready-to-use binaries",
          "statuses": {
            "ardour": "limited",
            "audacity": "available",
            "lmms": "available"
          },
          "note": "Ardour's source is always free; its prebuilt binaries use a pay-what-you-want subscription or a demo build with interrupted playback."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Audacity a full DAW like Ardour or LMMS?",
      "answer": "No. Audacity is a multitrack audio editor and recorder focused on recording, cleanup, and format conversion; it does not include the built-in synthesizers, piano roll, or pattern sequencer that make Ardour and LMMS full digital audio workstations."
    },
    {
      "question": "Do I have to pay to use Ardour?",
      "answer": "No, Ardour's full source code is always free to download and compile. Ready-to-run binaries are funded through an optional pay-what-you-want subscription starting at $1 per month, or you can use a free demo binary that periodically interrupts playback."
    },
    {
      "question": "Which of the three is best for making beats and electronic music?",
      "answer": "LMMS, since it ships 16 built-in synthesizers, the bundled ZynAddSubFx synth, and a dedicated Beat/Bassline editor built specifically for pattern-based production, none of which Ardour or Audacity offer out of the box."
    },
    {
      "question": "Which tool should I use for recording and syncing audio to video?",
      "answer": "Ardour, which includes video timeline integration for scoring plus sample-accurate sync to MIDI timecode and LTC - capabilities not documented for Audacity or LMMS."
    },
    {
      "question": "Do any of these tools work on macOS and Windows, not just Linux?",
      "answer": "Yes. All three - Ardour, Audacity, and LMMS - run natively on Linux, macOS, and Windows, even though all three originated as Linux-focused, open-source projects."
    },
    {
      "question": "Can I extend all three with third-party plugins?",
      "answer": "Yes. Ardour supports AudioUnit, LV2, VST2, VST3, and LADSPA; Audacity supports VST3, LV2, and Nyquist; and LMMS supports VST plugins on relevant platforms, so each can be extended beyond its stock toolset."
    }
  ]
};

export default ardourVsAudacityVsLmmsContent;
