import type { ToolComparisonContent } from './types';
import adobeExpressVsCanvaContent from './adobe-express-vs-canva';
import aircallVsOpenphoneContent from './aircall-vs-openphone';
import amazonRedshiftVsSnowflakeContent from './amazon-redshift-vs-snowflake';
import amazonS3VsGoogleCloudStorageContent from './amazon-s3-vs-google-cloud-storage';
import backblazeVsCarboniteContent from './backblaze-vs-carbonite';
import backblazeVsIdriveContent from './backblaze-vs-idrive';
import bigqueryVsSnowflakeContent from './bigquery-vs-snowflake';
import boltNewVsV0Content from './bolt-new-vs-v0';
import canvaVsFigmaContent from './canva-vs-figma';
import canvaVsMicrosoftDesignerContent from './canva-vs-microsoft-designer';
import canvaVsPhotoshopContent from './canva-vs-photoshop';
import canvaVsVistacreateContent from './canva-vs-vistacreate';
import chatgptVsClaudeContent from './chatgpt-vs-claude';
import chatgptVsGoogleGeminiContent from './chatgpt-vs-google-gemini';
import chatgptVsPerplexityContent from './chatgpt-vs-perplexity';
import claudeVsGoogleGeminiContent from './claude-vs-google-gemini';
import clearscopeVsSurferSeoContent from './clearscope-vs-surfer-seo';
import clickfunnelsVsUnbounceContent from './clickfunnels-vs-unbounce';
import copyAiVsJasperContent from './copy-ai-vs-jasper';
import copyAiVsWritesonicContent from './copy-ai-vs-writesonic';
import crispVsTidioContent from './crisp-vs-tidio';
import cursorVsGithubCopilotContent from './cursor-vs-github-copilot';
import cursorVsWindsurfContent from './cursor-vs-windsurf';
import dallEVsMidjourneyContent from './dall-e-vs-midjourney';
import dallEVsStableDiffusionContent from './dall-e-vs-stable-diffusion';
import descriptVsVeedContent from './descript-vs-veed';
import gainsightVsTotangoContent from './gainsight-vs-totango';
import githubCopilotVsWindsurfContent from './github-copilot-vs-windsurf';
import googleAnalyticsVsPlausibleContent from './google-analytics-vs-plausible';
import googleAnalyticsVsPosthogContent from './google-analytics-vs-posthog';
import heygenVsSynthesiaContent from './heygen-vs-synthesia';
import hotjarVsMicrosoftClarityContent from './hotjar-vs-microsoft-clarity';
import hubspotCrmVsPipedriveContent from './hubspot-crm-vs-pipedrive';
import hubspotCrmVsSalesforceContent from './hubspot-crm-vs-salesforce';
import instapageVsUnbounceContent from './instapage-vs-unbounce';
import klingAiVsRunwayContent from './kling-ai-vs-runway';
import livechatVsTidioContent from './livechat-vs-tidio';
import lookerVsTableauContent from './looker-vs-tableau';
import lovableVsReplitContent from './lovable-vs-replit';
import microsoftPowerBiVsQlikSenseContent from './microsoft-power-bi-vs-qlik-sense';
import microsoftPowerBiVsTableauContent from './microsoft-power-bi-vs-tableau';
import midjourneyVsStableDiffusionContent from './midjourney-vs-stable-diffusion';
import mysqlVsPostgresqlContent from './mysql-vs-postgresql';
import pikaVsRunwayContent from './pika-vs-runway';
import pipedriveVsZohoCrmContent from './pipedrive-vs-zoho-crm';
import plausibleVsUmamiContent from './plausible-vs-umami';
import quillbotVsWordtuneContent from './quillbot-vs-wordtune';
import ringcentralVsVonageContent from './ringcentral-vs-vonage';
import ringcentralVsZoomPhoneContent from './ringcentral-vs-zoom-phone';
import salesforceServiceCloudVsServicenowContent from './salesforce-service-cloud-vs-servicenow';
import salesforceVsZohoCrmContent from './salesforce-vs-zoho-crm';
import squarespaceVsWordpressComContent from './squarespace-vs-wordpress-com';
import surveymonkeyVsTypeformContent from './surveymonkey-vs-typeform';

