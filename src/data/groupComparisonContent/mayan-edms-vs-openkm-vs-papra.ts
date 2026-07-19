import type { GroupComparisonContent } from './types';

const mayanEdmsVsOpenkmVsPapraContent: GroupComparisonContent = {
  "verdict": "Mayan EDMS, OpenKM and Papra all let you self-host a searchable, tag-and-metadata-driven document store for free, but they aim at different scales of the same problem. Mayan EDMS and OpenKM are built for enterprise-grade document management with workflow engines, records management and compliance features, while Papra is a lightweight archiving tool built for individuals and small teams who want a simple, low-maintenance filing cabinet with email ingestion and automatic tagging. None is a straightforward 'best' pick; the right choice depends on whether you need enterprise workflow depth or a fast, minimal self-hosted archive.",
  "bestFor": {
    "mayan-edms": "Organizations that need enterprise-scale, multi-language OCR document management with a flexible metadata-and-cabinet model and no licensing fees, and have the Docker/Django skills to run it.",
    "openkm": "Compliance-heavy teams (legal, healthcare, government) that need formal records management and jBPM-based workflow automation, with the option to add vendor support via a paid edition.",
    "papra": "Individuals, freelancers and small teams who want a lightweight, easy self-hosted (or low-cost cloud) document archive with email ingestion and automatic tagging rather than a full enterprise DMS."
  },
  "highlights": [
    {
      "title": "Enterprise scale and distributed OCR",
      "description": "Mayan EDMS is architected to scale from small deployments to repositories with hundreds of millions of documents, with OCR workloads that can be distributed across multiple worker nodes for large installs.",
      "toolSlugs": [
        "mayan-edms"
      ]
    },
    {
      "title": "Formal records management and workflow",
      "description": "OpenKM pairs a jBPM-based workflow engine with dedicated records management (RM) features for retention schedules and regulatory compliance, plus an optional paid Professional or Cloud edition with vendor support.",
      "toolSlugs": [
        "openkm"
      ]
    },
    {
      "title": "Lightweight footprint, fast to run",
      "description": "Papra ships as a Docker image under 200MB and is explicitly designed for people who found tools like Evernote or enterprise DMS platforms too complex, prioritizing simplicity over feature breadth.",
      "toolSlugs": [
        "papra"
      ]
    },
    {
      "title": "Automated intake differs sharply",
      "description": "Papra automates document intake with a dedicated email-ingestion address and configurable auto-tagging rules, a workflow Mayan EDMS and OpenKM do not document as a built-in capability.",
      "toolSlugs": [
        "papra"
      ]
    },
    {
      "title": "Both enterprise options add e-signature capability",
      "description": "Mayan EDMS verifies embedded cryptographic signatures and detached signature files, while OpenKM includes native digital signature support; Papra does not document e-signature functionality.",
      "toolSlugs": [
        "mayan-edms",
        "openkm"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core document handling",
      "rows": [
        {
          "feature": "OCR / text extraction",
          "statuses": {
            "mayan-edms": "available",
            "openkm": "available",
            "papra": "available"
          },
          "note": "Mayan EDMS uses Tesseract across 100+ languages with distributed processing; OpenKM includes OCR with full-text search; Papra extracts text from scans and images for full-text search."
        },
        {
          "feature": "Custom metadata and tagging",
          "statuses": {
            "mayan-edms": "available",
            "openkm": "available",
            "papra": "available"
          },
          "note": "Mayan EDMS uses metadata fields, tags and cabinets; OpenKM uses metadata and taxonomy structures; Papra uses tags plus automatic tagging rules."
        },
        {
          "feature": "Document versioning",
          "statuses": {
            "mayan-edms": "available",
            "openkm": "available",
            "papra": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Process and compliance",
      "rows": [
        {
          "feature": "Workflow / business process automation",
          "statuses": {
            "mayan-edms": "available",
            "openkm": "available",
            "papra": "unavailable"
          },
          "note": "Mayan EDMS has its own workflow engine; OpenKM uses jBPM; Papra targets archiving rather than process automation."
        },
        {
          "feature": "Records management (retention/compliance)",
          "statuses": {
            "mayan-edms": "not-documented",
            "openkm": "available",
            "papra": "unavailable"
          }
        },
        {
          "feature": "Electronic/digital signature",
          "statuses": {
            "mayan-edms": "available",
            "openkm": "available",
            "papra": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Deployment and access",
      "rows": [
        {
          "feature": "Self-hosted deployment",
          "statuses": {
            "mayan-edms": "available",
            "openkm": "available",
            "papra": "available"
          },
          "note": "Mayan EDMS deploys via Docker, Docker Compose or Kubernetes; OpenKM Community Edition is self-hosted; Papra ships as a Docker image under 200MB."
        },
        {
          "feature": "Managed cloud/SaaS option",
          "statuses": {
            "mayan-edms": "unavailable",
            "openkm": "available",
            "papra": "available"
          },
          "note": "OpenKM offers a Cloud edition priced on request; Papra offers Free, Plus and Pro cloud tiers hosted in Europe."
        },
        {
          "feature": "Email-based document ingestion",
          "statuses": {
            "mayan-edms": "not-documented",
            "openkm": "not-documented",
            "papra": "available"
          }
        },
        {
          "feature": "REST API",
          "statuses": {
            "mayan-edms": "not-documented",
            "openkm": "available",
            "papra": "available"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three is easiest for a non-technical team to run?",
      "answer": "Papra is the lightest to operate, shipping as a Docker image under 200MB with a managed cloud option starting at $9/month ($7.50/month billed annually) for teams that don't want to self-host at all. Mayan EDMS and OpenKM require more Docker/Django or Java administration skill and have no first-party managed offering as accessible for small teams."
    },
    {
      "question": "Do any of these tools include workflow automation?",
      "answer": "Yes. Mayan EDMS has a built-in workflow engine that tracks document state and triggers actions on changes, and OpenKM automates approval chains and business processes with a jBPM-based engine. Papra is focused on archiving and search rather than workflow automation."
    },
    {
      "question": "Which tool is best suited to regulatory or compliance-heavy industries?",
      "answer": "OpenKM has dedicated records management (RM) features built for retention schedules and regulatory compliance, making it the strongest documented fit for legal, healthcare or government use cases among the three. Mayan EDMS supports electronic signature verification but does not document a dedicated RM module, and Papra does not document compliance certifications."
    },
    {
      "question": "Can any of these scale to a very large document repository?",
      "answer": "Mayan EDMS is explicitly architected to scale to repositories with hundreds of millions of documents, with OCR that can be distributed across multiple worker nodes. OpenKM scales from small teams to large enterprise deployments. Papra is a younger project (started 2025) built primarily for individuals and small teams."
    },
    {
      "question": "Are all three free to use?",
      "answer": "Mayan EDMS is free and open source under Apache 2.0 with only optional paid consulting. OpenKM's Community Edition is free and open source, while its Professional and Cloud editions are paid and custom-quoted. Papra is free to self-host under AGPL-3.0, with an optional paid cloud tier starting at $7.50/month billed annually."
    },
    {
      "question": "Which tool has the most mature project history?",
      "answer": "Mayan EDMS is the most established, founded in 2010 with over 200 releases and more than 100 contributors. OpenKM was founded in 2005 as a company. Papra is the newest of the three, started as a side project in January 2025."
    }
  ]
};

export default mayanEdmsVsOpenkmVsPapraContent;
