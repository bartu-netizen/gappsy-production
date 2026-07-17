import type { ToolComparisonContent } from './types';

const remotepassVsWorkmotionContent: ToolComparisonContent = {
  "verdict": "RemotePass and WorkMotion both offer EOR and contractor management across 150-160+ countries, but RemotePass is priced noticeably lower on EOR ($349 vs $549 per employee/month) and adds mobile apps and pay-card issuance, while WorkMotion adds real-time employment-law monitoring for direct hiring and country-explorer/cost-calculator tools. Neither is documented as strictly cheaper or more full-featured across every dimension.",
  "bestForToolA": "RemotePass fits teams wanting lower EOR pricing ($349/month per employee including tax), mobile access via iOS/Android apps, instant debit card issuance for globally distributed workers (SpendCards), and a natural-language AI interface (Ask AI) for querying HR/finance data.",
  "bestForToolB": "WorkMotion fits teams that want a direct-hiring option with real-time law monitoring and compliance alerts, published calculators for salary/cost/offboarding decisions, and IEC Gold compliance certification, even though its EOR tier is priced higher ($549/month per employee) than RemotePass's.",
  "whoNeedsBoth": "The facts don't point to a scenario requiring both platforms simultaneously; teams would more likely evaluate both for the same regions and select one as their primary hiring/payroll vendor based on price and feature fit.",
  "keyDifferences": [
    {
      "title": "EOR pricing",
      "toolA": "$349/month per employee, inclusive of tax.",
      "toolB": "$549/month per employee.",
      "whyItMatters": "A $200/month per-employee gap compounds quickly across a distributed team.",
      "benefitsWho": "Budget-conscious HR/finance teams scaling EOR headcount."
    },
    {
      "title": "Mobile access",
      "toolA": "Offers iOS and Android apps.",
      "toolB": "No mobile app is mentioned in the facts.",
      "whyItMatters": "Mobile access matters for employees and managers who need to check payroll, time off, or documents on the go.",
      "benefitsWho": "Distributed teams and employees without regular desktop access."
    },
    {
      "title": "Worker payment cards",
      "toolA": "SpendCards provide instant debit card issuance for team members worldwide.",
      "toolB": "Not documented as offering worker debit cards.",
      "whyItMatters": "Instant card issuance can speed up expense reimbursement and worker access to funds internationally.",
      "benefitsWho": "Operations teams managing expenses/reimbursements for globally distributed contractors and employees."
    },
    {
      "title": "Direct-hiring compliance tooling",
      "toolA": "Local Payroll plan covers payroll and compliance for a customer's own entity employees, without documented real-time law-change monitoring.",
      "toolB": "Direct Hiring plan includes real-time employment-law monitoring and compliance alerts for companies employing talent directly.",
      "whyItMatters": "Real-time regulatory monitoring can reduce compliance risk when a company employs staff directly through its own entity abroad.",
      "benefitsWho": "Companies with existing foreign legal entities managing direct employment compliance themselves."
    },
    {
      "title": "AI assistant purpose",
      "toolA": "Ask AI is a natural-language interface for querying HR/finance data and workforce analytics.",
      "toolB": "Wanda AI is described as an AI-powered support tool for the platform generally.",
      "whyItMatters": "The two AI tools serve different jobs -- one for data querying/analytics, one for general platform support.",
      "benefitsWho": "Data-driven HR/finance teams want Ask AI's analytics angle; general users wanting help navigating the platform benefit from Wanda AI."
    }
  ],
  "featureMatrix": [
    {
      "group": "Employment & Payroll Options",
      "rows": [
        {
          "feature": "Employer of Record (EOR)",
          "toolA": "available",
          "toolB": "available",
          "note": "RemotePass from $349/month; WorkMotion from $549/month."
        },
        {
          "feature": "Contractor management",
          "toolA": "available",
          "toolB": "available",
          "note": "RemotePass: $39/month per contractor. WorkMotion: $31/month per contractor."
        },
        {
          "feature": "Direct hiring / own-entity payroll",
          "toolA": "available",
          "toolB": "available",
          "note": "RemotePass's Local Payroll covers a customer's own entity; WorkMotion's Direct Hiring adds real-time law monitoring."
        },
        {
          "feature": "Visa/immigration sponsorship",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Debit card issuance for workers",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "RemotePass SpendCards."
        }
      ]
    },
    {
      "group": "AI & Platform Features",
      "rows": [
        {
          "feature": "AI-powered support/assistant",
          "toolA": "available",
          "toolB": "available",
          "note": "RemotePass: Ask AI (data queries). WorkMotion: Wanda AI (platform support)."
        },
        {
          "feature": "Mobile apps (iOS/Android)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Salary/cost calculators",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "WorkMotion offers salary, cost, offboarding calculators and a country explorer."
        }
      ]
    },
    {
      "group": "Pricing",
      "rows": [
        {
          "feature": "EOR starting price",
          "toolA": "available",
          "toolB": "available",
          "note": "RemotePass: $349/month/employee incl. tax. WorkMotion: $549/month/employee."
        },
        {
          "feature": "Contractor starting price",
          "toolA": "available",
          "toolB": "available",
          "note": "RemotePass: $39/month. WorkMotion: $31/month."
        },
        {
          "feature": "Enterprise/custom plan",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "RemotePass has a named Enterprise plan (custom, contact sales)."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "How do EOR prices compare between RemotePass and WorkMotion?",
      "answer": "RemotePass's EOR plan starts from $349/month per employee (including tax), while WorkMotion's EOR plan starts from $549/month per employee."
    },
    {
      "question": "Does either platform have a mobile app?",
      "answer": "RemotePass offers iOS and Android apps. A mobile app isn't mentioned for WorkMotion."
    },
    {
      "question": "What is Ask AI?",
      "answer": "Ask AI is RemotePass's natural-language interface for querying HR and finance data and workforce analytics."
    },
    {
      "question": "What is Wanda AI?",
      "answer": "Wanda AI is WorkMotion's AI-powered support tool for its platform."
    },
    {
      "question": "Can either platform issue payment cards to workers?",
      "answer": "RemotePass offers SpendCards for instant debit card issuance to team members worldwide; this isn't documented for WorkMotion."
    },
    {
      "question": "In how many countries can I hire with each platform?",
      "answer": "RemotePass supports hiring and payroll in 150+ countries. WorkMotion enables hiring in 160+ countries through its Employer of Record network."
    }
  ]
};

export default remotepassVsWorkmotionContent;
