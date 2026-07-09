import { Handler } from "@netlify/functions";

const handler: Handler = async () => {
  return {
    statusCode: 200,
    headers: {
      "Content-Type": "application/json",
      "Cache-Control": "no-store",
    },
    body: JSON.stringify({
      ok: true,
      time: new Date().toISOString(),
      service: "quick-send-proxy",
    }),
  };
};

export { handler };
