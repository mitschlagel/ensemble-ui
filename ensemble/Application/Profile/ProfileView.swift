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
            Text("Profile View")
        case .detail(let detail):
            Text("Profile \(detail) View")
        }
    }
}

struct ProfileNavigationStack: View {
    
    @Environment(Router.self) private var router
    
    var state: SignedInState
    
    var body: some View {
        
        @Bindable var router = router
        
        NavigationStack(path: $router.profileRoutes) {
            VStack {
                Text("Profile View")
                Button("Sign out") {
                    Task {
                        await state.signOut()
                    }
                }
            }
        }
    }
}
