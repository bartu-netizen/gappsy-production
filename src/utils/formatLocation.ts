import { findState } from '../lib/usStates';

export function formatStateName(slug?: string | null): string {
  if (!slug) return '';
  const state = findState(slug);
  if (state) return state.name;
  return slug
    .split('-')
    .map(word => word.charAt(0).toUpperCase() + word.slice(1))
    .join(' ');
}

export function getStateAbbreviation(slug?: string | null): string {
  if (!slug) return '';
  const state = findState(slug);
  return state?.abbr ?? '';
}
