import type { GroupComparisonContent } from './types';

const docspellVsPapermergeVsTeedyContent: GroupComparisonContent = {
  "verdict": "Docspell, Papermerge, and Teedy are all free, open-source, self-hosted document organizers aimed at individuals and small teams rather than large enterprises. They differ mainly in their standout feature: Docspell's machine-learning-assisted auto-tagging, Papermerge's API-first multi-user permission model, and Teedy's minimal footprint plus optional hosted cloud version. All three are frequently compared to the larger Paperless-ngx project rather than to each other exclusively.",
  "bestFor": {
    "docspell": "Privacy-conscious individuals and families who want machine-learning-assisted tagging and a shared 'collectives' model for household documents",
    "papermerge": "Developers and small teams who want an API-first document management system with granular multi-user permissions and sharing",
    "teedy": "Users wanting the lightest-weight self-hosted document management system, with an optional hosted cloud alternative"
  },
  "highlights": [
    {
      "title": "Papermerge is API-first with granular sharing",
      "description": "Papermerge exposes an OpenAPI-compliant REST API and is built around multi-user permissions with group ownership and sharing, making it well suited to teams that want to build custom integrations on top of a self-hosted archive.",
      "toolSlugs": [
        "papermerge"
      ]
    },
    {
      "title": "Docspell learns your filing habits",
      "description": "Docspell uses OCR plus natural language processing to suggest correspondents, tags, and dates, improving over time, and organizes documents around shared 'collectives' for households or small groups.",
      "toolSlugs": [
        "docspell"
      ]
    },
    {
      "title": "Teedy runs almost anywhere",
      "description": "Teedy has been reported to scale to roughly one million documents and can run on hardware from a Raspberry Pi to Kubernetes, with an optional hosted cloud version at teedy.io.",
      "toolSlugs": [
        "teedy"
      ]
    },
    {
      "title": "All three are free with no feature paywalls",
      "description": "Docspell, Papermerge, and Teedy each provide their full self-hosted feature set for free, without a commercial tier gating core functionality.",
      "toolSlugs": [
        "docspell",
        "papermerge",
        "teedy"
      ]
    },
    {
      "title": "All three are smaller, community-driven projects",
      "description": "None of the three has the scale of the much larger Paperless-ngx community; each is maintained by a small team or individual, which can mean slower feature velocity but also less commercial pressure toward paid tiers.",
      "toolSlugs": [
        "docspell",
        "papermerge",
        "teedy"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Document Management",
      "rows": [
        {
          "feature": "Free, open-source, self-hosted",
          "statuses": {
            "docspell": "available",
            "papermerge": "available",
            "teedy": "available"
          }
        },
        {
          "feature": "OCR text extraction",
          "statuses": {
            "docspell": "available",
            "papermerge": "available",
            "teedy": "available"
          }
        },
        {
          "feature": "Full-text search",
          "statuses": {
            "docspell": "available",
            "papermerge": "available",
            "teedy": "available"
          }
        },
        {
          "feature": "REST API",
          "statuses": {
            "docspell": "available",
            "papermerge": "available",
            "teedy": "available"
          }
        }
      ]
    },
    {
      "group": "Organization and Access Control",
      "rows": [
        {
          "feature": "Machine-learning-assisted auto-tagging",
          "statuses": {
            "docspell": "available",
            "papermerge": "not-documented",
            "teedy": "not-documented"
          }
        },
        {
          "feature": "Granular multi-user permissions",
          "statuses": {
            "docspell": "limited",
            "papermerge": "available",
            "teedy": "available"
          },
          "note": "Docspell shares documents via 'collectives' rather than fine-grained per-document permissions"
        },
        {
          "feature": "Native mobile app",
          "statuses": {
            "docspell": "available",
            "papermerge": "not-documented",
            "teedy": "available"
          }
        }
      ]
    },
    {
      "group": "Deployment",
      "rows": [
        {
          "feature": "Optional managed/hosted cloud version",
          "statuses": {
            "docspell": "not-documented",
            "papermerge": "not-documented",
            "teedy": "available"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Are Docspell, Papermerge, and Teedy really free to use?",
      "answer": "Yes. Docspell (AGPLv3), Papermerge (Apache 2.0), and Teedy's self-hosted edition (GPL) are all fully open source with no feature paywalls; the only real cost is the infrastructure you run them on."
    },
    {
      "question": "Which tool has the best multi-user permission model?",
      "answer": "Papermerge, which is built around multi-user permissions with group ownership and sharing and an API-first design, compared to Docspell's simpler shared 'collectives' model and Teedy's user and group-based access control."
    },
    {
      "question": "Which is easiest to run on minimal hardware?",
      "answer": "Teedy, which has been reported to run on hardware ranging from a Raspberry Pi to Kubernetes clusters and can operate with an embedded H2 database for smaller deployments."
    },
    {
      "question": "Do any of these offer a managed cloud option?",
      "answer": "Teedy is the only one with an official hosted cloud version, teedy.io, priced from about EUR 19 per user per month. Docspell and Papermerge do not document an official managed cloud offering."
    },
    {
      "question": "How do these compare to Paperless-ngx?",
      "answer": "Both Docspell and Papermerge position themselves relative to Paperless-ngx, a larger and more widely adopted open-source document organizer; Papermerge in particular notes it has roughly 500 GitHub stars versus Paperless-ngx's more than 40,000, reflecting a much smaller community for all three tools compared here."
    },
    {
      "question": "Which has the strongest automatic tagging or metadata extraction?",
      "answer": "Docspell, which combines OCR with natural language processing to suggest correspondents, tags, and dates, and improves its suggestions as users confirm or correct them over time."
    }
  ]
};

export default docspellVsPapermergeVsTeedyContent;
