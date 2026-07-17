import type { ToolComparisonContent } from './types';

const nextcloudTalkVsSynapseContent: ToolComparisonContent = {
  "verdict": "Nextcloud Talk and Synapse operate at completely different layers. Nextcloud Talk is a finished, end-user video/chat/webinar application with AI-powered summaries, screen sharing, and deep integration into the Nextcloud suite, priced at €42/user/year on its published Enterprise tier. Synapse is a free, open-source Matrix protocol homeserver implementation maintained by Element — backend infrastructure for federating chat data, with no built-in end-user application or meeting features.",
  "bestForToolA": "Nextcloud Talk fits teams that want a ready-to-use video meeting and chat application with AI summaries, screen sharing, and deep file/groupware integration, without needing to build a client themselves.",
  "bestForToolB": "Synapse fits developers and infrastructure teams building or federating their own Matrix-based chat service who need a scalable, protocol-compliant homeserver rather than a finished end-user app.",
  "whoNeedsBoth": "There's no realistic combined-use scenario here — Nextcloud Talk isn't a Matrix client and doesn't run on a Synapse homeserver, so an organization would choose one architecture (Nextcloud's own platform vs. the open Matrix protocol via Synapse) rather than deploy both for the same communication need.",
  "keyDifferences": [
    {
      "title": "Product Type",
      "toolA": "Nextcloud Talk is a full end-user application with chat, video, webinars, screen sharing, and AI summaries built in.",
      "toolB": "Synapse is a backend homeserver implementation (protocol-level infrastructure) with no built-in UI or end-user chat app documented; a Matrix client is built or run separately on top of it.",
      "whyItMatters": "It determines whether a team gets a working app out of the box or needs to build/operate a client themselves.",
      "benefitsWho": "Teams wanting a ready-made app need Nextcloud Talk; teams building custom Matrix infrastructure need Synapse."
    },
    {
      "title": "Pricing Model",
      "toolA": "Nextcloud Talk is freemium with published per-user Enterprise pricing (€42/user/year at 100 users, €31.50/user/year at 250 users).",
      "toolB": "Synapse is entirely free and open source under AGPL-3.0, with a commercial license available only for organizations avoiding AGPL obligations — there's no per-user SaaS pricing.",
      "whyItMatters": "Nextcloud Talk has a clear commercial support path; Synapse's cost is primarily the infrastructure and engineering time to self-host it.",
      "benefitsWho": "Buyers comparing a commercially supported product against a self-managed open-source server."
    },
    {
      "title": "AI Features",
      "toolA": "Nextcloud Talk documents AI-powered chat/call summaries and live meeting translation.",
      "toolB": "No AI feature is documented for Synapse; it's a protocol server, not a meeting or chat application.",
      "whyItMatters": "AI summaries only make sense at the application layer, not the protocol server layer.",
      "benefitsWho": "End users attending and reviewing meetings."
    },
    {
      "title": "Deployment & Scaling",
      "toolA": "Nextcloud Talk requires self-managed Nextcloud infrastructure (or third-party Nextcloud hosting), with a High Performance Backend for large calls on enterprise tiers.",
      "toolB": "Synapse can be split into worker processes for horizontal scaling of large deployments, requiring familiarity with its Python/Twisted and Rust stack.",
      "whyItMatters": "Scaling approaches differ significantly between an application server and a protocol homeserver.",
      "benefitsWho": "Infrastructure teams planning for growth in either environment."
    },
    {
      "title": "Managed Hosting Availability",
      "toolA": "Available via third-party Nextcloud hosting providers, or self-hosted.",
      "toolB": "No first-party managed cloud offering is documented; self-hosting is the only path described.",
      "whyItMatters": "Managed hosting reduces the operational burden of running the software yourself.",
      "benefitsWho": "Teams without dedicated infrastructure staff."
    }
  ],
  "featureMatrix": [
    {
      "group": "Product Type & Use",
      "rows": [
        {
          "feature": "End-user chat/video application",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Synapse is a protocol server, not an app."
        },
        {
          "feature": "Matrix protocol homeserver",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Admin API for managing users/instance",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "AI & Meeting Features",
      "rows": [
        {
          "feature": "AI-powered summaries/translation",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Screen sharing / webinars",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "SSO support",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Deployment & Licensing",
      "rows": [
        {
          "feature": "Free / open-source core",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Published per-user paid pricing",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Nextcloud Talk: €42/user/year. Synapse: no SaaS pricing, AGPL or commercial license only."
        },
        {
          "feature": "Worker-process horizontal scaling",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Commercial license option (non-AGPL)",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Element Commercial License."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Synapse a chat app or something else?",
      "answer": "Synapse is a homeserver implementation for the Matrix protocol — backend infrastructure for hosting and federating chat data, not an end-user chat application."
    },
    {
      "question": "Does Nextcloud Talk use the Matrix protocol?",
      "answer": "This isn't documented as the case — Nextcloud Talk can bridge to Matrix networks alongside Microsoft Teams and Slack, but it isn't described as being built on Matrix itself."
    },
    {
      "question": "Is Synapse free?",
      "answer": "Yes, it's free and open source under AGPL-3.0. A commercial license is also available from Element for organizations that need different license terms."
    },
    {
      "question": "Does Nextcloud Talk have published pricing?",
      "answer": "Yes, its Standard Talk plan is published at €42/user/year for 100 users, dropping to €31.50/user/year at 250 users."
    },
    {
      "question": "Which tool includes AI-powered meeting summaries?",
      "answer": "Nextcloud Talk. No AI feature is documented for Synapse."
    },
    {
      "question": "Can Synapse scale to large deployments?",
      "answer": "Yes, via worker processes for horizontal scaling, though this requires manual configuration rather than working out of the box."
    }
  ]
};

export default nextcloudTalkVsSynapseContent;
