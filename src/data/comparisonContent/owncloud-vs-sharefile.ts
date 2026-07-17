import type { ToolComparisonContent } from './types';

const owncloudVsSharefileContent: ToolComparisonContent = {
  "verdict": "ownCloud is an open-source file sync, share, and collaboration platform with a free, unlimited-user Community Edition plus paid Standard, Enterprise, and ownCloud.online tiers, while ShareFile is a paid, no-free-plan client portal built specifically for client-facing professional services firms in accounting, legal, healthcare, and financial services, with e-signature and compliance tooling. ownCloud is about general team file collaboration and hosting flexibility; ShareFile is about branded, secure external client document exchange.",
  "bestForToolA": "Organizations wanting a free or self-hosted general file sync and share platform with real-time document collaboration via OnlyOffice, Microsoft 365, or Collabora Online - ownCloud cites users like CERN, ETH Zürich, the European Commission, and Fujitsu.",
  "bestForToolB": "Client-facing professional services firms - accounting, legal, financial, healthcare - that need a branded client portal, built-in e-signature (Premium tier and above), and compliance controls aimed at HIPAA, FINRA, and SEC recordkeeping.",
  "whoNeedsBoth": "An accounting firm could run ownCloud internally as its free, general-purpose team file store while using ShareFile's client portal and e-signature workflow specifically to exchange tax documents and collect signatures with external clients.",
  "keyDifferences": [
    {
      "title": "Free Tier Availability",
      "toolA": "The Community Edition is free and open source with unlimited users.",
      "toolB": "No free plan exists; only a free trial across paid tiers starting with Advanced at $18.15/user/month (monthly) or $16.50/user/month (annual), with a 3-user minimum.",
      "whyItMatters": "Budget and team size determine whether a free self-hosted option or a paid seat-based model fits better.",
      "benefitsWho": "Benefits budget-constrained IT teams and small organizations choosing ownCloud's free tier."
    },
    {
      "title": "Client Portal & External Sharing Focus",
      "toolA": "Offers controlled public link sharing with password protection and expiration dates as a general-purpose feature.",
      "toolB": "Provides a purpose-built, branded, permission-controlled secure client portal for uploads and downloads without requiring clients to have internal accounts.",
      "whyItMatters": "Firms whose core workflow is external client document exchange need dedicated portal tooling rather than generic link sharing.",
      "benefitsWho": "Benefits client-facing firms like accounting and legal practices."
    },
    {
      "title": "E-Signature Support",
      "toolA": "Not documented as a feature.",
      "toolB": "Built-in e-signature collection from the Premium tier ($28.60/user/month monthly) upward, alongside document, form, and task requests.",
      "whyItMatters": "Firms collecting signed engagement letters or contracts need native e-signature rather than a bolt-on tool.",
      "benefitsWho": "Benefits firms running signature-dependent client workflows."
    },
    {
      "title": "Minimum Team Size & Pricing Structure",
      "toolA": "Standard and Enterprise plans require a 25-user minimum with custom quotes; the Community Edition has no minimum.",
      "toolB": "All paid plans require a minimum of 3-5 users, with published per-user pricing reaching $77.00/user/month on the Virtual Data Room plan.",
      "whyItMatters": "Very small teams face very different economics - ownCloud's free tier has no floor, while ShareFile always requires paying for at least 3 seats.",
      "benefitsWho": "Benefits solo users or very small teams needing file sharing without a seat minimum, versus firms already sized above ShareFile's minimums."
    },
    {
      "title": "Industry-Specific Workflow Templates",
      "toolA": "No accounting- or legal-specific templates are documented.",
      "toolB": "The Industry Advantage tier ($45.83/user/month monthly) includes pre-built tax engagement templates, bulk client onboarding, and automated engagement letters.",
      "whyItMatters": "Purpose-built templates cut setup time for recurring client engagement workflows.",
      "benefitsWho": "Benefits accounting and tax practices with repeatable client onboarding needs."
    }
  ],
  "featureMatrix": [
    {
      "group": "Storage & Collaboration",
      "rows": [
        {
          "feature": "File sync across desktop/mobile",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Real-time document co-editing",
          "toolA": "available",
          "toolB": "available",
          "note": "ownCloud via OnlyOffice/MS365/Collabora; ShareFile via Office"
        },
        {
          "feature": "Free unlimited-user tier",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "ownCloud Community Edition"
        }
      ]
    },
    {
      "group": "Client-Facing & Security",
      "rows": [
        {
          "feature": "Branded client portal",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "E-signature collection",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Premium tier and above"
        },
        {
          "feature": "Multi-factor authentication",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Compliance certifications named",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "HIPAA/FINRA/SEC-oriented"
        }
      ]
    },
    {
      "group": "Deployment & Pricing",
      "rows": [
        {
          "feature": "Self-hosted option",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Region-specific hosted SaaS",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "ownCloud.online, hosted in Germany"
        },
        {
          "feature": "Minimum users on paid tier",
          "toolA": "limited",
          "toolB": "limited",
          "note": "ownCloud: 25-user minimum; ShareFile: 3-user minimum"
        },
        {
          "feature": "Virtual data room / M&A tools",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "$77/user/month tier"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does ownCloud have a free plan while ShareFile doesn't?",
      "answer": "Yes - ownCloud's Community Edition is free with unlimited users, while ShareFile has no permanent free plan, only a free trial across paid tiers starting at $18.15/user/month."
    },
    {
      "question": "Which tool is better for sharing files with external clients?",
      "answer": "ShareFile is purpose-built for this, with a branded secure client portal and compliance tooling aimed at HIPAA/FINRA/SEC; ownCloud supports link sharing but isn't positioned specifically around client-facing workflows."
    },
    {
      "question": "Can I self-host ShareFile like ownCloud?",
      "answer": "No self-hosted option is documented for ShareFile; ownCloud offers self-hosted Community, Standard, and Enterprise editions plus a hosted ownCloud.online option in Germany."
    },
    {
      "question": "Does ownCloud support e-signatures?",
      "answer": "This is not documented as an ownCloud feature; ShareFile includes built-in e-signature from its Premium tier upward."
    },
    {
      "question": "Are there team-size minimums for either tool?",
      "answer": "ownCloud's Community Edition has no minimum, but its paid Standard/Enterprise tiers require 25 users; ShareFile requires a minimum of 3 users (5 for Virtual Data Room) across all paid plans."
    },
    {
      "question": "Which is cheaper for a very small team?",
      "answer": "ownCloud's free Community Edition has no per-seat cost, making it cheaper for small self-hosting teams; ShareFile always requires at least 3 paid seats starting at $18.15/user/month."
    }
  ]
};

export default owncloudVsSharefileContent;
