import * as functions from "firebase-functions";
import * as Line from "@line/bot-sdk";
import axios from "axios";

const channelId = process.env.CHANNEL_ID || "";
const channelAccessToken = process.env.CHANNEL_ACCESS_TOKEN || "";
const channelSecret = process.env.CHANNEL_SECRET || "";

type RequestBody = {
  id_token: string;
};
export const pushMessage = functions
  .region("asia-northeast1")
  .https.onCall(async (data) => {
    const body = JSON.parse(JSON.stringify(data)) as RequestBody;
    console.log(body);
    const params = new URLSearchParams({
      id_token: body.id_token,
      client_id: channelId,
    });
    console.log(params);
    const jwtDecoded = await axios
      .post("https://api.line.me/oauth2/v2.1/verify/", params.toString(), {
        headers: { "Content-Type": "application/x-www-form-urlencoded" },
      })
      .then((res) => {
        return res.data;
      });

    const client = new Line.Client({
      channelAccessToken: channelAccessToken,
      channelSecret: channelSecret,
    });
    await client.pushMessage(jwtDecoded.sub, {
      type: "text",
      text: "友達登録ありがとう！",
    });
  });
