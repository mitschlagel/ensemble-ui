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
                    Menu {
                        Button(action: {
                            // TODO: open profile
                        }, label: {
                            HStack {
                                Text("Spencer Jones")
                                Image(systemName: "person")
                            }
                        })
                        Button(action: {
                            // TODO: open profile
                        }, label: {
                            HStack {
                                Text("Omaha Symphony")
                                Image(systemName: "music.note.house")
                            }
                        })
                        Button(action: {
                            // TODO: open settings
                        }) {
                            HStack {
                                Text("Settings")
                                Image(systemName: "gearshape")
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
                        Label("Profile", systemImage: "person.crop.circle")
                            .foregroundStyle(Color.accent)
                            .font(.headline)
                    }
                }
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        isSheetPresented = true
                    } label: {
                        Label("Notifications", systemImage: newNotifications ? "bell.badge" : "bell")
                            .foregroundStyle(Color.accent)
                    }
                    .sheet(isPresented: $isSheetPresented) {
                        NotificationSheetView()
                            .presentationDetents([.medium, .large])
                            .presentationDragIndicator(.visible)
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    HStack {
                        Text("ensemble")
                            .font(Font.custom("MrDafoe-Regular", size: 40))
                        /// Only shown if ensemble is pro version
                        if true {
                            Text("PRO")
                                .font(.callout)
                                .fontWeight(.bold)
                                .offset(y: 4)
                        }
                    }
                    .foregroundStyle(Color.accent)
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


