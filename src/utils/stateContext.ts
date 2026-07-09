import { formatStateName } from './formatLocation';

export interface StateContext {
  stateSlug: string;
  stateName: string;
}

function safeDecodeStateParam(value: string): string {
  if (!value) return '';
  try {
    return decodeURIComponent(decodeURIComponent(value));
  } catch {
    try {
      return decodeURIComponent(value);
    } catch {
      return value;
    }
  }
}

export function getStateContextFromSearchParams(searchParams: URLSearchParams): StateContext {
  const stateSlug = searchParams.get('state') || searchParams.get('stateSlug') || '';

  const rawStateName = safeDecodeStateParam(searchParams.get('stateName') || '');

  let stateName: string;
  if (rawStateName) {
    stateName = formatStateName(rawStateName.replace(/\s+/g, '-').toLowerCase());
  } else if (stateSlug) {
    stateName = formatStateName(stateSlug);
  } else {
    stateName = '';
  }

  return {
    stateSlug,
    stateName
  };
}

export function slugToStateName(slug: string): string {
  return formatStateName(slug);
}
