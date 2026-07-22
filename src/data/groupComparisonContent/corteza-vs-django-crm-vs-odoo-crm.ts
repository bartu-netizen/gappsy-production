import type { GroupComparisonContent } from './types';

const cortezaVsDjangoCrmVsOdooCrmContent: GroupComparisonContent = {
  "verdict": "Corteza, Django-CRM, and Odoo CRM are all free-to-start, self-hostable CRM platforms, but they solve different problems. Corteza bundles CRM with a low-code app builder and enterprise messaging for teams that want a broader open-source Salesforce substitute; Django-CRM is a leaner, Python-native CRM with unusually strong built-in email marketing for developers who want full control; Odoo CRM stands apart with machine-learning lead scoring and one-click integration into a full ERP, backed by a much larger commercial vendor. Teams already invested in Python should lean toward Django-CRM, those wanting a broader low-code platform should look at Corteza, and those planning to grow into quoting, invoicing, and inventory should consider Odoo CRM.",
  "bestFor": {
    "corteza": "Organizations that want a fully open-source Salesforce-style stack combining CRM, a low-code app builder, and team messaging under one self-hosted roof.",
    "django-crm": "Python/Django-fluent teams who want a lean, fully free, self-hosted CRM with built-in mass email marketing and deep customization control.",
    "odoo-crm": "Sales teams that want a free-to-start CRM with predictive lead scoring and a clear growth path into full ERP quoting, invoicing, and inventory."
  },
  "highlights": [
    {
      "title": "Django-CRM bakes in mass email marketing",
      "description": "Django-CRM ships with built-in mass mailing and email marketing capabilities, an unusually strong feature for an open-source CRM since many competitors require a separate email tool.",
      "toolSlugs": [
        "django-crm"
      ]
    },
    {
      "title": "Odoo CRM adds machine-learning lead scoring for free",
      "description": "Odoo CRM includes predictive lead scoring trained on historical CRM data, available even on the free One App Free plan with unlimited users.",
      "toolSlugs": [
        "odoo-crm"
      ]
    },
    {
      "title": "Corteza bundles a low-code builder and messaging with CRM",
      "description": "Corteza combines its CRM module with a general-purpose low-code app builder and Slack-like enterprise messaging in one self-hosted platform, going beyond CRM alone.",
      "toolSlugs": [
        "corteza"
      ]
    },
    {
      "title": "Odoo CRM's payoff grows with the rest of the suite",
      "description": "Closed opportunities in Odoo CRM can automatically generate quotes, sales orders, and invoices, a benefit that compounds as a business adopts more Odoo apps.",
      "toolSlugs": [
        "odoo-crm"
      ]
    },
    {
      "title": "Corteza and Django-CRM carry zero licensing cost by design",
      "description": "Both are fully open source with no paid CRM tier of their own; Odoo CRM's free tier covers only the CRM app, with paid plans required to unlock the rest of the suite.",
      "toolSlugs": [
        "corteza",
        "django-crm"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Deployment and Licensing",
      "rows": [
        {
          "feature": "Self-hosted deployment",
          "statuses": {
            "corteza": "available",
            "django-crm": "available",
            "odoo-crm": "available"
          }
        },
        {
          "feature": "Official managed cloud hosting",
          "statuses": {
            "corteza": "limited",
            "django-crm": "unavailable",
            "odoo-crm": "available"
          },
          "note": "Corteza offers paid hosting via Planet Crust; Django-CRM has no official managed cloud option; Odoo Online hosting is included with paid plans."
        },
        {
          "feature": "Free tier with unlimited users",
          "statuses": {
            "corteza": "available",
            "django-crm": "available",
            "odoo-crm": "available"
          },
          "note": "Odoo's free tier (One App Free) covers only the CRM app itself."
        }
      ]
    },
    {
      "group": "Sales and Pipeline",
      "rows": [
        {
          "feature": "Predictive/AI lead scoring",
          "statuses": {
            "corteza": "not-documented",
            "django-crm": "not-documented",
            "odoo-crm": "available"
          }
        },
        {
          "feature": "Automated multi-source lead capture (forms, chat, cards)",
          "statuses": {
            "corteza": "not-documented",
            "django-crm": "not-documented",
            "odoo-crm": "available"
          }
        },
        {
          "feature": "Built-in mass email marketing",
          "statuses": {
            "corteza": "not-documented",
            "django-crm": "available",
            "odoo-crm": "not-documented"
          },
          "note": "Odoo's marketing automation lives in a separate app, not documented as part of the core CRM module."
        }
      ]
    },
    {
      "group": "Extensibility and Integration",
      "rows": [
        {
          "feature": "REST API and webhooks",
          "statuses": {
            "corteza": "available",
            "django-crm": "not-documented",
            "odoo-crm": "available"
          }
        },
        {
          "feature": "Native ERP quote-to-invoice integration",
          "statuses": {
            "corteza": "unavailable",
            "django-crm": "unavailable",
            "odoo-crm": "available"
          }
        },
        {
          "feature": "Built-in team messaging/chat",
          "statuses": {
            "corteza": "available",
            "django-crm": "unavailable",
            "odoo-crm": "not-documented"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Are Corteza, Django-CRM, and Odoo CRM actually free to use?",
      "answer": "Corteza and Django-CRM are fully free and open source with no paid CRM tier of their own, though Corteza offers optional paid support and hosting through Planet Crust. Odoo CRM is free for unlimited users on the One App Free plan, but unlocking the rest of the Odoo suite requires the paid Standard or Custom plans."
    },
    {
      "question": "Which of these three CRMs is easiest to self-host?",
      "answer": "Django-CRM leans on the well-documented Django ecosystem and standard Python deployment conventions, which can lower operational risk for teams already comfortable with Django. Corteza requires Go/Docker or Kubernetes familiarity, and Odoo CRM can be self-hosted or run on Odoo Online hosting included with paid plans."
    },
    {
      "question": "Which CRM includes built-in email marketing?",
      "answer": "Django-CRM includes built-in mass mailing and email marketing functionality directly in the platform. Odoo's marketing automation is a separate app rather than a core CRM feature, and Corteza's provided feature set does not document built-in email marketing."
    },
    {
      "question": "Which one scales into a full ERP system?",
      "answer": "Odoo CRM is designed to scale into a full ERP: closing a deal can automatically generate a quote, sales order, stock reservation, and invoice as a business adopts more Odoo apps. Corteza and Django-CRM are CRM/low-code tools without that native ERP quote-to-cash integration."
    },
    {
      "question": "Which platform requires the most technical expertise to run?",
      "answer": "Corteza and Django-CRM both require in-house or contracted DevOps and, for Django-CRM, Python/Django expertise to install, customize, and maintain. Odoo CRM can be adopted with less technical overhead via its paid Odoo Online hosting."
    },
    {
      "question": "Does any of these three offer predictive lead scoring?",
      "answer": "Only Odoo CRM includes documented machine-learning-based predictive lead scoring, trained on a company's historical CRM data to estimate the probability of winning each opportunity."
    }
  ]
};

export default cortezaVsDjangoCrmVsOdooCrmContent;
