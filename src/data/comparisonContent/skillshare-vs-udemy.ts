import type { ToolComparisonContent } from './types';

const skillshareVsUdemyContent: ToolComparisonContent = {
  "verdict": "Skillshare and Udemy solve different learning problems. Skillshare is a flat-fee subscription built around short, project-based classes in creative, business, and lifestyle topics, where every class ends with a hands-on assignment and peer feedback in a project gallery. It suits people who want ongoing, varied, low-stakes skill exploration rather than a single deep credential. Udemy is a marketplace of individually purchased, instructor-led video courses spanning a much wider range of topics, including deeply technical subjects, with lifetime access to whatever you buy plus a non-accredited certificate of completion. It suits people who know exactly which course they need, want to own it permanently, and do not mind paying per course rather than a recurring fee. Neither platform offers accredited credentials, and both rely on open or lightly vetted instructor pools, so course quality varies within each catalog. The clearest dividing line is the business model: Skillshare is subscription-only with no per-course purchase option, while Udemy blends free content, one-time purchases, an optional Personal Plan subscription, and a separate Udemy Business tier for organizations with admin controls and AI-powered tools. Buyers should choose based on whether they want unlimited access across many creative topics (Skillshare) or targeted, ownable courses with broader technical depth and team-training options (Udemy).",
  "bestForToolA": "Skillshare fits hobbyists and creative professionals who want unlimited access to a rotating catalog of short, project-based classes in design, photography, and business skills rather than a single deep credential.",
  "bestForToolB": "Udemy fits learners who want to buy one specific course, especially in a technical subject, keep it for life, and optionally hold a non-accredited certificate, as well as organizations needing Udemy Business for team training with admin and AI tools.",
  "whoNeedsBoth": "A professional developing broad creative skills through Skillshare's project-based classes while also buying individual deep-dive technical or certification-adjacent courses on Udemy would reasonably keep both subscriptions.",
  "keyDifferences": [
    {
      "title": "Pricing structure",
      "toolA": "Subscription only, at 13.99 dollars per month billed annually at 167.88 dollars per year, or around 32 dollars per month billed monthly",
      "toolB": "Free courses, individual course purchases from 9.99 to 199.99 dollars, an optional Personal Plan subscription starting around 16.99 dollars per month, and Udemy Business from about 360 dollars per user per year",
      "whyItMatters": "Learners who only need one topic can pay far less on Udemy through a single course purchase, while learners who explore many topics get better value from Skillshare's flat subscription",
      "benefitsWho": "Occasional single-topic learners benefit from Udemy's per-course pricing; frequent multi-topic learners benefit from Skillshare's flat-rate subscription"
    },
    {
      "title": "Content ownership model",
      "toolA": "Access to classes depends on an active Premium membership; there is no documented option to permanently own a class after canceling",
      "toolB": "Individually purchased courses come with lifetime access, including future content updates from the instructor",
      "whyItMatters": "Some learners want a course they can revisit indefinitely without paying an ongoing fee",
      "benefitsWho": "Learners who want permanent reference material benefit from Udemy's lifetime access model"
    },
    {
      "title": "Catalog focus and depth",
      "toolA": "Focused on creative, business, and lifestyle topics delivered in short, focused lessons",
      "toolB": "Spans technology, business, design, marketing, and personal development, with room for deeply technical courses",
      "whyItMatters": "Learners seeking in-depth technical or software training are more likely to find matching depth on a broader marketplace catalog",
      "benefitsWho": "Creative hobbyists benefit from Skillshare's curated focus; tech and business professionals needing technical depth benefit from Udemy's broader catalog"
    },
    {
      "title": "Learning format",
      "toolA": "Every class is built around a required hands-on project, reviewed in public project galleries",
      "toolB": "Courses are instructor-led video lectures with per-lecture Q and A and discussion boards; no documented universal project requirement",
      "whyItMatters": "A mandatory project structure suits people who learn best by doing and want built-in accountability",
      "benefitsWho": "Hands-on learners wanting a portfolio of finished work benefit from Skillshare; learners who prefer structured lectures and notes benefit from Udemy"
    },
    {
      "title": "Certificates of completion",
      "toolA": "Does not issue certificates or credentials of any kind; class completion is informal",
      "toolB": "Issues a shareable but non-accredited certificate of completion for finished courses",
      "whyItMatters": "Some learners want something tangible to add to a resume or professional profile even if it is not accredited",
      "benefitsWho": "Job seekers wanting a completion artifact benefit from Udemy's certificates; this is not available on Skillshare"
    },
    {
      "title": "Business and enterprise offering",
      "toolA": "No documented team or enterprise product; only individual Free and Premium membership tiers exist",
      "toolB": "Udemy Business provides a curated content library, admin dashboard, reporting, and custom learning paths for organizations",
      "whyItMatters": "Companies training many employees need centralized licensing, reporting, and administration that only one of these platforms documents",
      "benefitsWho": "Learning and development teams and larger organizations benefit from Udemy Business; this need is unaddressed by Skillshare's individual plans"
    },
    {
      "title": "AI-powered learning tools",
      "toolA": "Not documented in the available facts; no AI features are listed for Skillshare",
      "toolB": "Udemy Business includes AI features such as role-play practice and personalized course recommendations",
      "whyItMatters": "Organizations evaluating modern corporate training platforms may weigh built-in AI capabilities as a differentiator",
      "benefitsWho": "Enterprise buyers evaluating Udemy Business benefit from documented AI tooling not present in Skillshare's facts"
    },
    {
      "title": "Free trial versus refund policy",
      "toolA": "New members typically get a full-access trial period before any subscription charge, with length varying between web and mobile app",
      "toolB": "A 7-day free trial applies specifically to the Personal Plan subscription, while individual course purchases are instead covered by a limited-time refund window that can change over time",
      "whyItMatters": "The type of purchase protection differs: a trial reduces risk before a subscription starts, while a refund window reduces risk after a one-time purchase",
      "benefitsWho": "Subscription-first buyers on both platforms get a pre-commitment trial; one-time course buyers on Udemy get a post-purchase refund safeguard instead"
    },
    {
      "title": "Instructor marketplace openness",
      "toolA": "Provides teacher publishing tools, performance analytics, and a referral program, but instructor feedback quality is noted as inconsistent",
      "toolB": "Operates as an open marketplace where anyone can apply to become an instructor, publish courses, and earn revenue share, with no centralized rigor vetting described",
      "whyItMatters": "Neither catalog is centrally vetted for teaching quality, so course and class quality varies within both platforms regardless of pricing model",
      "benefitsWho": "Learners on either platform benefit from checking individual instructor reviews before committing, since open publishing affects both"
    },
    {
      "title": "Mobile and offline access",
      "toolA": "Native iOS and Android apps sync progress, bookmarks, and downloads; offline downloads require Premium membership",
      "toolB": "Native iOS and Android apps support offline downloads for lectures, including on the Personal Plan tier",
      "whyItMatters": "Learners who study during commutes or without reliable internet need offline access, though it is gated behind a paid tier on both platforms",
      "benefitsWho": "Mobile-first learners on either platform benefit equally, provided they hold the relevant paid membership or plan"
    }
  ],
  "featureMatrix": [
    {
      "group": "Course Catalog and Format",
      "rows": [
        {
          "feature": "On-demand video lessons",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Required hands-on project per class",
          "toolA": "available",
          "toolB": "limited",
          "note": "Udemy has Q and A and discussion boards, but no documented universal project requirement"
        },
        {
          "feature": "Deeply technical or software-focused courses",
          "toolA": "limited",
          "toolB": "available",
          "note": "Skillshare is centered on creative, business, and lifestyle topics"
        },
        {
          "feature": "Course discussion and Q and A boards",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Pricing and Access",
      "rows": [
        {
          "feature": "Free tier",
          "toolA": "available",
          "toolB": "available",
          "note": "Skillshare free tier limits catalog access and offline downloads; Udemy has a selection of free courses"
        },
        {
          "feature": "Subscription plan",
          "toolA": "available",
          "toolB": "available",
          "note": "Skillshare Premium Monthly or Annual; Udemy Personal Plan"
        },
        {
          "feature": "Pay-per-course purchase",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Individual courses priced 9.99 to 199.99 dollars"
        },
        {
          "feature": "Free trial before paid billing",
          "toolA": "available",
          "toolB": "available",
          "note": "Udemy's trial applies only to the Personal Plan, not individual course purchases"
        }
      ]
    },
    {
      "group": "Certification and Credentials",
      "rows": [
        {
          "feature": "Certificate of completion",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Udemy's certificate is non-accredited"
        },
        {
          "feature": "Accredited credential recognized by employers",
          "toolA": "unavailable",
          "toolB": "unavailable",
          "note": ""
        }
      ]
    },
    {
      "group": "Mobile and Offline",
      "rows": [
        {
          "feature": "iOS and Android apps",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Offline downloads",
          "toolA": "available",
          "toolB": "available",
          "note": "Gated behind paid membership or plan on both platforms"
        }
      ]
    },
    {
      "group": "Community and Peer Feedback",
      "rows": [
        {
          "feature": "Peer project galleries with feedback",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Instructor and peer Q and A per lecture",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Business and Team Training",
      "rows": [
        {
          "feature": "Dedicated enterprise or team plan",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Udemy Business, annual billing, custom pricing for Enterprise"
        },
        {
          "feature": "Admin dashboard and reporting",
          "toolA": "unavailable",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "AI-powered learning tools",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Included in Udemy Business, such as role-play practice and personalized recommendations"
        }
      ]
    },
    {
      "group": "Instructor Tools",
      "rows": [
        {
          "feature": "Instructor publishing and analytics tools",
          "toolA": "available",
          "toolB": "available",
          "note": "Both include revenue or referral incentives for instructors"
        },
        {
          "feature": "Centralized vetting of instructor teaching quality",
          "toolA": "not-documented",
          "toolB": "not-documented",
          "note": "Udemy is explicitly described as an open marketplace with no vetting described; Skillshare provides no vetting details either"
        }
      ]
    },
    {
      "group": "Progress and Content Access",
      "rows": [
        {
          "feature": "Progress tracking and bookmarking",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Lifetime access after paying once",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Skillshare access depends on an active subscription; Udemy individual purchases are owned permanently"
        },
        {
          "feature": "Future content updates included after purchase",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Applies to individually purchased Udemy courses"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is cheaper, Skillshare or Udemy",
      "answer": "It depends on how much you learn: Udemy is cheaper for a single topic since individual courses start at 9.99 dollars with frequent discounts, while Skillshare is cheaper for broad, ongoing use since its 13.99 dollars per month annual subscription covers unlimited classes instead of paying per course."
    },
    {
      "question": "Is Skillshare or Udemy better for beginners",
      "answer": "Both are beginner-friendly, but they fit different beginner needs: Skillshare's short, project-based classes suit beginners exploring creative or business skills casually, while Udemy suits beginners who already know the specific technical or professional course they want to buy and keep permanently."
    },
    {
      "question": "Does Skillshare offer certificates like Udemy",
      "answer": "No, Skillshare does not issue any certificates or credentials, while Udemy issues a shareable but non-accredited certificate of completion for finished courses."
    },
    {
      "question": "Can Udemy Business replace what Skillshare offers for individual creative learning",
      "answer": "Not directly, since Udemy Business is a curated, admin-managed library aimed at organizational training rather than the open-ended, project-based creative catalog that defines Skillshare's individual Premium membership."
    },
    {
      "question": "Which platform has better offline mobile access",
      "answer": "Both platforms offer comparable offline access, since Skillshare and Udemy each provide native iOS and Android apps with offline downloads, though both require a paid membership or plan to unlock it."
    },
    {
      "question": "Do Skillshare or Udemy certificates carry real weight with employers",
      "answer": "Neither does: Skillshare offers no certificates at all, and Udemy's certificates of completion are explicitly non-accredited and carry limited recognition for professional licensing or academic credit."
    }
  ]
};

export default skillshareVsUdemyContent;
