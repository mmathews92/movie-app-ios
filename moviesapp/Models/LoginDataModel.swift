//
//  LoginDataModel.swift
//  moviesapp
//
//  Created by Michael Mathews on 10/04/22.
//

import Foundation

struct LoginDataModel {
    var userName: String = String()
    var userPassword: String = String()
    var errorMessage: String = String()
    var navigate: Bool = false
    var isPresentingErrorAlert: Bool = false
}
