import type { ToolComparisonContent } from './types';

const gotoMeetingVsMirotalkContent: ToolComparisonContent = {
  "verdict": "GoTo Meeting and MiroTalk are both video conferencing tools but represent opposite deployment philosophies: GoTo Meeting is an established, paid, cloud-hosted platform (founded 2004, Boston) with tiered plans up to 3,000 participants and AI-powered Smart Meeting Assistant transcription, while MiroTalk is a free, open-source, self-hosted WebRTC platform that can be deployed via Docker or Node.js with no download or login required to join. The choice largely comes down to whether an organization wants a managed enterprise product or full control over its own video infrastructure.",
  "bestForToolA": "GoTo Meeting fits businesses that want a managed, reliable video platform with a documented track record, AI transcription and summaries via its Smart Meeting Assistant on Business and Enterprise plans, and fits naturally into the broader GoTo Connect suite.",
  "bestForToolB": "MiroTalk fits developers and technical teams who want to self-host video conferencing at no licensing cost, embed it into their own product via its REST API and iframe widgets, and support up to 8K/60fps video without requiring participants to download anything or create an account.",
  "whoNeedsBoth": "A company could use GoTo Meeting for day-to-day client-facing business meetings while a product team separately self-hosts MiroTalk to embed video calling directly into a customer-facing app via its REST API — different use cases within the same organization.",
  "keyDifferences": [
    {
      "title": "Hosting & Pricing Model",
      "toolA": "GoTo Meeting is paid with no permanent free plan, only a 14-day free trial; Professional starts at $12 per organizer/month billed annually, Business at $16, and Enterprise is custom-priced.",
      "toolB": "MiroTalk is free and open source under AGPLv3, self-hosted on your own server via Docker or Node.js, with a separate commercial license available via CodeCanyon for closed-source use.",
      "whyItMatters": "Organizations avoiding recurring per-organizer licensing costs, or wanting full infrastructure control, will lean toward MiroTalk; those wanting a managed product with support will lean toward GoTo Meeting.",
      "benefitsWho": "Cost-sensitive technical teams (MiroTalk) versus businesses that prefer a fully managed, supported product (GoTo Meeting)."
    },
    {
      "title": "Participant Capacity",
      "toolA": "GoTo Meeting documents explicit tiered capacity: 50 participants on Professional, 250 on Business, and up to 3,000 on Enterprise.",
      "toolB": "MiroTalk documents an SFU (selective forwarding unit) mode specifically to support more participants than its P2P mode allows, but does not publish an exact participant cap.",
      "whyItMatters": "Teams that need a guaranteed, contractually documented participant ceiling for large meetings have clearer numbers with GoTo Meeting.",
      "benefitsWho": "Enterprises planning large all-hands meetings or client calls with a known headcount."
    },
    {
      "title": "AI Meeting Transcription",
      "toolA": "GoTo Meeting's Smart Meeting Assistant automatically records, transcribes, and produces AI-written summaries highlighting key topics and action items, included on Business and Enterprise plans.",
      "toolB": "MiroTalk does not document any AI transcription or meeting-summary feature.",
      "whyItMatters": "Teams that rely on automatic meeting notes and action-item extraction get that built in with GoTo Meeting but would need a separate tool with MiroTalk.",
      "benefitsWho": "Sales, client-services, and project teams that depend on meeting summaries for follow-up."
    },
    {
      "title": "Embeddability & API",
      "toolA": "GoTo Meeting does not document a public REST API or embeddable widget for building video calling into another product.",
      "toolB": "MiroTalk offers a full REST API and embeddable widgets/iframe integration specifically for adding video calling to other websites or products.",
      "whyItMatters": "Developers building video calling into their own SaaS product have a documented integration path only with MiroTalk.",
      "benefitsWho": "Product and engineering teams embedding video conferencing directly into their own application."
    },
    {
      "title": "Join Friction",
      "toolA": "GoTo Meeting participants join via browser, desktop app, or mobile app, with a simple guest-join and phone dial-in option, but the product itself requires an organizer license to host.",
      "toolB": "MiroTalk is explicitly designed so no download, plug-in, or login is required to join a call.",
      "whyItMatters": "For ad hoc calls with external guests who don't want to install anything or sign up, MiroTalk removes more friction at join time.",
      "benefitsWho": "Support teams, community organizers, or anyone hosting calls with non-technical external participants."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Conferencing",
      "rows": [
        {
          "feature": "HD video and audio",
          "toolA": "available",
          "toolB": "available",
          "note": "MiroTalk supports up to 8K/60fps."
        },
        {
          "feature": "Screen sharing",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Cloud/session recording",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Chat with markdown / whiteboard",
          "toolA": "limited",
          "toolB": "available",
          "note": "GoTo Meeting documents drawing/annotation on shared screens, not a full chat+whiteboard combo."
        },
        {
          "feature": "AI transcription and meeting summaries",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "GoTo Meeting: Smart Meeting Assistant on Business/Enterprise plans."
        }
      ]
    },
    {
      "group": "Access & Cost",
      "rows": [
        {
          "feature": "Permanent free plan",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "GoTo Meeting offers only a 14-day trial; MiroTalk is free/open source."
        },
        {
          "feature": "Self-hosted deployment",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "No login/download required to join",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Developer & Enterprise Controls",
      "rows": [
        {
          "feature": "REST API for embedding",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Admin/security controls and license management",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Documented participant capacity tiers",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "GoTo Meeting: 50 / 250 / 3,000 by plan."
        },
        {
          "feature": "Calendar integrations (Outlook/Google Calendar)",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does GoTo Meeting have a free plan?",
      "answer": "No. GoTo Meeting does not offer a permanent free tier; it offers a 14-day free trial of its paid plans, after which a Professional, Business, or Enterprise subscription is required."
    },
    {
      "question": "Is MiroTalk really free to use?",
      "answer": "Yes, MiroTalk is free and open source under the AGPLv3 license and can be self-hosted at no licensing cost, though a separate commercial license is available via CodeCanyon for closed-source use."
    },
    {
      "question": "How many people can join a GoTo Meeting session?",
      "answer": "Capacity depends on plan: Professional supports up to 50 participants, Business up to 250, and Enterprise up to 3,000 participants per meeting."
    },
    {
      "question": "Can I self-host MiroTalk?",
      "answer": "Yes, MiroTalk can be deployed on your own server using Docker or Node.js in minutes."
    },
    {
      "question": "Does MiroTalk require participants to create an account?",
      "answer": "No, MiroTalk is designed so users can join calls without downloads, plug-ins, or logins."
    },
    {
      "question": "Does GoTo Meeting include AI transcription and meeting summaries?",
      "answer": "Yes. Its Smart Meeting Assistant automatically records and transcribes meetings and generates an AI summary highlighting key discussion points and action items, included with Business and Enterprise plans."
    }
  ]
};

export default gotoMeetingVsMirotalkContent;
