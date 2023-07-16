// swift-tools-version:5.8
import PackageDescription

let package = Package(
    name: "Nano",
    platforms: [
        .macOS(.v11),
        .iOS(.v14),
        .tvOS(.v14),
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
