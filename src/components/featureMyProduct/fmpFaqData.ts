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
    question: 'What is a featured listing?',
    answer: 'A featured listing is a verified, editorially reviewed profile of your software with priority placement across Gappsy — in comparisons, categories, search, and more — instead of sitting in the standard review queue.',
  },
  {
    question: 'Where does my software appear?',
    answer: 'Your listing appears on your own tool page, relevant category pages, comparison pages against competitors, alternative-page recommendations, internal search, related-software suggestions, and the homepage spotlight rotation.',
  },
  {
    question: 'How much does it cost?',
    answer: '$37/month during launch pricing (normally $67/month). There are no setup fees and no long-term contract.',
  },
  {
    question: 'How quickly does it go live?',
    answer: 'Most listings go live within a couple of business days of submission, once our editorial team completes a quick accuracy review.',
  },
  {
    question: 'Can I cancel?',
    answer: 'Yes, anytime. There\'s no contract and no cancellation fee. Your listing stays featured until the end of the billing period you\'ve already paid for.',
  },
  {
    question: 'How does billing work?',
    answer: 'You\'re billed monthly in advance, and your card is charged automatically each month until you cancel — there\'s nothing to renew manually.',
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
