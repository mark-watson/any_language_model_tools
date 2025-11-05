import AnyLanguageModel
import Foundation

// Note: AnyLanguageModel does not have support for setting API KEY
//       but is a local 'ollama serve' is running and you have OLLAMA_API_KEY
//       set, then the local ollama service seems to call the cloud API OK.

@main
struct ollama_test {
    static func main() async throws {
//        guard let apiKey = ProcessInfo.processInfo.environment["OLLAMA_API_KEY"], !apiKey.isEmpty else {
//            fatalError("Missing OLLAMA_API_KEY environment variable.")
//        }

        let model = OllamaLanguageModel(
            //apiKey: apiKey,
            model: "gpt-oss:20b-cloud"
        )

        let session = LanguageModelSession(model: model)
        let prompt = Prompt("Write a haiku about Swift")
        let response = try await session.respond(to: prompt)
        print(response)
        print(response.content)
    }
}
