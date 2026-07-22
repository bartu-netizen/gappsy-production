import type { ToolComparisonContent } from './types';

const deelVsRemoteContent: ToolComparisonContent = {
  "verdict": "Deel and Remote solve the same core problem, hiring and paying international employees and contractors without opening a local entity, and both were founded in 2019 out of San Francisco, so the decision usually comes down to pricing structure and how each vendor packages contractor risk. Deel leans on breadth: a free Deel HR tier for centralizing workforce data, product modules covering immigration support and performance management through Deel Engage, and native iOS and Android apps, but its EOR and Global Payroll rates are largely custom-quoted. Remote leans on pricing transparency and contractor protection: flat, published rates starting at 29 dollars per contractor per month, a Contractor of Record option where Remote itself engages the contractor, and misclassification protection up to 100,000 dollars per contractor on its Plus tier. Teams that want a free system of record before committing to paid modules, plus mobile access and immigration help, are better served by Deel. Teams that want cost certainty from the first hire, stronger contractor misclassification coverage, and are comfortable with no free tier will lean toward Remote. Neither tool is a strict upgrade over the other; the right pick depends on whether a buyer values Deel's broader free-to-paid product ladder or Remote's published, protection-backed contractor pricing.",
  "bestForToolA": "Deel is the better fit for companies that want a free centralized HRIS to start with, need immigration and visa support alongside EOR, or want native mobile apps for managing a global workforce.",
  "bestForToolB": "Remote is the better fit for companies that want transparent, published EOR and contractor pricing upfront and want Remote to directly engage contractors with misclassification protection built in.",
  "whoNeedsBoth": "Larger global employers sometimes run both platforms in parallel to compare per-country EOR quotes, or because different business units standardized on each vendor before consolidating international hiring.",
  "keyDifferences": [
    {
      "title": "EOR and Global Payroll pricing transparency",
      "toolA": "Deel's EOR (from 599 dollars/employee/month) and Global Payroll pricing require a custom quote",
      "toolB": "Remote publishes flat-rate EOR pricing starting at 599 dollars/employee/month billed annually, with Global Payroll still requiring a custom quote",
      "whyItMatters": "Buyers comparing vendors early in a search often want to budget before ever entering a sales conversation",
      "benefitsWho": "Cost-conscious teams and buyers who want to self-serve a quote benefit more from Remote's published rates"
    },
    {
      "title": "Contractor management starting price",
      "toolA": "Deel's Contractor Management starts around 49 dollars per contractor per month",
      "toolB": "Remote's Contractor Management starts at 29 dollars per contractor per month, with a 99 dollar Plus tier",
      "whyItMatters": "For companies paying dozens of contractors, a 20 dollar per-contractor gap compounds quickly across a payroll run",
      "benefitsWho": "Startups and agencies with many contractors benefit from Remote's lower entry price"
    },
    {
      "title": "Free HR tier",
      "toolA": "Deel HR is a free, standalone HRIS for centralizing employee records, org charts, time off, and documents",
      "toolB": "Remote's Global HR Platform is part of its paid offering with no documented free tier",
      "whyItMatters": "A free system of record lets a company centralize workforce data before committing budget to EOR or payroll",
      "benefitsWho": "Smaller teams or those still evaluating global hiring vendors benefit from Deel's free tier"
    },
    {
      "title": "Contractor engagement model",
      "toolA": "Deel offers Contractor Management, where the client directly engages and pays the contractor",
      "toolB": "Remote offers both Contractor Management and a separate Contractor of Record product where Remote itself engages the contractor",
      "whyItMatters": "Contractor of Record shifts more of the misclassification risk onto the vendor rather than the hiring company",
      "benefitsWho": "Companies worried about contractor misclassification exposure benefit from Remote's Contractor of Record option"
    },
    {
      "title": "Misclassification protection",
      "toolA": "Deel's provided facts do not document a specific misclassification protection guarantee",
      "toolB": "Remote's Contractor Management Plus tier includes misclassification protection up to 100,000 dollars per contractor",
      "whyItMatters": "Misclassification penalties can be a significant financial and legal risk when engaging international contractors",
      "benefitsWho": "Companies scaling contractor headcount quickly benefit from Remote's explicit indemnity coverage"
    },
    {
      "title": "Immigration and visa support",
      "toolA": "Deel has a dedicated Immigration Support feature for visa and work permit sponsorship",
      "toolB": "Remote's provided facts do not document a standalone immigration or visa sponsorship feature",
      "whyItMatters": "Relocating employees across borders often requires visa help alongside standard EOR employment",
      "benefitsWho": "Companies relocating talent internationally benefit from Deel's immigration support"
    },
    {
      "title": "Performance and talent development tools",
      "toolA": "Deel Engage layers performance reviews, goal-setting, and career development on top of core HR data",
      "toolB": "Remote's provided facts do not document an equivalent performance management module",
      "whyItMatters": "Some buyers want a single platform that manages both compliance and ongoing people management",
      "benefitsWho": "HR teams that want performance management bundled in benefit from Deel Engage"
    },
    {
      "title": "Mobile app availability",
      "toolA": "Deel is documented with native iOS and Android apps",
      "toolB": "Remote's provided facts list only a web app, API, and templates, with no documented native mobile apps",
      "whyItMatters": "Employees and contractors in the field often check pay status or time off from a phone rather than a desktop",
      "benefitsWho": "Distributed teams that need on-the-go access benefit from Deel's mobile apps"
    },
    {
      "title": "Contract templates",
      "toolA": "Deel's provided facts do not list a standalone contract templates library as a tag or feature",
      "toolB": "Remote is tagged with templates, reflecting localized employment and contractor agreement templates",
      "whyItMatters": "Ready-made, localized templates can speed up onboarding new hires in unfamiliar jurisdictions",
      "benefitsWho": "Teams onboarding contractors or employees in new countries for the first time benefit from Remote's documented templates"
    },
    {
      "title": "Company background",
      "toolA": "Deel was founded in 2019 and is headquartered in San Francisco, California",
      "toolB": "Remote was also founded in 2019 and is headquartered in San Francisco, California",
      "whyItMatters": "Both vendors have similar market tenure, so this is not a meaningful differentiator on its own but rules out one being a newer, less proven entrant",
      "benefitsWho": "Buyers prioritizing vendor maturity can treat both as comparably established rather than favoring one"
    }
  ],
  "featureMatrix": [
    {
      "group": "Employer of Record and Global Payroll",
      "rows": [
        {
          "feature": "Employer of Record (EOR)",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Global Payroll for owned entities",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Published exact country count (150+)",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Deel states 150+ countries; Remote describes broad but unspecified coverage"
        }
      ]
    },
    {
      "group": "Contractor Engagement",
      "rows": [
        {
          "feature": "Contractor Management (client directly engages contractor)",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Contractor of Record (vendor directly engages contractor)",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Misclassification protection guarantee",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Up to 100,000 dollars per contractor on Remote's Contractor Management Plus tier"
        }
      ]
    },
    {
      "group": "HR and Core Platform",
      "rows": [
        {
          "feature": "Centralized HRIS (org chart, time off, documents)",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Free HR tier with no cost",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Deel HR is 0 dollars; Remote has no documented free plan"
        }
      ]
    },
    {
      "group": "Compensation and Benefits",
      "rows": [
        {
          "feature": "Equity Management",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Standalone Benefits Administration feature",
          "toolA": "limited",
          "toolB": "available",
          "note": "Deel bundles benefits handling within its EOR description rather than listing a separate Benefits Administration feature"
        },
        {
          "feature": "Multi-currency payments to workers",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Deel lists Multi-Currency Payments as a distinct feature; Remote's facts do not list this as a standalone feature"
        }
      ]
    },
    {
      "group": "Screening, Compliance, and Immigration",
      "rows": [
        {
          "feature": "Background Checks",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Localized, compliant employment and contractor contracts",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Immigration and visa sponsorship support",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        }
      ]
    },
    {
      "group": "Talent and Performance Management",
      "rows": [
        {
          "feature": "Performance reviews and goal-setting (Deel Engage)",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Career development tools",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        }
      ]
    },
    {
      "group": "Platform, API, and Apps",
      "rows": [
        {
          "feature": "Public API and integrations",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Native iOS and Android mobile apps",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Contract templates library",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is cheaper, Deel or Remote?",
      "answer": "For contractors, Remote is cheaper at the entry level, starting at 29 dollars per contractor per month versus Deel's 49 dollars; for Employer of Record, both start at roughly 599 dollars per employee per month, though Deel's full EOR and Global Payroll pricing is often custom-quoted while Remote publishes flat rates."
    },
    {
      "question": "Does Deel or Remote have a free plan?",
      "answer": "Deel has a free plan through Deel HR, its standalone HRIS for centralizing employee records; Remote has no documented free plan, so per-contractor or per-employee fees apply from the first hire."
    },
    {
      "question": "Can Remote do everything Deel can do?",
      "answer": "Remote covers the same core categories as Deel, including EOR, Global Payroll, contractor management, HR, equity, background checks, and an API, but Deel additionally documents immigration support, a performance management module called Deel Engage, and native mobile apps that are not documented for Remote."
    },
    {
      "question": "What is the difference between Deel and Remote for hiring contractors?",
      "answer": "Deel offers Contractor Management where the client directly engages the contractor, while Remote offers both Contractor Management and a Contractor of Record option where Remote itself engages the contractor and adds misclassification protection up to 100,000 dollars per contractor on its Plus tier."
    },
    {
      "question": "Is Deel or Remote better for a small team new to international hiring?",
      "answer": "Deel's free Deel HR tier gives a small team a no-cost way to centralize workforce data before paying for EOR or payroll, while Remote's published flat-rate pricing lets a small team budget an international hire's cost upfront without a sales call."
    },
    {
      "question": "Which is better for avoiding contractor misclassification risk, Deel or Remote?",
      "answer": "Remote is the better documented option here, since its Contractor Management Plus tier explicitly includes misclassification protection up to 100,000 dollars per contractor, a specific guarantee that is not documented in Deel's provided facts."
    }
  ]
};

export default deelVsRemoteContent;
