// swift-tools-version:5.8
import PackageDescription

let package = Package(
    name: "Nano",
    platforms: [
        .macOS(.v13),
        .iOS(.v16),
        .tvOS(.v16),
    ],
    products: [
        .library(
            name: "Nano",
            targets: ["Nano"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Nano",
            dependencies: []
        ),
        .testTarget(
            name: "NanoTests",
            dependencies: ["Nano"]
        ),
    ]
)
