import AnyLanguageModel
import Foundation

@main
struct openai_test {
    static func main() async throws {
        guard let apiKey = ProcessInfo.processInfo.environment["OPENAI_API_KEY"], !apiKey.isEmpty else {
            fatalError("Missing OPENAI_API_KEY environment variable.")
        }

        let model = OpenAILanguageModel(
            apiKey: apiKey,
            model: "gpt-4o-mini"
        )

        let session = LanguageModelSession(model: model)
        let prompt = Prompt("Write a haiku about Swift")
        let response = try await session.respond(to: prompt)
        print(response)
        print(response.content)
    }
}
