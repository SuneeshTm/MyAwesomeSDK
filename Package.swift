// swift-tools-version: 5.7
import PackageDescription

let package = Package(
    name: "MyAwesomeSDK",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "MyAwesomeSDK",
            targets: ["MyAwesomeSDK"]
        ),
    ],
    dependencies: [
        // Add external dependencies here if needed
        // .package(url: "https://github.com/example/SomeLibrary.git", from: "1.0.0")
    ],
    targets: [
        .target(
            name: "MyAwesomeSDK",
            dependencies: [
                // Add dependencies here
            ]
        ),
        .testTarget(
            name: "MyAwesomeSDKTests",
            dependencies: ["MyAwesomeSDK"]
        ),
    ]
)
