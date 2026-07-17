import type { ToolComparisonContent } from './types';

const dropboxSignVsSignserverContent: ToolComparisonContent = {
  "verdict": "Dropbox Sign and SignServer both involve \"signing\" but for entirely different things: Dropbox Sign is a SaaS e-signature platform for humans signing contracts, NDAs, and business documents, while SignServer is open-source, server-side cryptographic signing infrastructure for code, timestamps, and firmware — the kind of signing a DevOps or security team runs in a CI/CD pipeline, not something a salesperson sends to a client. The overlap is the word \"signing\"; the actual buyers and use cases rarely intersect.",
  "bestForToolA": "Dropbox Sign fits sales, HR, and legal teams that need people to review and sign contracts or agreements online, with a free tier for up to 3 requests/month and a developer API for embedding signature workflows into other products.",
  "bestForToolB": "SignServer fits engineering and security teams that need to cryptographically sign code (JAR, CMS, OpenPGP, Debian packages), timestamp artifacts, or sign secure-boot and OTA firmware images, deployable via Docker, Kubernetes Helm charts, or Ansible, with a free Community Edition under LGPL v2.1.",
  "whoNeedsBoth": "A software company could use SignServer to cryptographically sign its code releases and firmware updates in CI/CD while using Dropbox Sign to get vendor contracts, NDAs, and customer agreements signed by humans — genuinely different signing needs that can coexist inside the same organization.",
  "keyDifferences": [
    {
      "title": "What Is Being Signed",
      "toolA": "Dropbox Sign handles human signatures on business documents like contracts and NDAs, with fields for signature, initials, date, and text.",
      "toolB": "SignServer performs cryptographic, server-side signing of code, documents, timestamps, and secure boot/OTA firmware images, keeping keys centralized rather than on individual machines.",
      "whyItMatters": "These are fundamentally different kinds of \"signing\" — one is a legal human action, the other is a cryptographic proof of authenticity — so mismatching the tool to the need wastes evaluation time.",
      "benefitsWho": "Buyers who searched \"e-signature\" or \"document signing\" and need to confirm which category actually fits their need."
    },
    {
      "title": "Target Team",
      "toolA": "Dropbox Sign is aimed at business users — sales, legal, HR, operations — sending documents for signature through a web interface or mobile app.",
      "toolB": "SignServer is aimed at DevOps and security engineering teams integrating signing into CI/CD pipelines and infrastructure.",
      "whyItMatters": "The buyer persona and procurement path differ completely, even though both products use the word \"signing.\"",
      "benefitsWho": "IT and procurement teams routing purchase requests to the right department."
    },
    {
      "title": "Pricing Transparency",
      "toolA": "Dropbox Sign publishes clear tiers: Free (3 requests/month), Essentials at $15/user/month, Standard at $25/user/month (2-user minimum), and Premium by contacting sales.",
      "toolB": "SignServer's Community Edition is free under LGPL v2.1, while Enterprise Edition pricing is not publicly listed and requires a trial or sales contact, though a 30-day trial is available on AWS/Azure.",
      "whyItMatters": "Business buyers can budget precisely with Dropbox Sign's published per-user pricing, while SignServer's production-grade tier requires a sales conversation.",
      "benefitsWho": "Finance and procurement teams needing predictable pricing versus engineering teams comfortable negotiating enterprise deals."
    },
    {
      "title": "Deployment Model",
      "toolA": "Dropbox Sign is delivered as a cloud SaaS product with no self-hosting option documented.",
      "toolB": "SignServer is open source and self-hostable via Docker, Kubernetes Helm charts, or Ansible, with an Enterprise Edition also offering SaaS/Cloud/Appliance deployment options.",
      "whyItMatters": "Teams needing to run signing infrastructure inside their own network perimeter (for key custody or compliance reasons) can only do that with SignServer.",
      "benefitsWho": "Security-conscious engineering teams that must keep signing keys within their own infrastructure."
    },
    {
      "title": "Production Readiness of the Free Tier",
      "toolA": "Dropbox Sign's Free plan is explicitly usable for real signature requests (capped at 3/month), and paid plans are production-ready for business volume.",
      "toolB": "Keyfactor, which backs SignServer, states its free Community Edition is intended for learning, testing, and prototyping, not production signing environments; production use is recommended on the paid Enterprise Edition.",
      "whyItMatters": "A team assuming SignServer's free tier is production-safe could be caught off guard, since the vendor itself recommends the paid tier for real deployments.",
      "benefitsWho": "Engineering teams evaluating whether they can ship on SignServer's free tier or need to budget for Enterprise."
    }
  ],
  "featureMatrix": [
    {
      "group": "Signing Type",
      "rows": [
        {
          "feature": "Human e-signature on business documents",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Cryptographic code signing (JAR, CMS, OpenPGP, Debian)",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Timestamping services",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Secure boot / OTA firmware signing",
          "toolA": "unavailable",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Legal & Business Workflow",
      "rows": [
        {
          "feature": "Audit trail / certificate of completion for contracts",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Reusable document templates",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Bulk send to multiple signers",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Custom branding on signing page",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Dropbox Sign: Standard and Premium plans."
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
          "note": "Dropbox Sign: 3 requests/month. SignServer: Community Edition, LGPL v2.1."
        },
        {
          "feature": "Self-hosted deployment",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Container/DevOps deployment (Docker, Kubernetes, Ansible)",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Post-quantum cryptography support",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Are Dropbox Sign and SignServer the same kind of \"signing\" tool?",
      "answer": "No. Dropbox Sign handles human e-signatures on business documents like contracts, while SignServer performs cryptographic server-side signing of code, timestamps, and firmware — a completely different technical function."
    },
    {
      "question": "Is Dropbox Sign free to use?",
      "answer": "Dropbox Sign offers a free plan allowing up to 3 signature requests per month, with unlimited self-signing. Higher volume requires a paid Essentials, Standard, or Premium plan."
    },
    {
      "question": "Is SignServer free?",
      "answer": "The Community Edition is free and open source under LGPL v2.1. A paid Enterprise Edition with SLAs and additional security features is also available, though Keyfactor states the Community Edition is not intended for production."
    },
    {
      "question": "Can SignServer be used to get a contract signed by a customer?",
      "answer": "No. SignServer performs cryptographic signing of code, documents' hashes, timestamps, and firmware images at the server level; it does not offer a human signature-request workflow like Dropbox Sign's."
    },
    {
      "question": "Can SignServer be self-hosted?",
      "answer": "Yes. It can be deployed via Docker, Kubernetes Helm charts, Ansible, or on cloud platforms like AWS and Azure. Dropbox Sign, by contrast, is cloud SaaS only with no self-hosting option documented."
    },
    {
      "question": "Does Dropbox Sign support code signing like SignServer?",
      "answer": "No. Dropbox Sign's features are built around signature requests, templates, and audit trails for business documents, not cryptographic code, firmware, or timestamp signing."
    }
  ]
};

export default dropboxSignVsSignserverContent;
