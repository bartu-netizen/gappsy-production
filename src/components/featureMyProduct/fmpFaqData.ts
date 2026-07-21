// Single source of truth for the FAQ section's copy — also consumed by
// FeatureMyProductPage to build the FAQPage JSON-LD (see toolJsonLd.ts for
// the equivalent pattern used on tool detail pages), so the visible
// accordion and the structured data can never drift apart.
export interface FmpFaqItem {
  question: string;
  answer: string;
}

export const FMP_FAQS: FmpFaqItem[] = [
  {
    question: 'Who is this for?',
    answer: 'Feature My Product is for SaaS founders, indie hackers, and marketing teams who want their software in front of people actively comparing tools — not just browsing. If your product has a real website and clear pricing, it qualifies.',
  },
  {
    question: 'What is Claim & Verify?',
    answer: 'Claim & Verify is a one-time $29 fee to prove you own a listing. It unlocks a verified badge, self-serve editing of your listing, and the ability to reply to reviews — it does not include featured placement.',
  },
  {
    question: 'What is Growth?',
    answer: 'Growth is an optional upgrade on top of a claimed listing — priority placement across category, comparison, alternative, and search surfaces on Gappsy. It\'s billed monthly or yearly; Yearly additionally includes a produced video review posted on our socials, a featured spot in the Gappsy newsletter, and removes competitor ads from your own listing.',
  },
  {
    question: 'Where does my software appear on Growth?',
    answer: 'Your listing appears on your own tool page, relevant category pages, comparison pages against competitors, alternative-page recommendations, internal search, related-software suggestions, and the homepage spotlight rotation.',
  },
  {
    question: 'How much does it cost?',
    answer: 'Claim & Verify is a one-time $29 fee, required first. Growth is optional afterward: $89/month, or $890/year — Yearly includes three extra benefits Monthly doesn\'t.',
  },
  {
    question: 'How quickly does it go live?',
    answer: 'Most listings go live within a couple of business days of submission, once our editorial team completes a quick accuracy review.',
  },
  {
    question: 'Can I cancel?',
    answer: 'Growth can be cancelled anytime — there\'s no contract or cancellation fee, and it stays active until the end of the billing period you\'ve already paid for. Claim & Verify is a one-time payment, so there\'s nothing recurring to cancel.',
  },
  {
    question: 'How does billing work?',
    answer: 'Claim & Verify is charged once, with no recurring charge. Growth is billed in advance — monthly or yearly, your choice — and your card is charged automatically at the start of each period until you cancel.',
  },
  {
    question: 'Do you guarantee traffic?',
    answer: 'No directory can honestly guarantee traffic, and we won\'t pretend otherwise. What a featured listing guarantees is visibility: priority placement in front of people actively comparing software in your category.',
  },
  {
    question: 'How do you select software?',
    answer: 'Every submission goes through a short editorial review — we confirm the product is real, the pricing is accurate, and the listing reflects what the software actually does before it goes live.',
  },
  {
    question: 'How do I improve results?',
    answer: 'Complete your profile with real screenshots, an accurate pricing breakdown, and specific use cases. Listings with more editorial depth consistently get more clicks from category and comparison pages.',
  },
];
