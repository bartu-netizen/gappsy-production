import type { ToolComparisonContent } from './types';

const courseraVsUdemyContent: ToolComparisonContent = {
  "verdict": "Coursera and Udemy both sit in the freemium online-learning category, but they are built around different definitions of what a course is worth. Coursera organizes content around named university and industry partners, sequencing it into Specializations, Professional Certificates, and even accredited bachelor's and master's degrees, so its value proposition is structured credentialing tied to a recognizable institution or employer brand. Udemy is an open marketplace where nearly anyone can publish a course, which produces an enormous, fast-moving, often heavily discounted catalog but no standardized curriculum or accreditation. If the goal is a resume-relevant credential, a degree pathway, or content vetted by a specific university or company, Coursera's model is built for that. If the goal is picking up a practical skill quickly and cheaply, with lifetime access to a specific course and direct instructor Q&A, Udemy's model is built for that. Pricing philosophy also differs: Coursera leans on free audits plus per-course or subscription pricing with financial aid, while Udemy leans on steep promotional discounts on one-time purchases. Neither tool is a strict upgrade over the other; they optimize for different outcomes, structured credentials on one side, breadth and price flexibility on the other, and the right choice depends on whether the learner needs proof of completion that carries institutional weight or simply needs to learn a skill affordably and quickly.",
  "bestForToolA": "Coursera fits learners who want a credential tied to a recognizable university or employer, such as a Professional Certificate, Specialization, or full accredited online degree.",
  "bestForToolB": "Udemy fits learners who want to pick up a specific practical skill quickly and cheaply, with lifetime access to that individual course and direct instructor Q&A.",
  "whoNeedsBoth": "A team or individual building a full learning stack, using Coursera for structured, credentialed programs and Udemy for cheap, targeted skill refreshers, would reasonably end up using both.",
  "keyDifferences": [
    {
      "title": "Content source model",
      "toolA": "Courses come from named university and industry partners such as Google, IBM, and Meta",
      "toolB": "Anyone can apply to become an instructor and publish a course through an open marketplace",
      "whyItMatters": "It determines how much a buyer can trust the pedigree behind any given course before enrolling",
      "benefitsWho": "Coursera benefits learners who value institutional credibility; Udemy benefits learners who want the widest possible topic coverage"
    },
    {
      "title": "Credential type",
      "toolA": "Offers Professional Certificates, Specializations, and accredited bachelor's and master's degrees",
      "toolB": "Offers certificates of completion that are explicitly not accredited",
      "whyItMatters": "Employers and institutions weigh accredited or partner-backed credentials differently than informal completion certificates",
      "benefitsWho": "Career changers and degree seekers benefit from Coursera; hobbyists documenting a skill informally are fine with Udemy"
    },
    {
      "title": "Pricing structure",
      "toolA": "Individual courses typically start around 49 dollars, with a Coursera Plus subscription for broader access",
      "toolB": "Individual courses range from 9.99 to 199.99 dollars with frequent deep discounts, or a Personal Plan starting around 16.99 dollars per month",
      "whyItMatters": "Buyers on a tight budget need to know whether they are paying for one specific course or unlocking a wide catalog",
      "benefitsWho": "Budget-conscious single-skill learners benefit from Udemy discounts; frequent learners across many topics may find a Coursera Plus subscription more predictable"
    },
    {
      "title": "Free access model",
      "toolA": "Most courses can be audited free for lectures and readings, but without graded work or a certificate",
      "toolB": "A selection of standalone free courses is available, separate from the paid catalog",
      "whyItMatters": "It affects whether a learner can preview an entire structured program or only access separate free titles",
      "benefitsWho": "Learners who want to sample a full program before paying benefit from Coursera audits; learners looking for a complete free course benefit from Udemy's free catalog"
    },
    {
      "title": "Degree pathway",
      "toolA": "Partners with accredited universities to deliver full online bachelor's and master's degree programs",
      "toolB": "Not documented as offering any degree program",
      "whyItMatters": "This is the clearest structural difference for anyone seeking a formal academic qualification rather than a skills credential",
      "benefitsWho": "Learners pursuing a real degree need Coursera; this dimension is not relevant to typical Udemy use cases"
    },
    {
      "title": "Enterprise and AI-powered tools",
      "toolA": "Coursera for Business, Campus, and Government offers curated learning paths and progress tracking, with no AI features documented",
      "toolB": "Udemy Business includes AI-powered features such as role-play practice and personalized recommendations",
      "whyItMatters": "Organizations evaluating modern corporate training platforms often weigh AI-assisted features as a differentiator",
      "benefitsWho": "Corporate learning and development teams interested in AI-driven personalization benefit from Udemy Business"
    },
    {
      "title": "Instructor interaction style",
      "toolA": "Interaction is mostly indirect, through course discussion forums and peer review",
      "toolB": "Per-lecture Q&A and discussion boards let students ask instructors and peers directly about the material",
      "whyItMatters": "Learners who need responsive help while working through content will notice the difference in how directly they can reach an instructor",
      "benefitsWho": "Self-directed learners are fine with Coursera's forum model; learners who want quicker instructor contact may prefer Udemy's per-lecture Q&A"
    },
    {
      "title": "Financial assistance",
      "toolA": "Offers a formal financial aid application that can reduce or remove the cost of a course or Specialization",
      "toolB": "Not documented as offering financial aid; affordability instead comes from frequent promotional discounts",
      "whyItMatters": "A formal aid process versus relying on sale pricing changes how predictably a low-income learner can budget for a credential",
      "benefitsWho": "Learners who qualify for need-based aid benefit from Coursera's process; price-sensitive shoppers who can time purchases benefit from Udemy's discount cycles"
    },
    {
      "title": "Short-form guided content",
      "toolA": "Offers Guided Projects, hands-on tutorials in a split-screen workspace usually completed in under two hours",
      "toolB": "Not documented as offering an equivalent short-form guided project format",
      "whyItMatters": "Learners who want a quick, structured hands-on exercise rather than a multi-hour course have a documented option on one side only",
      "benefitsWho": "Learners wanting a fast, structured practical exercise benefit from Coursera's Guided Projects"
    },
    {
      "title": "Course ownership and access duration",
      "toolA": "Not documented as guaranteeing indefinite access to individually purchased courses",
      "toolB": "Individually purchased courses remain accessible indefinitely, including future instructor updates",
      "whyItMatters": "Long-term access to a specific purchased course matters for learners who revisit material over time",
      "benefitsWho": "Learners who want to keep and re-watch a specific purchased course benefit from Udemy's documented lifetime access model"
    }
  ],
  "featureMatrix": [
    {
      "group": "Course Catalog and Formats",
      "rows": [
        {
          "feature": "On-demand video courses",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Short hands-on guided projects",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Coursera Guided Projects run in a split-screen workspace, typically under two hours"
        },
        {
          "feature": "Multi-course sequenced bundles",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Coursera Specializations sequence related courses with a capstone"
        }
      ]
    },
    {
      "group": "Certificates and Credentials",
      "rows": [
        {
          "feature": "Certificate upon completion",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Accredited certificate or degree",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Coursera degrees are delivered with accredited university partners; Udemy certificates are explicitly not accredited"
        },
        {
          "feature": "Employer-designed professional certificate",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Coursera Professional Certificates are built with partners like Google, IBM, and Meta"
        }
      ]
    },
    {
      "group": "Pricing and Access",
      "rows": [
        {
          "feature": "Free course access",
          "toolA": "available",
          "toolB": "available",
          "note": "Coursera offers free audits on most courses; Udemy offers a selection of standalone free courses"
        },
        {
          "feature": "Subscription for broad catalog access",
          "toolA": "available",
          "toolB": "available",
          "note": "Coursera Plus and Udemy Personal Plan, respectively"
        },
        {
          "feature": "Formal financial aid application",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Lifetime access to purchased course",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Enterprise and Team Learning",
      "rows": [
        {
          "feature": "Business or enterprise plan",
          "toolA": "available",
          "toolB": "available",
          "note": "Coursera for Business, Campus, and Government; Udemy Business"
        },
        {
          "feature": "Admin usage analytics and reporting",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "AI-powered learning tools",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Documented for Udemy Business only, including role-play practice and recommendations"
        }
      ]
    },
    {
      "group": "Platform and Mobile Access",
      "rows": [
        {
          "feature": "iOS and Android mobile apps",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Offline video downloads",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Community and Instructor Interaction",
      "rows": [
        {
          "feature": "Course discussion forums or Q and A",
          "toolA": "available",
          "toolB": "available",
          "note": "Coursera includes peer review and forums on paid courses; Udemy offers per-lecture Q and A"
        },
        {
          "feature": "Direct instructor interaction",
          "toolA": "limited",
          "toolB": "available",
          "note": "Coursera interaction is mostly indirect through forums per documented cons"
        }
      ]
    },
    {
      "group": "Instructor and Content Model",
      "rows": [
        {
          "feature": "Open marketplace for anyone to publish a course",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Coursera courses come only from vetted university and industry partners"
        },
        {
          "feature": "Content curated by named institutional partners",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is cheaper, Coursera or Udemy?",
      "answer": "Udemy individual courses can start lower, from 9.99 dollars with frequent deep discounts, while Coursera individual courses typically start around 49 dollars; both also offer subscriptions, Coursera Plus and Udemy's Personal Plan starting around 16.99 dollars per month, so the cheaper option depends on whether you need one course or ongoing access to a catalog."
    },
    {
      "question": "Is Udemy good for beginners?",
      "answer": "Yes, Udemy's large, low-cost catalog and lifetime access to purchased courses make it accessible for beginners picking up a specific skill, though course quality varies since instructors are not centrally vetted for teaching rigor."
    },
    {
      "question": "Can Udemy replace Coursera for earning a real credential or degree?",
      "answer": "No, based on documented facts Udemy only issues non-accredited certificates of completion, while Coursera offers Professional Certificates, Specializations, and accredited bachelor's and master's degrees through university partners, so Udemy does not offer an equivalent degree or accredited credential pathway."
    },
    {
      "question": "Which platform has better free content?",
      "answer": "Both offer free access but in different forms: Coursera lets learners audit most individual courses for free, minus graded work and certificates, while Udemy offers a separate selection of standalone free courses rather than free audits of its paid catalog."
    },
    {
      "question": "Do Coursera or Udemy offer accredited certificates?",
      "answer": "Coursera offers accredited outcomes only through its university degree programs, since most of its Specializations and Professional Certificates are skills credentials rather than academic accreditation, while Udemy's certificates of completion are explicitly stated as not accredited."
    },
    {
      "question": "Which is better for corporate or team training?",
      "answer": "Both have enterprise offerings, Coursera for Business, Campus, and Government and Udemy Business, but only Udemy Business is documented as including AI-powered learning tools such as role-play practice and personalized recommendations, which may matter for organizations specifically wanting AI-assisted corporate training."
    }
  ]
};

export default courseraVsUdemyContent;
