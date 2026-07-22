import type { ToolComparisonContent } from './types';

const netlifyVsVercelContent: ToolComparisonContent = {
  "verdict": "Netlify and Vercel are both git-connected deployment platforms built around push-to-deploy workflows, but the documented feature sets point to different centers of gravity. Netlify's published feature list is the deeper and more explicit one: built-in Netlify Identity for authentication, native form handling without a backend, split testing across deploy branches, and Git-friendly large media optimization, all backed by a company founded in 2014 with an established Pro tier at 19 dollars per month per member. Vercel's documented facts are thinner but sharper on infrastructure basics: its free Hobby tier is explicitly described as including a real CDN, automatic CI and CD, and a Web Application Firewall rather than a crippled trial, and its Pro tier sits close to Netlify's at 20 dollars per user per month. The one documented weakness on Vercel's side is cost predictability: pay-as-you-go overages beyond the included usage credit make the total monthly bill harder to forecast than Netlify's flatter per-member fee plus quota model. Choosing between them, based on what is actually confirmed here, comes down to whether a team needs the extra built-in surface area Netlify documents, such as forms, identity, and split testing, or whether the priority is getting real production-grade infrastructure, including a WAF, on a free tier from day one. Neither tool's documented data supports calling one an outright winner.",
  "bestForToolA": "Netlify is the better fit for teams that want built-in extras beyond hosting, like native form handling, split testing across branches, and Netlify Identity for authentication, without wiring up separate services.",
  "bestForToolB": "Vercel is the better fit for teams that want a free tier with genuinely production-capable infrastructure, including a CDN, automatic CI and CD, and a Web Application Firewall, from the very first deploy.",
  "whoNeedsBoth": "Agencies and platform teams managing multiple client or internal projects may end up running some sites on Netlify for its forms, identity, and split-testing features and others on Vercel, choosing per project rather than standardizing on one.",
  "keyDifferences": [
    {
      "title": "Pro tier pricing",
      "toolA": "Netlify Pro is priced at 19 dollars per month per member",
      "toolB": "Vercel Pro is priced at 20 dollars per user per month",
      "whyItMatters": "A 1 dollar per seat difference compounds fast for larger teams billed monthly across many members",
      "benefitsWho": "Larger teams evaluating pure seat cost lean slightly toward Netlify"
    },
    {
      "title": "Free tier depth",
      "toolA": "Netlify Starter free tier documents continuous deployment from Git, deploy previews, global CDN hosting, and limited build minutes and function invocations",
      "toolB": "Vercel Hobby free tier is documented as including a real CDN, automatic CI and CD, a Web Application Firewall, and a base compute allowance",
      "whyItMatters": "Teams prototyping on a free plan want to know if they are getting a genuine platform or a stripped-down demo",
      "benefitsWho": "Security-conscious solo developers and small teams benefit from Vercel's documented WAF inclusion on its free tier"
    },
    {
      "title": "Built-in authentication",
      "toolA": "Netlify documents a built-in Netlify Identity feature for user authentication and access control integrated directly with deployed sites",
      "toolB": "Vercel's provided feature list does not document a built-in identity or authentication product",
      "whyItMatters": "Projects that need login and access control without adding a third-party auth service save integration time",
      "benefitsWho": "Small teams and solo builders who want auth without extra vendors benefit from Netlify"
    },
    {
      "title": "Form handling",
      "toolA": "Netlify documents automatic capture and processing of HTML form submissions with no separate backend required",
      "toolB": "Vercel's provided data does not document a built-in form handling feature",
      "whyItMatters": "Marketing and content sites frequently need simple contact or signup forms without standing up an API",
      "benefitsWho": "Marketing sites and landing pages benefit from Netlify's native form handling"
    },
    {
      "title": "Split testing",
      "toolA": "Netlify documents split testing that runs A/B tests across different deploy branches on real traffic",
      "toolB": "Vercel's provided data does not document a split testing or branch-based A/B testing feature",
      "whyItMatters": "Teams that want to measure the impact of changes on live traffic without extra tooling save setup time",
      "benefitsWho": "Growth and marketing teams benefit from Netlify's built-in split testing"
    },
    {
      "title": "Web Application Firewall",
      "toolA": "Netlify's provided feature list does not document a Web Application Firewall",
      "toolB": "Vercel documents a Web Application Firewall included on its free Hobby tier",
      "whyItMatters": "A WAF included by default reduces the need to add a separate security layer for public-facing apps",
      "benefitsWho": "Security-focused teams and public-facing production apps benefit from Vercel's included WAF"
    },
    {
      "title": "Cost predictability at scale",
      "toolA": "Netlify Pro is a flat per-member fee with build minute and bandwidth quotas that require active monitoring on busier projects",
      "toolB": "Vercel documents that Pro tier pay-as-you-go overages beyond the included usage credit make total monthly cost less predictable than a flat fee",
      "whyItMatters": "Finance and engineering leads planning budgets want to know whether a bill can spike unexpectedly",
      "benefitsWho": "Budget-conscious teams that prefer a flatter, more predictable fee lean toward Netlify"
    },
    {
      "title": "Media and asset workflows",
      "toolA": "Netlify documents Git-friendly large media and asset optimization to keep repositories lean",
      "toolB": "Vercel's provided data does not document a dedicated large media or asset optimization feature",
      "whyItMatters": "Projects with many large images or binary assets in their Git history benefit from tooling built specifically for that problem",
      "benefitsWho": "Content-heavy sites with large media libraries benefit from Netlify's documented asset handling"
    },
    {
      "title": "Enterprise plan structure",
      "toolA": "Netlify Enterprise is an annual contract with advanced security and compliance controls, dedicated support and SLAs, custom usage limits, and single sign-on",
      "toolB": "Vercel Enterprise is listed as custom pricing with no billing cycle or feature detail documented",
      "whyItMatters": "Enterprise buyers need to know whether SSO, SLAs, and compliance controls are already spelled out or require a sales conversation to confirm",
      "benefitsWho": "Enterprise buyers get more documented detail upfront from Netlify, while Vercel enterprise specifics require contacting sales"
    },
    {
      "title": "Company background",
      "toolA": "Netlify was founded in 2014 and is headquartered in San Francisco, California",
      "toolB": "Vercel's provided data does not document a founding year or headquarters location",
      "whyItMatters": "Buyers doing vendor due diligence sometimes weigh company maturity and location for support time zones and stability",
      "benefitsWho": "Procurement and due-diligence reviewers get more documented company background from Netlify"
    }
  ],
  "featureMatrix": [
    {
      "group": "Deployment and CI/CD",
      "rows": [
        {
          "feature": "Git-based continuous deployment",
          "toolA": "available",
          "toolB": "available",
          "note": "Netlify deploys from GitHub, GitLab, or Bitbucket on every push; Vercel documents automatic CI and CD as push-to-deploy."
        },
        {
          "feature": "Deploy previews for pull requests",
          "toolA": "available",
          "toolB": "available",
          "note": "Documented for Netlify; well-established core Vercel capability though not itemized in the provided Vercel feature list."
        },
        {
          "feature": "Instant rollbacks",
          "toolA": "available",
          "toolB": "available",
          "note": "Both document instant rollback to a prior deploy."
        }
      ]
    },
    {
      "group": "Hosting Performance and Assets",
      "rows": [
        {
          "feature": "Global CDN",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Custom redirects and headers as code",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Not itemized in the provided Vercel feature data."
        },
        {
          "feature": "Large media and asset optimization",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        }
      ]
    },
    {
      "group": "Compute",
      "rows": [
        {
          "feature": "Serverless functions",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Edge functions",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Netlify explicitly documents edge functions; Vercel's provided data only lists serverless functions."
        }
      ]
    },
    {
      "group": "Security and Access Control",
      "rows": [
        {
          "feature": "Web Application Firewall",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Documented as included on Vercel's Hobby tier."
        },
        {
          "feature": "Password-protected sites",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Documented on Netlify's Pro plan."
        },
        {
          "feature": "Single sign-on",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Documented on Netlify's Enterprise plan."
        }
      ]
    },
    {
      "group": "Collaboration Testing and User Features",
      "rows": [
        {
          "feature": "Split testing across deploy branches",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Built-in form handling",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Built-in identity and authentication",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Netlify Identity is a named product feature."
        }
      ]
    },
    {
      "group": "Plans and Pricing",
      "rows": [
        {
          "feature": "Free tier",
          "toolA": "available",
          "toolB": "available",
          "note": "Netlify Starter is free with limited build minutes and function invocations; Vercel Hobby is 0 dollars and documented to include CDN, CI and CD, and WAF."
        },
        {
          "feature": "Per-seat paid tier",
          "toolA": "available",
          "toolB": "available",
          "note": "Netlify Pro is 19 dollars per month per member; Vercel Pro is 20 dollars per user per month."
        },
        {
          "feature": "Enterprise custom pricing",
          "toolA": "available",
          "toolB": "available",
          "note": "Netlify documents specific enterprise features; Vercel's enterprise feature list is not itemized."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is cheaper, Netlify or Vercel?",
      "answer": "For the paid per-seat tier, Netlify Pro at 19 dollars per month per member is documented as slightly cheaper than Vercel Pro at 20 dollars per user per month, though both also offer a free tier and custom Enterprise pricing."
    },
    {
      "question": "Does Netlify or Vercel have a better free plan?",
      "answer": "Both offer a genuinely usable free tier: Netlify Starter includes continuous deployment, deploy previews, and global CDN hosting with limited build minutes and function invocations, while Vercel Hobby is documented to include a real CDN, automatic CI and CD, a Web Application Firewall, and a base compute allowance rather than a crippled demo."
    },
    {
      "question": "Can Vercel do form handling and authentication like Netlify?",
      "answer": "Based on the documented feature data, Vercel does not list a built-in form handling or identity and authentication product, while Netlify explicitly documents native form handling and Netlify Identity, so teams needing those specific built-ins have more confirmed support from Netlify."
    },
    {
      "question": "Which platform has more predictable monthly pricing?",
      "answer": "Netlify's Pro plan is documented as a flat per-member fee with build minute and bandwidth quotas, while Vercel documents pay-as-you-go overages beyond its included usage credit as a factor that makes total monthly cost less predictable than a flat fee."
    },
    {
      "question": "Does Vercel include a Web Application Firewall?",
      "answer": "Yes, Vercel documents a Web Application Firewall as included even on its free Hobby tier, a security feature that is not documented in Netlify's provided feature list."
    },
    {
      "question": "Which tool offers split testing or A/B testing?",
      "answer": "Netlify documents a dedicated split testing feature that runs A/B tests across different deploy branches on real traffic; this capability is not documented in the provided Vercel feature data."
    }
  ]
};

export default netlifyVsVercelContent;
