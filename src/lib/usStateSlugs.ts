import { US_STATES } from './usStates';

export const US_STATE_SLUGS_52: string[] = US_STATES.map(s => s.slug);

export const US_STATE_SLUG_TO_NAME: Record<string, string> = Object.fromEntries(
  US_STATES.map(s => [s.slug, s.name])
);
