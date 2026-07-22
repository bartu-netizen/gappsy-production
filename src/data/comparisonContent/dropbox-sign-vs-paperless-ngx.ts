import type { ToolComparisonContent } from './types';

const dropboxSignVsPaperlessNgxContent: ToolComparisonContent = {
  "verdict": "Dropbox Sign and Paperless-ngx address adjacent but different steps of a document's life: Dropbox Sign gets documents signed through a freemium e-signature workflow with a developer API, while Paperless-ngx is a free, self-hosted archive that OCRs, tags, and makes existing documents full-text searchable after the fact. Dropbox Sign is about closing a document; Paperless-ngx is about organizing and finding it afterward.",
  "bestForToolA": "Dropbox Sign fits individuals and businesses that need to send documents for legally binding signature, especially those wanting a developer API with webhook support to embed signing into their own product, starting at $15/user/month (Essentials, billed annually) with a free tier for up to 3 requests/month.",
  "bestForToolB": "Paperless-ngx fits people or teams who want a free, self-hosted archive to OCR, tag, and full-text search existing paperwork such as receipts, contracts, and invoices, deployed via Docker Compose.",
  "whoNeedsBoth": "A business could send contracts out for signature through Dropbox Sign, then export the signed PDFs into a self-hosted Paperless-ngx instance for OCR-indexed, searchable long-term archival — a natural sequential pairing rather than overlapping functionality.",
  "keyDifferences": [
    {
      "title": "Core Purpose",
      "toolA": "Dropbox Sign is a signature-request workflow: upload a document, place signature/initial/date fields, assign signers, and send for completion.",
      "toolB": "Paperless-ngx is a document archive: it OCRs, tags, and indexes documents that already exist so they can be searched later.",
      "whyItMatters": "They address different problems — getting something signed versus finding something you already have — so they're typically used together, not as alternatives.",
      "benefitsWho": "Ops and legal teams mapping which tool covers which part of a document's lifecycle."
    },
    {
      "title": "Pricing",
      "toolA": "Dropbox Sign is freemium: a Free plan allows up to 3 signature requests/month, Essentials starts at $15/user/month, Standard at $25/user/month (2-user minimum), and Premium requires contacting sales.",
      "toolB": "Paperless-ngx is completely free and open source under GPL-3.0, with no pricing plans at all.",
      "whyItMatters": "Paperless-ngx has no licensing cost regardless of volume, while Dropbox Sign's cost scales with signature volume and team size beyond the free tier's 3-requests-per-month cap.",
      "benefitsWho": "High-volume signers who will hit Dropbox Sign's paid tiers versus archival-only users who never need to pay for Paperless-ngx."
    },
    {
      "title": "Legal Audit Trail",
      "toolA": "Every Dropbox Sign document includes a tamper-evident audit trail with signer identity, timestamps, IP information, and a certificate of completion, designed to be legally binding under laws like the U.S. ESIGN Act and UETA.",
      "toolB": "Paperless-ngx does not provide any signing or legal-audit-trail capability; it stores and indexes whatever files are uploaded to it.",
      "whyItMatters": "Only Dropbox Sign produces the legal proof needed to establish that a document was actually signed by the intended party.",
      "benefitsWho": "Legal, HR, and sales teams that need enforceable signed agreements, not just stored copies."
    },
    {
      "title": "Deployment",
      "toolA": "Dropbox Sign is a cloud SaaS product with no self-hosting option documented.",
      "toolB": "Paperless-ngx is self-hosted only via Docker Compose, with the project warning that documents are stored unencrypted and it should not run on an untrusted host.",
      "whyItMatters": "Teams wanting full control of where signed-document copies physically live need Paperless-ngx's self-hosting, since Dropbox Sign doesn't offer that.",
      "benefitsWho": "Privacy- and compliance-conscious organizations managing where document copies are stored long-term."
    },
    {
      "title": "Developer API",
      "toolA": "The Dropbox Sign API lets developers embed signature requests, templates, and embedded signing directly into their own application, with webhook support for tracking document status, priced separately from web-app plans.",
      "toolB": "Paperless-ngx's documented facts do not describe a public API for integrations.",
      "whyItMatters": "Developers building signature workflows into their own product have a documented API path only with Dropbox Sign.",
      "benefitsWho": "Product teams embedding e-signature into a SaaS application."
    }
  ],
  "featureMatrix": [
    {
      "group": "Signing & Legal",
      "rows": [
        {
          "feature": "Legally binding e-signature requests",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Audit trail / certificate of completion",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Reusable signing templates",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Bulk send to multiple signers",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Dropbox Sign: Standard plan and above."
        }
      ]
    },
    {
      "group": "Archival & Search",
      "rows": [
        {
          "feature": "OCR ingestion",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Full-text search across archive",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Tagging and organization",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Access & Deployment",
      "rows": [
        {
          "feature": "Free tier",
          "toolA": "available",
          "toolB": "available",
          "note": "Dropbox Sign: 3 requests/month free. Paperless-ngx: fully free."
        },
        {
          "feature": "Self-hosted deployment",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Developer API with webhooks",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Mobile apps",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Dropbox Sign free to use?",
      "answer": "Dropbox Sign offers a free plan that allows up to 3 signature requests per month, with unlimited self-signing. Higher-volume or team use requires upgrading to a paid Essentials, Standard, or Premium plan."
    },
    {
      "question": "Is Paperless-ngx free?",
      "answer": "Yes, Paperless-ngx is fully free and open source under the GPL-3.0 license."
    },
    {
      "question": "Are documents signed with Dropbox Sign legally binding?",
      "answer": "Dropbox Sign is designed to produce legally binding electronic signatures under laws such as the U.S. ESIGN Act and UETA, and each completed document includes an audit trail and certificate of completion. Specific legal requirements can vary by jurisdiction."
    },
    {
      "question": "Can Paperless-ngx collect e-signatures like Dropbox Sign?",
      "answer": "No. Paperless-ngx is a document archival and OCR tool; it does not document any signature-request or legal-audit-trail capability."
    },
    {
      "question": "Does Dropbox Sign have an API?",
      "answer": "Yes. The Dropbox Sign API lets developers embed signature requests, templates, and embedded signing directly into their own applications, with webhook support for tracking document status."
    },
    {
      "question": "Is it safe to store signed contracts in Paperless-ngx?",
      "answer": "The Paperless-ngx developers advise against running it on an untrusted host since documents are stored unencrypted; local, backed-up deployments are recommended for sensitive records."
    }
  ]
};

export default dropboxSignVsPaperlessNgxContent;
