//
//  LoginScreen.swift
//  ensemble
//
//  Created by Spencer Jones on 12/4/24.
//

import SwiftUI

import Amplify
import Authenticator

struct LoginScreen: View {
    @State private var username = ""
    @State private var password = ""
    
    private var theme = AuthenticatorTheme()
    
    init() {
        theme.colors.foreground.interactive = .accent
        theme.colors.background.interactive = .accent
        theme.colors.foreground.primary = .primaryText
        
        theme.components.authenticator.backgroundColor = .background
        
        theme.components.button.primary.cornerRadius = 10
        
        theme.components.field.backgroundColor = .background
        
        theme.components.authenticator.padding.leading = 24
        theme.components.authenticator.padding.trailing = 24
        
    }
    
    var body: some View {
        VStack {
            
            Authenticator(signInContent: { state in
                SignInView(
                    state: state,
                    headerContent: {
                        Spacer()
                    }
                )
            }, signUpContent: { state in
                SignUpView(
                    state: state,
                    headerContent: {
                        Text("Connect with your ensemble.")
                            .foregroundStyle(Color.primaryText)
                    }
                )
            }, resetPasswordContent: { state in
                ResetPasswordView(
                    state: state,
                    headerContent: {
                        Text("Reset your password.")
                            .foregroundStyle(Color.primaryText)
                    }
                )
            }, headerContent: {
                VStack(spacing: -32) {
                    Text("ensemble")
                        .font(Font.custom("MrDafoe-Regular", size: 88))
                    
                    HStack {
                        Spacer()
                        Text("PRO")
                            .font(.title)
                            .fontWeight(.bold)
                            .offset(x: -56)
                    }
                }
                .padding(.top, 104)
                .foregroundStyle(Color.accentColor)
            }, footerContent: {
                Text("© 2024 All Rights Reserved")
                    .foregroundStyle(Color.primaryText)
                    .padding(.bottom, 32)
            }) { state in
                MainContainer(selection: .season, state: state)
            }
            .authenticatorTheme(theme)
        }
        .background(Color.background)
        .ignoresSafeArea()
        
    }
}



#Preview {
    LoginScreen()
}


//             VStack(spacing: 16) {
//                HStack {
//                    Image(systemName: "person.fill")
//                        .foregroundColor(.gray)
//                    TextField("Username", text: $username)
//                        .textFieldStyle(.plain)
//                        .padding(.leading, 8)
//                        .accentColor(.gray)
//                }
//                .overlay(
//                    Rectangle()
//                        .offset(y: 16)
//                        .fill(.gray)
//                        .frame(height: 1)
//                        .frame(maxWidth: .infinity, alignment: .top)
//                )
//                .padding()
//
//                HStack {
//                    Image(systemName: "lock.fill")
//                        .foregroundColor(.gray)
//                    SecureField("Password", text: $password)
//                        .textFieldStyle(.plain)
//                        .padding(.leading, 8)
//                        .accentColor(.gray)
//                }
//                .overlay(
//                    Rectangle()
//                        .offset(y: 16)
//                        .fill(.gray)
//                        .frame(height: 1)
//                        .frame(maxWidth: .infinity, alignment: .top)
//                )
//                .padding()
//            }
//
//
//            VStack(spacing: 16) {
//                Button("Login") {
//                    // Handle login action
//                }
//                .padding()
//                .frame(maxWidth: .infinity)
//                .background(Color.accentColor)
//                .foregroundColor(.white)
//                .cornerRadius(10)
//
//                Button("Register") {
//                    // Handle registration
//                }
//                .padding()
//                .frame(maxWidth: .infinity)
//                .foregroundColor(Color.accentColor)
//                .overlay(
//                    RoundedRectangle(cornerRadius: 10)
//                        .stroke(.accent, lineWidth: 1)
//                )
//            }
//            .padding(.top, 32)
//
//
//            VStack {
//                Button("Forgot User ID/Password") {
//                    // Handle forgot password action
//                }
//                .padding()
//
//                Button("Learn More") {
//                    // Handle forgot password action
//                }
//                .padding()
//            }
//            .padding(.top, 32)
