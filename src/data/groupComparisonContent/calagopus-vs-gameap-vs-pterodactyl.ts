import type { GroupComparisonContent } from './types';

const calagopusVsGameapVsPterodactylContent: GroupComparisonContent = {
  "verdict": "Pterodactyl is the most established of the three, with Docker-based multi-node scaling, two-factor authentication, and a large community that makes it the default choice for commercial game hosting providers. GameAP takes a lighter approach, running as a native binary with a WASM plugin system so operators can skip Docker overhead entirely. Calagopus is the newest entrant, built in Rust for lower resource use and designed to accept existing Pterodactyl egg presets, which makes it an easy migration target, though it still has a much smaller track record than the other two.",
  "bestFor": {
    "pterodactyl": "Commercial hosting providers and large communities that need proven multi-node scaling, Docker isolation, and two-factor authentication",
    "gameap": "Admins who want a lightweight native binary panel without Docker overhead and a multi-language WASM plugin system",
    "calagopus": "Teams wanting a modern, low-overhead Rust panel that can reuse existing Pterodactyl egg presets, and who are comfortable with an early-stage project"
  },
  "highlights": [
    {
      "title": "Proven multi-node scale",
      "description": "Pterodactyl is built around a Wings node daemon architecture that lets commercial hosts spread servers across multiple physical nodes, backed by a large, active open-source community.",
      "toolSlugs": [
        "pterodactyl"
      ]
    },
    {
      "title": "No-Docker lightweight footprint",
      "description": "GameAP runs as a native binary rather than requiring Docker, keeping resource overhead low for admins who want to avoid container management entirely.",
      "toolSlugs": [
        "gameap"
      ]
    },
    {
      "title": "Rust performance with an easy migration path",
      "description": "Calagopus is written in Rust for lower memory and CPU overhead than PHP-based panels, and it accepts existing Pterodactyl egg presets, easing a switch for current Pterodactyl users.",
      "toolSlugs": [
        "calagopus",
        "pterodactyl"
      ]
    },
    {
      "title": "Plugin-driven extensibility",
      "description": "Both Calagopus and GameAP ship extensible plugin systems, with GameAP using a WASM architecture that supports multiple programming languages.",
      "toolSlugs": [
        "calagopus",
        "gameap"
      ]
    },
    {
      "title": "All free and self-hosted",
      "description": "None of the three charge for the core software or offer an official managed cloud version, so operators handle their own Linux and Docker infrastructure regardless of which panel they pick.",
      "toolSlugs": [
        "calagopus",
        "gameap",
        "pterodactyl"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Deployment Architecture",
      "rows": [
        {
          "feature": "Docker container isolation per server",
          "statuses": {
            "pterodactyl": "available",
            "calagopus": "available",
            "gameap": "unavailable"
          },
          "note": "GameAP runs as a native binary instead of isolating servers in Docker containers."
        },
        {
          "feature": "Native binary without Docker overhead",
          "statuses": {
            "gameap": "available",
            "calagopus": "unavailable",
            "pterodactyl": "unavailable"
          }
        },
        {
          "feature": "Cross-platform host OS support",
          "statuses": {
            "gameap": "available",
            "calagopus": "available",
            "pterodactyl": "limited"
          },
          "note": "Pterodactyl's Wings daemon requires a Linux host with Docker."
        }
      ]
    },
    {
      "group": "Extensibility and Compatibility",
      "rows": [
        {
          "feature": "Plugin or extension system",
          "statuses": {
            "calagopus": "available",
            "gameap": "available",
            "pterodactyl": "not-documented"
          }
        },
        {
          "feature": "Pterodactyl egg template compatibility",
          "statuses": {
            "pterodactyl": "available",
            "calagopus": "available",
            "gameap": "not-documented"
          }
        },
        {
          "feature": "REST API access",
          "statuses": {
            "pterodactyl": "available",
            "gameap": "available",
            "calagopus": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Security and Scale",
      "rows": [
        {
          "feature": "Two-factor authentication",
          "statuses": {
            "pterodactyl": "available",
            "calagopus": "not-documented",
            "gameap": "not-documented"
          }
        },
        {
          "feature": "Multi-node scaling for commercial hosts",
          "statuses": {
            "pterodactyl": "available",
            "gameap": "not-documented",
            "calagopus": "not-documented"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Calagopus a realistic alternative to Pterodactyl?",
      "answer": "Calagopus can accept existing Pterodactyl egg presets and is built in Rust for lower resource overhead, which makes migration straightforward. It is a much younger project than Pterodactyl, though, so it has a smaller community and shorter track record."
    },
    {
      "question": "Does GameAP require Docker to run game servers?",
      "answer": "No. GameAP runs as a native binary rather than isolating each game server in a Docker container, which keeps its resource footprint lighter than Docker-based panels."
    },
    {
      "question": "Which of these three panels is best for a commercial hosting business?",
      "answer": "Pterodactyl is the strongest fit for commercial hosts because of its multi-node Wings daemon architecture, per-server Docker isolation, two-factor authentication, and large support community."
    },
    {
      "question": "Can I use Pterodactyl egg presets with Calagopus?",
      "answer": "Yes. Calagopus is built to be compatible with existing Pterodactyl egg presets, which is meant to ease migration from Pterodactyl to Calagopus."
    },
    {
      "question": "Do any of these panels offer managed cloud hosting?",
      "answer": "No. Calagopus, GameAP, and Pterodactyl are all self-hosted, open-source panels with no official managed or cloud-hosted version; operators are responsible for their own servers."
    },
    {
      "question": "Which panel has the most mature security model?",
      "answer": "Pterodactyl documents the most complete security feature set of the three, including per-server Docker isolation and built-in two-factor authentication."
    }
  ]
};

export default calagopusVsGameapVsPterodactylContent;
