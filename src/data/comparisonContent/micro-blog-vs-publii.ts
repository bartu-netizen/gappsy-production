import type { ToolComparisonContent } from './types';

const microBlogVsPubliiContent: ToolComparisonContent = {
  "verdict": "Micro.blog and Publii both help independent publishers get a site online quickly, but one is a hosted subscription service and the other a free local tool. Micro.blog is a paid, hosted blogging and podcasting platform starting at $5/month that includes built-in cross-posting to Mastodon, Threads, and Bluesky, fediverse/IndieWeb support, and tiered plans up to Studio ($20/month) for podcast recording and video hosting. Publii is a free, GPL-3.0 desktop app (Windows, macOS, Linux) that generates static sites with built-in SEO and GDPR/CCPA compliance tooling, but requires deploying the output yourself to a host like GitHub Pages or Netlify, and has no built-in multi-user collaboration. The choice depends on whether you want hosting and social distribution bundled into a subscription (Micro.blog) or a free, self-managed static-site workflow (Publii).",
  "bestForToolA": "Micro.blog suits bloggers and podcasters who want built-in hosting plus automatic cross-posting to Mastodon, Threads, and Bluesky, and are willing to pay $5-$20/month depending on the features needed.",
  "bestForToolB": "Publii suits publishers who want a completely free tool with built-in SEO and GDPR/CCPA compliance features and are comfortable deploying the generated static site to their own host.",
  "whoNeedsBoth": "There's no natural combined workflow since both are complete publishing solutions for the same core task. Someone could run a fediverse-focused microblog on Micro.blog while separately maintaining a static portfolio site built in Publii, but that's two independent sites rather than an integrated use case.",
  "keyDifferences": [
    {
      "title": "Hosting Model",
      "toolA": "Micro.blog is a hosted platform where hosting is included in the subscription price, starting at $5/month.",
      "toolB": "Publii is a desktop app that generates a static site you must deploy yourself to a target like GitHub Pages, Netlify, or S3.",
      "whyItMatters": "Bundled hosting removes deployment steps but adds recurring cost; self-managed deployment is free but requires more setup.",
      "benefitsWho": "Publishers who want a turnkey hosted solution (Micro.blog) versus those comfortable managing their own deployment (Publii)."
    },
    {
      "title": "Pricing",
      "toolA": "Micro.blog has no free plan and starts at $5/month, rising to $20/month for the Studio tier.",
      "toolB": "Publii's core desktop app is entirely free under the GPL-3.0 license.",
      "whyItMatters": "Ongoing subscription cost versus a one-time, free download changes the total cost of running a site over time.",
      "benefitsWho": "Budget-conscious publishers who want zero recurring software cost (Publii)."
    },
    {
      "title": "Social & Fediverse Integration",
      "toolA": "Micro.blog includes automatic cross-posting to Mastodon, Threads, and Bluesky from its base plan, plus fediverse and IndieWeb protocol support.",
      "toolB": "Not documented as a Publii feature.",
      "whyItMatters": "Built-in social distribution extends a post's reach without manual cross-posting.",
      "benefitsWho": "Writers who want their posts to automatically reach fediverse and mainstream social audiences (Micro.blog)."
    },
    {
      "title": "Team Collaboration",
      "toolA": "Micro.blog's Family plan ($15/month) lets up to 5 members write or edit posts across any blog on the account.",
      "toolB": "Publii's cons explicitly note no built-in multi-user/team collaboration.",
      "whyItMatters": "Multi-author support matters for family blogs, small teams, or shared publications.",
      "benefitsWho": "Families or small teams publishing together (Micro.blog Family plan)."
    },
    {
      "title": "Media & Podcast Features",
      "toolA": "Micro.blog's Studio plan ($20/month) adds video hosting up to 20 minutes, podcast recording, multiple video resolutions, and video cross-posting to Bluesky.",
      "toolB": "Publii's post editor supports image galleries, video, and code syntax highlighting, but no podcast-recording feature is documented.",
      "whyItMatters": "Dedicated podcast/video hosting removes the need for a separate media hosting service.",
      "benefitsWho": "Podcasters and video creators wanting an all-in-one publishing and hosting solution (Micro.blog Studio)."
    }
  ],
  "featureMatrix": [
    {
      "group": "Hosting & Publishing Model",
      "rows": [
        {
          "feature": "Hosting included",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Publii: you deploy the generated static files yourself"
        },
        {
          "feature": "Custom domain support",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Desktop app / offline editing",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Windows, macOS, Linux"
        },
        {
          "feature": "Deploy to GitHub Pages, Netlify, S3, etc.",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Social & Collaboration",
      "rows": [
        {
          "feature": "Fediverse/IndieWeb support",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Cross-posting to Mastodon/Threads/Bluesky",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Multi-user team collaboration",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Micro.blog Family plan, up to 5 members, $15/month"
        }
      ]
    },
    {
      "group": "Pricing & Media Features",
      "rows": [
        {
          "feature": "Free plan/tier",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Micro.blog starts at $5/month; Publii core is fully free"
        },
        {
          "feature": "Podcast/video hosting",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Micro.blog Studio, $20/month, video up to 20 minutes + podcast recording"
        },
        {
          "feature": "Email newsletters",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Micro.blog Premium, $10/month"
        },
        {
          "feature": "GDPR/cookie compliance tooling",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Publii: cookie banner + Google Consent Mode v2"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Micro.blog free like Publii?",
      "answer": "No. Micro.blog has no free plan and starts at $5/month. Publii's core desktop app is entirely free under the GPL-3.0 license."
    },
    {
      "question": "Does Publii include hosting?",
      "answer": "No. Publii generates a static site you must deploy yourself to a target like GitHub Pages, Netlify, or S3. Micro.blog is a hosted platform where hosting is included in the subscription."
    },
    {
      "question": "Which supports posting to Mastodon or Bluesky automatically?",
      "answer": "Micro.blog includes automatic cross-posting to Mastodon, Threads, and Bluesky from its base $5/month plan. This isn't documented as a Publii feature."
    },
    {
      "question": "Can multiple people collaborate on one blog?",
      "answer": "Micro.blog's Family plan ($15/month) lets up to 5 members write or edit posts. Publii's cons note it has no built-in multi-user/team collaboration."
    },
    {
      "question": "Does either support podcasting?",
      "answer": "Micro.blog's Studio plan ($20/month) adds podcast recording and video hosting up to 20 minutes. Podcast-specific tooling is not documented for Publii."
    },
    {
      "question": "Which has built-in GDPR/cookie consent tools?",
      "answer": "Publii includes an advanced cookie banner and Google Consent Mode v2 support in its free core. This is not documented as a Micro.blog feature."
    }
  ]
};

export default microBlogVsPubliiContent;
