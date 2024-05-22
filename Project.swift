import ProjectDescription

let project = Project(
    name: "TuistTestIssue",
    targets: [
        .target(
            name: "TuistTestIssueApp",
            destinations: .iOS,
            product: .app,
            bundleId: "io.tuist.TuistTestIssueApp",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchStoryboardName": "LaunchScreen.storyboard",
                ]
            ),
            sources: ["TuistTestIssueApp/Sources/**"],
            resources: ["TuistTestIssueApp/Resources/**"],
            dependencies: [
                .target(name: "Feature"),
                .target(name: "Feature2"),
                .target(name: "FeatureUntested"),
            ]
        ),
        // UI Tests
        .target(
            name: "TuistTestIssueAppUITests",
            destinations: .iOS,
            product: .uiTests,
            bundleId: "io.tuist.TuistTestIssueAppUITests",
            sources: ["TuistTestIssueAppUITests/**"],
            resources: [],
            dependencies: [
                .target(name: "TuistTestIssueApp"),
                .target(name: "FeatureUITestHelpers"),
            ]
        ),
        // Feature
        .target(
            name: "Feature",
            destinations: .iOS,
            product: .staticFramework,
            bundleId: "io.tuist.Feature",
            sources: ["Feature/Sources/**"],
            dependencies: []
        ),
        .target(
            name: "FeatureTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.tuist.FeatureTests",
            sources: ["Feature/Tests/**"],
            resources: [],
            dependencies: [.target(name: "Feature")]
        ),
        .target(
            name: "FeatureDemoApp",
            destinations: .iOS,
            product: .app,
            bundleId: "io.tuist.FeatureDemoApp",
            sources: ["Feature/DemoApp/**"],
            dependencies: [.target(name: "Feature")]
        ),
        // Feature2
        .target(
            name: "Feature2",
            destinations: .iOS,
            product: .staticFramework,
            bundleId: "io.tuist.Feature2",
            sources: ["Feature2/Sources/**"],
            dependencies: []
        ),
        .target(
            name: "Feature2Tests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.tuist.Feature2Tests",
            sources: ["Feature2/Tests/**"],
            resources: [],
            dependencies: [.target(name: "Feature2")]
        ),
        .target(
            name: "Feature2DemoApp",
            destinations: .iOS,
            product: .app,
            bundleId: "io.tuist.Feature2DemoApp",
            sources: ["Feature2/DemoApp/**"],
            dependencies: [.target(name: "Feature2")]
        ),
        // FeatureUntested
        .target(
            name: "FeatureUntested",
            destinations: .iOS,
            product: .staticFramework,
            bundleId: "io.tuist.FeatureUntested",
            sources: ["FeatureUntested/Sources/**"],
            dependencies: []
        ),
        // FeatureUITestHelpers
        .target(
            name: "FeatureUITestHelpers",
            destinations: .iOS,
            product: .staticFramework,
            bundleId: "io.tuist.FeatureUITestHelpers",
            sources: ["FeatureUITestHelpers/Sources/**"],
            dependencies: []
        ),
        // Aggregate targets
        .target(
            name: "Swiftlint",
            destinations: .macOS,
            product: .framework,
            bundleId: "",
            sources: [],
            scripts: [
                .pre(
                    script: """
                    // swiftlint --progress
                    echo "Project.swift:1:1: error: swiftlint failed"
                    exit 1
                    """,
                    name: "Script",
                    basedOnDependencyAnalysis: false
                )
            ]
        ),
        .target(
            name: "Periphery",
            destinations: .macOS,
            product: .framework,
            bundleId: "",
            sources: [],
            scripts: [
                .pre(
                    script: """
                    // periphery scan
                    echo "Project.swift:1:1: error: periphery failed"
                    exit 1
                    """,
                    name: "Script",
                    basedOnDependencyAnalysis: false
                )
            ]
        ),
    ]
)
