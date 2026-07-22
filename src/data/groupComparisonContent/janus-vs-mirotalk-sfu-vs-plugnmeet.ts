import type { GroupComparisonContent } from './types';

const janusVsMirotalkSfuVsPlugnmeetContent: GroupComparisonContent = {
  "verdict": "Janus is a low-level, general-purpose WebRTC gateway built around swappable plugins for video, audio, streaming, and SIP telephony, making it a toolkit for developers rather than a finished meeting product. MiroTalk SFU and plugNmeet, by contrast, are turnkey self-hosted video conferencing platforms with ready-made meeting UIs: MiroTalk SFU runs on a mediasoup SFU architecture with AI avatars, ChatGPT integration, and RTMP streaming, while plugNmeet is built on LiveKit, Go, and NATS and ships as a single binary with document-aware whiteboarding and an AI meeting agent. Janus demands the most developer effort of the three but offers architectural flexibility, including SIP bridging, that neither turnkey platform documents.",
  "bestFor": {
    "janus": "Developers building a fully custom video, audio, or streaming application, or one that needs SIP telephony bridging, rather than adopting a fixed meeting UI.",
    "mirotalk-sfu": "Teams wanting a free, self-hosted meeting platform that scales to unlimited participants with built-in AI avatars and live RTMP broadcast.",
    "plugnmeet": "Organizations wanting a single-binary, LiveKit-based platform with an AI meeting agent for transcription and translation, document-aware whiteboarding, and white-label branding."
  },
  "highlights": [
    {
      "title": "Build-your-own video infrastructure",
      "description": "Janus's modular plugin architecture, covering VideoRoom, SIP gateway, AudioBridge, Streaming, and Recordplay, separates core WebRTC handling from application logic, letting developers assemble a bespoke real-time product instead of adopting a fixed meeting UI.",
      "toolSlugs": [
        "janus"
      ]
    },
    {
      "title": "SIP telephony bridging",
      "description": "Janus is the only one of the three with a documented SIP gateway plugin, letting WebRTC clients interoperate with traditional telephony infrastructure.",
      "toolSlugs": [
        "janus"
      ]
    },
    {
      "title": "SFU architecture for large meetings",
      "description": "MiroTalk SFU's mediasoup-based architecture and plugNmeet's LiveKit-based architecture both route media through a central server rather than peer-to-peer, supporting far larger meetings than mesh-based tools.",
      "toolSlugs": [
        "mirotalk-sfu",
        "plugnmeet"
      ]
    },
    {
      "title": "AI-powered meeting features",
      "description": "MiroTalk SFU ships built-in AI avatars and ChatGPT integration, while plugNmeet includes an AI meeting agent for live translation, transcription, and summaries.",
      "toolSlugs": [
        "mirotalk-sfu",
        "plugnmeet"
      ]
    },
    {
      "title": "Single-binary deployment",
      "description": "plugNmeet deploys as a single Go binary built on Go, NATS, and LiveKit, simplifying self-hosted setup compared to Janus's plugin-based gateway or MiroTalk SFU's mediasoup stack.",
      "toolSlugs": [
        "plugnmeet"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Architecture and Deployment",
      "rows": [
        {
          "feature": "Turnkey meeting UI out of the box",
          "statuses": {
            "janus": "unavailable",
            "mirotalk-sfu": "available",
            "plugnmeet": "available"
          },
          "note": "Janus is a WebRTC gateway toolkit; building a finished meeting product on it requires custom developer work."
        },
        {
          "feature": "SFU (server-relayed) architecture for large calls",
          "statuses": {
            "janus": "available",
            "mirotalk-sfu": "available",
            "plugnmeet": "available"
          }
        },
        {
          "feature": "SIP telephony gateway",
          "statuses": {
            "janus": "available",
            "mirotalk-sfu": "not-documented",
            "plugnmeet": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Meeting Capabilities",
      "rows": [
        {
          "feature": "Live RTMP or WHIP broadcast streaming",
          "statuses": {
            "janus": "available",
            "mirotalk-sfu": "available",
            "plugnmeet": "available"
          }
        },
        {
          "feature": "Collaborative whiteboard",
          "statuses": {
            "janus": "not-documented",
            "mirotalk-sfu": "available",
            "plugnmeet": "available"
          }
        },
        {
          "feature": "Built-in AI meeting features",
          "statuses": {
            "janus": "not-documented",
            "mirotalk-sfu": "available",
            "plugnmeet": "available"
          }
        }
      ]
    },
    {
      "group": "Hosting and Support",
      "rows": [
        {
          "feature": "Official managed cloud hosting",
          "statuses": {
            "janus": "unavailable",
            "mirotalk-sfu": "unavailable",
            "plugnmeet": "available"
          },
          "note": "Neither Janus's maker Meetecho nor the MiroTalk SFU project offers an official managed cloud SaaS tier."
        },
        {
          "feature": "Commercial support or alternative licensing",
          "statuses": {
            "janus": "available",
            "mirotalk-sfu": "available",
            "plugnmeet": "available"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Janus a full video conferencing app like MiroTalk SFU or plugNmeet?",
      "answer": "No. Janus is a general-purpose WebRTC gateway and plugin toolkit rather than a finished meeting product, so it requires developer effort to build a complete conferencing app, while MiroTalk SFU and plugNmeet ship ready-to-use meeting UIs."
    },
    {
      "question": "Which of the three scales best to large meetings?",
      "answer": "MiroTalk SFU (mediasoup) and plugNmeet (LiveKit) both use SFU architectures built for large groups out of the box. Janus can also scale via its VideoRoom SFU plugin, but that requires custom integration work."
    },
    {
      "question": "Do any of these offer official managed cloud hosting?",
      "answer": "plugNmeet is the only one with an official managed option, plugNmeet Cloud. Janus and MiroTalk SFU are self-hosted only, though Meetecho offers commercial support for Janus and MiroTalk SFU offers a paid commercial license."
    },
    {
      "question": "Which tool includes SIP telephony support?",
      "answer": "Janus is the only one of the three with a documented SIP gateway plugin for bridging WebRTC clients to traditional telephony infrastructure."
    },
    {
      "question": "Which platforms include AI meeting features?",
      "answer": "MiroTalk SFU offers built-in AI avatars and ChatGPT integration, and plugNmeet includes an AI meeting agent for live translation, transcription, and summaries. AI features are not documented for Janus."
    },
    {
      "question": "Are all three free to self-host?",
      "answer": "Yes, all three are free and open source for self-hosted deployment, with optional paid commercial support or licensing available from their respective maintainers."
    }
  ]
};

export default janusVsMirotalkSfuVsPlugnmeetContent;
