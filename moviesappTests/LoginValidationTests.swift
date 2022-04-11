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
    
}
