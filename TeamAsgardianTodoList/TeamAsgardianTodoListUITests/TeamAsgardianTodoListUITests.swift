//
//  TeamAsgardianTodoListUITests.swift
//  TeamAsgardianTodoListUITests
//
//  Created by David U. Okonkwo on 10/8/20.
//

import XCTest

class TeamAsgardianTodoListUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
    }

    func testExample() throws {
        let app = XCUIApplication()
        app.launch()
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
