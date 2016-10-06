//
//  ATMLocatorMapUITests.swift
//  ATMLocator
//
//  Created by neelam_v on 06/10/16.
//  Copyright © 2016 neelam_v. All rights reserved.
//

import Foundation

class ATMLocatorMapUITests: ATMLocatorUITests {

override func setUp() {
    super.setUp()
}

func test_UI() {
    
    let refreshButton = app.navigationBars["ATM Locator"].buttons["Refresh"]
    waitForElementToAppear(refreshButton)

    refreshButton.tap()
    waitForElementToAppear(refreshButton)
    
    let element = app.otherElements.containingType(.NavigationBar, identifier:"ATM Locator").childrenMatchingType(.Other).element.childrenMatchingType(.Other).element.childrenMatchingType(.Other).element
    element.tap()
    
    
}
    
}