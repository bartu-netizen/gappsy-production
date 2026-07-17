import type { ToolComparisonContent } from './types';

const goldcastVsPretalxContent: ToolComparisonContent = {
  "verdict": "Goldcast and Pretalx both sit in the events space but cover different stages of running one. Goldcast is an AI-first B2B video platform for hosting webinars and virtual events, then repurposing recordings into clips, blogs, and social posts, with native CRM integrations (Marketo, HubSpot, Eloqua, Salesforce) and no public pricing. Pretalx is open-source conference management software for running a Call for Papers, reviewing speaker submissions, and building a multi-track schedule, free to test with self-hosting available.",
  "bestForToolA": "Goldcast fits B2B marketing teams running webinars and virtual events who want AI tools to automatically repurpose recordings into clips, blogs, and social content, integrated with CRM/marketing automation tools like HubSpot and Salesforce.",
  "bestForToolB": "Pretalx fits conference organizers who need to run a Call for Papers, review and select speaker submissions, and build a multi-track event schedule, especially those wanting an open-source or self-hosted option.",
  "whoNeedsBoth": "A conference organizer could use Pretalx to run the Call for Papers, review submissions, and build the session schedule, then use Goldcast to stream or host the resulting virtual sessions and repurpose the recorded talks into marketing clips and blog posts afterward — these tools cover sequential, non-overlapping stages of running an event.",
  "keyDifferences": [
    {
      "title": "Core Use Case",
      "toolA": "Goldcast hosts and produces B2B webinars/virtual events and repurposes recorded video into marketing content via its Content Lab.",
      "toolB": "Pretalx manages the Call for Papers, speaker review, and schedule-building workflow for conferences; it does not host video.",
      "whyItMatters": "Buyers need to match the tool to the specific stage of event production they're solving for.",
      "benefitsWho": "Event marketers need Goldcast; conference program committees need Pretalx."
    },
    {
      "title": "Pricing Model",
      "toolA": "Goldcast has no public pricing at all; every plan category (Content Lab, Recording Studio, Digital Events, Custom) requires a demo or sales conversation.",
      "toolB": "Pretalx is free to test with no hidden costs; payment is only required to make a managed event public, and self-hosting avoids platform fees entirely.",
      "whyItMatters": "Pretalx lets organizers evaluate the full product before any cost commitment; Goldcast requires a sales conversation first.",
      "benefitsWho": "Budget-conscious or volunteer-run conference organizing teams."
    },
    {
      "title": "AI Capabilities",
      "toolA": "Goldcast includes an AI-driven Content Lab, Agentic Video Editor, AI Search, and AI Highlight Reels for repurposing and searching video content.",
      "toolB": "No AI features are documented for Pretalx.",
      "whyItMatters": "AI repurposing can significantly cut the manual work of turning one event into ongoing marketing content.",
      "benefitsWho": "Marketing teams needing to extract maximum content value from recorded sessions."
    },
    {
      "title": "Open Source / Self-Hosting",
      "toolA": "No self-hosting or open-source option is documented; Goldcast is a proprietary SaaS platform.",
      "toolB": "Pretalx is open source with publicly available source code, a plugin ecosystem, and a self-hosting option that avoids platform fees.",
      "whyItMatters": "Self-hosting gives organizers full control over data and avoids per-event platform fees.",
      "benefitsWho": "Technical teams or organizations (e.g., open-source conferences like PyCon) that prefer to run their own infrastructure."
    },
    {
      "title": "CRM / Marketing Integrations",
      "toolA": "Goldcast has native integrations with Marketo, HubSpot, Eloqua, and Salesforce for demand-generation workflows.",
      "toolB": "No CRM or marketing automation integration is documented; Pretalx's focus is CFP, speaker, and schedule workflows.",
      "whyItMatters": "CRM integration lets webinar/event data flow directly into lead-generation pipelines.",
      "benefitsWho": "B2B marketing and demand-gen teams tracking event-sourced leads."
    }
  ],
  "featureMatrix": [
    {
      "group": "Event Workflow",
      "rows": [
        {
          "feature": "Call for Papers / speaker submissions",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Webinar / virtual event hosting",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Multi-track schedule building",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "On-demand video library",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Goldcast: Video Hubs."
        }
      ]
    },
    {
      "group": "Content & AI",
      "rows": [
        {
          "feature": "AI-powered video repurposing (clips/blogs/social)",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Goldcast: Content Lab."
        },
        {
          "feature": "AI-powered video search",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Speaker communication tools",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Pricing & Access",
      "rows": [
        {
          "feature": "Published pricing",
          "toolA": "unavailable",
          "toolB": "not-documented",
          "note": "Pretalx doesn't publish exact prices for public/managed events, but testing is free."
        },
        {
          "feature": "Free to test/evaluate",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Goldcast requires a demo; Pretalx is free to test with no hidden costs."
        },
        {
          "feature": "Self-hosting option",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Open source",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Goldcast handle Call for Papers or speaker submissions?",
      "answer": "This isn't documented — Goldcast is built for hosting and producing webinars/video content, not CFP or speaker-review management."
    },
    {
      "question": "Is Pretalx free?",
      "answer": "Yes, testing is free with no hidden costs; payment is only required to make a managed event public on pretalx.com, and self-hosting avoids fees entirely."
    },
    {
      "question": "Does Pretalx include AI features?",
      "answer": "No AI features are documented for Pretalx."
    },
    {
      "question": "Does Goldcast integrate with CRM tools?",
      "answer": "Yes, Goldcast has native integrations with Marketo, HubSpot, Eloqua, and Salesforce."
    },
    {
      "question": "Can Pretalx be self-hosted?",
      "answer": "Yes, alongside the managed hosting option available at pretalx.com."
    },
    {
      "question": "Is Goldcast's pricing public?",
      "answer": "No, all plan categories (Content Lab, Recording Studio, Digital Events, Custom) require a demo or sales conversation."
    }
  ]
};

export default goldcastVsPretalxContent;
