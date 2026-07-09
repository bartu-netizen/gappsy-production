export interface StripeProduct {
  priceId: string;
  name: string;
  description: string;
  price: number;
  currency: string;
  mode: 'payment' | 'subscription';
}

export const stripeProducts: StripeProduct[] = [
  {
    priceId: 'price_1SZQ3qIoPJm5BB2XVzBy9qRD',
    name: 'Spotlight Placement (6-Month Listing)',
    description: 'Premium top-of-page placement for your agency for 6 months. Your agency will appear in the spotlight section for maximum visibility and lead potential.',
    price: 997.00,
    currency: 'USD',
    mode: 'subscription'
  },
  {
    priceId: 'price_1SZPzfIoPJm5BB2XKJYYwTlM',
    name: 'Get Matched Upgrade (6-Month Add-On)',
    description: 'Adds your agency to our "Get Matched" system for 6 months, giving you priority inclusion when businesses request help selecting an agency.',
    price: 97.00,
    currency: 'USD',
    mode: 'subscription'
  },
  {
    priceId: 'price_1SZPw3IoPJm5BB2Xh8ji6xPt',
    name: 'Card Visual Upgrade (6-Month Add-On)',
    description: 'Adds a premium highlight badge to your Listing card for increased visibility. 6-month recurring add-on.',
    price: 37.00,
    currency: 'USD',
    mode: 'subscription'
  },
  {
    priceId: 'price_1SZKecIoPJm5BB2Xf1ZNcRmt',
    name: 'Top 25 Premium Placement — Highest Rank (6 months)',
    description: 'Your agency will be featured in one of the highest remaining ranking positions on our Top 25 list. This subscription renews every 6 months unless cancelled.',
    price: 297.00,
    currency: 'USD',
    mode: 'subscription'
  },
  {
    priceId: 'price_1SZKW7IoPJm5BB2Xom28TCYo',
    name: 'Top 25 Priority Listing (6 months)',
    description: 'Your agency will be featured in one of the higher available ranking positions on our Top 25 list. This subscription renews every 6 months unless cancelled.',
    price: 247.00,
    currency: 'USD',
    mode: 'subscription'
  },
  {
    priceId: 'price_1SZGKxIoPJm5BB2X1My3vHBJ',
    name: 'Top 25 Standard Listing (6 months)',
    description: 'Your agency will be featured in one of the available standard ranking positions on our Top 25 list. This subscription renews every 6 months unless cancelled.',
    price: 197.00,
    currency: 'USD',
    mode: 'subscription'
  }
];

export function getProductByPriceId(priceId: string): StripeProduct | undefined {
  return stripeProducts.find(product => product.priceId === priceId);
}