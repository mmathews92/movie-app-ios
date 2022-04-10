//
//  LoginView.swift
//  moviesapp
//
//  Created by Michael Mathews on 10/04/22.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var loginViewModel = LoginViewModel()
    
    var body: some View {
        
            VStack {
                TextField("username", text: $loginViewModel.loginDataModel.userName)
                
                SecureField("password", text: $loginViewModel.loginDataModel.userPassword)
                
                NavigationLink (
                    destination: MoviesListView(),
                    isActive: $loginViewModel.loginDataModel.navigate,
                    label: {
                        EmptyView()
                    }
                )
                
                Button(action: {
                    if(loginViewModel.validateUserInputs()){
                        loginViewModel.authenticateUser()
                    }
                }, label: {
                    Text("Login")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .background(Color(.systemPink))
                        .cornerRadius(15)
                }).alert(isPresented: $loginViewModel.loginDataModel.isPresentingErrorAlert, content: {
                    Alert(
                        title: Text("Login Error"), message: Text(loginViewModel.loginDataModel.errorMessage), dismissButton: .cancel(Text("Ok"))
                    )
                })
                .padding(.top, 20)
                
            }
            .padding()
            .textFieldStyle(RoundedBorderTextFieldStyle())
        
    }
}

