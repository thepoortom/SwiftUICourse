// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Repository",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "Repository",
            targets: [
                "Repository",
            ]
        )
    ],
    targets: [
        .target(
            name: "Repository",
            dependencies: [
            ]
        ),
    ]
)
