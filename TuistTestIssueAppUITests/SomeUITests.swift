import Foundation
import XCTest
import FeatureUITestHelpers

final class SomeUITests: XCTestCase {
    func test_load() {
        let app = XCUIApplication()
        app.launch()

        someUITestHelper()
    }
}
