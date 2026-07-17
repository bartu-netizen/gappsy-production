import type { ToolComparisonContent } from './types';

const bookstackVsDokuwikiContent: ToolComparisonContent = {
  "verdict": "BookStack and DokuWiki are both free, self-hosted, open-source wiki platforms, but they take different architectural approaches: BookStack runs on a PHP/Laravel/MySQL stack with a Books/Chapters/Pages structure, a WYSIWYG editor, and built-in diagrams.net diagramming, while DokuWiki stores everything as flat plain-text files with no database at all, relying on a large community plugin ecosystem built up since 2004. Neither has any pricing plans — both are entirely free.",
  "bestForToolA": "Teams that want a more polished, structured editing experience out of the box — WYSIWYG plus Markdown editing, built-in diagramming, and enterprise auth (OIDC/SAML2/LDAP) — and don't mind running a MySQL database.",
  "bestForToolB": "Teams that want the lightest possible infrastructure footprint — no database to install, back up, or maintain — and are willing to rely on DokuWiki's plugin ecosystem and simple markup syntax instead of a visual editor.",
  "whoNeedsBoth": "There isn't a realistic scenario for running both simultaneously — they solve the same problem (a self-hosted documentation wiki), so a team would typically evaluate both and pick one rather than maintain two overlapping wikis for the same content.",
  "keyDifferences": [
    {
      "title": "Storage Architecture",
      "toolA": "BookStack requires a MySQL database as part of its PHP/Laravel/MySQL stack.",
      "toolB": "DokuWiki uses flat-file storage, saving pages and revisions as plain text files with no database required at all.",
      "whyItMatters": "A database-free architecture removes an entire layer of infrastructure to install, back up, and maintain.",
      "benefitsWho": "Teams running on minimal or low-cost VPS infrastructure benefit from DokuWiki's no-database design."
    },
    {
      "title": "Content Structure & Editing",
      "toolA": "BookStack organizes content hierarchically into Books, Chapters, and Pages, with a WYSIWYG editor and an optional Markdown editor with live preview, plus built-in diagrams.net drawing tools.",
      "toolB": "DokuWiki uses a simple, lightweight wiki markup syntax rather than a documented WYSIWYG editor, and does not document a built-in diagram tool.",
      "whyItMatters": "A visual editor and built-in diagramming lower the barrier for non-technical contributors, while markup-based editing appeals to technically comfortable teams.",
      "benefitsWho": "Non-technical content contributors benefit from BookStack's WYSIWYG editor; technical teams comfortable with markup benefit from DokuWiki's lightweight syntax."
    },
    {
      "title": "Extensibility",
      "toolA": "BookStack's extensibility centers on its built-in feature set rather than a documented plugin marketplace.",
      "toolB": "DokuWiki has a large community plugin and template ecosystem built up since 2004, with over 4,700 GitHub stars.",
      "whyItMatters": "A mature plugin ecosystem lets teams add functionality (specialized markup, integrations) without waiting on core development.",
      "benefitsWho": "Teams with niche or evolving requirements benefit from DokuWiki's large plugin library."
    },
    {
      "title": "Enterprise Authentication",
      "toolA": "BookStack documents OIDC, SAML2, and LDAP support, plus TOTP-based multi-factor authentication.",
      "toolB": "DokuWiki's documented access control is ACL-based, without OIDC/SAML2/LDAP or MFA mentioned in its feature list.",
      "whyItMatters": "Native SSO support matters for organizations that centralize authentication through an identity provider.",
      "benefitsWho": "Organizations with existing SSO/identity infrastructure benefit from BookStack's built-in support for those protocols."
    },
    {
      "title": "Project Maturity",
      "toolA": "BookStack's founding year is not disclosed.",
      "toolB": "DokuWiki has been actively maintained since 2004, with over 4,700 GitHub stars and hundreds of forks.",
      "whyItMatters": "A longer, documented track record can be a signal of stability and long-term plugin/community support.",
      "benefitsWho": "Risk-averse teams evaluating long-term project viability may weigh DokuWiki's disclosed 2004 founding year and larger star count."
    }
  ],
  "featureMatrix": [
    {
      "group": "Storage & Infrastructure",
      "rows": [
        {
          "feature": "Runs without a database",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "BookStack requires MySQL"
        },
        {
          "feature": "Runs on low-cost/shared hosting",
          "toolA": "available",
          "toolB": "available",
          "note": "BookStack cites a budget VPS; DokuWiki needs only PHP"
        },
        {
          "feature": "Revision history",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Plugin/template ecosystem",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Content & Editing",
      "rows": [
        {
          "feature": "WYSIWYG editor",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Markdown editor with live preview",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Built-in diagramming",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "BookStack uses diagrams.net"
        },
        {
          "feature": "Hierarchical Books/Chapters/Pages organization",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Security & Access Control",
      "rows": [
        {
          "feature": "Access control lists / permissions",
          "toolA": "available",
          "toolB": "available",
          "note": "BookStack: roles & permissions; DokuWiki: ACLs"
        },
        {
          "feature": "Enterprise SSO (OIDC/SAML2/LDAP)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Multi-factor authentication",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "BookStack: TOTP-based"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does either require a database?",
      "answer": "BookStack requires MySQL as part of its PHP/Laravel/MySQL stack. DokuWiki explicitly needs no database, storing everything as flat plain-text files."
    },
    {
      "question": "Which is better for very large wikis?",
      "answer": "This isn't clearly documented for either, but DokuWiki's own listed cons note that flat-file storage 'can be slower than a database for very large wikis' — a tradeoff BookStack's MySQL backend is designed to avoid."
    },
    {
      "question": "Which has more enterprise SSO options?",
      "answer": "BookStack documents OIDC, SAML2, and LDAP support. DokuWiki's documented access control is ACL-based, without those SSO protocols listed."
    },
    {
      "question": "Which project has been around longer?",
      "answer": "DokuWiki has been maintained since 2004 (its founded_year is documented as 2004). BookStack's founding year is not disclosed."
    },
    {
      "question": "Do either have built-in diagramming?",
      "answer": "BookStack includes diagrams.net drawing tools directly in its page editor. DokuWiki does not document a built-in diagram tool, though it can likely be extended via its plugin ecosystem."
    },
    {
      "question": "Are both really free?",
      "answer": "Yes — BookStack is MIT licensed and DokuWiki is GPL-2.0 licensed, both fully free and open source with no pricing plans or paid tiers."
    }
  ]
};

export default bookstackVsDokuwikiContent;
