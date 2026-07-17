import type { ToolComparisonContent } from './types';

const archivesspaceVsDocumizeContent: ToolComparisonContent = {
  "verdict": "ArchivesSpace is a free, open-source archival collections management system governed as a membership-funded nonprofit program with a published roadmap through FY2030, built for archives and special-collections institutions. Documize is a self-hosted business documentation platform with a free tier for up to 5 users and paid annual plans ($900-$1,800/year) built around content approval workflows and granular permissions for internal company knowledge. The two serve different institutional needs — archival records description versus everyday team documentation — despite both being open, self-hostable knowledge-management tools.",
  "bestForToolA": "Archives, libraries, and special-collections institutions that want a nonprofit-governed, open-source system with a transparent, published multi-year roadmap.",
  "bestForToolB": "Businesses and teams that need internal documentation with formal draft/review/approve/publish workflows, granular permissions, and enterprise authentication.",
  "whoNeedsBoth": "A university library could use ArchivesSpace to manage its archival collection records while using Documize internally to document its own staff processes and procedures — plausible since one manages archival metadata and the other manages internal operational knowledge.",
  "keyDifferences": [
    {
      "title": "Primary Purpose",
      "toolA": "ArchivesSpace is built for archival collections management within institutions like archives and libraries.",
      "toolB": "Documize is built for internal team documentation with structured content workflows.",
      "whyItMatters": "The two tools solve different jobs, so choosing between them depends entirely on whether the need is archival description or company documentation.",
      "benefitsWho": "Archival institutions need ArchivesSpace's specialized purpose; business teams need Documize's."
    },
    {
      "title": "Governance Model",
      "toolA": "ArchivesSpace is governed as a membership-funded nonprofit program with annual reports and a published strategic roadmap covering FY2026 through FY2030.",
      "toolB": "Documize is a freemium/paid vendor product with no comparable public governance structure documented.",
      "whyItMatters": "Nonprofit, membership-funded governance offers a different long-term stability and transparency model than a vendor-run product.",
      "benefitsWho": "Institutions that value community governance and public accountability benefit from ArchivesSpace's model."
    },
    {
      "title": "Pricing",
      "toolA": "ArchivesSpace is free and open source with no pricing plans documented.",
      "toolB": "Documize is freemium, with paid annual tiers reaching $1,800/year for unlimited users.",
      "whyItMatters": "Cost structure affects budget planning differently for a fully free nonprofit tool versus a freemium commercial product.",
      "benefitsWho": "Cost-constrained institutions benefit from ArchivesSpace's fully free model; teams needing vendor-provided paid support benefit from Documize's paid tiers."
    },
    {
      "title": "Content Workflow",
      "toolA": "ArchivesSpace has no documented content approval workflow (draft/review/approve/publish) comparable to Documize's.",
      "toolB": "Documize documents defined workflow stages: draft, review, approve, and publish.",
      "whyItMatters": "A formal approval workflow matters for teams publishing internal documentation that needs sign-off, unlike archival cataloging.",
      "benefitsWho": "Business teams with formal publishing sign-off requirements benefit from Documize's workflow."
    },
    {
      "title": "Transparency & Reporting",
      "toolA": "ArchivesSpace publishes a public roadmap through FY2030 and annual reports, described as unusual transparency for infrastructure software.",
      "toolB": "Documize does not document a comparable public roadmap or annual report.",
      "whyItMatters": "Public roadmaps and reports help institutions plan long-term around the software's future direction.",
      "benefitsWho": "Institutions doing multi-year technology planning benefit from ArchivesSpace's documented transparency."
    }
  ],
  "featureMatrix": [
    {
      "group": "Purpose & Governance",
      "rows": [
        {
          "feature": "Archival collections management",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Internal team documentation",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Nonprofit/membership governance",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Published public roadmap",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "FY2026-FY2030"
        }
      ]
    },
    {
      "group": "Content Management",
      "rows": [
        {
          "feature": "Content approval workflow (draft/review/approve/publish)",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Granular space/document permissions",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Multiple supported databases",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "PostgreSQL, SQL Server, MySQL, MariaDB, Percona"
        }
      ]
    },
    {
      "group": "Pricing & Access",
      "rows": [
        {
          "feature": "Free to use",
          "toolA": "available",
          "toolB": "available",
          "note": "ArchivesSpace fully free; Documize free tier up to 5 users"
        },
        {
          "feature": "Paid enterprise tier",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "$1,800/year, unlimited users"
        },
        {
          "feature": "Published FAQ documentation",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is ArchivesSpace free to use?",
      "answer": "Yes, it is free and open source."
    },
    {
      "question": "Is Documize free to use?",
      "answer": "Yes, for up to 5 users, with paid Essential ($900/year) and Enterprise ($1,800/year) tiers beyond that."
    },
    {
      "question": "Does ArchivesSpace publish a roadmap?",
      "answer": "Yes, a public strategic roadmap covering FY2026 through FY2030."
    },
    {
      "question": "Does Documize support content approval workflows?",
      "answer": "Yes, through draft, review, approve, and publish lifecycle stages."
    },
    {
      "question": "How is ArchivesSpace governed?",
      "answer": "As a membership-funded nonprofit program with annual reports."
    },
    {
      "question": "What databases does Documize support?",
      "answer": "PostgreSQL, SQL Server, MySQL, MariaDB, and Percona."
    }
  ]
};

export default archivesspaceVsDocumizeContent;
