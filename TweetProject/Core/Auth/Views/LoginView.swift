//
//  LoginView.swift
//  TweetProject
//
//  Created by adam janusewski on 7/22/22.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        
        VStack {
            // ------------------------------  HEADER  -----------------------------------------
            AuthenticationHeaderView(title1: "Hello.", title2: "Welcome Back.")
            
            // ------------------------------ Email / PW TextFields ------------------------------
            VStack(spacing: 40) {
                CustomInputField(imageName: "envelope", placeholderText: "Email", text: $email)
                
                CustomInputField(imageName: "lock",
                                 placeholderText: "Password",
                                 isSecureField: true,
                                 text: $password)
            }
            .padding(.horizontal, 32)
            .padding(.top, 44)
            
            HStack {
                Spacer()
                
                NavigationLink {
                    Text("Forgot Password View")
                        
                } label: {
                    Text("Forgot Password?")
                        .font(.caption)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                        .foregroundColor(Color(.systemBlue))
                }
            }
            
            // ----------------------------- Sign In Button ---------------------------------
            
            Button {
                viewModel.login(withEmail: email, password: password)
            } label: {
                Text("Sign In")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 280, height: 50)
                    .background(Color(.systemBlue))
                    .clipShape(Capsule())
                    .shadow(color: .black, radius: 7, x: 7, y: 7)
                    .padding()
            }

            
            Spacer()
            
            // ------------------------------- Switch to Registration ---------------------------
            NavigationLink {
                RegistrationView()
                    .navigationBarHidden(true)
            } label: {
                HStack {
                    Text("Don't have an account?")
                        .font(.footnote)
                    
                    Text("Sign Up")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
            }
            .padding(.bottom, 32)
            .foregroundColor(Color(.systemBlue))
        }
        .ignoresSafeArea()
        .navigationBarHidden(true)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

