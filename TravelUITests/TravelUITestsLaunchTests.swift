//
//  TravelUITestsLaunchTests.swift
//  TravelUITests
//
//  Created by Sebastian Ibarra on 10/13/24.
//
//  Sets up a basic framework for launch tests, including 
//  application launch verification and screenshot capturing. I plan to customize it
//  to perform additional checks during the launch phase of the application.

import XCTest

final class TravelUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    @MainActor
    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
