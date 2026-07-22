import type { GroupComparisonContent } from './types';

const inspircdVsOpenfireVsUnrealircdContent: GroupComparisonContent = {
  "verdict": "The right pick depends on which chat protocol you actually need to run. InspIRCd and UnrealIRCd are both from-scratch, GPL-licensed IRC daemons built for the same job, powering a self-hosted IRC network, so choosing between them comes down to module philosophy, deployment scale, and how much you value UnrealIRCd's larger install base versus InspIRCd's Windows-friendly, modular C++ design. Openfire solves a related but distinct problem: it is a Java-based XMPP server aimed at organizations that want structured, directory-integrated, self-hosted group chat rather than a classic IRC network. Teams that specifically need IRC should compare InspIRCd against UnrealIRCd directly; teams that want a self-hosted alternative to SaaS chat with LDAP/Active Directory integration and clustering should look at Openfire instead.",
  "bestFor": {
    "inspircd": "IRC network operators and hobbyist community admins who want a from-scratch C++ IRCd with an extensive, well-documented module API and rare native Windows support alongside Linux, BSD, and macOS.",
    "unrealircd": "Operators who want the most widely deployed IRC server in the world, with mature built-in security tooling like Spamfilter, anti-flood protection, and IP cloaking baked into the core.",
    "openfire": "IT teams and organizations that want a self-hosted, standards-based XMPP chat server with LDAP/Active Directory integration, clustering for high availability, and a web-based admin console as an alternative to SaaS platforms like Slack or Microsoft Teams."
  },
  "highlights": [
    {
      "title": "Two IRC daemons, one XMPP server",
      "description": "InspIRCd and UnrealIRCd both implement the IRC protocol and IRCv3 extensions, making them direct alternatives to each other, while Openfire runs on the entirely different XMPP protocol and targets organizations that want structured, account-based group chat rather than a classic IRC network.",
      "toolSlugs": [
        "inspircd",
        "unrealircd",
        "openfire"
      ]
    },
    {
      "title": "UnrealIRCd's scale advantage",
      "description": "UnrealIRCd is described as the single most deployed IRC server in the world, reportedly powering roughly a third or more of publicly listed IRC networks, giving it an unusually large community for troubleshooting and module support.",
      "toolSlugs": [
        "unrealircd"
      ]
    },
    {
      "title": "InspIRCd's cross-platform reach",
      "description": "InspIRCd's clean-room C++ codebase and full Linux, BSD, Windows, and macOS support is unusual among IRC daemons, which mostly target UNIX-like systems only.",
      "toolSlugs": [
        "inspircd"
      ]
    },
    {
      "title": "Openfire's enterprise-oriented tooling",
      "description": "Openfire is the only one of the three built around enterprise IT needs out of the box, with LDAP/Active Directory authentication, clustering for high availability, and a web-based admin console for user management and diagnostics.",
      "toolSlugs": [
        "openfire"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Protocol and Architecture",
      "rows": [
        {
          "feature": "Modular plugin/module architecture",
          "statuses": {
            "inspircd": "available",
            "unrealircd": "available",
            "openfire": "available"
          },
          "note": "All three let administrators extend core functionality without patching the base server."
        },
        {
          "feature": "WebSocket support for browser-based clients",
          "statuses": {
            "inspircd": "available",
            "unrealircd": "available",
            "openfire": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Security and Abuse Prevention",
      "rows": [
        {
          "feature": "Built-in anti-spam / anti-flood tooling",
          "statuses": {
            "inspircd": "available",
            "unrealircd": "available",
            "openfire": "not-documented"
          },
          "note": "InspIRCd offers regex-based spam filtering modules; UnrealIRCd ships a dedicated Spamfilter and anti-flood tools."
        },
        {
          "feature": "IP cloaking / user privacy protection",
          "statuses": {
            "inspircd": "not-documented",
            "unrealircd": "available",
            "openfire": "not-documented"
          }
        },
        {
          "feature": "TLS/SSL encrypted connections",
          "statuses": {
            "inspircd": "available",
            "unrealircd": "available",
            "openfire": "available"
          }
        }
      ]
    },
    {
      "group": "Administration and Enterprise Integration",
      "rows": [
        {
          "feature": "LDAP / Active Directory integration",
          "statuses": {
            "inspircd": "not-documented",
            "unrealircd": "not-documented",
            "openfire": "available"
          }
        },
        {
          "feature": "Clustering for high availability",
          "statuses": {
            "inspircd": "not-documented",
            "unrealircd": "not-documented",
            "openfire": "available"
          }
        },
        {
          "feature": "Programmatic REST/JSON-RPC administration API",
          "statuses": {
            "inspircd": "not-documented",
            "unrealircd": "available",
            "openfire": "available"
          },
          "note": "UnrealIRCd exposes a JSON-RPC API; Openfire offers a REST API plugin."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Are InspIRCd, UnrealIRCd, and Openfire really interchangeable?",
      "answer": "Not exactly. InspIRCd and UnrealIRCd are both IRC daemons and are directly interchangeable for running an IRC network. Openfire runs the XMPP protocol instead of IRC, so it is a substitute for IRC only in the broad sense of self-hosted real-time chat, not a drop-in replacement, since IRC and XMPP clients are not compatible with each other."
    },
    {
      "question": "Which of these has the largest existing network of users?",
      "answer": "UnrealIRCd is described as the most deployed IRC server in the world, powering roughly a third or more of public IRC networks. Openfire has separately surpassed 10 million total downloads over its more than two-decade history."
    },
    {
      "question": "Do any of these offer managed cloud hosting?",
      "answer": "No. All three are self-hosted, free, open-source server software with no managed SaaS offering from the projects themselves; you compile or install the software and run it on your own infrastructure."
    },
    {
      "question": "Which is the best fit for a business wanting a Slack-style self-hosted chat tool?",
      "answer": "Openfire is the closest fit, since it is built around structured accounts, LDAP/Active Directory integration, multi-user chat rooms, and a web-based admin console aimed at IT teams and regulated environments like government and education."
    },
    {
      "question": "Do any of these run natively on Windows?",
      "answer": "InspIRCd and UnrealIRCd both explicitly support native Windows deployment alongside Linux, BSD, and macOS. Openfire's Windows support is not explicitly documented in the available data, though it runs on the Java platform."
    }
  ]
};

export default inspircdVsOpenfireVsUnrealircdContent;
