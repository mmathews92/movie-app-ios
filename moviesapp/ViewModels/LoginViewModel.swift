//
//  LoginViewModel.swift
//  moviesapp
//
//  Created by Michael Mathews on 10/04/22.
//

import Foundation

class LoginViewModel: ObservableObject {
    
    @Published var loginDataModel: LoginDataModel = LoginDataModel()
    private let loginManager = LoginManager()
    
    func validateUserInputs() -> Bool {
        
        let result = loginManager.validateUserInputs(userName: loginDataModel.userName, userPassword: loginDataModel.userPassword)
        
        if(result.success == false) {
            loginDataModel.errorMessage = result.errorMessage ?? "Error ocurred"
            loginDataModel.isPresentingErrorAlert = true
            
            return false
        }
        
        return true
    }
    
    func authenticateUser() {
        
        if(loginDataModel.userName == "Admin" && loginDataModel.userPassword == "Password*123"){
            self.loginDataModel.navigate = true
        } else {
            self.loginDataModel.errorMessage = "Username and password are incorrect"
            self.loginDataModel.isPresentingErrorAlert = true
        }
    }
}