// Registry of per-comparison editorial content, keyed by canonical slug.
// A published tool_comparisons row with no entry here still renders on
// /compare/:slug using DB-sourced facts only — this is purely additive.
const COMPARISON_CONTENT: Record<string, ToolComparisonContent> = {
  'adobe-express-vs-canva': adobeExpressVsCanvaContent,
  'aircall-vs-openphone': aircallVsOpenphoneContent,
  'amazon-redshift-vs-snowflake': amazonRedshiftVsSnowflakeContent,
  'amazon-s3-vs-google-cloud-storage': amazonS3VsGoogleCloudStorageContent,
  'backblaze-vs-carbonite': backblazeVsCarboniteContent,
  'backblaze-vs-idrive': backblazeVsIdriveContent,
  'bigquery-vs-snowflake': bigqueryVsSnowflakeContent,
  'bolt-new-vs-v0': boltNewVsV0Content,
  'canva-vs-figma': canvaVsFigmaContent,
  'canva-vs-microsoft-designer': canvaVsMicrosoftDesignerContent,
  'canva-vs-photoshop': canvaVsPhotoshopContent,
  'canva-vs-vistacreate': canvaVsVistacreateContent,
  'chatgpt-vs-claude': chatgptVsClaudeContent,
  'chatgpt-vs-google-gemini': chatgptVsGoogleGeminiContent,
  'chatgpt-vs-perplexity': chatgptVsPerplexityContent,
  'claude-vs-google-gemini': claudeVsGoogleGeminiContent,
  'clearscope-vs-surfer-seo': clearscopeVsSurferSeoContent,
  'clickfunnels-vs-unbounce': clickfunnelsVsUnbounceContent,
  'copy-ai-vs-jasper': copyAiVsJasperContent,
  'copy-ai-vs-writesonic': copyAiVsWritesonicContent,
  'crisp-vs-tidio': crispVsTidioContent,
  'cursor-vs-github-copilot': cursorVsGithubCopilotContent,
  'cursor-vs-windsurf': cursorVsWindsurfContent,
  'dall-e-vs-midjourney': dallEVsMidjourneyContent,
  'dall-e-vs-stable-diffusion': dallEVsStableDiffusionContent,
  'descript-vs-veed': descriptVsVeedContent,
  'gainsight-vs-totango': gainsightVsTotangoContent,
  'github-copilot-vs-windsurf': githubCopilotVsWindsurfContent,
  'google-analytics-vs-plausible': googleAnalyticsVsPlausibleContent,
  'google-analytics-vs-posthog': googleAnalyticsVsPosthogContent,
  'heygen-vs-synthesia': heygenVsSynthesiaContent,
  'hotjar-vs-microsoft-clarity': hotjarVsMicrosoftClarityContent,
  'hubspot-crm-vs-pipedrive': hubspotCrmVsPipedriveContent,
  'hubspot-crm-vs-salesforce': hubspotCrmVsSalesforceContent,
  'instapage-vs-unbounce': instapageVsUnbounceContent,
  'kling-ai-vs-runway': klingAiVsRunwayContent,
  'livechat-vs-tidio': livechatVsTidioContent,
  'looker-vs-tableau': lookerVsTableauContent,
  'lovable-vs-replit': lovableVsReplitContent,
  'microsoft-power-bi-vs-qlik-sense': microsoftPowerBiVsQlikSenseContent,
  'microsoft-power-bi-vs-tableau': microsoftPowerBiVsTableauContent,
  'midjourney-vs-stable-diffusion': midjourneyVsStableDiffusionContent,
  'mysql-vs-postgresql': mysqlVsPostgresqlContent,
  'pika-vs-runway': pikaVsRunwayContent,
  'pipedrive-vs-zoho-crm': pipedriveVsZohoCrmContent,
  'plausible-vs-umami': plausibleVsUmamiContent,
  'quillbot-vs-wordtune': quillbotVsWordtuneContent,
  'ringcentral-vs-vonage': ringcentralVsVonageContent,
  'ringcentral-vs-zoom-phone': ringcentralVsZoomPhoneContent,
  'salesforce-service-cloud-vs-servicenow': salesforceServiceCloudVsServicenowContent,
  'salesforce-vs-zoho-crm': salesforceVsZohoCrmContent,
  'squarespace-vs-wordpress-com': squarespaceVsWordpressComContent,
  'surveymonkey-vs-typeform': surveymonkeyVsTypeformContent,
};

export function getComparisonContent(slug: string): ToolComparisonContent | undefined {
  return COMPARISON_CONTENT[slug];
}

export type { ToolComparisonContent, ComparisonDifference, ComparisonFAQ } from './types';
