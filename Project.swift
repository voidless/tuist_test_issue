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
                    // swiftlint --progressx
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
    ],
    schemes: [
        .scheme(
            name: "TuistTestIssueApp",
            buildAction: .buildAction(targets: [.target("TuistTestIssueApp")]),
            testAction: .targets([
                .testableTarget(target: .target("FeatureTests")),
                .testableTarget(target: .target("Feature2Tests")),
            ]),
            runAction: .runAction(executable: .target("TuistTestIssueApp"))
        ),
        .scheme(
            name: "Feature",
            buildAction: .buildAction(targets: [.target("Feature")]),
            testAction: .targets([
                .testableTarget(target: .target("FeatureTests")),
            ])
        ),
        .scheme(
            name: "Feature2",
            buildAction: .buildAction(targets: [.target("Feature2")]),
            testAction: .targets([
                .testableTarget(target: .target("Feature2Tests")),
            ])
        ),
        .scheme(
            name: "FeatureTests",
            buildAction: .buildAction(targets: [.target("FeatureTests")]),
            testAction: .targets([
                .testableTarget(target: .target("FeatureTests")),
            ])
        ),
        .scheme(
            name: "Feature2Tests",
            buildAction: .buildAction(targets: [.target("Feature2Tests")]),
            testAction: .targets([
                .testableTarget(target: .target("Feature2Tests")),
            ])
        ),
        .scheme(
            name: "FeatureDemoApp",
            buildAction: .buildAction(targets: [.target("FeatureDemoApp")]),
            testAction: .targets([
                .testableTarget(target: .target("FeatureTests")),
            ]),
            runAction: .runAction(executable: .target("FeatureDemoApp"))
        ),
        .scheme(
            name: "Feature2DemoApp",
            buildAction: .buildAction(targets: [.target("Feature2DemoApp")]),
            testAction: .targets([
                .testableTarget(target: .target("Feature2Tests")),
            ]),
            runAction: .runAction(executable: .target("Feature2DemoApp"))
        ),
    ]
)
