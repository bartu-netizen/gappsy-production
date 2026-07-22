import type { GroupComparisonContent } from './types';

const janusVsMirotalkP2pVsMirotalkSfuContent: GroupComparisonContent = {
  "verdict": "All three are free, self-hosted, open-source WebRTC tools for teams that want to avoid dependence on Zoom, Meet, or Teams, but they sit at different layers of the stack. Janus is a low-level, plugin-based WebRTC gateway that developers use as a building block for custom video, streaming, or SIP-telephony products, while MiroTalk P2P and MiroTalk SFU are ready-to-deploy conferencing apps sharing the same codebase and interface, differing mainly in whether calls route peer-to-peer or through a central relay server. The practical choice usually comes down to group size and engineering appetite: MiroTalk P2P suits small, low-latency calls with minimal setup, MiroTalk SFU suits larger meetings and webinars out of the box, and Janus suits teams willing to write code around a WebRTC core to get exactly the product they want.",
  "bestFor": {
    "janus": "Engineering teams that want to build a fully custom video, live-streaming, or SIP-telephony product on top of a proven, modular, low-level WebRTC gateway rather than deploy a finished app.",
    "mirotalk-p2p": "Small teams and privacy-focused users who want a free, ready-to-use self-hosted video app for small-group calls, roughly two to eight participants, with the lowest possible latency since media never touches a relay server.",
    "mirotalk-sfu": "Organizations that need a turnkey, self-hosted alternative to Zoom or Meet for larger meetings, webinars, or streamed events with unlimited participants and extras like RTMP broadcast and AI avatars."
  },
  "highlights": [
    {
      "title": "Janus is infrastructure, not a finished app",
      "description": "Janus exposes a low-level, plugin-based WebRTC core (VideoRoom SFU, AudioBridge, Streaming, Recordplay, SIP) with a JSON signaling API, and developers write their own client and often server logic around it to assemble a finished product, unlike the MiroTalk editions which ship a complete browser UI ready to use.",
      "toolSlugs": [
        "janus"
      ]
    },
    {
      "title": "MiroTalk P2P trades scale for latency and simplicity",
      "description": "By connecting participants directly to each other instead of routing through a relay server, MiroTalk P2P minimizes latency and keeps call media off any central server, but performance degrades as more people join, so the project itself recommends it only for small groups of roughly two to eight participants.",
      "toolSlugs": [
        "mirotalk-p2p"
      ]
    },
    {
      "title": "MiroTalk SFU is built for bigger, richer meetings",
      "description": "MiroTalk SFU replaces peer-to-peer transport with a mediasoup-based Selective Forwarding Unit, removing the small-group ceiling and adding RTMP streaming, virtual backgrounds, ChatGPT integration, and AI avatars that neither Janus nor MiroTalk P2P document.",
      "toolSlugs": [
        "mirotalk-sfu"
      ]
    },
    {
      "title": "The two MiroTalk editions share one codebase and UI",
      "description": "MiroTalk P2P and MiroTalk SFU come from the same creator and offer the same browser-based interface, whiteboard, chat, screen sharing up to 8K/60fps, and recording, so switching between them is mainly a question of which transport architecture fits your expected room sizes.",
      "toolSlugs": [
        "mirotalk-p2p",
        "mirotalk-sfu"
      ]
    },
    {
      "title": "Janus's native SIP gateway is a differentiator",
      "description": "Janus ships an official SIP plugin that bridges WebRTC clients to traditional SIP telephony, a capability that lets a browser place and receive calls through a standard SIP provider and that is not documented for either MiroTalk edition.",
      "toolSlugs": [
        "janus"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Architecture and Scaling",
      "rows": [
        {
          "feature": "Turnkey video conferencing UI ready to deploy",
          "statuses": {
            "janus": "unavailable",
            "mirotalk-p2p": "available",
            "mirotalk-sfu": "available"
          },
          "note": "Janus is a gateway/toolkit; developers must build a client application around it."
        },
        {
          "feature": "Peer-to-peer transport for small, low-latency calls",
          "statuses": {
            "janus": "not-documented",
            "mirotalk-p2p": "available",
            "mirotalk-sfu": "unavailable"
          },
          "note": "MiroTalk SFU always routes media through its mediasoup relay server."
        },
        {
          "feature": "SFU relay architecture for unlimited/large-group scaling",
          "statuses": {
            "janus": "available",
            "mirotalk-p2p": "unavailable",
            "mirotalk-sfu": "available"
          },
          "note": "Janus provides this via its VideoRoom plugin; MiroTalk P2P scales poorly beyond small groups."
        }
      ]
    },
    {
      "group": "Protocol and Integration",
      "rows": [
        {
          "feature": "SIP telephony bridging",
          "statuses": {
            "janus": "available",
            "mirotalk-p2p": "not-documented",
            "mirotalk-sfu": "not-documented"
          }
        },
        {
          "feature": "RTMP live broadcast streaming",
          "statuses": {
            "janus": "available",
            "mirotalk-p2p": "not-documented",
            "mirotalk-sfu": "available"
          },
          "note": "Janus supports this via its Streaming plugin."
        },
        {
          "feature": "AI avatars and ChatGPT integration",
          "statuses": {
            "janus": "not-documented",
            "mirotalk-p2p": "not-documented",
            "mirotalk-sfu": "available"
          }
        }
      ]
    },
    {
      "group": "Licensing and Support",
      "rows": [
        {
          "feature": "Free, self-hosted open-source core",
          "statuses": {
            "janus": "available",
            "mirotalk-p2p": "available",
            "mirotalk-sfu": "available"
          },
          "note": "Janus is GPL-licensed; both MiroTalk editions are AGPLv3."
        },
        {
          "feature": "Commercial support or alternative licensing option",
          "statuses": {
            "janus": "available",
            "mirotalk-p2p": "unavailable",
            "mirotalk-sfu": "available"
          },
          "note": "Janus offers paid support contracts from Meetecho; MiroTalk SFU offers a one-time-fee commercial license via marketplaces."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "What is the core difference between Janus and the two MiroTalk editions?",
      "answer": "Janus is a low-level, plugin-based WebRTC gateway that developers use to build custom video, streaming, or telephony applications, while MiroTalk P2P and MiroTalk SFU are complete, ready-to-use self-hosted video conferencing apps with a browser interface already built for you."
    },
    {
      "question": "When should I choose MiroTalk P2P over MiroTalk SFU?",
      "answer": "MiroTalk P2P fits small groups of roughly two to eight participants where you want the lowest latency and no media passing through a relay server. Once you need larger meetings, webinars, or features like RTMP streaming and AI avatars, MiroTalk SFU's mediasoup-based architecture is the better fit."
    },
    {
      "question": "Does Janus include a ready-made video conferencing interface?",
      "answer": "No. Janus provides the WebRTC core and official plugins such as VideoRoom, AudioBridge, and SIP, but application-specific logic and the user interface are left to the developer to build on top of it."
    },
    {
      "question": "Can I get commercial support for any of these tools?",
      "answer": "Yes for two of the three. Meetecho, the team behind Janus, offers consulting, custom plugin development, and support contracts, and MiroTalk SFU has an optional one-time-fee commercial license sold through marketplaces for organizations that want terms outside AGPLv3. MiroTalk P2P has no official paid tier."
    },
    {
      "question": "Are these tools really free to self-host?",
      "answer": "Yes. Janus is released under the GPL and both MiroTalk editions under AGPLv3, so all three can be self-hosted at no licensing cost; you only pay for your own server infrastructure unless you opt into Meetecho's paid support or MiroTalk SFU's optional commercial license."
    },
    {
      "question": "Does MiroTalk SFU support live streaming and AI features that MiroTalk P2P lacks?",
      "answer": "Yes. MiroTalk SFU documents RTMP streaming to external platforms, virtual backgrounds, ChatGPT integration, and AI avatars, none of which are documented for MiroTalk P2P, reflecting SFU's focus on larger, richer meetings and broadcasts."
    }
  ]
};

export default janusVsMirotalkP2pVsMirotalkSfuContent;
