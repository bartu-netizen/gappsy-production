import type { GroupComparisonContent } from './types';

const calagopusVsGameapVsPufferpanelContent: GroupComparisonContent = {
  "verdict": "PufferPanel emphasizes the fastest, simplest setup of the three, with a lightweight Go-based architecture built for quick single-server installs. GameAP takes a similar no-Docker approach with a native binary and a multi-language WASM plugin system, while Calagopus is the newest option, using Rust for lower overhead and Pterodactyl egg compatibility that appeals to admins migrating from that ecosystem. All three are free and self-hosted, so the choice mostly comes down to setup speed, plugin needs, and how much you value Calagopus's migration path versus GameAP's and PufferPanel's longer track records.",
  "bestFor": {
    "pufferpanel": "Operators who want the fastest, simplest self-hosted panel to stand up a single game server without deep Docker or multi-node complexity",
    "gameap": "Admins who prefer a lightweight native binary panel with no Docker overhead and a multi-language WASM plugin system",
    "calagopus": "Teams wanting a modern, low-overhead Rust panel with Pterodactyl egg compatibility for easier migration, and who can accept an early-stage project"
  },
  "highlights": [
    {
      "title": "Fastest single-server setup",
      "description": "PufferPanel is designed for fast, beginner-friendly installation, making it a practical pick when the goal is standing up one or a few game servers quickly.",
      "toolSlugs": [
        "pufferpanel"
      ]
    },
    {
      "title": "No-Docker lightweight footprint",
      "description": "GameAP runs as a native binary rather than requiring Docker, keeping resource use low for admins who want to avoid container management.",
      "toolSlugs": [
        "gameap"
      ]
    },
    {
      "title": "Rust architecture with a Pterodactyl migration path",
      "description": "Calagopus is written in Rust for lower memory and CPU overhead and is built to accept existing Pterodactyl egg presets, which can ease a switch from that ecosystem.",
      "toolSlugs": [
        "calagopus"
      ]
    },
    {
      "title": "Plugin extensibility in Calagopus and GameAP",
      "description": "Calagopus ships an extensible plugin system and GameAP uses a WASM-based plugin architecture supporting multiple languages, while PufferPanel does not document an equivalent plugin system.",
      "toolSlugs": [
        "calagopus",
        "gameap"
      ]
    },
    {
      "title": "All free with permissive open-source licensing",
      "description": "Calagopus, GameAP, and PufferPanel are all free to use commercially, released under permissive licenses, with no official paid tier or managed hosting from any of the three.",
      "toolSlugs": [
        "calagopus",
        "gameap",
        "pufferpanel"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Deployment and Architecture",
      "rows": [
        {
          "feature": "Docker container support",
          "statuses": {
            "calagopus": "available",
            "pufferpanel": "available",
            "gameap": "unavailable"
          },
          "note": "GameAP runs as a native binary instead of using Docker containers."
        },
        {
          "feature": "Native binary without Docker overhead",
          "statuses": {
            "gameap": "available",
            "calagopus": "unavailable",
            "pufferpanel": "not-documented"
          }
        },
        {
          "feature": "Fast single-server installation",
          "statuses": {
            "pufferpanel": "available",
            "calagopus": "not-documented",
            "gameap": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Extensibility",
      "rows": [
        {
          "feature": "Plugin or extension architecture",
          "statuses": {
            "calagopus": "available",
            "gameap": "available",
            "pufferpanel": "not-documented"
          }
        },
        {
          "feature": "Pterodactyl egg template compatibility",
          "statuses": {
            "calagopus": "available",
            "pufferpanel": "not-documented",
            "gameap": "not-documented"
          }
        },
        {
          "feature": "Multi-game template support",
          "statuses": {
            "pufferpanel": "available",
            "gameap": "not-documented",
            "calagopus": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Access and Management",
      "rows": [
        {
          "feature": "Browser-based file manager",
          "statuses": {
            "pufferpanel": "available",
            "gameap": "available",
            "calagopus": "not-documented"
          }
        },
        {
          "feature": "OAuth2 authentication",
          "statuses": {
            "pufferpanel": "available",
            "calagopus": "not-documented",
            "gameap": "not-documented"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is PufferPanel easier to set up than Calagopus or GameAP?",
      "answer": "PufferPanel is specifically built for fast, beginner-friendly single-server installation, which makes its setup process simpler than Calagopus or GameAP for a first server."
    },
    {
      "question": "Does GameAP need Docker to run?",
      "answer": "No. GameAP runs as a native binary rather than isolating servers in Docker containers, which keeps its footprint lighter than Docker-based panels like PufferPanel and Calagopus."
    },
    {
      "question": "Can Calagopus use my existing Pterodactyl egg presets?",
      "answer": "Yes. Calagopus is built to accept existing Pterodactyl egg presets, which is intended to make migrating from Pterodactyl-style setups easier."
    },
    {
      "question": "Which of these panels has the largest plugin ecosystem?",
      "answer": "Calagopus and GameAP both document extensible plugin systems, with GameAP using a WASM architecture that supports multiple programming languages; PufferPanel does not document an equivalent plugin system."
    },
    {
      "question": "Are Calagopus, GameAP, and PufferPanel all free to use commercially?",
      "answer": "Yes. All three are free, open-source panels released under permissive licenses, with commercial use permitted at no cost and no official paid tier."
    },
    {
      "question": "Which of these three panels has been around the longest?",
      "answer": "PufferPanel dates to 2013 and GameAP to 2014, while Calagopus is the newest of the three, having gone public in 2025."
    }
  ]
};

export default calagopusVsGameapVsPufferpanelContent;
