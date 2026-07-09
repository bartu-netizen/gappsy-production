export interface CheckoutUpsellConfig {
  title: string;
  description: string;
  price: number;
  highlightColor: 'orange' | 'blue';
  recommended?: boolean;
  icon?: 'badge' | null;
}

export const CHECKOUT_UPSELLS = {
  visualUpgrade: {
    title: "⚡ Get more clicks on your listing — $37",
    description:
      "Add a highlighted badge to your listing to stand out from other agencies in {state_name}. Listings with this badge can get up to 60% more clicks from potential clients.",
    price: 37,
    highlightColor: 'orange',
    icon: 'badge',
  } as CheckoutUpsellConfig,

  leadMatching: {
    title: "🔥 Get client requests from across our platform — $97",
    description:
      "Some clients never see your listing. They submit requests elsewhere on our platform. Enable this to start receiving those client requests.",
    price: 97,
    highlightColor: 'blue',
    recommended: true,
  } as CheckoutUpsellConfig,
};

export function replaceStateName(text: string, stateName: string): string {
  return text.replace(/{state_name}/g, stateName);
}
