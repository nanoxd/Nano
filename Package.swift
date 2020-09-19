// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "Nano",
    platforms: [
        .macOS(.v10_13),
        .iOS(.v12),
        .tvOS(.v12),
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
