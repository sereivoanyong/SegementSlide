// swift-tools-version: 5.10

import PackageDescription

let package = Package(
  name: "SegementSlide",
  platforms: [
    .iOS(.v13),
  ],
  products: [
    .library(name: "SegementSlide", targets: ["SegementSlide"]),
  ],
  dependencies: [
    .package(url: "https://github.com/sereivoanyong/JXSegmentedView", branch: "sy/main"),
    .package(url: "https://github.com/onevcat/Kingfisher", from: "8.2.0"),
  ],
  targets: [
    .target(name: "SegementSlide", dependencies: ["JXSegmentedView", "Kingfisher"]),
  ]
)
