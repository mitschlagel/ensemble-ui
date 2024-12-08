//
//  SeasonView.swift
//  ensemble
//
//  Created by Spencer Jones on 12/7/24.
//

import SwiftUI

import Authenticator

enum SettingsRoute: Hashable {
    case settings
    case detail(String)
    
    @ViewBuilder var destination: some View {
        switch self {
        case .settings:
            Text("Settings View")
        case .detail(let detail):
            Text("Settings \(detail) View")
        }
    }
}

struct SettingsNavigationStack: View {
    
    @Environment(Router.self) private var router
    
    @EnvironmentObject var state: SignedInState
    
    var body: some View {
        
        @Bindable var router = router
        
        NavigationStack(path: $router.settingsRoutes) {
            VStack {
                Text("Settings View")
            }
            .navigationTitle("Settings")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Menu {
                        Button("Sign out") {
                            Task {
                                await state.signOut()
                            }
                        }
                    } label: {
                        Label("Menu", systemImage: "line.3.horizontal")
                    }
                }
            }
        }
    }
}
