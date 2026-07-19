import type { GroupComparisonContent } from './types';

const ejabberdVsMongooseimVsTigaseContent: GroupComparisonContent = {
  "verdict": "All three are self-hosted, standards-based XMPP servers built for high-availability messaging at scale, but they differ in runtime and business model. ejabberd has the longest track record, dating to 2002, and bundles XMPP, MQTT, and SIP support in one server backed by ProcessOne's open-core Business Edition. MongooseIM, from Erlang Solutions, shares ejabberd's Erlang/OTP foundation and leans into multi-protocol client connectivity plus services-based enterprise support. Tigase stands apart as the only Java-based option of the three, and the only one offering an explicit commercial license for closed-source deployments alongside its AGPLv3 community edition.",
  "bestFor": {
    "ejabberd": "Teams that want a single server covering XMPP, MQTT, and SIP with a proven track record at extreme scale.",
    "mongooseim": "Enterprises wanting a fault-tolerant Erlang/OTP messaging backbone with REST, WebSocket, and BOSH client connectivity plus services-based support.",
    "tigase": "Java-based teams or vendors that need a JVM-native XMPP server with a commercial license option for closed-source products."
  },
  "highlights": [
    {
      "title": "Multi-protocol server in one",
      "description": "ejabberd bundles XMPP, MQTT, and SIP support in a single server, reducing the need for separate messaging infrastructure for chat, IoT, and voice signaling.",
      "toolSlugs": [
        "ejabberd"
      ]
    },
    {
      "title": "Battle-tested at extreme scale",
      "description": "ejabberd's architecture reportedly influenced WhatsApp's early infrastructure and continues to power the Nintendo Switch's chat network, giving it an unusually long production track record among XMPP servers.",
      "toolSlugs": [
        "ejabberd"
      ]
    },
    {
      "title": "Multi-protocol client connectivity",
      "description": "MongooseIM accepts connections over native XMPP, REST API, WebSockets, SSE, and BOSH, making it easier to build mobile and browser clients without a native XMPP stack.",
      "toolSlugs": [
        "mongooseim"
      ]
    },
    {
      "title": "JVM-native with a commercial licensing path",
      "description": "Tigase runs on Java rather than Erlang and is the only one of the three offering an explicit commercial license for teams that need to ship closed-source products without AGPLv3's copyleft obligations.",
      "toolSlugs": [
        "tigase"
      ]
    },
    {
      "title": "Shared Erlang/OTP foundation",
      "description": "ejabberd and MongooseIM are both built on Erlang/OTP, giving them similar fault-tolerance and clustering characteristics that differ structurally from Tigase's Java-based design.",
      "toolSlugs": [
        "ejabberd",
        "mongooseim"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Messaging Protocols",
      "rows": [
        {
          "feature": "Multi-user chat (MUC) rooms",
          "statuses": {
            "ejabberd": "available",
            "mongooseim": "available",
            "tigase": "available"
          }
        },
        {
          "feature": "Native MQTT broker",
          "statuses": {
            "ejabberd": "available",
            "mongooseim": "not-documented",
            "tigase": "not-documented"
          }
        },
        {
          "feature": "SIP voice/video signaling",
          "statuses": {
            "ejabberd": "available",
            "mongooseim": "available",
            "tigase": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Scalability and Client Connectivity",
      "rows": [
        {
          "feature": "Horizontal clustering for scale",
          "statuses": {
            "ejabberd": "available",
            "mongooseim": "available",
            "tigase": "available"
          }
        },
        {
          "feature": "REST and WebSocket client APIs",
          "statuses": {
            "ejabberd": "not-documented",
            "mongooseim": "available",
            "tigase": "available"
          }
        },
        {
          "feature": "Mobile push notifications",
          "statuses": {
            "ejabberd": "available",
            "mongooseim": "available",
            "tigase": "available"
          }
        }
      ]
    },
    {
      "group": "Licensing and Support",
      "rows": [
        {
          "feature": "Closed-source commercial license option",
          "statuses": {
            "ejabberd": "not-documented",
            "mongooseim": "not-documented",
            "tigase": "available"
          }
        },
        {
          "feature": "Enterprise support contract with SLA",
          "statuses": {
            "ejabberd": "available",
            "mongooseim": "available",
            "tigase": "limited"
          },
          "note": "Tigase references Basic, Standard, and Community support tiers, but pricing and SLA terms are not publicly listed."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "What is the main difference between ejabberd and MongooseIM?",
      "answer": "Both are Erlang-based XMPP servers, but ejabberd dates to 2002 and natively bundles MQTT and SIP alongside XMPP, while MongooseIM, first released in 2012 by Erlang Solutions, focuses on multi-protocol client APIs (REST, WebSockets, BOSH) and services-based enterprise support."
    },
    {
      "question": "Is Tigase written in the same language as ejabberd and MongooseIM?",
      "answer": "No. Tigase is written in Java, while both ejabberd and MongooseIM are built on Erlang and its OTP framework."
    },
    {
      "question": "Can any of these servers handle IoT messaging?",
      "answer": "ejabberd has a native MQTT broker suited to IoT device messaging, and Tigase describes lightweight presence and messaging capabilities for IoT use cases; MongooseIM does not document MQTT support."
    },
    {
      "question": "Are all three free to self-host?",
      "answer": "Yes. ejabberd's Community Edition, MongooseIM, and Tigase's AGPLv3 edition are all free and open source for self-hosted deployment, with paid enterprise support or licensing available from each maintainer."
    },
    {
      "question": "Which one offers a commercial license for closed-source products?",
      "answer": "Tigase is the only one of the three that explicitly offers a commercial license as an alternative to its AGPLv3 open-source license for teams building closed-source products."
    },
    {
      "question": "Do any of these servers support SIP or voice calling?",
      "answer": "ejabberd includes a SIP service for voice call signaling and MongooseIM can act as a signaling layer for voice and video calls; SIP support is not documented for Tigase."
    }
  ]
};

export default ejabberdVsMongooseimVsTigaseContent;
