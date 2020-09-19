// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "Nano",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13),
        .tvOS(.v13),
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
