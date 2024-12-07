//
//  LoginScreen.swift
//  ensemble
//
//  Created by Spencer Jones on 12/4/24.
//

import SwiftUI

struct LoginScreen: View {
    @State private var username = ""
    @State private var password = ""
    
    var body: some View {
        VStack {
            Spacer()
            VStack(spacing: -32) {
                Text("ensemble")
                    .font(Font.custom("MrDafoe-Regular", size: 88))
                
                HStack {
                    Spacer()
                    Text("PRO")
                        .font(.title)
                        .fontWeight(.bold)
                        .offset(x: -32)
                }
                    
            }
            .foregroundStyle(Color.accentColor)
            
            VStack(spacing: 16) {
                HStack {
                    Image(systemName: "person.fill")
                        .foregroundColor(.gray)
                    TextField("Username", text: $username)
                        .textFieldStyle(.plain)
                        .padding(.leading, 8)
                        .accentColor(.gray)
                }
                .overlay(
                    Rectangle()
                        .offset(y: 16)
                        .fill(.gray)
                        .frame(height: 1)
                        .frame(maxWidth: .infinity, alignment: .top)
                )
                .padding()

                HStack {
                    Image(systemName: "lock.fill")
                        .foregroundColor(.gray)
                    SecureField("Password", text: $password)
                        .textFieldStyle(.plain)
                        .padding(.leading, 8)
                        .accentColor(.gray)
                }
                .overlay(
                    Rectangle()
                        .offset(y: 16)
                        .fill(.gray)
                        .frame(height: 1)
                        .frame(maxWidth: .infinity, alignment: .top)
                )
                .padding()
            }
            
            
            VStack(spacing: 16) {
                Button("Login") {
                    // Handle login action
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.accentColor)
                .foregroundColor(.white)
                .cornerRadius(10)
                
                Button("Register") {
                    // Handle registration
                }
                .padding()
                .frame(maxWidth: .infinity)
                .foregroundColor(Color.accentColor)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.accent, lineWidth: 1)
                )
            }
            .padding(.top, 32)
            
            
            VStack {
                Button("Forgot User ID/Password") {
                    // Handle forgot password action
                }
                .padding()
                
                Button("Learn More") {
                    // Handle forgot password action
                }
                .padding()
            }
            .padding(.top, 32)
            Spacer()
            
        }
        .padding(24)
        .background(Color("Background"))
        
    }
}

#Preview {
    LoginScreen()
}