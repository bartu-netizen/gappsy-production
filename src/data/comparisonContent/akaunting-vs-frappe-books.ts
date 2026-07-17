import type { ToolComparisonContent } from './types';

const akauntingVsFrappeBooksContent: ToolComparisonContent = {
  "verdict": "Akaunting is a cloud-first (with a free self-hosted On-Premise option) accounting platform built to scale from one freelancer to a multi-company, multi-user cloud business via paid tiers up to $145/month. Frappe Books is a completely free, open-source desktop app that stores everything locally in a SQLite file with no cloud version at all. The choice mostly comes down to whether you need cloud/multi-user access and add-on business apps versus a permanently free, offline, single-user tool.",
  "bestForToolA": "Akaunting fits a small business that wants a hosted, multi-user cloud option (Standard Cloud from $8/month) with room to add payroll, CRM, inventory, and POS apps as it grows, or that wants to self-host the free On-Premise Standard plan on its own server.",
  "bestForToolB": "Frappe Books fits a freelancer or very small business that wants zero subscription cost, full offline/local control of their financial data, and doesn't need multi-user cloud access or add-on apps like payroll or CRM.",
  "whoNeedsBoth": "There isn't a realistic scenario for using both together; they serve the same core job (bookkeeping and invoicing) for a single business, so a team would pick one, not run both in parallel.",
  "keyDifferences": [
    {
      "title": "Deployment Model",
      "toolA": "Akaunting offers both a free self-hosted On-Premise Standard plan and paid Cloud plans ($8-$145/month) hosted by Akaunting.",
      "toolB": "Frappe Books is a desktop-only Electron app for Windows, macOS, and Linux with no official hosted cloud version.",
      "whyItMatters": "Teams that want to avoid managing servers or need remote/multi-device access need a hosted option, which only Akaunting provides.",
      "benefitsWho": "Businesses without in-house IT that want a managed cloud option benefit from Akaunting; privacy-focused solo users benefit from Frappe Books' local-only model."
    },
    {
      "title": "Multi-User and Multi-Company Scaling",
      "toolA": "Akaunting's cloud tiers scale from 1 company/1 user (Standard, $8/month) to unlimited companies and users (Ultimate Cloud, $145/month).",
      "toolB": "Frappe Books' features describe a single local SQLite file with no documented multi-user or multi-company cloud sync.",
      "whyItMatters": "Growing teams that add bookkeepers, accountants, or multiple entities need multi-user support that Frappe Books doesn't document.",
      "benefitsWho": "Multi-person accounting teams and businesses running several companies benefit from Akaunting's tiered scaling."
    },
    {
      "title": "Pricing Structure",
      "toolA": "Akaunting's cloud plans run $8/month (Standard) to $145/month (Ultimate), billed annually, on top of a free On-Premise option.",
      "toolB": "Frappe Books has a single Free plan at $0 with no paid tier at all.",
      "whyItMatters": "Budget-constrained freelancers avoid any subscription cost with Frappe Books, while businesses needing hosting pay a predictable monthly fee with Akaunting.",
      "benefitsWho": "Cost-sensitive solo freelancers benefit most from Frappe Books' zero-cost model."
    },
    {
      "title": "Add-On Business Apps (Payroll, CRM, POS)",
      "toolA": "Akaunting's Elite Cloud tier ($56/month) adds payroll, projects, inventory, and CRM apps, and Ultimate Cloud ($145/month) adds POS and budgeting.",
      "toolB": "Frappe Books includes a built-in Point of Sale feature for free but has no documented payroll or CRM functionality at any price.",
      "whyItMatters": "Businesses that need payroll or CRM alongside bookkeeping have to look beyond Frappe Books, while Akaunting bundles these as paid add-on apps.",
      "benefitsWho": "Small businesses wanting an all-in-one back office (accounting plus payroll/CRM) benefit from Akaunting's higher-tier apps."
    },
    {
      "title": "Client Portal and Online Payments",
      "toolA": "Akaunting's feature set includes a client portal that lets clients view transactions and pay online, available from the Premium Cloud tier ($24/month).",
      "toolB": "Frappe Books' documented features focus on local invoicing and reporting, with no client portal or online payment collection described.",
      "whyItMatters": "Businesses that invoice external clients and want them to pay online need a portal, which is only documented for Akaunting.",
      "benefitsWho": "Service businesses that bill outside clients and want self-service online payment benefit from Akaunting's client portal."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Accounting",
      "rows": [
        {
          "feature": "Double-entry accounting",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Recurring invoicing",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Standard financial reports (P&L, Balance Sheet)",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Point of Sale",
          "toolA": "available",
          "toolB": "available",
          "note": "Akaunting POS is gated to Ultimate Cloud ($145/mo); Frappe Books includes POS free"
        }
      ]
    },
    {
      "group": "Deployment & Access",
      "rows": [
        {
          "feature": "Free self-hosting",
          "toolA": "available",
          "toolB": "available",
          "note": "Akaunting via On-Premise; Frappe Books is inherently local"
        },
        {
          "feature": "Hosted cloud/SaaS version",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Offline/local-only operation",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Cross-platform desktop app (Windows/macOS/Linux)",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Business & Collaboration Tools",
      "rows": [
        {
          "feature": "Client portal with online payments",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Multi-user / multi-company support",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Payroll and CRM apps",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Akaunting Elite Cloud, $56/month"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Frappe Books really free with no hidden costs?",
      "answer": "Yes, Frappe Books has a single Free plan at $0 with no paid tier documented; it is fully open source."
    },
    {
      "question": "Can Akaunting be self-hosted for free like Frappe Books?",
      "answer": "Yes, Akaunting's On-Premise Standard plan is free to self-host with source code available, separate from its paid Cloud plans."
    },
    {
      "question": "Does Frappe Books support multiple users or cloud access?",
      "answer": "The documented features describe a local, offline desktop app storing data in a single SQLite file, with no official multi-user cloud version."
    },
    {
      "question": "Which is cheaper for a solo freelancer just starting out?",
      "answer": "Frappe Books costs nothing at all, while Akaunting's cheapest cloud plan is $8/month (or free if self-hosted On-Premise)."
    },
    {
      "question": "Does either tool include a client portal for online payments?",
      "answer": "Akaunting documents a client portal for viewing transactions and accepting payments online starting on its Premium Cloud tier; Frappe Books does not document this feature."
    },
    {
      "question": "Which one includes Point of Sale?",
      "answer": "Frappe Books includes POS for free as a core feature. Akaunting includes POS only on its Ultimate Cloud plan at $145/month."
    }
  ]
};

export default akauntingVsFrappeBooksContent;
