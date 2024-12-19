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
        setAuthenticatorTheme()
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
                        .font(Font.custom("MrDafoe-Regular", size: 80))
                    
                    HStack {
                        Spacer()
                        Text("PRO")
                            .font(.headline)
                            .fontWeight(.bold)
                            .offset(x: -64, y: 8)
                    }
                }
                .padding(.top, 104)
                .foregroundStyle(Gradients.primaryRadialGradient)
            }, footerContent: {
                Text("© 2024 All Rights Reserved")
                    .foregroundStyle(Color.primaryText)
                    .padding(.bottom, 32)
            }) { state in
                MainContainer(selection: .dashboard, state: state)
                    
            }
            .authenticatorTheme(theme)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.background)
        
    }
    
    
    
    private func setAuthenticatorTheme() {
        theme.colors.foreground.interactive = .accent
        theme.colors.background.interactive = .accent
        theme.colors.foreground.primary = .primaryText
        theme.components.authenticator.backgroundColor = .background
        theme.components.button.primary.cornerRadius = 10
        theme.components.field.backgroundColor = .background
        theme.components.authenticator.padding.leading = 24
        theme.components.authenticator.padding.trailing = 24
    }
}



#Preview {
    LoginScreen()
}
