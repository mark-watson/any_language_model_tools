import AnyLanguageModel
import Foundation

@main
struct ollama_cloud_test {
    static func main() async throws {

        let model = OllamaLanguageModel(
            model: "gpt-oss:20b"
        )

        let session = LanguageModelSession(model: model)
        let prompt = Prompt("Write a haiku about Swift")
        let response = try await session.respond(to: prompt)
        print(response)
        print(response.content)
    }
}
