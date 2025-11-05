# Any Language Model Tools Examples from my book "Artificial Intelligence Using Swift"

You can read my book for free online at: https://leanpub.com/SwiftAI/read


This package shows how to call Google's Gemini models from Swift while providing tools the model can call to accomplish tasks. It uses the [AnyLanguageModel](https://github.com/mattt/AnyLanguageModel) library and defines a simple weather tool to demonstrate tool-enabled prompting.

## Prerequisites
- macOS 14 or newer with Swift 6.2 or later (see `Package.swift`)
- A Google Gemini API key stored in the `GEMINI_API_KEY` environment variable
- Access to the internet for Gemini API requests

## Getting Started
1. Install dependencies (Swift Package Manager resolves them automatically):
   ```bash
   swift package resolve
   ```
2. Export your Gemini key in the current shell session:
   ```bash
   export GEMINI_API_KEY="your-key-here"
   ```
3. Run the example executable:
   ```bash
   swift run gemini_test
   ```

The executable builds a `GeminiLanguageModel`, registers a single `WeatherTool`, and sends the prompt “What's the weather like in Tokyo?”. The response printed to stdout shows how the model can call the tool and combine the tool's output with its own reasoning.

## How It Works
- `Sources/any_language_model_tools/gemini_test.swift` defines the `@main` executable entry point.
- `GeminiLanguageModel` comes from AnyLanguageModel; it handles the HTTP calls to the Gemini API.
- `WeatherTool` conforms to `Tool` and is annotated with `@Generable` and `@Guide` so the model understands what arguments it can pass when invoking the tool.

You can extend the example by adding more tools to the `tools:` array or by changing the initial `Prompt`. Replace the fake weather response in `WeatherTool.call` with a real API call to provide live data.
