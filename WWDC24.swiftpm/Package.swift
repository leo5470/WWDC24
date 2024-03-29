// swift-tools-version: 5.8

// WARNING:
// This file is automatically generated.
// Do not edit it by hand because the contents will be replaced.

import PackageDescription
import AppleProductTypes

let package = Package(
    name: "WWDC24",
    platforms: [
        .iOS("16.0")
    ],
    products: [
        .iOSApplication(
            name: "WWDC24",
            targets: ["AppModule"],
            bundleIdentifier: "com.lcheng.WWDC24",
            teamIdentifier: "QYC9Z88RVC",
            displayVersion: "1.0",
            bundleVersion: "1",
            appIcon: .placeholder(icon: .camera),
            accentColor: .presetColor(.purple),
            supportedDeviceFamilies: [
                .pad
            ],
            supportedInterfaceOrientations: [
                .landscapeRight,
                .landscapeLeft
            ],
            capabilities: [
                .fileAccess(.pictureFolder, mode: .readOnly),
                .photoLibrary(purposeString: "So you can use your photos directly!"),
                .camera(purposeString: "So you can take photos directly!")
            ]
        )
    ],
    targets: [
        .executableTarget(
            name: "AppModule",
            path: ".",
            resources: [
                .copy("Resources/yolov8s.mlmodelc")
            ]
        )
    ]
)