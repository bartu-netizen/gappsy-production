import type { ToolComparisonContent } from './types';

const cleanshotXVsXnapperContent: ToolComparisonContent = {
  "verdict": "Both are macOS-only screenshot tools with a one-time-purchase option, but they solve different problems: CleanShot X is built for capturing and annotating complex content (scrolling windows, screen recordings, OCR, cloud sharing), while Xnapper is built for making a single screenshot look polished and safe to share instantly (automatic backgrounds, framing, and sensitive-data redaction). The right pick depends on whether you capture more or you polish more.",
  "bestForToolA": "Best for users who need to capture things a single screenshot can't hold — scrolling web pages or long documents — plus screen/video recording, on-device OCR, and cloud link sharing with team features on the Pro plan.",
  "bestForToolB": "Best for users who take a lot of one-off screenshots (UI demos, product screenshots, social posts) and want automatic background/framing plus automatic redaction of sensitive data like emails, credit card numbers, and API keys before sharing.",
  "whoNeedsBoth": "Product and support teams that both need to document long scrolling flows or record short screen videos (CleanShot X) and also want visually polished, redacted screenshots ready for public sharing or social media (Xnapper) may keep both installed for different capture types.",
  "keyDifferences": [
    {
      "title": "Scrolling capture and screen recording",
      "toolA": "CleanShot X has dedicated scrolling capture for windows or pages that exceed the visible screen, plus screen recording with video/GIF export and webcam/audio overlay.",
      "toolB": "Xnapper's documented features are centered on still screenshots — no scrolling capture or screen recording feature is listed.",
      "whyItMatters": "Capturing a full webpage or documenting a workflow in video requires features Xnapper doesn't list.",
      "benefitsWho": "Developers and support staff creating documentation, bug reports, or tutorials that need more than a single static screenshot."
    },
    {
      "title": "Automatic redaction of sensitive data",
      "toolA": "CleanShot X's documented features don't include automatic redaction — annotation tools are manual (highlight, arrows, shapes, text, blur).",
      "toolB": "Xnapper automatically detects and redacts emails, credit card numbers, IP addresses, and API keys before you share a screenshot.",
      "whyItMatters": "Automatic redaction reduces the risk of accidentally sharing sensitive data in a screenshot, without relying on the user to manually blur it.",
      "benefitsWho": "Teams sharing screenshots externally (support tickets, demos, social posts) who want a safety net against leaking credentials or PII."
    },
    {
      "title": "Automatic visual polish",
      "toolA": "CleanShot X's features are capture- and annotation-focused; no automatic background or balancing feature is documented.",
      "toolB": "Xnapper automatically balances and frames screenshots and automatically selects a matching background color.",
      "whyItMatters": "Automatic framing/background removes manual editing steps when producing screenshots meant to look polished for marketing or social use.",
      "benefitsWho": "Marketers, founders, and indie developers producing screenshots for landing pages, app stores, or social media."
    },
    {
      "title": "Pricing structure",
      "toolA": "CleanShot X starts at $29 one-time (App + Cloud Basic, 1 year of updates, 1 GB Cloud storage), with an App + Cloud Pro subscription ($8/month annual or $10/month monthly) for unlimited Cloud storage and team/SSO features.",
      "toolB": "Xnapper starts at $29.99 one-time (Basic, 1 device), scaling to $54.99 (2 devices) and $79.99 (3 devices), plus a Team plan billed at $5/device/month.",
      "whyItMatters": "CleanShot X's one-time tiers are differentiated by cloud/team features, while Xnapper's one-time tiers are differentiated by number of devices licensed.",
      "benefitsWho": "Individuals who need the app on multiple personal Macs may find Xnapper's per-device tiers relevant; teams wanting cloud sharing and SSO may look at CleanShot X's Cloud Pro plan."
    },
    {
      "title": "Free usage model",
      "toolA": "CleanShot X does not list a permanent free tier — the entry point is the $29 one-time purchase.",
      "toolB": "Xnapper is free to use indefinitely, with only watermark removal requiring a paid one-time license.",
      "whyItMatters": "Users who want to try core functionality at no cost, watermark aside, have a documented free path with Xnapper but not with CleanShot X.",
      "benefitsWho": "Budget-conscious individual users or those wanting to test the tool before paying."
    }
  ],
  "featureMatrix": [
    {
      "group": "Capture Capabilities",
      "rows": [
        {
          "feature": "Scrolling capture",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Screen recording (video/GIF)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "On-device text recognition (OCR)",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Automatic background/framing",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Automatic sensitive-data redaction",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Sharing & Collaboration",
      "rows": [
        {
          "feature": "Cloud link sharing",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Custom domains / branding",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "CleanShot Cloud Pro plan."
        },
        {
          "feature": "Team plan with SSO",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "CleanShot X Cloud Pro includes SSO; Xnapper's Team plan is per-device pricing without a documented SSO feature."
        }
      ]
    },
    {
      "group": "Pricing & Platform",
      "rows": [
        {
          "feature": "Free-to-use tier",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Xnapper is free indefinitely except watermark removal."
        },
        {
          "feature": "One-time purchase option",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "macOS support",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Windows/iOS/Android support",
          "toolA": "unavailable",
          "toolB": "not-documented",
          "note": "CleanShot X explicitly states macOS only; Xnapper's platform FAQ also names macOS only."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is CleanShot X or Xnapper free?",
      "answer": "Xnapper's base app is free to use indefinitely, with only watermark removal requiring a paid one-time license. CleanShot X does not list a free tier; its entry point is the $29 one-time purchase."
    },
    {
      "question": "Which one supports scrolling capture?",
      "answer": "CleanShot X has dedicated scrolling capture for windows or pages longer than the visible screen. This isn't listed among Xnapper's documented features."
    },
    {
      "question": "Does either app redact sensitive information automatically?",
      "answer": "Xnapper automatically redacts emails, credit card numbers, IP addresses, and API keys. Automatic redaction isn't listed among CleanShot X's documented features, which instead offers manual blur annotation."
    },
    {
      "question": "Can I use either app on Windows?",
      "answer": "No — both are macOS-only, per their own FAQs."
    },
    {
      "question": "Which is cheaper to start?",
      "answer": "Xnapper's Basic tier is $29.99 one-time and CleanShot X's Basic tier is $29 one-time, so entry pricing is nearly identical; the difference shows up in team/cloud tiers."
    },
    {
      "question": "Do both offer OCR text recognition?",
      "answer": "Yes — both use on-device text recognition to let you select and copy text from screenshots without uploading them to the cloud."
    }
  ]
};

export default cleanshotXVsXnapperContent;
