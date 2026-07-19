import type { GroupComparisonContent } from './types';

const boldsignVsDochubVsOneflowContent: GroupComparisonContent = {
  "verdict": "BoldSign, DocHub, and Oneflow all start free and support templated document workflows, but they sit at different points on the spectrum from simple e-signing to full contract lifecycle management. BoldSign is the API-first, compliance-heavy option for developers, DocHub pairs light e-signing with a genuine browser PDF editor, and Oneflow reimagines contracts as live, structured, negotiable documents with CRM integration rather than static signed PDFs. Teams choosing between them should weigh whether they need an API, a PDF editor, or full contract lifecycle management.",
  "bestFor": {
    "boldsign": "Software teams embedding e-signing via API at a lower cost than legacy vendors, with strong HIPAA and SOC 2 compliance coverage",
    "dochub": "Individuals and small teams who want free, browser-based PDF editing bundled with light e-signing inside Gmail and Google Drive",
    "oneflow": "Sales, legal, and HR teams that want contracts to be live, data-driven, collaboratively editable documents integrated with a CRM rather than static signed PDFs"
  },
  "highlights": [
    {
      "title": "Oneflow treats contracts as data, not PDFs",
      "description": "Oneflow lets both parties edit and comment on contract content live in a shared digital document, with every field captured as structured data that can feed dashboards and CRM systems like Salesforce and HubSpot.",
      "toolSlugs": [
        "oneflow"
      ]
    },
    {
      "title": "BoldSign is built for embedding",
      "description": "BoldSign offers a REST API, SDKs, and a per-envelope Enterprise API so software companies can embed signing directly into their own product.",
      "toolSlugs": [
        "boldsign"
      ]
    },
    {
      "title": "DocHub adds real PDF editing",
      "description": "Beyond signing, DocHub is a genuine in-browser PDF editor with native Gmail, Google Drive, and Dropbox integration, letting files be marked up without leaving the browser.",
      "toolSlugs": [
        "dochub"
      ]
    },
    {
      "title": "Oneflow is a public, transparent company",
      "description": "Oneflow is publicly traded on Nasdaq First North Premier Growth Market in Stockholm, giving it a level of financial disclosure uncommon among private CLM and e-signature competitors.",
      "toolSlugs": [
        "oneflow"
      ]
    },
    {
      "title": "All three offer a genuinely free tier",
      "description": "BoldSign, DocHub, and Oneflow each let users send and sign basic documents at no cost before hitting a paywall for advanced features.",
      "toolSlugs": [
        "boldsign",
        "dochub",
        "oneflow"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Signing",
      "rows": [
        {
          "feature": "Free plan available",
          "statuses": {
            "boldsign": "available",
            "dochub": "available",
            "oneflow": "available"
          },
          "note": "Oneflow's free tier is limited to basic PDF sending and signing"
        },
        {
          "feature": "Reusable templates",
          "statuses": {
            "boldsign": "available",
            "dochub": "available",
            "oneflow": "available"
          }
        },
        {
          "feature": "Bulk sending",
          "statuses": {
            "boldsign": "available",
            "dochub": "available",
            "oneflow": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Contract and Document Depth",
      "rows": [
        {
          "feature": "Live, collaborative document editing",
          "statuses": {
            "boldsign": "unavailable",
            "dochub": "limited",
            "oneflow": "available"
          },
          "note": "DocHub supports annotation and edits but not live two-party negotiation of contract text"
        },
        {
          "feature": "Native CRM integrations",
          "statuses": {
            "boldsign": "limited",
            "dochub": "not-documented",
            "oneflow": "available"
          },
          "note": "BoldSign connects to Salesforce on its Business plan; Oneflow natively integrates Salesforce and HubSpot"
        }
      ]
    },
    {
      "group": "Compliance and Enterprise",
      "rows": [
        {
          "feature": "HIPAA compliance option",
          "statuses": {
            "boldsign": "available",
            "dochub": "available",
            "oneflow": "not-documented"
          }
        },
        {
          "feature": "Embeddable/developer API",
          "statuses": {
            "boldsign": "available",
            "dochub": "not-documented",
            "oneflow": "available"
          },
          "note": "Oneflow's API access is part of its custom-priced Enterprise plan"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "What is the difference between an e-signature tool and a CLM platform like Oneflow?",
      "answer": "BoldSign and DocHub focus on getting a document signed, while Oneflow is a contract lifecycle management platform that treats the whole contract as structured, editable data, supporting live negotiation, renewal tracking, and CRM sync in addition to signing."
    },
    {
      "question": "Which of these three is cheapest for a small team?",
      "answer": "DocHub's Basic plan starts around $8 per user per month and BoldSign's Growth plan starts around $5 per user per month, both cheaper than Oneflow's Essentials plan at roughly EUR 17 per user per month, though Oneflow's free tier does cover basic PDF signing at no cost."
    },
    {
      "question": "Does DocHub work well for teams outside Google Workspace?",
      "answer": "DocHub can be used independently of Google Workspace since it is a browser-based editor, but its deepest integrations are with Gmail, Google Drive, Google Classroom, and Dropbox, so teams outside that ecosystem get less of the workflow benefit."
    },
    {
      "question": "Can Oneflow's contracts integrate with my CRM?",
      "answer": "Yes, Oneflow offers native integrations with Salesforce, HubSpot, and Microsoft Dynamics so contract data stays in sync with the rest of the sales stack; this is a core part of its data-driven contract model."
    },
    {
      "question": "Which tool is best for compliance-heavy industries like healthcare?",
      "answer": "BoldSign and DocHub both document explicit HIPAA compliance options (on BoldSign's Business plan and DocHub's Site License tier respectively), while Oneflow's provided data does not document HIPAA support."
    },
    {
      "question": "Is Oneflow's free tier comparable to BoldSign's or DocHub's?",
      "answer": "Not exactly. Oneflow's free tier covers sending and signing basic PDF contracts with limited templates, while BoldSign's free Essential plan includes 25 envelopes a month and DocHub's free plan includes basic PDF editing plus a handful of e-signature requests, so the free tiers differ in scope rather than being directly equivalent."
    }
  ]
};

export default boldsignVsDochubVsOneflowContent;
