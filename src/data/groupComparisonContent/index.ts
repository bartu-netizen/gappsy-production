import type { GroupComparisonContent } from './types';
import activitywatchVsKimaiVsSolidtimeContent from './activitywatch-vs-kimai-vs-solidtime';
import aweberVsBrevoVsDripContent from './aweber-vs-brevo-vs-drip';
import bitwardenVsKeeperVsNordpassContent from './bitwarden-vs-keeper-vs-nordpass';
import brazeVsHubspotVsIterableContent from './braze-vs-hubspot-vs-iterable';
import buddypressVsForumbeeVsHigherLogicVanillaContent from './buddypress-vs-forumbee-vs-higher-logic-vanilla';
import buzzsproutVsCastosVsPodbeanContent from './buzzsprout-vs-castos-vs-podbean';
import circleVsDiscipleVsDiscourseContent from './circle-vs-disciple-vs-discourse';
import creatioVsMondaySalesCrmVsNimbleContent from './creatio-vs-monday-sales-crm-vs-nimble';
import desktimeVsJibbleVsOpentimeclockContent from './desktime-vs-jibble-vs-opentimeclock';
import domoticzVsFhemVsIobrokerContent from './domoticz-vs-fhem-vs-iobroker';
import emplifiVsLoomlyVsTailwindContent from './emplifi-vs-loomly-vs-tailwind';
import gatherupVsGradeUsVsNicejobContent from './gatherup-vs-grade-us-vs-nicejob';
import gpt4allVsJanVsLibrechatContent from './gpt4all-vs-jan-vs-librechat';
import krakendVsTraefikHubVsTykContent from './krakend-vs-traefik-hub-vs-tyk';
import reviewtrackersVsSociVsYextContent from './reviewtrackers-vs-soci-vs-yext';

// Registry of per-group-comparison editorial content, keyed by canonical
// slug. A published tool_group_comparisons row with no entry here still
// renders on /compare/:slug using DB-sourced facts only — this is
// purely additive.
const GROUP_COMPARISON_CONTENT: Record<string, GroupComparisonContent> = {
  'activitywatch-vs-kimai-vs-solidtime': activitywatchVsKimaiVsSolidtimeContent,
  'aweber-vs-brevo-vs-drip': aweberVsBrevoVsDripContent,
  'bitwarden-vs-keeper-vs-nordpass': bitwardenVsKeeperVsNordpassContent,
  'braze-vs-hubspot-vs-iterable': brazeVsHubspotVsIterableContent,
  'buddypress-vs-forumbee-vs-higher-logic-vanilla': buddypressVsForumbeeVsHigherLogicVanillaContent,
  'buzzsprout-vs-castos-vs-podbean': buzzsproutVsCastosVsPodbeanContent,
  'circle-vs-disciple-vs-discourse': circleVsDiscipleVsDiscourseContent,
  'creatio-vs-monday-sales-crm-vs-nimble': creatioVsMondaySalesCrmVsNimbleContent,
  'desktime-vs-jibble-vs-opentimeclock': desktimeVsJibbleVsOpentimeclockContent,
  'domoticz-vs-fhem-vs-iobroker': domoticzVsFhemVsIobrokerContent,
  'emplifi-vs-loomly-vs-tailwind': emplifiVsLoomlyVsTailwindContent,
  'gatherup-vs-grade-us-vs-nicejob': gatherupVsGradeUsVsNicejobContent,
  'gpt4all-vs-jan-vs-librechat': gpt4allVsJanVsLibrechatContent,
  'krakend-vs-traefik-hub-vs-tyk': krakendVsTraefikHubVsTykContent,
  'reviewtrackers-vs-soci-vs-yext': reviewtrackersVsSociVsYextContent,
};

export function getGroupComparisonContent(slug: string): GroupComparisonContent | undefined {
  return GROUP_COMPARISON_CONTENT[slug];
}

export type { GroupComparisonContent, GroupComparisonHighlight, GroupComparisonFAQ, GroupComparisonFeatureMatrixGroup, GroupComparisonFeatureMatrixRow, FeatureStatus } from './types';
