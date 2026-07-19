import type { GroupComparisonContent } from './types';

const appsmithVsBaserowVsGlideContent: GroupComparisonContent = {
  "verdict": "Appsmith, Baserow, and Glide all fall under the no-code umbrella, but they solve different problems for different builders. Appsmith is a developer-friendly, open-source low-code platform for wiring up internal tools and admin panels against existing databases and APIs, with a JavaScript escape hatch and self-hosting for compliance needs. Baserow is an open-source, Airtable-style relational database that non-developers can self-host for full data ownership. Glide is the most accessible of the three for non-technical builders, turning a spreadsheet into a working mobile-first app in minutes, increasingly with AI-generated first drafts.",
  "bestFor": {
    "appsmith": "Engineering and IT teams building custom internal tools and admin panels connected to existing databases and APIs, especially those that need self-hosting or air-gapped deployment.",
    "baserow": "Teams that want an open-source, self-hostable Airtable alternative with full ownership of their relational data.",
    "glide": "Operations, HR, and field teams turning an existing spreadsheet into a mobile-friendly business app quickly, including with AI-generated first drafts."
  },
  "highlights": [
    {
      "title": "Open-source, self-hostable cores",
      "description": "Appsmith and Baserow both ship a fully open-source community edition that can be self-hosted for free, giving compliance-focused teams full control over their infrastructure; Glide offers no self-hosting option.",
      "toolSlugs": [
        "appsmith",
        "baserow"
      ]
    },
    {
      "title": "Developer flexibility versus no-code simplicity",
      "description": "Appsmith is built for engineers who want a JavaScript escape hatch when the visual builder falls short, while Baserow and Glide are designed to be used entirely without writing code.",
      "toolSlugs": [
        "appsmith"
      ]
    },
    {
      "title": "Spreadsheet-to-app on-ramp",
      "description": "Glide's core strength is turning a Google Sheet, Airtable base, or Excel file directly into a mobile-friendly app with real-time two-way sync, a use case neither Appsmith nor Baserow is built around.",
      "toolSlugs": [
        "glide"
      ]
    },
    {
      "title": "Database-first data model",
      "description": "Baserow provides multiple native views (grid, gallery, kanban, calendar) over a true relational database, positioning it closer to Airtable than to an app builder like Glide or a connector tool like Appsmith.",
      "toolSlugs": [
        "baserow"
      ]
    },
    {
      "title": "AI is reaching all three, unevenly",
      "description": "Appsmith offers AI-assisted development from prompts, Baserow has an AI field type for generating or analyzing table data, and Glide's AI Agent can generate an entire app layout and schema from a plain-language description.",
      "toolSlugs": [
        "appsmith",
        "baserow",
        "glide"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Deployment and Data Ownership",
      "rows": [
        {
          "feature": "Open-source, self-hostable core",
          "statuses": {
            "appsmith": "available",
            "baserow": "available",
            "glide": "unavailable"
          }
        },
        {
          "feature": "Native relational database backend",
          "statuses": {
            "appsmith": "unavailable",
            "baserow": "available",
            "glide": "available"
          },
          "note": "Appsmith connects to external databases rather than shipping its own; Glide's native backend is Glide Tables."
        }
      ]
    },
    {
      "group": "Building Experience",
      "rows": [
        {
          "feature": "JavaScript-level customization",
          "statuses": {
            "appsmith": "available",
            "baserow": "not-documented",
            "glide": "not-documented"
          }
        },
        {
          "feature": "Multiple data views (grid, kanban, calendar, gallery)",
          "statuses": {
            "appsmith": "not-documented",
            "baserow": "available",
            "glide": "not-documented"
          }
        },
        {
          "feature": "Mobile-first app output",
          "statuses": {
            "appsmith": "not-documented",
            "baserow": "not-documented",
            "glide": "available"
          }
        }
      ]
    },
    {
      "group": "AI and Governance",
      "rows": [
        {
          "feature": "AI-assisted app or data generation",
          "statuses": {
            "appsmith": "available",
            "baserow": "available",
            "glide": "available"
          }
        },
        {
          "feature": "SSO on a paid tier",
          "statuses": {
            "appsmith": "available",
            "baserow": "available",
            "glide": "available"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of Appsmith, Baserow, and Glide can be fully self-hosted for free?",
      "answer": "Appsmith and Baserow both have open-source community editions that can be self-hosted at no cost. Glide is a cloud-only platform with no self-hosting option."
    },
    {
      "question": "Which tool is best for developers who want to write custom code?",
      "answer": "Appsmith is the strongest fit, offering a JavaScript escape hatch for logic beyond its drag-and-drop builder, alongside Git-based version control and CI/CD deployment."
    },
    {
      "question": "Which is easiest for a non-technical user to turn a spreadsheet into an app?",
      "answer": "Glide is purpose-built for this, letting users point at a Google Sheet, Airtable base, or Excel file and automatically generating a mobile-friendly app, with its AI Agent now able to generate an initial layout from a plain-language description."
    },
    {
      "question": "Do all three offer AI-assisted building?",
      "answer": "Yes. Appsmith offers AI-assisted development from natural-language prompts, Baserow has an AI field type for generating or analyzing data, and Glide's AI Agent can generate an app's layout, screens, and schema."
    },
    {
      "question": "Which is better for admin panels versus an Airtable-like database?",
      "answer": "Appsmith is designed specifically for internal tools and admin panels connected to existing databases and APIs. Baserow is closer to an Airtable alternative, providing its own relational database with multiple views."
    },
    {
      "question": "Is single sign-on available on all three platforms?",
      "answer": "Yes, all three offer SSO, but only on their higher-priced Enterprise or Business-level tiers rather than on free or entry-level plans."
    }
  ]
};

export default appsmithVsBaserowVsGlideContent;
