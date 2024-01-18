# LangChain JS + Gemini Application

This project is a LangChain JS and Gemini application developed in JavaScript. It leverages the power of Google's Generative AI to provide functionalities such as generating text responses and describing images. This application requires a Google Cloud Project with the `generativelanguage` API enabled and an API key for authentication.

### Prerequisites
- A Google Cloud Project with the `generativelanguage` API enabled.
- An API key from your Google Cloud Project. Set this in the `.env` file.

### Running the Application
You can start the application using:

```bash
npm run start
```

### Usage
This application can perform tasks such as generating text prompts and describing images using the Gemini models.

- To generate text prompts, edit the `generalPrompt` function in `index.js` with your desired prompt.
- To describe images, place your image file in the project directory and update the `describeImage` function in `index.js` to read the image file.
