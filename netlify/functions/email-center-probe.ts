import { Handler, HandlerEvent, HandlerContext } from "@netlify/functions";

const handler: Handler = async (event: HandlerEvent, context: HandlerContext) => {
  const hasAdminSecretHeader = !!event.headers["x-admin-secret"];

  const response = {
    ok: true,
    source: "netlify-function",
    path: "/wp-admin/api/email-center-probe",
    method: event.httpMethod,
    hasAdminSecretHeader,
  };

  return {
    statusCode: 200,
    headers: {
      "Content-Type": "application/json",
      "Access-Control-Allow-Origin": "https://gappsy.com",
      "Access-Control-Allow-Methods": "GET, POST, OPTIONS",
      "Access-Control-Allow-Headers": "content-type, x-admin-secret",
    },
    body: JSON.stringify(response),
  };
};

export { handler };
