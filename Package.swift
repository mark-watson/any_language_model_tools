// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "any_language_model_tools",
    platforms: [.macOS(.v14)],
    dependencies: [
        // Declare the dependency on ArgumentParser
      .package(url: "https://github.com/apple/swift-argument-parser", from: "1.3.0"),
      .package(url: "https://github.com/mattt/AnyLanguageModel.git", from: "0.2.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .executableTarget(
            name: "gemini_tool_test",
            dependencies: [
                .product(name: "AnyLanguageModel", package: "AnyLanguageModel")
            ],
            path: "Sources/any_language_model_tools",
            sources: ["gemini_tool_test.swift"]
        ),
        .executableTarget(
            name: "openai_test",
            dependencies: [
                .product(name: "AnyLanguageModel", package: "AnyLanguageModel")
            ],
            path: "Sources/any_language_model_tools",
            sources: ["openai_test.swift"]
        )
    ]
)
