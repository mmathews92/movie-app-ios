//
//  LoginValidationTests.swift
//  moviesappTests
//
//  Created by Michael Mathews on 10/04/22.
//

import XCTest
@testable import moviesapp

class LoginValidationTests: XCTestCase {
    
    @Published var loginViewModel: LoginViewModel!
    
    override func setUp() {
        super.setUp()
        loginViewModel = LoginViewModel()
    }
    
    func testLoginValidation() {
        loginViewModel.loginDataModel.userName = "Admin"
        loginViewModel.loginDataModel.userPassword = "Password*123"
        
        XCTAssert(loginViewModel.validateUserInputs(), "An unexpected result was encountered")
    }    
    
    func testLoginValidationEmpty() {
        loginViewModel.loginDataModel.userName = ""
        loginViewModel.loginDataModel.userPassword = ""
        
        XCTAssertFalse(loginViewModel.validateUserInputs(), "An unexpected result was encountered")
    }
    
    func testLoginValidationWrongData() {
        loginViewModel.loginDataModel.userName = "admin"
        loginViewModel.loginDataModel.userPassword = "123"
        
        loginViewModel.authenticateUser()
        
        XCTAssertFalse(loginViewModel.loginDataModel.navigate, "An unexpected result was encountered")
    }
    
}
