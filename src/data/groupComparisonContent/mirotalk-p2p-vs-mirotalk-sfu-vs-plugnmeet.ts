import type { GroupComparisonContent } from './types';

const mirotalkP2pVsMirotalkSfuVsPlugnmeetContent: GroupComparisonContent = {
  "verdict": "MiroTalk P2P and MiroTalk SFU come from the same project but use fundamentally different architectures: P2P connects participants directly for low-latency small-group calls, while SFU routes media through a central mediasoup server to support unlimited participants, so the choice between them is mostly about expected group size. plugNmeet, built on LiveKit, Go, and NATS, is a separate self-hosted platform in the same class as MiroTalk SFU, adding document-aware whiteboarding, an AI meeting agent for translation and transcription, and white-label branding as a single deployable binary. All three are free, open source, and self-hosted with no per-seat licensing.",
  "bestFor": {
    "mirotalk-p2p": "Small teams wanting fast, low-latency peer-to-peer calls with no central media server for quick, private small-group conversations.",
    "mirotalk-sfu": "Teams needing unlimited-participant group calls, webinars, or streaming with built-in AI avatars and RTMP broadcast.",
    "plugnmeet": "Organizations wanting a single-binary, LiveKit-based platform with document-aware whiteboarding, AI transcription and translation, and white-label branding."
  },
  "highlights": [
    {
      "title": "Same project family, different architectures",
      "description": "MiroTalk P2P and MiroTalk SFU share branding and a similar feature set, including whiteboard, chat, recording, and screen share, but differ in how media is routed, making the choice mainly about expected group size.",
      "toolSlugs": [
        "mirotalk-p2p",
        "mirotalk-sfu"
      ]
    },
    {
      "title": "Peer-to-peer for small, private calls",
      "description": "MiroTalk P2P connects participants directly via WebRTC with no central media server, minimizing latency for small-group conversations.",
      "toolSlugs": [
        "mirotalk-p2p"
      ]
    },
    {
      "title": "SFU architecture for unlimited participants",
      "description": "Both MiroTalk SFU (mediasoup) and plugNmeet (LiveKit) route media through a central server, letting them scale to large webinars and streaming audiences that MiroTalk P2P's direct-connection architecture cannot support.",
      "toolSlugs": [
        "mirotalk-sfu",
        "plugnmeet"
      ]
    },
    {
      "title": "Document-aware whiteboarding",
      "description": "plugNmeet's built-in whiteboard supports PDF, DOCX, and PPTX annotation, going beyond the freeform drawing boards included in both MiroTalk editions.",
      "toolSlugs": [
        "plugnmeet"
      ]
    },
    {
      "title": "AI meeting assistance",
      "description": "MiroTalk SFU offers AI avatars and ChatGPT integration, while plugNmeet provides an AI meeting agent for live translation, transcription, and summaries; MiroTalk P2P has no documented AI features.",
      "toolSlugs": [
        "mirotalk-sfu",
        "plugnmeet"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Architecture and Scale",
      "rows": [
        {
          "feature": "Peer-to-peer media routing",
          "statuses": {
            "mirotalk-p2p": "available",
            "mirotalk-sfu": "unavailable",
            "plugnmeet": "unavailable"
          },
          "note": "MiroTalk SFU and plugNmeet both route media through a central server rather than connecting participants directly."
        },
        {
          "feature": "SFU (server-relayed) architecture",
          "statuses": {
            "mirotalk-p2p": "unavailable",
            "mirotalk-sfu": "available",
            "plugnmeet": "available"
          }
        },
        {
          "feature": "Live RTMP or WHIP broadcast streaming",
          "statuses": {
            "mirotalk-p2p": "not-documented",
            "mirotalk-sfu": "available",
            "plugnmeet": "available"
          }
        }
      ]
    },
    {
      "group": "Collaboration Features",
      "rows": [
        {
          "feature": "Collaborative whiteboard",
          "statuses": {
            "mirotalk-p2p": "available",
            "mirotalk-sfu": "available",
            "plugnmeet": "available"
          },
          "note": "plugNmeet's whiteboard additionally supports PDF, DOCX, and PPTX document annotation."
        },
        {
          "feature": "Meeting recording",
          "statuses": {
            "mirotalk-p2p": "available",
            "mirotalk-sfu": "available",
            "plugnmeet": "available"
          }
        },
        {
          "feature": "Built-in AI features",
          "statuses": {
            "mirotalk-p2p": "not-documented",
            "mirotalk-sfu": "available",
            "plugnmeet": "available"
          }
        }
      ]
    },
    {
      "group": "Deployment and Licensing",
      "rows": [
        {
          "feature": "Official managed cloud hosting",
          "statuses": {
            "mirotalk-p2p": "not-documented",
            "mirotalk-sfu": "unavailable",
            "plugnmeet": "available"
          },
          "note": "MiroTalk SFU's documentation notes there is no official managed cloud SaaS offering from the core open-source project."
        },
        {
          "feature": "Alternative commercial licensing beyond AGPLv3",
          "statuses": {
            "mirotalk-p2p": "not-documented",
            "mirotalk-sfu": "available",
            "plugnmeet": "not-documented"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "What is the difference between MiroTalk P2P and MiroTalk SFU?",
      "answer": "MiroTalk P2P connects participants directly for low-latency small-group calls with no central media server, while MiroTalk SFU routes media through a mediasoup-based server to support unlimited participants, webinars, and streaming."
    },
    {
      "question": "When should I choose plugNmeet over either MiroTalk edition?",
      "answer": "plugNmeet is a separate LiveKit-based platform best suited to teams wanting document-aware whiteboarding, an AI meeting agent for translation and transcription, white-label branding, and an official managed cloud option."
    },
    {
      "question": "Which of the three offers official managed cloud hosting?",
      "answer": "Only plugNmeet offers plugNmeet Cloud as a managed hosting option. Both MiroTalk editions are self-hosted only, though MiroTalk SFU offers a commercial license for alternative usage terms."
    },
    {
      "question": "Should I switch from MiroTalk P2P to MiroTalk SFU as my group sizes grow?",
      "answer": "That is the intended path: MiroTalk's own documentation notes that peer-to-peer calls scale poorly beyond small groups and recommends the SFU edition for larger meetings."
    },
    {
      "question": "Do any of these platforms include AI features?",
      "answer": "MiroTalk SFU offers AI avatars and ChatGPT integration, and plugNmeet includes an AI meeting agent for live translation, transcription, and summaries. MiroTalk P2P has no documented AI features."
    },
    {
      "question": "Are all three free and open source?",
      "answer": "Yes, all three are free, open source, and self-hosted, with MiroTalk SFU additionally offering an optional one-time commercial license and plugNmeet offering a separately priced managed cloud tier."
    }
  ]
};

export default mirotalkP2pVsMirotalkSfuVsPlugnmeetContent;
