import type { GroupComparisonContent } from './types';

const dayliteVsSalesflareVsZendeskSellContent: GroupComparisonContent = {
  "verdict": "Daylite, Salesflare, and Zendesk Sell all serve small and mid-sized sales teams, but they solve different problems. Daylite is the pick for Mac-only shops that want a CRM woven into Apple Mail, Contacts, and Calendar with full offline access, while Salesflare targets B2B teams that want the CRM to build itself from email, calendar, and LinkedIn activity instead of manual logging. Zendesk Sell sits closer to a general-purpose, activity-focused CRM with the strongest mobile and forecasting tools of the three, and it becomes especially compelling for teams that already run Zendesk Support and want sales and service data in one place. None of the three is a strict upgrade over the others; the right choice depends on platform, automation appetite, and whether support data needs to connect to sales.",
  "bestFor": {
    "daylite": "Mac-centric small businesses and professional services firms that want deep native integration with Apple Mail, Contacts, and Calendar plus full offline access on Mac and iOS.",
    "salesflare": "Small and mid-sized B2B sales teams that want the CRM to auto-populate itself from email, calendar, and LinkedIn activity instead of relying on manual data entry.",
    "zendesk-sell": "Field sales teams that need a strong mobile app with geolocation, and any organization already using Zendesk Support that wants shared visibility between sales and customer service."
  },
  "highlights": [
    {
      "title": "Built for Apple, not adapted to it",
      "description": "Daylite is a true native Mac, iPhone, and iPad application with full offline record access and sync, a level of Apple-ecosystem integration neither Salesflare nor Zendesk Sell attempts to match.",
      "toolSlugs": [
        "daylite"
      ]
    },
    {
      "title": "The CRM that fills itself in",
      "description": "Salesflare automatically captures emails, meetings, and calls from Gmail, Outlook, LinkedIn, and phone activity on every plan, reducing the manual logging that burdens reps in more traditional CRMs.",
      "toolSlugs": [
        "salesflare"
      ]
    },
    {
      "title": "Field-ready mobile app",
      "description": "Zendesk Sell's iOS and Android app adds geolocation so field reps can see nearby prospects and update deals on the move, a capability not documented for Daylite or Salesflare.",
      "toolSlugs": [
        "zendesk-sell"
      ]
    },
    {
      "title": "One data layer for sales and support",
      "description": "Teams already running Zendesk Support can connect a prospect's support history directly to their sales record inside Zendesk Sell, something Daylite and Salesflare do not offer.",
      "toolSlugs": [
        "zendesk-sell"
      ]
    },
    {
      "title": "LinkedIn baked into every plan",
      "description": "Salesflare includes native LinkedIn and Sales Navigator integration through a Chrome extension on its entry-level Growth plan, letting reps add and enrich prospects without upgrading.",
      "toolSlugs": [
        "salesflare"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Data Automation",
      "rows": [
        {
          "feature": "Automated email and activity capture",
          "statuses": {
            "daylite": "limited",
            "salesflare": "available",
            "zendesk-sell": "available"
          },
          "note": "Daylite links emails to records via drag-and-drop integration with Apple Mail rather than fully automated capture; Salesflare and Zendesk Sell log activity automatically from connected inboxes."
        },
        {
          "feature": "Native LinkedIn integration",
          "statuses": {
            "daylite": "not-documented",
            "salesflare": "available",
            "zendesk-sell": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Platform and Access",
      "rows": [
        {
          "feature": "Offline access on native mobile apps",
          "statuses": {
            "daylite": "available",
            "salesflare": "not-documented",
            "zendesk-sell": "not-documented"
          }
        },
        {
          "feature": "Deep Apple ecosystem integration",
          "statuses": {
            "daylite": "available",
            "salesflare": "not-documented",
            "zendesk-sell": "not-documented"
          }
        },
        {
          "feature": "Mobile app with geolocation",
          "statuses": {
            "daylite": "not-documented",
            "salesflare": "not-documented",
            "zendesk-sell": "available"
          }
        }
      ]
    },
    {
      "group": "Sales Operations",
      "rows": [
        {
          "feature": "Sales forecasting",
          "statuses": {
            "daylite": "not-documented",
            "salesflare": "not-documented",
            "zendesk-sell": "available"
          }
        },
        {
          "feature": "Shared customer support data",
          "statuses": {
            "daylite": "not-documented",
            "salesflare": "not-documented",
            "zendesk-sell": "available"
          },
          "note": "Only relevant to teams already using Zendesk Support alongside Zendesk Sell."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three CRMs is best for a Mac-only team?",
      "answer": "Daylite is the clear fit for Mac-only teams. It is a native Mac, iPhone, and iPad application with deep integration into Apple Mail, Contacts, and Calendar and full offline access, none of which Salesflare or Zendesk Sell are built around since both are cross-platform, browser-first products."
    },
    {
      "question": "Does Salesflare really eliminate manual CRM data entry?",
      "answer": "Salesflare automates a large share of it by pulling activity from Gmail, Outlook, LinkedIn, and phone calls to build contact timelines and deal histories automatically, plus enriching records from email signatures and LinkedIn profiles. Some manual input is still needed for deal stages and notes, but far less than in a CRM without this automation."
    },
    {
      "question": "Can Zendesk Sell share data with Zendesk's support product?",
      "answer": "Yes. Because Zendesk Sell runs on the same account infrastructure as Zendesk Support, teams using both products can see a prospect's customer service history directly inside the sales record, giving reps context Daylite and Salesflare cannot provide."
    },
    {
      "question": "Which CRM has the lowest starting price?",
      "answer": "Zendesk Sell has the lowest published entry price at roughly nineteen dollars per user per month on its Sell Team plan billed annually, compared to Daylite's twenty-five dollars per user per month CRM plan and Salesflare's twenty-nine dollars per user per month Growth plan billed annually."
    },
    {
      "question": "Do all three offer a free trial?",
      "answer": "Daylite and Salesflare both offer a thirty-day free trial across their plans. Zendesk Sell also offers a free trial, though its length and terms are set through Zendesk's standard trial signup rather than being tied to a specific plan tier."
    }
  ]
};

export default dayliteVsSalesflareVsZendeskSellContent;
