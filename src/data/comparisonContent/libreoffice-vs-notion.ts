import type { ToolComparisonContent } from './types';

const libreofficeVsNotionContent: ToolComparisonContent = {
  "verdict": "LibreOffice is a free, open-source desktop office suite — Writer, Calc, Impress, Draw, Base, and Math — built for creating traditional documents, spreadsheets, and presentations, largely offline. Notion is a freemium, cloud-hosted, AI-powered workspace built around block-based pages and flexible databases for teams to run docs, wikis, and project tracking together. One replaces Microsoft Office; the other replaces a stack of collaboration tools.",
  "bestForToolA": "LibreOffice fits individuals and organizations that need traditional office file types (documents, spreadsheets, presentations, diagrams, formulas) at zero cost, under the Mozilla Public License v2.0, without depending on a cloud service.",
  "bestForToolB": "Notion fits teams that want a single connected workspace for docs, wikis, databases, and project management, with AI-assisted writing, Q&A over their own content, and configurable AI Custom Agents, starting free and scaling to $10-$20 per member/month.",
  "whoNeedsBoth": "A small organization might draft formal reports, spreadsheets, or presentations for external distribution in LibreOffice (leveraging its Writer, Calc, and Impress apps) while running internal project tracking, wikis, and team collaboration in Notion.",
  "keyDifferences": [
    {
      "title": "Deployment Model",
      "toolA": "LibreOffice is installed desktop software; it works offline and has no cloud service or pricing plans documented.",
      "toolB": "Notion is a cloud-hosted SaaS workspace with no self-hosting or offline-first option documented.",
      "whyItMatters": "Offline desktop software works without internet access and keeps files locally, while cloud SaaS enables real-time multi-device collaboration but requires connectivity.",
      "benefitsWho": "Users without reliable internet or with strict local-data requirements benefit from LibreOffice; distributed teams needing real-time collaboration benefit from Notion."
    },
    {
      "title": "Pricing",
      "toolA": "LibreOffice is completely free with no pricing plans documented and no official paid support tier listed.",
      "toolB": "Notion is freemium: Free, then Plus at $10 per member/month, Business at $20 per member/month, and custom Enterprise pricing.",
      "whyItMatters": "Zero-cost software has no budget impact regardless of team size, while per-seat SaaS pricing grows with headcount.",
      "benefitsWho": "Budget-constrained individuals and organizations benefit from LibreOffice; teams that value ongoing cloud features and support may accept Notion's per-seat cost."
    },
    {
      "title": "Application Scope",
      "toolA": "LibreOffice bundles six distinct applications — Writer (word processing), Calc (spreadsheets), Impress (presentations), Draw (diagramming), Base (databases), and Math (formula editing).",
      "toolB": "Notion is a single flexible system of block-based pages and databases that can be viewed as a table, board, calendar, or timeline, rather than separate dedicated apps.",
      "whyItMatters": "Dedicated applications match familiar file formats and workflows, while a unified block/database system trades format familiarity for flexibility and interconnection.",
      "benefitsWho": "Users needing traditional file formats (.docx, .xlsx, .pptx-style workflows) benefit from LibreOffice; users wanting one interconnected system benefit from Notion."
    },
    {
      "title": "AI Features",
      "toolA": "LibreOffice does not document any AI writing, summarization, or automation features.",
      "toolB": "Notion includes AI-assisted writing, Q&A over a team's own Notion content, and configurable AI Custom Agents for workspace automation.",
      "whyItMatters": "AI-assisted drafting and search can meaningfully speed up content and knowledge work, a capability entirely absent from a traditional offline office suite.",
      "benefitsWho": "Teams wanting AI-assisted content creation benefit from Notion; this isn't a factor for LibreOffice users."
    },
    {
      "title": "Real-Time Collaboration",
      "toolA": "LibreOffice does not document built-in real-time multi-user editing across its applications.",
      "toolB": "Notion is built for real-time collaboration across pages and databases as a core part of the product.",
      "whyItMatters": "Teams co-editing the same content simultaneously need a tool designed for concurrent, synced editing.",
      "benefitsWho": "Collaborative teams benefit from Notion; individuals producing standalone documents benefit from LibreOffice's simpler, file-based model."
    }
  ],
  "featureMatrix": [
    {
      "group": "Document Creation",
      "rows": [
        {
          "feature": "Word processing",
          "toolA": "available",
          "toolB": "available",
          "note": "LibreOffice: dedicated Writer app; Notion: block-based pages, not a traditional word processor"
        },
        {
          "feature": "Traditional formula-driven spreadsheet",
          "toolA": "available",
          "toolB": "limited",
          "note": "LibreOffice: dedicated Calc app; Notion databases are structured records, not documented as formula spreadsheets"
        },
        {
          "feature": "Presentation software",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "LibreOffice: dedicated Impress app"
        },
        {
          "feature": "Vector diagramming",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "LibreOffice: dedicated Draw app"
        },
        {
          "feature": "Database management",
          "toolA": "available",
          "toolB": "available",
          "note": "LibreOffice: dedicated Base app; Notion: flexible database views"
        },
        {
          "feature": "Formula/equation editor",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "LibreOffice: dedicated Math app"
        }
      ]
    },
    {
      "group": "AI & Automation",
      "rows": [
        {
          "feature": "AI-assisted writing",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "AI Q&A over your own content",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Configurable AI agents",
          "toolA": "unavailable",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Access & Collaboration",
      "rows": [
        {
          "feature": "Free to use",
          "toolA": "available",
          "toolB": "available",
          "note": "LibreOffice: fully free; Notion: Free plan then $10-$20/member/month"
        },
        {
          "feature": "Offline / no-cloud-dependency use",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Real-time multi-user collaboration",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Open-source license",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "LibreOffice: Mozilla Public License v2.0"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is LibreOffice really free, unlike Notion's paid tiers?",
      "answer": "Yes. LibreOffice has no pricing plans documented — it's free, open-source software under the Mozilla Public License v2.0. Notion has a Free plan too, but paid tiers (Plus, Business, Enterprise) start at $10 per member/month for added collaboration and admin features."
    },
    {
      "question": "Can I use LibreOffice for team collaboration like Notion?",
      "answer": "LibreOffice does not document built-in real-time multi-user editing. Notion is built specifically for real-time collaboration across pages and databases, making it better suited to teams working together on the same content simultaneously."
    },
    {
      "question": "Does LibreOffice have AI features like Notion?",
      "answer": "No AI features are documented for LibreOffice. Notion includes AI-assisted writing, Q&A over your workspace content, and configurable AI Custom Agents."
    },
    {
      "question": "Which applications does LibreOffice include?",
      "answer": "LibreOffice bundles Writer (word processing), Calc (spreadsheets), Impress (presentations), Draw (diagramming), Base (databases), and Math (formula editing) into one suite."
    },
    {
      "question": "Can LibreOffice and Notion be used together?",
      "answer": "Yes. Many organizations produce formal documents, spreadsheets, or presentations in LibreOffice while running project tracking, internal wikis, and team databases in Notion."
    },
    {
      "question": "Does either tool require an internet connection?",
      "answer": "LibreOffice is installed desktop software that works offline. Notion is a cloud-hosted SaaS workspace with no offline-first or self-hosting option documented."
    }
  ]
};

export default libreofficeVsNotionContent;
