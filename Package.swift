// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "SKUBezierPath",
    platforms: [
        .iOS(.v8),
        .macOS(.v10_14)
    ],
    products: [
        .library(name: "SKUBezierPath", targets: ["SKUBezierPath"])
    ],
    dependencies: [],
    targets: [
        .target(name: "SKUBezierPath", dependencies: [])
    ]
)
