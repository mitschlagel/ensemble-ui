//
//  ProfileNavigationStack.swift
//  ensemble
//
//  Created by Spencer Jones on 12/7/24.
//

import SwiftUI

import Authenticator

enum ProfileRoute: Hashable {
    case profile
    case detail(String)
    
    @ViewBuilder var destination: some View {
        switch self {
        case .profile:
            Text("Profile Route")
        case .detail(let detail):
            Text("Profile \(detail) Route")
        }
    }
}

struct ProfileNavigationStack: View {
    
    @Environment(Router.self) private var router
    
    @EnvironmentObject var state: SignedInState
    
    var body: some View {
        
        @Bindable var router = router
        
        NavigationStack(path: $router.profileRoutes) {
            VStack {
                Text("Profile View")
            }
            .navigationTitle("Profile")
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
