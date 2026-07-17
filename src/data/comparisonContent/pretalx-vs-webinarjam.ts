import type { ToolComparisonContent } from './types';

const pretalxVsWebinarjamContent: ToolComparisonContent = {
  "verdict": "Pretalx and WebinarJam both serve events, but at different stages of the process: Pretalx manages the conference program itself — Call for Papers, speaker review, and schedule building — while WebinarJam broadcasts the live or automated video event to an audience with marketing and monetization tools. They're rarely direct alternatives; a conference organizer choosing between them is more likely deciding whether they need program management (Pretalx) or live broadcast/webinar hosting (WebinarJam).",
  "bestForToolA": "Conference organizers who need to run a Call for Papers, manage anonymous or open speaker review, and build a multi-track schedule, free to test, with self-hosting available and a track record with events like PyCon and MozFest.",
  "bestForToolB": "Marketers, course creators, and sales teams who need to broadcast live or automated webinars with built-in marketing and monetization tools, at published pricing starting at $39/month for up to 100 attendees.",
  "whoNeedsBoth": "A conference could realistically use both together in different roles — Pretalx to run its Call for Papers, review, and schedule the program, and WebinarJam to broadcast selected sessions live or as automated replays to a remote audience.",
  "keyDifferences": [
    {
      "title": "Core Purpose",
      "toolA": "Pretalx manages the conference program lifecycle — Call for Papers submissions, anonymous or open speaker review, and multi-track/multi-room schedule building.",
      "toolB": "WebinarJam hosts the live/automated video event itself, with real-time engagement tools, automated evergreen replays, and built-in marketing/monetization features.",
      "whyItMatters": "Pretalx solves how to select and schedule talks for a conference, while WebinarJam solves how to broadcast a live or automated video session to an audience — largely non-overlapping problems.",
      "benefitsWho": "Conference organizers curating a speaker program need Pretalx; marketers and course creators running live sales or demo webinars need WebinarJam."
    },
    {
      "title": "Pricing Transparency",
      "toolA": "Pretalx's managed-hosting pricing isn't published; testing is free with no hidden costs, and payment is only required to make an event public.",
      "toolB": "WebinarJam publishes exact tiered pricing from $39/month (Starter, annual billing) up to $379/month (Enterprise, annual billing), plus a $1, 14-day trial.",
      "whyItMatters": "Buyers comparing total cost upfront can get exact numbers from WebinarJam but must check at publish-time for Pretalx's actual managed-hosting cost.",
      "benefitsWho": "Budget planners who need firm numbers before committing favor WebinarJam's published tiers."
    },
    {
      "title": "Self-Hosting Option",
      "toolA": "Pretalx's source code is publicly available and can be self-hosted on your own infrastructure as an alternative to managed hosting at pretalx.com.",
      "toolB": "No self-hosting option is documented for WebinarJam; it's a hosted SaaS product.",
      "whyItMatters": "Organizations wanting full control over their conference data can self-host Pretalx, an option WebinarJam doesn't offer.",
      "benefitsWho": "Technical conference organizers or nonprofits wanting to avoid platform fees entirely."
    },
    {
      "title": "Attendee & Session Scale Limits",
      "toolA": "Pretalx doesn't document attendee caps, since it's a program-management tool rather than a live-broadcast tool; scale instead relates to schedule complexity (tracks, rooms, submissions).",
      "toolB": "WebinarJam explicitly tiers attendee caps and session durations, from 100 attendees/1-hour sessions on Starter up to 5,000 attendees/4-hour sessions with 6 hosts on Enterprise.",
      "whyItMatters": "WebinarJam buyers must pick a tier that fits their expected live audience size and session length, a consideration that doesn't apply to Pretalx.",
      "benefitsWho": "Marketing teams estimating webinar audience size need WebinarJam's tiered caps; conference organizers care more about number of tracks/rooms/submissions, which Pretalx supports directly."
    },
    {
      "title": "Notable Users",
      "toolA": "Pretalx is used by established developer events including PyCon, MozFest, and PyConCascades.",
      "toolB": "No specific named customers are documented for WebinarJam, though it's operated by Genesis Digital LLC, based in Las Vegas, NV.",
      "whyItMatters": "Named users signal the kind of event each tool is proven for.",
      "benefitsWho": "Organizers of technical/open-source conferences can point to Pretalx's track record with PyCon-style events."
    }
  ],
  "featureMatrix": [
    {
      "group": "Event Management Functions",
      "rows": [
        {
          "feature": "Call for Papers / submission management",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Speaker/session review workflow",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Pretalx: anonymous or open review"
        },
        {
          "feature": "Multi-track schedule building",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Live video broadcast/hosting",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Automated/evergreen replay",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Deployment & Access",
      "rows": [
        {
          "feature": "Self-hosting option",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Managed hosting option",
          "toolA": "available",
          "toolB": "available",
          "note": "Pretalx: pretalx.com; WebinarJam: SaaS only"
        },
        {
          "feature": "Browser-based attendee join (no downloads)",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Plugin ecosystem",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Pricing & Trial",
      "rows": [
        {
          "feature": "Published pricing tiers",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "WebinarJam: $39–$379/month"
        },
        {
          "feature": "Free trial",
          "toolA": "available",
          "toolB": "available",
          "note": "Pretalx: free to test; WebinarJam: 14 days for $1"
        },
        {
          "feature": "Money-back guarantee",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "WebinarJam: 30-day"
        },
        {
          "feature": "Multi-host/multi-speaker support",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Up to 6 hosts on WebinarJam Enterprise"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Pretalx free?",
      "answer": "Testing is free with no hidden costs; payment is only required once you make a managed event public, though exact managed-hosting pricing isn't published."
    },
    {
      "question": "How much does WebinarJam cost?",
      "answer": "Plans range from $39/month (Starter, billed annually) to $379/month (Enterprise, billed annually), with a $1, 14-day trial available."
    },
    {
      "question": "Can I self-host either tool?",
      "answer": "Pretalx supports self-hosting on your own infrastructure as an alternative to managed hosting at pretalx.com; WebinarJam doesn't document a self-hosting option."
    },
    {
      "question": "Which tool actually hosts the live video event?",
      "answer": "WebinarJam, with live webinar hosting, automated/evergreen replays, and browser-based joining; Pretalx focuses on managing the conference program (CFP, review, scheduling), not live video."
    },
    {
      "question": "Does either have a money-back guarantee?",
      "answer": "WebinarJam offers a documented 30-day money-back guarantee; this isn't mentioned for Pretalx."
    },
    {
      "question": "What kinds of events use each tool?",
      "answer": "Pretalx is used by developer and open-source conferences like PyCon, MozFest, and PyConCascades; WebinarJam's facts don't name specific customers but emphasize marketing and monetization features suited to product demos and course sales."
    }
  ]
};

export default pretalxVsWebinarjamContent;
