// swift-tools-version:5.5

import PackageDescription

let mainTarget = "URLRequestChain"
let testTarget = "URLRequestChainTests"

let package = Package(
    name: "URLRequestChain",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "URLRequestChain",
            targets: [
                mainTarget
            ]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: mainTarget,
            dependencies: []),
        .testTarget(
            name: testTarget,
            dependencies: [
                .target(name: mainTarget, condition: nil)
            ]),
    ]
)
