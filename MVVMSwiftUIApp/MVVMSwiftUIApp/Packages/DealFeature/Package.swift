// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DealFeature",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "DealFeature",
            targets: [
                "DealFeature",
            ]
        )
    ],
    dependencies: [
        .package(path: "../../Repository"),
        .package(path: "../../UIComponents"),
    ],
    targets: [
        .target(
            name: "DealFeature",
            dependencies: [
                "Repository",
                "UIComponents",
            ]
        ),
    ]
)
