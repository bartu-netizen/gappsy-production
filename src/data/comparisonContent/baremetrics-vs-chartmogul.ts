import type { ToolComparisonContent } from './types';

const baremetricsVsChartmogulContent: ToolComparisonContent = {
  "verdict": "Baremetrics and ChartMogul both track subscription metrics like MRR, churn, and forecasting, but they differ in structure: ChartMogul offers a genuine free plan up to $10K MRR plus a built-in lightweight CRM, while Baremetrics has no permanent free plan but adds dedicated Payment Recovery and Cancellation Insights add-ons aimed directly at reducing churn. Baremetrics starts slightly higher ($75/month vs. $59/month) but bundles more churn-focused tooling; ChartMogul's Enterprise tier scales further (from $19,900/year) for consolidating many billing sources. The better fit depends on whether active churn-reduction tooling or free-tier accessibility and built-in CRM matters more.",
  "bestForToolA": "SaaS teams that want built-in tools to actively act on churn — Payment Recovery for failed-charge recovery and Cancellation Insights for automated retention campaigns — and are past the point of needing a free plan.",
  "bestForToolB": "Early-stage or smaller SaaS companies under $10K MRR that want to start on a real free plan, plus teams that want a built-in lightweight CRM with two-way sync rather than integrating a separate CRM tool.",
  "whoNeedsBoth": "Finance/RevOps teams at larger SaaS companies with billing spread across many systems that ChartMogul consolidates (including App Store Connect and multiple billing sources) may also run Baremetrics for its documented Payment Recovery and Cancellation Insights automation, since ChartMogul's facts don't document an equivalent dunning/retention-campaign feature.",
  "keyDifferences": [
    {
      "title": "Free plan availability",
      "toolA": "No permanent free plan; only a free trial is offered before paid billing starts at $75/month.",
      "toolB": "A permanent free plan is available for businesses up to $10K MRR / $120K ARR, including 28+... core analytics features, one billing connection, 5 team dashboards, and basic CRM (1 seat).",
      "whyItMatters": "Very small or pre-revenue SaaS companies can use ChartMogul indefinitely at no cost, while Baremetrics requires converting to a paid plan after the trial.",
      "benefitsWho": "Early-stage founders and bootstrapped SaaS companies watching costs closely."
    },
    {
      "title": "Built-in CRM",
      "toolA": "No CRM feature is documented for Baremetrics.",
      "toolB": "ChartMogul includes a lightweight CRM with two-way sync on higher plans (and one-way HubSpot sync on Starter).",
      "whyItMatters": "Teams wanting to manage customer records alongside revenue metrics have a documented built-in option only with ChartMogul.",
      "benefitsWho": "Smaller revenue/sales teams that don't want to run a separate CRM."
    },
    {
      "title": "Failed-payment and cancellation automation",
      "toolA": "Payment Recovery manages failed charges to reduce delinquent churn (paid add-on, $129/month), and Cancellation Insights identifies why customers cancel and automates retention campaigns (also a $129/month add-on).",
      "toolB": "No equivalent payment-recovery or cancellation-automation feature is documented.",
      "whyItMatters": "Baremetrics is the only one of the two that documents active tooling to recover failed payments and automate win-back campaigns, though it costs extra.",
      "benefitsWho": "SaaS billing/finance teams focused on reducing involuntary and voluntary churn."
    },
    {
      "title": "Multi-billing-system consolidation as core positioning",
      "toolA": "Baremetrics integrates directly with Stripe, Braintree, Recurly, Chargebee, Paddle, and app stores, but the entry Launch plan is limited to a single integration.",
      "toolB": "ChartMogul's core feature is consolidating multiple billing systems (Stripe, Chargebee, App Store Connect, among others) into one dashboard, with the free plan supporting one connection and higher plans adding more billing sources.",
      "whyItMatters": "Both connect to similar billing systems, but ChartMogul markets consolidation across systems as its central use case, while Baremetrics documents a per-plan cap on integrations even on paid tiers.",
      "benefitsWho": "Companies running billing across more than one payment processor or platform (e.g., web + app stores)."
    },
    {
      "title": "Enterprise pricing ceiling",
      "toolA": "The published Scale plan tops out at $1,152/month for $3.6M+ ARR.",
      "toolB": "The Enterprise tier starts at $19,900/year for companies over $10M ARR with unlimited ARR, 15 billing sources, and 8 push destinations.",
      "whyItMatters": "ChartMogul documents a higher, named Enterprise tier explicitly built for companies beyond $10M ARR, while Baremetrics' published pricing caps out at a lower ARR band ($3.6M+) without a named unlimited-ARR tier.",
      "benefitsWho": "Larger, high-ARR SaaS companies choosing a documented enterprise-scale plan."
    }
  ],
  "featureMatrix": [
    {
      "group": "Analytics Core",
      "rows": [
        {
          "feature": "MRR/ARR/churn tracking",
          "toolA": "available",
          "toolB": "available",
          "note": "Baremetrics: Control Center, Smart Dashboards. ChartMogul: Revenue analytics."
        },
        {
          "feature": "Cohort analysis",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Financial forecasting",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Benchmarking against peer companies",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "ChartMogul publishes separate SaaS benchmark research, not an in-account feature."
        }
      ]
    },
    {
      "group": "Revenue Operations",
      "rows": [
        {
          "feature": "Failed-payment/dunning recovery",
          "toolA": "limited",
          "toolB": "not-documented",
          "note": "Baremetrics: paid add-on, $129/month."
        },
        {
          "feature": "Built-in CRM",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "ChartMogul: two-way sync on higher plans."
        },
        {
          "feature": "Multi-currency revenue tracking",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Workflow automation from subscription events",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Permanent free plan",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "ChartMogul: up to $10K MRR."
        },
        {
          "feature": "Entry paid plan price",
          "toolA": "available",
          "toolB": "available",
          "note": "Baremetrics Launch: $75/month. ChartMogul Starter: $59-$699/month."
        },
        {
          "feature": "Named billing system integrations",
          "toolA": "available",
          "toolB": "available",
          "note": "Baremetrics: Stripe, Braintree, Recurly, Chargebee, Paddle, app stores. ChartMogul: Stripe, Chargebee, App Store Connect, among others."
        },
        {
          "feature": "Enterprise-tier pricing",
          "toolA": "available",
          "toolB": "available",
          "note": "Baremetrics Scale: $1,152/month. ChartMogul Enterprise: from $19,900/year."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Baremetrics have a free plan?",
      "answer": "No, but a free trial is available before subscribing to a paid plan."
    },
    {
      "question": "Does ChartMogul have a free plan?",
      "answer": "Yes, it's free for companies up to $10K MRR / $120K ARR with core analytics features."
    },
    {
      "question": "What does the Baremetrics Launch plan include?",
      "answer": "It costs $75/month for businesses up to $360K ARR and includes 28+ subscription metrics, trial insights, and one billing integration."
    },
    {
      "question": "What billing systems does ChartMogul connect to?",
      "answer": "Stripe, Chargebee, and App Store Connect, among others, depending on plan."
    },
    {
      "question": "Are Payment Recovery and Cancellation Insights included in Baremetrics' base plan?",
      "answer": "No, they are paid add-ons at $129/month each."
    },
    {
      "question": "Is there a ChartMogul Enterprise plan?",
      "answer": "Yes, priced from $19,900/year for companies over $10M ARR, billed annually."
    }
  ]
};

export default baremetricsVsChartmogulContent;
