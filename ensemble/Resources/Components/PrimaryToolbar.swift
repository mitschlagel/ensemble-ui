//
//  PrimaryToolbar.swift
//  ensemble
//
//  Created by Spencer Jones on 12/8/24.
//

import SwiftUI

import Authenticator

struct PrimaryToolbar: ViewModifier {
    
    var state: SignedInState
    @State private var newNotifications = false
    @State private var isSheetPresented = false
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        isSheetPresented = true
                    } label: {
                        Label("Notifications", systemImage: newNotifications ? "bell.fill" : "bell")
                            .foregroundStyle(Color.accentColor)
                    }
                    .sheet(isPresented: $isSheetPresented) {
                        NotificationSheetView()
                            .presentationDetents([.medium, .large])
                            .presentationDragIndicator(.visible)
                    }
                }
                ToolbarItem(placement: .principal) {
                    HStack {
                        Text("ensemble")
                            .font(Font.custom("MrDafoe-Regular", size: 32))
                        Text("PRO")
                            .font(.caption)
                            .fontWeight(.bold)
                            .offset(y: 4)
                    }
                    .foregroundStyle(Color.accentColor)
                    
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Menu {
                        Button(action: {
                            // TODO: open settings
                        }) {
                            HStack {
                                Text("Settings")
                                Image(systemName: "gear")
                            }
                        }
                        Button(action: {
                            Task {
                                await state.signOut()
                            }
                        }) {
                            HStack {
                                Text("Sign Out")
                                Image(systemName: "rectangle.portrait.and.arrow.right")
                            }
                        }
                    } label: {
                        Label("Profile", systemImage: "person")
                            .foregroundStyle(Color.accentColor)
                    }
                }
            }
    }
}

extension View {
    func primaryToolbar(signedInState state: SignedInState) -> some View {
        modifier(PrimaryToolbar(state: state))
    }
}

struct NotificationSheetView: View {
    var body: some View {
        VStack {
            Text("Notifications")
                .font(.headline)
            // Add your notification content here
        }
        .padding()
    }
}


