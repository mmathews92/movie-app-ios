//
//  LoginManager.swift
//  moviesapp
//
//  Created by Michael Mathews on 10/04/22.
//

import Foundation

struct ValidationResult {
    var success: Bool = false
    var errorMessage: String?
}

struct LoginManager {
    func validateUserInputs(userName: String, userPassword: String) -> ValidationResult {
        
        if(userName.isEmpty || userPassword.isEmpty) {
            return ValidationResult(success: false, errorMessage: "Username or password cannot be empty")
        }
        
        return ValidationResult(success: true, errorMessage: nil)
    }
}
