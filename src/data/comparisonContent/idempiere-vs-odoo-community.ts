import type { ToolComparisonContent } from './types';

const idempiereVsOdooCommunityContent: ToolComparisonContent = {
  "verdict": "iDempiere is a volunteer-maintained, Tier II open-source ERP/CRM/SCM built on Java, ZK, and OSGi, positioned as a lean core ERP that avoids vendor lock-in. Odoo Community is also free and open-source (LGPLv3) but ships as part of a much larger commercial ecosystem, backed by an 8,000+ employee company, with 40+ integrated apps out of the box and a 40,000+ app marketplace. Firms wanting a narrowly-scoped, community-governed ERP core may prefer iDempiere, while those wanting broad app coverage with an optional path to paid Enterprise support may prefer Odoo Community.",
  "bestForToolA": "iDempiere fits organizations that want a free, vendor-lock-in-free Tier II ERP/CRM/SCM core with enterprise-grade accounting and multi-entity support, run by teams comfortable with Java/ZK/OSGi and Maven-based deployment.",
  "bestForToolB": "Odoo Community fits businesses that want a single free suite spanning accounting, CRM, sales, point of sale, inventory, manufacturing, and HR out of the box, backed by a large company and a 40,000+ app marketplace, with the option to add Odoo.sh hosting.",
  "whoNeedsBoth": "There's no realistic scenario for running both — they're competing open-source ERP suites addressing the same core need, so a business would evaluate and pick one rather than combine them.",
  "keyDifferences": [
    {
      "title": "App/Module Breadth",
      "toolA": "iDempiere's documented feature set centers on enterprise-grade accounting, multi-entity support, and a scalable architecture rather than a large bundled app list.",
      "toolB": "Odoo Community ships 40+ integrated apps out of the box spanning Accounting, Invoicing, Expenses, CRM, Sales, Point of Sale, Inventory, Manufacturing, Purchase, HR, and Website/eCommerce.",
      "whyItMatters": "Determines whether a business gets broad multi-department coverage in one install or a narrower ERP core it extends itself.",
      "benefitsWho": "Multi-department businesses needing CRM, sales, and inventory in one system benefit from Odoo Community's app breadth."
    },
    {
      "title": "Governance & Backing",
      "toolA": "iDempiere is maintained by a volunteer community of specialists, implementors, developers, and end-users worldwide, with no single commercial vendor behind it.",
      "toolB": "Odoo Community is backed by Odoo, a company with 8,000+ employees, which also sells a paid Enterprise edition with extra apps, infrastructure, and professional services.",
      "whyItMatters": "Vendor backing affects the availability of paid support and the long-term product roadmap.",
      "benefitsWho": "Businesses wanting a clear upgrade path to paid commercial support benefit from Odoo Community's Odoo-backed model."
    },
    {
      "title": "Technology Stack",
      "toolA": "iDempiere is built on Java, ZK, and OSGi, using Maven for project management, and supports both Oracle and PostgreSQL databases.",
      "toolB": "Odoo Community runs on a PostgreSQL-based data model with no proprietary data format; its application-layer stack isn't detailed in the available data.",
      "whyItMatters": "The underlying stack determines what in-house development skills a team needs to customize or maintain the system.",
      "benefitsWho": "Teams with existing Java expertise may find iDempiere's Java/ZK/OSGi stack more approachable to extend."
    },
    {
      "title": "Ecosystem Size",
      "toolA": "iDempiere's community ecosystem size (number of add-ons or extensions) is not documented.",
      "toolB": "Odoo Community provides access to a marketplace of 40,000+ community-developed apps.",
      "whyItMatters": "A larger marketplace generally means more pre-built integrations and less custom development.",
      "benefitsWho": "Teams that prefer installing an existing extension over building custom code benefit from Odoo Community's larger marketplace."
    },
    {
      "title": "Deployment & Hosting Options",
      "toolA": "iDempiere is self-hosted; official managed cloud-hosting options are not documented.",
      "toolB": "Odoo Community can be self-hosted or deployed via Odoo's own Odoo.sh cloud hosting platform.",
      "whyItMatters": "Managed hosting reduces the operational burden of running the ERP infrastructure.",
      "benefitsWho": "Teams without dedicated sysadmins benefit from Odoo Community's Odoo.sh managed-hosting option."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Business Modules",
      "rows": [
        {
          "feature": "Accounting",
          "toolA": "available",
          "toolB": "available",
          "note": "iDempiere: enterprise-grade accounting; Odoo: Accounting/Invoicing app"
        },
        {
          "feature": "CRM",
          "toolA": "available",
          "toolB": "available",
          "note": "iDempiere positioned as ERP/CRM/SCM system"
        },
        {
          "feature": "Point of Sale",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Manufacturing/Supply Chain",
          "toolA": "available",
          "toolB": "available",
          "note": "iDempiere: SCM in product name; Odoo: dedicated Manufacturing app"
        },
        {
          "feature": "HR",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Deployment & Technology",
      "rows": [
        {
          "feature": "Self-hosted deployment",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Managed cloud hosting",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Odoo.sh"
        },
        {
          "feature": "Database support",
          "toolA": "available",
          "toolB": "available",
          "note": "iDempiere: Oracle + PostgreSQL; Odoo: PostgreSQL"
        },
        {
          "feature": "Open-source license",
          "toolA": "available",
          "toolB": "available",
          "note": "iDempiere: 'open forever'; Odoo: LGPLv3"
        }
      ]
    },
    {
      "group": "Ecosystem & Support",
      "rows": [
        {
          "feature": "Community app marketplace",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "40,000+ apps"
        },
        {
          "feature": "Commercial vendor backing",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Backed by Odoo (8,000+ employees)"
        },
        {
          "feature": "Paid enterprise upgrade path",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Odoo Enterprise edition"
        },
        {
          "feature": "LTS releases",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "iDempiere 13 'Orion'"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is iDempiere really free?",
      "answer": "Yes. iDempiere is completely free and open-source, and the project states it will remain open forever."
    },
    {
      "question": "Is Odoo Community really free?",
      "answer": "Yes, Odoo Community is open source under LGPLv3 and free to download, install, and modify, with no licensing cost."
    },
    {
      "question": "How do the two compare in app coverage?",
      "answer": "Odoo Community bundles 40+ integrated apps (accounting, CRM, sales, POS, inventory, HR, and more) out of the box, while iDempiere's documented feature set centers on a core ERP/CRM/SCM system with enterprise-grade accounting rather than a large bundled app list."
    },
    {
      "question": "Who maintains each project?",
      "answer": "iDempiere is maintained by a volunteer community of specialists, implementors, developers, and end-users. Odoo Community is backed by Odoo, a company with 8,000+ employees that also sells a paid Enterprise edition."
    },
    {
      "question": "Can either be hosted in the cloud?",
      "answer": "Odoo Community can be deployed via Odoo's own Odoo.sh cloud platform. iDempiere's official hosting options are not documented, implying self-hosting is the standard path."
    },
    {
      "question": "What databases do they support?",
      "answer": "iDempiere supports both Oracle and PostgreSQL databases. Odoo Community runs on a PostgreSQL-based data model."
    }
  ]
};

export default idempiereVsOdooCommunityContent;
