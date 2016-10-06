//
//  ATMLocatorTests.swift
//  ATMLocatorTests
//
//  Created by neelam_v on 03/10/16.
//  Copyright © 2016 neelam_v. All rights reserved.
//

import XCTest
import GoogleMaps

@testable import ATMLocator

class ATMLocatorTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
     
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_1_Storyboard() {
        let storyboard = UIStoryboard(name: "Main",
                                      bundle: NSBundle.mainBundle())
        let navigationController = storyboard.instantiateInitialViewController() as! UINavigationController
        navigationController.viewDidLoad()
        let vc = navigationController.topViewController as! ViewController
        vc.locationManager.delegate = vc
        XCTAssertNotNil(navigationController.view,"Cannot find navigation controller instance")
        XCTAssertNotNil(vc.view,"Cannot find root view instance")
    }
    
    func test_2_Example() {
        
        let storyboard = UIStoryboard(name: "Main",
                                      bundle: NSBundle.mainBundle())
        let navigationController = storyboard.instantiateInitialViewController() as! UINavigationController
        navigationController.viewDidLoad()
        let vc = navigationController.topViewController as! ViewController
        vc.locationManager.delegate = vc
        let coordinates = CLLocationCoordinate2DMake(43.0, 34.0)
        vc.getNearByATMLocations(coordinates)
        
        XCTAssertNotNil(vc.getNearByATMLocations(coordinates),"No Response")

    }
    

    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
