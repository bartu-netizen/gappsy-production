import type { ToolComparisonContent } from './types';

const formIoVsGoogleFormsContent: ToolComparisonContent = {
  "verdict": "Form.io is a self-hosted or enterprise SaaS platform that turns JSON-driven form schemas into REST APIs, PDFs, and data workflows for developers, while Google Forms is a free, no-setup tool for building surveys and quizzes tied to a Google account and Google Sheets. Form.io starts at $330/month for an Enterprise Project (or free if self-hosted with developer effort); Google Forms costs nothing for its core feature set. They serve very different budgets and technical depths rather than competing head-to-head for the same buyer.",
  "bestForToolA": "Development teams and enterprises (Form.io lists customers like Accenture, Deloitte, and PepsiCo) that need forms to automatically become REST API endpoints, generate data-bound PDFs, or support multi-tenant SaaS projects with RBAC and SAML SSO.",
  "bestForToolB": "Individuals, teachers, and small teams who need a free, fast way to build surveys, quizzes with auto-grading, or feedback forms that funnel responses straight into a Google Sheet with zero setup.",
  "whoNeedsBoth": "A university department might use Google Forms for day-to-day event RSVPs and course feedback surveys while a separate IT team builds Form.io-powered application forms that need to hit a REST API and generate signed PDF transcripts for the registrar's office.",
  "keyDifferences": [
    {
      "title": "Deployment and Hosting",
      "toolA": "Form.io can be self-hosted (open-source core including the formio.js SDK and Universal Agent Gateway) or run as SaaS starting at $330/month per Enterprise Project.",
      "toolB": "Google Forms is Google-hosted only, with no self-hosted option, and is tied to a Google account.",
      "whyItMatters": "Teams with data-residency or infrastructure requirements need self-hosting, which only Form.io offers.",
      "benefitsWho": "Benefits engineering and IT teams with compliance or on-prem requirements."
    },
    {
      "title": "API and Data Workflow Depth",
      "toolA": "Every Form.io form automatically becomes a RESTful API endpoint, and the platform supports embedded MongoDB-aggregation reporting plus PDF form generation.",
      "toolB": "Google Forms has no automatic API generation; extending it requires Google Workspace Marketplace add-ons or Apps Script.",
      "whyItMatters": "Apps that need programmatic access to submission data require built-in APIs rather than scripted workarounds.",
      "benefitsWho": "Benefits developers building custom applications around form data."
    },
    {
      "title": "Pricing Model",
      "toolA": "$330/month for the Enterprise Project plan (or $660/month for a dedicated API Server Plus), priced by configuration rather than per submission.",
      "toolB": "Free for core features via the Personal plan; Business Starter (Google Workspace) begins at $6/user/month if bundled admin and email features are needed.",
      "whyItMatters": "Budget-conscious individuals and companies with dedicated software budgets need very different price points.",
      "benefitsWho": "Benefits solo users and small nonprofits on Google Forms' free tier versus enterprises with dedicated Form.io budgets."
    },
    {
      "title": "E-Signature and PDF Output",
      "toolA": "Includes E-Sign+ cryptographic digital signatures bound to submission data, plus PDF form conversion.",
      "toolB": "No native e-signature or PDF generation feature is documented.",
      "whyItMatters": "Legal and compliance workflows that require signed documents need this capability natively.",
      "benefitsWho": "Benefits legal, HR, and government teams needing signed, auditable documents."
    },
    {
      "title": "Ease of Use and Setup",
      "toolA": "Requires developer resources for self-hosting and configuration-based setup.",
      "toolB": "No-code: sign in with a Google account and start building immediately, with real-time collaborative editing.",
      "whyItMatters": "Time-to-first-form matters most for non-technical users without engineering support.",
      "benefitsWho": "Benefits teachers, marketers, and small business owners without a development team."
    }
  ],
  "featureMatrix": [
    {
      "group": "Form Building & Logic",
      "rows": [
        {
          "feature": "Drag-and-drop builder",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Conditional/branching logic",
          "toolA": "available",
          "toolB": "limited",
          "note": "Google Forms offers section-based branching only"
        },
        {
          "feature": "Broad question/field type variety",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Multiple choice, checkboxes, grids, file upload, date/time, and more"
        },
        {
          "feature": "Real-time collaborative editing",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Data & Integration",
      "rows": [
        {
          "feature": "Automatic REST API generation",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "PDF generation / data-bound PDFs",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Native spreadsheet sync",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Google Sheets"
        },
        {
          "feature": "Third-party extensibility",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Apps Script and Marketplace add-ons"
        }
      ]
    },
    {
      "group": "Security & Access Control",
      "rows": [
        {
          "feature": "Role-based access control",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "SAML SSO",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Multi-tenancy",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "E-signature",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Form.io's E-Sign+"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Form.io more expensive than Google Forms?",
      "answer": "Yes. Form.io's SaaS starts at $330/month per Enterprise Project (or free if self-hosted with developer effort), while Google Forms' core functionality is free with a Google account."
    },
    {
      "question": "Can Google Forms generate an API like Form.io?",
      "answer": "No, Google Forms has no automatic API generation; Form.io turns every form into a RESTful API endpoint automatically."
    },
    {
      "question": "Does Google Forms support e-signatures?",
      "answer": "This is not documented as a Google Forms feature. Form.io includes E-Sign+ digital signatures bound to submissions."
    },
    {
      "question": "Can Form.io be used for free?",
      "answer": "Form.io offers a free, open-source self-hosted core (the formio.js SDK), plus a 30-day free SaaS trial with no credit card required; Google Forms is free indefinitely for its core features."
    },
    {
      "question": "Which tool is better for a quick class quiz?",
      "answer": "Google Forms, thanks to its built-in quiz mode with point values, answer keys, and automatic grading, requiring no technical setup."
    },
    {
      "question": "Which tool fits a multi-tenant SaaS product?",
      "answer": "Form.io, since it includes built-in multi-tenancy for running isolated sub-projects from one deployment, a feature Google Forms doesn't offer."
    }
  ]
};

export default formIoVsGoogleFormsContent;
