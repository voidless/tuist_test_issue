import SwiftUI
import Feature
import Feature2
import FeatureUntested

@main
struct TuistTestIssueApp: App {
    var body: some Scene {
        WindowGroup {
            Group {
                Text("Main app")
                ContentView()
                Content2View()
                ContentViewUntested()
            }
            .padding(10)
            .background(Color.gray)
        }
    }
}
