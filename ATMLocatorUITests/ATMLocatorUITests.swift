//
//  ATMLocatorUITests.swift
//  ATMLocatorUITests
//
//  Created by neelam_v on 03/10/16.
//  Copyright © 2016 neelam_v. All rights reserved.
//

import XCTest

class ATMLocatorUITests: XCTestCase {
    
    let app = XCUIApplication()
    let _SRL:Double = 40.0

    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func waitForElementToAppear(element: XCUIElement,
                                file: String = #file, line: UInt = #line) {
        let existsPredicate = NSPredicate(format: "exists == true")
        expectationForPredicate(existsPredicate,
                                evaluatedWithObject: element, handler: nil)
        
        
        waitForExpectationsWithTimeout(_SRL) { (error) -> Void in
            if (error != nil) {
                let message = "Failed to find \(element) after 10 seconds."
                self.recordFailureWithDescription(message,
                                                  inFile: file, atLine: line, expected: true)
            }
        }
    }
    
    func waitForElementToDisappear(element: XCUIElement,
                                   file: String = #file, line: UInt = #line) {
        let existsPredicate = NSPredicate(format: "exists == false")
        expectationForPredicate(existsPredicate,
                                evaluatedWithObject: element, handler: nil)
        
        waitForExpectationsWithTimeout(_SRL) { (error) -> Void in
            if (error != nil) {
                let message = "Failed to find \(element) after 10 seconds."
                self.recordFailureWithDescription(message,
                                                  inFile: file, atLine: line, expected: true)
            }
        }
    }

    
}
