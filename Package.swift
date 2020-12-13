// swift-tools-version:5.3

import PackageDescription

let package = Package(
	name: "LSFoundation",
	products: [
		.library(
			name: "LSFoundation",
			targets: ["LSFoundation"])
	],
	targets: [
		.target(
			name: "LSFoundation",
			dependencies: []),
		.testTarget(
			name: "LSFoundationTests",
			dependencies: ["LSFoundation"])
	]
)
