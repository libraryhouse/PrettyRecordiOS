// swift-tools-version:5.7
import PackageDescription

// Closed-source distribution of PrettyRecord.
// This package ships ONLY the precompiled XCFramework — no source. Consumers get the
// public API to call, but not the implementation.
//
// Usage in a consumer app:
//   .package(url: "https://github.com/libraryhouse/PrettyRecordiOS.git", from: "1.0.3")
//   import PrettyRecordKit   // module name stays PrettyRecordKit; repo name is PrettyRecordiOS
let package = Package(
    name: "PrettyRecordKit",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(name: "PrettyRecordKit", targets: ["PrettyRecordKit"])
    ],
    targets: [
        // Local, committed binary. To slim the git repo later, switch to a remote
        // `.binaryTarget(name:url:checksum:)` hosted on a GitHub Release.
        .binaryTarget(
            name: "PrettyRecordKit",
            path: "PrettyRecordKit.xcframework"
        )
    ]
)
