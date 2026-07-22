import type { ToolComparisonContent } from './types';

const publiiVsSubstackContent: ToolComparisonContent = {
  "verdict": "Publii is a free, open-source desktop CMS that generates static websites locally and deploys them to a host of your choice, with built-in SEO and GDPR/CCPA tooling but no monetization features. Substack is a free, fully hosted platform purpose-built for paid newsletters, podcasts, and video, with a built-in reader network and 90/10 revenue split on subscriptions. The two solve different problems: Publii builds and owns a static site with no server dependency, while Substack handles publishing, distribution, and monetization for you on its own infrastructure.",
  "bestForToolA": "Writers or businesses who want a free, offline desktop tool to build a fast, SEO-optimized static site — deployable to GitHub Pages, Netlify, or S3 — without any server-side hosting to secure, fit Publii best.",
  "bestForToolB": "Writers who want to launch and monetize a paid newsletter, podcast, or video publication instantly, with built-in audience discovery and no deployment step, fit Substack best.",
  "whoNeedsBoth": "A writer could build a static, SEO-optimized personal site or content archive with Publii for long-term discoverability, while running the actual paid subscription newsletter and its distribution through Substack.",
  "keyDifferences": [
    {
      "title": "Application Type",
      "toolA": "Publii is a cross-platform desktop application (Windows 10+, macOS 12+, 64-bit Linux) that runs and works fully offline.",
      "toolB": "Substack is a fully cloud-hosted web platform with a companion app for reading and managing publications.",
      "whyItMatters": "A desktop app means content lives locally until deployed; a cloud platform means content is live immediately and centrally.",
      "benefitsWho": "Writers who want offline control benefit from Publii; writers who want instant, always-on publishing benefit from Substack."
    },
    {
      "title": "Built-In Monetization",
      "toolA": "Publii has no documented monetization or paid-subscription feature — it is purely a static site generator/CMS.",
      "toolB": "Substack has built-in paid subscriptions, with writers keeping 90% of subscription revenue collected directly through the platform.",
      "whyItMatters": "This determines whether charging readers requires custom integration work or is available immediately.",
      "benefitsWho": "Writers wanting to monetize content directly benefit from Substack's built-in payments."
    },
    {
      "title": "Publishing Workflow",
      "toolA": "Publii requires a manual build-and-deploy step from the desktop app to a chosen host (GitHub Pages, GitLab, Netlify, Amazon S3, Google Cloud, or SFTP/FTPS).",
      "toolB": "Substack publishes directly to the web with no separate build or deployment step.",
      "whyItMatters": "An extra deployment step adds friction for frequent publishers but also gives more control over exactly when a site goes live.",
      "benefitsWho": "Writers who publish infrequently and want deployment control benefit from Publii; frequent publishers benefit from Substack's instant publishing."
    },
    {
      "title": "Team Collaboration",
      "toolA": "Publii has no built-in multi-user/team collaboration — it's designed as a single-user local desktop tool.",
      "toolB": "Substack is designed around individual or small-team publications with no documented multi-editor workflow either, though it centralizes publishing on shared infrastructure.",
      "whyItMatters": "Teams that need multiple simultaneous editors should verify collaboration support before committing to either tool.",
      "benefitsWho": "Solo writers are well served by both; larger editorial teams may need to evaluate collaboration workflows carefully for either platform."
    },
    {
      "title": "Audience Discovery",
      "toolA": "Publii includes built-in SEO tooling (structured data, Open Graph tags, auto-generated XML sitemaps) but has no built-in reader network — growth depends on the site owner's own SEO and marketing.",
      "toolB": "More than half of new Substack subscribers come from Substack's built-in network and recommendations rather than outside promotion.",
      "whyItMatters": "Built-in audience discovery can meaningfully speed up subscriber growth compared to relying solely on external SEO.",
      "benefitsWho": "New writers without an existing audience benefit most from Substack's built-in network; SEO-focused site owners benefit from Publii's structured-data tooling."
    }
  ],
  "featureMatrix": [
    {
      "group": "Publishing Model",
      "rows": [
        {
          "feature": "Static site generation",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Cloud-hosted publishing",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Offline/desktop use",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Multi-format publishing (podcast/video)",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Monetization & Growth",
      "rows": [
        {
          "feature": "Built-in paid subscriptions",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Substack: writer keeps 90% of revenue"
        },
        {
          "feature": "Built-in reader/discovery network",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Built-in SEO tooling",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Publii: structured data, Open Graph, auto sitemaps"
        },
        {
          "feature": "GDPR/CCPA compliance tools",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Technical Requirements",
      "rows": [
        {
          "feature": "Requires server-side hosting",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Publii generates static files deployable anywhere; Substack is hosted by Substack"
        },
        {
          "feature": "Open source",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Publii: GPL-3.0"
        },
        {
          "feature": "Deployment targets",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Publii: GitHub Pages, GitLab, Netlify, S3, Google Cloud, SFTP/FTPS"
        },
        {
          "feature": "Built-in multi-user collaboration",
          "toolA": "unavailable",
          "toolB": "not-documented"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Can I sell paid subscriptions with Publii like I can on Substack?",
      "answer": "Not out of the box — Publii has no documented monetization feature. Substack has native paid subscriptions with a 90/10 revenue split in the writer's favor."
    },
    {
      "question": "Does Publii need server hosting to run?",
      "answer": "No server is needed to create content, since Publii runs locally as a desktop app and generates static site files. Those files can then be deployed to hosts like GitHub Pages, Netlify, or Amazon S3."
    },
    {
      "question": "Is Substack free to use?",
      "answer": "Yes, it's free to start and free to leave, with no upfront platform fee, tiers, or contract. Substack instead takes a 10% cut of paid subscription revenue."
    },
    {
      "question": "Does Publii work without an internet connection?",
      "answer": "Yes, Publii works fully offline as a local desktop application, unlike Substack which is a cloud-hosted web platform."
    },
    {
      "question": "Which tool has built-in team collaboration?",
      "answer": "Neither documents robust built-in multi-user collaboration — Publii explicitly has none, positioning it as a single-user desktop tool."
    },
    {
      "question": "Is Publii open source?",
      "answer": "Yes, Publii is free and open source under the GPL-3.0 license, built with Electron and Vue.js."
    }
  ]
};

export default publiiVsSubstackContent;
