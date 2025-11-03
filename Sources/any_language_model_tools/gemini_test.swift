import AnyLanguageModel
import Foundation

@main
struct gemini_test {
    static func main() async throws {
        guard let apiKey = ProcessInfo.processInfo.environment["GEMINI_API_KEY"], !apiKey.isEmpty else {
            fatalError("Missing GEMINI_API_KEY environment variable.")
        }

        let model = GeminiLanguageModel(
          apiKey: apiKey,
          model: "gemini-2.5-flash"
        )

        let session = LanguageModelSession(model: model, tools: [WeatherTool()])
        let prompt = Prompt("What's the weather like in Tokyo?")
        let response = try await session.respond(to: prompt)
        print(response)
    }
}

struct WeatherTool: Tool {
    let name = "getWeather"
    let description = "Retrieve the latest weather information for a city."

    @Generable
    struct Arguments {
        @Guide(description: "The city to fetch the weather for.")
        var city: String
    }

    func call(arguments: Arguments) async throws -> String {
        "The weather in \(arguments.city) is sunny and 72°F / 23°C"
    }
}
