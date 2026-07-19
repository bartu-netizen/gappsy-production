import type { GroupComparisonContent } from './types';

const centrifugoVsConduitVsEjabberdContent: GroupComparisonContent = {
  "verdict": "Centrifugo, Conduit, and ejabberd are all free, open-source, self-hosted real-time servers, but they operate at different layers of the stack: Centrifugo is a generic pub/sub message broker for building custom real-time features on top of your own application, while Conduit and ejabberd are complete chat protocol servers with built-in federation, presence, and multi-user rooms. ejabberd carries the longest track record and the highest documented concurrency, having influenced early WhatsApp-style architecture and powered the Nintendo Switch's chat network, while Conduit trades some of that maturity for a radically simpler single-binary deployment. Centrifugo is the right fit when a team wants transport flexibility and doesn't need a full chat protocol at all.",
  "bestFor": {
    "centrifugo": "Engineering teams building custom real-time features, such as chat, live feeds, dashboards, or multiplayer state, into their own application who want a lightweight pub/sub layer rather than a full chat protocol server.",
    "conduit": "Privacy-conscious individuals and small teams who want the simplest possible self-hosted Matrix homeserver, running on minimal hardware without managing a separate database.",
    "ejabberd": "Organizations that need a proven, horizontally scalable messaging backbone across XMPP, MQTT, and SIP, especially at very high concurrency or in IoT and telecom contexts."
  },
  "highlights": [
    {
      "title": "Different Layers of the Real-Time Stack",
      "description": "Centrifugo is generic pub/sub infrastructure for building whatever real-time feature you need, while Conduit and ejabberd are complete chat protocol servers with federation, presence, and rooms already built in.",
      "toolSlugs": [
        "centrifugo",
        "conduit",
        "ejabberd"
      ]
    },
    {
      "title": "Battle-Tested at Extreme Scale",
      "description": "ejabberd has a documented history powering WhatsApp-influenced architecture, an early Facebook chat deployment, and the Nintendo Switch's friend and chat network, with a single node handling roughly one to two million concurrent users.",
      "toolSlugs": [
        "ejabberd"
      ]
    },
    {
      "title": "Simplicity-First Matrix Homeserver",
      "description": "Conduit ships as a single binary with an embedded database, explicitly targeting hardware as modest as a Raspberry Pi, in contrast to the more resource-heavy Synapse.",
      "toolSlugs": [
        "conduit"
      ]
    },
    {
      "title": "Multi-Transport Flexibility",
      "description": "Centrifugo delivers messages over WebSocket, HTTP-streaming, Server-Sent Events, WebTransport, and gRPC, and scales horizontally using Redis, PostgreSQL, or NATS as the coordination layer.",
      "toolSlugs": [
        "centrifugo"
      ]
    },
    {
      "title": "Free Open-Source Cores With Optional Paid Tiers",
      "description": "All three ship a free open-source core (Apache 2.0 for Centrifugo and Conduit, GPLv2 for ejabberd's Community Edition), with Centrifugo PRO and ejabberd's Business Edition available as custom-priced enterprise add-ons; Conduit has no commercial tier at all.",
      "toolSlugs": [
        "centrifugo",
        "conduit",
        "ejabberd"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Protocol and Messaging Model",
      "rows": [
        {
          "feature": "Dedicated federated chat protocol (Matrix or XMPP)",
          "statuses": {
            "centrifugo": "unavailable",
            "conduit": "available",
            "ejabberd": "available"
          }
        },
        {
          "feature": "Generic pub/sub channels over multiple transports",
          "statuses": {
            "centrifugo": "available",
            "conduit": "unavailable",
            "ejabberd": "unavailable"
          }
        },
        {
          "feature": "Multi-user rooms and presence tracking",
          "statuses": {
            "centrifugo": "available",
            "conduit": "available",
            "ejabberd": "available"
          },
          "note": "Centrifugo offers channel-based presence rather than chat-specific rooms; Conduit and ejabberd implement full Matrix rooms and XMPP multi-user chat respectively."
        }
      ]
    },
    {
      "group": "Scale and Deployment",
      "rows": [
        {
          "feature": "Documented production scale at very high concurrency",
          "statuses": {
            "centrifugo": "available",
            "conduit": "not-documented",
            "ejabberd": "available"
          },
          "note": "Centrifugo cites roughly one million concurrent connections per server; ejabberd cites one to two million per node and tens of millions clustered; Conduit's own materials describe it as beta without comparable published scale figures."
        },
        {
          "feature": "Single-binary, low-resource deployment simplicity",
          "statuses": {
            "centrifugo": "unavailable",
            "conduit": "available",
            "ejabberd": "limited"
          },
          "note": "Centrifugo needs an external Redis, PostgreSQL, or NATS backend to cluster; ejabberd ships with an embedded Mnesia database by default but its Erlang/OTP stack has a steeper learning curve than Conduit's single-binary design."
        }
      ]
    },
    {
      "group": "Extensibility and Support",
      "rows": [
        {
          "feature": "Non-chat protocol support (MQTT, SIP, or similar)",
          "statuses": {
            "centrifugo": "unavailable",
            "conduit": "unavailable",
            "ejabberd": "available"
          }
        },
        {
          "feature": "Official paid enterprise or support tier",
          "statuses": {
            "centrifugo": "available",
            "conduit": "unavailable",
            "ejabberd": "available"
          },
          "note": "Centrifugo PRO and ejabberd's Business Edition or Fluux managed cloud are custom-priced; Conduit has no company or commercial tier behind it."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Centrifugo a chat server like Conduit and ejabberd?",
      "answer": "Not exactly. Centrifugo is a generic real-time pub/sub message broker used to build chat, live feeds, dashboards, or multiplayer features into a custom application, whereas Conduit and ejabberd are complete chat protocol servers with federation, rooms, and presence already implemented."
    },
    {
      "question": "Which of the three has been proven at the largest scale?",
      "answer": "ejabberd has the longest documented history at extreme scale, with reported use in WhatsApp-influenced early architecture, a modified deployment behind Facebook's early chat.facebook.com, and the Nintendo Switch's friend and chat network."
    },
    {
      "question": "Which is easiest to self-host on minimal hardware?",
      "answer": "Conduit, since it ships as a single binary with an embedded RocksDB database and explicitly targets hardware as modest as a Raspberry Pi, avoiding the need to separately manage PostgreSQL or another external database."
    },
    {
      "question": "Do any of these support protocols beyond chat, like IoT messaging?",
      "answer": "Yes. ejabberd bundles a native MQTT broker for IoT devices and a SIP proxy for voice signaling alongside XMPP chat. Centrifugo can carry IoT or dashboard data over its generic pub/sub channels, while Conduit is Matrix-only."
    },
    {
      "question": "Are there paid versions of these open-source projects?",
      "answer": "Centrifugo PRO and ejabberd's Business Edition and Fluux managed cloud service are both custom-priced enterprise options sold alongside the free open-source cores. Conduit has no company or commercial tier behind it."
    },
    {
      "question": "Is Conduit production-ready?",
      "answer": "Conduit's own documentation describes it as beta: usable in real deployments but still missing some smaller features found in more mature homeservers like Synapse, and its development has partly diverged into community forks such as Conduwuit and Tuwunel."
    }
  ]
};

export default centrifugoVsConduitVsEjabberdContent;
