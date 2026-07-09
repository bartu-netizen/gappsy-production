/**
 * Fire-and-forget tracking. Tracking must never slow down the funnel.
 *
 * - The side-effect is invoked synchronously so `keepalive: true` fetches /
 *   sendBeacon calls are queued before we navigate or launch Stripe.
 * - Errors from tracking are swallowed — they never block navigation.
 * - Returns immediately; callers may `await` it but it resolves synchronously.
 */
export function trackBeforeNav(fire: () => void): Promise<void> {
  try {
    fire();
  } catch {
    // tracking errors must never block navigation
  }
  return Promise.resolve();
}
