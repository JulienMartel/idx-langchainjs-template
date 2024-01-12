import fs from "fs";

import { HumanMessage } from "@langchain/core/messages";
import { ChatGoogleGenerativeAI } from "@langchain/google-genai";
import { HarmBlockThreshold, HarmCategory } from "@google/generative-ai";

import * as dotenv from "dotenv";
dotenv.config();

/*
 * Before running this, you should make sure you have created a
 * Google Cloud Project that has `generativelanguage` API enabled.
 *
 * You will also need to generate an API key and set
 * an environment variable GOOGLE_API_KEY
 *
 */

const safetySettings = [
  {
    category: HarmCategory.HARM_CATEGORY_HARASSMENT,
    threshold: HarmBlockThreshold.BLOCK_MEDIUM_AND_ABOVE,
  },
  {
    category: HarmCategory.HARM_CATEGORY_HATE_SPEECH,
    threshold: HarmBlockThreshold.BLOCK_MEDIUM_AND_ABOVE,
  },
  {
    category: HarmCategory.HARM_CATEGORY_SEXUALLY_EXPLICIT,
    threshold: HarmBlockThreshold.BLOCK_MEDIUM_AND_ABOVE,
  },
  {
    category: HarmCategory.HARM_CATEGORY_DANGEROUS_CONTENT,
    threshold: HarmBlockThreshold.BLOCK_MEDIUM_AND_ABOVE,
  },
];

// Text - gemini-pro model
await generalPrompt(
  "What would be a good company name for a company that makes colorful socks?"
);

//  Multi-modal - gemini-pro-vision model
await describeImage(fs.readFileSync("./hotdog.jpg").toString("base64"));

async function generalPrompt(prompt) {
  const model = new ChatGoogleGenerativeAI({
    modelName: "gemini-pro",
    maxOutputTokens: 2048,
    safetySettings,
    temperature: 0.9,
    topK: 0,
    topP: 0.9,
  });

  // Batch and stream are also supported
  const res = await model.invoke([["human", prompt]]);
  console.log(res);
}

async function describeImage(imageUrl) {
  const vision = new ChatGoogleGenerativeAI({
    modelName: "gemini-pro-vision",
    maxOutputTokens: 2048,
    safetySettings,
  });

  const input2 = [
    new HumanMessage({
      content: [
        {
          type: "text",
          text: "Describe the following image.",
        },
        {
          type: "image_url",
          image_url: `data:image/png;base64,${imageUrl}`,
        },
      ],
    }),
  ];

  const res = await vision.invoke(input2);
  console.log(res);

  // Multi-modal streaming
  const streamRes = await vision.stream(input2);
  for await (const chunk of streamRes) {
    console.log(chunk);
  }
}
