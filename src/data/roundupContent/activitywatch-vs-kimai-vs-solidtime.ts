import type { RoundupContent } from './types';

const activitywatchVsKimaiVsSolidtimeContent: RoundupContent = {
  "verdict": "These three solve different problems despite sharing the 'time tracking' label. ActivityWatch is a passive, local-first activity logger with no invoicing or client billing built in, while Kimai and Solidtime are manual timesheet and invoicing tools aimed at freelancers and agencies billing clients by the hour. Between those two, Kimai is the more established option with SSO, two-factor authentication, and a plugin ecosystem, while Solidtime is the newer, simpler alternative with a free solo cloud plan and a low-cost paid team tier.",
  "bestFor": {
    "activitywatch": "Individuals who want fully automatic background tracking of app, window, and website usage for personal productivity or digital-wellbeing insight, with data that never leaves their own device.",
    "kimai": "Freelancers and agencies that need mature client invoicing, two-factor authentication and SSO, and an extensive plugin ecosystem, whether self-hosted or via low-cost Kimai Cloud.",
    "solidtime": "Freelancers and small agencies who want a modern, simple open-source timesheet and invoicing tool, with a free solo cloud plan and an affordable paid tier once a team is added."
  },
  "highlights": [
    {
      "title": "Only ActivityWatch tracks automatically without manual time entries",
      "description": "ActivityWatch logs active applications, window titles, and browser activity in the background with no manual timer, while Kimai and Solidtime are both built around users manually logging time against customers, projects, and tasks.",
      "toolSlugs": [
        "activitywatch"
      ]
    },
    {
      "title": "Kimai and Solidtime both turn tracked hours into invoices; ActivityWatch does not",
      "description": "Kimai generates client invoices directly from recorded billable hours, and Solidtime offers invoicing on its Professional plan, while ActivityWatch's feature set has no billing or invoicing capability documented.",
      "toolSlugs": [
        "kimai",
        "solidtime"
      ]
    },
    {
      "title": "Kimai is more enterprise-ready with SSO and 2FA",
      "description": "Kimai documents native two-factor authentication (TOTP) and single sign-on via LDAP and SAML with providers like Google Workspace and Azure AD, plus an official plugin ecosystem; Solidtime's provided data does not document comparable authentication or plugin features.",
      "toolSlugs": [
        "kimai"
      ]
    },
    {
      "title": "Solidtime is the newer, more modern-feeling alternative",
      "description": "Founded around 2024, Solidtime is positioned as a modern alternative to legacy time trackers, but with a smaller feature set and shorter track record than Kimai, which has been in active development since 2006.",
      "toolSlugs": [
        "solidtime",
        "kimai"
      ]
    },
    {
      "title": "All three have a genuinely free, self-hostable open-source core",
      "description": "ActivityWatch is entirely free with no premium tiers; Kimai's AGPL-licensed self-hosted core has no user limits or feature paywall; Solidtime's AGPL-3.0 self-hosted core can also be deployed for free indefinitely.",
      "toolSlugs": [
        "activitywatch",
        "kimai",
        "solidtime"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Tracking approach",
      "rows": [
        {
          "feature": "Automatic passive tracking of apps, windows, or websites",
          "statuses": {
            "activitywatch": "available",
            "kimai": "unavailable",
            "solidtime": "unavailable"
          }
        },
        {
          "feature": "Manual time entry against clients, projects, and tasks",
          "statuses": {
            "activitywatch": "unavailable",
            "kimai": "available",
            "solidtime": "available"
          }
        },
        {
          "feature": "Invoicing generated from tracked billable hours",
          "statuses": {
            "activitywatch": "unavailable",
            "kimai": "available",
            "solidtime": "limited"
          },
          "note": "Solidtime's invoicing feature is limited to its paid Professional plan; the free Solo plan does not include it."
        }
      ]
    },
    {
      "group": "Data ownership and hosting",
      "rows": [
        {
          "feature": "Free, unlimited self-hosted open-source core",
          "statuses": {
            "activitywatch": "available",
            "kimai": "available",
            "solidtime": "available"
          }
        },
        {
          "feature": "Data explicitly documented as never leaving the user's own device",
          "statuses": {
            "activitywatch": "available",
            "kimai": "not-documented",
            "solidtime": "not-documented"
          },
          "note": "ActivityWatch is explicitly local-first by design; Kimai and Solidtime are self-hostable web applications whose provided data does not make an equivalent local-only claim."
        },
        {
          "feature": "Managed paid cloud hosting option",
          "statuses": {
            "activitywatch": "unavailable",
            "kimai": "available",
            "solidtime": "available"
          },
          "note": "Kimai offers Kimai Cloud hosted in Germany; Solidtime offers a managed cloud with a free Solo tier and a paid Professional tier."
        }
      ]
    },
    {
      "group": "Team and enterprise features",
      "rows": [
        {
          "feature": "Multi-user roles and team management",
          "statuses": {
            "activitywatch": "unavailable",
            "kimai": "available",
            "solidtime": "limited"
          },
          "note": "Kimai supports unlimited users with role-based permissions in self-hosted installs; Solidtime's team access management is gated to its paid Professional plan."
        },
        {
          "feature": "Two-factor authentication or SSO (LDAP/SAML)",
          "statuses": {
            "activitywatch": "not-documented",
            "kimai": "available",
            "solidtime": "not-documented"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these tracks time automatically without starting a timer?",
      "answer": "ActivityWatch is the only one of the three that tracks automatically in the background, logging active applications, window titles, and (via browser extensions) websites visited, with no manual timer required."
    },
    {
      "question": "Which tools are suited to billing clients for tracked hours?",
      "answer": "Kimai and Solidtime are both built around manual time entry against clients and projects with invoicing generated from recorded hours. ActivityWatch has no billing or invoicing capability in its documented feature set."
    },
    {
      "question": "Which has the lowest-cost paid cloud plan?",
      "answer": "Solidtime's Solo cloud plan is free for individual freelancers, with its paid Professional tier at 8 euros/user/month billed annually. Kimai Cloud's Standard tier starts at EUR 2.99/user/month billed annually, with a discounted EUR 0.99/user/month rate for non-profits and select industries."
    },
    {
      "question": "Which is the most established, longest-running project?",
      "answer": "Kimai has the longest history, tracing back to 2006. Solidtime was founded around 2024. ActivityWatch's founding year is not documented in the provided data, though it is an actively maintained open-source project."
    },
    {
      "question": "Can all three be self-hosted for free?",
      "answer": "Yes. ActivityWatch is a free desktop application with no premium tiers at all. Kimai's AGPL-licensed core can be self-hosted for free with unlimited users. Solidtime's AGPL-3.0 core can also be self-hosted for free indefinitely."
    },
    {
      "question": "Which one offers enterprise features like SSO and two-factor authentication?",
      "answer": "Kimai is the only one of the three whose provided data documents native two-factor authentication (TOTP) and single sign-on via LDAP and SAML integrations. Neither ActivityWatch nor Solidtime documents comparable authentication features."
    }
  ]
};

export default activitywatchVsKimaiVsSolidtimeContent;
