import type { ToolComparisonContent } from './types';

const documizeVsOutlineContent: ToolComparisonContent = {
  "verdict": "Documize is a self-hosted-only documentation platform with a free tier for up to 5 users and annual paid plans ($900/year Essential for up to 100 users, $1,800/year Enterprise for unlimited users), built around formal content workflows — draft, review, approve, publish — plus granular permissions and enterprise auth (LDAP, Active Directory, Keycloak, CAS). Outline is a freemium team wiki offered as both a cloud-hosted SaaS (from $10/month for 1-10 members) and a self-hosted open-source option, built around realtime collaborative editing, AI question answering over documents, and 20+ integrations including Slack. Both are team knowledge bases, but they optimize for different things: formal approval process versus realtime AI-assisted collaboration.",
  "bestForToolA": "Organizations that specifically need approval-based content workflows (draft/review/approve/publish), granular space-level permissions, and enterprise authentication (LDAP/AD/Keycloak/CAS), and are willing to self-host and pay annually.",
  "bestForToolB": "Teams that want a fast, realtime collaborative wiki with AI question answering and ready-made integrations (Slack, 20+ others), available as either monthly-billed cloud SaaS or self-hosted open source.",
  "whoNeedsBoth": "There's little practical case for running both as a team's primary knowledge base at once since they solve the same core job of team documentation — a team would typically pick one based on whether formal approval workflows (Documize) or realtime AI-assisted collaboration (Outline) matters more to them.",
  "keyDifferences": [
    {
      "title": "Hosting Model",
      "toolA": "Documize is documented as a self-hosted single binary, deployable on Windows, macOS, Linux, or FreeBSD.",
      "toolB": "Outline offers both a cloud-hosted SaaS and a self-hosted open-source option.",
      "whyItMatters": "A cloud-hosted option removes infrastructure management, while self-hosted-only means the buyer owns hosting and maintenance.",
      "benefitsWho": "Teams without dedicated infrastructure staff benefit from Outline's cloud option; teams requiring full on-premises control benefit from Documize."
    },
    {
      "title": "Pricing Structure",
      "toolA": "Documize is billed annually: free for up to 5 users, $900/year Essential (up to 100 users), $1,800/year Enterprise (unlimited users).",
      "toolB": "Outline is billed monthly and tiered by member count: $10/month Starter (1-10 members), $79/month Team (11-100 members), $249/month Business (101-200 members).",
      "whyItMatters": "Annual versus monthly billing and different tiering logic (per-user-count bands) affect cash flow and budgeting.",
      "benefitsWho": "Teams preferring predictable annual costs benefit from Documize's structure; teams wanting monthly flexibility benefit from Outline's."
    },
    {
      "title": "Content Workflow",
      "toolA": "Documize documents a defined content lifecycle: draft, review, approve, and publish through structured workflows.",
      "toolB": "Outline documents realtime multiplayer editing with comments and threaded conversations, but no formal approval-stage workflow.",
      "whyItMatters": "Regulated or compliance-driven teams often need a documented approval trail before content is published.",
      "benefitsWho": "Teams with formal publishing/approval requirements benefit from Documize; fast-moving teams doing live collaborative editing benefit from Outline."
    },
    {
      "title": "AI Features",
      "toolA": "Documize has no AI features documented.",
      "toolB": "Outline documents AI question answering — searching across the workspace and asking questions about documents to get direct AI answers.",
      "whyItMatters": "AI Q&A can speed up finding information across a growing knowledge base without manual search.",
      "benefitsWho": "Teams with large, growing document sets who want quick AI-assisted answers."
    },
    {
      "title": "Authentication Options",
      "toolA": "Documize supports multiple enterprise auth methods: LDAP, Active Directory, Keycloak, and CAS.",
      "toolB": "Outline documents SSO authentication as part of its Team plan and above.",
      "whyItMatters": "Organizations with specific identity infrastructure need compatible authentication methods.",
      "benefitsWho": "Enterprises with existing LDAP/AD/Keycloak/CAS infrastructure benefit from Documize's broader documented auth support."
    }
  ],
  "featureMatrix": [
    {
      "group": "Content & Collaboration",
      "rows": [
        {
          "feature": "Content approval workflow (draft/review/approve/publish)",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Realtime multiplayer editing",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "AI question answering",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Reusable templates/content blocks",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        }
      ]
    },
    {
      "group": "Hosting & Access",
      "rows": [
        {
          "feature": "Self-hosted deployment",
          "toolA": "available",
          "toolB": "available",
          "note": "Documize: single binary; Outline: open source"
        },
        {
          "feature": "Cloud-hosted SaaS option",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Slack integration",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Enterprise auth (LDAP/AD/Keycloak/CAS)",
          "toolA": "available",
          "toolB": "limited",
          "note": "Outline documents SSO on Team plan and above"
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Free tier",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Documize: $0 up to 5 users; Outline has a 30-day free trial but no perpetual free tier documented"
        },
        {
          "feature": "Starting paid price",
          "toolA": "available",
          "toolB": "available",
          "note": "Documize $900/year (Essential) vs Outline $10/month (Starter)"
        },
        {
          "feature": "Nonprofit/education discount",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "30% discount"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Documize free?",
      "answer": "Yes, for up to 5 users; paid Essential ($900/year, up to 100 users) and Enterprise ($1,800/year, unlimited users) plans are also available."
    },
    {
      "question": "Is Outline free?",
      "answer": "No perpetual free tier is documented — cloud plans start at $10/month, though a 30-day free trial is available and the software is open source for self-hosting."
    },
    {
      "question": "Can Outline be self-hosted?",
      "answer": "Yes, Outline is open source and can be self-hosted on your own infrastructure."
    },
    {
      "question": "Does Documize have AI features?",
      "answer": "Not documented — its focus is on structured content workflows, reusable templates, and granular permissions."
    },
    {
      "question": "Does Outline offer a discount for education or nonprofits?",
      "answer": "Yes, a 30% discount for non-profit and education organizations."
    },
    {
      "question": "Which tool supports approval workflows for publishing content?",
      "answer": "Documize, with its documented draft/review/approve/publish content lifecycle."
    }
  ]
};

export default documizeVsOutlineContent;
