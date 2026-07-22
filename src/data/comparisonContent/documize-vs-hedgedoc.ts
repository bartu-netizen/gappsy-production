import type { ToolComparisonContent } from './types';

const documizeVsHedgedocContent: ToolComparisonContent = {
  "verdict": "Documize is a governed, self-hosted knowledge-base platform built around draft-review-approve-publish workflows, granular space-level permissions, and enterprise auth options, for teams that need structured documentation with sign-off. HedgeDoc is an always-free, open-source, real-time collaborative Markdown editor with no approval layer, built for fast note-taking and presentations rather than governed publishing.",
  "bestForToolA": "Organizations that need a formal content lifecycle (draft, review, approve, publish), granular space/document permissions, and LDAP/AD/Keycloak/CAS authentication for an internal knowledge base, and can pay $900-$1,800/year past 5 users.",
  "bestForToolB": "Small teams or individuals who want free, open-source, real-time collaborative Markdown editing and reveal.js-powered presentations, self-hosted on lightweight hardware like a Raspberry Pi, without needing formal approval workflows.",
  "whoNeedsBoth": "An engineering team might use HedgeDoc for fast real-time meeting notes and brainstorming documents, then move finalized content into Documize's structured spaces for formal review, approval, and long-term knowledge-base publishing.",
  "keyDifferences": [
    {
      "title": "Real-Time Collaborative Editing",
      "toolA": "Documize does not document simultaneous multi-user editing; it centers on lifecycle-based review and approval stages instead.",
      "toolB": "HedgeDoc's core feature is real-time collaboration, letting multiple users edit the same Markdown document simultaneously.",
      "whyItMatters": "Teams that co-write documents live in the same session need built-in real-time sync, not a review queue.",
      "benefitsWho": "Teams doing live collaborative note-taking or pair-writing sessions."
    },
    {
      "title": "Content Approval Workflow",
      "toolA": "Documize offers draft, review, approve, and publish stages as a defined content workflow, plus reusable templates and content blocks.",
      "toolB": "HedgeDoc has permission management and revision history but no formal multi-stage approval workflow.",
      "whyItMatters": "Regulated or governance-conscious teams need sign-off trails before content goes live.",
      "benefitsWho": "Compliance-minded documentation teams that require reviewer sign-off before publishing."
    },
    {
      "title": "Pricing Structure",
      "toolA": "Documize is freemium: free for up to 5 users, then Essential at $900/year (up to 100 users) or Enterprise at $1,800/year (unlimited users), billed annually.",
      "toolB": "HedgeDoc has no paid tier at all; it is entirely free and open source under AGPL-3.0.",
      "whyItMatters": "Budget determines whether scaling past a handful of users triggers a recurring annual cost.",
      "benefitsWho": "Cost-sensitive teams or larger user bases that want to avoid any licensing fee."
    },
    {
      "title": "Enterprise Authentication",
      "toolA": "Documize supports LDAP, Active Directory, Keycloak, and CAS authentication alongside granular space/document/action-level permissions.",
      "toolB": "HedgeDoc documents per-note view/edit permission management but does not list enterprise SSO, LDAP, or AD integration.",
      "whyItMatters": "Organizations with centralized identity systems need documentation tools to plug into existing auth infrastructure.",
      "benefitsWho": "IT and security teams standardizing on enterprise identity providers."
    },
    {
      "title": "Presentation and Diagram Support",
      "toolA": "Documize does not document a presentation mode or diagram embedding; it is built for structured written documents.",
      "toolB": "HedgeDoc includes a built-in presentation mode powered by reveal.js and supports embedding diagrams and graphs directly in notes.",
      "whyItMatters": "Teams that need to turn notes into slide decks or visual diagrams benefit from native support rather than exporting to another tool.",
      "benefitsWho": "Teams that turn meeting notes or technical docs directly into presentations."
    }
  ],
  "featureMatrix": [
    {
      "group": "Collaboration & Editing",
      "rows": [
        {
          "feature": "Real-time simultaneous editing",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Presentation/slide mode",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "HedgeDoc uses reveal.js"
        },
        {
          "feature": "Revision history",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Diagram and graph embedding",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Content Governance & Access",
      "rows": [
        {
          "feature": "Draft/review/approve/publish workflow",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Reusable templates and content blocks",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Granular space/document/action permissions",
          "toolA": "available",
          "toolB": "limited",
          "note": "HedgeDoc offers per-note view/edit control only"
        },
        {
          "feature": "Enterprise auth (LDAP/AD/Keycloak/CAS)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Built-in usage analytics",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Deployment & Licensing",
      "rows": [
        {
          "feature": "Self-hosted deployment",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Free tier",
          "toolA": "available",
          "toolB": "available",
          "note": "Documize: up to 5 users; HedgeDoc: unlimited, fully free"
        },
        {
          "feature": "Paid/enterprise plan",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Documize $900-$1,800/year"
        },
        {
          "feature": "Open-source license (AGPL-3.0)",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Documize or HedgeDoc free to use?",
      "answer": "HedgeDoc is entirely free with no paid tier. Documize is freemium: free for up to 5 users, then $900/year (Essential, up to 100 users) or $1,800/year (Enterprise, unlimited users)."
    },
    {
      "question": "Does either tool support real-time collaborative editing?",
      "answer": "HedgeDoc's core feature is real-time collaboration where multiple users edit the same document simultaneously. Documize does not document this capability, focusing instead on lifecycle-based review stages."
    },
    {
      "question": "Which has approval workflows for publishing documents?",
      "answer": "Documize has a defined draft, review, approve, and publish content workflow. HedgeDoc does not document a formal approval process, only permission management and revision history."
    },
    {
      "question": "Can I self-host both tools?",
      "answer": "Yes. Both are self-hosted and open source under AGPL-3.0 - Documize as a single binary for Windows, macOS, Linux, or FreeBSD, and HedgeDoc via Docker, lightweight enough to run on a Raspberry Pi."
    },
    {
      "question": "Which supports enterprise authentication like LDAP or Active Directory?",
      "answer": "Documize supports LDAP, Active Directory, Keycloak, and CAS authentication. HedgeDoc does not document enterprise SSO or directory integration."
    },
    {
      "question": "Does HedgeDoc have a paid or enterprise version?",
      "answer": "No. Per its FAQs, HedgeDoc is free and open source with no paid tier, unlike Documize which charges $900-$1,800/year once you exceed 5 users."
    }
  ]
};

export default documizeVsHedgedocContent;
