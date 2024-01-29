// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "InkSwiftCommandLineExample",
    platforms: [
        .macOS(.v10_15)
    ],
    dependencies: [
        .package(url: "https://github.com/maartene/InkSwift.git", from: "2.0.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .executableTarget(
            name: "InkSwiftCommandLineExample",
            dependencies: ["InkSwift"],
            path: "Sources",
            resources: [
                .process("test.ink"),
                .process("test.ink.json")
            ]
        )
    ]
)
