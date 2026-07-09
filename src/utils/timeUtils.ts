export function getRelativeUpdatedLabel(lastUpdated: Date): string {
  const now = new Date();
  const diffMs = now.getTime() - lastUpdated.getTime();
  const diffHours = Math.floor(diffMs / (1000 * 60 * 60));
  const diffDays = Math.floor(diffMs / (1000 * 60 * 60 * 24));

  if (diffHours < 1) {
    return "Last updated just now";
  } else if (diffHours < 24) {
    return `Last updated ${diffHours} hour${diffHours === 1 ? '' : 's'} ago`;
  } else if (diffHours < 48) {
    return "Last updated yesterday";
  } else {
    return `Last updated ${diffDays} days ago`;
  }
}

export function formatExactDate(date: Date): string {
  const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
  const month = months[date.getMonth()];
  const day = date.getDate();
  const year = date.getFullYear();
  return `${month} ${day}, ${year}`;
}

export function getUpdatedLabelWithOffsetDays(daysOffset: number): string {
  const now = new Date();
  // normalize to midnight to avoid timezone flicker
  now.setHours(0, 0, 0, 0);
  const target = new Date(now);
  target.setDate(now.getDate() - daysOffset);

  // Reuse existing formatting logic for "Dec 7" format
  const monthNames = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
  const month = monthNames[target.getMonth()];
  const day = target.getDate();

  return `Updated ${month} ${day}`;
}
