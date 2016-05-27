//
//  SWUITests.swift
//  swift_tutorial
//
//  Created by JonghyunKim on 5/27/16.
//  Copyright © 2016 kokaru.com. All rights reserved.
//

import XCTest

class SWUITests: XCTestCase {
    
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

    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testSWProgressUITests () {
        
        let app = XCUIApplication()
        app.navigationBars["Root View Controller"].staticTexts["Root View Controller"].tap()
        
        let tablesQuery = app.tables
        tablesQuery.buttons["Button"].tap()
        
        let button = app.buttons["Button"]
        button.tap()
        button.tap()
        app.navigationBars["swift_tutorial.SWButtonView"].buttons["Root View Controller"].tap()
        tablesQuery.buttons["Network"].tap()
        app.navigationBars["swift_tutorial.SWNetworkView"].buttons["Root View Controller"].tap()
        tablesQuery.buttons["Alert"].tap()
        app.buttons["OK Alert"].tap()
        
        let okButton = app.alerts["title"].collectionViews.buttons["OK"]
        okButton.tap()
        
    }

}
