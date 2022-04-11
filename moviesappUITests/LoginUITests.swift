//
//  LoginUITests.swift
//  moviesappUITests
//
//  Created by Michael Mathews on 10/04/22.
//

import XCTest
@testable import moviesapp

class LoginUITests: XCTestCase {
    
    func testLogin() throws {
        let app = XCUIApplication()
        app.launch()
        
        app.textFields.element.tap()
        app.textFields.element.typeText("Admin")
         
        app.secureTextFields.element.tap()
        app.secureTextFields.element.typeText("Password*123")
        app.keyboards.buttons["Return"].tap()
        
        let loginButton = app.buttons["loginButton"]
        loginButton.tap()
         
        XCTAssertFalse(app.alerts.element.waitForExistence(timeout: 0.5))
    }
    
    func testFailedLoginAlert() throws {
        let app = XCUIApplication()
        app.launch()
        
        app.buttons["loginButton"].tap()
     
        XCTAssert(app.alerts.element.waitForExistence(timeout: 0.5))
     
        app.alerts.element.buttons["OK"].tap()
        XCTAssertFalse(app.alerts.element.exists)
    }
}
