@preconcurrency import ProjectDescription

// 1. The Main App Target
let defaultApp = Target.target(
    name: "SwiftUITricks",
    destinations: [.iPhone],
    product: .app,
    bundleId: "com.magnificat.SwiftUITricks",
    deploymentTargets: .iOS("16.0"),
    infoPlist: .extendingDefault(
        with: [
            "UILaunchScreen": [
                "UIColorName": "LaunchScreenBackground",
                "UIImageName": "LaunchScreenLogo",
            ],
        ]
    ),
    sources: [
        .glob("Application/**/*.swift", excluding: ["Application/Tests/**"])
    ],
    resources: ["Application/Resources/**"],
    dependencies: [],
    settings: .settings(
        base: [
            "CODE_SIGN_STYLE": "Automatic",
            "DEVELOPMENT_TEAM": "64GU57DP44",
        ]
    )
)

let project = Project(
    name: "SwiftUITricks",
    targets: [defaultApp], // Added targets here
    resourceSynthesizers: [
        .assets(),
        .strings()
    ]
)