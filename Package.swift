// swift-tools-version:5.10

import PackageDescription

let package = Package(
  name: "SegementSlide",
  platforms: [
    .iOS(.v12)
  ],
  products: [
    .library(name: "SegementSlide", targets: ["SegementSlide"])
  ],
  targets: [
    .target(name: "SegementSlide")
  ]
)
